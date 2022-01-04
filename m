Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F18784849E1
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 22:31:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT5QQ6ggPz2xWc
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 08:31:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=p/Vd+tu/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::92e;
 helo=mail-ua1-x92e.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=p/Vd+tu/; dkim-atps=neutral
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT5Q16x0fz2xBV
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 08:30:47 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id p37so65394226uae.8
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 13:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fOSmAf4HtcCyfFjCmkxHlEin1Uq/mW8Ye+mCtv58IFs=;
 b=p/Vd+tu//KUMJ+15tMdcNJfGgTCeJGSDYjSMWjU8pEfsP0BWIA3gJ9fZgsK75De2QG
 FbeFN90qw8+yvukN5fLu3HdTOz/gfsLcesLGvWX63KgGKVqYQ6usL9aMrrvSJg2OhPVV
 sdo55ftKoTRHIZuadutody+fXMSsI00LF/aUMGvniBvznMw6Tc+Ax/U5uIRLj9XQ3aPi
 kzKxec2zh9YeCy0eMng0G8nPxH9rJuy9qniAbE+P4IWhLsPPesATF4lrf7vdCwgxVvu8
 43aSkgkOPfGAKwvJHRahkvwC0ciHg/ch1IbFArFOx6hljkL4H6VO9LvnxcIlHE6Pw/vc
 hGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fOSmAf4HtcCyfFjCmkxHlEin1Uq/mW8Ye+mCtv58IFs=;
 b=NtSbB7Wf6n74cgmNaU7gjsweZe72NEJjf1iK5XlwFDyGuk+ILRM+xvvK397fHsGpDO
 R6u+XA7NpGeeiEUahmf94CMprwgJW0F/lrQSDHpPLJxqMudZbPXU59iAMKsvUZHwjVcx
 rZ1ltVvXn02MmtNliMbiQkWH9rBaiWAxRE55vYEkRAHf3OERrm3XZPJaNcjugk8E/wFo
 cAoNXW/i3uKn6vD7GQaduX6WridsE94PZaad9j5p8dApdasHkdUpGA0VOOS0UfC5GLvv
 5+fhSPH3ODR3C5WDGGYHZJnJO7reokZHpWkFKeo7kzeZQ6WbAhv1EnOyN36oIJNkkYl2
 5SQw==
X-Gm-Message-State: AOAM53117k+nlCYHgMc6IogCYYxOQNrL+ZQNvnNQ3uWzA3FRHkf8hNyH
 HTjb2v4lzVZPHvn5Qc97fM+Le4WRBOWwpN8k+/NzYg==
X-Google-Smtp-Source: ABdhPJzjpRCbI0VAHqICho7X7iJLoiGadyYhzmOlN6c3HSXyic6dZGxt7v8krUnDOam4eAeoUO2F44144qQbg780zMU=
X-Received: by 2002:a67:e3c5:: with SMTP id k5mr14072624vsm.21.1641331842945; 
 Tue, 04 Jan 2022 13:30:42 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notyNtux_jNWFsrYex_vkKxt_JEE=ATU-RrL=o7vmsEdEBA@mail.gmail.com>
 <CAN9Jwz0fLF+8_mSS8hSDOcAJVB_78zX3jwORd96ZAkCZNc5VnA@mail.gmail.com>
 <CAO=notzZOjCQdTiAXmve9ce5h-xNTH0L+dBQFTnOxNRkEe+5Yg@mail.gmail.com>
 <1e9d57e3-873a-be84-e702-fcc0c4397602@kaod.org>
