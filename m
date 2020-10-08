Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F36A6287568
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 15:49:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Xcd198czDqVH
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 00:49:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=DFjC6wYZ; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6XXt2CWVzDqT1
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 00:46:01 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id d197so6250074iof.0
 for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2020 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r/u+lRr6MO+DGkh4jLkx0BCA5fyRdMQbNNVFQCwpRNQ=;
 b=DFjC6wYZP6z70RyaebFs824qmfzGSzDgtGr0GDJhsPOH4wlZJ7QaUS/RiSlt1XyaAa
 sSj9e2yrK/yDTA6gnvvr2gnB82KrE4gAY98qAleIfrqy2ZnwwMWpZJKon4EwUAFE1yYo
 zyIkUBSYCPB7SS5xTRol4TznrSqHtJf8sXseYuNJrYSrcCC6Ph5cnJH65t1UqXG1nZ4/
 g+/mskqPq2j5Gwijkb/NyDIpBw6gLsg+gEjAJLwUcSHs0Bglq8zouIWvcHag3HoBhwRL
 OhWvz2oh8p4MrmxI2LmAkxYu/jnFiamvcloDCuuQyjOFpub2qN4orz0iNoOXqzZtBRpx
 KJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/u+lRr6MO+DGkh4jLkx0BCA5fyRdMQbNNVFQCwpRNQ=;
 b=FGuCv/ZfqEmft8GpK5U+oyraHORtHGtow/W26SouBchGwS3RxikN16qOPUcbbkb0DT
 c+5hcvQ0jan4G6zMyzS1C9URk5AAY99hz+y9Q8xgTlHv6l40xGqPwsmFS7HSproXwBkm
 quOHO9OVXF+cyTkbEb8BnJ/hvW528KcI/aiCEAt5xGix+3t9T56YMY6T8NNQIUQvydJ9
 NFh7x+UnsUZOQAUnst472PqPG+yu2zuEqPoM1tleV+bD1t+Z+HyUDUQeboUUQlkf1vEt
 N0vJHH2D2CS+MjseZJON+IhxbiGRblGkQlULH17FD8B6LXmcEK5OFxWtzSXWKLraB2Nl
 YR2w==
X-Gm-Message-State: AOAM530qF+2l4PlFrXySNOx8eQO7Zmr/6XCer0RdYl1ZwF3ytpwG1lNq
 UOaIqTqQe7vizREKYNHZuzhwJRGxdMT6woqP86jjMw==
X-Google-Smtp-Source: ABdhPJznqYgL9wJ6XCrjzZ6FXCO4CaOOf5opUiMEgvm7Osa9fIhtWPXNoAa8QMGyXCqEnlhQ5GAW/8xpOhOTA2PXdck=
X-Received: by 2002:a05:6602:208c:: with SMTP id
 a12mr6064142ioa.55.1602164757554; 
 Thu, 08 Oct 2020 06:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR04MB3311FEF038529B122E1123DECA0D0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <EC03A9B2-FE8C-499C-B456-E76EE677E28D@fb.com>
 <TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0@TY2PR04MB3311.apcprd04.prod.outlook.com>
In-Reply-To: <TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0@TY2PR04MB3311.apcprd04.prod.outlook.com>
From: Anton Kachalov <rnouse@google.com>
Date: Thu, 8 Oct 2020 15:45:46 +0200
Message-ID: <CADVsX884=EN-RTAyvP9mT7VxE+xSR+vb2b-TF7zMH1vYqBTEuQ@mail.gmail.com>
Subject: Re: 12v slot AC Support in x86-power-control
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Content-Type: multipart/alternative; boundary="0000000000003f5df105b1290d80"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "ed@tanous.net" <ed@tanous.net>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003f5df105b1290d80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Priyatharshan

This feature sound like adding more chassisX objects. Do you have separate
sensors (e.g. on i2c bus or busses) per each board in the slots?

On Thu, Oct 8, 2020, 15:15 P. Priyatharshan <PriyatharshanP@hcl.com> wrote:

