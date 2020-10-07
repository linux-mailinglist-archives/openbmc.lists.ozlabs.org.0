Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22330286848
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 21:27:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C649T15KJzDqQq
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 06:27:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=iTMrK2/X; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C648m2wYlzDqML
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 06:27:00 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id q9so3655132iow.6
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 12:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SLvsyDixJ8QSAmvMcuiuAQNgjBCkcRGsNS0iwOdzBbY=;
 b=iTMrK2/XQt15n8CE4P6lN8OI+ZekiL3X2G57OGaotK0CXv7dpnWlfbSZEiWy3RRSWj
 G+/fbRFuSQEH14UE0J4cbHLEBm40xhJjsZJPZH2t2FvsfHpR6PDIq5k/io9kTUltu0YF
 PMUW5oEsqqMwgEW+zjk2952K5u0T0yj5Y1H3cJLl7xaCTNdFcZ+dV+IDHLd+4jBxZSYT
 c7FzFzMgYQNDaBxs2pqs508B++scODnEiYlMhP6lV4z8S+jwQP0KrjslasUjXzy+WzDY
 0IXvM5y337FMFBLJwZwVEqGZ/6JtWs82dphdfDUp0+CzTwoxWOa4r1LZ+3QKDD5bHbSQ
 HBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SLvsyDixJ8QSAmvMcuiuAQNgjBCkcRGsNS0iwOdzBbY=;
 b=cgvHYvO687k/hKH81egRjO/irivHvbQ4B/iqFzVwESvTg5bm/NWYIvQZnsf92efCic
 cdgtkeX88HzOxdjdsNbcmeYZexCfpr8j7/Yfu7NKvMhNrn43s4xHzlHhGE0ypPoDcmlC
 XBIZ47vOjvy10C8lIO0t0apPQFX+mU7u1Nh5Cof9dQY9GFnhKmqwccNZtYe8d8IIT3Jg
 NmDG5FNqZSkEhy7sjxeGjnYN6xZ/MiZP/UYbbRQvMfCyx4WPpHLnVaFiXNvezKMGQbpJ
 GibrYXJMqLrQQx1RIXttnXRlikpm3VuqqXiOT/DqLwIbGaygiQn+NeuGb49ddVWUdu+7
 TZsg==
X-Gm-Message-State: AOAM532mXVwGfi6+GIZGtpFRfxnZIfuaSe/R6hzUDNC56yn4qke2qhnm
 Thk+R60iO7Ve1ehktXJK1fURdvU3c0nwUdIrU/sonA==
X-Google-Smtp-Source: ABdhPJxHiZ6wdPLMYL+78zaq7HgjpRct+H47XwBBT7igsSIX3OUNmna/J6zTi3SKTm9QBfoc5CkZBpbC+XTJz7VgjAo=
X-Received: by 2002:a05:6602:14c8:: with SMTP id
 b8mr3447495iow.170.1602098815886; 
 Wed, 07 Oct 2020 12:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <1ef07be4-6706-5071-f992-acbc43e2116f@gmail.com>
 <OF234E95F2.B6028A9B-ON002585F7.0065286D-002585F7.00661484@notes.na.collabserv.com>
In-Reply-To: <OF234E95F2.B6028A9B-ON002585F7.0065286D-002585F7.00661484@notes.na.collabserv.com>
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 7 Oct 2020 21:26:44 +0200
Message-ID: <CADVsX8__+vVO4RuV8AH3_oDwBQRDWem9X8vr_uv98=v3ysWkHg@mail.gmail.com>
Subject: Re: LED accessed via I2C
To: Milton Miller II <miltonm@us.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000d1b44705b119b290"
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
 "S.Nishikawa" <nishikawa.shun@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d1b44705b119b290
Content-Type: text/plain; charset="UTF-8"

In addition, you may try to start with the i2c-tools package. With
*i2cdetect* and *i2cset* you may actually discover all available devices on
specific i2c bus and then write to a specific i2c device by it's address.
Once you get it work, you should try to find suitable kernel driver that
may use your i2c device. For instance, if the i2c interface (with registers
read/write) is just a specific register write, you may try to re-use i2c
gpio driver and then use it as gpio led as described:

