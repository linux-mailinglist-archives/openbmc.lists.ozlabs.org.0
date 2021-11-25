Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E068345D6D8
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 10:07:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0BpC5k1Fz304j
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 20:06:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HZK4VsQ8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532;
 helo=mail-ed1-x532.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HZK4VsQ8; dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Bnr00M2z2yHj
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 20:06:37 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id e3so22564305edu.4
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 01:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0MInhsQvClu91hZw53H92dIVcsuMSIK1fQ7kYWoDlM8=;
 b=HZK4VsQ8mBSKTnmjuRDggyFqErMw+A7LhaJh0pHdOafTt84gSmOQytOEd1Lw1Qftur
 bCGeuf0Qj0xDe31nhKo9Tdd1az1eUFBrh1b4e1nljme0HWmAwudtEWmj3ZBY5fKL6+DV
 k1GuBxXniWMBL6w/7+84Q+oFNOfD8WtgzT0pW1GWiy9j0Yx6LdTF12oiJYfusqaJgiiS
 oT/mYNFvViCw22lE9LHDhwlV6HbY2CiT4R9LpdeNrb79o2advDAH1QjkcLywPCazDqKT
 EvlKE82AhxpgCXA83zS7+riJIJHkyYuV5326DTS9DyTd5t3TEd2HwuFP51Q8UMa+nti3
 xwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0MInhsQvClu91hZw53H92dIVcsuMSIK1fQ7kYWoDlM8=;
 b=0w887f5rk6Rkl7fQEMc591yaKlb2CVPNZFYZboE6pzBYAPdduIQTgz/tiyRqAWwQT6
 Hw+xAp0VqA8rmP+TtAA5nQ2PeHCt98255NPpXsmUX+gCjk6XDK1jW6E08huITqAc3yE1
 zMAQxUXvwQe3byl8ptYUHybwuxOz4/A/FO/1FmGILlM5NZY+t7KgJfYqsCKTR/5X82EA
 CgyVx3fYd6EvQOjRr4xEl99B9MXW16po37XOWDqO5Lr1CYnG079zrD5VXX+/3HLsH/Rf
 8F5Gy2IVNUpDZeuL54VAhiyuS8WuaMiLJ5+RRJ1FKIEj4ygWfp1OVHVoPYNFV8Cl85WH
 4Iug==
X-Gm-Message-State: AOAM533GRh2zY3gJNrqfnMv5qrCPMp5o+U1xkA/YczsDjiFIBMJPUKSB
 C6czWFlATeBupkoAxNqdV+fn7j63bHC69Bq/J5E=
X-Google-Smtp-Source: ABdhPJzAie2vC/SMC0tjZoewRK7IJ25apf53tA7xs4R45UDJfXYLQ1GPc2VfXv0Lv/CD1WbBguUWURIVCKFuO4xDZ4k=
X-Received: by 2002:a05:6402:147:: with SMTP id
 s7mr36387746edu.8.1637831193997; 
 Thu, 25 Nov 2021 01:06:33 -0800 (PST)
MIME-Version: 1.0
References: <CAA7Tbcuhk3tY-XBw2C6xtV9MEsp-Ba2GW8PZpVqj2YQNcrHb6Q@mail.gmail.com>
 <CAH2-KxDNqXZ3uWeeUyP=uE=e6FAvzYKZYJoJLaeG0wGZzXBwzw@mail.gmail.com>
In-Reply-To: <CAH2-KxDNqXZ3uWeeUyP=uE=e6FAvzYKZYJoJLaeG0wGZzXBwzw@mail.gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Thu, 25 Nov 2021 14:38:29 +0530
Message-ID: <CAA7Tbcuy-FE19ygYOivGxoSRZAoPu+r-B1uoSXNJ=R7CYXhh3A@mail.gmail.com>
Subject: Re: FRU Device type one byte or Two byte Validation
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="0000000000008533b605d1994aa3"
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, vernon.mauery@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Amithash Prasad <amithash@fb.com>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008533b605d1994aa3
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

    Please find my response below.
    Please search this mail thread "EEPROM Validation issue in Fru Device "
for more information.

Thanks,
Kumar.


On Thu, Nov 25, 2021 at 2:10 AM Ed Tanous <edtanous@google.com> wrote:

> On Wed, Nov 24, 2021 at 1:17 AM Kumar Thangavel
> <kumarthangavel.hcl@gmail.com> wrote:
> >
> > Hi All,
> >
> >        We would like to validate our NIC FRU device type as 8 bit (one
> byte) or 16 bit(two byte).
> >
> >        This device type validation for our FRU is platform specific
> logic.
>
> Please include more details about what this logic is.  In the
> entity-manager design, anything that's truly platform specific needs
> to go into the entity-manager configuration, as all other components
> are common.
>
> The existing logic to get the device type is 8bit or 16bit is not working
exactly for our platform.
Also, writing some bytes and getting device type in eeprom is not safe and
not suggested.
So, we implemented the platform specific logic to get the eeprom device
type in the machine layer.

