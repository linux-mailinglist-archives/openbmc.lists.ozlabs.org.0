Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3046671194
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 04:13:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxW6c6pPrz3c96
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 14:13:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gNHcJkCg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gNHcJkCg;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxW6154YSz3c4x
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 14:12:39 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id hw16so68207922ejc.10
        for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2023 19:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q7zslPX1ahY6GiRJvHnZ6WgySahDyZTIUxJSmXnVOsQ=;
        b=gNHcJkCgR10f1hgKG1VYhoIImpuep5pA91qzKAjOp6vvVECiNmplytiDnxnbYs0Y/l
         n5amrYtXUGlInETsVFg/U8xrjn3hk+ZjROdV7yefw6IDmj2YxPk8ukm3oGh9G3xIUc/Q
         WoK53tv+s4J0FkUp5PO4aOgXmSUOQftkEQ/Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7zslPX1ahY6GiRJvHnZ6WgySahDyZTIUxJSmXnVOsQ=;
        b=bocdVRNvM9TAl8NJk6GHcVyBAwOmBfoYGYPzxmOU2f+qOpC1KB8ZneRt3Yf/3VLBg/
         CM5jnrnlRvUMQiEl4bfGfGYk0f882o1RHldhoSA+OJOv+7mV2QnNHUUXMZCcp0y2wMBE
         ZrjkWk7r42iRCaxqhDmNO+0Dw4h9QE42IE9UIYiTu3uQIUoEsVcbDV4rkCNka0gRZEeB
         KsrOUB7wgR1pqjM9o9NcXR1gffVodYvwkLq4lRsxI8EjYwjvJ0RyvFQnbheOlYj6P4Wt
         8WT0WZ+YmpbbePiUsrwfsXdIjHtwk/uylCFrQpbyWXcBZJ8KDAcBT+nGA3kI0Ti+MsMd
         iA/Q==
X-Gm-Message-State: AFqh2krMvVqUo3xw+oWDUpeGKLdXNEU4E9nF2p1eJDAHf4bcUynhhE5d
	q+mFO2aSbKtdeqTPZZPcG5PhFQH2fbFd6UDKI5UIWLv6cL8=
X-Google-Smtp-Source: AMrXdXtw+GaflxNLDppkKYaViSxZB3jPi2z980Ifyw9p/CUtQ2J/yKYxIByjTgImj8xaRLWSMzDPP+iOQjJqNDWV7kI=
X-Received: by 2002:a17:906:3b85:b0:7c1:4665:9684 with SMTP id
 u5-20020a1709063b8500b007c146659684mr702057ejf.23.1674011555502; Tue, 17 Jan
 2023 19:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20230105111240.62880-1-jordan.chang@ufispace.com>
In-Reply-To: <20230105111240.62880-1-jordan.chang@ufispace.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 03:12:23 +0000
Message-ID: <CACPK8XeSE7g2YuFav+8xYWvpabGpTWAOz-nS4ZHxam_8-gkMsQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0] ARM: dts: aspeed: Add device tree for
 Ufispace NCPLite BMC
To: Jordan Chang <jordan.chang@ufispace.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Jordan,

On Thu, 5 Jan 2023 at 11:12, Jordan Chang <jordan.chang@ufispace.com> wrote:
>
> Add initial version of device tree for Ufispace NCPlite platform
> which is equipped with AST2600-based BMC.
>
> Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>

There's a few things that need fixing with your patch:

ERROR: code indent should use tabs where possible

WARNING: please, no spaces at the start of a line

WARNING: DT compatible string "ufispace,ncplite-bmc" appears
un-documented -- check ./Documentation/devicetree/bindings/
#46: FILE: arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts:11:
+    compatible = "ufispace,ncplite-bmc", "aspeed,ast2600";

WARNING: DT compatible string vendor "ufispace" appears un-documented
-- check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
#46: FILE: arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts:11:
+    compatible = "ufispace,ncplite-bmc", "aspeed,ast2600";

Ignore the warning about 100 columns for the gpio description, that
can be left as it is. You can also ignore the warning about
MAINTAINERS, this file is covered by an existing maintainers rule.

