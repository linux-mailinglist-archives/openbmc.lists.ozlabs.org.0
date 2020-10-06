Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC88285402
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 23:42:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5WCk1DMKzDqF0
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 08:42:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RJ1GVXPP; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5WBt3Y76zDq8g
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 08:41:48 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id a9so7336638lfc.7
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lj9e8DNnMCFR7kMCuVGvATQ9jMUIpLF08UrN5zfHgnk=;
 b=RJ1GVXPPfn5a89s74h5wWlp4MnfXOX1YwMRwGZkiZiQsMFc3jrsaiFv3S1DVR5Jd/F
 shw89m7ZsO3tsHm+SkPryOrowlC34TZGmE+TNWzxFfniWAVuhAmVzfp8t/5i7EyTeiRy
 JQooSxTQB8WSJvGv4/ZNKSjI24QAeB1Rna2tIH4bdaAd7T5leGVJu9iL0bju27zBUSNb
 5yVCXMI/zoqeYnCyJr+yVCqLlObupG+zO3UCbPI/tXHDvBa7b6wKMRGthWcYiUJaCgrI
 5kVIBlkuZsmSvGMqGiR07NTYoThCg2wAsc/nInW7x2Yi2ZyHlhwV+WBQAyxnIo9p6AeM
 doPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lj9e8DNnMCFR7kMCuVGvATQ9jMUIpLF08UrN5zfHgnk=;
 b=kXvY2eyiekKKJif7Nx8Tm7lTvwWdD7wl1LuZ0oEuVTbjTEM2kHEFmoieA542rbaKt2
 oiBCmNch52xbm6Zg1drmNxq6bTjrBOIyWKh0gKFPWJhkb4pEzXY14L5qK5E1FAY4hwp7
 0ed2ZEp7JyCfPzGuOLlC4BYQ0AmWEet+lwqIoU9195gd917PJsWBXgNiPJiZHg29BoYH
 zQv3/V7Z8Fduv9uhq1Bys+32Nwq9MTpEqOxq+4zKdChQM3vHHvVLW60xcHopdo7y2XPv
 PKhjY87gLhxQPKKSR/boaYKQa7Hi6QcbUMiaNdIjlQAZMYKiONXbHpTT23tpwAfcXyGh
 GogQ==
X-Gm-Message-State: AOAM532gwwDNKYquoMF7I97o4TAGh3MoNsyDkRinQNqaRJ41VFCKS1hj
 JnSHznMQnxVRgVCkbQ3RO/P+rg3cFksUO21AwrDeGg==
X-Google-Smtp-Source: ABdhPJxiVh5m9RtT7N+K7EEnSrHu5vfOTLeqjNahLumoasGw8fXCbh/qtTh+z1nJacChpk++h4qVrv5GZILujIk9Bdo=
X-Received: by 2002:ac2:4576:: with SMTP id k22mr1095804lfm.247.1602020500321; 
 Tue, 06 Oct 2020 14:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
In-Reply-To: <PU1PR04MB2248961AEF87BA87C7749050A70D0@PU1PR04MB2248.apcprd04.prod.outlook.com>
From: Richard Hanley <rhanley@google.com>
Date: Tue, 6 Oct 2020 14:41:29 -0700
Message-ID: <CAH1kD+b=4NhQ=XUmtGXov2WErqLB1T=ZZBYgYBkuVLT=-hdfvw@mail.gmail.com>
Subject: Re: adding sync method in phosphor-time-manager
To: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Content-Type: multipart/alternative; boundary="000000000000d8b9bb05b1077633"
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
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d8b9bb05b1077633
Content-Type: text/plain; charset="UTF-8"

I think it makes a lot of sense to make this configurable. However, I
wonder if we should consider making it a collection with a priority levels
instead of a single enum. I can envision a need for someone to say, "Use
NTP when it's available, but if the network is down then use the host."

While we're on the subject, has anyone ever taken a look at using roughtime
on a BMC? I imagine it could a really valuable extension to
phosphor-time-manager some time in the future.
https://blog.cloudflare.com/roughtime/

