Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 292862F23E9
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 01:34:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFBQf3MzMzDqQ9
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 11:34:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFBGc6wxLzDqvH;
 Tue, 12 Jan 2021 11:27:04 +1100 (AEDT)
IronPort-SDR: xZ8b4Eo5nP1Fc1tSResydJwVX8+hnCN6n2CL96Q1u+zOWnDo19TrnD0ziDvrCNzOAMIyf5BIne
 5wm8Utw7sXDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="157138122"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="157138122"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 16:27:02 -0800
IronPort-SDR: uTF+F7B1vh96fqYMGAnx+QS5NCEzdazMk6oGfAeyxH/12ya3Zh4yKcuKtnz6U0cqShMrSx4dc3
 WLVzbK9fRmzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="348273555"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga003.jf.intel.com with ESMTP; 11 Jan 2021 16:27:02 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
Subject: [PATCH v2 3/4] i2c: aspeed: add buffer mode transfer support
Date: Mon, 11 Jan 2021 16:37:48 -0800
Message-Id: <20210112003749.10565-4-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
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

This driver uses byte mode that makes lots of interrupt calls
which isn't good for performance and it makes the driver very
timing sensitive. To improve performance of the driver, this commit
adds buffer mode transfer support which uses I2C SRAM buffer
instead of using a single byte buffer.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Tested-by: Tao Ren <taoren@fb.com>
---
Changes since v1:
- Updated commit message.
- Refined using abstract functions.

 drivers/i2c/busses/i2c-aspeed.c | 375 +++++++++++++++++++++++++++++---
 1 file changed, 345 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 724bf30600d6..223885e7a62f 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -7,6 +7,7 @@
  *  Copyright 2017 Google, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -19,15 +20,24 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-/* I2C Register */
+/* I2C Global Registers */
+/* 0x00 : I2CG Interrupt Status Register  */
+/* 0x08 : I2CG Interrupt Target Assignment  */
+/* 0x0c : I2CG Global Control Register (AST2500)  */
+#define ASPEED_I2CG_GLOBAL_CTRL_REG			0x0c
+#define  ASPEED_I2CG_SRAM_BUFFER_EN			BIT(0)
+
+/* I2C Bus Registers */
 #define ASPEED_I2C_FUN_CTRL_REG				0x00
 #define ASPEED_I2C_AC_TIMING_REG1			0x04
 #define ASPEED_I2C_AC_TIMING_REG2			0x08
@@ -35,14 +45,12 @@
 #define ASPEED_I2C_INTR_STS_REG				0x10
 #define ASPEED_I2C_CMD_REG				0x14
 #define ASPEED_I2C_DEV_ADDR_REG				0x18
+#define ASPEED_I2C_BUF_CTRL_REG				0x1c
 #define ASPEED_I2C_BYTE_BUF_REG				0x20
 
-/* Global Register Definition */
-/* 0x00 : I2C Interrupt Status Register  */
-/* 0x08 : I2C Interrupt Target Assignment  */
-
 /* Device Register Definition */
 /* 0x00 : I2CD Function Control Register  */
+#define ASPEED_I2CD_BUFFER_PAGE_SEL_MASK		GENMASK(22, 20)
 #define ASPEED_I2CD_MULTI_MASTER_DIS			BIT(15)
 #define ASPEED_I2CD_SDA_DRIVE_1T_EN			BIT(8)
 #define ASPEED_I2CD_M_SDA_DRIVE_1T_EN			BIT(7)
@@ -103,6 +111,8 @@
 #define ASPEED_I2CD_BUS_RECOVER_CMD			BIT(11)
 
 /* Command Bit */
+#define ASPEED_I2CD_RX_BUFF_ENABLE			BIT(7)
+#define ASPEED_I2CD_TX_BUFF_ENABLE			BIT(6)
 #define ASPEED_I2CD_M_STOP_CMD				BIT(5)
 #define ASPEED_I2CD_M_S_RX_CMD_LAST			BIT(4)
 #define ASPEED_I2CD_M_RX_CMD				BIT(3)
@@ -119,6 +129,13 @@
 /* 0x18 : I2CD Slave Device Address Register   */
 #define ASPEED_I2CD_DEV_ADDR_MASK			GENMASK(6, 0)
 
