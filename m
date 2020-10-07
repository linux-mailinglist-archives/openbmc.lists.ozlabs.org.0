Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D11462858C1
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 08:39:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5l6l0YW0zDqNC
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 17:39:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=d9N+ekY0; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5l5x0dflzDqDL
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 17:38:28 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id y198so1391298qka.0
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1hCQz8/PqPBwoil8ElcogXp1MMosWvSFQQJKtDz4JIo=;
 b=d9N+ekY0PYDm9Zbz9Kb45Hd6PFW5trrxmdDlD8nYgw4nmIFNOIJf8ILh9pDTOtE1rl
 J6nlddWUd+1HtQsmdN9IY49R3FUABWhMsJpbLdKBp0zGkUHoeR5avlBMiHYGAzuaRvrS
 8gNi2peMio6ACxnlLfPBDSqxOpKsPVGXuEJl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1hCQz8/PqPBwoil8ElcogXp1MMosWvSFQQJKtDz4JIo=;
 b=Ve9YmazVdbDGXD/AZ7IsJZC70HkaUmj97PIuofHnll7qUExYTypEanOGuDWn882bhz
 iCSu7sZpGI66ejQCr44w2fhdx+lm5wjWOAR0mlU5WtnuuJ/diSdzaskNlgwSrwusRtKC
 me596g2ElYZ/vQV9dCZcZQIn4zk9AWVXbqTcn8G1Ksch3MHPQELB8u2ZFivr1dr5PNTT
 iNkuXaDkPDnI3OOlRERrnST19j/7a0FQRTCsL/DYQiEX5STwZsY1waN30zYFnQt4JoYk
 X7g06d8rpu6si+VaiF19pIkb6qfL1Ej9WmUWlHw51Mc46sUCOCi5Phlvm1/oIrtd5gGi
 hdCw==
X-Gm-Message-State: AOAM5314kNICWF0bDSF3e2F0sE5nfu+A0EgiVdpticHuJulSfvyeQDpr
 RRlk2TEhoLtqpe49qw6zfPl7HCgNJ2dLa0Z1t6c=
X-Google-Smtp-Source: ABdhPJxRCCGXf0wVaTKzHj3xB8XvBvOVdj6qdgk+5R+U537igrtvKLtUqYyjaiZItPpOWtn08uFLlg6RtRXT0sgeKBQ=
X-Received: by 2002:a37:46c4:: with SMTP id t187mr1334996qka.465.1602052703729; 
 Tue, 06 Oct 2020 23:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200929063955.1206-1-wangzhiqiang.bj@bytedance.com>
 <20200929063955.1206-2-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20200929063955.1206-2-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 06:38:11 +0000
Message-ID: <CACPK8XdVSRQU92+hqYyVRe2QTgnKSFgn2QVf7P4VX4jyKvyYFw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3 2/2] ARM: dts: aspeed: Add Bytedance
 g220a BMC machine
To: John Wang <wangzhiqiang.bj@bytedance.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, xuxiaohan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 29 Sep 2020 at 06:40, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> From: Lotus Xu <xuxiaohan@bytedance.com>
>
> The g220a is a server platform with an ASPEED AST2500 BMC.
>
> Signed-off-by: Lotus Xu <xuxiaohan@bytedance.com>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks, I've applied this to dev-5.8.

Cheers,

Joel

