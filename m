Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 244FC14D753
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 09:11:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487Y2w5yVvzDqX2
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 19:11:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UUVTEv+X; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487Y243ngSzDqVx
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 19:10:31 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id i1so2643529oie.8
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 00:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivyioHS5Vow9bjAZHdOAM0nv42RRFqYJcagX8O7YF/A=;
 b=UUVTEv+XtF7H4O2AKbf14PpaY/yw0779emC+ap7jtCAulNYaUAoyfzY5ANs4neXKhg
 z3pXn+es6+7gQcWRh2CiNaEpQgY3/TycT0+oeDf54Bch3SP9zGuwZlPN7+d17xmMauqO
 ObyYWA+WvHbbJTaxMYewNG0OlUUByj3uGbgeVAEeJG29JnyVYdR8Yt08ASdQmk17uZ6j
 cJD2QnCd4FnGzicLQ5eOPHczXw0NJTL+8aMz3PoRJ2m5FOoIqiIWmC0OOF3JwzRSHp54
 FAM2ZCs6mVZRZ/bnKMBPFyvcWXiDWkSz2Bs5pyIYtLFDMu99yWGmKaeJs+4Tjh6zlLky
 ozOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivyioHS5Vow9bjAZHdOAM0nv42RRFqYJcagX8O7YF/A=;
 b=mVbOjlFLVPUqDYYJdbKxXHkNMFM6dGg+AJxExfattHdzBy/BH2PvRuEbGeQNNm+A4c
 EdgZCzE50co1Gbuzoz/DSf8mGuIJZmvwU3du3WBo4TbBMVE38Q9ObBJa8R3XVXCQUm8k
 ZO/E5EBdr8GGKmXcCpeKwhZyVf5E6qXv0h5DHZ7atyb+5kbPkeQO+HSq/Us+sHn52S6D
 konHWyuNlbi03OEJparVswywD0jHtC/PuYV/zbHk2/kbwo2JqwSK2mmb/NB7pGwrtpgU
 sA3BzWy7BwyrIs5B09CqIVdhgDBR3WvrWldjxZPMlWNSpaOqE7CZJ0wIlzomnzBey4XT
 B2DQ==
X-Gm-Message-State: APjAAAVjxHjCQ+LryGedL3fL3IREImcqazgzQux5Pn/6z9/cnTXAAUWd
 C3owd8ws24deCGtkwJHeQWYiL09C5/HpDxDyvyE=
X-Google-Smtp-Source: APXvYqyl5aTRUzR+17uPFUPan7Cdimid2RyjkhlL3D8hM8nizk4KjOZZjXlW1TvTPxr261UcXikg/t8wQDDGmkvUTkU=
X-Received: by 2002:aca:f2c5:: with SMTP id q188mr2117097oih.113.1580371826082; 
 Thu, 30 Jan 2020 00:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20200119110032.124745-1-tmaimon77@gmail.com>
 <20200119110032.124745-2-tmaimon77@gmail.com>
 <20200129200143.08bf4a91@archlinux>
In-Reply-To: <20200129200143.08bf4a91@archlinux>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 30 Jan 2020 10:20:30 +0200
Message-ID: <CAP6Zq1hupvQeXwynt02ePu6eL9X5oriNNwSmJEPqQWZBj770oA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: modify NPCM reset support
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000004e8a42059d56fda5"
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

--0000000000004e8a42059d56fda5
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

The patch replace reset ADC method from direct register access to using
reset driver (will applied next Linux version).
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20200130&id=9c81b2ccf82da6e995b63e945afa882cfaa03ca9


The ADC dt-binding modified as well to use the new reset method (approved
by Rob Herring)
https://www.spinics.net/lists/devicetree/msg331327.html

Indeed the this modification require DT modification as it described in the
ADC dt-binding commit, is it an issue? Do you thnk I should describe it in
the commit?

Thanks,

Tomer



On Wed, 29 Jan 2020 at 22:01, Jonathan Cameron <jic23@kernel.org> wrote:

