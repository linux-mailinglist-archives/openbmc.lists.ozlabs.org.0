Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5E54E08A
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 14:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP1C53zBTz3053
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 22:07:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aB6SFslX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=logananth13.hcl@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aB6SFslX;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP1Bd2zb2z2yn5;
	Thu, 16 Jun 2022 22:07:19 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d5so1102380plo.12;
        Thu, 16 Jun 2022 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=T6H31ZCdGBL5atpag6fMCs68+7SLVvCrxaXjSZdvvVo=;
        b=aB6SFslXKQIq7zBsp8k4CCuCMBf6ffo5qYfEEKWkjlZwJ5K9pl8jK/OJd881+ie76t
         7N03nohPcxCY9r2NovIsZy9v4VucT6SuPdJ3X5ypNfL+mXEAx4/r3UGWbZQ2EGIvFTep
         4JGMRi4n/TCx7gU96T/G5dtiWkK30Lo3+Esrq58F8bAYKVsDBw5JU2JT8BvnaylOzyYR
         Jc3/Dni7DzvqSviTqDHyB9xSg3rHoJA7rN/+tKiG9QZM7M0QoZidoJgj8mN5aXelUjjR
         tdaVfc90RgCxVferpOOiyuFcLqMp7RC5lL/Qi2nJf9oXyDZynyoBRXMQk/P6vJtWncvA
         Cgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=T6H31ZCdGBL5atpag6fMCs68+7SLVvCrxaXjSZdvvVo=;
        b=C/oUvT4eos+hvfBpuA404iKBExtqBw5uPkiVzs7e7LWuMbJ5des9KCR00qW2S1Y3lz
         NnGjiWRHAk4VWqvmGByFqzw3RtNJKE3BmJyK5lbep7ad7mm/6J5O90o3k1Drq6FIvQoY
         llhe6PEhT+RWRSpLaiu3oVni17S83QKOqcoAtg+6Nq2lI5BY6wAFxtiL7mk3CViSnLkP
         0kfu6S5VhSuV8KRho/x8zQ9S3CMCIqCNuVEz8sYTvDoKnak+QYXnSacYEi/hc/NnbWL9
         7AtycQR9rfyXhB41c1AxAjYFZYDLhxFFEe5pIeaLv3fTK8oyvXnAVdBtxQWniJb4e52m
         POPA==
X-Gm-Message-State: AJIora9fsSkmSnCswWhYYnrThAXRWiEseagaXS+1vvhl6qrFujojnX0E
	qtag36yZAwFKXhRjuMdvu7s=
X-Google-Smtp-Source: AGRyM1tsG+fYH9oD3rP6w1aETqr+pm+KWHya+CvfarMM56WVT7Y3RC3z74gATc6mkSxtuLl5u3+6Yg==
X-Received: by 2002:a17:90b:3909:b0:1e8:46ef:d64 with SMTP id ob9-20020a17090b390900b001e846ef0d64mr4726135pjb.90.1655381236228;
        Thu, 16 Jun 2022 05:07:16 -0700 (PDT)
Received: from logan-ThinkPad-T14-Gen-1 ([59.93.9.215])
        by smtp.gmail.com with ESMTPSA id r4-20020a056a00216400b0051bc538baadsm1578163pff.184.2022.06.16.05.07.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jun 2022 05:07:15 -0700 (PDT)
From: Logananth Sundararaj <logananth13.hcl@gmail.com>
X-Google-Original-From: Logananth Sundararaj <logananth_s@hcl.com>
Date: Thu, 16 Jun 2022 17:37:07 +0530
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: aspeed: Adding Facebook Yosemite V3.5 BMC
Message-ID: <20220616120707.GA22590@logan-ThinkPad-T14-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: thangavel.k@hcl.com, garnermic@gmail.com, naveen.mosess@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Yosemite V3.5 is a facebook multi-node server
platform that host four OCP server. The BMC
in the Yosemite V3.5 platform based on AST2600 SoC.

This patch adds linux device tree entry related to
Yosemite V3.5 specific devices connected to BMC SoC.

Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>

---
--- v2 - Enabled i2c drivers.
--- v1 - Initial draft.
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-facebook-fby35.dts    | 277 ++++++++++++++++++
 2 files changed, 278 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..58add093e5fb 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1465,6 +1465,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-cloudripper.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
 	aspeed-bmc-facebook-elbert.dtb \
+	aspeed-bmc-facebook-fby35.dtb \
 	aspeed-bmc-facebook-fuji.dtb \
 	aspeed-bmc-facebook-galaxy100.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
new file mode 100644
index 000000000000..47c38c212a52
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2020 Facebook Inc.
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook fby35";
+	compatible = "facebook,fby35", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+			<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
+			<&adc1 4>, <&adc1 5>, <&adc1 6>;
+	};
+	spi_gpio: spi-gpio {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+
+};
+
+&mac3 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	no-hw-checksum;
+	use-ncsi;
+	mlx,multi-host;
+	ncsi-ctrl,start-redo-probe;
+	ncsi-ctrl,no-channel-monitor;
+	ncsi-package = <1>;
+	ncsi-channel = <1>;
+	ncsi-rexmit = <1>;
+	ncsi-timeout = <2>;
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+	/* Workaround for AST2600 A0 */
+	compatible = "snps,dw-apb-uart";
+};
+
+&wdt1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&fmc {
+	status = "okay";
+	reg = <0x1e620000 0xc4>, <0x20000000 0x8000000>;
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "spi0.1";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+		#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <100000000>;
+	};
+};
+
+&i2c0 {
+	//Host1 IPMB bus
+	status = "okay";
+	multi-master;
+	ipmb0@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c1 {
+	//Host2 IPMB bus
+	status = "okay";
+	multi-master;
+	ipmb1@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c2 {
+	//Host3 IPMB bus
+	status = "okay";
+	multi-master;
+	ipmb2@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c3 {
+	//Host1 IPMB bus
+	status = "okay";
+	multi-master;
+	ipmb3@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c4 {
+	status = "okay";
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
+};
+
+&i2c8 {
+	//NIC SENSOR TEMP
+	status = "okay";
+	tmp421@1f {
+		compatible = "ti,tmp421";
+		reg = <0x1f>;
+	};
+};
+
+&i2c9 {
+	// Debug-Card IPMB bus
+	status = "okay";
+	multi-master;
+	ipmb9@30 {
+		compatible = "ipmb-dev";
+		reg = <(0x30 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+	//FRU EEPROM
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	//INLET TEMP
+	tmp75@4e {
+		compatible = "ti,tmp75";
+		reg = <0x4e>;
+	};
+	//OUTLET TEMP
+	tmp75@4f {
+		compatible = "ti,tmp75";
+		reg = <0x4f>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&adc0 {
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default &pinctrl_adc3_default
+		&pinctrl_adc4_default &pinctrl_adc5_default
+		&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	ref_voltage = <2500>;
+	status = "okay";
+
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default>;
+};
+&ehci0 {
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
-- 
2.17.1

