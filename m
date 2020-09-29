Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5E427CF4C
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 15:37:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C10nP1VbGzDqRS
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 23:37:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C10MZ0XF1zDqXB
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 23:18:49 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08TDIBiD026518;
 Tue, 29 Sep 2020 16:18:11 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id D16E5639D9; Tue, 29 Sep 2020 16:18:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, joel@jms.id.au
Subject: [PATCH v8 3/5] arm: dts: add pinctrl and GPIO node to NPCM7XX device
 tree
Date: Tue, 29 Sep 2020 16:18:05 +0300
Message-Id: <20200929131807.15378-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200929131807.15378-1-tmaimon77@gmail.com>
References: <20200929131807.15378-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add pin controller and GPIO node to NPCM7XX device tree.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 564 ++++++++++++++++++
 1 file changed, 564 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 72e364054e72..7755a3de7c53 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -185,4 +185,568 @@
 			};
 		};
 	};
+
+	pinctrl: pinctrl@f0800000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "nuvoton,npcm750-pinctrl", "syscon", "simple-mfd";
+		ranges = <0 0xf0010000 0x8000>;
+		gpio0: gpio@f0010000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x0 0x80>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 0 32>;
+		};
+		gpio1: gpio@f0011000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x1000 0x80>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 32 32>;
+		};
+		gpio2: gpio@f0012000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x2000 0x80>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 64 32>;
+		};
+		gpio3: gpio@f0013000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x3000 0x80>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 96 32>;
+		};
+		gpio4: gpio@f0014000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x4000 0x80>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 128 32>;
+		};
+		gpio5: gpio@f0015000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x5000 0x80>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 160 32>;
+		};
+		gpio6: gpio@f0016000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x6000 0x80>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 192 32>;
+		};
+		gpio7: gpio@f0017000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x7000 0x80>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 224 32>;
+		};
+
+		iox1_pins: iox1-pins {
+			groups = "iox1";
+			function = "iox1";
+		};
+		iox2_pins: iox2-pins {
+			groups = "iox2";
+			function = "iox2";
+		};
+		smb1d_pins: smb1d-pins {
+			groups = "smb1d";
+			function = "smb1d";
+		};
+		smb2d_pins: smb2d-pins {
+			groups = "smb2d";
+			function = "smb2d";
+		};
+		lkgpo1_pins: lkgpo1-pins {
+			groups = "lkgpo1";
+			function = "lkgpo1";
+		};
+		lkgpo2_pins: lkgpo2-pins {
+			groups = "lkgpo2";
+			function = "lkgpo2";
+		};
+		ioxh_pins: ioxh-pins {
+			groups = "ioxh";
+			function = "ioxh";
+		};
+		gspi_pins: gspi-pins {
+			groups = "gspi";
+			function = "gspi";
+		};
+		smb5b_pins: smb5b-pins {
+			groups = "smb5b";
+			function = "smb5b";
+		};
+		smb5c_pins: smb5c-pins {
+			groups = "smb5c";
+			function = "smb5c";
+		};
+		lkgpo0_pins: lkgpo0-pins {
+			groups = "lkgpo0";
+			function = "lkgpo0";
+		};
+		pspi2_pins: pspi2-pins {
+			groups = "pspi2";
+			function = "pspi2";
+		};
+		smb4den_pins: smb4den-pins {
+			groups = "smb4den";
+			function = "smb4den";
+		};
+		smb4b_pins: smb4b-pins {
+			groups = "smb4b";
+			function = "smb4b";
+		};
+		smb4c_pins: smb4c-pins {
+			groups = "smb4c";
+			function = "smb4c";
+		};
+		smb15_pins: smb15-pins {
+			groups = "smb15";
+			function = "smb15";
+		};
+		smb4d_pins: smb4d-pins {
+			groups = "smb4d";
+			function = "smb4d";
+		};
+		smb14_pins: smb14-pins {
+			groups = "smb14";
+			function = "smb14";
+		};
+		smb5_pins: smb5-pins {
+			groups = "smb5";
+			function = "smb5";
+		};
+		smb4_pins: smb4-pins {
+			groups = "smb4";
+			function = "smb4";
+		};
+		smb3_pins: smb3-pins {
+			groups = "smb3";
+			function = "smb3";
+		};
+		spi0cs1_pins: spi0cs1-pins {
+			groups = "spi0cs1";
+			function = "spi0cs1";
+		};
+		spi0cs2_pins: spi0cs2-pins {
+			groups = "spi0cs2";
+			function = "spi0cs2";
+		};
+		spi0cs3_pins: spi0cs3-pins {
+			groups = "spi0cs3";
+			function = "spi0cs3";
+		};
+		smb3c_pins: smb3c-pins {
+			groups = "smb3c";
+			function = "smb3c";
+		};
+		smb3b_pins: smb3b-pins {
+			groups = "smb3b";
+			function = "smb3b";
+		};
+		bmcuart0a_pins: bmcuart0a-pins {
+			groups = "bmcuart0a";
+			function = "bmcuart0a";
+		};
+		uart1_pins: uart1-pins {
+			groups = "uart1";
+			function = "uart1";
+		};
+		jtag2_pins: jtag2-pins {
+			groups = "jtag2";
+			function = "jtag2";
+		};
+		bmcuart1_pins: bmcuart1-pins {
+			groups = "bmcuart1";
+			function = "bmcuart1";
+		};
+		uart2_pins: uart2-pins {
+			groups = "uart2";
+			function = "uart2";
+		};
+		bmcuart0b_pins: bmcuart0b-pins {
+			groups = "bmcuart0b";
+			function = "bmcuart0b";
+		};
+		r1err_pins: r1err-pins {
+			groups = "r1err";
+			function = "r1err";
+		};
+		r1md_pins: r1md-pins {
+			groups = "r1md";
+			function = "r1md";
+		};
+		smb3d_pins: smb3d-pins {
+			groups = "smb3d";
+			function = "smb3d";
+		};
+		fanin0_pins: fanin0-pins {
+			groups = "fanin0";
+			function = "fanin0";
+		};
+		fanin1_pins: fanin1-pins {
+			groups = "fanin1";
+			function = "fanin1";
+		};
+		fanin2_pins: fanin2-pins {
+			groups = "fanin2";
+			function = "fanin2";
+		};
+		fanin3_pins: fanin3-pins {
+			groups = "fanin3";
+			function = "fanin3";
+		};
+		fanin4_pins: fanin4-pins {
+			groups = "fanin4";
+			function = "fanin4";
+		};
+		fanin5_pins: fanin5-pins {
+			groups = "fanin5";
+			function = "fanin5";
+		};
+		fanin6_pins: fanin6-pins {
+			groups = "fanin6";
+			function = "fanin6";
+		};
+		fanin7_pins: fanin7-pins {
+			groups = "fanin7";
+			function = "fanin7";
+		};
+		fanin8_pins: fanin8-pins {
+			groups = "fanin8";
+			function = "fanin8";
+		};
+		fanin9_pins: fanin9-pins {
+			groups = "fanin9";
+			function = "fanin9";
+		};
+		fanin10_pins: fanin10-pins {
+			groups = "fanin10";
+			function = "fanin10";
+		};
+		fanin11_pins: fanin11-pins {
+			groups = "fanin11";
+			function = "fanin11";
+		};
+		fanin12_pins: fanin12-pins {
+			groups = "fanin12";
+			function = "fanin12";
+		};
+		fanin13_pins: fanin13-pins {
+			groups = "fanin13";
+			function = "fanin13";
+		};
+		fanin14_pins: fanin14-pins {
+			groups = "fanin14";
+			function = "fanin14";
+		};
+		fanin15_pins: fanin15-pins {
+			groups = "fanin15";
+			function = "fanin15";
+		};
+		pwm0_pins: pwm0-pins {
+			groups = "pwm0";
+			function = "pwm0";
+		};
+		pwm1_pins: pwm1-pins {
+			groups = "pwm1";
+			function = "pwm1";
+		};
+		pwm2_pins: pwm2-pins {
+			groups = "pwm2";
+			function = "pwm2";
+		};
+		pwm3_pins: pwm3-pins {
+			groups = "pwm3";
+			function = "pwm3";
+		};
+		r2_pins: r2-pins {
+			groups = "r2";
+			function = "r2";
+		};
+		r2err_pins: r2err-pins {
+			groups = "r2err";
+			function = "r2err";
+		};
+		r2md_pins: r2md-pins {
+			groups = "r2md";
+			function = "r2md";
+		};
+		ga20kbc_pins: ga20kbc-pins {
+			groups = "ga20kbc";
+			function = "ga20kbc";
+		};
+		smb5d_pins: smb5d-pins {
+			groups = "smb5d";
+			function = "smb5d";
+		};
+		lpc_pins: lpc-pins {
+			groups = "lpc";
+			function = "lpc";
+		};
+		espi_pins: espi-pins {
+			groups = "espi";
+			function = "espi";
+		};
+		rg1_pins: rg1-pins {
+			groups = "rg1";
+			function = "rg1";
+		};
+		rg1mdio_pins: rg1mdio-pins {
+			groups = "rg1mdio";
+			function = "rg1mdio";
+		};
+		rg2_pins: rg2-pins {
+			groups = "rg2";
+			function = "rg2";
+		};
+		ddr_pins: ddr-pins {
+			groups = "ddr";
+			function = "ddr";
+		};
+		smb0_pins: smb0-pins {
+			groups = "smb0";
+			function = "smb0";
+		};
+		smb1_pins: smb1-pins {
+			groups = "smb1";
+			function = "smb1";
+		};
+		smb2_pins: smb2-pins {
+			groups = "smb2";
+			function = "smb2";
+		};
+		smb2c_pins: smb2c-pins {
+			groups = "smb2c";
+			function = "smb2c";
+		};
+		smb2b_pins: smb2b-pins {
+			groups = "smb2b";
+			function = "smb2b";
+		};
+		smb1c_pins: smb1c-pins {
+			groups = "smb1c";
+			function = "smb1c";
+		};
+		smb1b_pins: smb1b-pins {
+			groups = "smb1b";
+			function = "smb1b";
+		};
+		smb8_pins: smb8-pins {
+			groups = "smb8";
+			function = "smb8";
+		};
+		smb9_pins: smb9-pins {
+			groups = "smb9";
+			function = "smb9";
+		};
+		smb10_pins: smb10-pins {
+			groups = "smb10";
+			function = "smb10";
+		};
+		smb11_pins: smb11-pins {
+			groups = "smb11";
+			function = "smb11";
+		};
+		sd1_pins: sd1-pins {
+			groups = "sd1";
+			function = "sd1";
+		};
+		sd1pwr_pins: sd1pwr-pins {
+			groups = "sd1pwr";
+			function = "sd1pwr";
+		};
+		pwm4_pins: pwm4-pins {
+			groups = "pwm4";
+			function = "pwm4";
+		};
+		pwm5_pins: pwm5-pins {
+			groups = "pwm5";
+			function = "pwm5";
+		};
+		pwm6_pins: pwm6-pins {
+			groups = "pwm6";
+			function = "pwm6";
+		};
+		pwm7_pins: pwm7-pins {
+			groups = "pwm7";
+			function = "pwm7";
+		};
+		mmc8_pins: mmc8-pins {
+			groups = "mmc8";
+			function = "mmc8";
+		};
+		mmc_pins: mmc-pins {
+			groups = "mmc";
+			function = "mmc";
+		};
+		mmcwp_pins: mmcwp-pins {
+			groups = "mmcwp";
+			function = "mmcwp";
+		};
+		mmccd_pins: mmccd-pins {
+			groups = "mmccd";
+			function = "mmccd";
+		};
+		mmcrst_pins: mmcrst-pins {
+			groups = "mmcrst";
+			function = "mmcrst";
+		};
+		clkout_pins: clkout-pins {
+			groups = "clkout";
+			function = "clkout";
+		};
+		serirq_pins: serirq-pins {
+			groups = "serirq";
+			function = "serirq";
+		};
+		lpcclk_pins: lpcclk-pins {
+			groups = "lpcclk";
+			function = "lpcclk";
+		};
+		scipme_pins: scipme-pins {
+			groups = "scipme";
+			function = "scipme";
+		};
+		sci_pins: sci-pins {
+			groups = "sci";
+			function = "sci";
+		};
+		smb6_pins: smb6-pins {
+			groups = "smb6";
+			function = "smb6";
+		};
+		smb7_pins: smb7-pins {
+			groups = "smb7";
+			function = "smb7";
+		};
+		pspi1_pins: pspi1-pins {
+			groups = "pspi1";
+			function = "pspi1";
+		};
+		faninx_pins: faninx-pins {
+			groups = "faninx";
+			function = "faninx";
+		};
+		r1_pins: r1-pins {
+			groups = "r1";
+			function = "r1";
+		};
+		spi3_pins: spi3-pins {
+			groups = "spi3";
+			function = "spi3";
+		};
+		spi3cs1_pins: spi3cs1-pins {
+			groups = "spi3cs1";
+			function = "spi3cs1";
+		};
+		spi3quad_pins: spi3quad-pins {
+			groups = "spi3quad";
+			function = "spi3quad";
+		};
+		spi3cs2_pins: spi3cs2-pins {
+			groups = "spi3cs2";
+			function = "spi3cs2";
+		};
+		spi3cs3_pins: spi3cs3-pins {
+			groups = "spi3cs3";
+			function = "spi3cs3";
+		};
+		nprd_smi_pins: nprd-smi-pins {
+			groups = "nprd_smi";
+			function = "nprd_smi";
+		};
+		smb0b_pins: smb0b-pins {
+			groups = "smb0b";
+			function = "smb0b";
+		};
+		smb0c_pins: smb0c-pins {
+			groups = "smb0c";
+			function = "smb0c";
+		};
+		smb0den_pins: smb0den-pins {
+			groups = "smb0den";
+			function = "smb0den";
+		};
+		smb0d_pins: smb0d-pins {
+			groups = "smb0d";
+			function = "smb0d";
+		};
+		ddc_pins: ddc-pins {
+			groups = "ddc";
+			function = "ddc";
+		};
+		rg2mdio_pins: rg2mdio-pins {
+			groups = "rg2mdio";
+			function = "rg2mdio";
+		};
+		wdog1_pins: wdog1-pins {
+			groups = "wdog1";
+			function = "wdog1";
+		};
+		wdog2_pins: wdog2-pins {
+			groups = "wdog2";
+			function = "wdog2";
+		};
+		smb12_pins: smb12-pins {
+			groups = "smb12";
+			function = "smb12";
+		};
+		smb13_pins: smb13-pins {
+			groups = "smb13";
+			function = "smb13";
+		};
+		spix_pins: spix-pins {
+			groups = "spix";
+			function = "spix";
+		};
+		spixcs1_pins: spixcs1-pins {
+			groups = "spixcs1";
+			function = "spixcs1";
+		};
+		clkreq_pins: clkreq-pins {
+			groups = "clkreq";
+			function = "clkreq";
+		};
+		hgpio0_pins: hgpio0-pins {
+			groups = "hgpio0";
+			function = "hgpio0";
+		};
+		hgpio1_pins: hgpio1-pins {
+			groups = "hgpio1";
+			function = "hgpio1";
+		};
+		hgpio2_pins: hgpio2-pins {
+			groups = "hgpio2";
+			function = "hgpio2";
+		};
+		hgpio3_pins: hgpio3-pins {
+			groups = "hgpio3";
+			function = "hgpio3";
+		};
+		hgpio4_pins: hgpio4-pins {
+			groups = "hgpio4";
+			function = "hgpio4";
+		};
+		hgpio5_pins: hgpio5-pins {
+			groups = "hgpio5";
+			function = "hgpio5";
+		};
+		hgpio6_pins: hgpio6-pins {
+			groups = "hgpio6";
+			function = "hgpio6";
+		};
+		hgpio7_pins: hgpio7-pins {
+			groups = "hgpio7";
+			function = "hgpio7";
+		};
+	};
 };
-- 
2.22.0

