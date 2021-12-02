Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85376465D71
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 05:32:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4NNg3RT2z2yg4
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 15:32:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QVtXNbM4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QVtXNbM4; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4NNH34YDz2yHq
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 15:32:31 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id de30so33559849qkb.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 20:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nQoYwgBlgUJbqOAX+bqsAUgtuG8NfVPCh5Az0DAPuQU=;
 b=QVtXNbM4fmkvriDd1uXAdGedDMwkWxVHvuqfzhmUDrnsU2fZdwzDp1RkRUDdvT2Mb7
 Vg4C4KFnyL+XsmW0W7TMrK3BYm8Xlkddm/vssJJgSWzmbnnaXu5cdq7pPi7larfr2KKI
 jz+BhHZQPwgG2Iaj/VVlCSYCvNWUob+cJjRY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nQoYwgBlgUJbqOAX+bqsAUgtuG8NfVPCh5Az0DAPuQU=;
 b=B7dL3XHwkprjp5z5f5a9eEz6X48T3LozbbVEe6ymsUjpUybV93HP6EYutQMqXaOXUj
 q6Tf4pbpvBdfmMNmAeX5q+Y2ryCElbys3EF8HFJooesQp+Z4iTIGj1yGv2a9mmG0RTbA
 7QDRYZfBmK58tAVbx0T/fIlwISqn5QKPqocfjM33XHVCE3KRObmlmp9Ic2O/jFamh15o
 8SFdzLINayQZCWqqJyotiGErClFis16Z8h/PWxKCgu3lgd7Be9xEw0tLJtd2h6O11Gwn
 orzeHfp30pzPlfAEwpxfJH4u8nUyejQbpO9RlfsrmIn0CD5V3vL3tF5scmYPAQzRtOF9
 JWOQ==
X-Gm-Message-State: AOAM532j5VnN+2ZA+QYixRd5SzqmtSapSCVLj3bpiIavQL6DHxJhx5Eb
 ZxWJmU18x/tLta2BBN8T5AvwBuohpQgfABPywYCQ5P1y9Zc=
X-Google-Smtp-Source: ABdhPJznNE9ASNVjcoTKEGVK0uQa4p5bGrIl3LqARCkgav2qXmZ/c8/ryUDh7dvp5lFArvjyewgAGS3IHFIJ6rXN6/4=
X-Received: by 2002:ae9:ef11:: with SMTP id d17mr10535213qkg.347.1638419547876; 
 Wed, 01 Dec 2021 20:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20211202022623.182903-1-howard.chiu@quantatw.com>
 <CACPK8XcWt18nm0+BYomnWkRCRBqhYJ04y4c_P1nTczLpjyVXcA@mail.gmail.com>
 <HKAPR04MB400364D203AA1D050B753B2196699@HKAPR04MB4003.apcprd04.prod.outlook.com>
In-Reply-To: <HKAPR04MB400364D203AA1D050B753B2196699@HKAPR04MB4003.apcprd04.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Dec 2021 04:32:15 +0000
Message-ID: <CACPK8XeCHTDCCd=087BSYw3mq=Hjx=vgCrM17r4ZFtVCazhfHw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] Porting tach driver for ast26xx from Aspeed
 linux
To: =?UTF-8?B?SG93YXJkIENoaXUgKOmCseWGoOedvyk=?= <Howard.Chiu@quantatw.com>
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
Cc: Howard Chiu <howard10703049@gmail.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2 Dec 2021 at 04:29, Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF) <How=
ard.Chiu@quantatw.com> wrote:
>
> Hi Joel
>
> Yes, this patch is v14 I just downloaded from patchwork and tested it wit=
h Facebook Bletchley platform.
> I am not sure if there would be further revision of this driver, but my p=
latform needs ast26xx PWM/Tach driver.
> I will sync this driver with Billy's work.

Thanks for the explanation. In the future, it would pay to reference
the work you've based your patch on, and keep the ownership
information in the patch.

Billy, are you happy with us putting v14 into the openbmc tree?

> If I am not available, Potin Lai will take over this task.

That's great, thank you both.

Once we have heard from Billy I'll grab the patches from the mailing
list and apply them to dev-5.15.

