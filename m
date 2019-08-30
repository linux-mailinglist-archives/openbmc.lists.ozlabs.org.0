Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC9A3355
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 11:04:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYSW1cDpzDqZq
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 19:04:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Uw+aX94S"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="j8QZHO/1"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYQp6VMhzDqB5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 19:02:42 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F1232202A;
 Fri, 30 Aug 2019 05:02:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 05:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=N+/xHfrW3aULX
 QCqVybged8XEa4ya5xZpQyzoYwgBTM=; b=Uw+aX94SOlLPM1U3DFp/+EEDXWbdA
 kTJ82sO4tBCBPLTJU5988b+gpOhRAueukhiwqjwpaJDsOaJmPvq5Qn36QG/7Sacf
 c4LvGYie0iYWpKG7LZT2l2GJpom12BEOeLksZs7w/DPLOgY5CG9WKpxXTFNRzist
 uEGbKUIOMv/v6SSPakDiO8V9/vmc6Jk3vsEdFCioGunJSP7qE7thmuwM/X2v9R4q
 LeCeX6218zmW5aqw6HSJ06PGZsa/tIjx/nkrmDS+JV1I6uN+ySDWGxUFr4s4a09H
 f3fmOh7wpkNytTC7XQQ4QqtjhwCNsWo72xIGlY7NbJQbSjWaDuzGDUVCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=N+/xHfrW3aULXQCqVybged8XEa4ya5xZpQyzoYwgBTM=; b=j8QZHO/1
 NE1knNdBbk2JRWPFraUjEbkxnqGoWnOMKG05BQ9PNcWhzk4k8nn4SLyGPex+AK61
 MIZZOE/6ewzyMjyA4CquLBZmnK2TcPa5KlPix+EIu8Z7e12OL5s15XqYU/rvJkmW
 nHcRUyet1OlXiooogRw1SA2djUb/7lzdea/EY/8CWkPlWLRlPkJKfZaILgaJkeVD
 zW8KEqqEZIZZvhamjXHbmnE0P75T1v9N4c9V2hGRrJywkQjbpxtjmY2CyQjfhjs8
 FkIpHlBu/aD8/lVCJYOXqRd9rB5W7pPvhUZvzgGyMojRbJzACOBn5/IMQgvDDKux
 yj/m+R2zZL4Tqw==
X-ME-Sender: <xms:MOZoXZB6nlByO7A_PaH2SR3cNtYEH-C361NukQ-WzWaOFZqy5AoS1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepvddtfe
 drheejrddvudehrddujeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:MOZoXXFN718b4IBAjyIwClCtqeKqx63DVTTSul9GeEbrBD89gI2pAg>
 <xmx:MOZoXYogV5j0SD8OWiGZBdoVpArifFfQivGKbDCHrxfzx0wJO0TgdA>
 <xmx:MOZoXThm_4KW1ZcrtDTgkGg51dzLMlFwBp8-KapnUaWTSuqvQ16dpQ>
 <xmx:MOZoXV0UTQNV6jR586-gwTG1r4Z2ID3d1MdD2jmmYllp1RAM0zSZvg>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6DF14D60062;
 Fri, 30 Aug 2019 05:02:38 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 1/5] mmc: sdhci-of-aspeed: Fix return value
 check in aspeed_sdc_probe()
Date: Fri, 30 Aug 2019 18:32:40 +0930
Message-Id: <20190830090244.13566-2-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Wei Yongjun <weiyongjun1@huawei.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function of_platform_device_create() returns
NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
(cherry picked from commit 7b7de08a14b59d45cc4720bfb21732063ccfc8f6)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 8bb095ca2fa9..d5acb5afc50f 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -261,9 +261,9 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		struct platform_device *cpdev;
 
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
-		if (IS_ERR(cpdev)) {
+		if (!cpdev) {
 			of_node_put(child);
-			ret = PTR_ERR(cpdev);
+			ret = -ENODEV;
 			goto err_clk;
 		}
 	}
-- 
2.20.1

