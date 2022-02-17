Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D79404B94CC
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 01:06:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzZqZ30Rxz3cGb
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 11:06:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fGQythW/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fGQythW/; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzZq73hZkz2xY3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 11:05:53 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id n185so3224443qke.5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 16:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VxYNapaZgx2FbJkXEVJL/vWtIYGMB5j4zba++SnImVI=;
 b=fGQythW/5TP8IYd5GkFucwpTGf2bcbIWjz8d+VlZPCUONArx5k6msfveuqusg9iNgU
 uHvjwQl6wu6AcduKESgoYtBm+LfB5mKw7IUanKqbOhG5FH9DMQi3XUwH0AlvaWvTnWP7
 zjxq9bOyDqZrq35CNIuYvPStkNf8R2D5XI3xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxYNapaZgx2FbJkXEVJL/vWtIYGMB5j4zba++SnImVI=;
 b=z63LCEmaNrI6rw0pVc/o29srd2+xPFrhxMn5JW0w/ynW5te4/UW6y2BccHp/+ea646
 UfEL3fB45184LaUcGZYa8NejLrdeNe3d9gIQam70fVZ138Gnd3Y/hgMrYWDwX+q6ZPEV
 HO4kS/J1N2S1z4uGt9q7TOOXAuD7J37PBXaoVAXHiRLSaMXNF5gEBP3Wa+0v4sFhmqPj
 1zbDKxqkJH3wypVRHBTprcfgL96nelBxBSKvjLO9O4ubxfTWarJqCWJJbyn/r6Ane1bX
 ntk/nu471Sy4XIUawWAvcFfWD4tzgDejLQsJcvrDqxQov8Yy4BhUZCK3Mzp8mSsGq+Il
 +E9g==
X-Gm-Message-State: AOAM531tnjz5l8biFr+vAlNQtO9G3yjvWDl35XKOAyq4nww50mKUayU6
 6UYe1qnupe3mYFSyXcoVYFx1lCddSLCN/jjgegk=
X-Google-Smtp-Source: ABdhPJxikFfixUVvdO6YDdIJXW3nQbZZjuJ9QgMXH+KddrQXXjR4uNI5206ZQyz/u66DzGiApufa43V0JlDvEKFa73c=
X-Received: by 2002:a05:620a:2a0c:b0:47d:837e:10df with SMTP id
 o12-20020a05620a2a0c00b0047d837e10dfmr191937qkp.347.1645056349970; Wed, 16
 Feb 2022 16:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20220216132636.41177-1-george.hung@quantatw.com>
In-Reply-To: <20220216132636.41177-1-george.hung@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Feb 2022 00:05:37 +0000
Message-ID: <CACPK8Xc2fA4poGX55fCWu+Yr=1U8R8a=e9+vCiFvSRDcLfPnYg@mail.gmail.com>
Subject: Re: [PATCH dev-5.15 v2] ARM: dts: aspeed: Add device tree for Quanta
 S6Q BMC
To: GeorgeHung <ghung.quanta@gmail.com>
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
Cc: Alan_Kuo@quantatw.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 p.k.lee@quantatw.com,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 16 Feb 2022 at 13:38, GeorgeHung <ghung.quanta@gmail.com> wrote:
>
> The Quanta S6Q is a server platform with AST2600 BMC SoC
>
> Signed-off-by: GeorgeHung <george.hung@quantatw.com>

This looks good. Can we get a review from someone else working on this project?

Also, can you fix your name in your git config?

git config --global user.name "George Hung"

and then fix the patch with: git commit --amend --reset-author -s

Cheers,

Joel

