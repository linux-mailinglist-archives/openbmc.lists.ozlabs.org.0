Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 370B33374CB
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 14:58:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx9XT1Hl9z3cZd
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 00:58:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=leO4C/7w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=leO4C/7w; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx9XF2dTPz3cKS
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 00:58:36 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id d20so23172975oiw.10
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 05:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xd2OI68wrLKJTLHNk01H5Zj+k9z3l0bcHy0Hrud3CtU=;
 b=leO4C/7wUBx4EcLIHDTkX34InehmLFMb+Ap1CAnTLWJ5+OCyvebcX3soymsd1uRkVm
 Q2Q+3XBJcngOV5Dut4Xzumgi7TvfUN6nZMi9QSuMXnWb2n6XesTbBiF/slswQYM2zPUQ
 nzA/UDxCeNuUVjfXQhFNZVb5eMaG4pek4SFqz982tsldicNkVkLuP4/qPT77kdKvCQJ6
 eWhmJDHnxij3QnAPk5lxiHFBcGS5ZzRJ7Xxfs9nzJF1A/96PakOPpajFPx7pmx9VKXMG
 9OA/pceP71FE4ii0vrCrj1z0gdwB2y29DB6voTQVDb52sBCZGX7q/GzCMlYMRPLKSxnd
 /yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xd2OI68wrLKJTLHNk01H5Zj+k9z3l0bcHy0Hrud3CtU=;
 b=jNhynEdZqmo9qtM2itaeKfPbt5mzl5hoR0jS7EkjDahPU7V/MyKhuYNakVjEa0scJr
 AQhSlzJv5f5D/Cz4A43qjysi48K8Y64I5p+iSEQtMqFQhdl0yU7szlSqNnQP4WgNMGRN
 oyQF03g86zgwmC9JFQpXzjnPsZwziPzy7Rl+feBV3fBTSiGOWBko4uvgTAS2Y1iUQqLL
 496FArbK7Up1qPh+UA2qkmEMP4zRinthMVhQFytywi5hbz8uE2H/8QOrzu3MDHa86wn9
 usnK2V8yIcF7gR56KAxS/r2ZzNhL7DIT0235Gbqr8fuUcymWqQwS2b/71o6iCDGf9Ynf
 RsqQ==
X-Gm-Message-State: AOAM5306/d1RUkfFflHoI1wYMmnuRzV0a+Gc5/3D8Wx+2hUmo6qQohgg
 CNjqMHei2pNt5Kp5qTa1zg0HgEBcWIuwLiwWR1w=
X-Google-Smtp-Source: ABdhPJyYXBNZRot3I3im9w/QH08Oo+WNuhZI3fH/N+XTOfwTYIZOl20UtUF/dighclxqm4JKvx9bbavFba1Cg1W1lGE=
X-Received: by 2002:aca:3706:: with SMTP id e6mr6239879oia.42.1615471112922;
 Thu, 11 Mar 2021 05:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20210303154622.3018839-1-j.neuschaefer@gmx.net>
 <20210303154622.3018839-2-j.neuschaefer@gmx.net>
 <CAP6Zq1hwp+wJpbN496096q8izRRoU2Jg+OKugcSk+BcXWfME9A@mail.gmail.com>
 <YED/zzV5kb35k2vb@latitude>
In-Reply-To: <YED/zzV5kb35k2vb@latitude>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 11 Mar 2021 16:11:59 +0200
Message-ID: <CAP6Zq1h5QK0_3gBek3QNN_cb6tGFJJXU_D8UPJOqnaDbsQAkxw@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 2/2] ARM: dts: Add board-specific compatible
 string to npcm750-evb devicetree
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: multipart/alternative; boundary="000000000000d4a85505bd432d97"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d4a85505bd432d97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Thanks a lot for your effort!

On Thu, 4 Mar 2021 at 17:42, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.ne=
t>
wrote:

