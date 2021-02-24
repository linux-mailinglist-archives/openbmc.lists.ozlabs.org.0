Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03432445A
	for <lists+openbmc@lfdr.de>; Wed, 24 Feb 2021 20:06:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dm5480pYnz3cJb
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 06:06:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dm52H6JVcz3cJR;
 Thu, 25 Feb 2021 06:04:39 +1100 (AEDT)
IronPort-SDR: QyZkHMXJ5bqDS4PHvZhU2usdHIbPKiv38k0V0asLCW++Iwq08ulN/8tf4XrvPMhiPvvZSysPV7
 XVc+NlseWGBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="184578408"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="184578408"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 11:04:34 -0800
IronPort-SDR: RGI7Uo3MVhDUBI/KPv/KhjVwX4FPoRivLE2pBqG24WRGafMwhIwko3CNnr0MA94ftYt/NkDwxO
 Hv80nwZyGWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="367098945"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga006.jf.intel.com with ESMTP; 24 Feb 2021 11:04:34 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Subject: [PATCH v4 4/4] i2c: aspeed: add DMA mode transfer support
Date: Wed, 24 Feb 2021 11:17:20 -0800
Message-Id: <20210224191720.7724-5-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds DMA mode transfer support.

Only AST2500 and later versions support DMA mode.

AST2500 has these restrictions:
  - If one of these controllers is enabled
      * UHCI host controller
      * MCTP controller
    I2C has to use buffer mode or byte mode instead
    since these controllers run only in DMA mode and
    I2C is sharing the same DMA H/W with them.
  - If one of these controllers uses DMA mode, I2C
    can't use DMA mode
      * SD/eMMC
      * Port80 snoop

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v3:
- None

Changes since v2:
- Refined SoC family dependent xfer mode configuration functions.

Changes since v1:
- Updated commit message and comments.
- Refined using abstract functions.

 drivers/i2c/busses/i2c-aspeed.c | 265 ++++++++++++++++++++++++++------
 1 file changed, 216 insertions(+), 49 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index ffc52937df26..3e3bb014b027 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -10,6 +10,8 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -47,6 +49,8 @@
 #define ASPEED_I2C_DEV_ADDR_REG				0x18
 #define ASPEED_I2C_BUF_CTRL_REG				0x1c
 #define ASPEED_I2C_BYTE_BUF_REG				0x20
+#define ASPEED_I2C_DMA_ADDR_REG				0x24
+#define ASPEED_I2C_DMA_LEN_REG				0x28
 
 /* Device Register Definition */
 /* 0x00 : I2CD Function Control Register  */
@@ -111,6 +115,8 @@
 #define ASPEED_I2CD_BUS_RECOVER_CMD			BIT(11)
 
 /* Command Bit */
+#define ASPEED_I2CD_RX_DMA_ENABLE			BIT(9)
+#define ASPEED_I2CD_TX_DMA_ENABLE			BIT(8)
 #define ASPEED_I2CD_RX_BUFF_ENABLE			BIT(7)
 #define ASPEED_I2CD_TX_BUFF_ENABLE			BIT(6)
 #define ASPEED_I2CD_M_STOP_CMD				BIT(5)
@@ -136,6 +142,14 @@
 #define ASPEED_I2CD_BUF_TX_COUNT_MASK			GENMASK(15, 8)
 #define ASPEED_I2CD_BUF_OFFSET_MASK			GENMASK(5, 0)
 
+/* 0x24 : I2CD DMA Mode Buffer Address Register */
+#define ASPEED_I2CD_DMA_ADDR_MASK			GENMASK(31, 2)
+#define ASPEED_I2CD_DMA_ALIGN				4
+
+/* 0x28 : I2CD DMA Transfer Length Register */
+#define ASPEED_I2CD_DMA_LEN_SHIFT			0
+#define ASPEED_I2CD_DMA_LEN_MASK			GENMASK(11, 0)
+
 enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_INACTIVE,
 	ASPEED_I2C_MASTER_PENDING,
