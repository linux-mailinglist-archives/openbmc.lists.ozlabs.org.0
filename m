Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D0465751
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 21:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4B0S2r2xz3c50
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 07:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oELmmLA4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::92c;
 helo=mail-ua1-x92c.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=oELmmLA4; dkim-atps=neutral
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4B003yhBz305c
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 07:44:14 +1100 (AEDT)
Received: by mail-ua1-x92c.google.com with SMTP id t13so51727890uad.9
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 12:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nVaUl52TTVx29MsNU5bShb7NBuyHZ0ZaPF/N0lOWd18=;
 b=oELmmLA49LiHQpd1Q9eht28Z8G8IFiusnV5zHSg/3gbflnDefWxG6Omx0lpdXVpHO0
 7GesMVwX6TqnUxzEThMa90nyA+Ek3KjYVUGhRQKqVYbp4QvLING1TWfkTD5exsyGnoy2
 lZ3aZtQzbtbRLw0oesXinRHQCh5VBfUGQmqQ1eI9gYpTEVg21t9H2o15T9J44D7BaZO7
 jeBzYeNfhYCVRnROIH0av/z9Rfd2g6zKiMfmspyq71nwjjcjATJPd1DnkgNrOcRNQNfB
 npwsft4itgbc9N/kwgSNLSGJmsyZ0jSc0o3FmLDv4wnukc//ytQgLzQhSEX4I41HhFmJ
 UfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nVaUl52TTVx29MsNU5bShb7NBuyHZ0ZaPF/N0lOWd18=;
 b=xpsZIQlvzQIaBW010Ran+exO+6suTkC36QTLzIiiHs5Y8FFnxCrTQgYm0XZXkjBGSG
 gYlrufiGWOfhx4+/yJMweRokx6O0WiRsNnmcRybLtIOFG/SWjEtPnksbbAVVyooENtiM
 MmHwy9tVT0X0WPWNjsaoqeV7WvXPyaInF2SKJlbsGqzjhyfXYuQZvLKdv3GwoHzswoQX
 77XzpBhXrmrFDe6eHGSqktnKXm4c0g3D//tdDwhiwe2yd0QeV6Su+ym3PMCobSxFsbOp
 x6svXr1kk/Q1Pnw5T8hbouCAQA3tuSmotIHn1O6O8zfFXAa1HqGqdC9GtSx3CNzqOwVM
 BHkA==
X-Gm-Message-State: AOAM530qJ5J2KV868ISbXwzichyHbUzcecpDjEvuhgKv5oJxQICYtSNe
 wVcSOcGdYfX9ncBfizYCKsolVz8XP0LzX/ytk3aB8cazfxs=
X-Google-Smtp-Source: ABdhPJxlFlbqa192gnWIortTT0jTNz87xwP0pdQpkIBJP0QXtF+zHbVNAbBa6OA56IGNIKARIKJSlZ1xsWSy7raQzo4=
X-Received: by 2002:ab0:36fa:: with SMTP id x26mr10793121uau.15.1638391451906; 
 Wed, 01 Dec 2021 12:44:11 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
 <CACPK8XeXG9pnv7nWwCm=1bMNVO2a0y1YGuSohuMhB4Ous9hOFw@mail.gmail.com>
 <73fb026a-e488-cd92-50bb-38aac8616e66@kaod.org>
 <CAO=notx5mq0g0bL0pTfJEn8tgf1bKM=uUi2crR3z_vAvvxCe1w@mail.gmail.com>
 <CAAAKUPMtuVFVXsnbKodCdTF4qicNuci373tD5sKhVm_3qZ6-vQ@mail.gmail.com>
 <e9f07099-c891-0668-3a39-6d5c95812902@kaod.org>
In-Reply-To: <e9f07099-c891-0668-3a39-6d5c95812902@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Wed, 1 Dec 2021 12:44:00 -0800
Message-ID: <CAO=notzbJeS8nU6Fyf9xtSsSBuwzH+DGEc=1q-n9-7Y_k=LjjA@mail.gmail.com>
Subject: Re: Using Qemu for BMC with a TAP interface
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="0000000000007edc3605d21bbcb1"
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
 Peter Foley <pefoley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007edc3605d21bbcb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 1, 2021 at 9:08 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 12/1/21 16:59, Peter Foley wrote:
> > The container system we're using (https://research.google/pubs/pub43438
> <https://research.google/pubs/pub43438>) provides a set of FDs connected
> to a pre-configured TAP device, so I don't think manual bridge
> configuration is an option.
>
> ok. That's interesting. You are running QEMU BMC machines (Nuvotons and
> Aspeed ?)
> wrapped in containers. Why BMC machines?
>

We're running BMC machines to validate BMC firmware.


