Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6720ABF48E
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:59:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGkW62qBzDqWh
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:59:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gA/PV6iB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="re6PQOP1"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGCT0dDVzDqq3
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:49 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B678971C;
 Thu, 26 Sep 2019 09:35:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=O+pg8BkuiYHoH
 5p2pfDfYlzd8HCIcAYvvlvoaWvakCQ=; b=gA/PV6iBlNyURiX35fKmTkXj4N3+z
 NtLgbF367ua2jkHs9HRTRSFm1Zf7tYOUqC9iMHWQ706eHMElUcNPOsBe4do1zJAO
 04iJ8S93Nk1t8CfdLe0voKTE8vSZ6zoFrR/uTyeUNqjChHqTem8o6Z2xvU+FaU9q
 O7IuFYCKIdcUJE+cN5kEgJ5r0dJ2Oes6y6CHQo+Vl1prJLZNSg/H460eEE7drjfh
 ri2xMVKaj07CpAAQYpTNjzRSmrTbwNhoCrWmqNmDVF1HzIgAop28ABGpLMU8bgoY
 LJ9OUydVbO+ITOFQVcip6DmnIRid2+IpJmiYrEYRdbQkHv6WG4SVvnyEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=O+pg8BkuiYHoH5p2pfDfYlzd8HCIcAYvvlvoaWvakCQ=; b=re6PQOP1
 TzsBlN/CKL7Z7fC4XIXII0AecXY5ZYIKcl9FFjEpMSjZMKMIUCiRdX3kDJnYdyl9
 JjTF6boGb75Ngp593l93GHhTG1RqJ+pW4YCSpZGv2o2dfIBid07Qfp6hYj2t7u1n
 uMJPQe0vgqewWSygmOmnOQ7FoTzWoAVHlEcsUhZSxjbpaxRd9hqBJAOanqXqtuOr
 xhMopa9Git88GUDKT4vnZjsBm7s6iuUhU4bGkXqvcMO85rM4umyyCmQ6FpC/k2cU
 SNZGwpAN4bWp0vG5oHwsTjJ9tP5f0lQCuVJLrC+CEQ3w4OvJg4SLtgv5whon1gQp
 EUQqoCoicVgkhg==
X-ME-Sender: <xms:sr6MXR_jC1sdzMfTYYpNSrDlguc4CQXEHStEtZl9TLBcG3TLJH9zxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepuddt
X-ME-Proxy: <xmx:sr6MXcd4EXI1t4EG9jCo2-X5qyDf0NTSOM1mZ11QUkERjYJ-rDiKgw>
 <xmx:sr6MXXIrGRP6F9Sp3s6RQ78wPnHteAXzcw34auAcSK7kz07aG0sWmQ>
 <xmx:sr6MXWQRVA7kQHo_MlILm2jHKa3uIQU9Zh5sSXIDESYG0a9-n-mT6w>
 <xmx:sr6MXRNDmIIFYOzuT4fHQeZCJk8erAP4LsDCXpMS_d2bWkN7RCH8_Q>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82F30D60068;
 Thu, 26 Sep 2019 09:35:44 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 13/15] ARM: dts: aspeed-g6: Add pinctrl
 properties to MDIO nodes
Date: Thu, 26 Sep 2019 23:06:06 +0930
Message-Id: <20190926133608.30566-14-andrew@aj.id.au>
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

This way enabling the MDIO controllers automatically requests the right
pinmux configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index ec791b54b81a..6ad1bc094f1c 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -165,6 +165,8 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_mdio1_default>;
 		};
 
 		mdio1: mdio@1e650008 {
@@ -173,6 +175,8 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_mdio2_default>;
 		};
 
 		mdio2: mdio@1e650010 {
@@ -181,6 +185,8 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_mdio3_default>;
 		};
 
 		mdio3: mdio@1e650018 {
@@ -189,6 +195,8 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_mdio4_default>;
 		};
 
 		mac0: ftgmac@1e660000 {
-- 
2.20.1

