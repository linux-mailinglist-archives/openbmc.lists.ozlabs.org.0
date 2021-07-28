Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8BC3D99A1
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 01:40:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZqrt49V7z3ckw
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 09:39:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IyUhE5fS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IyUhE5fS; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZqps6Ndfz30Lq;
 Thu, 29 Jul 2021 09:38:13 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id e21so4692406pla.5;
 Wed, 28 Jul 2021 16:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7qZeV1KbPR+zTekJvay/fjDlNWVODTnYpm5ftXBSiX8=;
 b=IyUhE5fSGwRAG9W+5YvkHW3pAmotmuv5i9TjRMHrkNhwFjt4h598ibvpPvAuKF4t+N
 WMSV30dFQsLp6YVJuCqmShLtMPPIY+Xxd4t/15JM35xDda8DwQ8qr6P0dwucUPFlU/Ay
 IlIiw0JhS1vsshJOlUv320e4YNGFSQMDpu9KJzNLFYV0d6HqxsebKZDQG70/gjjSWCyd
 Kii0EdL4wtmz7pHKCEFjBgQsszFIB5NyapZ+NMvrQJvO9Y+1r3Gm6C5VRTm6jaqnSai0
 iXJ7qahUhOyAdLrxnVoxAaqKGgyFmwRE/T13SMsLcl39BxMxlpts7OK3pLqSdafkWBS/
 +VtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7qZeV1KbPR+zTekJvay/fjDlNWVODTnYpm5ftXBSiX8=;
 b=EX+7qnE9g/tnjFcS2je2sGeSQyq+jvl34ZzfKgvOJ+BH9oG0YnvszWS0IcRa74v7Yw
 Oc6fhIf+eULN9nzRrrZDcht/R0LEkKKXNnOaknNfowjEiVuiOMoxLputMpUNAHnfOeDZ
 1eGb5T7N73x65tVW7pBX+osvP2o2nR0hbQN3oLWNZVmz9Qa6k9tAwAcruIK4vpnqf8EP
 GaaFQPBcY+VbSgmQQzkgcgjLH8p2ad2TeMLAUXjZLm5Nyg/a0EN2szJknIBkqIspX7r/
 ugTV34Eumi9aJCx8aUC2LCp4Ic3UGC7vHj8NKAzFn4aWlhT4fB+Jr81cdSof+8Jj7YTD
 ZE3Q==
X-Gm-Message-State: AOAM533xc//9GTkOVTUjEzklVul9ZFjxRgxk4mg7k/T0yJsFsqm87mi3
 CZTnKGoNwkxYoYkTNTiZTH0=
X-Google-Smtp-Source: ABdhPJwcMn/fgxsxjEYYHVzW+ZoMRGDs1Z6xZ6DQxuzs+2MTBgYzXw2OP1qbCtmnqAf62iJ4EQdDLQ==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr11968739pjv.38.1627515490942; 
 Wed, 28 Jul 2021 16:38:10 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id k37sm1038671pgm.84.2021.07.28.16.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 16:38:10 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 4/6] ARM: dts: aspeed: Add Facebook Cloudripper (AST2600) BMC
Date: Wed, 28 Jul 2021 16:37:53 -0700
Message-Id: <20210728233755.17963-5-rentao.bupt@gmail.com>
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

Add initial version of device tree for Facebook Cloudripper (AST2600) BMC.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-cloudripper.dts   | 564 ++++++++++++++++++
 2 files changed, 565 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 90aed2c2959a..74c760038f28 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1409,6 +1409,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
