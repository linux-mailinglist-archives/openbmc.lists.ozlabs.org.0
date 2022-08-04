Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999C5896C7
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 05:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lyw033tgyz305d
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 13:56:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GucmTRGu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GucmTRGu;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lyvzb6pvyz2xHh
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 13:56:25 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id l64so1226633pge.0
        for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 20:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q2LCHrH9uQa8o7TD/J6cOzIqP13UK6x5XvWl/j2kGns=;
        b=GucmTRGuZEtxArRWaYARmbugZGEO/oLAl4nMsaCZkgyvIYAZPxpWe+m5e1iYmEZrC6
         fAwfcE+qoUa4Ycjh4PpdrLofpOr2pDkGmi7QtexBXcgjMt3iPiaoua8vLpJR+mGE2anI
         uIEIQBXW0VTFxUeEFZsQKlYOE1LR91cZOvTXARKB3MR4OdthNHEYxDKMtPnQppYF9j8m
         uF4Z7Et1dGO2hNVg3YjLZRMhPUUbM/mWQ0ijFsIIfZMy2wxNdpJ0vCOXkUzvfcvmh+G0
         ZyA0ynepzeGmTToq/0JWJuKCsCfZJvYdtNPyivY7tirZFT83xQB1pBpOTLIqbMMefeVP
         8INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=q2LCHrH9uQa8o7TD/J6cOzIqP13UK6x5XvWl/j2kGns=;
        b=FYZq2b90q/LxHnRtEl50LSGjo025SbubVIxOQtGneLYwCitHxExJ987Ads34QG8ROt
         yuAXqJX9E71rXlAF23am1aRbIv2vUEq9rgCXxpunVG9CCbLlkA3BUvVoxJILIi9l2qad
         pAUzsYml9/6SC0wWH7WbchzXCCy/K1mwh86hbdEXH/FT7UYAgaw83eLYqvdgXAY326ID
         sBzydQsuCnO7Eud+lg2Ah1UuEZk7fSDfUmLHM2ShKUqFMEzg8Zzaxt3nD0vy/V5YXsOf
         EAVDF0ZggGhHEMPu31Rw3Vql0RReV5oQBl0+8EqAdrQTRnqqO0U060lcM1cCNpGkcWMI
         /PFA==
X-Gm-Message-State: ACgBeo1wEg8TI07OWVYZ0C4r32vFaL1Uv5BGkt1lDaOGVLAbKjYfA1EL
	b9w25XBBUuqBc+5G4Irbg9mIxTD1tqs=
X-Google-Smtp-Source: AA6agR6OnfQBzqvG/9WQCWh/SEjFeKVGlMaern6jh4QbIeBj9yUsaWncA9LGda95C83bMa0AdRyw9A==
X-Received: by 2002:a65:6bd3:0:b0:3fd:63c3:a84b with SMTP id e19-20020a656bd3000000b003fd63c3a84bmr35655pgw.572.1659585378417;
        Wed, 03 Aug 2022 20:56:18 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id s31-20020a63215f000000b0041c89bba5a8sm13455pgm.25.2022.08.03.20.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 20:56:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add a Romulus board (AST2500)
Date: Thu,  4 Aug 2022 13:25:04 +0930
Message-Id: <20220804035504.92900-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Romulus was the OpenPOWER reference platform for the IBM Power9,
containing an ASPEED AST2500.

It was designed by IBM and built by SuperMicro. This reference platform
was sold as the Raptor Computing Systems Tallos II.

The machine used one 32MB SPI NOR for the BMC, a second SPI NOR flash
for the host firmware, and the Broadcom BCM5719 attached via NC-SI.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/Makefile            |  1 +
 arch/arm/dts/ast2500-romulus.dts | 76 ++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 arch/arm/dts/ast2500-romulus.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index c1f24a14a615..6c34b8333634 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -679,6 +679,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-ahe-50dc.dtb \
 	ast2400-palmetto.dtb \
 	ast2500-evb.dtb \
+	ast2500-romulus.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
 	ast2600-bletchley.dtb \
diff --git a/arch/arm/dts/ast2500-romulus.dts b/arch/arm/dts/ast2500-romulus.dts
new file mode 100644
index 000000000000..726d3f54ff24
--- /dev/null
+++ b/arch/arm/dts/ast2500-romulus.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2022 IBM Corp.
+/dts-v1/;
+
+#include "ast2500-u-boot.dtsi"
+
+/ {
+	model = "Romulus BMC";
+	compatible = "ibm,romulus-bmc", "aspeed,ast2500";
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
+		spi1 = &spi1;
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
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
+&mac0 {
+	status = "okay";
+
+	phy-mode = "NC-SI";
+	use-ncsi;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&spi1 {
+	status = "okay";
+	flash@0 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_spi1_default>;
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
-- 
2.35.1

