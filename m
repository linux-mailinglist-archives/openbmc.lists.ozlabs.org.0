Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2413333BF
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 04:19:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwHNl6Xl9z3cNd
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 14:19:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N2Rg+7q+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N2Rg+7q+; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwHNV5bPqz3bVW
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 14:18:48 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id s7so7772438plg.5
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 19:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPv6XNBw2OgoZx10J6nw0m8FkSi0cDU32uOTWOd2Wgw=;
 b=N2Rg+7q+dst+zsHbhNHLNSonEzJ7yxfnICDVBqXKOD/IRTV6qrpYl2IsS5MqBKC1zs
 +Sw60aGxZUyvHPOI8v0ARB0HzW/Z7j7NnMd/lxt8+QQp/26dvx+Q/Fvd40f7LtNu+Fg3
 NJwclA1Lf79BPgSsjg2B2Qac/r/R5Hne7Dm2I/yjfmAD4LiNvlVgYZ5pJ44K9+/AqHkR
 n6CKKNQRYlAw6pJKhZLav3QmlnuFkOxt5wFb4SQqlaYD6nq5X5Nj7zwRJ5THGDZNwaEU
 IkaMwEASvRMjEiAnlp5NX7O0kcEN9Xa06N2Ij17y/Td7BNkzEkVYCeR8GJKzP9+xZ1nR
 iwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPv6XNBw2OgoZx10J6nw0m8FkSi0cDU32uOTWOd2Wgw=;
 b=E6HW0RZBGkDR2SBcmv3DAsM0QDzFNksyF/fTkK4MK2rNKc5bpq1BrBmX9pebmn8gdM
 dJTRWimwdsJASErHgskcmOxKMp4Xk//OsLsJdeJ7HyMlKBbWGHf+0QuLk0FDRGtm76xr
 qF1pGbFuykTM4bBlaQxCxDQxAqMCb/NS0hVrMf5nGQxF6Rr2eU2sND7Z48ajIHEbj85v
 aFjGIwILha/H6cDd14LT22wKjdmvMbNA0qquUDJj63PoPvEo1erTJT9BaQJTVDASTakm
 oF4nMGVN74ivZqrxThfCUiThJy8SX4iZ0uRsBEpYadgAJWCYC9HTgtGeaLuzVgmTVaps
 TyqQ==
X-Gm-Message-State: AOAM533nL0UbNEEvY6Gg88hizGLklhaRwZEZ96xqVbg4Z0vM+Xayt60H
 T7FKI2Js7oeo1Ft5zd4lgiI=
X-Google-Smtp-Source: ABdhPJzD8MvLzxQ0vRl8c7ExdvYvtZhViz8jsYYkLVrZQZ8Qs7B/7Mah2ciT+4JBOCjgbNRT3nuS+Q==
X-Received: by 2002:a17:902:b711:b029:e5:ba7a:d2ee with SMTP id
 d17-20020a170902b711b02900e5ba7ad2eemr1033569pls.13.1615346324526; 
 Tue, 09 Mar 2021 19:18:44 -0800 (PST)
Received: from george-Quanta.com.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id n5sm14340325pfq.44.2021.03.09.19.18.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 19:18:44 -0800 (PST)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.10 v1] ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree
Date: Wed, 10 Mar 2021 11:09:52 +0800
Message-Id: <20210310030952.26090-1-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, brandonkim@google.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial version of device tree for Quanta GBS
BMC (NPCM730 SoC)

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 arch/arm/boot/dts/Makefile                |    1 +
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 1233 +++++++++++++++++++++
 2 files changed, 1234 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c57729f40185..82785fe2c8bf 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -340,6 +340,7 @@ dtb-$(CONFIG_ARCH_LPC32XX) += \
 	lpc3250-phy3250.dtb
 dtb-$(CONFIG_ARCH_NPCM7XX) += \
 	nuvoton-npcm730-gsj.dtb \
