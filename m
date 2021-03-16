Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216E33D227
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 11:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F095h1tPhz30Hn
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 21:49:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BoZi4kdB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BoZi4kdB; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F095S5C8fz303T
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 21:49:15 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id w125so9071828oib.13
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 03:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yD0cE5bvN+FnAqqbkJDg9Id8GxodZxuhuoRIUFrBVLU=;
 b=BoZi4kdB4EFR0q2rU7x6eqF/eKgsWm+fRwPxqKvU32hSq2xTDt+QsI1J0Ufofk4GvT
 fJyYhVNcSiG9gLM0v0nxJ+BM26vdUENmRlee7sxoQsLmBgCzUNz1ch+JQMkokVZ3z8oa
 /7uLMpWYMfZhiqa1kY2Gr17HGhy2vQWEOq51+VnqhcpPSC6UW6iIWOLYtHiXrIPzylrF
 4GGE70idkUZO7EAjG4EoZi1/4xG8Slm1ivsj2/uDXeo4k0pBExzSXI8RdfzTRmDjVlTC
 F8/2tD5tfr6hcc0pPtHfPDQ3GwBoR/8J36/aH4hK1MKV1JV7X1qfVID+Bn/xUxJTGdkz
 m6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yD0cE5bvN+FnAqqbkJDg9Id8GxodZxuhuoRIUFrBVLU=;
 b=J99CdEkOlOWhih5jFCsuwzvA9l6cOOAcUEl09U2me6yJ3D7Z1tjK6qgQ89+/EAkTmX
 /g9Kq0JJj+f+hbIklg/lLDTuAUGAXTWI6G5BCRD0n8BqH3H9hH2sOHT9iSbEJP8/gha4
 ihlJP9GBsZjbMIPOXAEJrlj8iiEVFh1/MoIlgnqmXRjdC4900ibg/JOSETO4hoAUYeYd
 q7+F+3BfSkynveh/QkhsL1e+9jop5GhfxL/R8LZf65VclHmTd1D61baxbY5Kf8vq56v7
 RkvQPl3zFPydyiT5yDejxBZmJ12/ulxwQIgW+iM8BCTecm6jvQoz34gDFpPDTxPpcLpK
 CXhw==
X-Gm-Message-State: AOAM531Z6J1eRS35mWB4kPd5BZir7DlaWYpdQSG6bTe4XQJVOCOuqdr8
 dPpE+Cu3+2L4v9NyV5yR3HaP7a7v7TccgsWVOfA=
X-Google-Smtp-Source: ABdhPJyPSqtpU3qrcjtRJZG+OwqLeOlzwodgNKACyxeS3pbrnwZ/MVGHvgxHmujludsPFL95tosae2pE44XNL7Jek0I=
X-Received: by 2002:a05:6808:1383:: with SMTP id
 c3mr2945326oiw.42.1615891752415; 
 Tue, 16 Mar 2021 03:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210313175321.2515675-1-j.neuschaefer@gmx.net>
 <20210315162338.GA973222@robh.at.kernel.org> <YE+dmdBBk0BZ7BIO@latitude>
In-Reply-To: <YE+dmdBBk0BZ7BIO@latitude>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Mar 2021 13:03:38 +0200
Message-ID: <CAP6Zq1hsmTQfA+EvRmJsK2UosV3YAeRqNxA+jRaeYUx5T-wE1A@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: arm: Convert nuvoton,
 npcm750 binding to YAML
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: multipart/alternative; boundary="000000000000e5f68d05bda51de7"
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
Cc: Rob Herring <robh@kernel.org>, Benjamin Fair <benjaminfair@google.com>,
 devicetree <devicetree@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e5f68d05bda51de7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Appreciate your help Jonathan and Rob,

Just seeing the following EVB device tree
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-ast2=
500-evb.dts#L8

And not a EVB board.
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-=
facebook-cmm.dts#L9

but still also option V2 is good for us.

Sorry it took that long.

Thanks a lot!

Tomer


On Mon, 15 Mar 2021 at 19:47, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et>
wrote:

