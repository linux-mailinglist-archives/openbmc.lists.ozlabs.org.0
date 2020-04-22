Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D68241B35AF
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 05:45:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496RCr3RZVzDr0x
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 13:45:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=wangzq.jn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hNlIOCFn; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496RC35fLyzDql9
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 13:44:42 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id r14so392874pfg.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 20:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=zwOVC5wVOQJwrWdetvEvhadWkubyxYJqhO2JOgqlz6Y=;
 b=hNlIOCFn3JAiZItTC7bU+xclO6Es+k1ccV8Abr+lAX1z4Vna1sW38Me1xAEiw4cdW1
 7b74iX5yey6lhPx9MjQJm37GPcbS9CkcqQP3ciBxC77Sw4fASue4YL2r88+Ga8EA95Wj
 oWLBiMUQqVA4veZHNSH6wpYISkGwMzB6n35ImBE0FnVjKu72vSuFrR+sGRH+KGCy2QQz
 2rhdj9fTMcdtJqitsUSVag5ozvfJq6GDEbe6nySR5xgokUZ+nNiTnYyu+zd1JjN6azIs
 eVGM2Afnf/FA6nVeuNS0h9ioi5+Sb8S2QAAY3f+7d5hdGuBFm4aZZw76E74ofE+4B0Jv
 fURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=zwOVC5wVOQJwrWdetvEvhadWkubyxYJqhO2JOgqlz6Y=;
 b=POkV5MgkQ4BzL4+s0tdo+a0noMGQIQ9D61P/kR982wBfBoQjVAkph0/v8OxT53opuA
 /EylYjT4JE1d0g+fQyj8uxG3S2EPtoxVQ35qjCmemmNy7dR/V19zH97AjJ7t2qU+2m6/
 Yj3ZMwVuVrZzHXUrNl9pWpruRL7GSvMK0SPrwpmW2cXmhOeemyW1Fu/OL5pEmMZR3DKA
 9u8LILHHJ008lSQkQz541WH+FvUNcuIEikPqTMywOkGej94xC32Er9mJEoPbr6me7yc9
 eZ+nicowToYdNVI7bBVd3R1lAV/wYgMQMvod83G7dqLlmg6878zJsLxw/cyZ5w+9GoiD
 VRTA==
X-Gm-Message-State: AGi0PubHgnizlO3v8uEH9yrK4RpHVlTnRHSAZdjQNgqsXTPLtepV8BA6
 selAxa22U+mQ+Os5QAyJHhxFiV0C
X-Google-Smtp-Source: APiQypKKtPGmEqMror2wBUrR+Mglaj7PTH/Cw+iczHV7ci2j8N8SUsDowNRC3d70wgFad7JlB65ZxQ==
X-Received: by 2002:a63:f50c:: with SMTP id w12mr24000191pgh.253.1587527077855; 
 Tue, 21 Apr 2020 20:44:37 -0700 (PDT)
Received: from localhost ([184.170.216.193])
 by smtp.gmail.com with ESMTPSA id 10sm3928081pfn.204.2020.04.21.20.44.36
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Apr 2020 20:44:37 -0700 (PDT)
From: John Wang <wangzq.jn@gmail.com>
X-Google-Original-From: John Wang <wangzqbj@inspur.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Add Inspur cp5280g2 BMC machine
Date: Wed, 22 Apr 2020 11:44:31 +0800
Message-Id: <20200422034431.21255-1-wangzqbj@inspur.com>
X-Mailer: git-send-email 2.17.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The cp5280g2 is an open-power(p8) platform with
an ast2500 BMC

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-inspur-cp5280g2.dts   | 478 ++++++++++++++++++
 2 files changed, 479 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-cp5280g2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d6dfdf73e66b..2a11f8505928 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1292,6 +1292,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ibm-rainier.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
