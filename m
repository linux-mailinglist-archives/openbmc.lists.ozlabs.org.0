Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C19EAC150
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 22:18:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q85X02VdzDqCT
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 06:18:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q82k2WQLzDrDT
 for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2019 06:16:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 13:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,474,1559545200"; d="scan'208";a="334989177"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga004.jf.intel.com with ESMTP; 06 Sep 2019 13:16:09 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tao Ren <taoren@fb.com>
Subject: [PATCH v2 dev-5.2 2/2] i2c: aspeed: add slave inactive timeout support
Date: Fri,  6 Sep 2019 13:16:05 -0700
Message-Id: <20190906201605.14540-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906201605.14540-1-jae.hyun.yoo@linux.intel.com>
References: <20190906201605.14540-1-jae.hyun.yoo@linux.intel.com>
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

In case of multi-master environment, if a peer master incorrectly handles
a bus in the middle of a transaction, I2C hardware hangs in slave state
and it can't escape from the slave state, so this commit adds slave
inactive timeout support to recover the bus in the case.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
Changes since v1:
 - Made it use bus auto recovery feature so that bus can recover itself
   automatically.

 drivers/i2c/busses/i2c-aspeed.c | 82 ++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 89317929bee4..4af8ad8f59e6 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -55,6 +55,7 @@
 /* Device Register Definition */
 /* 0x00 : I2CD Function Control Register  */
 #define ASPEED_I2CD_BUFFER_PAGE_SEL_MASK		GENMASK(22, 20)
+#define ASPEED_I2CD_BUS_AUTO_RECOVERY_EN		BIT(17)
 #define ASPEED_I2CD_MULTI_MASTER_DIS			BIT(15)
 #define ASPEED_I2CD_SDA_DRIVE_1T_EN			BIT(8)
 #define ASPEED_I2CD_M_SDA_DRIVE_1T_EN			BIT(7)
@@ -70,10 +71,14 @@
 #define ASPEED_I2CD_TIME_SCL_HIGH_MASK			GENMASK(19, 16)
 #define ASPEED_I2CD_TIME_SCL_LOW_SHIFT			12
 #define ASPEED_I2CD_TIME_SCL_LOW_MASK			GENMASK(15, 12)
+#define ASPEED_I2CD_TIME_TIMEOUT_BASE_DIVISOR_SHIFT	8
+#define ASPEED_I2CD_TIME_TIMEOUT_BASE_DIVISOR_MASK	GENMASK(9, 8)
 #define ASPEED_I2CD_TIME_BASE_DIVISOR_MASK		GENMASK(3, 0)
 #define ASPEED_I2CD_TIME_SCL_REG_MAX			GENMASK(3, 0)
+
 /* 0x08 : I2CD Clock and AC Timing Control Register #2 */
-#define ASPEED_NO_TIMEOUT_CTRL				0
+#define ASPEED_I2CD_TIMEOUT_CYCLES_SHIFT		0
+#define ASPEED_I2CD_TIMEOUT_CYCLES_MASK			GENMASK(4, 0)
 
 /* 0x0c : I2CD Interrupt Control Register &
  * 0x10 : I2CD Interrupt Status Register
@@ -81,6 +86,7 @@
  * These share bit definitions, so use the same values for the enable &
  * status bits.
  */
+#define ASPEED_I2CD_INTR_SLAVE_INACTIVE_TIMEOUT		BIT(15)
 #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT			BIT(14)
 #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE		BIT(13)
 #define ASPEED_I2CD_INTR_SLAVE_MATCH			BIT(7)
@@ -96,8 +102,11 @@
 		 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
 		 ASPEED_I2CD_INTR_ABNORMAL |				       \
 		 ASPEED_I2CD_INTR_ARBIT_LOSS)
+#define ASPEED_I2CD_INTR_SLAVE_ERRORS					       \
+		ASPEED_I2CD_INTR_SLAVE_INACTIVE_TIMEOUT
 #define ASPEED_I2CD_INTR_ALL						       \
