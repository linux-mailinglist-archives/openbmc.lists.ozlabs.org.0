Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D35844EBC
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 02:39:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ChRQ8rwM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQM5p62Dwz3cPc
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 12:39:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ChRQ8rwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPMC92h2Hz3bnk
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 21:40:52 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d8aadc624dso16763815ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 02:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706611250; x=1707216050; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79Ldr126af2p6IhRGQAFww97a5z+iXTLxFVEAw1gyOU=;
        b=ChRQ8rwMtyV6xlkNy/QOFGzZ61CTly707UXptoZO5I8kyPN8Y8I8skcTNhL016JkOP
         wxUAokGDFlWskiQhQJYpVmtxchldZeHGe4AxlYmYi2/ZoEP5Wn1JWG7Egth49NVuHxip
         epu9viUw1lCQ2JQt0S/8e2hoK3jryQaIyGeKg35YC5L4SGI9vAQf5x5neneh8G6Wd4Md
         4xo17juW2g6wDTZcu/qTkdFhYCOkZ1K902wZYidDyZXzCkvTJ1/FCOFBITSS4185zyTp
         P/7oUp4kumH2RZVmEI5MYYMkv5MqSw9n3AOWmI2Kr9nzz9M/8YGRhVhMYbLKFj09YAbJ
         D75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611250; x=1707216050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79Ldr126af2p6IhRGQAFww97a5z+iXTLxFVEAw1gyOU=;
        b=X8xdahfiTEN3azwnWgewNiB/zYoKn+MZlnIxgL3hlnKyo04kQ5aQAsig/qGbTr+6uf
         TkT0R0cZ4QdSr+F9trCwQQ9Kfi3S1IsVUAUFmVnCKo0phPjbYUyR5+Wi+ujrS8LSkuyd
         OjVvG0d6XPPU71/o4sNSDMJGVUYaaFdeGxzVcPmoH+grclzAUWQ0+9n2+iFNSRptPcx8
         qirKWlwadPjWwUsWxu9PLrhd3Tpwpjw5Yt5preZt38hfRSfS/QUphQSOaX3oGLF7zdFb
         bwZz8kzdlj7WmSqycVFRyVD+TSZ7QEovwnZelY59WIzfN1+Y2+HL/Hg625ZwtKbc30XL
         h/iA==
X-Gm-Message-State: AOJu0Yw/9XIVarEGxe/NRGfVGWjnFYBVEq4DRRM/m/882Dvw07F9bEOb
	n/iYlPCYHWuNwWmUbMKfKUcL7v/tB9CwcsWBEknaxaLEHQSyf/gojPHjtnFn5pk=
X-Google-Smtp-Source: AGHT+IE7uu8+wo+5kHWQILEBLhyyXFL5yhJpFeBR9YxETUCzWm2S7aBrjkRQG4eEmrGzqIDw8AElbQ==
X-Received: by 2002:a17:903:2581:b0:1d9:f6e:a1a8 with SMTP id jb1-20020a170903258100b001d90f6ea1a8mr662844plb.53.1706611249986;
        Tue, 30 Jan 2024 02:40:49 -0800 (PST)
Received: from localhost.localdomain ([124.218.12.74])
        by smtp.gmail.com with ESMTPSA id jk5-20020a170903330500b001d740687d1csm3994672plb.193.2024.01.30.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:40:49 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: u-boot@lists.denx.de
Subject: [PATCH] dts: ast2600: add x4tf dts for asus product
Date: Tue, 30 Jan 2024 18:40:45 +0800
Message-Id: <20240130104045.199879-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
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
Cc: openbmc@lists.ozlabs.org, Kelly Hung <Kelly_Hung@asus.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This initial device-tree provides the necessary configuration for
basic BMC functionality and work on ASUS X4TF production.

Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
---
 arch/arm/dts/Makefile         |   3 +-
 arch/arm/dts/ast2600-x4tf.dts | 239 ++++++++++++++++++++++++++++++++++
 2 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2600-x4tf.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 37675a32..6d4a6ed0 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -698,7 +698,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-slt.dtb \
 	ast2600-tacoma.dtb \
 	ast2600-intel.dtb \
-	ast2600-tacoma.dtb
+	ast2600-tacoma.dtb \
+	ast2600-x4tf.dtb
 
 dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 
diff --git a/arch/arm/dts/ast2600-x4tf.dts b/arch/arm/dts/ast2600-x4tf.dts
new file mode 100644
index 00000000..3c478058
--- /dev/null
+++ b/arch/arm/dts/ast2600-x4tf.dts
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2020 IBM Corp.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 ASUS";
+	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		ethernet0 = &mac2;
+		ethernet1 = &mac3;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&wdt1 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt2 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt3 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <	&pinctrl_mdio3_default &pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ethphy2: ethernet-phy@2 {
+		reg = <0>;
+	};
+
+	ethphy3: ethernet-phy@3 {
+		reg = <0>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+};
+
+&mac3 {
+	status = "okay";
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor", "macronix,mx66l2g45g";
+		status = "okay";
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&emmc_slot0 {
+	status = "okay";
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emmc_default>;
+};
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&acry {
+	u-boot,dm-pre-reloc;
+	status = "disabled";
+};
+
+&i2c0 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1_default>;
+};
+
+&i2c1 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2_default>;
+};
+
+&i2c2 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3_default>;
+};
+
+&i2c3 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4_default>;
+};
+
+&i2c4 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c5_default>;
+};
+
+&i2c5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c6_default>;
+};
+
+&i2c6 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c7_default>;
+};
+
+&i2c7 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c8_default>;
+};
+
+&i2c8 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&i2c9 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c10_default>;
+};
+
+&i2c10 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c11_default>;
+};
+
+&i2c11 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c12_default>;
+};
+
+&i2c12 {
+	u-boot,dm-pre-reloc;
+	status = "disabled";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c13_default>;
+};
+
+&i2c13 {
+	u-boot,dm-pre-reloc;
+	status = "disabled";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c14_default>;
+};
+
+&i2c14 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c15_default>;
+};
+
+&i2c15 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c16_default>;
+};
+
+&display_port {
+	status = "okay";
+};
-- 
2.25.1

