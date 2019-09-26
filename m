Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB48BF491
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:01:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGmd4LrhzDqWk
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 00:01:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZE5WnbBW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gHIiHcPi"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGCW1Fm2zDqrN
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:51 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0D56F71F;
 Thu, 26 Sep 2019 09:35:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=X7ByzFya/YVPi
 KyPOxtsue3F6yEjygv3kl0y1LRBbYk=; b=ZE5WnbBWI8wvesQHIAkGDWzTF1Wls
 GGvVA7u2Oq0noLgKBEGe06PaaoCasCibV9DDk6lgYYoAXNXvTCfCvcSEjdqYlggB
 rHx79hWmTXuN/QrE81H6+eztA/JuLg62KGUKLeRvWqwnOjbYFT5aeQ6p903qDJK/
 BAj+DzfNlf5a6/d8sjOemXCwCvBXWMLBmFgIj0uEF8LCoWn84a66vzW1OxpCpTBo
 dbgNdfUWDIi51Eb344tRNweJ2IbOpGAOwTywUYzOG/JUKapYRx9tQY05Ns+5pPdX
 EQnrZ1K7wBV26SXgDEruhPSG1WlhqjTrzobi0Rridopmmrnz4k0OaBKDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=X7ByzFya/YVPiKyPOxtsue3F6yEjygv3kl0y1LRBbYk=; b=gHIiHcPi
 OFqRZuazLEYPk6dTs2BX/t1yBfA0Z576Moqm1e+MifQvmS/ppa+ecLl7mmqHXr2T
 qYiheDmn+IV4373YpfCg6Pld/1BJfEc3BDINmKLKtpuG3CGJO/soQ+g3Hd+j5xym
 w3S5cwG82/x0dQL13BqfkhG4xg8kY4rX39eCtK81Dl8o/JJaHjp5FIHLVVCsy9jk
 O6jWwEhkPUmGKuLYTX3oMfnPRpxXIPl6Dwl7v4Idp9AbdL1ejMd/w1SWRDjFNJaU
 si4BV11YmFQWJKwUwH1AD2BYnYfpSHnDICdX8lZe946a1oeojQrgnbhBqLTN0D38
 Vh2BZB316jRMKw==
X-ME-Sender: <xms:tL6MXX_bGTC-FYz5I3C39AdPrfRL_aaLX2TQ5fv0JWzPrF7wB3CEog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepuddv
X-ME-Proxy: <xmx:tL6MXarsLUYeOewGzerfAEBFzQpeTkKoJEIMa6SHuotUhrQNUZDViw>
 <xmx:tL6MXaHS1W7KuJIFae2lf-YP_qDBawarWPJSbIQ9CuC5sPHNQKZz2w>
 <xmx:tL6MXamMaTuw_KqMA_JXtRjs3q5s6f5n4Ix29JDJJLLEANmEjiduTg>
 <xmx:tL6MXatqW1Yh4wpJ-mYZYaKdBQksmW-_IxS879yywI_1cng_KmbrXg>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB9A8D6006A;
 Thu, 26 Sep 2019 09:35:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 14/15] ARM: dts: ast2600-evb: Add pinmux
 properties for enabled MACs
Date: Thu, 26 Sep 2019 23:06:07 +0930
Message-Id: <20190926133608.30566-15-andrew@aj.id.au>
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

All 2600-evb MACs use RGMII/MDIO.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 0b3d3978c4d3..0392e9162f11 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -55,6 +55,9 @@
 
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default>;
 };
 
 &mac2 {
@@ -62,6 +65,9 @@
 
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy2>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
 };
 
 &mac3 {
@@ -69,6 +75,9 @@
 
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy3>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
 };
 
 &emmc_controller {
-- 
2.20.1

