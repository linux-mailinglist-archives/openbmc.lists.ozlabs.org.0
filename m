Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C02844EBA
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 02:38:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NBNnF7Em;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQM3r6mkSz3cTf
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 12:38:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NBNnF7Em;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPK4T0S1hz2xYk
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 20:04:56 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d7858a469aso19851985ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 01:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706605494; x=1707210294; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmHSYPasnmftPhZlf61VtAJzsFmds52Vo77fQDJqRx8=;
        b=NBNnF7EmEjvMCk3Cv0Glc+3/NEh9i0p2LP7Z30h+x7oPSRj9PB/l7d7iBRgADYpu8l
         u6SPdxOlxhe7N6M3gyo9wbq4DA01IoJwBhcPEpVLPF6Dl8NpSbO9CBS3MIZKuspszWV1
         qa8d29vl8L+sswNqqtQVz8awmWNFdzClh82YPuFY4wRh+WAd7F+zxcst/q+tpcTD7ilX
         fbhxu0bL1RtiNw+4yoB1OxYqbn6Cns8cOphiygvTUVkiBIi2P3hPIMc5P8DY92Xfu2qi
         65JP3V2RjPwGLUFMjExlzeESE2xvKeHsAj7LYqdvagL/38U6NSpTeH8xIbSDHlkNOLpW
         PiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605494; x=1707210294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmHSYPasnmftPhZlf61VtAJzsFmds52Vo77fQDJqRx8=;
        b=aVPsbchvCAEQ79KL5tPFb04muEwClfT04ieV5K7LxuY6JzWAUSxA/v8DyNLNvw0N33
         z0HTRzmF8/nAu6pa4tJ4dh14lTSn5k1LY5wKT2WB8mw47q4F//VdXV8W6kfc3/L3J9G2
         A+VaiEXSJg9N/WNQG6B5g8KnedYKZqjRSr14MO41jZ8/rZL4GRv/G2a/0dVeDenziEfJ
         vcWV8NOgU9f688odpLYltivjuzR8DvGffqiqZrWYDfGA/qXof1I7cLWxcMZ3g5IeTdgw
         0erXz4M5VtaKFVcHX/tyHqE3MYqS1E6eIh/8q3GPdgR1EYfvKHcxBPtIa2B3aVkLC+JO
         CFBg==
X-Gm-Message-State: AOJu0YxyWFiMKq2JIJ/Y1spR4MTJ7AnqA2me8D1t7FFSenOzRNBhEc9g
	6U/8peiZepN0HIc1CRApe2y/UuYXKIZNVGXVMYN/H+8JPDwxmDh1WXC/rxyc088=
X-Google-Smtp-Source: AGHT+IH5/lb5jgjUXuY+WxlI5Ekfr9Q6wufJ+Ec72OblOTY30FA7shqoFj74hFwnG4WFmD+FZ1N8+w==
X-Received: by 2002:a17:902:ba90:b0:1d7:7d1a:7697 with SMTP id k16-20020a170902ba9000b001d77d1a7697mr3117052pls.68.1706605493717;
        Tue, 30 Jan 2024 01:04:53 -0800 (PST)
Received: from localhost.localdomain ([124.218.12.74])
        by smtp.gmail.com with ESMTPSA id v14-20020a17090331ce00b001d8fcbbf323sm1553089ple.158.2024.01.30.01.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:04:53 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
Date: Tue, 30 Jan 2024 17:04:47 +0800
Message-Id: <20240130090447.198103-2-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240130090447.198103-1-Kelly_Hung@asus.com>
References: <20240130090447.198103-1-Kelly_Hung@asus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Feb 2024 12:36:43 +1100
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
Cc: kelly1732000 <Kelly_Hung@asus.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: kelly1732000 <Kelly_Hung@asus.com>

This initial device-tree provides the necessary configuration for
basic BMC functionality and work on ASUS X4TF production.

Signed-off-by: kelly1732000 <Kelly_Hung@asus.com>
---
 .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 828 ++++++++++++++++++
 1 file changed, 828 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
