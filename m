Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0394C8050
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 02:24:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6zzl1r8tz3bfH
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 12:24:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M5DW0QmW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M5DW0QmW; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6zzK63HRz30F8
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 12:23:41 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id bx5so12734026pjb.3
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 17:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HvXpDEbh1ugkb629xMq+QGg2TZYpGacc5U1VS2tnjak=;
 b=M5DW0QmWiTN2GeFbwOGt4Mlx1SahxmmHAe2ZoLnoUmoMob8kEVZnYxwkcF6nhWIsDw
 kXdBb++4UbNl9YaN0vOUL32nw18G91ympPtj8scMn/QzvtfruXtqN6vMfj3aKjde+L7O
 MKgQ8Jeyqug6y7SQN3rzNUUZLtAfn9i4L/efOajd8Ilum3ep7l7xQendeGf0mADrGARX
 /c/2VWyWXdeW+dwANkXMWPT0+Bad4E1LU4wGOZA71YrOP95yUmDkyLLwbnwW4/zLGwSS
 +MGBRZr1qJAZ6d0HYXAs2gUrSDEDkDsohnZ1binkz+B9Cl+OrOJU4lxCN4ESHjNnYpJ9
 nqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HvXpDEbh1ugkb629xMq+QGg2TZYpGacc5U1VS2tnjak=;
 b=q9wEHo81ND5m/bhwl1pfTpG5gzFBL53hZq2VDSa63CqHNiQGvd5VYqZdN0Qby3Pkuf
 YU8IVf9R+WeaBaxUfG4ban8GPsJa1/qsWFx9ZrQmiii/4yKgH24tL/GNHTyX+KFdUwri
 6o7LtvcHa9r3EhyXUXFkQdkEiAfKL3Ib44q45SEMaHAxS7IkH+oe8LWH8Y/qKXxC7oFH
 ehWxB4rpTL0ql/+KWC/i1YzWe0Mb6HkUY9rUwO44EzerHr5y0HnFtqixt0wGjJgY1yeS
 s6Z52eg2NYpXLOXtnnZlog6sRsGh5I+mMletZsIJkCbAnvyoONTDZelNVWcc5dHhMZ1c
 6vYQ==
X-Gm-Message-State: AOAM53316sCwhZMaXQAUtj+XbMjwikR0bHahy13zZhJhaxgcp6uePNAm
 uJ7nqQc/8y5Bjvf3e5fIhNY=
X-Google-Smtp-Source: ABdhPJyqU5qdC3PluX4Biik5wBapEEVmsj2xmIh09jp5o3YAY4UqVcmZx9fKe/35/FoX/wGA1fkczg==
X-Received: by 2002:a17:90a:8582:b0:1b9:b0da:9ca9 with SMTP id
 m2-20020a17090a858200b001b9b0da9ca9mr19296915pjn.146.1646097817863; 
 Mon, 28 Feb 2022 17:23:37 -0800 (PST)
Received: from george-Quanta.com.com (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056a00168c00b004e15818cda3sm15958534pfc.114.2022.02.28.17.23.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 17:23:36 -0800 (PST)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Date: Tue,  1 Mar 2022 09:11:35 +0800
Message-Id: <20220301011135.14066-1-george.hung@quantatw.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Alan_Kuo@quantatw.com, openbmc@lists.ozlabs.org, p.k.lee@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add build support for Quanta S6Q board equipped with
AST2600 BMC SoC

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 arch/arm/dts/Makefile        |   1 +
 arch/arm/dts/ast2600-s6q.dts | 218 +++++++++++++++++++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-s6q.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index e5a73697c5..a79f885f54 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-ncsi.dtb \
 	ast2600-pfr.dtb \
 	ast2600-rainier.dtb \
+	ast2600-s6q.dtb \
 	ast2600-slt.dtb \
 	ast2600-tacoma.dtb
 
diff --git a/arch/arm/dts/ast2600-s6q.dts b/arch/arm/dts/ast2600-s6q.dts
new file mode 100644
index 0000000000..52b620d3b4
--- /dev/null
+++ b/arch/arm/dts/ast2600-s6q.dts
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2022 Quanta Corp.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Quanta S6Q BMC";
+	compatible = "quanta,s6q-bmc", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		spi2 = &spi2;
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
+	pinctrl-0 = <&pinctrl_mdio3_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ethphy2: ethernet-phy@2 {
+		reg = <0>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spi2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
+			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1_default>;
+};
+
+&i2c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2_default>;
+};
+
+&i2c2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3_default>;
+};
+
+&i2c3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4_default>;
+};
+
+&i2c4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c5_default>;
+};
+
+&i2c5 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c6_default>;
+};
+
+&i2c6 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c7_default>;
+};
+
+&i2c7 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c8_default>;
+};
+
+&i2c8 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&i2c9 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c10_default>;
+};
+
+&i2c11 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c12_default>;
+};
+
+&i2c14 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c15_default>;
+};
+
+&i2c15 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c16_default>;
+};
+
+&display_port {
+	status = "okay";
+};
+
+&scu {
+	mac2-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+	mac3-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+};
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&acry {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
-- 
2.32.0

