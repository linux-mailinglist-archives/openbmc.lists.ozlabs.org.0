Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F396E58A1
	for <lists+openbmc@lfdr.de>; Tue, 18 Apr 2023 07:36:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0t1n2YMSz3cgx
	for <lists+openbmc@lfdr.de>; Tue, 18 Apr 2023 15:35:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aTnyBPQI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com; envelope-from=wangzq.jn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aTnyBPQI;
	dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0t1F1v8Hz3c7S
	for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2023 15:35:28 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-63b5c830d5eso1398045b3a.2
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 22:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681796124; x=1684388124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxDt2UGLM1gHieXFaQ5AHWArTcC1I+IFWNu/7srsFlk=;
        b=aTnyBPQIuZa8WPqqcG3pwvLvv2QAifRkeWYhAcma2IJAvdBReQgvrZh3H60tA9Hkbo
         qBy5ODEK+/X78iTfGoHg6Gp4mQciFOS+Yvxfm1A4jRzqx6m8xua4/qGrurL2pdakf1YL
         RKt2VRA2O5iMdNyGnRm2S8yuwtljg47LkcNrtH47gZTpGYrG6S3lG5p/F/sd2YVj/Knh
         GWNBq0LYPVegbqoD8iIIEer2vYILK+08RznJJLb6oG/9YgYV+eDRW7F/0wriZzqUOkhy
         FHSRtjV/I2FQzLyB1Lmz4jAeyTp4i+RIsw+Lcl5noCzt3Q1Q7XTyttdmTVryJ1irJML6
         julA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681796124; x=1684388124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxDt2UGLM1gHieXFaQ5AHWArTcC1I+IFWNu/7srsFlk=;
        b=jk0rV5Li3JE+Xypzy9CA8De/S+UcsAteLkqG8J1vokdkGaSzwswJSkmQARoiCIt4ii
         /u007/iggiYmdmCuzJ+E31+8oInarcToh6LQCw43q/Vq17Too7PbbLW+iLVOCv8qKmMA
         kvHCdX3vV/P+9d0Y39GMOEAKhPO6VGsypTpcl3oB4P3MdRiJwpfgGRNo6aMkQBCeg/fi
         dB57usaf7RQevvQf89rk405Oq00SJMpvDvICmdXnKN2jBDMjY8lns0q2KD3w6rXgPFXd
         oBT9HdUL/lrr2O1rHLLgRAxdveoGuEM7ItnqubReML/H4+hgJWRM65ndLTw7Zx84zBJ0
         HZsw==
X-Gm-Message-State: AAQBX9eg8Eof48Zp66R4Wo43DXzl1Oo9KUI1BSm1v824b44Ws5A8Lz7/
	XA3zRZ5T/0h2Sg6hKmVZtJie/kVX9/w1z9DMCfE=
X-Google-Smtp-Source: AKy350Z7titx/8c3m630ZicQuzuivEJRhOlHH0UWsNTFWGg9zWPyoyPhIPiBLBR1S7Fjfxkuiup94tKU2eZL8UBPwE4=
X-Received: by 2002:a17:902:d4ce:b0:1a6:b0d3:57f4 with SMTP id
 o14-20020a170902d4ce00b001a6b0d357f4mr389343plg.1.1681796123151; Mon, 17 Apr
 2023 22:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230320044851.3360-1-maxiaoyu_jn@163.com>
In-Reply-To: <20230320044851.3360-1-maxiaoyu_jn@163.com>
From: John Wang <wangzq.jn@gmail.com>
Date: Tue, 18 Apr 2023 13:35:11 +0800
Message-ID: <CAHwNHZVZpOqvkQFx7d_Ejf1twE+6K=ym-m-bfabFvSaL2JwPOg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: Add Inspur NF5280M7 BMC machine
To: maxiaoyu_jn@163.com
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, guoping@inspur.com, maxiaoyu@inspur.com, banht@inspur.com, liuxiwei@inspur.com, joel@jms.id.au, wangxinglong@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<maxiaoyu_jn@163.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8820=E6=97=A5=E5=91=A8=
=E4=B8=80 13:05=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Xiaoyu Ma <maxiaoyu@inspur.com>
>
> the Inspur NF5280M7 is an x86 platform server with an AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
>
> Signed-off-by: Xiaoyu Ma <maxiaoyu@inspur.com>

Reviewed-by: John Wang <wangzhiqiang02@inspur.com>

> ---
> changelog:
> v1:
> -Add Inspur NF5280M7 BMC machine

checked with Xiaoyu, this is the only patch sent to the list, there is
no "v0" version.

