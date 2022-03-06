Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F24CEBBE
	for <lists+openbmc@lfdr.de>; Sun,  6 Mar 2022 14:34:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBMxg1Qq5z3bPT
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 00:33:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NohmSWC4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NohmSWC4; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBMxH2l2Bz2yLT
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2022 00:33:38 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id i5so12661410oih.1
 for <openbmc@lists.ozlabs.org>; Sun, 06 Mar 2022 05:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=84zYVdhVEYz/DpeTLBUQG62T/uOGmyKpKhrO1Fbvg7I=;
 b=NohmSWC4OEjiHkhDF6Lcv/x25mQGt907ddg07Bs1DnNkysr88Slp9jUQl3pM/Kyxgs
 9SQvkqBjvArdOAKWuF7pLILHebLgKTAfr2DUopl/yXhJnuQNmHTL47lqmzpG85otKJfh
 ulNd+36Y7+zBWk06U8ayPUNjIEJw+yXoO+xDBuWauiA5x/qz1RSRB4vL1gM4swAGlK8v
 nZXgFCZBAMhPCdhcwmkcpTeqm7wrPGSWmAGpq1Rt1d6K6WtJ9Yx7hGz8OabyGUhGNgLo
 KnlWxfwgl4ZUW8giIZSz9W4189dpDploGxbFuSg3fjSGFNtmpS+lZ0i3doLysd1He2wo
 bkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=84zYVdhVEYz/DpeTLBUQG62T/uOGmyKpKhrO1Fbvg7I=;
 b=R5MPfISuKmMsE1B/uf0lWQ5mSV+wL/jIWqKshxA/xaiQhdt2oVb46W196QAGcIt9Dw
 H33jmQNh+GaX7tVpORyOLNAZc0AgBWGu99uSGdbRl8HCp1dFu9k+/mqjTS9a5kjRkp8K
 YhR9BaHQV+nLlm2lyz3bfkM4Cs70tZJRwXZIq/FvLVlu0EHe57m9TNvl4XErW9UdMqDW
 Ug1hhZ9wZUA8yhyXsZWXo0eJpp0e1SfrQ4afShnacvrCztX7JotgblYBHQGzaxf56UO9
 Sgcn7ZG319ysrasryahzue4xHLzyAxpFn537pZB0vYjDWlyloPDPFCuGNKDsuHnmI2j2
 U2Fg==
X-Gm-Message-State: AOAM533CJuhxQGKfgRfquXt98FIJPxZJ1JREjv1/RUem0hjaElHRY1DG
 g5IvuboCyuQsFVAK7M5tlN9J3fba4MSCUR/qG0c=
X-Google-Smtp-Source: ABdhPJwJ4pGGcmxr1HHkVozxBMueJw+utiTjjluv8Sszw9/3eZpx1jduFX2Wk5tyzKESbCVz7/HZk6gSIDkdIs3kPic=
X-Received: by 2002:a05:6808:18a0:b0:2d9:bde3:5776 with SMTP id
 bi32-20020a05680818a000b002d9bde35776mr2190452oib.29.1646573611363; Sun, 06
 Mar 2022 05:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-12-warp5tw@gmail.com>
 <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
 <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
 <YiDMX7pUqs/rLJUU@smile.fi.intel.com>
In-Reply-To: <YiDMX7pUqs/rLJUU@smile.fi.intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 6 Mar 2022 15:33:20 +0200
Message-ID: <CAP6Zq1iy0yNMemqDjrLu1F0rrRSDFhZ+SqdoOa9FyJDNL0ENXA@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000033b23605d98ccbbc"
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
Cc: devicetree <devicetree@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, Tomer Maimon <tomer.maimon@nuvoton.com>,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, Arnd Bergmann <arnd@arndb.de>,
 sven@svenpeter.dev, Rob Herring <robh+dt@kernel.org>,
 Avi Fishman <Avi.Fishman@nuvoton.com>, Tyrone Ting <warp5tw@gmail.com>,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, jie.deng@intel.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000033b23605d98ccbbc
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for your review,

On Thu, 3 Mar 2022 at 16:11, Andy Shevchenko <
andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Mar 03, 2022 at 02:35:58PM +0200, Tali Perry wrote:
> > > On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko <
> andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Mar 03, 2022 at 04:31:41PM +0800, Tyrone Ting wrote:
>
> ...
>
> > > > > -     left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
> > > > > -                              ioread8(bus->reg +
> NPCM_I2CTXF_STS));
> > > > > +     left_in_fifo = (bus->data->txf_sts_tx_bytes &
> > > > > +                     ioread8(bus->reg + NPCM_I2CTXF_STS));
> > > >
> > > > Besides too many parentheses, this is an interesting change. So, in
> different
> > > > versions of IP the field is on different bits? Perhaps it means that
> you need
> > > > something like internal ops structure for all these, where you will
> have been
> > > > using the statically defined masks?
> > > >
> >
> > Those are two very similar modules. The first generation had a 16 bytes
> HW FIFO
> > and the second generation has 32 bytes.
> > In V1 of this patchset the masks were defined under
> > CONFIG but we were asked to change the approach:
> >
> > the entire discussion can be found here:
> >
> > https://www.spinics.net/lists/linux-i2c/msg55566.html
> >
> > Did we understand the request change right?
>
> Not really. If you have not simply "one (MSB) bit more" for FIFO size, then
> I proposed to create a specific operations structure and use callbacks (see
> drivers/dma/dw/ case for iDMA 32-bit vs. DesignWare).
>
> But hold on and read set of questions below.
>
> Previously it was a fixed field with the NPCM_I2CTXF_STS_TX_BYTES mask
> applied,
> right? From above I have got that FIFO is growing twice. Is it correct?
>

