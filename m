Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7246444D
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 01:55:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3gbn5GK1z307C
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 11:55:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HmJJ1ze0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::935;
 helo=mail-ua1-x935.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=HmJJ1ze0; dkim-atps=neutral
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3gbK6rSFz2yyf
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 11:54:35 +1100 (AEDT)
Received: by mail-ua1-x935.google.com with SMTP id o1so45383389uap.4
 for <openbmc@lists.ozlabs.org>; Tue, 30 Nov 2021 16:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8WulkIfLzBbOGkkRdLNeqSJW7xYSL19hwbVVrU3dROA=;
 b=HmJJ1ze0pOvoF5q0ueJXJUuBOPkcsMZFrTfMOcyI1BSUTQlW/oP9/tSYnf/XWR4smu
 olTc891guyejYXKHBe86Fj7SwjN5/cjjSdUDtaNUSIvd+nRmELT8veJFpPg+hjme21JN
 6K136YithaPkSzzvgEi/jmb7F4Yrq7cIXemReUarXPXjPpt+tYS4v1K6rwL0b02th0EK
 +iJE1/faGG7wKSOKuJ7yLuLBVJNrYMk9HmLc2diwPiFyjXdQQgi+og5x27T9Xb6zyQRA
 spZvfyAXSTbyUUBUiggpUbtQpQzyCTZeBvUoAkICi3mQpqolGB4MklgeS9R/S+7R/DXg
 0jyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8WulkIfLzBbOGkkRdLNeqSJW7xYSL19hwbVVrU3dROA=;
 b=iGNmT1o+7yfBdXD9XF3qXv4Ara1+NHaJljazSiI+YhRWhxMO2ldxMI6lcB9+Jc/rAH
 jEuQtKgBaCc5Gcemyhdg+pnxgg6065htVUmCcxQShLgJhcd/hR7kmwOr9lNpoC3SlHKw
 ze1rkITj6vdPvI/37p46p+LBcrSD4EfpVookNEBa6ZxRzs09xy/nmf2d+Aj3mKdCp/hI
 xYS5S8yD2Lv92pGl7wr4FiUwObetsMzsBOyAPkAwdj56tjnpWjPdUZTV1uOodcQ3T9c1
 7t82/XdjfxQ8o8/mNKerT6STVneU8tnmJvu16oNf35lNhN8CaLZRDgk9KygE9CoeH0gy
 A5JQ==
X-Gm-Message-State: AOAM532kEF4QVFe/XWeNsTQGLOd0aDW7CCm/Yei15MhPzjz10KT+e4hq
 mqshRDF9Mig81nenlofrwEJUpfYTDxMw95xXnAO2mQ==
X-Google-Smtp-Source: ABdhPJxcJ8DgEh9L9rDSpeV8uFCzQfCCBu/aCxHGFPQD9JFocejehC3nzBegz+B8uUOS9JEVnXWC49wuU7d/mttF/4U=
X-Received: by 2002:a67:d28b:: with SMTP id z11mr4126404vsi.49.1638320071964; 
 Tue, 30 Nov 2021 16:54:31 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
 <CACPK8XeXG9pnv7nWwCm=1bMNVO2a0y1YGuSohuMhB4Ous9hOFw@mail.gmail.com>
 <73fb026a-e488-cd92-50bb-38aac8616e66@kaod.org>
In-Reply-To: <73fb026a-e488-cd92-50bb-38aac8616e66@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Tue, 30 Nov 2021 16:54:20 -0800
Message-ID: <CAO=notx5mq0g0bL0pTfJEn8tgf1bKM=uUi2crR3z_vAvvxCe1w@mail.gmail.com>
Subject: Re: Using Qemu for BMC with a TAP interface
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="000000000000eb4dff05d20b1dc1"
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

--000000000000eb4dff05d20b1dc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 12:14 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:

