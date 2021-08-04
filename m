Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF03E084F
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 20:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg16r4B02z3cT0
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 04:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=ElaQUKZY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ElaQUKZY; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg16Z2MMtz2yX8
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 04:51:16 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id u15so1770885wmj.1
 for <openbmc@lists.ozlabs.org>; Wed, 04 Aug 2021 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aanHqrYLR3pZ+UwSE+A1Jl30FNt0VUBjHy+AHXod5Do=;
 b=ElaQUKZYnIeA7cvDbGMk4J2jKBaQ63ockocVvDG48ADWPEyORSNlmBYIHoD/Ksr0qq
 Ki+4ncO2BiM+AzIrk4qNPU64MzLWSuvpPGakaGCwHEMHq7Lgb66K8QcJ6z/EP7rYwdps
 vPHX2DgySLGw+LJpqKcL5ezKMMtWi+pBLShHzLyS1jGfaCNECFowZo/JbQotP2mYvbR1
 Vu8zZTom/SHugxHbwVg9WjrYrrTQGyHeznWLAZrSr3pst4cyQCG7NNk45yZrNVV3wI0P
 wWfwYo1WR2Y/rdbix6YQKprdEg6uu0fey2pkGv1Ag7g3ZLP5WAjus3iyOAWORzWmqlMw
 Wg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aanHqrYLR3pZ+UwSE+A1Jl30FNt0VUBjHy+AHXod5Do=;
 b=hrUZf4gR1K4QIRLFn5xmVtnme3C8wGPtNQ+Npu12pyOQsSwAen9dAceINXsViaNe4l
 KH+kXeW5mMDmOJ4nzVLf25UBV7jbuV/QVzE2IoIevxRWezYXj0EiRl1Pcmz031QlOnzi
 DDsniB+uW/Njof87dwKPg21ihJHF2m3b/aWdpWbk4GyordJ7JPMFpZEoUzQ2NwJxPldl
 dynpGAgGhlKTuePQskXxpPKzV2zdnFkJHtBFh63m2r6A5pVa/EmykKg2KLRLGpshSo0W
 av0m7ZmAKz3apYlalmHSmylfJpJTtjhJWeCLcbCK2ht65s3rjbSNetS+kURQEvmllGW+
 Nt3g==
X-Gm-Message-State: AOAM533kP/SBqv2DO+UYQj+vfUg9GyMYjOcxfz/VKKs0Py0boT25fN08
 cs1Rr9RucAt2vEVG9K3jrZPmmPjqY5S1lnIlXopvCw==
X-Google-Smtp-Source: ABdhPJxcjW4sukY6yJKu8E8aa2V3SqFIPpPkEh+2UsLQ6nm7McOSL/jChDjSfzc+U/Kvb9EvFGe/8Jn1+P3/EIu24M4=
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr892034wmq.171.1628103072915; 
 Wed, 04 Aug 2021 11:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210729094640.GT875@home.paul.comp>
 <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
 <20210729152919.GX875@home.paul.comp>
 <CACWQX809PpP5MtikAYUm=tZhBBVZcJ78XdbHB6Ex=Y9z6EOu4g@mail.gmail.com>
 <20210804104059.GV875@home.paul.comp>
In-Reply-To: <20210804104059.GV875@home.paul.comp>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 4 Aug 2021 11:51:01 -0700
Message-ID: <CAH2-KxD7vEhM7u0SiLV2AKm+fgOwM37xMxaNkKiqxnXJL8Oi5A@mail.gmail.com>
Subject: Re: Redfish requests for dbus-sensors data are needlessly slow -
 analysis
To: Paul Fertser <fercerpav@gmail.com>
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrei Tutolmin <a.tutolmin@gagar-in.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Timofei Nikitin <t.nikitin@gagar-in.com>,
 Jason Bills <jason.m.bills@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 4, 2021 at 3:41 AM Paul Fertser <fercerpav@gmail.com> wrote:
>
> Hello Ed,
>
> So as promised I sent the patch to Gerrit on Friday,
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45404 and you
> were automatically added as a Reviewer but I haven't worked with WiP
> before so I have no idea if you got a notification or not (I didn't
> press the START REVIEW button). I'm ready to provide a documentation
> patch to the "OpenBMC beginners" instructions once I learn how exactly
> WiP patches are usually employed by the community.

One thing to keep in mind is if you use the work in progress mode
within gerrit, non-admins can't see the change.  Generally I just
either mark them WIP in a topic, or put "work in progress" in the
commit message somewhere.

>
> The build is not happy with it as I didn't use clang-format
> conciously, the diff before it is much clearer (understandble) in this
> particular case.

Sure;  obviously the patch will need to pass tests if it's to merge,
but I don't think we're there yet.

