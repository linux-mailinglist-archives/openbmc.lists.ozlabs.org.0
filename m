Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656C34F8CD
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 08:33:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Gjq2Yrmz3c22
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 17:33:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FEgaRXRz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FEgaRXRz; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Gjc1nCbz2yQy
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 17:33:37 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id g8so9447152qvx.1
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 23:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3cl0TBg+e+KeZF6ZVgISkQlD4amcvW7jD8N+BvI82q8=;
 b=FEgaRXRzgdGE/12K90JQgV/anU6EH1rGVvTM8rTXmZuBtWThBbz9VeDelrdpELRE2I
 Ns+6tv+c5kWdUEa12I2gSQWskjScIjCvy4DlA0kzvV6oxExmpRPRw2pOmaJS/W2cjvim
 uixfdO9soUDHIPx8c0LQnsNXZSGhb0GZ09ueo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3cl0TBg+e+KeZF6ZVgISkQlD4amcvW7jD8N+BvI82q8=;
 b=tEqNOPy5U3ZnhZOg4bGxiKWcv9OIYdKioBw9uWhccUZbwUJli+2bI3MBya6hpLJUFE
 t5Il0yACnCw9KYkSTO2mAJ/HbOq3aMugTkbAROKhvxMvuquOSl8LLwzOhMStBqd7hgpz
 CGTRtjwUPP/wwZuiYjzu7BkuF9EQMaOkg0X+w0IMjM3khwcV2Ho3ToyxG323dz8oFzrf
 YxXDyr4ioOjm4yh5SHeraTh9+vV9nFlQHRKYTyfIMxHnq328fDAPDoFF4T9jyPcuFx7Q
 mEmT7RPNrbhWQqa/iPshei2QzLRTYF2wwp7cJs9ShqsdAIZFsCV2c5hk7Mo2LT3uDPG6
 Jwkw==
X-Gm-Message-State: AOAM533a9rF5Ni+d4QZxnF9hNx+V90niA4AlkuWikixCBPo4vnXuLIJn
 GkAfoOV87BZcSG4fLBpzAG2chhqn7Qi7k7ByFYA=
X-Google-Smtp-Source: ABdhPJymERJ1j55E7DpSNXmRiWyTEtf7o1rP+1Hsi/2gfhipeld88KnCOw+K3x/FGTdgAL0a6jZQ0tqX39xf2Yyf250=
X-Received: by 2002:a05:6214:180d:: with SMTP id
 o13mr1698627qvw.10.1617172413659; 
 Tue, 30 Mar 2021 23:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XfNrYFNy0KHjxa=nM01LV7PMnVC5U7_Wuudf_xk3tQ2iw@mail.gmail.com>
 <1613718670-24417-1-git-send-email-willie_thai@compal.com>
In-Reply-To: <1613718670-24417-1-git-send-email-willie_thai@compal.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 06:33:21 +0000
Message-ID: <CACPK8XdF2-dM__UJpJDhzWrwWh0_gyj08S2LYr-4aFqph60cLQ@mail.gmail.com>
Subject: Re: [[PATCH linux dev-5.8] ARM: dts: Aspeed: Add Compal's Liwu2 BMC
 machine] ARM: dts: aspeed: Add device tree for Compal's Liwu2 BMC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Willie Thai <willie_thai@compal.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Feb 2021 at 07:11, Willie Thai <williethaitu@gmail.com> wrote:
>
> The Liwu2 is a server platform with an ASPEED AST2500 based BMC.
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I do not recall adding reviewed-by tags. Please don't add them unless
a reviewer has sent them.

> Signed-off-by: willie_thai@compal.com

The format is: Signed-off-by: User Name <user@domain.com>

You can use '-s' when running git commit to add it automatically.

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts | 325 ++++++++++++++++++++++++++
>  2 files changed, 326 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 6320124..a67576d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1354,6 +1354,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-bytedance-g220a.dtb \
> +       aspeed-bmc-compal-liwu2.dtb \
>         aspeed-bmc-facebook-cmm.dtb \
>         aspeed-bmc-facebook-minipack.dtb \
>         aspeed-bmc-facebook-tiogapass.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> new file mode 100644
> index 0000000..68faf3d
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "AST2500 liwu2";
> +       compatible = "aspeed,ast2500";

Add a compatible string for your machine, eg.

  compatible = "compal,liwu2-bmc", "aspeed,ast2500";'

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
> +                               <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                               <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                               <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led_fan0_fault {
> +                       label = "LED_FAN0_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led_fan1_fault {
> +                       label = "LED_FAN1_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led_fan2_fault {
> +                       label = "LED_FAN2_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led_fan3_fault {
> +                       label = "LED_FAN3_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led_fan4_fault {
> +                       label = "LED_FAN4_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led_fan5_fault {
> +                       label = "LED_FAN5_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fp_led_status_amber_n {
> +                       label = "FP_LED_STATUS_AMBER_N";
> +                       gpios = <&gpio ASPEED_GPIO(S, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rear_id_led_n {
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
> +               compatible = "atmel,24c64";
> +               reg = <0x51>;
> +               pagesize = <32>;
> +       };
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
> +/*
> + * Enable port A as device (via the virtual hub) and port B as
> + * host by default on the eval board. This can be easily changed
> + * by replacing the override below with &ehci0 { ... } to enable
> + * host on both ports.

This looks like it's cut and pasted from the EVB. Please update or
remove the comment as it applies to your machine.

> + */
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
> +       status = "okay";
> +       memory-region = <&gfx_memory>;
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
> --
> 2.7.4
>
