Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0313132D15
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 18:33:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sfc44MFTzDqMH
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 04:33:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EyeYBZbz"; 
 dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sf6h410jzDqLX
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 04:11:24 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id 18so103710oin.9
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jan 2020 09:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7A82MIrWe6f3GyBRGFc7fus/vOT+BqZchqR3YS/Il1o=;
 b=EyeYBZbzvO1NOUSMP+o6uvzRncHMeOiszgTn/A8bvEGEociXr4aN5qjfTTpQoA6jA7
 VHtVp1OCz85SXjyTl5vHSUwF5FTUoNIkdOQiC/h16ezoElQaUssqwKp3zqcLIPveeqLp
 JNGaPtiJGwfUaqCC+H3pzYxR5N5JLbtbzUAK5Xs95S+h5Gvz1dilSNIDnMezOmHoGFAT
 vr5NhRu779IFvE9aA5yRWK4MpS3wJt2LqGMjlu/bYa9CxyI3Qe/Hp5Ic9pXqMb4Z5l85
 5Dr099ehQwoqggDV5V+Bt4jxpUExI0y9VFDi/TKgWUDHpoiy+dpzY2DhUMVdgZzkrfi7
 AqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7A82MIrWe6f3GyBRGFc7fus/vOT+BqZchqR3YS/Il1o=;
 b=dYqwRqA2U286OkbgPWkNZK5xMM1CNP86AFhIk1CZySjT6f/36GH/XwwLKrFZ5thG0L
 HaBseLtdmMSwlqHnM5YsxtnNmjAAh/Vw7mrRA44OZRWPVNuwSpgjA5Obk0z9J9emo9a7
 mQZdm5o7nDL4pSZH+T57Oh/cS9CuU7SHkN05U7MrlTVjMjSiPya+kRfF6zmvC5kQ8rpS
 S/JT4kzD82bGDL6JQouSYR3yR7i8U/r/tnriiwKlYMk6bGba2ty/albnSECnLUdyO7+J
 uAklUwuaSF91tQHPeyFaiflWfUSfctSzA1s1sEY0aEhj11zPnFMsYYBVEVyGDY0+qqV0
 /LdA==
X-Gm-Message-State: APjAAAWP+AKpfNBN/EWPc5PfVCVdurYO8OJ9HdkYA6CWFJmbNalhTJB7
 O/pkp3B6pWBFrNEQepTvntGPY/+w0zr0U/2jBnFujw==
X-Google-Smtp-Source: APXvYqz2JxEzOBd+vw1OJ3giuwVm60hrAraIlgzY5u47Ed998qmxOepnJyM8CKa9kSSBW3KVdli3yBSvsMnMQSevhA8=
X-Received: by 2002:aca:d507:: with SMTP id m7mr481566oig.48.1578417078734;
 Tue, 07 Jan 2020 09:11:18 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
 <e5878df7-b127-0f86-3366-722e94f86103@linux.intel.com>
 <CAA_a9x+wpvhD7pEe+TEqkjSb6ZoiiYz4ZZBQz0v_7V-cGywHXg@mail.gmail.com>
 <e585c0d1-81a8-fd09-cb43-84ac878568ad@linux.intel.com>
 <CAARXrt=C4nLhFc0kmgDY7rhjR5FfzFppJwGN7JxoHnKoNsvXag@mail.gmail.com>
In-Reply-To: <CAARXrt=C4nLhFc0kmgDY7rhjR5FfzFppJwGN7JxoHnKoNsvXag@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Tue, 7 Jan 2020 09:11:07 -0800
Message-ID: <CAA_a9xJYCUm79tJAukK2HJFp1t1MtOTOKwYGuArw_W5cLSFZcw@mail.gmail.com>
Subject: Re: Configuring shunt_resistor in hwmon
To: Lei YU <mine260309@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000495cae059b8fdd33"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Kais Belgaied <belgaied@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Josh Lehan <krellan@google.com>,
 James Feist <james.feist@linux.intel.com>,
 Devjit Gopalpur <devjitg@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000495cae059b8fdd33
