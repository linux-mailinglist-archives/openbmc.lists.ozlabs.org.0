Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF31131AA5
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 22:45:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s8Fj4BWkzDqDt
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 08:45:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PfIUH5Hp"; 
 dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s8Dp3Qq6zDqCB
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 08:44:56 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id r27so73482289otc.8
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 13:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wItj7FfaDsGLGHUxe2tLfUF4tqw1NQC106j0CAFTB3Q=;
 b=PfIUH5Hp7NPvIE6xzLq4b/nqA0f0JlZRxQAXlRV/GYJulsGKHIzPn3x77nwLmbjhBA
 3qTUOv8/JpyKpXDpIWJu0bq6qSneZw7MXnhGnw/KpX8we6p1vxbwnWv41S/1NGRrqLax
 nsvy2x1jEEsH7LpA54DC0ryesGiInDkzGVlTEWb8y4xetbt1cISj2Xm1/YxL250K1d2h
 ZR/PeqPk0Zne9plw4YN+vzY3nE2DDHc8oNaq9h7tLbr20aP7MwaPfenAYeFAyO4/fC87
 jBcouViAnvGxhGdyMwuu3s6O/cGTRTPXyHsIYzmaGOUO7RjIUIhKTfD3703ou9dJhGEI
 RrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wItj7FfaDsGLGHUxe2tLfUF4tqw1NQC106j0CAFTB3Q=;
 b=h1ER6uT9e6btDHEqyyC9bgfjkzbJcQL2fum4bQPxuafvdIw21LMPF/pqeew8U/LHy5
 Zaf43krw5P3dZeiFqAAqQyMQNO1w6h8V/67qdstJy3z7n8PY4D+xFYqXw4MAD3cL0U4z
 VDeN0ilITWS4y9huAp2xae3XSGZtlg5cDFoWmbdHkfJZtH1d8/Ve01iAhe8oTJ93wS6e
 sjfS0V6lGhUZWBtcAwZArqNsfh8R3Rl3uhJzgZ1qCu3BiwVW5rGfZhc/ROjgFo9rx1E8
 RmlPvoUD9u7QFkrC+ZwBnYgcb4to29ST8AUUIS6p+KTdNOyIjHfUjaqEbg1SWShbKptk
 dEjg==
X-Gm-Message-State: APjAAAXPxgQawngnWkBVX5aMIGgYw3s74FJhd4uIbcE2qbkya7wC0OOb
 q4V7ZeeV6kn2LPITxa8jpJCElPvoadTK2ebCaVRsRg==
X-Google-Smtp-Source: APXvYqz3RFloB3cSrQoa1zzsqfLB3TCVKNYSlRUQth7gmaL6gT4jY3KOvPuCg0s2NGHM2OzoEoLPnyxhHCqj19pI4PM=
X-Received: by 2002:a05:6830:145:: with SMTP id
 j5mr113595725otp.242.1578347092690; 
 Mon, 06 Jan 2020 13:44:52 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
 <e5878df7-b127-0f86-3366-722e94f86103@linux.intel.com>
 <CAA_a9x+wpvhD7pEe+TEqkjSb6ZoiiYz4ZZBQz0v_7V-cGywHXg@mail.gmail.com>
 <e585c0d1-81a8-fd09-cb43-84ac878568ad@linux.intel.com>
In-Reply-To: <e585c0d1-81a8-fd09-cb43-84ac878568ad@linux.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 6 Jan 2020 13:44:41 -0800
Message-ID: <CAA_a9xLCmVAjrJhvz5KLx_bWLmvUucx_GAZO1+GEdPXdSFSwjg@mail.gmail.com>
Subject: Re: Configuring shunt_resistor in hwmon
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000cb4639059b7f91e7"
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
Cc: Josh Lehan <krellan@google.com>, openbmc@lists.ozlabs.org,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cb4639059b7f91e7
Content-Type: text/plain; charset="UTF-8"

Hi James,

Got it. Thank you for the answer!

- Alex Qiu


On Mon, Jan 6, 2020 at 1:37 PM James Feist <james.feist@linux.intel.com>
wrote:

