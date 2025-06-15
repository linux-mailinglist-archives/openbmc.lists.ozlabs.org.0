Return-Path: <openbmc+bounces-223-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C2FADA497
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:21:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jp0hwZz30RJ;
	Mon, 16 Jun 2025 09:21:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960224;
	cv=none; b=ltmsr4XsaOMMgj16ypU3H1NSQsQXXE8fqHTld9hKfKn/kGG6IOMyajQTCgCUqsP/zZ2X9xdrrKCNsk9Lcc0lhbXjt8w0wlJm64vy8S9XXNb2pb/kbm8J7o7upyNI5L3We7rGYtAp3wkb2zSihVlcvJjE3u6VO73iYKL/byPobi/zP5KdDY5EXfW7bcZ0I5jRgPaTjDoOgGvc6s+IYKNbk25HriFjWkY3WkeRD5dp/D2BEcA4z59S26htGMHo1yudjNlh985Yc5ZaZWkpUDcmi6FPSoh1x5BmFm4KxbQKoUgkG/aF/hznxTLYKC+psrEMP2Gzs2e1vuJCqOosUenZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960224; c=relaxed/relaxed;
	bh=BK4x4cB+WJA5Tcpx3kDnolPiZgIkuPQYv4xGC4AWVZc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDEA1VBCjr4fmO9RzcbiJFFbehmz2Ry9kSb7Jf4sUcpLMkq8/Os3GMme70WX6kH+2S64v5FiNKFWXMU1O88ZDGiiz6CrQ7MPieSmkNcD3Ntqf8i5eonnmJt8ClNdb9FeSC6cAGy5vs3cnUlH8WVzF6KB8brwMkQdtjyJnKTaPH+DBWqvOHEwEwWS36BEHWW2hbIXzy4RPESRZuQk/OyM6VrRbtSxS4h56yP34WHsmse58mimFpPUX/FC6A2doFiA5awBMKyzBApOU8Pt/dvqDRTC73yDYNfKnzHPgPiK5dHgQ22DW0Va8cLviNxw9Op53vQi3XrVM4mOl14BF1X9WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfdD1DfWz30Vn;
	Sun, 15 Jun 2025 14:03:44 +1000 (AEST)
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
Subject: [PATCH 4/8] mmc: sdhci-of-aspeed: Get max clockk by using default api
Date: Sun, 15 Jun 2025 11:57:59 +0800
Message-ID: <20250615035803.3752235-5-cool_lee@aspeedtech.com>
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

Don't limit clock frequency by f_max.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 10160a706334..2bdd93a3f91f 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -288,14 +288,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	sdhci_enable_clk(host, clk);
 }
 
-static unsigned int aspeed_sdhci_get_max_clock(struct sdhci_host *host)
-{
-	if (host->mmc->f_max)
-		return host->mmc->f_max;
-
-	return sdhci_pltfm_clk_get_max_clock(host);
-}
-
 static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int width)
 {
 	struct sdhci_pltfm_host *pltfm_priv;
@@ -446,7 +438,7 @@ static int aspeed_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 static const struct sdhci_ops aspeed_sdhci_ops = {
 	.read_l = aspeed_sdhci_readl,
 	.set_clock = aspeed_sdhci_set_clock,
-	.get_max_clock = aspeed_sdhci_get_max_clock,
+	.get_max_clock = sdhci_pltfm_clk_get_max_clock,
 	.set_bus_width = aspeed_sdhci_set_bus_width,
 	.get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
 	.reset = aspeed_sdhci_reset,
-- 
2.34.1


