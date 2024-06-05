Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0B8FD040
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 15:56:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fq5hP21w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvTXV69y7z3cLk
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 23:56:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fq5hP21w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvTWw1bXcz30T2
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 23:56:10 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3738690172eso9688645ab.1
        for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2024 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717595766; x=1718200566; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=omvI6IskRNBuQolEKGMXp/sPMoYEQXkocUdUGaQv1zg=;
        b=fq5hP21wpWCwPxtTTpjrX0VT5+lbPf2XtqKREPNzQ1OURFFKrxw6RbFCvTdCoV49H6
         BlTByD4yg3prKlZTMhEy8qhcKyYFQY61O6UZA3cTcoLWdlqiK/lsfeJOEyjT2i341f1R
         NvvqNipNcZpsUQWZUGnlQBpFLODjYxKm4IeEtM1pdKbXm2uM1CymQI8M+EjsOmOu345V
         wlwhUSYXlJG6rF6o/cWXkuCeHNHGK0MAgEm+bgBPIe3dlSh6oW0Ss/AM5F1rVRsxQlpV
         AqrJAicD8judAxDnPcxenaMPcdh2XScoYLf+V5Simb6nS6VksHAE/wV4hPzr9CM3fmzE
         Lywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717595766; x=1718200566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omvI6IskRNBuQolEKGMXp/sPMoYEQXkocUdUGaQv1zg=;
        b=Uf/GAYB0IGXPi7xAIK70O9KtxhRQZ2xf7yMKznpdUdyMiBnWMhQS2OanALmIhrWkN2
         PKl2gonz+y60abtvtetBLOO7CWg44LAzqlpekBcxh6b0wtnEm5bgm9N1c1SNfucCQxe4
         qLqfORc3T1JVy+ckVW6yBuweFz391plVh/gF3tvyVRkyDDMauQtTFYWVO5ZtopR8teoQ
         PEi3DIEDyUVI4lGuS//Lef9UaDkjJAXXPZdogtzof13JX5a0hWCrEkbWAtPHlT5N2Lne
         /rMYaIECf2Toi8NX8CZxoWTzTaSfJPNUwsBLJ7XI95xgPYpdaw17PUYlOEAw3aV01qTo
         pHzg==
X-Gm-Message-State: AOJu0YyW3uE3oXMsbV53MztcRVj4s2IM+yUHcB3fZe1THwKjm4pCRtIf
	YNi/sZMHgHlU7nLvJoj+zgLjypbHn0NudJBmpw+PD34nCF4qP17mVJT/hA==
X-Google-Smtp-Source: AGHT+IHRnEob6gd2ynxZYmB88Ms02V1x879eRtEnchOZL/7ZHw4hCJO/pIqvw/kXybe7tY2yN9jHrg==
X-Received: by 2002:a05:6e02:174a:b0:374:9c39:18dc with SMTP id e9e14a558f8ab-374b1f5a105mr24961225ab.30.1717595766416;
        Wed, 05 Jun 2024 06:56:06 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6d31987e4acsm2602197a12.83.2024.06.05.06.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 06:56:06 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc v2] ARM: dts: Aspeed: Add Facebook Harma DTS
Date: Wed,  5 Jun 2024 21:54:01 +0800
Message-Id: <20240605135401.3119532-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Facebook Harma
equipped with Aspeed 2600 BMC SoC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Change log:
v1 -> v2
 - Revise common to harma

v1
 - Create facebook common dts
---
 arch/arm/dts/Makefile          |  1 +
 arch/arm/dts/ast2600-harma.dts | 66 ++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-harma.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6f4b4d8a17..cb96c0a673 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -688,6 +688,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-evb.dtb \
 	ast2600-fpga.dtb \
 	ast2600-greatlakes.dtb \
+	ast2600-harma.dtb \
 	ast2600-intel.dtb \
 	ast2600-intel.dtb \
 	ast2600-ncsi.dtb \
diff --git a/arch/arm/dts/ast2600-harma.dts b/arch/arm/dts/ast2600-harma.dts
new file mode 100644
index 0000000000..11d6d5d60c
--- /dev/null
+++ b/arch/arm/dts/ast2600-harma.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2024 Meta Platforms Inc.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Facebook Harma BMC";
+	compatible = "facebook,harma-bmc", "aspeed,ast2600";
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
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&hace {
+	status = "okay";
+};
-- 
2.25.1

