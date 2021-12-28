Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F154807B0
	for <lists+openbmc@lfdr.de>; Tue, 28 Dec 2021 10:16:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNTSK3FVyz2yxm
	for <lists+openbmc@lfdr.de>; Tue, 28 Dec 2021 20:16:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gME9jCez;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gME9jCez; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNTRx0D5rz2xDC
 for <openbmc@lists.ozlabs.org>; Tue, 28 Dec 2021 20:16:28 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id
 45-20020a9d0a30000000b0058f1a6df088so23707754otg.4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Dec 2021 01:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iXn4BfRtMYWAm1Q/nwNGe3lMfKYcPSKtLvfiCQ/KKU4=;
 b=gME9jCezNa75fYUBtMpekJR2/GISRwuWGzc4zSPUP0Q/kdgFwfKqMRPzLiInvg718A
 kJaBftJSSnr0XtKrJ6CmWVgENaYgFJoBtN0snJsYWXPBitxTC8ErQXNI/CFBoOuyku9E
 38Lsv4xCms3zNcqW6VwWRvMKvlsuFtB010YZbAEVWmyMW6DbcDzW9eOgRpg9z6nC2hF7
 qRHohuuSKSP+z1ircBcR/c8+jOECQESuPBW4x5zwUwu2zy6KYroKTaBQfj2JDfuBoUYS
 H10rTrXfUm6wU3nHnujUjDv8VApmD9/+NQr5sz4l7pJf7ldomgNT1V5BPhmAfsPP3saC
 AOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iXn4BfRtMYWAm1Q/nwNGe3lMfKYcPSKtLvfiCQ/KKU4=;
 b=mI8tM+yzOLCAjnMmZAr52cUTAgo0P1eAFwjTENOaUGHvVSp+A02y8ihi+ihDl9qoGu
 7RzqMYRs4vsT2KK2v0fk2Z8nanA4WybrEL9heWldn2abnSR6gs0OOPCt4k9Jm58+cJTw
 9p3ZwMCrHONi/7AOYnQE0MZ9cuH0wqN+nVHlsDF7L0CFVlPXZz4gEYMSRcCzgp+8geiK
 +8LbiXbiYpgKK1Q3i5Sh7WReBVylmuwVUbl1xqB7p88EXHJzbbYtBBacB0Df8dfFw15Y
 vV8r0LW27yrma756zrsMSvHrK4uSfWTwu+luvB4y589LVD2RHS1ElDiCqS9viMTH/2kv
 CpWw==
X-Gm-Message-State: AOAM530uUwO7/5d47KTw7hc2/0WiMJtPLz7umpKy3C1TUy5+U327gVi/
 6rzcvOyreuuQxnLscz1ZMLD2v/aUz1/3rsClKzc=
X-Google-Smtp-Source: ABdhPJzKv8WZor62tlDXxoQHVbJYca5vcfCRFVW+qF6LHDk+fFWnVGHwWoRskJ55EOuS9xbogQEbpY+xFDh0zlKe0Gc=
X-Received: by 2002:a05:6830:1445:: with SMTP id
 w5mr14718627otp.112.1640682985831; 
 Tue, 28 Dec 2021 01:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
 <20211222092319.2988568-3-troy_lee@aspeedtech.com>
 <bcf4643c-6c62-c2c4-76db-7649e9e95225@kaod.org>
In-Reply-To: <bcf4643c-6c62-c2c4-76db-7649e9e95225@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 28 Dec 2021 17:16:19 +0800
Message-ID: <CAN9Jwz1pqwv4ATH-qX9fxqVYYwDd2BcRve+p_rCDo=pNbavwcg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hw/arm/aspeed_ast2600: create i3c instance
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 23, 2021 at 9:54 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/22/21 10:23, Troy Lee wrote:
> > This patch includes i3c instance in ast2600 soc.
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>
> Looks good but it is based on the QEMU aspeed branch for OpenBMC.
> You should rebase on upstream.
>
> Thanks,
>
> C.
>
Will do.

Thanks,
Troy Lee

> > ---
> >   hw/arm/aspeed_ast2600.c     | 12 ++++++++++++
> >   include/hw/arm/aspeed_soc.h |  3 +++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index f2fef9d706..219b025bc2 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -63,6 +63,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
> >       [ASPEED_DEV_VUART]     =3D 0x1E787000,
> >       [ASPEED_DEV_FSI1]      =3D 0x1E79B000,
> >       [ASPEED_DEV_FSI2]      =3D 0x1E79B100,
> > +    [ASPEED_DEV_I3C]       =3D 0x1E7A0000,
> >       [ASPEED_DEV_SDRAM]     =3D 0x80000000,
> >   };
> >
> > @@ -112,6 +113,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
> >       [ASPEED_DEV_FSI1]      =3D 100,
> >       [ASPEED_DEV_FSI2]      =3D 101,
> >       [ASPEED_DEV_DP]        =3D 62,
> > +    [ASPEED_DEV_I3C]       =3D 102,   /* 102 -> 107 */
> >   };
> >
> >   static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
> > @@ -230,6 +232,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
> >
> >       object_initialize_child(obj, "pwm", &s->pwm, TYPE_ASPEED_PWM);
> >
> > +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
> > +
> >       object_initialize_child(obj, "fsi[*]", &s->fsi[0], TYPE_ASPEED_AP=
B2OPB);
> >   }
> >
> > @@ -542,6 +546,14 @@ static void aspeed_soc_ast2600_realize(DeviceState=
 *dev, Error **errp)
> >       sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm), 0,
> >                          aspeed_soc_get_irq(s, ASPEED_DEV_PWM));
> >
> > +    /* I3C */
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> > +        return;
> > +    }
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_=
I3C]);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
> > +                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));
> > +
> >       /* FSI */
> >       if (!sysbus_realize(SYS_BUS_DEVICE(&s->fsi[0]), errp)) {
> >           return;
> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index 0db200d813..0c950fab3c 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -21,6 +21,7 @@
> >   #include "hw/timer/aspeed_timer.h"
> >   #include "hw/rtc/aspeed_rtc.h"
> >   #include "hw/i2c/aspeed_i2c.h"
> > +#include "hw/misc/aspeed_i3c.h"
> >   #include "hw/ssi/aspeed_smc.h"
> >   #include "hw/misc/aspeed_hace.h"
> >   #include "hw/watchdog/wdt_aspeed.h"
> > @@ -53,6 +54,7 @@ struct AspeedSoCState {
> >       AspeedRtcState rtc;
> >       AspeedTimerCtrlState timerctrl;
> >       AspeedI2CState i2c;
> > +    AspeedI3CState i3c;
> >       AspeedSCUState scu;
> >       AspeedHACEState hace;
> >       AspeedXDMAState xdma;
> > @@ -148,6 +150,7 @@ enum {
> >       ASPEED_DEV_FSI2,
> >       ASPEED_DEV_DPMCU,
> >       ASPEED_DEV_DP,
> > +    ASPEED_DEV_I3C,
> >   };
> >
> >   #endif /* ASPEED_SOC_H */
> >
>
