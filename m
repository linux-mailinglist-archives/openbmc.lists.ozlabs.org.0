Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5153CA335A
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 11:07:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYWn6F6xzDqVb
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 19:07:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gbXyYUaM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cvbt9QVX"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYQx0nbfzDqtn
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 19:02:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 967E421C7A;
 Fri, 30 Aug 2019 05:02:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 05:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ws3fEvRN8j+zc
 dsqzJ6ZF8TPOCs6WkRGoLeC8W2y70E=; b=gbXyYUaMDGHpcGo/JsyQcGr+Gq5qu
 D7V8bU3oKiuyPok52rIkEYmCokOI3my0i+vs8iVcCrjpSTVZP6wnFGDSUPJz0l7w
 93TR8mQLoXZqtC2jfNz0fa9d/iMX+q7WLVHqdHR2MUpuq/yGV7lJyP1hyAub0//Y
 m5m0Pl/YjkCaOAXm08RTRhfPOJQh5b98vEcjL7rMqxvw0Uf3VEtNHOvB+/nzU8L8
 vjm2KGBGf8oOgfB3jojhnvHlHj9a3sle/HeU7s6PjkJNa5UoHQ3Kc1dQXDHJDBb4
 cYIALvexm2sLP0QUw2Vo9HiEljwfhcSy9R2fEnr9uPkU8UpVMP4+vT6Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ws3fEvRN8j+zcdsqzJ6ZF8TPOCs6WkRGoLeC8W2y70E=; b=cvbt9QVX
 tFDOHaFmQGktFdc0hgnZ3WReSnitUjzo4M8z5PImSXrT/+H33zHgLL9I/b04kIB9
 5v7wtFb4oZasVpwSuAEJx5EFi0VG9kPmIiClqfPslB0IdAfUdRRjzq/PKsUwSCfs
 /ZqA/gHN45FEw1kC0D/RxCpfsnw++GFdKzGnnuGgoGt5k7npUsgtwN3ZzE7td7i7
 yRjmtO1IeurVy+CJTTfiVYPdA7h8OSmNhl0ipPazeaMhGbotJE0/rJgmcOIXWfII
 uG2QTpj7Kk85Rn3Ojjf382A4j5gDI8SqFMOLd/Bc3NTFmLtFs5a3Ldl88KVHqNFy
 w1d7aL17ocs8UQ==
X-ME-Sender: <xms:NuZoXScqiklHOnTiyRWLibL4M5f--Cbn3mhNbe0_-7PAXIuO-5FkmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtdefrdehjedrvdduhedrudejkeenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedv
X-ME-Proxy: <xmx:NuZoXQXQaq-1pz43NYM4zDNf_s64C71FD-oOe-OVBS0ZW7Nmyzic9A>
 <xmx:NuZoXfHPKwXoMmLekL-n2-E7_PrtFILQzXZPaOJDWGQtEhBHNh6dbg>
 <xmx:NuZoXSOTrMKRlIj49Qfnj0YQHIfS1q_EFI5L9GoboZo9CWqs4eR2kw>
 <xmx:NuZoXVy1s5YqgFP8RXeBvKtMZOMgTDKIS0J_YQtwwQdLwPW4QxmDpw>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id E7030D6005B;
 Fri, 30 Aug 2019 05:02:44 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 4/5] mmc: sdhci-of-aspeed: Allow max-frequency
 limitation of SDCLK
Date: Fri, 30 Aug 2019 18:32:43 +0930
Message-Id: <20190830090244.13566-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830090244.13566-1-andrew@aj.id.au>
References: <20190830090244.13566-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
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
index 0b75806ed69d..8962f6664381 100644
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
 		return;
 
+	if (WARN_ON(clock > host->max_clk))
+		clock = host->max_clk;
+
 	for (div = 1; div < 256; div *= 2) {
-		if ((host->max_clk / div) <= clock)
+		if ((parent / div) <= clock)
 			break;
 	}
 	div >>= 1;
@@ -71,6 +79,14 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	sdhci_enable_clk(host, clk);
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
@@ -97,7 +113,7 @@ static void aspeed_sdhci_set_bus_width(struct sdhci_host *host, int width)
 
 static const struct sdhci_ops aspeed_sdhci_ops = {
 	.set_clock = aspeed_sdhci_set_clock,
-	.get_max_clock = sdhci_pltfm_clk_get_max_clock,
+	.get_max_clock = aspeed_sdhci_get_max_clock,
 	.set_bus_width = aspeed_sdhci_set_bus_width,
 	.get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
 	.reset = sdhci_reset,
-- 
2.20.1

