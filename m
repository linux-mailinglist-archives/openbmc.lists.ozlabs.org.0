Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E52571C501B
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 10:18:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXg70bs3zDqNn
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 18:18:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=K1gCCo5g; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=q/EAvrlp; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWXg6Xz9zDqPS
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 17:28:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 62E1C6D6;
 Tue,  5 May 2020 03:28:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 05 May 2020 03:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=JTBib5XMuE+/L
 cumzeOup1o95iCS93yRZfvLsnKwdfc=; b=K1gCCo5gRElQg5z8Ly/ndMo2sEenT
 V9yJTrk11EFeXHhEvB2x5yBAYu3aimETmrFI4J9IO2wtJh71uCI4k7ci2GGXUgZ/
 tuRfjVTzrWO+fr7FKXduEWCDN6GwqT8yAkIb0wIX/x7UAsp1erRjLHAgpdiRUpMJ
 KHQwZID3pYjQI0eSR9nwEOQBlCNz1K1+mMXqqp/A+vHp4fG0+hBHC6wSBbWtje5U
 s/9cUzQWnfVEz3PKL4gOCfNoETxR0MO9vBg3CJsPgr09QQLeZPgjApVhuNgnGOiZ
 0YT9WOUlZBPSBDoSxqJtKCzjoJlBimhvCQIuzbJSX+M4Q/HoGonlskP9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=JTBib5XMuE+/LcumzeOup1o95iCS93yRZfvLsnKwdfc=; b=q/EAvrlp
 AXQX3oMhIgYT60I0WQDVW8V9horQI3XhXIVJz082mxT26cuWusmek+IRuJtJq4nQ
 gZLAAgWsHTGeQu68MQywupTdlEGOGbhNWrsS0yabHwXczLSPmoxIAlfLwGZNpPSz
 lbxtS8NFRRa+qvZMrk2qfQEn3evuSRVVGHXLwzQ97PYGG8S53qrERu2bwWlKUR8V
 +/nF1ZTf0iGe4NRi9fhCeOdbXua/KnXp1E2BBOWH6pokodD7DqVf3bp+zi9kEwK0
 v1/PzUheOBnhrefKP9un0ywKpSzPhG9bX2f1eJZ7JwQLnJLCl629YwocoDdFgqCs
 B+Nnty1OTybGUg==
X-ME-Sender: <xms:fxWxXmmG3wdhVrLLsWWwx2W4khJ-bKpDXW_7Vc8JtKkPPVlUgVCeTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddrjeehrdekgeenucev
 lhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:fxWxXj9tjcH3C-DnaxrJb7cpjd0eBl7YyNq4q-ZdeYlagpWrNApa9Q>
 <xmx:fxWxXhbNv7bffxQNC6dAvz1opHuFGRSihOPcAPiUjpuptG3OBNtk-A>
 <xmx:fxWxXge8vrW7E8JWnQO6_aCePz8MvzoXER__tyWve6u4UrBfCq0anw>
 <xmx:gBWxXjDk0YwHG413Jfn2TUfPkeUCCZWDosh5mwC-9ljkSjk09Ex2ZQ>
Received: from localhost.localdomain
 (ppp14-2-75-84.adl-apt-pir-bras31.tpg.internode.on.net [14.2.75.84])
 by mail.messagingengine.com (Postfix) with ESMTPA id 831C43066052;
 Tue,  5 May 2020 03:27:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.4 3/3] ARM: dts: rainier: Configure ball Y23 as
 GPIOP7 for MCLR_VPP
Date: Tue,  5 May 2020 16:57:42 +0930
Message-Id: <20200505072742.350305-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505072742.350305-1-andrew@aj.id.au>
References: <20200505072742.350305-1-andrew@aj.id.au>
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
Cc: elkowals@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

GPIOP7 is used in the Rainier design to manage the state of a
microcontroller elsewhere in the system but its ball, Y23, is the
driver of the heartbeat LED on the ast2600-evb and the SoC defaults Y23
at power-on to the pulse-train behaviour used to drive the LED. This
causes much confusion for the micro in the Rainier system, so hog the
line as early as possible.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 01db238ce741..794af5517313 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -102,6 +102,13 @@
 	/*AA0-AA7*/	"","","","","","","","",
 	/*AB0-AB7*/	"","","","","","","","",
 	/*AC0-AC7*/	"","","","","","","","";
+
+	pin_mclr_vpp {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(P, 7) GPIO_OPEN_DRAIN>;
+		output-high;
+		line-name = "mclr_vpp";
+	};
 };
 
 &emmc_controller {
-- 
2.25.1