> Hello,
>
> On 11/22/21 08:20, Joel Stanley wrote:
> > On Thu, 18 Nov 2021 at 20:35, Patrick Venture <venture@google.com>
> wrote:
> >>
> >> Hi;
> >>
> >> We're working on wiring up our Qemu BMC via a TAP configuration, and
> we're not seeing packets inside the Nuvoton NIC itself (a level of
> debugging we had to enable).  We're using the npcm7xx SoC device,
> >>
> >> -nic
> tap,fds=3D4:5:6:7:8:9:10:11,id=3Dnet0,model=3Dnpcm7xx-emc,mac=3D58:cb:52:=
18:b8:f7
> >>
> >> For the networking parameters, where the tap fds are valid.  I was
> curious if any of y'all got qemu networking working for your BMC SoCs,
> either Aspeed or Nuvoton?
> >
> > I've not tried using the -nic tap option with file descriptors. It's
> > not quite clear what you're trying to do, or what your full setup
> > looks like.
>
> yes. could you explain please ? It is simpler to run with a netdev bridge
> backend :
>
>    -net nic,macaddr=3DC0:FF:EE:00:00:03,netdev=3Dnet0 -netdev
> bridge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0
>

Thanks for the replies and help.  I don't know why my mail didn't decide
this should go in my inbox.  Probably user error on my part in the filters.

Peter, would a network bridge simplify life?  I imagine the file descriptor
approach is because of the framework configuring Qemu, but wanted to ask.

>
>
> Thanks,
>
> C.
>
> >
> > I did test it out just now with a manually created tap interface:
> >
> > sudo ip tuntap add test0 mode tap group netdev
> > sudo ip link set test0 up
> > sudo tcpdump -i test0
> >
> > And then when I fired up a qemu instance,
> >
> > qemu-system-arm -nographic -M romulus-bmc -kernel arch/arm/boot/zImage
> > -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -initrd arm.cpio.xz
> > -nic tap,ifname=3Dtest0,id=3Dnet0
> >
> > I could see packets being decoded by the tcpdump instance (my laptop
> > is 'voyager', qemu came up as fe80::5054:ff:fe12:3456):
> >
> > $ sudo tcpdump -i test0
> > tcpdump: verbose output suppressed, use -v[v]... for full protocol deco=
de
> > listening on test0, link-type EN10MB (Ethernet), snapshot length 262144
> bytes
> > 15:10:32.683930 IP6 voyager > ip6-allrouters: ICMP6, router
> > solicitation, length 16
> > 15:10:33.655994 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
> > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
> > 15:10:37.795242 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
> > router solicitation, length 16
> > 15:11:05.688413 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
> > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
> > 15:11:07.499841 IP6 voyager > ip6-allrouters: ICMP6, router
> > solicitation, length 16
> > 15:11:11.079030 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
> > router solicitation, length 16
>

Thanks, so with the ftgmac100 nic, you're able to talk to qemu via tap.  I
didn't see any obvious differences in the npcm7xx_emc device.


> >
> > I've cc'd C=C3=A9dric as he is the king of qemu command lines.
> >
> > Cheers,
> >
> > Joel
> >
> >
> >
> >
> >
> >
> >>
> >> Patrick
>
>

