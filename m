Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2016294568
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 01:22:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG8mg6x3jzDqfv
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 10:22:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JOUan5E/; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG8ly5Z0TzDqf5
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 10:22:03 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id t9so525517qtp.9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 16:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWyVu0xWTahInz1zumVlkDkPKM79bACqwdKNNTNVYlc=;
 b=JOUan5E/n2BXnKsKZNYQqpAWLhmlTsegNsqgblmgcR/Ib5yUTb7hgSEmfz6YSFka8I
 c88atLRgbSpQ8PRaFAtxa7gtU0b5KE65DiVl7F/+9lfeerkdCc2QJgntcSkl2CSjdeVl
 ybR05qw3OhaBl7GbvdQCbFYfOFqv59s8e2kidg010Az1hBzbadfkQ21+6/26M0kZ4Wlt
 Dy/2fQ1eudsgdaW671sD6K1aeT3G2Gybq40hTHgAj1m3UfGmO4N4Rhd5RSVKGOPztuVJ
 Kqogo8I2LasFxi2Y0BqQhRE9WP6oq1uWeuumYJMPWi6Dv50T+9zagBEEKx5nYeawkmGy
 qBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWyVu0xWTahInz1zumVlkDkPKM79bACqwdKNNTNVYlc=;
 b=kBU+m2c58IToq9Q4fKu4fKxxej4CFZFavkl5dpH7cVVxlyUzshQU5Ao4gpTHw1pj+n
 gV79yzvJLc8pqWjBpEnT1jOzSw/+12Bo1irSseANx/UBnDUGnX6K8gVnt21wjd/a3DR7
 TOdPC69u/CTXlGZ7qD4VIDDH7UvUkwpiTvEneH1GLTjyMd3y7E3u2F0zz6P0EkFx9by8
 SQf8Z5fByCzR0/lfbs6hM3B241IK09QURPeOPMdrMYkS2YMhKamzcaFVw07HMB+2vWyL
 kAP6PHjMyn+TKo7ukHjIixtvPM4LZX+3F8D3QMydRWbBwE3Qm6Q2e01y7ZlL44DqsJj4
 Oczg==
X-Gm-Message-State: AOAM530LA2+NH9YTouGFccS3gEb8nyO54J+jWMlzaoRwf+CfQPyzoEEZ
 cbLHrcO1aLyZTwXt7dtsaiWq9cjThR8GSn1s83E=
X-Google-Smtp-Source: ABdhPJzTITCV4pMagjdiQr6JoIM4tLzFzFhF9HfSU+AVpcx9/QwgjpLIjkF1GEOEUoluPRLZY2/7EmiWYRXtifsoguA=
X-Received: by 2002:ac8:48c7:: with SMTP id l7mr528587qtr.275.1603236119895;
 Tue, 20 Oct 2020 16:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
 <CALioo37dj3UbSoi7nEb+N9uFjvB5iUxNF8evMQ4K9HYcaObsjg@mail.gmail.com>
 <2ac65a96-a447-e5b6-037d-2d785c16244b@linux.ibm.com>
 <20201020141804.GA5030@patrickw3-mbp.lan.stwcx.xyz>
In-Reply-To: <20201020141804.GA5030@patrickw3-mbp.lan.stwcx.xyz>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Wed, 21 Oct 2020 06:21:48 +0700
Message-ID: <CALioo35YqrE4hZA9aKv+tsyAvM2GtW=RYv+-oMQuks3U5xSVXQ@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000006ae25705b2227f90"
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
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006ae25705b2227f90
Content-Type: text/plain; charset="UTF-8"

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
> The load/unload OCC will only affect on host sensors which are provided by
OCC.
For sensors which use the same power domain with the host, they still are
read and updated to the value to Dbus.


> Matt, is that how you have the driver configured to load / unload (I
> assume your case is for the OCC).
>
> --
> Patrick Williams
>

--0000000000006ae25705b2227f90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20, 2020 at 9:18 PM Patri=
ck Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex">On Tue, Oct 20, 2020 at 08:46:30AM -05=
00, Matt Spinler wrote:<br>
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
<br></blockquote><div>The load/unload OCC will only affect on host sensors =
which are provided by OCC.</div><div>For sensors which use the same power d=
omain with the host, they still are read and updated to the value to Dbus.<=
/div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-l=
eft-color:rgb(204,204,204);padding-left:1ex">
Matt, is that how you have the driver configured to load / unload (I<br>
assume your case is for the OCC).<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div></div>

--0000000000006ae25705b2227f90--