https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430

> >  This was implemented in the machine layer.
>
> Can you point to it?
>
> The logic is, get the NIC card vendor info from ncsi-netlink command and
based on NIC vendor,
set the eeprom device type as 8bit or 16 bit.

We wanted to interlink this logic in entity-manager.

>
> >        We wanted to interlink this logic with entity-manager code to get
> the device type.
> >
> >        Could you please provide the suggestions on get the device type
> in entity-manager.
>
> Entity-manager provides the exposes records on dbus, for which
> reactors can pick them up and use them.
>

Is there any way to get the dynamic values (device type - 8bit/16bit ) from
the machine layer
to the entity-manager ?

>
> >
> >        Please refer below link for existing devicebit validation in
> entity-manager.
> >
> https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430
>
> I'm not quite following what this has to do with your above, given
> that this isn't intended to be platform specific.
>
>
This existing logic to get the device type 8/16 bit may not work for all
the devices.
We need to find common logic for all the devices without any breakage. But
it is very tricky.

Alternatively, platform specific logic can be an option and interlink with
EM at run time.
We are trying this and requesting suggestions from MAINTAINERS.

>
> > Thanks,
> > Kumar.
>

--0000000000008533b605d1994aa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ed,</div><div><br>=C2=A0 =C2=A0 Please find my res=
ponse below.</div><div>=C2=A0 =C2=A0 Please search this mail thread &quot;E=
EPROM Validation issue in Fru Device &quot; for more information.<br><br>Th=
anks,</div><div>Kumar.</div><div><br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 25, 2021 at 2:10 AM Ed Tan=
ous &lt;<a href=3D"mailto:edtanous@google.com">edtanous@google.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, N=
ov 24, 2021 at 1:17 AM Kumar Thangavel<br>
&lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_blank">kumar=
thangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 We would like to validate our NIC FRU devic=
e type as 8 bit (one byte) or 16 bit(two byte).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 This device type validation for our FRU is =
platform specific logic.<br>
<br>
Please include more details about what this logic is.=C2=A0 In the<br>
entity-manager design, anything that&#39;s truly platform specific needs<br=
>
to go into the entity-manager configuration, as all other components<br>
are common.<br>
<br></blockquote><div>The existing logic to get the device type is 8bit or =
16bit is not working exactly for our platform.</div><div>Also, writing some=
 bytes and getting device type in eeprom is not safe and not suggested.<br>=
So, we implemented the platform specific logic=C2=A0to get the eeprom devic=
e type in the machine layer.</div><div><br></div><div><a href=3D"https://gi=
thub.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L430" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openbmc/entity-manager/blo=
b/master/src/FruDevice.cpp#L430</a><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
&gt;=C2=A0 This was implemented in the machine layer.<br>
<br>
Can you point to it?=C2=A0<br>
<br></blockquote><div>The logic is, get the NIC card vendor info from ncsi-=
netlink command and based on NIC vendor,</div><div>set the eeprom device ty=
pe as 8bit or 16 bit.=C2=A0</div><div><br></div><div>We wanted to interlink=
 this logic in entity-manager.</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 We wanted to interlink this logic with enti=
ty-manager code to get the device type.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Could you please provide the suggestions on=
 get the device type in entity-manager.<br>
<br>
Entity-manager provides the exposes records on dbus, for which<br>
reactors can pick them up and use them.<br></blockquote><div><br>Is there a=
ny way to get the dynamic values (device type - 8bit/16bit ) from the machi=
ne layer=C2=A0</div><div>to the entity-manager ?</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Please refer below link for existing device=
bit validation in entity-manager.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/entit=
y-manager/blob/master/src/FruDevice.cpp#L430" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/openbmc/entity-manager/blob/master/src/FruDevice=
.cpp#L430</a><br>
<br>
I&#39;m not quite following what this has to do with your above, given<br>
that this isn&#39;t intended to be platform specific.<br>
<br></blockquote><div><br></div><div>This existing logic to get the device =
type 8/16 bit may not work for all the devices.</div><div>We need to find c=
ommon logic for all the devices without any breakage. But it is very tricky=
.</div><div><br></div><div>Alternatively, platform specific logic can be an=
 option and interlink with EM at run time.=C2=A0</div><div>We are trying th=
is and requesting suggestions from MAINTAINERS.</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Thanks,<br>
&gt; Kumar.<br>
</blockquote></div></div>

--0000000000008533b605d1994aa3--
