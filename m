Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC84750EE87
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:10:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQLv4mHHz2xtQ
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:09:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ET0NwvTF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=01100c5ac3=nick.hawkins@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=ET0NwvTF; dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kkr4D4k68z2xy3
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 07:18:17 +1000 (AEST)
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23LEv0Ko007017;
 Thu, 21 Apr 2022 19:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=kUzIlJ5qad8YpCJQCWHt6PCb8d/QHqmZG5rNDhyUL9M=;
 b=ET0NwvTFchYLtaj+IVhaVbtx4XDCIU4Vr6xZ4oTSYJGxfg7UcKc9r8/qI/v4XbzDEXtn
 t4iEhF0OXSRHrRw3ZG3L6btkh71D9FghpxK/8GMM71dmvhMoUx2omCepSOhbJT5fSLVh
 Ie0HUmTkUs8Ae6LT5ZA3nz7PrVfyKQ62ZlkO34tLWtZ/zcShdVzGnVLQrwQkJVp/Lrs4
 E4oCpf5lx9tt/O13iWKjMi1OfKKfnu00hrHxPk1YdV7pk8Mlx8YI+moGnfQ8lMsN1XMd
 XBs/P0Us4C1b3dnrE+QsK1YTwEPsviXyI1d9IXXbogrhB4B+httRUFQBZGlCfKVuwdUI DQ== 
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3fk9fkt6bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 19:19:42 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net
 [16.220.97.129])
 by g4t3426.houston.hpe.com (Postfix) with ESMTP id B04B562;
 Thu, 21 Apr 2022 19:19:41 +0000 (UTC)
Received: from hpe.com (cigateway-dev.us.rdlabs.hpecorp.net [10.14.73.30])
 by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 60F1848;
 Thu, 21 Apr 2022 19:19:41 +0000 (UTC)
From: nick.hawkins@hpe.com
To: verdun@hpe.com, nick.hawkins@hpe.com, joel@jms.id.au, arnd@arndb.de,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 10/11] arch: arm: boot: dts: Introduce HPE GXP Device tree
Date: Thu, 21 Apr 2022 14:21:31 -0500
Message-Id: <20220421192132.109954-11-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421192132.109954-1-nick.hawkins@hpe.com>
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
X-Proofpoint-GUID: CTkM_sirV8zjtSvWPSbTNYOI5yK9wa3L
X-Proofpoint-ORIG-GUID: CTkM_sirV8zjtSvWPSbTNYOI5yK9wa3L
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-21_04,2022-04-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204210102
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Nick Hawkins <nick.hawkins@hpe.com>

The HPE SoC is new to linux. This patch
creates the basic device tree layout with minimum required
for linux to boot. This includes timer and watchdog
support.

The dts file is empty at this point but will be
updated in subsequent updates as board specific features
are enabled.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---
v5:
* Fixed commit message to show previous changes
* Fixed typo ehci -> echi
v4:
* Removed hpe,gxp-cpu-init as it was no longer necessary
* Removed bootargs as requested
* Removed empty ahb node
* Moved reg after compatible, everywhere
* Removed osc and memclk
* Removed syscon@c00000f8 as it was not necessary for boot
* Fixed Alphabetical issue in dts/Makefile
* Added specific board binding for dl360gen10
* Removed empty node
* Added Accurate Clock Architecture
* Fixed generic-echi and generic-ochi issues
* Removed i2cg
v3:
* Fixed issues with warnings
* Used proper patchset format
v2:
* Reduced size of dtsi to essential components
* Followed the proper format for having a dtsi and
  dts
---
 arch/arm/boot/dts/Makefile               |   2 +
 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts |  13 +++
 arch/arm/boot/dts/hpe-gxp.dtsi           | 128 +++++++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
 create mode 100644 arch/arm/boot/dts/hpe-gxp.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c16f8a2b738..293717719c70 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -255,6 +255,8 @@ dtb-$(CONFIG_ARCH_HISI) += \
 	hi3519-demb.dtb
 dtb-$(CONFIG_ARCH_HIX5HD2) += \
 	hisi-x5hd2-dkb.dtb