+	aspeed-bmc-inspur-cp5280g2.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-cp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-cp5280g2.dts
new file mode 100644
index 000000000000..e8ccb649beeb
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-cp5280g2.dts
@@ -0,0 +1,478 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+
+/ {
+	model = "CP5280G2 BMC";
+	compatible = "inspur,cp5280g2-bmc", "aspeed,ast2500";
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
+		vga_memory: framebuffer@9f000000 {
+			no-map;
+			reg = <0x9f000000 0x01000000>; /* 16M */
+		};
+
+		coldfire_memory: codefire_memory@9ef00000 {
+			reg = <0x9ef00000 0x00100000>;
+			no-map;
+		};
+
+		flash_memory: region@5c000000 {
+			no-map;
+			reg = <0x5c000000 0x04000000>; /* 64M */
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
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	fsi: gpio-fsi {
+		compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
+		#address-cells = <2>;
+		#size-cells = <0>;
+		no-gpio-delays;
+
+		memory-region = <&coldfire_memory>;
+		aspeed,sram = <&sram>;
+		aspeed,cvic = <&cvic>;
+
+		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
+		mux-gpios = <&gpio ASPEED_GPIO(AA, 6) GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio ASPEED_GPIO(AA, 7) GPIO_ACTIVE_HIGH>;
+		trans-gpios = <&gpio ASPEED_GPIO(AA, 4) GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(B, 3)>;
+		};
+
+		ps0-presence {
+			label = "ps0-presence";
+			gpios = <&gpio ASPEED_GPIO(F, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 0)>;
+		};
+
+		ps1-presence {
+			label = "ps1-presence";
+			gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 1)>;
+		};
+
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power {
+			label = "power";
+			/* TODO: dummy gpio */
+			gpios = <&gpio ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		init-ok {
+			label = "init-ok";
+			gpios = <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		front-memory {
+			label = "front-memory";
+			gpios = <&gpio ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		front-syshot {
+			label = "front-syshot";
+			gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		front-syshealth {
+			label = "front-syshealth";
+			gpios = <&gpio ASPEED_GPIO(I, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		front-fan {
+			label = "front-fan";
+			gpios = <&gpio ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		front-psu {
+			label = "front-psu";
+			gpios = <&gpio ASPEED_GPIO(B, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			label = "identify";
+			gpios = <&gpio ASPEED_GPIO(Z, 7) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 15>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
+			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
+			<&adc 10>, <&adc 11>, <&adc 12>, <&adc 13>, <&adc 14>;
+	};
+
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		label = "bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout.dtsi"
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
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_vgahs_default
+			&pinctrl_vgavs_default
+			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
+};
+
+&uart1 {
+	/* Rear RS-232 connector */
+	status = "okay";
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
+	/* Test Point */
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
+};
+
+&uart3 {
+	/* APSS */
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi1>;
+};
+
+&mac0 {
+	status = "okay";
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&i2c0 {
+	/* LCD */
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+		label = "fru";
+	};
+
+};
+
+&i2c2 {
+	status = "okay";
+
+	tmp112@48 {
+		compatible = "ti,tmp112";
+		reg = <0x48>;
+		label = "inlet";
+	};
+
+	tmp112@49 {
+		compatible = "ti,tmp112";
+		reg = <0x49>;
+		label = "outlet";
+	};
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			tmp112@4a {
+				compatible = "ti,tmp112";
+				reg = <0x4a>;
+				label = "psu_inlet";
+			};
+
+		};
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tmp112@4a {
+				compatible = "ti,tmp112";
+				reg = <0x4a>;
+				label = "ocp_zone";
+			};
+		};
+
+		i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			tmp112@4a {
+				compatible = "ti,tmp112";
+				reg = <0x4a>;
+				label = "bmc_zone";
+			};
+		};
+
+		i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			tmp112@7c {
+				compatible = "microchip,emc1413";
+				reg = <0x7c>;
+			};
+		};
+
+	};
+};
+
+&i2c3 {
+	/* Riser Card */
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+
+	rtc@68 {
+		compatible = "dallas,ds3232";
+		reg = <0x68>;
+	};
+};
+
+&i2c5 {
+	/* vr  */
+	status = "okay";
+};
+
+&i2c6 {
+	/* bp card */
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	/* cpld */
+	status = "okay";
+};
+
+&i2c10 {
+	/* hdd bp */
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+
+	power-supply@58 {
+		compatible = "pmbus";
+		reg = <0x58>;
+	};
+
+	power-supply@59 {
+		compatible = "pmbus";
+		reg = <0x59>;
+	};
+};
+
+&i2c12 {
+	/* odcc */
+	status = "okay";
+};
+
+&vuart {
+	status = "okay";
+};
+
+&ibt {
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+	 &pinctrl_adc2_default &pinctrl_adc3_default &pinctrl_adc4_default
+	 &pinctrl_adc5_default &pinctrl_adc6_default &pinctrl_adc7_default
+	 &pinctrl_adc8_default &pinctrl_adc9_default &pinctrl_adc10_default
+	 &pinctrl_adc11_default &pinctrl_adc12_default &pinctrl_adc13_default
+	 &pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+		&pinctrl_pwm2_default &pinctrl_pwm3_default
+		&pinctrl_pwm4_default &pinctrl_pwm5_default
+		&pinctrl_pwm6_default &pinctrl_pwm7_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08 0x09>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a 0x0b>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c 0x0d>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0e 0x0f>;
+	};
+
+};
+
+&fsi {
+	cfam@0,0 {
+		reg = <0 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <0>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		fsi_hub0: hub@3400 {
+			compatible = "ibm,fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			no-scan-on-init;
+		};
+	};
+};
-- 
2.17.1

