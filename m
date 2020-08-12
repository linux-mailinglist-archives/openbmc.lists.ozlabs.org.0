Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C46A242D16
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 18:23:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRZkC44QczDqHh
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 02:22:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=HR/GLod+; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRZdy38HBzDqHh
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 02:19:16 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id h22so2363513otq.11
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 09:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9Glef9d9t0YenWpm08Gzu912/TWVi7bLf5KHsEjN9I=;
 b=HR/GLod+Ymg79TH/7Ji1Pcu2WR4zQyd5mI0//HvBRkdpML1csK6vjIOLy5NlmENlHf
 T7fNmaJ/bnAjWCrA5hQZWKdA62K42RZ3q7qA1++S+xytwxUAPKlRRtRiabPxHKJnwipq
 7XEXTPyFeb/UTVMntXNwiBvWdNug8p80Hs0HvW1lnN2nux0rh8YCNv5VKsjwQFbgwjW2
 qufAnvAa/RQvvvWjuGLgOmqGunhzPmNWHmyNn3QuScqpXn0DMxvii9zoVyRjJNkquUOL
 Zarws3Ffqp5gOUdpxI2pKU9qUqkHJLKDSfvAJzR7Y2ISOWo7EI52YjM9bfRzLFChHkrR
 rSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9Glef9d9t0YenWpm08Gzu912/TWVi7bLf5KHsEjN9I=;
 b=XbDAb2rEBzfEy0r+o4U2a7+bc9NHWbVklQnRYmTsrKEb1m0koC5qxZ38urw5CYbuTG
 xVFomAVFSI+tPECxf/ZdKV1nIsCWduA4HulI3NTHKA/e2Tt7kmvwHhZtIlbXwVirJGMd
 jkqB8buMagn4jPkiiPja9KMYvfIa1b5GV1J7o4fs9898B1E7zwgdXKvFIiQ57No0Wux8
 xcYGzuM54t8lM6rDEriCI4ZVV6fICeFj2LvuP6g8Eb9sUqBvCJI6TIGjZQWYZTWjh2Ls
 /R6iEpE6WIU4Hou0pMIyFPrz1ByWODbp2uKbsLJbOa9g5y1D7ZHlN3iXEPvjUVMUaA2h
 mJzA==
X-Gm-Message-State: AOAM532Z8ksro9mrtzYF0NcVvSOweM1i9ZUJYQDgLCRVUZxsPpQknrMH
 CtyCLWhh2D38hsLluf1aDRJ6W9Z8bKPS15hBjRf9NQ==
X-Google-Smtp-Source: ABdhPJwPzsS9k3SOd+k+E9Oy14+UF3DPf4WKm2Gkxql0HMccc8m+KgG4WYPKOme69zCDsAC6vf5/WxTYUguW1N4m5bU=
X-Received: by 2002:a9d:d02:: with SMTP id 2mr425135oti.306.1597249152287;
 Wed, 12 Aug 2020 09:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
 <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
 <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
 <CACWQX83AdMHFk5NUJmpoesghK_2YZ9MMo6h-KoWzDtZ-jrTYRw@mail.gmail.com>
 <CAHBbfcUBBUpO9o2pNSbr0YKXNRHPju4gNNHxxNxuda9k5D0BYQ@mail.gmail.com>
 <CACWQX809R7wx+qNt5PhZW-Snv0jdPnUVGSt+A_jobrTcYC8B2Q@mail.gmail.com>
 <CAA_a9xJhKikZR0rhZWfVfKF1VKMkP1yUkRJxhWSC37JA-2h7sA@mail.gmail.com>
 <CACWQX80Y9WAjtW=xiq6PgHX3GnF2b6-CT3fL632OyfPBvk029A@mail.gmail.com>
 <CAA_a9xJL=jO61H5k=_OjqoTg6enoaANT80PEeK2FOPDuqRyb3g@mail.gmail.com>
 <CACWQX81wTLGDJqqrf1AGeNQQmRA2G1r5iPm-fW15fZYLB_rAMg@mail.gmail.com>
In-Reply-To: <CACWQX81wTLGDJqqrf1AGeNQQmRA2G1r5iPm-fW15fZYLB_rAMg@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 12 Aug 2020 09:19:01 -0700
Message-ID: <CAA_a9x+uOmZPCMH17p3bpaD=USvYzNWdKmHrDVbJPgfyBp+oag@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000576d0705acb08c0b"
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
 James Feist <james.feist@linux.intel.com>, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000576d0705acb08c0b
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