+dtb-$(CONFIG_ARCH_HPE_GXP) += \
+	hpe-bmc-dl360gen10.dtb
 dtb-$(CONFIG_ARCH_INTEGRATOR) += \
 	integratorap.dtb \
 	integratorap-im-pd1.dtb \
diff --git a/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
new file mode 100644
index 000000000000..69e9c6672ea8
--- /dev/null
+++ b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree file for HPE DL360Gen10
+ */
+
+/include/ "hpe-gxp.dtsi"
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "hpe,gxp-dl360gen10","hpe,gxp";
+	model = "Hewlett Packard Enterprise ProLiant dl360 Gen10";
+};
diff --git a/arch/arm/boot/dts/hpe-gxp.dtsi b/arch/arm/boot/dts/hpe-gxp.dtsi
new file mode 100644
index 000000000000..a3a082d21101
--- /dev/null
+++ b/arch/arm/boot/dts/hpe-gxp.dtsi
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree file for HPE GXP
+ */
+
+/dts-v1/;
+/ {
+	model = "Hewlett Packard Enterprise GXP BMC";
+	compatible = "hpe,gxp","hpe,gxp-dl360gen10";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a9";
+			reg = <0>;
+			device_type = "cpu";
+		};
+	};
+
+	clocks {
+
+		pll: pll {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1600000000>;
+		};
+
+		iopclk: iopclk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clock-div = <4>;
+			clock-mult = <1>;
+			clocks = <&pll>;
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x20000000>;
+	};
+
+	axi {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		dma-ranges;
+
+		ahb@c0000000 {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xc0000000 0x30000000>;
+
+			vic0: interrupt-controller@eff0000 {
+				compatible = "arm,pl192-vic";
+				reg = <0xeff0000 0x1000>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+			vic1: interrupt-controller@80f00000 {
+				compatible = "arm,pl192-vic";
+				reg = <0x80f00000 0x1000>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+			uarta: serial@e0 {
+				compatible = "ns16550a";
+				reg = <0xe0 0x8>;
+				interrupts = <17>;
+				interrupt-parent = <&vic0>;
+				clock-frequency = <1846153>;
+				reg-shift = <0>;
+			};
+
+			uartb: serial@e8 {
+				compatible = "ns16550a";
+				reg = <0xe8 0x8>;
+				interrupts = <18>;
+				interrupt-parent = <&vic0>;
+				clock-frequency = <1846153>;
+				reg-shift = <0>;
+			};
+
+			uartc: serial@f0 {
+				compatible = "ns16550a";
+				reg = <0xf0 0x8>;
+				interrupts = <19>;
+				interrupt-parent = <&vic0>;
+				clock-frequency = <1846153>;
+				reg-shift = <0>;
+			};
+
+			usb0: usb@efe0000 {
+				compatible = "hpe,gxp-ehci","generic-ehci";
+				reg = <0xefe0000 0x100>;
+				interrupts = <7>;
+				interrupt-parent = <&vic0>;
+			};
+
+			st: timer@80 {
+				compatible = "hpe,gxp-timer","simple-mfd";
+				reg = <0x80 0x16>;
+				interrupts = <0>;
+				interrupt-parent = <&vic0>;
+				clocks = <&iopclk>;
+				clock-names = "iopclk";
+				watchdog {
+					compatible = "hpe,gxp-wdt";
+				};
+			};
+
+			usb1: usb@efe0100 {
+				compatible = "hpe,gxp-ohci","generic-ohci";
+				reg = <0xefe0100 0x110>;
+				interrupts = <6>;
+				interrupt-parent = <&vic0>;
+			};
+		};
+	};
+
+};
-- 
2.17.1

