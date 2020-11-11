Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC82AFBB0
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 00:30:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWgtv17xDzDqvt
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 10:29:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TZZF18Li; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWglx2L3NzDqHH;
 Thu, 12 Nov 2020 10:23:56 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id m13so2522002pgl.7;
 Wed, 11 Nov 2020 15:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3B8siPBqoy9NOw638bUt0dT90coPyLNV0X2/B+nIWhw=;
 b=TZZF18LiB6b8PKG1wKr1RWLPPFjmBF0Puw0O84gbQP8HTwS5mVSZ/9dbuhTTmlsgEI
 iqHTeJo/a8ce0bYENbr7oKAKqkqIWlyx0MlEr7Cis2IMCk5XLbkc0zWDi6ddaUsNUMnC
 /0/ppXyZgeDQCAJ+xJB/Kj1B9D2+D92RKqBEK8DxTw62LKmj3T6b8kHYJxnSzuOO2GHP
 pe4Up+ZTIsD8+L/ZsortJ3S9rNRTvIFxMnzUX0p8aMF116Sxd7zO/ebXbNlXcDCN3pib
 fWlS4fEtvUChT46nP4E9/vEGKcAoujhqu3hDq925pIDQG4gCSwWZi65T7/ypQWvp/1/2
 dM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3B8siPBqoy9NOw638bUt0dT90coPyLNV0X2/B+nIWhw=;
 b=mWdSTBJkIrxUnYweszM7LuQHlmUyP5Y/0/kJuI+fdv864yFOJowQVWdGevWhbdsmC6
 CZwLJAyZTT7sClV/NXAGZ+AogDZw8RGwQcCR2KiYCtQ+iRrLwntxanT/zbWmcThZY6W2
 wC1TFRn4B0Ci2z52lk/bQGuojRhY/OZ/vbivoPF9zPZux1bGFMtaRpEp89PYuZqcK5Fg
 EvH9/8lBvIMfLPN35NtyGNQEVsGVq4mXvaFTAvLbVqPtQBbVBhYdGwlqXsG7qVxHFLs3
 1cTA3fmwu9P/jxdr0dC0ZmtKJ1mRyYRYroycfkjuyjkHfot2+3FPq88LBLUjtTQWIgin
 veeA==
X-Gm-Message-State: AOAM531tazMTBqZHhuh43zKgMuY0ob62mYz2neOj1klwKlHby8RZaAwB
 8JSRwcmw/Ywl0qo7L7ZxDrA=
X-Google-Smtp-Source: ABdhPJzXSCz0fSwlU9ctg/9/ozst9ZYw73DDH4dg6jtlfrc7nxC+dsB6D0jkvVLejD9FWscsGXPB6g==
X-Received: by 2002:a62:6496:0:b029:155:b152:f0cf with SMTP id
 y144-20020a6264960000b0290155b152f0cfmr25431894pfb.75.1605137033967; 
 Wed, 11 Nov 2020 15:23:53 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a128sm3901431pfb.195.2020.11.11.15.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 15:23:53 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 4/4] ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC
Date: Wed, 11 Nov 2020 15:23:30 -0800
Message-Id: <20201111232330.30843-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111232330.30843-1-rentao.bupt@gmail.com>
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Add initial version of device tree for Facebook Galaxy100 (AST2400) BMC.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/aspeed-bmc-facebook-galaxy100.dts     | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 21477ef5c5c9..1917cd47204a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1383,6 +1383,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
+	aspeed-bmc-facebook-galaxy100.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts
new file mode 100644
index 000000000000..dcf213472749
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+/dts-v1/;
+
+#include "ast2400-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Galaxy 100 BMC";
+	compatible = "facebook,galaxy100-bmc", "aspeed,ast2400";
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS0,9600n8 root=/dev/ram rw";
+	};
+
+	ast-adc-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 3>, <&adc 4>, <&adc 8>, <&adc 9>;
+	};
+};
+
+&wdt2 {
+	status = "okay";
+	aspeed,reset-type = "system";
+};
+
+&fmc {
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "spi0.1";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			flash1@0 {
+				reg = <0x0 0x2000000>;
+				label = "flash1";
+			};
+		};
+	};
+};
+
+
+&i2c9 {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+};
+
+&adc {
+	status = "okay";
+};
-- 
2.17.1

