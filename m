Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B45577DF
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 12:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTGfS5tzgz3bv4
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 20:27:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZTg5mD1H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=raviteja28031990@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZTg5mD1H;
	dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTGf04SSMz302W
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 20:27:19 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id p69so3247406iod.10
        for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ombs7UTq28QT/W9aZ4flUV50IpQvgcElCiReFHBXYQ=;
        b=ZTg5mD1Hk3E6GFMrhS4vKjoWrqeiLaYSbLGXjEbw3BjXToqEtK3AM6pcnPtHszmire
         Xj+5Wz33WicbAk+sRoN+322EXeBA6b7fmsAss7BebYJq/VwCbOh0iv7kWpFVk0Zstpmp
         zfGd00wlRLaBOPeyDTKMxKTXEqDmqbnYUEnEC/2H0ucM6dgTzIZvX0Yfd79O4IFAEuCh
         zhU+LVLaG/6F4arbz5wjXlUR583R0JwbmFW2PBnNp8Dz9CuyIbsqFQ0podawi453YqIC
         //D4CBTYtdeRqak3Gj7dL6gZXvAz/8JKZgHblHIjdhWAuP0kQnyND/etZQ+6FFXL2jBO
         mMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ombs7UTq28QT/W9aZ4flUV50IpQvgcElCiReFHBXYQ=;
        b=Y8pE4KCByuAxmgoHQ/0kmlUH2wlII1R+CwGc6mMjSrwuVDQy8u6ojNkFttjEO8O5WI
         CbJP0K8UaraIy4h9lDXZ2IRuEsHJnx+xny+iOmzxAvkh9sxRVCWLiag4kOwoyQsd5jaY
         acXzcPCma4wFq/B/vCL6biuXocpRVy6Lt9A7mUWmRSOqKdkI2/EXcJlbfJLzzx4al5UX
         +HHoOjTdGrCUcAtg/We/Q/ln2yvroQKv52kZ74HMGyd6dTXZDyob+yW+h8VR7QVsZcVi
         z0bSHKIG7BdAyw2QvaicFNQjoGjZBG8XDqDzXcGLc3qVSApYVa7DBKxmJDMLcuzDpJKX
         MhrA==
X-Gm-Message-State: AJIora82BsiQG4oAfMA7hbD5XXdl3DFat0iwelWtZ+5RBV1Y4fh//9xb
	ukgA1InR8cpsdmIcSxDN5nY2BnwHv/s1yqUhrKEE4CL13ms=
X-Google-Smtp-Source: AGRyM1u3Ls+kwxxQZYO9j44zS+UauSeOd3v6SMeOqefcUBRCZqhl/z6vg7LufiUuTuqXdMhwwAJr8TVnJYbMwNUCcLM=
X-Received: by 2002:a05:6602:160b:b0:669:d8c0:4be6 with SMTP id
 x11-20020a056602160b00b00669d8c04be6mr4345461iow.43.1655980036530; Thu, 23
 Jun 2022 03:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
 <2d93fd2f-bde5-22f2-373a-63398963e94f@linux.intel.com>
In-Reply-To: <2d93fd2f-bde5-22f2-373a-63398963e94f@linux.intel.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Thu, 23 Jun 2022 15:57:05 +0530
Message-ID: <CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com>
Subject: Re: OpenBMC Network Route Management: Metric and Static Route config support
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000d5262205e21ae596"
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

--000000000000d5262205e21ae596
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jiaqing

We have noticed an issue while using Static IPv4 addresses on both eth0 and
eth1.
We have configured a static private IP with the matching subnet of Laptop
Connected on eth0 and  configured a static public IP on eth1.
Both routes have got the metric value 0. eth0 route is the first entry of
the routing table which was being used for routing.


Ping to eth1 IP <9.x.x.84> does not work and that Eth0 private IP pings
from the laptop connected.

* IP  Config:*


2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen
1000

    link/ether 08:94:ef:82:4c:76 brd ff:ff:ff:ff:ff:ff

    inet 169.254.7.123/16 brd 169.254.255.255 scope link eth0

       valid_lft forever preferred_lft forever

    inet 10.x.x.100/24 brd 10.6.6.255 scope global eth0.          =E2=80=94=
>
Private IP (Connected to laptop)

       valid_lft forever preferred_lft forever

    inet6 fe80::a94:efff:fe82:4c76/64 scope link

       valid_lft forever preferred_lft forever

3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen
1000

    link/ether 08:94:ef:82:4c:77 brd ff:ff:ff:ff:ff:ff

    inet 9.x.x.84/24 brd 9.x.x.255 scope global eth1.               =E2=80=
=94>
Public IP

       valid_lft forever preferred_lft forever

    inet6 fe80::a94:efff:fe82:4c77/64 scope link

       valid_lft forever preferred_lft forever



* Routing table:*

Kernel IP routing table

Destination     Gateway         Genmask         Flags   MSS   Window  irtt
Iface

