Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B70E812154
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 23:20:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EL984yJJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr90J1zFCz3cVt
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 09:20:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=EL984yJJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr8zf1hFWz3c1g
	for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 09:19:40 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a22fb5f71d9so4142866b.0
        for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 14:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1702505974; x=1703110774; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lkrne/trw9UKDqgNn45J8C/jzjMvwkI+4/d0ka3Fk0g=;
        b=EL984yJJOvPTJ/lXjlqqMxdd5WKbaraFcfgPh+C0vGh3IFvFPhllI2ulSSIzm1VY1e
         nVGxNergk1h3QtAynR/eTGlONTrRkss7Z2Q4hgny+e1nX1Ow40sstMzbP9IBnRAB8hnH
         Fz4boAKM+Jozhzq4JOiV51Z6RoloJlvcRP0dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702505974; x=1703110774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lkrne/trw9UKDqgNn45J8C/jzjMvwkI+4/d0ka3Fk0g=;
        b=MVPEEZeNBB6JTpcVpjOi0nVe6xrxC1+qQZcRulOh/TE8h0tl7luKSr4IqJbX0QpoXj
         H/iprCoLMdcTU9h1IWa7vYCO5H5IZ7IRBbzB9P2MgRg/SZxa4ldCNYvhQtz7zEz5rAui
         FHyEDKGhoaSEGCAZgODC7p4iVYgo4l8m3aTAnhSSv2iq96ASF94BvbJfou5xJKIHcEg/
         3Vj1HeAfbtOliEn96zP8NB7NNglEM3O61DsD2QeMJMC7XVGPanvL0zeW04t97UGNIY0X
         yC6J5WxpfLCjrio1irOrCtghumcJ61qDblS7GC9xa3YW5MZLdUN3SxrQp/eSeb+L9Yw0
         Fj0Q==
X-Gm-Message-State: AOJu0YxFcj+3Eymccrpsc6fuoKfbaVQxL5G33D2s1lsq1akBXAhi/KCO
	thMw/WxzuLFOByYVb+akkXbwHKni56vPdv9KYrQ=
X-Google-Smtp-Source: AGHT+IGPDHZ1D6IH5XdHcIms7S1z4rSnGQ//nD/d0GKPXLmcA/zKSs8tfCv4VS5j5T96JNmwEV4lG2Wahe65Rhl/kRQ=
X-Received: by 2002:a17:907:e86:b0:a1d:6cbc:c22 with SMTP id
 ho6-20020a1709070e8600b00a1d6cbc0c22mr10886363ejc.41.1702505973590; Wed, 13
 Dec 2023 14:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20231213103309.2754291-1-liuxiwei@ieisystem.com>
In-Reply-To: <20231213103309.2754291-1-liuxiwei@ieisystem.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Dec 2023 08:49:21 +1030
Message-ID: <CACPK8Xdc02SpzNcMPkLUhXEp3jZ3BcJ27+mrd3i1czi4T9uX0w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: Add IEISystems FP5280G3 BMC machine
To: George Liu <liuxiwei1013@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

On Wed, 13 Dec 2023 at 21:03, George Liu <liuxiwei1013@gmail.com> wrote:
>
> The IEISystems FP5280G3 is a power platform server with an
> AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
>
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>

Upstream lists for review first please.

Cheers,

Joel


