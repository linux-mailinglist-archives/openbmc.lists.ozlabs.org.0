Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E51354C
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2019 00:12:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wmbS3htmzDqZB
	for <lists+openbmc@lfdr.de>; Sat,  4 May 2019 08:12:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="J7fFsbWg"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wmZW56NDzDqYP
 for <openbmc@lists.ozlabs.org>; Sat,  4 May 2019 08:12:02 +1000 (AEST)
Received: by mail-it1-x143.google.com with SMTP id q14so11723250itk.0
 for <openbmc@lists.ozlabs.org>; Fri, 03 May 2019 15:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0YhThFBN6LQaCRiJx9QdEplguBAUo5hCM7nnmpz+PM=;
 b=J7fFsbWgpkTmKNKpdD9N65AoYJAYbKVtryLexaAXfbijMgrJLPKZW+XV/cnf/zPoGC
 sROjBkv0zQoEkfKGu9MQXwdk4ooRITSuDFXPXHTdgsDji2wKBrfTSJLcQNdmlbzzGR0f
 z9GVFHBRA18xuv8YA7GSNpQtCn6c+GNjBzON0BgMPeKFgKgrHxiB/niHjA0DgoFksl2t
 gXICzYcX4C6fJ2boxxOR0A0Hr8MJRSEpcwhfMrYku+DBJPtHuHruEN4hNk7ugaTWvQ98
 Q+c4wPWTPAJQIWcXE8ystThQ4plENd+9dLsUzgY19cMOmkqaUWDw36SURMSeXsZpbTS2
 15Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0YhThFBN6LQaCRiJx9QdEplguBAUo5hCM7nnmpz+PM=;
 b=AWl2oaBXVG3k32IcQQcOq53WVZ6XLQs72KjLpnWpMMawY+GCAKelXuqiL3v19wXw94
 VEuE1b5QLTDBR+chxB/heZY5krrJTlfjbH41DRvGJfo9kgoEeG3CfnAYzxivDtc+zmub
 p+s3R0M5HI+VPaSiVZqzAJutoAWrEqb16n/oO3x4/P3+RJKMsf4q+dwRorhHJpkiksp2
 oJ1TgP2o+jrbnuhuBI6S0j1GKAPK1oGLwEQ2UfC5gV61tDob1gX060g4D6/AzX9iQu6M
 bCW2zPaElEDn8wKX6R0FGVx8b4JTGaQq4xkZPl1PIWtbmhKKjM8uvM/BiqILohSimSg+
 /Dew==
X-Gm-Message-State: APjAAAUPkksvm0duFXriLG5xL77Y1nmqNXuJRi3QzMxtDWnJ8AXTj78x
 hTGkZNxtT1wOg+9H/qzHBagqIE7rtMF1UJ0gKWnj4w==
X-Google-Smtp-Source: APXvYqwxOhI8mGd8fDclsx3KtWKtmGVTbWfMyrSvG/05Jw7hyOn2ukC1t4WQBOhbnpqHebRMtBDm1NwmXzOHJ31yrkg=
X-Received: by 2002:a24:11d7:: with SMTP id 206mr8103962itf.155.1556921517482; 
 Fri, 03 May 2019 15:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <1556174916-137177-1-git-send-email-pengms1@lenovo.com>
 <CACPK8XfZy3znvy1pk0KL1ggrgamaSMHUBj7Na7bN_sq5Th64EA@mail.gmail.com>
In-Reply-To: <CACPK8XfZy3znvy1pk0KL1ggrgamaSMHUBj7Na7bN_sq5Th64EA@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 3 May 2019 15:11:21 -0700
Message-ID: <CADKL2t7sMP1UQcX56YAjcjhPTfOktfdGfCx2P2DX0M_2YoM3Ng@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.0] [PATCH v5] ARM: dts: aspeed: Adding Lenovo
 Hr630 BMC
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
Cc: Duke KH Du <dukh@lenovo.com>, Andrew Peng <pengms1@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Harry Sung1 <hsung1@lenovo.com>,
 Patrick Venture <venture@google.com>, Yonghui YH21 Liu <liuyh21@lenovo.com>,
 Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 12:59 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 25 Apr 2019 at 06:48, Andrew Peng <pengms1@lenovo.com> wrote:
> >
> > Initial introduction of Lenovo Hr630 family equipped with
> > Aspeed 2500 BMC SoC. Hr630 is a x86 server development kit
> > with a ASPEED ast2500 BMC manufactured by Lenovo.
> > Specifically, This adds the Hr630 platform device tree file
> > used by the Hr630 BMC machines.
>
> Thanks for your patch. I'll wait for acks from Benjamin and Patrick
> before applying. I've got a a few questions of my own below.
>
>
> >
> > This also adds an entry of Hr630 device tree file in Makefile
> >
> > Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> > Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
> > Signed-off-by: Lisa Liu <liuyj19@lenovo.com>

Once Joel's other comments are resolved:

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

> > ---
> > Changes in v5:
> >  - revise pca9545 and pca9546 switch aliases name.
> > Changes in v4:
> >  - add pca9546 switch aliases name.
> > Changes in v3:
> >  - revise i2c switch aliases name.
> > Changes in v2:
> >  - add i2c switch aliases name.
> >  - remove the unused eeprom device from DT file.
> >  - remove "Licensed under..." sentence.
> >
> >  arch/arm/boot/dts/Makefile                    |   3 +-
> >  arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts | 890 ++++++++++++++++++++++++++
> >  2 files changed, 892 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index bd40148..b5d32a0 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >         aspeed-bmc-opp-witherspoon.dtb \
> >         aspeed-bmc-opp-zaius.dtb \
> >         aspeed-bmc-portwell-neptune.dtb \
> > -       aspeed-bmc-quanta-q71l.dtb
> > +       aspeed-bmc-quanta-q71l.dtb \
> > +       aspeed-bmc-lenovo-hr630.dtb
>
> Sort alphabetically.
>
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> > new file mode 100644
> > index 0000000..4f18f4d
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> > @@ -0,0 +1,890 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Device Tree file for Lenovo Hr630 platform
> > + *
> > + * Copyright (C) 2019-present Lenovo
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "aspeed-g5.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +       model = "HR630 BMC";
> > +       compatible = "lenovo,hr630-bmc", "aspeed,ast2500";
> > +
> > +       aliases {
> > +               i2c14 = &i2c_rbp;
> > +               i2c15 = &i2c_fbp1;
> > +               i2c16 = &i2c_fbp2;
> > +               i2c17 = &i2c_fbp3;
> > +               i2c18 = &i2c_riser2;
> > +               i2c19 = &i2c_pcie4;
> > +               i2c20 = &i2c_riser1;
> > +               i2c21 = &i2c_ocp;
> > +       };
>
> > +               flash_memory: region@98000000 {
> > +                       no-map;
> > +                       reg = <0x98000000 0x00100000>; /* 1M */
>
> Do you use this feature of the driver? If it was there as a
> workaround, note that the driver no longer requires a memory region if
> you're just using it to turn the clocks on, or point to the flash
> device.

This feature will be used for in-band firmware update.

>
> > +               };
> > +
>
> > +/*
> > + * Enable port A as device (via the virtual hub) and port B as
> > + * host by default on the eval board. This can be easily changed
> > + * by replacing the override below with &ehci0 { ... } to enable
> > + * host on both ports.
> > + */
>
> This message is cut and pasted from the aspeed-ast2500-evb.dts. Does
> it also apply to your system?