> Thanks Vijay/Patrick for your comments.
>
> The feature we are working is different from vijay's feature.
>
> Out platform is multi host system and we  have the host as FRU and it can
> be plugged in to a slot. The slot has an option to control slot power and
> this can be used for a AC cycle.
>
> We proposed  a design to add the slot power control in the
> x86-power-control.The earlier discussion can be found in the below link.
>
> https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.html
>
> ed tanous,
>
> I will create a clear document on when to use this slot power control
> feature.
>
> Thanks,
> Priyatharshan P
>
> ------------------------------
> *From:* Vijay Khemka <vijaykhemka@fb.com>
> *Sent:* 08 October 2020 06:11
> *To:* P. Priyatharshan <PriyatharshanP@hcl.com>; openbmc@lists.ozlabs.org
> <openbmc@lists.ozlabs.org>; ed@tanous.net <ed@tanous.net>
> *Cc:* Velumani T-ERS,HCLTech <velumanit@hcl.com>
> *Subject:* Re: 12v slot AC Support in x86-power-control
>
>
> [CAUTION: This Email is from outside the Organization. Unless you trust
> the sender, Don=E2=80=99t click links or open attachments as it may be a =
Phishing
> email, which can steal your Information and compromise your Computer.]
>
> Hi Priyatharshan,
>
> Chassis system reset is for removing AC power for the whole chassis and i=
t
> is already supported in x86-power-control. I am working on enabling this
> feature in redfish. I am not sure how it is related to your new features.
> If it is related then you can also define system_reset target unit.
>
>
>
> Regards
>
> -Vijay
>
>
>
> *From: *"P. Priyatharshan" <PriyatharshanP@hcl.com>
> *Date: *Tuesday, October 6, 2020 at 9:43 AM
> *To: *"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Vijay Khemka
> <vijaykhemka@fb.com>, "ed@tanous.net" <ed@tanous.net>
> *Cc: *"Velumani T-ERS,HCLTech" <velumanit@hcl.com>
> *Subject: *12v slot AC Support in x86-power-control
>
>
>
> Hi Vijay,
>
>
>
> I am working on a patch to support  12v slot AC cycle in
> x86-power-control.This can be enabled by configuring slotACPowerName in
> json config file.Since you are also working on similar kind of feature in
> x86-power-control, I would like bring up this discussion on mailing list =
to
> understand how these two features, and the design you proposed for chassi=
s
> reset are intended to work together.Kindly go through my design changes
> below and share your thoughts.
>
>
>
> I have modified the existing /xyz/openbmc_project/state/chassis0 object t=
o
> implement 12V On, Off, and Power Cycle for system which has 12V Slot powe=
r
> support.
>
>
>
>
>
> If slotACPowerName is disabled and if,
>
>
>
> RequestedPowerTransition =3D
> "xyz.openbmc_project.State.Chassis.Transition.Off" then poweroff [existin=
g
> functionality not changed]
>
>
>
> RequestedPowerTransition =3D
> "xyz.openbmc_project.State.Chassis.Transition.On" then powerOn [existing
> functionality not changed]
>
>
>
> RequestedPowerTransition =3D
> "xyz.openbmc_project.State.Chassis.Transition.PowerCycle" then PowerCycle
> [existing functionality not changed]
>
>
>
> events will be called.
>
>
>
>
>
>
>
> If slotACPowerName is enabled and if,
>
>
>
> RequestedPowerTransition =3D
> "xyz.openbmc_project.State.Chassis.Transition.Off" then 12V Ac Slot Off
>
>
>
> RequestedPowerTransition =3D
> "xyz.openbmc_project.State.Chassis.Transition.On" then 12V Ac Slot On
>
>
>
> RequestedPowerTransition =3D
> "xyz.openbmc_project.State.Chassis.Transition.PowerCycle" then 12V Ac Slo=
t
> PowerCycle
>
>
>
> events will be called.
>
>
>
> Thanks,
>
> Priyatharshan P
>
> ::DISCLAIMER::
> ------------------------------
>
> The contents of this e-mail and any attachment(s) are confidential and
> intended for the named recipient(s) only. E-mail transmission is not
> guaranteed to be secure or error-free as information could be intercepted=
,
> corrupted, lost, destroyed, arrive late or incomplete, or may contain
> viruses in transmission. The e mail and its contents (with or without
> referred errors) shall therefore not attach any liability on the originat=
or
> or HCL or its affiliates. Views or opinions, if any, presented in this
> email are solely those of the author and may not necessarily reflect the
> views or opinions of HCL or its affiliates. Any form of reproduction,
> dissemination, copying, disclosure, modification, distribution and / or
> publication of this message without the prior written consent of authoriz=
ed
> representative of HCL is strictly prohibited. If you have received this
> email in error please delete it and notify the sender immediately. Before
> opening any email and/or attachments, please check them for viruses and
> other defects.
> ------------------------------
>

