Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF68AC74
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 03:38:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466wN518fTzDqZw
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 11:38:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NVuG96g8"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466wMM0NntzDqP5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 11:37:50 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id v38so12477755qtb.0
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 18:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6L8FnxPLd+2siesaTwde5LjHxWowbeAL3aU1yh4sezQ=;
 b=NVuG96g8tChSmz7hM/2NMTG3i6Nz3tA7QRNtQqYeGtNGlqKSzKesVtQ4HezEwQ/H9q
 KnOkbixmOqoNRCMMQGfkZZu1RJNdshPtTjLTvCTWe3XrZyULWb9ZM2NSd2AJMCs0E5um
 RqKDNpEaiEgdBQlilu4umPmarUsKrM4eHxpDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6L8FnxPLd+2siesaTwde5LjHxWowbeAL3aU1yh4sezQ=;
 b=Uk3Ym1SZvES/cG+JCZThcs4x2xnmhmXAiIJ+ixbZ1xHRZJORUV/l0LDgm8Nfc/gE+u
 hDeHxOgLhT+Ulbi39q//+ydNUMBLHh65Tqlt3hckN2HH2UV5kwS4479mlvpNCQO5sO9v
 y8iWOjt7sS15Ps92eZmQ/2/o3SFxuF8Qlef7bxXbsfQkBSZyynBBEU2uQr2h05+gUDVl
 v0wVOo4bgR/gM1zBWlIL8ITX+cwvmNgrkj22aoF6FDt3lxYH1lDUeZzAG5pHsM5j7CxS
 MVELY4WgA3yEdCx6l4/i7vM4vPhqtxrJ6NwOKl74zjBp7ojAn538UOQU8uVEIYoI0qYz
 MdSQ==
X-Gm-Message-State: APjAAAXKx5fv817D7ljNsLamLzXypXumgzFJ7wdabbb9NY1jlPIiQQJ3
 NCwkOFyXt0IIqUuGOlN3xa0TnnQCUkQtgGGc25E=
X-Google-Smtp-Source: APXvYqyboKbLFPcJ1zWSSWNze3iJv72l0FDEtKA5P6YSPyCZb14CY+/yKsc3OOBsgH9EpWxQrZLrwOx1aj4t3TU74XE=
X-Received: by 2002:ac8:34a3:: with SMTP id w32mr21641813qtb.169.1565660266140; 
 Mon, 12 Aug 2019 18:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190812111307.22321-1-Ben_Pai@wistron.com>
In-Reply-To: <20190812111307.22321-1-Ben_Pai@wistron.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Aug 2019 01:37:33 +0000
Message-ID: <CACPK8Xe7pxkH4X9jrjgFmDjw7LXipqC9Lx9jOfDjjaBSG2Au1g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: Add Mihawk BMC platform
To: Ben Pai <Ben_Pai@wistron.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, wangat@tw.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ben,

On Mon, 12 Aug 2019 at 11:13, Ben Pai <Ben_Pai@wistron.com> wrote:
>
> The Mihawk BMC is an ASPEED ast2500 based BMC that is part of an
> OpenPower Power9 server.
>
> Signed-off-by: Ben Pai <Ben_Pai@wistron.com>

This looks better.

However, you've left out the revision number (I think we were up to
5?). You can add this with -v on the git-format-patch commandline.

> ---

Once you've generated the patch, it's convention to describe what
you've changed in this area, below the -- above.

You don't need to re-spin the patch to fix these issues. Please keep
them in mind when sending patches to the list in the future.

I'll wait for Andrew to ack this one, when he does, it can go in the tree.

Cheers,

Joel

