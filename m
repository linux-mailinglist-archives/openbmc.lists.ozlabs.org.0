Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AFC819BFD
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 11:04:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mzJB2yGO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sw8KZ5hgRz3bdm
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 21:04:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mzJB2yGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com; envelope-from=wangzq.jn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sw8K248czz30YP
	for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 21:03:34 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-5cdc7e18152so582535a12.3
        for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 02:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703066612; x=1703671412; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6sOE6Y2bDQParqZU2Rgv4r4F9c4d7Q3E/vhtR0L/to=;
        b=mzJB2yGOBEeiS1fCUoH3COMHz+FX2zff7FYDq2HQbDYF/tenHBoWEUTZ9cfrJuTZxe
         qYqokKnNToNylKccwJr6Q9XgzfAIxJW3lwUGYcObi8M9h0f+vwwhLqkFZ0n0yTpua+XF
         h/4BUmBbfb/IcPynDthrQ+8sppsll/wQJx9fhf/NcUxYorgMnyUKFHpUC5NW2nFRO//H
         R6ALTs3RvfnK+eXWwnHk3ggx9Qd8pdfghjplEkTCZjIm/bUi/3ig9lLabYlqfcYrTTJO
         hoyvfWHhHRBSgk1CZegt+asv7O8viZW2dafEDVAaP9ZQDuubvtdBW2wpM5VGrkNUAViY
         3ejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703066612; x=1703671412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6sOE6Y2bDQParqZU2Rgv4r4F9c4d7Q3E/vhtR0L/to=;
        b=BiRZFuQtVLZ5OiZj9tSsVFZfN2hwenSa+HDFvWqbiyhLGbV2ojnjfDLgUEjyxKoP/X
         VfnmbSXqfEL1R7NSRQtlNM7jLzJLkSX2+vmuR1tLZT1pF2RmvCnnteg0/860lD/AZbgT
         ix+/BPdoqJJeYpPQMChypWkS4sdvVHP42dt7WaYv5Q7qWNCc8PIHFBDOnQK+DcYJ3kA3
         c29rLUsPNGenG2mG8cxvcR0InWjM7eBtDoQ3+DpT+/MJZdqBXcjvqLlIVhSpttPH602M
         CepoNOIGZ2SWGTfk2vNuj44P199tO9zLPw1q+jGbzHDs58p/v5zJY0X86UScNeBa0gRS
         lKqQ==
X-Gm-Message-State: AOJu0Yy4IdIwcMv1GmSc6Yt23g4Z+8UEUf28oMFR5cdlTVka2NDa41iU
	UEgWR3RTR9pFPvok1YAmDnHNXgI8sbIubWS1f+EgcFy7Lyikjg==
X-Google-Smtp-Source: AGHT+IEuhVtxuezziiTCcNJQcGOA/FJupquflwWhAuxbvEyOjM50aIGS9mRiPSyUiBFdDRqmveu6kbhstIgisbqfkes=
X-Received: by 2002:a17:90b:438d:b0:28b:57b6:9a6c with SMTP id
 in13-20020a17090b438d00b0028b57b69a6cmr4048699pjb.37.1703066610894; Wed, 20
 Dec 2023 02:03:30 -0800 (PST)
MIME-Version: 1.0
References: <20231220095004.2036251-1-liuxiwei@ieisystem.com>
In-Reply-To: <20231220095004.2036251-1-liuxiwei@ieisystem.com>
From: John Wang <wangzq.jn@gmail.com>
Date: Wed, 20 Dec 2023 18:03:19 +0800
Message-ID: <CAHwNHZW592hyECdF=630otD9_nanR0QNuaHntWaVQUPVOvLAhQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add IEISystems FP5280G3 BMC machine
To: George Liu <liuxiwei1013@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, chenqiuyi01@ieisystem.com, wangzhiqiang02@ieisystem.com, duanzhijia01@ieisystem.com, suxiao@ieisystem.com, joel@jms.id.au, banht@ieisystem.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 20, 2023 at 5:50=E2=80=AFPM George Liu <liuxiwei1013@gmail.com>=
 wrote:
>
> The IEISystems FP5280G3 is a power platform server with an
> AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
>
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>

Reviewed-by: John Wang <wangzhiqiang02@ieisystem.com>
Tested-by: John Wang <wangzhiqiang02@ieisystem.com>

