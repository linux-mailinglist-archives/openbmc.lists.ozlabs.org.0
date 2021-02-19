Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85147320E8F
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 00:41:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkMK62mylz30Mx
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 10:41:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JCaFMk6x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=williethaitu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JCaFMk6x; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhjRW3GR2z30Qf
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 18:11:18 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id p21so3125294pgl.12
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 23:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qE18/BrZ1tRgI+5cT12rehCUB0WCiL8kZ1C+arbQ+ak=;
 b=JCaFMk6x8eTHUdMDll+Otr57O3SWHQBzzHRRqt8LTAsIPUjf2wps7PPLbkPlDeXmVS
 k7n5UNSmRyVDttZ1FDA8NlBz3tFxB+NQdKKGnFRhjx28t6UAwibYKJLu2P65SNgoInva
 63JBw4V+8Ya0/+CYihnWoJwgHscriVhX77uXSN5SHHiYgw+zQn4a6o+H/3lk18wYCJSx
 1MlQy045dWnSu483phiSIR4wXxma7PhTbkMnBhLQz0uN9QHNmfNjVpA5MZk8BVPc8MWr
 p5aVpRZ4gvdtXIsxJlsj5UO+Ptn2fRr/8C3+iAR5vwkKKzys2yG9jx+a0k+4Dr0LxLx0
 ABvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qE18/BrZ1tRgI+5cT12rehCUB0WCiL8kZ1C+arbQ+ak=;
 b=DgY3eI2keDH6N0famwGEM7y3QT/qyDqGuN/6DbB8r7wGrLY2F1Fx/i4c1LASoVuzo/
 7UZIFNllvjE8MXIs/N6zSld+/gPxiwmrgUwTg7ibZxBfHR2NEvK3cUAC8svy8xAoVlR3
 Vv5dXVQTDoQMFNXMt4SvWdh9PYtgtZXlUZTXjSKfzTKZn707MAM8pPl5OvEAPcl9o5I7
 8o7630c2bTGxPeynl7vzS5nD6ZTZ2B1zPC0KStJSu7wjwIbC5pA6Vl00EirLg7JREMIL
 2qGXjFHWUc2FQE8EayhlADhtn0iKNWToWe7QlMHOMeNuez+SoLPOTUYHpKQvP2Ddv4Oa
 Sltg==
X-Gm-Message-State: AOAM531nODsKljaxrtTea/eIeGUMRqmUrr1lv//qOKcF+QLNHtBTwR/V
 jl1BBMdwwxnp/q9eDGPhXSuY3hp2D7A=
X-Google-Smtp-Source: ABdhPJzmrz9Ot5zCGHF62p6oWaGjimj+ot29Bd6caNiPiUBPExmkiMsZMMIiQIWDTESFG7n7d91B7A==
X-Received: by 2002:aa7:8742:0:b029:1ed:4d14:7513 with SMTP id
 g2-20020aa787420000b02901ed4d147513mr626387pfo.66.1613718675103; 
 Thu, 18 Feb 2021 23:11:15 -0800 (PST)
Received: from localhost.localdomain (125-227-158-249.HINET-IP.hinet.net.
 [125.227.158.249])
 by smtp.gmail.com with ESMTPSA id h186sm4546568pgc.38.2021.02.18.23.11.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Feb 2021 23:11:14 -0800 (PST)
From: Willie Thai <williethaitu@gmail.com>
X-Google-Original-From: Willie Thai <willie_thai@compal.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [[PATCH linux dev-5.8] ARM: dts: Aspeed: Add Compal's Liwu2 BMC
 machine] ARM: dts: aspeed: Add device tree for Compal's Liwu2 BMC
Date: Fri, 19 Feb 2021 15:11:10 +0800
Message-Id: <1613718670-24417-1-git-send-email-willie_thai@compal.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CACPK8XfNrYFNy0KHjxa=nM01LV7PMnVC5U7_Wuudf_xk3tQ2iw@mail.gmail.com>
References: <CACPK8XfNrYFNy0KHjxa=nM01LV7PMnVC5U7_Wuudf_xk3tQ2iw@mail.gmail.com>
X-Mailman-Approved-At: Mon, 22 Feb 2021 10:41:17 +1100
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
Cc: Willie Thai <willie_thai@compal.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Liwu2 is a server platform with an ASPEED AST2500 based BMC.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: willie_thai@compal.com
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts | 325 ++++++++++++++++++++++++++
 2 files changed, 326 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6320124..a67576d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1354,6 +1354,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
+	aspeed-bmc-compal-liwu2.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
new file mode 100644
index 0000000..68faf3d
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "AST2500 liwu2";
+	compatible = "aspeed,ast2500";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
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
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+				<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+				<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+				<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_fan0_fault {
+			label = "LED_FAN0_FAULT";
+			gpios = <&gpio ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		led_fan1_fault {
+			label = "LED_FAN1_FAULT";
+			gpios = <&gpio ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		led_fan2_fault {
+			label = "LED_FAN2_FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		led_fan3_fault {
+			label = "LED_FAN3_FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		led_fan4_fault {
+			label = "LED_FAN4_FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		led_fan5_fault {
+			label = "LED_FAN5_FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		fp_led_status_amber_n {
+			label = "FP_LED_STATUS_AMBER_N";
+			gpios = <&gpio ASPEED_GPIO(S, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		rear_id_led_n {
+			label = "REAR_ID_LED_N";
+			gpios = <&gpio ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
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
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <100000000>;
+	};
+};
+
+&spi2 {
+	status = "okay";
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
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
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
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+		pagesize = <32>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	tmp75@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+
+	tmp75@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
+
+	tmp75@4c {
+		compatible = "ti,tmp75";
+		reg = <0x4c>;
+	};
+
+	tmp75@4d {
+		compatible = "ti,tmp75";
+		reg = <0x4d>;
+	};
+
+	vr-controller@5a {
+		compatible = "ti,tps53679";
+		reg = <0x5a>;
+	};
+
+	vr-controller@5d {
+		compatible = "ti,tps53679";
+		reg = <0x5d>;
+	};
+
+	vr-controller@68 {
+		compatible = "ti,tps53679";
+		reg = <0x68>;
+	};
+
+	vr-controller@6a {
+		compatible = "ti,tps53679";
+		reg = <0x6a>;
+	};
+
+	vr-controller@6c {
+		compatible = "ti,tps53679";
+		reg = <0x6c>;
+	};
+
+	vr-controller@6e {
+		compatible = "ti,tps53679";
+		reg = <0x6e>;
+	};
+
+};
+
+&i2c4 {
+	status = "okay";
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
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
+
+&sdmmc {
+	status = "okay";
+};
+
+&sdhci0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd1_default>;
+};
+
+/*
+ * Enable port A as device (via the virtual hub) and port B as
+ * host by default on the eval board. This can be easily changed
+ * by replacing the override below with &ehci0 { ... } to enable
+ * host on both ports.
+ */
+&vhub {
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
-- 
2.7.4