>
> On Thu, Jul 29, 2021 at 09:08:30AM -0700, Ed Tanous wrote:
> > On Thu, Jul 29, 2021 at 8:29 AM Paul Fertser <fercerpav@gmail.com> wrote:
> > > So bmcweb can subscribe to the signals from entity-manager and
> > > invalidate the caches just in case if any EM event registered.
> >
> > You have to monitor signals from all connections.  bmcweb doesn't only
> > run against entity-manager.  FWIW, what you described is essentially
> > entirely what the mapper does;
>
> See how little clue I have, that's exactly the reason I'm addressing
> you and the other maintainers because I'm still unable to wrap my head
> around all the EM and mapper interactions and what it really takes
> _and why_ to get essential information about the system health.
>
> > > > As a general rule, bmcweb has avoided having a cache at all.  There
> > > > have been several attempts at adding one, but most failed because of
> > > > the same thing you found: cache invalidation is hard.
> > >
> > > Even if it's just dropped on any ObjectMapper or EntityManager signal?
> >
> > Those aren't the only signals you need to monitor.  If you're
> > interested in going down this route, I'd start by looking at the
> > mapper implementation.  You'd also have to handle connections,
> > disconnections, and other stuff.  At some point, what you've done
> > starts to look a lot like the mapper.
>
> Understood. So if we have the mapper already why isn't it enough to
> issue just one call to it, process the reply, and then request
> directly the data bmcweb needs?

Because the mapper interfaces are non-ideal for building Redfish
resources, and we have to work around them a lot.  As a first pass, I
proposed a change to the mapper to add a new way to call GetSubTree
that would at least deduplicate some of the calls:
https://discord.com/channels/775381525260664832/855566794994221117/864536874894229505

>
> > > > If we're going to implement a cache, I'd really like to see it done
> > > > at a higher level (somewhere in the connection class) and done more
> > > > generically than this is here, which would ensure that all endpoints
> > > > are sped up, not just sensors.  With that said, if this really
> > > > solves the problem and solves it well, I can't very well ignore it.
> > >
> > > But is it really a problem? I'm still not sure; probably it's just
> > > that we invented a weird usecase not worth optimising for? Have the
> > > others faced it and do they consider it to be a problem?
> >
> > It's for sure a problem, although your 4 second response times sound
> > worse than most.
>
> It's usually about 2 seconds, and with my silly caching I cut it down
> to half a second (four times).

That's really good profiling information still.  I haven't really
measured the impact, but it makes me think I'm on the right track
trying to optimize mapper calls a bit.

>
> > On an ast2500 I've normally seen a 700ms (ish) response time, but
> > depending on how many sensors you have, and how fast the backends
> > are for each one, I could easily see it getting up there pretty
> > easily.
>
> PSUSensor backend is caching hwmon values so it's reasonably fast.

..... This is the way it _should_ be.  Unfortunately PSUsensor has
some really bad behaviors in terms of blocking dbus transactions while
pmbus reads are happening.  There's been a couple proposed fixes to
this, but nothing has landed yet.

> And
> in my first mail I provided detailed timings of each step bmcweb
> performs, so it's clear it doesn't add unreasonably much.
>
> The system in question (Tioga Pass) shows 153 sensors (with dual
> 26-cores Xeons running).
>
> > Just one thing to double check;  You don't have any custom sensor
> > daemons running on your system do you?  Ideally everything should be
> > implementing object manager.  If it doesn't, the code paths to build
> > the sensor schema has to take the very slow path (ie calling Get on
> > each property individually).
>
> In my first mail on the topic I detailed all the calls, and AFAICT
> there's nothing custom and no Get requests at all. Can I be missing
> anything?

Good;  So long as you're running upstream code we fixed this pattern a
long time back.

>
> > > My real point is that apparently bmcweb is (in some cases) requesting
> > > way too much data in way too many calls, using only a tiny fraction of
> > > the obtained values in the end. That's why I made that lengthy
> > > description of how data for a single sensor is obtained. Caching can
> > > hide this to a degree, but shouldn't the root cause be fixed as well?
> >
> > Yes, we should come at it from both angles, because a cache will
> > still have to invalidate quite a bit, and nobody likes a bimodal
> > distribution of response times.
>
> This sounds cool but I'm not sure I understand the point. We face
> caching everywhere, and it's usually multi-layered, so when
> appropriately benchmarked we often see tri- and more modal
> distributions. And when not building a hard real-time system the
> median is much more important than the modality I guess?

I'm not sure I'd say we have "caching everywhere".  About the only
thing we really cache today is the mapper, and that only really
invalidates on startup.  My point is really that if we implement a
cache in bmcweb, we'll see one response that takes 200ms, then some
responses will take 4 seconds when the cache isn't valid.

>
> > The next thing on my personal list is to get a new version of
> > GetSubtree added to the mapper, that accepts a list of optional
> > interfaces as well as required.  I talked about this a while back on
> > discord.
>
> The d-word offences me. Their ToS (and specifically the explicit
> prohibition of "third-party" clients) make it outright absolutely
> unacceptable to use the (mis)service.

