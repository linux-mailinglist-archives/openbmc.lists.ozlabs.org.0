Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B31448E7
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 01:27:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482R7X2Y56zDqQ4
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 11:27:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eCc0tJA5; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482R6p42CPzDqPk;
 Wed, 22 Jan 2020 11:26:55 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id e25so4243410qtr.13;
 Tue, 21 Jan 2020 16:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UwmgdlKgjHnFDwXPHQDLPIyA4oIjjd9BxxZ8z8xhCpA=;
 b=eCc0tJA5csuUZzPSGPdjWmMJX0rRaY8x9WRKXujplY35imBuATdPOK5iz8g1Nsg5FH
 ecVDPh3N20JD8aMFdZ2cIYpQHV5ER8GjbJ0Sba7wV3YjJhCTFkF0V8B/evkJfxeHEkJY
 vWsTo+LO6vMvczAfqBQyp81H/80DDDo7xQEYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UwmgdlKgjHnFDwXPHQDLPIyA4oIjjd9BxxZ8z8xhCpA=;
 b=dpLXSky3O1aT896TbWzt+7Ejxgem4MlMAbeYms/oo7GAEUaQf6zykvFA/VqRJeGJGi
 f9B9JFXvsY0bFkViqh2wkyKggGyhXORDfIrN3rRO34BdUki0kPYoSalrkUZM9u4QFyw9
 j3LBsMX42p2DT4KHl0IaGKmLkVa8dv49Yzcb9eAu6EqksL2GQrzNlfoxjuynazmY8Vmu
 OK4T31F5Vm3oKTaxhMRplfCkCFFPp+L1oBdagEp5yXQP6nut6L4ZNN0Ybbar0DV8u7S9
 r6eUDETIsYtACmDTzK5qz9aSi9ZAzjhfn2J/TPVCiTwsbPHPkP0qfnEkKfAHRev3F5NO
 ZzDQ==
X-Gm-Message-State: APjAAAVl0WTjnMfKxZbQSJT2f0QZgXCGDqVQ9wP5dwMnotkLEfc9oLpT
 8KMESv06NCA8S14tCAdG0Xc3XsLgXWUghfKc6ew=
X-Google-Smtp-Source: APXvYqwN5FQEcVX8mIhlSegiZeaAu5eJlYidrimv8ngT4f5S3vD71f0OFT/wRQkS6eo1g8RNHSwolhJUcxduZ04xsww=
X-Received: by 2002:ac8:1ac1:: with SMTP id h1mr820343qtk.255.1579652810173;
 Tue, 21 Jan 2020 16:26:50 -0800 (PST)
MIME-Version: 1.0
References: <1577350475-127530-1-git-send-email-pengms1@lenovo.com>
 <CACPK8XeY5dPHtRfFD55dLVHT0SF1gJEVf1DixsbJKpciLP2s5Q@mail.gmail.com>
 <85dc718f42f54d40ad50853c047ec3ae@lenovo.com>
In-Reply-To: <85dc718f42f54d40ad50853c047ec3ae@lenovo.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Jan 2020 00:26:38 +0000
Message-ID: <CACPK8XctO0SraKF_0Z40S_bBjz_ooQacpej3tMxwTq6XD90DGg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v1 1/1] ARM: dts: aspeed: update Hr855xg2
 device tree
To: Andrew MS1 Peng <pengms1@lenovo.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Harry Sung1 <hsung1@lenovo.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Derek Lin23 <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 9 Jan 2020 at 08:07, Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Joel,
>
> Please help to check below my comments. Thanks.
>
> Regards,
> Andrew Peng
>
> > -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Joel Stanley <joel@jms.id.au>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2020=E5=B9=B41=E6=9C=886=E6=97=A5=
 14:48
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> > =E6=8A=84=E9=80=81: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>; Andrew Jeffery <andrew@aj.id.au>; devicetree
> > <devicetree@vger.kernel.org>; Linux ARM
> > <linux-arm-kernel@lists.infradead.org>; linux-aspeed
> > <linux-aspeed@lists.ozlabs.org>; Linux Kernel Mailing List
> > <linux-kernel@vger.kernel.org>; Benjamin Fair <benjaminfair@google.com>=
;
> > OpenBMC Maillist <openbmc@lists.ozlabs.org>; Derek Lin23
> > <dlin23@lenovo.com>; Yonghui YH21 Liu <liuyh21@lenovo.com>
> > =E4=B8=BB=E9=A2=98: [External] Re: [PATCH v1 1/1] ARM: dts: aspeed: upd=
ate Hr855xg2
> > device tree
> >
> > On Thu, 26 Dec 2019 at 08:54, Andrew Peng <pengms1@lenovo.com> wrote:
> > >
> >
> > When you have a list of things like below, it's sometimes a good hint t=
hat you
> > should be sending one patch for each bullet point. This makes it easier=
 to
> > review.
> >
>
> Should I separate below changes to six patches for next patch version?
> For example: [PATCH v2 0/5]  [PATCH v2 1/5] ...etc

It's up to you.

I do not require it.

>
> > > Update i2c aliases.
> > > Change flash_memory mapping address and size.
> > > Add in a gpio-keys section.
> > > Enable vhub, vuart, spi1 and spi2.
> > > Add raa228006, ir38164 and sn1701022 hwmon sensors.
> > > Remove some unuse gpio from gpio section.
> >
> > unused?
> >
>
> It was my mistake, the correct sentence should be "Remove gpio from gpio =
section since it controlled by user space."
>
> > >
> > > Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> > > Signed-off-by: Derek Lin <dlin23@lenovo.com>
> > > Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
> >
> > I got two copies of this. I think they are the same.
> >
>
> I apologize to send twice.
>
> > > ---
> > > v1: initial version
> > >
> > >  arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts | 557
> > > ++++++++++++++++-------
> > >  1 file changed, 382 insertions(+), 175 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> > > b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> > > index 8193fad..e1386d4 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> > > @@ -15,14 +15,21 @@
> > >         compatible =3D "lenovo,hr855xg2-bmc", "aspeed,ast2500";
> > >
> >
> > > -               flash_memory: region@98000000 {
> > > +               flash_memory: region@9EFF0000 {
> > >                         no-map;
> > > -                       reg =3D <0x98000000 0x00100000>; /* 1M */
> > > +                       reg =3D <0x9EFF0000 0x00010000>; /* 64K */
> >
> > Do you really use 64K here, or was this a workaround for the lpc-ctlr d=
river
> > requiring a memory region?
> >
>
> We reserve 64K for L2A In-Band Firmware Update (phosphor-ipmi-flash).

Okay, thanks for clarifying.

I am happy with rest of your responses. Please send v2 with these things fi=
xed.

Cheers,

Joel
