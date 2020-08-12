Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D70A242381
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 02:47:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BR9yL4R89zDqTC
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 10:47:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vsnmFGVT; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BR9xV5dDTzDqP5
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 10:46:21 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id a65so634745otc.8
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 17:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f10til0HjhaDAVcjbSNRGUZ4pax2iPorGY8VvjNPFhY=;
 b=vsnmFGVTzDbI8OBcCzIZiezQEh6GIHJBhRMPQ0RCB7bftCVPcbmRkZY2+I3cKOX7o2
 dIljHKbx1BV84fWA/qKs/3EAAwCNhJRKtXRHA5NSQPxo77f2DpeXEwQc6oz6/tNkWSwS
 HFcxDDukPoP5OX6B6j27O7IlJioM922RHMHcl4Kf4pkrRE42ScYxxiPYyFk9rnsvaz9o
 9rA/VqOaxNk8oxR0iv1q//egZ6z8m11qnN+o5Wxv6G6SpRQiWlCgAcM8eoDhev0af0TW
 bmNFPPVPSm7BN6aMdh9vb9PMzgKortLYRmjnwK8xq8mIGD5eHd64ZwawgZ+WYP+u302/
 9JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f10til0HjhaDAVcjbSNRGUZ4pax2iPorGY8VvjNPFhY=;
 b=KdM0pqPIvI37qTNREaJQGha5IdSJ+g/2gftBlR2Olus1UZaoc7Ep6eAE313thH2dQF
 w/fcyEuoB/27DY3k9r+W7vKzBvvLBTqq70nsca7DjBz8DIBXdrIhzWKO9klLrMI7s1cn
 RiJ9/dSvrCPrzHnn9fX1gxcF+rCuPUeNNC2mxJHg3Z9C+yt1XKnkCj0ehRFTjOo4yAbZ
 5kpdQFFX0MF0egysgwnJRjRZ7yB4p2vb/5Pz7+ji09hYexdLHhA8V8SUfjzSLe7KaivU
 aNDSeJmlQPqElX4Kyf1onsOOM/Bs/X4OMMvz4m59iN3nrnh7K6DFdaDQxwGep5DXV+xq
 2sfg==
X-Gm-Message-State: AOAM531eX9a8FCY+YqbZf5PqO/QrPyKTPlJTinivXgw+xwk6yAPLKNZj
 s0RLlFuGuC0i0LCPIQswNk5BVU96MJPXN0Xt9a1d0w==
X-Google-Smtp-Source: ABdhPJzWwpERGSfENEddUXw1A3Ploq79dlP9R1hbS6cg4EN54GMUcep0udc6tAEHXAM+bZEhRT/WbWHKclS7QMWnte8=
X-Received: by 2002:a05:6830:22e2:: with SMTP id
 t2mr7041312otc.274.1597193177809; 
 Tue, 11 Aug 2020 17:46:17 -0700 (PDT)
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
In-Reply-To: <CACWQX80Y9WAjtW=xiq6PgHX3GnF2b6-CT3fL632OyfPBvk029A@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Tue, 11 Aug 2020 17:46:06 -0700
Message-ID: <CAA_a9xJL=jO61H5k=_OjqoTg6enoaANT80PEeK2FOPDuqRyb3g@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="00000000000000ad0405aca384d1"
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

--00000000000000ad0405aca384d1
Content-Type: text/plain; charset="UTF-8"

Hi Ed,

The question was more of a general ask on whether dbus-sensors plans for
this on record. If so, individual daemon should have the config option to
ignore a device completely. Currently, I think PSUSensor has the ability,
but HwmonTempSensor does not.

The reason behind it may be complicated. One is if we can fix the PSUSensor
performance issue on time so that we can use it directly for PID control
based on VR temperatures. And then, if we can't fix it on time, what work
around can we have? Is it upstream-able or local patches? What's more, can
we have different polling rates for temperature and voltage/current/power
by using multiple daemon for the same device? Of course, ideally, we can go
for a fast feature-enriched PSUSensor to take care of everything and
deprecate HwmonTempSensor, but you know I have been talking about schedule
for multiple times with you before...

Thanks.

- Alex Qiu


On Tue, Aug 11, 2020 at 4:02 PM Ed Tanous <ed@tanous.net> wrote:

> On Mon, Aug 10, 2020 at 5:09 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > Hi Ed and James,
> >
> > Is it acceptable for a device to be listed in both HwmonTempSensor and
> PSUSensor?
> >
>
> Can you lay out a little bit of info about why you would need the same
> type in both places?  My knee jerk reaction would be to say no, under
> the idea that we shouldn't be duplicating functionality and code
> between sensors, but if there are good technical reasons that amount
> to more than "one has bugs, the other doesn't" then I definitely would
> be for allowing it.
>

--00000000000000ad0405aca384d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ed,<div><br></div><div>The question was more of a gener=
al ask on whether dbus-sensors plans for this on record. If so, individual =
daemon should have the config option to ignore a device completely. Current=
ly, I think PSUSensor has the ability, but HwmonTempSensor does not.</div><=
div><br></div><div>The reason behind it may be complicated. One is if we ca=
n fix the PSUSensor performance issue on time so that we can use it directl=
y for PID control based on VR temperatures. And then, if we can&#39;t fix i=
t on time, what work around can we have? Is it upstream-able or local patch=
es? What&#39;s more, can we have different polling rates for temperature an=
d voltage/current/power by using multiple daemon for the same device? Of co=
urse, ideally, we can go for a fast feature-enriched PSUSensor to take care=
 of everything and deprecate HwmonTempSensor, but you know I have been talk=
ing about schedule for multiple times with you before...</div><div><br></di=
v><div>Thanks.</div><div><br clear=3D"all"><div><div dir=3D"ltr" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></div><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Aug 11, 2020 at 4:02 PM Ed Tanous &lt;<a href=3D"mailto:ed@tan=
ous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Mon, Aug 10, 2020 at 5:09 PM Ale=
x Qiu &lt;<a href=3D"mailto:xqiu@google.com" target=3D"_blank">xqiu@google.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Ed and James,<br>
&gt;<br>
&gt; Is it acceptable for a device to be listed in both HwmonTempSensor and=
 PSUSensor?<br>
&gt;<br>
<br>
Can you lay out a little bit of info about why you would need the same<br>
type in both places?=C2=A0 My knee jerk reaction would be to say no, under<=
br>
the idea that we shouldn&#39;t be duplicating functionality and code<br>
between sensors, but if there are good technical reasons that amount<br>
to more than &quot;one has bugs, the other doesn&#39;t&quot; then I definit=
ely would<br>
be for allowing it.<br>
</blockquote></div>

--00000000000000ad0405aca384d1--
