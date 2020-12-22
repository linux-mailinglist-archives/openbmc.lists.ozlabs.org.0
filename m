Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE32E0456
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 03:24:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0KsJ06hgzDqQJ
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 13:24:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Dtpt6tZS; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0KrZ4XKPzDqKj
 for <openbmc@lists.ozlabs.org>; Tue, 22 Dec 2020 13:23:22 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id f26so9119690qka.0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Dec 2020 18:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=16mc4MdK4RUqNhTlg7Y95qciXMx93COR7Zl2dfDpGqs=;
 b=Dtpt6tZS4VswYuxQvxx0vZhNkHj7YvtdCwe8gw+ty0mETWmZj4E8kz3UgeNzWC3C5h
 /dvk1xkIAODBqglE9KmI1oMzzASwAyYVyiDaIlZ/M/SuE+qoSuHH9vXOSoJNbAGCTFjK
 UEWUlDVC/6ZT+Ap1op39W+JX9j43YcJgz2YTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=16mc4MdK4RUqNhTlg7Y95qciXMx93COR7Zl2dfDpGqs=;
 b=GRQchu8oz0YVsmnh6k4QvXymfAaB7fPs7f8c/tSHz5Z3LYYIsYHYZjfayEXtJAQWdu
 /CuOgtzrVdXQm/gplkpYPRHapn8co0gBfHppvk17eND2ow8lwZ0dCy2TWMDxyA4/oNTF
 autw+rkm2cl/myUYZ0iwEKaPI2t+mmDgyYuC0CgyxETxJ86YcEfstFZun7ZqOlZR5PmK
 NljP2907oRiykkXmfppeP6huuiSavViyY4rGjG+vXpIEBt48FTSlxbtJuPZdjJj2GVvb
 fd4h78VBK+/GZMi5SR9E0Z578E2P5KQTE790abQl6hatgdIju27KfdN4yu9EgQu4ehmG
 Kd6Q==
X-Gm-Message-State: AOAM530JhdXCBPDEjdfyOIbxLpk0xvVNz00dAkaoEeFZEMS6y8N4XiL6
 tlhxMbYRgBZJc+AfOq3vqZYzYksHEjNE0yWtVQc=
X-Google-Smtp-Source: ABdhPJz4wZaYsOROIiRKUIQHAXS+ivSlfLqFtdaUj6APKzSxIaCeW4iYR6efGGj9tHDRDPRb62jttZeoEEv/p/3txQw=
X-Received: by 2002:a05:620a:4155:: with SMTP id
 k21mr20163676qko.55.1608603798098; 
 Mon, 21 Dec 2020 18:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20201221134315.5544-1-RyanS@supermicro.com.tw>
In-Reply-To: <20201221134315.5544-1-RyanS@supermicro.com.tw>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Dec 2020 02:23:06 +0000
Message-ID: <CACPK8XcXku4_1wX+9yXgQ4269ByC8BmDCeeDCZmaH=RqCoyXfg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] ARM: dts: aspeed: Add Supermicro x11spi BMC
 machine
To: Ryan Sie <lesly895@gmail.com>
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
Cc: Ryan Sie <ryans@supermicro.com.tw>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Dec 2020 at 13:43, Ryan Sie <lesly895@gmail.com> wrote:
>
> From: Ryan Sie <ryans@supermicro.com.tw>
>
> The x11spi is a server platform with an ASPEED AST2500 BMC.
>
> OpenBMC-Staging-Count: 1
> Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>

Merged, thanks.

Please also submit to the upstream mailing lists when you get a
chance. After v5.11-rc1 is tagged is a good time.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/Makefile                         |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts | 137 +++++++++++++++++++++
>  2 files changed, 139 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5fd12e8..e898d3d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1379,4 +1379,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-opp-witherspoon-128.dtb \
>         aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-portwell-neptune.dtb \
> -       aspeed-bmc-quanta-q71l.dtb
> +       aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-supermicro-x11spi.dtb
> diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
> new file mode 100644
> index 0000000..bc16ad2
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x11spi.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Super Micro Computer, Inc
> +
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "X11SPI BMC";
> +       compatible = "supermicro,x11spi-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "earlyprintk";
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
> +               vga_memory: framebuffer@7f000000 {
> +                       no-map;
> +                       reg = <0x7f000000 0x01000000>;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +};
> +
> +&gpio {
> +    status = "okay";
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "pnor";
> +       };
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +    status = "okay";
> +
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&pinctrl_rmii1_default>;
> +    clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +           <&syscon ASPEED_CLK_MAC1RCLK>;
> +    clock-names = "MACCLK", "RCLK";
> +    use-ncsi;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
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
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +};
> +
> +&gfx {
> +       status = "okay";
> +};
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +                        &pinctrl_pwm2_default &pinctrl_pwm3_default
> +                        &pinctrl_pwm4_default &pinctrl_pwm5_default
> +                        &pinctrl_pwm6_default &pinctrl_pwm7_default>;
> +};
> --
> 2.7.4
>
