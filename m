Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70356742689
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 14:36:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHxx2hZnz3c5g
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 22:36:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHrH0tVFz3bvd
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 22:31:40 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 35TCVVrc009262
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 15:31:31 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 29 Jun
 2023 15:31:30 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 29 Jun
 2023 20:31:28 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Thu, 29 Jun 2023 20:31:27 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 5BBED64740; Thu, 29 Jun 2023 15:31:27 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.1 v1 1/2] arm64: dts: nuvoton: add nodes to NPCM8XX
Date: Thu, 29 Jun 2023 15:31:23 +0300
Message-ID: <20230629123124.227478-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230629123124.227478-1-tmaimon77@gmail.com>
References: <20230629123124.227478-1-tmaimon77@gmail.com>
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

Add Nuvoton BMC NPCM8XX nodes support:
    - EHCI
    - OHCI
    - PCIe
    - eMMC
    - FIU
    - PSPI
    - KCS
    - BPC
    - JTAG Master
    - RNG
    - ADC
    - SGPIO
    - Thermal
    - PWM and FAN
    - I2C
    - I3C
    - Pin controller
    - GPIO
    - GMAC
    - EDAC
    - OPTEE

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 1495 ++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   95 ++
 2 files changed, 1588 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 83dca2c4c450..2710f0cdd59b 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/clock/nuvoton,npcm845-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	#address-cells = <2>;
