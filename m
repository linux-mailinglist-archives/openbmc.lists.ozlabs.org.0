Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE3D26B933
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 03:05:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrhjX02wrzDqSN
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 11:05:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=IshQ+GAr; 
 dkim-atps=neutral
X-Greylist: delayed 452 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Sep 2020 04:54:39 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrXTW1gJzzDqP2;
 Wed, 16 Sep 2020 04:54:39 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0C4B3806F7;
 Tue, 15 Sep 2020 11:47:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 0C4B3806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1600195621;
 bh=FJZOAN5p863bC4FM+I+qvDnKOPec7IEYDsPnpusvWKU=;
 h=From:To:Cc:Subject:Date:From;
 b=IshQ+GArRiw/dXPoWZQdc4tiy1LTt+uLkEQtzhFjgCKnZ0MD88YHEgo7DlosaSYWL
 efk5DOCxDBtnSPOPxgv8LC8rhx+6sVJxOiWwDcbqrVLsp2xaKJu+JkNup+D8Wdtk+y
 Ur8dkOjEgjj+VCI5ESwH8o8I0hvWXA/xjKTFys0k=
From: Zev Weiss <zev@bewilderbeest.net>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: aspeed: disable additional device addresses on ast2[56]xx
Date: Tue, 15 Sep 2020 13:45:25 -0500
Message-Id: <20200915184525.29665-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Sep 2020 11:04:59 +1000
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
Cc: Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The ast25xx and ast26xx have, respectively, two and three configurable
slave device addresses to the ast24xx's one.  We only support using
one at a time, but the others may come up in an indeterminate state
depending on hardware/bootloader behavior, so we need to make sure we
disable them so as to avoid ending up with phantom devices on the bus.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/i2c/busses/i2c-aspeed.c | 50 +++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index a7be6f24450b..20028a7a9f67 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -117,6 +117,8 @@
 
 /* 0x18 : I2CD Slave Device Address Register   */
 #define ASPEED_I2CD_DEV_ADDR_MASK			GENMASK(6, 0)
+#define ASPEED_I2CD_DEV_ADDR2_ENABLE			BIT(15)
+#define ASPEED_I2CD_DEV_ADDR3_ENABLE			BIT(23)
 
 enum aspeed_i2c_master_state {
 	ASPEED_I2C_MASTER_INACTIVE,
@@ -139,6 +141,16 @@ enum aspeed_i2c_slave_state {
 	ASPEED_I2C_SLAVE_STOP,
 };
 
+struct aspeed_i2c_model {
+	u32 (*get_clk_reg_val)(struct device *dev, u32 divisor);
+
+	/*
+	 * Some models support multiple device addresses -- we only support
+	 * using one, but we need to disable the others if they're present.
+	 */
+	unsigned int num_device_addrs;
+};
+
 struct aspeed_i2c_bus {
 	struct i2c_adapter		adap;
 	struct device			*dev;
@@ -147,8 +159,7 @@ struct aspeed_i2c_bus {
 	/* Synchronizes I/O mem access to base. */
 	spinlock_t			lock;
 	struct completion		cmd_complete;
-	u32				(*get_clk_reg_val)(struct device *dev,
-							   u32 divisor);
+	const struct aspeed_i2c_model	*model;
 	unsigned long			parent_clk_frequency;
 	u32				bus_frequency;
 	/* Transaction state. */
@@ -726,6 +737,13 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
 	addr_reg_val = readl(bus->base + ASPEED_I2C_DEV_ADDR_REG);
 	addr_reg_val &= ~ASPEED_I2CD_DEV_ADDR_MASK;
 	addr_reg_val |= slave_addr & ASPEED_I2CD_DEV_ADDR_MASK;
+
+	/* Disable additional addresses on hardware that has them. */
+	if (bus->model->num_device_addrs > 1)
+		addr_reg_val &= ~ASPEED_I2CD_DEV_ADDR2_ENABLE;
+	if (bus->model->num_device_addrs > 2)
+		addr_reg_val &= ~ASPEED_I2CD_DEV_ADDR3_ENABLE;
+
 	writel(addr_reg_val, bus->base + ASPEED_I2C_DEV_ADDR_REG);
 
 	/* Turn on slave mode. */
@@ -863,6 +881,11 @@ static u32 aspeed_i2c_24xx_get_clk_reg_val(struct device *dev, u32 divisor)
 	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(2, 0), divisor);
 }
 
+static const struct aspeed_i2c_model aspeed_i2c_24xx_bus = {
+	.get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val,
+	.num_device_addrs = 1,
+};
+
 static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
 {
 	/*
@@ -872,6 +895,16 @@ static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
 	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(3, 0), divisor);
 }
 
+static const struct aspeed_i2c_model aspeed_i2c_25xx_bus = {
+	.get_clk_reg_val = aspeed_i2c_25xx_get_clk_reg_val,
+	.num_device_addrs = 2,
+};
+
+static const struct aspeed_i2c_model aspeed_i2c_26xx_bus = {
+	.get_clk_reg_val = aspeed_i2c_25xx_get_clk_reg_val,
+	.num_device_addrs = 3,
+};
+
 /* precondition: bus.lock has been acquired. */
 static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 {
@@ -882,7 +915,7 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
 			ASPEED_I2CD_TIME_THDSTA_MASK |
 			ASPEED_I2CD_TIME_TACST_MASK);
-	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor);
+	clk_reg_val |= bus->model->get_clk_reg_val(bus->dev, divisor);
 	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
 	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
 
@@ -946,15 +979,15 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
 static const struct of_device_id aspeed_i2c_bus_of_table[] = {
 	{
 		.compatible = "aspeed,ast2400-i2c-bus",
-		.data = aspeed_i2c_24xx_get_clk_reg_val,
+		.data = &aspeed_i2c_24xx_bus,
 	},
 	{
 		.compatible = "aspeed,ast2500-i2c-bus",
-		.data = aspeed_i2c_25xx_get_clk_reg_val,
+		.data = &aspeed_i2c_25xx_bus,
 	},
 	{
 		.compatible = "aspeed,ast2600-i2c-bus",
-		.data = aspeed_i2c_25xx_get_clk_reg_val,
+		.data = &aspeed_i2c_26xx_bus,
 	},
 	{ },
 };
@@ -1002,10 +1035,9 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 
 	match = of_match_node(aspeed_i2c_bus_of_table, pdev->dev.of_node);
 	if (!match)
-		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
+		bus->model = &aspeed_i2c_24xx_bus;
 	else
-		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
-				match->data;
+		bus->model = match->data;
 
 	/* Initialize the I2C adapter */
 	spin_lock_init(&bus->lock);
-- 
2.28.0

