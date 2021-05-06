Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B29375209
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 12:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbTm22Nk3z3bV4
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 20:07:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbTlW18HBz2yZB;
 Thu,  6 May 2021 20:07:19 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1469pTG0024645;
 Thu, 6 May 2021 17:51:29 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 18:03:17 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Adrian
 Hunter" <adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ryan Chen <ryanchen.aspeed@gmail.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/5] mmc: sdhci-of-aspeed: Assert/Deassert reset signal
 before probing eMMC
Date: Thu, 6 May 2021 18:03:12 +0800
Message-ID: <20210506100312.1638-6-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506100312.1638-1-steven_lee@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1469pTG0024645
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
Cc: ryan_chen@aspeedtech.com, chin-ting_kuo@aspeedtech.com,
 steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

For cleaning up the AST2600 eMMC controller, the reset signal should be
asserted and deasserted before it is probed.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 49 ++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 4979f98ffb52..8ef06f32abff 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include "sdhci-pltfm.h"
@@ -36,9 +37,16 @@
 /* SDIO{14,24} */
 #define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
 
+#define PROBE_AFTER_ASSET_DEASSERT	0x1
+
+struct aspeed_sdc_info {
+	u32 flag;
+};
+
 struct aspeed_sdc {
 	struct clk *clk;
 	struct resource *res;
+	struct reset_control *rst;
 
 	spinlock_t lock;
 	void __iomem *regs;
@@ -78,6 +86,10 @@ struct aspeed_sdhci {
 
 };
 
+struct aspeed_sdc_info ast2600_sdc_info = {
+	.flag = PROBE_AFTER_ASSET_DEASSERT
+};
+
 /*
  * The function sets the mirror register for updating
  * capbilities of the current slot.
@@ -533,11 +545,22 @@ static struct platform_driver aspeed_sdhci_driver = {
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
 	int ret;
 
 	sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
@@ -546,6 +569,23 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
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
@@ -593,15 +633,6 @@ static int aspeed_sdc_remove(struct platform_device *pdev)
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