@@ -161,6 +175,7 @@ struct aspeed_i2c_config {
 	u32 (*get_clk_reg_val)(struct device *dev, u32 divisor);
 	int (*enable_sram)(void);
 	int (*set_buf_xfer_mode)(struct device *dev);
+	int (*set_dma_xfer_mode)(struct device *dev);
 };
 
 struct aspeed_i2c_bus {
@@ -190,6 +205,12 @@ struct aspeed_i2c_bus {
 	void __iomem			*buf_base;
 	u8				buf_offset;
 	u8				buf_page;
+	/* DMA mode */
+	struct dma_pool			*dma_pool;
+	dma_addr_t			dma_handle;
+	u8				*dma_buf;
+	size_t				dma_len;
+	/* Buffer/DMA mode */
 	size_t				buf_size;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	struct i2c_client		*slave;
@@ -272,9 +293,13 @@ static inline void
 aspeed_i2c_slave_handle_rx_done(struct aspeed_i2c_bus *bus, u32 irq_status,
 				u8 *value)
 {
-	if (bus->buf_base &&
+	if (bus->dma_buf &&
 	    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
 	    !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
+		*value = bus->dma_buf[0];
+	else if (bus->buf_base &&
+		 bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+		 !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
 		*value = readb(bus->buf_base);
 	else
 		*value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
@@ -288,7 +313,18 @@ aspeed_i2c_slave_handle_normal_stop(struct aspeed_i2c_bus *bus, u32 irq_status,
 
 	if (bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
 	    irq_status & ASPEED_I2CD_INTR_RX_DONE) {
-		if (bus->buf_base) {
+		if (bus->dma_buf) {
+			len = bus->buf_size -
+			      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+					readl(bus->base +
+					      ASPEED_I2C_DMA_LEN_REG));
+			for (i = 0; i < len; i++) {
+				*value = bus->dma_buf[i];
+				i2c_slave_event(bus->slave,
+						I2C_SLAVE_WRITE_RECEIVED,
+						value);
+			}
+		} else if (bus->buf_base) {
 			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 					readl(bus->base +
 					      ASPEED_I2C_BUF_CTRL_REG));
@@ -305,7 +341,14 @@ aspeed_i2c_slave_handle_normal_stop(struct aspeed_i2c_bus *bus, u32 irq_status,
 static inline void
 aspeed_i2c_slave_handle_write_requested(struct aspeed_i2c_bus *bus, u8 *value)
 {
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+		       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+		writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, bus->buf_size),
+		       bus->base + ASPEED_I2C_DMA_LEN_REG);
+		writel(ASPEED_I2CD_RX_DMA_ENABLE,
+		       bus->base + ASPEED_I2C_CMD_REG);
+	} else if (bus->buf_base) {
 		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
 				  bus->buf_size - 1) |
 		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
@@ -321,7 +364,23 @@ aspeed_i2c_slave_handle_write_received(struct aspeed_i2c_bus *bus, u8 *value)
 {
 	int i, len;
 
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		len = bus->buf_size -
+		      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+				readl(bus->base +
+				      ASPEED_I2C_DMA_LEN_REG));
+		for (i = 1; i < len; i++) {
+			*value = bus->dma_buf[i];
+			i2c_slave_event(bus->slave, I2C_SLAVE_WRITE_RECEIVED,
+					value);
+		}
+		writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+		       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+		writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, bus->buf_size),
+		       bus->base + ASPEED_I2C_DMA_LEN_REG);
+		writel(ASPEED_I2CD_RX_DMA_ENABLE,
+		       bus->base + ASPEED_I2C_CMD_REG);
+	} else if (bus->buf_base) {
 		len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 				readl(bus->base +
 				      ASPEED_I2C_BUF_CTRL_REG));
@@ -451,7 +510,15 @@ aspeed_i2c_prepare_rx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
 		command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
 	}
 
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		command |= ASPEED_I2CD_RX_DMA_ENABLE;
+
+		writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+		       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+		writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
+		       bus->base + ASPEED_I2C_DMA_LEN_REG);
+		bus->dma_len = len;
+	} else {
 		command |= ASPEED_I2CD_RX_BUFF_ENABLE;
 
 		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK, len - 1) |
@@ -474,7 +541,18 @@ aspeed_i2c_prepare_tx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
 	else
 		len = msg->len + 1;
 
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		command |= ASPEED_I2CD_TX_DMA_ENABLE;
+
+		bus->dma_buf[0] = slave_addr;
+		memcpy(bus->dma_buf + 1, msg->buf, len);
+
+		writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+		       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+		writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
+		       bus->base + ASPEED_I2C_DMA_LEN_REG);
+		bus->dma_len = len;
+	} else {
 		u8 wbuf[4];
 		int i;
 
@@ -527,18 +605,19 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 	if (msg->flags & I2C_M_RD) {
 		command |= ASPEED_I2CD_M_RX_CMD;
 		if (!(msg->flags & I2C_M_RECV_LEN)) {
-			if (msg->len && bus->buf_base)
+			if (msg->len && (bus->dma_buf || bus->buf_base))
 				command |= aspeed_i2c_prepare_rx_buf(bus, msg);
 
 			/* Need to let the hardware know to NACK after RX. */
 			if (msg->len <= 1)
 				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
 		}
-	} else if (msg->len && bus->buf_base) {
+	} else if (msg->len && (bus->dma_buf || bus->buf_base)) {
 		command |= aspeed_i2c_prepare_tx_buf(bus, msg);
 	}
 
-	if (!(command & ASPEED_I2CD_TX_BUFF_ENABLE))
+	if (!(command & (ASPEED_I2CD_TX_BUFF_ENABLE |
+			 ASPEED_I2CD_TX_DMA_ENABLE)))
 		writel(i2c_8bit_addr_from_msg(msg),
 		       bus->base + ASPEED_I2C_BYTE_BUF_REG);
 	writel(command, bus->base + ASPEED_I2C_CMD_REG);
@@ -581,42 +660,55 @@ aspeed_i2c_master_handle_tx_first(struct aspeed_i2c_bus *bus,
 {
 	u32 command = 0;
 
-	if (bus->buf_base) {
-		u8 wbuf[4];
+	if (bus->dma_buf || bus->buf_base) {
 		int len;
-		int i;
 
 		if (msg->len - bus->buf_index > bus->buf_size)
 			len = bus->buf_size;
 		else
 			len = msg->len - bus->buf_index;
 
-		command |= ASPEED_I2CD_TX_BUFF_ENABLE;
+		if (bus->dma_buf) {
+			command |= ASPEED_I2CD_TX_DMA_ENABLE;
 
-		if (msg->len - bus->buf_index > bus->buf_size)
-			len = bus->buf_size;
-		else
-			len = msg->len - bus->buf_index;
+			memcpy(bus->dma_buf, msg->buf + bus->buf_index, len);
 
-		/*
-		 * Looks bad here again but use dword writings to avoid data
-		 * corruption of byte writing on remapped I2C SRAM.
-		 */
-		for (i = 0; i < len; i++) {
-			wbuf[i % 4] = msg->buf[bus->buf_index + i];
-			if (i % 4 == 3)
+			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
+			       bus->base + ASPEED_I2C_DMA_LEN_REG);
+			bus->dma_len = len;
+		} else {
+			u8 wbuf[4];
+			int i;
+
+			command |= ASPEED_I2CD_TX_BUFF_ENABLE;
+
+			if (msg->len - bus->buf_index > bus->buf_size)
+				len = bus->buf_size;
+			else
+				len = msg->len - bus->buf_index;
+
+			/*
+			 * Looks bad here again but use dword writings to avoid
+			 * data corruption of byte writing on remapped I2C SRAM.
+			 */
+			for (i = 0; i < len; i++) {
+				wbuf[i % 4] = msg->buf[bus->buf_index + i];
+				if (i % 4 == 3)
+					writel(*(u32 *)wbuf,
+					       bus->buf_base + i - 3);
+			}
+			if (--i % 4 != 3)
 				writel(*(u32 *)wbuf,
-				       bus->buf_base + i - 3);
-		}
-		if (--i % 4 != 3)
-			writel(*(u32 *)wbuf,
-			       bus->buf_base + i - (i % 4));
+				       bus->buf_base + i - (i % 4));
 
-		writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
-				  len - 1) |
-		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
-				  bus->buf_offset),
-		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
+					  len - 1) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+					  bus->buf_offset),
+			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+		}
 
 		bus->buf_index += len;
 	} else {
@@ -633,7 +725,14 @@ aspeed_i2c_master_handle_rx(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
 	u8 recv_byte;
 	int len;
 
-	if (bus->buf_base) {
+	if (bus->dma_buf) {
+		len = bus->dma_len -
+		      FIELD_GET(ASPEED_I2CD_DMA_LEN_MASK,
+				readl(bus->base + ASPEED_I2C_DMA_LEN_REG));
+
+		memcpy(msg->buf + bus->buf_index, bus->dma_buf, len);
+		bus->buf_index += len;
+	} else if (bus->buf_base) {
 		len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
 				readl(bus->base + ASPEED_I2C_BUF_CTRL_REG));
 		memcpy_fromio(msg->buf + bus->buf_index, bus->buf_base, len);
@@ -650,7 +749,7 @@ aspeed_i2c_master_handle_rx_next(struct aspeed_i2c_bus *bus,
 {
 	u32 command = 0;
 
-	if (bus->buf_base) {
+	if (bus->dma_buf || bus->buf_base) {
 		int len;
 
 		if (msg->len - bus->buf_index > bus->buf_size) {
@@ -660,14 +759,24 @@ aspeed_i2c_master_handle_rx_next(struct aspeed_i2c_bus *bus,
 			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
 		}
 
-		command |= ASPEED_I2CD_RX_BUFF_ENABLE;
+		if (bus->dma_buf) {
+			command |= ASPEED_I2CD_RX_DMA_ENABLE;
 
-		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
-				  len - 1) |
-		       FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, 0) |
-		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
-				  bus->buf_offset),
-		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+			writel(bus->dma_handle & ASPEED_I2CD_DMA_ADDR_MASK,
+			       bus->base + ASPEED_I2C_DMA_ADDR_REG);
+			writel(FIELD_PREP(ASPEED_I2CD_DMA_LEN_MASK, len),
+			       bus->base + ASPEED_I2C_DMA_LEN_REG);
+			bus->dma_len = len;
+		} else {
+			command |= ASPEED_I2CD_RX_BUFF_ENABLE;
+
+			writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+					  len - 1) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, 0) |
+			       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+					  bus->buf_offset),
+			       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+		}
 	} else {
 		if (bus->buf_index + 1 == msg->len)
 			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
@@ -1287,22 +1396,63 @@ static int aspeed_i2c_25xx_set_buf_xfer_mode(struct device *dev)
 	return bus->buf_size ? 0 : -EINVAL;
 }
 
+static int aspeed_i2c_24xx_set_dma_xfer_mode(struct device *dev)
+{
+	/* AST24xx doesn't support DMA mode */
+
+	return -EBADR;
+}
+
+static int aspeed_i2c_25xx_set_dma_xfer_mode(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct aspeed_i2c_bus *bus = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
+	if (!ret) {
+		bus->buf_size = ASPEED_I2CD_DMA_LEN_MASK >>
+				ASPEED_I2CD_DMA_LEN_SHIFT;
+		bus->dma_pool = dma_pool_create("i2c-aspeed",
+						&pdev->dev,
+						bus->buf_size,
+						ASPEED_I2CD_DMA_ALIGN,
+						0);
+		if (bus->dma_pool)
+			bus->dma_buf = dma_pool_alloc(bus->dma_pool,
+						      GFP_KERNEL,
+						      &bus->dma_handle);
+
+		if (!bus->dma_buf) {
+			ret = -ENOMEM;
+			bus->buf_size = 0;
+			dev_dbg(&pdev->dev, "Cannot allocate DMA buffer\n");
+			dma_pool_destroy(bus->dma_pool);
+		}
+	}
+
+	return ret;
+}
+
 static const struct aspeed_i2c_config ast24xx_config = {
 	.get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val,
 	.enable_sram = aspeed_i2c_24xx_enable_sram,
 	.set_buf_xfer_mode = aspeed_i2c_24xx_set_buf_xfer_mode,
+	.set_dma_xfer_mode = aspeed_i2c_24xx_set_dma_xfer_mode,
 };
 
 static const struct aspeed_i2c_config ast25xx_config = {
 	.get_clk_reg_val = aspeed_i2c_25xx_get_clk_reg_val,
 	.enable_sram = aspeed_i2c_25xx_enable_sram,
 	.set_buf_xfer_mode = aspeed_i2c_25xx_set_buf_xfer_mode,
+	.set_dma_xfer_mode = aspeed_i2c_25xx_set_dma_xfer_mode,
 };
 
 static const struct aspeed_i2c_config ast26xx_config = {
 	.get_clk_reg_val = aspeed_i2c_25xx_get_clk_reg_val,
 	.enable_sram = aspeed_i2c_24xx_enable_sram,
 	.set_buf_xfer_mode = aspeed_i2c_25xx_set_buf_xfer_mode,
+	.set_dma_xfer_mode = aspeed_i2c_25xx_set_dma_xfer_mode,
 };
 
 static const struct of_device_id aspeed_i2c_bus_of_table[] = {
@@ -1324,8 +1474,12 @@ static void aspeed_i2c_set_xfer_mode(struct aspeed_i2c_bus *bus)
 		return;
 
 	ret = bus->config->enable_sram();
-	if (!ret && !strncasecmp(mode, "buf", 3))
-		ret = bus->config->set_buf_xfer_mode(bus->dev);
+	if (!ret) {
+		if (!strncasecmp(mode, "buf", 3))
+			ret = bus->config->set_buf_xfer_mode(bus->dev);
+		else if (!strncasecmp(mode, "dma", 3))
+			ret = bus->config->set_dma_xfer_mode(bus->dev);
+	}
 
 	if (ret)
 		dev_dbg(&pdev->dev, "Use default (byte) xfer mode\n");
@@ -1400,22 +1554,31 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
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
 
 	dev_info(bus->dev, "i2c bus %d registered (%s mode), irq %d\n",
-		 bus->adap.nr, bus->buf_base ? "buf" : "byte", irq);
+		 bus->adap.nr, bus->dma_buf ? "dma" :
+					      bus->buf_base ? "buf" : "byte",
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
@@ -1433,6 +1596,10 @@ static int aspeed_i2c_remove_bus(struct platform_device *pdev)
 
 	reset_control_assert(bus->rst);
 
+	if (bus->dma_buf)
+		dma_pool_free(bus->dma_pool, bus->dma_buf, bus->dma_handle);
+	dma_pool_destroy(bus->dma_pool);
+
 	i2c_del_adapter(&bus->adap);
 
 	return 0;
-- 
2.17.1

