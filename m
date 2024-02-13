Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03363855722
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 00:18:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uq/cra+O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZvJR5n6mz3dWd
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 10:18:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uq/cra+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZBPK38H5z3bsZ;
	Wed, 14 Feb 2024 06:35:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 417D3CE1E4E;
	Tue, 13 Feb 2024 19:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A369C433F1;
	Tue, 13 Feb 2024 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707852914;
	bh=4Zpy6Fq10ZT4oxTOl1hGgWJorEsl5o5GSajUDH5vicQ=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:From;
	b=uq/cra+ORSqNy+RKIZzyCD5ufPXyIJXrCykNIuKUJudXi4N75iZHKkGvYpkcL0Na8
	 90jly24nDmhZpWP87fbgWmoTrj3uqHR5386ddk/V7p5Ccpt4bxOLv+PfRGAyBuPNx4
	 nlC81PJ7OFLpQdO3TJTuPDbMJ7jX/Rx5UEo0SbqpuTFkN1R9z6Jey7A65Unj4/qmmm
	 eaI+YestHqZ85Uviol1oueos05E0Ypq+tGXUe6ARBNWgEJczwvKdTAvDeC92Io9GBH
	 D1x0I0WPdObVzk3AKkeCsyoqOhCaeCs2H7QQOt5aOmUkyPOW43yHFhfaxrfckJlqeP
	 x1OILzwqmkblQ==
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Feb 2024 13:34:26 -0600
Subject: [PATCH 2/6] arm: dts: Fix dtc interrupt_provider warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
To: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, 
 Antoine Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
X-Mailer: b4 0.13-dev
X-Mailman-Approved-At: Thu, 15 Feb 2024 10:16:12 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The dtc interrupt_provider warning is off by default. Fix all the warnings
so it can be enabled.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/amazon/alpine.dtsi                   |  1 -
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi                | 14 --------------
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi                | 15 +--------------
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                | 18 ++----------------
 arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi             |  3 +++
 arch/arm/boot/dts/broadcom/bcm-hr2.dtsi                |  1 +
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi                |  2 ++
 arch/arm/boot/dts/marvell/kirkwood-l-50.dts            |  2 ++
 arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi         |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi      |  1 -
 arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi           |  1 -
 arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi          |  1 -
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts             |  3 ---
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi          |  1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi         |  1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi           |  1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi   |  1 +
 .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi   |  1 +
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts         |  1 +
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dts       |  1 +
 arch/arm/boot/dts/st/stm32429i-eval.dts                |  1 -
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts               |  1 -
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts      |  1 -
 24 files changed, 18 insertions(+), 58 deletions(-)

