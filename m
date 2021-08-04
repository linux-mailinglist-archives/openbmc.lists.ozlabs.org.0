Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594D3DFF75
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 12:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfpFW0zJQz3bPV
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 20:41:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=t5hgQzGT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t5hgQzGT; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfpFB2zf1z2ymZ
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 20:41:16 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id c24so355826lfi.11
 for <openbmc@lists.ozlabs.org>; Wed, 04 Aug 2021 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YSoBL3R0CkSKQWvX3vbKxrACeSzn4naN4+Shz7qs2E0=;
 b=t5hgQzGTCqzZLPTi8J4RKYQg9j/vd3ks2JRP1DOVzJ2TTwtgG/XIxyIrR+MXtPeB8K
 1U8pO1q8lhTvassSTtp60ZLN0529yW1nGTGl81Y3+4SmcfQi4KZxfTzj1cWDSckoY2f+
 cZipaQbfYGhdCPul1CIUVcqKpgimc73K4vK9JXRIaZrbARvSK71h1C6+Kk+X5zYIdO/L
 e7vYmpGEl6U9qyU+Jm+Y9kMCimbQSQ86WDSzx9AvwT+pOdnfIil5Vlaoznrwxlp7qXVX
 1MzHPe+mQwM8jAaifMZWiFtHOCKxF3XpFWzDxb0ryA7XQFgxy+0SUMF5px5r+WnczEhK
 W8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YSoBL3R0CkSKQWvX3vbKxrACeSzn4naN4+Shz7qs2E0=;
 b=QGCXMU6aH17WspaeMJ5s7vg+RzsIFAzvUSMryzX7WFgvcyZXU/ZYVs2CB2Lr7Wob4f
 hhhVVCAaDfZ1Ws1up9B5lwUHKy5R6NP+uW5j4t1KSdlj1p0kE/8LkV5p5Kh5hl41V3ne
 PLljae3mBKv5oW3QwPRqC7ITmhU7q7gzHTGKZHczErbOdu6lDLmoHyQ6UzMQHfrfiYAN
 5trndSTbBE7Btys59j/idaOfUyq37zTwgreE4V2NPGe0ieK3CknzqF3VrRMVdMwsXBtV
 5Uo1eU7Fn5AVkDAAEiZINsMw4+ul0xClVmnlgV6haKsc1tNegfm+zMjATYpYuSoQQChj
 WhcQ==
X-Gm-Message-State: AOAM533d7q0I8KwSqhjDPFOEfbGNnQ9n6aQLnYBx9u+Hvl9uydotUJVe
 +f9c3mNEy/J5aWRjVZ3Z/qw=
X-Google-Smtp-Source: ABdhPJwgsBfKIJaOxzk9KMUEEVXCOdBYx0stZKgocboWDdVTaYBkFDLQUJYGUM9L0hUK8YfX/K/EPA==
X-Received: by 2002:a19:7103:: with SMTP id m3mr20830402lfc.5.1628073666722;
 Wed, 04 Aug 2021 03:41:06 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id g17sm173139lfv.210.2021.08.04.03.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:41:05 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 174Af2Ot007776; Wed, 4 Aug 2021 13:41:03 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 174Af0C4007775;
 Wed, 4 Aug 2021 13:41:00 +0300
Date: Wed, 4 Aug 2021 13:41:00 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Redfish requests for dbus-sensors data are needlessly slow -
 analysis
Message-ID: <20210804104059.GV875@home.paul.comp>
References: <20210729094640.GT875@home.paul.comp>
 <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
 <20210729152919.GX875@home.paul.comp>
 <CACWQX809PpP5MtikAYUm=tZhBBVZcJ78XdbHB6Ex=Y9z6EOu4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACWQX809PpP5MtikAYUm=tZhBBVZcJ78XdbHB6Ex=Y9z6EOu4g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrei Tutolmin <a.tutolmin@gagar-in.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Timofei Nikitin <t.nikitin@gagar-in.com>,
 Jason Bills <jason.m.bills@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Ed,

So as promised I sent the patch to Gerrit on Friday,
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45404 and you
were automatically added as a Reviewer but I haven't worked with WiP
before so I have no idea if you got a notification or not (I didn't
press the START REVIEW button). I'm ready to provide a documentation
patch to the "OpenBMC beginners" instructions once I learn how exactly
WiP patches are usually employed by the community.

The build is not happy with it as I didn't use clang-format
conciously, the diff before it is much clearer (understandble) in this
particular case.

On Thu, Jul 29, 2021 at 09:08:30AM -0700, Ed Tanous wrote:
> On Thu, Jul 29, 2021 at 8:29 AM Paul Fertser <fercerpav@gmail.com> wrote:
> > So bmcweb can subscribe to the signals from entity-manager and
> > invalidate the caches just in case if any EM event registered.
> 
> You have to monitor signals from all connections.  bmcweb doesn't only
> run against entity-manager.  FWIW, what you described is essentially
> entirely what the mapper does;

See how little clue I have, that's exactly the reason I'm addressing
you and the other maintainers because I'm still unable to wrap my head
around all the EM and mapper interactions and what it really takes
_and why_ to get essential information about the system health.

> > > As a general rule, bmcweb has avoided having a cache at all.  There
> > > have been several attempts at adding one, but most failed because of
> > > the same thing you found: cache invalidation is hard.
> >
> > Even if it's just dropped on any ObjectMapper or EntityManager signal?
> 
> Those aren't the only signals you need to monitor.  If you're
> interested in going down this route, I'd start by looking at the
> mapper implementation.  You'd also have to handle connections,
> disconnections, and other stuff.  At some point, what you've done
> starts to look a lot like the mapper.