+/* 0x1c : I2CD Buffer Control Register */
+/* Use 8-bits or 6-bits wide bit fileds to support both AST2400 and AST2500 */
+#define ASPEED_I2CD_BUF_RX_COUNT_MASK			GENMASK(31, 24)
+#define ASPEED_I2CD_BUF_RX_SIZE_MASK			GENMASK(23, 16)
+#define ASPEED_I2CD_BUF_TX_COUNT_MASK			GENMASK(15, 8)
+#define ASPEED_I2CD_BUF_OFFSET_MASK			GENMASK(5, 0)
+
 enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_INACTIVE,
 	ASPEED_I2C_MASTER_PENDING,
@@ -164,6 +181,11 @@ struct aspeed_i2c_bus {
 	int				master_xfer_result;
 	/* Multi-master */
 	bool				multi_master;
+	/* Buffer mode */
+	void __iomem			*buf_base;
+	u8				buf_offset;
+	u8				buf_page;
+	size_t				buf_size;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	struct i2c_client		*slave;
 	enum aspeed_i2c_slave_state	slave_state;
@@ -241,6 +263,77 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
+static inline void
+aspeed_i2c_slave_handle_rx_done(struct aspeed_i2c_bus *bus, u32 irq_status,
+				u8 *value)
+{
+	if (bus->buf_base &&
+	    bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+	    !(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))
+		*value = readb(bus->buf_base);
+	else
+		*value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
+}
+
+static inline void
+aspeed_i2c_slave_handle_normal_stop(struct aspeed_i2c_bus *bus, u32 irq_status,
+				    u8 *value)
+{
+	int i, len;
+
+	if (bus->slave_state == ASPEED_I2C_SLAVE_WRITE_RECEIVED &&
+	    irq_status & ASPEED_I2CD_INTR_RX_DONE) {
+		if (bus->buf_base) {
+			len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
+					readl(bus->base +
+					      ASPEED_I2C_BUF_CTRL_REG));
+			for (i = 0; i < len; i++) {
+				*value = readb(bus->buf_base + i);
+				i2c_slave_event(bus->slave,
+						I2C_SLAVE_WRITE_RECEIVED,
+						value);
+			}
+		}
+	}
+}
+
+static inline void
+aspeed_i2c_slave_handle_write_requested(struct aspeed_i2c_bus *bus, u8 *value)
+{
+	if (bus->buf_base) {
+		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+				  bus->buf_size - 1) |
+		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+				  bus->buf_offset),
+		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+		writel(ASPEED_I2CD_RX_BUFF_ENABLE,
+		       bus->base + ASPEED_I2C_CMD_REG);
+	}
+}
+
+static inline void
+aspeed_i2c_slave_handle_write_received(struct aspeed_i2c_bus *bus, u8 *value)
+{
+	int i, len;
+
+	if (bus->buf_base) {
+		len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
+				readl(bus->base +
+				      ASPEED_I2C_BUF_CTRL_REG));
+		for (i = 1; i < len; i++) {
+			*value = readb(bus->buf_base + i);
+			i2c_slave_event(bus->slave, I2C_SLAVE_WRITE_RECEIVED,
+					value);
+		}
+		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+				  bus->buf_size - 1) |
+		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK, bus->buf_offset),
+		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+		writel(ASPEED_I2CD_RX_BUFF_ENABLE,
+		       bus->base + ASPEED_I2C_CMD_REG);
+	}
+}
+
 static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 {
 	u32 command, irq_handled = 0;
@@ -267,7 +360,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was sent something. */
 	if (irq_status & ASPEED_I2CD_INTR_RX_DONE) {
-		value = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
+		aspeed_i2c_slave_handle_rx_done(bus, irq_status, &value);
 		/* Handle address frame. */
 		if (bus->slave_state == ASPEED_I2C_SLAVE_START) {
 			if (value & 0x1)
@@ -282,9 +375,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 
 	/* Slave was asked to stop. */
 	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
+		aspeed_i2c_slave_handle_normal_stop(bus, irq_status, &value);
 		irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
 		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
 	}
+
 	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
 	    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
 		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
@@ -314,9 +409,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	case ASPEED_I2C_SLAVE_WRITE_REQUESTED:
 		bus->slave_state = ASPEED_I2C_SLAVE_WRITE_RECEIVED;
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		aspeed_i2c_slave_handle_write_requested(bus, &value);
 		break;
 	case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+		aspeed_i2c_slave_handle_write_received(bus, &value);
 		break;
 	case ASPEED_I2C_SLAVE_STOP:
 		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
@@ -336,12 +433,76 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 }
 #endif /* CONFIG_I2C_SLAVE */
 
+static inline u32
+aspeed_i2c_prepare_rx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
+{
+	u32 command = 0;
+	int len;
+
+	if (msg->len > bus->buf_size) {
+		len = bus->buf_size;
+	} else {
+		len = msg->len;
+		command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+	}
+
+	if (bus->buf_base) {
+		command |= ASPEED_I2CD_RX_BUFF_ENABLE;
+
+		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK, len - 1) |
+		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK, bus->buf_offset),
+		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+	}
+
+	return command;
+}
+
+static inline u32
+aspeed_i2c_prepare_tx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
+{
+	u8 slave_addr = i2c_8bit_addr_from_msg(msg);
+	u32 command = 0;
+	int len;
+
+	if (msg->len + 1 > bus->buf_size)
+		len = bus->buf_size;
+	else
+		len = msg->len + 1;
+
+	if (bus->buf_base) {
+		u8 wbuf[4];
+		int i;
+
+		command |= ASPEED_I2CD_TX_BUFF_ENABLE;
+
+		/*
+		 * Yeah, it looks bad but byte writing on remapped I2C SRAM
+		 * causes corruption so use this way to make dword writings.
+		 */
+		wbuf[0] = slave_addr;
+		for (i = 1; i < len; i++) {
+			wbuf[i % 4] = msg->buf[i - 1];
+			if (i % 4 == 3)
+				writel(*(u32 *)wbuf, bus->buf_base + i - 3);
+		}
+		if (--i % 4 != 3)
+			writel(*(u32 *)wbuf, bus->buf_base + i - (i % 4));
+
+		writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, len - 1) |
+		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK, bus->buf_offset),
+		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+	}
+
+	bus->buf_index = len - 1;
+
+	return command;
+}
+
 /* precondition: bus.lock has been acquired. */
 static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 {
 	u32 command = ASPEED_I2CD_M_START_CMD | ASPEED_I2CD_M_TX_CMD;
 	struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
-	u8 slave_addr = i2c_8bit_addr_from_msg(msg);
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	/*
@@ -360,12 +521,21 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
 
 	if (msg->flags & I2C_M_RD) {
 		command |= ASPEED_I2CD_M_RX_CMD;
-		/* Need to let the hardware know to NACK after RX. */
-		if (msg->len == 1 && !(msg->flags & I2C_M_RECV_LEN))
-			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+		if (!(msg->flags & I2C_M_RECV_LEN)) {
+			if (msg->len && bus->buf_base)
+				command |= aspeed_i2c_prepare_rx_buf(bus, msg);
+
+			/* Need to let the hardware know to NACK after RX. */
+			if (msg->len <= 1)
+				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+		}
+	} else if (msg->len && bus->buf_base) {
+		command |= aspeed_i2c_prepare_tx_buf(bus, msg);
 	}
 