>
> Howard
>
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Thursday, December 2, 2021 12:00 PM
> > To: Howard Chiu <howard10703049@gmail.com>; Billy Tsai
> > <billy_tsai@aspeedtech.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Howard Chiu (=E9=82=B1=
=E5=86=A0=E7=9D=BF)
> > <Howard.Chiu@quantatw.com>
> > Subject: Re: [PATCH linux dev-4.7] Porting tach driver for ast26xx from=
 Aspeed
> > linux
> >
> > On Thu, 2 Dec 2021 at 02:28, Howard Chiu <howard10703049@gmail.com>
> > wrote:
> > >
> > > Aspeed did not commit tach driver to upstream for ast2600 series yet.
> > > To support ast26xx on OpenBMC, we need this driver and update the g6
> > device tree as well.
> > >
> > > Change-Id: I1714abf4fd08edead789439e5723b183d1b0d175
> > > Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> >
> > Thanks for the ptach.
> >
> > Aspeed are working on a driver for the 2600. You can see v14 here:
> >
> >
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e.ker
> > nel.org%2Fall%2F20211130055933.32708-1-billy_tsai%40aspeedtech.com%2F
> > &amp;data=3D04%7C01%7Choward.chiu%40quantatw.com%7C7b8f545f7b514ac
> > beb1608d9b5483bcc%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7
> > C637740144119019839%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat
> > a=3Dh6kuSxA7q7FUXorYyqPqYFnvcWq9DJRkm1CycyhdYFY%3D&amp;reserved=3D0
> >
> > If you would like this driver to be added we can do so. As long as it
> > doesn't introduce new userspace ABI, we can carry the work in progress
> > version. I would ask that you help to update the openbmc version with
> > any changes Billy makes to the driver between v14 and the version that
> > gets accepted.
> >
> > Let me know how you want to proceed.
> >
> > Cheers,
> >
> > Joel
> >
> > > ---
> > >  arch/arm/boot/dts/aspeed-g6.dtsi    |  22 ++
> > >  drivers/hwmon/Kconfig               |   8 +
> > >  drivers/hwmon/Makefile              |   1 +
> > >  drivers/hwmon/tach-aspeed-ast2600.c | 388
> > ++++++++++++++++++++++++++++
> > >  4 files changed, 419 insertions(+)
> > >  create mode 100644 drivers/hwmon/tach-aspeed-ast2600.c
> > >
> > > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi
> > b/arch/arm/boot/dts/aspeed-g6.dtsi
> > > index 5106a424f1ce..ec249f450552 100644
> > > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > > @@ -304,6 +304,28 @@ apb {
> > >                         #size-cells =3D <1>;
> > >                         ranges;
> > >
> > > +                       pwm_tach: pwm_tach@1e610000 {
> > > +                               compatible =3D
> > "aspeed,ast2600-pwm-tach", "simple-mfd", "syscon";
> > > +                               reg =3D <0x1e610000 0x100>;
> > > +                               clocks =3D <&syscon
> > ASPEED_CLK_AHB>;
> > > +                               resets =3D <&syscon
> > ASPEED_RESET_PWM>;
> > > +
> > > +                               pwm: pwm {
> > > +                                       compatible =3D
> > "aspeed,ast2600-pwm";
> > > +                                       #pwm-cells =3D <3>;
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +                                       status =3D "disabled";
> > > +                               };
> > > +
> > > +                               tach: tach {
> > > +                                       compatible =3D
> > "aspeed,ast2600-tach";
> > > +                                       #address-cells =3D <1>;
> > > +                                       #size-cells =3D <0>;
> > > +                                       status =3D "disabled";
> > > +                               };
> > > +                       };
> > > +
> > >                         syscon: syscon@1e6e2000 {
> > >                                 compatible =3D "aspeed,ast2600-scu",
> > "syscon", "simple-mfd";
> > >                                 reg =3D <0x1e6e2000 0x1000>;
> > > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > > index 64bd3dfba2c4..0eb307cb67fc 100644
> > > --- a/drivers/hwmon/Kconfig
> > > +++ b/drivers/hwmon/Kconfig
> > > @@ -397,6 +397,14 @@ config SENSORS_ASPEED
> > >           This driver can also be built as a module. If so, the modul=
e
> > >           will be called aspeed_pwm_tacho.
> > >
> > > +config SENSORS_TACH_ASPEED_AST2600
> > > +       tristate "ASPEED ast2600 Tachometer support"
> > > +       help
> > > +         This driver provides support for Aspeed ast2600 Tachometer.
> > > +
> > > +         To compile this driver as a module, choose M here: the modu=
le
> > > +         will be called tach-aspeed-ast2600.
> > > +
> > >  config SENSORS_ATXP1
> > >         tristate "Attansic ATXP1 VID controller"
> > >         depends on I2C
> > > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > > index baee6a8d4dd1..ce66874c8ce2 100644
> > > --- a/drivers/hwmon/Makefile
> > > +++ b/drivers/hwmon/Makefile
> > > @@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_ARM_SCMI)        +=3D
> > scmi-hwmon.o
> > >  obj-$(CONFIG_SENSORS_ARM_SCPI) +=3D scpi-hwmon.o
> > >  obj-$(CONFIG_SENSORS_AS370)    +=3D as370-hwmon.o
> > >  obj-$(CONFIG_SENSORS_ASC7621)  +=3D asc7621.o
> > > +obj-$(CONFIG_SENSORS_TACH_ASPEED_AST2600) +=3D
> > tach-aspeed-ast2600.o
> > >  obj-$(CONFIG_SENSORS_ASPEED)   +=3D aspeed-pwm-tacho.o
> > >  obj-$(CONFIG_SENSORS_ATXP1)    +=3D atxp1.o
> > >  obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) +=3D axi-fan-control.o
> > > diff --git a/drivers/hwmon/tach-aspeed-ast2600.c
> > b/drivers/hwmon/tach-aspeed-ast2600.c
> > > new file mode 100644
> > > index 000000000000..0b2551fc1711
> > > --- /dev/null
> > > +++ b/drivers/hwmon/tach-aspeed-ast2600.c
> > > @@ -0,0 +1,388 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (C) ASPEED Technology Inc.
> > > + *
> > > + * This program is free software; you can redistribute it and/or mod=
ify
> > > + * it under the terms of the GNU General Public License version 2 or=
 later as
