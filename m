Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC08559EC
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 23:29:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YK6l38ShzDqLr
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 07:29:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJGx0sQRzDqSP
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 06:51:20 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 13:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,417,1557212400"; d="scan'208";a="164115992"
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga003.jf.intel.com with ESMTP; 25 Jun 2019 13:51:16 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Cedric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tao Ren <taoren@fb.com>
Subject: [RFC v2 dev-5.1 5/5] i2c: aspeed: add DMA mode transfer support
Date: Tue, 25 Jun 2019 13:51:09 -0700
Message-Id: <20190625205109.27672-6-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190625205109.27672-1-jae.hyun.yoo@linux.intel.com>
References: <20190625205109.27672-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds DMA mode transfer support for better performance.

Only AST2500 supports DMA mode under some limitations:
I2C is sharing the DMA H/W with UHCI host controller and MCTP
controller. Since those controllers operate with DMA mode only, I2C
has to use buffer mode or byte mode instead if one of those
controllers is enabled. Also make sure that if SD/eMMC or Port80
snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
use DMA mode.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
v1 -> v2:
 None.

 drivers/i2c/busses/i2c-aspeed.c | 227 +++++++++++++++++++++++++++++---
 1 file changed, 212 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 13543600e16b..6fc9a2c55aef 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -13,6 +13,8 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -50,6 +52,8 @@
 #define ASPEED_I2C_DEV_ADDR_REG				0x18
 #define ASPEED_I2C_BUF_CTRL_REG				0x1c
 #define ASPEED_I2C_BYTE_BUF_REG				0x20
+#define ASPEED_I2C_DMA_ADDR_REG				0x24
+#define ASPEED_I2C_DMA_LEN_REG				0x28
 
 /* Device Register Definition */
 /* 0x00 : I2CD Function Control Register  */
@@ -113,6 +117,8 @@
 #define ASPEED_I2CD_BUS_RECOVER_CMD			BIT(11)
 
 /* Command Bit */
+#define ASPEED_I2CD_RX_DMA_ENABLE			BIT(9)
+#define ASPEED_I2CD_TX_DMA_ENABLE			BIT(8)
 #define ASPEED_I2CD_RX_BUFF_ENABLE			BIT(7)
 #define ASPEED_I2CD_TX_BUFF_ENABLE			BIT(6)
 #define ASPEED_I2CD_M_STOP_CMD				BIT(5)
@@ -132,6 +138,13 @@
 #define ASPEED_I2CD_BUF_TX_COUNT_MASK			GENMASK(15, 8)
 #define ASPEED_I2CD_BUF_OFFSET_MASK			GENMASK(5, 0)
 
+/* 0x24 : I2CD DMA Mode Buffer Address Register */
+#define ASPEED_I2CD_DMA_ADDR_MASK			GENMASK(31, 2)
+#define ASPEED_I2CD_DMA_ALIGN				4
+
+/* 0x28 : I2CD DMA Transfer Length Register */
+#define ASPEED_I2CD_DMA_LEN_MASK			GENMASK(11, 0)
+
 enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_INACTIVE,
 	ASPEED_I2C_MASTER_PENDING,
@@ -182,6 +195,12 @@ struct aspeed_i2c_bus {
 	size_t				buf_size;
 	u8				buf_offset;
 	u8				buf_page;
+	/* DMA mode */
+	struct dma_pool			*dma_pool;
+	dma_addr_t			dma_handle;
+	u8				*dma_buf;
+	size_t				dma_buf_size;
+	size_t				dma_len;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	struct i2c_client		*slave;
 	enum aspeed_i2c_slave_state	slave_state;
@@ -286,8 +305,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was sent something. */
 	if (irq_status & ASPEED_I2CD_INTR_RX_DONE) {
-		if (bus->buf_base &&
+		if (bus->dma_buf &&
 		    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED)
+			value = bus->dma_buf[0];
+		else if (bus->buf_base &&
+			 bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED)
 			value = readb(bus->buf_base);
 		else
 			value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
@@ -305,8 +327,20 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was asked to stop. */
 	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
-		if (bus->buf_base &&
+		if (bus->dma_buf &&
 		    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED) {
+			len = bus->dma_buf_size -
+			      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+					readl(bus->base +
+					      ASPEED_I2C_DMA_LEN_REG));
+			for (i = 0; i < len; i++) {
+				value = bus->dma_buf[i];
+				i2c_slave_event(slave,
+						I2C_SLAVE_WRITE_RECEIVED,
+						&value);
+			}
+		} else if (bus->buf_base &&
+			  bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED) {
 			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 					readl(bus->base +
 					      ASPEED_I2C_BUF_CTRL_REG));
@@ -349,7 +383,15 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
 		bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
-		if (bus->buf_base) {
+		if (bus->dma_buf) {
+			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK,
+					  bus->dma_buf_size),
+			       bus->base + ASPEED_I2C_DMA_LEN_REG);
+			writel(ASPEED_I2CD_RX_DMA_ENABLE,
+			       bus->base + ASPEED_I2C_CMD_REG);
+		} else if (bus->buf_base) {
 			writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
 					  bus->buf_size - 1) |
 			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
@@ -361,7 +403,25 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		break;
 	case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
-		if (bus->buf_base) {
+		if (bus->dma_buf) {
+			len = bus->dma_buf_size -
+			      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+					readl(bus->base +
+					      ASPEED_I2C_DMA_LEN_REG));
+			for (i = 1; i < len; i++) {
+				value = bus->dma_buf[i];
+				i2c_slave_event(slave,
+						I2C_SLAVE_WRITE_RECEIVED,
+						&value);
+			}
+			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK,
+					  bus->dma_buf_size),
+			       bus->base + ASPEED_I2C_DMA_LEN_REG);
+			writel(ASPEED_I2CD_RX_DMA_ENABLE,
+			       bus->base + ASPEED_I2C_CMD_REG);
+		} else if (bus->buf_base) {
 			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 					readl(bus->base +
 					      ASPEED_I2C_BUF_CTRL_REG));