> On Sun, 19 Jan 2020 13:00:32 +0200
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > Modify NPCM ADC reset support from
> > direct register access to reset controller support.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Hmm.  This presumably breaks all old DT.
>
> If that's not a problem please say why.
>
> Jonathan
>
> > ---
> >  drivers/iio/adc/npcm_adc.c | 30 +++++++++---------------------
> >  1 file changed, 9 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> > index a6170a37ebe8..83bad2d5575d 100644
> > --- a/drivers/iio/adc/npcm_adc.c
> > +++ b/drivers/iio/adc/npcm_adc.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/uaccess.h>
> > +#include <linux/reset.h>
> >
> >  struct npcm_adc {
> >       bool int_status;
> > @@ -23,13 +24,9 @@ struct npcm_adc {
> >       struct clk *adc_clk;
> >       wait_queue_head_t wq;
> >       struct regulator *vref;
> > -     struct regmap *rst_regmap;
> > +     struct reset_control *reset;
> >  };
> >
> > -/* NPCM7xx reset module */
> > -#define NPCM7XX_IPSRST1_OFFSET               0x020
> > -#define NPCM7XX_IPSRST1_ADC_RST              BIT(27)
> > -
> >  /* ADC registers */
> >  #define NPCM_ADCCON   0x00
> >  #define NPCM_ADCDATA  0x04
> > @@ -106,13 +103,11 @@ static int npcm_adc_read(struct npcm_adc *info,
> int *val, u8 channel)
> >                                              msecs_to_jiffies(10));
> >       if (ret == 0) {
> >               regtemp = ioread32(info->regs + NPCM_ADCCON);
> > -             if ((regtemp & NPCM_ADCCON_ADC_CONV) && info->rst_regmap) {
> > +             if (regtemp & NPCM_ADCCON_ADC_CONV) {
> >                       /* if conversion failed - reset ADC module */
> > -                     regmap_write(info->rst_regmap,
> NPCM7XX_IPSRST1_OFFSET,
> > -                                  NPCM7XX_IPSRST1_ADC_RST);
> > +                     reset_control_assert(info->reset);
> >                       msleep(100);
> > -                     regmap_write(info->rst_regmap,
> NPCM7XX_IPSRST1_OFFSET,
> > -                                  0x0);
> > +                     reset_control_deassert(info->reset);
> >                       msleep(100);
> >
> >                       /* Enable ADC and start conversion module */
> > @@ -186,7 +181,6 @@ static int npcm_adc_probe(struct platform_device
> *pdev)
> >       struct npcm_adc *info;
> >       struct iio_dev *indio_dev;
> >       struct device *dev = &pdev->dev;
> > -     struct device_node *np = pdev->dev.of_node;
> >
> >       indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
> >       if (!indio_dev)
> > @@ -199,6 +193,10 @@ static int npcm_adc_probe(struct platform_device
> *pdev)
> >       if (IS_ERR(info->regs))
> >               return PTR_ERR(info->regs);
> >
> > +     info->reset = devm_reset_control_get(&pdev->dev, NULL);
> > +     if (IS_ERR(info->reset))
> > +             return PTR_ERR(info->reset);
> > +
> >       info->adc_clk = devm_clk_get(&pdev->dev, NULL);
> >       if (IS_ERR(info->adc_clk)) {
> >               dev_warn(&pdev->dev, "ADC clock failed: can't read clk\n");
> > @@ -211,16 +209,6 @@ static int npcm_adc_probe(struct platform_device
> *pdev)
> >       div = div >> NPCM_ADCCON_DIV_SHIFT;
> >       info->adc_sample_hz = clk_get_rate(info->adc_clk) / ((div + 1) *
> 2);
> >
> > -     if (of_device_is_compatible(np, "nuvoton,npcm750-adc")) {
> > -             info->rst_regmap = syscon_regmap_lookup_by_compatible
> > -                     ("nuvoton,npcm750-rst");
> > -             if (IS_ERR(info->rst_regmap)) {
> > -                     dev_err(&pdev->dev, "Failed to find
> nuvoton,npcm750-rst\n");
> > -                     ret = PTR_ERR(info->rst_regmap);
> > -                     goto err_disable_clk;
> > -             }
> > -     }
> > -
> >       irq = platform_get_irq(pdev, 0);
> >       if (irq <= 0) {
> >               ret = -EINVAL;
>
>

--0000000000004e8a42059d56fda5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Jonathan,<div><br></div><div>The patch replace res=
et ADC method from direct register access to using reset driver (will appli=
ed next Linux version).</div><div><a href=3D"https://git.kernel.org/pub/scm=
/linux/kernel/git/next/linux-next-history.git/commit/?h=3Dnext-20200130&amp=
;id=3D9c81b2ccf82da6e995b63e945afa882cfaa03ca9">https://git.kernel.org/pub/=
scm/linux/kernel/git/next/linux-next-history.git/commit/?h=3Dnext-20200130&=
amp;id=3D9c81b2ccf82da6e995b63e945afa882cfaa03ca9</a>=C2=A0</div><div><br><=
/div><div>The ADC dt-binding modified as well to use the new reset method (=
approved by Rob Herring)</div><div><a href=3D"https://www.spinics.net/lists=
/devicetree/msg331327.html">https://www.spinics.net/lists/devicetree/msg331=
327.html</a></div><div><br></div><div>Indeed the this modification require =
DT modification as it described in the ADC dt-binding commit, is it an issu=
e? Do you thnk I should describe it in the commit?</div><div><br></div><div=
>Thanks,</div><div><br></div><div>Tomer</div><div><br></div><div>=C2=A0<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, 29 Jan 2020 at 22:01, Jonathan Cameron &lt;<a href=3D"mailto:=
jic23@kernel.org">jic23@kernel.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Sun, 19 Jan 2020 13:00:32 +0200<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Modify NPCM ADC reset support from<br>
&gt; direct register access to reset controller support.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
<br>
Hmm.=C2=A0 This presumably breaks all old DT. <br>
<br>
If that&#39;s not a problem please say why.<br>
<br>
Jonathan<br>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/iio/adc/npcm_adc.c | 30 +++++++++---------------------<b=
r>
&gt;=C2=A0 1 file changed, 9 insertions(+), 21 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c<b=
r>
&gt; index a6170a37ebe8..83bad2d5575d 100644<br>
&gt; --- a/drivers/iio/adc/npcm_adc.c<br>
&gt; +++ b/drivers/iio/adc/npcm_adc.c<br>
&gt; @@ -14,6 +14,7 @@<br>
&gt;=C2=A0 #include &lt;linux/regulator/consumer.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/spinlock.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/uaccess.h&gt;<br>
&gt; +#include &lt;linux/reset.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct npcm_adc {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool int_status;<br>
&gt; @@ -23,13 +24,9 @@ struct npcm_adc {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *adc_clk;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wait_queue_head_t wq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regulator *vref;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct regmap *rst_regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct reset_control *reset;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -/* NPCM7xx reset module */<br>
&gt; -#define NPCM7XX_IPSRST1_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x020<br>
&gt; -#define NPCM7XX_IPSRST1_ADC_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(27)<br>
&gt; -<br>
&gt;=C2=A0 /* ADC registers */<br>
&gt;=C2=A0 #define NPCM_ADCCON=C2=A0 =C2=A00x00<br>
&gt;=C2=A0 #define NPCM_ADCDATA=C2=A0 0x04<br>
&gt; @@ -106,13 +103,11 @@ static int npcm_adc_read(struct npcm_adc *info, =
int *val, u8 channel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 msecs_to_jiffies(10));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regtemp =3D iore=
ad32(info-&gt;regs + NPCM_ADCCON);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((regtemp &amp; NP=
CM_ADCCON_ADC_CONV) &amp;&amp; info-&gt;rst_regmap) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (regtemp &amp; NPC=
M_ADCCON_ADC_CONV) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* if conversion failed - reset ADC module */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0regmap_write(info-&gt;rst_regmap, NPCM7XX_IPSRST1_OFFSET,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_IPSRST1_ADC_RST);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reset_control_assert(info-&gt;reset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0msleep(100);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0regmap_write(info-&gt;rst_regmap, NPCM7XX_IPSRST1_OFFSET,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reset_control_deassert(info-&gt;reset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0msleep(100);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Enable ADC and start conversion module */<br>
&gt; @@ -186,7 +181,6 @@ static int npcm_adc_probe(struct platform_device *=
pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_adc *info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct iio_dev *indio_dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node;<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0indio_dev =3D devm_iio_device_alloc(&amp;pde=
v-&gt;dev, sizeof(*info));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!indio_dev)<br>
&gt; @@ -199,6 +193,10 @@ static int npcm_adc_probe(struct platform_device =
*pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;regs))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(i=
nfo-&gt;regs);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;reset =3D devm_reset_control_get(&amp;pd=
ev-&gt;dev, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;reset))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(info-&=
gt;reset);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;adc_clk =3D devm_clk_get(&amp;pdev-=
&gt;dev, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;adc_clk)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pd=
ev-&gt;dev, &quot;ADC clock failed: can&#39;t read clk\n&quot;);<br>
&gt; @@ -211,16 +209,6 @@ static int npcm_adc_probe(struct platform_device =
*pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D div &gt;&gt; NPCM_ADCCON_DIV_SHIFT;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;adc_sample_hz =3D clk_get_rate(info=
-&gt;adc_clk) / ((div + 1) * 2);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(np, &quot;nuvoton,npc=
m750-adc&quot;)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;rst_regmap =
=3D syscon_regmap_lookup_by_compatible<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(&quot;nuvoton,npcm750-rst&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(info-&gt;r=
st_regmap)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;Failed to find nuvoton,npcm750-rst\=
n&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D PTR_ERR(info-&gt;rst_regmap);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto err_disable_clk;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D platform_get_irq(pdev, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt;=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;=
<br>
<br>
</blockquote></div>

--0000000000004e8a42059d56fda5--
