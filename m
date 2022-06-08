Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CECA542169
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHxmZ3fCcz3byX
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:15:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHxly1DmGz3bXR
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:15:10 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LHxlt4LPfz4xXF;
	Wed,  8 Jun 2022 16:15:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LHxlr5Hrtz4xD9;
	Wed,  8 Jun 2022 16:15:04 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] ARM: dts: aspeed: Remove "spi-flash" compatible
Date: Wed,  8 Jun 2022 08:14:55 +0200
Message-Id: <20220608061455.365123-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608061455.365123-1-clg@kaod.org>
References: <20220608061455.365123-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The underlying SoC definitions use compatible "jedec,spi-nor", so does
the aspeed SPI driver, this to be in sync with Linux and the latest
U-Boot.

Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/dts/ast2400-evb.dts       | 4 ----
 arch/arm/dts/ast2400-palmetto.dts  | 4 ----
 arch/arm/dts/ast2500-evb.dts       | 4 ----
 arch/arm/dts/ast2600-bletchley.dts | 8 --------
 arch/arm/dts/ast2600-evb.dts       | 8 --------
 arch/arm/dts/ast2600-fpga.dts      | 2 --
 arch/arm/dts/ast2600-intel.dts     | 8 --------
 arch/arm/dts/ast2600-ncsi.dts      | 8 --------
 arch/arm/dts/ast2600-pfr.dts       | 8 --------
 arch/arm/dts/ast2600-rainier.dts   | 2 --
 arch/arm/dts/ast2600-s6q.dts       | 2 --
 arch/arm/dts/ast2600-slt.dts       | 8 --------
 arch/arm/dts/ast2600-tacoma.dts    | 2 --
 arch/arm/dts/ast2600a0-evb.dts     | 8 --------
 arch/arm/dts/ast2600a1-evb.dts     | 8 --------
 15 files changed, 84 deletions(-)

