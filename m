Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F224B465A6A
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 01:07:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4GTv60kvz305t
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 11:06:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UClGVNQs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=pefoley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=UClGVNQs; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J43h70h52z2ynV
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 03:00:06 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id b187so20354063iof.11
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dnNkvOu1lPmKyodDz+OfHYm0OJFUeqHUL6ZaUULv7/M=;
 b=UClGVNQsccA+vrsHS0sqsiF1O4Cu5uZcsPiOF09xIYEQTGBGo9uI7uvKlzj1m9mOum
 9IH5ABRFi+CSMETgSv1U/LmDqTF0n0hwExeH9VPOTjkJS6N8oGYPxhlJ/y1CtABAChmK
 g1k5r4Z2wF/QP84D0TWPz8NqXKfFUxUeeptUviPHcweQCVGKVMNsmvuTiydJBEPhqIql
 0flp2vtwa82zS2TTJtpCIOdLUeJrh+z8db8gCdGmG3DHqBIDjF2W4XttloHC5J5jsWj3
 unEj+J3AfPTUnyq8GTibJyyrZNelxoByM7MZqdOEg3+eS98paGNeXHNFE6Sjrww7phmL
 Li0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dnNkvOu1lPmKyodDz+OfHYm0OJFUeqHUL6ZaUULv7/M=;
 b=p3ZntIXvumvQX7Y7DHiyIscXT+ZYf58Uv4T8yplXlAKowasY7ckT06WLtQFJZxVNzL
 lqA/1UV26L65khBly50LIfQCTh+w2higY4JPQhr1EpBI//45BxfIUFQ2XrCE2uEVjvcR
 p2b5MstVydHf8+ndwDxUyl7rEV8PNgqAr0ZftzbdU1aqQTFtgy3hyPamxljVSOWEQPyT
 idf07vasLJHqlZm+tD5L7GjGyVAt1IH/O0qP3mW8pSQR3Wk4MyDBi1ORhq1JEqFcfYZn
 H7MFAjZ5W7jMFbaVEfl3OWG019QK+pym9ekdVNrb74NjBk7rRAfprcoGFpWgPVqiZJUJ
 e4vA==
X-Gm-Message-State: AOAM533bHdHvnU+6w/V8AFDt+DocsVgs0rZiFsz2/tGwBpw5VKp43Xju
 w9qmM9gNrqC6vFgNJM4F3dNgsI0IJevCg6Hm3aL+7A==
X-Google-Smtp-Source: ABdhPJw3L8zOznCHE5zGagUqFQFkVCrgp7CabpuL8RjEO9LcnQ97XPoEFOZROvRwLYaZRmKqo+xvmOVWhwofDijCel8=
X-Received: by 2002:a02:6382:: with SMTP id j124mr11124371jac.64.1638374402654; 
 Wed, 01 Dec 2021 08:00:02 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
 <CACPK8XeXG9pnv7nWwCm=1bMNVO2a0y1YGuSohuMhB4Ous9hOFw@mail.gmail.com>
 <73fb026a-e488-cd92-50bb-38aac8616e66@kaod.org>
 <CAO=notx5mq0g0bL0pTfJEn8tgf1bKM=uUi2crR3z_vAvvxCe1w@mail.gmail.com>
In-Reply-To: <CAO=notx5mq0g0bL0pTfJEn8tgf1bKM=uUi2crR3z_vAvvxCe1w@mail.gmail.com>
From: Peter Foley <pefoley@google.com>
Date: Wed, 1 Dec 2021 10:59:51 -0500
Message-ID: <CAAAKUPMtuVFVXsnbKodCdTF4qicNuci373tD5sKhVm_3qZ6-vQ@mail.gmail.com>
Subject: Re: Using Qemu for BMC with a TAP interface
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="000000000000480f8405d217c466"
X-Mailman-Approved-At: Thu, 02 Dec 2021 11:06:02 +1100
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
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000480f8405d217c466
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The container system we're using (https://research.google/pubs/pub43438)
provides a set of FDs connected to a pre-configured TAP device, so I don't
think manual bridge configuration is an option.

