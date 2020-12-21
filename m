Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC2F2E0419
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 02:53:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0K9X2cNYzDqR6
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 12:53:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=lesly895@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BIRyaj+9; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D00zm3J53zDqLd
 for <openbmc@lists.ozlabs.org>; Tue, 22 Dec 2020 00:43:25 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id c79so6485850pfc.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Dec 2020 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQxtiNpq3PE4/RNHw0TP51AGm7hjS6M+hVfPV6/FP70=;
 b=BIRyaj+9PFDrDydz6Qyu9VOV6yFR5rWsW7157fmCv+QA7N8UMTnrVYkuR1vzC8W1VD
 prud7yosrarnPt3JZA3f2RPJio2ancIw+pSs+55qdLuMiQjSTdWgM7dtfZh1cbBxtwX/
 IT4K/2IzSstnECxYBhL6GAvDLLorWdMdTlaMpIryhUC5R39I0+U+54o+4rDkoD8MKdph
 MxGa8cx2R/BOcmhReL4pqt5zkfl8zPWJm8Uv5x9evYM+QpXYC3D5H9/L7v4DbRQR6IC2
 Jaql5TiaZttv+NMMeDhkziKDt6OKo7ZuWbH91cIcO1C03x8c50WWT8ZsIDIIWSG+JxaA
 jqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bQxtiNpq3PE4/RNHw0TP51AGm7hjS6M+hVfPV6/FP70=;
 b=Xe1g89GDK/s/sovwknPw1xf6tet7+3zvJ9o0c65JDtj8olbNnhdicIej0ph5oBElST
 MwNT3BbM0S3LEMsgW3/rJ2BaBs/gSHxvH7vUHgEFDaHWgmkqr/BtqfK1L0r7yHu4NGJy
 w+HmRKyN6HgLDp43B8X1ED5OaKKkd2pD3cwdXN2vmcAi1TocO3bVEw/P5B34htmU+CIy
 SzyjLqy/r8/yW479HkoTzbjdFluJz3fo2r6exuw2PCXhTuqYImpnDhCVQt6dKI11MH4I
 +1py/7sVroLfb6FMl4r+5X3A/Qp8tBQxd8fJLv5y3/6GyuLu5JJLH9YSUsp+wjceZWEO
 28yQ==
X-Gm-Message-State: AOAM532ZvZniC7FrG3U3NN+vVuwwFWOa5D3MX5OCNW1dPcBtyW7XXB4h
 N8wWFTtn6lIXtLKVBk4DghmAcf+Xv6c=
X-Google-Smtp-Source: ABdhPJzbYYRYPeu6FbhgAKbpdALM+Gx7QODIkk8pxaKW2qUCRnGKybh5dtT7aRgrM5GIoFRSzibfVQ==
X-Received: by 2002:aa7:9046:0:b029:1a4:aa3b:1f31 with SMTP id
 n6-20020aa790460000b02901a4aa3b1f31mr14977273pfo.77.1608558201221; 
 Mon, 21 Dec 2020 05:43:21 -0800 (PST)
Received: from ubuntu.localdomain (27-52-190-45.adsl.fetnet.net.
 [27.52.190.45])
 by smtp.gmail.com with ESMTPSA id x27sm9634237pfr.122.2020.12.21.05.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 05:43:20 -0800 (PST)
From: Ryan Sie <lesly895@gmail.com>
X-Google-Original-From: Ryan Sie <RyanS@supermicro.com.tw>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.8] ARM: dts: aspeed: Add Supermicro x11spi BMC
 machine
Date: Mon, 21 Dec 2020 05:43:15 -0800
Message-Id: <20201221134315.5544-1-RyanS@supermicro.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Dec 2020 12:47:06 +1100
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
Cc: Ryan Sie <ryans@supermicro.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ryan Sie <ryans@supermicro.com.tw>

The x11spi is a server platform with an ASPEED AST2500 BMC.

OpenBMC-Staging-Count: 1
Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>
---
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts | 137 +++++++++++++++++++++
 2 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5fd12e8..e898d3d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1379,4 +1379,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon-128.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
-	aspeed-bmc-quanta-q71l.dtb
+	aspeed-bmc-quanta-q71l.dtb \
+	aspeed-bmc-supermicro-x11spi.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
new file mode 100644
index 0000000..bc16ad2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Super Micro Computer, Inc
+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "X11SPI BMC";
+	compatible = "supermicro,x11spi-bmc", "aspeed,ast2500";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "earlyprintk";
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
+		vga_memory: framebuffer@7f000000 {
+			no-map;
+			reg = <0x7f000000 0x01000000>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			<&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			<&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
+	};
+
+};
+
+&gpio {
+    status = "okay";
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
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
+		m25p,fast-read;
+		label = "pnor";
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac0 {
+    status = "okay";
+
+    pinctrl-names = "default";
+    pinctrl-0 = <&pinctrl_rmii1_default>;
+    clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+           <&syscon ASPEED_CLK_MAC1RCLK>;
+    clock-names = "MACCLK", "RCLK";
+    use-ncsi;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
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
+&i2c13 {
+	status = "okay";
+};
+
+&gfx {
+	status = "okay";
+};
+
+&pinctrl {
+	aspeed,external-nodes = <&gfx &lhc>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+			 &pinctrl_pwm2_default &pinctrl_pwm3_default
+			 &pinctrl_pwm4_default &pinctrl_pwm5_default
+			 &pinctrl_pwm6_default &pinctrl_pwm7_default>;
+};
-- 
2.7.4

