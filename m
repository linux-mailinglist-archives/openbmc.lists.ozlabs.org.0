Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47433A4E9C
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 06:27:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MH9n2xtTzDqYJ
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 14:27:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lOjcO9cl"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="vqgvK4r6"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGXf362bzDqQM;
 Mon,  2 Sep 2019 13:58:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7E3542A7;
 Sun,  1 Sep 2019 23:58:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 01 Sep 2019 23:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=xsC+k1HwgXn/+
 wd1iZbQwarEodEUaIr5qWO1c8wQAQI=; b=lOjcO9clPxBfdHaod1XlxFZiZI9yJ
 dWfw0xyPK9YARHvoGsWi9bctQi2/Dn+JxE0dq7+0yYcYPOb8fqnV+epgciT4ePSu
 m8XOIiQ/PlZeea0yrE4S8oYBGFsTs7mybJ+1tyGxXrDfM0A7p3b4KVcvO8t1fEdh
 Z24GLhVCekRqzf0BtkH+kOwUXgDW2ZMt8tJdoyUQ9K7P9Zdts8mmIkfZIB76T9y8
 Z+yO7XL9UYCmt8A2nidyGiL7QmI2+fYYEjLFdKofRbCrnWvD7b6WgUZhV1+c1BKA
 zpOEsJ9K4VlH/Fopr+jBNa1hxgR6bbbHMi4N1Hbm4QeX/KzY/QbTkhcJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=xsC+k1HwgXn/+wd1iZbQwarEodEUaIr5qWO1c8wQAQI=; b=vqgvK4r6
 zG8NC4VfqSZe83rjyx3Zy5RVDSff8ATz5Y87iu95arfdrs+iLHnJa91Sp5I+UUoU
 Y5HPIDp+6pdwyVuzN+kallNb+KRn/4TzUZbF5YzcId6XQEADrPJgW6hOx9lin4f0
 61hBYtk6s6pG8SF3XyWc464LpT6fGZwG3odxpWfvG14Ef18rrPkTA04CRFHW4WU7
 eP5msi90hYHcS1eh1KNAqmil7gssLNT83KOWL8RMSiSfwHBjXb1lLNUhGli6sybY
 ZqWmNcmt5pKeGf0PEzzAi/Y07zy2vmv9bdsXTdtMQyumzaF0J6WEF7DDaKTM4vHB
 wcV4669zaUQwDg==
X-ME-Sender: <xms:bpNsXYRuWsdWxpaEHlF-nRtRc4VNUE8-zRpqLmzZw0ssOMdbFaMlSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtdefrdehjedrvdduhedrudejkeenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedu
X-ME-Proxy: <xmx:bpNsXbwdflNczVdovtK10XhptWDoorBL8ki3Mb_GS2zxbfeGWa2pxg>
 <xmx:bpNsXQr6eeD6mLegxDBwWpn9ImRt1bNebzpzSOVPiqqPIM_xs-Atyw>
 <xmx:bpNsXe2CPhpcuWDmLlI4UybUVl3EEKqQHJh3TbxG3gdbBpSPYX8kpA>
 <xmx:bpNsXc6DbhuHYSaH-2zbPZLq5q2VdOuir8ZVbuSTpv8A9WbkrY4NTQ>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16174D6006C;
 Sun,  1 Sep 2019 23:58:34 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-mmc@vger.kernel.org
Subject: [PATCH v2 2/4] mmc: sdhci-of-aspeed: Drop redundant assignment to
 host->clock
Date: Mon,  2 Sep 2019 13:28:40 +0930
Message-Id: <20190902035842.2747-3-andrew@aj.id.au>
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

host->clock is already managed by sdhci_set_ios().

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 96ca494752c5..213b3dbd49ef 100644
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

