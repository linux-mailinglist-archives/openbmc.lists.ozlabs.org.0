Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC9340512
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 13:03:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Qf246nJz3bs4
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 23:03:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=q2WE0sN6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q2WE0sN6; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Qdn5XWcz30N1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 23:03:07 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id v8so1192119plz.10
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a19YbWI/S/alEGVUlDmLLtFt4wH1pAOUt6idyMuBo9k=;
 b=q2WE0sN6FMtInBGlla+e+B7kRm9/nntAq1ZFlrfRBAWMCi5caVRwrVc8lKsBpPZIpJ
 dC/0iab0RyZEV0A4aFHarRDCXPYafKCAfXrTvP4PaH3Z83bsW2ZQ6hnqW3XvyImdB7IW
 fCCji5GT5SHCyA1X5hVDbNZgIoNZ3arZZw08Pm9tSiEtUs2rhfc5jeAbcAA9F2UBE7W6
 vbp49mDet316quZShNAtU4LDooqw+aNUlgqF5Vs+yNKVeLRMgc5no2q0A63dpIzA9aOf
 t9XNKTdIqv2MxL9ZdfmtgRuIDM4lD1L+djt8EW978QMVoT+ijNejMLeC77M7M1INmdvE
 njFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a19YbWI/S/alEGVUlDmLLtFt4wH1pAOUt6idyMuBo9k=;
 b=S3o2/dajD8JSo/lk7C4sMqmr7Tvt0get6OPK445xJfimWPFnoI4rpKvHHespltznXY
 /2d+WuxResQT3z5Fcr56bBF2iUj0P0A2aB87Zwte575H8uxwZiyYMXP2LK1htZ7qsdUE
 arkHlAydGQOi4GSVkqyGJ9wXQa2ldiOEY5A8YSlLeWzxVPxdKkAMmL5wRC6CNq4/haDB
 OymKh5F6lZFhqhrwT0fpeEmdwPBBMftqVRklkMTYOveL8CnP/5iWKY88R+hn0OD6z3C0
 vGOnc6p6kw9hk7hDNrR9csN8G78ouxUW+k5KeBbVVcPHQs8g6jYwbFzWTsYpf8flnhVX
 FrrQ==
X-Gm-Message-State: AOAM531avaEdDZ66CGFKg9bgBVsbxCBM6uGJDir5jkiy2S20mXQfV0+b
 SPWjN8g3VQCUhMT4Z2FjklMODtBmQtw=
X-Google-Smtp-Source: ABdhPJxkRwgl6jikDdgB2E2QoY5Mv6iq5jGHrxDeH7Rju3irCtM/B029Rqo8ZQv7jcFFfyMIJvGzMw==
X-Received: by 2002:a17:90a:f2d5:: with SMTP id
 gt21mr4235914pjb.197.1616068982376; 
 Thu, 18 Mar 2021 05:03:02 -0700 (PDT)
Received: from george-Quanta.com.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id 133sm2467347pfa.130.2021.03.18.05.02.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Mar 2021 05:02:58 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.10 v3] ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree
Date: Thu, 18 Mar 2021 19:54:01 +0800
Message-Id: <20210318115401.48811-1-george.hung@quantatw.com>
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
 openbmc@lists.ozlabs.org, brandonkim@google.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the device tree for the Quanta GBS BMC and it's
based on NPCM730 SoC

Signed-off-by: George Hung <george.hung@quantatw.com>

---
v2:
 - add the machine name to compatible string
 - follow the convention of using phandles to enable devices

---
v3:
 - add udc5~9 device nodes to nuvoton-npcm730.dtsi
 - Modify to include nuvoton-npcm730.dtsi
