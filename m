Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF2D36DCA
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 09:52:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KHv22Zy3zDqjd
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 17:52:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JgMV+fxq"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KHtV1ksvzDqVP
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 17:52:02 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id e3so1056119ioc.12
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2019 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lznfKzkmsct3Phcp8gbDD9kQD3zYnHx4HrdeinOIifA=;
 b=JgMV+fxqoUyIDFXWBaAmmChsX766Xz2z+/cuTVNLvz7PYj+JmtxI0ETNwToyDLW8az
 dLQXY3JMet1hoPkztMm+KwUWR90mQSN5bhBlyKOQ88VtZuUcAI7jdI1kf9YBkcUSNJYZ
 R1vU0WJSh7jujKA1zL3o6pXDNUzWWkqURSI92sq1TEDHoiTCu0cs0sT8s0621SbOT6y1
 3M+n3Kd3s9EE6Taxok0cJpARu4XZonIh3bLYxT3eVZ59saoPWzIFrNujf+uOquhQWiHP
 G3GTWBAXHVsDIqdiGSQzxkhddtzCzP5sm2Z7vWyk0dw/yzH2iyVFhj7wNJ0EZ0X1/92X
 yBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lznfKzkmsct3Phcp8gbDD9kQD3zYnHx4HrdeinOIifA=;
 b=SZusffAmAeDPUZ+45uSAIbMrSRLrcVQobx/IteYLfkn4rSpd3KVvHEBcWB9ty2tFL9
 LysSFv53fyNfOtEEAa16OP4cjI8W5t8IEcIwFylCUNvVJBIdhbQZsfSbwx5ZVx6RGPBu
 +WHXyBs+1ToxD8/u/KPc7ZyLWbQeWgIZg4ibDh60aveJAF/bJp+vQXOZSV2zgW5lUYFT
 Ur/iMj8uYK2JVP2/3EQppZcNx1iwMsUn/Fae80q9BcdxWxHkWP5jZYPvNgI7Q9dXBzS1
 w49S/aMqDBNPQ070ZGIOLdVPl9818sRjM7lGBfTMnbi1MPtV6oKkn8N9CNuCP3Ni2QOE
 jPkA==
X-Gm-Message-State: APjAAAWic5pnQZkkSzqSBkUstha90Qwz+ltY2KMow6MWjje4ahIvsPZO
 Zg1rispL11s+bkcvB8Dewh8zEMzvf+OVmaM0jzRFpqjgC9YY+A==
X-Google-Smtp-Source: APXvYqy9lfSfr+qgenR09X/IEwgVshW4iiY4HJ8bv3TO907lasD5F4z5k7OrDU5azqyOKTgzM/JTXUgiCj8hdCkr/Lc=
X-Received: by 2002:a6b:901:: with SMTP id t1mr21726191ioi.42.1559807518749;
 Thu, 06 Jun 2019 00:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <1559787471-3734-1-git-send-email-wangzqbj@inspur.com>
In-Reply-To: <1559787471-3734-1-git-send-email-wangzqbj@inspur.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 6 Jun 2019 15:51:46 +0800
Message-ID: <CAARXrtmd8MnBE4x=bsSRmM_rYrhzLnPzpZWpMG+gtknwGC2T=g@mail.gmail.com>
Subject: Re: [PATCH dev-5.1] ARM: dts: aspeed: Add Inspur fp5280g2 BMC machine
To: John Wang <wangzqbj@inspur.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reviewed-by: Lei YU <mine260309@gmail.com>

