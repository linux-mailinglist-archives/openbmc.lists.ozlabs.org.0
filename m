Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF3BF442
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:43:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGMn5MHbzDqsJ
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:43:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ej0s079g"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PqtL1kzv"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGC05TG2zDqjJ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:24 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 757E272E;
 Thu, 26 Sep 2019 09:35:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ax8qcZm5J10I8
 ZqNRzWuYcCjYIxStOA2LR/uq7PYupM=; b=ej0s079gAtH1u3gmOnBmXGYUDhfol
 l0hXDPi5dIvGAyXycBDr1yleXbVrgCIx+D4GORf6IbKXtGv9Ib3gPZrsrxBPXHAy
 iNbxprWmFTGjh2m8axifIduOfPbXd78os55JLZU6ZfEwyWJHv4bkhdoAvSe03BEw
 Bjcd2SuuWJ5wWlvmKT8mNVXPaGEqI79yDQtAQTjvNOSBXloasOZ4pKKTS12fC4K7
 YtEs4M8wBK2RAaF9uTpDDg69ubc3L/rj6z2BnsWqnwZ9JCYhBWqvQ+lyL69GTBmS
 loJJv3OF8KJ9M5bPXiCuHIQhW+bMD/UBzcqHP3s9tzpGHp9FQ71+uXW0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ax8qcZm5J10I8ZqNRzWuYcCjYIxStOA2LR/uq7PYupM=; b=PqtL1kzv
 VpZVdM+8a5RMci7/PqUF4adz4ltqGji1/7DajkL9W2Q8+SgILAYdMYApKXOLEZtq
 /0wQwCjPlMd69MCwRv+uecDjY0Y6jrh9IRFJX0IXBQV1DTMqTH74Tk6vMEcUH8wB
 W8+W9BHqUfc/GOD53/yJSwNZ+SjAKCzpU0HgPtZARadG5yTYwof8wwSmxMmxYf+K
 ZzaPVDf0+rRpBjgDiQ+JyooKKg6wPpN6FIflqAe9VRZKd/Eeo+iQLeEPjlW2kDJ7
 DicqH2EDqraV6H0VC833rrcUj38pbBWohwXLwKrymlrGgrB6JcDSHCu0YN2ACRrW
 nbL3mtgqHz7Pcw==
X-ME-Sender: <xms:mr6MXU32AlQIwWcLZI4AOyLKrK4oWJVV6CudIbhyiukOJtlzUEOwnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:mr6MXQsUUVm0lVxnOPZgl9s5YnieKuBlRKo2m49uzrozeWJCG7Ch-w>
 <xmx:mr6MXQ9QbUo6mOIeIEfqH1oV_gAjUtritAqQ0zmRg-t6HJNvq9qPsw>
 <xmx:mr6MXUQ3Xnx4rXbvoaSKHAV8IDPUf1Yi9tisshbMw4XqjxM6NxlQrw>
 <xmx:mr6MXdeaPjtZ2Rvzkb-iJhEwRehPOfCLNgmanhQEiw2jFfeAMJP4Jg>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 23838D60063;
 Thu, 26 Sep 2019 09:35:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 03/15] pinctrl: aspeed-g6: Fix I3C3/I3C4 pinmux
 configuration
Date: Thu, 26 Sep 2019 23:05:56 +0930
Message-Id: <20190926133608.30566-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926133608.30566-1-andrew@aj.id.au>
References: <20190926133608.30566-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, johnny_huang@aspeedtech.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Johnny Huang <johnny_huang@aspeedtech.com>

The documentation to configure I3C3/FSI1 and I3C4/FSI2 was initially
unclear.

Fixes: 58dc52ad00a0 ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
[AJ: Tweak commit message, resolve rebase conflicts]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 9079655cc818..68b066594461 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1513,18 +1513,14 @@ FUNC_GROUP_DECL(VB, Y1, Y2, Y3, Y4);
  * following 4 pins
  */
 #define AF25 244
