Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 817372423D1
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 03:43:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRCCC3kwczDqVC
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 11:43:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=nLtxl4pd; dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRCBS2XWWzDqLq
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 11:42:37 +1000 (AEST)
Received: by mail-yb1-xb43.google.com with SMTP id x10so476493ybj.13
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 18:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rrClHP3NvCnlIlFkZ/5rGzCFot76gSJ0D6KCvFwUKL4=;
 b=nLtxl4pdOJaPskZGueSFj7G6Zahp0CBL+VyAYc1vG55zv67bvUsjBeVspZzrxOQOFq
 oOwJIzXUEY1ss20M6AL6I2UmO5hNSEwqSPkxFt17n0vHI8h5CChUN422kwCjOqqmjPXM
 w3DBoXkiNZDZRrCv5Q7XrV3b37Gzltf7xuC+uRd2vHVV+i9RSVItQTNJ7IByDZtI49sZ
 lSlpjjSKP7slaF1GUERwerVz4m4DrB7Gc3R9c3rNj7wpecXNoMg2Gs4aaIWtqqi54TPX
 I29yzKxjsbvR0XCFXjp3VuxRlRTxINLDBSGE80ww7H3udEZQ+6g8bB0ABHxLdfqFdhWs
 o7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rrClHP3NvCnlIlFkZ/5rGzCFot76gSJ0D6KCvFwUKL4=;
 b=LawPw5iJL/6rXmRzzismwGc8r/J66cVwxiZcw9SKU89rul87EbCNVQiS28gv7eanYD
 OFhsh4Co8jYInEwtSZg5lUXtJC0f+gwniPqpjar0GismJ0s/dehUY0sKjhnY0UnxKdKa
 /XEmRb5P6xwNAFeU5CoaESkv4Il5C7U7vx5rn121trrAbWPjNn2S9S/Zwp2BmFHeTY70
 xRGpp9nUIVHqDhT7N7Iwnhe3Hh6Wx974w2D2xU6tMBiDh0iGBNz8EIt0tzPS6j1fxPGl
 2DwU2ppUGrDdii/PW34P+al/1UfpNYav/H5yJTPgWCHlSD3VdDa1Tiwh9xUR/6+Dpgxw
 EEZA==
X-Gm-Message-State: AOAM532NrYtHfi3tA9gXzzplrAgIxuu8LoDGTjbhFP8ZljIqsPniXPUF
 PspARaNZyjtwpd5sk6OFA9LUKk7emi2m30kCCWv+YA==
X-Google-Smtp-Source: ABdhPJwgir2AQyCA0EuMoa9EqIbG1JaIG9CL6dRK6aBEFD7h3Zoz6rXG2BYfJj6jo+QKVGM/wQHbeHrcXGqXa11aA1M=
X-Received: by 2002:a25:640e:: with SMTP id y14mr48517371ybb.340.1597196554173; 
 Tue, 11 Aug 2020 18:42:34 -0700 (PDT)
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
In-Reply-To: <CAA_a9xJL=jO61H5k=_OjqoTg6enoaANT80PEeK2FOPDuqRyb3g@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 11 Aug 2020 18:42:22 -0700
Message-ID: <CACWQX81wTLGDJqqrf1AGeNQQmRA2G1r5iPm-fW15fZYLB_rAMg@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Alex Qiu <xqiu@google.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Aug 11, 2020 at 5:46 PM Alex Qiu <xqiu@google.com> wrote:
>
> The question was more of a general ask on whether dbus-sensors plans for this on record. If so, individual daemon should have the config option to ignore a device completely. Currently, I think PSUSensor has the ability, but HwmonTempSensor does not.
>

You're talking about ignoring a specific leg of a device?  Like
ignoring a particular sensor on an installed device?  Or are you
talking about ignoring a device class entirely?  Maybe calling out the
specific use case of what you're wanting to ignore might help here.

> The reason behind it may be complicated. One is if we can fix the PSUSensor performance issue on time so that we can use it directly for PID control based on VR temperatures. And then, if we can't fix it on time, what work around can we have?

I'm assuming "on time" here refers to some product schedule?  Without
knowing your particular timelines, I will say this: we've solved
several orders of magnitude worse performance problems in dbus sensors
in the past.  I'm assuming this one just requires the proper
application of debugging, thought, and engineering.  I'm not sure how
to answer your question about workarounds:  You would have whatever
workarounds you're willing to build, that's the beauty of open source.
If using HwMonTempSensor is a workaround, and you're willing to live
with the patch, by all means, use it.

> Is it upstream-able or local patches

That would depend on what your workarounds entail.  If your
workarounds follow the principles of the project, don't duplicate
functionality, don't break any of the existing use cases, and are
maintainable, then they're probably upstreamable.  If you're
duplicating features between daemons unnecessarily for lack of wanting
to hunt down and understand a performance bug, that's probably
something you need to keep in a local patch until you have time to do
the appropriate debugging.

> ? What's more, can we have different polling rates for temperature and voltage/current/power by using multiple daemon for the same device?

Why don't we just make the polling rate configurable in the EM config?
 Each sensor has its own timer for exactly this reason.  In the
original design of dbus-sensors, each sensor instance also ran in its
own process.  We moved it to each sensor type running in a shared
process because the context switches were getting really bad, and a
lot of the sensors of similar types had very similar event matches, so
it allowed us to reduce the dbus load for things like power on.  We
could certainly revisit this, but for what you're wanting, I suspect
we can just configure the polling rates per sensor.  We hardcoded them
under the assumption that we could build one reasonable default that
worked for everyone, but clearly you've broken that assumption, so
lets throw it in a config file, put some reasonable defaults on it,
and call it good.  (note, this is subject to James' opinion as
maintainer, I'm not sure if he'll agree here).

> Of course, ideally, we can go for a fast feature-enriched PSUSensor to take care of everything and deprecate HwmonTempSensor, but you know I have been talking about schedule for multiple times with you before...
>

I understand short schedules.  It always feels like there's not enough
time.  The best advice I have here is to try to break your problem
space down into small problems such that you can get a patch written,
tested, and pushed to gerrit out for that day.  Then use those patches
to slowly move toward what you want, even if you keep stacking them up
in upstream.  Eventually the maintainer will review them, or you'll
have solved someone else's problem before they hit it.  If enough
people do this, we'll be way ahead on these types of bugs.

At some point James might need to school us on what the theoretical
difference is between PSUsensor and HwmonSensor.  I know one was
originally built for PSU modules, and the other was built for on board
hardware, but they're getting pretty similar, maybe it does make sense
to have certain devices in both?