>
> I guess we could reproduce the setup with a single instance to check
> issues but
> it's a lot of work for an uncommon scenario.
>
> Thanks,
>
> C.
>
>
> >
> > On Tue, Nov 30, 2021 at 7:54 PM Patrick Venture <venture@google.com
> <mailto:venture@google.com>> wrote:
> >
> >
> >
> >     On Mon, Nov 22, 2021 at 12:14 AM C=C3=A9dric Le Goater <clg@kaod.or=
g
> <mailto:clg@kaod.org>> wrote:
> >
> >         Hello,
> >
> >         On 11/22/21 08:20, Joel Stanley wrote:
> >          > On Thu, 18 Nov 2021 at 20:35, Patrick Venture <
> venture@google.com <mailto:venture@google.com>> wrote:
> >          >>
> >          >> Hi;
> >          >>
> >          >> We're working on wiring up our Qemu BMC via a TAP
> configuration, and we're not seeing packets inside the Nuvoton NIC itself
> (a level of debugging we had to enable).  We're using the npcm7xx SoC
> device,
> >          >>
> >          >> -nic
> tap,fds=3D4:5:6:7:8:9:10:11,id=3Dnet0,model=3Dnpcm7xx-emc,mac=3D58:cb:52:=
18:b8:f7
> >          >>
> >          >> For the networking parameters, where the tap fds are valid.
> I was curious if any of y'all got qemu networking working for your BMC
> SoCs, either Aspeed or Nuvoton?
> >          >
> >          > I've not tried using the -nic tap option with file
> descriptors. It's
> >          > not quite clear what you're trying to do, or what your full
> setup
> >          > looks like.
> >
> >         yes. could you explain please ? It is simpler to run with a
> netdev bridge
> >         backend :
> >
> >             -net nic,macaddr=3DC0:FF:EE:00:00:03,netdev=3Dnet0 -netdev
> bridge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0
> >
> >
> >     Thanks for the replies and help.  I don't know why my mail didn't
> decide this should go in my inbox.  Probably user error on my part in the
> filters.
> >
> >     Peter, would a network bridge simplify life?  I imagine the file
> descriptor approach is because of the framework configuring Qemu, but
> wanted to ask.
> >
> >
> >
> >         Thanks,
> >
> >         C.
> >
> >          >
> >          > I did test it out just now with a manually created tap
> interface:
> >          >
> >          > sudo ip tuntap add test0 mode tap group netdev
> >          > sudo ip link set test0 up
> >          > sudo tcpdump -i test0
> >          >
> >          > And then when I fired up a qemu instance,
> >          >
> >          > qemu-system-arm -nographic -M romulus-bmc -kernel
> arch/arm/boot/zImage
> >          > -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -initrd
> arm.cpio.xz
> >          > -nic tap,ifname=3Dtest0,id=3Dnet0
> >          >
> >          > I could see packets being decoded by the tcpdump instance (m=
y
> laptop
> >          > is 'voyager', qemu came up as fe80::5054:ff:fe12:3456):
> >          >
> >          > $ sudo tcpdump -i test0
> >          > tcpdump: verbose output suppressed, use -v[v]... for full
> protocol decode
> >          > listening on test0, link-type EN10MB (Ethernet), snapshot
> length 262144 bytes
> >          > 15:10:32.683930 IP6 voyager > ip6-allrouters: ICMP6, router
> >          > solicitation, length 16
> >          > 15:10:33.655994 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR
> (QM)?
> >          > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
> >          > 15:10:37.795242 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters=
:
> ICMP6,
> >          > router solicitation, length 16
> >          > 15:11:05.688413 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR
> (QM)?
> >          > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
> >          > 15:11:07.499841 IP6 voyager > ip6-allrouters: ICMP6, router
> >          > solicitation, length 16
> >          > 15:11:11.079030 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters=
:
> ICMP6,
> >          > router solicitation, length 16
> >
> >
> >     Thanks, so with the ftgmac100 nic, you're able to talk to qemu via
> tap.  I didn't see any obvious differences in the npcm7xx_emc device.
> >
> >          >
> >          > I've cc'd C=C3=A9dric as he is the king of qemu command line=
s.
> >          >
> >          > Cheers,
> >          >
> >          > Joel
> >          >
> >          >
> >          >
> >          >
> >          >
> >          >
> >          >>
> >          >> Patrick
> >
>
>

--0000000000007edc3605d21bbcb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 9:08 AM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/1/2=
1 16:59, Peter Foley wrote:<br>
&gt; The container system we&#39;re using (<a href=3D"https://research.goog=
le/pubs/pub43438" rel=3D"noreferrer" target=3D"_blank">https://research.goo=
gle/pubs/pub43438</a> &lt;<a href=3D"https://research.google/pubs/pub43438"=
 rel=3D"noreferrer" target=3D"_blank">https://research.google/pubs/pub43438=
</a>&gt;) provides a set of FDs connected to a pre-configured TAP device, s=
o I don&#39;t think manual bridge configuration is an option.<br>
<br>
ok. That&#39;s interesting. You are running QEMU BMC machines (Nuvotons and=
 Aspeed ?)<br>
