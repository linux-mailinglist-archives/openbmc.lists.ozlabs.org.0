Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 957C62FCCA7
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 09:26:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLJWs2zBYzDqwv
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 19:26:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I1NGDIss; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLJVl0WHpzDqnv
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 19:25:16 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id d1so2122766otl.13
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 00:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=onk+FhGxS84839WoWzEAFxdWlabZFNzqJATwCQcnbag=;
 b=I1NGDIssrYDsubK9+WFxAx68Rbji3eC/ne1Z7rjCEO8q6VEq11i3ozcHlxXKN/mkDI
 VkIM+ghffU5gH52BeMpaZF8Pej9H+dPhP31rUuUS5rcP7NhALifeiGydaJOYqV7AR7oZ
 nsw6YubG0okCw2ex+VKB3dj32e0+Wl5czDDROq8w6Iki1IJ874QMriCya4BjQnYeAm8r
 ASHc1MIW+OHFMW4GZMU87R0XWU/UAePEJjTsKpE1/KVwyCecKC2AcEziQBlW9EWOKrJo
 cAVlmjJNJSZWInV/IJeOGJOjLoBzhwU4CVTWxk4ap8lmLg/Ubm8y26jDySeIH3n4otQP
 CPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=onk+FhGxS84839WoWzEAFxdWlabZFNzqJATwCQcnbag=;
 b=aTX8ebYnyprRMCFtDqEzSWaoWs2hWnY7fPTBwQ/e9EvTW24DxdDmKxNhUB1P5rzNee
 X0SCDVoWVuXvJWRqjzoH99nn49A0gvkj8aStt0duP9YQVAB2tZdf9qpNvg9qV0bmtIe1
 bjD1uj8TJFZaGIHauHgZgvqVXyHI0a04tCr0eJ+ThX+5PCaUNAPYmq+JH5UPwGcTYmcD
 fqMy0RrLbqcchZx39tx5whE0xlgHRHu8TqdyaJLRX3xFgA+Su+YhZEy742rwYU8e4SR1
 /EicNB+JVBMnS374gBvNV0i5squoy3NuIH8+6YDXaGKL7/120TcKLKIvxleqzr4izgAR
 766g==
X-Gm-Message-State: AOAM532v0Fgk2UYXpLckqGALUCkoRsKP6GO4S0vImPj4hq/rWw3/k6w8
 nxYMBT3fxvd3vHMnJKJ8S8QulgXETA+65/1xme0=
X-Google-Smtp-Source: ABdhPJzWmhdMBk6mPxvC3VnrbzWLaWNjgRjuS329R3BdgR5x2YdGdZjcjrXU0ZTJ6B8kvFtiJt1fOl78sjrjTOUS9RA=
X-Received: by 2002:a9d:d85:: with SMTP id 5mr6266669ots.24.1611131113338;
 Wed, 20 Jan 2021 00:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20210119223412.223492-1-tmaimon77@gmail.com>
 <20210119223412.223492-4-tmaimon77@gmail.com>
 <CACPK8XeXRNWeWwv8bWr-k8aHH_fqf1kpG5EN4kXMJbbOsp7iAA@mail.gmail.com>
In-Reply-To: <CACPK8XeXRNWeWwv8bWr-k8aHH_fqf1kpG5EN4kXMJbbOsp7iAA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 20 Jan 2021 10:38:50 +0200
Message-ID: <CAP6Zq1hssJ-JQp6QEz3V9XevU1KL-AjT0F_oLBcCz=9y6ATg3g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v1 3/4] arm: dts: Olympus: Enable PECI dimm
 temperature
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000b27ae305b950b158"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b27ae305b950b158
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Jan 2021 at 00:47, Joel Stanley <joel@jms.id.au> wrote:

> On Tue, 19 Jan 2021 at 22:34, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Enable PECI dimm temperature nodes in Olympus
> > Quanta machine.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> > index 1692bb7314c5..de34c9b2ff2c 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> > @@ -910,10 +910,12 @@
> >         intel-peci-dimmtemp@30 {
> >                 compatible = "intel,peci-client";
> >                 reg = <0x30>;
> > +               status = "okay";
>
> Nodes are enabled by default, you shouldn't need to add "okay" for it
> to work. Can you confirm it works without adding this?
>
> Yes you right.

is working fine without "okay"


>
> >         };
> >         intel-peci-dimmtemp@31 {
> >                 compatible = "intel,peci-client";
> >                 reg = <0x31>;
> > +               status = "okay";
> >         };
> >  };
> >
> > --
> > 2.22.0
> >
>

Cheers,

Tomer

--000000000000b27ae305b950b158
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20 Jan 2021 at 00:47, Joel St=
anley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 19 Jan 20=
21 at 22:34, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=
=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Enable PECI dimm temperature nodes in Olympus<br>
&gt; Quanta machine.<br>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts b/ar=
ch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts<br>
&gt; index 1692bb7314c5..de34c9b2ff2c 100644<br>
&gt; --- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts<br>
&gt; +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts<br>
&gt; @@ -910,10 +910,12 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel-peci-dimmtemp@30 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatibl=
e =3D &quot;intel,peci-client&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &=
lt;0x30&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &qu=
ot;okay&quot;;<br>
<br>
Nodes are enabled by default, you shouldn&#39;t need to add &quot;okay&quot=
; for it<br>
to work. Can you confirm it works without adding this?<br>
<br></blockquote><div>Yes you right.</div><div><br></div><div>is working fi=
ne without &quot;okay&quot;</div><div>=C2=A0<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel-peci-dimmtemp@31 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatibl=
e =3D &quot;intel,peci-client&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &=
lt;0x31&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &qu=
ot;okay&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; --<br>
&gt; 2.22.0<br>
&gt;<br></blockquote><div><br></div><div>Cheers,</div><div><br></div><div>T=
omer=C2=A0</div></div></div>

--000000000000b27ae305b950b158--
