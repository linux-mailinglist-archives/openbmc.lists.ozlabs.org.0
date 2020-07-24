Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FFC22BE50
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 08:53:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCg061Nk0zDrph
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 16:53:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=oS5wW1ZF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=AgRArbI+; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCfzK5kGNzDrh8
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 16:53:01 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B063C5C00E8;
 Fri, 24 Jul 2020 02:52:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 24 Jul 2020 02:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=5qKmND7AhISRQOPghEvNtacFjl
 8Uwsf1t8RPpClglVI=; b=oS5wW1ZFkP7CMCGnvFmImlpAhghJJ9lrAssV0+vywr
 Ax/CuL8GsfJO3VT/QdFWMOAcr9cOE5zgGw7e5BABTIBUUpkaNxoalHwhQRQRGQjQ
 d6id8ai+4+vuSVzVjIt7ktHS7lQaK9JUvkgNK46aTg/d5J3wkPkkTu6UJ+VAxi29
 LZFsqbZmYsoZMV4xPymP32RZYWC47adACjFUUedmkSnK0A2YBjOL91xa1ZFlqk9u
 okQIciaLg1u07yBBvOgickrcCoB3rBWjGLxgYP4n2RdvUCRiyHAQuf/MdbYFpV4I
 evIC8ZD/nvptCDptMaU1Cd301GJrpxYzOo4WllYw8hfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5qKmND7AhISRQOPgh
 EvNtacFjl8Uwsf1t8RPpClglVI=; b=AgRArbI+J26VzEZ9WjSa5GwIg34HmSjog
 lPX2uSAH97xYZ7A7eyO8YQ98fsIKA6SbpgNAhQkFvMuni1XAtdwBgTSpZxuh0jDD
 7EwTVouBJM4ubPXnN1Ef9zHvm7C96Ewkh3M9rCS6+0SCKfYl/Dq8vCLjT0RjKN/3
 9wyLJPxdGc20zH1Z/jasNua7t84y3CH8hJuKtFZ6IEW4w3rx/k/U3egSqMjVxRoe
 CefaHEZgxj0yiJQlIDdfU5cm9Vj+EgIv67DYyyJ/faaFbmZOAlaJQTHug77K70vH
 Z8knoDVLEreBmG969SjZecsQrHLlL8+2Qsv+gOP+ZM83iIAnic1oQ==
X-ME-Sender: <xms:SIUaX_0Akmz5C6pFogZDy48yK9vBawJkH3B7qLEKUy77dzrw_U6eJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrhedvgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecukfhppeeghedruddvgedrvddtfedrudehnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:SIUaX-HVP_7fDbMKBl4WBFb4uP3fxlijz03Q_rWxBmRdqrPeGcl0ug>
 <xmx:SIUaX_6OItw2kVuSFnpLflac6GTGX1MFBSaSMi7GwXz9Gc3-72TdHg>
 <xmx:SIUaX02COiLmECuZylilTB3g_v_qg-g-BJv_uVIPFXDzL5Gu1ovzpw>
 <xmx:SYUaX2SuUIGDrmWBHYFjdqpb2yxXX_JbIUmvijeDKnwDCC1vJnx9Zw>
Received: from localhost.localdomain (unknown [45.124.203.15])
 by mail.messagingengine.com (Postfix) with ESMTPA id 96AF63280059;
 Fri, 24 Jul 2020 02:52:55 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.7] ARM: dts: rainier: Describe GPIO mux on I2C3
Date: Fri, 24 Jul 2020 16:22:27 +0930
Message-Id: <20200724065227.317412-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We have a 4-bus mux whose output is selected by two GPIO inputs. Wire it
up in the devicetree and ensure the output is enabled by hogging the
appropriate line.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 1ae119afc2ab..e5ea680be121 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -12,6 +12,10 @@ / {
 
 	aliases {
 		serial4 = &uart5;
+		i2c16 = &i2c2mux0;
+		i2c17 = &i2c2mux1;
+		i2c18 = &i2c2mux2;
+		i2c19 = &i2c2mux3;
 	};
 
 	chosen {
@@ -68,6 +72,41 @@ ps3-presence {
 		};
 	};
 
+	i2c2mux: i2cmux {
+		compatible = "i2c-mux-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		i2c-parent = <&i2c2>;
+		mux-gpios = <&gpio0 ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>,
+			    <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
+		idle-state = <0>;
+
+		i2c2mux0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c2mux1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c2mux2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c2mux3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
 };
 
 &gpio0 {
@@ -109,6 +148,13 @@ pin_mclr_vpp {
 		output-high;
 		line-name = "mclr_vpp";
 	};
+
+	i2c3_mux_oe_n {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "I2C3_MUX_OE_N";
+	};
 };
 
 &emmc_controller {
-- 
2.25.1

