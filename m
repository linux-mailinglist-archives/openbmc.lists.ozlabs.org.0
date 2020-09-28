Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D10B527A806
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 09:01:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0D2g2R5gzDqPC
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 17:01:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BBMQTHlb; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0D1t5wZ6zDqD8
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 17:00:47 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id i26so6919287ejb.12
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 00:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ktx3ivhM3QLSKDpga6oGihIhAxEWwyAJnBXgVVknQU=;
 b=BBMQTHlbeOscLX/9mvgijttdt5nCP//Jps/F9BXecHS8toGHCX2jsFDxIv1sSb+G8U
 8OPiu4Hv93vZEt6KTrgxO2UYeGADgMI+MPTkDd+FTFaWXqrJXQSf6pF+Pk0Pw478fTjT
 q6syjI9w5732SEfwCTSVxRmVLenvUf9ukJc2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ktx3ivhM3QLSKDpga6oGihIhAxEWwyAJnBXgVVknQU=;
 b=QNmBTtbTMEyEDJVEkUUhY7Hz/FP4F1JcAamsg/8/AiT1L4uG4MKwQyKPZdrn+QEHo/
 38Yw584MLklLhZ6Nt4sHDCfqhAITkhoiizqwhPOiGRMlSJLL7xMid+eiZHCmTYXX48fV
 G8sX5hLxa0sEKpCUtHvOiwfx+/T2YwMDawHD5/foVllxuVvgG8RauO/U+Vq9YGo2QNVI
 yeql6gow6xV3rj8pHoe11k8ygmchTRRHtqzpADVKZe08NpiOQlDCM3BiwoV0Mgo0MJCq
 Vfe9x0ZNPfbXlYWXTN1y9qckTAEkC3YXGb9m3lCqnN8ZR+GTL6yCkyvryqXwSqUnJQh5
 SyYw==
X-Gm-Message-State: AOAM532mfM0BiW/fvaNLbOO/Qt8tM2e6H6RU7Y5CKBlF/mcmVLFPLVXv
 dhSCXwxSS0SQQJkgiYeNZrOuajD4k7iFq0VyOTo=
X-Google-Smtp-Source: ABdhPJwl+k1Qoi0cC4GES6ZSS5j96S7A/CKKYXlZBa5w0HsvFIg+J/SejVTaJMZBMr98nvPRpFdmVCDhnfvRGvbPlaI=
X-Received: by 2002:a17:906:b352:: with SMTP id
 cd18mr264225ejb.229.1601276444758; 
 Mon, 28 Sep 2020 00:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200928064303.1961-1-wangzhiqiang.bj@bytedance.com>
 <20200928064303.1961-3-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20200928064303.1961-3-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Sep 2020 07:00:32 +0000
Message-ID: <CACPK8XeC1vjmvhQ41BccuTfHkX5S5Oe+bg5R30gKueGQMSOoFQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 2/2] ARM: dts: aspeed: Add Bytedance g220a
 BMC machine
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

On Mon, 28 Sep 2020 at 06:43, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> From: Lotus Xu <xuxiaohan@bytedance.com>
>
> The g220a is a server platform with an ASPEED AST2500 BMC.
>
> Signed-off-by: Lotus Xu <xuxiaohan@bytedance.com>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 926 ++++++++++++++++++
>  2 files changed, 927 insertions(+)
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
> index 000000000000..fe0437256ac8
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> @@ -0,0 +1,926 @@
> +/dts-v1/;

Copyright holder and licence should go here.

> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +       model = "AST2500 BMC";

Put your system name here. eg "Bytedance G220A BMC".

> +       compatible = "bytedance,g220a-bmc", "aspeed,ast2500";
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
> +               gfx_memory: framebuffer {
> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };

This is used by the BMC's internal video device. I assume your system
is using that, as well as the host VGA device?

I am interested as I have recently looked at reworking how the BMC
selects between the two:

 https://lore.kernel.org/dri-devel/20200916083413.777307-1-joel@jms.id.au/

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

Nice feature!

> +               };
> +       };
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

Nice. Did you use a script to generate these?

Nice patch. Please resend with the copyright information fixed and we
can merge this in.

Cheers,

Joel
