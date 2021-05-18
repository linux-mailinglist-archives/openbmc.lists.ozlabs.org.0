Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AB387357
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 09:30:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FknjC2GhFz2ym7
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 17:30:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cZ1ZbOS6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cZ1ZbOS6; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fknhv2HC2z2xZZ
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 17:30:22 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id i67so8399107qkc.4
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ms9eoiDU9lJJnjLBKXooiYRV/HFlVB00rZwPG5tRhuM=;
 b=cZ1ZbOS6RhsehI1t/NvdOnvMTbm0u9kY5ptrNKODyGWs0Y/jMGgtc6UhTDRe6DGjRF
 TYFAACIy5xNv76n+bhrw1z6K5kwBa6nxH/f4wbJsL/4laCy/oX/mCNaMD9np9ughjI8c
 GyrLfwU0ERu6Ia4VQgqXDNu//C+7nqt4MaHFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ms9eoiDU9lJJnjLBKXooiYRV/HFlVB00rZwPG5tRhuM=;
 b=DqVQAK7c3NJJv8AlbU2OlbCO3Av9CvI2oKUJhm7ny9wBk2SV/BicGsJvt9S2iXt+FJ
 GBzrVw6I7DZS0y8v649hrLHzSy+O11XPLrypIsNmcwpRuDjDDkjIgwJxDX8k0oAZY7Nv
 jhxjjkBVN+8k5WlVAOUU3G5BQybo7nK5pOW0/ti5C36nF4TIWjJh8iXsUVlufE+NaaHs
 fn9h+sHK8SkzsuXg+zO4uFrhoNA2TMeKzpmtY94LsFNRxVDlseCXVtVetPtY0s+nGPzy
 Zzce7I+O3ZdCe7xcuuNF7kLvz/JKdKJTbLUp7HHRAniRRRM9mDCH74egxTf+yyw7redu
 UwsA==
X-Gm-Message-State: AOAM532MI+4jbFHVcYjRtX4BnEjh5VBKK5A15Weaxgq4N+Ei1em5pti0
 q9s2ymW4RW80atNeN/SE5WfsFGqlzJ5Kcme08F4=
X-Google-Smtp-Source: ABdhPJxt9TCuCs2AdKvNLsCgJdXfHEb2dM2iWmPidq3tfEHZ6+Ev1UjwdOzPueP/IY2uJS6ZzmRmVbC3iwXEFArsZSY=
X-Received: by 2002:a37:bbc3:: with SMTP id l186mr3906878qkf.273.1621323018646; 
 Tue, 18 May 2021 00:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_586ED8FC9F0397B4F0266F44606E48162A09@qq.com>
In-Reply-To: <tencent_586ED8FC9F0397B4F0266F44606E48162A09@qq.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 May 2021 07:30:06 +0000
Message-ID: <CACPK8Xf6cE+EX448Ez-qfqip7qPp28Sq2pHOhV4xf0OY=3FO_Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: inspur-nf5280m6: Add dts file
To: guopingjn@qq.com
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, guoping@inspur.com,
 liuxiwei@inspur.com, wangxinglong@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, 17 May 2021 at 01:23, <guopingjn@qq.com> wrote:
>
> From: guoping <guoping@inspur.com>

Your patch looks good. Some things to fix:

 - As there's no dependency on patches that are only in OpenBMC,
please send this directly to the mainline mailing lists. use
./scripts/get_maintainer.pl to work out where.

 - use ./scripts/checkpatch.pl to check for warnings. There are some
whitespace problems (tabs vs spaces) that I can see

 - Look at other commit messages to get a feel for what to put in
them. You can see what others have done with this search:

 git log   --diff-filter=A "arch/arm/boot/dts/aspeed-*.dts"

 - Set your name in your git config so the Signed-off-by line and
authorship is correct. For me, it would look like this:

 git config --global user.name "Joel Stanley"

 - uart-clock-high-speed isn't supported in OpenBMC or mainline. Do
you plan on adding patches to support this property?

Cheers,

Joel