--0000000000003f5df105b1290d80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,=C2=A0<span style=3D"font-family:sans-serif">Priy=
atharshan</span></div><div dir=3D"auto"><font face=3D"sans-serif"><br></fon=
t></div><div dir=3D"auto"><font face=3D"sans-serif">This feature sound like=
 adding more chassisX objects. Do you have separate sensors (e</font>.g. on=
 i2c<span style=3D"font-family:sans-serif">=C2=A0bus or busses) per each bo=
ard in the slots?</span></div><div dir=3D"auto"><br><div class=3D"gmail_quo=
te" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 8, 2020,=
 15:15 P. Priyatharshan &lt;<a href=3D"mailto:PriyatharshanP@hcl.com">Priya=
tharshanP@hcl.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
Thanks Vijay/Patrick for your comments.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
The feature we are working is different from vijay&#39;s feature.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
<p style=3D"font-size:11pt;font-family:Calibri,sans-serif;margin:0">Out pla=
tform is multi host system and we=C2=A0 have the host as FRU and it can be =
plugged in to a slot. The slot has an option to control slot power and this=
 can be used for a AC cycle.</p>
<p style=3D"font-size:11pt;font-family:Calibri,sans-serif;margin:0">We prop=
osed=C2=A0 a design to add the slot power control in the x86-power-control.=
The earlier discussion can be found in the below link.
</p>
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
<a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.ht=
ml" target=3D"_blank" rel=3D"noreferrer">https://lists.ozlabs.org/pipermail=
/openbmc/2020-August/022481.html</a></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
ed tanous,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
I will create a clear document on when to use this slot power control featu=
re.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
">
Priyatharshan P<br>
</div>
</div>
<br>
<div id=3D"m_5471233420626625869appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_5471233420626625869divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank" re=
l=3D"noreferrer">vijaykhemka@fb.com</a>&gt;<br>
<b>Sent:</b> 08 October 2020 06:11<br>
<b>To:</b> P. Priyatharshan &lt;<a href=3D"mailto:PriyatharshanP@hcl.com" t=
arget=3D"_blank" rel=3D"noreferrer">PriyatharshanP@hcl.com</a>&gt;; <a href=
=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"noreferrer">o=
penbmc@lists.ozlabs.org</a> &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank" rel=3D"noreferrer">openbmc@lists.ozlabs.org</a>&gt;; <a =
href=3D"mailto:ed@tanous.net" target=3D"_blank" rel=3D"noreferrer">ed@tanou=
s.net</a> &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank" rel=3D"nor=
eferrer">ed@tanous.net</a>&gt;<br>
<b>Cc:</b> Velumani T-ERS,HCLTech &lt;<a href=3D"mailto:velumanit@hcl.com" =
target=3D"_blank" rel=3D"noreferrer">velumanit@hcl.com</a>&gt;<br>
<b>Subject:</b> Re: 12v slot AC Support in x86-power-control</font>
<div>=C2=A0</div>
</div>

<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:b=
reak-word">
<p></p>
<p style=3D"line-height:12.0pt;background:#ffeb9c"><b><span style=3D"font-s=
ize:11.0pt;color:#9c6501"></span></b><span style=3D"font-size:10.0pt;color:=
red">[CAUTION: This Email is from outside the Organization. Unless you trus=
t the sender, Don=E2=80=99t
 click links or open attachments as it may be a Phishing email, which can s=
teal your Information and compromise your Computer.]</span></p>
<div>
<div>
<p>Hi Priyatharshan,</p>
<p>Chassis system reset is for removing AC power for the whole chassis and =
it is already supported in x86-power-control. I am working on enabling this=
 feature in redfish. I am not sure how it is related to your new features. =
If it is related
 then you can also define system_reset target unit.</p>
