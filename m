Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E638F890
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 05:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpzfY1xnWz305w
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 13:12:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cVHis5a4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=guopingjn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cVHis5a4; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpzfD73TCz2yhd
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 13:12:36 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id k14so41481233eji.2
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 20:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtOn9Y05iZneIDTttyiYlUka4YsFWYRU2H0KKYEtL7Y=;
 b=cVHis5a4Iwm+A7MtzX0YKc3ihZ7rJtf5ImVfP/CphEn7uIZr0T2KXlHu5TBIiL8zwL
 XN9cf1vce0gj91GGBI/dmOv59xgAAATl0BdKC/CF3ReJed5SQaALt6oS6RYO0biPm5yy
 58rderZXGU90Zlk9jjiWSK7iVXQ/P1aXJ2aeyalEEeTfq9AnBpCfTqdv6LU6Eepbvjh2
 BdI6/ip6ukS77kJ9xiabLXA8pj4Djn6CFPK5rjjf+g1bFR1S0mKRTa0P2Kc9YIQAwW26
 ZvNb4pRCU0bYG/5gjNXkGFF/lEbPd3wuJ0kN+4Zwh0ErqFz3o8U7Q1SVaFW6uQcSLEi0
 JY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtOn9Y05iZneIDTttyiYlUka4YsFWYRU2H0KKYEtL7Y=;
 b=ay5QfWn2rkisC9pTkxNyYgw3lV/bXux0zt6oXyITfDOjijDAzPrTaU/ipWZHOrsFGp
 +sXuFgmtJ+AzB8m8pSaIp+UL3+N3C2wAFIp4U/yFbMGRDUzPCh8CN1qLH0eAK244nHUu
 cGBC9qwdm+s0SqbJ1b5wygXxDaC9scy3HnpSoHcbojutfsxHaWlpy3uYIfFpHfut2PiV
 u7DCpyTKg7Q/jBP/yrtzBZqJw/NHusmnG5nsoPm1tjzTo2Soq+PUlqVKFVWydgYvaecq
 qaTJXh+JT7+xi+chRq+gYwWMcbwKwXdXyn0LvGP6wikQatkd7XlUCxuMu0KZ2aGbWpDA
 kSjg==
X-Gm-Message-State: AOAM532F4/wUx1+0F4JRbX9S7iJpNKfcAkLBPYxk9+xV5z5ct7hbgpeI
 n4VcXWSaq8hhyPOfbO1NQKYWq1gZBKQQJF+trMJ5ss5WZ6Pyaw==
X-Google-Smtp-Source: ABdhPJzQNqIi2dtrlhf9cuW6KGgxIeDyhrjL1bH9p82BzYHzFUGc0UM/ubXLLhIlgythOzybG9jW+/mTJp3xAApDcHI=
X-Received: by 2002:a17:906:eb0c:: with SMTP id
 mb12mr26456264ejb.109.1621912349532; 
 Mon, 24 May 2021 20:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210524003039.18003-1-guopingjn@gmail.com>
 <CACPK8Xco+K9gvX3A4XWBMPEiN3U9jS0f==hHk_FhfeiLszQPkg@mail.gmail.com>
In-Reply-To: <CACPK8Xco+K9gvX3A4XWBMPEiN3U9jS0f==hHk_FhfeiLszQPkg@mail.gmail.com>
From: Ping Guo <guopingjn@gmail.com>
Date: Tue, 25 May 2021 11:12:18 +0800
Message-ID: <CAOduMjZ206M=M1T0sF6nnjsQ6iDQgcW=obu1DrdoaBKSt-HPhA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: Add Inspur NF5280M6 BMC machine
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000007364dc05c31ee5cd"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ping Guo <guoping@inspur.com>,
 banht@inspur.com, George Liu <liuxiwei@inspur.com>, wangxinglong@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007364dc05c31ee5cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joel Stanley <joel@jms.id.au> =E4=BA=8E2021=E5=B9=B45=E6=9C=8824=E6=97=A5=
=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=8810:40=E5=86=99=E9=81=93=EF=BC=9A

