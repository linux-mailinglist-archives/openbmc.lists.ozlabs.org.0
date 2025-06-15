Return-Path: <openbmc+bounces-222-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE280ADA496
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jn5xc5z30Qk;
	Mon, 16 Jun 2025 09:21:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960225;
	cv=none; b=nYPw6hC/1EccNIfKeB8IfhvcI6dFCQo4Z4khvjpVzw4IOqzWaKge45LAohdJtz6hv77kSNXDwu52YnxHc7ZT7Pet1ir+8A43EFzUF6y9tisrZAMdtAf7U8WOfiHJpPvntkcypUk9elcg0YYN0Bk8846ktwGTdQBBWatay9qsPjz4EWiAenf/5vaCz8uSlzEbcBgsYNn18sI28Di1J/1uFioAvd3P67rfrDeZ6dUll4gyOUufVhzsmQV486VN6NgAksCHyt9hlvhLXxuTjGLKjbcSob9iS+Z+jL7KKyEZJt6ixUCAvavHIodx83tJ/MSMpC/C5AbrYVgW8QpCab2hvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960225; c=relaxed/relaxed;
	bh=27GsQHQT/FiRpIjnk0QogelmG/F5tQ0Uf+x20DOStik=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vh2HnodIcx7vkPBBZVBzyQutQbTMFmKQdzOWJ5f9FqhQtutCopicqrU8SUB3CrNGg8T0j3ZQJ40h5AeHkvLZGuK2N0o3Z++/P4MIogmIv4SBWmMoZqSWWFIdzN6FLPvSkpc56c+2logRbGOtkqGJKjtjuBtGYlaA3F5fvkSYBgSbgYo4FYJvhKE7xiF1QArgIchvFBd4QDkBcCifuz1PaWaJ+9SYY28ASu8IT3zU4zgaY7K08f4Sfe6f8tCC3EwEUuovIioCHqABxeT/freNypngrCT5NnFOwCXHzUmJE09qrlR5xcLKWozhod4dfjYCIWb+kAmEJmMHZBRweZwmnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfdF3YjPz30Wg;
	Sun, 15 Jun 2025 14:03:45 +1000 (AEST)
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
Subject: [PATCH 6/8] mmc: sdhci-of-aspeed: Add output timing phase tuning
Date: Sun, 15 Jun 2025 11:58:01 +0800
Message-ID: <20250615035803.3752235-7-cool_lee@aspeedtech.com>
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

Enhance auto tuning with input and output calibration.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 48 ++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 22dde915e51b..92687fc30d1d 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -25,6 +25,7 @@
 #define   ASPEED_SDC_S1_PHASE_IN	GENMASK(25, 21)
 #define   ASPEED_SDC_S0_PHASE_IN	GENMASK(20, 16)
 #define   ASPEED_SDC_S0_PHASE_IN_SHIFT  16
+#define   ASPEED_SDC_S0_PHASE_OUT_SHIFT 3
 #define   ASPEED_SDC_S1_PHASE_OUT	GENMASK(15, 11)
 #define   ASPEED_SDC_S1_PHASE_IN_EN	BIT(10)
 #define   ASPEED_SDC_S1_PHASE_OUT_EN	GENMASK(9, 8)
@@ -422,7 +423,7 @@ static int aspeed_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 		}
 
 		window = right - left;
-		dev_info(dev, "tuning window = %d\n", window);
+		dev_dbg(dev, "tuning window[%d][%d~%d] = %d\n", edge, left, right, window);
 
 		if (window > oldwindow) {
 			oldwindow = window;
@@ -433,7 +434,50 @@ static int aspeed_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 	val = (out_phase | enable_mask | (center << ASPEED_SDC_S0_PHASE_IN_SHIFT));
 	writel(val, sdc->regs + ASPEED_SDC_PHASE);
 
-	dev_info(dev, "tuning result=%x\n", val);
+	dev_dbg(dev, "input tuning result=%x\n", val);
+
+	inverted = 0;
+	out_phase = val & ~ASPEED_SDC_S0_PHASE_OUT;
+	in_phase = out_phase;
+	oldwindow = 0;
+
+	for (edge = 0; edge < 2; edge++) {
+		if (edge == 1)
+			inverted = ASPEED_SDHCI_TAP_PARAM_INVERT_CLK;
+
+		val = (in_phase | enable_mask | (inverted << ASPEED_SDC_S0_PHASE_OUT_SHIFT));
+
+		/* find the left boundary */
+		for (left = 0; left < ASPEED_SDHCI_NR_TAPS + 1; left++) {
+			out_phase = val | (left << ASPEED_SDC_S0_PHASE_OUT_SHIFT);
+			writel(out_phase, sdc->regs + ASPEED_SDC_PHASE);
+
+			if (!mmc_send_tuning(host->mmc, opcode, NULL))
+				break;
+		}
+
+		/* find the right boundary */
+		for (right = left + 1; right < ASPEED_SDHCI_NR_TAPS + 1; right++) {
+			out_phase = val | (right << ASPEED_SDC_S0_PHASE_OUT_SHIFT);
+			writel(out_phase, sdc->regs + ASPEED_SDC_PHASE);
+
+			if (mmc_send_tuning(host->mmc, opcode, NULL))
+				break;
+		}
+
+		window = right - left;
+		dev_info(dev, "tuning window[%d][%d~%d] = %d\n", edge, left, right, window);
+
+		if (window > oldwindow) {
+			oldwindow = window;
+			center = (((right - 1) + left) / 2) | inverted;
+		}
+	}
+
+	val = (in_phase | enable_mask | (center << ASPEED_SDC_S0_PHASE_OUT_SHIFT));
+	writel(val, sdc->regs + ASPEED_SDC_PHASE);
+
+	dev_dbg(dev, "output tuning result=%x\n", val);
 
 	return mmc_send_tuning(host->mmc, opcode, NULL);
 }
-- 
2.34.1