> > > + * published by the Free Software Foundation.
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/hwmon.h>
> > > +#include <linux/hwmon-sysfs.h>
> > > +#include <linux/io.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_platform.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/sysfs.h>
> > > +#include <linux/reset.h>
> > > +#include <linux/regmap.h>
> > > +/* TACH Control Register */
> > > +#define ASPEED_TACHO_CTRL_CH(ch) ((ch * 0x10) + 0x08)
> > > +#define TACHO_IER BIT(31) //enable tacho interrupt
> > > +#define TACHO_INVERS_LIMIT BIT(30) //inverse tacho limit comparison
> > > +#define TACHO_LOOPBACK BIT(29) //tacho loopback
> > > +#define TACHO_ENABLE BIT(28) //{enable tacho}
> > > +#define TACHO_DEBOUNCE_MASK (0x3 << 26) //{tacho de-bounce}
> > > +#define TACHO_DEBOUNCE_BIT (26) //{tacho de-bounce}
> > > +#define TECHIO_EDGE_MASK (0x3 << 24) //tacho edge}
> > > +#define TECHIO_EDGE_BIT (24) //tacho edge}
> > > +#define TACHO_CLK_DIV_T_MASK (0xf << 20)
> > > +#define TACHO_CLK_DIV_BIT (20)
> > > +#define TACHO_THRESHOLD_MASK (0xfffff) //tacho threshold bit
> > > +/* [27:26] */
> > > +#define DEBOUNCE_3_CLK 0x00 /* 10b */
> > > +#define DEBOUNCE_2_CLK 0x01 /* 10b */
> > > +#define DEBOUNCE_1_CLK 0x02 /* 10b */
> > > +#define DEBOUNCE_0_CLK 0x03 /* 10b */
> > > +/* [25:24] */
> > > +#define F2F_EDGES 0x00 /* 10b */
> > > +#define R2R_EDGES 0x01 /* 10b */
> > > +#define BOTH_EDGES 0x02 /* 10b */
> > > +/* [23:20] */
> > > +/* Cover rpm range 5~5859375 */
> > > +#define DEFAULT_TACHO_DIV 5
> > > +
> > > +/* TACH Status Register */
> > > +#define ASPEED_TACHO_STS_CH(x) ((x * 0x10) + 0x0C)
> > > +
> > > +/*PWM_TACHO_STS */
> > > +#define TACHO_ISR BIT(31) //interrupt status and clear
> > > +#define PWM_OUT BIT(25) //{pwm_out}
> > > +#define PWM_OEN BIT(24) //{pwm_oeN}
> > > +#define TACHO_DEB_INPUT BIT(23) //tacho deB input
> > > +#define TACHO_RAW_INPUT BIT(22) //tacho raw input}
> > > +#define TACHO_VALUE_UPDATE BIT(21) //tacho value updated since the
> > last read
> > > +#define TACHO_FULL_MEASUREMENT BIT(20) //{tacho full measurement}
> > > +#define TACHO_VALUE_MASK 0xfffff //tacho value bit [19:0]}
> > > +/**********************************************************
> > > + * Software setting
> > > + *********************************************************/
> > > +#define DEFAULT_FAN_MIN_RPM 1000
> > > +#define DEFAULT_FAN_PULSE_PR 2
> > > +/*
> > > + * Add this value to avoid CPU consuming a lot of resources in waiti=
ng rpm
> > > + * updating. Assume the max rpm of fan is 60000, the period of updat=
ing
> > tach
> > > + * value will equal to (1000000 * 2 * 60) / (2 * max_rpm) =3D 1000.
> > > + */
> > > +#define RPM_POLLING_PERIOD_US 1000
> > > +
> > > +struct aspeed_tacho_channel_params {
> > > +       int limited_inverse;
> > > +       u16 threshold;
> > > +       u8 tacho_edge;
> > > +       u8 tacho_debounce;
> > > +       u8 pulse_pr;
> > > +       u32 min_rpm;
> > > +       u32 divide;
> > > +       u32 sample_period; /* unit is us */
> > > +};
> > > +
> > > +struct aspeed_tach_data {
> > > +       struct regmap *regmap;
> > > +       unsigned long clk_freq;
> > > +       struct reset_control *reset;
> > > +       bool tach_present[16];
> > > +       struct aspeed_tacho_channel_params *tacho_channel;
> > > +       /* for hwmon */
> > > +       const struct attribute_group *groups[2];
> > > +};
> > > +
> > > +static u32 aspeed_get_fan_tach_sample_period(struct aspeed_tach_data
> > *priv,
> > > +                                            u8 fan_tach_ch)
> > > +{
> > > +       u32 tach_period_us;
> > > +       u8 pulse_pr =3D priv->tacho_channel[fan_tach_ch].pulse_pr;
> > > +       u32 min_rpm =3D priv->tacho_channel[fan_tach_ch].min_rpm;
> > > +       /*
> > > +        * min(Tach input clock) =3D (PulsePR * minRPM) / 60
> > > +        * max(Tach input period) =3D 60 / (PulsePR * minRPM)
> > > +        * Tach sample period > 2 * max(Tach input period) =3D (2*60)=
 /
> > (PulsePR * minRPM)
> > > +        */
> > > +       tach_period_us =3D (1000000 * 2 * 60) / (pulse_pr * min_rpm);
> > > +       /* Add the margin (about 1.2) of tach sample period to avoid
> > sample miss */
> > > +       tach_period_us =3D (tach_period_us * 1200) >> 10;
> > > +       pr_debug("tach%d sample period =3D %dus", fan_tach_ch,
> > tach_period_us);
> > > +       return tach_period_us;
> > > +}
> > > +
> > > +static void aspeed_set_fan_tach_ch_enable(struct aspeed_tach_data *p=
riv,
> > > +                                         u8 fan_tach_ch, bool
> > enable,
> > > +                                         u32 tacho_div)
> > > +{
> > > +       u32 reg_value =3D 0;
> > > +
> > > +       if (enable) {
> > > +               /* divide =3D 2^(tacho_div*2) */
> > > +               priv->tacho_channel[fan_tach_ch].divide =3D 1 <<
> > (tacho_div << 1);
> > > +
> > > +               reg_value =3D TACHO_ENABLE |
> > > +
> > (priv->tacho_channel[fan_tach_ch].tacho_edge
> > > +                            << TECHIO_EDGE_BIT) |
> > > +                           (tacho_div << TACHO_CLK_DIV_BIT) |
> > > +
> > (priv->tacho_channel[fan_tach_ch].tacho_debounce
> > > +                            << TACHO_DEBOUNCE_BIT);
> > > +
> > > +               if (priv->tacho_channel[fan_tach_ch].limited_inverse)
> > > +                       reg_value |=3D TACHO_INVERS_LIMIT;
> > > +
> > > +               if (priv->tacho_channel[fan_tach_ch].threshold)
> > > +                       reg_value |=3D
> > > +                               (TACHO_IER |
> > > +
> > priv->tacho_channel[fan_tach_ch].threshold);
> > > +
> > > +               regmap_write(priv->regmap,
> > ASPEED_TACHO_CTRL_CH(fan_tach_ch),
> > > +                            reg_value);
> > > +
> > > +               priv->tacho_channel[fan_tach_ch].sample_period =3D
> > > +                       aspeed_get_fan_tach_sample_period(priv,
> > fan_tach_ch);
> > > +       } else
> > > +               regmap_update_bits(priv->regmap,
> > > +
> > ASPEED_TACHO_CTRL_CH(fan_tach_ch),
> > > +                                  TACHO_ENABLE, 0);
> > > +}
> > > +
> > > +static int aspeed_get_fan_tach_ch_rpm(struct aspeed_tach_data *priv,
> > > +                                     u8 fan_tach_ch)
> > > +{
> > > +       u32 raw_data, tach_div, clk_source, usec, val;
> > > +       u64 rpm;
> > > +       int ret;
> > > +
> > > +       usec =3D priv->tacho_channel[fan_tach_ch].sample_period;
> > > +       /* Restart the Tach channel to guarantee the value is fresh *=
/
> > > +       regmap_update_bits(priv->regmap,
> > ASPEED_TACHO_CTRL_CH(fan_tach_ch),
> > > +                            TACHO_ENABLE, 0);
> > > +       regmap_update_bits(priv->regmap,
> > ASPEED_TACHO_CTRL_CH(fan_tach_ch),
> > > +                            TACHO_ENABLE, TACHO_ENABLE);
> > > +       ret =3D regmap_read_poll_timeout(
> > > +               priv->regmap, ASPEED_TACHO_STS_CH(fan_tach_ch),
> > val,
> > > +               (val & TACHO_FULL_MEASUREMENT) && (val &
> > TACHO_VALUE_UPDATE),
> > > +               RPM_POLLING_PERIOD_US, usec);
> > > +
> > > +       if (ret) {
> > > +               /* return 0 if we didn't get an answer because of
> > timeout*/
> > > +               if (ret =3D=3D -ETIMEDOUT)
> > > +                       return 0;
> > > +               else
> > > +                       return ret;
> > > +       }
> > > +
> > > +       raw_data =3D val & TACHO_VALUE_MASK;
> > > +       /*
> > > +        * We need the mode to determine if the raw_data is double
> > (from
> > > +        * counting both edges).
> > > +        */
> > > +       if (priv->tacho_channel[fan_tach_ch].tacho_edge =3D=3D BOTH_E=
DGES)
> > > +               raw_data <<=3D 1;
> > > +
> > > +       tach_div =3D raw_data * (priv->tacho_channel[fan_tach_ch].div=
ide) *
> > > +                  (priv->tacho_channel[fan_tach_ch].pulse_pr);
> > > +
> > > +       pr_debug("clk %ld, raw_data %d , tach_div %d\n", priv->clk_fr=
eq,
> > raw_data, tach_div);
> > > +
> > > +       clk_source =3D priv->clk_freq;
> > > +
> > > +       if (tach_div =3D=3D 0)
> > > +               return -EDOM;
> > > +
> > > +       rpm =3D (u64)clk_source * 60;
> > > +       do_div(rpm, tach_div);
> > > +
> > > +       return rpm;
> > > +}
> > > +
> > > +static ssize_t show_rpm(struct device *dev, struct device_attribute =
*attr,
> > > +                       char *buf)
> > > +{
> > > +       struct sensor_device_attribute *sensor_attr =3D
> > to_sensor_dev_attr(attr);
> > > +       int index =3D sensor_attr->index;
> > > +       int rpm;
> > > +       struct aspeed_tach_data *priv =3D dev_get_drvdata(dev);
> > > +
> > > +       rpm =3D aspeed_get_fan_tach_ch_rpm(priv, index);
> > > +       if (rpm < 0)
> > > +               return rpm;
> > > +
> > > +       return sprintf(buf, "%d\n", rpm);
> > > +}
> > > +
> > > +static umode_t fan_dev_is_visible(struct kobject *kobj, struct attri=
bute *a,
> > > +                                 int index)
> > > +{
> > > +       struct device *dev =3D container_of(kobj, struct device, kobj=
);
> > > +       struct aspeed_tach_data *priv =3D dev_get_drvdata(dev);
> > > +
> > > +       if (!priv->tach_present[index])
> > > +               return 0;
> > > +       return a->mode;
> > > +}
> > > +
> > > +static SENSOR_DEVICE_ATTR(fan1_input, 0444, show_rpm, NULL, 0);
> > > +static SENSOR_DEVICE_ATTR(fan2_input, 0444, show_rpm, NULL, 1);
> > > +static SENSOR_DEVICE_ATTR(fan3_input, 0444, show_rpm, NULL, 2);
> > > +static SENSOR_DEVICE_ATTR(fan4_input, 0444, show_rpm, NULL, 3);
> > > +static SENSOR_DEVICE_ATTR(fan5_input, 0444, show_rpm, NULL, 4);
> > > +static SENSOR_DEVICE_ATTR(fan6_input, 0444, show_rpm, NULL, 5);
> > > +static SENSOR_DEVICE_ATTR(fan7_input, 0444, show_rpm, NULL, 6);
> > > +static SENSOR_DEVICE_ATTR(fan8_input, 0444, show_rpm, NULL, 7);
> > > +static SENSOR_DEVICE_ATTR(fan9_input, 0444, show_rpm, NULL, 8);
> > > +static SENSOR_DEVICE_ATTR(fan10_input, 0444, show_rpm, NULL, 9);
> > > +static SENSOR_DEVICE_ATTR(fan11_input, 0444, show_rpm, NULL, 10);
> > > +static SENSOR_DEVICE_ATTR(fan12_input, 0444, show_rpm, NULL, 11);
> > > +static SENSOR_DEVICE_ATTR(fan13_input, 0444, show_rpm, NULL, 12);
> > > +static SENSOR_DEVICE_ATTR(fan14_input, 0444, show_rpm, NULL, 13);
> > > +static SENSOR_DEVICE_ATTR(fan15_input, 0444, show_rpm, NULL, 14);
> > > +static SENSOR_DEVICE_ATTR(fan16_input, 0444, show_rpm, NULL, 15);
> > > +static struct attribute *fan_dev_attrs[] =3D {
> > > +       &sensor_dev_attr_fan1_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan2_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan3_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan4_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan5_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan6_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan7_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan8_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan9_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan10_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan11_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan12_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan13_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan14_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan15_input.dev_attr.attr,
> > > +       &sensor_dev_attr_fan16_input.dev_attr.attr,
> > > +       NULL
> > > +};
> > > +
> > > +static const struct attribute_group fan_dev_group =3D {
> > > +       .attrs =3D fan_dev_attrs,
> > > +       .is_visible =3D fan_dev_is_visible,
> > > +};
> > > +
> > > +static void aspeed_create_fan_tach_channel(struct aspeed_tach_data *=
priv,
> > > +                                          u32 tach_ch, int count,
> > > +                                          u32 fan_pulse_pr, u32
> > fan_min_rpm,
> > > +                                          u32 tacho_div)
> > > +{
> > > +       priv->tach_present[tach_ch] =3D true;
> > > +       priv->tacho_channel[tach_ch].pulse_pr =3D fan_pulse_pr;
> > > +       priv->tacho_channel[tach_ch].min_rpm =3D fan_min_rpm;
> > > +       priv->tacho_channel[tach_ch].limited_inverse =3D 0;
> > > +       priv->tacho_channel[tach_ch].threshold =3D 0;
> > > +       priv->tacho_channel[tach_ch].tacho_edge =3D F2F_EDGES;
> > > +       priv->tacho_channel[tach_ch].tacho_debounce =3D
> > DEBOUNCE_3_CLK;
> > > +       aspeed_set_fan_tach_ch_enable(priv, tach_ch, true, tacho_div)=
;
> > > +}
> > > +
> > > +static int aspeed_tach_create_fan(struct device *dev, struct device_=
node
> > *child,
> > > +                                 struct aspeed_tach_data *priv)
> > > +{
> > > +       u32 fan_pulse_pr, fan_min_rpm;
> > > +       u32 tacho_div;
> > > +       u32 tach_channel;
> > > +       int ret, count;
> > > +
> > > +       ret =3D of_property_read_u32(child, "reg", &tach_channel);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       ret =3D of_property_read_u32(child, "aspeed,pulse-pr",
> > &fan_pulse_pr);
> > > +       if (ret)
> > > +               fan_pulse_pr =3D DEFAULT_FAN_PULSE_PR;
> > > +
> > > +       ret =3D of_property_read_u32(child, "aspeed,min-rpm",
> > &fan_min_rpm);
> > > +       if (ret)
> > > +               fan_min_rpm =3D DEFAULT_FAN_MIN_RPM;
> > > +
> > > +       ret =3D of_property_read_u32(child, "aspeed,tach-div", &tacho=
_div);
> > > +       if (ret)
> > > +               tacho_div =3D DEFAULT_TACHO_DIV;
> > > +
> > > +       aspeed_create_fan_tach_channel(priv, tach_channel, count,
> > fan_pulse_pr,
> > > +                                      fan_min_rpm, tacho_div);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int aspeed_tach_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct device_node *np, *child;
> > > +       struct aspeed_tach_data *priv;
> > > +       struct device *hwmon;
> > > +       struct clk *clk;
> > > +       int ret;
> > > +
> > > +       np =3D dev->parent->of_node;
> > > +       dev_info(dev, "tach probe start\n");
> > > +
> > > +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +       if (!priv)
> > > +               return -ENOMEM;
> > > +
> > > +       priv->tacho_channel =3D devm_kzalloc(
> > > +               dev, 16 * sizeof(*priv->tacho_channel), GFP_KERNEL);
> > > +
> > > +       priv->regmap =3D syscon_node_to_regmap(np);
> > > +       if (IS_ERR(priv->regmap)) {
> > > +               dev_err(dev, "Couldn't get regmap\n");
> > > +               return -ENODEV;
> > > +       }
> > > +
> > > +       clk =3D of_clk_get(np, 0);
> > > +       if (IS_ERR(clk))
> > > +               return -ENODEV;
> > > +       priv->clk_freq =3D clk_get_rate(clk);
> > > +
> > > +       priv->reset =3D of_reset_control_get_shared(np, NULL);
> > > +       if (IS_ERR(priv->reset)) {
> > > +               dev_err(&pdev->dev, "can't get aspeed_pwm_tacho
> > reset\n");
> > > +               return PTR_ERR(priv->reset);
> > > +       }
> > > +
> > > +       //scu init
> > > +       reset_control_deassert(priv->reset);
> > > +
> > > +       for_each_child_of_node(dev->of_node, child) {
> > > +               ret =3D aspeed_tach_create_fan(dev, child, priv);
> > > +               if (ret) {
> > > +                       of_node_put(child);
> > > +                       return ret;
> > > +               }
> > > +       }
> > > +
> > > +       priv->groups[0] =3D &fan_dev_group;
> > > +       priv->groups[1] =3D NULL;
> > > +       dev_info(dev, "tach probe done\n");
> > > +       hwmon =3D devm_hwmon_device_register_with_groups(dev,
> > "aspeed_tach", priv,
> > > +
> > priv->groups);
> > > +
> > > +       return PTR_ERR_OR_ZERO(hwmon);
> > > +}
> > > +
> > > +static const struct of_device_id of_stach_match_table[] =3D {
> > > +       {
> > > +               .compatible =3D "aspeed,ast2600-tach",
> > > +       },
> > > +       {},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, of_stach_match_table);
> > > +
> > > +static struct platform_driver aspeed_tach_driver =3D {
> > > +       .probe          =3D aspeed_tach_probe,
> > > +       .driver         =3D {
> > > +               .name   =3D "aspeed_tach",
> > > +               .of_match_table =3D of_stach_match_table,
> > > +       },
> > > +};
> > > +
> > > +module_platform_driver(aspeed_tach_driver);
> > > +
> > > +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> > > +MODULE_DESCRIPTION("ASPEED Fan tach device driver");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.25.1
> > >