Understood. So if we have the mapper already why isn't it enough to
issue just one call to it, process the reply, and then request
directly the data bmcweb needs?

> > > If we're going to implement a cache, I'd really like to see it done
> > > at a higher level (somewhere in the connection class) and done more
> > > generically than this is here, which would ensure that all endpoints
> > > are sped up, not just sensors.  With that said, if this really
> > > solves the problem and solves it well, I can't very well ignore it.
> >
> > But is it really a problem? I'm still not sure; probably it's just
> > that we invented a weird usecase not worth optimising for? Have the
> > others faced it and do they consider it to be a problem?
> 
> It's for sure a problem, although your 4 second response times sound
> worse than most.

It's usually about 2 seconds, and with my silly caching I cut it down
to half a second (four times).

> On an ast2500 I've normally seen a 700ms (ish) response time, but
> depending on how many sensors you have, and how fast the backends
> are for each one, I could easily see it getting up there pretty
> easily.

PSUSensor backend is caching hwmon values so it's reasonably fast. And
in my first mail I provided detailed timings of each step bmcweb
performs, so it's clear it doesn't add unreasonably much.

The system in question (Tioga Pass) shows 153 sensors (with dual
26-cores Xeons running).

> Just one thing to double check;  You don't have any custom sensor
> daemons running on your system do you?  Ideally everything should be
> implementing object manager.  If it doesn't, the code paths to build
> the sensor schema has to take the very slow path (ie calling Get on
> each property individually).

In my first mail on the topic I detailed all the calls, and AFAICT
there's nothing custom and no Get requests at all. Can I be missing
anything?
 
> > My real point is that apparently bmcweb is (in some cases) requesting
> > way too much data in way too many calls, using only a tiny fraction of
> > the obtained values in the end. That's why I made that lengthy
> > description of how data for a single sensor is obtained. Caching can
> > hide this to a degree, but shouldn't the root cause be fixed as well?
> 
> Yes, we should come at it from both angles, because a cache will
> still have to invalidate quite a bit, and nobody likes a bimodal
> distribution of response times.

This sounds cool but I'm not sure I understand the point. We face
caching everywhere, and it's usually multi-layered, so when
appropriately benchmarked we often see tri- and more modal
distributions. And when not building a hard real-time system the
median is much more important than the modality I guess?

> The next thing on my personal list is to get a new version of
> GetSubtree added to the mapper, that accepts a list of optional
> interfaces as well as required.  I talked about this a while back on
> discord.

The d-word offences me. Their ToS (and specifically the explicit
prohibition of "third-party" clients) make it outright absolutely
unacceptable to use the (mis)service.

> This might clean up a couple of the extra calls in the
> sensor code, but the primary target was inventory initially.

I'm still rather puzzled by the relationship between different
sensors/entities/inventory/leds/etc. Is there a document describing
everything that's currently essential?

> In a perfect world where software is easy and architectures are
> beautiful, ideally I'd like to see most redfish calls go:
> Call mapper once with a list of interfaces;  Find all connections and
> objects that implement this interface.
> Loop over connections, calling GetManagedObjects on each to read in
> the data and write directly to redfish tree.

So does anyone know what exactly is not perfect about the current
world that makes bmcweb so convoluted?

> > Does bmcweb really _need_ to do all the calls mentioned? I think the
> > fact it performs two identical D-Bus calls in a row gives a clear "no"
> > answer.
> 
> You are almost certainly right, two identical calls is wasteful, and
> we should clean that up if we can.  I'm certain there's probably
> several speedups to be gained by someone understanding the sensor code
> and optimizing it a little.

I'm happy I managed to get my point through finally.

> > After reading my outline of the process can you tell that's
> > exactly the way the OpenBMC D-Bus API is designed to be used?
> 
> I'm not sure I quite follow this question.  The sensor code you're
> looking at evolved significantly over time into the behemoth you see
> today.  It quite likely has several anti-patterns and duplicated calls
> that can be consolidated, but that didn't really show up in the
> individual diffs as features were added.

That's perfectly understandable, happens to every software projects
that's not stale. Not only software even, our own bodies have some
rather "interesting" solutions too, that's a natural result of an
evolution.

> I'm really happy someone has gone through the full flow.  Ideally we
> can start cleaning up the obvious stuff (duplicated calls, ect) in
> some patchsets.

Since I do not understand the role of /inventory/ pathes, and I do not
understand how LEDs get involved (apparently we do not have any LEDs
like that in our Tioga Pass configuration) and I didn't even try to
dig the "power" nodes I'm certainly not in a position to offer a
worthy code contribution in this area :( (other than fixing the
duplicated call which can trivially be done by passing an extra
argument; but that alone isn't fruitful much)

I very much hoped for more involvement from the bmcweb maintainers, as
solving this issue properly, in a way that doesn't break any usecases
obviously requires plenty of domain-specific knowledge (domain here
being the extensive OpenBMC D-Bus API, specifically the
sensors/inventory part of it).

Guess I'm at fault here and doing something wrong, and it's not the
first time I fail to understand how to interact with the
community. E.g. I'm still waiting for an answer to a straightforward
question asked in
https://lists.ozlabs.org/pipermail/openbmc/2021-July/027001.html
. What am I doing wrong? Am I copying the wrong people? Am I asking at
the wrong place? Should I be expecting something else entirely? I have
some reasonable experience interacting with other Free Software
communities but somehow it doesn't seem to be applicable here?

Thank you for your time.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
