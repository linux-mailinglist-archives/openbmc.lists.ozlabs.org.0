Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D1A3357
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 11:06:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYVd5z14zDr2j
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 19:06:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OvMiF7uW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1fmC+GT5"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYQt6YDczDqZq
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 19:02:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 97C5D21C7D;
 Fri, 30 Aug 2019 05:02:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 05:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RDwyLwvHbByVw
 BGEjdoYpYdD89qsWbvbK620dSvHQ74=; b=OvMiF7uWbEFAI/W026SgK/92sVZsB
 i9hd1P92tPTe4zZXBrl3rxLVslEZ2altgFg45d9ro9AgyCNNxt6lhNIUCTpsm95D
 UcxOB5UJjAz4OLZTE5SLxmNZcg4zyxZmF9fhdlxhUyPbAP8f1Aa3gyOEhpjqgrFn
 XMviIQOudA1iyU/9Z1uEhkXTbTHc6BKv9xnlNGj40sew8pqB+YsyS5CLUjCsvgFb
 2IkgR+iqJalS9JFju9D7zZks7k8k2Qh7noX6iVu0xZR+dHTM2EEkob8gTOy8vuhl
 ogQXP4JLMZyREH8cu3pzR+0prLfkOgbofom6+R5IdMsUteh1Ddj1v14DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=RDwyLwvHbByVwBGEjdoYpYdD89qsWbvbK620dSvHQ74=; b=1fmC+GT5
 y+K+d7AEc5eU8xIFwtog4Qam4XvSROBSUPNeF5sutXXv25lbumnY7dLoGeUa1a/G
 moPa00CdUwkUma9AtwPYJRASQNJjBRRtX/9cResisR30l9ve+nohPM0uUFHL1Yfl
 KaZZA+WxBXwwF/96IpGooOF17OUfYxsSVa92pas5hTfkNv9KaGdms1uxfn3aehY7
 f4o531GeCpAdAmPXFs1DIbsWy0BYdn0TExB6IjxNjrOijeMHWYhciEBHGQ+5lWcd
 qIvu7uGqO6Z+sh7C/Op6T5EpxM8ca3ug9LGZpX2HW/gz6rYU0M8DehJ4hA9Soq+4
 6n4pqKN7cnYOgA==
X-ME-Sender: <xms:NOZoXWNIHTEPgHuEIRvA1HkC5pxVtS5P9j-qogRFTALTO77-Lwml1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtdefrdehjedrvdduhedrudejkeenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedv
X-ME-Proxy: <xmx:NOZoXVFVgBAo4L7li1C4Dl1VIr0WLCZL65piYYaqYfpz4NiJ40-Tjg>
 <xmx:NOZoXUsuLL-lJLgAsIqoqvMtJt61N35uM9Mc8yvMmnW_6q1Zu34b6g>
 <xmx:NOZoXdS3UXsxR-Xd-qVqO1HOjIAV--eryAnnsDoeb6Q0wDWHCwlX9g>
 <xmx:NOZoXQ5RCzMGVR-XRrsXTZrX4quCkPMRjfsrCNUfioAuT0tRWoATpA>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id D050ED60065;
 Fri, 30 Aug 2019 05:02:42 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 3/5] mmc: sdhci-of-aspeed: Uphold clocks-on
 post-condition of set_clock()
Date: Fri, 30 Aug 2019 18:32:42 +0930
Message-Id: <20190830090244.13566-4-andrew@aj.id.au>
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

The early-exit didn't seem to matter on the AST2500, but on the AST2600
the SD clock genuinely may not be running on entry to
aspeed_sdhci_set_clock(). Remove the early exit to ensure we always run
sdhci_enable_clk().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 6ae81c8af431..0b75806ed69d 100644
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