>  arch/arm/boot/dts/Makefile                  |   1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 918 ++++++++++++++++++++
>  2 files changed, 919 insertions(+)
>  create mode 100755 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index eb6de52c1936..cdfe0f43ffd3 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1275,6 +1275,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-lenovo-hr630.dtb \
>         aspeed-bmc-microsoft-olympus.dtb \
>         aspeed-bmc-opp-lanyang.dtb \
> +       aspeed-bmc-opp-mihawk.dtb \
>         aspeed-bmc-opp-palmetto.dtb \
>         aspeed-bmc-opp-romulus.dtb \
>         aspeed-bmc-opp-swift.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> new file mode 100755
> index 000000000000..e55cc454b17f
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> @@ -0,0 +1,918 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model = "Mihawk BMC";
> +       compatible = "ibm,mihawk-bmc", "aspeed,ast2500";
> +
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
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
> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };
> +
> +               gfx_memory: framebuffer {
> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               video_engine_memory: jpegbuffer {
> +                       size = <0x02000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               air-water {
> +                       label = "air-water";
> +                       gpios = <&gpio ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(F, 6)>;
> +               };
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(J, 2)>;
> +               };
> +
> +               ps0-presence {
> +                       label = "ps0-presence";
> +                       gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(Z, 2)>;
> +               };
> +
> +               ps1-presence {
> +                       label = "ps1-presence";
> +                       gpios = <&gpio ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(Z, 0)>;
> +               };
> +               id-button {
> +                       label = "id-button";
> +                       gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(F, 1)>;
> +               };
> +       };
> +
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               poll-interval = <1000>;
> +
> +               fan0-presence {
> +                       label = "fan0-presence";
> +                       gpios = <&pca9552 9 GPIO_ACTIVE_LOW>;
> +                       linux,code = <9>;
> +               };
> +
> +               fan1-presence {
> +                       label = "fan1-presence";
> +                       gpios = <&pca9552 10 GPIO_ACTIVE_LOW>;
> +                       linux,code = <10>;
> +               };
> +
> +               fan2-presence {
> +                       label = "fan2-presence";
> +                       gpios = <&pca9552 11 GPIO_ACTIVE_LOW>;
> +                       linux,code = <11>;
> +               };
> +
> +               fan3-presence {
> +                       label = "fan3-presence";
> +                       gpios = <&pca9552 12 GPIO_ACTIVE_LOW>;
> +                       linux,code = <12>;
> +               };
> +
> +               fan4-presence {
> +                       label = "fan4-presence";
> +                       gpios = <&pca9552 13 GPIO_ACTIVE_LOW>;
> +                       linux,code = <13>;
> +               };
> +
> +               fan5-presence {
> +                       label = "fan5-presence";
> +                       gpios = <&pca9552 14 GPIO_ACTIVE_LOW>;
> +                       linux,code = <14>;
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               fault {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               power {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&gpio ASPEED_GPIO(AA, 1) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rear-id {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rear-g {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&gpio ASPEED_GPIO(AA, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rear-ok {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&gpio ASPEED_GPIO(Y, 0) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca9552 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca9552 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan2 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca9552 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan3 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca9552 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan4 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca9552 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan5 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca9552 5 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       fsi: gpio-fsi {
> +               compatible = "fsi-master-gpio", "fsi-master";
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +               no-gpio-delays;
> +
> +               clock-gpios = <&gpio ASPEED_GPIO(E, 6) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_HIGH>;
> +               mux-gpios = <&gpio ASPEED_GPIO(E, 5) GPIO_ACTIVE_HIGH>;
> +               enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> +               trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> +       };
> +       iio-hwmon-12v {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>;
> +       };
> +
> +       iio-hwmon-5v {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 1>;
> +       };
> +
> +       iio-hwmon-3v {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 2>;
> +       };
> +
> +       iio-hwmon-vdd0 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 3>;
> +       };
> +
> +       iio-hwmon-vdd1 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 4>;
> +       };
> +
> +       iio-hwmon-vcs0 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 5>;
> +       };
> +
> +       iio-hwmon-vcs1 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 6>;
> +       };
> +
> +       iio-hwmon-vdn0 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 7>;
> +       };
> +
> +       iio-hwmon-vdn1 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 8>;
> +       };
> +
> +       iio-hwmon-vio0 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 9>;
> +       };
> +
> +       iio-hwmon-vio1 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 10>;
> +       };
> +
> +       iio-hwmon-vddra {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 11>;
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 12>;
> +       };
> +
> +       iio-hwmon-vddrb {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 13>;
> +       };
> +
> +       iio-hwmon-vddrc {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 14>;
> +       };
> +
> +       iio-hwmon-vddrd {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 15>;
> +       };
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +               &pinctrl_pwm2_default &pinctrl_pwm3_default
> +               &pinctrl_pwm4_default &pinctrl_pwm5_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +       };
> +
> +       fan@2 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +       };
> +
> +       fan@8 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x08>;
> +       };
> +
> +       fan@9 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x09>;
> +       };
> +
> +       fan@10 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
> +       };
> +
> +       fan@11 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               label = "bmc";
> +               m25p,fast-read;
> +               spi-max-frequency = <50000000>;
> +               partitions {
> +                       #address-cells = < 1 >;
> +                       #size-cells = < 1 >;
> +                       compatible = "fixed-partitions";
> +                       u-boot@0 {
> +                               reg = < 0 0x60000 >;
> +                               label = "u-boot";
> +                       };
> +                       u-boot-env@60000 {
> +                               reg = < 0x60000 0x20000 >;
> +                               label = "u-boot-env";
> +                       };
> +                       obmc-ubi@80000 {
> +                               reg = < 0x80000 0x1F80000 >;
> +                               label = "obmc-ubi";
> +                       };
> +               };
> +       };
> +       flash@1 {
> +               status = "okay";
> +               label = "alt-bmc";
> +               m25p,fast-read;
> +               spi-max-frequency = <50000000>;
> +               partitions {
> +                       #address-cells = < 1 >;
> +                       #size-cells = < 1 >;
> +                       compatible = "fixed-partitions";
> +                       u-boot@0 {
> +                               reg = < 0 0x60000 >;
> +                               label = "alt-u-boot";
> +                       };
> +                       u-boot-env@60000 {
> +                               reg = < 0x60000 0x20000 >;
> +                               label = "alt-u-boot-env";
> +                       };
> +                       obmc-ubi@80000 {
> +                               reg = < 0x80000 0x1F80000 >;
> +                               label = "alt-obmc-ubi";
> +                       };
> +               };
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
> +               label = "pnor";
> +               m25p,fast-read;
> +               spi-max-frequency = <100000000>;
> +       };
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +       flash = <&spi1>;
> +};
> +
> +&uart1 {
> +       /* Rear RS-232 connector */
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                       &pinctrl_rxd1_default
> +                       &pinctrl_nrts1_default
> +                       &pinctrl_ndtr1_default
> +                       &pinctrl_ndsr1_default
> +                       &pinctrl_ncts1_default
> +                       &pinctrl_ndcd1_default
> +                       &pinctrl_nri1_default>;
> +};
> +
> +&uart2 {
> +       /* APSS */
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
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
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       use-ncsi;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c0 {
> +       status = "disabled";
> +};
> +
> +&i2c1 {
> +       status = "disabled";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +
> +       /* SAMTEC P0 */
> +       /* SAMTEC P1 */
> +
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +
> +       /* APSS */
> +       /* CPLD */
> +
> +       /* PCA9516 (repeater) ->
> +        *    CLK Buffer 9FGS9092
> +        *    CLK Buffer 9DBL0651BKILFT
> +        *    CLK Buffer 9DBL0651BKILFT
> +        *    Power Supply 0
> +        *    Power Supply 1
> +        *    PCA 9552 LED
> +        */
> +
> +       power-supply@58 {
> +               compatible = "ibm,cffps1";
> +               reg = <0x58>;
> +       };
> +
> +       power-supply@5b {
> +               compatible = "ibm,cffps1";
> +               reg = <0x5b>;
> +       };
> +
> +       pca9552: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +       };
> +
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +       /* CP0 VDD & VCS : IR35221 */
> +       /* CP0 VDN : IR35221 */
> +       /* CP0 VIO : IR38064 */
> +       /* CP0 VDDR : PXM1330 */
> +
> +       ir35221@70 {
> +               compatible = "infineon,ir35221";
> +               reg = <0x70>;
> +       };
> +
> +       ir35221@72 {
> +               compatible = "infineon,ir35221";
> +               reg = <0x72>;
> +       };
> +
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +
> +       /* CP0 VDD & VCS : IR35221 */
> +       /* CP0 VDN : IR35221 */
> +       /* CP0 VIO : IR38064 */
> +       /* CP0 VDDR : PXM1330 */
> +
> +       ir35221@70 {
> +               compatible = "infineon,ir35221";
> +               reg = <0x70>;
> +       };
> +
> +       ir35221@72 {
> +               compatible = "infineon,ir35221";
> +               reg = <0x72>;
> +       };
> +
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +
> +       /* pca9548 -> NVMe1 to 8 */
> +
> +       pca9548@70 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +       };
> +
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       /* pca9548 -> NVMe9 to 16 */
> +
> +       pca9548@70 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +       };
> +
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c64";
> +               reg = <0x50>;
> +       };
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +
> +       /* pca9545 Riser ->
> +       *       PCIe x8  Slot3
> +       *       PCIe x16 slot4
> +       *       PCIe x8  slot5
> +       *       I2C BMC RISER PCA9554
> +       *       BMC SCL/SDA PCA9554
> +       *       PCA9554
> +       */
> +
> +       /* pca9545 ->
> +       *       PCIe x16 Slot1
> +       *       PCIe x8  slot2
> +       *       PEX8748
> +       */
> +
> +       pca9545riser@70 {
> +               compatible = "nxp,pca9545";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +
> +               i2c-mux-idle-disconnect;
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       pca9545@71 {
> +               compatible = "nxp,pca9545";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x71>;
> +
> +               i2c-mux-idle-disconnect;
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +
> +       /* pca9545 Riser ->
> +       *       PCIe x8  Slot8
> +       *       PCIe x16 slot9
> +       *       PCIe x8  slot10
> +       *       I2C BMC RISER PCA9554
> +       *       BMC SCL/SDA PCA9554
> +       *       PCA9554
> +       */
> +
> +       /* pca9545 ->
> +       *       PCIe x16 Slot1
> +       *       PCIe x8  slot2
> +       *       PEX8748
> +       */
> +
> +       pca9545riser@70 {
> +               compatible = "nxp,pca9545";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +
> +               i2c-mux-idle-disconnect;
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +
> +       pca9545@71 {
> +               compatible = "nxp,pca9545";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x71>;
> +
> +               i2c-mux-idle-disconnect;
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +       };
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +
> +       /* TPM */
> +       /* RTC RX8900CE */
> +       /* FPGA for power sequence */
> +       /* TMP275A */
> +       /* TMP275A */
> +       /* EMC1462 */
> +
> +       tpm@57 {
> +               compatible = "infineon,slb9645tt";
> +               reg = <0x57>;
> +       };
> +
> +       rtc@32 {
> +               compatible = "epson,rx8900";
> +               reg = <0x32>;
> +       };
> +
> +       tmp275@48 {
> +               compatible = "ti,tmp275";
> +               reg = <0x48>;
> +       };
> +
> +       tmp275@49 {
> +               compatible = "ti,tmp275";
> +               reg = <0x49>;
> +       };
> +
> +       /* chip emc1462 use emc1403 driver */
> +       emc1403@4c {
> +               compatible = "smsc,emc1403";
> +               reg = <0x4c>;
> +       };
> +
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +
> +       /* pca9545 ->
> +       *       SAS BP1
> +       *       SAS BP2
> +       *       NVMe BP
> +       *       M.2 riser
> +       */
> +
> +       pca9545@70 {
> +               compatible = "nxp,pca9545";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +
> +               interrupt-controller;
> +               #interrupt-cells = <2>;
> +
> +               i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c64";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c64";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c64";
> +                               reg = <0x50>;
> +                       };
> +               };
> +
> +               i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       tmp275@48 {
> +                               compatible = "ti,tmp275";
> +                               reg = <0x48>;
> +                       };
> +               };
> +
> +       };
> +
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +
> +       /* pca9548 ->
> +       *       NVMe BP
> +       *       NVMe HDD17 to 24
> +       */
> +
> +       pca9548@70 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +       };
> +};
> +
> +&vuart {
> +       status = "okay";
> +};
> +
> +&gfx {
> +       status = "okay";
> +       memory-region = <&gfx_memory>;
> +};
> +
> +&adc {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
> +                       &pinctrl_adc1_default
> +                       &pinctrl_adc2_default
> +                       &pinctrl_adc3_default
> +                       &pinctrl_adc4_default
> +                       &pinctrl_adc5_default
> +                       &pinctrl_adc6_default
> +                       &pinctrl_adc7_default
> +                       &pinctrl_adc8_default
> +                       &pinctrl_adc9_default
> +                       &pinctrl_adc10_default
> +                       &pinctrl_adc11_default
> +                       &pinctrl_adc12_default
> +                       &pinctrl_adc13_default
> +                       &pinctrl_adc14_default
> +                       &pinctrl_adc15_default>;
> +};
> +
> +&wdt1 {
> +       aspeed,reset-type = "none";
> +       aspeed,external-signal;
> +       aspeed,ext-push-pull;
> +       aspeed,ext-active-high;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_wdtrst1_default>;
> +};
> +
> +&wdt2 {
> +       aspeed,alt-boot;
> +};
> +
> +&ibt {
> +       status = "okay";
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&video {
> +       status = "okay";
> +       memory-region = <&video_engine_memory>;
> +};
> +
> +#include "ibm-power9-dual.dtsi"
> +
> --
> 2.17.1
>
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