wrapped in containers. Why BMC machines?<br></blockquote><div><br></div><di=
v>We&#39;re running BMC machines to validate BMC firmware.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I guess we could reproduce the setup with a single instance to check issues=
 but<br>
it&#39;s a lot of work for an uncommon scenario.<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
<br>
&gt; <br>
&gt; On Tue, Nov 30, 2021 at 7:54 PM Patrick Venture &lt;<a href=3D"mailto:=
venture@google.com" target=3D"_blank">venture@google.com</a> &lt;mailto:<a =
href=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</a>=
&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Nov 22, 2021 at 12:14 AM C=C3=A9dric Le Goa=
ter &lt;<a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.org</a> =
&lt;mailto:<a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.org</=
a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hello,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 11/22/21 08:20, Joel Stanley wrote=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; On Thu, 18 Nov 2021 at 20:35, P=
atrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">=
venture@google.com</a> &lt;mailto:<a href=3D"mailto:venture@google.com" tar=
get=3D"_blank">venture@google.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; Hi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; We&#39;re working on wiring=
 up our Qemu BMC via a TAP configuration, and we&#39;re not seeing packets =
inside the Nuvoton NIC itself (a level of debugging we had to enable).=C2=
=A0 We&#39;re using the npcm7xx SoC device,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; -nic tap,fds=3D4:5:6:7:8:9:=
10:11,id=3Dnet0,model=3Dnpcm7xx-emc,mac=3D58:cb:52:18:b8:f7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; For the networking paramete=
rs, where the tap fds are valid.=C2=A0 I was curious if any of y&#39;all go=
t qemu networking working for your BMC SoCs, either Aspeed or Nuvoton?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; I&#39;ve not tried using the -n=
ic tap option with file descriptors. It&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; not quite clear what you&#39;re=
 trying to do, or what your full setup<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; looks like.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes. could you explain please ? It is=
 simpler to run with a netdev bridge<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-net nic,macaddr=3DC0:F=
F:EE:00:00:03,netdev=3Dnet0 -netdev bridge,id=3Dnet0,helper=3D/usr/libexec/=
qemu-bridge-helper,br=3Dvirbr0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks for the replies and help.=C2=A0 I don&#39;t =
know why my mail didn&#39;t decide this should go in my inbox.=C2=A0 Probab=
ly user error on my part in the filters.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Peter, would a network bridge simplify life?=C2=A0 =
I imagine the file descriptor approach is because of the framework configur=
ing Qemu, but wanted to ask.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0C.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; I did test it out just now with=
 a manually created tap interface:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; sudo ip tuntap add test0 mode t=
ap group netdev<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; sudo ip link set test0 up<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; sudo tcpdump -i test0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; And then when I fired up a qemu=
 instance,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; qemu-system-arm -nographic -M r=
omulus-bmc -kernel arch/arm/boot/zImage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; -dtb arch/arm/boot/dts/aspeed-b=
mc-opp-romulus.dtb -initrd arm.cpio.xz<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; -nic tap,ifname=3Dtest0,id=3Dne=
t0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; I could see packets being decod=
ed by the tcpdump instance (my laptop<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; is &#39;voyager&#39;, qemu came=
 up as fe80::5054:ff:fe12:3456):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; $ sudo tcpdump -i test0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; tcpdump: verbose output suppres=
sed, use -v[v]... for full protocol decode<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; listening on test0, link-type E=
N10MB (Ethernet), snapshot length 262144 bytes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; 15:10:32.683930 IP6 voyager &gt=
; ip6-allrouters: ICMP6, router<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; solicitation, length 16<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; 15:10:33.655994 IP6 voyager.mdn=
s &gt; ff02::fb.mdns: 0 [2q] PTR (QM)?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; _ipps._tcp.local. PTR (QM)? _ip=
p._tcp.local. (45)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; 15:10:37.795242 IP6 fe80::5054:=
ff:fe12:3456 &gt; ip6-allrouters: ICMP6,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; router solicitation, length 16<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; 15:11:05.688413 IP6 voyager.mdn=
s &gt; ff02::fb.mdns: 0 [2q] PTR (QM)?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; _ipps._tcp.local. PTR (QM)? _ip=
p._tcp.local. (45)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; 15:11:07.499841 IP6 voyager &gt=
; ip6-allrouters: ICMP6, router<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; solicitation, length 16<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; 15:11:11.079030 IP6 fe80::5054:=
ff:fe12:3456 &gt; ip6-allrouters: ICMP6,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; router solicitation, length 16<=
br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks, so with the=C2=A0ftgmac100=C2=A0nic, you&#3=
9;re able to talk to qemu via tap.=C2=A0 I didn&#39;t see any obvious diffe=
rences in the=C2=A0npcm7xx_emc device.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; I&#39;ve cc&#39;d C=C3=A9dric a=
s he is the king of qemu command lines.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Joel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; Patrick<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000007edc3605d21bbcb1--
