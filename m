Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A71502D4
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2020 09:52:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B1m06r4RzDqM4
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2020 19:52:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZbtA2QYm; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B1gW2hYKzDqQV
 for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2020 19:48:07 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id i6so12873175otr.7
 for <openbmc@lists.ozlabs.org>; Mon, 03 Feb 2020 00:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8eDYOgp3/RHHA29yxfD+ENfVH6o7Vg+lmTRjCqqpAXA=;
 b=ZbtA2QYmBTDC6PjUtCgPPNnYxFCpGix7KbeWm2HMFUf49xNsxHBGNGD6tEmtPMlGN3
 6bMVrFvLjht0mL8EkDlFeYoipKJwJx0zcxDq0UMC1ivxXhTqETfpYrIJDmB8lV8lppo/
 Xnx4JEWWs9haJm7qjUerIZglsOd2vjw7Nz80TfnNBEluldiNtjLIfiSqHTk0995K3ZBa
 tD83gFV3xLur4eyV/qB5UDag7QFkxCUE9MPN1zz99fyaNp5NIAgkNuWn9xdssTUlVJv0
 0BRNF+DBShrlI54A7KJx60B4pHYYv0zhF9iLEhOrGeVbC0XeyKvWoYe1O1AcdHbR9UTv
 XScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8eDYOgp3/RHHA29yxfD+ENfVH6o7Vg+lmTRjCqqpAXA=;
 b=WQIvYl/wwaqvHK90CgdjINrvmDmiz1HKBG9DNw0ZpMhAN46NZsX6EEGd2DLRTrANzG
 YEJAmTPHiPAtMWZwp4e1TWZRFPOg8CPYhjmUkdaa5xtPx9HFV8XKoxuqgbu1N7+yRDkw
 ai35ba9SPEgM/mg+Y5wCBqQDVYYuTQhC7b4qjaETwtbO29u8tBp/undFdr/96Abi3eY6
 p+Tp+KkRDjKxGBEI69SsExwnf4Ciho7L3Ex/qhUchrri+8774Oc2VED+GXqds8fpf1Cq
 YUj/EdMfCuMf44t/PBy4cuilDdBlCncVqgzp2WgdtALPusy2J/moq7H5AzUM9os1S27b
 ikWA==
X-Gm-Message-State: APjAAAXZoqwkpEl+IUEuKA1Nu9gv4QnXLCp95MFiB/5VsF6+0dtZmd08
 aNXYGZG/xLWxGbQCKjD5MTKFml8Z8A9Ftcs/0gI=
X-Google-Smtp-Source: APXvYqzM4m7hoAtaDAtwRqkI6fdM1Y+YO7XRaCG2DU5n6dPJQJDzPGXllcIqeIiiQG8/2C+MBlNnUoG55spoUjevloc=
X-Received: by 2002:a9d:f45:: with SMTP id 63mr17698621ott.0.1580719683503;
 Mon, 03 Feb 2020 00:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20200119110032.124745-1-tmaimon77@gmail.com>
 <20200119110032.124745-2-tmaimon77@gmail.com>
 <20200129200143.08bf4a91@archlinux>
 <CAP6Zq1hupvQeXwynt02ePu6eL9X5oriNNwSmJEPqQWZBj770oA@mail.gmail.com>
 <20200202112815.66b4b119@archlinux>
In-Reply-To: <20200202112815.66b4b119@archlinux>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 3 Feb 2020 10:58:06 +0200
Message-ID: <CAP6Zq1ibyu1E0dK--bCuUd==R8BO+6_Va7jqg9Og9mm8C01-AA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: modify NPCM reset support
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000398a72059da7fb42"
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
 devicetree <devicetree@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000398a72059da7fb42
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thanks for the clarification,


On Sun, 2 Feb 2020 at 13:28, Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu, 30 Jan 2020 10:20:30 +0200
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > Hi Jonathan,
> >
> > The patch replace reset ADC method from direct register access to using
> > reset driver (will applied next Linux version).
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20200130&id=9c81b2ccf82da6e995b63e945afa882cfaa03ca9
> >
> >
> > The ADC dt-binding modified as well to use the new reset method (approved
> > by Rob Herring)
> > https://www.spinics.net/lists/devicetree/msg331327.html
> >
> > Indeed the this modification require DT modification as it described in
> the
> > ADC dt-binding commit, is it an issue? Do you thnk I should describe it
> in
> > the commit?
>
> Whether it is an issue depends on nuvoton business model.  Can they ensure
> that all places the kernel is changed will also have appropriate dt
> updates?

Yes,  we can ensure it in this development stage.


>
If not, you need to make the code continue to function without the change
> (fall back to old methods).  If they do have enough control to ensure it
> won't
> break any systems out in the wild, then just add a note to say that is the
> case to the commit message.
>
I will modify the commit message as you suggested.

