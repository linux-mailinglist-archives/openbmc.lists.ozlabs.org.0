Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D93371072
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 03:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYQmc6Qh9z30BD
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 11:46:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYQm216R4z2yyF;
 Mon,  3 May 2021 11:45:37 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1431WWK8085735;
 Mon, 3 May 2021 09:32:33 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 3 May
 2021 09:44:09 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] mmc: sdhci-of-aspeed: Sync capabilities from device
 tree to ast2600 SoC registers
Date: Mon, 3 May 2021 09:43:36 +0800
Message-ID: <20210503014336.20256-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210503014336.20256-1-steven_lee@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1431WWK8085735
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
Cc: chin-ting_kuo@aspeedtech.com, ryan_chen@aspeedtech.com, Hongweiz@ami.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sync Capbility Registers(SDIO140, SDIO144, SDIO240, SDIO244) of ast2600
SoC from the device tree.
The bit 26(Voltage Support 1.8v) of SDIO140/SDIO240 is set to 1 if
"mmc-hs200-1_8v" or "sd-uhs-sdr104" is added in the device tree.
The bit 1(SDR104 Supported) of SDR144/SDR244 is set to 1 if "sd-uhs-sdr104"
is added in the device tree.
"timing-phase" is synced to SDIO0F4(Colock Phase Control)

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 107 ++++++++++++++++++++++++++---
 1 file changed, 98 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 7d8692e90996..2d755bac777a 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include "sdhci-pltfm.h"
@@ -30,10 +31,18 @@
 #define   ASPEED_SDC_S0_PHASE_IN_EN	BIT(2)
 #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
 #define   ASPEED_SDC_PHASE_MAX		31
+#define ASPEED_SDC_CAP1_1_8V           BIT(26)
+#define ASPEED_SDC_CAP2_SDR104         BIT(1)
+#define PROBE_AFTER_ASSET_DEASSERT     0x1
+
+struct aspeed_sdc_info {
+	u32 flag;
+};
 
 struct aspeed_sdc {
 	struct clk *clk;
 	struct resource *res;
+	struct reset_control *rst;
 
 	spinlock_t lock;
 	void __iomem *regs;
@@ -72,6 +81,44 @@ struct aspeed_sdhci {
 	const struct aspeed_sdhci_phase_desc *phase_desc;
 };
 
+struct aspeed_sdc_info ast2600_sdc_info = {
+	.flag = PROBE_AFTER_ASSET_DEASSERT
+};
+
+/*
+ * The function sets the mirror register for updating
+ * capbilities of the current slot.
+ *
+ *   slot | cap_idx | caps_reg | mirror_reg
+ *   -----|---------|----------|------------
+ *     0  |    0    | SDIO140  |   SDIO10
+ *     0  |    1    | SDIO144  |   SDIO14
+ *     1  |    0    | SDIO240  |   SDIO20
+ *     1  |    1    | SDIO244  |   SDIO24
+ */
+static void aspeed_sdc_set_slot_capability(struct sdhci_host *host,
+					   struct aspeed_sdc *sdc,
+					   u32 reg_val,
+					   u8 slot,
+					   u8 cap_idx)
+{
+	u8 caps_reg_offset;
+	u32 caps_reg;
+	u32 mirror_reg_offset;
+	u32 caps_val;
+
+	if (cap_idx > 1 || slot > 1)
+		return;
+
+	caps_reg_offset = (cap_idx == 0) ? 0 : 4;
+	caps_reg = 0x40 + caps_reg_offset;
+	caps_val = sdhci_readl(host, caps_reg);
+	caps_val |= reg_val;
+	mirror_reg_offset = (slot == 0) ? 0x10 : 0x20;
+	mirror_reg_offset += caps_reg_offset;
+	writel(caps_val, sdc->regs + mirror_reg_offset);
+}
+
 static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
 					   struct aspeed_sdhci *sdhci,
 					   bool bus8)
@@ -329,9 +376,11 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 {
 	const struct aspeed_sdhci_pdata *aspeed_pdata;
 	struct sdhci_pltfm_host *pltfm_host;
+	struct device_node *np = pdev->dev.of_node;
 	struct aspeed_sdhci *dev;
 	struct sdhci_host *host;
 	struct resource *res;
+	u32 reg_val;
 	int slot;
 	int ret;
 
@@ -372,6 +421,21 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 
 	sdhci_get_of_property(pdev);
 
+	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
+	    of_property_read_bool(np, "sd-uhs-sdr104"))
+		aspeed_sdc_set_slot_capability(host,
+					       dev->parent,
+					       ASPEED_SDC_CAP1_1_8V,
+					       slot,
+					       0);
+
+	if (of_property_read_bool(np, "sd-uhs-sdr104"))
+		aspeed_sdc_set_slot_capability(host,
+					       dev->parent,
+					       ASPEED_SDC_CAP2_SDR104,
+					       slot,
+					       1);
+
 	pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(pltfm_host->clk))
 		return PTR_ERR(pltfm_host->clk);
@@ -476,12 +540,25 @@ static struct platform_driver aspeed_sdhci_driver = {
 	.remove		= aspeed_sdhci_remove,
 };
 
+static const struct of_device_id aspeed_sdc_of_match[] = {
+	{ .compatible = "aspeed,ast2400-sd-controller", },
+	{ .compatible = "aspeed,ast2500-sd-controller", },
+	{ .compatible = "aspeed,ast2600-sd-controller", .data = &ast2600_sdc_info},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, aspeed_sdc_of_match);
+
 static int aspeed_sdc_probe(struct platform_device *pdev)
 
 {
 	struct device_node *parent, *child;
 	struct aspeed_sdc *sdc;
+	const struct of_device_id *match = NULL;
+	const struct aspeed_sdc_info *info = NULL;
+
 	int ret;
+	u32 timing_phase;
 
 	sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
 	if (!sdc)
@@ -489,6 +566,23 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sdc->lock);
 
+	match = of_match_device(aspeed_sdc_of_match, &pdev->dev);
+	if (!match)
+		return -ENODEV;
+
+	if (match->data)
+		info = match->data;
+
+	if (info) {
+		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
+			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
+			if (!IS_ERR(sdc->rst)) {
+				reset_control_assert(sdc->rst);
+				reset_control_deassert(sdc->rst);
+			}
+		}
+	}
+
 	sdc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(sdc->clk))
 		return PTR_ERR(sdc->clk);
@@ -506,6 +600,10 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	if (!of_property_read_u32(pdev->dev.of_node,
+				  "timing-phase", &timing_phase))
+		writel(timing_phase, sdc->regs + ASPEED_SDC_PHASE);
+
 	dev_set_drvdata(&pdev->dev, sdc);
 
 	parent = pdev->dev.of_node;
@@ -536,15 +634,6 @@ static int aspeed_sdc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id aspeed_sdc_of_match[] = {
-	{ .compatible = "aspeed,ast2400-sd-controller", },
-	{ .compatible = "aspeed,ast2500-sd-controller", },
-	{ .compatible = "aspeed,ast2600-sd-controller", },
-	{ }
-};
-
-MODULE_DEVICE_TABLE(of, aspeed_sdc_of_match);
-
 static struct platform_driver aspeed_sdc_driver = {
 	.driver		= {
 		.name	= "sd-controller-aspeed",
-- 
2.17.1

