Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BB0263D9A
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 08:52:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn8h66ZPVzDqdc
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 16:52:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=ben_pai@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wistron.com
X-Greylist: delayed 310 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Sep 2020 16:51:12 AEST
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bn8g41pp3zDqZq
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 16:51:10 +1000 (AEST)
Received: from EXCHAPP02.whq.wistron (unverified [10.37.38.25]) by 
 TWNHUMSW4.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Te184e3a487c0a8167212a4@TWNHUMSW4.wistron.com>; Thu, 10 Sep 2020 
 14:45:52 +0800
Received: from EXCHAPP04.whq.wistron (10.37.38.27) by EXCHAPP02.whq.wistron 
 (10.37.38.25) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5; Thu, 10 Sep 2020 14:45:52 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP04.whq.wistron 
 (10.37.38.27) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 10 Sep 2020 14:45:52 +0800
From: Ben Pai <ben_pai@wistron.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.4 v1] ARM: dts: aspeed: Add Mowgli BMC platform
Date: Thu, 10 Sep 2020 14:45:43 +0800
Message-ID: <20200910064543.22820-1-ben_pai@wistron.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
X-TM-SNTS-SMTP: 99FE05E8044C4990B405DAE61858A77E0796AD066BCF6DD2CF88C8634AEB5A0B2000:8
Content-Transfer-Encoding: 7bit
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
Cc: Ben Pai <Ben_Pai@wistron.com>, claire_ku@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mowgli BMC is an ASPEED ast2500 based BMC that is part of an
OpenPower Power9 server.

Signed-off-by: Ben Pai <Ben_Pai@wistron.com>
---
 arch/arm/boot/dts/Makefile                  |   1 +
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts | 663 ++++++++++++++++++++
 2 files changed, 664 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4572db3fa5ae..92edb2e12823 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1381,6 +1381,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-microsoft-olympus.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-mihawk.dtb \
+	aspeed-bmc-opp-mowgli.dtb \
 	aspeed-bmc-opp-nicole.dtb \
 	aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