new file mode 100644
index 000000000000..723bbb33137f
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
@@ -0,0 +1,828 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 ASUS Corp.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+
+/ {
+	model = "ASUS-X4TF";
+	compatible = "asus,x4tf", "aspeed,ast2600";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8 earlycon";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		rvas_memory: rvas {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		bmc_dev_memory: bmc_dev_memory {
+			size = <0x00100000>;
+			alignment = <0x00100000>;
+			compatible = "shared-dma-pool";
+			no-map;
+		};
+
+		pci_msi_memory: pci_msi_memory {
+			no-map;
+			reg = <0x9e770000 0x100>;
+			compatible = "shared-dma-pool";
+		};
+		/* 1GB memory */
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+		};
+		ssp_memory: ssp_memory {
+			size = <0x02000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			no-map;
+		};
+	};
+
+	vcc_sdhci0: regulator-vcc-sdhci0 {
+		compatible = "regulator-fixed";
+		status = "disabled";
+		regulator-name = "SDHCI0 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vccq_sdhci0: regulator-vccq-sdhci0 {
+		compatible = "regulator-gpio";
+		status = "disabled";
+		regulator-name = "SDHCI0 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1>,
+			 <1800000 0>;
+	};
+
+	vcc_sdhci1: regulator-vcc-sdhci1 {
+		compatible = "regulator-fixed";
+		status = "disabled";
+		regulator-name = "SDHCI1 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vccq_sdhci1: regulator-vccq-sdhci1 {
+		compatible = "regulator-gpio";
+		status = "disabled";
+		regulator-name = "SDHCI1 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio0 ASPEED_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1>,
+			 <1800000 0>;
+	};
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+				<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+				<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+
+	video-engine@1e700000 {
+		compatible = "aspeed,ast2600-video-engine";
+		reg = <0x1e700000 0x20000>;
+		clocks = <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon ASPEED_CLK_GATE_ECLK>;
+		clock-names = "vclk", "eclk";
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		memory-region = <&video_engine_memory>;
+		//resets = <&syscon ASPEED_RESET_VIDEO>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+		uid_led {
+			gpios = <&gpio0 ASPEED_GPIO(P, 1) (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+			default-state = "off";
+		};
+		status_Y {
+			gpios = <&gpio1 ASPEED_GPIO(B, 1) GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		sys_boot_status {
+			gpios = <&gpio1 ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+	spigpio {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_HIGH>;
+	};
+
+};
+
+&adc0 {
+	vref = <2500>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	vref = <2500>;
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&peci0 {
+	status = "okay";
+};
+
+&lpc_snoop {
+	snoop-ports = <0x80>;
+	status = "okay";
+};
+
+
+&mdio0 {
+	status = "disabled";
+};
+
+
+&mdio1 {
+	status = "disabled";
+};
+
+&mdio2 {
+	status = "okay";
+
+	ethphy2: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mdio3 {
+	status = "okay";
+
+	ethphy3: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "disabled";
+};
+
+&mac1 {
+	status = "disabled";
+};
+
+//for X4TF
+&mac2 {
+	status = "okay";
+	phy-mode = "rmii";
+	#phy-handle = <&ethphy2>;
+	use-ncsi;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+};
+
+
+&mac3 {
+	status = "okay";
+	phy-mode = "rmii";
+	#phy-handle = <&ethphy3>;
+	use-ncsi;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+};
+
+
+&syscon {
+	uart-clock-high-speed;
+	status = "okay";
+};
+
+&rtc {
+	status = "disabled";
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc-spi";
+		spi-max-frequency = <50000000>;
+		spi-bus-width = <1>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bmc@0 {
+				label = "bmc";
+				reg = <0x0 0x4000000>;
+			};
+			u-boot@0 {
+				label = "u-boot";
+				reg = <0x0 0x200000>;
+			};
+			u-boot-env@1f0000 {
+				label = "u-boot-env";
+				reg = <0x1f0000 0x10000>;
+			};
+			kernel@200000 {
+				label = "kernel";
+				reg = <0x200000 0xc00000>;
+			};
+			rofs@a00000 {
+				label = "rofs";
+				reg = <0xa00000 0x2a00000>;
+			};
+			rwfs@2a00000 {
+				label = "rwfs";
+				reg = <0x2a00000 0x43f0000>;
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
+		w25q256,fast-read;
+		label = "bios-spi";
+		spi-max-frequency = <50000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			biosfullimg@0 {
+				reg = <0x0 0x2000000>; //  32768 *1024 = 0x2000000, 32 MB
+				label = "biosfullimg";
+			};
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
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
+	tmp75@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+	tmp75@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
+
+	pca9555_4_20: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pca9555_4_22: gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pca9555_4_24: gpio@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*A0 - A7 0*/	"", "STRAP_BMC_BATTERY_GPIO1", "", "", "", "", "", "",
+		/*B0 - B7 8*/	"", "", "", "", "", "", "", "";
+	};
+
+	pca9555_4_26: gpio@26 {
+		compatible = "nxp,pca9555";
+		reg = <0x26>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		status = "okay";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel_1: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		channel_2: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		channel_3: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		channel_4: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	pca9555_5_24: gpio@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	i2c-switch@70  {
+		compatible = "nxp,pca9546";
+		status = "okay";
+		reg = <0x70 >;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel_5: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			pca9555_5_5_20: gpio@20 {
+				compatible = "nxp,pca9555";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names =
+				/*A0 0*/	"", "", "", "", "", "", "", "",
+				/*B0 8*/	"", "", "SYS_FAN6", "SYS_FAN5",
+				/*B4 12*/	"SYS_FAN4", "SYS_FAN3", "SYS_FAN2", "SYS_FAN1";
+			};
+			pca9555_5_5_21: gpio@21 {
+				compatible = "nxp,pca9555";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+			ina219@0x44 {
+				compatible = "ti,ina219";
+				reg = <0x44>;
+				rshunt = <2>;
+			};
+		};
+
+		channel_6: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		channel_7: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		channel_8: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+	pca9555_6_27: gpio@27 {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+	pca9555_6_20: gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+		/*A0 - A7 0*/	"", "", "", "", "", "", "", "",
+		/*B0 - B7 8*/	"Drive_NVMe1", "Drive_NVMe2", "", "", "", "", "", "";
+	};
+	pca9555_6_21: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		status = "okay";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		idle-state = <1>;
+
+		channel_9: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			tmp75@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			tmp75@49 {
+				compatible = "ti,tmp75";
+				reg = <0x49>;
+			};
+			ina219@0x40 {
+				compatible = "ti,ina219";
+				reg = <0x40>;
+				rshunt = <2>;
+			};
+			ina219@0x41 {
+				compatible = "ti,ina219";
+				reg = <0x41>;
+				rshunt = <5>;
+			};
+		};
+
+		channel_10: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		channel_11: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		channel_12: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		status = "okay";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		channel_13: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		channel_14: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		channel_15: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		channel_16: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c8 {
+	status = "okay";
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		status = "okay";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		channel_17: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		channel_18: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			tmp75@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			ina219@0x41 {
+				compatible = "ti,ina219";
+				reg = <0x41>;
+				rshunt = <5>;
+			};
+		};
+
+		channel_19: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		channel_20: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
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
+	status = "disabled";
+};
+
+&i2c13 {
+	status = "disabled";
+};
+
+&i2c14 {
+	status = "okay";
+	multi-master;
+	eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+	};
+	eeprom@51 {
+		compatible = "atmel,24c08";
+		reg = <0x51>;
+	};
+};
+
+&sgpiom0 {
+	status = "okay";
+};
+
+&gfx {
+	pcie-reset-detect;
+	status = "disabled";
+	memory-region = <&gfx_memory>;
+};
+
+&sdc {
+	status = "okay";
+};
+
+&sdhci0 {
+	status = "disabled";
+	bus-width = <4>;
+	max-frequency = <100000000>;
+	sdhci-drive-type = /bits/ 8 <3>;
+	/* SDR104/DDR50/SDR50 bits in CAPA2 is not supported */
+	sdhci-caps-mask = <0x7 0x580000>;
+	sdhci,wp-inverted;
+};
+
+#if !defined(CONFIG_SPX_FEATURE_ENABLE_SSP)
+&sdhci1 {
+	status = "disabled";
+	bus-width = <4>;
+	max-frequency = <100000000>;
+	sdhci-drive-type = /bits/ 8 <3>;
+	sdhci-caps-mask = <0x7 0x580000>;
+	sdhci,wp-inverted;
+};
+#endif
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
+&ibt {
+	status = "disabled";
+};
+
+&kcs1 {
+	kcs_addr = <0xca0>;
+	status = "okay";
+};
+
+&kcs2 {
+	kcs_addr = <0xca8>;
+	status = "okay";
+};
+
+&kcs3 {
+	kcs_addr = <0xca2>;
+	status = "okay";
+};
+
+&kcs4 {
+	kcs_addr = <0xca4>;
+	status = "disabled";
+};
+
+&uart1 {
+	status = "disabled";
+};
+
+&uart2 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+	/* GPIOB6 will be used in ASD function, do not set to be TXD4 */
+	//pinctrl-0 = <&pinctrl_txd4_default &pinctrl_rxd4_default>;
+	pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
+};
+
+&uart_routing {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+#if defined(CONFIG_SPX_FEATURE_ENABLE_SSP)
+&uart7 {
+	status = "okay";
+};
+#endif
+
+#if defined(CONFIG_SPX_FEATURE_PLATGUARDPLUS_SUPPORT)
+&uart11 {
+	status = "okay";
+};
+#endif
+#ifdef CONFIG_SPX_FEATURE_USB_PORT_B_HOST_SUPPORT
+&ehci1 {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
+#endif
+
+&vhub {
+	status = "okay";
+};
+
+#ifdef CONFIG_SPX_FEATURE_USB_PORT_B_SUPPORT
+&udc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2bd_default>;
+};
+#endif
+
+&gpio0 {
+	gpio-line-names =
+	/*A0 0*/	"", "", "", "", "", "", "", "",
+	/*B0 8*/	"", "", "", "", "", "", "PS_PWROK", "",
+	/*C0 16*/	"", "", "", "", "", "", "", "",
+	/*D0 24*/	"", "", "", "", "", "", "", "",
+	/*E0 32*/	"", "", "", "", "", "", "", "",
+	/*F0 40*/	"", "", "", "", "", "", "", "",
+	/*G0 48*/	"", "", "", "", "", "", "", "",
+	/*H0 56*/	"", "", "", "", "", "", "", "",
+	/*I0 64*/	"", "", "", "", "", "", "", "",
+	/*J0 72*/	"", "", "", "", "", "", "", "",
+	/*K0 80*/	"", "", "", "", "", "", "", "",
+	/*L0 88*/	"", "", "", "", "", "", "", "",
+	/*M0 96*/	"", "", "", "", "", "", "", "",
+	/*N0 104*/	"", "", "", "",
+	/*N4 108*/	"POST_COMPLETE", "ESR1_GPIO_AST_SPISEL", "", "",
+	/*O0 112*/	"", "", "", "", "", "", "", "",
+	/*P0 120*/	"ID_BUTTON", "ID_OUT", "POWER_BUTTON", "POWER_OUT",
+	/*P4 124*/	"RESET_BUTTON", "RESET_OUT", "", "HEARTBEAT",
+	/*Q0 128*/	"", "", "", "", "", "", "", "",
+	/*R0 136*/	"", "", "", "", "", "", "", "",
+	/*S0 144*/	"", "", "", "", "", "", "", "",
+	/*T0 152*/	"", "", "", "", "", "", "", "",
+	/*U0 160*/	"", "", "", "", "", "", "", "",
+	/*V0 168*/	"", "", "", "", "", "", "", "",
+	/*W0 176*/	"", "", "", "", "", "", "", "",
+	/*X0 184*/	"", "", "", "", "", "", "", "",
+	/*Y0 192*/	"", "", "", "", "", "", "", "",
+	/*Z0 200*/	"", "", "", "", "", "", "", "";
+};
-- 
2.25.1

