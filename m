Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B955D91D8A2
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 09:11:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCHKT3zRnz3fQH
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 17:11:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCHJd34Ppz3cB2
	for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2024 17:11:10 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 4617B2M5007118
	for <openbmc@lists.ozlabs.org>; Mon, 1 Jul 2024 10:11:02 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Jul
 2024 10:11:01 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Jul
 2024 15:10:57 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Jul 2024 15:10:56 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 7B7995F665;
	Mon,  1 Jul 2024 10:10:55 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 77531DC04D0; Mon,  1 Jul 2024 10:10:55 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v1 4/6] arm64: dts: modify clock property in modules node
Date: Mon, 1 Jul 2024 10:10:46 +0300
Message-ID: <20240701071048.751863-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240701071048.751863-1-tmaimon77@gmail.com>
References: <20240701071048.751863-1-tmaimon77@gmail.com>
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

Modify clock property handler in UART, CPU, PECI modules to reset
controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 16 ++++++++--------
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi |  8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 84a2a5172597..ed9f0edf1888 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -74,7 +74,7 @@ peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm845-peci";
 				reg = <0x100000 0x1000>;
 				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
+				clocks = <&rstc NPCM8XX_CLK_APB3>;
 				cmd-timeout-ms = <1000>;
 				status = "disabled";
 			};
@@ -90,7 +90,7 @@ timer0: timer@8000 {
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&rstc NPCM8XX_CLK_UART>;
 				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
 				status = "disabled";
@@ -99,7 +99,7 @@ serial0: serial@0 {
 			serial1: serial@1000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x1000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&rstc NPCM8XX_CLK_UART>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
 				status = "disabled";
@@ -108,7 +108,7 @@ serial1: serial@1000 {
 			serial2: serial@2000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x2000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&rstc NPCM8XX_CLK_UART>;
 				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
 				status = "disabled";
@@ -117,7 +117,7 @@ serial2: serial@2000 {
 			serial3: serial@3000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x3000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&rstc NPCM8XX_CLK_UART>;
 				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
 				status = "disabled";
@@ -126,7 +126,7 @@ serial3: serial@3000 {
 			serial4: serial@4000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x4000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&rstc NPCM8XX_CLK_UART>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
 				status = "disabled";
@@ -135,7 +135,7 @@ serial4: serial@4000 {
 			serial5: serial@5000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x5000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&rstc NPCM8XX_CLK_UART>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
 				status = "disabled";
@@ -144,7 +144,7 @@ serial5: serial@5000 {
 			serial6: serial@6000 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x6000 0x1000>;
-				clocks = <&clk NPCM8XX_CLK_UART>;
+				clocks = <&rstc NPCM8XX_CLK_UART2>;
 				interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
 				reg-shift = <2>;
 				status = "disabled";
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
index 383938dcd3ce..3cbcea65eba2 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -14,7 +14,7 @@ cpus {
 		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a35";
-			clocks = <&clk NPCM8XX_CLK_CPU>;
+			clocks = <&rstc NPCM8XX_CLK_CPU>;
 			reg = <0x0 0x0>;
 			next-level-cache = <&l2>;
 			enable-method = "psci";
@@ -23,7 +23,7 @@ cpu0: cpu@0 {
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a35";
-			clocks = <&clk NPCM8XX_CLK_CPU>;
+			clocks = <&rstc NPCM8XX_CLK_CPU>;
 			reg = <0x0 0x1>;
 			next-level-cache = <&l2>;
 			enable-method = "psci";
@@ -32,7 +32,7 @@ cpu1: cpu@1 {
 		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a35";
-			clocks = <&clk NPCM8XX_CLK_CPU>;
+			clocks = <&rstc NPCM8XX_CLK_CPU>;
 			reg = <0x0 0x2>;
 			next-level-cache = <&l2>;
 			enable-method = "psci";
@@ -41,7 +41,7 @@ cpu2: cpu@2 {
 		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a35";
-			clocks = <&clk NPCM8XX_CLK_CPU>;
+			clocks = <&rstc NPCM8XX_CLK_CPU>;
 			reg = <0x0 0x3>;
 			next-level-cache = <&l2>;
 			enable-method = "psci";
-- 
2.34.1

