Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92C39252B
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 05:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrCLT19mdz2yyC
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 13:03:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=EfKWA1Bv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EfKWA1Bv; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrCLB5kXpz2xv9
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 13:02:56 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id f22so2566354pfn.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 20:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DkfaCQ5tHR4pVbjwFOjXVRmd7xaM6yUT/eFFpuzzj7I=;
 b=EfKWA1BvpO+FQDI6xyXw8mL+RJjkHjBhRq899nPZq+HdQW/kH4vUoMEOthyecM6hYW
 T2mmaU1O3TTlflAyCoF4Y1iRfMwst02ClBcZ7kqXwLrZBoTzdwzcTX7cmrGFy/NIrgwk
 bMhyxtRmNhxhgohDwBs4N4OS1nea+vKjfgiK2MubA/6s7wseohs/Gi1CaAC1NJdXGEUM
 CauNYUPuQ7h5bGPJlSGYRpxacucDmH+G4ls/KaIPBmXJMoJu1KZUNkPuoy+mMMoy6jUA
 l0zkQdOcI3ce8wRpI5crX85FAu2T9Deg8xjj1hWmJ699dgrB++jlElbq06SwldJUk25P
 d20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DkfaCQ5tHR4pVbjwFOjXVRmd7xaM6yUT/eFFpuzzj7I=;
 b=BUeAnZKrDUd3Yv5L5LCfKp5bFFAm77oGe9MlZgnYXUJDql1SN8w/8B/xgKsJp/hnkI
 lj1bfrdI9423DQdAmBbBQjKJWLUI8Zx2GuVowbJQPM1HDg4PWLRX7SUIaYhzWwenBm8N
 HLtHgm+VOHRB5MLpIys26jmEm8+YRS1RuQwyWzhXNO8eoWWOUPiv+sorEFWUKPDARc/W
 16Yjg14QbP+fDZP2k+uNMPfXRolV2kMZPcn5rMAoZ0cnLVyS6UHTEtdz2ySkV38KmK6f
 64z8g6SoclQmZHNaVbZSQ/oY/JK/rl4cFi6jEEObtbXh5p9c3UGfpU0gGdGsunfvsFPS
 eX4Q==
X-Gm-Message-State: AOAM532wXGK6cksFlz553MY6witFejJ1NICh/KRK+B/fc/xt91NcElNQ
 C7MWswZplSZmIcbVtGXij3usHo1GKKCW1UKremdSLw==
X-Google-Smtp-Source: ABdhPJxSkw/r8fcnmiBxAfsiKW7NAPDWWNqrmSDPcDjEn/vqOOmlG7Z0y1FnOiFHyGjzvSa4qMpX3znTxdvw8Bezhlw=
X-Received: by 2002:a05:6a00:acb:b029:2dc:db73:d44c with SMTP id
 c11-20020a056a000acbb02902dcdb73d44cmr1260074pfl.28.1622084573748; Wed, 26
 May 2021 20:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210424003821.3697200-1-wltu@google.com>
 <CAHwn2Xm+BnwbU-hHrKT-oazomh+V42t3Dm=xXhVJozNEdiDd8g@mail.gmail.com>
 <CACPK8XeSd8TVXQoj-G5baQPdEH5aP2G4RmhcfDzNPMnZvcfS0Q@mail.gmail.com>
In-Reply-To: <CACPK8XeSd8TVXQoj-G5baQPdEH5aP2G4RmhcfDzNPMnZvcfS0Q@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 20:02:42 -0700
Message-ID: <CAHwn2X=pYrX0ZCrSuzSZ-cW86EP9gaDCLTDjeWHBq35Nhg2KBg@mail.gmail.com>
Subject: Re: [PATCH dev-5.10] arm: dts: nuvoton: gsj: Enable Nuvoton fan filter
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000d105dc05c346fed2"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d105dc05c346fed2
Content-Type: text/plain; charset="UTF-8"

ah, good catch.

I didn't realize that was the case. It looks like it is up to Nuvoton to
upstream it.

https://github.com/Nuvoton-Israel/linux/blob/NPCM-5.10-OpenBMC/drivers/hwmon/npcm750-pwm-fan.c#L800

Or maybe I can just make the change for them? Not sure.

Willy Tu

