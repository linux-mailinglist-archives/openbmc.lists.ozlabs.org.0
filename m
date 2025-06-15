Return-Path: <openbmc+bounces-220-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8DADA492
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:21:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jl6d95z30Lt;
	Mon, 16 Jun 2025 09:21:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960222;
	cv=none; b=kDlSy+qq/M7yYViU3e8MuceV8Yx0QvwoRinxpFN6L24PI+kUd+26Af88LLi6Y/RNwWcGTP+bom46poHpOVZEX/2LJJNZpSdB5fPUBL3bAeD64zH9k2W0JRjne5F3oMz4y13imh9SxuTtEBJVn3bAXR8cguuPsYCKt+auKjZ1WdDQGXHelOb3ao9HIL84PFbNTogTB+Md29GF5yEsuhb+TDosto7QI098M7rAUhi1+Fh4aNKwLu32ThFoWHCYG6T7KhlHwmy2DXls7LpFCNkjlvMbNZbQ4sXVeHK80kcgDcEphGgvM5nz7jXh/eIFqHc70EXkp51r6kZ7bzHDNjkUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960222; c=relaxed/relaxed;
	bh=WadW5Q5MaJQ9UA0d2WImQMezQ1r1N9kma4ilsq3MF3M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EahvhUNdDzyixkJzdsmiQXaXkmLWITZJh0XSB1J7xO01V7VdLAD9KGSBOirC60e9Q6BuvaFVJEFLuik5qQjkiUx1YciiRg+ejcFqhuOxjd5QBj0LL8kQel9vCo+3gokLf4u1Nwyd1BpmSHbaHeLpGWkbX/SDUx9h152GFXzEOGg16njTypDIoeD6cHTwTmCc9XSyNtF46PoabjGaOvdVIzWCnTVFHQFQJjpNyjntxo8bcpFmbGuNG9Q0L1lFZuebKIIJc/LVKF0gLieymua8Rz8VYiu3b0eHzIU4kc/K3POwbagV+VQUrI0h4jlmMVB6BzakQDOihl4imwU0MI28Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfdB1hPZz30Sx;
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
Subject: [PATCH 1/8] mmc: sdhci-of-aspeed: Fix sdhci software reset can't be cleared issue.
Date: Sun, 15 Jun 2025 11:57:56 +0800
Message-ID: <20250615035803.3752235-2-cool_lee@aspeedtech.com>
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

Replace sdhci software reset by scu reset from top.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 55 +++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index d6de010551b9..01bc574272eb 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include "sdhci-pltfm.h"
@@ -39,6 +40,7 @@
 struct aspeed_sdc {
 	struct clk *clk;
 	struct resource *res;
+	struct reset_control *rst;
 
 	spinlock_t lock;
 	void __iomem *regs;
@@ -328,13 +330,58 @@ static u32 aspeed_sdhci_readl(struct sdhci_host *host, int reg)
 	return val;
 }
 
+static void aspeed_sdhci_reset(struct sdhci_host *host, u8 mask)
+{
+	struct sdhci_pltfm_host *pltfm_priv;
+	struct aspeed_sdhci *aspeed_sdhci;
+	struct aspeed_sdc *aspeed_sdc;
+	u32 save_array[7];
+	u32 reg_array[] = {SDHCI_DMA_ADDRESS,
+			SDHCI_BLOCK_SIZE,
+			SDHCI_ARGUMENT,
+			SDHCI_HOST_CONTROL,
+			SDHCI_CLOCK_CONTROL,
+			SDHCI_INT_ENABLE,
+			SDHCI_SIGNAL_ENABLE};
+	int i;
+	u16 tran_mode;
+	u32 mmc8_mode;
+
+	pltfm_priv = sdhci_priv(host);
+	aspeed_sdhci = sdhci_pltfm_priv(pltfm_priv);
+	aspeed_sdc = aspeed_sdhci->parent;
+
+	if (!IS_ERR(aspeed_sdc->rst)) {
+		for (i = 0; i < ARRAY_SIZE(reg_array); i++)
+			save_array[i] = sdhci_readl(host, reg_array[i]);
+
+		tran_mode = sdhci_readw(host, SDHCI_TRANSFER_MODE);
+		mmc8_mode = readl(aspeed_sdc->regs);
+
+		reset_control_assert(aspeed_sdc->rst);
+		mdelay(1);
+		reset_control_deassert(aspeed_sdc->rst);
+		mdelay(1);
+
+		for (i = 0; i < ARRAY_SIZE(reg_array); i++)
+			sdhci_writel(host, save_array[i], reg_array[i]);
+
+		sdhci_writew(host, tran_mode, SDHCI_TRANSFER_MODE);
+		writel(mmc8_mode, aspeed_sdc->regs);
+
+		aspeed_sdhci_set_clock(host, host->clock);
+	}
+
+	sdhci_reset(host, mask);
+}
+
 static const struct sdhci_ops aspeed_sdhci_ops = {
 	.read_l = aspeed_sdhci_readl,
 	.set_clock = aspeed_sdhci_set_clock,
 	.get_max_clock = aspeed_sdhci_get_max_clock,
 	.set_bus_width = aspeed_sdhci_set_bus_width,
 	.get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
-	.reset = sdhci_reset,
+	.reset = aspeed_sdhci_reset,
 	.set_uhs_signaling = sdhci_set_uhs_signaling,
 };
 
@@ -535,6 +582,12 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sdc->lock);
 
+	sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
+	if (!IS_ERR(sdc->rst)) {
+		reset_control_assert(sdc->rst);
+		reset_control_deassert(sdc->rst);
+	}
+
 	sdc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(sdc->clk))
 		return PTR_ERR(sdc->clk);
-- 
2.34.1


