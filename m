Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C81B3300
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 01:19:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496KKG5xfJzDqxM
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 09:19:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hZtuwlul; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496KJV3wNhzDqrn
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 09:19:03 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id w20so324618ljj.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nk17Wq5YZWJ3adBr5fPtb9svJstDdubh3hiqK1wzqao=;
 b=hZtuwlulhJbHAN3H/5drQu0/YwxMr8p7WvNuX1CzEHWW2k1x+bHyk3wK4hR9AC5F32
 VqblcxOObTHBs9R1AeKyh2vh8LkAZRO2YHA1I/Wd95vyWe5kOx8kIm8jMzIpxl1hbAYW
 PW/18x0uk14Js/MtppCsP/HKiW62t2b6giJCtyn5qeVmFEI32n6Hm2anKj2WsLxYRLuD
 NyAIt35XJXS1KWfrCBSCTY5vM3XjzXiEnfO+zGKJB5hUGjV+sf341BZFUPEHPPPc3WQU
 YoaIFlMzRK5YGcNne9e1fOMpfr35cgA8REtF2ACbjdNBPFz28DcjB50aTftMqAwt6TRb
 bYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nk17Wq5YZWJ3adBr5fPtb9svJstDdubh3hiqK1wzqao=;
 b=iXNf7YgTfZDLiTChItGX1xYYG329KigtldjQcEJRVVjIiK7mlaxQoDsdgRKpV8Bitz
 xGlD5lGHuM/70aWSYqK4HI2xj5RTQg2NSu6aOnZglO8cprEd7ZrBz1PrjQoGu02WuyI0
 /uUsKkYUZP8pOhTlCjYndZAy2fj0YDrFXd1WfemUWTt+Wb8hCYSAYmRaKHfUxajl9QMH
 zpiBwqqpExR5nP0HIHZEFwT+u+ksDI3EMmJnCTfnUcNj6djGY3DVW+TYIohHeV3PvuFu
 7GZVaZOWCZQSSfN2qPrTlxlL2aN0Jq9TyQljljsD1H3jfxpsJY4v+hNJBc2X5IqR6eod
 co+Q==
X-Gm-Message-State: AGi0PuZ8zVSZ+b6+iR3o41bKHnj4KNp61vhjQ0yxpLu3K8abnACIK7YH
 zQUlBdTpGGfp0TBsaeK6TtODM0l8BtdowcHEG7983Q==
X-Google-Smtp-Source: APiQypIgA2XJPlN1h+najrbjqYURpE9z5jcRnGFOYt9xiBFgzm2ql9V1ER/sg/MsR2CR9U1tJ9U2La8rB7VTwuK4yJw=
X-Received: by 2002:a2e:b4d0:: with SMTP id r16mr14632897ljm.129.1587511139025; 
 Tue, 21 Apr 2020 16:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
In-Reply-To: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
From: Richard Hanley <rhanley@google.com>
Date: Tue, 21 Apr 2020 16:18:47 -0700
Message-ID: <CAH1kD+ZSFEPVrYsf69auE8iEGxyXg6ru3RArcZrDi2AHrbxOJQ@mail.gmail.com>
Subject: Re: Call for Gardening Tasks
To: Sui Chen <suichen6@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000085216705a3d53dc6"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000085216705a3d53dc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you everyone for your suggestions.

Scanning through this it's clear that documentation is one of the biggest
most generally agreed upon area to work on.

Build tools and package management seems like another area with some agreed
on improvements. I like the idea of moving to meson. Getting tidy files and
revising our style guides also sound like good ideas. I also really agree
that we could stand to do some consolidation of processes/repos.

There is also some use for DBus tooling for both improved code, and for
visualizations.

So here are my next steps:
  1) Since we have some new people getting started, I've asked them to add
documentation at the points they get stuck during on-boarding.
  2) I'm going to take the ideas in this thread and put together a .md doc
with any relevant information I can find. I'll be adding it to openbmc/docs=
.
  3) I'll follow up in another thread about some of the ideas around DBus
tooling and package consolidation. That seems to be an area where most
people agree some improvements can be made, but I'm not sure there is an
agreement on how we should do it.

