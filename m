Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1665943F
	for <lists+openbmc@lfdr.de>; Fri, 30 Dec 2022 03:46:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjqQ16l5tz3c7C
	for <lists+openbmc@lfdr.de>; Fri, 30 Dec 2022 13:46:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=lnlShbIT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=lnlShbIT;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjqPQ0kjNz3bhv
	for <openbmc@lists.ozlabs.org>; Fri, 30 Dec 2022 13:45:27 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so20539183pjo.3
        for <openbmc@lists.ozlabs.org>; Thu, 29 Dec 2022 18:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Exg0GTCf75Jewt9HifhKCjNMW6W3gtU72gVabjxc70Y=;
        b=lnlShbITrBJLg1+CwfIh8ncjKjiCYQ7hzafeA+c0wiUx/mHHl8XSh8VSRPDggnxYrH
         39tR7L0/10FlSrS9ea9+goXO928Lmf3erTWOF930mOIel467jMKIZFWI8IMSExGvdSQ3
         FML3D0GV2L1rwykELl03iAeSaLTabLNfqtzLvbQnOlLCz+nlwK+ALJAlFM+TeJlYAzYk
         J9yMFS+JJqNOVk8IlzKZ/uFYqLb5dbHKUz9pHGridR3tk8qJS2JTzEQCruOZzhEoE9PX
         NH507iyJBKoGK6zshUXyRYyzQyota/L+inBPdQyNRJdryDCNsYsO7TBBiVFx8lpLWDc+
         8qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Exg0GTCf75Jewt9HifhKCjNMW6W3gtU72gVabjxc70Y=;
        b=uOf0ilyNlLForCIuaO7FK0Ieemcmv6VamuU0WyzWLnB657g4rkAR3wFZZdeQitHeVb
         6pwAa/7p24r1O6HuovHw4DDYAwh0MRNR4v3ksE/V/Y9PPp/L7yGkOCu5qdSapdbz2FZ5
         k3TZ9b6kABEesUlWzjTmYhE60y6WKK9MRP/wEh9rTbAxYVgccPA+so3ae8MatWQKo2VM
         32FG9rRHxJnyn7IjHRfYiNC0qcGmBT8UkxMJDO8tpRMkmLPYupJ418VaENK0Thk714Eq
         8KdY0QUSSKv28Y3JiGui76o+RC5n2EIGKn7iUGKxlUi+OyPmReljdPOMKOOFlpq3OhUQ
         k1pQ==
X-Gm-Message-State: AFqh2kpsdT2lQpB65MgISKlivczw4Ec66S8SnrJPGQj8VV3DFdrufTJg
	Vveg2Vichdf+k08ux1sEf4bcmYZ95tFdsMgwxEz9fy6eFVSyEc24RpqGb9trKiIdyYO3ge07O2M
	Psv8121y1TDtrYZxingFHZvA=
X-Google-Smtp-Source: AMrXdXstJdtmyBWm69WthvtTgSv6W3s18dAO8hEcT4ZhauZXIzgKRa0LzvSNmUcW0zglG9vFfIWFUg==
X-Received: by 2002:a17:90a:7341:b0:225:f7b3:aebf with SMTP id j1-20020a17090a734100b00225f7b3aebfmr15592262pjs.30.1672368323825;
        Thu, 29 Dec 2022 18:45:23 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id x1-20020a654141000000b004790f514f15sm11571783pgp.22.2022.12.29.18.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 18:45:23 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add Ufispace NCPLite platform BMC
Date: Fri, 30 Dec 2022 10:45:21 +0800
Message-Id: <20221230024521.77064-1-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial device tree of Ufispace NCPLite platform which
used AST2600-based BMC.

Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
---
 arch/arm/dts/Makefile            |   1 +
 arch/arm/dts/ast2600-ncplite.dts | 215 +++++++++++++++++++++++++++++++
 2 files changed, 216 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-ncplite.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6c34b83336..20957186b4 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-dcscm.dtb \
 	ast2600-fpga.dtb \
 	ast2600-intel.dtb \
+	ast2600-ncplite.dtb \
 	ast2600-ncsi.dtb \
 	ast2600-p10bmc.dtb \
 	ast2600-pfr.dtb \
diff --git a/arch/arm/dts/ast2600-ncplite.dts b/arch/arm/dts/ast2600-ncplite.dts
new file mode 100644
index 0000000000..510c34e06b
--- /dev/null
+++ b/arch/arm/dts/ast2600-ncplite.dts
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2022 Ufispace Co., Ltd.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Ufispace NCPLite BMC";
+	compatible = "ufispace,ncplite-bmc", "aspeed,ast2600";
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
+		spi1 = &spi1;
+		spi2 = &spi2;
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
+        status = "okay";
+        phy-mode = "NC-SI";
+        use-ncsi;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_rmii3_default &pinctrl_mac3link_default>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&spi1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
+			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
+			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
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
+			&pinctrl_spi2cs2_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
+&i2c0 {
+        status = "okay";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i2c1_default>;
+};
+
+&i2c1 {
+        status = "okay";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i2c2_default>;
+};
+
+&i2c2 {
+        status = "okay";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i2c3_default>;
+};
+
+&i2c3 {
+        status = "okay";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i2c4_default>;
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
+&i2c8 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&i2c10 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c11_default>;
+};
+
+#if 0
+&fsim0 {
+	status = "okay";
+};
+
+&fsim1 {
+	status = "okay";
+};
+#endif
+
+#if 0
+&vhub {
+	status = "okay";
+};
+#endif
+
+&scu {
+	mac2-clk-delay = <0x08 0x04
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
2.39.0


-- 
******************************
This e-mail is confidential. If you are not 
the intended recipient, you must not disclose, distribute or use the 
information in it as this could be a breach of confidentiality.If you have 
received this message in error, please advise us immediately by return 
e-mail and delete the document. The address from which this message has 
been sent is strictly for business mail only and the company reserves the 
right to monitor the contents of communications and take action where and 
when it is deemed necessary.
Thank you for your co-operation.