> On 1/6/20 1:29 PM, Alex Qiu wrote:
> > Hi James,
> >
> > Thanks for your quick reply and reviewing my code in the morning!
> >
> > That looks interesting, so this ScaleFactor will be used to multiply the
> > voltage value from hwmon without setting the shunt_resistor explicitly?
> > I do have a little concern on the resolution, because it's only
> > reporting 0.165V with default shunt_resistor setting, but we'll try and
> > see if this will work for our case. In the meantime, do you know any
> > other method that will work?
>
> That's all I'm aware of in dbus-sensors. We have a voltage divider
> in-front of our ADC channels, so we use this scale factor to calculate
> the actual voltage. Anything else I think you'd need to add as a new
> change if you're using dbus-sensors. I'm not sure if phosphor-hwmon
> offers anything you could use or not.
>
> >
> > Thank you!
> >
> > - Alex Qiu
> >
> >
> > On Mon, Jan 6, 2020 at 1:21 PM James Feist <james.feist@linux.intel.com
> > <mailto:james.feist@linux.intel.com>> wrote:
> >
> >     On 1/6/20 1:16 PM, Alex Qiu wrote:
> >      > Hi OpenBMC folks,
> >      >
> >      > Is there a way to configure the shunt_resistor value for a hwmon
> >     with
> >      > entity-manager or other modules?
> >
> >     Have you seen this?
> >
> https://github.com/openbmc/entity-manager/blob/0cbe6bf34101bab7544b40011868efc5145c0804/configurations/WFT%20Baseboard.json#L7
> >
> >     For Entity-Manager + dbus-sensors.
> >
> >      > We need to configure this value to make
> >      > the INA230 report correct voltage, but for now I don't find
> >     anything in
> >      > the code for it. Shall this be a feature to implement? Thanks!
> >      >
> >      > - Alex Qiu
> >
>

--000000000000cb4639059b7f91e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi James,</div><div><br></div><div>Got it. Thank you =
for the answer!</div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu<=
/div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jan 6, 2020 at 1:37 PM James Feist &lt;<a href=
=3D"mailto:james.feist@linux.intel.com">james.feist@linux.intel.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 1/6/2=
0 1:29 PM, Alex Qiu wrote:<br>
&gt; Hi James,<br>
&gt; <br>
&gt; Thanks for your quick reply and reviewing my code in the morning!<br>
&gt; <br>
&gt; That looks interesting, so this ScaleFactor will be used to multiply t=
he <br>
&gt; voltage value from hwmon without setting the shunt_resistor explicitly=
? <br>
&gt; I do have a little concern on the resolution, because it&#39;s only <b=
r>
&gt; reporting 0.165V with default shunt_resistor setting, but we&#39;ll tr=
y and <br>
&gt; see if this will work for our case. In the meantime, do you know any <=
br>
&gt; other method that will work?<br>
<br>
That&#39;s all I&#39;m aware of in dbus-sensors. We have a voltage divider =
<br>
in-front of our ADC channels, so we use this scale factor to calculate <br>
the actual voltage. Anything else I think you&#39;d need to add as a new <b=
r>
change if you&#39;re using dbus-sensors. I&#39;m not sure if phosphor-hwmon=
 <br>
offers anything you could use or not.<br>
<br>
&gt; <br>
&gt; Thank you!<br>
&gt; <br>
&gt; - Alex Qiu<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Jan 6, 2020 at 1:21 PM James Feist &lt;<a href=3D"mailto:james=
.feist@linux.intel.com" target=3D"_blank">james.feist@linux.intel.com</a> <=
br>
&gt; &lt;mailto:<a href=3D"mailto:james.feist@linux.intel.com" target=3D"_b=
lank">james.feist@linux.intel.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 1/6/20 1:16 PM, Alex Qiu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi OpenBMC folks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Is there a way to configure the shunt_resisto=
r value for a hwmon<br>
&gt;=C2=A0 =C2=A0 =C2=A0with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; entity-manager or other modules?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Have you seen this?<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/entity-manage=
r/blob/0cbe6bf34101bab7544b40011868efc5145c0804/configurations/WFT%20Basebo=
ard.json#L7" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbm=
c/entity-manager/blob/0cbe6bf34101bab7544b40011868efc5145c0804/configuratio=
ns/WFT%20Baseboard.json#L7</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For Entity-Manager + dbus-sensors.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; We need to configure this value to make<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the INA230 report correct voltage, but for no=
w I don&#39;t find<br>
&gt;=C2=A0 =C2=A0 =C2=A0anything in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the code for it. Shall this be a feature to i=
mplement? Thanks!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Alex Qiu<br>
&gt; <br>
</blockquote></div>

--000000000000cb4639059b7f91e7--