I was talking about, if having one device in multiple daemons is expected,
it would make sense to have some switch in the config to turn off the
support for one device according to the setup. From your reply, I think I
see this is not really preferred or expected from the design, so I'll leave
it to Sui to come up with more data on the issue that we are having, and
progress on the actual issue. In case the time is running out, we'll try
local patches for workarounds. Thanks!

- Alex Qiu


On Tue, Aug 11, 2020 at 6:42 PM Ed Tanous <ed@tanous.net> wrote:

> On Tue, Aug 11, 2020 at 5:46 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > The question was more of a general ask on whether dbus-sensors plans for
> this on record. If so, individual daemon should have the config option to
> ignore a device completely. Currently, I think PSUSensor has the ability,
> but HwmonTempSensor does not.
> >
>
> You're talking about ignoring a specific leg of a device?  Like
> ignoring a particular sensor on an installed device?  Or are you
> talking about ignoring a device class entirely?  Maybe calling out the
> specific use case of what you're wanting to ignore might help here.
>
> > The reason behind it may be complicated. One is if we can fix the
> PSUSensor performance issue on time so that we can use it directly for PID
> control based on VR temperatures. And then, if we can't fix it on time,
> what work around can we have?
>
> I'm assuming "on time" here refers to some product schedule?  Without
> knowing your particular timelines, I will say this: we've solved
> several orders of magnitude worse performance problems in dbus sensors
> in the past.  I'm assuming this one just requires the proper
> application of debugging, thought, and engineering.  I'm not sure how
> to answer your question about workarounds:  You would have whatever
> workarounds you're willing to build, that's the beauty of open source.
> If using HwMonTempSensor is a workaround, and you're willing to live
> with the patch, by all means, use it.
>
> > Is it upstream-able or local patches
>
> That would depend on what your workarounds entail.  If your
> workarounds follow the principles of the project, don't duplicate
> functionality, don't break any of the existing use cases, and are
> maintainable, then they're probably upstreamable.  If you're
> duplicating features between daemons unnecessarily for lack of wanting
> to hunt down and understand a performance bug, that's probably
> something you need to keep in a local patch until you have time to do
> the appropriate debugging.
>
> > ? What's more, can we have different polling rates for temperature and
> voltage/current/power by using multiple daemon for the same device?
>
> Why don't we just make the polling rate configurable in the EM config?
>  Each sensor has its own timer for exactly this reason.  In the
> original design of dbus-sensors, each sensor instance also ran in its
> own process.  We moved it to each sensor type running in a shared
> process because the context switches were getting really bad, and a
> lot of the sensors of similar types had very similar event matches, so
> it allowed us to reduce the dbus load for things like power on.  We
> could certainly revisit this, but for what you're wanting, I suspect
> we can just configure the polling rates per sensor.  We hardcoded them
> under the assumption that we could build one reasonable default that
> worked for everyone, but clearly you've broken that assumption, so
> lets throw it in a config file, put some reasonable defaults on it,
> and call it good.  (note, this is subject to James' opinion as
> maintainer, I'm not sure if he'll agree here).
>
> > Of course, ideally, we can go for a fast feature-enriched PSUSensor to
> take care of everything and deprecate HwmonTempSensor, but you know I have
> been talking about schedule for multiple times with you before...
> >
>
> I understand short schedules.  It always feels like there's not enough
> time.  The best advice I have here is to try to break your problem
> space down into small problems such that you can get a patch written,
> tested, and pushed to gerrit out for that day.  Then use those patches
> to slowly move toward what you want, even if you keep stacking them up
> in upstream.  Eventually the maintainer will review them, or you'll
> have solved someone else's problem before they hit it.  If enough
> people do this, we'll be way ahead on these types of bugs.
>
> At some point James might need to school us on what the theoretical
> difference is between PSUsensor and HwmonSensor.  I know one was
> originally built for PSU modules, and the other was built for on board
> hardware, but they're getting pretty similar, maybe it does make sense
> to have certain devices in both?
>

--000000000000576d0705acb08c0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div><br></div><div>I was talking about, if having o=
ne device in multiple daemons is expected, it would make sense to have some=
 switch in the config to turn off the support for one device according to t=
he setup. From your reply, I think I see this is not really preferred=C2=A0=
or expected from the design, so I&#39;ll leave it to Sui to come up with mo=
re data on the issue that we are having, and progress on the actual issue. =
In case the time is running out, we&#39;ll try local patches for workaround=
s. Thanks!</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu<=
/div></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Aug 11, 2020 at 6:42 PM Ed Tanous &lt;<a=
 href=3D"mailto:ed@tanous.net">ed@tanous.net</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug 11, 2020 at 5:46 PM=
 Alex Qiu &lt;<a href=3D"mailto:xqiu@google.com" target=3D"_blank">xqiu@goo=