-Richard



On Mon, Apr 20, 2020 at 10:19 AM Sui Chen <suichen6@gmail.com> wrote:

> > On Apr 11, 2020, at 8:15 AM, Andrew Geissler <geissonator at gmail.com>
> wrote:
>
> > Systemd Visualization
>
> > Another complicated area of OpenBMC is our systemd targets and services=
.
> Building on the upstream tools to visualize our systemd targets and
> services would be useful to new people.
>
>
>
> +1 to visualization, and I have a few thoughts on this ---
>
> My lacking a mental model of how an OpenBMC system works had been my pain
> point in the first few months working with OpenBMC (I=E2=80=99m a bit new=
 to this
> area), so after learning the minimal set of survival skills I did somethi=
ng
> similar to what you mentioned =E2=80=93 visualizing the messages passed b=
etween
> different dbus peers (and conveniently, IPMI traffic, as IPMI-related dbu=
s
> messages exposing all IPMI payload comprise most of the dbus traffic on
> that particular system I was working on.)
>
>
>
> I think packet analysis tools such as Wireshark and graphics frame
> analysis tools such as RenderDoc, or system event-based Windows Performan=
ce
> tool like GPUView provide great examples of what people might expect to
> achieve with a visualization tool: capture, inspect and (sometimes)
> playback, across multiple layers in the software/hardware stack. Many
> similar existing tools process sequences of events, and in this case of
> BMCs, the events could be dbus messages. I found a prototype visualizer
> made at work greatly helpful in explaining to new team members some basic
> concepts and the IPMI stack on the BMC.
>
>
>
> The IPMI stack is interesting because it=E2=80=99s one noticeable workloa=
d on the
> particular BMC system I had been working on; in my current limited
> understanding, having lots of I/O capability to connect to hundreds of
> sensors is one of the many features that set apart a BMC chip and a
> similarly powerful smartphone chip, and the broad use of dbus is what set=
s
> apart OpenBMC and the desktop Linux distro I had been using. I heard
> optimization is best done workload by workload, perhaps this rationale
> applies to visualization too?
>
>
>
> I realize I was mostly talking about visualizing the run-time state of th=
e
> system rather than build-time, but we could visualize the run-time aspect
> of systemd units too since I have seen many times a dbus message eventual=
ly
> triggering a systemd target to acutate the system, so it would be good to
> consider both dbus and systemd (and maybe other parts of the system?) to
> have a more holistic view of the BMC=E2=80=99s operations.
>
>
>
> Thanks
>
> Sui
>

--00000000000085216705a3d53dc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you everyone for your suggestions.<div><br></div><di=
v>Scanning through this it&#39;s clear that documentation is one of the big=
gest most generally agreed upon area to work on.</div><div><br></div><div>B=
uild tools and package management seems like another area with some agreed =
on improvements. I like the idea of moving to meson. Getting tidy files and=
 revising our style guides also sound like good ideas. I also really agree =
that we could stand to do some consolidation of processes/repos.</div><div>=
<br></div><div>There is also some use for DBus tooling for both improved co=
de, and for visualizations.</div><div><br></div><div>So here are my next st=
eps:</div><div>=C2=A0 1) Since we have some new people getting started, I&#=
39;ve asked them to add documentation at the points they get stuck during o=
n-boarding.</div><div>=C2=A0 2) I&#39;m going to take the ideas in this thr=
ead and put together a .md doc with any relevant=C2=A0information I can fin=
d. I&#39;ll be adding it to openbmc/docs.</div><div>=C2=A0 3) I&#39;ll foll=
ow up in another thread about some of the ideas around DBus tooling and pac=
kage consolidation. That seems to be an area where most people agree some i=
mprovements can be made, but I&#39;m not sure there is an agreement on how =
we should do it.</div><div><br></div><div>-Richard</div><div><br></div><div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Apr 20, 2020 at 10:19 AM Sui Chen &lt;<a href=3D"mailto:=
suichen6@gmail.com">suichen6@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div class=3D"gma=
il-m_-1448104613106764596WordSection1"><p class=3D"MsoNormal"><span lang=3D=
"EN-US">&gt; On Apr 11, 2020, at 8:15 AM, Andrew Geissler &lt;geissonator a=
t <a href=3D"http://gmail.com" target=3D"_blank">gmail.com</a>&gt; wrote:</=
span></p><p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; Systemd Visualiza=
tion</span></p><p class=3D"MsoNormal"><span lang=3D"EN-US">&gt; Another com=
plicated area of OpenBMC is our systemd targets and services. Building on t=
he upstream tools to visualize our systemd targets and services would be us=
eful to new people.</span></p><p class=3D"MsoNormal"><span lang=3D"EN-US" s=
tyle=3D"font-size:12pt"><u></u>=C2=A0<u></u></span></p><p class=3D"MsoNorma=
l"><span lang=3D"EN-US" style=3D"font-size:12pt">+1 to visualization, and I=
 have a few thoughts on this ---<u></u><u></u></span></p><p class=3D"MsoNor=