On Thu, Jun 6, 2019 at 10:18 AM John Wang <wangzqbj@inspur.com> wrote:
>
> The fp5280g2 is an open-power server platform with
> an aspeed ast2500 BMC
>
> Signed-off-by: John Wang <wangzqbj@inspur.com>
> ---
>  arch/arm/boot/dts/Makefile                       |   1 +
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 843 +++++++++++++++++++++++
>  2 files changed, 844 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index bed2047..31db1d3 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1256,6 +1256,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-facebook-cmm.dtb \
>         aspeed-bmc-facebook-tiogapass.dtb \
>         aspeed-bmc-intel-s2600wf.dtb \
> +       aspeed-bmc-inspur-fp5280g2.dtb \
>         aspeed-bmc-lenovo-hr630.dtb \
>         aspeed-bmc-microsoft-olympus.dtb \
>         aspeed-bmc-opp-lanyang.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> new file mode 100644
> index 0000000..771de77
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -0,0 +1,843 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model = "FP5280G2 BMC";
> +       compatible = "inspur,fp5280g2-bmc", "aspeed,ast2500";
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
> +               vga_memory: framebuffer@9f000000 {
> +                       no-map;
> +                       reg = <0x9f000000 0x01000000>; /* 16M */
> +               };
> +
> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };
> +
> +               coldfire_memory: codefire_memory@9ef00000 {
> +                       reg = <0x9ef00000 0x00100000>;
> +                       no-map;
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
> +                       size = <0x02000000>;    /* 32M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       fsi: gpio-fsi {
> +               compatible = "fsi-master-gpio", "fsi-master";
> +               #address-cells = <2>;
> +               #size-cells = <0>;
> +               no-gpio-delays;
> +
> +               memory-region = <&coldfire_memory>;
> +               aspeed,sram = <&sram>;
> +               aspeed,cvic = <&cvic>;
> +
> +               clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> +               mux-gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_HIGH>;
> +               enable-gpios = <&gpio ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
> +               trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(B, 3)>;
> +               };
> +
> +               ps0-presence {
> +                       label = "ps0-presence";
> +                       gpios = <&gpio ASPEED_GPIO(F, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(F, 0)>;
> +               };
> +
> +               ps1-presence {
> +                       label = "ps1-presence";
> +                       gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(F, 1)>;
> +               };
> +
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
> +                       gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
> +                       linux,code = <0>;
> +               };
> +
> +               fan1-presence {
> +                       label = "fan1-presence";
> +                       gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
> +                       linux,code = <1>;
> +               };
> +
> +               fan2-presence {
> +                       label = "fan2-presence";
> +                       gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
> +                       linux,code = <2>;
> +               };
> +
> +               fan3-presence {
> +                       label = "fan3-presence";
> +                       gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
> +                       linux,code = <3>;
> +               };
> +
> +               fan4-presence {
> +                       label = "fan4-presence";
> +                       gpios = <&pca1 4 GPIO_ACTIVE_LOW>;
> +                       linux,code = <4>;
> +               };
> +
> +               fan5-presence {
> +                       label = "fan5-presence";
> +                       gpios = <&pca1 5 GPIO_ACTIVE_LOW>;
> +                       linux,code = <5>;
> +               };
> +
> +               fan6-presence {
> +                       label = "fan6-presence";
> +                       gpios = <&pca1 6 GPIO_ACTIVE_LOW>;
> +                       linux,code = <6>;
> +               };
> +
> +               fan7-presence {
> +                       label = "fan7-presence";
> +                       gpios = <&pca1 7 GPIO_ACTIVE_LOW>;
> +                       linux,code = <7>;
> +               };
> +       };
> +
> +       leds {
> +           compatible = "gpio-leds";
> +
> +           power {
> +                   label = "power";
> +                   /* TODO: dummy gpio */
> +                   gpios = <&gpio ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
> +           };
> +
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 15>;
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +                       <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +                       <&adc 10>, <&adc 11>, <&adc 12>, <&adc 13>, <&adc 14>;
> +       };
> +
> +};
> +
> +&fmc {
> +       status = "okay";
> +
> +       flash@0 {
> +               status = "okay";
> +               label = "bmc";
> +               m25p,fast-read;
> +               spi-max-frequency = <50000000>;
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
> +               label = "pnor";
> +               m25p,fast-read;
> +               spi-max-frequency = <100000000>;
> +       };
> +};
> +
> +&uart1 {
> +       /* Rear RS-232 connector */
> +       status = "okay";
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
> +       /* Test Point */
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
> +};
> +
> +&uart3 {
> +       /* APSS */
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +       flash = <&spi1>;
> +};
> +
> +&mbox {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       use-ncsi;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c0 {
> +       /* LCD */
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c256";
> +               reg = <0x50>;
> +               label = "fru";
> +       };
> +
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +
> +       tmp112@48 {
> +               compatible = "ti,tmp112";
> +               reg = <0x48>;
> +               label = "inlet";
> +       };
> +
> +       tmp112@49 {
> +               compatible = "ti,tmp112";
> +               reg = <0x49>;
> +               label = "outlet";
> +       };
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       tmp112@4a {
> +                               compatible = "ti,tmp112";
> +                               reg = <0x4a>;
> +                               label = "psu_inlet";
> +                       };
> +
> +               };
> +
> +               i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       tmp112@4a {
> +                               compatible = "ti,tmp112";
> +                               reg = <0x4a>;
> +                               label = "ocp_zone";
> +                       };
> +               };
> +
> +               i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       tmp112@4a {
> +                               compatible = "ti,tmp112";
> +                               reg = <0x4a>;
> +                               label = "bmc_zone";
> +                       };
> +               };
> +
> +               i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       tmp112@7c {
> +                               compatible = "emc1413";
> +                               reg = <0x7c>;
> +                       };
> +               };
> +
> +       };
> +};
> +
> +&i2c3 {
> +       /* Riser Card */
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +       rtc@68 {
> +               compatible = "dallas,ds3232";
> +               reg = <0x68>;
> +       };
> +};
> +
> +&i2c5 {
> +       /* vr  */
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       /* bp card */
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       adm1278@10 {
> +                               compatible = "adi,adm1278";
> +                               reg = <0x10>;
> +                       };
> +
> +                       adm1278@13 {
> +                               compatible = "adi,adm1278";
> +                               reg = <0x13>;
> +                       };
> +
> +                       adm1278@50 {
> +                               compatible = "adi,adm1278";
> +                               reg = <0x50>;
> +                       };
> +
> +                       adm1278@53 {
> +                               compatible = "adi,adm1278";
> +                               reg = <0x53>;
> +                       };
> +
> +               };
> +
> +               /*pcie riser*/
> +
> +       };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +
> +       pca0: pca9555@20 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x20>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +       };
> +
> +       pca1: pca9555@21 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x21>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       pca2: pca9555@22 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x22>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       pca3: pca9555@23 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x23>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       pca4: pca9555@24 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x24>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       pca5: pca9555@25 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x25>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +};
> +
> +&i2c9 {
> +       /* cpld */
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       /* hdd bp */
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +
> +       power-supply@58 {
> +               compatible = "pmbus";
> +               reg = <0x58>;
> +       };
> +
> +       power-supply@5a {
> +               compatible = "pmbus";
> +               reg = <0x5a>;
> +       };
> +};
> +
> +&i2c12 {
> +       /* odcc */
> +       status = "okay";
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
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&gpio {
> +       pin_gpio_b7 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(B,7) GPIO_ACTIVE_LOW>;
> +               output-high;
> +               line-name = "BMC_INIT_OK";
> +       };
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
> +&ibt {
> +       status = "okay";
> +
> +};
> +
> +&adc {
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
> +#include "ibm-power9-dual.dtsi"
> --
> 2.7.4
>
