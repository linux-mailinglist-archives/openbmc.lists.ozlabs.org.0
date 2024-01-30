Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3841844EBB
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 02:38:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eVFH2gLU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQM4q5RBvz3cTQ
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 12:38:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eVFH2gLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPM4w2Z38z3c5W
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 21:35:28 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6da202aa138so2286777b3a.2
        for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2024 02:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706610925; x=1707215725; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79Ldr126af2p6IhRGQAFww97a5z+iXTLxFVEAw1gyOU=;
        b=eVFH2gLUjhP83Q9bnRdU20ws7WIE+yT3iaaNnh0xyVBdt870GVGE7mvkk8ZJhshxXh
         j63hN0HFrPK9fr47jNmN2Dao7J48095sj43k5sh+WF1vVsVkUQchkwL9I0SI0VmL/ufJ
         c633gE1bSBarVWZaRHiRSrfiMYErdUUJ4yn/Erke35O+I3/dp75+PsaBeYPohX8ouFwc
         2H7IyX/bXlhFz1fPw/WNkiDgXuvQbaGzIT+fZxNX/M7YFfudq/KRorkqb5gVTp1AI/FL
         wlyUouxXVz0AER610BGnWVpFYInizRhtL5Gs1Yeu/MUzFSN6zcbrlhiejkdlf1rJVayw
         rX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610925; x=1707215725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79Ldr126af2p6IhRGQAFww97a5z+iXTLxFVEAw1gyOU=;
        b=JlPdo7Qgr4cqLcpQ3ebVTZnAQA9ASCvpmRvhV1Pf344sDMpte1YIRnLnTXxsouyKdh
         uHgxbYu8qxyTjCG+HKQjwIsXoi2cnrGQoj0Iz2GX5cmEDztptv81x29gQkZskHzJbvK3
         JQ483XvVFaSHBFaGFehrc/6XKP+4rIgf78ZaBmO/OQ1CqDPDrXBrHFSgDBD4/9T+WAdD
         Fl8bqXh2FnVCvWx50ne1a9UrPaP0Ml5ZLVAr2zCGa21JhdPCZ/z5ULDW6yyjLJN1po9t
         6U4JG8u21rxuVgPx1vs3fkHgekyAvOUfmClYvShkgn2wa5AoXYcTmVMzj0gDY3IdTK55
         ETcg==
X-Gm-Message-State: AOJu0YyrtF39xgPFhZYW3J1Aub/u18hzKTEmj6K7FRQ/qG71dn4oGVl3
	l93PFUfsFtyb0MjlFQ7dRXXwGLD1edaeoNYwIUjB9Snx5Bqwf29M
X-Google-Smtp-Source: AGHT+IG3gZAMbjyIKVXuc3cLRY+bylc1VYEr/lcolGEUmNMs0ehXhS5XFT4lV4g5FHE0G24Ncjdd/g==
X-Received: by 2002:a05:6a00:2b4f:b0:6db:d1b4:1b27 with SMTP id du15-20020a056a002b4f00b006dbd1b41b27mr6095329pfb.4.1706610925179;
        Tue, 30 Jan 2024 02:35:25 -0800 (PST)
Received: from localhost.localdomain ([124.218.12.74])
        by smtp.gmail.com with ESMTPSA id 36-20020a630c64000000b005cf5cbac29asm7864287pgm.53.2024.01.30.02.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:35:24 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: u-boot@lists.denx.de
Subject: [PATCH] ARM: dts: ast2600: add dts for asus product
Date: Tue, 30 Jan 2024 18:35:19 +0800
Message-Id: <20240130103519.199646-1-Kelly_Hung@asus.com>
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