>
> ---
> v2:
>   - Add copyright notice
>   - Remove GFX device node
>   - Change the module to system name
> v3:
>   - Add spi device node
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 931 ++++++++++++++++++
>  2 files changed, 932 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 56fd8c8a2ba9..7e4d3600e16d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1351,6 +1351,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-amd-ethanolx.dtb \
>         aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
> +       aspeed-bmc-bytedance-g220a.dtb \
>         aspeed-bmc-facebook-cmm.dtb \
>         aspeed-bmc-facebook-minipack.dtb \
>         aspeed-bmc-facebook-tiogapass.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> new file mode 100644
> index 000000000000..2ae2684c115c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> @@ -0,0 +1,931 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2020 Bytedance.
> + */
> +
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model = "Bytedance G220A BMC";
> +       compatible = "bytedance,g220a-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial4 = &uart5;
> +               i2c14 = &channel_3_0;
> +               i2c15 = &channel_3_1;
> +               i2c16 = &channel_3_2;
> +               i2c17 = &channel_3_3;
> +               i2c18 = &channel_6_0;
> +               i2c19 = &channel_6_1;
> +               i2c20 = &channel_6_2;
> +               i2c21 = &channel_6_3;
> +               i2c22 = &channel_6_4;
> +               i2c23 = &channel_6_5;
> +               i2c24 = &channel_6_6;
> +               i2c25 = &channel_6_7;
> +               i2c26 = &channel_6_8;
> +               i2c27 = &channel_6_9;
> +               i2c28 = &channel_6_10;
> +               i2c29 = &channel_6_11;
> +               i2c30 = &channel_6_12;
> +               i2c31 = &channel_6_13;
> +               i2c32 = &channel_6_14;
> +               i2c33 = &channel_6_15;
> +               i2c34 = &channel_6_16;
> +               i2c35 = &channel_6_17;
> +               i2c36 = &channel_6_18;
> +               i2c37 = &channel_6_19;
> +               i2c38 = &channel_6_20;
> +               i2c39 = &channel_6_21;
> +               i2c40 = &channel_6_22;
> +               i2c41 = &channel_6_23;
> +               i2c42 = &channel_6_24;
> +               i2c43 = &channel_6_25;
> +               i2c44 = &channel_10_0;
> +               i2c45 = &channel_10_1;
> +               i2c46 = &channel_10_2;
> +               i2c47 = &channel_10_3;
> +               i2c48 = &channel_10_4;
> +               i2c49 = &channel_10_5;
> +               i2c50 = &channel_10_6;
> +               i2c51 = &channel_10_7;
> +       };
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
> +               vga_memory: framebuffer@bc000000 {
> +                       no-map;
> +                       reg = <0xbc000000 0x04000000>; /* 64M */
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
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               bmc_alive {
> +                       label = "bmc_alive";
> +                       gpios = <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "timer";
> +                       led-pattern = <1000 1000>;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +               burn-in-signal {
> +                       label = "burn-in";
> +                       gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(R, 5)>;
> +               };
> +       };
> +
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               poll-interval = <1000>;
> +
> +               rear-riser1-presence {
> +                       label = "rear-riser1-presence";
> +                       gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
> +                       linux,code = <1>;
> +               };
> +
> +               alrt-pvddq-cpu0 {
> +                       label = "alrt-pvddq-cpu0";
> +                       gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
> +                       linux,code = <2>;
> +               };
> +
> +               rear-riser0-presence {
> +                       label = "rear-riser0-presence";
> +                       gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
> +                       linux,code = <3>;
> +               };
> +
> +               fault-pvddq-cpu0 {
> +                       label = "fault-pvddq-cpu0";
> +                       gpios = <&pca0 10 GPIO_ACTIVE_LOW>;
> +                       linux,code = <4>;
> +               };
> +
> +               alrt-pvddq-cpu1 {
> +                       label = "alrt-pvddq-cpu1";
> +                       gpios = <&pca0 11 GPIO_ACTIVE_LOW>;
> +                       linux,code = <5>;
> +               };
> +
> +               fault-pvddq-cpu1 {
> +                       label = "alrt-pvddq-cpu1";
> +                       gpios = <&pca0 12 GPIO_ACTIVE_LOW>;
> +                       linux,code = <6>;
> +               };
> +
> +               fault-pvccin-cpu1 {
> +                       label = "fault-pvccin-cpuq";
> +                       gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
> +                       linux,code = <7>;
> +               };
> +
> +               bmc-rom0-wp {
> +                       label = "bmc-rom0-wp";
> +                       gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
> +                       linux,code = <8>;
> +               };
> +
> +               bmc-rom1-wp {
> +                       label = "bmc-rom1-wp";
> +                       gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
> +                       linux,code = <9>;
> +               };
> +
> +               fan0-presence {
> +                       label = "fan0-presence";
> +                       gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
> +                       linux,code = <10>;
> +               };
> +
> +               fan1-presence {
> +                       label = "fan1-presence";
> +                       gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
> +                       linux,code = <11>;
> +               };
> +
> +               fan2-presence {
> +                       label = "fan2-presence";
> +                       gpios = <&pca1 4 GPIO_ACTIVE_LOW>;
> +                       linux,code = <12>;
> +               };
> +
> +               fan3-presence {
> +                       label = "fan3-presence";
> +                       gpios = <&pca1 5 GPIO_ACTIVE_LOW>;
> +                       linux,code = <13>;
> +               };
> +
> +               fan4-presence {
> +                       label = "fan4-presence";
> +                       gpios = <&pca1 6 GPIO_ACTIVE_LOW>;
> +                       linux,code = <14>;
> +               };
> +
> +               fan5-presence {
> +                       label = "fan5-presence";
> +                       gpios = <&pca1 7 GPIO_ACTIVE_LOW>;
> +                       linux,code = <15>;
> +               };
> +
> +               front-bp1-presence {
> +                       label = "front-bp1-presence";
> +                       gpios = <&pca1 8 GPIO_ACTIVE_LOW>;
> +                       linux,code = <16>;
> +               };
> +
> +               rear-bp-presence {
> +                       label = "rear-bp-presence";
> +                       gpios = <&pca1 9 GPIO_ACTIVE_LOW>;
> +                       linux,code = <17>;
> +               };
> +
> +               fault-pvccin-cpu0 {
> +                       label = "fault-pvccin-cpu0";
> +                       gpios = <&pca1 10 GPIO_ACTIVE_LOW>;
> +                       linux,code = <18>;
> +               };
> +
> +               alrt-p1v05-pvcc {
> +                       label = "alrt-p1v05-pvcc1";
> +                       gpios = <&pca1 11 GPIO_ACTIVE_LOW>;
> +                       linux,code = <19>;
> +               };
> +
> +               fault-p1v05-pvccio {
> +                       label = "alrt-p1v05-pvcc1";
> +                       gpios = <&pca1 12 GPIO_ACTIVE_LOW>;
> +                       linux,code = <20>;
> +               };
> +
> +               alrt-p1v8-pvccio {
> +                       label = "alrt-p1v8-pvccio";
> +                       gpios = <&pca1 13 GPIO_ACTIVE_LOW>;
> +                       linux,code = <21>;
> +               };
> +
> +               fault-p1v8-pvccio {
> +                       label = "fault-p1v8-pvccio";
> +                       gpios = <&pca1 14 GPIO_ACTIVE_LOW>;
> +                       linux,code = <22>;
> +               };
> +
> +               front-bp0-presence {
> +                       label = "front-bp0-presence";
> +                       gpios = <&pca1 15 GPIO_ACTIVE_LOW>;
> +                       linux,code = <23>;
> +               };
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
> +#include "openbmc-flash-layout-64.dtsi"
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
> +&peci0{
> +       status = "okay";
> +};
> +
> +&adc {
> +       status = "okay";
> +};
> +
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "SMRST_OCP_N","MAC2_LINK","BMC_CPLD_SMB_RST_R_N","BMC_CPLD_GPIO0",
> +                       "","","","",
> +       /*B0-B7*/       "BMC_INIT_R_OK","FM_BOARD_REV_ID2","FM_PROJECT_ID7","FAULT_P12V_STBY_N",
> +                       "","CPU0_PROCHOT_LVT3_N","","BIOS_LOAD_DEFAULT_R_N",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "","","","","","","","",
> +       /*E0-E7*/       "FM_PROJECT_ID0","FM_PROJECT_ID1","FM_PROJECT_ID2","FM_PROJECT_ID3",
> +                       "FM_PROJECT_ID4","FM_PROJECT_ID5","","",
> +       /*F0-F7*/       "PSU0_PRSNT_N","PSU1_PRSNT_N","","FAULT_P12V_NVME_N",
> +                       "BIOS_DEBUG_MODE_R_N","DISABLE_CPU_DDR_R_SPD","COOLING_STRATEGY",
> +                       "PCH_GLB_RST_N",
> +       /*G0-G7*/       "P12V_PMBUS_ALERT_N","CPLD_ALERT_N","BMC_RELOAD_N",
> +                       "P12V_PVDDQ_PMBUS_ALERT_N","BMC_JTAG_TCK_MUX_R_SEL","","NMI_OUT",
> +                       "NMI_BUTTON",
> +       /*H0-H7*/       "BMC_CPLD_JTAG_TDI","BMC_CPLD_JTAG_TDO","BMC_CPLD_JTAG_TCK",
> +                       "BMC_CPLD_JTAG_TMS","FM_PROJECT_ID6","FM_BOARD_REV_ID0",
> +                       "PCA9546_U70_RST_N","IRQ_SML0_ALERT_N",
> +       /*I0-I7*/       "FAULT_FRONT_RISER_P12V_N","FAULT_OCP_P12V_N","FM_BMC_PCH_SCI_R_N",
> +                       "","","","","",
> +       /*J0-J7*/       "FM_CPU0_SKTOCC_N","FM_CPU1_SKTOCC_N","FM_CPU1_DISABLE_COD_N",
> +                       "","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "P12V_FAULT_N","PWRGD_P12V_PCIE_RISER","","LEAKAGE_DETECT_INPUT_N",
> +                       "","IRQ_SML1_PMBUS_ALERT_N","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","","","FM_PCH_THERMTRIP_N","INTRUDER_N",
> +       /*R0-R7*/       "","PVCCIN_CPU1_SMBALERT_N","BMC_PREQ_R_N","FAULT_P12V_PCIE_RISER_N",
> +                       "ALT_P12V_PCIE_RISER_N","BURN_BOARD_N","PVCCIN_CPU0_SMBALERT_N","",
> +       /*S0-S7*/       "BMC_PRDY_N","SIO_POWER_GOOD","FM_BMC_PWR_DEBUG_R_N",
> +                       "FM_BMC_XDP_DEBUG_EN","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","PWRGD_PSU0_PWROK","CPU1_PROCHOT_LVT3_N","IRQ_BMC_PCH_SMI_LPC_N",
> +                       "","","","",
> +       /*Z0-Z7*/       "XDP_PRSNT_N","BMC_XDP_SYS_PWROK","BMC_XDP_JTAG_SEL",
> +                       "PCH_BMC_SMI_ACTIVE_R_N","","","","",
> +       /*AA0-AA7*/     "PWRGD_P12V_STBY_OCP","PS_PWROK","RST_PLTRST_BMC_R_N","HDA_SDO_R",
> +                       "FM_SLPS4_R_N","PWRGD_PSU1_PWROK","POWER_BUTTON","POWER_OUT",
> +       /*AB0-AB7*/     "","RESET_OUT","SPI_BIOS_MODE_SELECT","POST_COMPLETE","","","","",
> +       /*AC0-AC7*/     "","","","","","","","CPLD_PLTRST_B_N";
> +};
> +
> +&kcs3 {
> +       kcs_addr = <0xCA2>;
> +       status = "okay";
> +};
> +
> +&kcs4 {
> +       kcs_addr = <0xCA4>;
> +       status = "okay";
> +};
> +
> +&lpc_snoop {
> +       snoop-ports = <0x80>;
> +       status = "okay";
> +};
> +
> +&uart1 {
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
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd2_default
> +                       &pinctrl_rxd2_default
> +                       &pinctrl_nrts2_default
> +                       &pinctrl_ndtr2_default
> +                       &pinctrl_ndsr2_default
> +                       &pinctrl_ncts2_default
> +                       &pinctrl_ndcd2_default
> +                       &pinctrl_nri2_default>;
> +};
> +
> +&uart3 {
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
> +&mac0 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +                <&syscon ASPEED_CLK_MAC1RCLK>;
> +       clock-names = "MACCLK", "RCLK";
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
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               channel_3_0: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               channel_3_1: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               channel_3_2: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               channel_3_3: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +       };
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +       i2c-switch@72 {
> +               compatible = "nxp,pca9548";
> +               reg = <0x72>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               channel_6_0: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               channel_6_1: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               channel_6_2: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               channel_6_3: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +               channel_6_4: i2c@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +               };
> +
> +               channel_6_5: i2c@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +               };
> +
> +               channel_6_6: i2c@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +               };
> +
> +               channel_6_7: i2c@7 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +               };
> +       };
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               channel_6_8: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +                       i2c-switch@71 {
> +                               compatible = "nxp,pca9546";
> +                               reg = <0x71>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               channel_6_12: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +
> +                               };
> +
> +                               channel_6_13: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               channel_6_14: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               channel_6_15: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +                       };
> +                };
> +
> +               channel_6_9: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +                       i2c-switch@71 {
> +                               compatible = "nxp,pca9546";
> +                               reg = <0x71>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               channel_6_16: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +
> +                               };
> +
> +                               channel_6_17: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               channel_6_18: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               channel_6_19: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +                       };
> +                };
> +
> +               channel_6_10: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +                       i2c-switch@71 {
> +                               compatible = "nxp,pca9546";
> +                               reg = <0x71>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               channel_6_20: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               channel_6_21: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               channel_6_22: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               channel_6_23: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +                       };
> +                };
> +
> +               channel_6_11: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +                       i2c-switch@71 {
> +                               compatible = "nxp,pca9546";
> +                               reg = <0x71>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               channel_6_24: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               channel_6_25: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +                        };
> +               };
> +       };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +       pca0:pca9555@24 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x24>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
> +       pca1:pca9555@25 {
> +               compatible = "nxp,pca9555";
> +               reg = <0x25>;
> +
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
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x70>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               channel_10_0: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               channel_10_1: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               channel_10_2: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               channel_10_3: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +       };
> +
> +       i2c-switch@71 {
> +               compatible = "nxp,pca9546";
> +               reg = <0x71>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               channel_10_4: i2c@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +               };
> +
> +               channel_10_5: i2c@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +               };
> +
> +               channel_10_6: i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +               };
> +
> +               channel_10_7: i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +               };
> +       };
> +};
> +
> +&i2c11 {
> +       status = "okay";
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
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +                        &pinctrl_pwm2_default &pinctrl_pwm3_default
> +                        &pinctrl_pwm4_default &pinctrl_pwm5_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +       };
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +       };
> +       fan@2 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
> +       };
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
> +       };
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x08 0x09>;
> +       };
> +       fan@5 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0a 0x0b>;
> +       };
> +};
> +
> +&gpio {
> +       pin_gpio_i3 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_LOW>;
> +               output-low;
> +               line-name = "NCSI_BMC_R_SEL";
> +       };
> +
> +       pin_gpio_b6 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(B, 6) GPIO_ACTIVE_LOW>;
> +               output-low;
> +               line-name = "EN_NCSI_SWITCH_N";
> +       };
> +};
> +
> +&video {
> +       status = "okay";
> +       memory-region = <&video_engine_memory>;
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> --
> 2.25.1
>