> On Mon, 24 May 2021 at 00:30, <guopingjn@gmail.com> wrote:
> >
> > From: Ping Guo <guoping@inspur.com>
> >
> > The Inspur NF5280M6 is an x86 platform server with an AST2500-based BMC=
.
> > This dts file provides a basic configuration for its OpenBMC
> > development.
> >
> > Signed-off-by: George Liu <liuxiwei@inspur.com>
> > Signed-off-by: Ping Guo <guoping@inspur.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../boot/dts/aspeed-bmc-inspur-nf5280m6.dts   | 725 ++++++++++++++++++
> >  2 files changed, 726 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 03b5424bafa8..cc2580f1e99b 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1405,6 +1405,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >         aspeed-bmc-ibm-rainier-4u.dtb \
> >         aspeed-bmc-intel-s2600wf.dtb \
> >         aspeed-bmc-inspur-fp5280g2.dtb \
> > +       aspeed-bmc-inspur-nf5280m6.dtb \
> >         aspeed-bmc-lenovo-hr630.dtb \
> >         aspeed-bmc-lenovo-hr855xg2.dtb \
> >         aspeed-bmc-microsoft-olympus.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
> b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
> > new file mode 100644
> > index 000000000000..7ea0e3ae8ffd
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-nf5280m6.dts
> > @@ -0,0 +1,725 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2021 Inspur Corporation
> > +/dts-v1/;
> > +
> > +#include "aspeed-g5.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/i2c/i2c.h>
> > +#include <dt-bindings/leds/leds-pca955x.h>
> > +
> > +/ {
> > +       model =3D "NF5280M6 BMC";
> > +       compatible =3D "inspur,nf5280m6-bmc", "aspeed,ast2500";
> > +
> > +       chosen {
> > +               stdout-path =3D &uart5;
> > +               bootargs =3D "console=3DttyS4,115200 earlyprintk";
> > +       };
> > +
> > +       memory@80000000 {
> > +               reg =3D <0x80000000 0x40000000>;
> > +       };
> > +
> > +       reserved-memory {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               ranges;
> > +
> > +               vga_memory: framebuffer@9f000000 {
> > +                       no-map;
> > +                       reg =3D <0x9f000000 0x01000000>; /* 16M */
> > +               };
> > +
> > +               gfx_memory: framebuffer {
> > +                       size =3D <0x01000000>;
> > +                       alignment =3D <0x01000000>;
> > +                       compatible =3D "shared-dma-pool";
> > +                       reusable;
> > +               };
> > +
> > +               video_engine_memory: jpegbuffer {
> > +                       size =3D <0x02000000>;    /* 32M */
> > +                       alignment =3D <0x01000000>;
> > +                       compatible =3D "shared-dma-pool";
> > +                       reusable;
> > +               };
> > +
> > +               flash_memory: region@98000000 {
> > +                       no-map;
> > +                       reg =3D <0x98000000 0x04000000>; /* 64M */
>
> Are you sure you need this? This is used by the aspeed-lpc-ctrl driver
> to map a region of the AHB into the LPC address space. This is
> normally only used by PowerPC systems.
>
Thanks,I think we don't neet this.I will modify this property.

> > +               };
> > +       };
> > +
> > +       leds {
> > +           compatible =3D "gpio-leds";
> > +
> > +               bmc_alive {
> > +                       label =3D "bmc_alive";
> > +                       gpios =3D <&gpio ASPEED_GPIO(B, 0)
> GPIO_ACTIVE_LOW>;
> > +                       linux,default-trigger =3D "timer";
> > +                       led-pattern =3D <1000 1000>;
> > +               };
> > +
> > +               front-fan {
> > +                       label =3D "front-fan";
> > +                       gpios =3D <&gpio ASPEED_GPIO(F,2) GPIO_ACTIVE_L=
OW>;
> > +               };
> > +
> > +           front-psu {
> > +                       label =3D "front-psu";
> > +                       gpios =3D <&gpio ASPEED_GPIO(F,3) GPIO_ACTIVE_L=
OW>;
> > +               };
> > +
> > +           front-syshot {
> > +                       label =3D "front-syshot";
> > +                       gpios =3D <&gpio ASPEED_GPIO(J, 3)
> GPIO_ACTIVE_LOW>;
> > +               };
> > +
> > +               front-memory {
> > +                       label =3D "front-memory";
> > +                       gpios =3D <&gpio ASPEED_GPIO(S, 7)
> GPIO_ACTIVE_LOW>;
> > +               };
> > +
> > +               identify {
> > +                       label =3D "identify";
> > +                       gpios =3D <&gpio ASPEED_GPIO(AA, 0)
> GPIO_ACTIVE_LOW>;
> > +               };
> > +       };
> > +
> > +       iio-hwmon {
> > +               compatible =3D "iio-hwmon";
> > +               io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> > +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> > +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> > +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> > +       };
> > +};
> > +
> > +&fmc {
> > +       status =3D "okay";
> > +       flash@0 {
> > +               status =3D "okay";
> > +               m25p,fast-read;
> > +               label =3D "bmc";
> > +               spi-max-frequency =3D <50000000>;
> > +#include "openbmc-flash-layout.dtsi"
> > +       };
> > +};
> > +
> > +&spi1 {
> > +       status =3D "okay";
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_spi1_default>;
> > +       flash@0 {
> > +               status =3D "okay";
> > +               m25p,fast-read;
> > +               label =3D "bios";
> > +               spi-max-frequency =3D <100000000>;
> > +       };
> > +};
> > +
> > +&uart1 {
> > +       status =3D "okay";
> > +};
> > +
> > +&uart5 {
> > +       status =3D "okay";
> > +};
> > +
> > +&mac0 {
> > +       status =3D "okay";
> > +
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_rmii1_default>;
> > +       clocks =3D <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> > +               <&syscon ASPEED_CLK_MAC1RCLK>;
> > +       clock-names =3D "MACCLK", "RCLK";
> > +       use-ncsi;
> > +};
> > +
> > +&mac1 {
> > +       status =3D "okay";
> > +
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> > +};
> > +
> > +&gpio {
> > +       power_out {
> > +               gpios =3D <ASPEED_GPIO(AA, 7) GPIO_ACTIVE_LOW>;
> > +               output-low;
> > +       };
> > +};
> > +
> > +&gpio {
> > +       status =3D "okay";
> > +       /* Enable GPIOE0 and GPIOE2 pass-through by default */
> > +       pinctrl-names =3D "pass-through";
> > +       pinctrl-0 =3D <&pinctrl_gpie0_default
> > +                       &pinctrl_gpie2_default>;
> > +       gpio-line-names =3D
> > +       /*A0-A7*/
>  "","MAC2LINK","BMC_RESET_CPLD","","BMC_SCL9","","MAC2MDC_R","",
> > +       /*B0-B7*/
>  "BMC_INIT_OK","FM_SKU_ID2","FM_SPD_DDRCPU_LVLSHFT_DIS_R_N",
> > +
>  "FM_CPU_MSMI_CATERR_LVT3_BMC_N","","FM_CPU0_PROCHOT_LVT3_N",
> > +
>  "FM_CPU_MEM_THERMTRIP_LVT3_N","BIOS_LOAD_DEFAULT_R_N",
> > +       /*C0-C7*/       "","","","","","","","",
> > +       /*D0-D7*/
>  "","BMC_SD2CMD","BMC_SD2DAT0","BMC_SD2DAT1","BMC_SD2DAT2",
> > +                               "BMC_SD2DAT3","BMC_SD2DET","BMC_SD2WPT"=
,
> > +       /*E0-E7*/
>  "FM_BOARD_ID0","FM_BOARD_ID1","FM_BOARD_ID2","FM_BOARD_ID3",
> > +                               "FM_BOARD_ID4","FM_BOARD_ID5","","",
> > +       /*F0-F7*/
>  "PSU1_PRESENT_N","PSU2_PRESENT_N","FAN_FAULT_LED_N","PSU_FAULT_LED_N",
> > +
>  "BIOS_DEBUG_MODE_N","FP_LCD_RESET","FAN_TYPE_SEL",
> > +                               "RST_GLB_RST_WARN_N",
> > +       /*G0-G7*/
>  "IRQ_LPTM21L_ALERT_N","IRQ_PLD_ALERT_N","AC_FAIL_N","FP_LCD_PRESENT_BMC"=
,
> > +
>  "BMC_JTAG_TCK_MUX_SEL","BMC_BIOS_RESERVED","SYS_NMI_N","BMC_NMI_N",
> > +       /*H0-H7*/
>  "JTAG_BMC_TDI","JTAG_BMC_TDO","JTAG_BMC_TCK","JTAG_BMC_TMS","FM_BOARD_ID=
6",
> > +
>  "FM_SKU_ID0","IRQ_SML1_PMBUS_ALERT_N","IRQ_SML0_ALERT_MUX_N",
> > +       /*I0-I7*/
>  "FM_CPU_ERR0_LVT3_BMC_N","FM_CPU_ERR1_LVT3_BMC_N","FM_BMC_PCH_SCI_LPC_N"=
,
> > +
>  "FM_SYS_THROTTLE_LVC3","SPI2_PCH_CS0_N","","","",
> > +       /*J0-J7*/
>  "FM_CPU0_SKTOCC_LVT3_N","FM_CPU1_SKTOCC_LVT3_N","","SYSHOT_FAULT_LED_N",
> > +                               "VGA_HSYNC","VGA_VSYNC","","",
> > +       /*K0-K7*/       "","","","","","","","",
> > +       /*L0-L7*/
>  "","","","","","","SYS_UART_TXD1","SYS_UART_RXD1",
> > +       /*M0-M7*/       "","","","","","","","",
> > +       /*N0-N7*/       "","","","","","","","",
> > +       /*O0-O7*/       "","","","","","","","",
> > +       /*P0-P7*/       "","","","","","","","",
> > +       /*Q0-Q7*/
>  "","","","","","","FM_PCH_BMC_THERMTRIP_N","INTRUDER_N",
> > +       /*R0-R7*/       "SPI_BMC_BOOT_CS1_R_N","FM_CPU_MEMHOT_LVC3_N",
> > +
>  "DBP_CPU_PREQ_N","FM_CPU_ERR2_LVT3_BMC_N",
> > +
>  "RISER_NCSI_EN_N","","LOM_NCSI_EN_N","OCP_NCSI_EN_N",
> > +       /*S0-S7*/
>  "BMC_XDP_PRDY_N","SIO_POWER_GOOD","BMC_PWR_DEBUG_R_N","BMC_DEBUG_EN_R_N"=
,"",
> > +                               "GPIOS5_BMC","","GPIOS7_BMC",
> > +       /*T0-T7*/       "","","","","","","","",
> > +       /*U0-U7*/       "","","","","","","","",
> > +       /*V0-V7*/       "","","","","","","","",
> > +       /*W0-W7*/       "","","","","","","","",
> > +       /*X0-X7*/       "","","","","","","","",
> > +       /*Y0-Y7*/
>  "","BMC_DET_UID_N","BMC_JTAG_SEL","SIO_ONCONTROL","","","","",
> > +       /*Z0-Z7*/
>  "XDP_PRESENT_N","DBP_SYSPWROK","BMC_JTAG_SEL","FM_SMI_ACTIVE_N","",
> > +                               "GPIOZ5","","",
> > +       /*AA0-AA7*/
>  "FP_BMC_SYSLED_N","PS_PWROK","RST_PLTRST_BMC_N","HDA_SDO_BMC",
> > +
>  "FM_SLPS4_R_N","","POWER_BUTTON","POWER_OUT",
> > +       /*AB0-AB7*/
>  "RESET_OUT","RESET_BUTTON","BIOS_REFLASH","POST_COMPLETE","","","","",
> > +       /*AC0-AC7*/     "","","","","","","","";
> > +};
> > +
> > +&i2c0 {
> > +       /* FP_LCD */
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c1 {
> > +       status =3D "okay";
> > +
> > +       eeprom@50 {
> > +               compatible =3D "atmel,24c256";
> > +               reg =3D <0x50>;
> > +               label =3D "fru";
> > +       };
> > +};
> > +
> > +&i2c2 {
> > +       status =3D "okay";
> > +
> > +       tmp112@48 {
> > +               compatible =3D "ti,tmp112";
> > +               reg =3D <0x48>;
> > +               label =3D "inlet";
> > +       };
> > +
> > +       tmp112@49 {
> > +               compatible =3D "ti,tmp112";
> > +               reg =3D <0x49>;
> > +               label =3D "outlet";
> > +       };
> > +
> > +       pca9548@70 {
> > +               compatible =3D "nxp,pca9548";
> > +               reg =3D <0x70>;
> > +       };
> > +};
> > +
> > +&i2c3 {
> > +       status =3D "okay";
> > +
> > +       pca9548@70 {
> > +               compatible =3D "nxp,pca9548";
> > +               reg =3D <0x70>;
> > +       };
> > +
> > +       pca9548@71 {
> > +               compatible =3D "nxp,pca9548";
> > +               reg =3D <0x71>;
> > +       };
> > +
> > +       pca9548@72 {
> > +               compatible =3D "nxp,pca9548";
> > +               reg =3D <0x72>;
> > +       };
> > +};
> > +
> > +&i2c4 {
> > +       /* IPMB */
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c5 {
> > +       status =3D "okay";
> > +
> > +       pca9548@70 {
> > +               compatible =3D "nxp,pca9548";
> > +               reg =3D <0x70>;
> > +       };
> > +};
> > +
> > +&i2c6 {
> > +       status =3D "okay";
> > +
> > +       pca9548@70 {
> > +               compatible =3D "nxp,pca9548";
> > +               reg =3D <0x70>;
> > +       };
> > +};
> > +
> > +&i2c7 {
> > +       status =3D "okay";
> > +
> > +       adm1278@33 {
> > +               compatible =3D "adi,adm1293";
> > +               reg =3D <0x33>;
> > +       };
> > +
> > +       adm1278@32 {
> > +               compatible =3D "adi,adm1293";
> > +               reg =3D <0x32>;
> > +       };
> > +
> > +       adm1278@20 {
> > +               compatible =3D "adi,adm1293";
> > +               reg =3D <0x20>;
> > +       };
> > +};
> > +
> > +&i2c8 {
> > +       status =3D "okay";
> > +
> > +       pca0: pca9555@23 {
> > +               compatible =3D "nxp,pca9555";
> > +               reg =3D <0x23>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells =3D <2>;
> > +
> > +               gpio@0 {
> > +                       reg =3D <0>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg =3D <1>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg =3D <2>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg =3D <3>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg =3D <4>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg =3D <5>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg =3D <6>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca1: pca9555@22 {
> > +               compatible =3D "nxp,pca9555";
> > +               reg =3D <0x22>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells =3D <2>;
> > +
> > +               gpio@0 {
> > +                       reg =3D <0>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg =3D <1>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg =3D <2>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg =3D <3>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg =3D <4>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg =3D <5>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg =3D <6>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg =3D <7>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca2: pca9555@20 {
> > +               compatible =3D "nxp,pca9555";
> > +               reg =3D <0x20>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells =3D <2>;
> > +
> > +               gpio@0 {
> > +                       reg =3D <0>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg =3D <1>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg =3D <2>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg =3D <3>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg =3D <4>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg =3D <5>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg =3D <6>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg =3D <7>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca3: pca9555@21 {
> > +               compatible =3D "nxp,pca9555";
> > +               reg =3D <0x21>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells =3D <2>;
> > +
> > +               gpio@0 {
> > +                       reg =3D <0>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg =3D <1>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg =3D <2>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg =3D <3>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg =3D <4>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg =3D <5>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg =3D <6>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg =3D <7>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +};
> > +
> > +&i2c9 {
> > +       /* cpld */
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c10 {
> > +       status =3D "okay";
> > +
> > +       pca4: pca9555@24 {
> > +               compatible =3D "nxp,pca9555";
> > +               reg =3D <0x24>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells =3D <2>;
> > +
> > +               gpio@0 {
> > +                       reg =3D <0>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg =3D <1>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg =3D <2>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg =3D <3>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg =3D <4>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg =3D <5>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg =3D <6>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@7 {
> > +                       reg =3D <7>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +
> > +       pca5: pca9555@25 {
> > +               compatible =3D "nxp,pca9555";
> > +               reg =3D <0x25>;
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells =3D <2>;
> > +
> > +               gpio@0 {
> > +                       reg =3D <0>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@1 {
> > +                       reg =3D <1>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@2 {
> > +                       reg =3D <2>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@3 {
> > +                       reg =3D <3>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@4 {
> > +                       reg =3D <4>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@5 {
> > +                       reg =3D <5>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +
> > +               gpio@6 {
> > +                       reg =3D <6>;
> > +                       type =3D <PCA955X_TYPE_GPIO>;
> > +               };
> > +       };
> > +};
> > +
> > +&i2c11 {
> > +       status =3D "okay";
> > +
> > +       power-supply@58 {
> > +               compatible =3D "inspur,ipsps1";
> > +               reg =3D <0x58>;
> > +       };
> > +
> > +       power-supply@59 {
> > +               compatible =3D "inspur,ipsps1";
> > +               reg =3D <0x59>;
> > +       };
> > +};
> > +
> > +&i2c12 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c13 {
> > +       status =3D "okay";
> > +};
> > +
> > +&lpc_ctrl {
> > +       status =3D "okay";
> > +       memory-region =3D <&flash_memory>;
> > +       flash =3D <&spi1>;
>
> As I described before, most of the time this driver is only used by
> the hiomap daemon on Power systems.
>
> > +};
> > +
> > +&gfx {
> > +       status =3D "okay";
> > +       memory-region =3D <&gfx_memory>;
> > +};
>
> This is the BMC display device. You only need to enable it if you are
> running code on the BMC to
>
> It is not related to using the BMC has a host PCIe display device.
>
> Will modify too.

> > +
> > +&pinctrl {
> > +       aspeed,external-nodes =3D <&gfx &lhc>;
> > +};
> > +
> > +&pwm_tacho {
> > +       status =3D "okay";
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default
> > +               &pinctrl_pwm2_default &pinctrl_pwm3_default
> > +               &pinctrl_pwm4_default &pinctrl_pwm5_default
> > +               &pinctrl_pwm6_default &pinctrl_pwm7_default>;
> > +
> > +       fan@0 {
> > +               reg =3D <0x00>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x00 0x01>;
> > +       };
> > +
> > +       fan@1 {
> > +               reg =3D <0x01>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x02 0x03>;
> > +       };
> > +
> > +       fan@2 {
> > +               reg =3D <0x02>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x04 0x05>;
> > +       };
> > +
> > +       fan@3 {
> > +               reg =3D <0x03>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x06 0x07>;
> > +       };
> > +
> > +       fan@4 {
> > +               reg =3D <0x04>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x08 0x09>;
> > +       };
> > +
> > +       fan@5 {
> > +               reg =3D <0x05>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x0a 0x0b>;
> > +       };
> > +
> > +       fan@6 {
> > +               reg =3D <0x06>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x0c 0x0d>;
> > +       };
> > +
> > +       fan@7 {
> > +               reg =3D <0x07>;
> > +               aspeed,fan-tach-ch =3D /bits/ 8 <0x0e 0x0f>;
> > +       };
> > +};
> > +
> > +&kcs3 {
> > +       status =3D "okay";
> > +       kcs_addr =3D <0xca2>;
> > +};
> > +
> > +&kcs4 {
> > +       status =3D "okay";
> > +       kcs_addr =3D <0xca4>;
> > +};
> > +
> > +&adc {
> > +       status =3D "okay";
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
> > +        &pinctrl_adc2_default &pinctrl_adc3_default
> &pinctrl_adc4_default
> > +        &pinctrl_adc5_default &pinctrl_adc6_default
> &pinctrl_adc7_default
> > +        &pinctrl_adc8_default &pinctrl_adc9_default
> &pinctrl_adc10_default
> > +        &pinctrl_adc11_default &pinctrl_adc12_default
> &pinctrl_adc13_default
> > +        &pinctrl_adc14_default &pinctrl_adc15_default>;
> > +};
> > +
> > +&vhub {
> > +       status =3D "okay";
> > +};
> > +
> > +&video {
> > +       status =3D "okay";
> > +       memory-region =3D <&video_engine_memory>;
> > +};
> > +
> > +&vuart {
> > +       status =3D "okay";
> > +};
> > --
> > 2.17.1
> >
>

--0000000000007364dc05c31ee5cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPkpvZWwgU3Rhbmxl
eSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmpvZWxAam1zLmlkLmF1Ij5qb2VsQGptcy5pZC5hdTwvYT4m
Z3Q7IOS6jjIwMjHlubQ15pyIMjTml6XlkajkuIAg5LiK5Y2IMTA6NDDlhpnpgZPvvJo8YnI+PC9k
aXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHgg
MHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmct
bGVmdDoxZXgiPk9uIE1vbiwgMjQgTWF5IDIwMjEgYXQgMDA6MzAsICZsdDs8YSBocmVmPSJtYWls
dG86Z3VvcGluZ2puQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmd1b3BpbmdqbkBnbWFpbC5j
b208L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0OyBGcm9tOiBQaW5nIEd1byAmbHQ7
PGEgaHJlZj0ibWFpbHRvOmd1b3BpbmdAaW5zcHVyLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmd1b3Bp
bmdAaW5zcHVyLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgVGhlIEluc3B1ciBORjUy
ODBNNiBpcyBhbiB4ODYgcGxhdGZvcm0gc2VydmVyIHdpdGggYW4gQVNUMjUwMC1iYXNlZCBCTUMu
PGJyPg0KJmd0OyBUaGlzIGR0cyBmaWxlIHByb3ZpZGVzIGEgYmFzaWMgY29uZmlndXJhdGlvbiBm
b3IgaXRzIE9wZW5CTUM8YnI+DQomZ3Q7IGRldmVsb3BtZW50Ljxicj4NCiZndDs8YnI+DQomZ3Q7
IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBMaXUgJmx0OzxhIGhyZWY9Im1haWx0bzpsaXV4aXdlaUBp
bnNwdXIuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGl1eGl3ZWlAaW5zcHVyLmNvbTwvYT4mZ3Q7PGJy
Pg0KJmd0OyBTaWduZWQtb2ZmLWJ5OiBQaW5nIEd1byAmbHQ7PGEgaHJlZj0ibWFpbHRvOmd1b3Bp
bmdAaW5zcHVyLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmd1b3BpbmdAaW5zcHVyLmNvbTwvYT4mZ3Q7
PGJyPg0KJmd0OyAtLS08YnI+DQomZ3Q7wqAgYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGXCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAxICs8YnI+DQomZ3Q7wqAgLi4uL2Jvb3Qv
ZHRzL2FzcGVlZC1ibWMtaW5zcHVyLW5mNTI4MG02LmR0c8KgIMKgfCA3MjUgKysrKysrKysrKysr
KysrKysrPGJyPg0KJmd0O8KgIDIgZmlsZXMgY2hhbmdlZCwgNzI2IGluc2VydGlvbnMoKyk8YnI+
DQomZ3Q7wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMt
aW5zcHVyLW5mNTI4MG02LmR0czxicj4NCiZndDs8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlPGJyPg0K
Jmd0OyBpbmRleCAwM2I1NDI0YmFmYTguLmNjMjU4MGYxZTk5YiAxMDA2NDQ8YnI+DQomZ3Q7IC0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlPGJyPg0KJmd0OyArKysgYi9hcmNoL2FybS9i
b290L2R0cy9NYWtlZmlsZTxicj4NCiZndDsgQEAgLTE0MDUsNiArMTQwNSw3IEBAIGR0Yi0kKENP
TkZJR19BUkNIX0FTUEVFRCkgKz0gXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGFzcGVlZC1ibWMt
aWJtLXJhaW5pZXItNHUuZHRiIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBhc3BlZWQtYm1jLWlu
dGVsLXMyNjAwd2YuZHRiIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBhc3BlZWQtYm1jLWluc3B1
ci1mcDUyODBnMi5kdGIgXDxicj4NCiZndDsgK8KgIMKgIMKgIMKgYXNwZWVkLWJtYy1pbnNwdXIt
bmY1MjgwbTYuZHRiIFw8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBhc3BlZWQtYm1jLWxlbm92by1o
cjYzMC5kdGIgXDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGFzcGVlZC1ibWMtbGVub3ZvLWhyODU1
eGcyLmR0YiBcPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgYXNwZWVkLWJtYy1taWNyb3NvZnQtb2x5
bXB1cy5kdGIgXDxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1ibWMtaW5zcHVyLW5mNTI4MG02LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMt
aW5zcHVyLW5mNTI4MG02LmR0czxicj4NCiZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQom
Z3Q7IGluZGV4IDAwMDAwMDAwMDAwMC4uN2VhMGUzYWU4ZmZkPGJyPg0KJmd0OyAtLS0gL2Rldi9u
dWxsPGJyPg0KJmd0OyArKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWluc3B1ci1u
ZjUyODBtNi5kdHM8YnI+DQomZ3Q7IEBAIC0wLDAgKzEsNzI1IEBAPGJyPg0KJmd0OyArLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjA8YnI+DQomZ3Q7ICsvLyBDb3B5cmlnaHQgKGMp
IDIwMjEgSW5zcHVyIENvcnBvcmF0aW9uPGJyPg0KJmd0OyArL2R0cy12MS87PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArI2luY2x1ZGUgJnF1b3Q7YXNwZWVkLWc1LmR0c2kmcXVvdDs8YnI+DQomZ3Q7
ICsjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvZ3Bpby9hc3BlZWQtZ3Bpby5oJmd0Ozxicj4NCiZn
dDsgKyNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9pMmMvaTJjLmgmZ3Q7PGJyPg0KJmd0OyArI2lu
Y2x1ZGUgJmx0O2R0LWJpbmRpbmdzL2xlZHMvbGVkcy1wY2E5NTV4LmgmZ3Q7PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArLyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBtb2RlbCA9ICZxdW90O05GNTI4
ME02IEJNQyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtp
bnNwdXIsbmY1MjgwbTYtYm1jJnF1b3Q7LCAmcXVvdDthc3BlZWQsYXN0MjUwMCZxdW90Ozs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoGNob3NlbiB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdGRvdXQtcGF0aCA9ICZhbXA7dWFydDU7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBib290YXJncyA9ICZxdW90O2NvbnNvbGU9dHR5UzQsMTE1MjAw
IGVhcmx5cHJpbnRrJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoG1lbW9yeUA4MDAwMDAwMCB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg4MDAwMDAwMCAweDQwMDAwMDAwJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBy
ZXNlcnZlZC1tZW1vcnkgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJl
c3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
c2l6ZS1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJhbmdlczs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZn
YV9tZW1vcnk6IGZyYW1lYnVmZmVyQDlmMDAwMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vLW1hcDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDlmMDAwMDAwIDB4MDEwMDAwMDAmZ3Q7OyAv
KiAxNk0gKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBnZnhfbWVtb3J5OiBmcmFtZWJ1ZmZl
ciB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzaXplID0g
Jmx0OzB4MDEwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYWxpZ25tZW50ID0gJmx0OzB4MDEwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3NoYXJlZC1k
bWEtcG9vbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJldXNhYmxlOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZpZGVvX2VuZ2luZV9tZW1v
cnk6IGpwZWdidWZmZXIgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgc2l6ZSA9ICZsdDsweDAyMDAwMDAwJmd0OzvCoCDCoCAvKiAzMk0gKi88YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFsaWdubWVudCA9ICZsdDsweDAx
MDAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNvbXBhdGlibGUgPSAmcXVvdDtzaGFyZWQtZG1hLXBvb2wmcXVvdDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXVzYWJsZTs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBmbGFzaF9tZW1vcnk6IHJlZ2lvbkA5ODAwMDAwMCB7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBuby1tYXA7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg5ODAwMDAwMCAweDA0MDAw
MDAwJmd0OzsgLyogNjRNICovPGJyPg0KPGJyPg0KQXJlIHlvdSBzdXJlIHlvdSBuZWVkIHRoaXM/
IFRoaXMgaXMgdXNlZCBieSB0aGUgYXNwZWVkLWxwYy1jdHJsIGRyaXZlcjxicj4NCnRvIG1hcCBh
IHJlZ2lvbiBvZiB0aGUgQUhCIGludG8gdGhlIExQQyBhZGRyZXNzIHNwYWNlLiBUaGlzIGlzPGJy
Pg0Kbm9ybWFsbHkgb25seSB1c2VkIGJ5IFBvd2VyUEMgc3lzdGVtcy48YnI+DQo8L2Jsb2NrcXVv
dGU+PGRpdj5UaGFua3MsSSB0aGluayB3ZSBkb24mIzM5O3QgbmVldCB0aGlzLkkgd2lsbCBtb2Rp
ZnkgdGhpcyBwcm9wZXJ0eS4gPGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqBsZWRzIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPSAmcXVvdDtncGlvLWxlZHMmcXVvdDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBibWNfYWxpdmUgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtibWNfYWxpdmUmcXVvdDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvcyA9ICZsdDsmYW1wO2dw
aW8gQVNQRUVEX0dQSU8oQiwgMCkgR1BJT19BQ1RJVkVfTE9XJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxpbnV4LGRlZmF1bHQtdHJpZ2dlciA9ICZx
dW90O3RpbWVyJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgbGVkLXBhdHRlcm4gPSAmbHQ7MTAwMCAxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBmcm9udC1mYW4gezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtmcm9udC1mYW4mcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvcyA9ICZsdDsmYW1wO2dwaW8gQVNQRUVE
X0dQSU8oRiwyKSBHUElPX0FDVElWRV9MT1cmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoGZyb250
LXBzdSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJl
bCA9ICZxdW90O2Zyb250LXBzdSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdwaW9zID0gJmx0OyZhbXA7Z3BpbyBBU1BFRURfR1BJTyhGLDMpIEdQ
SU9fQUNUSVZFX0xPVyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgZnJvbnQtc3lzaG90IHs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7
ZnJvbnQtc3lzaG90JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3Bpb3MgPSAmbHQ7JmFtcDtncGlvIEFTUEVFRF9HUElPKEosIDMpIEdQSU9fQUNU
SVZFX0xPVyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZn
dDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZnJvbnQtbWVtb3J5IHs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7
ZnJvbnQtbWVtb3J5JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3Bpb3MgPSAmbHQ7JmFtcDtncGlvIEFTUEVFRF9HUElPKFMsIDcpIEdQSU9fQUNU
SVZFX0xPVyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZn
dDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWRlbnRpZnkgezxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtpZGVu
dGlmeSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdwaW9zID0gJmx0OyZhbXA7Z3BpbyBBU1BFRURfR1BJTyhBQSwgMCkgR1BJT19BQ1RJVkVfTE9X
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgaWlvLWh3bW9uIHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtpaW8t
aHdtb24mcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpby1jaGFubmVs
cyA9ICZsdDsmYW1wO2FkYyAwJmd0OywgJmx0OyZhbXA7YWRjIDEmZ3Q7LCAmbHQ7JmFtcDthZGMg
MiZndDssICZsdDsmYW1wO2FkYyAzJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZsdDsmYW1wO2FkYyA0Jmd0OywgJmx0OyZhbXA7YWRjIDUmZ3Q7LCAm
bHQ7JmFtcDthZGMgNiZndDssICZsdDsmYW1wO2FkYyA3Jmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDsmYW1wO2FkYyA4Jmd0OywgJmx0OyZhbXA7
YWRjIDkmZ3Q7LCAmbHQ7JmFtcDthZGMgMTAmZ3Q7LCAmbHQ7JmFtcDthZGMgMTEmZ3Q7LDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OyZhbXA7YWRjIDEy
Jmd0OywgJmx0OyZhbXA7YWRjIDEzJmd0OywgJmx0OyZhbXA7YWRjIDE0Jmd0OywgJmx0OyZhbXA7
YWRjIDE1Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArfTs8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2ZtYyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0dXMg
PSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgZmxhc2hAMCB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbTI1cCxmYXN0LXJlYWQ7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O2JtYyZxdW90Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwaS1tYXgtZnJlcXVlbmN5ID0gJmx0OzUwMDAw
MDAwJmd0Ozs8YnI+DQomZ3Q7ICsjaW5jbHVkZSAmcXVvdDtvcGVuYm1jLWZsYXNoLWxheW91dC5k
dHNpJnF1b3Q7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK307PGJyPg0KJmd0
OyArPGJyPg0KJmd0OyArJmFtcDtzcGkxIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHN0YXR1cyA9
ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0g
JnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZs
dDsmYW1wO3BpbmN0cmxfc3BpMV9kZWZhdWx0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoGZs
YXNoQDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7
b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG0yNXAsZmFzdC1y
ZWFkOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtiaW9z
JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3BpLW1heC1mcmVxdWVu
Y3kgPSAmbHQ7MTAwMDAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0
OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO3VhcnQxIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICsmYW1wO3VhcnQ1IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHN0YXR1cyA9
ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsm
YW1wO21hYzAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90
Ozs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVv
dDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZh
bXA7cGluY3RybF9ybWlpMV9kZWZhdWx0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoGNsb2Nr
cyA9ICZsdDsmYW1wO3N5c2NvbiBBU1BFRURfQ0xLX0dBVEVfTUFDMUNMSyZndDssPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7JmFtcDtzeXNjb24gQVNQRUVEX0NMS19NQUMx
UkNMSyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O01BQ0NM
SyZxdW90OywgJnF1b3Q7UkNMSyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHVzZS1uY3Np
Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDttYWMxIHs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO3BpbmN0cmxfcmdtaWky
X2RlZmF1bHQgJmFtcDtwaW5jdHJsX21kaW8yX2RlZmF1bHQmZ3Q7Ozxicj4NCiZndDsgK307PGJy
Pg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtncGlvIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBv
d2VyX291dCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvcyA9ICZsdDtB
U1BFRURfR1BJTyhBQSwgNykgR1BJT19BQ1RJVkVfTE9XJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoG91dHB1dC1sb3c7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtncGlvIHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAvKiBFbmFibGUgR1BJT0UwIGFuZCBHUElPRTIgcGFzcy10aHJvdWdoIGJ5IGRlZmF1bHQgKi88
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtwYXNzLXRocm91Z2gm
cXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtwaW5jdHJs
X2dwaWUwX2RlZmF1bHQ8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZhbXA7cGluY3RybF9ncGllMl9kZWZhdWx0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oGdwaW8tbGluZS1uYW1lcyA9PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKkEwLUE3Ki/CoCDCoCDC
oCDCoCZxdW90OyZxdW90OywmcXVvdDtNQUMyTElOSyZxdW90OywmcXVvdDtCTUNfUkVTRVRfQ1BM
RCZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7Qk1DX1NDTDkmcXVvdDssJnF1b3Q7JnF1b3Q7LCZx
dW90O01BQzJNRENfUiZxdW90OywmcXVvdDsmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAv
KkIwLUI3Ki/CoCDCoCDCoCDCoCZxdW90O0JNQ19JTklUX09LJnF1b3Q7LCZxdW90O0ZNX1NLVV9J
RDImcXVvdDssJnF1b3Q7Rk1fU1BEX0REUkNQVV9MVkxTSEZUX0RJU19SX04mcXVvdDssPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVv
dDtGTV9DUFVfTVNNSV9DQVRFUlJfTFZUM19CTUNfTiZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7
Rk1fQ1BVMF9QUk9DSE9UX0xWVDNfTiZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O0ZNX0NQVV9NRU1fVEhFUk1UUklQ
X0xWVDNfTiZxdW90OywmcXVvdDtCSU9TX0xPQURfREVGQVVMVF9SX04mcXVvdDssPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAvKkMwLUM3Ki/CoCDCoCDCoCDCoCZxdW90OyZxdW90OywmcXVvdDsmcXVv
dDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZx
dW90OyZxdW90OywmcXVvdDsmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKkQwLUQ3Ki/C
oCDCoCDCoCDCoCZxdW90OyZxdW90OywmcXVvdDtCTUNfU0QyQ01EJnF1b3Q7LCZxdW90O0JNQ19T
RDJEQVQwJnF1b3Q7LCZxdW90O0JNQ19TRDJEQVQxJnF1b3Q7LCZxdW90O0JNQ19TRDJEQVQyJnF1
b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgJnF1b3Q7Qk1DX1NEMkRBVDMmcXVvdDssJnF1b3Q7Qk1DX1NEMkRFVCZxdW90OywmcXVv
dDtCTUNfU0QyV1BUJnF1b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgLypFMC1FNyovwqAgwqAg
wqAgwqAmcXVvdDtGTV9CT0FSRF9JRDAmcXVvdDssJnF1b3Q7Rk1fQk9BUkRfSUQxJnF1b3Q7LCZx
dW90O0ZNX0JPQVJEX0lEMiZxdW90OywmcXVvdDtGTV9CT0FSRF9JRDMmcXVvdDssPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtG
TV9CT0FSRF9JRDQmcXVvdDssJnF1b3Q7Rk1fQk9BUkRfSUQ1JnF1b3Q7LCZxdW90OyZxdW90Oywm
cXVvdDsmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKkYwLUY3Ki/CoCDCoCDCoCDCoCZx
dW90O1BTVTFfUFJFU0VOVF9OJnF1b3Q7LCZxdW90O1BTVTJfUFJFU0VOVF9OJnF1b3Q7LCZxdW90
O0ZBTl9GQVVMVF9MRURfTiZxdW90OywmcXVvdDtQU1VfRkFVTFRfTEVEX04mcXVvdDssPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVv
dDtCSU9TX0RFQlVHX01PREVfTiZxdW90OywmcXVvdDtGUF9MQ0RfUkVTRVQmcXVvdDssJnF1b3Q7
RkFOX1RZUEVfU0VMJnF1b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7UlNUX0dMQl9SU1RfV0FSTl9OJnF1b3Q7LDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgLypHMC1HNyovwqAgwqAgwqAgwqAmcXVvdDtJUlFfTFBUTTIxTF9B
TEVSVF9OJnF1b3Q7LCZxdW90O0lSUV9QTERfQUxFUlRfTiZxdW90OywmcXVvdDtBQ19GQUlMX04m
cXVvdDssJnF1b3Q7RlBfTENEX1BSRVNFTlRfQk1DJnF1b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7Qk1DX0pUQUdfVENL
X01VWF9TRUwmcXVvdDssJnF1b3Q7Qk1DX0JJT1NfUkVTRVJWRUQmcXVvdDssJnF1b3Q7U1lTX05N
SV9OJnF1b3Q7LCZxdW90O0JNQ19OTUlfTiZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoC8q
SDAtSDcqL8KgIMKgIMKgIMKgJnF1b3Q7SlRBR19CTUNfVERJJnF1b3Q7LCZxdW90O0pUQUdfQk1D
X1RETyZxdW90OywmcXVvdDtKVEFHX0JNQ19UQ0smcXVvdDssJnF1b3Q7SlRBR19CTUNfVE1TJnF1
b3Q7LCZxdW90O0ZNX0JPQVJEX0lENiZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O0ZNX1NLVV9JRDAmcXVvdDssJnF1
b3Q7SVJRX1NNTDFfUE1CVVNfQUxFUlRfTiZxdW90OywmcXVvdDtJUlFfU01MMF9BTEVSVF9NVVhf
TiZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoC8qSTAtSTcqL8KgIMKgIMKgIMKgJnF1b3Q7
Rk1fQ1BVX0VSUjBfTFZUM19CTUNfTiZxdW90OywmcXVvdDtGTV9DUFVfRVJSMV9MVlQzX0JNQ19O
JnF1b3Q7LCZxdW90O0ZNX0JNQ19QQ0hfU0NJX0xQQ19OJnF1b3Q7LDxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7Rk1fU1lTX1RI
Uk9UVExFX0xWQzMmcXVvdDssJnF1b3Q7U1BJMl9QQ0hfQ1MwX04mcXVvdDssJnF1b3Q7JnF1b3Q7
LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKkowLUo3
Ki/CoCDCoCDCoCDCoCZxdW90O0ZNX0NQVTBfU0tUT0NDX0xWVDNfTiZxdW90OywmcXVvdDtGTV9D
UFUxX1NLVE9DQ19MVlQzX04mcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90O1NZU0hPVF9GQVVMVF9M
RURfTiZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZxdW90O1ZHQV9IU1lOQyZxdW90OywmcXVvdDtWR0FfVlNZTkMmcXVvdDss
JnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoC8qSzAtSzcq
L8KgIMKgIMKgIMKgJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7
JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90
Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoC8qTDAtTDcqL8KgIMKgIMKgIMKgJnF1b3Q7JnF1b3Q7
LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVv
dDsmcXVvdDssJnF1b3Q7U1lTX1VBUlRfVFhEMSZxdW90OywmcXVvdDtTWVNfVUFSVF9SWEQxJnF1
b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgLypNMC1NNyovwqAgwqAgwqAgwqAmcXVvdDsmcXVv
dDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZx
dW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKg
IMKgLypOMC1ONyovwqAgwqAgwqAgwqAmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZx
dW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDss
JnF1b3Q7JnF1b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgLypPMC1PNyovwqAgwqAgwqAgwqAm
cXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7
JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgLypQMC1QNyovwqAgwqAgwqAgwqAmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7
LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVv
dDsmcXVvdDssJnF1b3Q7JnF1b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgLypRMC1RNyovwqAg
wqAgwqAgwqAmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVv
dDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDtGTV9QQ0hfQk1DX1RIRVJNVFJJUF9O
JnF1b3Q7LCZxdW90O0lOVFJVREVSX04mcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKlIw
LVI3Ki/CoCDCoCDCoCDCoCZxdW90O1NQSV9CTUNfQk9PVF9DUzFfUl9OJnF1b3Q7LCZxdW90O0ZN
X0NQVV9NRU1IT1RfTFZDM19OJnF1b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7REJQX0NQVV9QUkVRX04mcXVvdDssJnF1
b3Q7Rk1fQ1BVX0VSUjJfTFZUM19CTUNfTiZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O1JJU0VSX05DU0lfRU5fTiZx
dW90OywmcXVvdDsmcXVvdDssJnF1b3Q7TE9NX05DU0lfRU5fTiZxdW90OywmcXVvdDtPQ1BfTkNT
SV9FTl9OJnF1b3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgLypTMC1TNyovwqAgwqAgwqAgwqAm
cXVvdDtCTUNfWERQX1BSRFlfTiZxdW90OywmcXVvdDtTSU9fUE9XRVJfR09PRCZxdW90OywmcXVv
dDtCTUNfUFdSX0RFQlVHX1JfTiZxdW90OywmcXVvdDtCTUNfREVCVUdfRU5fUl9OJnF1b3Q7LCZx
dW90OyZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCZxdW90O0dQSU9TNV9CTUMmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90O0dQ
SU9TN19CTUMmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKlQwLVQ3Ki/CoCDCoCDCoCDC
oCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVv
dDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAvKlUwLVU3Ki/CoCDCoCDCoCDCoCZxdW90OyZxdW90OywmcXVvdDsmcXVv
dDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZx
dW90OyZxdW90OywmcXVvdDsmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKlYwLVY3Ki/C
oCDCoCDCoCDCoCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZx
dW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDss
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKlcwLVc3Ki/CoCDCoCDCoCDCoCZxdW90OyZxdW90Oywm
cXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7
JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAv
KlgwLVg3Ki/CoCDCoCDCoCDCoCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7
LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVv
dDsmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAvKlkwLVk3Ki/CoCDCoCDCoCDCoCZxdW90
OyZxdW90OywmcXVvdDtCTUNfREVUX1VJRF9OJnF1b3Q7LCZxdW90O0JNQ19KVEFHX1NFTCZxdW90
OywmcXVvdDtTSU9fT05DT05UUk9MJnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1
b3Q7JnF1b3Q7LCZxdW90OyZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoC8qWjAtWjcqL8Kg
IMKgIMKgIMKgJnF1b3Q7WERQX1BSRVNFTlRfTiZxdW90OywmcXVvdDtEQlBfU1lTUFdST0smcXVv
dDssJnF1b3Q7Qk1DX0pUQUdfU0VMJnF1b3Q7LCZxdW90O0ZNX1NNSV9BQ1RJVkVfTiZxdW90Oywm
cXVvdDsmcXVvdDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmcXVvdDtHUElPWjUmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90
Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoC8qQUEwLUFBNyovwqAgwqAgwqAmcXVvdDtGUF9CTUNf
U1lTTEVEX04mcXVvdDssJnF1b3Q7UFNfUFdST0smcXVvdDssJnF1b3Q7UlNUX1BMVFJTVF9CTUNf
TiZxdW90OywmcXVvdDtIREFfU0RPX0JNQyZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O0ZNX1NMUFM0X1JfTiZxdW90
OywmcXVvdDsmcXVvdDssJnF1b3Q7UE9XRVJfQlVUVE9OJnF1b3Q7LCZxdW90O1BPV0VSX09VVCZx
dW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoC8qQUIwLUFCNyovwqAgwqAgwqAmcXVvdDtSRVNF
VF9PVVQmcXVvdDssJnF1b3Q7UkVTRVRfQlVUVE9OJnF1b3Q7LCZxdW90O0JJT1NfUkVGTEFTSCZx
dW90OywmcXVvdDtQT1NUX0NPTVBMRVRFJnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDss
JnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoC8qQUMwLUFD
NyovwqAgwqAgwqAmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsm
cXVvdDssJnF1b3Q7JnF1b3Q7LCZxdW90OyZxdW90OywmcXVvdDsmcXVvdDssJnF1b3Q7JnF1b3Q7
Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtpMmMwIHs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoC8qIEZQX0xDRCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVz
ID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsg
KyZhbXA7aTJjMSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1
b3Q7Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgZWVwcm9tQDUwIHs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthdG1lbCwyNGMy
NTYmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg1
MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O2Zy
dSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICsmYW1wO2kyYzIgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0g
JnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHRtcDEx
MkA0OCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7dGksdG1wMTEyJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
ID0gJmx0OzB4NDgmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwg
PSAmcXVvdDtpbmxldCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB0bXAxMTJANDkgezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3RpLHRtcDExMiZxdW90Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQ5Jmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7b3V0bGV0JnF1b3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBjYTk1
NDhANzAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZx
dW90O254cCxwY2E5NTQ4JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4NzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICt9
Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7aTJjMyB7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgcGNhOTU0OEA3MCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21w
YXRpYmxlID0gJnF1b3Q7bnhwLHBjYTk1NDgmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg3MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxi
cj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgcGNhOTU0OEA3MSB7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7bnhwLHBjYTk1NDgmcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg3MSZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKg
IMKgcGNhOTU0OEA3MiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRp
YmxlID0gJnF1b3Q7bnhwLHBjYTk1NDgmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWcgPSAmbHQ7MHg3MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtpMmM0IHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoC8qIElQTUIgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90
O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2ky
YzUgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBjYTk1NDhANzAgezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O254cCxwY2E5NTQ4JnF1b3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NzAmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZn
dDsgKyZhbXA7aTJjNiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5
JnF1b3Q7Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgcGNhOTU0OEA3MCB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7bnhwLHBj
YTk1NDgmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7
MHg3MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK307PGJyPg0KJmd0
OyArPGJyPg0KJmd0OyArJmFtcDtpMmM3IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHN0YXR1cyA9
ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBhZG0x
Mjc4QDMzIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDthZGksYWRtMTI5MyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZyA9ICZsdDsweDMzJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBhZG0xMjc4QDMyIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthZGksYWRtMTI5MyZxdW90Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDMyJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBhZG0xMjc4
QDIwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVv
dDthZGksYWRtMTI5MyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDIwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArfTs8
YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2kyYzggezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
c3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoHBjYTA6IHBjYTk1NTVAMjMgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O254cCxwY2E5NTU1JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MjMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZn
dDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0AwIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDswJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENB
OTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9AMSB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MSZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0g
Jmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlv
QDIgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0g
Jmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZ3Bpb0AzIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZyA9ICZsdDszJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGdwaW9ANCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWcgPSAmbHQ7NCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBncGlvQDUgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzUmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0A2IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDs2Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8m
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBwY2ExOiBwY2E5NTU1
QDIyIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVv
dDtueHAscGNhOTU1NSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDIyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRy
ZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
I3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncGlvLWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9AMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDEgezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVf
R1BJTyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsg
Kzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0AyIHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsyJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1
WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9AMyB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MyZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0
O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDQg
ezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0
OzQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlw
ZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Z3Bpb0A1IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDs1Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGdwaW9ANiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7NiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBncGlvQDcgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzcmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgfTs8
YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBjYTI6IHBjYTk1NTVAMjAgezxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O254cCxwY2E5
NTU1JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
MjAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMg
PSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxs
cyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNn
cGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZ3Bpb0AwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9AMSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDIgezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJ
TyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0AzIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDszJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9U
WVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9ANCB7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7NCZndDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0O1BD
QTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDUgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzUm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9
ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bp
b0A2IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDs2Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdwaW9ANyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7NyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsg
Kzxicj4NCiZndDsgK8KgIMKgIMKgIMKgcGNhMzogcGNhOTU1NUAyMSB7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7bnhwLHBjYTk1NTUmcXVvdDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgyMSZndDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAm
Z3Q7Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1j
b250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMg
PSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBncGlvQDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3Bpb0AxIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdwaW9AMiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDMgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0A0IHs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDs0Jmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBF
X0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9ANSB7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7NSZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1
NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDYgezxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzYmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZs
dDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0A3
IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDs3Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5
cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArfTs8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2kyYzkgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgLyogY3Bs
ZCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+
DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7aTJjMTAgezxicj4NCiZndDsg
K8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoHBjYTQ6IHBjYTk1NTVAMjQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O254cCxwY2E5NTU1JnF1b3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MjQmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0Ozs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxl
cjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzIm
Z3Q7Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0Aw
IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5
cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdwaW9AMSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBncGlvQDIgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZ3Bpb0AzIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZyA9ICZsdDszJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9ANCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7NCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDUgezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzUmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVf
R1BJTyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsg
Kzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0A2IHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDs2Jmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1
WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9ANyB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7NyZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0
O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgcGNhNTogcGNhOTU1NUAyNSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7bnhwLHBjYTk1NTUmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgyNSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgKzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0K
Jmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDAgezxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzAmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQ
Q0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpb0AxIHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsx
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHR5cGUg
PSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdw
aW9AMiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcg
PSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBncGlvQDMgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcmVnID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJTyZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZ3Bpb0A0IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDs0Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHR5cGUgPSAmbHQ7UENBOTU1WF9UWVBFX0dQSU8mZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGdwaW9ANSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7NSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJmx0O1BDQTk1NVhfVFlQRV9HUElPJmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvQDYgezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzYmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZsdDtQQ0E5NTVYX1RZUEVfR1BJ
TyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7aTJj
MTEgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+
DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBvd2VyLXN1cHBseUA1OCB7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7aW5zcHVyLGlwc3Bz
MSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDU4
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqBwb3dlci1zdXBwbHlANTkgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY29tcGF0aWJsZSA9ICZxdW90O2luc3B1cixpcHNwczEmcXVvdDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg1OSZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqB9Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtpMmMxMiB7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZn
dDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtpMmMxMyB7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0
OyArPGJyPg0KJmd0OyArJmFtcDtscGNfY3RybCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0
dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgbWVtb3J5LXJlZ2lv
biA9ICZsdDsmYW1wO2ZsYXNoX21lbW9yeSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBmbGFz
aCA9ICZsdDsmYW1wO3NwaTEmZ3Q7Ozxicj4NCjxicj4NCkFzIEkgZGVzY3JpYmVkIGJlZm9yZSwg
bW9zdCBvZiB0aGUgdGltZSB0aGlzIGRyaXZlciBpcyBvbmx5IHVzZWQgYnk8YnI+DQp0aGUgaGlv
bWFwIGRhZW1vbiBvbiBQb3dlciBzeXN0ZW1zLjxicj4NCjxicj4NCiZndDsgK307PGJyPg0KJmd0
OyArPGJyPg0KJmd0OyArJmFtcDtnZnggezxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0g
JnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoG1lbW9yeS1yZWdpb24gPSAm
bHQ7JmFtcDtnZnhfbWVtb3J5Jmd0Ozs8YnI+DQomZ3Q7ICt9Ozxicj4NCjxicj4NClRoaXMgaXMg
dGhlIEJNQyBkaXNwbGF5IGRldmljZS4gWW91IG9ubHkgbmVlZCB0byBlbmFibGUgaXQgaWYgeW91
IGFyZTxicj4NCnJ1bm5pbmcgY29kZSBvbiB0aGUgQk1DIHRvPGJyPg0KPGJyPg0KSXQgaXMgbm90
IHJlbGF0ZWQgdG8gdXNpbmcgdGhlIEJNQyBoYXMgYSBob3N0IFBDSWUgZGlzcGxheSBkZXZpY2Uu
PGJyPg0KPGJyPjwvYmxvY2txdW90ZT48ZGl2PldpbGwgbW9kaWZ5IHRvby4gPGJyPjwvZGl2Pjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6
MWV4Ij4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7cGluY3RybCB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqBhc3BlZWQsZXh0ZXJuYWwtbm9kZXMgPSAmbHQ7JmFtcDtnZnggJmFtcDtsaGMmZ3Q7Ozxi
cj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtwd21fdGFjaG8gezxicj4N
CiZndDsgK8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgcGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9wd20wX2RlZmF1bHQgJmFt
cDtwaW5jdHJsX3B3bTFfZGVmYXVsdDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
JmFtcDtwaW5jdHJsX3B3bTJfZGVmYXVsdCAmYW1wO3BpbmN0cmxfcHdtM19kZWZhdWx0PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmYW1wO3BpbmN0cmxfcHdtNF9kZWZhdWx0ICZh
bXA7cGluY3RybF9wd201X2RlZmF1bHQ8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZhbXA7cGluY3RybF9wd202X2RlZmF1bHQgJmFtcDtwaW5jdHJsX3B3bTdfZGVmYXVsdCZndDs7
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBmYW5AMCB7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRhY2gtY2ggPSAvYml0cy8gOCAmbHQ7MHgwMCAw
eDAxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqBmYW5AMSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcg
PSAmbHQ7MHgwMSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQs
ZmFuLXRhY2gtY2ggPSAvYml0cy8gOCAmbHQ7MHgwMiAweDAzJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBmYW5AMiB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMiZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRhY2gtY2ggPSAvYml0cy8gOCAm
bHQ7MHgwNCAweDA1Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqBmYW5AMyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7MHgwMyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBhc3BlZWQsZmFuLXRhY2gtY2ggPSAvYml0cy8gOCAmbHQ7MHgwNiAweDA3Jmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBmYW5A
NCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwNCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRhY2gtY2ggPSAv
Yml0cy8gOCAmbHQ7MHgwOCAweDA5Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBmYW5ANSB7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwNSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRhY2gtY2ggPSAvYml0cy8gOCAmbHQ7MHgwYSAweDBiJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAg
wqAgwqBmYW5ANiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7
MHgwNiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRh
Y2gtY2ggPSAvYml0cy8gOCAmbHQ7MHgwYyAweDBkJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqBmYW5ANyB7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwNyZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBhc3BlZWQsZmFuLXRhY2gtY2ggPSAvYml0cy8gOCAmbHQ7MHgw
ZSAweDBmJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArfTs8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2tjczMgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgc3RhdHVz
ID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoGtjc19hZGRyID0gJmx0
OzB4Y2EyJmd0Ozs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZhbXA7a2Nz
NCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKga2NzX2FkZHIgPSAmbHQ7MHhjYTQmZ3Q7Ozxicj4NCiZndDsgK307
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDthZGMgezxicj4NCiZndDsgK8KgIMKgIMKgIMKg
c3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoHBpbmN0cmwt
bmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgcGluY3Ry
bC0wID0gJmx0OyZhbXA7cGluY3RybF9hZGMwX2RlZmF1bHQgJmFtcDtwaW5jdHJsX2FkYzFfZGVm
YXVsdDxicj4NCiZndDsgK8KgIMKgIMKgIMKgICZhbXA7cGluY3RybF9hZGMyX2RlZmF1bHQgJmFt
cDtwaW5jdHJsX2FkYzNfZGVmYXVsdCAmYW1wO3BpbmN0cmxfYWRjNF9kZWZhdWx0PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgJmFtcDtwaW5jdHJsX2FkYzVfZGVmYXVsdCAmYW1wO3BpbmN0cmxfYWRj
Nl9kZWZhdWx0ICZhbXA7cGluY3RybF9hZGM3X2RlZmF1bHQ8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCAmYW1wO3BpbmN0cmxfYWRjOF9kZWZhdWx0ICZhbXA7cGluY3RybF9hZGM5X2RlZmF1bHQgJmFt
cDtwaW5jdHJsX2FkYzEwX2RlZmF1bHQ8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCAmYW1wO3BpbmN0
cmxfYWRjMTFfZGVmYXVsdCAmYW1wO3BpbmN0cmxfYWRjMTJfZGVmYXVsdCAmYW1wO3BpbmN0cmxf
YWRjMTNfZGVmYXVsdDxicj4NCiZndDsgK8KgIMKgIMKgIMKgICZhbXA7cGluY3RybF9hZGMxNF9k
ZWZhdWx0ICZhbXA7cGluY3RybF9hZGMxNV9kZWZhdWx0Jmd0Ozs8YnI+DQomZ3Q7ICt9Ozxicj4N
CiZndDsgKzxicj4NCiZndDsgKyZhbXA7dmh1YiB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0
dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArJmFtcDt2aWRlbyB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5
JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgbWVtb3J5LXJlZ2lvbiA9ICZsdDsmYW1wO3Zp
ZGVvX2VuZ2luZV9tZW1vcnkmZ3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyArPGJyPg0KJmd0
OyArJmFtcDt2dWFydCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5
JnF1b3Q7Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyAtLTxicj4NCiZndDsgMi4xNy4xPGJyPg0K
Jmd0Ozxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4NCg==
--0000000000007364dc05c31ee5cd--
