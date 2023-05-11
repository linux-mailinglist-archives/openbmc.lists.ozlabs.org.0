Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281AB6FECD2
	for <lists+openbmc@lfdr.de>; Thu, 11 May 2023 09:30:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH3TZ6wcwz3fM3
	for <lists+openbmc@lfdr.de>; Thu, 11 May 2023 17:30:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nm40waXQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.197; helo=m12.mail.163.com; envelope-from=maxiaoyu_jn@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nm40waXQ;
	dkim-atps=neutral
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH3Rw061vz3f5K
	for <openbmc@lists.ozlabs.org>; Thu, 11 May 2023 17:29:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fd2Qs
	ib8nbWpHJgEIvbTYd7jZB85zti28xLcIaTZ02s=; b=Nm40waXQE8CiNPXkRwz/7
	bIADBx7RRAiFdqD6poZhvauGdjomHqFOj0rSFMegFM6/5tje0KpKstIbOdIWYTu9
	O3QdoPYGwubEHkjiitrjuZc2bPmhiHJRMyNqOp1GXPeRVgh87BClU05xHlHm0zVT
	CDku3tXaLOjaqpdiq6sp4w=
Received: from localhost.localdomain (unknown [117.136.93.156])
	by zwqz-smtp-mta-g0-0 (Coremail) with SMTP id _____wAXbyOVlVxkXzQ+Bg--.49879S2;
	Thu, 11 May 2023 15:13:27 +0800 (CST)
From: maxiaoyu_jn@163.com
To: joel@jms.id.au,
	andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/1] [PATCH v2,1/1]ARM: dts: aspeed: Add Inspur NF5280M7 BMC machine
Date: Thu, 11 May 2023 15:13:09 +0800
Message-Id: <20230511071309.3854-1-maxiaoyu_jn@163.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXbyOVlVxkXzQ+Bg--.49879S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfJr4rGw1xJr17Gr13Cry7GFg_yoW8JFWrXo
	ZFyFnY9ry5WFy8Wa97Zry3Kw17Ar1kKr1fGw4Ut3W3AryrZrsxtF95Ga15uFyjy34rtryq
	y34IkFWUt348tr4kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwSoXDUUUU
X-Originating-IP: [117.136.93.156]
X-CM-SenderInfo: 5pd0xtpr1xsyrq6rljoofrz/1tbiGhlsg1aEFMs55AAAs8
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
Cc: guoping@inspur.com, maxiaoyu@inspur.com, banht@inspur.com, wangzhiqiang02@inspur.com, liuxiwei@inspur.com, wangxinglong@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Xiaoyu Ma <maxiaoyu@inspur.com>

the Inspur NF5280M7 is an x86 platform server with an AST2600-based BMC.
This dts file provides a basic configuration for its OpenBMC
development.

Signed-off-by: Xiaoyu Ma <maxiaoyu@inspur.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-inspur-nf5280m7.dts   | 669 ++++++++++++++++++
 2 files changed, 670 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index eb681903d50b..5ab1a0fc36a3 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1611,6 +1611,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-inspur-nf5280m6.dtb \