@@ -425,7 +485,23 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 	if (msg->flags & I2C_M_RD) {
 		command |= ASPEED_I2CD_M_RX_CMD;
 
-		if (bus->buf_base && !(msg->flags & I2C_M_RECV_LEN)) {
+		if (bus->dma_buf && !(msg->flags & I2C_M_RECV_LEN)) {
+			command |= ASPEED_I2CD_RX_DMA_ENABLE;
+
+			if (msg->len > bus->dma_buf_size) {
+				len = bus->dma_buf_size;
+			} else {
+				len = msg->len;
+				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+			}
+
+			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK,
+					  len),
+			       bus->base + ASPEED_I2C_DMA_LEN_REG);
+			bus->dma_len = len;
+		} else if (bus->buf_base && !(msg->flags & I2C_M_RECV_LEN)) {
 			command |= ASPEED_I2CD_RX_BUFF_ENABLE;
 
 			if (msg->len > bus->buf_size) {
@@ -446,7 +522,26 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
 		}
 	} else {
-		if (bus->buf_base) {
+		if (bus->dma_buf) {
+			command |= ASPEED_I2CD_TX_DMA_ENABLE;
+
+			if (msg->len + 1 > bus->dma_buf_size)
+				len = bus->dma_buf_size;
+			else
+				len = msg->len + 1;
+
+			bus->dma_buf[0] = slave_addr;
+			memcpy(bus->dma_buf + 1, msg->buf, len);
+
+			bus->buf_index = len - 1;
+
+			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK,
+					  len),
+			       bus->base + ASPEED_I2C_DMA_LEN_REG);
+			bus->dma_len = len;
+		} else if (bus->buf_base) {
 			int i;
 
 			command |= ASPEED_I2CD_TX_BUFF_ENABLE;
@@ -482,7 +577,8 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 		}
 	}
 
-	if (!(command & ASPEED_I2CD_TX_BUFF_ENABLE))
+	if (!(command & (ASPEED_I2CD_TX_BUFF_ENABLE |
+			 ASPEED_I2CD_TX_DMA_ENABLE)))
 		writel(slave_addr, bus->base + ASPEED_I2C_BYTE_BUF_REG);
 	writel(command, bus->base + ASPEED_I2C_CMD_REG);
 }
