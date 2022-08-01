Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82529586A09
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 14:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxH6g2y3Xz3dsk
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 22:11:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxH322Jcfz30JK
	for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2022 22:08:45 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271C8S85020983
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 15:08:29 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 15:08:28 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Mon, 1 Aug 2022
 20:08:25 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 20:08:25 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 5BAE863A2B; Mon,  1 Aug 2022 15:08:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 14/16] arm64: dts: nuvoton: Add initial NPCM8XX device tree
Date: Mon, 1 Aug 2022 15:08:17 +0300
Message-ID: <20220801120819.113533-15-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801120819.113533-1-tmaimon77@gmail.com>
References: <20220801120819.113533-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This adds initial device tree support for the Nuvoton NPCM845 Board
Management controller (BMC) SoC family.

The NPCM845 based quad-core Cortex-A35 ARMv8 architecture and have
various peripheral IPs.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |   1 +
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 170 ++++++++++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  76 ++++++++
 3 files changed, 247 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 639e01a4d855..5c6b1a801a79 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -19,6 +19,7 @@ subdir-y += lg
 subdir-y += marvell
 subdir-y += mediatek
 subdir-y += microchip
+subdir-y += nuvoton
 subdir-y += nvidia
 subdir-y += qcom
 subdir-y += realtek
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
new file mode 100644
index 000000000000..aa7aac8c3774
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021 Nuvoton Technology tomer.maimon@nuvoton.com
+
+#include <dt-bindings/clock/nuvoton,npcm845-clk.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		gcr: system-controller@f0800000 {
+			compatible = "nuvoton,npcm845-gcr", "syscon";
+			reg = <0x0 0xf0800000 0x0 0x1000>;
+		};
+
+		gic: interrupt-controller@dfff9000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0xdfff9000 0x0 0x1000>,
+			      <0x0 0xdfffa000 0x0 0x2000>,
+			      <0x0 0xdfffc000 0x0 0x2000>,
+			      <0x0 0xdfffe000 0x0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			#address-cells = <0>;
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+			};
+		};
+	};
+
+	ahb {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		rstc: reset-controller@f0801000 {
+			compatible = "nuvoton,npcm845-reset";
+			reg = <0x0 0xf0801000 0x0 0x78>;
+			#reset-cells = <2>;
+			nuvoton,sysgcr = <&gcr>;
+		};
+
+		clk: clock-controller@f0801000 {
+			compatible = "nuvoton,npcm845-clk";
+			#clock-cells = <1>;
+			reg = <0x0 0xf0801000 0x0 0x1000>;
+		};
+
+		apb {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges = <0x0 0x0 0xf0000000 0x00300000>,
+				<0xfff00000 0x0 0xfff00000 0x00016000>;
+
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clock-names = "refclk";
+			};
+
+			serial0: serial@0 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x0 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial1: serial@1000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x1000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial2: serial@2000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x2000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial3: serial@3000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x3000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial4: serial@4000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x4000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial5: serial@5000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x5000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial6: serial@6000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x6000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			watchdog0: watchdog@801c {
+				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x801c 0x4>;
+				status = "disabled";
+				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				syscon = <&gcr>;
+			};
+
+			watchdog1: watchdog@901c {
+				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x901c 0x4>;
+				status = "disabled";
+				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				syscon = <&gcr>;
+			};
+
+			watchdog2: watchdog@a01c {
+				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xa01c 0x4>;
+				status = "disabled";
+				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				syscon = <&gcr>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
new file mode 100644
index 000000000000..12118b75c0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021 Nuvoton Technology tomer.maimon@nuvoton.com
+
+#include "nuvoton-common-npcm8xx.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			clocks = <&clk NPCM8XX_CLK_CPU>;
+			reg = <0x0 0x0>;
+			next-level-cache = <&l2>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			clocks = <&clk NPCM8XX_CLK_CPU>;
+			reg = <0x0 0x1>;
+			next-level-cache = <&l2>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			clocks = <&clk NPCM8XX_CLK_CPU>;
+			reg = <0x0 0x2>;
+			next-level-cache = <&l2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			clocks = <&clk NPCM8XX_CLK_CPU>;
+			reg = <0x0 0x3>;
+			next-level-cache = <&l2>;
+			enable-method = "psci";
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a35-pmu";
+		interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible      = "arm,psci-1.0";
+		method          = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.33.0

