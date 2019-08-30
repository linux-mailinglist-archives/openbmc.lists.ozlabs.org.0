Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE3A3356
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 11:05:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYTW11N5zDqDM
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 19:05:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SP4jZYZ9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V7MZosv8"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYQr5k3ZzDqB5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 19:02:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6650B21B5A;
 Fri, 30 Aug 2019 05:02:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 05:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=qgxOet6Vexw+I
 T/mOjeCHK3/miy/vj59++UWzoy9f4w=; b=SP4jZYZ9Ajnwz1uaDubvlgdgTYzVC
 6VaT1bBbQshujl6FVfdkvBNlwwGrvtTvZQXwNkixL/4E0dU0AlB1lWC6/4gj44Pp
 BuXrQ86HT01UBIim3/aXW8tNbHpADio9F8fT0hZoZ0vIiKinQDa4S0z/hPj6TdKh
 LmCfFr5f1nnDcLSBx9hLWpwPqhNp5Y/1Yx5+0W4cCy+P6nrQ46c/OFnO7PaPAUnl
 KGG4aHM2FFesXL6Wakhri6H9WS2HIgLSH5o1l63o+DSuhljEDRLe5q2xeYQr4mrs
 kINqUowmCXTt8K+sYodiZZeArFBE3g+kxZ1V0nPV4DimpuyV/HPPdLQMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=qgxOet6Vexw+IT/mOjeCHK3/miy/vj59++UWzoy9f4w=; b=V7MZosv8
 WTqCjFNL/ZoIjf5Hl4A/DuU2v2ALxeAZmR8VCYFEe7hjzKo99ZXH+lp/culPBP+1
 rbPG2OO23x00fNk/Rk4Ky6UGzERA86Uk0bm3bi3lSQxj0i1uDkmP7piRGLREAzkd
 KQoHwPn7cbVjtskRIrymnxzXbGhvv6J6jlcM3qn9AUFooh39tQgmBfRLtbMyi+uo
 /G7SmmrGTkxkr4OXPaW5CAKwi+uT6LR4SLqiR1nH1zoDZ+6fkesJYA9wxiWMM29v
 vazIPPSN+fWWVtHg+Qb7gBpUOfOrQ8jsYDW34BDWyZADyCxo1yOxyiEpEgXQtVxl
 vRv/OJMN4pC5kQ==
X-ME-Sender: <xms:MuZoXSxL6zVe3HRviqpxlYwtmXL75vZa5uyw5hLd6SDq5IxIUnM6ow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtdefrdehjedrvdduhedrudejkeenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedt
X-ME-Proxy: <xmx:MuZoXTsf4Z-eB9j2lo9Dlp8y2fpeAPQQmE7BND2rUGzOiTsHJc9jAA>
 <xmx:MuZoXZFtVBxrbAuMQNt28J0lFdAGC5s6Zq2c0DULAb0OrThfU5zeqA>
 <xmx:MuZoXZdVgu59NCQzcn5iSM7FQzt1QgSHk67ET7_BX_Tkp5qgT0eddw>
 <xmx:MuZoXYeGFOD6vkj4YlSkMHpaXz3TptPRfRbJSsW0GMRri3QpZZqsxQ>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id C47D7D60062;
 Fri, 30 Aug 2019 05:02:40 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 2/5] mmc: sdhci-of-aspeed: Drop redundant
 assignment to host->clock
Date: Fri, 30 Aug 2019 18:32:41 +0930
Message-Id: <20190830090244.13566-3-andrew@aj.id.au>
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

