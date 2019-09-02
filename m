Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75512A4CCF
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:29:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46M9vf00vtzDqWv
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:29:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DjYmX7pk"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46M9v517jgzDqRm
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 10:29:20 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t14so5823863plr.11
 for <openbmc@lists.ozlabs.org>; Sun, 01 Sep 2019 17:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUGL/sDDx56rfMUFQdsjRHuEUsNKQm1oITc8vkLtzkQ=;
 b=DjYmX7pk2IJ0VZ3ysgtiwECr5hu9mQv6+3kzengGjKc0FRQYXE4vl6Tztp6Bx9z8dB
 yDf+Tznncmd7AtaL2dQEQwArOoA1wsFPPy2R7w9/XJ15PKk9IGIKb6Sbv5kVxqIZRujW
 QtqfUvAxMFjezG/+VwMioQc7tfYNOnI2T8Xa/dql23dh5Bn1SMo/5jU8vr5GAgk+GO4z
 wj/flItMS1v6wcQP9A0OH0Dt11scvhhQlqzySB1AYBj3DfFHGiysUuxNKBARrRvfIiCR
 RKDKzlGKwYkt6kRF1HHVvXP8Pzox2bv1JAPsSP+ez70XzBhznwHFih0y7lcC6ZRfz5+r
 6A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kUGL/sDDx56rfMUFQdsjRHuEUsNKQm1oITc8vkLtzkQ=;
 b=ZsuZpymlAbzWw7SZzVusjIIhNMhza6Kyhia1qt5D2IICJSGYUjGgk9xUJ2D7ooVd0j
 ikygPb2e5bdHnoezuoa7iEY4qS1vbSWB5oAnYr7BhWtwcAaHbnF0gYuVOPKsRpWhS+3W
 IJkil2Ekz23DNfUyfGLtS1btpucapEDhxBAEDuBOYGaiOPU+Mw2pPIwUBsHHxeA+xvfs
 1LLKRvqRZUZukeSdEnhkUjIk2NBM+8/A7Ki9u8s3Kdw2kPEmxOaBsAsg4tVFPwicmb1Y
 IYHH1Evzou3JNf9htHRGwxr1xsfLKFEIxC1/yzGq0NaAgsyQq9FFKa5qznDaxFQgT1DF
 tqCA==
X-Gm-Message-State: APjAAAUJTBrStSs2nK5j8Lorc0mbWo3gpsVy+U0xZs+0iAq2wvMrg/VK
 wTV5KAs2CsPL+XpCcshS2Kj2zHa0/JM=
X-Google-Smtp-Source: APXvYqwNFcjFm7QICvXI917R1hORaZJLvAqQ9GgUtE0bg7CQU2pCJNnptScHxOhVZnhLJ9hhwscuiQ==
X-Received: by 2002:a17:902:2b81:: with SMTP id
 l1mr27197976plb.107.1567384157256; 
 Sun, 01 Sep 2019 17:29:17 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id e13sm27346332pfl.130.2019.09.01.17.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 17:29:16 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2] ARM: dts: aspeed: Add Tacoma machine
Date: Mon,  2 Sep 2019 09:59:11 +0930
Message-Id: <20190902002911.18717-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an AST2600 based BMC card for a Power9 system.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/Makefile                  |  1 +
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 39 +++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1b45e790e1e3..180405378b86 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1280,6 +1280,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
 	aspeed-bmc-opp-swift.dtb \
+	aspeed-bmc-opp-tacoma.dtb \
 	aspeed-bmc-opp-vesnin.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
new file mode 100644
index 000000000000..9ccd4c3db81a
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2019 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "Tacoma";
+	compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	use-ncsi;
+};
+
+&emmc {
+	status = "okay";
+};
+
+&fsim0 {
+	status = "okay";
+};
-- 
2.23.0.rc1

