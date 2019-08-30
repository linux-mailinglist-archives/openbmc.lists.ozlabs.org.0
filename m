Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5EFA3188
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 09:49:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KWny3P2WzF0Tn
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 17:49:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Gm2vqLZR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gGd/ZFur"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KWl85fhLzDsRY;
 Fri, 30 Aug 2019 17:46:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D68120A34;
 Fri, 30 Aug 2019 03:46:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 03:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2Kccgmz9rjelR
 IO9aczulPQlBm48n9tsTFBim9C8Ml0=; b=Gm2vqLZREqLxAukDM2yV1i9iRpLfD
 kGEaAs8Or3YMclJd02jJ/gWPn+ixd82VkTgoIgv5rDbSoh0tdu9mMFLCIrQabSrJ
 t0JP8ZnYtiJ7/4tEZQUDc0kFBR1qxJWYRk7/GB9QxKhX4u4MFvRKHJ50ICU1NhU9
 dhepCKIw+dM3jSCVp844BFWK6iHbN2W1VYtCLwClOFwQQNE67MgI7qAvTPSba8QU
 0tM/q00t2Jahn1e2zEayOEgmHDitp158M6csj43vdXwF+W+R+vba5dUBdLL0mhn8
 DJVpWUzhp83qi+hDZGgIwPw/NTY5u47E9SAEWLCUEgo5cDVhyUjVT2FSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2Kccgmz9rjelRIO9aczulPQlBm48n9tsTFBim9C8Ml0=; b=gGd/ZFur
 YFw1xQhxP0fenQwUuAJeUJ9AT7Z86GjJCtNWV7jp8s2f0OkCFjrDM54UheVpcvhA
 VBzzRGbtOQb+/1r/SxJwf42YPfQA6ysXEI+xvwkYrkLF1SQwTV52NYQzv/5sTsAo
 sfiVJ8QFx8FsiWHdAap09KGlbxeZXoQUCWFzykDBG3YiQQc5yJKRbbgFJsd2ivEH
 Ypp33OTOT6dKZMNtCAP725KG4t6IyMokaVXRRKA2C2x3xXr9NyHrt4oss/tUg9Hq
 TL0L19WM5fXfTXS63dx2y9VDgY2OaJta9h2zTC2h4jnXonPISmh74ck7S7FnJ4nD
 xv+ILEoNi1cRdg==
X-ME-Sender: <xms:YtRoXW5coA30Yg9-8ujHS4OCJT0dOkZzBQESCUuxdq7GRpB5lXvL7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeifedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfu
 ihiivgeptd
X-ME-Proxy: <xmx:YtRoXbRhpxaTEEZY-MQ__dgsXKyp9mTTATLlEPrVUWABIn62YcCMMQ>
 <xmx:YtRoXTNUZEAS98Uur4qxtkIG_a9MjoqWPBx_bxYHmqq5YwORKn_O6Q>
 <xmx:YtRoXZrikDXWjnbU3CF2bWYcvLIjwdhp-Ddty2rbYsBMqKZvAP1GkA>
 <xmx:YtRoXcKKvyBVr4a9so2vV2qm05RAkgmdr1XO74g7wKsXnf_UUOgNmg>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14361D60057;
 Fri, 30 Aug 2019 03:46:38 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH 2/2] mmc: sdhci-of-aspeed: Allow max-frequency limitation of
 SDCLK
Date: Fri, 30 Aug 2019 17:16:44 +0930
Message-Id: <20190830074644.10936-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830074644.10936-1-andrew@aj.id.au>
References: <20190830074644.10936-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ulf.hansson@linaro.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 ryanchen.aspeed@gmail.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a get_max_clock() handler to sdhci-of-aspeed to report f_max as the
maximum clock rate if it is set. This enables artificial limitation of
the bus speed via max-frequency in the devicetree for e.g. the AST2600
evaluation board where I am seeing errors at 200MHz.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index a9175ca85696..5cc00abcd71f 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -52,16 +52,24 @@ static void aspeed_sdc_configure_8bit_mode(struct aspeed_sdc *sdc,
 
 static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 {
+	struct sdhci_pltfm_host *pltfm_host;
+	unsigned long parent;
 	int div;
 	u16 clk;
 
+	pltfm_host = sdhci_priv(host);
+	parent = clk_get_rate(pltfm_host->clk);
+
 	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
 
 	if (clock == 0)
 		goto out;
 
+	if (WARN_ON(clock > host->max_clk))
+		clock = host->max_clk;
+
 	for (div = 1; div < 256; div *= 2) {
-		if ((host->max_clk / div) <= clock)
+		if ((parent / div) <= clock)
 			break;
 	}
 	div >>= 1;
@@ -74,6 +82,14 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	host->clock = clock;
 }
 
+static unsigned int aspeed_sdhci_get_max_clock(struct sdhci_host *host)
+{
+	if (host->mmc->f_max)
+		return host->mmc->f_max;
+
+	return sdhci_pltfm_clk_get_max_clock(host);
+}
+
 static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int width)
 {
 	struct sdhci_pltfm_host *pltfm_priv;
@@ -100,7 +116,7 @@ static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int width)
 
 static const struct sdhci_ops aspeed_sdhci_ops = {
 	.set_clock = aspeed_sdhci_set_clock,
-	.get_max_clock = sdhci_pltfm_clk_get_max_clock,
+	.get_max_clock = aspeed_sdhci_get_max_clock,
 	.set_bus_width = aspeed_sdhci_set_bus_width,
 	.get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
 	.reset = sdhci_reset,
-- 
2.20.1