> ---
>  .../aspeed/aspeed-bmc-ieisystems-fp5280g3.dts | 999 ++++++++++++++++++
>  1 file changed, 999 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts
> new file mode 100644
> index 000000000000..30ee506a88e1
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts
> @@ -0,0 +1,999 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023, IEISystems Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include "ibm-power10-dual.dtsi"
> +#include "ibm-power10-quad.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model = "FP5280G3 BMC";
> +       compatible = "ieisystems,fp5280g3-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               i2c2001 = &i2c2s0ch1;
> +               i2c2002 = &i2c2s0ch2;
> +               i2c5000 = &i2c5s0ch0;
> +               i2c5001 = &i2c5s0ch1;
> +               i2c5002 = &i2c5s0ch2;
> +               i2c5003 = &i2c5s0ch3;
> +               i2c6000 = &i2c6s0ch0;
> +               i2c6001 = &i2c6s0ch1;
> +               i2c6002 = &i2c6s0ch2;
> +               i2c6003 = &i2c6s0ch3;
> +               i2c6004 = &i2c6s0ch4;
> +               i2c6005 = &i2c6s0ch5;
> +               i2c6100 = &i2c6s1ch0;
> +               i2c6101 = &i2c6s1ch1;
> +               i2c6200 = &i2c6s2ch0;
> +               i2c6201 = &i2c6s2ch1;
> +               i2c12000 = &i2c12s0ch0;
> +               i2c12001 = &i2c12s0ch1;
> +               i2c12002 = &i2c12s0ch2;
> +               i2c12003 = &i2c12s0ch3;
> +               i2c12100 = &i2c12s1ch0;
> +               i2c12101 = &i2c12s1ch1;
> +               i2c12102 = &i2c12s1ch2;
> +               i2c13000 = &i2c13s0ch0;
> +               i2c13001 = &i2c13s0ch1;
> +               i2c13002 = &i2c13s0ch2;
> +               i2c13003 = &i2c13s0ch3;
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
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               ramoops@b3e00000 {
> +                       compatible = "ramoops";
> +                       reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
> +                       record-size = <0x8000>;
> +                       console-size = <0x8000>;
> +                       ftrace-size = <0x8000>;
> +                       pmsg-size = <0x8000>;
> +                       max-reason = <3>; /* KMSG_DUMP_EMERG */
> +               };
> +
> +               /* LPC FW cycle bridge region requires natural alignment */
> +               flash_memory: region@b4000000 {
> +                       no-map;
> +                       reg = <0xb4000000 0x04000000>; /* 64M */
> +               };
> +
> +               /* VGA region is dictated by hardware strapping */
> +               vga_memory: region@bf000000 {
> +                       no-map;
> +                       compatible = "shared-dma-pool";
> +                       reg = <0xbf000000 0x01000000>;  /* 16M */
> +               };
> +
> +               video_engine_memory: jpegbuffer {
> +                       size = <0x02000000>;    /* 32M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
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
> +               io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>,
> +               <&adc0 3>, <&adc0 4>, <&adc0 5>, <&adc0 6>,
> +               <&adc0 7>, <&adc1 0>;
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               cpld {
> +                       label = "cpld";
> +                       gpios = <&gpio0 ASPEED_GPIO(S, 4) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(S, 4)>;
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               bmc-heart-beat {
> +                       gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
> +               };
> +
> +               bmc-init-ok {
> +                       gpios = <&gpio0 ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
> +                       default-state = "off";
> +               };
> +
> +               chassis-power-on {
> +                       gpios = <&gpio0 ASPEED_GPIO(Q, 3) GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
> +               };
> +
> +               bmc-bootup {
> +                       gpios = <&gpio0 ASPEED_GPIO(S, 0) GPIO_ACTIVE_LOW>;
> +                       default-state = "off";
> +               };
> +
> +               fan-watchdog {
> +                       label = "fan-watchdog";
> +                       gpios = <&gpio0 ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "timer";
> +               };
> +       };
> +
> +};
> +
> +&adc0 {
> +       status = "okay";
> +       aspeed,int-vref-microvolt = <2500000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
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
> +       status = "okay";
> +       aspeed,int-vref-microvolt = <2500000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc8_default>;
> +};
> +
> +&gpio0 {
> +       gpio-line-names =
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
> +       /*Q0-Q7*/       "","","","","","FM_PSU1_PRSNT_N","FM_PSU0_PRSNT_N","MB_CPLD_UPDATE_HITLESS",
> +       /*R0-R7*/       "","","","checkstop","","","power-chassis-control","power-button",
> +       /*S0-S7*/       "","","POSTFINISH","","","FM_BATTERY_SENSE_EN","","",
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
> +       status = "okay";
> +
> +       ethphy1: ethernet-phy@0 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
> +&mac2 {
> +       status = "okay";
> +
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy1>;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii3_default>;
> +};
> +
> +&mac3 {
> +       status = "okay";
> +
> +       phy-mode = "rmii";
> +       use-ncsi;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii4_default>;
> +};
> +
> +&emmc_controller {
> +       status = "okay";
> +};
> +
> +&pinctrl_emmc_default {
> +       bias-disable;
> +};
> +
> +&emmc {
> +       status = "okay";
> +       clk-phase-mmc-hs200 = <180>, <180>;
> +};
> +
> +&fsim0 {
> +       cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 4) GPIO_ACTIVE_LOW>;
> +}
> +
> +&i2c1 {
> +       status = "okay";
> +       tmp112@48{
> +               compatible = "ti,tmp112";
> +               reg = <0x48>;
> +               label = "Sys_Outlet_Temp";
> +       };
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c256";
> +               reg = <0x50>;
> +       };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +       tmp112@40{
> +               compatible = "ti,tmp112";
> +               reg = <0x48>;
> +               label = "Inlet_Temp";
> +       };
> +
> +       pca9548@70{
> +               compatible = "nxp,pca9548";
> +               reg = <0x70>;
> +               i2c2s0ch1: i2c@1{
> +                       reg = <1>;
> +                       tmp112@49{
> +                               compatible = "ti,tmp112";
> +                               reg = <0x49>;
> +                               label = "PSU_Inlet0_Temp";
> +                       };
> +                       tmp112@4a{
> +                               compatible = "ti,tmp112";
> +                               reg = <0x4a>;
> +                               label = "PSU_Inlet1_Temp";
> +                       };
> +               };
> +               i2c2s0ch2: i2c@2{
> +                       reg = <2>;
> +                       tmp112@49{
> +                               compatible = "ti,tmp112";
> +                               reg = <0x49>;
> +                               label = "L_OCP_ZONE_Temp";
> +                       };
> +                       tmp112@4a{
> +                               compatible = "ti,tmp112";
> +                               reg = <0x4a>;
> +                               label = "R_OCP_ZONE_Temp";
> +                       };
> +               };
> +       };
> +
> +       pca0:pca9555@20 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x20>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "OCP0_CABLE_PRSNT_N", "OCP0_BIF2_N",
> +                       "OCP0_BIF1_N", "OCP0_BIF0_N",
> +                       "OCP0_CARD_PRSNTB3_ISO_N", "OCP0_CARD_PRSNTB2_ISO_N",
> +                       "OCP0_CARD_PRSNTB1_ISO_N", "OCP0_CARD_PRSNTB0_ISO_N",
> +                       "PE_MCIO0_BP_ID0_Q_N", "PE_MCIO0_BP_ID1_Q_N",
> +                       "PE_MCIO1_BP_ID0_Q_N", "PE_MCIO1_BP_ID1_Q_N",
> +                       "PE_MCIO2_BP_ID0_Q_N", "PE_MCIO2_BP_ID1_Q_N",
> +                       "RISER0_PRSNT_N", "REAR_HDD_PRSNT_N";
> +       };
> +       pca1:pca9555@21 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x21>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "OCP1_CABLE_PRSNT_N", "OCP1_BIF2_N",
> +                       "OCP1_BIF1_N", "OCP1_BIF0_N",
> +                       "OCP1_CARD_PRSNTB3_ISO_N", "OCP1_CARD_PRSNTB2_ISO_N",
> +                       "OCP1_CARD_PRSNTB1_ISO_N", "OCP1_CARD_PRSNTB0_ISO_N",
> +                       "PE_MCIO3_BP_ID0_Q_N", "PE_MCIO3_BP_ID1_Q_N",
> +                       "PE_MCIO4_BP_ID0_Q_N", "PE_MCIO4_BP_ID1_Q_N",
> +                       "PE_MCIO5_BP_ID0_Q_N", "PE_MCIO5_BP_ID1_Q_N",
> +                       "RISER2_PRSNT_N", "RISER1_PRSNT_N";
> +       };
> +       pca2:pca9555@22 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x22>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
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
> +               compatible = "nxp,pca9555";
> +               reg = <0x23>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
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
> +       status = "okay";
> +       pca9548@70 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x70>;
> +       };
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +       pca9546@70{
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               i2c5s0ch0: i2c@0 {
> +                       reg = <0>;
> +                       status = "okay";
> +                       cpu0vdda@60 {
> +                               compatible = "infineon,xdpe132g5c";
> +                               reg = <0x60>;
> +                       };
> +                       cpu0vddb@61 {
> +                               compatible = "infineon,xdpe132g5c";
> +                               reg = <0x61>;
> +                       };
> +                       cpu0vdn@72 {
> +                               compatible = "infineon,ir35221";
> +                               reg = <0x72>;
> +                       };
> +                       cpu0vio@73 {
> +                               compatible = "infineon,ir35221";
> +                               reg = <0x73>;
> +                       };
> +                       cpu0vpci@74 {
> +                               compatible = "infineon,ir35221";
> +                               reg = <0x74>;
> +                       };
> +               };
> +               i2c5s0ch1: i2c@1{
> +                       reg = <1>;
> +                       status = "okay";
> +                       cpu1vddc@60 {
> +                               compatible = "infineon,xdpe132g5c";
> +                               reg = <0x60>;
> +                       };
> +                       cpu1vddd@61 {
> +                               compatible = "infineon,xdpe132g5c";
> +                               reg = <0x61>;
> +                       };
> +                       cpu1vdn@72 {
> +                               compatible = "infineon,ir35221";
> +                               reg = <0x72>;
> +                       };
> +                       cpu1vio@73 {
> +                               compatible = "infineon,ir35221";
> +                               reg = <0x73>;
> +                       };
> +                       cpu1vpci@74 {
> +                               compatible = "infineon,ir35221";
> +                               reg = <0x74>;
> +                       };
> +               };
> +               i2c5s0ch2: i2c@2{
> +                       reg = <2>;
> +                       status = "okay";
> +                       pxe1610@6c {
> +                               compatible = "infineon,pxe1610";
> +                               reg = <0x6c>;
> +                       };
> +                       rdimm@74 {
> +                               compatible = "infineon,pxe1610";
> +                               reg = <0x74>;
> +                       };
> +                       mdimm@54 {
> +                               compatible = "infineon,pxe1610";
> +                               reg = <0x5A>;
> +                       };
> +                       ldimm@44 {
> +                               compatible = "infineon,pxe1610";
> +                               reg = <0x5C>;
> +                       };
> +               };
> +               i2c5s0ch3: i2c@3{
> +                               reg = <3>;
> +               };
> +       };
> +};
> +
> +&i2c6 {
> +       /* SMB_TEMPSENSOR_STBY_LVC3_R */
> +       multi-master;
> +       status = "okay";
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               i2c6s0ch0: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       tmp1413@4c {
> +                               compatible = "microchip,emc1413";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +               i2c6s0ch1: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       tmp1413@4c {
> +                               compatible = "microchip,emc1413";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +               i2c6s0ch2: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       tmp1413@4c {
> +                               compatible = "microchip,emc1413";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +               i2c6s0ch3: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       tmp1413@4c {
> +                               compatible = "microchip,emc1413";
> +                               reg = <0x4c>;
> +                       };
> +
> +                       pca9548@71 {
> +                               compatible = "nxp,pca9548";
> +                               reg = <0x71>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               i2c6s1ch0: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +                               i2c6s1ch1: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +                       };
> +               };
> +               i2c6s0ch4: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       tmp1413@4c {
> +                               compatible = "microchip,emc1413";
> +                               reg = <0x4c>;
> +                       };
> +
> +                       pca9548@71 {
> +                               compatible = "nxp,pca9548";
> +                               reg = <0x71>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               i2c6s2ch0: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +                               i2c6s2ch1: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +                       };
> +               };
> +               i2c6s0ch5: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       tmp1413@4c {
> +                               compatible = "microchip,emc1413";
> +                               reg = <0x4c>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +       adc128d818@1d{
> +               compatible = "ti,adc128d818";
> +               reg = <0x1d>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@1e{
> +               compatible = "ti,adc128d818";
> +               reg = <0x1e>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@1f{
> +               compatible = "ti,adc128d818";
> +               reg = <0x1f>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@2d{
> +               compatible = "ti,adc128d818";
> +               reg = <0x2d>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@2e{
> +               compatible = "ti,adc128d818";
> +               reg = <0x2e>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@2f{
> +               compatible = "ti,adc128d818";
> +               reg = <0x2f>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@35{
> +               compatible = "ti,adc128d818";
> +               reg = <0x35>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@36{
> +               compatible = "ti,adc128d818";
> +               reg = <0x36>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +
> +       adc128d818@37{
> +               compatible = "ti,adc128d818";
> +               reg = <0x37>;
> +               ti,mode = /bits/ 8 <0x01>;
> +       };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +       nct7362@20 {
> +               compatible = "nuvoton,nct7362";
> +               device-active-gpios = <&gpio0 ASPEED_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
> +               reg = <0x20>;
> +       };
> +
> +       nct7362@22 {
> +               compatible = "nuvoton,nct7362";
> +               device-active-gpios = <&gpio0 ASPEED_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
> +               reg = <0x22>;
> +       };
> +
> +       pca9555@24{
> +               compatible = "nxp,pca9555";
> +               reg = <0x24>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "FAN_PRSNT5_D_N", "FAN_PRSNT4_D_N",
> +                       "FAN_PRSNT3_D_N", "FAN_PRSNT2_D_N",
> +                       "FAN_PRSNT1_D_N", "FAN_PRSNT0_D_N",
> +                       "", "",
> +                       "", "", "", "",
> +                       "", "", "", "";
> +       };
> +
> +       eeprom@51 {
> +               compatible = "atmel,24c256";
> +               reg = <0x51>;
> +       };
> +
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c256";
> +               reg = <0x50>;
> +       };
> +
> +       eeprom@51 {
> +               compatible = "atmel,24c256";
> +               reg = <0x51>;
> +       };
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +       pca9555@20 {
> +       compatible = "nxp,pca9555";
> +       reg = <0x20>;
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       gpio-controller;
> +       #gpio-cells = <2>;
> +
> +       gpio-line-names =
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
> +               compatible = "nxp,pca9555";
> +               reg = <0x22>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "", "", "", "", "OCP0_PRSNT_N", "", "", "",
> +                       "", "", "", "", "", "", "", "";
> +       };
> +
> +       pca9555@23 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x23>;
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "", "", "", "", "OCP1_PRSNT_N", "", "", "",
> +                       "", "", "", "", "", "", "", "";
> +       };
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +       bus-timeout-ms = <100>;
> +       bus-recover-timeout-ms = <10>;
> +
> +       eeprom@51 {
> +               compatible = "atmel,24c256";
> +               reg = <0x51>;
> +       };
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +       pca9546@70{
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               i2c-mux-idle-disconnect;
> +               i2c12s0ch0: i2c@0{
> +                       reg = <0>;
> +                       tmp112@48{
> +                               compatible = "ti,tmp112";
> +                               reg = <0x48>;
> +                               label = "PCIE_INLET_0";
> +                       };
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       pca9555@24 {
> +                       compatible = "nxp,pca9555";
> +                       reg = <0x24>;
> +
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +
> +                       gpio-line-names =
> +                               "RISER0_BOARD_ID7", "RISER0_BOARD_ID6",
> +                               "RISER0_BOARD_ID5", "RISER0_BOARD_ID4",
> +                               "RISER0_BOARD_ID3", "RISER0_BOARD_ID2",
> +                               "RISER0_BOARD_ID1", "RISER0_BOARD_ID0",
> +                               "RISER0_SLOT2_PRSNT", "RISER0_SLOT1_PRSNT_X8",
> +                               "RISER0_SLOT0_PRSNT_X8", "RISER0_SLOT1_PRSNT_X16",
> +                               "RISER0_SLOT0_PRSNT_X16", "", "", "";
> +                       };
> +               };
> +               i2c12s0ch1: i2c@1{
> +                       reg = <1>;
> +               };
> +               i2c12s0ch2: i2c@2{
> +                       reg = <2>;
> +               };
> +               i2c12s0ch3: i2c@3{
> +                       reg = <3>;
> +               };
> +       };
> +
> +       pca9546@71{
> +               compatible = "nxp,pca9546";
> +               reg = <0x71>;
> +               i2c-mux-idle-disconnect;
> +               i2c12s1ch0: i2c@0{
> +                       reg = <0>;
> +                       tmp112@48{
> +                               compatible = "ti,tmp112";
> +                               reg = <0x48>;
> +                               label = "PCIE_INLET_2";
> +                       };
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       pca9555@24 {
> +                       compatible = "nxp,pca9555";
> +                       reg = <0x24>;
> +
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +
> +                       gpio-line-names =
> +                               "RISER2_BOARD_ID0", "RISER2_BOARD_ID1",
> +                               "RISER2_BOARD_ID2", "RISER2_BOARD_ID3",
> +                               "RISER2_BOARD_ID4", "RISER2_BOARD_ID5",
> +                               "RISER2_BOARD_ID6", "RISER2_BOARD_ID7",
> +                               "RISER2_SLOT0_PRSNT", "RISER2_SLOT1_PRSNT",
> +                               "", "", "", "", "", "";
> +                       };
> +               };
> +               i2c12s1ch1: i2c@1{
> +                       reg = <1>;
> +               };
> +               i2c12s1ch2: i2c@2{
> +                       reg = <2>;
> +               };
> +       };
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +       pca9546@70{
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               i2c-mux-idle-disconnect;
> +               i2c13s0ch0: i2c@0{
> +                       reg = <0>;
> +                       tmp112@48{
> +                               compatible = "ti,tmp112";
> +                               reg = <0x48>;
> +                               label = "PCIE_INLET_1";
> +                       };
> +
> +                       eeprom@50 {
> +                               compatible = "atmel,24c256";
> +                               reg = <0x50>;
> +                       };
> +
> +                       pca9555@24 {
> +                       compatible = "nxp,pca9555";
> +                       reg = <0x24>;
> +
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +
> +                       gpio-line-names =
> +                               "RISER1_BOARD_ID7", "RISER1_BOARD_ID6",
> +                               "RISER1_BOARD_ID5", "RISER1_BOARD_ID4",
> +                               "RISER1_BOARD_ID3", "RISER1_BOARD_ID2",
> +                               "RISER1_BOARD_ID1", "RISER1_BOARD_ID0",
> +                               "RISER1_SLOT2_PRSNT", "RISER1_SLOT1_PRSNT_X8",
> +                               "RISER1_SLOT0_PRSNT_X8", "RISER1_SLOT1_PRSNT_X16",
> +                               "RISER1_SLOT0_PRSNT_X16", "", "", "";
> +                       };
> +               };
> +               i2c13s0ch1: i2c@1{
> +                       reg = <1>;
> +               };
> +               i2c13s0ch2: i2c@2{
> +                       reg = <2>;
> +               };
> +               i2c13s0ch3: i2c@3{
> +                       reg = <3>;
> +               };
> +       };
> +};
> +
> +&i2c14 {
> +       status = "okay";
> +       idt1339@68{
> +               compatible = "renesas,idt1339";
> +               reg = <0x68>;
> +       };
> +};
> +
> +&i2c15 {
> +       status = "okay";
> +};
> +
> +&ibt {
> +       status = "okay";
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&vuart1 {
> +       status = "okay";
> +};
> +
> +&vuart2 {
> +       status = "okay";
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +};
> +
> +&wdt1 {
> +       status = "okay";
> +       aspeed,reset-mask1 = <0x20f1ff1>;
> +};
> +
> +&kcs2 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xca8 0xcac>;
> +};
> +
> +&kcs3 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xca2>;
> +       aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +};
> +
> +&pcieh {
> +       status = "okay";
> +};
> +
> +&mctp {
> +       status = "okay";
> +};
> +
> +&bmc_dev {
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
> +&gfx {
> +       status = "okay";
> +       memory-region = <&gfx_memory>;
> +};
> --
> 2.34.1
>