-	writel(slave_addr, bus->base + ASPEED_I2C_BYTE_BUF_REG);
+	if (!(command & ASPEED_I2CD_TX_BUFF_ENABLE))
+		writel(i2c_8bit_addr_from_msg(msg),
+		       bus->base + ASPEED_I2C_BYTE_BUF_REG);
 	writel(command, bus->base + ASPEED_I2C_CMD_REG);
 }
 
@@ -400,6 +570,103 @@ static int aspeed_i2c_is_irq_error(u32 irq_status)
 	return 0;
 }
 
+static inline u32
+aspeed_i2c_master_handle_tx_first(struct aspeed_i2c_bus *bus,
+				  struct i2c_msg *msg)
+{
+	u32 command = 0;
+
+	if (bus->buf_base) {
+		u8 wbuf[4];
+		int len;
+		int i;
+
+		if (msg->len - bus->buf_index > bus->buf_size)
+			len = bus->buf_size;
+		else
+			len = msg->len - bus->buf_index;
+
+		command |= ASPEED_I2CD_TX_BUFF_ENABLE;
+
+		if (msg->len - bus->buf_index > bus->buf_size)
+			len = bus->buf_size;
+		else
+			len = msg->len - bus->buf_index;
+
+		for (i = 0; i < len; i++) {
+			wbuf[i % 4] = msg->buf[bus->buf_index + i];
+			if (i % 4 == 3)
+				writel(*(u32 *)wbuf,
+				       bus->buf_base + i - 3);
+		}
+		if (--i % 4 != 3)
+			writel(*(u32 *)wbuf,
+			       bus->buf_base + i - (i % 4));
+
+		writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK,
+				  len - 1) |
+		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+				  bus->buf_offset),
+		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+
+		bus->buf_index += len;
+	} else {
+		writel(msg->buf[bus->buf_index++],
+		       bus->base + ASPEED_I2C_BYTE_BUF_REG);
+	}
+
+	return command;
+}
+
+static inline void
+aspeed_i2c_master_handle_rx(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
+{
+	u8 recv_byte;
+	int len;
+
+	if (bus->buf_base) {
+		len = FIELD_GET(ASPEED_I2CD_BUF_RX_COUNT_MASK,
+				readl(bus->base + ASPEED_I2C_BUF_CTRL_REG));
+		memcpy_fromio(msg->buf + bus->buf_index, bus->buf_base, len);
+		bus->buf_index += len;
+	} else {
+		recv_byte = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
+		msg->buf[bus->buf_index++] = recv_byte;
+	}
+}
+
+static inline u32
+aspeed_i2c_master_handle_rx_next(struct aspeed_i2c_bus *bus,
+				 struct i2c_msg *msg)
+{
+	u32 command = 0;
+
+	if (bus->buf_base) {
+		int len;
+
+		if (msg->len - bus->buf_index > bus->buf_size) {
+			len = bus->buf_size;
+		} else {
+			len = msg->len - bus->buf_index;
+			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+		}
+
+		command |= ASPEED_I2CD_RX_BUFF_ENABLE;
+
+		writel(FIELD_PREP(ASPEED_I2CD_BUF_RX_SIZE_MASK,
+				  len - 1) |
+		       FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, 0) |
+		       FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK,
+				  bus->buf_offset),
+		       bus->base + ASPEED_I2C_BUF_CTRL_REG);
+	} else {
+		if (bus->buf_index + 1 == msg->len)
+			command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+	}
+
+	return command;
+}
+
 static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 {
 	u32 irq_handled = 0, command = 0;
@@ -508,11 +775,10 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		fallthrough;
 	case ASPEED_I2C_MASTER_TX_FIRST:
 		if (bus->buf_index < msg->len) {
+			command = ASPEED_I2CD_M_TX_CMD;
+			command |= aspeed_i2c_master_handle_tx_first(bus, msg);
+			writel(command, bus->base + ASPEED_I2C_CMD_REG);
 			bus->master_state = ASPEED_I2C_MASTER_TX;
-			writel(msg->buf[bus->buf_index++],
-			       bus->base + ASPEED_I2C_BYTE_BUF_REG);
-			writel(ASPEED_I2CD_M_TX_CMD,
-			       bus->base + ASPEED_I2C_CMD_REG);
 		} else {
 			aspeed_i2c_next_msg_or_stop(bus);
 		}
@@ -529,26 +795,26 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		}
 		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
 
