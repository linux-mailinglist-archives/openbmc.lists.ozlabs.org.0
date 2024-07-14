Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9210E930A87
	for <lists+openbmc@lfdr.de>; Sun, 14 Jul 2024 17:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMThd3pfzz3dh2
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 01:26:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMThG3dJ1z3cHP
	for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2024 01:26:35 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46EFQOWM020928
	for <openbmc@lists.ozlabs.org>; Sun, 14 Jul 2024 18:26:24 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 14 Jul
 2024 18:26:23 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 14 Jul
 2024 23:26:20 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 14 Jul 2024 23:26:19 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 7BADA5F686;
	Sun, 14 Jul 2024 18:26:18 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 6F957DC1688; Sun, 14 Jul 2024 18:26:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v1 1/3] arm64: dts: nuvoton: npcm8xx: add reference 25m clock property
Date: Sun, 14 Jul 2024 18:26:15 +0300
Message-ID: <20240714152617.3055768-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The NPCM8XX clock driver uses a 25Mhz external clock, therefore adding
clock property.

The new required clock property does not break the NPCM8XX clock ABI
since the NPCM8XX clock driver hasn't merged yet to the Linux vanilla.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++----
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     | 7 +++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 91c1b5c4d635..9bd22f7d43f4 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -58,6 +58,7 @@ clk: clock-controller@f0801000 {
 			compatible = "nuvoton,npcm845-clk";
 			#clock-cells = <1>;
 			reg = <0x0 0xf0801000 0x0 0x1000>;
+			clocks = <&refclk>;
 		};
 
 		apb {
@@ -81,7 +82,7 @@ timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				clock-names = "refclk";
 			};
 
@@ -153,7 +154,7 @@ watchdog0: watchdog@801c {
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x801c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -162,7 +163,7 @@ watchdog1: watchdog@901c {
 				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x901c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -171,7 +172,7 @@ watchdog2: watchdog@a01c {
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xa01c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index a5ab2bc0f835..83c2f4e138e5 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -19,6 +19,13 @@ chosen {
 	memory {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	refclk: refclk-25mhz {
+		compatible = "fixed-clock";
+		clock-output-names = "ref";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
+	};
 };
 
 &serial0 {
-- 
2.34.1

