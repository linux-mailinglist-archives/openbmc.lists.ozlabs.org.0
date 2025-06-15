Return-Path: <openbmc+bounces-225-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E246AADA49C
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:22:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jq5Crmz30KY;
	Mon, 16 Jun 2025 09:21:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960226;
	cv=none; b=obVdwyNjCKQRp/cTdudMqCLDOXRulDccOQEv99otdDL1aOjWC7lyXb3wh3qBUUonk6NsW6yWhulkjkyGxRrjef5PSXd1jdp8tse4xiEJZbUC/9NGHs3sGcF0Ek5Jt44ec7O5wZkcazaeYQ2CEkkyZTrT/pnK4eCijj6zzQCvKHQFSWbVIZaTcBLEGmx3/EHBjj5KtlreePgxa2spwaZG+0oRtYP7DGt5gzdZhc80DCu+fvvnNysSNgZnDsKMcJ3cipSToBQFK58v8u1HERa7/4VqNb8hjLDMV0yRm1heisjWHbKhB8SKkCJVccMMj5e4f7r7lKkpMt/Xfsun1iyf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960226; c=relaxed/relaxed;
	bh=77Me1yNJKKHFc8QWLnkbu5mgdELFUzXcCZkdinSW6yY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0tbstvzV3tIfTYKPZvYlltKM0ZYY0B+WfysVOUv1GTpRFh6p2JAQBgHLoXeWfn0vlj5rEVulXIbLUQLg6tdN5f7ufNCnV/CaGk1I9ycSg1Hr6uhoVucqSVM3Ys0m2DgpNn7jJ1G3w4OleLdu7SJpM4xQp9cGwcj1XsjNQ2ttBpZPf82692fqiAyZT1SIMVg4v9sRDDbApfBlUmObRHIfxfRr4ZUn7RXjJHFkoHf/2aWLUkx8BM/JtTa/4wEx8/jksbId9dno2e3xal3HQp6kuJF/jIanicPWdXH0HPv7vjEcjCj7PlgZJK1rRH3xfYiix8oLam5ogojT04rUHk0+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfdG13Ltz3bV6;
	Sun, 15 Jun 2025 14:03:46 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:04 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:04 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
Date: Sun, 15 Jun 2025 11:58:02 +0800
Message-ID: <20250615035803.3752235-8-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The timing phase is no more needed since the auto tuning is applied.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 178 +----------------------------
 1 file changed, 3 insertions(+), 175 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 92687fc30d1d..365c02215273 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -34,6 +34,9 @@
 #define   ASPEED_SDC_S0_PHASE_OUT_EN	GENMASK(1, 0)
 #define   ASPEED_SDC_PHASE_MAX		31
 
+#define ASPEED_SDHCI_TAP_PARAM_INVERT_CLK	BIT(4)
+#define ASPEED_SDHCI_NR_TAPS		15
+
 /* SDIO{10,20} */
 #define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
 /* SDIO{14,24} */
@@ -48,37 +51,14 @@ struct aspeed_sdc {
 	void __iomem *regs;
 };
 
