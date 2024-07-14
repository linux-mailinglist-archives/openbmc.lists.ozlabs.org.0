Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A54930A88
	for <lists+openbmc@lfdr.de>; Sun, 14 Jul 2024 17:27:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMTj809Jrz3fTN
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 01:27:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMThG5k1Bz3cMX
	for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2024 01:26:35 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46EFQPR3020931
	for <openbmc@lists.ozlabs.org>; Sun, 14 Jul 2024 18:26:26 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 14 Jul
 2024 18:26:24 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 14 Jul
 2024 23:26:20 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 14 Jul 2024 23:26:20 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 368FA5F689;
	Sun, 14 Jul 2024 18:26:19 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 34E7ADC1688; Sun, 14 Jul 2024 18:26:19 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v1 3/3] arm64: dts: nuvoton: npcm8xx: add modules node
Date: Sun, 14 Jul 2024 18:26:17 +0300
Message-ID: <20240714152617.3055768-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240714152617.3055768-1-tmaimon77@gmail.com>
References: <20240714152617.3055768-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the following modules nodes to Nuvoton NPCM8xx BMC device tree:
- GMAC.
- FIU.
- OHCI and EHCI.
- SDHCI.
- PCIe.
- VCD and ECE.
- KCS.
- BPC.
- eSPI.
- PECI.
- PSPI.
- JTAG master.
- RNG.
- ADC.
- SGPIO.
- PWM and FAN.
- I3C.
- I2C.
- GFXI.
- Thermal zone.
- UDC.
- OPTEE.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 918 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     | 162 ++++
 2 files changed, 1075 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 8aef313a6ff6..d733509cab90 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -21,6 +21,23 @@ soc {
 		gcr: system-controller@f0800000 {
 			compatible = "nuvoton,npcm845-gcr", "syscon";
 			reg = <0x0 0xf0800000 0x0 0x1000>;
+			udc9_mux: mux-controller {
+				compatible = "mmio-mux";
+				#mux-control-cells = <1>;
+				mux-reg-masks = <0x9C 0x3000>;
+				idle-states = <0x3000>;
+			};
+		};
+
+		rst: system-controller@f0801000 {
+			compatible = "nuvoton,npcm845-rst", "syscon";
+			reg = <0x0 0xf0801000 0x0 0xC4>;
+		};
+
+		fuse:fuse@f0189000 {
+			compatible = "nuvoton,npcm845-fuse", "syscon",
+				"simple-mfd";
+			reg = <0x0 0xf0189000 0x0 0x1000>;
 		};
 
 		gic: interrupt-controller@dfff9000 {
@@ -39,6 +56,12 @@ ppi_cluster0: interrupt-partition-0 {
 				};
 			};
 		};