> ---
> v1 -> v2
>   - Include ibm-power10-quad.dtsi
>   - Remove redundant blank lines
>   - Remove nct7362 driver
>   - Remove bus-timeout-ms & bus-recover-timeout-ms
>   - Remove reset-mask1
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed/aspeed-bmc-ieisystems-fp5280g3.dts | 966 ++++++++++++++++++
>  2 files changed, 967 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280=
g3.dts
>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index fb9cc95f1b60..6017ff5b7959 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -36,6 +36,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         aspeed-bmc-ibm-rainier.dtb \
>         aspeed-bmc-ibm-rainier-1s4u.dtb \
>         aspeed-bmc-ibm-rainier-4u.dtb \
> +       aspeed-bmc-ieisystems-fp5280g3.dtb \
>         aspeed-bmc-intel-s2600wf.dtb \
>         aspeed-bmc-inspur-fp5280g2.dtb \
>         aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts =
b/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts
> new file mode 100644
> index 000000000000..51f0c8903b63
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts
> @@ -0,0 +1,966 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023, IEISystems Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model =3D "FP5280G3 BMC";
> +       compatible =3D "ieisystems,fp5280g3-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               i2c2001 =3D &i2c2s0ch1;
> +               i2c2002 =3D &i2c2s0ch2;
> +               i2c5000 =3D &i2c5s0ch0;
> +               i2c5001 =3D &i2c5s0ch1;
> +               i2c5002 =3D &i2c5s0ch2;
> +               i2c5003 =3D &i2c5s0ch3;
> +               i2c6000 =3D &i2c6s0ch0;
> +               i2c6001 =3D &i2c6s0ch1;
> +               i2c6002 =3D &i2c6s0ch2;
> +               i2c6003 =3D &i2c6s0ch3;
> +               i2c6004 =3D &i2c6s0ch4;
> +               i2c6005 =3D &i2c6s0ch5;
> +               i2c6100 =3D &i2c6s1ch0;
> +               i2c6101 =3D &i2c6s1ch1;
> +               i2c6200 =3D &i2c6s2ch0;
> +               i2c6201 =3D &i2c6s2ch1;
> +               i2c12000 =3D &i2c12s0ch0;
> +               i2c12001 =3D &i2c12s0ch1;
> +               i2c12002 =3D &i2c12s0ch2;
> +               i2c12003 =3D &i2c12s0ch3;
> +               i2c12100 =3D &i2c12s1ch0;
> +               i2c12101 =3D &i2c12s1ch1;
> +               i2c12102 =3D &i2c12s1ch2;
> +               i2c13000 =3D &i2c13s0ch0;
> +               i2c13001 =3D &i2c13s0ch1;
> +               i2c13002 =3D &i2c13s0ch2;
> +               i2c13003 =3D &i2c13s0ch3;
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
> +               ramoops@b3e00000 {
> +                       compatible =3D "ramoops";
> +                       reg =3D <0xb3e00000 0x200000>; /* 16 * (4 * 0x800=
0) */
> +                       record-size =3D <0x8000>;
> +                       console-size =3D <0x8000>;
> +                       ftrace-size =3D <0x8000>;
> +                       pmsg-size =3D <0x8000>;
> +                       max-reason =3D <3>; /* KMSG_DUMP_EMERG */
> +               };
> +
> +               /* LPC FW cycle bridge region requires natural alignment =
*/
> +               flash_memory: region@b4000000 {
> +                       no-map;
> +                       reg =3D <0xb4000000 0x04000000>; /* 64M */
> +               };
> +
> +               /* VGA region is dictated by hardware strapping */
> +               vga_memory: region@bf000000 {
> +                       no-map;
> +                       compatible =3D "shared-dma-pool";
> +                       reg =3D <0xbf000000 0x01000000>;  /* 16M */
> +               };
> +
> +               video_engine_memory: jpegbuffer {
> +                       size =3D <0x02000000>;    /* 32M */
> +                       alignment =3D <0x01000000>;
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +               };
> +               gfx_memory: framebuffer {
> +                       size =3D <0x01000000>;
> +                       alignment =3D <0x01000000>;
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible =3D "iio-hwmon";
> +               io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>,
> +               <&adc0 3>, <&adc0 4>, <&adc0 5>, <&adc0 6>,
> +               <&adc0 7>, <&adc1 0>;
> +       };
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +
> +               cpld {
> +                       label =3D "cpld";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(S, 4) GPIO_ACTIVE_H=
IGH>;
> +                       linux,code =3D <ASPEED_GPIO(S, 4)>;
> +               };
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               bmc-heart-beat {
> +                       gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_L=
OW>;
> +                       default-state =3D "keep";
> +               };
> +
> +               bmc-init-ok {
> +                       gpios =3D <&gpio0 ASPEED_GPIO(R, 5) GPIO_ACTIVE_L=
OW>;
> +                       default-state =3D "off";
> +               };
> +
> +               chassis-power-on {
> +                       gpios =3D <&gpio0 ASPEED_GPIO(Q, 3) GPIO_ACTIVE_L=
OW>;
> +                       default-state =3D "keep";
> +               };
> +
> +               bmc-bootup {
> +                       gpios =3D <&gpio0 ASPEED_GPIO(S, 0) GPIO_ACTIVE_L=
OW>;
> +                       default-state =3D "off";
> +               };
> +
> +               fan-watchdog {
> +                       label =3D "fan-watchdog";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(E, 0) GPIO_ACTIVE_L=
OW>;
> +                       linux,default-trigger =3D "timer";
> +               };
> +       };
> +
> +};
> +
> +&adc0 {
> +       status =3D "okay";
> +       aspeed,int-vref-microvolt =3D <2500000>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_adc0_default
> +                       &pinctrl_adc1_default
> +                       &pinctrl_adc2_default
> +                       &pinctrl_adc3_default
> +                       &pinctrl_adc4_default
> +                       &pinctrl_adc5_default
> +                       &pinctrl_adc6_default
> +                       &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +       status =3D "okay";
> +       aspeed,int-vref-microvolt =3D <2500000>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_adc8_default>;
> +};
> +
> +&gpio0 {
> +       gpio-line-names =3D
> +       /*A0-A7*/       "","","","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "","","","","","","","",
> +       /*E0-E7*/       "","","","","","","","",
> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","SCM_CPLD_UPDATE_HITLESS","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","","FM_PSU1_PRSNT_N","FM_PSU0_PRSNT_N=
","MB_CPLD_UPDATE_HITLESS",
> +       /*R0-R7*/       "","","","checkstop","","","power-chassis-control=
","power-button",
> +       /*S0-S7*/       "","","POSTFINISH","","","FM_BATTERY_SENSE_EN",""=
,"",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","power-chassis-good","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "","","","","","","","";
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
> +&emmc_controller {
> +       status =3D "okay";
> +};
> +
> +&pinctrl_emmc_default {
> +       bias-disable;
> +};
> +
> +&emmc {
> +       status =3D "okay";
> +       clk-phase-mmc-hs200 =3D <180>, <180>;
> +};
> +
> +#include "ibm-power10-quad.dtsi"
> +&fsim0 {
> +       cfam-reset-gpios =3D <&gpio0 ASPEED_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
> +};
> +
> +&i2c1 {
> +       status =3D "okay";
> +       tmp112@48{
> +               compatible =3D "ti,tmp112";
> +               reg =3D <0x48>;
> +               label =3D "Sys_Outlet_Temp";
> +       };
> +
> +       eeprom@50 {
> +               compatible =3D "atmel,24c256";
> +               reg =3D <0x50>;
> +       };
> +};
> +
> +&i2c2 {
> +       status =3D "okay";
> +       tmp112@40{
> +               compatible =3D "ti,tmp112";
> +               reg =3D <0x48>;
> +               label =3D "Inlet_Temp";
> +       };
> +
> +       pca9548@70{
> +               compatible =3D "nxp,pca9548";
> +               reg =3D <0x70>;
> +               i2c2s0ch1: i2c@1{
> +                       reg =3D <1>;
> +                       tmp112@49{
> +                               compatible =3D "ti,tmp112";
> +                               reg =3D <0x49>;
> +                               label =3D "PSU_Inlet0_Temp";
> +                       };
> +                       tmp112@4a{
> +                               compatible =3D "ti,tmp112";
> +                               reg =3D <0x4a>;
> +                               label =3D "PSU_Inlet1_Temp";
> +                       };
> +               };
> +               i2c2s0ch2: i2c@2{
> +                       reg =3D <2>;
> +                       tmp112@49{
> +                               compatible =3D "ti,tmp112";
> +                               reg =3D <0x49>;
> +                               label =3D "L_OCP_ZONE_Temp";
> +                       };
> +                       tmp112@4a{
> +                               compatible =3D "ti,tmp112";
> +                               reg =3D <0x4a>;
> +                               label =3D "R_OCP_ZONE_Temp";
> +                       };
> +               };
> +       };
> +
> +       pca0:pca9555@20 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x20>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D
> +                       "OCP0_CABLE_PRSNT_N", "OCP0_BIF2_N",
> +                       "OCP0_BIF1_N", "OCP0_BIF0_N",
> +                       "OCP0_CARD_PRSNTB3_ISO_N", "OCP0_CARD_PRSNTB2_ISO=
_N",
> +                       "OCP0_CARD_PRSNTB1_ISO_N", "OCP0_CARD_PRSNTB0_ISO=
_N",
> +                       "PE_MCIO0_BP_ID0_Q_N", "PE_MCIO0_BP_ID1_Q_N",
> +                       "PE_MCIO1_BP_ID0_Q_N", "PE_MCIO1_BP_ID1_Q_N",
> +                       "PE_MCIO2_BP_ID0_Q_N", "PE_MCIO2_BP_ID1_Q_N",
> +                       "RISER0_PRSNT_N", "REAR_HDD_PRSNT_N";
> +       };
> +       pca1:pca9555@21 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x21>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D
> +                       "OCP1_CABLE_PRSNT_N", "OCP1_BIF2_N",
> +                       "OCP1_BIF1_N", "OCP1_BIF0_N",
> +                       "OCP1_CARD_PRSNTB3_ISO_N", "OCP1_CARD_PRSNTB2_ISO=
_N",
> +                       "OCP1_CARD_PRSNTB1_ISO_N", "OCP1_CARD_PRSNTB0_ISO=
_N",
> +                       "PE_MCIO3_BP_ID0_Q_N", "PE_MCIO3_BP_ID1_Q_N",
> +                       "PE_MCIO4_BP_ID0_Q_N", "PE_MCIO4_BP_ID1_Q_N",
> +                       "PE_MCIO5_BP_ID0_Q_N", "PE_MCIO5_BP_ID1_Q_N",
> +                       "RISER2_PRSNT_N", "RISER1_PRSNT_N";
> +       };
> +       pca2:pca9555@22 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x22>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D
> +                       "RISER2_BOARD_ID1_N", "RISER2_BOARD_ID0_N",
> +                       "RISER1_BOARD_ID2_N", "RISER1_BOARD_ID1_N",
> +                       "RISER1_BOARD_ID0_N", "RISER0_BOARD_ID2_N",
> +                       "RISER0_BOARD_ID1_N", "RISER0_BOARD_ID0_N",
> +                       "PE_MCIO6_BP_ID0_Q_N", "PE_MCIO6_BP_ID1_Q_N",
> +                       "PE_MCIO7_BP_ID0_Q_N", "PE_MCIO7_BP_ID1_Q_N",
> +                       "PE_MCIO8_BP_ID0_Q_N", "PE_MCIO8_BP_ID1_Q_N",
> +                       "PE_MCIO9_BP_ID0_Q_N", "PE_MCIO9_BP_ID0_Q_N";
> +       };
> +       pca3:pca9555@23 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x23>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D
> +                       "", "",
> +                       "", "",
> +                       "", "",
> +                       "", "RISER2_BOARD_ID2_N",
> +                       "PE_MCIO10_BP_ID0_Q_N", "PE_MCIO10_BP_ID1_Q_N",
> +                       "PE_MCIO7_BP_ID11_Q_N", "PE_MCIO11_BP_ID1_Q_N",
> +                       "PE_MCIO12_BP_ID0_Q_N", "PE_MCIO12_BP_ID1_Q_N",
> +                       "PE_MCIO13_BP_ID0_Q_N", "PE_MCIO13_BP_ID0_Q_N";
> +       };
> +};
> +
> +&i2c3 {
> +       status =3D "okay";
> +       pca9548@70 {
> +               compatible =3D "nxp,pca9548";
> +               reg =3D <0x70>;
> +       };
> +};
> +
> +&i2c5 {
> +       status =3D "okay";
> +       pca9546@70{
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x70>;
> +               i2c5s0ch0: i2c@0 {
> +                       reg =3D <0>;
> +                       status =3D "okay";
> +                       cpu0vdda@60 {
> +                               compatible =3D "infineon,xdpe132g5c";
> +                               reg =3D <0x60>;
> +                       };
> +                       cpu0vddb@61 {
> +                               compatible =3D "infineon,xdpe132g5c";
> +                               reg =3D <0x61>;
> +                       };
> +                       cpu0vdn@72 {
> +                               compatible =3D "infineon,ir35221";
> +                               reg =3D <0x72>;
> +                       };
> +                       cpu0vio@73 {
> +                               compatible =3D "infineon,ir35221";
> +                               reg =3D <0x73>;
> +                       };
> +                       cpu0vpci@74 {
> +                               compatible =3D "infineon,ir35221";
> +                               reg =3D <0x74>;
> +                       };
> +               };
> +               i2c5s0ch1: i2c@1{
> +                       reg =3D <1>;
> +                       status =3D "okay";
> +                       cpu1vddc@60 {
> +                               compatible =3D "infineon,xdpe132g5c";
> +                               reg =3D <0x60>;
> +                       };
> +                       cpu1vddd@61 {
> +                               compatible =3D "infineon,xdpe132g5c";
> +                               reg =3D <0x61>;
> +                       };
> +                       cpu1vdn@72 {
> +                               compatible =3D "infineon,ir35221";
> +                               reg =3D <0x72>;
> +                       };
> +                       cpu1vio@73 {
> +                               compatible =3D "infineon,ir35221";
> +                               reg =3D <0x73>;
> +                       };
> +                       cpu1vpci@74 {
> +                               compatible =3D "infineon,ir35221";
> +                               reg =3D <0x74>;
> +                       };
> +               };
> +               i2c5s0ch2: i2c@2{
> +                       reg =3D <2>;
> +                       status =3D "okay";
> +                       pxe1610@6c {
> +                               compatible =3D "infineon,pxe1610";
> +                               reg =3D <0x6c>;
> +                       };
> +                       rdimm@74 {
> +                               compatible =3D "infineon,pxe1610";
> +                               reg =3D <0x74>;
> +                       };
> +                       mdimm@54 {
> +                               compatible =3D "infineon,pxe1610";
> +                               reg =3D <0x5A>;
> +                       };
> +                       ldimm@44 {
> +                               compatible =3D "infineon,pxe1610";
> +                               reg =3D <0x5C>;
> +                       };
> +               };
> +               i2c5s0ch3: i2c@3{
> +                               reg =3D <3>;
> +               };
> +       };
> +};
> +
> +&i2c6 {
> +       /* SMB_TEMPSENSOR_STBY_LVC3_R */
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
> +
> +                       tmp1413@4c {
> +                               compatible =3D "microchip,emc1413";
> +                               reg =3D <0x4c>;
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
> +
> +                       tmp1413@4c {
> +                               compatible =3D "microchip,emc1413";
> +                               reg =3D <0x4c>;
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
> +
> +                       tmp1413@4c {
> +                               compatible =3D "microchip,emc1413";
> +                               reg =3D <0x4c>;
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
> +
> +                       tmp1413@4c {
> +                               compatible =3D "microchip,emc1413";
> +                               reg =3D <0x4c>;
> +                       };
> +
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
> +
> +                       tmp1413@4c {
> +                               compatible =3D "microchip,emc1413";
> +                               reg =3D <0x4c>;
> +                       };
> +
> +                       pca9548@71 {
> +                               compatible =3D "nxp,pca9548";
> +                               reg =3D <0x71>;
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
> +
> +                       tmp1413@4c {
> +                               compatible =3D "microchip,emc1413";
> +                               reg =3D <0x4c>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c7 {
> +       status =3D "okay";
> +       adc128d818@1d{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x1d>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@1e{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x1e>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@1f{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x1f>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@2d{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x2d>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@2e{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x2e>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@2f{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x2f>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@35{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x35>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@36{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x36>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@37{
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x37>;
> +               ti,mode =3D /bits/ 8 <0x01>;
> +       };
> +};
> +
> +&i2c8 {
> +       status =3D "okay";
> +
> +       pca9555@24{
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x24>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D
> +                       "FAN_PRSNT5_D_N", "FAN_PRSNT4_D_N",
> +                       "FAN_PRSNT3_D_N", "FAN_PRSNT2_D_N",
> +                       "FAN_PRSNT1_D_N", "FAN_PRSNT0_D_N",
> +                       "", "",
> +                       "", "", "", "",
> +                       "", "", "", "";
> +       };
> +
> +       eeprom@51 {
> +               compatible =3D "atmel,24c256";
> +               reg =3D <0x51>;
> +       };
> +
> +};
> +
> +&i2c9 {
> +       status =3D "okay";
> +
> +       eeprom@50 {
> +               compatible =3D "atmel,24c256";
> +               reg =3D <0x50>;
> +       };
> +
> +       eeprom@51 {
> +               compatible =3D "atmel,24c256";
> +               reg =3D <0x51>;
> +       };
> +};
> +
> +&i2c10 {
> +       status =3D "okay";
> +       pca9555@20 {
> +       compatible =3D "nxp,pca9555";
> +       reg =3D <0x20>;
> +
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       gpio-controller;
> +       #gpio-cells =3D <2>;
> +
> +       gpio-line-names =3D
> +               "DIMM0_FAULT", "DIMM3_FAULT",
> +               "DIMM2_FAULT", "DIMM1_FAULT",
> +               "DIMM4_FAULT", "DIMM5_FAULT",
> +               "DIMM6_FAULT", "DIMM7_FAULT",
> +               "DIMM8_FAULT", "DIMM11_FAULT",
> +               "DIMM10_FAULT", "DIMM9_FAULT",
> +               "DIMM12_FAULT", "DIMM13_FAULT",
> +               "DIMM14_FAULT", "DIMM15_FAULT";
> +       };
> +
> +       pca9555@22 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x22>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D
> +                       "", "", "", "", "OCP0_PRSNT_N", "", "", "",
> +                       "", "", "", "", "", "", "", "";
> +       };
> +
> +       pca9555@23 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x23>;
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +
> +               gpio-line-names =3D
> +                       "", "", "", "", "OCP1_PRSNT_N", "", "", "",
> +                       "", "", "", "", "", "", "", "";
> +       };
> +};
> +
> +&i2c11 {
> +       status =3D "okay";
> +
> +       eeprom@51 {
> +               compatible =3D "atmel,24c256";
> +               reg =3D <0x51>;
> +       };
> +};
> +
> +&i2c12 {
> +       status =3D "okay";
> +       pca9546@70{
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x70>;
> +               i2c-mux-idle-disconnect;
> +               i2c12s0ch0: i2c@0{
> +                       reg =3D <0>;
> +                       tmp112@48{
> +                               compatible =3D "ti,tmp112";
> +                               reg =3D <0x48>;
> +                               label =3D "PCIE_INLET_0";
> +                       };
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +
> +                       pca9555@24 {
> +                       compatible =3D "nxp,pca9555";
> +                       reg =3D <0x24>;
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       gpio-line-names =3D
> +                               "RISER0_BOARD_ID7", "RISER0_BOARD_ID6",
> +                               "RISER0_BOARD_ID5", "RISER0_BOARD_ID4",
> +                               "RISER0_BOARD_ID3", "RISER0_BOARD_ID2",
> +                               "RISER0_BOARD_ID1", "RISER0_BOARD_ID0",
> +                               "RISER0_SLOT2_PRSNT", "RISER0_SLOT1_PRSNT=
_X8",
> +                               "RISER0_SLOT0_PRSNT_X8", "RISER0_SLOT1_PR=
SNT_X16",
> +                               "RISER0_SLOT0_PRSNT_X16", "", "", "";
> +                       };
> +               };
> +               i2c12s0ch1: i2c@1{
> +                       reg =3D <1>;
> +               };
> +               i2c12s0ch2: i2c@2{
> +                       reg =3D <2>;
> +               };
> +               i2c12s0ch3: i2c@3{
> +                       reg =3D <3>;
> +               };
> +       };
> +
> +       pca9546@71{
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x71>;
> +               i2c-mux-idle-disconnect;
> +               i2c12s1ch0: i2c@0{
> +                       reg =3D <0>;
> +                       tmp112@48{
> +                               compatible =3D "ti,tmp112";
> +                               reg =3D <0x48>;
> +                               label =3D "PCIE_INLET_2";
> +                       };
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +
> +                       pca9555@24 {
> +                       compatible =3D "nxp,pca9555";
> +                       reg =3D <0x24>;
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       gpio-line-names =3D
> +                               "RISER2_BOARD_ID0", "RISER2_BOARD_ID1",
> +                               "RISER2_BOARD_ID2", "RISER2_BOARD_ID3",
> +                               "RISER2_BOARD_ID4", "RISER2_BOARD_ID5",
> +                               "RISER2_BOARD_ID6", "RISER2_BOARD_ID7",
> +                               "RISER2_SLOT0_PRSNT", "RISER2_SLOT1_PRSNT=
",
> +                               "", "", "", "", "", "";
> +                       };
> +               };
> +               i2c12s1ch1: i2c@1{
> +                       reg =3D <1>;
> +               };
> +               i2c12s1ch2: i2c@2{
> +                       reg =3D <2>;
> +               };
> +       };
> +};
> +
> +&i2c13 {
> +       status =3D "okay";
> +       pca9546@70{
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x70>;
> +               i2c-mux-idle-disconnect;
> +               i2c13s0ch0: i2c@0{
> +                       reg =3D <0>;
> +                       tmp112@48{
> +                               compatible =3D "ti,tmp112";
> +                               reg =3D <0x48>;
> +                               label =3D "PCIE_INLET_1";
> +                       };
> +
> +                       eeprom@50 {
> +                               compatible =3D "atmel,24c256";
> +                               reg =3D <0x50>;
> +                       };
> +
> +                       pca9555@24 {
> +                       compatible =3D "nxp,pca9555";
> +                       reg =3D <0x24>;
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       gpio-line-names =3D
> +                               "RISER1_BOARD_ID7", "RISER1_BOARD_ID6",
> +                               "RISER1_BOARD_ID5", "RISER1_BOARD_ID4",
> +                               "RISER1_BOARD_ID3", "RISER1_BOARD_ID2",
> +                               "RISER1_BOARD_ID1", "RISER1_BOARD_ID0",
> +                               "RISER1_SLOT2_PRSNT", "RISER1_SLOT1_PRSNT=
_X8",
> +                               "RISER1_SLOT0_PRSNT_X8", "RISER1_SLOT1_PR=
SNT_X16",
> +                               "RISER1_SLOT0_PRSNT_X16", "", "", "";
> +                       };
> +               };
> +               i2c13s0ch1: i2c@1{
> +                       reg =3D <1>;
> +               };
> +               i2c13s0ch2: i2c@2{
> +                       reg =3D <2>;
> +               };
> +               i2c13s0ch3: i2c@3{
> +                       reg =3D <3>;
> +               };
> +       };
> +};
> +
> +&i2c14 {
> +       status =3D "okay";
> +};
> +
> +&i2c15 {
> +       status =3D "okay";
> +};
> +
> +&ibt {
> +       status =3D "okay";
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> +
> +&vuart1 {
> +       status =3D "okay";
> +};
> +
> +&vuart2 {
> +       status =3D "okay";
> +};
> +
> +&lpc_ctrl {
> +       status =3D "okay";
> +       memory-region =3D <&flash_memory>;
> +};
> +
> +&wdt1 {
> +       status =3D "okay";
> +};
> +
> +&kcs2 {
> +       status =3D "okay";
> +       aspeed,lpc-io-reg =3D <0xca8 0xcac>;
> +};
> +
> +&kcs3 {
> +       status =3D "okay";
> +       aspeed,lpc-io-reg =3D <0xca2>;
> +       aspeed,lpc-interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> +};
> +
> +&vhub {
> +       status =3D "okay";
> +};
> +
> +&video {
> +       status =3D "okay";
> +       memory-region =3D <&video_engine_memory>;
> +};
> +
> +&gfx {
> +       status =3D "okay";
> +       memory-region =3D <&gfx_memory>;
> +};
> --
> 2.34.1
>
