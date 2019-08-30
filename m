Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7383A3345
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 10:57:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYJw0YGBzDqxB
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 18:57:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TPM7Pe4t"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Bkyifkoq"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYHC5YY7zDqxZ
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 18:56:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 35642220AF;
 Fri, 30 Aug 2019 04:56:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 04:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=qgxOet6Vexw+I
 T/mOjeCHK3/miy/vj59++UWzoy9f4w=; b=TPM7Pe4tFsC4IDIIRrlFeyxTCUoJx
 U8sG47Bh9HRqT+CmnlIhPMAOc6X+WVTGwEWIkKWrLUQGw+qxUP85jNA1mZosFduo
 cwfmIiBeRfbGizyPDpNmDauyoYPRMRbKBvXYXNvHxCMh7+ia8x9O0i5VHxhmcorl
 0lI/32WCAuwAiP+5LFzQ3vYWMep0uazOAiaINQEDGla4mxTGRLW2RcdMyHKf7B39
 RjTbTFKc3NIbnRZNNcaSal1SNYHDCWQqLLmVITJgcQgnPUPbVYvOc6lLNK8ma272
 W8B9tG1b7B3ghNbpoTPKyCmRD+DYpOOj1TeBYvEmoMbtDdEhHDjiSPR7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=qgxOet6Vexw+IT/mOjeCHK3/miy/vj59++UWzoy9f4w=; b=Bkyifkoq
 Lcvu2eB/T+QbksMH5CjgdU1N8BMMPoG7bYrPIJ3Q9n57cxegrjUE5oN3D443Av0F
 nAwaPD6fULaQclumcwp+BR3Eihtk0zfWWndXjE8VmHuak+eVUtor53HwMcun/Jeo
 UddGAwRr+MonYW9RYJbMWMBCjZ7pyIMsFyTuLyxWMZnWvHFKTR8FmXXr1dCk4mBA
 0876h8WZQdVoJwb6n6m+Qpk7wm8gMpn0Gq2N0e98bE8b2TwmB5lciNjLTJ/328Md
 9I/8mMLLgvMu/gTJ3p7Ge5+EZwB8N8j9iuvLjQk55EH4BkXuW9ys5AfJAMq7FFPC
 ta9uVvOFYmUNMw==
X-ME-Sender: <xms:peRoXQJCfUEiQPhSzK6NcVFOfnPT07I4FiPUkRJata6ataXT9F__Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepvddtfe
 drheejrddvudehrddujeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:peRoXXN91sEKUsh5POMiSklOekSvSHte2xf-Ltzx9ZCFCaWZMXRJdg>
 <xmx:peRoXYbd1qZjtCPtN8CcOGWNsAosjpETE2PLETzdRpQrVNumwxdyAA>
 <xmx:peRoXTxqGUoCW0uBqqb-gfYP99vPB_2sJnPR54NAuRyHfIbrwXfMUQ>
 <xmx:peRoXcRGrTHRDucCccU-MsDyED49GYYTpwd-nmn296g-IThyuGf0AA>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44D958005C;
 Fri, 30 Aug 2019 04:56:02 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 2/5] mmc: sdhci-of-aspeed: Drop redundant
 assignment to host->clock
Date: Fri, 30 Aug 2019 18:26:29 +0930
Message-Id: <20190830085632.12928-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830085632.12928-1-andrew@aj.id.au>
References: <20190830085632.12928-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

host->clock is already managed by sdhci_set_ios().

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index d5acb5afc50f..6ae81c8af431 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -61,7 +61,7 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
 
 	if (clock == 0)
-		goto out;
+		return;
 
 	for (div = 1; div < 256; div *= 2) {
 		if ((host->max_clk / div) <= clock)
@@ -72,9 +72,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	clk = div << SDHCI_DIVIDER_SHIFT;
 
 	sdhci_enable_clk(host, clk);
-
-out:
-	host->clock = clock;
 }
 
 static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int width)
-- 
2.20.1