While I value your opinion, this isn't the right place to be
bifurcating the discussion.  If you have concerns about discord, feel
free to bring them up in another thread and I'm sure you'll be heard.
Let's keep on topic about making the sensor code faster.

>
> > This might clean up a couple of the extra calls in the
> > sensor code, but the primary target was inventory initially.
>
> I'm still rather puzzled by the relationship between different
> sensors/entities/inventory/leds/etc. Is there a document describing
> everything that's currently essential?

One systems "essential" is another systems "optional".  This is the
short way of saying, no, I don't think we make any distinction between
essential and non-essential relationships on dbus.  The best way to
understand is to go look at the code like you've done.

>
> > In a perfect world where software is easy and architectures are
> > beautiful, ideally I'd like to see most redfish calls go:
> > Call mapper once with a list of interfaces;  Find all connections and
> > objects that implement this interface.
> > Loop over connections, calling GetManagedObjects on each to read in
> > the data and write directly to redfish tree.
>
> So does anyone know what exactly is not perfect about the current
> world that makes bmcweb so convoluted?

I'm going to assume you're talking about the Redfish interface
specifically being complex in this case (there are a lot of other
reasons why virtual media, KVM, and SOL are complicated).  At the risk
of making a generalization, I would say it's a combination of the
Redfish spec being complex, and the dbus interfaces (including the
mapper) being designed long before Redfish was a thing.  This makes
translating Dbus->Redfish conversion code non-trivial.  We also have
the constraint that we support a lot more system architectures than
most codebases do, which leads to needing a lot of flexibility in what
the Redfish tree looks like per-system.  With that said, if you have
any ideas for how to simplify, they'd be great to see (ideally in a
patchset).

>
> > > Does bmcweb really _need_ to do all the calls mentioned? I think the
> > > fact it performs two identical D-Bus calls in a row gives a clear "no"
> > > answer.
> >
> > You are almost certainly right, two identical calls is wasteful, and
> > we should clean that up if we can.  I'm certain there's probably
> > several speedups to be gained by someone understanding the sensor code
> > and optimizing it a little.
>
> I'm happy I managed to get my point through finally.

I'm looking forward to the patch.

>
> > > After reading my outline of the process can you tell that's
> > > exactly the way the OpenBMC D-Bus API is designed to be used?
> >
> > I'm not sure I quite follow this question.  The sensor code you're
> > looking at evolved significantly over time into the behemoth you see
> > today.  It quite likely has several anti-patterns and duplicated calls
> > that can be consolidated, but that didn't really show up in the
> > individual diffs as features were added.
>
> That's perfectly understandable, happens to every software projects
> that's not stale. Not only software even, our own bodies have some
> rather "interesting" solutions too, that's a natural result of an
> evolution.
>
> > I'm really happy someone has gone through the full flow.  Ideally we
> > can start cleaning up the obvious stuff (duplicated calls, ect) in
> > some patchsets.
>
> Since I do not understand the role of /inventory/ pathes, and I do not
> understand how LEDs get involved (apparently we do not have any LEDs
> like that in our Tioga Pass configuration) and I didn't even try to
> dig the "power" nodes I'm certainly not in a position to offer a
> worthy code contribution in this area :( (other than fixing the
> duplicated call which can trivially be done by passing an extra
> argument; but that alone isn't fruitful much)

Reading and understanding the code is probably the best way to become
"worthy".  It would be great to have even a simple change land on
master as the result of this discussion that can start to work on your
concerns.

>
> I very much hoped for more involvement from the bmcweb maintainers, as
> solving this issue properly, in a way that doesn't break any usecases
> obviously requires plenty of domain-specific knowledge (domain here
> being the extensive OpenBMC D-Bus API, specifically the
> sensors/inventory part of it).

I'm not following here.... I (a bmcweb maintainer) have given you
several pretty lengthy replies about things that could be worked on.
Is there some other involvement you were hoping for that doesn't
involve the maintainers just writing up and testing the patches?

>
> Guess I'm at fault here and doing something wrong, and it's not the
> first time I fail to understand how to interact with the
> community. E.g. I'm still waiting for an answer to a straightforward
> question asked in
> https://lists.ozlabs.org/pipermail/openbmc/2021-July/027001.html
> . What am I doing wrong? Am I copying the wrong people? Am I asking at
> the wrong place? Should I be expecting something else entirely? I have
> some reasonable experience interacting with other Free Software
> communities but somehow it doesn't seem to be applicable here?

I'm guessing nobody knows the answer to that question, and very few
people are interested in beep codes.  If I had to guess, the BeepCode
interface is only implemented in Intels fork, and probably could be
removed from upstream until the backend is pushed;  This is likely
leftover cruft from pulling dbus-sensors into mainline, but it doesn't
hurt anything, so nobody really noticed.

>
> Thank you for your time.
>
> --
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com