+
+		spswc: spswc@f0800038 {
+			compatible = "nuvoton,npcm-sp-ctrl";
+			reg = <0x0 0xf0800038 0x0 0x4>;
+		};
+
 	};
 
 	ahb {
@@ -62,15 +85,276 @@ clk: clock-controller@f0801000 {
 			clocks = <&refclk>;
 		};
 
+		gmac0: eth@f0802000 {
+			device_type = "network";
+			compatible = "nuvoton,npcm-dwmac";
+			reg = <0x0 0xf0802000 0x0 0x2000>,
+				<0x0 0xf0780000 0x0 0x200>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks	= <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "stmmaceth";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sg1mdio_pins>;
+			status = "disabled";
+		};
+
+		gmac1: eth@f0804000 {
+			device_type = "network";
+			compatible = "snps,dwmac";
+			reg = <0x0 0xf0804000 0x0 0x2000>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks	= <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "stmmaceth";
+			pinctrl-names = "default";
+			pinctrl-0 = <&rg2_pins
+					&rg2mdio_pins>;
+			status = "disabled";
+		};
+
+		gmac2: eth@f0806000 {
+			device_type = "network";
+			compatible = "snps,dwmac";
+			reg = <0x0 0xf0806000 0x0 0x2000>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks	= <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "stmmaceth";
+			pinctrl-names = "default";
+			pinctrl-0 = <&r1_pins
+					&r1err_pins
+					&r1md_pins>;
+			status = "disabled";
+		};
+
+		gmac3: eth@f0808000 {
+			device_type = "network";
+			compatible = "snps,dwmac";
+			reg = <0x0 0xf0808000 0x0 0x2000>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks	= <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "stmmaceth";
+			pinctrl-names = "default";
+			pinctrl-0 = <&r2_pins
+					&r2err_pins
+					&r2md_pins>;
+			status = "disabled";
+		};
+
+		ehci1: usb@f0828100 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0x0 0xf0828100 0x0 0x1000>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ehci2: usb@f082a100 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0x0 0xf082a100 0x0 0x1000>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci1: usb@f0829000 {
+			compatible = "nuvoton,npcm750-ohci", "generic-ohci";
+			reg = <0x0 0xf0829000 0x0 0x1000>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci2: usb@f082b000 {
+			compatible = "nuvoton,npcm750-ohci", "generic-ohci";
+			reg = <0x0 0xf082b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		sdhci: mmc@f0842000 {
+			compatible = "nuvoton,npcm845-sdhci";
+			reg = <0x0 0xf0842000 0x0 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =  <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "clk_mmc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc8_pins
+				     &mmc_pins>;
+			status = "disabled";
+		};
+
+		pcie: pcie@e1000000 {
+			compatible = "nuvoton,npcm845-pcie";
+			device_type = "pci";
+			reg = <0x0 0xE1000000 0x0 0x1000>,
+				<0x0 0xE8000000 0x0 0x1000>;
+			bus-range = <0x0 0xF>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			ranges = <0x01000000 0 0xe9000000 0x0 0xe9000000 0 0x01000000
+				0x02000000 0 0xea000000 0x0 0xea000000 0 0x04000000>;
+			resets = <&rstc 0x34 15>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			nuvoton,sysgcr = <&gcr>;
+		};
+
+		fiu0: spi@fb000000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xfb000000 0x0 0x1000>,
+			<0x0 0x80000000 0x0 0x10000000>;
+			reg-names = "control", "memory";
+			clocks = <&clk NPCM8XX_CLK_SPI0>;
+			clock-names = "clk_ahb";
+			status = "disabled";
+		};
+
+		fiu1: spi@fb002000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xfb002000 0x0 0x1000>,
+			<0x0 0x90000000 0x0 0x4000000>;
+			reg-names = "control", "memory";
+			clocks = <&clk NPCM8XX_CLK_SPI1>;
+			clock-names = "clk_spi1";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1_pins>;
+			status = "disabled";
+		};
+
+		fiu3: spi@c0000000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xc0000000 0x0 0x1000>,
+			<0x0 0xA0000000 0x0 0x20000000>;
+			reg-names = "control", "memory";
+			clocks = <&clk NPCM8XX_CLK_SPI3>;
+			clock-names = "clk_spi3";
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi3_pins>;
+			status = "disabled";
+		};
+
+		fiux: spi@fb001000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xfb001000 0x0 0x1000>,
+			<0x0 0xf8000000 0x0 0x2000000>;
+			reg-names = "control", "memory";
+			clocks = <&clk NPCM8XX_CLK_SPIX>;
+			clock-names = "clk_ahb";
+			status = "disabled";
+		};
+
+		pcimbox: pcimbox@f0848000 {
+			compatible = "nuvoton,npcm845-pci-mbox", "nuvoton,npcm750-pci-mbox",
+					"simple-mfd", "syscon";
+			reg = <0x0 0xf084C000 0x0 0x8
+				0x0 0xf0848000 0x0 0x3F00>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		vcd: vcd@f0810000 {
+			compatible = "nuvoton,npcm845-vcd";
+			reg = <0x0 0xf0810000 0x0 0x10000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstc 0x24 14>;
+			nuvoton,sysgcr = <&gcr>;
+			nuvoton,sysgfxi = <&gfxi>;
+			nuvoton,ece = <&ece>;
+			status = "disabled";
+		};
+
+		ece: video-codec@f0820000 {
+			compatible = "nuvoton,npcm845-ece";
+			reg = <0x0 0xf0820000 0x0 0x2000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstc 0x24 13>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "simple-bus";
 			interrupt-parent = <&gic>;
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
-				<0xfff00000 0x0 0xfff00000 0x00016000>;
+				<0xfff00000 0x0 0xfff00000 0x00016000>,
+				<0xf0800000 0x0 0xf0800000 0x00060000>;
+
+			lpc_kcs: lpc_kcs@7000 {
+				compatible = "nuvoton,npcm845-lpc-kcs",
+						"simple-mfd", "syscon";
+				reg = <0x7000 0x40>;
+				reg-io-width = <1>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x7000 0x40>;
+
+				kcs1: kcs1@0 {
+					compatible = "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc";
+					reg = <0x0 0x40>;
+					interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+					kcs_chan = <1>;
+					status = "disabled";
+				};
 
-			peci: peci-controller@100000 {
+				kcs2: kcs2@0 {
+					compatible = "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc";
+					reg = <0x0 0x40>;
+					interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+					kcs_chan = <2>;
+					status = "disabled";
+				};
+
+				kcs3: kcs3@0 {
+					compatible = "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc";
+					reg = <0x0 0x40>;
+					interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+					kcs_chan = <3>;
+					status = "disabled";
+				};
+			};
+
+			lpc_host: lpc_host@7000 {
+				compatible = "nuvoton,npcm845-lpc-host",
+						"simple-mfd", "syscon";
+				reg = <0x7000 0x60>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x7000 0x60>;
+
+				lpc_bpc: lpc_bpc@40 {
+					compatible = "nuvoton,npcm845-lpc-bpc", "nuvoton,npcm750-lpc-bpc";
+					reg = <0x40 0x20>;
+					interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+			};
+
+			espi: espi@9f000 {
+				compatible = "nuvoton,npcm845-espi",
+						"simple-mfd", "syscon";
+				reg = <0x9f000 0x1000>;
+				vw_gpio: vw_gpio {
+					compatible = "nuvoton,npcm845-espi-vwgpio";
+					interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					status = "disabled";
+				};
+			};
+
+			peci0: peci-controller@100000 {
 				compatible = "nuvoton,npcm845-peci";
 				reg = <0x100000 0x1000>;
 				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -79,6 +363,48 @@ peci: peci-controller@100000 {
 				status = "disabled";
 			};
 
+			pspi: spi@201000 {
+				compatible = "nuvoton,npcm845-pspi";
+				reg = <0x201000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pspi_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB5>;
+				clock-names = "clk_apb5";
+				resets = <&rstc 0x24 23>;
+				status = "disabled";
+			};
+
+			jtm1: jtm@208000 {
+				compatible = "nuvoton,npcm845-jtm";
+				reg = <0x208000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&jm1_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB5>;
+				clock-names = "clk_apb5";
+				resets = <&rstc 0x74 29>;
+				status = "disabled";
+			};
+
+			jtm2: jtm@209000 {
+				compatible = "nuvoton,npcm845-jtm";
+				reg = <0x209000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&jm2_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB5>;
+				clock-names = "clk_apb5";
+				resets = <&rstc 0x74 30>;
+				status = "disabled";
+			};
+
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
@@ -126,27 +452,50 @@ serial3: serial@3000 {
 			serial4: serial@4000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x4000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&clk NPCM8XX_CLK_UART2>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&bu4_pins>;
 				status = "disabled";
 			};
 
 			serial5: serial@5000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x5000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&clk NPCM8XX_CLK_UART2>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&bu5_pins>;
 				status = "disabled";
 			};
 
 			serial6: serial@6000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x6000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&clk NPCM8XX_CLK_UART2>;
 				interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&bu6_pins>;
+				status = "disabled";
+			};
+
+			rng: rng@b000 {
+				compatible = "nuvoton,npcm845-rng";
+				reg = <0xb000 0x8>;
+				clocks = <&clk NPCM8XX_CLK_APB1>;
+				status = "disabled";
+			};
+
+			adc: adc@c000 {
+				compatible = "nuvoton,npcm845-adc";
+				reg = <0xC000 0x8>;
+				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_ADC>;
+				resets = <&rstc 0x20 27>;
+				syscon = <&fuse>;
 				status = "disabled";
 			};
 
@@ -176,6 +525,565 @@ watchdog2: watchdog@a01c {
 				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
+
+			tmps: tmps@188000 {
+				compatible = "nuvoton,npcm845-thermal";
+				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB4>;
+				reg = <0x188000 0x5C>;
+				#thermal-sensor-cells = <1>;
+			};
+
+			sgpio1: sgpio@101000 {
+				compatible = "nuvoton,npcm845-sgpio";
+				reg = <0x101000 0x200>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox1_pins>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
+			sgpio2: sgpio@102000 {
+				compatible = "nuvoton,npcm845-sgpio";
+				reg = <0x102000 0x200>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox2_pins>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
+			pwm_fan:pwm-fan-controller@103000 {
+				compatible = "nuvoton,npcm845-pwm-fan";
+				reg = <0x103000 0x3000>,
+					<0x180000 0x8000>;
+				reg-names = "pwm", "fan";
+				clocks = <&clk NPCM8XX_CLK_APB3>,
+					<&clk NPCM8XX_CLK_APB4>;
+				clock-names = "pwm","fan";
+				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pwm0_pins &pwm1_pins
+						&pwm2_pins &pwm3_pins
+						&pwm4_pins &pwm5_pins
+						&pwm6_pins &pwm7_pins
+						&pwm8_pins &pwm9_pins
+						&pwm10_pins &pwm11_pins
+						&fanin0_pins &fanin1_pins
+						&fanin2_pins &fanin3_pins
+						&fanin4_pins &fanin5_pins
+						&fanin6_pins &fanin7_pins
+						&fanin8_pins &fanin9_pins
+						&fanin10_pins &fanin11_pins
+						&fanin12_pins &fanin13_pins
+						&fanin14_pins &fanin15_pins>;
+				status = "disabled";
+			};
+
+			i3c0: i3c@fff10000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0xfff10000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&i3c0_pins>;
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>;
+				clock-names = "pclk", "fast_clk";
+				interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rstc 0x74 8>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i3c1: i3c@fff11000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0xfff11000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&i3c1_pins>;
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>;
+				clock-names = "pclk", "fast_clk";
+				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rstc 0x74 9>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i3c2: i3c@fff12000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0xfff12000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&i3c2_pins>;
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>;
+				clock-names = "pclk", "fast_clk";
+				interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rstc 0x74 10>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i3c3: i3c@fff13000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0xfff13000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&i3c3_pins>;
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>;
+				clock-names = "pclk", "fast_clk";
+				interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rstc 0x74 11>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i3c4: i3c@fff14000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0xfff14000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&i3c4_pins>;
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>;
+				clock-names = "pclk", "fast_clk";
+				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rstc 0x74 12>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i3c5: i3c@fff15000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0xfff15000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&i3c5_pins>;
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>;
+				clock-names = "pclk", "fast_clk";
+				interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rstc 0x74 13>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c0: i2c@80000 {
+				reg = <0x80000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb0_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@81000 {
+				reg = <0x81000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb1_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@82000 {
+				reg = <0x82000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb2_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@83000 {
+				reg = <0x83000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb3_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c4: i2c@84000 {
+				reg = <0x84000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb4_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c5: i2c@85000 {
+				reg = <0x85000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb5_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c6: i2c@86000 {
+				reg = <0x86000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb6_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@87000 {
+				reg = <0x87000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb7_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@88000 {
+				reg = <0x88000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb8_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c9: i2c@89000 {
+				reg = <0x89000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb9_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@8a000 {
+				reg = <0x8a000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb10_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@8b000 {
+				reg = <0x8b000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb11_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c12: i2c@8c000 {
+				reg = <0x8c000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb12_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c13: i2c@8d000 {
+				reg = <0x8d000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb13_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c14: i2c@8e000 {
+				reg = <0x8e000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb14_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c15: i2c@8f000 {
+				reg = <0x8f000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb15_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c16: i2c@fff00000 {
+				reg = <0xfff00000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb16_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c17: i2c@fff01000 {
+				reg = <0xfff01000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb17_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c18: i2c@fff02000 {
+				reg = <0xfff02000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb18_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c19: i2c@fff03000 {
+				reg = <0xfff03000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb19_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c20: i2c@fff04000 {
+				reg = <0xfff04000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb20_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c21: i2c@fff05000 {
+				reg = <0xfff05000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb21_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c22: i2c@fff06000 {
+				reg = <0xfff06000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb22_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c23: i2c@fff07000 {
+				reg = <0xfff07000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&smb23_pins>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c24: i2c@fff08000 {
+				reg = <0xfff08000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c25: i2c@fff09000 {
+				reg = <0xfff09000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			i2c26: i2c@fff0a000 {
+				reg = <0xfff0a000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
+
+			gfxi: gfxi@e000 {
+				compatible = "nuvoton,npcm845-gfxi", "syscon",
+					     "simple-mfd";
+				reg = <0xe000 0x100>;
+			};
+		};
+	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tmps 0>;
+			trips {
+				cpu0_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+		};
+		cpu1_thermal: cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tmps 1>;
+			trips {
+				cpu1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
index 65ff5be54a06..1afbd6db9fae 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -75,4 +75,166 @@ timer {
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	udc0_phy: usb-phy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+	};
+
+	ahb {
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		udc0:udc@f0830000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0830000 0x0 0x1000
+			       0x0 0xfffeb000 0x0 0x800>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc1:udc@f0831000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0831000 0x0 0x1000
+			       0x0 0xfffeb800 0x0 0x800>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc2:udc@f0832000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0832000 0x0 0x1000
+			       0x0 0xfffec000 0x0 0x800>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc3:udc@f0833000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0833000 0x0 0x1000
+			       0x0 0xfffec800 0x0 0x800>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc4:udc@f0834000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0834000 0x0 0x1000
+			       0x0 0xfffed000 0x0 0x800>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc5:udc@f0835000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0835000 0x0 0x1000
+			       0x0 0xfffed800 0x0 0x800>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc6:udc@f0836000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0836000 0x0 0x1000
+			       0x0 0xfffee000 0x0 0x800>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc7:udc@f0837000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0837000 0x0 0x1000
+			       0x0 0xfffee800 0x0 0x800>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc8:udc@f0838000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0838000 0x0 0x1000
+			       0x0 0xfffef000 0x0 0x800>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			nuvoton,sysgcr = <&gcr 0x9C 0xC000 0xC000>;
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc9:udc@f0839000 {
+			compatible = "nuvoton,npcm845-udc";
+			reg = <0x0 0xf0839000 0x0 0x1000
+			       0x0 0xfffef800 0x0 0x800>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+
+			nuvoton,sysgcr = <&gcr 0x9C 0x3000 0x3000>;
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+	};
 };
\ No newline at end of file
-- 
2.34.1

