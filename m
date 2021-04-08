Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E93357A4B
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 04:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG4nv386tz303t
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 12:24:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1808 seconds by postgrey-1.36 at boromir;
 Thu, 08 Apr 2021 12:23:51 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG4ng57J9z2yZ3;
 Thu,  8 Apr 2021 12:23:49 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 1381hbKJ042160;
 Thu, 8 Apr 2021 09:43:37 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1381gJ1i042079;
 Thu, 8 Apr 2021 09:42:19 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 09:52:24 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Adrian
 Hunter" <adrian.hunter@intel.com>, Ryan Chen <ryanchen.aspeed@gmail.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>, "open
 list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] mmc: sdhci-of-aspeed: Support toggling SD bus signal
 voltage by GPIO
Date: Thu, 8 Apr 2021 09:52:18 +0800
Message-ID: <20210408015218.20560-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210408015218.20560-1-steven_lee@aspeedtech.com>
References: <20210408015218.20560-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1381gJ1i042079
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
Cc: chin-ting_kuo@aspeedtech.com, ryan_chen@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

AST2600-A2 EVB provides reference design to support toggling signal
voltage between 3.3v and 1.8v by power-switch-gpio pin that defined in
the device tree. It also supporting enabling/disabling SD bus power by
power-gpio.

In the reference design, GPIOV0 of AST2600-A2 EVB is connected to power
load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is connected to
a 1.8v and a 3.3v power load switch that providing signal voltage to
SD1 bus.
If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
disabled.
If GPIOV1 is active high, 3.3v power load switch is enabled, SD1 signal
voltage is 3.3v, otherwise, 1.8v power load switch will be enabled, SD1
signal voltage becomes 1.8v.

AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
GPIOV3 as power-switch-gpio.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 155 +++++++++++++++++++++++++----
 1 file changed, 137 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 7d8692e90996..a74a03d37915 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -5,6 +5,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/math64.h>
 #include <linux/mmc/host.h>
@@ -30,6 +31,7 @@
 #define   ASPEED_SDC_S0_PHASE_IN_EN	BIT(2)
 #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
 #define   ASPEED_SDC_PHASE_MAX		31