Please fix these issues and re-run scripts/checkpatch.pl. When you
resubmit, send to the upstream lists (linux-arm-kernel) and I will
merge into the aspeed tree, as well as backport to openbmc.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-ufispace-ncplite.dts  | 360 ++++++++++++++++++
>  2 files changed, 361 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 2ee9c043218b..d26e0651e805 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1626,6 +1626,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-inventec-transformers.dtb \
>         aspeed-bmc-tyan-s7106.dtb \
>         aspeed-bmc-tyan-s8036.dtb \
> +       aspeed-bmc-ufispace-ncplite.dtb \
>         aspeed-bmc-vegman-n110.dtb \
>         aspeed-bmc-vegman-rx20.dtb \
>         aspeed-bmc-vegman-sx20.dtb
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts b/arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts
> new file mode 100644
> index 000000000000..43e5d8901b04
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts
> @@ -0,0 +1,360 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2022 Ufispace Co., Ltd.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Ufispace NCPLite BMC";
> +       compatible = "ufispace,ncplite-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200n8 earlycon";
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x80000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +                              <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +                              <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +                              <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               fan-status-int-l {
> +                        label = "fan-status-int-l";
> +                        gpios = <&gpio0 ASPEED_GPIO(M, 2) GPIO_ACTIVE_LOW>;
> +                        linux,code = <ASPEED_GPIO(M, 2)>;
> +                };
> +
> +                allpwr-good {
> +                        label = "allpwr-good";
> +                        gpios = <&gpio0 ASPEED_GPIO(V, 4) GPIO_ACTIVE_HIGH>;
> +                        linux,code = <ASPEED_GPIO(V, 4)>;
> +                };
> +
> +                psu0-alert-n {
> +                        label = "psu0-alert-n";
> +                        gpios = <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_LOW>;
> +                        linux,code = <ASPEED_GPIO(V, 1)>;
> +                };
> +
> +                psu1-alert-n {
> +                        label = "psu1-alert-n";
> +                        gpios = <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> +                        linux,code = <ASPEED_GPIO(V, 2)>;
> +                };
> +
> +                int-thermal-alert {
> +                        label = "int-thermal-alert";
> +                        gpios = <&gpio0 ASPEED_GPIO(P, 2) GPIO_ACTIVE_LOW>;
> +                        linux,code = <ASPEED_GPIO(P, 2)>;
> +                };
> +
> +                cpu-caterr-l {
> +                        label = "cpu-caterr-l";
> +                        gpios = <&gpio0 ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
> +                        linux,code = <ASPEED_GPIO(N, 3)>;
> +                };
> +
> +                cpu-thermtrip-l {
> +                        label = "cpu-thermtrip-l";
> +                        gpios = <&gpio0 ASPEED_GPIO(V, 5) GPIO_ACTIVE_LOW>;
> +                        linux,code = <ASPEED_GPIO(V, 5)>;
> +                };
> +
> +                psu0-presence-l {
> +                        label = "psu0-presence-l";
> +                        gpios = <&gpio0 ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
> +                        linux,code = <ASPEED_GPIO(F, 6)>;
> +                };
> +
> +                psu1-presence-l {
> +                        label = "psu1-presence-l";
> +                        gpios = <&gpio0 ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW>;
> +                        linux,code = <ASPEED_GPIO(F, 7)>;
> +                };
> +
> +                psu0-power-ok {
> +                        label = "psu0-power-ok";
> +                        gpios = <&gpio0 ASPEED_GPIO(M, 4) GPIO_ACTIVE_HIGH>;
> +                        linux,code = <ASPEED_GPIO(M, 4)>;
> +                };
> +
> +                psu1-power-ok {
> +                        label = "psu1-power-ok";
> +                        gpios = <&gpio0 ASPEED_GPIO(M, 5) GPIO_ACTIVE_HIGH>;
> +                        linux,code = <ASPEED_GPIO(M, 5)>;
> +                };
> +       };
> +
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               poll-interval = <1000>;
> +
> +               fan0-presence {
> +                       label = "fan0-presence";
> +                       gpios = <&fan_ioexp 2 GPIO_ACTIVE_LOW>;
> +                       linux,code = <2>;
> +               };
> +
> +               fan1-presence {
> +                       label = "fan1-presence";
> +                       gpios = <&fan_ioexp 6 GPIO_ACTIVE_LOW>;
> +                       linux,code = <6>;
> +               };
> +
> +               fan2-presence {
> +                       label = "fan2-presence";
> +                       gpios = <&fan_ioexp 10 GPIO_ACTIVE_LOW>;
> +                       linux,code = <10>;
> +               };
> +
> +               fan3-presence {
> +                       label = "fan3-presence";
> +                       gpios = <&fan_ioexp 14 GPIO_ACTIVE_LOW>;
> +                       linux,code = <14>;
> +               };
> +       };
> +};
> +
> +&mac2 {
> +       status = "okay";
> +       use-ncsi;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii3_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
> +                <&syscon ASPEED_CLK_MAC3RCLK>;
> +       clock-names = "MACCLK", "RCLK";
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +       };
> +
> +       flash@1 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "alt-bmc";
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64-alt.dtsi"
> +       };
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&uart4 {
> +       status = "okay";
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&kcs3 {
> +        status = "okay";
> +        aspeed,lpc-io-reg = <0xca2>;
> +};
> +
> +&lpc_reset {
> +       status = "okay";
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +};
> +
> +&uart_routing {
> +       status = "okay";
> +};
> +
> +&wdt1 {
> +       status = "okay";
> +};
> +
> +&wdt2 {
> +       status = "okay";
> +};
> +
> +&peci0 {
> +       status = "okay";
> +};
> +
> +&udc {
> +        status = "okay";
> +};
> +
> +&adc0 {
> +        vref = <2500>;
> +        status = "okay";
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +                &pinctrl_adc2_default &pinctrl_adc3_default
> +                &pinctrl_adc4_default &pinctrl_adc5_default
> +                &pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +        vref = <2500>;
> +        status = "okay";
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +                &pinctrl_adc10_default &pinctrl_adc11_default
> +                &pinctrl_adc12_default &pinctrl_adc13_default
> +                &pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +        lm75@48 {
> +                compatible = "national,lm75";
> +                reg = <0x48>;
> +        };
> +
> +        lm75@49 {
> +                compatible = "national,lm75";
> +                reg = <0x49>;
> +        };
> +
> +        lm86@4c {
> +                compatible = "national,lm86";
> +                reg = <0x4c>;
> +        };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +
> +       lm75@4f {
> +               cpmpatible = "national,lm75";
> +               reg = <0x4f>;
> +       };
> +
> +        fan_ioexp: pca9535@20 {
> +                compatible = "nxp,pca9535";
> +                reg = <0x20>;
> +               #address-cells = <1>;
> +                #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +               "","","presence-fan0","",
> +               "","","presence-fan1","",
> +               "","","presence-fan2","",
> +               "","","presence-fan3","";
> +        };
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +
> +        eeprom@50 {
> +                compatible = "atmel,24c128";
> +                reg = <0x50>;
> +                pagesize = <64>;
> +        };
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +       psu@58 {
> +                compatible = "pmbus";
> +                reg = <0x58>;
> +        };
> +
> +        eeprom@50 {
> +                compatible = "atmel,24c02";
> +                reg = <0x50>;
> +                pagesize = <1>;
> +        };
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +
> +       psu@58 {
> +                compatible = "pmbus";
> +                reg = <0x58>;
> +        };
> +
> +        eeprom@50 {
> +                compatible = "atmel,24c02";
> +                reg = <0x50>;
> +                pagesize = <1>;
> +        };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +
> +       lm75@4d {
> +               compatible = "national,lm75";
> +                reg = <0x4d>;
> +       };
> +};
> +
> +&gpio0 {
> +       status = "okay";
> +
> +       gpio-line-names =
> +       /*A0-A7*/       "","","","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "","","","","","","","",
> +       /*E0-E7*/       "","","","","","","","",
> +       /*F0-F7*/       "CPU_PWRGD","","","power-button","host0-ready","","presence-ps0","presence-ps1",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","reset-button","","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "power-chassis-control0","power-chassis-control1","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","","","","","","",
> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","power-chassis-good","","","";
> +};
> --
> 2.39.0
>
>
> --
> ******************************
> This e-mail is confidential. If you are not
> the intended recipient, you must not disclose, distribute or use the
> information in it as this could be a breach of confidentiality.If you have
> received this message in error, please advise us immediately by return
> e-mail and delete the document. The address from which this message has
> been sent is strictly for business mail only and the company reserves the
> right to monitor the contents of communications and take action where and
> when it is deemed necessary.
> Thank you for your co-operation.