---
 arch/arm/boot/dts/Makefile                |    1 +
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 1196 +++++++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm730.dtsi    |   45 +-
 3 files changed, 1240 insertions(+), 2 deletions(-)
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
index 000000000000..844e666fc966
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -0,0 +1,1196 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Quanta Computer Inc. George.Hung@quantatw.com
+
+/dts-v1/;
+#include "nuvoton-npcm730.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Quanta GBS Board (Device Tree)";
+	compatible = "quanta,gbs-bmc","nuvoton,npcm730";
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
+};
+
+&fiu0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0cs1_pins>;
+	status = "okay";
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <19000000>;
+		spi-rx-bus-width = <2>;
+		label = "bmc";
+		partitions@80000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			u-boot@0 {
+				label = "u-boot";
+				reg = <0x0000000 0xf0000>;
+			};
+			image-descriptor@f0000 {
+				label = "image-descriptor";
+				reg = <0xf0000 0x10000>;
+			};
+			hoth-update@100000 {
+				label = "hoth-update";
+				reg = <0x100000 0x100000>;
+			};
+			kernel@200000 {
+				label = "kernel";
+				reg = <0x200000 0x500000>;
+			};
+			rofs@700000 {
+				label = "rofs";
+				reg = <0x700000 0x35f0000>;
+			};
+			rwfs@3cf0000 {
+				label = "rwfs";
+				reg = <0x3cf0000 0x300000>;
+			};
+			hoth-mailbox@3ff0000 {
+				label = "hoth-mailbox";
+				reg = <0x3ff0000 0x10000>;
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>, <&spi3cs1_pins>;
+	status = "okay";
+
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
+		m25p,fast-read;
+		label = "pnor";
+	};
+	spi-nor@1 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <1>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
+		m25p,fast-read;
+	};
+};
+
+&gcr {
+	serial_port_mux: uart-mux-controller {
+		compatible = "mmio-mux";
+		#mux-control-cells = <1>;
+		mux-reg-masks = <0x38 0x07>;
+		idle-states = <2>; /* Serial port mode 3 (takeover) */
+	};
+
+	uart1_mode_mux: uart1-mode-mux-controller {
+		compatible = "mmio-mux";
+		#mux-control-cells = <1>;
+		mux-reg-masks = <0x64 0x01000000>;
+		idle-states = <0>; /* Set UART1 mode to normal (follow SPMOD) */
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	snps,eee-force-disable;
+};
+
+&emc0 {
+	status = "okay";
+	phy-mode = "rmii";
+	use-ncsi;
+};
+
+&mc {
+	compatible = "nuvoton,npcm7xx-sdram-edac";
+	reg = <0xf0824000 0x1000>;
+	interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&aes {
+	status = "okay";
+};
+
+&sha {
+	status = "okay";
+};
+
+&udc5 {
+	status = "okay";
+};
+
+&udc6 {
+	status = "okay";
+};
+
+&udc7 {
+	status = "okay";
+};
+
+&udc8 {
+	status = "okay";
+};
+
+&pcimbox {
+	status = "okay";
+};
+
+&watchdog1 {
+	status = "okay";
+};
+
+&rng {
+	status = "okay";
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&serial2 {
+	status = "okay";
+};
+
+&serial3 {
+	status = "okay";
+};
+
+&adc {
+	#io-channel-cells = <1>;
+	status = "okay";
+};
+
+&otp {
+	status = "okay";
+};
+
+&lpc_kcs {
+	kcs1: kcs1@0 {
+		status = "okay";
+	};
+
+	kcs2: kcs2@0 {
+		status = "okay";
+	};
+
+	kcs3: kcs3@0 {
+		status = "okay";
+	};
+};
+
+&lpc_host {
+	lpc_bpc: lpc_bpc@40 {
+		monitor-ports = <0x80>;
+		status = "okay";
+	};
+};
+
+&spi1 {
+	cs-gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>; /* dummy - gpio147 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio224ol_pins &gpio227o_pins
+			&gpio228_pins>;
+	status = "okay";
+
+	jtag_master@0 {
+		compatible = "nuvoton,npcm750-jtag-master";
+		spi-max-frequency = <25000000>;
+		reg = <0>;
+		status = "okay";
+
+		pinctrl-names = "pspi", "gpio";
+		pinctrl-0 = <&pspi2_pins>;
+		pinctrl-1 = <&gpio224ol_pins &gpio227o_pins
+				&gpio228_pins>;
+
+		tck-gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
+		tdi-gpios = <&gpio7 3 GPIO_ACTIVE_HIGH>;
+		tdo-gpios = <&gpio7 4 GPIO_ACTIVE_HIGH>;
+		tms-gpios = <&gpio7 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+
+		i2c0_slotPE0_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			pcie-slot = &pcie1;
+		};
+
+		i2c0_slotPE1_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			pcie-slot = &pcie2;
+		};
+
+		i2c0_slotUSB_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c0_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	pca9535_ifdet: pca9535-ifdet@24 {
+		compatible = "nxp,pca9535";
+		reg = <0x24>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pca9535_pwren: pca9535-pwren@20 {
+		compatible = "nxp,pca9535";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"pwr_u2_3_en","pwr_u2_2_en",
+			"pwr_u2_1_en","pwr_u2_0_en",
+			"pwr_u2_7_en","pwr_u2_6_en",
+			"pwr_u2_5_en","pwr_u2_4_en",
+			"pwr_u2_11_en","pwr_u2_10_en",
+			"pwr_u2_9_en","pwr_u2_8_en",
+			"pwr_u2_15_en","pwr_u2_14_en",
+			"pwr_u2_13_en","pwr_u2_12_en";
+	};
+
+	pca9535_pwrgd: pca9535-pwrgd@21 {
+		compatible = "nxp,pca9535";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pca9535_ledlocate: pca9535-ledlocate@22 {
+		compatible = "nxp,pca9535";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+	};
+
+	pca9535_ledfault: pca9535-ledfault@23 {
+		compatible = "nxp,pca9535";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+	};
+
+	pca9535_pwrdisable: pca9535-pwrdisable@25 {
+		compatible = "nxp,pca9535";
+		reg = <0x25>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"u2_3_pwr_dis","u2_2_pwr_dis",
+			"u2_1_pwr_dis","u2_0_pwr_dis",
+			"u2_7_pwr_dis","u2_6_pwr_dis",
+			"u2_5_pwr_dis","u2_4_pwr_dis",
+			"u2_11_pwr_dis","u2_10_pwr_dis",
+			"u2_9_pwr_dis","u2_8_pwr_dis",
+			"u2_15_pwr_dis","u2_14_pwr_dis",
+			"u2_13_pwr_dis","u2_12_pwr_dis";
+	};
+
+	pca9535_perst: pca9535-perst@26 {
+		compatible = "nxp,pca9535";
+		reg = <0x26>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"u2_15_perst","u2_14_perst",
+			"u2_13_perst","u2_12_perst",
+			"u2_11_perst","u2_10_perst",
+			"u2_9_perst","u2_8_perst",
+			"u2_7_perst","u2_6_perst",
+			"u2_5_perst","u2_4_perst",
+			"u2_3_perst","u2_2_perst",
+			"u2_1_perst","u2_0_perst";
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	sbtsi@4c {
+		compatible = "amd,sbtsi";
+		reg = <0x4c>;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	mb_fru@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		i2c-mux-idle-disconnect;
+
+		i2c5_i2cool_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			max31725@54 {
+				compatible = "maxim,max31725";
+				reg = <0x54>;
+				status = "okay";
+			};
+		};
+
+		i2c5_i2cool_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			max31725@55 {
+				compatible = "maxim,max31725";
+				reg = <0x55>;
+				status = "okay";
+			};
+		};
+
+		i2c5_i2cool_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			max31725@5d {
+				compatible = "maxim,max31725";
+				reg = <0x5d>;
+				status = "okay";
+			};
+			fan_fru@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+
+		i2c5_hsbp_fru_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			hsbp_fru@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+				status = "okay";
+			};
+		};
+	};
+};
+
+&i2c6 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	i2c-switch@73 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x73>;
+		i2c-mux-idle-disconnect;
+
+		i2c6_u2_15_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c6_u2_14_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c6_u2_13_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c6_u2_12_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c7 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	i2c-switch@72 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x72>;
+		i2c-mux-idle-disconnect;
+
+		i2c7_u2_11_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c7_u2_10_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c7_u2_9_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c7_u2_8_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c8 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	i2c8_adm1272: adm1272@10 {
+		compatible = "adi,adm1272";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x10>;
+		shunt-resistor-micro-ohms = <300>;
+	};
+};
+
+&i2c9 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>;
+
+		i2c9_vddcr_cpu: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			vrm@60 {
+				compatible = "isil,isl68137";
+				reg = <0x60>;
+			};
+		};
+
+		i2c9_vddcr_soc: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			vrm@61 {
+				compatible = "isil,isl68137";
+				reg = <0x61>;
+			};
+		};
+
+		i2c9_vddio_efgh: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			vrm@63 {
+				compatible = "isil,isl68137";
+				reg = <0x63>;
+			};
+		};
+
+		i2c9_vddio_abcd: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			vrm@45 {
+				compatible = "isil,isl68137";
+				reg = <0x45>;
+			};
+		};
+	};
+};
+
+&i2c10 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+		i2c-mux-idle-disconnect;
+
+		i2c10_u2_7_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c10_u2_6_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c10_u2_5_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c10_u2_4_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c11 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	i2c-switch@76 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x76>;
+		i2c-mux-idle-disconnect;
+
+		i2c11_clk_buf0_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c11_clk_buf1_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c11_clk_buf2_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c11_clk_buf3_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c12 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	max34451@4e {
+		compatible = "maxim,max34451";
+		reg = <0x4e>;
+	};
+	vrm@5d {
+		compatible = "isil,isl68137";
+		reg = <0x5d>;
+	};
+	vrm@5e {
+		compatible = "isil,isl68137";
+		reg = <0x5e>;
+	};
+};
+
+&i2c13 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&i2c14 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c14_u2_3_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c14_u2_2_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c14_u2_1_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c14_u2_0_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&pwm_fan {
+	pinctrl-names = "default";
+	pinctrl-0 = <
+		&pwm0_pins &pwm1_pins
+		&pwm2_pins &pwm3_pins
+		&pwm4_pins
+		&fanin0_pins &fanin1_pins
+		&fanin2_pins &fanin3_pins
+		&fanin4_pins
+	>;
+	status = "okay";
+
+	fan@0 {
+		reg = <0x00>;
+		fan-tach-ch = /bits/ 8 <0x00>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		fan-tach-ch = /bits/ 8 <0x01>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		fan-tach-ch = /bits/ 8 <0x02>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		fan-tach-ch = /bits/ 8 <0x03>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		fan-tach-ch = /bits/ 8 <0x04>;
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+
+	gpio0: gpio@f0010000 {
+		/* POWER_OUT=gpio07, RESET_OUT=gpio06, PS_PWROK=gpio13 */
+		gpio-line-names =
+		/*0-31*/
+		"","","","","","","RESET_OUT","POWER_OUT",
+		"","","","","","PS_PWROK","","",
+		"","","","","","","","",
+		"","","","","","","","";
+	};
+	gpio1: gpio@f0011000 {
+		/* SIO_POWER_GOOD=gpio59 */
+		gpio-line-names =
+		/*32-63*/
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","SIO_POWER_GOOD","","","","";
+	};
+	gpio2: gpio@f0012000 {
+		bmc_usb_mux_oe_n {
+			gpio-hog;
+			gpios = <25 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "bmc-usb-mux-oe-n";
+		};
+		bmc_usb_mux_sel {
+			gpio-hog;
+			gpios = <26 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "bmc-usb-mux-sel";
+		};
+		bmc_usb2517_reset_n {
+			gpio-hog;
+			gpios = <27 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "bmc-usb2517-reset-n";
+		};
+	};
+	gpio3: gpio@f0013000 {
+		assert_cpu0_reset {
+			gpio-hog;
+			gpios = <14 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "assert-cpu0-reset";
+		};
+		assert_pwrok_cpu0_n {
+			gpio-hog;
+			gpios = <15 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "assert-pwrok-cpu0-n";
+		};
+		assert_cpu0_prochot {
+			gpio-hog;
+			gpios = <16 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "assert-cpu0-prochot";
+		};
+	};
+	gpio4: gpio@f0014000 {
+		/* POST_COMPLETE=gpio143 */
+		gpio-line-names =
+			/*128-159*/
+			"","","","","","","","",
+			"","","","","","","","POST_COMPLETE",
+			"","","","","","","","",
+			"","","","","","","","";
+	};
+	gpio5: gpio@f0015000 {
+		/* POWER_BUTTON=gpio177 */
+		gpio-line-names =
+			/*160-191*/
+			"","","","","","","","",
+			"","","","","","","","",
+			"","POWER_BUTTON","","","","","","",
+			"","","","","","","","";
+	};
+	gpio6: gpio@f0016000 {
+		/* SIO_S5=gpio199, RESET_BUTTON=gpio203 */
+		gpio-line-names =
+			/*192-223*/
+			"","","","","","","","SIO_S5",
+			"","","","RESET_BUTTON","","","","",
+			"","","","","","","","",
+			"","","","","","","","";
+	};
+
+	gpio224ol_pins: gpio224ol-pins {
+		pins = "GPIO224/SPIXCK";
+		bias-disable;
+		output-low;
+	};
+	gpio227o_pins: gpio227o-pins {
+		pins = "GPIO227/nSPIXCS0";
+		bias-disable;
+		output-high;
+	};
+	gpio228_pins: gpio228-pins {
+		pins = "GPIO228/nSPIXCS1";
+		bias-disable;
+		input-enable;
+	};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
index 20e13489b993..03bb8ab8cd6c 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
 // Copyright 2018 Google, Inc.
+// Copyright (c) 2020 Quanta Computer Inc. George.Hung@quantatw.com
 
 #include "nuvoton-common-npcm7xx.dtsi"
 
@@ -44,10 +45,50 @@
 	};
 
 	ahb {
-		udc9:udc@f0839000 {
+		udc5: udc@f0835000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0835000 0x1000
+			       0xfffd2800 0x800>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc6: udc@f0836000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0836000 0x1000
+			       0xfffd3000 0x800>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc7: udc@f0837000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0837000 0x1000
+			       0xfffd3800 0x800>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc8: udc@f0838000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0838000 0x1000
+			       0xfffd4000 0x800>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc9: udc@f0839000 {
 			compatible = "nuvoton,npcm750-udc";
 			reg = <0xf0839000 0x1000
-			       0xfffd0000 0x800>;
+			       0xfffd4800 0x800>;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&clk NPCM7XX_CLK_SU>;
-- 
2.21.0

