Return-Path: <openbmc+bounces-227-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AAEADA4A0
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:23:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jt0qg8z30T3;
	Mon, 16 Jun 2025 09:21:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960223;
	cv=none; b=JDhn/2AmaPotqeYXQcUy8WZ7dCTZFItuYneJ1x+apv4AUWj5mj5xMVbF6zq6YL4UqQy+B56b+u28sdPS5pXkuGTrI/VR45ReeANK2zzOmu5aN9/Gd2Q0v9oSlNP1x2Be+0gerzXjP5wKF+JFG3hhpS6lg81b4a4lOqOb+hlWTeSw4HvE0veMvTA2/O3b+d6j+qG017eslXiZT00B4An8pKl6WNmbsa0jbSwtRog/LdFxEUVTv/OMXN8q09Ym+OPijf4q93veXvhGEbwuqCQpZagl+QDLJnuUEOCgXaBeUyM/iK+6d4diNiHnIf1yS4Pa6HoTeoDBOY+HuSv3k+VmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960223; c=relaxed/relaxed;
	bh=re+5s6sOgkPP794UUBeAX30NWnufkF6mDghKiC7da5w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHsOF+ruetqq/ZNVH16f7mg685oMOj3Ys6e9Y5tJx0BeTVUCh60/Bh2VmjILEsYaEbNUSxBQvfMkxMOKlpyerd132h3uwSWrQl63MXqP6vCysM50hs6zc/RD7wULt68SwHGwq2vkSBbN3f3v/v/OmKpLnSRx45FW3kro3yCnZrZtxWNfACYHZUeS5G5kmnRQy6lnPqf6nNiuwpl8mFdG22uKS8Cjlbhhjv568niZv/J9388IaX3yJxpGs+EJ+DSdsFzZwEMMSsYsSDVfWmP5qdN7HM6WkrNDQTxJZu83k817MsyiOaBCYS3g9B+zf2xH5PoXrOS9y/y35vZ0H/mgow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfdB6Nq5z30TY;
	Sun, 15 Jun 2025 14:03:42 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:03 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:03 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/8] mmc: sdhci-of-aspeed: Add runtime tuning
Date: Sun, 15 Jun 2025 11:57:57 +0800
Message-ID: <20250615035803.3752235-3-cool_lee@aspeedtech.com>
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

Add support for runtime tuning in the Aspeed SDHCI driver.
Using the timing phase register to adjust the clock phase with mmc
tuning command to find the left and right boundary.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 68 ++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 01bc574272eb..5e5ae1894456 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -24,6 +24,7 @@
 #define ASPEED_SDC_PHASE		0xf4
 #define   ASPEED_SDC_S1_PHASE_IN	GENMASK(25, 21)
 #define   ASPEED_SDC_S0_PHASE_IN	GENMASK(20, 16)
+#define   ASPEED_SDC_S0_PHASE_IN_SHIFT  16
 #define   ASPEED_SDC_S1_PHASE_OUT	GENMASK(15, 11)
 #define   ASPEED_SDC_S1_PHASE_IN_EN	BIT(10)
 #define   ASPEED_SDC_S1_PHASE_OUT_EN	GENMASK(9, 8)
@@ -375,6 +376,72 @@ static void aspeed_sdhci_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static int aspeed_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
+{
+	struct sdhci_pltfm_host *pltfm_priv;
+	struct aspeed_sdhci *sdhci;
+	struct aspeed_sdc *sdc;
+	struct device *dev;
+
+	u32 val, left, right, edge;
+	u32 window, oldwindow = 0, center;
+	u32 in_phase, out_phase, enable_mask, inverted = 0;
+
+	dev = mmc_dev(host->mmc);
+	pltfm_priv = sdhci_priv(host);
+	sdhci = sdhci_pltfm_priv(pltfm_priv);
+	sdc = sdhci->parent;
+
+	out_phase = readl(sdc->regs + ASPEED_SDC_PHASE) & ASPEED_SDC_S0_PHASE_OUT;
+
+	enable_mask = ASPEED_SDC_S0_PHASE_OUT_EN | ASPEED_SDC_S0_PHASE_IN_EN;
+
+	/*
+	 * There are two window upon clock rising and falling edge.
+	 * Iterate each tap delay to find the valid window and choose the
+	 * bigger one, set the tap delay at the middle of window.
+	 */
+	for (edge = 0; edge < 2; edge++) {
+		if (edge == 1)
+			inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
+
+		val = (out_phase | enable_mask | (inverted << ASPEED_SDC_S0_PHASE_IN_SHIFT));
+
+		/* find the left boundary */
+		for (left = 0; left < ASPEED_SDHCI_NR_TAPS + 1; left++) {
+			in_phase = val | (left << ASPEED_SDC_S0_PHASE_IN_SHIFT);
+			writel(in_phase, sdc->regs + ASPEED_SDC_PHASE);
+
+			if (!mmc_send_tuning(host->mmc, opcode, NULL))
+				break;
+		}
+
+		/* find the right boundary */
+		for (right = left + 1; right < ASPEED_SDHCI_NR_TAPS + 1; right++) {
+			in_phase = val | (right << ASPEED_SDC_S0_PHASE_IN_SHIFT);
+			writel(in_phase, sdc->regs + ASPEED_SDC_PHASE);
+
+			if (mmc_send_tuning(host->mmc, opcode, NULL))
+				break;
+		}
+
+		window = right - left;
+		dev_info(dev, "tuning window = %d\n", window);
+
+		if (window > oldwindow) {
+			oldwindow = window;
+			center = (((right - 1) + left) / 2) | inverted;
+		}
+	}
+
+	val = (out_phase | enable_mask | (center << ASPEED_SDC_S0_PHASE_IN_SHIFT));
+	writel(val, sdc->regs + ASPEED_SDC_PHASE);
+
+	dev_info(dev, "tuning result=%x\n", val);
+
+	return mmc_send_tuning(host->mmc, opcode, NULL);
+}
+
 static const struct sdhci_ops aspeed_sdhci_ops = {
 	.read_l = aspeed_sdhci_readl,
 	.set_clock = aspeed_sdhci_set_clock,
@@ -383,6 +450,7 @@ static const struct sdhci_ops aspeed_sdhci_ops = {
 	.get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
 	.reset = aspeed_sdhci_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
+	.platform_execute_tuning = aspeed_sdhci_execute_tuning,
 };
 
 static const struct sdhci_pltfm_data aspeed_sdhci_pdata = {
-- 
2.34.1


