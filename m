Return-Path: <openbmc+bounces-374-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471ADB08E93
	for <lists+openbmc@lfdr.de>; Thu, 17 Jul 2025 15:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZCc5ly2z30RK;
	Thu, 17 Jul 2025 23:54:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752760444;
	cv=none; b=HHQyEL5BTBmFmM5tQe4X+u+liMwOM2eU9UQ/yPjLCED3zgPQnNll28JA/k8WxSq3alhFy64u0LKxFHJzfGLgpTGmpKp4Lyiky9OB6onVe3RaVeGFcWF0e1RPKLxe1UTD5eVkoA/Gemk/4+y1H2GU2bvWY9qJXVgDzNf24Tro9TFXNPbYzFfaN+BmpbNsepyDpbMT0/gCdgjZHExq9wGCaz1jJ0ejrDwvJ7K9djsipUA7Zu2YWleNJWqSN2CITrgebxebsRLEQt2YfogtZ1Xxm9qWKKSUCrL+DSuddXGaDxrTumnvzUyQyaAnpfvrKpQDBONs9kuIhfVf+LdouIMyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752760444; c=relaxed/relaxed;
	bh=Cog2/qZBdgsiTVo2hmuoLrlg4CD4Dr6+L8/sDAp2WfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nEekZLzYtP67sVMOUWpnofvpKNMti76wM87e+BRmP+24Dnr4Y0XhBcGkc4WTbHyP3wOwhrdQMZaDHQtEQYmxylByo4ifcmXnphbtXs3F4uVLuZVlTxU7aEMGMsmvLUZlV4WaDLH36I4La/jgqbKUGw0R7hivsixkR0GXBlbYZwlHsGGWALUVGosEWUCNeyy9+rXhTAJHMLRpvaCYQ6j+6kn9WQZcthgRQtiWwK4MTOnx2w349X+zAklEBGegytNy6tUUk5SSB9MTKDn8WO07yn1FbQYmlZ1vYfTRaivMubOdH8pFaR1cwCk5JopGBamkmbs3/F/7j64MXTwKQLpRWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZCX2KH9z2yPd
	for <openbmc@lists.ozlabs.org>; Thu, 17 Jul 2025 23:53:54 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 56HDrjwb003788
	for <openbmc@lists.ozlabs.org>; Thu, 17 Jul 2025 16:53:45 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 17 Jul
 2025 16:53:43 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Thu, 17 Jul
 2025 21:53:40 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 17 Jul 2025 21:53:40 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id AA43D5F62B;
	Thu, 17 Jul 2025 16:53:39 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id A811ADC084A; Thu, 17 Jul 2025 16:53:39 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
CC: <openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/2] arm64: dts: nuvoton: npcm845: Add peripheral nodes
Date: Thu, 17 Jul 2025 16:53:35 +0300
Message-ID: <20250717135336.3974758-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717135336.3974758-1-tmaimon77@gmail.com>
References: <20250717135336.3974758-1-tmaimon77@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-Spam-Status: No, score=2.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,KHOP_HELO_FCRDNS,NML_ADSP_CUSTOM_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enable peripheral support for the Nuvoton NPCM845 SoC by adding device
nodes for Ethernet controllers, MMC controller, SPI controllers, USB
device controllers, random number generator, ADC, PWM-FAN controller,
and I2C controllers. Include pinmux configurations for relevant
peripherals to support hardware operation. Add an OP-TEE firmware node
for secure services.
This patch enhances functionality for NPCM845-based platforms.

Depends-on: ARM: dts: nuvoton: npcm845: Add pinctrl groups
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 695 ++++++++++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 2 files changed, 702 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 5cd877e6c20a..3564e0e30791 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/clock/nuvoton,npcm845-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	#address-cells = <2>;
@@ -40,6 +41,11 @@ ppi_cluster0: interrupt-partition-0 {
 		};
 	};
 
+	udc0_phy: usb-phy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+	};
+
 	ahb {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -56,6 +62,259 @@ clk: rstc: reset-controller@f0801000 {
 			#clock-cells = <1>;
 		};
 
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
+		sdhci: mmc@f0842000 {
+			compatible = "nuvoton,npcm845-sdhci";
+			reg = <0x0 0xf0842000 0x0 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM8XX_CLK_AHB>;
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
+			reg = <0x0 0xfb000000 0x0 0x1000>;
+			reg-names = "control";
+			clocks =  <&clk NPCM8XX_CLK_SPI0>;
+			clock-names = "clk_ahb";
+			status = "disabled";
+		};
+
+		fiu1: spi@fb002000 {
+			compatible = "nuvoton,npcm845-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xfb002000 0x0 0x1000>;
+			reg-names = "control";
+			clocks =  <&clk NPCM8XX_CLK_SPI1>;
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
+			reg = <0x0 0xc0000000 0x0 0x1000>;
+			reg-names = "control";
+			clocks =  <&clk NPCM8XX_CLK_SPI3>;
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
+			clocks =  <&clk NPCM8XX_CLK_SPIX>;
+			clock-names = "clk_ahb";
+			status = "disabled";
+		};
+
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		udc0:usb@f0830000 {
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
+		udc1:usb@f0831000 {
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
+		udc2:usb@f0832000 {
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
+		udc3:usb@f0833000 {
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
+		udc4:usb@f0834000 {
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
+		udc5:usb@f0835000 {
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
+		udc6:usb@f0836000 {
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
+		udc7:usb@f0837000 {
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
+		udc8:usb@f0838000 {
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
+		udc9:usb@f0839000 {
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
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -64,6 +323,20 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
+			pspi: spi@201000 {
+				compatible = "nuvoton,npcm845-pspi";
+				reg = <0x201000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pspi_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =  <&clk NPCM8XX_CLK_APB5>;
+				clock-names = "clk_apb5";
+				resets = <&rstc 0x24 23>;
+				status = "disabled";
+			};
+
 			peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm845-peci";
 				reg = <0x100000 0x1000>;
@@ -144,6 +417,22 @@ serial6: serial@6000 {
 				status = "disabled";
 			};
 
+			rng: rng@b000 {
+				compatible = "nuvoton,npcm845-rng";
+				reg = <0xb000 0x8>;
+				clocks =  <&clk NPCM8XX_CLK_APB1>;
+				status = "disabled";
+			};
+
+			adc: adc@c000 {
+				compatible = "nuvoton,npcm845-adc";
+				reg = <0xC000 0x8>;
+				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_ADC>;
+				resets = <&rstc 0x20 27>;
+				status = "disabled";
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -170,6 +459,412 @@ watchdog2: watchdog@a01c {
 				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
+
+			pwm_fan:pwm-fan-controller@103000 {
+				compatible = "nuvoton,npcm845-pwm-fan";
+				reg = <0x103000 0x3000>,
+					<0x180000 0x8000>;
+				reg-names = "pwm", "fan";
+				clocks =  <&clk NPCM8XX_CLK_APB3>,
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
+			i2c0: i2c@80000 {
+				reg = <0x80000 0x1000>;
+				compatible = "nuvoton,npcm845-i2c";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
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
+				clocks =  <&clk NPCM8XX_CLK_APB2>;
+				clock-frequency = <100000>;
+				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+				nuvoton,sys-mgr = <&gcr>;
+				status = "disabled";
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
index 383938dcd3ce..21dea323612d 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -75,4 +75,11 @@ timer {
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
 };
-- 
2.34.1