--000000000000eb4dff05d20b1dc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 22, 2021 at 12:14 AM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br=
>
<br>
On 11/22/21 08:20, Joel Stanley wrote:<br>
&gt; On Thu, 18 Nov 2021 at 20:35, Patrick Venture &lt;<a href=3D"mailto:ve=
nture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi;<br>
&gt;&gt;<br>
&gt;&gt; We&#39;re working on wiring up our Qemu BMC via a TAP configuratio=
n, and we&#39;re not seeing packets inside the Nuvoton NIC itself (a level =
of debugging we had to enable).=C2=A0 We&#39;re using the npcm7xx SoC devic=
e,<br>
&gt;&gt;<br>
&gt;&gt; -nic tap,fds=3D4:5:6:7:8:9:10:11,id=3Dnet0,model=3Dnpcm7xx-emc,mac=
=3D58:cb:52:18:b8:f7<br>
&gt;&gt;<br>
&gt;&gt; For the networking parameters, where the tap fds are valid.=C2=A0 =
I was curious if any of y&#39;all got qemu networking working for your BMC =
SoCs, either Aspeed or Nuvoton?<br>
&gt; <br>
&gt; I&#39;ve not tried using the -nic tap option with file descriptors. It=
&#39;s<br>
&gt; not quite clear what you&#39;re trying to do, or what your full setup<=
br>
&gt; looks like.<br>
<br>
yes. could you explain please ? It is simpler to run with a netdev bridge<b=
r>
backend :<br>
<br>
=C2=A0 =C2=A0-net nic,macaddr=3DC0:FF:EE:00:00:03,netdev=3Dnet0 -netdev bri=
dge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0<br></blo=
ckquote><div><br></div><div>Thanks for the replies and help.=C2=A0 I don&#3=
9;t know why my mail didn&#39;t decide this should go in my inbox.=C2=A0 Pr=
obably user error on my part in the filters.</div><div><br></div><div>Peter=
, would a network bridge simplify life?=C2=A0 I imagine the file descriptor=
 approach is because of the framework configuring Qemu, but wanted to ask.<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
&gt; <br>
&gt; I did test it out just now with a manually created tap interface:<br>
&gt; <br>
&gt; sudo ip tuntap add test0 mode tap group netdev<br>
&gt; sudo ip link set test0 up<br>
&gt; sudo tcpdump -i test0<br>
&gt; <br>
&gt; And then when I fired up a qemu instance,<br>
&gt; <br>
&gt; qemu-system-arm -nographic -M romulus-bmc -kernel arch/arm/boot/zImage=
<br>
&gt; -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -initrd arm.cpio.xz<=
br>
&gt; -nic tap,ifname=3Dtest0,id=3Dnet0<br>
&gt; <br>
&gt; I could see packets being decoded by the tcpdump instance (my laptop<b=
r>
&gt; is &#39;voyager&#39;, qemu came up as fe80::5054:ff:fe12:3456):<br>
&gt; <br>
&gt; $ sudo tcpdump -i test0<br>
&gt; tcpdump: verbose output suppressed, use -v[v]... for full protocol dec=
ode<br>
&gt; listening on test0, link-type EN10MB (Ethernet), snapshot length 26214=
4 bytes<br>
&gt; 15:10:32.683930 IP6 voyager &gt; ip6-allrouters: ICMP6, router<br>
&gt; solicitation, length 16<br>
&gt; 15:10:33.655994 IP6 voyager.mdns &gt; ff02::fb.mdns: 0 [2q] PTR (QM)?<=
br>
&gt; _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)<br>
&gt; 15:10:37.795242 IP6 fe80::5054:ff:fe12:3456 &gt; ip6-allrouters: ICMP6=
,<br>
&gt; router solicitation, length 16<br>
&gt; 15:11:05.688413 IP6 voyager.mdns &gt; ff02::fb.mdns: 0 [2q] PTR (QM)?<=
br>
&gt; _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)<br>
&gt; 15:11:07.499841 IP6 voyager &gt; ip6-allrouters: ICMP6, router<br>
&gt; solicitation, length 16<br>
&gt; 15:11:11.079030 IP6 fe80::5054:ff:fe12:3456 &gt; ip6-allrouters: ICMP6=
,<br>
&gt; router solicitation, length 16<br></blockquote><div><br></div><div>Tha=
nks, so with the=C2=A0ftgmac100=C2=A0nic, you&#39;re able to talk to qemu v=
ia tap.=C2=A0 I didn&#39;t see any obvious differences in the=C2=A0npcm7xx_=
emc device.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; <br>
&gt; I&#39;ve cc&#39;d C=C3=A9dric as he is the king of qemu command lines.=
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Joel<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Patrick<br>
<br>
</blockquote></div></div>

--000000000000eb4dff05d20b1dc1--
