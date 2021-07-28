Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236253D99A7
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 01:41:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZqtC71Myz3cmp
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 09:41:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cINEqIM8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cINEqIM8; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZqpw49hqz302m;
 Thu, 29 Jul 2021 09:38:16 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id n10so4694388plf.4;
 Wed, 28 Jul 2021 16:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2EkZ3kmzIy0h/6cB+mP0+jIME5e7bENzKO4wC8rJFY4=;
 b=cINEqIM8Nussr6OWTH/CSB6dS6IvkPUxhrE4EHjidlG8W91a4p973l5UuPkuz9bWgg
 wtLzdtL9YaxcR+QS5p/7zb0B8OuumrbYgVgoatg8UYInmSCv64tSQBhwgwkLuWyKJGju
 J5IXJ78FfOD3Hy+yaNivmpbJxkjoAFRDfAODS/9gD9LbHRASBIqU/mdZg/YxA6Y3O1yI
 1uUn3O8JRER+T9gWbcVKf1rdaC6uJ7EbgTOeMhOKSPilpcP0VZaNOih+prRulNoAs3L6
 kqj3GT7iNLtvSGlp68NA2oCGbFn/E0HMrkwSyMArnZ0c7V4DWViT+8CJsFv117VSvudd
 ZXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2EkZ3kmzIy0h/6cB+mP0+jIME5e7bENzKO4wC8rJFY4=;
 b=FrSFfyW+516KNBdtfKaCmqQUvPXqcR3voACPIVWT7t7ubzXtYkIDSsfeopndBfFIPo
 SU+oTNs0qaEnufCVtDasWanEcA8rY8/DBY5fU5rvKAAdVWqFR/8DqafsQLtVCmb/WMNE
 L/uiAzSjMSJZQ3udRLiRp2mdOaf2Y/Ely3+FX3TN73+1xJUfS2Qxmot/7YTR9k2WwkzE
 7Fz2nGZagkiBr/9VQIMr2EsRSawALxGH5OEUzRCSumsEbolttx+Syvxqr4Th3B2R1GqK
 lmv7NiAyUc47IGfQiigWIAbY5ySYs4H5YW0Y8zmoLoRPeqqPwAT07X2O6DsC2LLD6bOx
 CXwQ==
X-Gm-Message-State: AOAM532UB0an+7GYI7p3AtjztbuUqgwcdVmHLewOgLjqObfKLYnMxo+J
 yqYYg2zSH5qsR/MIYtwBKtE=
X-Google-Smtp-Source: ABdhPJx7VFSJ9WSI+CIVthKTWj8BJqlO33fiZO1uDSbUJmS7lh7DQRrAwFS4RSr5fG21wiwvC1P/3Q==
X-Received: by 2002:a17:90a:5d8a:: with SMTP id
 t10mr12120334pji.6.1627515493872; 
 Wed, 28 Jul 2021 16:38:13 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id k37sm1038671pgm.84.2021.07.28.16.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 16:38:13 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 6/6] ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
Date: Wed, 28 Jul 2021 16:37:55 -0700
Message-Id: <20210728233755.17963-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210728233755.17963-1-rentao.bupt@gmail.com>
References: <20210728233755.17963-1-rentao.bupt@gmail.com>
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

Add initial version of device tree for Facebook Fuji (AST2600) BMC.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 .../arm/boot/dts/aspeed-bmc-facebook-fuji.dts | 1276 +++++++++++++++++
 2 files changed, 1277 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7cbb982a7c8b..9765e2ff5bfe 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1412,6 +1412,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-cloudripper.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