Reasons this sort of thing is sometimes safe include:
> * preproduction part so no users outside of people who will expect
> potential breakage
> * dt and new kernel images only distributed in a firmware package, or
> where build script used to build the firmware package will ensure they
> match (this is a bmc chip I think, so I guess not many people build their
> own
> kernels except via scripting to package everything up as a firmware image
> of some type?)
>
As far as I know only the server developers are creating new firmwares and
they are aware to our modifications.

>
> Thanks,
>
> Jonathan

>
> > Thanks,
> >
> > Tomer
> >
> >
> >
> > On Wed, 29 Jan 2020 at 22:01, Jonathan Cameron <jic23@kernel.org> wrote:
> >
> > > On Sun, 19 Jan 2020 13:00:32 +0200
> > > Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >
> > > > Modify NPCM ADC reset support from
> > > > direct register access to reset controller support.
> > > >
> > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > >
> > > Hmm.  This presumably breaks all old DT.
> > >
> > > If that's not a problem please say why.
> > >
> > > Jonathan
> > >
> > > > ---
> > > >  drivers/iio/adc/npcm_adc.c | 30 +++++++++---------------------
> > > >  1 file changed, 9 insertions(+), 21 deletions(-)
> > > >
> > > > diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> > > > index a6170a37ebe8..83bad2d5575d 100644
> > > > --- a/drivers/iio/adc/npcm_adc.c
> > > > +++ b/drivers/iio/adc/npcm_adc.c
> > > > @@ -14,6 +14,7 @@
> > > >  #include <linux/regulator/consumer.h>
> > > >  #include <linux/spinlock.h>
> > > >  #include <linux/uaccess.h>
> > > > +#include <linux/reset.h>
> > > >
> > > >  struct npcm_adc {
> > > >       bool int_status;
> > > > @@ -23,13 +24,9 @@ struct npcm_adc {
> > > >       struct clk *adc_clk;
> > > >       wait_queue_head_t wq;
> > > >       struct regulator *vref;
> > > > -     struct regmap *rst_regmap;
> > > > +     struct reset_control *reset;
> > > >  };
> > > >
> > > > -/* NPCM7xx reset module */
> > > > -#define NPCM7XX_IPSRST1_OFFSET               0x020
> > > > -#define NPCM7XX_IPSRST1_ADC_RST              BIT(27)
> > > > -
> > > >  /* ADC registers */
> > > >  #define NPCM_ADCCON   0x00
> > > >  #define NPCM_ADCDATA  0x04
> > > > @@ -106,13 +103,11 @@ static int npcm_adc_read(struct npcm_adc
> *info,
> > > int *val, u8 channel)
> > > >                                              msecs_to_jiffies(10));
> > > >       if (ret == 0) {
> > > >               regtemp = ioread32(info->regs + NPCM_ADCCON);
> > > > -             if ((regtemp & NPCM_ADCCON_ADC_CONV) &&
> info->rst_regmap) {
> > > > +             if (regtemp & NPCM_ADCCON_ADC_CONV) {
> > > >                       /* if conversion failed - reset ADC module */
> > > > -                     regmap_write(info->rst_regmap,
> > > NPCM7XX_IPSRST1_OFFSET,
> > > > -                                  NPCM7XX_IPSRST1_ADC_RST);
> > > > +                     reset_control_assert(info->reset);
> > > >                       msleep(100);
> > > > -                     regmap_write(info->rst_regmap,
> > > NPCM7XX_IPSRST1_OFFSET,
> > > > -                                  0x0);
> > > > +                     reset_control_deassert(info->reset);
> > > >                       msleep(100);
> > > >
> > > >                       /* Enable ADC and start conversion module */
> > > > @@ -186,7 +181,6 @@ static int npcm_adc_probe(struct
> platform_device
> > > *pdev)
> > > >       struct npcm_adc *info;
> > > >       struct iio_dev *indio_dev;
> > > >       struct device *dev = &pdev->dev;
> > > > -     struct device_node *np = pdev->dev.of_node;
> > > >
> > > >       indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> > > >       if (!indio_dev)
> > > > @@ -199,6 +193,10 @@ static int npcm_adc_probe(struct
> platform_device
> > > *pdev)
> > > >       if (IS_ERR(info->regs))
> > > >               return PTR_ERR(info->regs);
> > > >
> > > > +     info->reset = devm_reset_control_get(&pdev->dev, NULL);
> > > > +     if (IS_ERR(info->reset))
> > > > +             return PTR_ERR(info->reset);
> > > > +
> > > >       info->adc_clk = devm_clk_get(&pdev->dev, NULL);
> > > >       if (IS_ERR(info->adc_clk)) {
> > > >               dev_warn(&pdev->dev, "ADC clock failed: can't read
> clk\n");
> > > > @@ -211,16 +209,6 @@ static int npcm_adc_probe(struct
> platform_device
> > > *pdev)
> > > >       div = div >> NPCM_ADCCON_DIV_SHIFT;
> > > >       info->adc_sample_hz = clk_get_rate(info->adc_clk) / ((div + 1)
> *
> > > 2);
> > > >
> > > > -     if (of_device_is_compatible(np, "nuvoton,npcm750-adc")) {
> > > > -             info->rst_regmap = syscon_regmap_lookup_by_compatible
> > > > -                     ("nuvoton,npcm750-rst");
> > > > -             if (IS_ERR(info->rst_regmap)) {
> > > > -                     dev_err(&pdev->dev, "Failed to find
> > > nuvoton,npcm750-rst\n");
> > > > -                     ret = PTR_ERR(info->rst_regmap);
> > > > -                     goto err_disable_clk;
> > > > -             }
> > > > -     }
> > > > -
> > > >       irq = platform_get_irq(pdev, 0);
> > > >       if (irq <= 0) {
> > > >               ret = -EINVAL;
> > >
> > >
>
>
Thanks a lot,

Tomer

--000000000000398a72059da7fb42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jonathan,<div><br></div><div>Thanks fo=
r the clarification,</div><div><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 2 Feb 2020 at 13:28, Jonat=
han Cameron &lt;<a href=3D"mailto:jic23@kernel.org">jic23@kernel.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu,=
 30 Jan 2020 10:20:30 +0200<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi Jonathan,<br>
&gt; <br>
&gt; The patch replace reset ADC method from direct register access to usin=
g<br>
&gt; reset driver (will applied next Linux version).<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next-history.git/commit/?h=3Dnext-20200130&amp;id=3D9c81b2ccf82da6e995b63e9=
45afa882cfaa03ca9" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.=
org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=3Dnext-2=
0200130&amp;id=3D9c81b2ccf82da6e995b63e945afa882cfaa03ca9</a><br>
&gt; <br>
&gt; <br>
&gt; The ADC dt-binding modified as well to use the new reset method (appro=
ved<br>
&gt; by Rob Herring)<br>
&gt; <a href=3D"https://www.spinics.net/lists/devicetree/msg331327.html" re=
l=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/devicetree=
/msg331327.html</a><br>
&gt; <br>
&gt; Indeed the this modification require DT modification as it described i=
n the<br>
&gt; ADC dt-binding commit, is it an issue? Do you thnk I should describe i=
t in<br>
&gt; the commit?<br>
<br>
Whether it is an issue depends on nuvoton business model.=C2=A0 Can they en=
sure<br>
that all places the kernel is changed will also have appropriate dt updates=
?</blockquote><div>Yes,=C2=A0 we can ensure it in this development stage.=
=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
If not, you need to make the code continue to function without the change<b=
r>
(fall back to old methods).=C2=A0 If they do have enough control to ensure =
it won&#39;t<br>
break any systems out in the wild, then just add a note to say that is the<=
br>
case to the commit message.<br></blockquote><div>I will modify the commit m=
essage as you suggested.=C2=A0</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
Reasons this sort of thing is sometimes safe include:<br>
* preproduction part so no users outside of people who will expect<br>
potential breakage<br>
* dt and new kernel images only distributed in a firmware package, or<br>
where build script used to build the firmware package will ensure they<br>
match (this is a bmc chip I think, so I guess not many people build their o=
wn<br>
kernels except via scripting to package everything up as a firmware image<b=
r>
of some type?)<br></blockquote><div>As far as I know only the server develo=
pers are creating new firmwares and they are aware to our modifications.=C2=
=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
Jonathan=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Tomer<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Wed, 29 Jan 2020 at 22:01, Jonathan Cameron &lt;<a href=3D"mailto:j=
ic23@kernel.org" target=3D"_blank">jic23@kernel.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Sun, 19 Jan 2020 13:00:32 +0200<br>
&gt; &gt; Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D=
"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; Modify NPCM ADC reset support from<br>
&gt; &gt; &gt; direct register access to reset controller support.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@=
gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt;=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; Hmm.=C2=A0 This presumably breaks all old DT.<br>
&gt; &gt;<br>
&gt; &gt; If that&#39;s not a problem please say why.<br>
&gt; &gt;<br>
&gt; &gt; Jonathan<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/iio/adc/npcm_adc.c | 30 +++++++++-------------=
--------<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 9 insertions(+), 21 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/np=
cm_adc.c<br>
&gt; &gt; &gt; index a6170a37ebe8..83bad2d5575d 100644<br>
&gt; &gt; &gt; --- a/drivers/iio/adc/npcm_adc.c<br>
&gt; &gt; &gt; +++ b/drivers/iio/adc/npcm_adc.c<br>
&gt; &gt; &gt; @@ -14,6 +14,7 @@<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/regulator/consumer.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/spinlock.h&gt;<br>
&gt; &gt; &gt;=C2=A0 #include &lt;linux/uaccess.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/reset.h&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 struct npcm_adc {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool int_status;<br>
&gt; &gt; &gt; @@ -23,13 +24,9 @@ struct npcm_adc {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *adc_clk;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wait_queue_head_t wq;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regulator *vref;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct regmap *rst_regmap;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct reset_control *reset;<br>
&gt; &gt; &gt;=C2=A0 };<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -/* NPCM7xx reset module */<br>
&gt; &gt; &gt; -#define NPCM7XX_IPSRST1_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x020<br>
&gt; &gt; &gt; -#define NPCM7XX_IPSRST1_ADC_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 BIT(27)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt;=C2=A0 /* ADC registers */<br>
&gt; &gt; &gt;=C2=A0 #define NPCM_ADCCON=C2=A0 =C2=A00x00<br>
&gt; &gt; &gt;=C2=A0 #define NPCM_ADCDATA=C2=A0 0x04<br>
&gt; &gt; &gt; @@ -106,13 +103,11 @@ static int npcm_adc_read(struct npcm_a=
dc *info,=C2=A0 <br>
&gt; &gt; int *val, u8 channel)=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 msecs_to_jiffies(10));<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regtem=
p =3D ioread32(info-&gt;regs + NPCM_ADCCON);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((regtem=
p &amp; NPCM_ADCCON_ADC_CONV) &amp;&amp; info-&gt;rst_regmap) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (regtemp=
 &amp; NPCM_ADCCON_ADC_CONV) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* if conversion failed - reset ADC module */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0regmap_write(info-&gt;rst_regmap,=C2=A0 <br>
&gt; &gt; NPCM7XX_IPSRST1_OFFSET,=C2=A0 <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_IPSRST1=
_ADC_RST);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0reset_control_assert(info-&gt;reset);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msleep(100);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0regmap_write(info-&gt;rst_regmap,=C2=A0 <br>
&gt; &gt; NPCM7XX_IPSRST1_OFFSET,=C2=A0 <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0reset_control_deassert(info-&gt;reset);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msleep(100);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Enable ADC and start conversion module */<br>
&gt; &gt; &gt; @@ -186,7 +181,6 @@ static int npcm_adc_probe(struct platfor=
m_device=C2=A0 <br>
&gt; &gt; *pdev)=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_adc *info;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&=
gt;dev;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev=
.of_node;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev =3D devm_iio_device_allo=
c(&amp;pdev-&gt;dev, sizeof(*info));<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!indio_dev)<br>
&gt; &gt; &gt; @@ -199,6 +193,10 @@ static int npcm_adc_probe(struct platfo=
rm_device=C2=A0 <br>
&gt; &gt; *pdev)=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;regs))<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 PTR_ERR(info-&gt;regs);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;reset =3D devm_reset_control_g=
et(&amp;pdev-&gt;dev, NULL);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;reset))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_=
ERR(info-&gt;reset);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;adc_clk =3D devm_clk_get(=
&amp;pdev-&gt;dev, NULL);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;adc_clk)) {<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_wa=
rn(&amp;pdev-&gt;dev, &quot;ADC clock failed: can&#39;t read clk\n&quot;);<=
br>
&gt; &gt; &gt; @@ -211,16 +209,6 @@ static int npcm_adc_probe(struct platfo=
rm_device=C2=A0 <br>
&gt; &gt; *pdev)=C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D div &gt;&gt; NPCM_ADCCON_D=
IV_SHIFT;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;adc_sample_hz =3D clk_get=
_rate(info-&gt;adc_clk) / ((div + 1) *=C2=A0 <br>
&gt; &gt; 2);=C2=A0 <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(np, &quot;n=
uvoton,npcm750-adc&quot;)) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;rs=
t_regmap =3D syscon_regmap_lookup_by_compatible<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(&quot;nuvoton,npcm750-rst&quot;);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(=
info-&gt;rst_regmap)) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;Failed to find=C2=A0 <br>
&gt; &gt; nuvoton,npcm750-rst\n&quot;);=C2=A0 <br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(info-&gt;rst_regmap);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto err_disable_clk;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D platform_get_irq(pdev, 0);=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt;=3D 0) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D -EINVAL;=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 <br>
<br></blockquote><div><br></div><div>Thanks a lot,</div><div><br></div><div=
>Tomer=C2=A0</div></div></div>

--000000000000398a72059da7fb42--
