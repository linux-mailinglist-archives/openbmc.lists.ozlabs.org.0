Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CDD2AFBA5
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 00:26:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWgpk4zgqzDqsZ
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 10:26:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XNDDuBEQ; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWglv0GqWzDqsZ;
 Thu, 12 Nov 2020 10:23:54 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id d17so270319plr.5;
 Wed, 11 Nov 2020 15:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MW5X8Ll2JhETf4+ug/bVFsXNI7M19MuHlME7/bl5UmU=;
 b=XNDDuBEQWCdL7ehrCtLL9MwLE0+4qdUXIXWOdwLPALUgwiTmzHC6e+cBPJ0SYsJ9wO
 iZREhUmjxK2KZ+YOYwtOFLWwpKHjkAtDdXdDniQyrTFYbasEU0nd4WjnrpTnzdOPNcjy
 h6ZPQ/FRMloM7Pxt6JRsVK2JWJWUE9InUYw/5+jCIWMmfU48Qt6u86FGlyPEqpfg/BQo
 j0qJnzHOeosNN73wMOZjrXqXQBgp34zU3Tk+VdjMZIsysDNjJ5wMky5Onx3k5m1hFU+i
 OltNoE7k0n90eB7m62oLeT2GEsSUq0Xw+PeQJrrN6TooOD0QSC9U9dnOpXReyKjJUBsd
 JGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MW5X8Ll2JhETf4+ug/bVFsXNI7M19MuHlME7/bl5UmU=;
 b=Ie0vUw2sjHO6dQFiPlY8Dokj+sW8XioCX9xFPZ0KkGA0vpp59G+KHDyxefqDPjyHY4
 /9GBMp+UIGyFEV0PQNissxP/484D7Trjb06Z5KRie+QdayNk+Ho3LYAr5n0HiAvLtoXT
 Cc3HRhiINe5ND2fJt/kToN1ss4WNB/MbV08lD6ctzSpniiognbifm+zESjlE3oOA25L/
 iZZd2YoD6Gjr/MlOaVcRdFzAsUa+utZ9gR8tmJshUyj3Ja0/rY8wuEf4AGHMN+RL0DQ8
 OZSfTSeev/5U+rx9ed3e3o5jwPhxypj9Qb4WucLqGpRqS625ZwQ8JpA5joO7Siaajlau
 1Wfw==
X-Gm-Message-State: AOAM530TE6za9s/cH1SYa8PJ4L1ftDB77cPJYuiarbqQkUgB/wes1EyF
 WsOrKVG1s2HId330jlc8/5A=
X-Google-Smtp-Source: ABdhPJyGqjMWGPlLfIn0X4jMQxKAX1+rKJqgTIjpJUpE+FnEIxMy7E2037uO5ew8oEfGzGFL6YWlSw==
X-Received: by 2002:a17:902:7402:b029:d6:8558:7920 with SMTP id
 g2-20020a1709027402b02900d685587920mr22805813pll.8.1605137032352; 
 Wed, 11 Nov 2020 15:23:52 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a128sm3901431pfb.195.2020.11.11.15.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 15:23:51 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 3/4] ARM: dts: aspeed: wedge100: Use common dtsi
Date: Wed, 11 Nov 2020 15:23:29 -0800
Message-Id: <20201111232330.30843-4-rentao.bupt@gmail.com>
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

Simplify the Wedge100 device tree by using the common dtsi.

In addition this enables the second firmware flash, and turns on the
"i2c-mux-idle-disconnect" flag for I2C switch 7-0070.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed-bmc-facebook-wedge100.dts | 120 +++---------------
 1 file changed, 15 insertions(+), 105 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
index 322587b7b67d..39c6be91d53f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
@@ -2,36 +2,16 @@
 // Copyright (c) 2018 Facebook Inc.
 /dts-v1/;
 
-#include "aspeed-g4.dtsi"
+#include "ast2400-facebook-netbmc-common.dtsi"
 
 / {
 	model = "Facebook Wedge 100 BMC";
 	compatible = "facebook,wedge100-bmc", "aspeed,ast2400";
 
-	aliases {
-		/*
-		 * Override the default uart aliases to avoid breaking
-		 * the legacy applications.
-		 */
-		serial0 = &uart5;
-		serial1 = &uart1;
-		serial2 = &uart3;
-		serial3 = &uart4;
-	};
-
 	chosen {
 		stdout-path = &uart3;
 		bootargs = "console=ttyS2,9600n8 root=/dev/ram rw";
 	};
-
-	memory@40000000 {
-		reg = <0x40000000 0x20000000>;
-	};
-};
-
-&wdt1 {
-	status = "okay";
-	aspeed,reset-type = "system";
 };
 
 &wdt2 {
@@ -40,108 +20,38 @@
 };
 
 &fmc {
-	status = "okay";
-	flash@0 {
+	flash@1 {
 		status = "okay";
 		m25p,fast-read;
-		label = "fmc0";
-#include "facebook-bmc-flash-layout.dtsi"
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
 	};
 };
 
-&uart1 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd1_default
-		     &pinctrl_rxd1_default>;
-};
-
-&uart3 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd3_default
-		     &pinctrl_rxd3_default>;
-};
-
-&uart4 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd4_default
-		     &pinctrl_rxd4_default>;
-};
-
-&uart5 {
-	status = "okay";
-};
-
-&mac1 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
-};
-
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&i2c3 {
-	status = "okay";
-};
-
-&i2c4 {
-	status = "okay";
-};
-
-&i2c5 {
-	status = "okay";
-};
-
-&i2c6 {
-	status = "okay";
-};
-
 &i2c7 {
-	status = "okay";
-
 	i2c-switch@70 {
 		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x70>;
+		i2c-mux-idle-disconnect;
 	};
 };
 
-&i2c8 {
-	status = "okay";
-};
-
 &i2c9 {
 	status = "okay";
 };
 
-&i2c10 {
-	status = "okay";
-};
-
-&i2c11 {
-	status = "okay";
-};
-
-&i2c12 {
-	status = "okay";
-};
-
-&i2c13 {
-	status = "okay";
-};
 
 &vhub {
 	status = "okay";
-- 
2.17.1