@@ -18,10 +19,22 @@ soc {
 		ranges;
 
 		gcr: system-controller@f0800000 {
-			compatible = "nuvoton,npcm845-gcr", "syscon";
+			compatible = "nuvoton,npcm845-gcr", "syscon",
+				"simple-mfd";
 			reg = <0x0 0xf0800000 0x0 0x1000>;
 		};
 
+		rst: system-controller@f0801000 {
+			compatible = "nuvoton,npcm845-rst", "syscon";
+			reg = <0x0 0xf0801000 0x0 0xC4>;
+		};
+
+		fuse:fuse@f0189000 {
+			compatible = "nuvoton,npcm845-fuse", "syscon",
+				"simple-mfd";
+			reg = <0x0 0xf0189000 0x0 0x1000>;
+		};
+
 		gic: interrupt-controller@dfff9000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xdfff9000 0x0 0x1000>,
@@ -60,13 +73,227 @@ clk: clock-controller@f0801000 {
 			reg = <0x0 0xf0801000 0x0 0x1000>;
 		};
 
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
+			resets = <&rstc 0x34 0x15>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			nuvoton,sysgcr = <&gcr>;
+		};
+
+		ehci1: usb@f0828100 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0x0 0xf0828100 0x0 0xf00>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ehci2: usb@f082a100 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0x0 0xf082a100 0x0 0xf00>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci1: usb@f0829000 {
+			compatible = "nuvoton,npcm750-ohci";
+			reg = <0x0 0xf0829000 0x0 0x1000>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		ohci2: usb@f082b000 {
+			compatible = "nuvoton,npcm750-ohci";
+			reg = <0x0 0xf082b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		sdhci: sdhci@f0842000 {
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
+
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
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				nuvoton,sysgcr = <&gcr>;
+				status = "disabled";
+			};
+
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
 
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
@@ -118,6 +345,8 @@ serial4: serial@4000 {
 				clocks = <&clk NPCM8XX_CLK_UART2>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&bu4_pins>;
 				status = "disabled";
 			};
 
@@ -127,6 +356,8 @@ serial5: serial@5000 {
 				clocks = <&clk NPCM8XX_CLK_UART2>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&bu5_pins>;
 				status = "disabled";
 			};
 
@@ -136,6 +367,25 @@ serial6: serial@6000 {
 				clocks = <&clk NPCM8XX_CLK_UART2>;
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
 
@@ -165,6 +415,1247 @@ watchdog2: watchdog@a01c {
 				clocks = <&clk NPCM8XX_CLK_REFCLK>;
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
+				bus-frequency = <8000000>;
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
+				bus-frequency = <8000000>;
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
+				reg = <0xfff10000 0x1000>,
+				      <0xf0850000 0x1000>,
+				      <0xf0800300 0x10>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&i3c0_pins>;
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>,
+					<&clk NPCM8XX_CLK_REFCLK>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				dma-mux = <6>;
+				status = "disabled";
+			};
+
+			i3c1: i3c@fff11000 {
+				compatible = "silvaco,i3c-master";
+				reg = <0xfff11000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&i3c1_pins>;
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>,
+					<&clk NPCM8XX_CLK_REFCLK>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
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
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>,
+					<&clk NPCM8XX_CLK_REFCLK>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
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
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>,
+					<&clk NPCM8XX_CLK_REFCLK>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
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
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>,
+					<&clk NPCM8XX_CLK_REFCLK>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
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
+				clocks = <&clk NPCM8XX_CLK_AHB>, <&clk NPCM8XX_CLK_RCP>,
+					<&clk NPCM8XX_CLK_REFCLK>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
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
+		};
+	};
+
+	pinctrl: pinctrl@f0800000 {
+		compatible = "nuvoton,npcm845-pinctrl", "syscon", "simple-mfd";
+		ranges = <0x0 0x0 0xf0010000 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nuvoton,sysgcr = <&gcr>;
+		status = "okay";
+		gpio0: gpio@f0010000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x0 0xB0>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 0 32>;
+		};
+		gpio1: gpio@f0011000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x1000 0xB0>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 32 32>;
+		};
+		gpio2: gpio@f0012000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x2000 0xB0>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 64 32>;
+		};
+		gpio3: gpio@f0013000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x3000 0xB0>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 96 32>;
+		};
+		gpio4: gpio@f0014000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x4000 0xB0>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 128 32>;
+		};
+		gpio5: gpio@f0015000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x5000 0xB0>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 160 32>;
+		};
+		gpio6: gpio@f0016000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x6000 0xB0>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 192 32>;
+		};
+		gpio7: gpio@f0017000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x7000 0xB0>;
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
+		pspi_pins: pspi-pins {
+			groups = "pspi";
+			function = "pspi";
+		};
+		jm1_pins: jm1-pins {
+			groups = "jm1";
+			function = "jm1";
+		};
+		jm2_pins: jm2-pins {
+			groups = "jm2";
+			function = "jm2";
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
+		smb16_pins: smb16-pins {
+			groups = "smb16";
+			function = "smb16";
+		};
+		smb16b_pins: smb16b-pins {
+			groups = "smb16b";
+			function = "smb16b";
+		};
+		smb17_pins: smb17-pins {
+			groups = "smb17";
+			function = "smb17";
+		};
+		smb18_pins: smb18-pins {
+			groups = "smb18";
+			function = "smb18";
+		};
+		smb19_pins: smb19-pins {
+			groups = "smb19";
+			function = "smb19";
+		};
+		smb20_pins: smb20-pins {
+			groups = "smb20";
+			function = "smb20";
+		};
+		smb21_pins: smb21-pins {
+			groups = "smb21";
+			function = "smb21";
+		};
+		smb22_pins: smb22-pins {
+			groups = "smb22";
+			function = "smb22";
+		};
+		smb23_pins: smb23-pins {
+			groups = "smb23";
+			function = "smb23";
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
+		r1oen_pins: r1oen-pins {
+			groups = "r1oen";
+			function = "r1oen";
+		};
+		r2oen_pins: r2oen-pins {
+			groups = "r2oen";
+			function = "r2oen";
+		};
+		rmii3_pins: rmii3_pins {
+			groups = "rmii3";
+			function = "rmii3";
+		};
+		r3oen_pins: r3oen-pins {
+			groups = "r3oen";
+			function = "r3oen";
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
+		r3rxer_pins: r3rxer_pins {
+			groups = "r3rxer";
+			function = "r3rxer";
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
+		i3c0_pins: i3c0-pins {
+			groups = "i3c0";
+			function = "i3c0";
+		};
+		i3c1_pins: i3c1-pins {
+			groups = "i3c1";
+			function = "i3c1";
+		};
+		i3c2_pins: i3c2-pins {
+			groups = "i3c2";
+			function = "i3c2";
+		};
+		i3c3_pins: i3c3-pins {
+			groups = "i3c3";
+			function = "i3c3";
+		};
+		i3c4_pins: i3c4-pins {
+			groups = "i3c4";
+			function = "i3c4";
+		};
+		i3c5_pins: i3c5-pins {
+			groups = "i3c5";
+			function = "i3c5";
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
+		pwm8_pins: pwm8-pins {
+			groups = "pwm8";
+			function = "pwm8";
+		};
+		pwm9_pins: pwm9-pins {
+			groups = "pwm9";
+			function = "pwm9";
+		};
+		pwm10_pins: pwm10-pins {
+			groups = "pwm10";
+			function = "pwm10";
+		};
+		pwm11_pins: pwm11-pins {
+			groups = "pwm11";
+			function = "pwm11";
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
+		smb6b_pins: smb6b-pins {
+			groups = "smb6b";
+			function = "smb6b";
+		};
+		smb6c_pins: smb6c-pins {
+			groups = "smb6c";
+			function = "smb6c";
+		};
+		smb6d_pins: smb6d-pins {
+			groups = "smb6d";
+			function = "smb6d";
+		};
+		smb7_pins: smb7-pins {
+			groups = "smb7";
+			function = "smb7";
+		};
+		smb7b_pins: smb7b-pins {
+			groups = "smb7b";
+			function = "smb7b";
+		};
+		smb7c_pins: smb7c-pins {
+			groups = "smb7c";
+			function = "smb7c";
+		};
+		smb7d_pins: smb7d-pins {
+			groups = "smb7d";
+			function = "smb7d";
+		};
+		spi1_pins: spi1-pins {
+			groups = "spi1";
+			function = "spi1";
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
+		bu4_pins: bu4-pins {
+			groups = "bu4";
+			function = "bu4";
+		};
+		bu5_pins: bu5-pins {
+			groups = "bu5";
+			function = "bu5";
+		};
+		bu6_pins: bu6-pins {
+			groups = "bu6";
+			function = "bu6";
+		};
+		gpo187_pins: gpo187-pins {
+			groups = "gpo187";
+			function = "gpo187";
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
index 12118b75c0e6..46d9a7ac2804 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -73,4 +73,99 @@ timer {
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
+	ahb {
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gmac0: eth@f0802000 {
+			device_type = "network";
+			compatible = "snps,npcm";
+			reg = <0x0 0xf0802000 0x0 0x2000>,
+				<0x0 0xf0780000 0x0 0x200>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks	= <&clk NPCM8XX_CLK_AHB>;
+			clock-names = "stmmaceth";
+			pinctrl-names = "default";
+			pinctrl-0 = <&rg1mdio_pins>;
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
+		mdio0: mdio@0 {
+			compatible = "virtual,mdio-gpio";
+			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>,
+				<&gpio1 26 GPIO_ACTIVE_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy0: ethernet-phy@1 {
+			};
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
+		mdio1: mdio@1 {
+			compatible = "virtual,mdio-gpio";
+			gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>,
+				<&gpio2 28 GPIO_ACTIVE_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy1: ethernet-phy@1 {
+			};
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
+	};
 };
-- 
2.33.0

