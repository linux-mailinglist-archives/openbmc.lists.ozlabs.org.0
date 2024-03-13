Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C044C87B541
	for <lists+openbmc@lfdr.de>; Thu, 14 Mar 2024 00:36:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MvX37fab;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw6Nd3gcCz3dRp
	for <lists+openbmc@lfdr.de>; Thu, 14 Mar 2024 10:36:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MvX37fab;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvmt31kKBz3bn7
	for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2024 21:27:39 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1ddcfe064faso2902935ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2024 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710325656; x=1710930456; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNKdIJK1p9MJ23nCnTh6b8pdxKFP2N/HtsbD5LhKpPU=;
        b=MvX37fabnUCyG7iGovMXmkww1keNa9ZROYm9t/38ecQ4y1fgVBoLAqrfGFfjfJxL3x
         +nRKGUr61AJOYeh0XagKRdSFsms3PfOnMtSseYeM2d2kLfzUwLOiXjr4Z8qiSswwKP2U
         nBCZzCymniIZyEQuUWCtzY1UiA3Q0qyWgxqEhu85LkQXXLxFq9DJrFu+yb5hKkXHYU8E
         cwrmThZCDGWOVgUx+STRqZnu9DfZ15eoBDrvrBRkHjWNiUtzv78/reXACs8mwtVpA/pJ
         QPS7PrdNWuE8RhOLbOQx6nKMInPp4+gE1cjfCd3GbdNgTDuC9ehb0YEMP7ERqZ43ju7Z
         apLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710325656; x=1710930456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNKdIJK1p9MJ23nCnTh6b8pdxKFP2N/HtsbD5LhKpPU=;
        b=jnCZWS8syOu+8U/XZ9mGC0L0izxqMUWzGybC1DVNhL5fTc8hRGmr1QfshGmESfTADH
         SdgZtTWTRrelaxPIB4rFlzTnSs2eQTJvspamn8bdby25QCjUQoJbao/pvzZYIveiYgZG
         z8xWt3lXic0av5EWirJN+MpVLvVxIVfmZgG3RIFIeEtSCjvZrOrbXTWI+RyKvrJhTcLA
         TwR+ZAHi3+AnTxE7iwMSrhMqUFHf9ZulhuAoTxbCn8K1RQnnFF702OmMTuSbQOYjn37q
         iGbT7uOrbzOi0FlP5MxxnOdojVMV8C3wsvlfpETFfmv+qL+mS2OlfT/8yPRAYlFaEI41
         JR7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiQiI4Q0RBRB9nf7o4TPj7iM/6BJtNYeNCpNVlbstIgm8XE8CnwEB8k5lbys6rTHhvaMjVj+JZHBnpc37eplwrr5dPIf4lMmw=
X-Gm-Message-State: AOJu0Yx/lnT7Rg8QtZyFKtdaoKTcCnlVFDJ97Vu+5s2GHGuSO++NvLAc
	wi6TJ5pFk+CGAe6u1FNLA+SOATMzlAql6hwPrS4ldsFAkNEM4oxl
X-Google-Smtp-Source: AGHT+IFfnqqu+8B9t9lRX6CFSz9OA77aaVCcKKhEWsLHcsgyFUIfNfB+AygVrDBczjXp0n1LxNUX7w==
X-Received: by 2002:a17:902:a386:b0:1dd:b3ef:4528 with SMTP id x6-20020a170902a38600b001ddb3ef4528mr2361299pla.52.1710325656391;
        Wed, 13 Mar 2024 03:27:36 -0700 (PDT)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id jz3-20020a170903430300b001db63cfe07dsm8249282plb.283.2024.03.13.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 03:27:35 -0700 (PDT)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: u-boot@lists.denx.de
Subject: [PATCH next v1 1/1] arm: dts: ast2600-x4tf: Add new dts for ASUS X4TF
Date: Wed, 13 Mar 2024 18:27:25 +0800
Message-Id: <20240313102725.2067651-2-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313102725.2067651-1-Kelly_Hung@asus.com>
References: <20240313102725.2067651-1-Kelly_Hung@asus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Mar 2024 10:35:27 +1100
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
Cc: marex@denx.de, trini@konsulko.com, hai.pham.ud@renesas.com, clamor95@gmail.com, jonas@kwiboo.se, openbmc@lists.ozlabs.org, neil.armstrong@linaro.org, christianshewitt@gmail.com, kever.yang@rock-chips.com, Allenyy_Hsu@asus.com, Kelly Hung <Kelly_Hung@asus.com>, naoki@radxa.com, cnsztl@gmail.com, patrick.delaunay@foss.st.com, michal.simek@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is the new bmc dts for ASUS X4TF server.

Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
---
V1: Add a new bmc dts for ASUS X4TF server.
---
 arch/arm/dts/Makefile         |   4 +-
 arch/arm/dts/ast2600-x4tf.dts | 161 ++++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2600-x4tf.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 784192125d..ebbc0b21fc 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -1359,7 +1359,9 @@ dtb-$(CONFIG_BCM6878) += \
 	bcm96878.dtb
 
 dtb-$(CONFIG_ASPEED_AST2500) += ast2500-evb.dtb
-dtb-$(CONFIG_ASPEED_AST2600) += ast2600-evb.dtb
+dtb-$(CONFIG_ASPEED_AST2600) += \
+	ast2600-evb.dtb \
+	ast2600-x4tf.dtb
 
 dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 
diff --git a/arch/arm/dts/ast2600-x4tf.dts b/arch/arm/dts/ast2600-x4tf.dts
new file mode 100644
index 0000000000..4bf4b66a9c
--- /dev/null
+++ b/arch/arm/dts/ast2600-x4tf.dts
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2024 ASUS Corp.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 ASUS X4TF";
+	compatible = "aspeed,ast2600-asus", "aspeed,ast2600";
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
+
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
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
+
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
+&hace {
+	status = "okay";
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
+&i2c8 {
+	status = "okay";
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
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&display_port {
+	status = "okay";
+};
-- 
2.25.1

