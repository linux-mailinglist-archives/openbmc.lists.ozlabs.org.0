Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20D94C7B6
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2024 02:43:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YQUmqMJy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg4s543X9z2yY0
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2024 10:43:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YQUmqMJy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WftLp4251z2xb9;
	Fri,  9 Aug 2024 02:49:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4A3B4CE123B;
	Thu,  8 Aug 2024 16:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D86C32782;
	Thu,  8 Aug 2024 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723135789;
	bh=XTwEvmp5OlD/iluIen7qkHkb3qmv9F4vq/Wk3TaBQLE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=YQUmqMJyqdU4oeEzrlYd2G6SWv53HZ2MNeqqm+529DVoYhZma7BOnqdeO+undARkA
	 tLe18k5cKOl87nbLPQj7lWqVZbmdsohCCXrhwpSFzmjHCEgNMJL8z4ptE3+Qww00lJ
	 I68OcY2eRcX+9jfgONKofteISCVinfkzpTjiaDu/oV2TmAt/HEbRHy62b2ku4ru1TE
	 isN9kHOSM8E2fuWsXi0db+gAsb7P3bw74ueRbInjtXL6CGN8WZWI/Rpp77/jUamawL
	 rbPVK65DaCoN4543jRvqInPDWVHQ6agGVGStBHPrfRDHtGFXc6cUr+gze/rTGg2j4m
	 g01K8W2U3137w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Mark Jackson <mpfj@newflow.co.uk>,
	Tony Lindgren <tony@atomide.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
Date: Thu,  8 Aug 2024 10:49:38 -0600
Message-ID: <20240808164941.1407327-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Aug 2024 10:42:55 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

"lm75" without any vendor is undocumented. It works with the Linux
kernel since the I2C subsystem will do matches of the compatible string
without a vendor prefix to the i2c_device_id and/or driver name.

Mostly replace "lm75" with "national,lm75" as that's the original part
vendor and the compatible which matches what "lm75" matched with. In a
couple of cases the node name or compatible gives a clue to the actual
part and vendor and a more specific compatible can be used. In these
cases, it does change the variant the kernel picks.

"nct75" is an OnSemi part which is compatible with TI TMP75C based on
a comparison of the OnSemi NCT75 datasheet and configuration the Linux
driver uses. Adding an OnSemi compatible would be an ABI change.

"nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
Both are 11-bit resolution and 100ms sample time, so "national,lm75b" is
the closest match.

While we're here, fix the node names to use the generic name
"temperature-sensor".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.
---
 .../aspeed/aspeed-bmc-facebook-greatlakes.dts |  2 +-
 .../socfpga/socfpga_cyclone5_vining_fpga.dts  |  4 +--
 .../dts/marvell/armada-385-clearfog-gtr.dtsi  |  8 ++---
 .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts | 32 +++++++++----------
 .../boot/dts/nuvoton/nuvoton-npcm750-evb.dts  |  6 ++--
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts     |  4 +--
 arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi   |  4 +--
 .../dts/nxp/lpc/lpc4357-ea4357-devkit.dts     |  4 +--
 .../boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts  |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-
 .../boot/dts/xilinx/zynq-zturn-common.dtsi    |  4 +--
 11 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