Content-Type: text/plain; charset="UTF-8"

Hi Lei,

I'm not sure if we're using phosphor-hwmon, but I'll take a look. Thank you!

- Alex Qiu


On Mon, Jan 6, 2020 at 7:20 PM Lei YU <mine260309@gmail.com> wrote:

> On Tue, Jan 7, 2020 at 5:38 AM James Feist <james.feist@linux.intel.com>
> wrote:
> >
> > On 1/6/20 1:29 PM, Alex Qiu wrote:
> > > Hi James,
> > >
> > > Thanks for your quick reply and reviewing my code in the morning!
> > >
> > > That looks interesting, so this ScaleFactor will be used to multiply
> the
> > > voltage value from hwmon without setting the shunt_resistor explicitly?
> > > I do have a little concern on the resolution, because it's only
> > > reporting 0.165V with default shunt_resistor setting, but we'll try and
> > > see if this will work for our case. In the meantime, do you know any
> > > other method that will work?
> >
> > That's all I'm aware of in dbus-sensors. We have a voltage divider
> > in-front of our ADC channels, so we use this scale factor to calculate
> > the actual voltage. Anything else I think you'd need to add as a new
> > change if you're using dbus-sensors. I'm not sure if phosphor-hwmon
> > offers anything you could use or not.
>
> With phosphor-hwmon, you could define GAIN, OFFSET in the config file
> to adjust the reading.
> See details in
>
> https://github.com/openbmc/docs/blob/master/architecture/sensor-architecture.md#my-sensors-are-not-defined-in-an-mrw
>

--000000000000495cae059b8fdd33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lei,<div><br></div><div>I&#39;m not sure if we&#39;re u=
sing phosphor-hwmon, but I&#39;ll take a=C2=A0look. Thank you!</div><div><b=
r clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Jan 6, 2020 at 7:20 PM Lei YU &lt;<a href=3D"mailto:mine260309@=
gmail.com">mine260309@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Jan 7, 2020 at 5:38 AM James Feist=
 &lt;<a href=3D"mailto:james.feist@linux.intel.com" target=3D"_blank">james=
.feist@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 1/6/20 1:29 PM, Alex Qiu wrote:<br>
&gt; &gt; Hi James,<br>
&gt; &gt;<br>
&gt; &gt; Thanks for your quick reply and reviewing my code in the morning!=
<br>
&gt; &gt;<br>
&gt; &gt; That looks interesting, so this ScaleFactor will be used to multi=
ply the<br>
&gt; &gt; voltage value from hwmon without setting the shunt_resistor expli=
citly?<br>
&gt; &gt; I do have a little concern on the resolution, because it&#39;s on=
ly<br>
&gt; &gt; reporting 0.165V with default shunt_resistor setting, but we&#39;=
ll try and<br>
&gt; &gt; see if this will work for our case. In the meantime, do you know =
any<br>
&gt; &gt; other method that will work?<br>
&gt;<br>
&gt; That&#39;s all I&#39;m aware of in dbus-sensors. We have a voltage div=
ider<br>
&gt; in-front of our ADC channels, so we use this scale factor to calculate=
<br>
&gt; the actual voltage. Anything else I think you&#39;d need to add as a n=
ew<br>
&gt; change if you&#39;re using dbus-sensors. I&#39;m not sure if phosphor-=
hwmon<br>
&gt; offers anything you could use or not.<br>
<br>
With phosphor-hwmon, you could define GAIN, OFFSET in the config file<br>
to adjust the reading.<br>
See details in<br>
<a href=3D"https://github.com/openbmc/docs/blob/master/architecture/sensor-=
architecture.md#my-sensors-are-not-defined-in-an-mrw" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/openbmc/docs/blob/master/architecture/se=
nsor-architecture.md#my-sensors-are-not-defined-in-an-mrw</a><br>
</blockquote></div>

--000000000000495cae059b8fdd33--
