Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBFB36FDFF
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 17:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWxYD0hgHz302m
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 01:46:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=ew1ws71C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ew1ws71C; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWxXy3v13z2xZN
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 01:45:54 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id y2so81584803ybq.13
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NfHQT4M9oZ4hXbD5cGxZC5J0NfJB1+4HeTLA32TKfYM=;
 b=ew1ws71CR72g0hT/76NdxKV0n/rBuB4knIh+/6zsq3ORmISniiHZIX8W5SMeGBudSp
 DWNn3M6qLQOKSwL0dQAHoVPuDPv0Bf4ImVEkRx6WgVuF4sSZz0xvhrzexFw5vOnKwia8
 eCWNfiQ4XE9J2094stNYm/wiDyDOWnw9lXYLAXQ56XPmiU/1HwIg8hkiefM8g2lhjVNP
 mucbbUxXWI8drf3bT8YpuXDamXdC4OvhofSyiOTqgdAtmR5TNxSVomzyvAgpCwe1ZNlL
 xe3Ug2md8GXDnlVCQ4tQKTYZ/B+LcqdevjFc4Z5QEyKp7Hn0Qq0Y93L/S/GQNpJd2RtB
 LJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NfHQT4M9oZ4hXbD5cGxZC5J0NfJB1+4HeTLA32TKfYM=;
 b=EocDxxhqw/YhI5ZQuR9Ee8u3hzn3kniFAsQ13MIMz5eN1uN2LFo+E4mMtVFOBxsclU
 asERv4kEqbeHchjOgut4uluwFK8pNl+7szqmUDjdEI4tkEgADFXZY53w2AjjZJB4TOY6
 GURFAt3tmgLdtCa3V7Ko3cOcOqaQmqpsFZ3rI4ujo4XFHlfCWREJLwTzA7d7fFakeKv4
 OLZVZHvTCr+DZ7bZPK+ZuQdaAWavtzKRFk/Dr2Jf2afcyixJ4cahpnRfPnoAE2xuPf7H
 ehGa4bv8O8iiVpLWyZHE+mbHacnE1sVwrMcXODsN7H9k0PJvRcWU3Myoy9+LvsZZyv9u
 vTxg==
X-Gm-Message-State: AOAM533rrx2htKz2vq64QU4QkByVRKUyVa8afKbv6468obk3QWzr73gy
 B8aacpVzuHuJyU7vuF4825kLYT3GboqNasL+uY0PUP7WvK7NhA==
X-Google-Smtp-Source: ABdhPJwi9r0MnWjAyZzpVrQOxA+9SPk/26yNd3US8VEKwOIyqUzayzs3f7Ot2y4DXKZjk6iWOu5aS+bxl6YsUct9QFs=
X-Received: by 2002:a25:e0c1:: with SMTP id x184mr7695116ybg.468.1619797550786; 
 Fri, 30 Apr 2021 08:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein>
In-Reply-To: <YIwd4CukDfVrOqQs@heinlein>
From: Jason Ling <jasonling@google.com>
Date: Fri, 30 Apr 2021 08:45:14 -0700
Message-ID: <CAHBbfcWK3nRA3j96EQW38FYJ3gBtn2rkEZLrgGrrwTCaU=Reng@mail.gmail.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000009fe7ec05c13281cb"
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

--0000000000009fe7ec05c13281cb
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:
>
>     2. How does the availability (and potential recommendation of usage
> >        by our community) affect the effort to ensure that all i2c and
> >        pmbus drivers are upstreamed?
>
> Well, this library is meant for userspace usage. So i2c (hwmon?) and pmbus
> drivers would continue to be upstreamed as per usual.
> Motivating use case for userspace i2c transactions are pmbus firmware
> updates. With adm1266 we tried to upstream sequencer configuration update
> via the hwmon/pmbus driver, it failed spectacularly. So we have to do it
> userspace.

Do you have pointers to the discussion?

Whew...took a lot longer to find the thread but here is the explicit
rejection of firmware and configuration upgrade from within the kernel

https://lkml.org/lkml/2020/8/7/565

other things like don't put in ioctls

https://lkml.org/lkml/2020/6/24/830

This is the strongest use-case as it's been explicitly rejected by the
subsystem maintainer.

I suspect that things like adjusting voltages would similarly be rejected
but honestly we haven't gone down that path yet.


On Fri, Apr 30, 2021 at 8:10 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Fri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:
> >
> >     2. How does the availability (and potential recommendation of usage
> > >        by our community) affect the effort to ensure that all i2c and
> > >        pmbus drivers are upstreamed?
> >
> > Well, this library is meant for userspace usage. So i2c (hwmon?) and
> pmbus
> > drivers would continue to be upstreamed as per usual.
> > Motivating use case for userspace i2c transactions are pmbus firmware
> > updates. With adm1266 we tried to upstream sequencer configuration update
> > via the hwmon/pmbus driver, it failed spectacularly. So we have to do it
> > userspace.
>
> Do you have pointers to the discussion?
>
> > >       What is it that makes you want to write your code using low-level
> > >        i2c and PMBus APIs directly in userspace instead of writing or
> > >        updating drivers and using the various high-level user APIs
> > >        provided by kernel subsystems?
> >
> > I speak in the context of hwmon/pmbus but these patches were simply
> > rejected. A lot of times the device you want to upgrade is also the
> device
> > you're gathering telemetry from.
>
> I think the "is also" is the part that gives me concern.  Generally this
> means binding/unbinding the kernel side of it, which isn't pleasant.
>
> >
> >        I see you mentioned "pmbus device upgrades" and I know the PMBus
> > >        subsystem doesn't currently support firmware upgrade paths.
> But,
> > >        there has been LKML threads about it and what I recollect was
> > >        that it wasn't "not allowed" but just "not implemented".
> > >        Shouldn't we be focusing our efforts on enhancing features for
> > >        the whole OSS community rather than building our own different
> > >        library?
> >
> > Fair point but I don't see them as mutually exclusive, use hwmon/pmbus
> > drivers where they make sense and work for you. Switch to userspace for
> > stuff that gets strong pushback from hwmon/pmbus maintainer or stuff that
> > just doesn't make sense to put into a driver.
>
> My feeling is that we need more definition on what that boundary is.  As
> long as we are really only doing stuff from userspace when there is no
> other path forward, I don't have much concern.  But, I've seen too many
> cases where someone has tried to write an i2c-driver-in-userspace
> because they "didn't like working with the kernel" or some similar
> excuse.
>
> What is something that doesn't make sense to put into a driver and why?
>
> --
> Patrick Williams
>