diff --git a/arch/arm/boot/dts/amazon/alpine.dtsi b/arch/arm/boot/dts/amazon/alpine.dtsi
index ff68dfb4eb78..90bd12feac01 100644
--- a/arch/arm/boot/dts/amazon/alpine.dtsi
+++ b/arch/arm/boot/dts/amazon/alpine.dtsi
@@ -167,7 +167,6 @@ pcie@fbc00000 {
 		msix: msix@fbe00000 {
 			compatible = "al,alpine-msix";
 			reg = <0x0 0xfbe00000 0x0 0x100000>;
-			interrupt-controller;
 			msi-controller;
 			al,msi-base-spi = <96>;
 			al,msi-num-spis = <64>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index 530491ae5eb2..857cb26ed6d7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -466,7 +466,6 @@ i2c_ic: interrupt-controller@0 {
 	i2c0: i2c-bus@40 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x40 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -482,7 +481,6 @@ i2c0: i2c-bus@40 {
 	i2c1: i2c-bus@80 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x80 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -498,7 +496,6 @@ i2c1: i2c-bus@80 {
 	i2c2: i2c-bus@c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0xc0 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -515,7 +512,6 @@ i2c2: i2c-bus@c0 {
 	i2c3: i2c-bus@100 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x100 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -532,7 +528,6 @@ i2c3: i2c-bus@100 {
 	i2c4: i2c-bus@140 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x140 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -549,7 +544,6 @@ i2c4: i2c-bus@140 {
 	i2c5: i2c-bus@180 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x180 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -566,7 +560,6 @@ i2c5: i2c-bus@180 {
 	i2c6: i2c-bus@1c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x1c0 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -583,7 +576,6 @@ i2c6: i2c-bus@1c0 {
 	i2c7: i2c-bus@300 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x300 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -600,7 +592,6 @@ i2c7: i2c-bus@300 {
 	i2c8: i2c-bus@340 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x340 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -617,7 +608,6 @@ i2c8: i2c-bus@340 {
 	i2c9: i2c-bus@380 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x380 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -634,7 +624,6 @@ i2c9: i2c-bus@380 {
 	i2c10: i2c-bus@3c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x3c0 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -651,7 +640,6 @@ i2c10: i2c-bus@3c0 {
 	i2c11: i2c-bus@400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x400 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -668,7 +656,6 @@ i2c11: i2c-bus@400 {
 	i2c12: i2c-bus@440 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x440 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
@@ -685,7 +672,6 @@ i2c12: i2c-bus@440 {
 	i2c13: i2c-bus@480 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x480 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 04f98d1dbb97..e6f3cf3c721e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -363,6 +363,7 @@ sgpio: sgpio@1e780200 {
 				interrupts = <40>;
 				reg = <0x1e780200 0x0100>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				#interrupt-cells = <2>;
 				interrupt-controller;
 				bus-frequency = <12000000>;
 				pinctrl-names = "default";
@@ -594,7 +595,6 @@ i2c_ic: interrupt-controller@0 {
 	i2c0: i2c-bus@40 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x40 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -610,7 +610,6 @@ i2c0: i2c-bus@40 {
 	i2c1: i2c-bus@80 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x80 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -626,7 +625,6 @@ i2c1: i2c-bus@80 {
 	i2c2: i2c-bus@c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0xc0 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -643,7 +641,6 @@ i2c2: i2c-bus@c0 {
 	i2c3: i2c-bus@100 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x100 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -660,7 +657,6 @@ i2c3: i2c-bus@100 {
 	i2c4: i2c-bus@140 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x140 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -677,7 +673,6 @@ i2c4: i2c-bus@140 {
 	i2c5: i2c-bus@180 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x180 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -694,7 +689,6 @@ i2c5: i2c-bus@180 {
 	i2c6: i2c-bus@1c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x1c0 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -711,7 +705,6 @@ i2c6: i2c-bus@1c0 {
 	i2c7: i2c-bus@300 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x300 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -728,7 +721,6 @@ i2c7: i2c-bus@300 {
 	i2c8: i2c-bus@340 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x340 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -745,7 +737,6 @@ i2c8: i2c-bus@340 {
 	i2c9: i2c-bus@380 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x380 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -762,7 +753,6 @@ i2c9: i2c-bus@380 {
 	i2c10: i2c-bus@3c0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x3c0 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -779,7 +769,6 @@ i2c10: i2c-bus@3c0 {
 	i2c11: i2c-bus@400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x400 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -796,7 +785,6 @@ i2c11: i2c-bus@400 {
 	i2c12: i2c-bus@440 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x440 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
@@ -813,7 +801,6 @@ i2c12: i2c-bus@440 {
 	i2c13: i2c-bus@480 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 
 		reg = <0x480 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index c4d1faade8be..29f94696d8b1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -474,6 +474,7 @@ sgpiom0: sgpiom@1e780500 {
 				reg = <0x1e780500 0x100>;
 				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				#interrupt-cells = <2>;
 				interrupt-controller;
 				bus-frequency = <12000000>;
 				pinctrl-names = "default";
@@ -488,6 +489,7 @@ sgpiom1: sgpiom@1e780600 {
 				reg = <0x1e780600 0x100>;
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
+				#interrupt-cells = <2>;
 				interrupt-controller;
 				bus-frequency = <12000000>;
 				pinctrl-names = "default";
@@ -902,7 +904,6 @@ &i2c {
 	i2c0: i2c-bus@80 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x80 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -917,7 +918,6 @@ i2c0: i2c-bus@80 {
 	i2c1: i2c-bus@100 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x100 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -932,7 +932,6 @@ i2c1: i2c-bus@100 {
 	i2c2: i2c-bus@180 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x180 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -947,7 +946,6 @@ i2c2: i2c-bus@180 {
 	i2c3: i2c-bus@200 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x200 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -962,7 +960,6 @@ i2c3: i2c-bus@200 {
 	i2c4: i2c-bus@280 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x280 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -977,7 +974,6 @@ i2c4: i2c-bus@280 {
 	i2c5: i2c-bus@300 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x300 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -992,7 +988,6 @@ i2c5: i2c-bus@300 {
 	i2c6: i2c-bus@380 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x380 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1007,7 +1002,6 @@ i2c6: i2c-bus@380 {
 	i2c7: i2c-bus@400 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x400 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1022,7 +1016,6 @@ i2c7: i2c-bus@400 {
 	i2c8: i2c-bus@480 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x480 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1037,7 +1030,6 @@ i2c8: i2c-bus@480 {
 	i2c9: i2c-bus@500 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x500 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1052,7 +1044,6 @@ i2c9: i2c-bus@500 {
 	i2c10: i2c-bus@580 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x580 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1067,7 +1058,6 @@ i2c10: i2c-bus@580 {
 	i2c11: i2c-bus@600 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x600 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1082,7 +1072,6 @@ i2c11: i2c-bus@600 {
 	i2c12: i2c-bus@680 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x680 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1097,7 +1086,6 @@ i2c12: i2c-bus@680 {
 	i2c13: i2c-bus@700 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x700 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1112,7 +1100,6 @@ i2c13: i2c-bus@700 {
 	i2c14: i2c-bus@780 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x780 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
@@ -1127,7 +1114,6 @@ i2c14: i2c-bus@780 {
 	i2c15: i2c-bus@800 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		#interrupt-cells = <1>;
 		reg = <0x800 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB2>;
diff --git a/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi b/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
index f9f79ed82518..07ca0d993c9f 100644
--- a/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
@@ -167,6 +167,7 @@ gpio_crmu: gpio@3024800 {
 			#gpio-cells = <2>;
 			gpio-controller;
 			interrupt-controller;
+			#interrupt-cells = <2>;
 			interrupt-parent = <&mailbox>;
 			interrupts = <0>;
 		};
@@ -247,6 +248,7 @@ gpio_ccm: gpio@1800a000 {
 			gpio-controller;
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		i2c1: i2c@1800b000 {
@@ -518,6 +520,7 @@ gpio_asiu: gpio@180a5000 {
 			gpio-controller;
 
 			interrupt-controller;
+			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-ranges = <&pinctrl 0 42 1>,
 					<&pinctrl 1 44 3>,
diff --git a/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi b/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
index 788a6806191a..75545b10ef2f 100644
--- a/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
@@ -200,6 +200,7 @@ gpiob: gpio@30000 {
 			gpio-controller;
 			ngpios = <4>;
 			interrupt-controller;
+			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 9d20ba3b1ffb..6a4482c93167 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -180,6 +180,7 @@ gpioa: gpio@20 {
 			gpio-controller;
 			ngpios = <32>;
 			interrupt-controller;
+			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-ranges = <&pinctrl 0 0 32>;
 		};
@@ -352,6 +353,7 @@ gpiob: gpio@30000 {
 			gpio-controller;
 			ngpios = <4>;
 			interrupt-controller;
+			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-l-50.dts b/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
index dffb9f84e67c..c841eb8e7fb1 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
@@ -65,6 +65,7 @@ i2c@11000 {
 			gpio2: gpio-expander@20 {
 				#gpio-cells = <2>;
 				#interrupt-cells = <2>;
+				interrupt-controller;
 				compatible = "semtech,sx1505q";
 				reg = <0x20>;
 
@@ -79,6 +80,7 @@ gpio2: gpio-expander@20 {
 			gpio3: gpio-expander@21 {
 				#gpio-cells = <2>;
 				#interrupt-cells = <2>;
+				interrupt-controller;
 				compatible = "semtech,sx1505q";
 				reg = <0x21>;
 
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
index fd671c7a1e5d..6e1f0f164cb4 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
@@ -120,6 +120,7 @@ gpio0: gpio@0 {
 				interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
 					     <3 IRQ_TYPE_LEVEL_HIGH>,
 					     <4 IRQ_TYPE_LEVEL_HIGH>;
+				#interrupt-cells = <2>;
 				interrupt-controller;
 			};
 
@@ -128,6 +129,7 @@ gpio1: gpio@1 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+				#interrupt-cells = <2>;
 				interrupt-controller;
 			};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
index 1640763fd4af..ff0d684622f7 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
@@ -997,7 +997,6 @@ touchscreen@41 {
 			compatible = "st,stmpe811";
 			reg = <0x41>;
 			irq-gpio = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
-			interrupt-controller;
 			id = <0>;
 			blocks = <0x5>;
 			irq-trigger = <0x1>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi b/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
index 3b6fad273cab..d38f1dd38a90 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
@@ -980,7 +980,6 @@ touchscreen@41 {
 			compatible = "st,stmpe811";
 			reg = <0x41>;
 			irq-gpio = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
-			interrupt-controller;
 			id = <0>;
 			blocks = <0x5>;
 			irq-trigger = <0x1>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi b/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
index 4eb526fe9c55..81c8a5fd92cc 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
@@ -861,7 +861,6 @@ touchscreen@41 {
 			compatible = "st,stmpe811";
 			reg = <0x41>;
 			irq-gpio = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
-			interrupt-controller;
 			id = <0>;
 			blocks = <0x5>;
 			irq-trigger = <0x1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index db8c332df6a1..cad112e05475 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -227,7 +227,6 @@ bridge@1,0 {
 
 		#address-cells = <3>;
 		#size-cells = <2>;
-		#interrupt-cells = <1>;
 
 		bridge@2,1 {
 			compatible = "pci10b5,8605";
@@ -235,7 +234,6 @@ bridge@2,1 {
 
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <1>;
 
 			/* Intel Corporation I210 Gigabit Network Connection */
 			ethernet@3,0 {
@@ -250,7 +248,6 @@ bridge@2,2 {
 
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <1>;
 
 			/* Intel Corporation I210 Gigabit Network Connection */
 			switch_nic: ethernet@4,0 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index 99f4f6ac71d4..c1ae7c47b442 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -245,6 +245,7 @@ pca9539: pca9539@74 {
 				reg = <0x74>;
 				gpio-controller;
 				#gpio-cells = <2>;
+				#interrupt-cells = <2>;
 				interrupt-controller;
 				interrupt-parent = <&gpio2>;
 				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
@@ -390,7 +391,6 @@ pci_root: root@0,0 {
 
 		#address-cells = <3>;
 		#size-cells = <2>;
-		#interrupt-cells = <1>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 2ae93f57fe5a..ea40623d12e5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -626,7 +626,6 @@ stmpe811@41 {
 		blocks = <0x5>;
 		id = <0>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
 		interrupt-parent = <&gpio4>;
 		irq-trigger = <0x1>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 55c90f6393ad..d3a7a6eeb8e0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -550,7 +550,6 @@ stmpe811@41 {
 		blocks = <0x5>;
 		interrupts = <20 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio6>;
-		interrupt-controller;
 		id = <0>;
 		irq-trigger = <0x1>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
index a63e73adc1fc..42b2ba23aefc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
@@ -225,7 +225,6 @@ da9063: pmic@58 {
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
 
 		onkey {
 			compatible = "dlg,da9063-onkey";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
index 113974520d54..c0c47adc5866 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
@@ -124,6 +124,7 @@ pmic@58 {
 		reg = <0x58>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>; /* active-low GPIO2_9 */
+		#interrupt-cells = <2>;
 		interrupt-controller;
 
 		regulators {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
index 86b4269e0e01..85e278eb2016 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
@@ -100,6 +100,7 @@ pmic: pmic@58 {
 		interrupt-parent = <&gpio1>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-controller;
+		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts
index 12361fcbe24a..1b965652291b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts
@@ -63,6 +63,7 @@ pca9554: io-expander@25 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		#interrupt-cells = <2>;
+		interrupt-controller;
 		reg = <0x25>;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dts
index b0ed68af0546..029f49be40e3 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dts
@@ -338,6 +338,7 @@ gpio6: io-expander@22 {
 		reg = <0x22>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
 		interrupt-controller;
 		interrupt-parent = <&gpio3>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
index 576235ec3c51..afa417b34b25 100644
--- a/arch/arm/boot/dts/st/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
@@ -222,7 +222,6 @@ stmpe1600: stmpe1600@42 {
 		reg = <0x42>;
 		interrupts = <8 3>;
 		interrupt-parent = <&gpioi>;
-		interrupt-controller;
 		wakeup-source;
 
 		stmpegpio: stmpe_gpio {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 510cca5acb79..7a701f7ef0c7 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -64,7 +64,6 @@ touchscreen@38 {
 		reg = <0x38>;
 		interrupts = <2 2>;
 		interrupt-parent = <&gpiof>;
-		interrupt-controller;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
 		status = "okay";
diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index c8e55642f9c6..3e834fc7e370 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -415,7 +415,6 @@ stmpe811@41 {
 		reg = <0x41>;
 		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&gpio2>;
-		interrupt-controller;
 		id = <0>;
 		blocks = <0x5>;
 		irq-trigger = <0x1>;

-- 
2.43.0

