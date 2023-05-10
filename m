Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420776FDC13
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 12:59:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGX963phcz3fMg
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 20:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ocBRnivt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=lesly895@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ocBRnivt;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGX8V0JN4z3fCY
	for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 20:59:05 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so48767875ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 03:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683716342; x=1686308342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jZSIW19PlvqSImz31K5RhoxRj11VW/ea77nyalEajU=;
        b=ocBRnivtjqfJrmWZ/PKJgTFnfEN7ma2lKdXau9/OrDzhUjL77O4WDpsWNTXz5/vr+M
         KexL9bjXvPQ3GCo9ePLPg0jy2jKMu6p1YHy+TCT1nDOQ19ERztn7AP9NzICQpXX4aGLJ
         L+RD6+omi+qDILJwty9lExweMirQjO6SxMskVQKOXg6SnjLMzp6v7Q+G5y6rbmBdCflo
         lDxF0E3A6f2yWZmzRj2La+24+VrIhkihn43N4w9H6ZHYi0GssMpyKhWiQLxdTPFmhrkd
         HYsmjMAWVErvlNCmYePxK/I5Ze9iJmw4nc5I1okqDzCfjvW+vqn7bznS0FmyiyrjfLJW
         G8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683716342; x=1686308342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jZSIW19PlvqSImz31K5RhoxRj11VW/ea77nyalEajU=;
        b=Zt+g/f6BNiVSsQFd/Qj9QG/b9zd4k3aBbcur6PuOSWUJrldDdaLdR4HVjue57FTAUQ
         m8G06dcaVo0KkLlQe69wHXu+xjF+2VK9b6K9SSUvbKFOAGDMfZMr+vUVeX80JUWuhYEl
         e0IYId8h1N4TMfvsATHEuBlHbSmfSklyhhxHfbnZuyBwjajEsQO+emiswgqMXoGfzyM0
         mRq/KBUVwyc2OggiRETKrJox4rkQYF9ji+lFdz3tbNw4ihHgHRtZ2zYC+SwaVb4vXfjJ
         V1J5zKRZAWQ5wGn7ilgbNM5sLwGEdemGhIgFHR0/BEi/y8+T1qZrzIHz3s/BBiFWQbaD
         Zhiw==
X-Gm-Message-State: AC+VfDwp0zJGIeeOSLiCYUqc67ONNJSCJySskbPoxzHlOj7PBrcXMSkL
	ifxf5YIzemtNo+nbQDhzdpRcIRNn5ecUIA==
X-Google-Smtp-Source: ACHHUZ6TpXU15JvewezEQ5pYRQYqRFBJLlJgx0c1plkvwMxu2Lvje6TksDYPrM9eSdWY+hWukfgcyA==
X-Received: by 2002:a17:902:b213:b0:1ab:13c7:8992 with SMTP id t19-20020a170902b21300b001ab13c78992mr15747869plr.39.1683716341755;
        Wed, 10 May 2023 03:59:01 -0700 (PDT)
Received: from openbmc-server.. (61-220-204-242.hinet-ip.hinet.net. [61.220.204.242])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902e88300b001aaffe15f39sm3484204plg.30.2023.05.10.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 03:59:01 -0700 (PDT)
From: lesly895@gmail.com
X-Google-Original-From: ryans@supermicro.com.tw
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: aspeed: Add Supermicro X13dem system BMC devicetree
Date: Wed, 10 May 2023 10:58:56 +0000
Message-Id: <20230510105856.2066494-1-ryans@supermicro.com.tw>
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
Cc: andrew@aj.id.au, linux-arm-kernel@lists.infradead.org, Ryan Sie <ryans@supermicro.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ryan Sie <ryans@supermicro.com.tw>

Add a devicetree for the new X13dem system.

Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>
---
 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 270 ++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1b585e554791..0dda2565983e 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -86,6 +86,7 @@ properties:
               - jabil,rbp-bmc
               - nuvia,dc-scm-bmc
               - quanta,s6q-bmc
+              - supermicro,x13dem-bmc
           - const: aspeed,ast2600
 
 additionalProperties: true
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index eb681903d50b..0197ac26a3ae 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1629,6 +1629,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-quanta-s6q.dtb \
 	aspeed-bmc-supermicro-x11spi.dtb \
+	aspeed-bmc-supermicro-x13dem.dtb \
 	aspeed-bmc-inventec-transformers.dtb \
 	aspeed-bmc-tyan-s7106.dtb \
 	aspeed-bmc-tyan-s8036.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
new file mode 100644
index 000000000000..0adb564e99e6
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 Supermicro Corp.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Supermicro X13DEM BMC";
+	compatible = "supermicro,x13dem-bmc", "aspeed,ast2600";
+
+	aliases {
+		mmc0 = &emmc;
+	};
+
+	chosen {
+		stdout-path = &uart5;
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
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
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
+	    compatible = "gpio-leds";
+	    led-power {
+		    gpios = <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_LOW>;
+	    };
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
+	};
+};
+
+&adc0 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+	max-frequency = <100000000>;
+	clk-phase-mmc-hs200 = <9>, <225>;
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "spi1:0";
+		spi-max-frequency = <25000000>;
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
+	/*G0-G7*/	"","","","","","led-power","","",
+	/*H0*/		"smi-control",
+	/*H1*/		"nmi-control",
+	/*H2*/		"power-chassis-control",
+	/*H3*/		"reset-control",
+	/*H4*/		"",
+	/*H5*/		"",
+	/*H6*/		"reset-phy",
+	/*H7*/		"",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","led-heartbeat",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S3*/	"","","","",
+	/*S4*/		"power-chassis-good",
+	/*S5*/		"reset-button",
+	/*S6*/		"",
+	/*S7*/		"id-button",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0*/		"",
+	/*X1*/		"post-complete",
+	/*X2*/		"smi-button",
+	/*X3-X5*/	"","","",
+	/*X6*/		"nmi-button",
+	/*X7*/		"bmc-ready",
+	/*Y0*/		"",
+	/*Y1*/		"led-heartbeat2",
+	/*Y2*/		"",
+	/*Y3*/		"reset-emmc",
+	/*Y4-Y7*/	"","","","",
+	/*Z0*/		"BMC_PROG_N",
+	/*Z1*/		"BMC_PWRFAN_FAIL_N",
+	/*Z2*/		"power-button",
+	/*Z3-Z7*/	"","","","","";
+};
+
+&kcs3 {
+	aspeed,lpc-io-reg = <0xca2>;
+	status = "okay";
+};
+
+&kcs4 {
+	aspeed,lpc-io-reg = <0xca4>;
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
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
+&uart_routing {
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
+			<&syscon ASPEED_CLK_MAC3RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "disabled";
+};
+
+&i2c2 {
+	multi-master;
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+	bus-frequency = <400000>;
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
+};
+
+&vhub {
+	status = "okay";
+	pinctrl-names = "default";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
-- 
2.34.1

