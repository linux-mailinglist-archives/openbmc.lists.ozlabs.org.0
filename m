Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBBA4EA4
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 06:30:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MHFF1l0GzDqWF
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 14:30:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ONhOpoC9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DFFas02t"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGXh2w5DzDqQ5;
 Mon,  2 Sep 2019 13:58:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D9442442;
 Sun,  1 Sep 2019 23:58:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 01 Sep 2019 23:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=cXRTfFQqdR5mw
 B60NN4NI3P3V4eAjFwF/U0/J/otK6E=; b=ONhOpoC9IF8BSiaQVMH3A3B3AOlDu
 j4/JaUKkABmMFeJbLh29lGit+W9i+ybx/s8cIOAOYr4uEiTosSLxuikTJA1c6ERc
 iXyqVNz25QN1qFgDPNdMtcU+WbU3lJS58NPwXPz4sp0GV+xPvBeUcck+NV74kYnm
 ckpZBSWRdNninr+QUX6CEh0r3zmos5h26KUuOJvEs9h7dDC1+eOpf7xt80SWrAfP
 9wZqr8T7S7tR1fHj/LcaEL/BvMTOXz/4vgCrcHk35XkF/ikCGxidp5Ac2XKefChp
 XBeL9zbV61ooK41Wbw6plpbncXJArhkgy8W+m9ancE0h5c/oUDfcyJEHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=cXRTfFQqdR5mwB60NN4NI3P3V4eAjFwF/U0/J/otK6E=; b=DFFas02t
 K5cpDViCCTFHLKeIX3I1RX7UceJcb2hnEoX5xVAKA57D4OiwkeVELigkZkphw3yF
 MgzgPbHeLz3XMsjSVWQ3Qrck7q/ObvkWeIU6G8W07rQ2Yp6BV/k/xw4EhYenYNnI
 oJJ31Ls1I/+D7wXyNcU/rjwekUI4wVOP2X91rs08GVFKC3VuscQrxYBD3Bi7v7VK
 SJct1W9vSc+K0HNLdogigUxRaNDUyfGtmBF1qPQovf/AUllrQPJ0d4u6sJSYULME
 Gb3DcytlboS03RW4FHDzkRLf8lLpuG2lQpPrB0O5upucXQYyVy5MDNj7koXPXQ7D
 oQOWnfegzmxNuQ==
X-ME-Sender: <xms:cZNsXb4cvStDViK3_BF8IJi63hRpdwhHLdaV0U_0t5fs6gyZK5c2RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtdefrdehjedrvdduhedrudejkeenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedu
X-ME-Proxy: <xmx:cZNsXaQ85ptvz8rXx_IvDWp_GRzHRYdgUv23O_CNKm3qG_zcpBXDlQ>
 <xmx:cZNsXa9nsirAbuKaKjCUyLpj32V4rVumeNQLqs2SI38qWmp36DnbhA>
 <xmx:cZNsXbrdqQo89xoKlGnQtCgb7crW5D2wczsc1TgqDZJ0gcDCKHEUwg>
 <xmx:cZNsXSLAlfWirQAInXClPUIjdPd4yCl-vwWKkTHY12hYLnCJ-oyKFw>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A362D6006A;
 Sun,  1 Sep 2019 23:58:38 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2 3/4] mmc: sdhci-of-aspeed: Uphold clocks-on post-condition
 of set_clock()
Date: Mon,  2 Sep 2019 13:28:41 +0930
Message-Id: <20190902035842.2747-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902035842.2747-1-andrew@aj.id.au>
References: <20190902035842.2747-1-andrew@aj.id.au>
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
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The early-exit didn't seem to matter on the AST2500, but on the AST2600
the SD clock genuinely may not be running on entry to
aspeed_sdhci_set_clock(). Remove the early exit to ensure we always run
sdhci_enable_clk().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 213b3dbd49ef..c31d74427c49 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -55,9 +55,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	int div;
 	u16 clk;
 
-	if (clock == host->clock)
-		return;
-
 	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
 
 	if (clock == 0)
-- 
2.20.1