-		(ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			       \
+		(ASPEED_I2CD_INTR_SLAVE_INACTIVE_TIMEOUT |		       \
+		 ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			       \
 		 ASPEED_I2CD_INTR_BUS_RECOVER_DONE |			       \
 		 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
 		 ASPEED_I2CD_INTR_ABNORMAL |				       \
@@ -176,6 +185,7 @@ struct aspeed_i2c_bus {
 							   u32 divisor);
 	unsigned long			parent_clk_frequency;
 	u32				bus_frequency;
+	u32				hw_timeout_ms;
 	/* Transaction state. */
 	enum aspeed_i2c_master_state	master_state;
 	struct i2c_msg			*msgs;
@@ -276,6 +286,14 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int aspeed_i2c_check_slave_error(u32 irq_status)
+{
+	if (irq_status & ASPEED_I2CD_INTR_SLAVE_INACTIVE_TIMEOUT)
+		return -EIO;
+
+	return 0;
+}
+
 static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 {
 	u32 command, irq_handled = 0;
@@ -286,6 +304,14 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	if (!slave)
 		return 0;
 
+	if (aspeed_i2c_check_slave_error(irq_status)) {
+		dev_dbg(bus->dev, "received slave error interrupt: 0x%08x\n",
+			irq_status);
+		irq_handled |= (irq_status & ASPEED_I2CD_INTR_SLAVE_ERRORS);
+		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
+		return irq_handled;
+	}
+
 	command = readl(bus->base + ASPEED_I2C_CMD_REG);
 
 	/* Slave was requested, restart state machine. */
@@ -602,7 +628,7 @@ static void aspeed_i2c_next_msg_or_stop(struct aspeed_i2c_bus *bus)
 	}
 }
 
-static int aspeed_i2c_is_irq_error(u32 irq_status)
+static int aspeed_i2c_check_master_error(u32 irq_status)
 {
 	if (irq_status & ASPEED_I2CD_INTR_ARBIT_LOSS)
 		return -EAGAIN;
@@ -633,9 +659,9 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 	 * should clear the command queue effectively taking us back to the
 	 * INACTIVE state.
 	 */
-	ret = aspeed_i2c_is_irq_error(irq_status);
+	ret = aspeed_i2c_check_master_error(irq_status);
 	if (ret) {
-		dev_dbg(bus->dev, "received error interrupt: 0x%08x\n",
+		dev_dbg(bus->dev, "received master error interrupt: 0x%08x\n",
 			irq_status);
 		irq_handled |= (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
 		if (bus->master_state != ASPEED_I2C_MASTER_INACTIVE) {
@@ -1194,6 +1220,7 @@ static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
 /* precondition: bus.lock has been acquired. */
 static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 {
+	u32 timeout_base_divisor, timeout_tick_us, timeout_cycles;
 	u32 divisor, clk_reg_val;
 
 	divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
@@ -1202,8 +1229,46 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 			ASPEED_I2CD_TIME_THDSTA_MASK |
 			ASPEED_I2CD_TIME_TACST_MASK);
 	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor);
+
+	if (bus->hw_timeout_ms) {
+		u8 div_max = ASPEED_I2CD_TIME_TIMEOUT_BASE_DIVISOR_MASK >>
+			     ASPEED_I2CD_TIME_TIMEOUT_BASE_DIVISOR_SHIFT;
+		u8 cycles_max = ASPEED_I2CD_TIMEOUT_CYCLES_MASK >>
+				ASPEED_I2CD_TIMEOUT_CYCLES_SHIFT;
+
+		timeout_base_divisor = 0;
+
+		do {
+			timeout_tick_us = 1000 * (16384 <<
+						  (timeout_base_divisor << 1)) /
+					  (bus->parent_clk_frequency / 1000);
+
+			if (timeout_base_divisor == div_max ||
+			    timeout_tick_us * ASPEED_I2CD_TIMEOUT_CYCLES_MASK >=
+			    bus->hw_timeout_ms * 1000)
+				break;
+		} while (timeout_base_divisor++ < div_max);
+
+		if (timeout_tick_us) {
+			timeout_cycles = DIV_ROUND_UP(bus->hw_timeout_ms * 1000,
+						      timeout_tick_us);
+			if (timeout_cycles == 0)
+				timeout_cycles = 1;
+			else if (timeout_cycles > cycles_max)
+				timeout_cycles = cycles_max;
+		} else {
+			timeout_cycles = 0;
+		}
+	} else {
+		timeout_base_divisor = 0;
+		timeout_cycles = 0;
+	}
+
+	clk_reg_val |= FIELD_PREP(ASPEED_I2CD_TIME_TIMEOUT_BASE_DIVISOR_MASK,
+				  timeout_base_divisor);
+
 	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
-	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
+	writel(timeout_cycles, bus->base + ASPEED_I2C_AC_TIMING_REG2);
 
 	return 0;
 }
@@ -1230,6 +1295,11 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	else
 		fun_ctrl_reg |= ASPEED_I2CD_MULTI_MASTER_DIS;
 
+	device_property_read_u32(&pdev->dev, "aspeed,hw-timeout-ms",
+				 &bus->hw_timeout_ms);
+	if (bus->hw_timeout_ms)
+		fun_ctrl_reg |= ASPEED_I2CD_BUS_AUTO_RECOVERY_EN;
+
 	/* Enable Master Mode */
 	writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) | fun_ctrl_reg,
 	       bus->base + ASPEED_I2C_FUN_CTRL_REG);
-- 
2.23.0

