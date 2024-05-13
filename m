Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67CE8C437E
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2024 16:52:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dUzuXRPC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdMrv21l0z2yvs
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 00:51:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dUzuXRPC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdMrK6Dg3z3bsj
	for <openbmc@lists.ozlabs.org>; Tue, 14 May 2024 00:51:28 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f05b669b6cso20040555ad.3
        for <openbmc@lists.ozlabs.org>; Mon, 13 May 2024 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715611881; x=1716216681; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mhW1w+aN2NTyundoqnAf6zvtpYZeD0SUOKLv6eXNvgs=;
        b=dUzuXRPCJVdAGJdIOjTgSoh3dKBuhs64K7a6QfykZnu3n7bA9CqE66BunKHh7oUxD8
         P90LN6do7Y54BlQ3lStJ86lMrlXf/1LBZJlOW/EXXZ5/EEVuHgNE6XpOds/UAtJz6gAH
         8yyfpRmrwu8Yr8TOl6qRC0sMt/sdd8qdF4axuscfbB3E0sPy2ANYXrIrF2NNeZQXvSgx
         81yVazxuGZ1Vdsz3ByxsbjXwu7Uv6tzR6ze9P3+T3dmS952ZlGcI3tN/wMhr/qa1v6r4
         t6jjOPoj5p+uKsoYH+6MA+VGf2CF70UUO7V24Dpb9dioQTNtL80O8t5tMF+L3F21Jxbk
         E/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715611881; x=1716216681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhW1w+aN2NTyundoqnAf6zvtpYZeD0SUOKLv6eXNvgs=;
        b=RJWgYNa/dNN8s12TGTIeMLb4r2ZQKubDku49Cay3UcrrR220Jy5KFHswU0l7+YTZHA
         n1iL4lwDMhJBPaZP0oNppoB09c2jh3seScE/Dvj2zkylEvCLyWh0JzjGAwoArH1J3q7I
         V9BeWHOoK143ByiRlP5fPlBTPVrLxrqslr2uHK5epaHLZT/3oe1Vjld67eBmY3oneM2m
         HY/92fAwKAOcgHEOTzq6oeFaEML/MzHfHVLulMVP7MXA/jC6eiR3Ix+1OdLnImwwRmO/
         umTSbT/CTZOOHviAam2WciRAf6S0m9o1gLrMYtv8xPSk/7HNscDfDz9b0/39KqjsJfuZ
         dxUg==
X-Gm-Message-State: AOJu0YyxFFSoCOAvtYwweahSCT5fGwkD5AWB+bhiUB78lk4P8XYb0qdJ
	I+Fk4hcLKWtfT49gVzAWA3Pj/BbGJH5FHgi7ubS7JSvHXvz4MKDwE7yJjw==
X-Google-Smtp-Source: AGHT+IEFamXoOVOmcJ2T+Qgz9WJgujG1XDt1JviGC4jNT2m6X3lxgnETY3XzNDjpd2UQNspmfJQcmw==
X-Received: by 2002:a17:902:ecc6:b0:1eb:5452:8606 with SMTP id d9443c01a7336-1ef440495a0mr121757165ad.48.1715611881304;
        Mon, 13 May 2024 07:51:21 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad7eb8sm80196005ad.90.2024.05.13.07.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 07:51:20 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts: Aspeed: Add Facebook common dts
Date: Mon, 13 May 2024 22:49:17 +0800
Message-Id: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
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
Cc: peteryin.openbmc@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Facebook common
equipped with Aspeed 2600 BMC SoC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/dts/Makefile       |  1 +
 arch/arm/dts/ast2600-fb.dts | 66 +++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-fb.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6f4b4d8a17..3740a4452d 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-dcscm.dtb \
 	ast2600-evb-ecc.dtb \
 	ast2600-evb.dtb \
+	ast2600-fb.dtb \
 	ast2600-fpga.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
diff --git a/arch/arm/dts/ast2600-fb.dts b/arch/arm/dts/ast2600-fb.dts
new file mode 100644
index 0000000000..69ff575419
--- /dev/null
+++ b/arch/arm/dts/ast2600-fb.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2023 Meta Platforms Inc.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Facebook Common BMC";
+	compatible = "facebook,common-bmc", "aspeed,ast2600";
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

