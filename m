Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0F3751F5
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 12:05:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbTjv5tVlz3033
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 20:05:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbTjW3Js3z30Cc;
 Thu,  6 May 2021 20:05:34 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1469pS6x024644;
 Thu, 6 May 2021 17:51:28 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 18:03:16 +0800
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
Subject: [PATCH v3 4/5] mmc: sdhci-of-aspeed: Add a helper for updating
 capability register.
Date: Thu, 6 May 2021 18:03:11 +0800
Message-ID: <20210506100312.1638-5-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506100312.1638-1-steven_lee@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1469pS6x024644
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

The patch add a new function aspeed_sdc_set_slot_capability() for
updating sdhci capability register.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 57 ++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index d001c51074a0..4979f98ffb52 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -31,6 +31,11 @@
 #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
 #define   ASPEED_SDC_PHASE_MAX		31
 
+/* SDIO{10,20} */
+#define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
+/* SDIO{14,24} */
+#define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
+
 struct aspeed_sdc {
 	struct clk *clk;
 	struct resource *res;
@@ -70,8 +75,42 @@ struct aspeed_sdhci {
 	u32 width_mask;
 	struct mmc_clk_phase_map phase_map;
 	const struct aspeed_sdhci_phase_desc *phase_desc;
+
 };
 
+/*
+ * The function sets the mirror register for updating
+ * capbilities of the current slot.
+ *
+ *   slot | capability  | caps_reg | mirror_reg
+ *   -----|-------------|----------|------------
+ *     0  | CAP1_1_8V   | SDIO140  |   SDIO10
+ *     0  | CAP2_SDR104 | SDIO144  |   SDIO14
+ *     1  | CAP1_1_8V   | SDIO240  |   SDIO20
+ *     1  | CAP2_SDR104 | SDIO244  |   SDIO24
+ */
+static void aspeed_sdc_set_slot_capability(struct sdhci_host *host,
+					   struct aspeed_sdc *sdc,
+					   int capability,
+					   bool enable,
+					   u8 slot)
+{
+	u8 cap_reg;
+	u32 mirror_reg_offset, cap_val;
+
+	if (slot > 1)
+		return;
+
+	cap_reg = capability / 32;
+	cap_val = sdhci_readl(host, 0x40 + (cap_reg * 4));
+	if (enable)
+		cap_val |= BIT(capability % 32);
+	else
+		cap_val &= ~BIT(capability % 32);
+	mirror_reg_offset = ((slot + 1) * 0x10) + (cap_reg * 4);
+	writel(cap_val, sdc->regs + mirror_reg_offset);
+}
+
 static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
 					   struct aspeed_sdhci *sdhci,
 					   bool bus8)
@@ -329,6 +368,7 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 {
 	const struct aspeed_sdhci_pdata *aspeed_pdata;
 	struct sdhci_pltfm_host *pltfm_host;
+	struct device_node *np = pdev->dev.of_node;
 	struct aspeed_sdhci *dev;
 	struct sdhci_host *host;
 	struct resource *res;
@@ -372,6 +412,23 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 
 	sdhci_get_of_property(pdev);
 
+	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
+	    of_property_read_bool(np, "sd-uhs-sdr104")) {
+		aspeed_sdc_set_slot_capability(host,
+					       dev->parent,
+					       ASPEED_SDC_CAP1_1_8V,
+					       true,
+					       slot);
+	}
+
+	if (of_property_read_bool(np, "sd-uhs-sdr104")) {
+		aspeed_sdc_set_slot_capability(host,
+					       dev->parent,
+					       ASPEED_SDC_CAP2_SDR104,
+					       true,
+					       slot);
+	}
+
 	pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(pltfm_host->clk))
 		return PTR_ERR(pltfm_host->clk);
-- 
2.17.1