+	aspeed-bmc-inspur-nf5280m7.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts
new file mode 100644
index 000000000000..d59e8d76006f
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts
@@ -0,0 +1,669 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2023 Inspur Corporation
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "NF5280M7 BMC";
+	compatible = "inspur,nf5280m7-bmc", "aspeed,ast2600";
+	aliases {
+		i2c200 = &bus2_mux70_0;
+		i2c500 = &bus5_mux00;
+		i2c501 = &bus5_mux01;
+		i2c600 = &i2c6s0ch0;
+		i2c601 = &i2c6s0ch1;
+		i2c602 = &i2c6s0ch2;
+		i2c603 = &i2c6s0ch3;
+		i2c604 = &i2c6s0ch4;
+		i2c605 = &i2c6s0ch5;
+		i2c606 = &i2c6s0ch6;
+		i2c607 = &i2c6s0ch7;
+		i2c610 = &i2c6s1ch0;
+		i2c611 = &i2c6s1ch1;
+		i2c612 = &i2c6s1ch2;
+		i2c613 = &i2c6s1ch3;
+		i2c614 = &i2c6s1ch4;
+		i2c615 = &i2c6s1ch5;
+		i2c616 = &i2c6s1ch6;
+		i2c617 = &i2c6s1ch7;
+		i2c620 = &i2c6s2ch0;
+		i2c621 = &i2c6s2ch1;
+		i2c622 = &i2c6s2ch2;
+		i2c623 = &i2c6s2ch3;
+		i2c624 = &i2c6s2ch4;
+		i2c625 = &i2c6s2ch5;
+		i2c626 = &i2c6s2ch6;
+		i2c627 = &i2c6s2ch7;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8 earlycon";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		vga_memory: frammebuffer {
+			no-map;
+			reg = <0x9ff00000 0x01000000>; /* 16M */
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		cpld {
+			label = "cpld";
+			gpios = <&gpio0 ASPEED_GPIO(N, 2) GPIO_ACTIVE_HIGH>;
+			linux,code = <ASPEED_GPIO(N, 2)>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		fan-fault {
+			label = "fan-fault";
+			gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		system-hot {
+			label = "system-hot";
+			gpios = <&gpio0 ASPEED_GPIO(B, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		psu-fault {
+			label = "psu-fault";
+			gpios = <&gpio0 ASPEED_GPIO(B, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		heartbeat {
+			label = "heartbeat";
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		memory-fault {
+			label = "memory-fault";
+			gpios = <&gpio0 ASPEED_GPIO(Y, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		system-fault {
+			label = "system-fault";
+			gpios = <&gpio0 ASPEED_GPIO(Y, 3) GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
+};
+
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bios";
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&peci0 {
+	status = "okay";
+	gpios = <&gpio0 ASPEED_GPIO(F, 6) 0>;
+
+	peci-client@30 {
+		compatible = "intel,peci-client";
+		reg = <0x30>;
+	};
+
+	peci-client@31 {
+		compatible = "intel,peci-client";
+		reg = <0x31>;
+	};
+};
+
+&gpio0 {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","POWER_OUT","RESET_OUT","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"RESET_BUTTON","","","NMI_BUTTON","NMI_OUT","","","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","SIO_ONCONTROL","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","SIO_S5","POWER_BUTTON","","PS_PWROK","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","POST_COMPLETE","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
+
+&kcs3 {
+	aspeed,lpc-io-reg = <0xCA2>;
+	status = "okay";
+};
+
+&kcs4 {
+	aspeed,lpc-io-reg = <0xCA4>;
+	status = "okay";
+};
+
+&lpc_snoop {
+	snoop-ports = <0x80>;
+	status = "okay";
+};
+
+&mdio1 {
+	status = "okay";
+
+	ethphy1: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
+};
+
+&mac3 {
+	status = "okay";
+
+	phy-mode = "rmii";
+	use-ncsi;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+};
+
+&adc0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&vuart1 {
+	status = "okay";
+};
+
+&i2c0 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c1 {
+	multi-master;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	pca9546@70{
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		bus2_mux70_0: i2c@2{
+			reg = <0>;
+			tmp112@49{
+				compatible = "ti,tmp112";
+				reg = <0x49>;
+				label = "Inlet_Temp";
+			};
+			emc1413@4c{
+				compatible = "microchip,emc1413";
+				reg = <0x4c>;
+				label = "Outlet_Temp";
+			};
+		};
+	};
+};
+
+&i2c4 {
+	multi-master;
+	status = "okay";
+	ipmb0@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c5 {
+	bus-frequency = <1000000>;
+	multi-master;
+	status = "okay";
+	pca9546@70{
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		bus5_mux00: i2c@0 {
+			reg = <0>;
+			status = "okay";
+			vrmp2888@76 {
+				compatible = "mps,mp2888";
+				reg = <0x76>;
+			};
+			vrmp2888@72 {
+				compatible = "mps,mp2888";
+				reg = <0x72>;
+			};
+			vrmp2888@62{
+				compatible = "mps,mp2888";
+				reg = <0x62>;
+			};
+		};
+		bus5_mux01: i2c@1{
+			reg = <1>;
+			status = "okay";
+			vrmp2888@76{
+				compatible = "mps,mp2888";
+				reg = <0x76>;
+			};
+			vrmp2888@72 {
+				compatible = "mps,mp2888";
+				reg = <0x72>;
+			};
+			vrmp2888@62{
+				compatible = "mps,mp2888";
+				reg = <0x62>;
+			};
+		};
+		bus5_mux02: i2c@2{
+			reg = <2>;
+		};
+		bus5_mux03: i2c@3{
+			reg = <3>;
+		};
+	};
+};
+
+&i2c6 {
+	multi-master;
+	status = "okay";
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c6s0ch0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+			pca9548@71 {
+				compatible = "nxp,pca9548";
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				i2c6s1ch0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				i2c6s1ch1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				i2c6s1ch2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				i2c6s1ch3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				i2c6s1ch4: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				i2c6s1ch5: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				i2c6s1ch6: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				i2c6s1ch7: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			pca9548@72 {
+				compatible = "nxp,pca9548";
+				reg = <0x72>;
+				i2c-mux-idle-disconnect;
+
+				i2c6s2ch0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				i2c6s2ch1: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				i2c6s2ch2: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				i2c6s2ch3: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				i2c6s2ch4: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				i2c6s2ch5: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				i2c6s2ch6: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				i2c6s2ch7: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+		};
+		i2c6s0ch1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+		i2c6s0ch2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+		i2c6s0ch3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+		i2c6s0ch4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+		i2c6s0ch5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+		i2c6s0ch6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+		i2c6s0ch7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
+&i2c7 {
+	multi-master;
+	#retries = <3>;
+	status = "okay";
+
+	adc128d818@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		ti,mode = /bits/ 8 <0x01>;
+	};
+	adc128d818@1e {
+		compatible = "ti,adc128d818";
+		reg = <0x1e>;
+		ti,mode = /bits/ 8 <0x01>;
+	};
+	adc128d818@2d {
+		compatible = "ti,adc128d818";
+		reg = <0x2d>;
+		ti,mode = /bits/ 8 <0x01>;
+	};
+	ina226@45 {
+		compatible = "ti,ina226";
+		reg = <0x45>;
+		shunt-resistor = <500>;
+	};
+};
+
+&i2c8 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c9 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+
+	pca0: pca9555@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"", "", "", "",
+			"", "",
+			"FAN_PRSNT8_D_N", "FAN_PRSNT9_D_N",
+			"", "",	"", "",
+			"", "",	"", "";
+	};
+
+	pca1: pca9555@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "FAN_PRSNT0_D_N", "FAN_PRSNT1_D_N",
+			"FAN_PRSNT2_D_N", "FAN_PRSNT3_D_N",
+			"FAN_PRSNT4_D_N", "FAN_PRSNT5_D_N",
+			"FAN_PRSNT6_D_N", "FAN_PRSNT7_D_N",
+			"", "",	"", "",
+			"", "",	"", "";
+	};
+
+};
+
+&i2c11 {
+	status = "okay";
+
+	power-supply@58 {
+		compatible = "inspur,ipsps1";
+		reg = <0x58>;
+	};
+
+	power-supply@59 {
+		compatible = "inspur,ipsps1";
+		reg = <0x59>;
+	};
+};
+
+&i2c12 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c13 {
+	multi-master;
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&vhub {
+	status = "okay";
+};
-- 
2.40.0