Regards,
Richard

On Tue, Oct 6, 2020 at 10:40 AM Velumani T-ERS,HCLTech <velumanit@hcl.com>
wrote:

> Classification:
>
> Hi Team,
>
>
>
> We wanted to add another time sync method in phosphor-time-manager to get
> the time from the host and set it to BMC. To have this option configurable
> I propose a dbus property in the time interface(given below). Please
> provide your feedback/comments.
>
>
>
>
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Time/Synchronization.interface.yaml
>
> enumerations:
>
>     - name: Method
>
>       description: >
>
>         Possible methods of time synchronization.
>
>       values:
>
>         - name: NTP
>
>           description: >
>
>             Sync by using the Network Time Protocol.
>
>         - name: Manual
>
>           description: >
>
>             Sync time manually.
>
>          - name: HostSync
>
>           description: >
>
>             Sync the time from host.
>
>
>
> Regards,
>
> Velu
> ::DISCLAIMER::
> ------------------------------
> The contents of this e-mail and any attachment(s) are confidential and
> intended for the named recipient(s) only. E-mail transmission is not
> guaranteed to be secure or error-free as information could be intercepted,
> corrupted, lost, destroyed, arrive late or incomplete, or may contain
> viruses in transmission. The e mail and its contents (with or without
> referred errors) shall therefore not attach any liability on the originator
> or HCL or its affiliates. Views or opinions, if any, presented in this
> email are solely those of the author and may not necessarily reflect the
> views or opinions of HCL or its affiliates. Any form of reproduction,
> dissemination, copying, disclosure, modification, distribution and / or
> publication of this message without the prior written consent of authorized
> representative of HCL is strictly prohibited. If you have received this
> email in error please delete it and notify the sender immediately. Before
> opening any email and/or attachments, please check them for viruses and
> other defects.
> ------------------------------
>

--000000000000d8b9bb05b1077633
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think it makes a lot of sense to make this configurable.=
 However, I wonder if we should consider making it a collection with a prio=
rity levels instead of a single enum. I can envision a need for someone to =
say, &quot;Use NTP when it&#39;s available, but if the network is down then=
 use the host.&quot;=C2=A0<div><br></div><div>While we&#39;re on the subjec=
t, has anyone ever taken a look at using roughtime on a BMC? I imagine it c=
ould a really valuable extension to phosphor-time-manager some time in the =
future.</div><div><a href=3D"https://blog.cloudflare.com/roughtime/">https:=
//blog.cloudflare.com/roughtime/</a><br></div><div><br></div><div>Regards,<=
/div><div>Richard</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Oct 6, 2020 at 10:40 AM Velumani T-ERS,HCLTe=
ch &lt;<a href=3D"mailto:velumanit@hcl.com">velumanit@hcl.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_8573633271051800730WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Classification: <span s=
tyle=3D"font-size:12pt">
<u></u><u></u></span></p>
<p class=3D"MsoNormal">Hi Team,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">We wanted to add another time sync method in phospho=
r-time-manager to get the time from the host and set it to BMC. To have thi=
s option configurable I propose a dbus property in the time interface(given=
 below). Please provide your feedback/comments.
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/phosphor-dbus-=
interfaces/blob/master/xyz/openbmc_project/Time/Synchronization.interface.y=
aml" target=3D"_blank">https://github.com/openbmc/phosphor-dbus-interfaces/=
blob/master/xyz/openbmc_project/Time/Synchronization.interface.yaml</a><u><=
/u><u></u></p>
<p class=3D"MsoNormal">enumerations:<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0 - name: Method<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: &gt;<u><=
/u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Possible =
methods of time synchronization.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 values:<u></u><u></u>=
</p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - name: N=
TP<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 description: &gt;<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Sync by using the Network Time Protocol.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - name: M=
anual<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 description: &gt;<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Sync time manually.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n=
ame: HostSync<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 description: &gt;<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Sync the time from host.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <u></u><u=
></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Velu<u></u><u></u></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</div>

</blockquote></div>

--000000000000d8b9bb05b1077633--
