Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EFD775E7E
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 14:08:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IwfCQoZl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLTNs4K4Mz30MY
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 22:08:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IwfCQoZl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLTNG1Y07z2yLV
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 22:08:12 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bbc87ded50so43670595ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691582887; x=1692187687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I1os3mVEJ6i7cy6qnQDdxLVQDpjq3uxF25As53HuKag=;
        b=IwfCQoZlTMny3HO8Bjo70YtmXTYB7Zw+aDWPehiAFFdp9MPHgFq1uYh2CYWcmWkyOk
         TnlONrY+CgV5jV8o2Hw1EuuzhlPwSNkQeex7T14R4/1OqNILmSckGaslNPouBbjDwJBx
         i6jsywu2jATIQIMeNeSdyhxM08HOEwA5E8e99bXiudeiCKXDgbibcx5rPmeO+cWF33rT
         +nnm/yRJz+45XN266aka+rlv8G0/Fin1odyBOw/pFf/pOVAw4vAlx4xNvxu3ZJniNJSB
         KdMvfSd+O0DrH3Wv8u6TngNFhhAz/OVyAuaZqYppuYW8NMopSjJaNcC7fGVfXB6oU+Dz
         5Sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582887; x=1692187687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1os3mVEJ6i7cy6qnQDdxLVQDpjq3uxF25As53HuKag=;
        b=W6grsPsp/ktw4hmCcOXPQAeUSq2ZBnwkm9Gk1I421Jwmv/MzfGS3XYdTOVo8JvT5H5
         /S4zkYYMiA5SUT5sRvePJlEGJ9wtkI8pMK0vfDPVjk6ArGWStlBdFs97rSQ/9km+4S2/
         a7YYJDdpekFOsmsuzUkLXD9RPzL77gUxMe+oadKjHWkg+6wXg/ZyXG6DLeFF3M6X37ff
         8WlaJR7XQexXe1vnFYTjulx9ZZR4X0hvpaUnLE/nH8QCH98miUrWRoBce6660POivUrf
         ARqxZ5DDN0lxOprJ5p64N1CF0d241vx2LFKnsxT5j9Gl+sWDnXImqXAtJQWsiGoEuypQ
         Y9oA==
X-Gm-Message-State: AOJu0YwfdzoPqC+/8j3WwmG2GKB5VYLgt8tqNFIiqdEdAjiJ9kXR4srR
	U0292NHmxds382AxGuzX1DR2s/1IfCY=
X-Google-Smtp-Source: AGHT+IHcgIOTC7Y3xK8Txi35f/Wvfa2jQPQWfE5jmcIm8btRBpHT9JKwRhc9wwU5NJO5zYyi2VyGWw==
X-Received: by 2002:a17:903:124c:b0:1b0:3df7:5992 with SMTP id u12-20020a170903124c00b001b03df75992mr2293560plh.32.1691582887256;
        Wed, 09 Aug 2023 05:08:07 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id t15-20020a170902b20f00b001b9cb27e07dsm10997968plr.45.2023.08.09.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 05:08:06 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add Witherspoon (AST2500)
Date: Wed,  9 Aug 2023 21:37:59 +0930
Message-Id: <20230809120759.133556-1-joel@jms.id.au>
X-Mailer: git-send-email 2.40.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Witherspoon was the launch machine for the IBM Power9, containing an
ASPEED AST2500.

Notably it was the compute node for the Summit supercomputer, which
occupied the #1 position in the top500 list.

The machine used two 32MB SPI NOR for the BMC, with a SPI NOR flash
for the host firmware, and the Broadcom BCM5719 attached via NC-SI.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/Makefile                |  1 +
 arch/arm/dts/ast2500-witherspoon.dts | 84 ++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 arch/arm/dts/ast2500-witherspoon.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 37675a327736..d6ba78fa4afa 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -681,6 +681,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2500-evb.dtb \
 	ast2500-genesis3.dtb \
 	ast2500-romulus.dtb \
+	ast2500-witherspoon.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
 	ast2600-bletchley.dtb \
diff --git a/arch/arm/dts/ast2500-witherspoon.dts b/arch/arm/dts/ast2500-witherspoon.dts
new file mode 100644
index 000000000000..2bc02a14b8f9
--- /dev/null
+++ b/arch/arm/dts/ast2500-witherspoon.dts
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2022 IBM Corp.
+/dts-v1/;
+
+#include "ast2500-u-boot.dtsi"
+
+/ {
+	model = "Witherspoon BMC";
+	compatible = "ibm,witherspoon-bmc", "aspeed,ast2500";
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
2.40.1