-		recv_byte = readl(bus->base + ASPEED_I2C_BYTE_BUF_REG) >> 8;
-		msg->buf[bus->buf_index++] = recv_byte;
-
 		if (msg->flags & I2C_M_RECV_LEN) {
+			recv_byte = readl(bus->base +
+					ASPEED_I2C_BYTE_BUF_REG) >> 8;
 			if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
 				bus->cmd_err = -EPROTO;
 				aspeed_i2c_do_stop(bus);
 				goto out_no_complete;
 			}
-			msg->len = recv_byte +
-					((msg->flags & I2C_CLIENT_PEC) ? 2 : 1);
+			msg->len = recv_byte + ((msg->flags & I2C_CLIENT_PEC) ?
+						2 : 1);
 			msg->flags &= ~I2C_M_RECV_LEN;
+		} else if (msg->len) {
+			aspeed_i2c_master_handle_rx(bus, msg);
 		}
 
 		if (bus->buf_index < msg->len) {
-			bus->master_state = ASPEED_I2C_MASTER_RX;
 			command = ASPEED_I2CD_M_RX_CMD;
-			if (bus->buf_index + 1 == msg->len)
-				command |= ASPEED_I2CD_M_S_RX_CMD_LAST;
+			command |= aspeed_i2c_master_handle_rx_next(bus, msg);
 			writel(command, bus->base + ASPEED_I2C_CMD_REG);
+			bus->master_state = ASPEED_I2C_MASTER_RX;
 		} else {
 			aspeed_i2c_next_msg_or_stop(bus);
 		}