+#define ASPEED_CLOCK_PHASE 0xf4
 
 struct aspeed_sdc {
 	struct clk *clk;
@@ -58,18 +60,21 @@ struct aspeed_sdhci_phase_desc {
 	struct aspeed_sdhci_tap_desc out;
 };
 
-struct aspeed_sdhci_pdata {
+struct aspeed_sdhci_data {
 	unsigned int clk_div_start;
 	const struct aspeed_sdhci_phase_desc *phase_desc;
 	size_t nr_phase_descs;
+	const struct sdhci_pltfm_data *pdata;
 };
 
 struct aspeed_sdhci {
-	const struct aspeed_sdhci_pdata *pdata;
+	const struct aspeed_sdhci_data *data;
 	struct aspeed_sdc *parent;
 	u32 width_mask;
 	struct mmc_clk_phase_map phase_map;
 	const struct aspeed_sdhci_phase_desc *phase_desc;
+	struct gpio_desc *pwr_pin;
+	struct gpio_desc *pwr_sw_pin;
 };
 
 static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
@@ -209,7 +214,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	sdhci = sdhci_pltfm_priv(pltfm_host);
 
 	parent = clk_get_rate(pltfm_host->clk);
-
 	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
 
 	if (clock == 0)
@@ -234,14 +238,13 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	 * supporting the value 0 in (EMMC12C[7:6], EMMC12C[15:8]), and capture
 	 * the 0-value capability in clk_div_start.
 	 */
-	for (div = sdhci->pdata->clk_div_start; div < 256; div *= 2) {
+	for (div = sdhci->data->clk_div_start; div < 256; div *= 2) {
 		bus = parent / div;
 		if (bus <= clock)
 			break;
 	}
 
 	div >>= 1;
-
 	clk = div << SDHCI_DIVIDER_SHIFT;
 
 	aspeed_sdhci_configure_phase(host, bus);
@@ -292,8 +295,78 @@ static u32 aspeed_sdhci_readl(struct sdhci_host *host, int reg)
 	return val;
 }
 
+static void sdhci_aspeed_set_power(struct sdhci_host *host, unsigned char mode,
+				   unsigned short vdd)
+{
+	struct sdhci_pltfm_host *pltfm_priv = sdhci_priv(host);
+	struct aspeed_sdhci *dev = sdhci_pltfm_priv(pltfm_priv);
+	u8 pwr = 0;
+
+	if (!dev->pwr_pin)
+		return sdhci_set_power(host, mode, vdd);
+
+	if (mode != MMC_POWER_OFF) {
+		switch (1 << vdd) {
+		case MMC_VDD_165_195:
+		/*
+		 * Without a regulator, SDHCI does not support 2.0v
+		 * so we only get here if the driver deliberately
+		 * added the 2.0v range to ocr_avail. Map it to 1.8v
+		 * for the purpose of turning on the power.
+		 */
+		case MMC_VDD_20_21:
+				pwr = SDHCI_POWER_180;
+				break;
+		case MMC_VDD_29_30:
+		case MMC_VDD_30_31:
+				pwr = SDHCI_POWER_300;
+				break;
+		case MMC_VDD_32_33:
+		case MMC_VDD_33_34:
+				pwr = SDHCI_POWER_330;
+				break;
+		default:
+				WARN(1, "%s: Invalid vdd %#x\n",
+				     mmc_hostname(host->mmc), vdd);
+				break;
+		}
+	}
+
+	if (host->pwr == pwr)
+		return;
+
+	host->pwr = pwr;
+
+	if (pwr == 0) {
+		gpiod_set_value(dev->pwr_pin, 0);
+		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
+	} else {
+		gpiod_set_value(dev->pwr_pin, 1);
+
+		if (dev->pwr_sw_pin) {
+			if (pwr & SDHCI_POWER_330)
+				gpiod_set_value(dev->pwr_sw_pin, 1);
+			else if (pwr & SDHCI_POWER_180)
+				gpiod_set_value(dev->pwr_sw_pin, 0);
+		}
+		pwr |= SDHCI_POWER_ON;
+		sdhci_writeb(host, pwr, SDHCI_POWER_CONTROL);
+	}
+}
+
+static void aspeed_sdhci_voltage_switch(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_priv = sdhci_priv(host);
+	struct aspeed_sdhci *dev = sdhci_pltfm_priv(pltfm_priv);
+
+	if (dev->pwr_sw_pin)
+		gpiod_set_value(dev->pwr_sw_pin, 0);
+}
+
 static const struct sdhci_ops aspeed_sdhci_ops = {
 	.read_l = aspeed_sdhci_readl,
+	.set_power = sdhci_aspeed_set_power,
+	.voltage_switch = aspeed_sdhci_voltage_switch,
 	.set_clock = aspeed_sdhci_set_clock,
 	.get_max_clock = aspeed_sdhci_get_max_clock,
 	.set_bus_width = aspeed_sdhci_set_bus_width,
@@ -302,9 +375,14 @@ static const struct sdhci_ops aspeed_sdhci_ops = {
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
 };
 
-static const struct sdhci_pltfm_data aspeed_sdhci_pdata = {
+static const struct sdhci_pltfm_data ast2400_sdhci_pdata = {
 	.ops = &aspeed_sdhci_ops,
 	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+	.quirks2 = SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN | SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+};
+
+static const struct sdhci_pltfm_data ast2600_sdhci_pdata = {
+	.ops = &aspeed_sdhci_ops,
 };
 
 static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
@@ -327,27 +405,28 @@ static inline int aspeed_sdhci_calculate_slot(struct aspeed_sdhci *dev,
 
 static int aspeed_sdhci_probe(struct platform_device *pdev)
 {
-	const struct aspeed_sdhci_pdata *aspeed_pdata;
+	const struct aspeed_sdhci_data *aspeed_data;
 	struct sdhci_pltfm_host *pltfm_host;
 	struct aspeed_sdhci *dev;
 	struct sdhci_host *host;
 	struct resource *res;
+	u32 reg_val;
 	int slot;
 	int ret;
 
-	aspeed_pdata = of_device_get_match_data(&pdev->dev);
-	if (!aspeed_pdata) {
+	aspeed_data = of_device_get_match_data(&pdev->dev);
+	if (!aspeed_data) {
 		dev_err(&pdev->dev, "Missing platform configuration data\n");
 		return -EINVAL;
 	}
 
-	host = sdhci_pltfm_init(pdev, &aspeed_sdhci_pdata, sizeof(*dev));
+	host = sdhci_pltfm_init(pdev, aspeed_data->pdata, sizeof(*dev));
 	if (IS_ERR(host))
 		return PTR_ERR(host);
 
 	pltfm_host = sdhci_priv(host);
 	dev = sdhci_pltfm_priv(pltfm_host);
-	dev->pdata = aspeed_pdata;
+	dev->data = aspeed_data;
 	dev->parent = dev_get_drvdata(pdev->dev.parent);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -358,8 +437,8 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 	else if (slot >= 2)
 		return -EINVAL;
 
-	if (slot < dev->pdata->nr_phase_descs) {
-		dev->phase_desc = &dev->pdata->phase_desc[slot];
+	if (slot < dev->data->nr_phase_descs) {
+		dev->phase_desc = &dev->data->phase_desc[slot];
 	} else {
 		dev_info(&pdev->dev,
 			 "Phase control not supported for slot %d\n", slot);
@@ -372,6 +451,23 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 
 	sdhci_get_of_property(pdev);
 
+	if (of_property_read_bool(pdev->dev.parent->of_node, "mmc-hs200-1_8v") ||
+	    of_property_read_bool(pdev->dev.parent->of_node, "sd-uhs-sdr104")) {
+		reg_val = readl(host->ioaddr + 0x40);
+		/* support 1.8V */
+		reg_val |= BIT(26);
+		/* write to sdhci140 or sdhci240 mirror register */
+		writel(reg_val, dev->parent->regs + (0x10 * (slot + 1)));
+	}
+
+	if (of_property_read_bool(pdev->dev.parent->of_node, "sd-uhs-sdr104")) {
+		reg_val = readl(host->ioaddr + 0x44);
+		/* SDR104 */
+		reg_val |= BIT(1);
+		/* write to sdhci144 or sdhci244 mirror register */
+		writel(reg_val, dev->parent->regs + (0x04 + (slot + 1) * 0x10));
+	}
+
 	pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(pltfm_host->clk))
 		return PTR_ERR(pltfm_host->clk);
@@ -389,6 +485,22 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 	if (dev->phase_desc)
 		mmc_of_parse_clk_phase(host->mmc, &dev->phase_map);
 
+	dev->pwr_pin = devm_gpiod_get(&pdev->dev, "power", GPIOD_OUT_HIGH);
+	if (!IS_ERR(dev->pwr_pin)) {
+		gpiod_set_consumer_name(dev->pwr_pin, "mmc_pwr");
+		gpiod_direction_output(dev->pwr_pin, 1);
+	} else {
+		dev->pwr_pin = NULL;
+	}
+
+	dev->pwr_sw_pin = devm_gpiod_get(&pdev->dev, "power-switch", GPIOD_OUT_HIGH);
+	if (!IS_ERR(dev->pwr_sw_pin)) {
+		gpiod_set_consumer_name(dev->pwr_sw_pin, "mmc_pwr_sw");
+		gpiod_direction_output(dev->pwr_sw_pin, 0);
+	} else {
+		dev->pwr_sw_pin = NULL;
+	}
+
 	ret = sdhci_add_host(host);
 	if (ret)
 		goto err_sdhci_add;
@@ -420,8 +532,9 @@ static int aspeed_sdhci_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct aspeed_sdhci_pdata ast2400_sdhci_pdata = {
+static const struct aspeed_sdhci_data ast2400_sdhci_data = {
 	.clk_div_start = 2,
+	.pdata = &ast2400_sdhci_pdata,
 };
 
 static const struct aspeed_sdhci_phase_desc ast2600_sdhci_phase[] = {
@@ -453,16 +566,17 @@ static const struct aspeed_sdhci_phase_desc ast2600_sdhci_phase[] = {
 	},
 };
 
-static const struct aspeed_sdhci_pdata ast2600_sdhci_pdata = {
+static const struct aspeed_sdhci_data ast2600_sdhci_data = {
 	.clk_div_start = 1,
 	.phase_desc = ast2600_sdhci_phase,
 	.nr_phase_descs = ARRAY_SIZE(ast2600_sdhci_phase),
+	.pdata = &ast2600_sdhci_pdata,
 };
 
 static const struct of_device_id aspeed_sdhci_of_match[] = {
-	{ .compatible = "aspeed,ast2400-sdhci", .data = &ast2400_sdhci_pdata, },
-	{ .compatible = "aspeed,ast2500-sdhci", .data = &ast2400_sdhci_pdata, },
-	{ .compatible = "aspeed,ast2600-sdhci", .data = &ast2600_sdhci_pdata, },
+	{ .compatible = "aspeed,ast2400-sdhci", .data = &ast2400_sdhci_data, },
+	{ .compatible = "aspeed,ast2500-sdhci", .data = &ast2400_sdhci_data, },
+	{ .compatible = "aspeed,ast2600-sdhci", .data = &ast2600_sdhci_data, },
 	{ }
 };
 
@@ -482,6 +596,7 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 	struct device_node *parent, *child;
 	struct aspeed_sdc *sdc;
 	int ret;
+	u32 timing_phase;
 
 	sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
 	if (!sdc)
@@ -506,6 +621,10 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	if (!of_property_read_u32(pdev->dev.of_node,
+				  "timing-phase", &timing_phase))
+		writel(timing_phase, sdc->regs + ASPEED_CLOCK_PHASE);
+
 	dev_set_drvdata(&pdev->dev, sdc);
 
 	parent = pdev->dev.of_node;
-- 
2.17.1