--0000000000009fe7ec05c13281cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">On F=
ri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:<br>&gt;<br>&gt;=C2=
=A0 =C2=A0 =C2=A02. How does the availability (and potential recommendation=
 of usage<br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 by our community) affect =
the effort to ensure that all i2c and<br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pmbus drivers are upstreamed?<br>&gt;<br>&gt; Well, this library is mea=
nt for userspace usage. So i2c (hwmon?) and pmbus<br>&gt; drivers would con=
tinue to be upstreamed as per usual.<br>&gt; Motivating use case for usersp=
ace i2c transactions are pmbus firmware<br>&gt; updates. With adm1266 we tr=
ied to upstream sequencer configuration update<br>&gt; via the hwmon/pmbus =
driver, it failed spectacularly. So we have to do it<br>&gt; userspace.<br>=
<br></span>Do you have pointers to the discussion?<div><br></div><div>Whew.=
..took a lot longer to find the thread but here is the explicit rejection o=
f firmware and configuration upgrade from within the kernel</div><div><br><=
/div><div><a href=3D"https://lkml.org/lkml/2020/8/7/565">https://lkml.org/l=
kml/2020/8/7/565</a><br><div><br></div><div>other things like don&#39;t put=
 in ioctls</div><div><br></div><div><a href=3D"https://lkml.org/lkml/2020/6=
/24/830">https://lkml.org/lkml/2020/6/24/830</a><br></div></div><div><br></=
div><div>This is the strongest use-case as it&#39;s been explicitly rejecte=
d by the subsystem maintainer.</div><div><br></div><div>I suspect that thin=
gs like adjusting voltages would similarly be rejected but honestly we have=
n&#39;t gone down that path yet.</div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30, 2021=
 at 8:10 AM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patri=
ck@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02. How does the availability (and potential recomme=
ndation of usage<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 by our community) affect the effort to=
 ensure that all i2c and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmbus drivers are upstreamed?<br>
&gt; <br>
&gt; Well, this library is meant for userspace usage. So i2c (hwmon?) and p=
mbus<br>
&gt; drivers would continue to be upstreamed as per usual.<br>
&gt; Motivating use case for userspace i2c transactions are pmbus firmware<=
br>
&gt; updates. With adm1266 we tried to upstream sequencer configuration upd=
ate<br>
&gt; via the hwmon/pmbus driver, it failed spectacularly. So we have to do =
it<br>
&gt; userspace.<br>
<br>
Do you have pointers to the discussion?<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0What is it that makes you want to write=
 your code using low-level<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c and PMBus APIs directly in userspa=
ce instead of writing or<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 updating drivers and using the various=
 high-level user APIs<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 provided by kernel subsystems?<br>
&gt; <br>
&gt; I speak in the context of hwmon/pmbus but these patches were simply<br=
>
&gt; rejected. A lot of times the device you want to upgrade is also the de=
vice<br>
&gt; you&#39;re gathering telemetry from.<br>
<br>
I think the &quot;is also&quot; is the part that gives me concern.=C2=A0 Ge=
nerally this<br>
means binding/unbinding the kernel side of it, which isn&#39;t pleasant.<br=
>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 I see you mentioned &quot;pmbus device upgr=
ades&quot; and I know the PMBus<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 subsystem doesn&#39;t currently suppor=
t firmware upgrade paths.=C2=A0 But,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 there has been LKML threads about it a=
nd what I recollect was<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 that it wasn&#39;t &quot;not allowed&q=
uot; but just &quot;not implemented&quot;.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Shouldn&#39;t we be focusing our effor=
ts on enhancing features for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the whole OSS community rather than bu=
ilding our own different<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 library?<br>
&gt; <br>
&gt; Fair point but I don&#39;t see them as mutually exclusive, use hwmon/p=
mbus<br>
&gt; drivers where they make sense and work for you. Switch to userspace fo=
r<br>
&gt; stuff that gets strong pushback from hwmon/pmbus maintainer or stuff t=
hat<br>
&gt; just doesn&#39;t make sense to put into a driver.<br>
<br>
My feeling is that we need more definition on what that boundary is.=C2=A0 =
As<br>
long as we are really only doing stuff from userspace when there is no<br>
other path forward, I don&#39;t have much concern.=C2=A0 But, I&#39;ve seen=
 too many<br>
cases where someone has tried to write an i2c-driver-in-userspace<br>
because they &quot;didn&#39;t like working with the kernel&quot; or some si=
milar<br>
excuse.<br>
<br>
What is something that doesn&#39;t make sense to put into a driver and why?=
<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--0000000000009fe7ec05c13281cb--
