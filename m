Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF17C3B125A
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:42:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8pws4b9cz306W
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:42:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=WdvZomH7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OqmEHBdt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=WdvZomH7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=OqmEHBdt; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8psn0RB3z30CX
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:39:25 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6D1C6F5F;
 Tue, 22 Jun 2021 23:39:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 22 Jun 2021 23:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=D2rV8itMeaMiS
 JE6lTJuFr6bSVoMV6928n7JfRv1hqo=; b=WdvZomH7HrsyROSYBAnfatxkM3jJq
 31G7H5aED+H4R5HTJzUgdBsd0LK3Sd35kxr4R1s2BUv640j2ZhYz5Mzy91rWsmxC
 luckaAv5ZHAQkYje6ARiuHCtykzLMkse1x9C92y2gb2/ZHAifYwA/IdOcQynoYzs
 FXwISvKH5v+C5XOuq0zAHVHWo+deB0eosUIOPx/4L9XEcaygMICgKe7nZ56QLCEX
 XCf7b8nl4WKh8nk6Oln6kSVLAhKFDsRSeJqZXu6qWV7mPQXwWccW30G+XutyvRm6
 6SZcUU2AXt9h1Y3sCULva8xSRa/BjHaU3XRAsl1w3hzPj/8nLFrIYAS8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=D2rV8itMeaMiSJE6lTJuFr6bSVoMV6928n7JfRv1hqo=; b=OqmEHBdt
 ZOWnZ79O4ndlWF7npS4TLsYZD+qPvhRvi/dZzpODyPBPNWXpu7NctJ5JD7I0aI2O
 fUbYTnGia4sqGCrEbh5a7A8BvjoRu0frUePMTuX1ZqlrOzIuK+Fipd1by+0AK/gv
 6MoKr+zbHmUz82qdA2y94Eisek4EXtQweiFTxiep3yd7Ng/7UFrA5z34hiogOc2s
 WU7oLKIdBmWfuXfiNV7bt2vzRP5zREXzNFFzBH/cnC7Qa/Tq7pnXb8oPLsS0muCq
 sEtF0VDsHhJKhggw/rhYskXNPbRP/F+yh/s2jcN+1iIIMKbNCCIhSZlJuzBvbQBa
 qCsBQEZcsuLKeA==
X-ME-Sender: <xms:6azSYIQEwuY1RwXXkW2dZfvNOpcqWz2_90xWxXhKaONK4S4c2RG0Hw>
 <xme:6azSYFygUHqi4EOwnSqOl2qKsCxEmhYIsKspLJnWdCblznyLHgD3aIK8MKrImZDzl
 CzNiZggjSEzdYe4Dw>
X-ME-Received: <xmr:6azSYF1HlxhDgYXEMBvlbFznMz4htPNbzLnbUtSpZuuZvbYDTPSHRWpVljkpjKy9pRL8LTLLJ5vV5-kpk1Cln4YeKef3uQSnrRqpxBX-DKZuSxTj-0WnAkDPFkcKsjnuyIKcvME2pbjX2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgepvdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6azSYMBcJhdjETZlHUjxdsGGYzerqbQQ7BNQuejhiPXl8m2v-6oP8w>
 <xmx:6azSYBjC7Y_mc03EgOeHe318QB-SZaP8VOhj550QdjFUmzIw1ZpQWQ>
 <xmx:6azSYIrQoyMZ8WR1EqRoHA7oJc3YfeGAPIa80SpiXl9WQqvCFEDrFA>
 <xmx:6qzSYBITkVwYJEiaUBdtAdvIZ57uJKGN1_9gF0ne_EJeYwozRydf3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Jun 2021 23:39:20 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v2 6/7] ARM: dts: p10bmc: Switch to KCS 3 for
 MCTP binding
Date: Wed, 23 Jun 2021 13:08:53 +0930
Message-Id: <20210623033854.587464-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623033854.587464-1-andrew@aj.id.au>
References: <20210623033854.587464-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The reset state of the status bits on KCS 4 is inappropriate for the
MCTP LPC binding. Switch to KCS 3 which has a different reset behaviour.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index d899c9620286..738785390fa3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -4088,7 +4088,7 @@ &xdma {
 	memory-region = <&vga_memory>;
 };
 
-&kcs4 {
+&kcs3 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca2>;
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 9ea3864651d6..9d57f9f6a1c3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1780,7 +1780,7 @@ &xdma {
 	memory-region = <&vga_memory>;
 };
 
-&kcs4 {
+&kcs3 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca2>;
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-- 
2.30.2