> On Mon, Mar 15, 2021 at 10:23:38AM -0600, Rob Herring wrote:
> > On Sat, Mar 13, 2021 at 06:53:20PM +0100, Jonathan Neusch=C3=A4fer wrot=
e:
> > > The general trend is to have devicetree bindings in YAML format, to
> > > allow automatic validation of bindings and devicetrees.
> > >
> > > Convert the NPCM SoC family's binding to YAML before it accumulates
> more
> > > entries.
> > >
> > > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > > ---
> > >
> > > If someone else wants to be listed as the maintainer, please let me
> > > know.
> > >
> > >
> > > v3:
> > > - In this version, I removed the nuvoton,npcm750-evb compatible strin=
g
> > >   again. I had previously introduced it to simplify the binding a
> little
> > >   bit, but Tomer Maimon suggested to keep /compatible of
> > >   nuvoton-npcm750-evb.dts as-is (i.e. only use "nuvoton,npcm750", no
> > >   board-specific string).
> > >   Because of this change, I am not including Rob Herring's R-b tag.
> >
> > I think you should add nuvoton,npcm750-evb. Not so much for that board,
> > but to ensure any additional boards get a board specific compatible.
>
> I'm inclined to agree and go back to v2, but I'd like to hear Tomer
> Maimon's opinion first.
>
> > > v2:
> > > -
> https://lore.kernel.org/lkml/20210116010907.3475405-1-j.neuschaefer@gmx.n=
et/
> > >
> https://lore.kernel.org/lkml/20210303154622.3018839-1-j.neuschaefer@gmx.n=
et/
> > > - Fix indentation to satisfy yamllint
> > > - Fix $schema line
>
>
> Thanks,
> Jonathan Neusch=C3=A4fer
>

--000000000000e5f68d05bda51de7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Appreciate your help Jonathan and R=
ob,</div><div><br></div><div>Just seeing the following EVB device tree</div=
><div><div><a href=3D"https://github.com/torvalds/linux/blob/master/arch/ar=
m/boot/dts/aspeed-ast2500-evb.dts#L8" target=3D"_blank">https://github.com/=
torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-ast2500-evb.dts#L8</a><=
br></div><div><br></div></div><div>And not a EVB board.</div><div><a href=
=3D"https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-=
bmc-facebook-cmm.dts#L9">https://github.com/torvalds/linux/blob/master/arch=
/arm/boot/dts/aspeed-bmc-facebook-cmm.dts#L9</a><br></div><div><br></div><d=
iv>but still also option V2 is good for us.</div><div><br></div><div>Sorry =
it took that long.</div><div><br></div><div>Thanks a lot!</div><div><br></d=
iv><div>Tomer</div><div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 15 Mar 2021 at 19:47, Jonathan Ne=
usch=C3=A4fer &lt;<a href=3D"mailto:j.neuschaefer@gmx.net" target=3D"_blank=
">j.neuschaefer@gmx.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Mon, Mar 15, 2021 at 10:23:38AM -0600, Rob Herrin=
g wrote:<br>
&gt; On Sat, Mar 13, 2021 at 06:53:20PM +0100, Jonathan Neusch=C3=A4fer wro=
te:<br>
&gt; &gt; The general trend is to have devicetree bindings in YAML format, =
to<br>
&gt; &gt; allow automatic validation of bindings and devicetrees.<br>
&gt; &gt; <br>
&gt; &gt; Convert the NPCM SoC family&#39;s binding to YAML before it accum=
ulates more<br>
&gt; &gt; entries.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Jonathan Neusch=C3=A4fer &lt;<a href=3D"mailto:j.n=
euschaefer@gmx.net" target=3D"_blank">j.neuschaefer@gmx.net</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt; If someone else wants to be listed as the maintainer, please let =
me<br>
&gt; &gt; know.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; v3:<br>
&gt; &gt; - In this version, I removed the nuvoton,npcm750-evb compatible s=
tring<br>
&gt; &gt;=C2=A0 =C2=A0again. I had previously introduced it to simplify the=
 binding a little<br>
&gt; &gt;=C2=A0 =C2=A0bit, but Tomer Maimon suggested to keep /compatible o=
f<br>
&gt; &gt;=C2=A0 =C2=A0nuvoton-npcm750-evb.dts as-is (i.e. only use &quot;nu=
voton,npcm750&quot;, no<br>
&gt; &gt;=C2=A0 =C2=A0board-specific string).<br>
&gt; &gt;=C2=A0 =C2=A0Because of this change, I am not including Rob Herrin=
g&#39;s R-b tag.<br>
&gt; <br>
&gt; I think you should add nuvoton,npcm750-evb. Not so much for that board=
, <br>
&gt; but to ensure any additional boards get a board specific compatible.<b=
r>
<br>
I&#39;m inclined to agree and go back to v2, but I&#39;d like to hear Tomer=
<br>
Maimon&#39;s opinion first.<br>
<br>
&gt; &gt; v2:<br>
&gt; &gt; - <a href=3D"https://lore.kernel.org/lkml/20210116010907.3475405-=
1-j.neuschaefer@gmx.net/" rel=3D"noreferrer" target=3D"_blank">https://lore=
.kernel.org/lkml/20210116010907.3475405-1-j.neuschaefer@gmx.net/</a><br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/lkml/2021030315462=
2.3018839-1-j.neuschaefer@gmx.net/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/lkml/20210303154622.3018839-1-j.neuschaefer@gmx.net/<=
/a><br>
&gt; &gt; - Fix indentation to satisfy yamllint<br>
&gt; &gt; - Fix $schema line<br>
<br>
<br>
Thanks,<br>
Jonathan Neusch=C3=A4fer<br>
</blockquote></div>

--000000000000e5f68d05bda51de7--
