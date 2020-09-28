Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D5727ABA8
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 12:15:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0JM036VXzDqPn
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 20:15:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0fW4lsCh; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0JLB033pzDqLn
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 20:15:11 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id 26so722605ois.5
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1JT+1YpxpccIFAiR+TaefkBhaBZvSRnBgbv/d79Qvo=;
 b=0fW4lsChn1Y/qnnDPfbbAsdwRFuoMzc6BaenKhHxpjeRLJ7WOYrHkqPtKzy9nuLrV7
 CKYsXJ+iKNoAlmVAx+6Rf4r2XXYCRnV+iMGUep8zYUF03RyLj34flRDXQR/HTKRF63nq
 iglIIkLa2kmx/MR6PE1pCOj3sE+7n8DihY2J2nOJS992qsaMUEQ92UwA3qzhm/nk+Ypp
 uW2//5rdu6DjoHKoY7BjbhT+UkUWDh1rv4pi64ygUWFbDAlp3qsV+HVq2aXvEWSQW0Mi
 s+Kv8vxdgTk3PuOUv3D44+/QaWjRB+gXH8Ij+R8HrURXGzHtNGfYzbnsk7pdZqS9nDCP
 B7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1JT+1YpxpccIFAiR+TaefkBhaBZvSRnBgbv/d79Qvo=;
 b=aO7jAZQxSSk9OHRTR6jZNS1oSezgJ3NCU238XxtgiVQ4zhN4msRrS6IArsyguZad2c
 BUiijC4Uk68ojSgCS/T0SCrp4r3TDBuXMnI8BL+0PsLjqtifzObitsds+dsJWo2sS5FF
 LnHrYGezIjwlnJcOqP1C6a72ANroc5IcGK6B8g+UZYcjnmQl7sUVBLaS3QJrsJsCn/2q
 HA8Lnv8bzvx2aH+dAHwKm5E0xiIalhjBxDMwXRG+KuFKxVTwTY1Gti6PGBWv3WrPOSK/
 iJ3ojKxz/SpzgWHLZonE2EMlAiTRJWXg6SAOF+/2nLU6EsMajIUceYGpMB+CW9BRbhHF
 PRpQ==
X-Gm-Message-State: AOAM531b9DuyLlSxbu9Bxiy42z9Y8gTScdolUwZeaYUBObk5HIitSiLv
 lyqekcAY30p3iBCexhhGmpuND7hBkQwAP9dpvHxhHA==
X-Google-Smtp-Source: ABdhPJwZ7EAg3IZUEG2QmK+vbAunBKMdxeSv5RWokKU4g6QvMcjLb1iGMTWcXiMthAGW3gdy2hUT19XhA+izlq+E234=
X-Received: by 2002:a05:6808:557:: with SMTP id
 i23mr407840oig.80.1601288108495; 
 Mon, 28 Sep 2020 03:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200928064303.1961-1-wangzhiqiang.bj@bytedance.com>
 <20200928064303.1961-3-wangzhiqiang.bj@bytedance.com>
 <CACPK8XeC1vjmvhQ41BccuTfHkX5S5Oe+bg5R30gKueGQMSOoFQ@mail.gmail.com>
In-Reply-To: <CACPK8XeC1vjmvhQ41BccuTfHkX5S5Oe+bg5R30gKueGQMSOoFQ@mail.gmail.com>
From: =?UTF-8?B?546L5b+X5by6?= <wangzhiqiang.bj@bytedance.com>
Date: Mon, 28 Sep 2020 18:14:57 +0800
Message-ID: <CAH0XSJvyqE5hJ7uDP5MNq+q=3mOpvqdT7UH+G4AiARhzJ3QGWw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH linux dev-5.8 2/2] ARM: dts: aspeed: Add
 Bytedance g220a BMC machine
