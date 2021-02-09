Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB2314EE1
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 13:27:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZhwS2r8dzDqyw
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 23:27:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Gzr3GZV/; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZhtk0mhqzDskF
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 23:25:33 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id b14so4110852qkk.0
 for <openbmc@lists.ozlabs.org>; Tue, 09 Feb 2021 04:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLHsYCXVHT/BdYn1H1uR2orIeU66/PHvFwt2ixsYZJY=;
 b=Gzr3GZV/Wsub94JC4CNg4CBUbc7L5z7lR8fzmCQgIHG2fM1Z+QUi5Dbb3agPd4F2us
 OnQQqOxxQMXd6dFiEQCXBv/QBQxC5NfZnyI9Nqr2Sg+EZkzW0whztLY1WAaFCxI/7GR2
 Vu6haYqRdZbNbbPUE6Sx995ZDoa0buwE3Cju4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLHsYCXVHT/BdYn1H1uR2orIeU66/PHvFwt2ixsYZJY=;
 b=qG7wjLaym4YNZ4z08TmFlFs6siYh3qqhyYCLvo4Sz5rLuyi620k/FFaKVRhPNVcdFx
 Oe4z72rV3gBpA5ErbnftjJEiKYzMQhTsBc3T9Mxk7cwIG1BRueC8/OIcZMELDvq/feGA
 JhUtal2Lvv1ROTPVul3zu6YOIJeRxF3ay2P6ii7J3IZ21cMhC1U03EMM8ZEtAkNiQNTu
 WRNMtYODpYFEKXtyw3XKZ3s32d/wVfR3yVjtxWJ4qLsqwdLZpb6oDVGGdMEUU5qW9pcx
 93a+cx42MfAzrjspLa4o/wJO1LSc5bbWdOYCn45nXiFEr5EHWxJfThWHYhMumae1tzIE
 0Vfw==
X-Gm-Message-State: AOAM5339R6R02Yggy+sv6xaIyIdal9hGKOzQ9lqf7nX7OUCxHUO928oN
 KXBUCIk839dapuH9vsDLCggTWC0+It4Juqq4saU=
X-Google-Smtp-Source: ABdhPJxefs+RIt/Zw1Qk7U/n3fKsJ+yQsdrf4/armFXk2vuo1diIgIVCHDrJcXu5a9Ts+4IjIXhVpsMvLhtt18fYiRU=
X-Received: by 2002:a37:ac10:: with SMTP id e16mr21208359qkm.465.1612873528815; 
 Tue, 09 Feb 2021 04:25:28 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xd0aMcXrUD4YLWHMSz9rb7p0KKQGVCHRxFWdajGXcgLZg@mail.gmail.com>
 <1610358177-3874-1-git-send-email-willie_thai@compal.com>
In-Reply-To: <1610358177-3874-1-git-send-email-willie_thai@compal.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Feb 2021 12:25:16 +0000
Message-ID: <CACPK8XfNrYFNy0KHjxa=nM01LV7PMnVC5U7_Wuudf_xk3tQ2iw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Liwu2 BMC
To: Willie Thai <williethaitu@gmail.com>
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
Cc: Willie Thai <willie_thai@compal.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 11 Jan 2021 at 09:45, Willie Thai <williethaitu@gmail.com> wrote:
>
> The Liwu2 is a server platform with an ASPEED AST2500 based BMC.

You need to have a signed-off-by in your commit message.

Please make sure you run ./scripts/checkpatch.pl on your patch before
sending it.

The patch looks okay; there are some minor issues to fix that I have
mentioned below. Apologies for the delay in reviewing it.


> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts | 320 ++++++++++++++++++++++++++
>  2 files changed, 321 insertions(+)
>  create mode 100755 arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5a14adc..16fc64d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1354,6 +1354,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-bytedance-g220a.dtb \
> +       aspeed-bmc-compal-liwu2.dts \
>         aspeed-bmc-facebook-cmm.dtb \
>         aspeed-bmc-facebook-minipack.dtb \
>         aspeed-bmc-facebook-tiogapass.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> new file mode 100755
> index 0000000..a93af32
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "AST2500 liwu2";
> +       compatible = "aspeed,ast2500";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               gfx_memory: framebuffer {
> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                             <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                             <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                             <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               LED_FAN0_FAULT {

Node names have lower case.

> +                       label = "LED_FAN0_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN1_FAULT {
> +                       label = "LED_FAN1_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN2_FAULT {
> +                       label = "LED_FAN2_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN3_FAULT {
> +                       label = "LED_FAN3_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN4_FAULT {
> +                       label = "LED_FAN4_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN5_FAULT {
> +                       label = "LED_FAN5_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               FP_LED_STATUS_AMBER_N {
> +                       label = "FP_LED_STATUS_AMBER_N";
> +                       gpios = <&gpio ASPEED_GPIO(S, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               REAR_ID_LED_N {
> +                       label = "REAR_ID_LED_N";
> +                       gpios = <&gpio ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "pnor";
> +               spi-max-frequency = <100000000>;
> +       };
> +};
> +
> +&spi2 {
> +       status = "okay";
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&adc {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +       eeprom@54 {
> +               compatible = "atmel,24c64";
> +               reg = <0x54>;
> +               pagesize = <32>;
> +       };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +
> +       tmp75@48 {
> +               compatible = "ti,tmp75";
> +               reg = <0x48>;
> +       };
> +
> +       tmp75@4b {
> +               compatible = "ti,tmp75";
> +               reg = <0x4b>;
> +       };
> +
> +       tmp75@4c {
> +               compatible = "ti,tmp75";
> +               reg = <0x4c>;
> +       };
> +
> +       tmp75@4d {
> +               compatible = "ti,tmp75";
> +               reg = <0x4d>;
> +       };
> +
> +       vr-controller@5a {
> +               compatible = "ti,tps53679";
> +               reg = <0x5a>;
> +       };
> +
> +       vr-controller@5d {
> +               compatible = "ti,tps53679";
> +               reg = <0x5d>;
> +       };
> +
> +       vr-controller@68 {
> +               compatible = "ti,tps53679";
> +               reg = <0x68>;
> +       };
> +
> +       vr-controller@6a {
> +               compatible = "ti,tps53679";
> +               reg = <0x6a>;
> +       };
> +
> +       vr-controller@6c {
> +               compatible = "ti,tps53679";
> +               reg = <0x6c>;
> +       };
> +
> +       vr-controller@6e {
> +               compatible = "ti,tps53679";
> +               reg = <0x6e>;
> +       };
> +
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +       eeprom@51 {
> +        compatible = "atmel,24c64";

The whitespace looks wrong here.

> +        reg = <0x51>;
> +        pagesize = <32>;
> +    };
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       power-supply@58 {
> +               compatible = "pmbus";
> +               reg = <0x58>;
> +       };
> +
> +       power-supply@59 {
> +               compatible = "pmbus";
> +               reg = <0x59>;
> +       };
> +};
> +
> +
> +&sdmmc {
> +       status = "okay";
> +};
> +
> +&sdhci0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_sd1_default>;
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&uhci {
> +       status = "okay";
> +};
> +
> +&gfx {
> +     status = "okay";
> +     memory-region = <&gfx_memory>;
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +               &pinctrl_pwm2_default &pinctrl_pwm3_default
> +               &pinctrl_pwm4_default &pinctrl_pwm5_default
> +               &pinctrl_pwm6_default &pinctrl_pwm7_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +       };
> +
> +       fan@2 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x08 0x09>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0a 0x0b>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0c 0x0d>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x07>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0e 0x0f>;
> +       };
> +
> +};
> +
> --
> 2.7.4
>