-SIG_EXPR_LIST_DECL_SEMG(AF25, I3C3SCL, I3C3, I3C3, SIG_DESC_SET(SCU438, 20),
-			SIG_DESC_SET(SCU4D8, 20));
-SIG_EXPR_LIST_DECL_SESG(AF25, FSI1CLK, FSI1, SIG_DESC_CLEAR(SCU438, 20),
-			SIG_DESC_SET(SCU4D8, 20));
+SIG_EXPR_LIST_DECL_SEMG(AF25, I3C3SCL, I3C3, I3C3, SIG_DESC_SET(SCU438, 20));
+SIG_EXPR_LIST_DECL_SESG(AF25, FSI1CLK, FSI1, SIG_DESC_SET(SCU4D8, 20));
 PIN_DECL_(AF25, SIG_EXPR_LIST_PTR(AF25, I3C3SCL),
 	  SIG_EXPR_LIST_PTR(AF25, FSI1CLK));
 
 #define AE26 245
-SIG_EXPR_LIST_DECL_SEMG(AE26, I3C3SDA, I3C3, I3C3, SIG_DESC_SET(SCU438, 21),
-			SIG_DESC_SET(SCU4D8, 21));
-SIG_EXPR_LIST_DECL_SESG(AE26, FSI1DATA, FSI1, SIG_DESC_CLEAR(SCU438, 21),
-			SIG_DESC_SET(SCU4D8, 21));
+SIG_EXPR_LIST_DECL_SEMG(AE26, I3C3SDA, I3C3, I3C3, SIG_DESC_SET(SCU438, 21));
+SIG_EXPR_LIST_DECL_SESG(AE26, FSI1DATA, FSI1, SIG_DESC_SET(SCU4D8, 21));
 PIN_DECL_(AE26, SIG_EXPR_LIST_PTR(AE26, I3C3SDA),
 	  SIG_EXPR_LIST_PTR(AE26, FSI1DATA));
 
@@ -1533,18 +1529,14 @@ FUNC_DECL_2(I3C3, HVI3C3, I3C3);
 FUNC_GROUP_DECL(FSI1, AF25, AE26);
 
 #define AE25 246
-SIG_EXPR_LIST_DECL_SEMG(AE25, I3C4SCL, I3C4, I3C4, SIG_DESC_SET(SCU438, 22),
-			SIG_DESC_SET(SCU4D8, 22));
-SIG_EXPR_LIST_DECL_SESG(AE25, FSI2CLK, FSI2, SIG_DESC_CLEAR(SCU438, 22),
-			SIG_DESC_SET(SCU4D8, 22));
+SIG_EXPR_LIST_DECL_SEMG(AE25, I3C4SCL, I3C4, I3C4, SIG_DESC_SET(SCU438, 22));
+SIG_EXPR_LIST_DECL_SESG(AE25, FSI2CLK, FSI2, SIG_DESC_SET(SCU4D8, 22));
 PIN_DECL_(AE25, SIG_EXPR_LIST_PTR(AE25, I3C4SCL),
 	  SIG_EXPR_LIST_PTR(AE25, FSI2CLK));
 
 #define AF24 247
-SIG_EXPR_LIST_DECL_SEMG(AF24, I3C4SDA, I3C4, I3C4, SIG_DESC_SET(SCU438, 23),
-			SIG_DESC_SET(SCU4D8, 23));
-SIG_EXPR_LIST_DECL_SESG(AF24, FSI2DATA, FSI2, SIG_DESC_CLEAR(SCU438, 23),
-			SIG_DESC_SET(SCU4D8, 23));
+SIG_EXPR_LIST_DECL_SEMG(AF24, I3C4SDA, I3C4, I3C4, SIG_DESC_SET(SCU438, 23));
+SIG_EXPR_LIST_DECL_SESG(AF24, FSI2DATA, FSI2, SIG_DESC_SET(SCU4D8, 23));
 PIN_DECL_(AF24, SIG_EXPR_LIST_PTR(AF24, I3C4SDA),
 	  SIG_EXPR_LIST_PTR(AF24, FSI2DATA));
 
-- 
2.20.1