In-Reply-To: <1e9d57e3-873a-be84-e702-fcc0c4397602@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Tue, 4 Jan 2022 13:30:31 -0800
Message-ID: <CAO=noty9h088o+r02BHEqhj3n4YdDtPydbKBD_ziSyVzGMMrLQ@mail.gmail.com>
Subject: Re: i3c on Qemu
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="00000000000075769905d4c85962"
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
Cc: Hao Wu <wuhaotsh@google.com>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <leetroy@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000075769905d4c85962
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 3, 2022 at 1:47 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello Patrick,
>
>
> On 1/2/22 21:17, Patrick Venture wrote:
> > Hi Troy,
> >
> >
> >
> > On Wed, Dec 22, 2021 at 2:13 AM Troy Lee <leetroy@gmail.com <mailto:
> leetroy@gmail.com>> wrote:
> >
> >     Hi Patrick,
> >
> >     On Thu, Dec 9, 2021 at 3:02 AM Patrick Venture <venture@google.com
> <mailto:venture@google.com>> wrote:
> >      >
> >      > Hi all;
> >      >
> >      > With ast2600 and the nuvoton 8xx, we're seeing the introduction
> of i3c and I was curious if anyone on this list was already working on it
> for Aspeed or Qemu in general.
> >      >
> >      > Patrick
> >
> >     I have submitted an initial commit for I3C with ast2600.
> >     However, this isn't a real I3C model, and it is just good enough to
> >     bring Aspeed SDK image up.
> >
> >     https://patchwork.kernel.org/project/qemu-devel/list/?series=3D5992=
57
> <https://patchwork.kernel.org/project/qemu-devel/list/?series=3D599257>
> >
> >     Thanks,
> >     Troy Lee
> >
> >
> > Thanks, I saw that and I think it probably fixes our bootloop issue whe=
n
> i3c is enabled.  My team will be working actively on real i3c support in
> the coming months as we continue building support for the next Nuvoton So=
C
> and the ast2600.
>
> What kind of devices are you using ?
>

In terms of what i3c devices are going to be attached?  We are hooking up
something more complex, that I'm not sure I can describe or upstream.
Presumably we'll be able to find some device that can be upstreamed with
the support, beyond just the SoC IP blocks.


>
> Thanks,
>
> C.
>

--00000000000075769905d4c85962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 3, 2022 at 1:47 AM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Pat=
rick,<br>
<br>
<br>
On 1/2/22 21:17, Patrick Venture wrote:<br>
&gt; Hi Troy,<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Wed, Dec 22, 2021 at 2:13 AM Troy Lee &lt;<a href=3D"mailto:leetroy=
@gmail.com" target=3D"_blank">leetroy@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:leetroy@gmail.com" target=3D"_blank">leetroy@gmail.com</a>&gt;&gt; wr=
ote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Patrick,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Dec 9, 2021 at 3:02 AM Patrick Venture &lt;=
<a href=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com<=
/a> &lt;mailto:<a href=3D"mailto:venture@google.com" target=3D"_blank">vent=
ure@google.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi all;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; With ast2600 and the nuvoton 8xx, we&#39;re s=
eeing the introduction of i3c and I was curious if anyone on this list was =
already working on it for Aspeed or Qemu in general.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Patrick<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I have submitted an initial commit for I3C with ast=
2600.<br>
&gt;=C2=A0 =C2=A0 =C2=A0However, this isn&#39;t a real I3C model, and it is=
 just good enough to<br>
&gt;=C2=A0 =C2=A0 =C2=A0bring Aspeed SDK image up.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://patchwork.kernel.org/project/qem=
u-devel/list/?series=3D599257" rel=3D"noreferrer" target=3D"_blank">https:/=
/patchwork.kernel.org/project/qemu-devel/list/?series=3D599257</a> &lt;<a h=
ref=3D"https://patchwork.kernel.org/project/qemu-devel/list/?series=3D59925=
7" rel=3D"noreferrer" target=3D"_blank">https://patchwork.kernel.org/projec=
t/qemu-devel/list/?series=3D599257</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Troy Lee<br>
&gt; <br>
&gt; <br>
&gt; Thanks, I saw that and I think it probably fixes our bootloop issue wh=
en i3c is enabled.=C2=A0 My team will be working actively on real i3c suppo=
rt in the coming months as we continue building support for the next Nuvoto=
n SoC and the ast2600.<br>
<br>
What kind of devices are you using ?<br></blockquote><div><br></div><div>In=
 terms of what i3c devices are going to be attached?=C2=A0 We are hooking u=
p something more complex, that I&#39;m not sure I can describe or upstream.=
=C2=A0 Presumably we&#39;ll be able to find some device that can be upstrea=
med with the support, beyond just the SoC IP blocks.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
C.<br>
</blockquote></div></div>

--00000000000075769905d4c85962--