https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/leds-gpio.txt

On Sun, 4 Oct 2020 at 20:35, Milton Miller II <miltonm@us.ibm.com> wrote:

> On October 4, 2020 around 4:05am in some timezone, S.Nishikawa wrote:
> >Hi,
> >
> >In our hardware, the Alert LED is attached to the end of the CPLD and
> >is
> >accessed via I2C. I think phosphor-led-sysfs controls LEDs with GPIO,
> >
> >but how can I control the LED beyond I2C?
>
>
> Actually phosphor-led-manager will control any device that has a
> kernel driver exposing the LED interface.  For PCA i2c devices
> we tend to expose all the pins as gpio then individual gpios as
> gpio led devices because the led subsystem will change the led
> instance number based on which pins of the package are LED.
>
> It sounds like your cpld has a custom interface.  If the leds
> can be controlled via a separate i2c addressed endpoint I would
> suggest a multi-function device binding using the mfd subsystem.
> If it is directly controled by a register consider registering
> a regmap like many voltage monitor and control devices.  One
> advantage of regmap is it provides both locking and caching of
> the values written, controllable on a per-register basis.
>
> You will need a kernel driver for the remaining function that
> is accessible over the i2c interface.
>
> See https://www.kernel.org/doc/html/latest/leds/leds-class.html#
> for information on the kernel LED subsystem.
>
> I hope this gets you headed in a productive direction.
> milton
>
>

--000000000000d1b44705b119b290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In addition, you may try to start with the i2c-tools packa=
ge. With <b>i2cdetect</b> and <b>i2cset</b>=C2=A0you may actually discover =
all available devices on specific i2c bus and then write to a specific i2c =
device by it&#39;s address. Once you get it work, you should try to find su=
itable kernel driver that may use your i2c device. For instance, if the i2c=
 interface (with registers read/write) is just a specific register write, y=
ou may try to re-use i2c gpio driver and then use it as gpio led as describ=
ed:<div><br></div><div><a href=3D"https://www.kernel.org/doc/Documentation/=
devicetree/bindings/leds/leds-gpio.txt">https://www.kernel.org/doc/Document=
ation/devicetree/bindings/leds/leds-gpio.txt</a><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 4 Oct 202=
0 at 20:35, Milton Miller II &lt;<a href=3D"mailto:miltonm@us.ibm.com">milt=
onm@us.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On October 4, 2020 around 4:05am in some timezone, S.Nishikaw=
a wrote:<br>
&gt;Hi,<br>
&gt;<br>
&gt;In our hardware, the Alert LED is attached to the end of the CPLD and<b=
r>
&gt;is <br>
&gt;accessed via I2C. I think phosphor-led-sysfs controls LEDs with GPIO,<b=
r>
&gt;<br>
&gt;but how can I control the LED beyond I2C?<br>
<br>
<br>
Actually phosphor-led-manager will control any device that has a <br>
kernel driver exposing the LED interface.=C2=A0 For PCA i2c devices <br>
we tend to expose all the pins as gpio then individual gpios as<br>
gpio led devices because the led subsystem will change the led <br>
instance number based on which pins of the package are LED.<br>
<br>
It sounds like your cpld has a custom interface.=C2=A0 If the leds<br>
can be controlled via a separate i2c addressed endpoint I would <br>
suggest a multi-function device binding using the mfd subsystem.<br>
If it is directly controled by a register consider registering <br>
a regmap like many voltage monitor and control devices.=C2=A0 One <br>
advantage of regmap is it provides both locking and caching of <br>
the values written, controllable on a per-register basis.<br>
<br>
You will need a kernel driver for the remaining function that <br>
is accessible over the i2c interface.<br>
<br>
See <a href=3D"https://www.kernel.org/doc/html/latest/leds/leds-class.html#=
" rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/doc/html/late=
st/leds/leds-class.html#</a><br>
for information on the kernel LED subsystem.<br>
<br>
I hope this gets you headed in a productive direction.<br>
milton<br>
<br>
</blockquote></div>

--000000000000d1b44705b119b290--