<p>=C2=A0</p>
<p>Regards</p>
<p>-Vijay</p>
<p>=C2=A0</p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p><b><span style=3D"font-size:12.0pt;color:black">From: </span>
</b><span style=3D"font-size:12.0pt;color:black">&quot;P. Priyatharshan&quo=
t; &lt;<a href=3D"mailto:PriyatharshanP@hcl.com" target=3D"_blank" rel=3D"n=
oreferrer">PriyatharshanP@hcl.com</a>&gt;<br>
<b>Date: </b>Tuesday, October 6, 2020 at 9:43 AM<br>
<b>To: </b>&quot;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_bla=
nk" rel=3D"noreferrer">openbmc@lists.ozlabs.org</a>&quot; &lt;<a href=3D"ma=
ilto:openbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"noreferrer">openbmc=
@lists.ozlabs.org</a>&gt;, Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@f=
b.com" target=3D"_blank" rel=3D"noreferrer">vijaykhemka@fb.com</a>&gt;, &qu=
ot;<a href=3D"mailto:ed@tanous.net" target=3D"_blank" rel=3D"noreferrer">ed=
@tanous.net</a>&quot; &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank=
" rel=3D"noreferrer">ed@tanous.net</a>&gt;<br>
<b>Cc: </b>&quot;Velumani T-ERS,HCLTech&quot; &lt;<a href=3D"mailto:veluman=
it@hcl.com" target=3D"_blank" rel=3D"noreferrer">velumanit@hcl.com</a>&gt;<=
br>
<b>Subject: </b>12v slot AC Support in x86-power-control</span></p>
</div>
<div>
<p>=C2=A0</p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">Hi Vijay, </span>
</p>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">I am working on a patch to =
support =C2=A012v slot AC cycle in x86-power-control.This can be enabled by=
 configuring slotACPowerName in json config file.Since you are also working=
 on similar kind of
 feature in x86-power-control, I would like bring up this discussion on mai=
ling list to understand how these two features, and the design you proposed=
 for chassis reset are intended to work together.Kindly go through my desig=
n changes below and share your thoughts.</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">I have modified the existin=
g /xyz/openbmc_project/state/chassis0 object to implement 12V On, Off, and =
Power Cycle for system which has 12V Slot power support.</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">If slotACPowerName is disab=
led and if,</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.Off&quot; then power=
off [existing functionality not changed]</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.On&quot; then powerO=
n [existing functionality not changed]</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.PowerCycle&quot; the=
n PowerCycle [existing functionality not changed]</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0 </span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">events will be called.</spa=
n></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0 </span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">If slotACPowerName is enabl=
ed and if,</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.Off&quot; then 12V A=
c Slot Off</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.On&quot; then 12V Ac=
 Slot On
</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">RequestedPowerTransition =
=3D &quot;xyz.openbmc_project.State.Chassis.Transition.PowerCycle&quot; the=
n 12V Ac Slot PowerCycle
</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0 </span></p>
</div>
<p><span style=3D"font-size:12.0pt;color:black">events will be called.</spa=
n></p>
</div>
<div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">=C2=A0</span></p>
</div>
<div id=3D"m_5471233420626625869x_Signature">
<div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">Thanks,</span></p>
</div>
<div>
<p><span style=3D"font-size:12.0pt;color:black">Priyatharshan P</span></p>
</div>
</div>
</div>
</div>
<p><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:gray">::DISCLAIMER::</span></p>
<div align=3D"center" style=3D"text-align:center"><span style=3D"font-size:=
7.5pt;font-family:&quot;Arial&quot;,sans-serif;color:gray">
<hr size=3D"0" width=3D"100%" align=3D"center">
</span></div>
<p><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:gray">The contents of this e-mail and any attachment(s) are confident=
ial and intended for the named recipient(s) only. E-mail transmission is no=
t guaranteed to be secure
 or error-free as information could be intercepted, corrupted, lost, destro=
yed, arrive late or incomplete, or may contain viruses in transmission. The=
 e mail and its contents (with or without referred errors) shall therefore =
not attach any liability on the
 originator or HCL or its affiliates. Views or opinions, if any, presented =
in this email are solely those of the author and may not necessarily reflec=
t the views or opinions of HCL or its affiliates. Any form of reproduction,=
 dissemination, copying, disclosure,
 modification, distribution and / or publication of this message without th=
e prior written consent of authorized representative of HCL is strictly pro=
hibited. If you have received this email in error please delete it and noti=
fy the sender immediately. Before
 opening any email and/or attachments, please check them for viruses and ot=
her defects.</span></p>
<div align=3D"center" style=3D"text-align:center"><span style=3D"font-size:=
7.5pt;font-family:&quot;Arial&quot;,sans-serif;color:gray">
<hr size=3D"0" width=3D"100%" align=3D"center">
</span></div>
</div>
</div>
</div>
</div>

</blockquote></div></div></div>

--0000000000003f5df105b1290d80--
