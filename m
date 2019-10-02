Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B8C4508
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 02:35:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jccG3btCzDqTx
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 10:35:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gc9pVVRH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="m+EIZJXA"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jcbZ0l4pzDqQv
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 10:34:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7E93A21C1C;
 Tue,  1 Oct 2019 20:34:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 01 Oct 2019 20:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=ncmPcZ7CJmI2RT1PnX6VMllOC9
 bLRShQ/YlpE4+jT9s=; b=gc9pVVRH2RG7NM+sHKM21/w2wpFrOAz7HuYf4Ig9Jx
 /bnYhkNN/bwcZ2zWa8jFAozEQ9/Liw47vwXisPo+mY4NnChbltbWmhqOEOToA/SZ
 juPr5m2xjEFkl34ryrhsyRNEg6v+89Zom3vWKiv7bDhe/kDDtDtidUN8soYCxIMg
 upfL7K2anJVfnZ026bYKbuA3LS2DedE/EVVF7Ha7lfzwpL94X9gA1h3kdiBtyP05
 xlwiEjs/UNen0d9sidHLV9NQHjP2Qy4BoIKQXg8fiWUX9RAH6+miB+stQ5MwCV/+
 FklXFdW8kxYAT6qGkcZhk4sKr1Wez6nYuthiMx3ennDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ncmPcZ7CJmI2RT1Pn
 X6VMllOC9bLRShQ/YlpE4+jT9s=; b=m+EIZJXAR6fWWf2sxVmIgGrNyAd10DO2Q
 850PNPwsHEsyMDo4F9UF3Bcbmf7wcUYpxkC5GlZ4qTzwU/e4mVCoW2gvXyBNT8Ev
 c87lClsZ+VKJ95VojolMjM60T9E+/h8xTauIPoRK/WHJ+SnQojMpNrsfBtePY7yy
 Ni1TdIqRXoBUMCtiI0Gp6AlVtiKkRGPN3wRsnat5NEvKkKCUIuSBx39hh/6NUvg1
 ye96RU2pQFHU2pepj8mEDHqQsMkfigzbJ1rEhgHu4lBt4jHDkl1emvC4CG2FJD72
 p/o6sNW6TU+JwxEZYdN1GROQM/9/pf12EyS09d+nYx0+9R+8UnRNQ==
X-ME-Sender: <xms:o_CTXcMTBxyFG3CrjKc6EshlA0BP-TCsVQBAnSqQajb_HEUXSCE4ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeehgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:o_CTXTEdGqew89ensEKSeQNzyXcR-R-pXc4kR3iGs0Y_6u1IYWIlIw>
 <xmx:o_CTXbN9V3GcD5OfgW07eI-hTWuSDqrLSrFpPSsZM16gHTD9zaZ5Bg>
 <xmx:o_CTXc8XYlvj5rn4QWoi4s8clQKjz2MO9XWOpP5cI_HaPB4tNjoWIg>
 <xmx:pPCTXUu3QqfzbBNcbuEYAIvVqlQs__lYKqBlS-nGEeOuocQpR_0i5g>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D50980062;
 Tue,  1 Oct 2019 20:34:41 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH] ARM: dts: tacoma: Enable iBT device
Date: Wed,  2 Oct 2019 10:05:23 +0930
Message-Id: <20191002003523.26165-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

BT is the primary IPMI transport for OpenPOWER-based systems.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index a923fffbb5a4..02e55c7102bd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -455,3 +455,7 @@
 &i2c15 {
 	status = "okay";
 };
+
+&ibt {
+	status = "okay";
+};
-- 
2.20.1

