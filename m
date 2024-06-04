Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E248FAF72
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 12:00:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H26Mcn9U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtmKq2S9Qz3cWg
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 19:59:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H26Mcn9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtmKF2LpZz3cRB
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2024 19:59:28 +1000 (AEST)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3737b412ad6so23361485ab.2
        for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2024 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717495165; x=1718099965; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHE9Ir1VdEjc7u9bKfIirM3j4gCwZ3zBpx2ksCTvaIM=;
        b=H26Mcn9UVB1EadXU8CnPcTGYHS7e6l6R7uhR9fQQR/o6mJQcwr61+J34D03VlXFn4R
         26BceyUjRfMqegW55USy6o0Jz7PJ9OQmNHJ1FUe26Mh2cADtf00CZuiED4kyaWZ/BO2N
         E9WXT/kSaokMTLlvv5sm7HEihmK/gUdDXHmQm0V47xIdDZCv5KM8dqtDY9dEtEUeUfYx
         SakLMBMzHHo3hWHuVoJNaQiZBesaag1h6fg/+QQ5GTIoxQYkOR+WAOCtokI00BFfODEo
         MfcvL41/payabjw27NvlydA1jpUNTH3SzUyujdB6fChcjsg4NMETTExCuq0lq38jYMb0
         633Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717495165; x=1718099965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHE9Ir1VdEjc7u9bKfIirM3j4gCwZ3zBpx2ksCTvaIM=;
        b=OiWcF5WdcvFYk7oi9cTe7z/zbpDbVHZ/KLTTWYGR8U28/ZOSQIDVOjwsGmlLkbb4rv
         CwmSu3H/Msea2UcgPPsadqhODTCeYZaHAlCmmsseouds/5wguqWdLQ57UWfBFiEl6jHs
         1shD0on7zfPSVxYb38tPUwPZLR8XkxWnFNtV9phF2ChLStlOzb3QExIaiByvQY4eLM1v
         KiW08nCMeKqD2OYPKyOA9LNvGf/LEBwYs8VKW34M8mXFEieNtl+LHkeoC8VVOd9ILTOM
         /ywjGT99mjmbpo+tGXU6rWDBaLsJE7vvEM6DT+fkdyjeyUekYUbIDcp7E9gDk1klyd5W
         rqyQ==
X-Gm-Message-State: AOJu0YwdP2KUH9/TcekOSRiPDc3HrpCLvrbKFHLzrDEFDFOKzHoJYP2g
	O20bRZv4BbVx9xT1TxVeR/unL/zfIOv8CJeD0o6ZlPcikQ3lUMsalH0u9A==
X-Google-Smtp-Source: AGHT+IFV3F7nedbx8Ht3fMSYHJqGOZuJJOo9s7bWEMwTzr5Up/IE716pthgEXVUr5Nmd+CPNPsRh7g==
X-Received: by 2002:a05:6e02:1b03:b0:374:70ed:d765 with SMTP id e9e14a558f8ab-3748b96de39mr135238395ab.3.1717495164864;
        Tue, 04 Jun 2024 02:59:24 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c353f0b2c8sm6738558a12.2.2024.06.04.02.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:59:24 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz
Subject: [PATCH v1] ARM: dts: Aspeed: Add Facebook Minerva DTS
Date: Tue,  4 Jun 2024 17:57:20 +0800
Message-Id: <20240604095720.2902647-1-peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>, peter.yin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Facebook Minerva
equipped with Aspeed 2600 BMC SoC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/dts/Makefile            |  1 +
 arch/arm/dts/ast2600-minerva.dts | 66 ++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-minerva.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6f4b4d8a17..e1773eee97 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -690,6 +690,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
 	ast2600-intel.dtb \
+	ast2600-minerva.dtb \
 	ast2600-ncsi.dtb \
 	ast2600-p10bmc.dtb \
 	ast2600-pfr.dtb \
diff --git a/arch/arm/dts/ast2600-minerva.dts b/arch/arm/dts/ast2600-minerva.dts
new file mode 100644
index 0000000000..4f54cf7b7c
--- /dev/null
+++ b/arch/arm/dts/ast2600-minerva.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2024 Meta Platforms Inc.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Facebook Minerva BMC";
+	compatible = "facebook,minerva-bmc", "aspeed,ast2600";
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

