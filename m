Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 931C113DA9
	for <lists+openbmc@lfdr.de>; Sun,  5 May 2019 08:09:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44xb7N0l0qzDqKv
	for <lists+openbmc@lfdr.de>; Sun,  5 May 2019 16:09:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.4; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44xb6H13KnzDqKv;
 Sun,  5 May 2019 16:08:53 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-east-1.aws.symcld.net id 12/7A-19550-1FD7ECC5;
 Sun, 05 May 2019 06:08:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAIsWRWlGSWpSXmKPExsWSLveKRfdj7bk
 YgwfrNCx2XeawmLH3AbPF/CPnWC1+n//LbLHp8TVWi+bV55gtLu+aw2ax9PpFJotTLS9YLFr3
 HmG32HtgI4sDt8fV9l3sHmvmrWH0WLCp1OPix2PMHptWdbJ5bF5S73F+xkJGj8+b5AI4olgz8
 5LyKxJYM66cv8tScCmyYsrllUwNjMc8uhi5OIQEOpgk/rzbwgrhzGeUaHy4lLmLkZODTUBN4u
 Tse2AJEYGPjBL/T95hA3GYBSYxSjR8uQJWJSxgK7H55RsmEJtFQFXixc3tbCA2r4CzxIp39xh
 BbAkBOYmb5zqZJzByLmBkWMVollSUmZ5RkpuYmaNraGCga2hopAskjcz0Eqt0k/RKi3VTE4tL
 dA31EsuL9Yorc5NzUvTyUks2MQJDLqWAoW4H44+l6YcYJTmYlER559icixHiS8pPqcxILM6IL
 yrNSS0+xCjDwaEkwRtSA5QTLEpNT61Iy8wBBj9MWoKDR0mE9wpImre4IDG3ODMdInWKUVFKnN
 cJGDNCAiCJjNI8uDZYxF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzrBTKeJzOvBG76K6D
 FTECLn086BbK4JBEhJdXAqLonzXdFRPnWI93ui2XYUlr4NW/67t1SkBGmqyy+5Oyn+svx9xdP
 0eA6uXILwyLTVVbCte2ZvEqmuZn5rnlm+co5jrVS2w9/1zyX/PdQQr75cZuuewKvq/8tKfT6q
 mr45oz9rEWLz5RfFa368+3pwStik2Wn+YtO8eju/zL5+NqvPmdSlvCzKbEUZyQaajEXFScCAF
 sA5CyzAgAA
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-21.tower-386.messagelabs.com!1557036527!7491421!1
X-Originating-IP: [103.30.234.4]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8234 invoked from network); 5 May 2019 06:08:49 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.4)
 by server-21.tower-386.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 May 2019 06:08:49 -0000
Received: from smtpinternal.lenovo.com (unknown [10.96.80.33])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 27D696C528698F04F3F0;
 Sun,  5 May 2019 14:08:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.245.100.154])
 by Forcepoint Email with ESMTP id BA91DE225E25E20FE5D4;
 Sun,  5 May 2019 14:08:45 +0800 (CST)
From: Andrew Peng <pengms1@lenovo.com>
To: venture@google.com, benjaminfair@google.com, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, andrew@aj.id.au, mark.rutland@arm.com,
 robh+dt@kernel.org
Subject: [PATCH v6] ARM: dts: aspeed: Adding Lenovo Hr630 BMC
Date: Sun,  5 May 2019 14:08:38 +0800
Message-Id: <1557036518-286348-1-git-send-email-pengms1@lenovo.com>
X-Mailer: git-send-email 2.7.4
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
Cc: dukh@lenovo.com, pengms1@lenovo.com, openbmc@lists.ozlabs.org,
 hsung1@lenovo.com, liuyh21@lenovo.com, liuyj19@lenovo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Lenovo Hr630 family equipped with
Aspeed 2500 BMC SoC. Hr630 is a x86 server development kit
with a ASPEED ast2500 BMC manufactured by Lenovo.
Specifically, This adds the Hr630 platform device tree file
used by the Hr630 BMC machines.

This also adds an entry of Hr630 device tree file in Makefile

Signed-off-by: Andrew Peng <pengms1@lenovo.com>
Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
Signed-off-by: Lisa Liu <liuyj19@lenovo.com>
---
Changes in v6:
 - add appropriate pinctrl property for uar1, uart2, uart3 and adc.
 - remove vhub definition and comment.
 - remove some GPIO definitions.
 - revise Makefile according to sort alphabetically.
Changes in v5:
 - revise pca9545 and pca9546 switch aliases name.
Changes in v4:
 - add pca9546 switch aliases name.
Changes in v3:
 - revise i2c switch aliases name.
Changes in v2:
 - add i2c switch aliases name.
 - remove the unused eeprom device from DT file.
 - remove "Licensed under..." sentence.

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts | 566 ++++++++++++++++++++++++++
 2 files changed, 567 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f4f5aea..1276167 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1255,6 +1255,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
