Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E948FD059
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 16:03:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E4zndmvU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvTgl6SJPz30Vl
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 00:02:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E4zndmvU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvTgB1dSHz30V1
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 00:02:28 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f480624d10so19804435ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2024 07:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717596145; x=1718200945; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHE9Ir1VdEjc7u9bKfIirM3j4gCwZ3zBpx2ksCTvaIM=;
        b=E4zndmvUCQq2+yuZ8C6j3SnftqZXgO3bCWyiZKaUZXSeti5Q21CdvH/7cwr0FjFi3u
         4J7qkwVUwUrt5GLwf/atuv8XP4st8azA7lc1OxxQlRPWdx47amK0HXpV5/uIp51VEGuZ
         GUfViBidkywy8fIS2WjyaUTkAHqaDOUVoPUNxrJsJcOn/2ZYthpMgUn94ewtDcK1f9nk
         0f18UcWH086mEIX2xQFewQdVkReAl4T/CajR+ZLRphDmwRp/X65YN2+JF9FjMoDqVbvY
         c+juLCGnjeyQjtqZfqijOxKKZnghINFDnYQ76sed2ZFBlsfBEnxlXtFC7Xg6wrJx0mH2
         7FnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717596145; x=1718200945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHE9Ir1VdEjc7u9bKfIirM3j4gCwZ3zBpx2ksCTvaIM=;
        b=LHII0RQsedfvff/h+cDkfNKaSfJLDmq9YNl+IQgg4WYszq5WystcLGvsYdZnGUrXl8
         NgndnxGqOUeYOSRBGnr7Bj98dHl8JcbuEqP4llgTqJcq/HF9UT1ghvAcKvpEBIqcHanR
         5jPubMxGR2jj0BR6VDgz53QPwF/ELiWlklheQykh80vB1BJejCgXD2OBDnqqqYpC6fWE
         l9aWtFKxndphGnBjKCH+ctNdma4m251egZX2u51BYhZa9ZHbC5lO1YMmEa1r3DmjuImp
         rCNDU6s7lvl5tSvtVLWDFMMxH7RrDMM0j6YBsOwJnu+CjTIUzMZXfnq14uR49lbTloAH
         55hQ==
X-Gm-Message-State: AOJu0YwY+tubzlkUUbN+LqKrdOY9lreIvwfsHW+2tadi8swgqREeRIz5
	t5s88tY8Gz4MalGSsWnEGu9FYZ4175x0mWXhYYZZW0i9WhFW8ldMRls9iQ==
X-Google-Smtp-Source: AGHT+IFwpluK+/T1M7XLh3G/S1cmM3yhMSISMgEgYZk93Mu6JNgizQ0XfIboupJCQPMwM9tDgPRkCw==
X-Received: by 2002:a17:902:db0a:b0:1f6:7ee8:8942 with SMTP id d9443c01a7336-1f6a5a290ffmr34786455ad.40.1717596144583;
        Wed, 05 Jun 2024 07:02:24 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6677bebf5sm67567645ad.105.2024.06.05.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 07:02:24 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc v1] ARM: dts: Aspeed: Add Facebook Minerva DTS
Date: Wed,  5 Jun 2024 22:00:19 +0800
Message-Id: <20240605140019.3120566-1-peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>, yang.chen@quantatw.com
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

