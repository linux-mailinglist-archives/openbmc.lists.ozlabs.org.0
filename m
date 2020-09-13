Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3683267F29
	for <lists+openbmc@lfdr.de>; Sun, 13 Sep 2020 12:12:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bq4zk6hXyzDqdv
	for <lists+openbmc@lfdr.de>; Sun, 13 Sep 2020 20:12:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bq4v65jHYzDqcj
 for <openbmc@lists.ozlabs.org>; Sun, 13 Sep 2020 20:08:18 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08D9pZGA001986;
 Sun, 13 Sep 2020 12:51:35 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id CEE10639D6; Sun, 13 Sep 2020 12:51:35 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [dev-5.7 v1 4/4] dts: npcm7xx: add reset support
Date: Sun, 13 Sep 2020 12:51:26 +0300
Message-Id: <20200913095126.119727-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200913095126.119727-1-tmaimon77@gmail.com>
References: <20200913095126.119727-1-tmaimon77@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add reset support to PSPI ADC and EMC node.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 11 +++++++++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi        |  1 +
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index a7fabf7b1a3b..7eee4145127f 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+#include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
 #include <dt-bindings/gpio/gpio.h>
 
 / {
@@ -113,6 +114,12 @@
 		interrupt-parent = <&gic>;
 		ranges;
 
+		rstc: rstc@f0801000 {
+			compatible = "nuvoton,npcm750-reset";
+			reg = <0xf0801000 0x70>;
+			#reset-cells = <2>;
+		};
+
 		clk: clock-controller@f0801000 {
 			compatible = "nuvoton,npcm750-clk", "syscon";
 			#clock-cells = <1>;
@@ -152,6 +159,7 @@
 					<GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk NPCM7XX_CLK_AHB>;
 			clock-names = "clk_emc";
+			resets = <&rstc NPCM7XX_RESET_IPSRST1 NPCM7XX_RESET_EMC1>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&r1_pins
 					&r1err_pins
@@ -380,6 +388,7 @@
 				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_APB5>;
 				clock-names = "clk_apb5";
+				resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI1>;
 				status = "disabled";
 			};
 
@@ -393,6 +402,7 @@
 				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_APB5>;
 				clock-names = "clk_apb5";
+				resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI2>;
 				status = "disabled";
 			};
 
@@ -476,6 +486,7 @@
 				reg = <0xc000 0x8>;
 				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_ADC>;
+				resets = <&rstc NPCM7XX_RESET_IPSRST1 NPCM7XX_RESET_ADC>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
index 14b3d5b1206f..0699c86a24a3 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -68,6 +68,7 @@
 					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk NPCM7XX_CLK_AHB>;
 			clock-names = "clk_emc";
+			resets = <&rstc NPCM7XX_RESET_IPSRST1 NPCM7XX_RESET_EMC2>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&r2_pins
 					&r2err_pins
-- 
2.22.0