+	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
new file mode 100644
index 0000000..d3695a3
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
@@ -0,0 +1,566 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Device Tree file for Lenovo Hr630 platform
+ *
+ * Copyright (C) 2019-present Lenovo
+ */
+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "HR630 BMC";
+	compatible = "lenovo,hr630-bmc", "aspeed,ast2500";
+
+	aliases {
+		i2c14 = &i2c_rbp;
+		i2c15 = &i2c_fbp1;
+		i2c16 = &i2c_fbp2;
+		i2c17 = &i2c_fbp3;
+		i2c18 = &i2c_riser2;
+		i2c19 = &i2c_pcie4;
+		i2c20 = &i2c_riser1;
+		i2c21 = &i2c_ocp;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x00100000>; /* 1M */
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		fault {
+			gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+		<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+		<&adc 8>, <&adc 9>, <&adc 10>,
+		<&adc 12>, <&adc 13>, <&adc 14>;
+	};
+
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
+};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+			&pinctrl_rxd1_default>;
+};
+
+&uart2 {
+	/* Rear RS-232 connector */
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default
+			&pinctrl_rxd2_default
+			&pinctrl_nrts2_default
+			&pinctrl_ndtr2_default
+			&pinctrl_ndsr2_default
+			&pinctrl_ncts2_default
+			&pinctrl_ndcd2_default
+			&pinctrl_nri2_default>;
+};
+
+&uart3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd3_default
+			&pinctrl_rxd3_default>;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&ibt {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	use-ncsi;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&adc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default
+			&pinctrl_adc1_default
+			&pinctrl_adc2_default
+			&pinctrl_adc3_default
+			&pinctrl_adc4_default
+			&pinctrl_adc5_default
+			&pinctrl_adc6_default
+			&pinctrl_adc7_default
+			&pinctrl_adc8_default
+			&pinctrl_adc9_default
+			&pinctrl_adc10_default
+			&pinctrl_adc12_default
+			&pinctrl_adc13_default
+			&pinctrl_adc14_default>;
+};
+
+&i2c0 {
+	status = "okay";
+	/* temp1 inlet */
+	tmp75@4e {
+		compatible = "national,lm75";
+		reg = <0x4e>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	/* temp2 outlet */
+	tmp75@4d {
+		compatible = "national,lm75";
+		reg = <0x4d>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+	/*	Slot 0,
+	 *	Slot 1,
+	 *	Slot 2,
+	 *	Slot 3
+	 */
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9545";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;	/* may use mux@70 next. */
+
+		i2c_rbp: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_fbp1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_fbp2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_fbp3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	/*	Slot 0,
+	 *	Slot 1,
+	 *	Slot 2,
+	 *	Slot 3
+	 */
+	i2c-switch@76 {
+		compatible = "nxp,pca9546";
+		reg = <0x76>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;  /* may use mux@76 next. */
+
+		i2c_riser2: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_pcie4: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c_riser1: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_ocp: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c256";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default
+	&pinctrl_pwm1_default
+	&pinctrl_pwm2_default
+	&pinctrl_pwm3_default
+	&pinctrl_pwm4_default
+	&pinctrl_pwm5_default
+	&pinctrl_pwm6_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@4 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@5 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@6 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@7 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+
+	fan@8 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
+	};
+
+	fan@9 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
+	};
+
+	fan@10 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
+	};
+
+	fan@11 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
+	};
+
+	fan@12 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
+	};
+
+	fan@13 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
+	};
+};
+
+&gpio {
+
+	pin_gpio_b5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "IRQ_BMC_PCH_SMI_LPC_N";
+	};
+
+	pin_gpio_f0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 0) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "IRQ_BMC_PCH_NMI_R";
+	};
+
+	pin_gpio_f3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "I2C_BUS0_RST_OUT_N";
+	};
+
+	pin_gpio_f4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "FM_SKT0_FAULT_LED";
+	};
+
+	pin_gpio_f5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "FM_SKT1_FAULT_LED";
+	};
+
+	pin_gpio_g4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "FAN_PWR_CTL_N";
+	};
+
+	pin_gpio_g7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "RST_BMC_PCIE_I2CMUX_N";
+	};
+
+	pin_gpio_h2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PSU1_FFS_N_R";
+	};
+
+	pin_gpio_h3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PSU2_FFS_N_R";
+	};
+
+	pin_gpio_i3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_INTRUDED_COVER";
+	};
+
+	pin_gpio_j2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_BIOS_UPDATE_N";
+	};
+
+	pin_gpio_j3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(J, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "RST_BMC_HDD_I2CMUX_N";
+	};
+
+	pin_gpio_s2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_VGA_SW";
+	};
+
+	pin_gpio_s4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 4) GPIO_ACTIVE_HIGH>;
+		output;
+		line-name = "VBAT_EN_N";
+	};
+
+	pin_gpio_s6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "PU_BMC_GPIOS6";
+	};
+
+	pin_gpio_y0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Y, 0) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "BMC_NCSI_MUX_CTL_S0";
+	};
+
+	pin_gpio_y1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Y, 1) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "BMC_NCSI_MUX_CTL_S1";
+	};
+
+	pin_gpio_z0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "I2C_RISER2_INT_N";
+	};
+
+	pin_gpio_z2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "I2C_RISER2_RESET_N";
+	};
+
+	pin_gpio_z3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "FM_BMC_PCH_SCI_LPC_N";
+	};
+
+	pin_gpio_z7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Z, 7) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "BMC_POST_CMPLT_N";
+	};
+
+	pin_gpio_aa0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "HOST_BMC_USB_SEL";
+	};
+
+	pin_gpio_aa5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(AA, 5) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "I2C_BUS1_RST_OUT_N";
+	};
+
+};
--
2.7.4