> ---
>  arch/arm/boot/dts/Makefile                  |   1 +
>  arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts | 610 ++++++++++++++++++++
>  2 files changed, 611 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f75f6c30b633..c56211f92712 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1498,6 +1498,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-portwell-neptune.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-quanta-s6q.dtb \
>         aspeed-bmc-supermicro-x11spi.dtb \
>         aspeed-bmc-inventec-transformers.dtb \
>         aspeed-bmc-tyan-s7106.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
> new file mode 100644
> index 000000000000..69e1bd256271
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
> @@ -0,0 +1,610 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2022 Quanta Corp.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +       model = "Quanta S6Q BMC";
> +       compatible = "quanta,s6q-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               // bus 0
> +               i2c20 = &SMB_HOST_DB2000_3V3AUX_SCL;
> +               i2c21 = &U12_PCA9546_CH1;
> +               i2c22 = &SMB_HOST_DB800_B_SCL;
> +               i2c23 = &SMB_HOST_DB800_C_SCL;
> +
> +               // bus 1
> +               i2c24 = &SMB_M2_P0_1V8AUX_SCL;
> +               i2c25 = &SMB_M2_P1_1V8AUX_SCL;
> +               i2c26 = &SMB_CPU_PIROM_3V3AUX_SCL;
> +               i2c27 = &SMB_TEMP_3V3AUX_SCL;
> +               i2c28 = &SMB_IPMB_3V3AUX_SSDSB_SCL;
> +               i2c29 = &SMB_IPMB_3V3AUX_SCL;
> +               i2c31 = &SMB_FB_SCL;
> +
> +               // bus 1 - Fan board
> +               i2c32 = &SMB_IOEXP_SCL;
> +               i2c33 = &SMB_PROGRAM_SCL;
> +               i2c34 = &SMB_FB_SCL_CH2;
> +               i2c35 = &SMB_FAN_SENSE_SCL;
> +
> +               // bus 6
> +               i2c36 = &U197_PCA9546_CH0;
> +               i2c37 = &U197_PCA9546_CH1;
> +               i2c38 = &U197_PCA9546_CH2;
> +               i2c39 = &U197_PCA9546_CH3;
> +
> +               //bus 7
> +               i2c40 = &SMB_OCP_SFF_3V3AUX_SCL; //OCP1
> +               i2c41 = &SMB_OCP_LFF_3V3AUX_SCL; //OCP2
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200n8 earlycon";
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x40000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +                       <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +                       <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +                       <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               BMC_HEARTBEAT_N {
> +                       label="BMC_HEARTBEAT_N";
> +                       gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +
> +               BMC_LED_STATUS_AMBER_N {
> +                       label="BMC_LED_STATUS_AMBER_N";
> +                       gpios = <&gpio0 ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
> +                       default-state = "off";
> +               };
> +
> +               FM_ID_LED_N {
> +                       label="FM_ID_LED_N";
> +                       gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
> +                       default-state = "off";
> +               };
> +       };
> +};
> +
> +&gpio0 {
> +       gpio-line-names =
> +       /*A0 - A7*/     "", "", "", "", "", "", "", "",
> +       /*B0 - B7*/     "", "", "", "", "", "", "", "",
> +       /*C0 - C7*/     "", "", "", "", "", "", "", "",
> +       /*D0 - D7*/     "", "", "", "", "", "", "", "",
> +       /*E0 - E7*/     "", "", "", "", "", "", "", "",
> +       /*F0 - F7*/     "PLTRST_N", "", "PWR_DEBUG_N", "", "", "", "", "",
> +       /*G0 - G7*/     "", "", "", "", "", "", "", "",
> +       /*H0 - H7*/     "", "", "", "", "", "", "", "",
> +       /*I0 - I7*/     "", "", "", "", "", "", "", "",
> +       /*J0 - J7*/     "", "", "", "", "", "", "", "",
> +       /*K0 - K7*/     "", "", "", "", "", "", "", "",
> +       /*L0 - L7*/     "", "", "", "", "PREQ_N", "TCK_MUX_SEL", "", "",
> +       /*M0 - M7*/     "", "", "", "PWRGD_SYS_PWROK", "", "PRDY_N", "", "",
> +       /*N0 - N7*/     "", "", "", "", "", "", "", "",
> +       /*O0 - O7*/     "", "", "", "", "", "", "", "",
> +       /*P0 - P7*/     "SYS_BMC_PWRBTN_R_N", "SYS_PWRBTN_N", "FM_MB_RST_BTN", "RST_BMC_RSTBTN_OUT_N", "", "", "", "",
> +       /*Q0 - Q7*/     "", "", "", "", "", "", "", "",
> +       /*R0 - R7*/     "", "", "", "", "", "", "", "",
> +       /*S0 - S7*/     "", "", "", "FP_ID_BTN_SCM_N", "", "", "", "",
> +       /*T0 - T7*/     "", "", "", "", "", "", "", "",
> +       /*U0 - U7*/     "", "", "", "", "", "", "", "",
> +       /*V0 - V7*/     "", "", "", "", "", "SMI", "", "",
> +       /*W0 - W7*/     "", "", "", "", "", "", "", "",
> +       /*X0 - X7*/     "", "", "", "", "", "", "", "",
> +       /*Y0 - Y7*/     "", "", "", "", "", "", "", "",
> +       /*Z0 - Z7*/     "FM_BMC_READY_N", "", "", "", "", "", "", "",
> +       /*AA0 - AA7*/   "", "", "", "", "", "", "", "",
> +       /*AB0 - AB7*/   "", "", "", "", "", "", "", "",
> +       /*AC0 - AC7*/   "", "", "", "", "", "", "", "";
> +};
> +
> +&sgpiom0 {
> +       status = "okay";
> +       ngpios = <128>;
> +       bus-frequency = <48000>;
> +       gpio-line-names =
> +       /* SGPIO input lines */
> +       /*IOA0-IOA7*/   "","", "SIO_POWER_GOOD","OA1", "XDP_PRST_N","", "","", "FM_SLPS3_PLD_N","", "FM_SLPS4_PLD_N","", "FM_BIOS_POST_CMPLT_BMC_N","", "FM_ADR_TRIGGER_N","OA7",
> +       /*IOB0-IOB7*/   "FM_ADR_COMPLETE","", "FM_PMBUS_ALERT_B_EN","", "PSU0_PRESENT_N","", "PSU1_PRESENT_N","", "PSU0_VIN_BUF_GOOD","", "PSU01_VIN_BUF_GOOD","", "PWRGD_PS0_PWROK_R","", "PWRGD_PS1_PWROK_R","",
> +       /*IOC0-IOC7*/   "PWRGD_PS_PWROK_PLD_R","", "CHASSIS_INTRUSION","", "BMC_MFG_MODE","", "FM_BMC_EN_DET_R","", "FM_ME_BT_DONE","", "CPU1_PRESENCE","", "CPU2_PRESENCE","", "IRQ_PSYS_CRIT_N","",
> +       /*IOD0-IOD7*/   "","", "CPU1_THERMTRIP","", "CPU2_THERMTRIP","", "CPU1_MEM_THERM_EVENT","", "CPU2_MEM_THERM_EVENT","", "CPU1_VRHOT","", "CPU2_VRHOT","", "","",
> +       /*IOE0-IOE7*/   "","", "CPU1_MEM_VRHOT","", "CPU2_MEM_VRHOT","", "","", "PCH_BMC_THERMTRIP","", "","", "","", "","",
> +       /*IOF0-IOF7*/   "CPU_ERR0","", "CPU_ERR1","", "CPU_ERR2","", "","", "","", "CPU_CATERR","", "","", "","",
> +       /*IOG0-IOG7*/   "","", "","", "","", "","", "","", "","", "","", "","",
> +       /*IOH0-IOH7*/   "","", "FP_ID_BTN_R1_N","", "FP_RST_BTN_N","", "","", "","", "FP_PWR_BTN_PLD_N_R","", "","", "","",
> +       /*IOI0-IOI7*/   "","", "","", "","", "","", "","", "","", "","", "","",
> +       /*IOJ0-IOJ7*/   "","", "","", "","", "","", "","", "","", "","", "","",
> +       /*IOK0-IOK7*/   "","", "","", "","", "","", "","", "","", "","", "","",
> +       /*IOL0-IOL7*/   "","", "","", "","", "","", "","", "","", "","", "","",
> +       /*IOM0-IOM7*/   "","", "","", "","", "","", "","", "","", "","", "","",
> +       /*ION0-ION7*/   "","BMC_SW_HEARTBEAT_N_R", "","FP_LED_FAULT_N", "","FP_ID_LED_N", "","FM_BMC_RSTBTN_OUT_N", "","FM_THERMTRIP_DLY_LVC1_R_N", "","", "","RST_PCA9548_SENSOR_PLD_N", "","USB_OC1_REAR_N",
> +       /*IOO0-IOO7*/   "","IRQ_TPM_SPI_N", "","", "","IRQ_PCH_SCI_WHEA_R_N", "","IRQ_BMC_PCH_NMI_R", "","H_CPU_NMI_LVC1_R_N", "","", "","", "","FM_JTAG_BMC_PLD_MUX_SEL",
> +       /*IOP0-IOP7*/   "IP0","OP0", "","", "","", "","", "","", "","", "","", "IP7","OP7";
> +};
> +
> +&adc0 {
> +       vref = <2500>;
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +               &pinctrl_adc2_default &pinctrl_adc3_default
> +               &pinctrl_adc4_default &pinctrl_adc5_default
> +               &pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +       vref = <2500>;
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +               &pinctrl_adc10_default &pinctrl_adc11_default
> +               &pinctrl_adc12_default &pinctrl_adc13_default
> +               &pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&mdio2 {
> +       status = "okay";
> +
> +       ethphy2: ethernet-phy@0 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
> +&mac2 {
> +       status = "okay";
> +
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy2>;
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
> +&fmc {
> +       status = "okay";
> +
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +       };
> +};
> +
> +&spi2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
> +               &pinctrl_spi2cs2_default>;
> +       status = "okay";
> +
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "spi2:0";
> +               spi-max-frequency = <50000000>;
> +       };
> +};
> +
> +&kcs1 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xCA0>;
> +};
> +
> +&kcs2 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xCA8>;
> +};
> +
> +&kcs3 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xCA2>;
> +};
> +
> +&emmc_controller {
> +       status = "okay";
> +};
> +
> +&emmc {
> +       non-removable;
> +       bus-width = <4>;
> +       max-frequency = <100000000>;
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&lpc_snoop {
> +       status = "okay";
> +       snoop-ports = <0x80>;
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&uart2 {
> +       status = "okay";
> +};
> +
> +&uart4 {
> +       status = "okay";
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&uart_routing {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +
> +       U34_PWR_ADC@48 {
> +               compatible = "ti,ads7830";
> +               reg = <0x48>;
> +       };
> +
> +       U35_PWR_ADC@4b {
> +               compatible = "ti,ads7830";
> +               reg = <0x4b>;
> +       };
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               i2c-mux-idle-disconnect;
> +
> +               SMB_HOST_DB2000_3V3AUX_SCL: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               U12_PCA9546_CH1: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               SMB_HOST_DB800_B_SCL: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               SMB_HOST_DB800_C_SCL: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +       };
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +       i2c-switch@59 {
> +               compatible = "nxp,pca9848";
> +               reg = <0x59>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               i2c-mux-idle-disconnect;
> +
> +               SMB_M2_P0_1V8AUX_SCL: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               SMB_M2_P1_1V8AUX_SCL: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               SMB_CPU_PIROM_3V3AUX_SCL: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               SMB_TEMP_3V3AUX_SCL: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       U163_tmp75@48 {
> +                               compatible = "ti,tmp75";
> +                               reg = <0x48>;
> +                       };
> +                       U114_tmp75@49 {
> +                               compatible = "ti,tmp75";
> +                               reg = <0x49>;
> +                       };
> +               };
> +
> +               SMB_IPMB_3V3AUX_SSDSB_SCL: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +
> +                       U4_tmp75@4c {
> +                               compatible = "ti,tmp75";
> +                               reg = <0x4c>;
> +                       };
> +                       U73_tmp75@4d {
> +                               compatible = "ti,tmp75";
> +                               reg = <0x4d>;
> +                       };
> +               };
> +
> +               SMB_IPMB_3V3AUX_SCL: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +
> +                       U190_fru@51 {
> +                               compatible = "atmel,24c128";
> +                               reg = <0x51>;
> +                               pagesize = <32>;
> +                       };
> +               };
> +
> +               SMB_FB_SCL: i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +
> +                       i2c-switch@77 {
> +                               compatible = "nxp,pca9546";
> +                               reg = <0x77>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               SMB_IOEXP_SCL: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               SMB_PROGRAM_SCL: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               SMB_FB_SCL_CH2: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               SMB_FAN_SENSE_SCL: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +
> +                                       Current_Meter_U2@45 {
> +                                               compatible = "ti,ina219";
> +                                               reg = <0x45>;
> +                                               shunt-resistor = <1000>; /* = 1 mOhm */
> +                                       };
> +
> +                                       Current_Meter_U3@44 {
> +                                               compatible = "ti,ina219";
> +                                               reg = <0x44>;
> +                                               shunt-resistor = <1000>; /* = 1 mOhm */
> +                                       };
> +
> +                                       TEMP_sensor_U2@4b {
> +                                               compatible = "ti,tmp75";
> +                                               reg = <0x4b>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +       bus-frequency = <400000>;
> +
> +       ipmb@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +
> +       /* MB FRU (U173) @ 0xA2 */
> +       mb_fru: mb_fru@51 {
> +               compatible = "atmel,24c128";
> +               reg = <0x51>;
> +               pagesize = <32>;
> +       };
> +
> +       /* FP_U1 Inlet */
> +       FP_U1_tmp75@4a {
> +               compatible = "ti,tmp75";
> +               reg = <0x4a>;
> +       };
> +
> +       FP_U4_fru@52 {
> +               compatible = "atmel,24c02";
> +               reg = <0x52>;
> +               pagesize = <16>;
> +       };
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
> +
> +       i2c-switch@77 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x77>;
> +               i2c-mux-idle-disconnect;
> +
> +               U197_PCA9546_CH0: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               U197_PCA9546_CH1: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       cpu0_pvccin@60 {
> +                               compatible = "isil,raa229004";
> +                               reg = <0x60>;
> +                       };
> +
> +                       cpu0_pvccinfaon@61 {
> +                               compatible = "isil,isl69260";
> +                               reg = <0x61>;
> +                       };
> +
> +                       cpu0_pvccd_hv@63 {
> +                               compatible = "isil,isl69260";
> +                               reg = <0x63>;
> +                       };
> +               };
> +
> +               U197_PCA9546_CH2: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       cpu1_pvccin@72 {
> +                               compatible = "isil,raa229004";
> +                               reg = <0x72>;
> +                       };
> +
> +                       cpu1_pvccinfaon@74 {
> +                               compatible = "isil,isl69260";
> +                               reg = <0x74>;
> +                       };
> +
> +                       cpu1_pvccd_hv@76 {
> +                               compatible = "isil,isl69260";
> +                               reg = <0x76>;
> +                       };
> +               };
> +
> +               U197_PCA9546_CH3: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +       };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       i2c-switch@75 {
> +               compatible = "nxp,pca9546";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x75>;
> +               i2c-mux-idle-disconnect;
> +
> +               SMB_OCP_SFF_3V3AUX_SCL: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               SMB_OCP_LFF_3V3AUX_SCL: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +       };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +};
> +
> +&i2c14 {
> +       status = "okay";
> +
> +       /* SCM FRU (U19) @ 0xA2 */
> +       scm_fru: scm_fru@51 {
> +               compatible = "atmel,24c128";
> +               reg = <0x51>;
> +               pagesize = <32>;
> +       };
> +
> +       scm_tmp75_u4@4a {
> +               compatible = "ti,tmp75";
> +               reg = <0x4a>;
> +       };
> +};
> +
> +&i2c15 {
> +       status = "okay";
> +};
> --
> 2.32.0
>
