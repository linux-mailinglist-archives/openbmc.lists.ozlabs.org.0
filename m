Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3861251051
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 06:09:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbFqN66LBzDqDN
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 14:09:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QByWUkIE; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbFpQ1YdNzDqDL;
 Tue, 25 Aug 2020 14:08:13 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id m20so9997198eds.2;
 Mon, 24 Aug 2020 21:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UITx1xORgQTs7pWtnOJgbslnkFhN6uaHw/ccxDHn3Lo=;
 b=QByWUkIEOTbEA8Jf+aWgoFiAOyXS4SamtG32JxFywYHgV6ql0w+BbmeUsIqe7Ov+o4
 ceBNPyh7Ek5VP9/vAyMwkg2U2IWjQKiRDYNGaL3dLKaF0wPCL4yQ0ucZY6InCpKarKV4
 pSubCcUTFf3YWQsLv48zBvz65c48bl5Yw1+ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UITx1xORgQTs7pWtnOJgbslnkFhN6uaHw/ccxDHn3Lo=;
 b=L7BWp2mKuuVCt3hCNSQntDCyfZHPVZafxpxYxJ+Eojio9qai+4lfB/jH98pwP69SFe
 /WU1vDrHJiHdVINFCRu6ie7n8NaXfFSfEG27XmC7t+j1AKf5BqxW/tTLb3UED0CaIQSt
 vMpm7JoLe1IN6jWjXa8XQrcY4WjDgSeFi+KynTzbsytlUfT6s/BkTnmWl+7vvIQNwZTG
 +tBG6f4bAdl6KmGltHpKwBiJaBX8wfEkRjpE5i0ipusjzVTAmr+gQ0nsafapitEpnR8p
 ywuHhld0ZXOmd9B+zgpRQ1qmZxccC8jebfkDh2Q8Dcz4u8WRAA61OURQc8slbXxcC6Z7
 /wfQ==
X-Gm-Message-State: AOAM532SjN6ZWH+idnVs+fNULZdJFcsBf/TKWh+KuKsw7PAnXX3sFdVj
 9isfRFX8k+OvKAYtItaWwBK8KlkgpXRMzNTxkTo=
X-Google-Smtp-Source: ABdhPJzACQ/tJPJIgL9w50RXk1UN59oHSrTNcBvG4NGCaUQla6YWK9+qc3RFtUQXq6Xdt9AAZZhD8Fonn18UJfI3iGo=
X-Received: by 2002:a05:6402:36f:: with SMTP id
 s15mr375329edw.325.1598328488676; 
 Mon, 24 Aug 2020 21:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
 <20200824211948.12852-6-rentao.bupt@gmail.com>