mal"><span lang=3D"EN-US" style=3D"font-size:12pt">My lacking a mental mode=
l of how an OpenBMC system works had been my pain point in the first few mo=
nths working with OpenBMC (I=E2=80=99m a bit new to this area), so after le=
arning the minimal set of survival skills I did something similar to what y=
ou mentioned =E2=80=93 visualizing the messages passed between different db=
us peers (and conveniently, IPMI traffic, as IPMI-related dbus messages exp=
osing all IPMI payload comprise most of the dbus traffic on that particular=
 system I was working on.)<u></u><u></u></span></p><p class=3D"MsoNormal"><=
span lang=3D"EN-US" style=3D"font-size:12pt"><u></u>=C2=A0<u></u></span></p=
><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt">I thi=
nk packet analysis tools such as Wireshark and graphics frame analysis tool=
s such as RenderDoc, or system event-based Windows Performance tool like GP=
UView provide great examples of what people might expect to achieve with a =
visualization tool: capture, inspect and (sometimes) playback, across multi=
ple layers in the software/hardware stack. Many similar existing tools proc=
ess sequences of events, and in this case of BMCs, the events could be dbus=
 messages. I found a prototype visualizer made at work greatly helpful in e=
xplaining to new team members some basic concepts and the IPMI stack on the=
 BMC.<u></u><u></u></span></p><p class=3D"MsoNormal"><span lang=3D"EN-US" s=
tyle=3D"font-size:12pt"><u></u>=C2=A0<u></u></span></p><p class=3D"MsoNorma=
l"><span lang=3D"EN-US" style=3D"font-size:12pt">The IPMI stack is interest=
ing because it=E2=80=99s one noticeable workload on the particular BMC syst=
em I had been working on; in my current limited understanding, having lots =
of I/O capability to connect to hundreds of sensors is one of the many feat=
ures that set apart a BMC chip and a similarly powerful smartphone chip, an=
d the broad use of dbus is what sets apart OpenBMC and the desktop Linux di=
stro I had been using. I heard optimization is best done workload by worklo=
ad, perhaps this rationale applies to visualization too?<u></u><u></u></spa=
n></p><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt">=
<u></u>=C2=A0<u></u></span></p><p class=3D"MsoNormal"><span lang=3D"EN-US" =
style=3D"font-size:12pt">I realize I was mostly talking about visualizing t=
he run-time state of the system rather than build-time, but we could visual=
ize the run-time aspect of systemd units too since I have seen many times a=
 dbus message eventually triggering a systemd target to acutate the system,=
 so it would be good to consider both dbus and systemd (and maybe other par=
ts of the system?) to have a more holistic view of the BMC=E2=80=99s operat=
ions.<u></u><u></u></span></p><p class=3D"MsoNormal"><span lang=3D"EN-US" s=
tyle=3D"font-size:12pt"><u></u>=C2=A0<u></u></span></p><p class=3D"MsoNorma=
l"><span lang=3D"EN-US" style=3D"font-size:12pt">Thanks<u></u><u></u></span=
></p><p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12pt">S=
ui<u></u><u></u></span></p></div></div>
</blockquote></div>

--00000000000085216705a3d53dc6--
