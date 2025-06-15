Return-Path: <openbmc+bounces-224-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B9EADA49A
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jq48ybz2yGf;
	Mon, 16 Jun 2025 09:21:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960224;
	cv=none; b=GT1dxbCHjoiggIW4zEOXDbx39HbUpwcCLwI+urUXorm8f+3kbPGC4bBsbAsZB+8JTUUtE8nPkk1VkARMSSaqcs9IhK0GPLH7EdN0qQXVKcIy8CuNhDCUKaAUQ4M2NX/P9PBC06tw+yk0G4FWhld1xDZMlUjJVWc54c0fLhs/33Xg7ez/DFQ3QvRWPCwFtEcix5i6RWjGy3SEEgmp7pTne3g8kSQpiw7IVp7U0txtfMRrUGEte0FQvSyKgTfBS4AEUGjcIf/g+DAz3wPAXLW2hudSR2yivYZWxHiGJYCwNxrAgJAzCJqcCPxDJyvfwujuELLe4Ou3CzgrRCLuc1BKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960224; c=relaxed/relaxed;
	bh=xfUBJDYJ2I6crEayuJt5YmTaQirmf4oh1DOphkDbxAI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cU8PNePHgftDKZx0TAEH5KX2V80W5N/4TVotZvKEmgYcCSc/+RgWO8QvCCRMqS09osKXHlV2thJpn1JImXPHQYwm7cgA/65GpyromWgeEM0gpBwyscUiXDqI8sgtETzz0HUAwGEMyZbE13Ey9EDQ6HpCYnynFRHUE30y4gMAGe+PQAPd+v/txSX+caAP4KCY7LA3xRfVh0NC6KRJHKz94tnoOEmogo8jKd++Smrw0yuNw7ngEa5sLPF9m6IzPfSlV4yrbOjoheykwgdAKMdsndcd6aQPTJNpWh8ZEZVkQ9T4CUuP1tFCQ9Pvw2ZbSqg5gMvvwT27txx9sNzJxMowPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfdC3tF0z30VR;
	Sun, 15 Jun 2025 14:03:43 +1000 (AEST)
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
Subject: [PATCH 3/8] mmc: sdhci-of-aspeed: Patch HOST_CONTROL2 register missing after top reset
Date: Sun, 15 Jun 2025 11:57:58 +0800
Message-ID: <20250615035803.3752235-4-cool_lee@aspeedtech.com>
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

HOST_CONTROL2 register will be cleared after top reset,
it needs to be saved/resotred while reset.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 5e5ae1894456..10160a706334 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -336,14 +336,15 @@ static void aspeed_sdhci_reset(struct sdhci_host *host, u8 mask)
 	struct sdhci_pltfm_host *pltfm_priv;
 	struct aspeed_sdhci *aspeed_sdhci;
 	struct aspeed_sdc *aspeed_sdc;
-	u32 save_array[7];
+	u32 save_array[8];
 	u32 reg_array[] = {SDHCI_DMA_ADDRESS,
 			SDHCI_BLOCK_SIZE,
 			SDHCI_ARGUMENT,
 			SDHCI_HOST_CONTROL,
 			SDHCI_CLOCK_CONTROL,
 			SDHCI_INT_ENABLE,
-			SDHCI_SIGNAL_ENABLE};
+			SDHCI_SIGNAL_ENABLE,
+			SDHCI_AUTO_CMD_STATUS};
 	int i;
 	u16 tran_mode;
 	u32 mmc8_mode;
-- 
2.34.1


