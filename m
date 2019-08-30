Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F7CA3361
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 11:07:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYXn3dvbzDr2P
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 19:07:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lo4zR/78"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CWUE7K9P"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYQz0hHDzDr2h
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 19:02:51 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AC55D21E44;
 Fri, 30 Aug 2019 05:02:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 05:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=rm+5UcMSfAOhK
 YwVFY13EEfKfl+FUXza08LZQXvzmmY=; b=lo4zR/78mgaV2NjVxyuwfT5UFuXUF
 bDge13WPb2wHW1Lc+a8PSqsKUgx28IAFIx+pqVuKu3RBY2EUzfMzOiLKnhjNHe+K
 1qHq6iY0HsZOoyab+dcuPn1vboNwpRhQFIDHAhC0bUtLlFkcPcn+bNZ2u8ujZe7j
 2IlZwRmLFxCPuenlkMYgDfTftzvP5Ln3CN5UVPWodasyb3Vw+YKv3eDmQQ5Z8Fm1
 wWFY3Smhk0lGIQIRqjX1ICCqozRJy78GdA5tNdUHin0AQlY8mRzCDbZjXWM+J3os
 glC67ku5w7ZfS3E48YuiOP5tpIVzi0YrCxmvnw9sPIuGvWnWbDf3RTUyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=rm+5UcMSfAOhKYwVFY13EEfKfl+FUXza08LZQXvzmmY=; b=CWUE7K9P
 3dx/eC42K9e/Bj0QMnAVm0FBOhtcIV3X/QnJIDju2QhJLZjgp+RNDui+B88lpRN7
 z0Tg0HDy+l69V90DZs5lrWkxdRWegEZoxrV7A87EpMm18Yk6iGgELmZZCn+vQvRT
 XiW+ojYRBGKugwRs3rVVWxuC0aOlTF6FDMHxr2XbEwEcsp2fEdDpowsaITFvTMw0
 +DqImqvvF+IC1OLJRiGS+22z/purOPeQZk/0DjJ2iARScDuQFtiXB96ZYCtVwOpV
 M9pEKJ6vtLHej5pF+wrPaAJgtofg340+1HIoiGx04O2lqA6tnuAgb3ZoVYt8N4uF
 8qf+B6UYsDxcBA==
X-ME-Sender: <xms:OOZoXY6qPuQhdRi2N9U3N-HDpc-z3gqOnYzA5GZvcbTGtbVwcWeBNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtdefrdehjedrvdduhedrudejkeenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhi
 iigvpedv
X-ME-Proxy: <xmx:OOZoXYKlPZBYPhJvtnkScoenvjdbA73cIG-xvLTZo1KFk7wBq71bRA>
 <xmx:OOZoXRnItiOrUq0igp9jE8SivANL2yiskwCaJ3huPSFRMSiyYDmBqQ>
 <xmx:OOZoXZgDiGE0EuE3mAnlqIeMbt8yeTSzikunZ2n9eH5GaYQAefazdg>
 <xmx:OOZoXcJxVc_To1_CeMFPUd_vXUYVGo8U9DOhLNPx0XD3b9P0HSYw9A>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04DDAD6005B;
 Fri, 30 Aug 2019 05:02:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 5/5] ARM: dts: ast2600-evb: eMMC configuration
Date: Fri, 30 Aug 2019 18:32:44 +0930
Message-Id: <20190830090244.13566-6-andrew@aj.id.au>
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

Enable the eMMC controller and limit it to 52MHz to avoid the host
controller reporting error conditions.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 8 +++++++-
 arch/arm/boot/dts/aspeed-g6.dtsi         | 4 ++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 2cb92d2a1041..9613cff2ce3a 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -39,8 +39,14 @@
 	phy-handle = <&ethphy1>;
 };
 
+&emmc_controller {
+	status = "okay";
+};
+
 &emmc {
-	status = "disabled";
+	non-removable;
+	bus-width = <4>;
+	max-frequency = <52000000>;
 };
 
 &fsim0 {
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index d0507f797981..12569e502678 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -235,7 +235,7 @@
 				};
 			};
 
-			emmc: sdc@1e750000 {
+			emmc_controller: sdc@1e750000 {
 				compatible = "aspeed,ast2600-sd-controller";
 				reg = <0x1e750000 0x100>;
 				#address-cells = <1>;
@@ -244,7 +244,7 @@
 				clocks = <&syscon ASPEED_CLK_GATE_EMMCCLK>;
 				status = "disabled";
 
-				sdhci@1e750100 {
+				emmc: sdhci@1e750100 {
 					compatible = "aspeed,ast2600-sdhci";
 					reg = <0x100 0x100>;
 					sdhci,auto-cmd12;
-- 
2.20.1