@@ -908,6 +1174,9 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	if (ret < 0)
 		return ret;
 
+	fun_ctrl_reg |= FIELD_PREP(ASPEED_I2CD_BUFFER_PAGE_SEL_MASK,
+				   bus->buf_page);
+
 	if (of_property_read_bool(pdev->dev.of_node, "multi-master"))
 		bus->multi_master = true;
 	else
@@ -948,6 +1217,52 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
 	return ret;
 }
 
+static void aspeed_i2c_set_xfer_mode(struct aspeed_i2c_bus *bus)
+{
+	struct platform_device *pdev = to_platform_device(bus->dev);
+	bool sram_enabled = true;
+	int ret;
+
+	/*
+	 * Enable I2C SRAM in case of AST2500.
+	 * SRAM is enabled by default in AST2400 and AST2600.
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "aspeed,ast2500-i2c-bus")) {
+		struct regmap *gr_regmap = syscon_regmap_lookup_by_compatible("aspeed,ast2500-i2c-gr");
+
+		if (IS_ERR(gr_regmap))
+			ret = PTR_ERR(gr_regmap);
+		else
+			ret = regmap_update_bits(gr_regmap,
+						 ASPEED_I2CG_GLOBAL_CTRL_REG,
+						 ASPEED_I2CG_SRAM_BUFFER_EN,
+						 ASPEED_I2CG_SRAM_BUFFER_EN);
+
+		if (ret)
+			sram_enabled = false;
+	}
+
+	if (sram_enabled) {
+		struct resource *res = platform_get_resource(pdev,
+							     IORESOURCE_MEM, 1);
+
+		if (res && resource_size(res) >= 2)
+			bus->buf_base = devm_ioremap_resource(&pdev->dev, res);
+
+		if (!IS_ERR_OR_NULL(bus->buf_base)) {
+			bus->buf_size = resource_size(res);
+			if (of_device_is_compatible(pdev->dev.of_node,
+						    "aspeed,ast2400-i2c-bus")) {
+				bus->buf_page = ((res->start >> 8) &
+						 GENMASK(3, 0)) - 8;
+				bus->buf_offset = (res->start >> 2) &
+						  ASPEED_I2CD_BUF_OFFSET_MASK;
+			}
+		}
+	}
+}
+
 static const struct of_device_id aspeed_i2c_bus_of_table[] = {
 	{
 		.compatible = "aspeed,ast2400-i2c-bus",
@@ -970,18 +1285,18 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct aspeed_i2c_bus *bus;
 	struct clk *parent_clk;
-	struct resource *res;
 	int irq, ret;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	bus->base = devm_ioremap_resource(&pdev->dev, res);
+	bus->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->base))
 		return PTR_ERR(bus->base);
 
+	bus->dev = &pdev->dev;
+
 	parent_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(parent_clk))
 		return PTR_ERR(parent_clk);
@@ -1012,6 +1327,8 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
 				match->data;
 
+	aspeed_i2c_set_xfer_mode(bus);
+
 	/* Initialize the I2C adapter */
 	spin_lock_init(&bus->lock);
 	init_completion(&bus->cmd_complete);
@@ -1023,8 +1340,6 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	strlcpy(bus->adap.name, pdev->name, sizeof(bus->adap.name));
 	i2c_set_adapdata(&bus->adap, bus);
 
-	bus->dev = &pdev->dev;
-
 	/* Clean up any left over interrupt state. */
 	writel(0, bus->base + ASPEED_I2C_INTR_CTRL_REG);
 	writel(0xffffffff, bus->base + ASPEED_I2C_INTR_STS_REG);
@@ -1048,8 +1363,8 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bus);
 
-	dev_info(bus->dev, "i2c bus %d registered, irq %d\n",
-		 bus->adap.nr, irq);
+	dev_info(bus->dev, "i2c bus %d registered (%s mode), irq %d\n",
+		 bus->adap.nr, bus->buf_base ? "buffer" : "byte", irq);
 
 	return 0;
 }
-- 
2.17.1