What do you mean by growing twice? TX and RX?


> Does the LSB stay at the same offset? What is the meaning of the MSB in 32
> byte
> case? If it's reserved then why not to always use 32 byte approach?
>

Yes, the LSB stays in the same place, and bit 5 is reserved in the NPCM7XX
SoC.
Unfortunately, the I2C test failed when we tried to use the 32 bytes
approach at NPCM7XX Soc, this is why we added NPCM_I2CTXF_STS_TX_BYTES and
NPCM_I2C_STSRXF_RX_BYTES to the data structure.

The device tree data structure pass data for each specific device, so I
don't understand why not use device tree data for supporting the I2C
specific device? this is not the case here?


> --
> With Best Regards,
> Andy Shevchenko
>
>
>
Best Regards,

Tomer Maimon

--00000000000033b23605d98ccbbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Andy,</div><div><br></div><div>Thanks for your rev=
iew,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, 3 Mar 2022 at 16:11, Andy Shevchenko &lt;<a href=3D"mailto:andr=
iy.shevchenko@linux.intel.com" target=3D"_blank">andriy.shevchenko@linux.in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Thu, Mar 03, 2022 at 02:35:58PM +0200, Tali Perry wrote:<br>
&gt; &gt; On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko &lt;<a href=3D"ma=
ilto:andriy.shevchenko@linux.intel.com" target=3D"_blank">andriy.shevchenko=
@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt; &gt; On Thu, Mar 03, 2022 at 04:31:41PM +0800, Tyrone Ting wrote:=
<br>
<br>
...<br>
<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0left_in_fifo =3D FIELD_GET(NPCM_I2=
CTXF_STS_TX_BYTES,<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ioread8(bus-&gt;reg + =
NPCM_I2CTXF_STS));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0left_in_fifo =3D (bus-&gt;data-&gt=
;txf_sts_tx_bytes &amp;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ioread8(bus-&gt;reg + NPCM_I2CTXF_STS));<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Besides too many parentheses, this is an interesting change.=
 So, in different<br>
&gt; &gt; &gt; versions of IP the field is on different bits? Perhaps it me=
ans that you need<br>
&gt; &gt; &gt; something like internal ops structure for all these, where y=
ou will have been<br>
&gt; &gt; &gt; using the statically defined masks?<br>
&gt; &gt; &gt;<br>
&gt; <br>
&gt; Those are two very similar modules. The first generation had a 16 byte=
s HW FIFO<br>
&gt; and the second generation has 32 bytes.<br>
&gt; In V1 of this patchset the masks were defined under<br>
&gt; CONFIG but we were asked to change the approach:<br>
&gt; <br>
&gt; the entire discussion can be found here:<br>
&gt; <br>
&gt; <a href=3D"https://www.spinics.net/lists/linux-i2c/msg55566.html" rel=
=3D"noreferrer" target=3D"_blank">https://www.spinics.net/lists/linux-i2c/m=
sg55566.html</a><br>
&gt; <br>
&gt; Did we understand the request change right?<br>
<br>
Not really. If you have not simply &quot;one (MSB) bit more&quot; for FIFO =
size, then<br>
I proposed to create a specific operations structure and use callbacks (see=
<br>
drivers/dma/dw/ case for iDMA 32-bit vs. DesignWare).<br>
<br>
But hold on and read set of questions below.<br>
<br>
Previously it was a fixed field with the NPCM_I2CTXF_STS_TX_BYTES mask appl=
ied,<br>
right? From above I have got that FIFO is growing twice. Is it correct?<br>=
</blockquote><div>=C2=A0</div><div>What do you mean by growing twice? TX an=
d RX?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Does the LSB stay at the same offset? What is the meaning of the MSB in 32 =
byte<br>
case? If it&#39;s reserved then why not to always use 32 byte approach?<br>=
</blockquote><div>=C2=A0</div><div>Yes, the LSB stays in the same place, an=
d bit 5 is reserved=C2=A0in the NPCM7XX SoC.</div><div>Unfortunately, the I=
2C test failed when we tried to use the 32 bytes approach at NPCM7XX Soc, t=
his is why we added NPCM_I2CTXF_STS_TX_BYTES and NPCM_I2C_STSRXF_RX_BYTES t=
o the data structure.</div><div><br></div><div>The device tree data struct<=
font face=3D"arial, sans-serif">ure=C2=A0<span style=3D"color:rgb(51,51,51)=
;font-variant-ligatures:none">pass=C2=A0data for each specific device, so=
=C2=A0</span></font>I don&#39;t understand=C2=A0why not use device tree dat=
a for supporting the I2C specific device?<font face=3D"arial, sans-serif"><=
span style=3D"color:rgb(51,51,51);font-variant-ligatures:none">=C2=A0this i=
s=C2=A0not the case here?</span></font></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
With Best Regards,<br>
Andy Shevchenko<br>
<br>
<br></blockquote><div><br></div><div>Best Regards,</div><div><br></div><div=
>Tomer Maimon=C2=A0</div></div></div>

--00000000000033b23605d98ccbbc--
