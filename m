Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F2278D27B
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 05:19:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K+D5X+3m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rb8fz63pYz3bmP
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 13:19:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K+D5X+3m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYyKC713Vz30Db
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 14:30:23 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68becf931bfso1869354b3a.0
        for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2023 21:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693197020; x=1693801820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02Z/Cv2tfMuANlTI1w+OEAtuzLTlgxs0SBDXlQ1/UFI=;
        b=K+D5X+3mdigJGdTFEuBrRD+kvkstglZGxFRq6FLPid/i/MlVKdavNIeyek6Vty70Zs
         YDKBG1L/SrNms8liHvuQM4ECBGBWZDWk//GfZHBXn/0gEYt6ynTj4W9hx2TrNiE0Odoi
         lCRo9tdpto9ar3h6zLN1+0ZZF4YagUeP6L8NTX7JKFa8qifBOYc7i5B/1tMO6QzHzcq7
         WN8dxmvXfW7OikHTCJBdBPb+2Ibq0DmBoRDe5CqB735mq8JV1xcawvtu2g5RsjV0+leJ
         RwdeE8o3X5qndf1+FItNRLJ9ht2s0Ghk0CIMKfOTP8yKKwaZr153Iwrxd4kxtsqOSF+0
         gJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693197020; x=1693801820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02Z/Cv2tfMuANlTI1w+OEAtuzLTlgxs0SBDXlQ1/UFI=;
        b=PlRf1oQNL+BnIJuXUGrSlGiE2ZnTza+48mVbZ0+0pmO0deOnlAxEafhI9BLie9TF7u
         Hl/yJDY/+rqbsmPSs42+byP6ITa2mkBScNhobOHj4m5x7T6v+ELV3ZWK8oR35/wPI4xF
         nauqx+HmV/lMKWMsj/uk37ZNO4P9TpHmof2V7Hs1jkDpsz9SBarukN+5x76GXZukZ0P6
         JI8mYAvEdYlxE+CmVHsPKke/X1IkBsIkckFHybOx0yfEBtb8q6qKC+u5uS6VbbPzE5Po
         RGNUUmYIt3u2PBZsGIDYh/SEQWyrJogEQIwrQzqKesjnAPlmvQlYSjoG48m/EYCOLsR5
         R/HQ==
X-Gm-Message-State: AOJu0YzZQCCbwGItudOitHOXjassqadLduEQ/nNe0yt11JyumSSPA36M
	XFVk+nJ7e62B0Gfx4/z9FC64vJ/xdIo/Kg==
X-Google-Smtp-Source: AGHT+IE/IFmV7QYsghjAq13X8PFpQ+HzD3bOEcC1IBZ1+Mv9dcsnGNuM84rLTm/Xc+O6O380j19xAw==
X-Received: by 2002:a05:6a21:99a8:b0:12f:eb74:72b6 with SMTP id ve40-20020a056a2199a800b0012feb7472b6mr23918232pzb.60.1693197020609;
        Sun, 27 Aug 2023 21:30:20 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm6198379plb.245.2023.08.27.21.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 21:30:20 -0700 (PDT)
From: peteryin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	patrick@stwcx.xyz
Subject: [PATCH 2/2] Title: Add Meta OpenBMC Minerva dts in uboot.
Date: Mon, 28 Aug 2023 12:28:06 +0800
Message-Id: <20230828042806.150698-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828042806.150698-1-peteryin.openbmc@gmail.com>
References: <20230828042806.150698-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Aug 2023 13:18:35 +1000
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
Cc: peteryin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dts file for Meta OpenBMC Minerva.

Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
---
 arch/arm/dts/Makefile            |  1 +
 arch/arm/dts/ast2600-minerva.dts | 93 ++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-minerva.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 0a893baf64..d3faab78b1 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -684,6 +684,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
 	ast2600-bletchley.dtb \
+	ast2600-minerva.dtb \
 	ast2600-evb.dtb \
 	ast2600-dcscm.dtb \
 	ast2600-fpga.dtb \
diff --git a/arch/arm/dts/ast2600-minerva.dts b/arch/arm/dts/ast2600-minerva.dts
new file mode 100644
index 0000000000..2399525b24
--- /dev/null
+++ b/arch/arm/dts/ast2600-minerva.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2022 Meta Platforms Inc.
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