index 998598c15fd0..49914a4a179f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts
@@ -201,7 +201,7 @@ eeprom@54 {
 &i2c12 {
 	status = "okay";
 	temperature-sensor@4f {
-		compatible = "lm75";
+		compatible = "national,lm75";
 		reg = <0x4f>;
 	};
 };
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
index 65f390bf8975..84f39dec3c42 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
@@ -130,8 +130,8 @@ gpio: pca9557@1f {
 		#gpio-cells = <2>;
 	};
 
-	temp: lm75@48 {
-		compatible = "lm75";
+	temp: temperature-sensor@48 {
+		compatible = "national,lm75";
 		reg = <0x48>;
 	};
 
diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index f3a3cb6ac311..8208c6a9627a 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -423,14 +423,14 @@ &i2c0 {
 	status = "okay";
 
 	/* U26 temperature sensor placed near SoC */
-	temp1: nct75@4c {
-		compatible = "lm75";
+	temp1: temperature-sensor@4c {
+		compatible = "ti,tmp75c";
 		reg = <0x4c>;
 	};
 
 	/* U27 temperature sensor placed near RTC battery */
-	temp2: nct75@4d {
-		compatible = "lm75";
+	temp2: temperature-sensor@4d {
+		compatible = "ti,tmp75c";
 		reg = <0x4d>;
 	};
 
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
index 1f07ba382910..886a87dfcd0d 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
@@ -531,8 +531,8 @@ i2c@4 {
 			reg = <4>;
 
 			// INLET1_T
-			lm75@5c {
-				compatible = "ti,lm75";
+			temperature-sensor@5c {
+				compatible = "national,lm75";
 				reg = <0x5c>;
 			};
 		};
@@ -543,8 +543,8 @@ i2c@5 {
 			reg = <5>;
 
 			// OUTLET1_T
-			lm75@5c {
-				compatible = "ti,lm75";
+			temperature-sensor@5c {
+				compatible = "national,lm75";
 				reg = <0x5c>;
 			};
 		};
@@ -555,8 +555,8 @@ i2c@6 {
 			reg = <6>;
 
 			// OUTLET2_T
-			lm75@5c {
-				compatible = "ti,lm75";
+			temperature-sensor@5c {
+				compatible = "national,lm75";
 				reg = <0x5c>;
 			};
 		};
@@ -567,8 +567,8 @@ i2c@7 {
 			reg = <7>;
 
 			// OUTLET3_T
-			lm75@5c {
-				compatible = "ti,lm75";
+			temperature-sensor@5c {
+				compatible = "national,lm75";
 				reg = <0x5c>;
 			};
 		};
@@ -697,8 +697,8 @@ i2c@3 {
 			reg = <3>;
 
 			// M2_ZONE_T
-			lm75@28 {
-				compatible = "ti,lm75";
+			temperature-sensor@28 {
+				compatible = "national,lm75";
 				reg = <0x28>;
 			};
 		};
@@ -709,8 +709,8 @@ i2c@4 {
 			reg = <4>;
 
 			// BATT_ZONE_T
-			lm75@29 {
-				compatible = "ti,lm75";
+			temperature-sensor@29 {
+				compatible = "national,lm75";
 				reg = <0x29>;
 			};
 		};
@@ -721,8 +721,8 @@ i2c@5 {
 			reg = <5>;
 
 			// NBM1_ZONE_T
-			lm75@28 {
-				compatible = "ti,lm75";
+			temperature-sensor@28 {
+				compatible = "national,lm75";
 				reg = <0x28>;
 			};
 		};
@@ -732,8 +732,8 @@ i2c@6 {
 			reg = <6>;
 
 			// NBM2_ZONE_T
-			lm75@29 {
-				compatible = "ti,lm75";
+			temperature-sensor@29 {
+				compatible = "national,lm75";
 				reg = <0x29>;
 			};
 		};
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
index f53d45fa1de8..bcdcb30c7bf6 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
@@ -198,7 +198,7 @@ &i2c0 {
 	clock-frequency = <100000>;
 	status = "okay";
 	lm75@48 {
-		compatible = "lm75";
+		compatible = "national,lm75";
 		reg = <0x48>;
 		status = "okay";
 	};
@@ -208,8 +208,8 @@ lm75@48 {
 &i2c1 {
 	clock-frequency = <100000>;
 	status = "okay";
-	lm75@48 {
-		compatible = "lm75";
+	temperature-sensor@48 {
+		compatible = "national,lm75";
 		reg = <0x48>;
 		status = "okay";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
index 2117de872703..d155b3ec22ef 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
@@ -175,8 +175,8 @@ expander: pca9554@20 {
 		gpio-controller;
 	};
 
-	sensor2: lm75@49 {
-		compatible = "lm75";
+	sensor2: temperature-sensor@49 {
+		compatible = "national,lm75";
 		reg = <0x49>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
index b2d7271d1d24..d01c3aee0272 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi
@@ -254,8 +254,8 @@ pmic: mc34708@8 {
 		interrupts = <6 4>; /* PATA_DATA6, active high */
 	};
 
-	sensor1: lm75@48 {
-		compatible = "lm75";
+	sensor1: temperature-sensor@48 {
+		compatible = "national,lm75";
 		reg = <0x48>;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
index 224f80a4a31d..4aefbc01dfc0 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dts
@@ -482,8 +482,8 @@ mma7455@1d {
 		reg = <0x1d>;
 	};
 
-	lm75@48 {
-		compatible = "nxp,lm75";
+	temperature-sensor@48 {
+		compatible = "national,lm75b";
 		reg = <0x48>;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
index 1f84654df50c..846afb8ccbf1 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
@@ -511,7 +511,7 @@ &i2c1 {
 	clock-frequency = <400000>;
 
 	sensor@49 {
-		compatible = "lm75";
+		compatible = "national,lm75";
 		reg = <0x49>;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/am335x-nano.dts b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
index 26b5510cb3d1..56929059f5af 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-nano.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
@@ -231,7 +231,7 @@ tps: tps@24 {
 	};
 
 	temperature-sensor@48 {
-		compatible = "lm75";
+		compatible = "national,lm75";
 		reg = <0x48>;
 	};
 
diff --git a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
index dfb1fbafe3aa..33b02e05ce82 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-zturn-common.dtsi
@@ -97,9 +97,9 @@ &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	stlm75@49 {
+	temperature-sensor@49 {
 		status = "okay";
-		compatible = "lm75";
+		compatible = "st,stlm75";
 		reg = <0x49>;
 	};
 
-- 
2.43.0