new file mode 100644
index 000000000000..11fd86980162
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
@@ -0,0 +1,663 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+
+/ {
+	model = "Mowgli BMC";
+	compatible = "ibm,mowgli-bmc", "aspeed,ast2500";
+
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
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
+			reg = <0x98000000 0x04000000>; /* 64M */
+		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		air-water {
+			label = "air-water";
+			gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 6)>;
+		};
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(J, 2)>;
+		};
+
+		ps0-presence {
+			label = "ps0-presence";
+			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Z, 2)>;
+		};
+
+		ps1-presence {
+			label = "ps1-presence";
+			gpios = <&gpio ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Z, 0)>;
+		};
+
+		id-button {
+			label = "id-button";
+			gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 1)>;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		poll-interval = <1000>;
+
+		fan0-presence {
+			label = "fan0-presence";
+			gpios = <&pca9552 9 GPIO_ACTIVE_LOW>;
+			linux,code = <9>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&pca9552 10 GPIO_ACTIVE_LOW>;
+			linux,code = <10>;
+		};
+
+		fan2-presence {
+			label = "fan2-presence";
+			gpios = <&pca9552 11 GPIO_ACTIVE_LOW>;
+			linux,code = <11>;
+		};
+
+		fan3-presence {
+			label = "fan3-presence";
+			gpios = <&pca9552 12 GPIO_ACTIVE_LOW>;
+			linux,code = <12>;
+		};
+
+		fan4-presence {
+			label = "fan4-presence";
+			gpios = <&pca9552 13 GPIO_ACTIVE_LOW>;
+			linux,code = <13>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		front-fault {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		power-button {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&gpio ASPEED_GPIO(AA, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		front-id {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		fan0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca9552 0 GPIO_ACTIVE_LOW>;
+		};
+
+		fan1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca9552 1 GPIO_ACTIVE_LOW>;
+		};
+
+		fan2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca9552 2 GPIO_ACTIVE_LOW>;
+		};
+
+		fan3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca9552 3 GPIO_ACTIVE_LOW>;
+		};
+
+		fan4 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca9552 4 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	fsi: gpio-fsi {
+		compatible = "fsi-master-gpio", "fsi-master";
+		#address-cells = <2>;
+		#size-cells = <0>;
+		no-gpio-delays;
+
+		clock-gpios = <&gpio ASPEED_GPIO(E, 6) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_HIGH>;
+		mux-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		trans-gpios = <&gpio ASPEED_GPIO(E, 5) GPIO_ACTIVE_HIGH>;
+	};
+
+	iio-hwmon-12v {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>;
+	};
+
+	iio-hwmon-5v {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 1>;
+	};
+
+	iio-hwmon-3v {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 2>;
+	};
+
+	iio-hwmon-vdd {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 3>;
+	};
+
+	iio-hwmon-vcs {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 5>;
+	};
+
+	iio-hwmon-vdn {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 7>;
+	};
+
+	iio-hwmon-vio {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 9>;
+	};
+
+	iio-hwmon-vddra {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 11>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 12>;
+	};
+
+	iio-hwmon-vddrb {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 13>;
+	};
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+		&pinctrl_pwm2_default &pinctrl_pwm3_default
+		&pinctrl_pwm4_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04>;
+	};
+
+	fan@5 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x05>;
+	};
+
+	fan@6 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06>;
+	};
+
+	fan@7 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x07>;
+	};
+
+	fan@8 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08>;
+	};
+
+	fan@9 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x09>;
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		label = "bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		partitions {
+			#address-cells = < 1 >;
+			#size-cells = < 1 >;
+			compatible = "fixed-partitions";
+			u-boot@0 {
+				reg = < 0 0x60000 >;
+				label = "u-boot";
+			};
+			u-boot-env@60000 {
+				reg = < 0x60000 0x20000 >;
+				label = "u-boot-env";
+			};
+			obmc-ubi@80000 {
+				reg = < 0x80000 0x1F80000 >;
+				label = "obmc-ubi";
+			};
+		};
+	};
+	flash@1 {
+		status = "okay";
+		label = "alt-bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		partitions {
+			#address-cells = < 1 >;
+			#size-cells = < 1 >;
+			compatible = "fixed-partitions";
+			u-boot@0 {
+				reg = < 0 0x60000 >;
+				label = "alt-u-boot";
+			};
+			u-boot-env@60000 {
+				reg = < 0x60000 0x20000 >;
+				label = "alt-u-boot-env";
+			};
+			obmc-ubi@80000 {
+				reg = < 0x80000 0x1F80000 >;
+				label = "alt-obmc-ubi";
+			};
+		};
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		label = "pnor";
+		m25p,fast-read;
+		spi-max-frequency = <100000000>;
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
+	/* Rear RS-232 connector */
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+			&pinctrl_rxd1_default
+			&pinctrl_nrts1_default
+			&pinctrl_ndtr1_default
+			&pinctrl_ndsr1_default
+			&pinctrl_ncts1_default
+			&pinctrl_ndcd1_default
+			&pinctrl_nri1_default>;
+};
+
+&uart2 {
+	/* APSS */
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
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
+&i2c0 {
+	status = "okay";
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+};
+
+&i2c1 {
+	status = "disabled";
+};
+
+&i2c2 {
+	status = "okay";
+
+	/* CPU MFG CONN */
+
+};
+
+&i2c3 {
+	status = "okay";
+
+	/* APSS */
+	/* CPLD */
+
+	/* PCA9516 (repeater) ->
+	 *    CLK Buffer 9FGS9092
+	 *    Power Supply 0
+	 *    Power Supply 1
+	 *    PCA 9552 LED
+	 */
+
+	pca9552: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	power-supply@68 {
+		compatible = "ibm,cffps1";
+		reg = <0x68>;
+	};
+
+	power-supply@69 {
+		compatible = "ibm,cffps1";
+		reg = <0x69>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	/* CP0 VDD & VCS : IR35221 */
+	/* CP0 VDN & VIO : IR35221 */
+	/* CP0 VDDR : IR35221 */
+
+	ir35221@28 {
+		compatible = "infineon,ir35221";
+		reg = <0x28>;
+	};
+
+	ir35221@29 {
+		compatible = "infineon,ir35221";
+		reg = <0x29>;
+	};
+
+	ir35221@2d {
+		compatible = "infineon,ir35221";
+		reg = <0x2d>;
+	};
+
+};
+
+&i2c5 {
+	status = "disabled";
+};
+
+&i2c6 {
+	status = "disabled";
+};
+
+&i2c7 {
+	status = "disabled";
+};
+
+&i2c8 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	/* PCIe G3 x16 slot */
+};
+
+&i2c10 {
+	status = "disabled";
+};
+
+&i2c11 {
+	status = "okay";
+
+	/* CPLD */
+	/* TPM */
+	/* RTC RX8900CE */
+	/* TMP275A */
+	/* TMP275A */
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	tmp275@49 {
+		compatible = "ti,tmp275";
+		reg = <0x49>;
+	};
+
+};
+
+&i2c12 {
+	status = "disabled";
+};
+
+&i2c13 {
+	status = "disabled";
+};
+
+&vuart {
+	status = "okay";
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&adc {
+	status = "okay";
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
+			&pinctrl_adc11_default
+			&pinctrl_adc12_default
+			&pinctrl_adc13_default
+			&pinctrl_adc14_default
+			&pinctrl_adc15_default>;
+};
+
+&wdt1 {
+	aspeed,reset-type = "none";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+};
+
+&wdt2 {
+	aspeed,alt-boot;
+};
+
+&ibt {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+#include "ibm-power9-dual.dtsi"
+
-- 
2.17.1


---------------------------------------------------------------------------------------------------------------------------------------------------------------
This email contains confidential or legally privileged information and is for the sole use of its intended recipient. 
Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
---------------------------------------------------------------------------------------------------------------------------------------------------------------