To: Joel Stanley <joel@jms.id.au>
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
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 Lotus Xu <xuxiaohan@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 28, 2020 at 3:00 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 28 Sep 2020 at 06:43, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
> >
> > From: Lotus Xu <xuxiaohan@bytedance.com>
> >
> > The g220a is a server platform with an ASPEED AST2500 BMC.
> >
> > Signed-off-by: Lotus Xu <xuxiaohan@bytedance.com>
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 926 ++++++++++++++++++
> >  2 files changed, 927 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 56fd8c8a2ba9..7e4d3600e16d 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1351,6 +1351,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >         aspeed-bmc-amd-ethanolx.dtb \
> >         aspeed-bmc-arm-centriq2400-rep.dtb \
> >         aspeed-bmc-arm-stardragon4800-rep2.dtb \
> > +       aspeed-bmc-bytedance-g220a.dtb \
> >         aspeed-bmc-facebook-cmm.dtb \
> >         aspeed-bmc-facebook-minipack.dtb \
> >         aspeed-bmc-facebook-tiogapass.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> > new file mode 100644
> > index 000000000000..fe0437256ac8
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> > @@ -0,0 +1,926 @@
> > +/dts-v1/;
>
> Copyright holder and licence should go here.

ok

>
> > +
> > +#include "aspeed-g5.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/i2c/i2c.h>
> > +#include <dt-bindings/leds/leds-pca955x.h>
> > +
> > +/ {
> > +       model = "AST2500 BMC";
>
> Put your system name here. eg "Bytedance G220A BMC".

done.

>
> > +       compatible = "bytedance,g220a-bmc", "aspeed,ast2500";
> > +
>
> > +       reserved-memory {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               ranges;
> > +
> > +               vga_memory: framebuffer@bc000000 {
> > +                       no-map;
> > +                       reg = <0xbc000000 0x04000000>; /* 64M */
> > +               };
> > +
> > +               gfx_memory: framebuffer {
> > +                       size = <0x01000000>;
> > +                       alignment = <0x01000000>;
> > +                       compatible = "shared-dma-pool";
> > +                       reusable;
> > +               };
>
> This is used by the BMC's internal video device. I assume your system
> is using that, as well as the host VGA device?

Ah, G220A does not use the BMC's internal video device, will remove the node.

>
> I am interested as I have recently looked at reworking how the BMC
> selects between the two:
>
>  https://lore.kernel.org/dri-devel/20200916083413.777307-1-joel@jms.id.au/
>
> > +
> > +               video_engine_memory: jpegbuffer {
> > +                       size = <0x02000000>;    /* 32M */
> > +                       alignment = <0x01000000>;
> > +                       compatible = "shared-dma-pool";
> > +                       reusable;
> > +               };
> > +       };
> > +
> > +       iio-hwmon {
> > +               compatible = "iio-hwmon";
> > +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> > +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> > +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> > +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> > +       };
> > +
> > +       leds {
> > +               compatible = "gpio-leds";
> > +               bmc_alive {
> > +                       label = "bmc_alive";
> > +                       gpios = <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
> > +                       linux,default-trigger = "timer";
> > +                       led-pattern = <1000 1000>;
>
> Nice feature!
>
> > +               };
> > +       };
> > +
>
> > +&gpio {
> > +       status = "okay";
> > +       gpio-line-names =
> > +       /*A0-A7*/       "SMRST_OCP_N","MAC2_LINK","BMC_CPLD_SMB_RST_R_N","BMC_CPLD_GPIO0",
> > +                       "","","","",
> > +       /*B0-B7*/       "BMC_INIT_R_OK","FM_BOARD_REV_ID2","FM_PROJECT_ID7","FAULT_P12V_STBY_N",
> > +                       "","CPU0_PROCHOT_LVT3_N","","BIOS_LOAD_DEFAULT_R_N",
> > +       /*C0-C7*/       "","","","","","","","",
> > +       /*D0-D7*/       "","","","","","","","",
> > +       /*E0-E7*/       "FM_PROJECT_ID0","FM_PROJECT_ID1","FM_PROJECT_ID2","FM_PROJECT_ID3",
> > +                       "FM_PROJECT_ID4","FM_PROJECT_ID5","","",
> > +       /*F0-F7*/       "PSU0_PRSNT_N","PSU1_PRSNT_N","","FAULT_P12V_NVME_N",
> > +                       "BIOS_DEBUG_MODE_R_N","DISABLE_CPU_DDR_R_SPD","COOLING_STRATEGY",
> > +                       "PCH_GLB_RST_N",
> > +       /*G0-G7*/       "P12V_PMBUS_ALERT_N","CPLD_ALERT_N","BMC_RELOAD_N",
> > +                       "P12V_PVDDQ_PMBUS_ALERT_N","BMC_JTAG_TCK_MUX_R_SEL","","NMI_OUT",
> > +                       "NMI_BUTTON",
> > +       /*H0-H7*/       "BMC_CPLD_JTAG_TDI","BMC_CPLD_JTAG_TDO","BMC_CPLD_JTAG_TCK",
> > +                       "BMC_CPLD_JTAG_TMS","FM_PROJECT_ID6","FM_BOARD_REV_ID0",
> > +                       "PCA9546_U70_RST_N","IRQ_SML0_ALERT_N",
> > +       /*I0-I7*/       "FAULT_FRONT_RISER_P12V_N","FAULT_OCP_P12V_N","FM_BMC_PCH_SCI_R_N",
> > +                       "","","","","",
> > +       /*J0-J7*/       "FM_CPU0_SKTOCC_N","FM_CPU1_SKTOCC_N","FM_CPU1_DISABLE_COD_N",
> > +                       "","","","","",
> > +       /*K0-K7*/       "","","","","","","","",
> > +       /*L0-L7*/       "P12V_FAULT_N","PWRGD_P12V_PCIE_RISER","","LEAKAGE_DETECT_INPUT_N",
> > +                       "","IRQ_SML1_PMBUS_ALERT_N","","",
> > +       /*M0-M7*/       "","","","","","","","",
> > +       /*N0-N7*/       "","","","","","","","",
> > +       /*O0-O7*/       "","","","","","","","",
> > +       /*P0-P7*/       "","","","","","","","",
> > +       /*Q0-Q7*/       "","","","","","","FM_PCH_THERMTRIP_N","INTRUDER_N",
> > +       /*R0-R7*/       "","PVCCIN_CPU1_SMBALERT_N","BMC_PREQ_R_N","FAULT_P12V_PCIE_RISER_N",
> > +                       "ALT_P12V_PCIE_RISER_N","BURN_BOARD_N","PVCCIN_CPU0_SMBALERT_N","",
> > +       /*S0-S7*/       "BMC_PRDY_N","SIO_POWER_GOOD","FM_BMC_PWR_DEBUG_R_N",
> > +                       "FM_BMC_XDP_DEBUG_EN","","","","",
> > +       /*T0-T7*/       "","","","","","","","",
> > +       /*U0-U7*/       "","","","","","","","",
> > +       /*V0-V7*/       "","","","","","","","",
> > +       /*W0-W7*/       "","","","","","","","",
> > +       /*X0-X7*/       "","","","","","","","",
> > +       /*Y0-Y7*/       "","PWRGD_PSU0_PWROK","CPU1_PROCHOT_LVT3_N","IRQ_BMC_PCH_SMI_LPC_N",
> > +                       "","","","",
> > +       /*Z0-Z7*/       "XDP_PRSNT_N","BMC_XDP_SYS_PWROK","BMC_XDP_JTAG_SEL",
> > +                       "PCH_BMC_SMI_ACTIVE_R_N","","","","",
> > +       /*AA0-AA7*/     "PWRGD_P12V_STBY_OCP","PS_PWROK","RST_PLTRST_BMC_R_N","HDA_SDO_R",
> > +                       "FM_SLPS4_R_N","PWRGD_PSU1_PWROK","POWER_BUTTON","POWER_OUT",
> > +       /*AB0-AB7*/     "","RESET_OUT","SPI_BIOS_MODE_SELECT","POST_COMPLETE","","","","",
> > +       /*AC0-AC7*/     "","","","","","","","CPLD_PLTRST_B_N";
> > +};
>
> Nice. Did you use a script to generate these?

:hmm, I did not have a script... :(.


>
> Nice patch. Please resend with the copyright information fixed and we
> can merge this in.
>
> Cheers,
>
> Joel