+	nuvoton-npcm730-gbs.dtb \
 	nuvoton-npcm730-kudo.dtb \
 	nuvoton-npcm750-evb.dtb \
 	nuvoton-npcm750-runbmc-olympus.dtb
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
new file mode 100644
index 000000000000..15357ae97ec4
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -0,0 +1,1233 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Quanta Computer Inc. George.Hung@quantatw.com
+
+/dts-v1/;
+#include "nuvoton-npcm730.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Quanta GBS Board (Device Tree)";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
+		ethernet0 = &emc0;
+		ethernet1 = &gmac0;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		i2c16 = &i2c0_slotPE0_0;
+		i2c17 = &i2c0_slotPE1_1;
+		i2c18 = &i2c0_slotUSB_2;
+		i2c19 = &i2c0_3;
+		i2c20 = &i2c5_i2cool_0;
+		i2c21 = &i2c5_i2cool_1;
+		i2c22 = &i2c5_i2cool_2;
+		i2c23 = &i2c5_hsbp_fru_3;
+		i2c24 = &i2c6_u2_15_0;
+		i2c25 = &i2c6_u2_14_1;
+		i2c26 = &i2c6_u2_13_2;
+		i2c27 = &i2c6_u2_12_3;
+		i2c28 = &i2c7_u2_11_0;
+		i2c29 = &i2c7_u2_10_1;
+		i2c30 = &i2c7_u2_9_2;
+		i2c31 = &i2c7_u2_8_3;
+		i2c32 = &i2c9_vddcr_cpu;
+		i2c33 = &i2c9_vddcr_soc;
+		i2c34 = &i2c9_vddio_efgh;
+		i2c35 = &i2c9_vddio_abcd;
+		i2c36 = &i2c10_u2_7_0;
+		i2c37 = &i2c10_u2_6_1;
+		i2c38 = &i2c10_u2_5_2;
+		i2c39 = &i2c10_u2_4_3;
+		i2c40 = &i2c11_clk_buf0_0;
+		i2c41 = &i2c11_clk_buf1_1;
+		i2c42 = &i2c11_clk_buf2_2;
+		i2c43 = &i2c11_clk_buf3_3;
+		i2c44 = &i2c14_u2_3_0;
+		i2c45 = &i2c14_u2_2_1;
+		i2c46 = &i2c14_u2_1_2;
+		i2c47 = &i2c14_u2_0_3;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+	};
+
+	chosen {
+		stdout-path = &serial0;
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	soc {
+		gcr: gcr@800000 {
+			serial_port_mux: uart-mux-controller {
+				compatible = "mmio-mux";
+				#mux-control-cells = <1>;
+				mux-reg-masks = <0x38 0x07>;
+				idle-states = <2>; /* Serial port mode 3 (takeover) */
+			};
+
+			uart1_mode_mux: uart1-mode-mux-controller {
+				compatible = "mmio-mux";
+				#mux-control-cells = <1>;
+				mux-reg-masks = <0x64 0x01000000>;
+				idle-states = <0>; /* Set UART1 mode to normal (follow SPMOD) */
+			};
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		sas-cable0 {
+			label = "sas-cable0";
+			gpios = <&gpio2 9 GPIO_ACTIVE_LOW>;
+			linux,code = <73>;
+		};
+
+		sas-cable1 {
+			label = "sas-cable1";
+			gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+			linux,code = <72>;
+		};
+
+		sas-cable2 {
+			label = "sas-cable2";
+			gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+			linux,code = <71>;
+		};
+
+		sas-cable3 {
+			label = "sas-cable3";
+			gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
+			linux,code = <70>;
+		};
+
+		sata0 {
+			label = "sata0";
+			gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
+			linux,code = <5>;
+		};
+
+		hsbp-cable {
+			label = "hsbp-cable";
+			gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
+			linux,code = <57>;
+		};
+
+		fanbd-cable {
+			label = "fanbd-cable";
+			gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+			linux,code = <58>;
+		};
+
+		bp12v-cable {
+			label = "bp12v-cable";
+			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+			linux,code = <69>;
+		};
+
+		pe-slot0 {
+			label = "pe-slot0";
+			gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
+			linux,code = <120>;
+		};
+
+		pe-slot1 {
+			label = "pe-slot1";
+			gpios = <&gpio3 25 GPIO_ACTIVE_LOW>;
+			linux,code = <121>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 1>, <&adc 2>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat { /* gpio153 */
+			gpios = <&gpio4 25 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		attention { /* gpio215 */
+			gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		sys_boot_status { /* gpio216 */
+			gpios = <&gpio6 24 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			retain-state-shutdown;
+		};
+
+		bmc_fault { /* gpio217 */
+			gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			linux,default-trigger = "panic";
+			panic-indicator;
+		};
+
+		led_u2_0_locate {
+			gpios = <&pca9535_ledlocate 3 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_1_locate {
+			gpios = <&pca9535_ledlocate 2 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_2_locate {
+			gpios = <&pca9535_ledlocate 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_3_locate {
+			gpios = <&pca9535_ledlocate 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_4_locate {
+			gpios = <&pca9535_ledlocate 7 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_5_locate {
+			gpios = <&pca9535_ledlocate 6 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_6_locate {
+			gpios = <&pca9535_ledlocate 5 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_7_locate {
+			gpios = <&pca9535_ledlocate 4 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_8_locate {
+			gpios = <&pca9535_ledlocate 11 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_9_locate {
+			gpios = <&pca9535_ledlocate 10 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_10_locate {
+			gpios = <&pca9535_ledlocate 9 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_11_locate {
+			gpios = <&pca9535_ledlocate 8 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_12_locate {
+			gpios = <&pca9535_ledlocate 15 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_13_locate {
+			gpios = <&pca9535_ledlocate 14 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_14_locate {
+			gpios = <&pca9535_ledlocate 13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_15_locate {
+			gpios = <&pca9535_ledlocate 12 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_0_fault {
+			gpios = <&pca9535_ledfault 3 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_1_fault {
+			gpios = <&pca9535_ledfault 2 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_2_fault {
+			gpios = <&pca9535_ledfault 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_3_fault {
+			gpios = <&pca9535_ledfault 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_4_fault {
+			gpios = <&pca9535_ledfault 7 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_5_fault {
+			gpios = <&pca9535_ledfault 6 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_6_fault {
+			gpios = <&pca9535_ledfault 5 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_7_fault {
+			gpios = <&pca9535_ledfault 4 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_8_fault {
+			gpios = <&pca9535_ledfault 11 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_9_fault {
+			gpios = <&pca9535_ledfault 10 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_10_fault {
+			gpios = <&pca9535_ledfault 9 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_11_fault {
+			gpios = <&pca9535_ledfault 8 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_12_fault {
+			gpios = <&pca9535_ledfault 15 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_13_fault {
+			gpios = <&pca9535_ledfault 14 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_14_fault {
+			gpios = <&pca9535_ledfault 13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+		led_u2_15_fault {
+			gpios = <&pca9535_ledfault 12 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+
+	};
+
+	seven-seg-disp {
+		compatible = "seven-seg-gpio-dev";
+		refresh-interval-ms = /bits/ 16 <600>;
+		clock-gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+		data-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+		clear-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	pcie-slot {
+		pcie1: pcie-slot@1 {
+			label = "PE0";
+		};
+		pcie2: pcie-slot@2 {
+			label = "PE1";
+		};
+	};
+
+	ahb {
+		fiu0: spi@fb000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0cs1_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-max-frequency = <19000000>;
+				spi-rx-bus-width = <2>;
+				label = "bmc";
+				partitions@80000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					u-boot@0 {
+						label = "u-boot";
+						reg = <0x0000000 0xf0000>;
+					};
+					image-descriptor@f0000 {
+						label = "image-descriptor";
+						reg = <0xf0000 0x10000>;
+					};
+					hoth-update@100000 {
+						label = "hoth-update";
+						reg = <0x100000 0x100000>;
+					};
+					kernel@200000 {
+						label = "kernel";
+						reg = <0x200000 0x500000>;
+					};
+					rofs@700000 {
+						label = "rofs";
+						reg = <0x700000 0x35f0000>;
+					};
+					rwfs@3cf0000 {
+						label = "rwfs";
+						reg = <0x3cf0000 0x300000>;
+					};
+					hoth-mailbox@3ff0000 {
+						label = "hoth-mailbox";
+						reg = <0x3ff0000 0x10000>;
+					};
+				};
+			};
+		};
+
+		fiu3: spi@c0000000 {
+			pinctrl-0 = <&spi3_pins>, <&spi3cs1_pins>;
+			status = "okay";
+
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
+				m25p,fast-read;
+				label = "pnor";
+			};
+			spi-nor@1 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <1>;
+				spi-max-frequency = <50000000>;
+				spi-rx-bus-width = <2>;
+				m25p,fast-read;
+			};
+		};
+
+		gmac0: eth@f0802000 {
+			status = "okay";
+			phy-mode = "rgmii-id";
+			snps,eee-force-disable;
+		};
+
+		emc0: eth@f0825000 {
+			status = "okay";
+			phy-mode = "rmii";
+			use-ncsi;
+		};
+
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm7xx-sdram-edac";
+			reg = <0xf0824000 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		ehci1: usb@f0806000 {
+			status = "okay";
+		};
+
+		ohci1: ohci@f0807000 {
+			status = "okay";
+		};
+
+		aes: aes@f0858000 {
+			status = "okay";
+		};
+
+		sha: sha@f085a000 {
+			status = "okay";
+		};
+
+		udc5:udc@f0835000 {
+			status = "okay";
+		};
+
+		udc6:udc@f0836000 {
+			status = "okay";
+		};
+
+		udc7:udc@f0837000 {
+			status = "okay";
+		};
+
+		udc8:udc@f0838000 {
+			status = "okay";
+		};
+
+		pcimbox: pcimbox@f0848000 {
+			status = "okay";
+		};
+
+		apb {
+			watchdog1: watchdog@901C {
+				status = "okay";
+			};
+
+			rng: rng@b000 {
+				status = "okay";
+			};
+
+			serial0: serial@1000 {
+				status = "okay";
+			};
+
+			serial1: serial@2000 {
+				status = "okay";
+			};
+
+			serial2: serial@3000 {
+				status = "okay";
+			};
+
+			serial3: serial@4000 {
+				status = "okay";
+			};
+
+			adc: adc@c000 {
+				#io-channel-cells = <1>;
+				status = "okay";
+			};
+
+			otp:otp@189000 {
+				status = "okay";
+			};
+
+			lpc_kcs: lpc_kcs@7000 {
+
+				kcs1: kcs1@0 {
+					status = "okay";
+				};
+
+				kcs2: kcs2@0 {
+					status = "okay";
+				};
+
+				kcs3: kcs3@0 {
+					status = "okay";
+				};
+			};
+
+			lpc_host: lpc_host@7000 {
+
+				lpc_bpc: lpc_bpc@40 {
+					monitor-ports = <0x80>;
+					status = "okay";
+				};
+			};
+
+			spi1: spi@201000 {
+				cs-gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>; /* dummy - gpio147 */
+				pinctrl-names = "default";
+				pinctrl-0 = <&gpio224ol_pins &gpio227o_pins
+					&gpio228_pins>;
+				status = "okay";
+
+				jtag_master@0 {
+					compatible = "nuvoton,npcm750-jtag-master";
+					spi-max-frequency = <25000000>;
+					reg = <0>;
+
+					pinctrl-names = "pspi", "gpio";
+					pinctrl-0 = <&pspi2_pins>;
+					pinctrl-1 = <&gpio224ol_pins &gpio227o_pins
+							&gpio228_pins>;
+
+					tck-gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>; /* TCK - gpio224 */
+					tdi-gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>; /* TDI - gpio227 */
+					tdo-gpios = <&gpio7 4 GPIO_ACTIVE_HIGH>; /* TDO - gpio228 */
+					tms-gpios = <&gpio7 6 GPIO_ACTIVE_HIGH>; /* TMS - gpio230 */
+					status = "okay";
+				};
+			};
+
+			i2c0: i2c@80000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@71 {
+					compatible = "nxp,pca9546";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x71>;
+					i2c-mux-idle-disconnect;
+					/* GPIO 84 */
+					reset-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+
+					i2c0_slotPE0_0: i2c@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+						pcie-slot = &pcie1;
+					};
+
+					i2c0_slotPE1_1: i2c@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+						pcie-slot = &pcie2;
+					};
+
+					i2c0_slotUSB_2: i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c0_3: i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c1: i2c@81000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				pca9535_ifdet: pca9535-ifdet@24 {
+					compatible = "nxp,pca9535";
+					reg = <0x24>;
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+				pca9535_pwren: pca9535-pwren@20 {
+					compatible = "nxp,pca9535";
+					reg = <0x20>;
+					gpio-controller;
+					#gpio-cells = <2>;
+
+					gpio-line-names =
+						"pwr_u2_3_en","pwr_u2_2_en",
+						"pwr_u2_1_en","pwr_u2_0_en",
+						"pwr_u2_7_en","pwr_u2_6_en",
+						"pwr_u2_5_en","pwr_u2_4_en",
+						"pwr_u2_11_en","pwr_u2_10_en",
+						"pwr_u2_9_en","pwr_u2_8_en",
+						"pwr_u2_15_en","pwr_u2_14_en",
+						"pwr_u2_13_en","pwr_u2_12_en";
+				};
+				pca9535_pwrgd: pca9535-pwrgd@21 {
+					compatible = "nxp,pca9535";
+					reg = <0x21>;
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+				pca9535_ledlocate: pca9535-ledlocate@22 {
+					compatible = "nxp,pca9535";
+					reg = <0x22>;
+					gpio-controller;
+					#gpio-cells = <2>;
+
+				};
+				pca9535_ledfault: pca9535-ledfault@23 {
+					compatible = "nxp,pca9535";
+					reg = <0x23>;
+					gpio-controller;
+					#gpio-cells = <2>;
+
+				};
+				pca9535_pwrdisable: pca9535-pwrdisable@25 {
+					compatible = "nxp,pca9535";
+					reg = <0x25>;
+					gpio-controller;
+					#gpio-cells = <2>;
+
+					gpio-line-names =
+						"u2_3_pwr_dis","u2_2_pwr_dis",
+						"u2_1_pwr_dis","u2_0_pwr_dis",
+						"u2_7_pwr_dis","u2_6_pwr_dis",
+						"u2_5_pwr_dis","u2_4_pwr_dis",
+						"u2_11_pwr_dis","u2_10_pwr_dis",
+						"u2_9_pwr_dis","u2_8_pwr_dis",
+						"u2_15_pwr_dis","u2_14_pwr_dis",
+						"u2_13_pwr_dis","u2_12_pwr_dis";
+				};
+				pca9535_perst: pca9535-perst@26 {
+					compatible = "nxp,pca9535";
+					reg = <0x26>;
+					gpio-controller;
+					#gpio-cells = <2>;
+
+					gpio-line-names =
+						"u2_15_perst","u2_14_perst",
+						"u2_13_perst","u2_12_perst",
+						"u2_11_perst","u2_10_perst",
+						"u2_9_perst","u2_8_perst",
+						"u2_7_perst","u2_6_perst",
+						"u2_5_perst","u2_4_perst",
+						"u2_3_perst","u2_2_perst",
+						"u2_1_perst","u2_0_perst";
+				};
+			};
+
+			i2c2: i2c@82000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				sbtsi@4c {
+					compatible = "amd,sbtsi";
+					reg = <0x4c>;
+				};
+			};
+
+			i2c3: i2c@83000 {
+				status = "disabled";
+			};
+
+			i2c4: i2c@84000 {
+				status = "disabled";
+			};
+
+			i2c5: i2c@85000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				mb_fru@50 {
+					compatible = "atmel,24c64";
+					reg = <0x50>;
+				};
+
+				i2c-switch@71 {
+					compatible = "nxp,pca9546";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x71>;
+					i2c-mux-idle-disconnect;
+
+					i2c5_i2cool_0: i2c@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+						max31725@54 {
+							compatible = "maxim,max31725";
+							reg = <0x54>;
+							status = "okay";
+						};
+					};
+					i2c5_i2cool_1: i2c@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+						max31725@55 {
+							compatible = "maxim,max31725";
+							reg = <0x55>;
+							status = "okay";
+						};
+					};
+					i2c5_i2cool_2: i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+						max31725@5d {
+							compatible = "maxim,max31725";
+							reg = <0x5d>;
+							status = "okay";
+						};
+						fan_fru@51 {
+							compatible = "atmel,24c64";
+							reg = <0x51>;
+						};
+					};
+					i2c5_hsbp_fru_3: i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+						hsbp_fru@52 {
+							compatible = "atmel,24c64";
+							reg = <0x52>;
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			i2c6: i2c@86000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@73 {
+					compatible = "nxp,pca9545";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x73>;
+					i2c-mux-idle-disconnect;
+
+					i2c6_u2_15_0: i2c@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c6_u2_14_1: i2c@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+					i2c6_u2_13_2: i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c6_u2_12_3: i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c7: i2c@87000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@72 {
+					compatible = "nxp,pca9545";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x72>;
+					i2c-mux-idle-disconnect;
+
+					i2c7_u2_11_0: i2c@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c7_u2_10_1: i2c@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+					i2c7_u2_9_2: i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c7_u2_8_3: i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c8: i2c@88000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				i2c8_adm1272: adm1272@10 {
+					compatible = "adi,adm1272";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x10>;
+					shunt-resistor-micro-ohms = <300>;
+				};
+			};
+
+			i2c9: i2c@89000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@71 {
+					compatible = "nxp,pca9546";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x71>;
+					i2c-mux-idle-disconnect;
+					/* GPIO86 */
+					reset-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>;
+
+					i2c9_vddcr_cpu: i2c@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+						vrm@60 {
+							compatible = "isil,isl68137";
+							reg = <0x60>;
+						};
+					};
+
+					i2c9_vddcr_soc: i2c@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+						vrm@61 {
+							compatible = "isil,isl68137";
+							reg = <0x61>;
+						};
+					};
+
+					i2c9_vddio_efgh: i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+						vrm@63 {
+							compatible = "isil,isl68137";
+							reg = <0x63>;
+						};
+					};
+
+					i2c9_vddio_abcd: i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+						vrm@45 {
+							compatible = "isil,isl68137";
+							reg = <0x45>;
+						};
+					};
+				};
+			};
+
+			i2c10: i2c@8a000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@71 {
+					compatible = "nxp,pca9545";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x71>;
+					i2c-mux-idle-disconnect;
+
+					i2c10_u2_7_0: i2c@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c10_u2_6_1: i2c@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+					i2c10_u2_5_2: i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c10_u2_4_3: i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c11: i2c@8b000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@76 {
+					compatible = "nxp,pca9545";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x76>;
+					i2c-mux-idle-disconnect;
+
+					i2c11_clk_buf0_0: i2c@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c11_clk_buf1_1: i2c@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+					i2c11_clk_buf2_2: i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c11_clk_buf3_3: i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c12: i2c@8c000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+
+				max34451@4e {
+					compatible = "maxim,max34451";
+					reg = <0x4e>;
+				};
+				vrm@5d {
+					compatible = "isil,isl68137";
+					reg = <0x5d>;
+				};
+				vrm@5e {
+					compatible = "isil,isl68137";
+					reg = <0x5e>;
+				};
+			};
+
+			i2c13: i2c@8d000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c14: i2c@8e000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clock-frequency = <100000>;
+				status = "okay";
+				i2c-switch@70 {
+					compatible = "nxp,pca9545";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x70>;
+					i2c-mux-idle-disconnect;
+
+					i2c14_u2_3_0: i2c@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+					i2c14_u2_2_1: i2c@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+					i2c14_u2_1_2: i2c@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+					i2c14_u2_0_3: i2c@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c15: i2c@8f000 {
+				status = "disabled";
+			};
+
+			pwm_fan:pwm-fan-controller@103000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <
+					&pwm0_pins &pwm1_pins
+					&pwm2_pins &pwm3_pins
+					&pwm4_pins
+					&fanin0_pins &fanin1_pins
+					&fanin2_pins &fanin3_pins
+					&fanin4_pins
+				>;
+				status = "okay";
+
+				fan@0 {
+					reg = <0x00>;
+					fan-tach-ch = /bits/ 8 <0x00>;
+				};
+				fan@1 {
+					reg = <0x01>;
+					fan-tach-ch = /bits/ 8 <0x01>;
+				};
+				fan@2 {
+					reg = <0x02>;
+					fan-tach-ch = /bits/ 8 <0x02>;
+				};
+				fan@3 {
+					reg = <0x03>;
+					fan-tach-ch = /bits/ 8 <0x03>;
+				};
+				fan@4 {
+					reg = <0x04>;
+					fan-tach-ch = /bits/ 8 <0x04>;
+				};
+			};
+		};
+	};
+
+	pinctrl: pinctrl@f0800000 {
+		status = "okay";
+		pinctrl-names = "default";
+
+		gpio0: gpio@f0010000 {
+			/* POWER_OUT=gpio07, RESET_OUT=gpio06, PS_PWROK=gpio13 */
+			gpio-line-names =
+			/*0-31*/
+			"","","","","","","RESET_OUT","POWER_OUT",
+			"","","","","","PS_PWROK","","",
+			"","","","","","","","",
+			"","","","","","","","";
+		};
+		gpio1: gpio@f0011000 {
+			/* SIO_POWER_GOOD=gpio59 (PWRGD_OUT_CPU_BMC) */
+			gpio-line-names =
+			/*32-63*/
+			"","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","",
+			"","","","SIO_POWER_GOOD","","","","";
+		};
+		gpio2: gpio@f0012000 {
+			/* Hog GPIOs 89-91 for USB mux. */
+			bmc_usb_mux_oe_n {
+				gpio-hog;
+				gpios = <25 GPIO_ACTIVE_HIGH>; /* GPIO89 */
+				output-low;
+				line-name = "bmc-usb-mux-oe-n";
+			};
+			bmc_usb_mux_sel {
+				gpio-hog;
+				gpios = <26 GPIO_ACTIVE_HIGH>; /* GPIO90 */
+				output-low;
+				line-name = "bmc-usb-mux-sel";
+			};
+			bmc_usb2517_reset_n {
+				gpio-hog;
+				gpios = <27 GPIO_ACTIVE_LOW>; /* GPIO91 */
+				output-low;
+				line-name = "bmc-usb2517-reset-n";
+			};
+		};
+		gpio3: gpio@f0013000 {
+			/* Hog GPIOs 110-112 (ASSERT*) to low to avoid disturbing FET gates. */
+			assert_cpu0_reset {
+				gpio-hog;
+				gpios = <14 GPIO_ACTIVE_HIGH>; /* GPIO110 */
+				output-low;
+				line-name = "assert-cpu0-reset";
+			};
+			assert_pwrok_cpu0_n {
+				gpio-hog;
+				gpios = <15 GPIO_ACTIVE_HIGH>; /* GPIO111 */
+				output-low;
+				line-name = "assert-pwrok-cpu0-n";
+			};
+			assert_cpu0_prochot {
+				gpio-hog;
+				gpios = <16 GPIO_ACTIVE_HIGH>; /* GPIO112 */
+				output-low;
+				line-name = "assert-cpu0-prochot";
+			};
+		};
+		gpio4: gpio@f0014000 {
+			/* POST_COMPLETE=gpio143 */
+			gpio-line-names =
+				/*128-159*/
+				"","","","","","","","",
+				"","","","","","","","POST_COMPLETE",
+				"","","","","","","","",
+				"","","","","","","","";
+		};
+		gpio5: gpio@f0015000 {
+			/* POWER_BUTTON=gpio177 */
+			gpio-line-names =
+				/*160-191*/
+				"","","","","","","","",
+				"","","","","","","","",
+				"","POWER_BUTTON","","","","","","",
+				"","","","","","","","";
+		};
+		gpio6: gpio@f0016000 {
+			/* SIO_S5=gpio199, RESET_BUTTON=gpio203 */
+			gpio-line-names =
+				/*192-223*/
+				"","","","","","","","SIO_S5",
+				"","","","RESET_BUTTON","","","","",
+				"","","","","","","","",
+				"","","","","","","","";
+		};
+
+		gpio224ol_pins: gpio224ol-pins {
+			pins = "GPIO224/SPIXCK";
+			bias-disable;
+			output-low;
+		};
+		gpio227o_pins: gpio227o-pins {
+			pins = "GPIO227/nSPIXCS0";
+			bias-disable;
+			output-high;
+		};
+		gpio228_pins: gpio228-pins {
+			pins = "GPIO228/nSPIXCS1";
+			bias-disable;
+			input-enable;
+		};
+	};
+};
-- 
2.21.0