0.0.0.0                10.x.x.1             0.0.0.0           UG         0
    0           0   eth0

0.0.0.0                 9.x.x.1              0.0.0.0           UG        0
      0           0   eth1  <<=3D=3D=3D=3D not pingable.

9.x.x.0                 0.0.0.0         255.255.255.0   U          0       =
 0
          0   eth1

10.x.x.0               0.0.0.0         255.255.255.0   U          0
0          0   eth0

169.254.0.0        0.0.0.0         255.255.0.0        U          0         =
0
        0   eth0



But with DHCP enabled on eth1, dhcp subnet with metric value 1024 was
always at the bottom and was reachable
as DHCP routes  get priority over static routes.



Regards,

Raviteja

On Thu, Jun 23, 2022 at 12:34 PM Jiaqing Zhao <jiaqing.zhao@linux.intel.com=
>
wrote:

> Hi, Raviteja
>
> Can you help explain the routing issue you met?
>
> I've also met a metric-related issue. When there are 2 interfaces, one us=
e
> DHCP,
> the other use Static, systemd-networkd sets the metric 1024 on the
> DHCP-assigned
> default routev (metric for static default gateway is 0), which causing
> peers
> only reachable via the DHCP-assigned default route cannot be accessed.
>
> And in current OpenBMC implementation, I think we should allow setting
> null to
> Gateway of IPv4StaticAddress to not set default route on that interface.
>
> Thanks,
> Jiaqing
>
> On 2022-06-22 18:50, raviteja bailapudi wrote:
> > Hi Team
> >
> > We have hit network routing issues while using Static IPv4 addresses on
> > both eth0 and eth1,  as both default gateways at the interfaces were of
> the
> > same metric value. To solve this problem we are planning to provide an
> > interface for admins to set the metric value for the gateway while
> setting
> > up the Static IPv4 network on BMC.
> >
> >
> > To enable users to connect from outside-subnet clients, we also need to
> > support static routes on BMC.
> >
> >
> > I have started a thread in redfish forum as well
> >
> >
> https://redfishforum.com/thread/683/network-routing-table-management-supp=
ort
> >
> >
> > Please share your views on the same.
> >
> >
> >
> > Regards,
> >
> > Raviteja
> >
>

--000000000000d5262205e21ae596
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Jiaqing<div><br></div><div><p style=3D"margin:0px;font=
-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helveti=
ca Neue&quot;">We have noticed an issue while using Static IPv4 addresses o=
n both eth0 and eth1.<br>
We have configured a static private IP with the matching subnet of Laptop C=
onnected on eth0 and<span class=3D"gmail-Apple-converted-space">=C2=A0 </sp=
an>configured a static public IP on eth1.<br>Both routes=C2=A0have got=C2=
=A0the metric value 0. eth0 route is the first entry of the routing table w=
hich was being used for routing.<br>
</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><br></p><p style=3D"margin:0px;fo=
nt-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helve=
tica Neue&quot;">Ping to eth1 IP &lt;9.x.x.84&gt; does not work and that Et=
h0 private IP pings from the laptop connected.<br>
<br><b>
IP<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>Config:</b><br>
</p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:n=
ormal;font-family:&quot;Helvetica Neue&quot;"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">2: eth0: &lt;BROADCAST,MULTICAST,=
UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast qlen 1000</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 =C2=A0 </span>link/ether 08:94:ef:82:4c:76 brd ff:ff:ff:f=
f:ff:ff</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 =C2=A0 </span>inet <a href=3D"http://169.254.7.123/16">16=
9.254.7.123/16</a> brd 169.254.255.255 scope link eth0</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lf=
t forever</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 =C2=A0 </span>inet 10.x.x.100/24 brd 10.6.6.255 scope glo=
bal eth0.<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>=E2=80=94&gt; Private IP (Connected to laptop)</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lf=
t forever</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 =C2=A0 </span>inet6 fe80::a94:efff:fe82:4c76/64 scope lin=
k</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lf=
t forever</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">3: eth1: &lt;BROADCAST,MULTICAST,=
UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast qlen 1000</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 =C2=A0 </span>link/ether 08:94:ef:82:4c:77 brd ff:ff:ff:f=
f:ff:ff</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 =C2=A0 </span>inet 9.x.x.84/24 brd 9.x.x.255 scope global=
 eth1. <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>=E2=80=94&gt; Public IP<span class=3D"gmail=