gle.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The question was more of a general ask on whether dbus-sensors plans f=
or this on record. If so, individual daemon should have the config option t=
o ignore a device completely. Currently, I think PSUSensor has the ability,=
 but HwmonTempSensor does not.<br>
&gt;<br>
<br>
You&#39;re talking about ignoring a specific leg of a device?=C2=A0 Like<br=
>
ignoring a particular sensor on an installed device?=C2=A0 Or are you<br>
talking about ignoring a device class entirely?=C2=A0 Maybe calling out the=
<br>
specific use case of what you&#39;re wanting to ignore might help here.<br>
<br>
&gt; The reason behind it may be complicated. One is if we can fix the PSUS=
ensor performance issue on time so that we can use it directly for PID cont=
rol based on VR temperatures. And then, if we can&#39;t fix it on time, wha=
t work around can we have?<br>
<br>
I&#39;m assuming &quot;on time&quot; here refers to some product schedule?=
=C2=A0 Without<br>
knowing your particular timelines, I will say this: we&#39;ve solved<br>
several orders of magnitude worse performance problems in dbus sensors<br>
in the past.=C2=A0 I&#39;m assuming this one just requires the proper<br>
application of debugging, thought, and engineering.=C2=A0 I&#39;m not sure =
how<br>
to answer your question about workarounds:=C2=A0 You would have whatever<br=
>
workarounds you&#39;re willing to build, that&#39;s the beauty of open sour=
ce.<br>
If using HwMonTempSensor is a workaround, and you&#39;re willing to live<br=
>
with the patch, by all means, use it.<br>
<br>
&gt; Is it upstream-able or local patches<br>
<br>
That would depend on what your workarounds entail.=C2=A0 If your<br>
workarounds follow the principles of the project, don&#39;t duplicate<br>
functionality, don&#39;t break any of the existing use cases, and are<br>
maintainable, then they&#39;re probably upstreamable.=C2=A0 If you&#39;re<b=
r>
duplicating features between daemons unnecessarily for lack of wanting<br>
to hunt down and understand a performance bug, that&#39;s probably<br>
something you need to keep in a local patch until you have time to do<br>
the appropriate debugging.<br>
<br>
&gt; ? What&#39;s more, can we have different polling rates for temperature=
 and voltage/current/power by using multiple daemon for the same device?<br=
>
<br>
Why don&#39;t we just make the polling rate configurable in the EM config?<=
br>
=C2=A0Each sensor has its own timer for exactly this reason.=C2=A0 In the<b=
r>
original design of dbus-sensors, each sensor instance also ran in its<br>
own process.=C2=A0 We moved it to each sensor type running in a shared<br>
process because the context switches were getting really bad, and a<br>
lot of the sensors of similar types had very similar event matches, so<br>
it allowed us to reduce the dbus load for things like power on.=C2=A0 We<br=
>
could certainly revisit this, but for what you&#39;re wanting, I suspect<br=
>
we can just configure the polling rates per sensor.=C2=A0 We hardcoded them=
<br>
under the assumption that we could build one reasonable default that<br>
worked for everyone, but clearly you&#39;ve broken that assumption, so<br>
lets throw it in a config file, put some reasonable defaults on it,<br>
and call it good.=C2=A0 (note, this is subject to James&#39; opinion as<br>
maintainer, I&#39;m not sure if he&#39;ll agree here).<br>
<br>
&gt; Of course, ideally, we can go for a fast feature-enriched PSUSensor to=
 take care of everything and deprecate HwmonTempSensor, but you know I have=
 been talking about schedule for multiple times with you before...<br>
&gt;<br>
<br>
I understand short schedules.=C2=A0 It always feels like there&#39;s not en=
ough<br>
time.=C2=A0 The best advice I have here is to try to break your problem<br>
space down into small problems such that you can get a patch written,<br>
tested, and pushed to gerrit out for that day.=C2=A0 Then use those patches=
<br>
to slowly move toward what you want, even if you keep stacking them up<br>
in upstream.=C2=A0 Eventually the maintainer will review them, or you&#39;l=
l<br>
have solved someone else&#39;s problem before they hit it.=C2=A0 If enough<=
br>
people do this, we&#39;ll be way ahead on these types of bugs.<br>
<br>
At some point James might need to school us on what the theoretical<br>
difference is between PSUsensor and HwmonSensor.=C2=A0 I know one was<br>
originally built for PSU modules, and the other was built for on board<br>
hardware, but they&#39;re getting pretty similar, maybe it does make sense<=
br>
to have certain devices in both?<br>
</blockquote></div>

--000000000000576d0705acb08c0b--
