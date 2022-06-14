Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6554D894
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmjp1T5zz3fBk
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:45:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T+iwGuZR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=logananthece@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T+iwGuZR;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMp643fW6z3000;
	Tue, 14 Jun 2022 22:44:11 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 31so6760179pgv.11;
        Tue, 14 Jun 2022 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=PXdAipzTvt3rG1BHsoqxaq3VWKbvzJuF2FmNeakRABE=;
        b=T+iwGuZRNX4rfLUifCpdqJ0VpD+UNZEXrRGUjSNwY0lrv3aUTGyAgzztuOoLNa4nHA
         nPDtZS4pnJMhSCpqaxNMsFpmB6LQuSxyyhoraeJ1QrP7kV7z8ssmo6LRjZSrSkEr46Bv
         twe0MlHOgMF4sLECEDO9MbB5BZ+wUmA8MSf0iNiwj4VeaiB+MjBOE7R6Vkn+ENyUgDVk
         UVTlGd9+PBuRdEK034YH7nwz2E1o570Rq3tJKn1YSOX2HMhTMqq+L58rm9j3YEjZl1H0
         Myk30MksjnjkJciY6GDueRN4AXuObe3TI6INVohLU8PtE2+nSUl3RbDwUGI8ivo/GCL2
         k8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=PXdAipzTvt3rG1BHsoqxaq3VWKbvzJuF2FmNeakRABE=;
        b=DqaLXRqQfuLw3wvwqXkHe9vSciBm0dO1jAI+ZICEagmFL5eQIKrZGXJGWdqBBsOqTf
         rQ/Hkzd1dP0MrIGo0fwUqiH0Dtbn9Bu/ukVx10LGnxS51hy4pzQS7DJjAiRyFMFlbQ9t
         Fdkl5l5d6wFDyGvvXkQijMBHbYdCAmTJ60dRxJE7k+1TbA3Tc0X+VZM+3HO4m7W8n902
         HRwzgSCJkleAwkkVnYUj1EjIbH0KOg9fRoSXmGaiqmkWSNuke2J0rQUtq8te4uMk+ggy
         3OUtVeIcyyZKmGFhjrfmT/rV3e4AzE5Or51Q9+1U8Ts3CZSPTLUEJgp4tbIf0LmhJ4CA
         pohw==
X-Gm-Message-State: AOAM531ZLyd/auL4ze68hcxMI+HQAK+ylth7uxhqsdWd3aEisNgYsLMt
	1UOIi3dWnr/2299NHpXCyhw=
X-Google-Smtp-Source: ABdhPJwLIyID9xCMHEM0wUjYmaydH10Xv6Ig9h67uxHaVM7+nA4F+oO3PVkyZTB4L1A6+HnHwHPJrw==
X-Received: by 2002:a65:4501:0:b0:3fc:4895:283b with SMTP id n1-20020a654501000000b003fc4895283bmr4455662pgq.231.1655210648517;
        Tue, 14 Jun 2022 05:44:08 -0700 (PDT)
Received: from logan-ThinkPad-T14-Gen-1 ([117.213.143.139])
        by smtp.gmail.com with ESMTPSA id n6-20020a170903110600b001624b1e1a7bsm7133046plh.250.2022.06.14.05.44.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jun 2022 05:44:08 -0700 (PDT)
From: Logananth Sundararaj <logananthece@gmail.com>
X-Google-Original-From: Logananth Sundararaj <logananth_s@hcl.com>
Date: Tue, 14 Jun 2022 18:14:00 +0530
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Adding Facebook Yosemite V3 BMC
Message-ID: <20220614124400.GA1089@logan-ThinkPad-T14-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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

The Yosemite V3 is a facebook multi-node server
platform that host four OCP server. The BMC
in the Yosemite V3 platform based on AST2600 SoC.

This patch adds linux device tree entry related to
Yosemite V3 specific devices connected to BMC SoC.

Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>
---
--- v1 - Initial draft.
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-facebook-fby35.dts    | 251 ++++++++++++++++++
 2 files changed, 252 insertions(+)
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
index 000000000000..7ddf2d442c22
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2020 Facebook Inc.
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
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
+	multi-master;
+	bus-frequency = <400000>;
+	aspeed,hw-timeout-ms = <1000>;
+	status = "okay";
+};
+
+&i2c1 {
+	multi-master;
+	bus-frequency = <400000>;
+	aspeed,hw-timeout-ms = <1000>;
+	status = "okay";
+};
+
+&i2c2 {
+	multi-master;
+	bus-frequency = <400000>;
+	aspeed,hw-timeout-ms = <1000>;
+	status = "okay";
+};
+
+&i2c3 {
+	multi-master;
+	bus-frequency = <400000>;
+	aspeed,hw-timeout-ms = <1000>;
+	status = "okay";
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
+	status = "okay";
+};
+
+&i2c9 {
+	multi-master;
+	bus-frequency = <100000>;
+	aspeed,hw-timeout-ms = <1000>;
+	status = "okay";
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

