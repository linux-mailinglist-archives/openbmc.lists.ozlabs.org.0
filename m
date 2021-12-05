Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70B468C28
	for <lists+openbmc@lfdr.de>; Sun,  5 Dec 2021 17:45:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6XW12psVz2ynD
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 03:45:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=L+kpG78t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::932;
 helo=mail-ua1-x932.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=L+kpG78t; dkim-atps=neutral
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6XVb03Fmz2xX8
 for <openbmc@lists.ozlabs.org>; Mon,  6 Dec 2021 03:45:24 +1100 (AEDT)
Received: by mail-ua1-x932.google.com with SMTP id p2so15125330uad.11
 for <openbmc@lists.ozlabs.org>; Sun, 05 Dec 2021 08:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5W5wouMmM7LyV+dnXGCqb2HAL6oM7FCza1B+p7zRL9o=;
 b=L+kpG78tgJWuN9vGky5B9hZOCp2lQhkS5mSZGan7HlbXErLVDljcHtcRY/sND4XcVf
 xyMqKV1mEf8nS299+bxcLWdXObHd9YU+NT73nBaliSkDqalmpuE8EgwnbsX8nwBkvjjt
 /ML8+w8Y7MPIqfUVtqJIQTRhFiBhSroJKMIS1Nx8exm6GXsprKL3WSbfN6t3vP3MFP+1
 B6wdz3XpxPWOT/qMxVDL0uz1GoV52FEIeaF0FGa5cwiG6SSjXOsfyKNB5sr1sV73b35y
 inOywGwMFeFqprNgRGqWWjVmCnlETSNDW5cF/ld/0WJXGQciyJ21QJYfmiqBHEnZaJVn
 tnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5W5wouMmM7LyV+dnXGCqb2HAL6oM7FCza1B+p7zRL9o=;
 b=F74W7TyZI3YvBqtvk7BRxPGT3Cdo8eTFyAirEKHY2aYb6nz7eRVYIE47mgL1cVfMlv
 qJHXKtJzjrnGnz//A3GkFuuz/62GTD8DfBo4MFZD8Gc10AtJHE0/D030wLe7/WG7RPKh
 6rNQmubzNS1GUmjMOUJW47tLVAo2IwsTAjzszqd2BV8O595ajj2hUXFf6bfjmiCzCy55
 ajbl+WUTNUxMNHWk8JNtYKmPbylmIkOOrQisUV/BS7762xAvGicsWWXNDE8M5g8pva4v
 euk1ROBzAUJ4IgchkQPFd+j1czEJyUmiNa0TxWBWGE2PRXgqJuYlp9fVFnpvi6+GzOGu
 u07w==
X-Gm-Message-State: AOAM53319lD2/ZLf3901Yru4tZwWFvUAZzIroDdcE8XDhHF4E4fdkPDP
 nyP6QZx5n6K8VYnpIk8ez9i1AMyJvUmIT5AK3Lca9A==
X-Google-Smtp-Source: ABdhPJwbNIoKXvXjL200D2vzWn7ijMdCDEhy/UoKi1bQRjnV2k/4uvqe2r6VVu+7IHbi+4ut5YSDeVwKrqDCRqRCb6c=
X-Received: by 2002:a67:d28b:: with SMTP id z11mr30890193vsi.49.1638722718774; 
 Sun, 05 Dec 2021 08:45:18 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
 <CACPK8XeXG9pnv7nWwCm=1bMNVO2a0y1YGuSohuMhB4Ous9hOFw@mail.gmail.com>
 <73fb026a-e488-cd92-50bb-38aac8616e66@kaod.org>
 <CAO=notx5mq0g0bL0pTfJEn8tgf1bKM=uUi2crR3z_vAvvxCe1w@mail.gmail.com>
 <CAAAKUPMtuVFVXsnbKodCdTF4qicNuci373tD5sKhVm_3qZ6-vQ@mail.gmail.com>
 <e9f07099-c891-0668-3a39-6d5c95812902@kaod.org>
 <CAO=notzbJeS8nU6Fyf9xtSsSBuwzH+DGEc=1q-n9-7Y_k=LjjA@mail.gmail.com>
In-Reply-To: <CAO=notzbJeS8nU6Fyf9xtSsSBuwzH+DGEc=1q-n9-7Y_k=LjjA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Sun, 5 Dec 2021 08:45:07 -0800
Message-ID: <CAO=notw37DMOfzcgj2rwjiP10jPZZErLCRNEM9PJao_A=2aYpQ@mail.gmail.com>
Subject: Re: Using Qemu for BMC with a TAP interface
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="0000000000008b211d05d268dd2d"
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

--0000000000008b211d05d268dd2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 1, 2021 at 12:44 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Wed, Dec 1, 2021 at 9:08 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
>> On 12/1/21 16:59, Peter Foley wrote:
>> > The container system we're using (https://research.google/pubs/pub4343=
8
>> <https://research.google/pubs/pub43438>) provides a set of FDs connected
>> to a pre-configured TAP device, so I don't think manual bridge
>> configuration is an option.
>>
>> ok. That's interesting. You are running QEMU BMC machines (Nuvotons and
>> Aspeed ?)
>> wrapped in containers. Why BMC machines?
>>
>
> We're running BMC machines to validate BMC firmware.
>
>
>>
>> I guess we could reproduce the setup with a single instance to check
>> issues but
>> it's a lot of work for an uncommon scenario.
>>
>
https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg00450.html - turns
out at least this was a bug preventing packets from being received.  The
tap fd wasn't being reactivated in all cases.


