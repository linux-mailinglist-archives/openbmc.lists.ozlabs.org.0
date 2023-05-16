Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC28470444D
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 06:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL32J4KPBz3ccg
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 14:20:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Xd7maw26;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Xd7maw26;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL31k5wspz3c71
	for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 14:20:24 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so24786639a12.1
        for <openbmc@lists.ozlabs.org>; Mon, 15 May 2023 21:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1684210821; x=1686802821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tdMRovLN/hTZraCQ3q2mwt0FrJ8YNGXuvvijMdcnsA=;
        b=Xd7maw26TzYgY37S4VxtCdWA69Ioj6sZ36Hxv1Z8iBnQ9Uu1B5MacBXJDowzIMC0Xw
         QEhPyzAV35v/4xFPIRPx8EI0I4q12uLOqLVfg4zBlRl/AKtlZLsO2JBTSZ148gPcemaP
         Pjt5jMkmJcSIxD/MIr2PmExtp/dTDhS+7EMqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684210821; x=1686802821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tdMRovLN/hTZraCQ3q2mwt0FrJ8YNGXuvvijMdcnsA=;
        b=bLtcCTQ65+ncCbl+72sy8ADBwFi20CzmdlgO7i2KHnQ/NRfnuHL3ICfAhu6BDTwRc+
         0S5Wk9oMqNVrlV3AY/qyIsKQlyBaBuJU1XZlLdZzW0BXh7oBPPioG6AlbFPP3Nmad1uI
         k9ZTAYEuRgKr1vhuupikT2NcvKOZAPSlZJhblh+rgfH0/P/jhqCeudipmsUFiBBgih3M
         L4KIop/lpwC5WuzlXLQEcXRbCLlLYPpMznwr7nU2VWZkjsD78E/gRcDTefWSGJY5rJiO
         y/aI6YhS9U4MxSaNT9zFq3IwMOXCV93qerFroXk3FbXjabXxkgt7FVAqEIxQtwRpjckC
         5vyQ==
X-Gm-Message-State: AC+VfDzBqFGmm9cd3fU6Uf5wlpCwA9UZRAptNHSxoYhFRoko475u9GJB
	C6cuAgkrgfqaKzVyrr13tiaGsO+dGjjWnVYm2jk+mC+f+0w=
X-Google-Smtp-Source: ACHHUZ79pGSXwK5FInXoRBjw2Txj78okulFXCCk5vu83QlVEDnAJf+v/3xOlI/R2fWJmNweqk20D09GDPfbb8jg8fYI=
X-Received: by 2002:a17:907:d0d:b0:96b:48d2:77ef with SMTP id
 gn13-20020a1709070d0d00b0096b48d277efmr4823396ejc.6.1684210820399; Mon, 15
 May 2023 21:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <d0cd49b86ba6446e8ed78cbeea0e8c1d@inventec.com>
In-Reply-To: <d0cd49b86ba6446e8ed78cbeea0e8c1d@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 May 2023 04:20:08 +0000
Message-ID: <CACPK8Xd+h4iYeLtnk48BiiUw1XOHxc5Obn5BRB-XkJptf6pQJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 16 May 2023 at 03:11, Chen.PJ =E9=99=B3=E6=9F=8F=E4=BB=BB TAO <Chen=
.PJ@inventec.com> wrote:
>
> Initial introduction of Inventec Starscream x86 family equipped with AST2=
600 BMC SoC.

Looks good. I like the name.

Can you use scripts/get_maintainers.pl to send the next version to the
appropriate upstream lists?

Some review comments below.

>
> Signed-off-by: chen.pj <chen.pj@inventec.com>

Update your git config and re-generate the commit:

git config --global user.name "Chen PJ"
git commit --amend --reset-author

