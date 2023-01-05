Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B9465E94E
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 11:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnjsD30HPz3c6R
	for <lists+openbmc@lfdr.de>; Thu,  5 Jan 2023 21:49:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=qXs6D14z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=qXs6D14z;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnjrZ6tn3z2yZd
	for <openbmc@lists.ozlabs.org>; Thu,  5 Jan 2023 21:49:00 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id g20so16788133pfb.3
        for <openbmc@lists.ozlabs.org>; Thu, 05 Jan 2023 02:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oh8VdBz07vONuTuQIgVQLyhWCwo9uit7IsoCa2gHjgc=;
        b=qXs6D14zvvfxc6oaax+ierAX4q7mUbc2d090CEzWejRG7ZB0yj7hiYCf+9ng3J/689
         XGaYwxMDPrYfeIEUcjrIO8c0mRHUuWSONuxmh3oLqYAbus6G3SD37ZyHE8bXsKkEGVLO
         sLq+Y8eUzyJDtWhlzpSL40A2uMz9fXMeF3N2vcnWYAi2TZAQtYGLQyOAt3ITX0Em6t8s
         mdQyRdM5GDn5+7bqiWrVHpdM2wPVhTjJFa89n+LkvhAM5EU4nJUif+PrBMXAKj2+Z2qP
         0OlIsufRnl7woYNkfR4PmO5vGLhxqxLmFhA+YR0vqWZrdL2LS4F6LkA964voo0TmfDvM
         1N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oh8VdBz07vONuTuQIgVQLyhWCwo9uit7IsoCa2gHjgc=;
        b=okEu6ZVNDHAPCXWQPdfPw67JgHs/0J0b00BSvaqYAFGbkhXE68WgXGglCaKkX/9H4a
         Ixb6cUJIkF8rKtNUJ86kuCktWNB8EJhlAQlKgkSIrYP8RF8vfwE5aRtz3ivwbndtyFHf
         oV2bV91IvoGvQ/acG34gLtqiAPqIppV+5uUIO0o2R/6/MgD1vxnmItUrX2uSDZ+kqlJQ
         6Ig1sd/zasV3glBS9+yTFCvbju4veUSHbboTmmnxfvUc7Ei9m56850AzATMTfMkOuIEv
         OGXNTFCqZorMKLB4rShebb3KUdBgYhA16Jb63eGPN6ZF2GtHFAnelh3J/jXG4Vvc+OKM
         Wjzg==
X-Gm-Message-State: AFqh2ko4QgbUoSiBhZkQi7fvNjgY4No/R4QpWk6h4auZkKckgI90NZN9
	fL+GubIcpCXL9smwYil3QR7RspfZJjkEkevrjn9S7ZK/WzoLXGT9T5kP1nuEL+Rs+yZhgGW9x1z
	Oodzj85MKIAwVTxKpgGqjG4o=
X-Google-Smtp-Source: AMrXdXtf9BwCveq8/h6RsQtrzrwzylZmQOyXJkTKfGg/ZDSCIbuBRNvH2tYOTS0O16mPvhoj2zzUIA==
X-Received: by 2002:aa7:9147:0:b0:56c:318a:f83b with SMTP id 7-20020aa79147000000b0056c318af83bmr59387820pfi.13.1672915737182;
        Thu, 05 Jan 2023 02:48:57 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id b27-20020aa78edb000000b0056b9ec7e2desm24236627pfr.125.2023.01.05.02.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 02:48:56 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: Add Ufispace NCPLite platform BMC
Date: Thu,  5 Jan 2023 18:48:53 +0800
Message-Id: <20230105104853.62360-1-jordan.chang@ufispace.com>
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

Add initial device tree of Ufispace NCPLite platform which uses
AST2600-based BMC.

Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
---
 arch/arm/dts/Makefile            |   1 +
 arch/arm/dts/ast2600-ncplite.dts | 148 +++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)
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
index 0000000000..54ee177bfd
--- /dev/null
+++ b/arch/arm/dts/ast2600-ncplite.dts
@@ -0,0 +1,148 @@
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
