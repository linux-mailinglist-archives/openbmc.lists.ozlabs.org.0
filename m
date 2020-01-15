Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C213BCBA
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 10:49:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yMwj1L6XzDqRR
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 20:49:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=si4obV55; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yMvt3Zt2zDqCC
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 20:48:23 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id 62so1629876pfu.11
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 01:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HTu3P9qcKCCSGfvKvxFCeBniMJbiQFa9fKCt1P8k0LI=;
 b=si4obV55mLvR713ObNh7ihyLXDMr2YisL55FxJtfsCUdai2o7bpvUWpaaDiHgKyPhB
 LbBwTkqfDrShzMAVkytUyNdXgn6ksDU/KTWzlhd041wNgJHzIQjHAHT0MmqVVMJYbkX5
 9BJkofRY7zq2JHzrteNUACPThtE2iVHYcZ1+AH4+bBmKUi7EEILMaxDx8yJT4vpg8IZ2
 XV/tI2bDe8AY/jARwzz+rmZds7oKIIOtcziFX5UCxuU0zdcny6FD9LmiBrVIlpqH8XUV
 qylZXAYuRhLiEwfydTF0AeI5aSjUOKN9ueXdW3LhCdbj0HxDCyrS4I8qg1A7LDyJUOP1
 WxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HTu3P9qcKCCSGfvKvxFCeBniMJbiQFa9fKCt1P8k0LI=;
 b=g/Jjc7dHjm1qxLoKIzUbuKQOPfFJBwTMkj77eb7dSc5Exd0j+qMl9MvOeJiXtrlhAO
 LYsaoEKMZyzn5t3fQNPm69vgQxmIcyLmW01uSVwJsgIrF7Q6hyzQeGdqlt1TkUoPiE6l
 vfl5soBRDzED2oFzxRaRpbu0vJbl8m7Dept5FZomWgnZCTHwPVitlQAJmxzm5O22J/Yf
 3d2xM1VumlkH7E+SDhW2CsNlPNJJdFFBogEysDWcfOrSiwq3by9GETWmgaqxE/t6+xYQ
 FrfkSvMgBUlsODKHhoRZVhp4r+yakXKBlrD0cSG2vdQnB/Ca9e0Lr/+mq9hKTVyy3NaE
 AizA==
X-Gm-Message-State: APjAAAV9LUlXKnM+RMEUMKqHKHZjaplLxaV3DpiaTpB5UFt6Z1FYzOBL
 5Zp6HM3bu6PWZHclKLnW8d4bNbS/eyZiyiAFlNcQcQ==
X-Google-Smtp-Source: APXvYqwEIjXjkZihSK99cuMDsDeh34Q+EDSgy8K6O3Ar+Zyb2XT1b3xAPYclV13NvUortYmf64lkvbjXJb2kTK9C4S4=
X-Received: by 2002:a05:6a00:2ae:: with SMTP id
 q14mr30287720pfs.155.1579081700180; 
 Wed, 15 Jan 2020 01:48:20 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRKzfWXx4iOOxoGmi_EFb2rdSBmHxVzh-6mzUf-NBoEajA@mail.gmail.com>
 <19711.1579015187@localhost>
In-Reply-To: <19711.1579015187@localhost>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 15 Jan 2020 17:48:06 +0800
Message-ID: <CAO9PYR+TaknXXgoxw=JibWZ99rOw7FUobVbW_GHD96jkVqd-1g@mail.gmail.com>
Subject: Re: Dose OpenBMC support UPnP
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: multipart/alternative; boundary="000000000000cf86b1059c2a9bb2"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cf86b1059c2a9bb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael:
    Thanks for your reply. You are right, UPnP is a set of network
protocol. I thought BMC doesn't need support full feature of UPnP, but the
discovery(SSDP) and device description in UPnP are useful tool for server
management. Does OpenBMC support these currently or plan to support? thanks=
.

Tyler

Michael Richardson <mcr@sandelman.ca> =E6=96=BC 2020=E5=B9=B41=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:19=E5=AF=AB=E9=81=93=EF=
=BC=9A