@@ -638,7 +734,28 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		if (bus->buf_index < msg->len) {
 			command = ASPEED_I2CD_M_TX_CMD;
 
-			if (bus->buf_base) {
+			if (bus->dma_buf) {
+				command |= ASPEED_I2CD_TX_DMA_ENABLE;
+
+				if (msg->len - bus->buf_index >
+				    bus->dma_buf_size)
+					len = bus->dma_buf_size;
+				else
+					len = msg->len - bus->buf_index;
+
+				memcpy(bus->dma_buf, msg->buf + bus->buf_index,
+				       len);
+
+				bus->buf_index += len;
+
+				writel(bus->dma_handle &
+				       ASPEED_I2CD_DMA_ADDR_MASK,
+				       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+				writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK,
+						  len),
+				       bus->base + ASPEED_I2C_DMA_LEN_REG);
+				bus->dma_len = len;
+			} else if (bus->buf_base) {
 				u8 wbuf[4];
 				int i;
 
@@ -689,7 +806,15 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		}
 		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
 
-		if (bus->buf_base && !(msg->flags & I2C_M_RECV_LEN)) {
+		if (bus->dma_buf && !(msg->flags & I2C_M_RECV_LEN)) {
+			len = bus->dma_len -
+			      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+					readl(bus->base +
+					      ASPEED_I2C_DMA_LEN_REG));
+
+			memcpy(msg->buf + bus->buf_index, bus->dma_buf, len);
+			bus->buf_index += len;
+		} else if (bus->buf_base && !(msg->flags & I2C_M_RECV_LEN)) {
 			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 					readl(bus->base +
 					      ASPEED_I2C_BUF_CTRL_REG));
@@ -717,7 +842,25 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		if (bus->buf_index < msg->len) {
 			command = ASPEED_I2CD_M_RX_CMD;
 			bus->master_state = ASPEED_I2C_MASTER_RX;
-			if (bus->buf_base) {
+			if (bus->dma_buf) {
+				command |= ASPEED_I2CD_RX_DMA_ENABLE;
+
+				if (msg->len - bus->buf_index >
+				    bus->dma_buf_size) {
+					len = bus->dma_buf_size;
+				} else {
+					len = msg->len - bus->buf_index;
+					command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+				}
+
+				writel(bus->dma_handle &
+				       ASPEED_I2CD_DMA_ADDR_MASK,
+				       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+				writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK,
+						  len),
+				       bus->base + ASPEED_I2C_DMA_LEN_REG);
+				bus->dma_len = len;
+			} else if (bus->buf_base) {
 				command |= ASPEED_I2CD_RX_BUFF_ENABLE;
 
 				if (msg->len - bus->buf_index >
@@ -1199,7 +1342,48 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 			sram_enabled = false;
 	}
 
-	if (sram_enabled) {
+	/*
+	 * Only AST2500 supports DMA mode under some limitations:
+	 * I2C is sharing the DMA H/W with UHCI host controller and MCTP
+	 * controller. Since those controllers operate with DMA mode only, I2C
+	 * has to use buffer mode or byte mode instead if one of those
+	 * controllers is enabled. Also make sure that if SD/eMMC or Port80
+	 * snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
+	 * use DMA mode.
+	 */
+	if (sram_enabled && !IS_ENABLED(CONFIG_USB_UHCI_ASPEED) &&
+	    of_device_is_compatible(pdev->dev.of_node,
+				    "aspeed,ast2500-i2c-bus")) {
+		ret = device_property_read_u32(&pdev->dev,
+					       "aspeed,dma-buf-size",
+					       &bus->dma_buf_size);
+		if (!ret && bus->dma_buf_size > ASPEED_I2CD_DMA_LEN_MASK)
+			bus->dma_buf_size = ASPEED_I2CD_DMA_LEN_MASK;
+	}
+
+	if (bus->dma_buf_size) {
+		if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(32))) {
+			dev_warn(&pdev->dev, "No suitable DMA available\n");
+		} else {
+			bus->dma_pool = dma_pool_create("i2c-aspeed",
+							&pdev->dev,
+							bus->dma_buf_size,
+							ASPEED_I2CD_DMA_ALIGN,
+							0);
+			if (bus->dma_pool)
+				bus->dma_buf = dma_pool_alloc(bus->dma_pool,
+							      GFP_KERNEL,
+							      &bus->dma_handle);
+
+			if (!bus->dma_buf) {
+				dev_warn(&pdev->dev,
+					 "Cannot allocate DMA buffer\n");
+				dma_pool_destroy(bus->dma_pool);
+			}
+		}
+	}
+
+	if (!bus->dma_buf && sram_enabled) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "buf");
 		bus->buf_base = devm_ioremap_resource(&pdev->dev, res);
 		if (IS_ERR(bus->buf_base) || resource_size(res) < 2) {
@@ -1238,24 +1422,33 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	 */
 	ret = aspeed_i2c_init(bus, pdev);
 	if (ret < 0)
-		return ret;
+		goto out_free_dma_buf;
 
 	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
 	ret = devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
 			       0, dev_name(&pdev->dev), bus);
 	if (ret < 0)
-		return ret;
+		goto out_free_dma_buf;
 
 	ret = i2c_add_adapter(&bus->adap);
 	if (ret < 0)
-		return ret;
+		goto out_free_dma_buf;
 
 	platform_set_drvdata(pdev, bus);
 
 	dev_info(bus->dev, "i2c bus %d registered (%s mode), irq %d\n",
-		 bus->adap.nr, bus->buf_base ? "buffer" : "byte", irq);
+		 bus->adap.nr, bus->dma_buf ? "dma" :
+					      bus->buf_base ? "buffer" : "byte",
+		 irq);
 
 	return 0;
+
+out_free_dma_buf:
+	if (bus->dma_buf)
+		dma_pool_free(bus->dma_pool, bus->dma_buf, bus->dma_handle);
+	dma_pool_destroy(bus->dma_pool);
+
+	return ret;
 }
 
 static int aspeed_i2c_remove_bus(struct platform_device *pdev)
@@ -1273,6 +1466,10 @@ static int aspeed_i2c_remove_bus(struct platform_device *pdev)
 
 	reset_control_assert(bus->rst);
 
+	if (bus->dma_buf)
+		dma_pool_free(bus->dma_pool, bus->dma_buf, bus->dma_handle);
+	dma_pool_destroy(bus->dma_pool);
+
 	i2c_del_adapter(&bus->adap);
 
 	return 0;
-- 
2.22.0

