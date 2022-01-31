Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DAA4A3C74
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 02:29:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn9Tn6fBCz30Nd
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 12:29:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=bLrDcfS4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Z8TNpp64;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=bLrDcfS4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Z8TNpp64; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn9Pr5xlnz30QS
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 12:26:24 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F393D5C00EC;
 Sun, 30 Jan 2022 20:26:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 30 Jan 2022 20:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=fbA8F6GgeDoze+ORXvHtJNHn6g8CDZ
 TF2a2Fh9ZnfbU=; b=bLrDcfS4qOdpf/Y2E2zeEbSPqUOykMvAScE9prQK6WUFNH
 p+4vg/JY2ga9tt3Um27bQyGthpMuLcUYdbAoX1MaLkitvSHFqSAd/OKTKr0WGpAA
 W25y7rg4snJIQjtEmiN9Ku2fuegW/nDZafQy6FDGAX+6GOJ9sC7nFmtsvTQX9t3X
 5L/wkE13sKAo2X1MEpTHOduj4hVHKcL0Suys/m1/rGkSDn3D8IuleqgOtydYisMh
 qeHIZEpfTX9Lxhe8gMf6WeTe9Oy9rBFYFXrBsBg1TMIXve7QIhE/8Cl9g4Cof+F3
 RXXyBPkZJaxniE9ysMUd41u5J4hRqtRxzQM0ebkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fbA8F6
 GgeDoze+ORXvHtJNHn6g8CDZTF2a2Fh9ZnfbU=; b=Z8TNpp640hy5KTByXMPoLn
 QV5pTy/JKjqTGjNbksYcZblyyJesHUJ+aeVpLFtxIdb3v11WA3nLqdjhBhiJIL72
 4KanrEk+s7rZSyvurhgiUV7e3Sn/6BPofcmYRENmevvQgtQsuut/VMDIUfNsAEtE
 t/dORRwhkY40Hh6U9qQfQ03aWUURY4PFE/fiixyfmrixS1B2wc5qQHm1A3j3zILG
 rfwlNqY1rXaBq2g7+cEywSxoOdOgRPfqOarqXF4RCz03F4Inzz6TphImDkXYQRrC
 oE6RcuD/Ays446XIi73ndNkO6/Yq5s5upHaTQg2uRZPBU8A2sY1p0CSb+IAvxSBw
 ==
X-ME-Sender: <xms:vjr3Ya4r5suv2EplMOpUFUuWZcmvlSH9rl769nOshv2F52_aK14LKg>
 <xme:vjr3YT4JnQy-ZXN4pVaPFk3Dg7dsjTKntmT1j-zKZRQY3-hldT89lG6U2fnKibAqw
 8z83aE7PyPrp5p9QQ>
X-ME-Received: <xmr:vjr3YZf7srUG3iIPXjAM3j9e_Cp_tpFiAwFh2ODdtNBw5O8oZgdXG_oUPCkypj8g3wnwywASsToPFFP3n4VShuMt493iC6dShIEJPYS-T0FPwTxf9ilrRAQvHT7PrR6P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedunecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:vjr3YXI1VlHP1OcYFUonQiq7NxQRxAYxd_Ju6EACyQwXsrBDfKT_Xg>
 <xmx:vjr3YeLxFHMqKtbueHS2TaKwBNWpsn6PJeYC3OwBlBhyfHnJXFIhjA>
 <xmx:vjr3YYylekqppCxIg-bLefAfyS_LbKgZGOmOt9RCBiHqbBkowzsY-g>
 <xmx:vjr3YQi9H6roPnNxoCgDaPafieNOg2CqVeGBXbyAovhNJoDRiT_HRw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 20:26:20 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 5/6] ARM: dts: rainier: Add
 gpio-line-names property with bmc-secure-boot
Date: Mon, 31 Jan 2022 11:55:37 +1030
Message-Id: <20220131012538.73021-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220131012538.73021-1-andrew@aj.id.au>
References: <20220131012538.73021-1-andrew@aj.id.au>
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
Cc: eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The "bmc-secure-boot" GPIO controls at runtime whether FIT signature
verification is performed by u-boot and the SPL.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/dts/ast2600-rainier.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index d0e82d151239..af35afb911fb 100755
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-rainier.dts
@@ -104,6 +104,38 @@
 	sdhci-drive-type = <1>;
 };
 
+&gpio0 {
+	status = "okay";
+
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
 &hace {
 	u-boot,dm-pre-reloc;
 	status = "okay";
-- 
2.32.0