-Apple-converted-space">=C2=A0</span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lf=
t forever</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 =C2=A0 </span>inet6 fe80::a94:efff:fe82:4c77/64 scope lin=
k</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 </span>valid_lft forever preferred_lf=
t forever</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><br>
<br><b>
Routing table:</b><br>
<br>
Kernel IP routing table</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">Destination <span class=3D"gmail-=
Apple-converted-space">=C2=A0 =C2=A0 </span>Gateway <span class=3D"gmail-Ap=
ple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>Genmask <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>Flags <=
span class=3D"gmail-Apple-converted-space">=C2=A0 </span>MSS <span class=3D=
"gmail-Apple-converted-space">=C2=A0 </span>Window<span class=3D"gmail-Appl=
e-converted-space">=C2=A0 </span>irtt<span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 </span>Iface</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">0.0.0.0<span class=3D"gmail-Apple=
-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>10.x.x.1 <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0.0.0.0 <span class=3D"gmail-Apple-conve=
rted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>UG <span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>0 <span class=
=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=
0 <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>eth0</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">0.0.0.0 <span class=3D"gmail-Appl=
e-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
</span>9.x.x.1<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0.0.0.0 <span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>UG<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0<span clas=
s=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <spa=
n class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
</span>0 <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>eth1<spa=
n class=3D"gmail-Apple-converted-space">=C2=A0 </span>&lt;&lt;=3D=3D=3D=3D =
not pingable.<span class=3D"gmail-Apple-converted-space">=C2=A0</span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">9.x.x.0 <span class=3D"gmail-Appl=
e-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
</span>0.0.0.0 <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>255.255.255.0 <span class=3D"gmail-Apple-converted-spa=
ce">=C2=A0 </span>U<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>0<span class=3D"gmail-Apple-converted-space=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <span class=3D"gmail-Apple-converted=
-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <span class=3D"gmail-Ap=
ple-converted-space">=C2=A0 </span>eth1</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">10.x.x.0 <span class=3D"gmail-App=
le-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span=
>0.0.0.0 <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span>255.255.255.0 <span class=3D"gmail-Apple-converted-space">=C2=
=A0 </span>U<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>0 <span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>0<span class=3D"gmail-Apple-converted-space=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <span class=3D"gmail-Apple-co=
nverted-space">=C2=A0 </span>eth0</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">169.254.0.0<span class=3D"gmail-A=
pple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0.0.0.0 <span clas=
s=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>255.25=
5.0.0<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>U<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>0 <span class=3D"gmail-Apple-converted-space">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>0<span class=3D"gmail-Apple-converted-space=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>0 <span class=3D"gmail-Apple-co=
nverted-space">=C2=A0 </span>eth0</p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;"><br>
<br>
But with DHCP enabled on eth1, dhcp subnet with metric value 1024 was alway=
s at the bottom and was reachable<br>
as DHCP routes<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>get=
 priority over static routes.=C2=A0</p><p style=3D"margin:0px;font-stretch:=
normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&q=
uot;"><br></p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;lin=
e-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p><p style=3D=
"margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font-fami=
ly:&quot;Helvetica Neue&quot;">Regards,</p><p style=3D"margin:0px;font-stre=
tch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Ne=
ue&quot;">Raviteja</p></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jun 23, 2022 at 12:34 PM Jiaqing Zhao=
 &lt;<a href=3D"mailto:jiaqing.zhao@linux.intel.com">jiaqing.zhao@linux.int=
el.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex">Hi, Raviteja<br>
<br>
Can you help explain the routing issue you met?<br>
<br>
I&#39;ve also met a metric-related issue. When there are 2 interfaces, one =
use DHCP,<br>
the other use Static, systemd-networkd sets the metric 1024 on the DHCP-ass=
igned<br>
default routev (metric for static default gateway is 0), which causing peer=
s<br>
only reachable via the DHCP-assigned default route cannot be accessed.<br>
<br>
And in current OpenBMC implementation, I think we should allow setting null=
 to<br>
Gateway of IPv4StaticAddress to not set default route on that interface.<br=
>
<br>
Thanks,<br>
Jiaqing<br>
<br>
On 2022-06-22 18:50, raviteja bailapudi wrote:<br>
&gt; Hi Team<br>
&gt; <br>
&gt; We have hit network routing issues while using Static IPv4 addresses o=
n<br>
&gt; both eth0 and eth1,=C2=A0 as both default gateways at the interfaces w=
ere of the<br>
&gt; same metric value. To solve this problem we are planning to provide an=
<br>
&gt; interface for admins to set the metric value for the gateway while set=
ting<br>
&gt; up the Static IPv4 network on BMC.<br>
&gt; <br>
&gt; <br>
&gt; To enable users to connect from outside-subnet clients, we also need t=
o<br>
&gt; support static routes on BMC.<br>
&gt; <br>
&gt; <br>
&gt; I have started a thread in redfish forum as well<br>
&gt; <br>
&gt; <a href=3D"https://redfishforum.com/thread/683/network-routing-table-m=
anagement-support" rel=3D"noreferrer" target=3D"_blank">https://redfishforu=
m.com/thread/683/network-routing-table-management-support</a><br>
&gt; <br>
&gt; <br>
&gt; Please share your views on the same.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Regards,<br>
&gt; <br>
&gt; Raviteja<br>
&gt; <br>
</blockquote></div>

--000000000000d5262205e21ae596--