>
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-inspur-nf5280m7.dts   | 820 ++++++++++++++++++
>  2 files changed, 821 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 2ee9c043218b..4ada2cb1935e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         aspeed-bmc-intel-s2600wf.dtb \
>         aspeed-bmc-inspur-fp5280g2.dtb \
>         aspeed-bmc-inspur-nf5280m6.dtb \
> +       aspeed-bmc-inspur-nf5280m7.dtb \
>         aspeed-bmc-lenovo-hr630.dtb \
>         aspeed-bmc-lenovo-hr855xg2.dtb \
>         aspeed-bmc-microsoft-olympus.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts b/arch/arm/=
boot/dts/aspeed-bmc-inspur-nf5280m7.dts
> new file mode 100644
> index 000000000000..65f25aef8bd5
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m7.dts
> @@ -0,0 +1,820 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2023 Inspur Corporation
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +       model =3D "Inspur NF5280M7 BMC";
> +       compatible =3D "inspur, nf5280m7-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               i2c200 =3D &bus2_mux70_0;
> +               i2c500 =3D &bus5_mux00;
> +               i2c501 =3D &bus5_mux01;
> +               i2c600 =3D &i2c6s0ch0;
> +               i2c601 =3D &i2c6s0ch1;
> +               i2c602 =3D &i2c6s0ch2;
> +               i2c603 =3D &i2c6s0ch3;
> +               i2c604 =3D &i2c6s0ch4;
> +               i2c605 =3D &i2c6s0ch5;
> +               i2c606 =3D &i2c6s0ch6;
> +               i2c607 =3D &i2c6s0ch7;
> +               i2c610 =3D &i2c6s1ch0;
> +               i2c611 =3D &i2c6s1ch1;
> +               i2c612 =3D &i2c6s1ch2;
> +               i2c613 =3D &i2c6s1ch3;
> +               i2c614 =3D &i2c6s1ch4;
> +               i2c615 =3D &i2c6s1ch5;
> +               i2c616 =3D &i2c6s1ch6;
> +               i2c617 =3D &i2c6s1ch7;
> +               i2c620 =3D &i2c6s2ch0;
> +               i2c621 =3D &i2c6s2ch1;
> +               i2c622 =3D &i2c6s2ch2;
> +               i2c623 =3D &i2c6s2ch3;
> +               i2c624 =3D &i2c6s2ch4;
> +               i2c625 =3D &i2c6s2ch5;
> +               i2c626 =3D &i2c6s2ch6;
> +               i2c627 =3D &i2c6s2ch7;
> +       };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +               bootargs =3D "console=3DttyS4,115200n8 earlycon";
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
> +               video_engine_memory: jpegbuffer {
> +                       size =3D <0x02000000>;    /* 32M */
> +                       alignment =3D <0x01000000>;
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               vga_memory: frammebuffer {
> +                       no-map;
> +                       reg =3D <0x9ff00000 0x01000000>; /* 16M */
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible =3D "iio-hwmon";
> +               io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3=
>,
> +                       <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +                       <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +                       <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +
> +               cpld {
> +                       label =3D "cpld";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(N, 2) GPIO_ACTIVE_H=
IGH>;
> +                       linux,code =3D <ASPEED_GPIO(N, 2)>;
> +               };
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               fan-fault {
> +                       label =3D "fan-fault";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_L=
OW>;
> +               };
> +
> +               system-hot {
> +                       label =3D "system-hot";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(B, 1) GPIO_ACTIVE_L=
OW>;
> +               };
> +
> +               psu-fault {
> +                       label =3D "psu-fault";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(B, 2) GPIO_ACTIVE_L=
OW>;
> +               };
> +
> +               heartbeat {
> +                       label =3D "heartbeat";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_L=
OW>;
> +               };
> +
> +               memory-fault {
> +                       label =3D "memory-fault";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(Y, 2) GPIO_ACTIVE_L=
OW>;
> +               };
> +
> +               system-fault {
> +                       label =3D "system-fault";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(Y, 3) GPIO_ACTIVE_L=
OW>;
> +               };
> +       };
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bmc";
> +               spi-max-frequency =3D <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +       };
> +       flash@1 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "alt-bmc";
> +               spi-max-frequency =3D <50000000>;
> +#include "openbmc-flash-layout-64-alt.dtsi"
> +       };
> +};
> +
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
> +       };
> +};
> +
> +&peci0 {
> +       status =3D "okay";
> +       gpios =3D <&gpio0 ASPEED_GPIO(F, 6) 0>;
> +
> +       peci-client@30 {
> +               compatible =3D "intel,peci-client";
> +               reg =3D <0x30>;
> +       };
> +
> +       peci-client@31 {
> +               compatible =3D "intel,peci-client";
> +               reg =3D <0x31>;
> +       };
> +};
> +
> +&gpio0 {
> +       status =3D "okay";
> +       gpio-line-names =3D
> +       /*A0-A7*/       "","","","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "","","","","","","","",
> +       /*E0-E7*/       "","","","","","","","",
> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","POWER_OUT","RESET_OUT","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "RESET_BUTTON","","","NMI_BUTTON","NMI_OUT","",""=
,"",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","","","","","","",
> +       /*S0-S7*/       "","","","SIO_ONCONTROL","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","SIO_S5","POWER_BUTTON","","PS_PWROK","","",""=
,
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","POST_COMPLETE","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "","","","","","","","";
> +};
> +
> +&kcs3 {
> +       aspeed,lpc-io-reg =3D <0xCA2>;
> +       status =3D "okay";
> +};
> +
> +&kcs4 {
> +       aspeed,lpc-io-reg =3D <0xCA4>;
> +       status =3D "okay";
> +};
> +
> +&lpc_snoop {
> +       snoop-ports =3D <0x80>;
> +       status =3D "okay";
> +};
> +
> +&mdio1 {
> +       status =3D "okay";
> +
> +       ethphy1: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0>;
> +       };
> +};
> +
> +&mac2 {
> +       status =3D "okay";
> +
> +       phy-mode =3D "rgmii";
> +       phy-handle =3D <&ethphy1>;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii3_default>;
> +};
> +
> +&mac3 {
> +       status =3D "okay";
> +
> +       phy-mode =3D "rmii";
> +       use-ncsi;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rmii4_default>;
> +};
> +
> +&adc0 {
> +       status =3D "okay";
> +};
> +
> +&adc1 {
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
> +&uart4 {
> +       status =3D "okay";
> +};
> +
> +&uart5 {
> +       status =3D "okay";
> +};
> +
> +&vuart1 {
> +       status =3D "okay";
> +};
> +
> +&i2c0 {
> +       multi-master;
> +       status =3D "okay";
> +};
> +
> +&i2c1 {
> +       multi-master;
> +       status =3D "okay";
> +
> +       eeprom@50 {
> +               compatible =3D "atmel,24c256";
> +               reg =3D <0x50>;
> +       };
> +};
> +
> +&i2c2 {
> +       status =3D "okay";
> +       pca9546@70{
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x70>;
> +               bus2_mux70_0: i2c@2{
> +                       reg =3D <0>;
> +                       tmp112@49{
> +                               compatible =3D "ti,tmp112";
> +                               reg =3D <0x49>;
> +                               label =3D "Inlet_Temp";
> +                       };
> +                       emc1413@4c{
> +                               compatible =3D "microchip,emc1413";
> +                               reg =3D <0x4c>;
> +                               label =3D "Outlet_Temp";
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c4 {
> +       multi-master;
> +       status =3D "okay";
> +       ipmb0@10 {
> +               compatible =3D "ipmb-dev";
> +               reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c5 {
> +       bus-frequency =3D <1000000>;
> +       multi-master;
> +       status =3D "okay";
> +       pca9546@70{
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x70>;
> +               bus5_mux00: i2c@0 {
> +                       reg =3D <0>;
> +                       status =3D "okay";
> +                       vrmp2888@76 {
> +                               compatible =3D "mps,mp2888";
> +                               reg =3D <0x76>;
> +                       };
> +                       vrmp2888@72 {
> +                               compatible =3D "mps,mp2888";
> +                               reg =3D <0x72>;
> +                       };
> +                       vrmp2888@62{
> +                               compatible =3D "mps,mp2888";
> +                               reg =3D <0x62>;
> +                       };
> +               };
> +               bus5_mux01: i2c@1{
> +                       reg =3D <1>;
> +                       status =3D "okay";
> +                       vrmp2888@76{
> +                               compatible =3D "mps,mp2888";
> +                               reg =3D <0x76>;
> +                       };
> +                       vrmp2888@72 {
> +                               compatible =3D "mps,mp2888";
> +                               reg =3D <0x72>;
> +                       };
> +                       vrmp2888@62{
> +                               compatible =3D "mps,mp2888";
> +                               reg =3D <0x62>;
> +                       };
> +               };
> +               bus5_mux02: i2c@2{
> +                       reg =3D <2>;
> +               };
> +               bus5_mux03: i2c@3{
> +                       reg =3D <3>;
> +               };
> +       };
> +};
> +
> +&i2c6 {
> +       multi-master;
> +       status =3D "okay";
> +
> +       i2c-switch@70 {
> +               compatible =3D "nxp,pca9548";
> +               reg =3D <0x70>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               i2c6s0ch0: i2c@0 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <0>;
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +                       pca9548@71 {
> +                               compatible =3D "nxp,pca9548";
> +                               reg =3D <0x71>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               i2c6s1ch0: i2c@0 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <0>;
> +                               };
> +                               i2c6s1ch1: i2c@1 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <1>;
> +                               };
> +                               i2c6s1ch2: i2c@2 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <2>;
> +                               };
> +                               i2c6s1ch3: i2c@3 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <3>;
> +                               };
> +                               i2c6s1ch4: i2c@4 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <4>;
> +                               };
> +                               i2c6s1ch5: i2c@5 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <5>;
> +                               };
> +                               i2c6s1ch6: i2c@6 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <6>;
> +                               };
> +                               i2c6s1ch7: i2c@7 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <7>;
> +                               };
> +                       };
> +
> +                       pca9548@72 {
> +                               compatible =3D "nxp,pca9548";
> +                               reg =3D <0x72>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               i2c6s2ch0: i2c@0 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <0>;
> +                               };
> +                               i2c6s2ch1: i2c@1 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <1>;
> +                               };
> +                               i2c6s2ch2: i2c@2 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <2>;
> +                               };
> +                               i2c6s2ch3: i2c@3 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <3>;
> +                               };
> +                               i2c6s2ch4: i2c@4 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <4>;
> +                               };
> +                               i2c6s2ch5: i2c@5 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <5>;
> +                               };
> +                               i2c6s2ch6: i2c@6 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <6>;
> +                               };
> +                               i2c6s2ch7: i2c@7 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       reg =3D <7>;
> +                               };
> +                       };
> +               };
> +               i2c6s0ch1: i2c@1 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <1>;
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +               };
> +               i2c6s0ch2: i2c@2 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <2>;
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +               };
> +               i2c6s0ch3: i2c@3 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <3>;
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +               };
> +               i2c6s0ch4: i2c@4 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <4>;
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +               };
> +               i2c6s0ch5: i2c@5 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <5>;
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +               };
> +               i2c6s0ch6: i2c@6 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <6>;
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +               };
> +               i2c6s0ch7: i2c@7 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <7>;
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c7 {
> +       multi-master;
> +       #retries =3D <3>;
> +       status =3D "okay";
> +
> +       adc128d818@1d {
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x1d>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +       adc128d818@1e {
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x1e>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +       adc128d818@2d {
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x2d>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +       ina226@45 {
> +               compatible =3D "ti,ina226";
> +               reg =3D <0x45>;
> +               shunt-resistor =3D <500>;
> +       };
> +};
> +
> +&i2c8 {
> +       multi-master;
> +       status =3D "okay";
> +};
> +
> +&i2c9 {
> +       multi-master;
> +       status =3D "okay";
> +};
> +
> +&i2c10 {
> +       status =3D "okay";
> +
> +       pca0: pca9555@21 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x21>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D
> +                       "", "", "", "",
> +                       "", "",
> +                       "FAN_PRSNT8_D_N", "FAN_PRSNT9_D_N",
> +                       "", "", "", "",
> +                       "", "", "", "";
> +
> +               gpio@0 {
> +                       reg =3D <0>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg =3D <1>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg =3D <2>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg =3D <3>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg =3D <4>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg =3D <5>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg =3D <6>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg =3D <7>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg =3D <8>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg =3D <9>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg =3D <10>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg =3D <11>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg =3D <12>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg =3D <13>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg =3D <14>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg =3D <15>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       pca1: pca9555@22 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x22>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D "FAN_PRSNT0_D_N", "FAN_PRSNT1_D_N",
> +                       "FAN_PRSNT2_D_N", "FAN_PRSNT3_D_N",
> +                       "FAN_PRSNT4_D_N", "FAN_PRSNT5_D_N",
> +                       "FAN_PRSNT6_D_N", "FAN_PRSNT7_D_N",
> +                       "", "", "", "",
> +                       "", "", "", "";
> +
> +               gpio@0 {
> +                       reg =3D <0>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg =3D <1>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg =3D <2>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg =3D <3>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg =3D <4>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg =3D <5>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg =3D <6>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg =3D <7>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg =3D <8>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg =3D <9>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg =3D <10>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg =3D <11>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg =3D <12>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg =3D <13>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg =3D <14>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg =3D <15>;
> +                       type =3D <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +};
> +
> +&i2c11 {
> +       status =3D "okay";
> +
> +       power-supply@58 {
> +               compatible =3D "inspur,ipsps1";
> +               reg =3D <0x58>;
> +       };
> +
> +       power-supply@59 {
> +               compatible =3D "inspur,ipsps1";
> +               reg =3D <0x59>;
> +       };
> +};
> +
> +&i2c12 {
> +       multi-master;
> +       status =3D "okay";
> +};
> +
> +&i2c13 {
> +       multi-master;
> +       status =3D "okay";
> +};
> +
> +&video {
> +       status =3D "okay";
> +       memory-region =3D <&video_engine_memory>;
> +};
> +
> +&vhub {
> +       status =3D "okay";
> +};
> --
> 2.39.2
>
