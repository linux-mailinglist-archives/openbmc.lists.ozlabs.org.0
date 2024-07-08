Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B062C929C22
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 08:24:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XLx069zL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHYww3L8Jz3bhc
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 16:24:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XLx069zL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHYwJ1BdYz3cPX;
	Mon,  8 Jul 2024 16:23:26 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-70afe18837cso1935347b3a.3;
        Sun, 07 Jul 2024 23:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720419802; x=1721024602; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YO0zfrPvSL57wO7aTnoDlCEfeF4bRbKSvkqnlB1je+4=;
        b=XLx069zLCvGDn18o4s4H8XiMwGsRswMN3Uy4AETcaex3Kj2qleQihcDJKY53pZo3Uq
         JYeW/aciX8QTEbtEUL4tz072qCx4Oce3beqVZo/VMXWWO7utSSstsDvhe72SN+0FEUaH
         xn1fvAe01ztJr0rks9/N84xSPRHvIryoiwYnrY7EhzvSj/STniCnlmq42+rfI3OH2TI0
         OlbPBg4JYulHSOh92aWfjyv375TveZeXL/yJkUiirNoxrqy8a+BDa8CwJX+Uro7UStJK
         0uY+laWUPw394b6rOqLnq3Dr8XZ5KO7RQDKK97KXt81RaOheeTtKiN8Xh6VkszWVUZvk
         gt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720419802; x=1721024602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO0zfrPvSL57wO7aTnoDlCEfeF4bRbKSvkqnlB1je+4=;
        b=UwpI1wahawR09OcuR+ONLdXTbA/VO6lbsg2FPgYvk9VdfX2VsMqv4rObT7bn+JRai6
         Ii0bKezyunrACJnzEBgfVAztP2oXaTXSQ3+4kERLHhPLasazSWezib1PlsTdOfMZ06Pw
         rcQPei5jUKLTTrCYZEqcmoamxXWFxfMcYAMXZoxkfz3H0pzJRjxZ9J58UxRsGafCUnQF
         77j0iu79FMgXb3tGaynLRP12niuMyCWaCXObWVYwT6KXrmH+xmJqmumoxRip/57Lnn7d
         PP37xuV4Km+buQglA5u3Ff1uUNlonUK+xg0TCNwLrCNKn0MyhAPWaJ0/sCmzmGXi9/Kx
         Bh2g==
X-Forwarded-Encrypted: i=1; AJvYcCXjoSAboKpscUaDKVKaVCpzPich202JiEE8Y0yePi7lEvs0fXNMTg4f42/TIrG43FZcPlDyJmm55RJCC31HbJrppePcAQz6Fog=
X-Gm-Message-State: AOJu0Yypsuzkls83DTewTT+AO3b+w4nZblI/kAGGw9+BIKlykDRGeyJ7
	3oG/kQbMbUY+JTCh6ap4EHPaSvGr/Ta6MeI5BTfyOQc/u4pA5RQV7Nhsg2XfkM0=
X-Google-Smtp-Source: AGHT+IG+Bwpg5YQdrUifnm5y/7oVFvEAzv1TzZ5e7XZabJNnV02YUJjVm4wJlN6IfObOMwCt5FITGg==
X-Received: by 2002:a05:6a00:1146:b0:706:936f:469a with SMTP id d2e1a72fcca58-70b00955009mr9599251b3a.16.1720419801896;
        Sun, 07 Jul 2024 23:23:21 -0700 (PDT)
Received: from localhost (66.112.216.249.16clouds.com. [66.112.216.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b1b6382c5sm3864126b3a.34.2024.07.07.23.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 23:23:21 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@ieisystem.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: aspeed: Add IEISystems NF5280M7 BMC machine
Date: Mon,  8 Jul 2024 14:23:16 +0800
Message-Id: <20240708062316.208383-1-liuxiwei@ieisystem.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The IEISystems NF5280M7 is an x86 platform server with an
AST2600-based BMC.
This dts file provides a basic configuration for its OpenBMC
development.

Signed-off-by: George Liu <liuxiwei@ieisystem.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-ieisystems-nf5280m7.dts | 697 ++++++++++++++++++
 2 files changed, 698 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 5e3392621697..51531d494415 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ibm-rainier-1s4u.dtb \
 	aspeed-bmc-ibm-rainier-4u.dtb \
 	aspeed-bmc-ibm-system1.dtb \
+	aspeed-bmc-ieisystems-nf5280m7.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-inspur-nf5280m6.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts
new file mode 100644
index 000000000000..d706b4f64f6c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-nf5280m7.dts
@@ -0,0 +1,697 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2023 IEISystems Corporation
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "NF5280M7 BMC";
+	compatible = "ieisystems,nf5280m7-bmc", "aspeed,ast2600";
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
+		bootargs = "console=ttyS4,115200n8";
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
+                      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+                      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+                      <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
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
+
+	flash@0 {
+		status = "okay";
+
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+	flash@1 {
+		status = "okay";
+
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
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+
+		m25p,fast-read;
+		label = "bios";
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&peci0 {
+	status = "okay";
+
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
+
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
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+
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
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		bus2_mux70_0:i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			temperature-sensor@49 {
+				compatible = "ti,tmp112";
+				reg = <0x49>;
+				label = "Inlet_Temp";
+			};
+
+			temperature-sensor@4c {
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
+
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
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		bus5_mux00:i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+		};
+
+		bus5_mux01:i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+		};
+
+		bus5_mux02:i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+		};
+
+		bus5_mux03:i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
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
+		i2c6s0ch0:i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+
+			i2c-mux@71 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				i2c6s1ch0:i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+				};
+
+				i2c6s1ch1:i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1>;
+				};
+
+				i2c6s1ch2:i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+				};
+
+				i2c6s1ch3:i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+				};
+
+				i2c6s1ch4:i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+
+				i2c6s1ch5:i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+
+				i2c6s1ch6:i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+
+				i2c6s1ch7:i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x72>;
+				i2c-mux-idle-disconnect;
+
+				i2c6s2ch0:i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+				};
+
+				i2c6s2ch1:i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1>;
+				};
+
+				i2c6s2ch2:i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+				};
+
+				i2c6s2ch3:i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+				};
+
+				i2c6s2ch4:i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+
+				i2c6s2ch5:i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+
+				i2c6s2ch6:i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+
+				i2c6s2ch7:i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+		};
+
+		i2c6s0ch1:i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6s0ch2:i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6s0ch3:i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6s0ch4:i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6s0ch5:i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6s0ch6:i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6s0ch7:i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
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
+	adc@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		ti,mode = /bits/ 8 <0x01>;
+	};
+
+	adc@1e {
+		compatible = "ti,adc128d818";
+		reg = <0x1e>;
+		ti,mode = /bits/ 8 <0x01>;
+	};
+
+	adc@2d {
+		compatible = "ti,adc128d818";
+		reg = <0x2d>;
+		ti,mode = /bits/ 8 <0x01>;
+	};
+
+	power-monitor@45 {
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
+	pca0:pca9555@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
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
+	pca1:pca9555@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
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
2.34.1