+	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
new file mode 100644
index 000000000000..382cbbcf908d
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
@@ -0,0 +1,1276 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "ast2600-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Fuji BMC";
+	compatible = "facebook,fuji-bmc", "aspeed,ast2600";
+
+	aliases {
+		/*
+		 * PCA9548 (2-0070) provides 8 channels connecting to
+		 * SCM (System Controller Module).
+		 */
+		i2c16 = &imux16;
+		i2c17 = &imux17;
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
+		i2c22 = &imux22;
+		i2c23 = &imux23;
+
+		/*
+		 * PCA9548 (8-0070) provides 8 channels connecting to
+		 * SMB (Switch Main Board).
+		 */
+		i2c24 = &imux24;
+		i2c25 = &imux25;
+		i2c26 = &imux26;
+		i2c27 = &imux27;
+		i2c28 = &imux28;
+		i2c29 = &imux29;
+		i2c30 = &imux30;
+		i2c31 = &imux31;
+
+		/*
+		 * PCA9548 (11-0077) provides 8 channels connecting to
+		 * SMB (Switch Main Board).
+		 */
+		i2c40 = &imux40;
+		i2c41 = &imux41;
+		i2c42 = &imux42;
+		i2c43 = &imux43;
+		i2c44 = &imux44;
+		i2c45 = &imux45;
+		i2c46 = &imux46;
+		i2c47 = &imux47;
+
+		/*
+		 * PCA9548 (24-0071) provides 8 channels connecting to
+		 * PDB-Left.
+		 */
+		i2c48 = &imux48;
+		i2c49 = &imux49;
+		i2c50 = &imux50;
+		i2c51 = &imux51;
+		i2c52 = &imux52;
+		i2c53 = &imux53;
+		i2c54 = &imux54;
+		i2c55 = &imux55;
+
+		/*
+		 * PCA9548 (25-0072) provides 8 channels connecting to
+		 * PDB-Right.
+		 */
+		i2c56 = &imux56;
+		i2c57 = &imux57;
+		i2c58 = &imux58;
+		i2c59 = &imux59;
+		i2c60 = &imux60;
+		i2c61 = &imux61;
+		i2c62 = &imux62;
+		i2c63 = &imux63;
+
+		/*
+		 * PCA9548 (26-0076) provides 8 channels connecting to
+		 * FCM1.
+		 */
+		i2c64 = &imux64;
+		i2c65 = &imux65;
+		i2c66 = &imux66;
+		i2c67 = &imux67;
+		i2c68 = &imux68;
+		i2c69 = &imux69;
+		i2c70 = &imux70;
+		i2c71 = &imux71;
+
+		/*
+		 * PCA9548 (27-0076) provides 8 channels connecting to
+		 * FCM2.
+		 */
+		i2c72 = &imux72;
+		i2c73 = &imux73;
+		i2c74 = &imux74;
+		i2c75 = &imux75;
+		i2c76 = &imux76;
+		i2c77 = &imux77;
+		i2c78 = &imux78;
+		i2c79 = &imux79;
+
+		/*
+		 * PCA9548 (40-0076) provides 8 channels connecting to
+		 * PIM1.
+		 */
+		i2c80 = &imux80;
+		i2c81 = &imux81;
+		i2c82 = &imux82;
+		i2c83 = &imux83;
+		i2c84 = &imux84;
+		i2c85 = &imux85;
+		i2c86 = &imux86;
+		i2c87 = &imux87;
+
+		/*
+		 * PCA9548 (41-0076) provides 8 channels connecting to
+		 * PIM2.
+		 */
+		i2c88 = &imux88;
+		i2c89 = &imux89;
+		i2c90 = &imux90;
+		i2c91 = &imux91;
+		i2c92 = &imux92;
+		i2c93 = &imux93;
+		i2c94 = &imux94;
+		i2c95 = &imux95;
+
+		/*
+		 * PCA9548 (42-0076) provides 8 channels connecting to
+		 * PIM3.
+		 */
+		i2c96 = &imux96;
+		i2c97 = &imux97;
+		i2c98 = &imux98;
+		i2c99 = &imux99;
+		i2c100 = &imux100;
+		i2c101 = &imux101;
+		i2c102 = &imux102;
+		i2c103 = &imux103;
+
+		/*
+		 * PCA9548 (43-0076) provides 8 channels connecting to
+		 * PIM4.
+		 */
+		i2c104 = &imux104;
+		i2c105 = &imux105;
+		i2c106 = &imux106;
+		i2c107 = &imux107;
+		i2c108 = &imux108;
+		i2c109 = &imux109;
+		i2c110 = &imux110;
+		i2c111 = &imux111;
+
+		/*
+		 * PCA9548 (44-0076) provides 8 channels connecting to
+		 * PIM5.
+		 */
+		i2c112 = &imux112;
+		i2c113 = &imux113;
+		i2c114 = &imux114;
+		i2c115 = &imux115;
+		i2c116 = &imux116;
+		i2c117 = &imux117;
+		i2c118 = &imux118;
+		i2c119 = &imux119;
+
+		/*
+		 * PCA9548 (45-0076) provides 8 channels connecting to
+		 * PIM6.
+		 */
+		i2c120 = &imux120;
+		i2c121 = &imux121;
+		i2c122 = &imux122;
+		i2c123 = &imux123;
+		i2c124 = &imux124;
+		i2c125 = &imux125;
+		i2c126 = &imux126;
+		i2c127 = &imux127;
+
+		/*
+		 * PCA9548 (46-0076) provides 8 channels connecting to
+		 * PIM7.
+		 */
+		i2c128 = &imux128;
+		i2c129 = &imux129;
+		i2c130 = &imux130;
+		i2c131 = &imux131;
+		i2c132 = &imux132;
+		i2c133 = &imux133;
+		i2c134 = &imux134;
+		i2c135 = &imux135;
+
+		/*
+		 * PCA9548 (47-0076) provides 8 channels connecting to
+		 * PIM8.
+		 */
+		i2c136 = &imux136;
+		i2c137 = &imux137;
+		i2c138 = &imux138;
+		i2c139 = &imux139;
+		i2c140 = &imux140;
+		i2c141 = &imux141;
+		i2c142 = &imux142;
+		i2c143 = &imux143;
+	};
+
+	spi_gpio: spi-gpio {
+		num-chipselects = <3>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>,
+			   <0>,	/* device reg=<1> does not exist */
+			   <&gpio0 ASPEED_GPIO(X, 2) GPIO_ACTIVE_HIGH>;
+
+		eeprom@2 {
+			compatible = "atmel,at93c46d";
+			spi-max-frequency = <250000>;
+			data-size = <16>;
+			spi-cs-high;
+			reg = <2>;
+		};
+	};
+};
+
+&spi1 {
+	status = "okay";
+
+	/*
+	 * Customize spi1 flash memory size to 32MB (maximum flash size on
+	 * the bus) to save vmalloc space.
+	 */
+	reg = < 0x1e630000 0xc4
+		0x30000000 0x2000000 >;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "spi1.0";
+		spi-max-frequency = <5000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			flash1@0 {
+				reg = <0x0 0x2000000>;
+				label = "system-flash";
+			};
+		};
+	};
+};
+
+&i2c0 {
+	multi-master;
+	bus-frequency = <1000000>;
+};
+
+&i2c2 {
+	/*
+	 * PCA9548 (2-0070) provides 8 channels connecting to SCM (System
+	 * Controller Module).
+	 */
+	i2c-switch@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		imux16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adm1278@10 {
+				compatible = "adi,adm1278";
+				reg = <0x10>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				shunt-resistor-micro-ohms = <1500>;
+			};
+		};
+
+		imux17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux20: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux21: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux22: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux23: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c8 {
+	/*
+	 * PCA9548 (8-0070) provides 8 channels connecting to SMB (Switch
+	 * Main Board).
+	 */
+	i2c-switch@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			i2c-switch@71 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				imux48: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux49: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux50: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+
+					lp5012@14 {
+						compatible = "ti,lp5012";
+						reg = <0x14>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						multi-led@0 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <0>;
+							color = <LED_COLOR_ID_MULTI>;
+							function = LED_FUNCTION_ACTIVITY;
+							label = "sys";
+
+							led@0 {
+								reg = <0>;
+								color = <LED_COLOR_ID_RED>;
+							};
+
+							led@1 {
+								reg = <1>;
+								color = <LED_COLOR_ID_BLUE>;
+							};
+
+							led@2 {
+								reg = <2>;
+								color = <LED_COLOR_ID_GREEN>;
+							};
+						};
+
+						multi-led@1 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <1>;
+							color = <LED_COLOR_ID_MULTI>;
+							function = LED_FUNCTION_ACTIVITY;
+							label = "fan";
+
+							led@0 {
+								reg = <0>;
+								color = <LED_COLOR_ID_RED>;
+							};
+
+							led@1 {
+								reg = <1>;
+								color = <LED_COLOR_ID_BLUE>;
+							};
+
+							led@2 {
+								reg = <2>;
+								color = <LED_COLOR_ID_GREEN>;
+							};
+						};
+
+						multi-led@2 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <2>;
+							color = <LED_COLOR_ID_MULTI>;
+							function = LED_FUNCTION_ACTIVITY;
+							label = "psu";
+
+							led@0 {
+								reg = <0>;
+								color = <LED_COLOR_ID_RED>;
+							};
+
+							led@1 {
+								reg = <1>;
+								color = <LED_COLOR_ID_BLUE>;
+							};
+
+							led@2 {
+								reg = <2>;
+								color = <LED_COLOR_ID_GREEN>;
+							};
+						};
+
+						multi-led@3 {
+							#address-cells = <1>;
+							#size-cells = <0>;
+							reg = <3>;
+							color = <LED_COLOR_ID_MULTI>;
+							function = LED_FUNCTION_ACTIVITY;
+							label = "smb";
+
+							led@0 {
+								reg = <0>;
+								color = <LED_COLOR_ID_RED>;
+							};
+
+							led@1 {
+								reg = <1>;
+								color = <LED_COLOR_ID_BLUE>;
+							};
+
+							led@2 {
+								reg = <2>;
+								color = <LED_COLOR_ID_GREEN>;
+							};
+						};
+					};
+				};
+
+				imux51: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux52: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux53: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux54: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux55: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			i2c-switch@72 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x72>;
+				i2c-mux-idle-disconnect;
+
+				imux56: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux57: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux58: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux59: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux60: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux61: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux62: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux63: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux64: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux65: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux66: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux67: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+
+					adm1278@10 {
+						compatible = "adi,adm1278";
+						reg = <0x10>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						shunt-resistor-micro-ohms = <250>;
+					};
+				};
+
+				imux68: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux69: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux70: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux71: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux72: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux73: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux74: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux75: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+
+					adm1278@10 {
+						compatible = "adi,adm1278";
+						reg = <0x10>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						shunt-resistor-micro-ohms = <250>;
+					};
+				};
+
+				imux76: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux77: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux78: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux79: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux28: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux29: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux30: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux31: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	/*
+	 * PCA9548 (11-0077) provides 8 channels connecting to SMB (Switch
+	 * Main Board).
+	 */
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+
+		imux40: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux80: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux81: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux82: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux83: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux84: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux85: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux86: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux87: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux41: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux88: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux89: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux90: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux91: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux92: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux93: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux94: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux95: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux42: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux96: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux97: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux98: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux99: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux100: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux101: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux102: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux103: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux43: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux104: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux105: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux106: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux107: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux108: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux109: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux110: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux111: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux44: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux112: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux113: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux114: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux115: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux116: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux117: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux118: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux119: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux45: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux120: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux121: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux122: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux123: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux124: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux125: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux126: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux127: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux46: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux128: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux129: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux130: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux131: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux132: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux133: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux134: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux135: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+		imux47: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+
+			i2c-switch@76 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x76>;
+				i2c-mux-idle-disconnect;
+
+				imux136: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+
+				imux137: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+
+				imux138: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+
+				imux139: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+
+				imux140: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+
+				imux141: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+
+				imux142: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+
+				imux143: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+		};
+
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&mdio1 {
+	status = "okay";
+
+	ethphy3: ethernet-phy@13 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0d>;
+	};
+};
+
+&mac3 {
+	phy-handle = <&ethphy3>;
+};
-- 
2.17.1