> On Thu, Mar 04, 2021 at 05:21:36PM +0200, Tomer Maimon wrote:
> > Hi Jonathan,
> >
> > Thanks a lot for sending the patch,
> >
> > I think that when it related to the SoC EVB it can stay with the
> > genral compatible name nuvoton,npcm750
> >
> > you can see it also in,
> >
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-as=
t2500-evb.dts#L8
>
> To make the single compatible string match the DT binding, I'll have to
> write the binding a little differently. I wrote it like this:
>
>   compatible:
>     oneOf:
>       - description: NPCM750 based boards
>         items:
>           - enum:
>               - nuvoton,npcm750-evb         # NPCM750 evaluation board
>           - const: nuvoton,npcm750
>
> I think it should be like the exemple above

>
> I guess I could do something like this:
>
>   compatible:
>     oneOf:
>       - description: NPCM750 development board
>         const: nuvoton,npcm750
>
>
> And later add this part, when needed:
>
>       - description: NPCM750 based boards
>         items:
>           - enum:
>               - vendor,foo-bar-bmc
>           - const: nuvoton,npcm750
>
>
> What do you think?
>
>
> Thanks,
> Jonathan Neusch=C3=A4fer
>
>
> > On Wed, 3 Mar 2021 at 17:47, Jonathan Neusch=C3=A4fer <j.neuschaefer@gm=
x.net>
> > wrote:
> [...]
> > >  / {
> > >         model =3D "Nuvoton npcm750 Development Board (Device Tree)";
> > > -       compatible =3D "nuvoton,npcm750";
> > > +       compatible =3D "nuvoton,npcm750-evb", "nuvoton,npcm750";
>

Thanks,

Tomer

--000000000000d4a85505bd432d97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Jonathan,<div><br></div><div>Than=
ks a lot for your effort!</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, 4 Mar 2021 at 17:42, Jonathan Neusch=
=C3=A4fer &lt;<a href=3D"mailto:j.neuschaefer@gmx.net">j.neuschaefer@gmx.ne=
t</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, Mar 04, 2021 at 05:21:36PM +0200, Tomer Maimon wrote:<br>
&gt; Hi Jonathan,<br>
&gt; <br>
&gt; Thanks a lot for sending the patch,<br>
&gt; <br>
&gt; I think that when it related to the SoC EVB it can stay with the<br>
&gt; genral compatible name nuvoton,npcm750<br>
&gt; <br>
&gt; you can see it also in,<br>
&gt; <a href=3D"https://github.com/torvalds/linux/blob/master/arch/arm/boot=
/dts/aspeed-ast2500-evb.dts#L8" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-ast2500-ev=
b.dts#L8</a><br>
<br>
To make the single compatible string match the DT binding, I&#39;ll have to=
<br>
write the binding a little differently. I wrote it like this:<br>
<br>
=C2=A0 compatible:<br>
=C2=A0 =C2=A0 oneOf:<br>
=C2=A0 =C2=A0 =C2=A0 - description: NPCM750 based boards<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 items:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - enum:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - nuvoton,npcm750-evb=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# NPCM750 evaluation board<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: nuvoton,npcm750<br>
<br></blockquote><div>I think it should be like the exemple above=C2=A0=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I guess I could do something like this:<br>
<br>
=C2=A0 compatible:<br>
=C2=A0 =C2=A0 oneOf:<br>
=C2=A0 =C2=A0 =C2=A0 - description: NPCM750 development board<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const: nuvoton,npcm750<br>
<br>
<br>
And later add this part, when needed:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 - description: NPCM750 based boards<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 items:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - enum:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - vendor,foo-bar-bmc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - const: nuvoton,npcm750<br>
<br>
<br>
What do you think?<br>
<br>
<br>
Thanks,<br>
Jonathan Neusch=C3=A4fer<br>
<br>
<br>
&gt; On Wed, 3 Mar 2021 at 17:47, Jonathan Neusch=C3=A4fer &lt;<a href=3D"m=
ailto:j.neuschaefer@gmx.net" target=3D"_blank">j.neuschaefer@gmx.net</a>&gt=
;<br>
&gt; wrote:<br>
[...]<br>
&gt; &gt;=C2=A0 / {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0model =3D &quot;Nuvoton npcm750 =
Development Board (Device Tree)&quot;;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750&=
quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-=
evb&quot;, &quot;nuvoton,npcm750&quot;;<br></blockquote><div><br></div><div=
>Thanks,</div><div><br></div><div>Tomer</div><div>=C2=A0</div></div></div>

--000000000000d4a85505bd432d97--