-struct aspeed_sdhci_tap_param {
-	bool valid;
-
-#define ASPEED_SDHCI_TAP_PARAM_INVERT_CLK	BIT(4)
-	u8 in;
-	u8 out;
-};
-
-struct aspeed_sdhci_tap_desc {
-	u32 tap_mask;
-	u32 enable_mask;
-	u8 enable_value;
-};
-
-struct aspeed_sdhci_phase_desc {
-	struct aspeed_sdhci_tap_desc in;
-	struct aspeed_sdhci_tap_desc out;
-};
-
 struct aspeed_sdhci_pdata {
 	unsigned int clk_div_start;
-	const struct aspeed_sdhci_phase_desc *phase_desc;
-	size_t nr_phase_descs;
 };
 
 struct aspeed_sdhci {
 	const struct aspeed_sdhci_pdata *pdata;
 	struct aspeed_sdc *parent;
 	u32 width_mask;
-	struct mmc_clk_phase_map phase_map;
-	const struct aspeed_sdhci_phase_desc *phase_desc;
 };
 
 /*
@@ -129,114 +109,6 @@ static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
 	spin_unlock(&sdc->lock);
 }
 
-static u32
-aspeed_sdc_set_phase_tap(const struct aspeed_sdhci_tap_desc *desc,
-			 u8 tap, bool enable, u32 reg)
-{
-	reg &= ~(desc->enable_mask | desc->tap_mask);
-	if (enable) {
-		reg |= tap << __ffs(desc->tap_mask);
-		reg |= desc->enable_value << __ffs(desc->enable_mask);
-	}
-
-	return reg;
-}
-
-static void
-aspeed_sdc_set_phase_taps(struct aspeed_sdc *sdc,
-			  const struct aspeed_sdhci_phase_desc *desc,
-			  const struct aspeed_sdhci_tap_param *taps)
-{
-	u32 reg;
-
-	spin_lock(&sdc->lock);
-	reg = readl(sdc->regs + ASPEED_SDC_PHASE);
-
-	reg = aspeed_sdc_set_phase_tap(&desc->in, taps->in, taps->valid, reg);
-	reg = aspeed_sdc_set_phase_tap(&desc->out, taps->out, taps->valid, reg);
-
-	writel(reg, sdc->regs + ASPEED_SDC_PHASE);
-	spin_unlock(&sdc->lock);
-}
-
-#define PICOSECONDS_PER_SECOND		1000000000000ULL
-#define ASPEED_SDHCI_NR_TAPS		15
-/* Measured value with *handwave* environmentals and static loading */
-#define ASPEED_SDHCI_MAX_TAP_DELAY_PS	1253
-static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
-				     int phase_deg)
-{
-	u64 phase_period_ps;
-	u64 prop_delay_ps;
-	u64 clk_period_ps;
-	unsigned int tap;
-	u8 inverted;
-
-	phase_deg %= 360;
-
-	if (phase_deg >= 180) {
-		inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
-		phase_deg -= 180;
-		dev_dbg(dev,
-			"Inverting clock to reduce phase correction from %d to %d degrees\n",
-			phase_deg + 180, phase_deg);
-	} else {
-		inverted = 0;
-	}
-
-	prop_delay_ps = ASPEED_SDHCI_MAX_TAP_DELAY_PS / ASPEED_SDHCI_NR_TAPS;
-	clk_period_ps = div_u64(PICOSECONDS_PER_SECOND, (u64)rate_hz);
-	phase_period_ps = div_u64((u64)phase_deg * clk_period_ps, 360ULL);
-
-	tap = div_u64(phase_period_ps, prop_delay_ps);
-	if (tap > ASPEED_SDHCI_NR_TAPS) {
-		dev_dbg(dev,
-			 "Requested out of range phase tap %d for %d degrees of phase compensation at %luHz, clamping to tap %d\n",
-			 tap, phase_deg, rate_hz, ASPEED_SDHCI_NR_TAPS);
-		tap = ASPEED_SDHCI_NR_TAPS;
-	}
-
-	return inverted | tap;
-}
-
-static void
-aspeed_sdhci_phases_to_taps(struct device *dev, unsigned long rate,
-			    const struct mmc_clk_phase *phases,
-			    struct aspeed_sdhci_tap_param *taps)
-{
-	taps->valid = phases->valid;
-
-	if (!phases->valid)
-		return;
-
-	taps->in = aspeed_sdhci_phase_to_tap(dev, rate, phases->in_deg);
-	taps->out = aspeed_sdhci_phase_to_tap(dev, rate, phases->out_deg);
-}
-
-static void
-aspeed_sdhci_configure_phase(struct sdhci_host *host, unsigned long rate)
-{
-	struct aspeed_sdhci_tap_param _taps = {0}, *taps = &_taps;
-	struct mmc_clk_phase *params;
-	struct aspeed_sdhci *sdhci;
-	struct device *dev;
-
-	dev = mmc_dev(host->mmc);
-	sdhci = sdhci_pltfm_priv(sdhci_priv(host));
-
-	if (!sdhci->phase_desc)
-		return;
-
-	params = &sdhci->phase_map.phase[host->timing];
-	aspeed_sdhci_phases_to_taps(dev, rate, params, taps);
-	aspeed_sdc_set_phase_taps(sdhci->parent, sdhci->phase_desc, taps);
-	dev_dbg(dev,
-		"Using taps [%d, %d] for [%d, %d] degrees of phase correction at %luHz (%d)\n",
-		taps->in & ASPEED_SDHCI_NR_TAPS,
-		taps->out & ASPEED_SDHCI_NR_TAPS,
-		params->in_deg, params->out_deg, rate, host->timing);
-}
-
 static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host;
@@ -287,8 +159,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 
 	clk = div << SDHCI_DIVIDER_SHIFT;
 
-	aspeed_sdhci_configure_phase(host, bus);
-
 	sdhci_enable_clk(host, clk);
 }
 
@@ -550,14 +420,6 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 	else if (slot >= 2)
 		return -EINVAL;
 
-	if (slot < dev->pdata->nr_phase_descs) {
-		dev->phase_desc = &dev->pdata->phase_desc[slot];
-	} else {
-		dev_info(&pdev->dev,
-			 "Phase control not supported for slot %d\n", slot);
-		dev->phase_desc = NULL;
-	}
-
 	dev->width_mask = !slot ? ASPEED_SDC_S0_MMC8 : ASPEED_SDC_S1_MMC8;
 
 	dev_info(&pdev->dev, "Configured for slot %d\n", slot);
@@ -589,9 +451,6 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_sdhci_add;
 
-	if (dev->phase_desc)
-		mmc_of_parse_clk_phase(&pdev->dev, &dev->phase_map);
-
 	ret = sdhci_add_host(host);
 	if (ret)
 		goto err_sdhci_add;
@@ -624,39 +483,8 @@ static const struct aspeed_sdhci_pdata ast2400_sdhci_pdata = {
 	.clk_div_start = 2,
 };
 
-static const struct aspeed_sdhci_phase_desc ast2600_sdhci_phase[] = {
-	/* SDHCI/Slot 0 */
-	[0] = {
-		.in = {
-			.tap_mask = ASPEED_SDC_S0_PHASE_IN,
-			.enable_mask = ASPEED_SDC_S0_PHASE_IN_EN,
-			.enable_value = 1,
-		},
-		.out = {
-			.tap_mask = ASPEED_SDC_S0_PHASE_OUT,
-			.enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN,
-			.enable_value = 3,
-		},
-	},
-	/* SDHCI/Slot 1 */
-	[1] = {
-		.in = {
-			.tap_mask = ASPEED_SDC_S1_PHASE_IN,
-			.enable_mask = ASPEED_SDC_S1_PHASE_IN_EN,
-			.enable_value = 1,
-		},
-		.out = {
-			.tap_mask = ASPEED_SDC_S1_PHASE_OUT,
-			.enable_mask = ASPEED_SDC_S1_PHASE_OUT_EN,
-			.enable_value = 3,
-		},
-	},
-};
-
 static const struct aspeed_sdhci_pdata ast2600_sdhci_pdata = {
 	.clk_div_start = 1,
-	.phase_desc = ast2600_sdhci_phase,
-	.nr_phase_descs = ARRAY_SIZE(ast2600_sdhci_phase),
 };
 
 static const struct of_device_id aspeed_sdhci_of_match[] = {
-- 
2.34.1


