Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB915699F
	for <lists+openbmc@lfdr.de>; Sun,  9 Feb 2020 09:13:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48FhcB6ZxkzDqVN
	for <lists+openbmc@lfdr.de>; Sun,  9 Feb 2020 19:12:58 +1100 (AEDT)
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
 header.s=20161025 header.b=n1QJ5vmU; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FhbY456bzDqTw
 for <openbmc@lists.ozlabs.org>; Sun,  9 Feb 2020 19:12:24 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id r27so3393204otc.8
 for <openbmc@lists.ozlabs.org>; Sun, 09 Feb 2020 00:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gtXa07P2FP6OHm3C6bjhyFx3ur+c65O64DMDF2vT4Eo=;
 b=n1QJ5vmUxqMsHxeVRzMW965oIXoocKY+6m1HChgTgcsQllmAVPLKVxrNsr4/p8Il2u
 yP/5WALhFovKJbzZ8K0txW6PEUSH1by0tyHbmr+AdvOQghxAx7/E/0X2TdpKndB0zKpd
 8rUradQmxkGvsyAs6B7ZjqXyD+89cXVnPc8qd8yREsjLM9AMit3QS9CguOzNUDnzxP37
 pSLtQyd4+AnxeCLnRcEYuUFZu2xP8M33M7N86b6roNfGhOHQea8nu7GXUqVj0qx/LLSJ
 jS6shhmOIY+UmEC+kvDQV+ZA0ldhy5Ebd0i2VKV4LndmktjbN8kDEVC2bzb24S+mbdvF
 mF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gtXa07P2FP6OHm3C6bjhyFx3ur+c65O64DMDF2vT4Eo=;
 b=jH3E3qO1fwX0AHzKFJgbGOmXe9wroPReRCmzvUwGth5AySndbhd7HSGUJ5P3FFGQnC
 atK1izaC77cyoWXykCtHtB1s7N5pevIx29/ptlM379QYl6h/0G0k8RfaSbaRl+6LTzC0
 +ryoxPcZVVbMdwwT/bBUX9E0ph4xYKBXeEDbQ+XY635qPcRauTgNZ++Y4j8Ya7KshjfJ
 vx7Kt4vvK5WLCWFiUM5gc48ORbdzIK/VG9dKeENHV6+awUunlp3CgWIYqb25xNMa7uD6
 GEFRSKzTOarJIGKpbdzFFU1miai+IAoPFyTBrBUE+CXM27/tPT9/9eSGwSFNfXdUrtvB
 PJLg==
X-Gm-Message-State: APjAAAXOXp/eeG0Q8REr3NYTx8OimaXIqj7OX6hn8YWXGx9E5GNl5N12
 NgBBkABRXwtT6kRyqKklaa8MqF7o89Aj+A5G5xs=
X-Google-Smtp-Source: APXvYqwMqWcB6qMvBoc9aB1AMEEXrFOBXDYpyzOJ8VU3fZG9IKpksM6zuLUZtOO5YTNJAyDaOIjo5QVBfG5xAISLoUQ=
X-Received: by 2002:a9d:64b:: with SMTP id 69mr5818846otn.237.1581235941145;
 Sun, 09 Feb 2020 00:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20200203150917.176391-1-tmaimon77@gmail.com>
 <20200203150917.176391-2-tmaimon77@gmail.com>
 <20200206114031.0f31538b@archlinux>
In-Reply-To: <20200206114031.0f31538b@archlinux>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 9 Feb 2020 10:22:22 +0200
Message-ID: <CAP6Zq1i3HDH9ycGZct-=kvhdqVy+KaeKY2abehVHSpC2zcOOag@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: modify NPCM reset support
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000009400cd059e202e1e"
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

--0000000000009400cd059e202e1e
Content-Type: text/plain; charset="UTF-8"

Great!

Thanks a lot Jonathan

On Thu, 6 Feb 2020 at 13:40, Jonathan Cameron <jic23@kernel.org> wrote:

> On Mon,  3 Feb 2020 17:09:17 +0200
> Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > Modify NPCM ADC reset support from
> > direct register access to reset controller support.
> >
> > please make sure to modify NPCM adc device tree
> > parameters as described at nuvoton,npcm-adc.txt
> > document for using this change.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Applied.  I added a note for anyone browsing the tree in future
> to say that we know this is a breaking change, but in this case
> close ecosystem etc so it's fine..
>
> I don't want others to point at your patch when I tell them no
> for similar changes in more generic parts!
>
> Thanks,
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

--0000000000009400cd059e202e1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great!<div><br></div><div>Thanks a lot Jonathan</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, 6 Feb 2020 at 13:40, Jonathan Cameron &lt;<a href=3D"mailto:jic23@kernel=
.org">jic23@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Mon,=C2=A0 3 Feb 2020 17:09:17 +0200<br>
Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">t=
maimon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Modify NPCM ADC reset support from<br>
&gt; direct register access to reset controller support.<br>
&gt; <br>
&gt; please make sure to modify NPCM adc device tree<br>
&gt; parameters as described at nuvoton,npcm-adc.txt<br>
&gt; document for using this change.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
<br>
Applied.=C2=A0 I added a note for anyone browsing the tree in future<br>
to say that we know this is a breaking change, but in this case<br>
close ecosystem etc so it&#39;s fine..<br>
<br>
I don&#39;t want others to point at your patch when I tell them no<br>
for similar changes in more generic parts!<br>
<br>
Thanks,<br>
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

--0000000000009400cd059e202e1e--