+	aspeed-bmc-facebook-cloudripper.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
new file mode 100644
index 000000000000..1a9808ba8107
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "ast2600-facebook-netbmc-common.dtsi"
+
+/ {
+	model = "Facebook Cloudripper BMC";
+	compatible = "facebook,cloudripper-bmc", "aspeed,ast2600";
+
+	aliases {
+		/*
+		 * PCA9548 (1-0070) provides 8 channels connecting to
+		 * SMB (Switch Main Board).
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
+		 * PCA9548 (2-0070) provides 8 channels connecting to
+		 * SCM (System Controller Module).
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
+		 * PCA9548 (3-0070) provides 8 channels connecting to
+		 * SMB (Switch Main Board).
+		 */
+		i2c32 = &imux32;
+		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
+		i2c38 = &imux38;
+		i2c39 = &imux39;
+
+		/*
+		 * PCA9548 (8-0070) provides 8 channels connecting to
+		 * PDB (Power Delivery Board).
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
+		 * PCA9548 (15-0076) provides 8 channels connecting to
+		 * FCM (Fan Controller Module).
+		 */
+		i2c48 = &imux48;
+		i2c49 = &imux49;
+		i2c50 = &imux50;
+		i2c51 = &imux51;
+		i2c52 = &imux52;
+		i2c53 = &imux53;
+		i2c54 = &imux54;
+		i2c55 = &imux55;
+	};
+
+	spi_gpio: spi-gpio {
+		num-chipselects = <2>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>,
+			   <&gpio0 ASPEED_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
+
+		eeprom@1 {
+			compatible = "atmel,at93c46d";
+			spi-max-frequency = <250000>;
+			data-size = <16>;
+			spi-cs-high;
+			reg = <1>;
+		};
+	};
+};
+
+&spi1 {
+	status = "okay";
+
+	/*
+	 * Customize spi1 flash memory size to 16MB (maximum flash size on
+	 * the bus) to save vmalloc space.
+	 */
+	reg = < 0x1e630000 0xc4
+		0x30000000 0x1000000 >;
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
+				reg = <0x0 0x1000000>;
+				label = "system-flash";
+			};
+		};
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&mdio1 {
+	status = "okay";
+};
+
+&mdio3 {
+	status = "okay";
+
+	ethphy1: ethernet-phy@13 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0d>;
+	};
+};
+
+&mac3 {
+	phy-handle = <&ethphy1>;
+};
+
+&i2c0 {
+	multi-master;
+	bus-frequency = <1000000>;
+};
+
+&i2c1 {
+	/*
+	 * PCA9548 (1-0070) provides 8 channels connecting to SMB (Switch
+	 * Main Board).
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
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
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
+	};
+};
+
+&i2c3 {
+	/*
+	 * PCA9548 (3-0070) provides 8 channels connecting to SMB (Switch
+	 * Main Board).
+	 */
+	i2c-switch@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		imux32: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux33: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux34: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux35: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux36: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux37: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux38: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux39: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c6 {
+	lp5012@14 {
+		compatible = "ti,lp5012";
+		reg = <0x14>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			color = <LED_COLOR_ID_MULTI>;
+			function = LED_FUNCTION_ACTIVITY;
+			label = "sys";
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+		};
+
+		multi-led@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			color = <LED_COLOR_ID_MULTI>;
+			function = LED_FUNCTION_ACTIVITY;
+			label = "fan";
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+		};
+
+		multi-led@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			color = <LED_COLOR_ID_MULTI>;
+			function = LED_FUNCTION_ACTIVITY;
+			label = "psu";
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+		};
+
+		multi-led@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			color = <LED_COLOR_ID_MULTI>;
+			function = LED_FUNCTION_ACTIVITY;
+			label = "scm";
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+		};
+	};
+};
+
+&i2c8 {
+	/*
+	 * PCA9548 (8-0070) provides 8 channels connecting to PDB (Power
+	 * Delivery Board).
+	 */
+	i2c-switch@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		imux40: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux41: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux42: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux43: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux44: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux45: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux46: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux47: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+
+	};
+};
+
+&i2c15 {
+	/*
+	 * PCA9548 (15-0076) provides 8 channels connecting to FCM (Fan
+	 * Controller Module).
+	 */
+	i2c-switch@76 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x76>;
+		i2c-mux-idle-disconnect;
+
+		imux48: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		imux49: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux50: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux51: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		imux52: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		imux53: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		imux54: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		imux55: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
-- 
2.17.1

