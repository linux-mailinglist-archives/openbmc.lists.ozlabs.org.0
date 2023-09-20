Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB07AA7FA
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 06:53:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HP8HkkFT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsKfS3f8Kz3cbn
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 14:53:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HP8HkkFT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr3dJ390Qz2yW2
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 13:18:11 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c364fb8a4cso59851975ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 20:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695179889; x=1695784689; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1AjQR2sMp9n/L9Qz5vjD2dxAVT1tXcFR+13ln8MuMQk=;
        b=HP8HkkFT3euhweji5hBJkL2M26Z6MnjC+NBYHczaEICCghP+7ixcNKMdAqREHqSWOa
         hGDkFrG7w7B6JSVubqXFnIU6/gnOMQrSd1aP7WEwTMmptDe5s1xkzWzrD4uL+NXmQiGX
         VtmSWAXTXN5cNJ/5nf9z0mihedokLCmWzgj6fpKetmNd7P8gIh4QPsBPBE4kwJMfOxiR
         mPD9k4g197uXQMYMA2CDInnoIbw2+djgGW2VpdfTVZw2FQ51giJ03smVkYX3PO1w7rwG
         3tz7ZG+6RJi4WVD/efXN/PjD8iqIDPCNEnt2GWNxLvjldH1yeE+pgxsyvcsAks2oLGBK
         lZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695179889; x=1695784689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AjQR2sMp9n/L9Qz5vjD2dxAVT1tXcFR+13ln8MuMQk=;
        b=Q2GiX37PW1EohiY92h9All7otDua0F99EziTSerfHGKJECGCkskcfgoGtXWWONl/VA
         l3e9a4BnB2tEXldGy8JTaEgJnIkwQKGjJMMa0AnfOBxpegNKBuqLhSOlO3+cBa1PMZ02
         1UZvV0060CdqSGtDwKjYOxmkELi2GKtgrmWV5OS10yz+3dcvBht0JORDimpFeIKITQ5C
         SkiMz8YrqoA9stWn1bjIUMkHyZYXVcYtrRUOEMvUz2LzjFBn/M4hCEVFNavXKMLCmlac
         O0J9x5uyPEj1VQhI+XMyJft+q4PSrVbj8xvu6961JI1JrRd8QTw/QWN2T8Ya8Eg/iKWz
         S2yg==
X-Gm-Message-State: AOJu0YybQpmz0/f1IV/2xRf7bWgSfH7ISbY58b+IzL/jWvgtZtrrDdZE
	vl+NK4CsMwG5htY5LFk32zgNPpTkZooRAw==
X-Google-Smtp-Source: AGHT+IG+fKe8d3hiLgnxIDI+geLz8NlUPGo97e3LDB2hV3XRZBjShzERJ1FJXeJ+OuYyG9CrBCM29g==
X-Received: by 2002:a17:902:c412:b0:1c5:b808:7fc8 with SMTP id k18-20020a170902c41200b001c5b8087fc8mr1509294plk.33.1695179888679;
        Tue, 19 Sep 2023 20:18:08 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902ed4400b001c456b3c012sm6650881plb.298.2023.09.19.20.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 20:18:08 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	patrick@stwcx.xyz,
	jamin_lin@aspeedtech.com
Subject: [PATCH v1] ARM: dts: Aspeed: Add Minerva dts
Date: Wed, 20 Sep 2023 11:16:02 +0800
Message-Id: <20230920031602.2758256-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Sep 2023 14:53:04 +1000
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
Cc: peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Minerva equipped with Aspeed 2600 BMC SoC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Change log:

v1:Initial introduction of Minerva equipped with Aspeed 2600 BMC SoC.
---
 arch/arm/dts/Makefile            |  1 +
 arch/arm/dts/ast2600-minerva.dts | 92 ++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-minerva.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 0a893baf64..215635d2f2 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -689,6 +689,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-fpga.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
+	ast2600-minerva.dtb \
 	ast2600-ncsi.dtb \
 	ast2600-p10bmc.dtb \
 	ast2600-pfr.dtb \
diff --git a/arch/arm/dts/ast2600-minerva.dts b/arch/arm/dts/ast2600-minerva.dts
new file mode 100644
index 0000000000..70715a2dad
--- /dev/null
+++ b/arch/arm/dts/ast2600-minerva.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2023 Meta Platforms Inc.
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
+		ethernet3 = &mac3;
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
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+};
+
+&fmc {
+	status = "okay";
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
+
+	flash@2 {
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