>
> Signed-off-by: guoping <guoping@inspur.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-inspur-nf5280m6.dts   | 732 ++++++++++++++++++
>  2 files changed, 733 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 03b5424bafa8..cc2580f1e99b 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1405,6 +1405,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-ibm-rainier-4u.dtb \
>         aspeed-bmc-intel-s2600wf.dtb \
>         aspeed-bmc-inspur-fp5280g2.dtb \
> +       aspeed-bmc-inspur-nf5280m6.dtb \
>         aspeed-bmc-lenovo-hr630.dtb \
>         aspeed-bmc-lenovo-hr855xg2.dtb \
>         aspeed-bmc-microsoft-olympus.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
> new file mode 100644
> index 000000000000..d707e13d90f8
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
> @@ -0,0 +1,732 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2021 Inspur Corporation
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model = "NF5280M6 BMC";
> +       compatible = "inspur,nf5280m6-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x40000000>;
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
> +               gfx_memory: framebuffer {
> +           size = <0x01000000>;
> +           alignment = <0x01000000>;
> +           compatible = "shared-dma-pool";
> +           reusable;
> +               };
> +
> +               video_engine_memory: jpegbuffer {
> +                       size = <0x02000000>;    /* 32M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               flash_memory: region@8c000000 {
> +           no-map;
> +           reg = <0x8c000000 0x04000000>; /* 64M */
> +               };
> +       };
> +
> +       leds {
> +           compatible = "gpio-leds";
> +
> +               bmc_alive {
> +                       label = "bmc_alive";
> +                       gpios = <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "timer";
> +                       led-pattern = <1000 1000>;
> +               };
> +
> +               front-fan {
> +           label = "front-fan";
> +           gpios = <&gpio ASPEED_GPIO(F,2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +           front-psu {
> +           label = "front-psu";
> +           gpios = <&gpio ASPEED_GPIO(F,3) GPIO_ACTIVE_LOW>;
> +               };
> +
> +           front-syshot {
> +                       label = "front-syshot";
> +                       gpios = <&gpio ASPEED_GPIO(J, 3) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               front-memory {
> +                       label = "front-memory";
> +                       gpios = <&gpio ASPEED_GPIO(S, 7) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               identify {
> +                       label = "identify";
> +                       gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_LOW>;
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
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bios";
> +               spi-max-frequency = <100000000>;
> +       };
> +};
> +
> +&syscon {
> +   uart-clock-high-speed;
> +   status = "okay";
> +};
> +
> +&uart1 {
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
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +               <&syscon ASPEED_CLK_MAC1RCLK>;
> +       clock-names = "MACCLK", "RCLK";
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
> +&gpio {
> +       power_out {
> +               gpios = <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_LOW>;
> +               output-low;
> +       };
> +};
> +
> +&gpio {
> +       status = "okay";
> +       /* Enable GPIOE0 and GPIOE2 pass-through by default */
> +       pinctrl-names = "pass-through";
> +       pinctrl-0 = <&pinctrl_gpie0_default
> +                       &pinctrl_gpie2_default>;
> +       gpio-line-names =
> +       /*A0-A7*/       "","MAC2LINK","BMC_RESET_CPLD","","BMC_SCL9","","MAC2MDC_R","",
> +       /*B0-B7*/       "BMC_INIT_OK","FM_SKU_ID2","FM_SPD_DDRCPU_LVLSHFT_DIS_R_N",
> +                               "FM_CPU_MSMI_CATERR_LVT3_BMC_N","","FM_CPU0_PROCHOT_LVT3_N",
> +                               "FM_CPU_MEM_THERMTRIP_LVT3_N","BIOS_LOAD_DEFAULT_R_N",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "","BMC_SD2CMD","BMC_SD2DAT0","BMC_SD2DAT1","BMC_SD2DAT2",
> +                               "BMC_SD2DAT3","BMC_SD2DET","BMC_SD2WPT",
> +       /*E0-E7*/       "FM_BOARD_ID0","FM_BOARD_ID1","FM_BOARD_ID2","FM_BOARD_ID3",
> +                               "FM_BOARD_ID4","FM_BOARD_ID5","","",
> +       /*F0-F7*/       "PSU1_PRESENT_N","PSU2_PRESENT_N","FAN_FAULT_LED_N","PSU_FAULT_LED_N",
> +                               "BIOS_DEBUG_MODE_N","FP_LCD_RESET","FAN_TYPE_SEL","RST_GLB_RST_WARN_N",
> +       /*G0-G7*/       "IRQ_LPTM21L_ALERT_N","IRQ_PLD_ALERT_N","AC_FAIL_N","FP_LCD_PRESENT_BMC",
> +                               "BMC_JTAG_TCK_MUX_SEL","BMC_BIOS_RESERVED","SYS_NMI_N","BMC_NMI_N",
> +       /*H0-H7*/       "JTAG_BMC_TDI","JTAG_BMC_TDO","JTAG_BMC_TCK","JTAG_BMC_TMS","FM_BOARD_ID6",
> +                               "FM_SKU_ID0","IRQ_SML1_PMBUS_ALERT_N","IRQ_SML0_ALERT_MUX_N",
> +       /*I0-I7*/       "FM_CPU_ERR0_LVT3_BMC_N","FM_CPU_ERR1_LVT3_BMC_N","FM_BMC_PCH_SCI_LPC_N",
> +                               "FM_SYS_THROTTLE_LVC3","SPI2_PCH_CS0_N","","","",
> +       /*J0-J7*/       "FM_CPU0_SKTOCC_LVT3_N","FM_CPU1_SKTOCC_LVT3_N","","SYSHOT_FAULT_LED_N",
> +                               "VGA_HSYNC","VGA_VSYNC","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","SYS_UART_TXD1","SYS_UART_RXD1",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","","","FM_PCH_BMC_THERMTRIP_N","INTRUDER_N",
> +       /*R0-R7*/       "SPI_BMC_BOOT_CS1_R_N","FM_CPU_MEMHOT_LVC3_N","DBP_CPU_PREQ_N",
> +                               "FM_CPU_ERR2_LVT3_BMC_N","RISER_NCSI_EN_N","","LOM_NCSI_EN_N","OCP_NCSI_EN_N",
> +       /*S0-S7*/       "BMC_XDP_PRDY_N","SIO_POWER_GOOD","BMC_PWR_DEBUG_R_N","BMC_DEBUG_EN_R_N","",
> +                               "GPIOS5_BMC","","GPIOS7_BMC",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","BMC_DET_UID_N","BMC_JTAG_SEL","SIO_ONCONTROL","","","","",
> +       /*Z0-Z7*/       "XDP_PRESENT_N","DBP_SYSPWROK","BMC_JTAG_SEL","FM_SMI_ACTIVE_N","","GPIOZ5","","",
> +       /*AA0-AA7*/     "FP_BMC_SYSLED_N","PS_PWROK","RST_PLTRST_BMC_N","HDA_SDO_BMC","FM_SLPS4_R_N",
> +                               "","POWER_BUTTON","POWER_OUT",
> +       /*AB0-AB7*/     "RESET_OUT","RESET_BUTTON","BIOS_REFLASH","POST_COMPLETE","","","","",
> +       /*AC0-AC7*/     "","","","","","","","";
> +};
> +
> +&i2c0 {
> +       /* FP_LCD */
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
> +       pca9548@70 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x70>;
> +       };
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +
> +       pca9548@70 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x70>;
> +       };
> +
> +       pca9548@71 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x71>;
> +       };
> +
> +       pca9548@72 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x72>;
> +       };
> +};
> +
> +&i2c4 {
> +       /* IPMB */
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +
> +       pca9548@70 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x70>;
> +       };
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +
> +       pca9548@70 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x70>;
> +       };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       adm1278@33 {
> +               compatible = "adi,adm1293";
> +               reg = <0x33>;
> +       };
> +
> +       adm1278@32 {
> +               compatible = "adi,adm1293";
> +               reg = <0x32>;
> +       };
> +
> +       adm1278@20 {
> +               compatible = "adi,adm1293";
> +               reg = <0x20>;
> +       };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +
> +       pca0: pca9555@23 {
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
> +            type = <PCA955X_TYPE_GPIO>;
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
> +       };
> +
> +       pca1: pca9555@22 {
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
> +       pca2: pca9555@20 {
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
> +       };
> +
> +       pca3: pca9555@21 {
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
> +};
> +
> +&i2c9 {
> +       /* cpld */
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
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
> +       };
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +
> +       power-supply@58 {
> +               compatible = "inspur,ipsps1";
> +               reg = <0x58>;
> +       };
> +
> +       power-supply@59 {
> +               compatible = "inspur,ipsps1";
> +               reg = <0x59>;
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
> +&lpc_ctrl {
> +   status = "okay";
> +   memory-region = <&flash_memory>;
> +   flash = <&spi1>;
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
> +};
> +
> +&kcs3 {
> +   status = "okay";
> +   kcs_addr = <0xca2>;
> +};
> +
> +&kcs4 {
> +   status = "okay";
> +   kcs_addr = <0xca4>;
> +};
> +
> +&peci0 {
> +   status = "okay";
> +};
> +
> +&adc {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +        &pinctrl_adc2_default &pinctrl_adc3_default &pinctrl_adc4_default
> +        &pinctrl_adc5_default &pinctrl_adc6_default &pinctrl_adc7_default
> +        &pinctrl_adc8_default &pinctrl_adc9_default &pinctrl_adc10_default
> +        &pinctrl_adc11_default &pinctrl_adc12_default &pinctrl_adc13_default
> +        &pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&vhub {
> +   status = "okay";
> +};
> +
> +&video {
> +   status = "okay";
> +   memory-region = <&video_engine_memory>;
> +};
> +
> +&vuart {
> +       status = "okay";
> +};
> +
> --
> 2.17.1
>