diff --git a/arch/arm/dts/ast2400-evb.dts b/arch/arm/dts/ast2400-evb.dts
index 2ba15d17deda..402a1fa924a3 100644
--- a/arch/arm/dts/ast2400-evb.dts
+++ b/arch/arm/dts/ast2400-evb.dts
@@ -60,7 +60,6 @@
 &fmc {
 	status = "okay";
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -68,7 +67,6 @@
 	};
 
 	flash@1 {
-                compatible = "spi-flash", "sst,w25q256";
                 status = "okay";
                 spi-max-frequency = <50000000>;
                 spi-tx-bus-width = <2>;
@@ -81,7 +79,6 @@
 	flash@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_spi1_default>;
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -90,7 +87,6 @@
 	flash@1 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1cs1_default>;
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
diff --git a/arch/arm/dts/ast2400-palmetto.dts b/arch/arm/dts/ast2400-palmetto.dts
index a512f602d2f1..db566f899f63 100644
--- a/arch/arm/dts/ast2400-palmetto.dts
+++ b/arch/arm/dts/ast2400-palmetto.dts
@@ -63,7 +63,6 @@
 &fmc {
 	status = "okay";
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -71,7 +70,6 @@
 	};
 
 	flash@1 {
-                compatible = "spi-flash", "sst,w25q256";
                 status = "okay";
                 spi-max-frequency = <50000000>;
                 spi-tx-bus-width = <2>;
@@ -84,7 +82,6 @@
 	flash@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_spi1_default>;
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -93,7 +90,6 @@
 	flash@1 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1cs1_default>;
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
diff --git a/arch/arm/dts/ast2500-evb.dts b/arch/arm/dts/ast2500-evb.dts
index f668eec5c137..a6cd74d41c78 100644
--- a/arch/arm/dts/ast2500-evb.dts
+++ b/arch/arm/dts/ast2500-evb.dts
@@ -65,7 +65,6 @@
 &fmc {
 	status = "okay";
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -73,7 +72,6 @@
 	};
 
 	flash@1 {
-                compatible = "spi-flash", "sst,w25q256";
                 status = "okay";
                 spi-max-frequency = <50000000>;
                 spi-tx-bus-width = <2>;
@@ -86,7 +84,6 @@
 	flash@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_spi1_default>;
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -95,7 +92,6 @@
 	flash@1 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1cs1_default>;
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
diff --git a/arch/arm/dts/ast2600-bletchley.dts b/arch/arm/dts/ast2600-bletchley.dts
index 57ca845b94a7..bc907e213481 100644
--- a/arch/arm/dts/ast2600-bletchley.dts
+++ b/arch/arm/dts/ast2600-bletchley.dts
@@ -87,7 +87,6 @@
 	pinctrl-0 = <&pinctrl_fmcquad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -95,7 +94,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -103,7 +101,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -120,7 +117,6 @@
 			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -128,7 +124,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -144,7 +139,6 @@
 			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -152,7 +146,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -160,7 +153,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/arm/dts/ast2600-evb.dts b/arch/arm/dts/ast2600-evb.dts
index 3aeef78df22d..14a001daee95 100644
--- a/arch/arm/dts/ast2600-evb.dts
+++ b/arch/arm/dts/ast2600-evb.dts
@@ -122,7 +122,6 @@
 	pinctrl-0 = <&pinctrl_fmcquad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -130,7 +129,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -138,7 +136,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -155,7 +152,6 @@
 			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -163,7 +159,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -179,7 +174,6 @@
 			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -187,7 +181,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -195,7 +188,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/arm/dts/ast2600-fpga.dts b/arch/arm/dts/ast2600-fpga.dts
index be0788d92473..5ff27b78a4de 100644
--- a/arch/arm/dts/ast2600-fpga.dts
+++ b/arch/arm/dts/ast2600-fpga.dts
@@ -76,7 +76,6 @@
 &fmc {
 	status = "okay";
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -84,7 +83,6 @@
 	};
 
 	flash@1 {
-                compatible = "spi-flash", "sst,w25q256";
                 status = "okay";
                 spi-max-frequency = <50000000>;
                 spi-tx-bus-width = <2>;
diff --git a/arch/arm/dts/ast2600-intel.dts b/arch/arm/dts/ast2600-intel.dts
index 19d19f6ef52a..d2c8bc2cd45f 100644
--- a/arch/arm/dts/ast2600-intel.dts
+++ b/arch/arm/dts/ast2600-intel.dts
@@ -123,7 +123,6 @@
 	pinctrl-0 = <&pinctrl_fmcquad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -131,7 +130,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -139,7 +137,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -156,7 +153,6 @@
 			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -164,7 +160,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -180,7 +175,6 @@
 			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -188,7 +182,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -196,7 +189,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/arm/dts/ast2600-ncsi.dts b/arch/arm/dts/ast2600-ncsi.dts
index f55294cdf95e..000fd796764f 100644
--- a/arch/arm/dts/ast2600-ncsi.dts
+++ b/arch/arm/dts/ast2600-ncsi.dts
@@ -124,7 +124,6 @@
 	pinctrl-0 = <&pinctrl_fmcquad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -132,7 +131,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -140,7 +138,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -157,7 +154,6 @@
 			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -165,7 +161,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -181,7 +176,6 @@
 			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -189,7 +183,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -197,7 +190,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/arm/dts/ast2600-pfr.dts b/arch/arm/dts/ast2600-pfr.dts
index 8596207f5463..e035a68e970f 100644
--- a/arch/arm/dts/ast2600-pfr.dts
+++ b/arch/arm/dts/ast2600-pfr.dts
@@ -124,7 +124,6 @@
 	timing-calibration-disabled;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-tx-bus-width = <1>;
@@ -132,7 +131,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-tx-bus-width = <1>;
@@ -140,7 +138,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <25000000>;
 		spi-tx-bus-width = <1>;
@@ -158,7 +155,6 @@
 	timing-calibration-disabled;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-tx-bus-width = <1>;
@@ -166,7 +162,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-tx-bus-width = <1>;
@@ -183,7 +178,6 @@
 	timing-calibration-disabled;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-tx-bus-width = <1>;
@@ -191,7 +185,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <25000000>;
 		spi-tx-bus-width = <1>;
@@ -199,7 +192,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <25000000>;
 		spi-tx-bus-width = <1>;
diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index aa91b12ed399..d1e99aa2d066 100755
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-rainier.dts
@@ -74,7 +74,6 @@
 
 	flash@0 {
 		// TODO: what compatible strings should be here?
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -82,7 +81,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
diff --git a/arch/arm/dts/ast2600-s6q.dts b/arch/arm/dts/ast2600-s6q.dts
index 52b620d3b4fe..b98cd8c980c2 100644
--- a/arch/arm/dts/ast2600-s6q.dts
+++ b/arch/arm/dts/ast2600-s6q.dts
@@ -92,7 +92,6 @@
 	pinctrl-0 = <&pinctrl_fmcquad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -108,7 +107,6 @@
 			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/arm/dts/ast2600-slt.dts b/arch/arm/dts/ast2600-slt.dts
index 93c5d86ce379..332620dc1aec 100644
--- a/arch/arm/dts/ast2600-slt.dts
+++ b/arch/arm/dts/ast2600-slt.dts
@@ -122,7 +122,6 @@
 	pinctrl-0 = <&pinctrl_fmcquad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -130,7 +129,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -138,7 +136,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -155,7 +152,6 @@
 			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -163,7 +159,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -179,7 +174,6 @@
 			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -187,7 +181,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -195,7 +188,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
index 67b3e3013c6b..a29e7e7fa23a 100755
--- a/arch/arm/dts/ast2600-tacoma.dts
+++ b/arch/arm/dts/ast2600-tacoma.dts
@@ -65,7 +65,6 @@
 
 	flash@0 {
 		// TODO: what compatible strings should be here?
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
@@ -73,7 +72,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <2>;
diff --git a/arch/arm/dts/ast2600a0-evb.dts b/arch/arm/dts/ast2600a0-evb.dts
index b242215536a5..08b71ab29984 100644
--- a/arch/arm/dts/ast2600a0-evb.dts
+++ b/arch/arm/dts/ast2600a0-evb.dts
@@ -115,7 +115,6 @@
 	pinctrl-0 = <&pinctrl_fmcquad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -123,7 +122,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -131,7 +129,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -148,7 +145,6 @@
 			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -156,7 +152,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -172,7 +167,6 @@
 			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -180,7 +174,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -188,7 +181,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/arm/dts/ast2600a1-evb.dts b/arch/arm/dts/ast2600a1-evb.dts
index 6bd498d471e2..61decb539e6f 100644
--- a/arch/arm/dts/ast2600a1-evb.dts
+++ b/arch/arm/dts/ast2600a1-evb.dts
@@ -122,7 +122,6 @@
 	pinctrl-0 = <&pinctrl_fmcquad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -130,7 +129,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -138,7 +136,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -155,7 +152,6 @@
 			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -163,7 +159,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -179,7 +174,6 @@
 			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
 
 	flash@0 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -187,7 +181,6 @@
 	};
 
 	flash@1 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
@@ -195,7 +188,6 @@
 	};
 
 	flash@2 {
-		compatible = "spi-flash", "sst,w25q256";
 		status = "disabled";
 		spi-max-frequency = <50000000>;
 		spi-tx-bus-width = <4>;
-- 
2.35.3

