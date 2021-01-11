Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 865792F279D
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 06:18:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFJkG56qLzDqQh
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 16:17:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=williethaitu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c5l4pI8V; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDphr2plKzDqWX
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 20:45:00 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id v1so7479290pjr.2
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 01:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1DJvomsi+G6XyrgNkPIrN6UA+BkX9Q7yzJ8uEEJp9i0=;
 b=c5l4pI8VgMd1wadw8yT/7O47fdmzhVkV3Aj5xjx8Wg4NePnjhiuQLAKzMfAgfPFjIK
 ubClqxN8w1H5QApnWgLn77ghEr8IEr00AGQGg6e8TjKAH85AVN4nO2bjCzSuBvo7hUQL
 l+AbBknadnfpuYoWx8++MFw1IGHSfDLo/32lTheCfBy4FyD0fUoiJRJb4aiwH+A3YF8F
 +i4r6KF726+OdTSvGNdB7i+/VbqIbwrxxTLK18ZrUEieKSon8G+ZPiKYJELsb+zYCYbt
 /g/KWfvaDB6zUaNR1heB+zOznn/PHK1BWfo63glLBLmsQo8tblVNFLyt2X57q6MShvWN
 vW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1DJvomsi+G6XyrgNkPIrN6UA+BkX9Q7yzJ8uEEJp9i0=;
 b=tiF9UQzSUqo3UtpVlEEBwlUxNKlFxe+XAR5JrsJ1hCE3GfohhW6+2PEBapGwwFFSvT
 RkpCaDvpPfgbtQvEd0kT9bNB7f+09nxfxchSAJVmGt87+mGMLGC36TJpc7ohH4r9JtQF
 qFszateqcdQKSEBOdEJ0PkvEE/+NBf6183+hd4tBhdNElWCHfXAMXkkHja77JXQG71eu
 IualCLBDYsHFbTCdno3wE/XkakL4LuO54099AFr4ZkKPiVfWXwrF3HpzK+erRZBFjWkh
 D7B65iL6l496120YyBSmn3AhOKtQrsFEivQ4VPtjZUBzWcfzQ/CEVS2R7OzN8esppUrl
 uyKg==
X-Gm-Message-State: AOAM530J4bPruRNEgKihhDCIIcJuScoVLZKBo+TPqwchShI4XNGCQGcJ
 DVWGUfqYuRF9KDYutvKBDTY=
X-Google-Smtp-Source: ABdhPJyEIokzgmeAmZvvJQtnmgYzgWZkHVhEqlu9cLpbRJWBTHHv4Hbcn4b4s97MO/1Oa1NCJzzA9w==
X-Received: by 2002:a17:90a:1050:: with SMTP id
 y16mr17399403pjd.181.1610358296467; 
 Mon, 11 Jan 2021 01:44:56 -0800 (PST)
Received: from localhost.localdomain (125-227-158-249.HINET-IP.hinet.net.
 [125.227.158.249])
 by smtp.gmail.com with ESMTPSA id mw15sm13319311pjb.34.2021.01.11.01.44.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:44:55 -0800 (PST)
From: Willie Thai <williethaitu@gmail.com>
X-Google-Original-From: Willie Thai <willie_thai@compal.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Add device tree for Liwu2 BMC
Date: Mon, 11 Jan 2021 17:42:57 +0800
Message-Id: <1610358177-3874-1-git-send-email-willie_thai@compal.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CACPK8Xd0aMcXrUD4YLWHMSz9rb7p0KKQGVCHRxFWdajGXcgLZg@mail.gmail.com>
References: <CACPK8Xd0aMcXrUD4YLWHMSz9rb7p0KKQGVCHRxFWdajGXcgLZg@mail.gmail.com>
X-Mailman-Approved-At: Tue, 12 Jan 2021 16:17:18 +1100
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
Cc: Willie Thai <willie_thai@compal.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Liwu2 is a server platform with an ASPEED AST2500 based BMC.
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts | 320 ++++++++++++++++++++++++++
 2 files changed, 321 insertions(+)
 create mode 100755 arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5a14adc..16fc64d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1354,6 +1354,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-arm-centriq2400-rep.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
+	aspeed-bmc-compal-liwu2.dts \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
new file mode 100755
index 0000000..a93af32
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "AST2500 liwu2";
+	compatible = "aspeed,ast2500";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
+	};
+
+	memory@80000000 {
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			      <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
+			      <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
+			      <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		LED_FAN0_FAULT {
+			label = "LED_FAN0_FAULT";
+			gpios = <&gpio ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		LED_FAN1_FAULT {
+			label = "LED_FAN1_FAULT";
+			gpios = <&gpio ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		LED_FAN2_FAULT {
+			label = "LED_FAN2_FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		LED_FAN3_FAULT {
+			label = "LED_FAN3_FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		LED_FAN4_FAULT {
+			label = "LED_FAN4_FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		LED_FAN5_FAULT {
+			label = "LED_FAN5_FAULT";
+			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		FP_LED_STATUS_AMBER_N {
+			label = "FP_LED_STATUS_AMBER_N";
+			gpios = <&gpio ASPEED_GPIO(S, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		REAR_ID_LED_N {
+			label = "REAR_ID_LED_N";
+			gpios = <&gpio ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <100000000>;
+	};
+};
+
+&spi2 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+&mac1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&adc {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+		pagesize = <32>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	tmp75@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};	
+
+	tmp75@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};	
+
+	tmp75@4c {
+		compatible = "ti,tmp75";
+		reg = <0x4c>;
+	};
+
+	tmp75@4d {
+		compatible = "ti,tmp75";
+		reg = <0x4d>;
+	};
+
+	vr-controller@5a {
+		compatible = "ti,tps53679";
+		reg = <0x5a>;
+	};	
+
+	vr-controller@5d {
+		compatible = "ti,tps53679";
+		reg = <0x5d>;
+	};	
+
+	vr-controller@68 {
+		compatible = "ti,tps53679";
+		reg = <0x68>;
+	};	
+
+	vr-controller@6a {
+		compatible = "ti,tps53679";
+		reg = <0x6a>;
+	};	
+	
+	vr-controller@6c {
+		compatible = "ti,tps53679";
+		reg = <0x6c>;
+	};	
+	
+	vr-controller@6e {
+		compatible = "ti,tps53679";
+		reg = <0x6e>;
+	};	
+
+};
+
+&i2c4 {
+	status = "okay";
+
+	eeprom@51 {
+        compatible = "atmel,24c64";
+        reg = <0x51>;
+        pagesize = <32>;
+    };
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+	
+	power-supply@58 {
+		compatible = "pmbus";
+		reg = <0x58>;
+	};
+
+	power-supply@59 {
+		compatible = "pmbus";
+		reg = <0x59>;
+	};
+};
+
+
+&sdmmc {
+	status = "okay";
+};
+
+&sdhci0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd1_default>;
+};
+
+&vhub {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
+
+&gfx {
+     status = "okay";
+     memory-region = <&gfx_memory>;
+};
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+		&pinctrl_pwm2_default &pinctrl_pwm3_default
+		&pinctrl_pwm4_default &pinctrl_pwm5_default
+		&pinctrl_pwm6_default &pinctrl_pwm7_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
+	};
+
+	fan@4 {
+		reg = <0x04>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x08 0x09>;
+	};
+
+	fan@5 {
+		reg = <0x05>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0a 0x0b>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0c 0x0d>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x0e 0x0f>;
+	};
+
+};
+
-- 
2.7.4