Obviously adjust the name to be whatever you want to be referred to in
the kernel commit logs.

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-inventec-starscream.dts    | 550 ++++++++++++++++++
>  2 files changed, 551 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index eb681903d50b..0002290ae028 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1630,6 +1630,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         aspeed-bmc-quanta-s6q.dtb \
>         aspeed-bmc-supermicro-x11spi.dtb \
>         aspeed-bmc-inventec-transformers.dtb \
> +       aspeed-bmc-inventec-starscream.dtb \
>         aspeed-bmc-tyan-s7106.dtb \
>         aspeed-bmc-tyan-s8036.dtb \
>         aspeed-bmc-vegman-n110.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts b/arch/=
arm/boot/dts/aspeed-bmc-inventec-starscream.dts
> new file mode 100644
> index 000000000000..6a78a5032a87
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inventec-starscream.dts
> @@ -0,0 +1,550 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2019 IBM Corp.

Is this correct?

> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include "aspeed-g6-pinctrl.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model =3D "STARSCREAM BMC";
> +       compatible =3D "inventec,starscream-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               serial4 =3D &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +               bootargs =3D "console=3Dtty0 console=3DttyS4,115200n8 roo=
t=3D/dev/ram rw init=3D/linuxrc";
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x80000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               gfx_memory: framebuffer {
> +                       size =3D <0x01000000>;
> +                       alignment =3D <0x01000000>;
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               video_engine_memory: video {
> +                       size =3D <0x04000000>;
> +                       alignment =3D <0x01000000>;
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               ssp_memory: ssp_memory {
> +                       size =3D <0x00200000>;
> +                       alignment =3D <0x00100000>;
> +                       compatible =3D "shared-dma-pool";
> +                       no-map;
> +               };
> +       };
> +
> +       vga-shared-memory {
> +               compatible =3D "aspeed,ast2500-vga-sharedmem";

This isn't something our kernels support. Did you test this with an
openbmc or mainline kernel?

> +               reg =3D <0xbff00000 0x10000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible =3D "iio-hwmon";
> +               io-channels =3D
> +               <&adc_u74 0>, // P0_VDD11
> +               <&adc_u74 1>, // P1_VDD11
> +               <&adc_u74 2>, // P0_3V3_S5
> +               <&adc_u74 3>, // P1_3V3_S5
> +               <&adc_u74 4>, // P3V3
> +               <&adc_u74 5>, // VBAT
> +               <&adc_u74 6>, // P3V3_STBY
> +               <&adc_u74 7>, // P5V_STBY
> +               <&adc_u74 8>, // P5V
> +               <&adc_u74 9>, // P12V
> +               <&adc_u74 10>, // P1_VDD18_S5
> +               <&adc_u74 11> // P0_VDD18_S5
> +               ;
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               // UID led
> +               uid {
> +                       label =3D "UID_LED";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(X, 2) GPIO_ACTIVE_L=
OW>;
> +               };
> +
> +               // Heart beat led
> +               heartbeat {
> +                       label =3D "HB_LED";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_L=
OW>;
> +               };
> +       };
> +};
> +
> +&mdio0 {
> +       status =3D "okay";
> +
> +       ethphy0: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <1>;
> +       };
> +};
> +
> +&mac2 {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       phy-mode =3D "rmii";
> +       pinctrl-0 =3D <&pinctrl_rmii3_default>;
> +       use-ncsi;
> +};
> +
> +&mac3 {
> +       status =3D "okay";
> +
> +       phy-mode =3D "rgmii";
> +       phy-handle =3D <&ethphy0>;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii4_default>;
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bmc";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <4>;
> +               spi-rx-bus-width =3D <4>;
> +
> +               partitions {
> +                       compatible =3D "fixed-partitions";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +
> +                       u-boot@0 {
> +                               reg =3D <0x0 0xe0000>; // 896KB

This layout looks like the openbmc layout we have in the tree. You
should be able to do #include openbmc-flash-layout.dtsi or similar.

> +                               label =3D "u-boot";
> +                       };
> +
> +                       u-boot-env@e0000 {
> +                               reg =3D <0xe0000 0x20000>; // 128KB
> +                               label =3D "u-boot-env";
> +                       };
> +
> +                       kernel@100000 {
> +                               reg =3D <0x100000 0x900000>; // 9MB
> +                               label =3D "kernel";
> +                       };
> +
> +                       rofs@a00000 {
> +                               reg =3D <0xa00000 0x2000000>; // 32MB
> +                               label =3D "rofs";
> +                       };
> +
> +                       rwfs@2a00000 {
> +                               reg =3D <0x2a00000 0x1600000>; // 22MB
> +                               label =3D "rwfs";
> +                       };
> +               };
> +       };
> +
> +       flash@1 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bmc2";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <4>;
> +               spi-rx-bus-width =3D <4>;
> +       };
> +};
> +
> +&spi1 {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bios";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <4>;
> +               spi-rx-bus-width =3D <4>;
> +       };
> +};
> +
> +
> +&wdt1 {
> +       status =3D "okay";
> +};
> +
> +&vuart1 {
> +       status =3D "okay";
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> +
> +&uart3 {
> +       status =3D "okay";
> +};
> +
> +&uart5 {
> +       status =3D "okay";
> +};
> +
> +&kcs3 {
> +       reg =3D <0x2c 0x1>, <0x38 0x1>, <0x44 0x1>;

The board file gets these from ast2600-g6.dtsi, you don't need to
re-specify them here.

> +       aspeed,lpc-io-reg =3D <0xca2>;
> +       status =3D "okay";
> +};
> +
> +&uart_routing {
> +       status =3D "okay";
> +};
> +
> +&i2c0 {
> +       status =3D "okay";
> +};
> +&i2c1 {
> +       status =3D "okay";
> +};
> +&i2c2 {
> +       status =3D "okay";
> +};
> +&i2c3 {
> +       status =3D "okay";
> +};
> +
> +&i2c4 {
> +       status =3D "okay";
> +
> +       // I2C EXPANDER
> +       i2c-switch@71 {
> +               compatible =3D "nxp,pca9546";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x71>;
> +
> +               i2c@0 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <0>;
> +                       // AMD SB-TSI CPU1
> +                       sbtsi@4c {
> +                               compatible =3D "amd,sbtsi";
> +                               reg =3D <0x4c>;
> +                       };
> +               };
> +
> +               i2c@1 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <1>;
> +                       // AMD SB-TSI CPU2
> +                       sbtsi@48 {
> +                               compatible =3D "amd,sbtsi";
> +                               reg =3D <0x48>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c5 {
> +       status =3D "okay";
> +
> +       // I2C EXPANDER U153
> +       i2c-switch@70 {
> +               compatible =3D "nxp,pca9546";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x70>;
> +
> +               usb_hub:i2c@0 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <0>;
> +
> +                       // USB U114
> +                       usb2512b@2c {
> +                               compatible =3D "microchip,usb2514b";
> +                               reg =3D <0x2c>;
> +                       };
> +               };
> +
> +               riser1:i2c@1 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <1>;
> +               };
> +
> +               riser2:i2c@2 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <2>;
> +               };
> +
> +               i2c@3 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <3>;
> +               };
> +       };
> +};
> +
> +&i2c6 {
> +       status =3D "okay";
> +
> +       // FRU Motherboard
> +       eeprom@51 {
> +               compatible =3D "atmel,24c64";
> +               reg =3D <0x51>;
> +               pagesize =3D <32>;
> +       };
> +
> +       // ADC_U74
> +       adc_u74:max1139@35 {
> +               compatible =3D "maxim,max1139";
> +               reg =3D <0x35>;
> +               #io-channel-cells =3D <1>;
> +       };
> +
> +       psu@58 {
> +               compatible =3D "pmbus";
> +               reg =3D <0x58>;
> +       };
> +
> +       psu@5a {
> +               compatible =3D "pmbus";
> +               reg =3D <0x5a>;
> +       };
> +
> +       // Motherboard Temp_U89
> +       tmp421@4e {
> +               compatible =3D "ti,tmp421";
> +               reg =3D <0x4e>;
> +       };
> +
> +       // RunBMC Temp_U6
> +       tmp75@49 {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x49>;
> +       };
> +
> +       // Right ear board Temp_U1
> +       emc1412@7c {
> +               compatible =3D "emc1403";
> +               reg =3D <0x7c>;
> +       };
> +};
> +
> +&i2c7 {
> +       status =3D "okay";
> +       // I2C EXPANDER U40
> +       i2c-switch@70 {
> +               compatible =3D "nxp,pca9545";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x70>;
> +
> +               i2c@0 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <0>;
> +               };
> +
> +               i2c@1 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <1>;
> +               };
> +
> +               i2c@2 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <2>;
> +               };
> +
> +               i2c@3 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <3>;
> +               };
> +       };
> +};
> +
> +
> +&i2c8 {
> +       status =3D "okay";
> +       // FRU RunBMC
> +       eeprom@51 {
> +               compatible =3D "atmel,24c512";
> +               reg =3D <0x51>;
> +               pagesize =3D <128>;
> +       };
> +
> +       // Fan controller
> +       max31790@20 {
> +               compatible =3D "maxim,max31790";
> +               reg =3D <0x20>;
> +       };
> +       max31790@23 {
> +               compatible =3D "maxim,max31790";
> +               reg =3D <0x23>;
> +       };
> +       emc2302@2e {
> +               compatible =3D "smsc,emc2305";
> +               reg =3D <0x2e>;
> +       };
> +
> +       pac1934@13 {
> +               compatible =3D "microchip,pac1934";
> +               reg =3D <0x13>;
> +               shunt-resistors =3D <4000 4000 4000 4000>;
> +       };
> +
> +       pac1932@12 {
> +               compatible =3D "microchip,pac1932";
> +               reg =3D <0x12>;
> +               shunt-resistors =3D <4000 4000>;
> +       };
> +};
> +
> +&i2c9 {
> +       status =3D "okay";
> +};
> +
> +&i2c10 {
> +       status =3D "okay";
> +};
> +
> +&i2c11 {
> +       status =3D "okay";
> +};
> +
> +&i2c12 {
> +       status =3D "okay";
> +       // FRU SCM
> +       eeprom@51 {
> +               compatible =3D "atmel,24c512";
> +               reg =3D <0x51>;
> +               pagesize =3D <128>;
> +       };
> +
> +       // SCM Temp_U17
> +       tmp75@4f {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x4f>;
> +       };
> +};
> +
> +
> +&gpio0 {
> +       status =3D "okay";
> +       gpio-line-names =3D
> +       /*A0-A7*/   "","","","","","","","",
> +       /*B0-B7*/   "alert-psu0-smb-r-n","bmc-ready","","assert-cpu0-proc=
hot-r-n","","","","",
> +       /*C0-C7*/   "","","","","","","","",
> +       /*D0-D7*/   "","","","","","","","",
> +       /*E0-E7*/   "","","","","","","","",
> +       /*F0-F7*/   "","","","","reset-sgpio-r-n","","","",
> +       /*G0-G7*/   "","","scm-jtag-mux-select","","","","","",
> +       /*H0-H7*/   "","","","","reset-out","power-out","","",
> +       /*I0-I7*/   "","","","","","","irq-bmc-cpu0-buf-nmi-n","",
> +       /*J0-J7*/   "","","","","","","","",
> +       /*K0-K7*/   "","","","","","","","",
> +       /*L0-L7*/   "","","","","","","","",
> +       /*M0-M7*/   "","","","","","","","",
> +       /*N0-N7*/   "","","ncsi-ocp-clk-en-n","","","","","",
> +       /*O0-O7*/   "","","","","","","cpu1-thermal-trip-n","",
> +       /*P0-P7*/   "","","","","","","","",
> +       /*Q0-Q7*/   "cpu0-prochot-n","","cpu1-prochot-n","","cpu0-pe-rst0=
","","","",
> +       /*R0-R7*/   "","","","","","","","",
> +       /*S0-S7*/   "","","","","","PCH_SLP_S4_BMC_N","cpu0-thermtrip-n",=
"alert-psu1-smb-r-n",
> +       /*T0-T7*/   "","","","","","","","",
> +       /*U0-U7*/   "","","","","","","","",
> +       /*V0-V7*/   "bios-recovery-buf-n","","assert-cpu1-prochot-r-n",""=
,"power-chassis-good","","","",
> +       /*W0-W7*/   "","","","","","","","",
> +       /*X0-X7*/   "","","","","platform-type","","","",
> +       /*Y0-Y7*/   "","","","","","","","",
> +       /*Z0-Z7*/   "","cpld-power-break-n","","","","","","",
> +       /*AA0-AA7*/ "","","","","","","","",
> +       /*AB0-AB7*/ "","","","","","","","",
> +       /*AC0-AC7*/ "","","","","","","","";
> +};
> +
> +&sgpiom0 {
> +       status =3D "okay";
> +       max-ngpios =3D <64>;
> +       ngpios =3D <64>;
> +       bus-frequency =3D <1000000>;
> +       gpio-line-names =3D
> +       /*in - out - in - out */
> +       /*A0-A7*/   "","","","","","","","",
> +       /*A0-A7*/   "","","","","","","","",
> +       /*B0-B7*/   "","reset-cpu0-i2c-n","","reset-cpu1-i2c-n","","reset=
-i2c-bus7-n","","usb2514-1-reset-n",
> +       /*B0-B7*/   "","bmc-cpu0-uart-en","","hdt-buff-en-n","","assert-c=
lear-cmos","","hdt-mux-select-mon",
> +       /*C0-C7*/   "led-identify","cpld-jtag-oe-r-n","cpu0-spd-host-ctrl=
-n","reset-cpld-hdt-n","","i3c-mux-select","","spi-mux-select",
> +       /*C0-C7*/   "","","","","","","","",
> +       /*D0-D7*/   "","","","","","","","",
> +       /*D0-D7*/   "","","","","","","bios-post-complete-buf-n","",
> +       /*E0-E7*/   "","","","","","","","",
> +       /*E0-E7*/   "","","","","","","","",
> +       /*F0-F7*/   "presence-fan0-n","","presence-fan1-n","","presence-f=
an2-n","","presence-fan3-n","",
> +       /*F0-F7*/   "presence-fan4-n","","presence-fan5-n","","presence-c=
pu0-n","","presence-cpu1-n","",
> +       /*G0-G7*/   "","","","","","","","",
> +       /*G0-G7*/   "","","","","presence-psu0-cpld-n","","presence-psu1-=
cpld-n","",
> +       /*H0-H7*/   "","","","","","","","",
> +       /*H0-H7*/   "","","","","presence-riser0-n","","presence-riser1-n=
","";
> +};
> +
> +
> +&lpc_snoop {
> +       status =3D "okay";
> +       snoop-ports =3D <0x80>;
> +};
> +
> +&emmc_controller {
> +       status =3D "okay";
> +       timing-phase =3D <0x700FF>;

This needs to be changed to use the format supported by the mainline
kernel. It changed from the aspeed SDK.

> +};
> +
> +&emmc {
> +       status =3D "okay";
> +       non-removable;
> +       max-frequency =3D <52000000>;
> +       bus-width =3D <8>;
> +};
> +
> +&video {
> +       status =3D "okay";
> +       memory-region =3D <&video_engine_memory>;
> +};
> +
> +&vhub {
> +       status =3D "okay";
> +       aspeed,vhub-downstream-ports =3D <7>;
> +       aspeed,vhub-generic-endpoints =3D <21>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_usb2ad_default>;
> +};
> +
> +&rtc {
> +       status =3D "okay";
> +};
> +
> --
> 2.25.1
>