In-Reply-To: <20200824211948.12852-6-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Aug 2020 04:07:56 +0000
Message-ID: <CACPK8XfbUt9W9xQ4Gxj0LMq=C99V1ExBbkOKvbOvCbJR4N_Bwg@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Wedge400 BMC
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 Aug 2020 at 21:20, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Add initial version of device tree for Facebook Wedge400 (AST2500) BMC.
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-wedge400.dts | 420 ++++++++++++++++++
>  2 files changed, 421 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 77f1c95c4e1c..24f7acc0e2ee 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1354,6 +1354,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-facebook-tiogapass.dtb \
>         aspeed-bmc-facebook-wedge40.dtb \
>         aspeed-bmc-facebook-wedge100.dtb \
> +       aspeed-bmc-facebook-wedge400.dtb \
>         aspeed-bmc-facebook-yamp.dtb \
>         aspeed-bmc-facebook-yosemitev2.dtb \
>         aspeed-bmc-ibm-rainier.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> new file mode 100644
> index 000000000000..ad1fcad3676c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> @@ -0,0 +1,420 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2019 Facebook Inc.
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include "ast2500-facebook-netbmc-common.dtsi"
> +
> +/ {
> +       model = "Facebook Wedge 400 BMC";
> +       compatible = "facebook,wedge400-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               /*
> +                * PCA9548 (2-0070) provides 8 channels connecting to
> +                * SCM (System Controller Module).
> +                */
> +               i2c16 = &imux16;
> +               i2c17 = &imux17;
> +               i2c18 = &imux18;
> +               i2c19 = &imux19;
> +               i2c20 = &imux20;
> +               i2c21 = &imux21;
> +               i2c22 = &imux22;
> +               i2c23 = &imux23;
> +
> +               /*
> +                * PCA9548 (8-0070) provides 8 channels connecting to
> +                * SMB (Switch Main Board).
> +                */
> +               i2c24 = &imux24;
> +               i2c25 = &imux25;
> +               i2c26 = &imux26;
> +               i2c27 = &imux27;
> +               i2c28 = &imux28;
> +               i2c29 = &imux29;
> +               i2c30 = &imux30;
> +               i2c31 = &imux31;
> +
> +               /*
> +                * PCA9548 (11-0076) provides 8 channels connecting to
> +                * FCM (Fan Controller Module).
> +                */
> +               i2c32 = &imux32;
> +               i2c33 = &imux33;
> +               i2c34 = &imux34;
> +               i2c35 = &imux35;
> +               i2c36 = &imux36;
> +               i2c37 = &imux37;
> +               i2c38 = &imux38;
> +               i2c39 = &imux39;
> +
> +               spi2 = &spi_gpio;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart1;
> +               bootargs = "console=ttyS0,9600n8 root=/dev/ram rw";
> +       };
> +
> +       ast-adc-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
> +       };
> +
> +       /*
> +        * GPIO-based SPI Master is required to access SPI TPM, because
> +        * full-duplex SPI transactions are not supported by ASPEED SPI
> +        * Controllers.
> +        */
> +       spi_gpio: spi-gpio {
> +               status = "okay";
> +               compatible = "spi-gpio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cs-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_LOW>;
> +               gpio-sck = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
> +               gpio-mosi = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
> +               gpio-miso = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
> +               num-chipselects = <1>;
> +
> +               tpmdev@0 {
> +                       compatible = "tcg,tpm_tis-spi";
> +                       spi-max-frequency = <33000000>;
> +                       reg = <0>;
> +               };
> +       };
> +};
> +
> +/*
> + * Both firmware flashes are 128MB on Wedge400 BMC.
> + */
> +&fmc_flash0 {
> +       partitions {
> +               compatible = "fixed-partitions";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               /*
> +                * u-boot partition: 384KB.
> +                */
> +               u-boot@0 {
> +                       reg = <0x0 0x60000>;
> +                       label = "u-boot";
> +               };
> +
> +               /*
> +                * u-boot environment variables: 128KB.
> +                */
> +               u-boot-env@60000 {
> +                       reg = <0x60000 0x20000>;
> +                       label = "env";
> +               };
> +
> +               /*
> +                * FIT image: 123.5 MB.
> +                */
> +               fit@80000 {
> +                       reg = <0x80000 0x7b80000>;
> +                       label = "fit";
> +               };
> +
> +               /*
> +                * "data0" partition (4MB) is reserved for persistent
> +                * data store.
> +                */
> +               data0@3800000 {
> +                       reg = <0x7c00000 0x800000>;
> +                       label = "data0";
> +               };
> +
> +               /*
> +                * "flash0" partition (covering the entire flash) is
> +                * explicitly created to avoid breaking legacy applications.
> +                */
> +               flash0@0 {
> +                       reg = <0x0 0x8000000>;
> +                       label = "flash0";
> +               };
> +       };
> +};
> +
> +&fmc_flash1 {
> +       partitions {
> +               compatible = "fixed-partitions";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               flash1@0 {
> +                       reg = <0x0 0x8000000>;
> +                       label = "flash1";
> +               };
> +       };
> +};
> +
> +&uart2 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd2_default
> +                    &pinctrl_rxd2_default>;
> +};
> +
> +&uart4 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd4_default
> +                    &pinctrl_rxd4_default>;
> +};
> +
> +/*
> + * I2C bus #0 is multi-master environment dedicated for BMC and Bridge IC
> + * communication.
> + */
> +&i2c0 {
> +       status = "okay";
> +       multi-master;
> +       bus-frequency = <1000000>;
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +               i2c-mux-idle-disconnect;
> +
> +               imux16: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               imux17: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               imux18: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               imux19: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +
> +               imux20: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +               };
> +
> +               imux21: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +               };
> +
> +               imux22: i2c@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +               };
> +
> +               imux23: i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +               };
> +       };
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
> +&i2c8 {
> +       status = "okay";
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +               i2c-mux-idle-disconnect;
> +
> +               imux24: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               imux25: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               imux26: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               imux27: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +
> +               imux28: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +               };
> +
> +               imux29: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +               };
> +
> +               imux30: i2c@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +               };
> +
> +               imux31: i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +               };
> +
> +       };
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +
> +       i2c-switch@76 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x76>;
> +               i2c-mux-idle-disconnect;
> +
> +               imux32: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               imux33: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               imux34: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               imux35: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +
> +               imux36: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +               };
> +
> +               imux37: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +               };
> +
> +               imux38: i2c@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +               };
> +
> +               imux39: i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +               };
> +
> +       };
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +};
> +
> +&adc {
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
> +&sdhci1 {
> +       /*
> +        * DMA mode needs to be disabled to avoid conflicts with UHCI
> +        * Controller in AST2500 SoC.
> +        */
> +       sdhci-caps-mask = <0x0 0x580000>;
> +};
> --
> 2.17.1
>