On Tue, Nov 30, 2021 at 7:54 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Mon, Nov 22, 2021 at 12:14 AM C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>
>> Hello,
>>
>> On 11/22/21 08:20, Joel Stanley wrote:
>> > On Thu, 18 Nov 2021 at 20:35, Patrick Venture <venture@google.com>
>> wrote:
>> >>
>> >> Hi;
>> >>
>> >> We're working on wiring up our Qemu BMC via a TAP configuration, and
>> we're not seeing packets inside the Nuvoton NIC itself (a level of
>> debugging we had to enable).  We're using the npcm7xx SoC device,
>> >>
>> >> -nic
>> tap,fds=3D4:5:6:7:8:9:10:11,id=3Dnet0,model=3Dnpcm7xx-emc,mac=3D58:cb:52=
:18:b8:f7
>> >>
>> >> For the networking parameters, where the tap fds are valid.  I was
>> curious if any of y'all got qemu networking working for your BMC SoCs,
>> either Aspeed or Nuvoton?
>> >
>> > I've not tried using the -nic tap option with file descriptors. It's
>> > not quite clear what you're trying to do, or what your full setup
>> > looks like.
>>
>> yes. could you explain please ? It is simpler to run with a netdev bridg=
e
>> backend :
>>
>>    -net nic,macaddr=3DC0:FF:EE:00:00:03,netdev=3Dnet0 -netdev
>> bridge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0
>>
>
> Thanks for the replies and help.  I don't know why my mail didn't decide
> this should go in my inbox.  Probably user error on my part in the filter=
s.
>
> Peter, would a network bridge simplify life?  I imagine the file
> descriptor approach is because of the framework configuring Qemu, but
> wanted to ask.
>
>>
>>
>> Thanks,
>>
>> C.
>>
>> >
>> > I did test it out just now with a manually created tap interface:
>> >
>> > sudo ip tuntap add test0 mode tap group netdev
>> > sudo ip link set test0 up
>> > sudo tcpdump -i test0
>> >
>> > And then when I fired up a qemu instance,
>> >
>> > qemu-system-arm -nographic -M romulus-bmc -kernel arch/arm/boot/zImage
>> > -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -initrd arm.cpio.xz
>> > -nic tap,ifname=3Dtest0,id=3Dnet0
>> >
>> > I could see packets being decoded by the tcpdump instance (my laptop
>> > is 'voyager', qemu came up as fe80::5054:ff:fe12:3456):
>> >
>> > $ sudo tcpdump -i test0
>> > tcpdump: verbose output suppressed, use -v[v]... for full protocol
>> decode
>> > listening on test0, link-type EN10MB (Ethernet), snapshot length 26214=
4
>> bytes
>> > 15:10:32.683930 IP6 voyager > ip6-allrouters: ICMP6, router
>> > solicitation, length 16
>> > 15:10:33.655994 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
>> > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
>> > 15:10:37.795242 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
>> > router solicitation, length 16
>> > 15:11:05.688413 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
>> > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
>> > 15:11:07.499841 IP6 voyager > ip6-allrouters: ICMP6, router
>> > solicitation, length 16
>> > 15:11:11.079030 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
>> > router solicitation, length 16
>>
>
> Thanks, so with the ftgmac100 nic, you're able to talk to qemu via tap.  =
I
> didn't see any obvious differences in the npcm7xx_emc device.
>
>
>> >
>> > I've cc'd C=C3=A9dric as he is the king of qemu command lines.
>> >
>> > Cheers,
>> >
>> > Joel
>> >
>> >
>> >
>> >
>> >
>> >
>> >>
>> >> Patrick
>>
>>

--000000000000480f8405d217c466
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The container system we&#39;re using (<a href=3D"https://r=
esearch.google/pubs/pub43438">https://research.google/pubs/pub43438</a>) pr=
ovides a set of FDs connected to a pre-configured TAP device, so I don&#39;=
t think manual bridge configuration is an option.</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 30, 2021 at 7:=
54 PM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">venture@goo=
gle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 22, 2021 at 12:14 =
AM C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" target=3D"_bla=
nk">clg@kaod.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hello,<br>
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
</blockquote></div>

--000000000000480f8405d217c466--