>
> Deng Tyler <tyler.sabdon@gmail.com> wrote:
>     > Hi all: UPnP is well-known and widely used network protocol. Does
>     > openbmc support it or plan to support? Thanks.
>
> Troy Lee <leetroy@gmail.com> wrote:
>     > OpenBMC supports mDNS/DNS-SD(Avahi).
>
> UPnP is not just mDNS (and originally wasn't mDNS at all)
> UPnP is a collection of services, that includes being able to open ports
> on routers
> for incoming traffic, route AV material, etc.
>
> Which part of UPnP are you asking about?
>
>     > Thanks, Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
>
>     > On Tue, Jan 14, 2020 at 11:32 AM Deng Tyler <tyler.sabdon@gmail.com=
>
>     > wrote:
>     >>
>     >> Hi all: UPnP is well-known and widely used network protocol. Does
>     >> openbmc support it or plan to support? Thanks.
>     >>
>     >> Tyler
>
>
>     > Tyler
>
>
>     > ----------------------------------------------------
>     > Alternatives:
>
>     > ----------------------------------------------------
>

--000000000000cf86b1059c2a9bb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Michael:=C2=A0<div>=C2=A0 =C2=A0 Thanks for your reply.=
 You are right, UPnP is a set of network protocol. I thought BMC doesn&#39;=
t need support=C2=A0full feature of UPnP, but the discovery(SSDP) and devic=
e description in UPnP are useful=C2=A0tool for server management. Does Open=
BMC support these currently or plan to support? thanks.</div><div><br></div=
><div>Tyler</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Michael Richardson &lt;<a href=3D"mailto:mcr@sandelman.ca"=
>mcr@sandelman.ca</a>&gt; =E6=96=BC 2020=E5=B9=B41=E6=9C=8814=E6=97=A5 =E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:19=E5=AF=AB=E9=81=93=EF=BC=9A<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Deng Tyler &lt;<a href=3D"mailto:tyler.sabdon@gmail.com" target=3D"_blank">=
tyler.sabdon@gmail.com</a>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; Hi all: UPnP is well-known and widely used network proto=
col. Does<br>
=C2=A0 =C2=A0 &gt; openbmc support it or plan to support? Thanks.<br>
<br>
Troy Lee &lt;<a href=3D"mailto:leetroy@gmail.com" target=3D"_blank">leetroy=
@gmail.com</a>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; OpenBMC supports mDNS/DNS-SD(Avahi).<br>
<br>
UPnP is not just mDNS (and originally wasn&#39;t mDNS at all)<br>
UPnP is a collection of services, that includes being able to open ports on=
 routers<br>
for incoming traffic, route AV material, etc.<br>
<br>
Which part of UPnP are you asking about?<br>
<br>
=C2=A0 =C2=A0 &gt; Thanks, Yu-Ting Lee (Troy Lee) &lt;<a href=3D"mailto:Lee=
Troy@gmail.com" target=3D"_blank">LeeTroy@gmail.com</a>&gt;<br>
<br>
=C2=A0 =C2=A0 &gt; On Tue, Jan 14, 2020 at 11:32 AM Deng Tyler &lt;<a href=
=3D"mailto:tyler.sabdon@gmail.com" target=3D"_blank">tyler.sabdon@gmail.com=
</a>&gt;<br>
=C2=A0 =C2=A0 &gt; wrote:<br>
=C2=A0 =C2=A0 &gt;&gt;<br>
=C2=A0 =C2=A0 &gt;&gt; Hi all: UPnP is well-known and widely used network p=
rotocol. Does<br>
=C2=A0 =C2=A0 &gt;&gt; openbmc support it or plan to support? Thanks.<br>
=C2=A0 =C2=A0 &gt;&gt;<br>
=C2=A0 =C2=A0 &gt;&gt; Tyler<br>
<br>
<br>
=C2=A0 =C2=A0 &gt; Tyler<br>
<br>
<br>
=C2=A0 =C2=A0 &gt; ----------------------------------------------------<br>
=C2=A0 =C2=A0 &gt; Alternatives:<br>
<br>
=C2=A0 =C2=A0 &gt; ----------------------------------------------------<br>
</blockquote></div>

--000000000000cf86b1059c2a9bb2--
