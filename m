Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3429457D
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 01:41:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG99k6tBnzDqcy
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 10:40:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RlWvxR26; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG98R2FcMzDqb1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 10:39:49 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id h11so154600qvq.7
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EzcAwOW1kOiKHPVGBJ/eKiJ2ekH3ZIcqcT4mCyZp8bA=;
 b=RlWvxR26VYo0KNHedt2zfhhZzbQmHZE9PtHtBqZWVh0SBHyKh6sh4SotGpfxIZj+rR
 EwSc2Fb/ptzfDt1fNDtEnRw6uV59GcpU/RbEw5eCg/+505A/bwFYgmff2StsLpCEvhkT
 KPKQn1kitChGwBXsGVjoMFxNgYU6TVkEVIRkRby00Fy1GPve58vu4xHtUNnEQ7aw21sP
 TR8KbOpOV6I84KZm6DJMOthu3ELApzaGzxLBbJb8SGhS2zVDiwW9ob2PavlR1fyKGevS
 5agY0eQApYvuzu4TkmNSWVOwV0yrkQUXWiLHya4F4KTgfzrrzpSOJqI72PCminpE4TPm
 yYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EzcAwOW1kOiKHPVGBJ/eKiJ2ekH3ZIcqcT4mCyZp8bA=;
 b=s3gOBYgBPdnBzYPTrbTSz8nb5hqpfkLiJD3hX4UJENcJZFbn0IDmRw4SnQiIpY4RkW
 z0rwIpv7wQepJULW+X8UnQXMN2DGfODYuEpUpzlwBTmcUK1D2qH4WbtcWputpO1/7hi3
 Wo8kZS9DphGlVU2GtO9gpF7HtgnMNZF+9Mni6YQf3ANSicqY8aJPYQRLg45h2pYqkapG
 93NrzU/OdyxeECrjjOejDVN6KApvrDdY1CoQPAHFKF3KcGu9HBLSbAvh+eYDH5bIfndP
 AkaYhPUr6fPnnJvVHfFGRwkLG0TKjeLw+clBtVuBjlWmscWLd1zChv1LfxFBmr/638kd
 5bcw==
X-Gm-Message-State: AOAM533uij91Ii0ZtOfyShWmoL0er52cz34XJqJrodwoxgb9B96D/Nay
 bfYDJbT4sEYsifUBdv/ZJtdZOewfy97g2RNRegQ=
X-Google-Smtp-Source: ABdhPJwzJWRnv8eJqp2/bwIxQx31MOpD/STZ5WZucup8ApY0lkQBjF0pIFhym2A5Y5VfeszUZSByWl6M+Qexcd2mh+M=
X-Received: by 2002:ad4:4105:: with SMTP id i5mr356010qvp.47.1603237186312;
 Tue, 20 Oct 2020 16:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
 <CALioo37dj3UbSoi7nEb+N9uFjvB5iUxNF8evMQ4K9HYcaObsjg@mail.gmail.com>
 <2ac65a96-a447-e5b6-037d-2d785c16244b@linux.ibm.com>
 <20201020141804.GA5030@patrickw3-mbp.lan.stwcx.xyz>
In-Reply-To: <20201020141804.GA5030@patrickw3-mbp.lan.stwcx.xyz>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Wed, 21 Oct 2020 06:39:35 +0700
Message-ID: <CALioo37yvvMdA6hQFq-vEdvzodcHmzL-qDDU8pQ+RhKjPz=_KQ@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="000000000000fb1c3705b222befb"
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
 Matt Spinler <mspinler@linux.ibm.com>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000fb1c3705b222befb
Content-Type: text/plain; charset="UTF-8"

I am also concerned about phosphor-hwmon keep reading sensors in Dbus.
Even those sensors are off or not available when the host is off.

The other thing is the value of sensors which are using the same power
domain with the host in the time host changing status.
It can be invalid value and should be ignored.
These sensors should be removed from Dbus when the host starts off/on.


On Tue, Oct 20, 2020 at 9:18 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Oct 20, 2020 at 08:46:30AM -0500, Matt Spinler wrote:
> >
> >
> > On 10/19/2020 10:23 AM, Thu Ba Nguyen wrote:
> > >
> > > I also thought about the solution for that features:
> > > In the current hwmon we support GPIOCHIP + GPIO option which used to
> > > enable sensors to read. In the hwmon code, we just set that pin and
> wait
> > > before reading.
> > > I think we can support a similar option named GPIOENABLE + GPIOV. When
> > > the status of Gpio pin defind in GPIOEANBLE match with GPIOV.
> > > That sensors will be read and update to Dbus.
> > > If not it will be removed from DBus until the GPIO pin math GPIOV.
> > > Maybe we can have many different solutions.
> ...
> > >
> > > If you don't mind, can you tell me how IBM supports that features?
> >
> > We lucked out out in that the driver was only loaded when power was on.
> >
>
> Hi Thu,
>
> Is this something you could do similarly?  Rather than have the driver
> understand the GPIO directly you can trigger a phosphor-gpio-monitor
> service that does a 'bind' / 'unbind' to dynamically enable and disable
> the hwmon driver?
>
> Matt, is that how you have the driver configured to load / unload (I
> assume your case is for the OCC).
>
> --
> Patrick Williams
>

--000000000000fb1c3705b222befb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am also concerned about phosphor-hwmon keep reading sens=
ors in Dbus.<div>Even those sensors are off or not available when the host =
is off.</div><div><br></div><div>The other=C2=A0thing=C2=A0is the value of =
sensors which are using the same power domain with the host in the time hos=
t changing status.</div><div>It can be invalid value and should be ignored.=
=C2=A0</div><div>These sensors should be removed from Dbus when the host st=
arts off/on.</div><div><br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20, 2020 at 9:18 PM Patrick Wi=
lliams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex">On Tue, Oct 20, 2020 at 08:46:30AM -0500, M=
att Spinler wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 10/19/2020 10:23 AM, Thu Ba Nguyen wrote:<br>
&gt; &gt; <br>
&gt; &gt; I also thought about the solution for that features:<br>
&gt; &gt; In the current hwmon we support GPIOCHIP=C2=A0+ GPIO=C2=A0option =
which used to<br>
&gt; &gt; enable sensors to read. In the hwmon code, we just set that pin a=
nd wait<br>
&gt; &gt; before reading.<br>
&gt; &gt; I think we can support a similar option named GPIOENABLE=C2=A0+ G=
PIOV. When<br>
&gt; &gt; the status of Gpio pin defind in GPIOEANBLE=C2=A0match with GPIOV=
.<br>
&gt; &gt; That sensors will be read and update to Dbus.<br>
&gt; &gt; If not it will be removed from DBus until the GPIO pin math GPIOV=
.<br>
&gt; &gt; Maybe we can have many different solutions.<br>
...<br>
&gt; &gt; <br>
&gt; &gt; If you don&#39;t mind, can you tell me how IBM supports that feat=
ures?<br>
&gt; <br>
&gt; We lucked out out in that the driver was only loaded when power was on=
.<br>
&gt; <br>
<br>
Hi Thu,<br>
<br>
Is this something you could do similarly?=C2=A0 Rather than have the driver=
<br>
understand the GPIO directly you can trigger a phosphor-gpio-monitor<br>
service that does a &#39;bind&#39; / &#39;unbind&#39; to dynamically enable=
 and disable<br>
the hwmon driver?<br>
<br>
Matt, is that how you have the driver configured to load / unload (I<br>
assume your case is for the OCC).<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000fb1c3705b222befb--