>
>> Thanks,
>>
>> C.
>>
>>
>> >
>> > On Tue, Nov 30, 2021 at 7:54 PM Patrick Venture <venture@google.com
>> <mailto:venture@google.com>> wrote:
>> >
>> >
>> >
>> >     On Mon, Nov 22, 2021 at 12:14 AM C=C3=A9dric Le Goater <clg@kaod.o=
rg
>> <mailto:clg@kaod.org>> wrote:
>> >
>> >         Hello,
>> >
>> >         On 11/22/21 08:20, Joel Stanley wrote:
>> >          > On Thu, 18 Nov 2021 at 20:35, Patrick Venture <
>> venture@google.com <mailto:venture@google.com>> wrote:
>> >          >>
>> >          >> Hi;
>> >          >>
>> >          >> We're working on wiring up our Qemu BMC via a TAP
>> configuration, and we're not seeing packets inside the Nuvoton NIC itsel=
f
>> (a level of debugging we had to enable).  We're using the npcm7xx SoC
>> device,
>> >          >>
>> >          >> -nic
>> tap,fds=3D4:5:6:7:8:9:10:11,id=3Dnet0,model=3Dnpcm7xx-emc,mac=3D58:cb:52=
:18:b8:f7
>> >          >>
>> >          >> For the networking parameters, where the tap fds are
>> valid.  I was curious if any of y'all got qemu networking working for yo=
ur
>> BMC SoCs, either Aspeed or Nuvoton?
>> >          >
>> >          > I've not tried using the -nic tap option with file
>> descriptors. It's
>> >          > not quite clear what you're trying to do, or what your full
>> setup
>> >          > looks like.
>> >
>> >         yes. could you explain please ? It is simpler to run with a
>> netdev bridge
>> >         backend :
>> >
>> >             -net nic,macaddr=3DC0:FF:EE:00:00:03,netdev=3Dnet0 -netdev
>> bridge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0
>> >
>> >
>> >     Thanks for the replies and help.  I don't know why my mail didn't
>> decide this should go in my inbox.  Probably user error on my part in th=
e
>> filters.
>> >
>> >     Peter, would a network bridge simplify life?  I imagine the file
>> descriptor approach is because of the framework configuring Qemu, but
>> wanted to ask.
>> >
>> >
>> >
>> >         Thanks,
>> >
>> >         C.
>> >
>> >          >
>> >          > I did test it out just now with a manually created tap
>> interface:
>> >          >
>> >          > sudo ip tuntap add test0 mode tap group netdev
>> >          > sudo ip link set test0 up
>> >          > sudo tcpdump -i test0
>> >          >
>> >          > And then when I fired up a qemu instance,
>> >          >
>> >          > qemu-system-arm -nographic -M romulus-bmc -kernel
>> arch/arm/boot/zImage
>> >          > -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -initrd
>> arm.cpio.xz
>> >          > -nic tap,ifname=3Dtest0,id=3Dnet0
>> >          >
>> >          > I could see packets being decoded by the tcpdump instance
>> (my laptop
>> >          > is 'voyager', qemu came up as fe80::5054:ff:fe12:3456):
>> >          >
>> >          > $ sudo tcpdump -i test0
>> >          > tcpdump: verbose output suppressed, use -v[v]... for full
>> protocol decode
>> >          > listening on test0, link-type EN10MB (Ethernet), snapshot
>> length 262144 bytes
>> >          > 15:10:32.683930 IP6 voyager > ip6-allrouters: ICMP6, router
>> >          > solicitation, length 16
>> >          > 15:10:33.655994 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PT=
R
>> (QM)?
>> >          > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
>> >          > 15:10:37.795242 IP6 fe80::5054:ff:fe12:3456 >
>> ip6-allrouters: ICMP6,
>> >          > router solicitation, length 16
>> >          > 15:11:05.688413 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PT=
R
>> (QM)?
>> >          > _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
>> >          > 15:11:07.499841 IP6 voyager > ip6-allrouters: ICMP6, router
>> >          > solicitation, length 16
>> >          > 15:11:11.079030 IP6 fe80::5054:ff:fe12:3456 >
>> ip6-allrouters: ICMP6,
>> >          > router solicitation, length 16
>> >
>> >
>> >     Thanks, so with the ftgmac100 nic, you're able to talk to qemu via
>> tap.  I didn't see any obvious differences in the npcm7xx_emc device.
>> >
>> >          >
>> >          > I've cc'd C=C3=A9dric as he is the king of qemu command lin=
es.
>> >          >
>> >          > Cheers,
>> >          >
>> >          > Joel
>> >          >
>> >          >
>> >          >
>> >          >
>> >          >
>> >          >
>> >          >>
>> >          >> Patrick
>> >
>>
>>

--0000000000008b211d05d268dd2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 12:44 PM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 9:08 AM C=C3=A9dri=
c Le Goater &lt;<a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 12/1/21 16:59, Peter Foley wrote:<br>
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
it&#39;s a lot of work for an uncommon scenario.<br></blockquote></div></di=
v></blockquote><div><br></div><div><a href=3D"https://lists.gnu.org/archive=
/html/qemu-devel/2021-12/msg00450.html">https://lists.gnu.org/archive/html/=
qemu-devel/2021-12/msg00450.html</a> - turns out at least this was a bug pr=
eventing packets from being received.=C2=A0 The tap fd wasn&#39;t being rea=
ctivated in all cases.<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--0000000000008b211d05d268dd2d--