On Wed, May 26, 2021 at 6:51 PM Joel Stanley <joel@jms.id.au> wrote:

> On Wed, 26 May 2021 at 15:48, Willy Tu <wltu@google.com> wrote:
> >
> > ping
> >
> > On Fri, Apr 23, 2021 at 5:38 PM Willy Tu <wltu@google.com> wrote:
> >>
> >> gsj platform sometimes also see low fan speed issue that can be partly
> >> prevented with this fan filter.
>
> This property is not supported by the kernel, so it will not do
> anything. Do you intend to submit driver support?
>
> >>
> >> Signed-off-by: Willy Tu <wltu@google.com>
> >> ---
> >>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> >> index 3ff116aaacb3..86facfc08c6e 100644
> >> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> >> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> >> @@ -408,18 +408,21 @@ fan@0 {
> >>                 reg = <0x00>;
> >>                 fan-tach-ch = /bits/ 8 <0x00 0x01>;
> >>                 cooling-levels = <127 255>;
> >> +               fan_filter_en;
> >>         };
> >>
> >>         fan@1 {
> >>                 reg = <0x01>;
> >>                 fan-tach-ch = /bits/ 8 <0x02 0x03>;
> >>                 cooling-levels = /bits/ 8 <127 255>;
> >> +               fan_filter_en;
> >>         };
> >>
> >>         fan@2 {
> >>                 reg = <0x02>;
> >>                 fan-tach-ch = /bits/ 8 <0x04 0x05>;
> >>                 cooling-levels = /bits/ 8 <127 255>;
> >> +               fan_filter_en;
> >>         };
> >>  };
> >>
> >> --
> >> 2.31.1.498.g6c1eba8ee3d-goog
> >>
>

--000000000000d105dc05c346fed2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ah, good catch.<div><br></div><div>I didn&#39;t realize th=
at was the case. It looks like it is up to Nuvoton to upstream it.</div><di=
v><br></div><div><a href=3D"https://github.com/Nuvoton-Israel/linux/blob/NP=
CM-5.10-OpenBMC/drivers/hwmon/npcm750-pwm-fan.c#L800">https://github.com/Nu=
voton-Israel/linux/blob/NPCM-5.10-OpenBMC/drivers/hwmon/npcm750-pwm-fan.c#L=
800</a><br></div><div><br></div><div>Or maybe I can just make the change fo=
r them? Not sure.</div><div><br></div><div>Willy Tu</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 26, 20=
21 at 6:51 PM Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.i=
d.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Wed, 26 May 2021 at 15:48, Willy Tu &lt;<a href=3D"mailto:wltu@googl=
e.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ping<br>
&gt;<br>
&gt; On Fri, Apr 23, 2021 at 5:38 PM Willy Tu &lt;<a href=3D"mailto:wltu@go=
ogle.com" target=3D"_blank">wltu@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; gsj platform sometimes also see low fan speed issue that can be pa=
rtly<br>
&gt;&gt; prevented with this fan filter.<br>
<br>
This property is not supported by the kernel, so it will not do<br>
anything. Do you intend to submit driver support?<br>
<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" tar=
get=3D"_blank">wltu@google.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 3 +++<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/=
boot/dts/nuvoton-npcm730-gsj.dts<br>
&gt;&gt; index 3ff116aaacb3..86facfc08c6e 100644<br>
&gt;&gt; --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts<br>
&gt;&gt; +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts<br>
&gt;&gt; @@ -408,18 +408,21 @@ fan@0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =
=3D &lt;0x00&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-t=
ach-ch =3D /bits/ 8 &lt;0x00 0x01&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cooli=
ng-levels =3D &lt;127 255&gt;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan_filter=
_en;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan@1 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =
=3D &lt;0x01&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-t=
ach-ch =3D /bits/ 8 &lt;0x02 0x03&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cooli=
ng-levels =3D /bits/ 8 &lt;127 255&gt;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan_filter=
_en;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan@2 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =
=3D &lt;0x02&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan-t=
ach-ch =3D /bits/ 8 &lt;0x04 0x05&gt;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cooli=
ng-levels =3D /bits/ 8 &lt;127 255&gt;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan_filter=
_en;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 };<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.1.498.g6c1eba8ee3d-goog<br>
&gt;&gt;<br>
</blockquote></div>

--000000000000d105dc05c346fed2--
