Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E102B3DA87F
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 18:09:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbFpF685Qz3cLr
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 02:09:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=106Y/izi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=106Y/izi; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbFnx0nTpz3cH0
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jul 2021 02:08:50 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id l17so8239931ljn.2
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qKiEefiJ99dCWPIT/G6i8IL9FZUY+X9vSDXAitnrJTU=;
 b=106Y/izilI42P29vqJATEDpJTVo0i4gSo1SHlnn8GuB7VjcE7pgvbiVscPBu9UWz2q
 gRCsjG2LUSEDplA7vGGqbxXowxpiig21WqnwNwpZexYuKipyBLSjSAPrlsafzoS3j4D9
 qQVRGczd7GttUfK/Y+u+DCA6ikAQ+9nJn1234Q6OV/E95lwa6H1/8JWcQMBgNU9YQrvu
 aJMlxxGyx4+eBVtV1SMek6PDsxfP/H2A+DgI1gqvavgsZfgtMav8g1CMxmscoGr/U31l
 AGK1ZXlqZJyqx9ONwMU14AqTgjUNjvCB77Voj0Aq5KlGcv7NFLOizgJxrgLN+bveVz4N
 0GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKiEefiJ99dCWPIT/G6i8IL9FZUY+X9vSDXAitnrJTU=;
 b=tdQCYdOYptNE+suA4DypSvbXYS3JtQU3IXn+fGxmL+AuIMp7LhHYE91vD1rGSJd7Vd
 CbFrS5hdtU8bP5uDHmBsrNykqWeNyDsDlhIrMkqQr+MaUenM7JnGgYJ4KAkEIndXy179
 Kh2UvO3+0WQHwcqUMZgrV+Se6/no9wPHzNHTX6kV2YmmftJ1u1Qj2Q9WW5+shLIOhhw5
 wcuZ593RXoRFoSo2J0Wx06J9Lbi0dLskFqhGTXaiUZeYagc9GyRfO4n3tzdim3RgaOIP
 gDk/TD1jQWLIo+QUqNIVscTOtQF135AmJzHxBE9MLrAiiBQir8ubM43GcSxC5Y4skdFe
 FS8w==
X-Gm-Message-State: AOAM531gPe2GVouRpH4OMObdYFauiXIbKaxl8jczQYtFQpdAa+cZqVQl
 UwfGru+oHTXwiO6wBn/ykONl+DNbyT9CyXjj+jNMJQ==
X-Google-Smtp-Source: ABdhPJyjJ8NpQbR6zAB15e0CShMb0d2LTZhni/9eYyyi0ddXyg2Jveo1Dia3DNoyOD60U6Pbl7g6NSkMx9ZcA4+TliE=
X-Received: by 2002:a2e:9852:: with SMTP id e18mr3533574ljj.6.1627574921856;
 Thu, 29 Jul 2021 09:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210729094640.GT875@home.paul.comp>
 <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
 <20210729152919.GX875@home.paul.comp>
In-Reply-To: <20210729152919.GX875@home.paul.comp>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 29 Jul 2021 09:08:30 -0700
Message-ID: <CACWQX809PpP5MtikAYUm=tZhBBVZcJ78XdbHB6Ex=Y9z6EOu4g@mail.gmail.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Timofei Nikitin <t.nikitin@gagar-in.com>,
 Jason Bills <jason.m.bills@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 29, 2021 at 8:29 AM Paul Fertser <fercerpav@gmail.com> wrote:
>
> Hello Ed,
>
> Thank you for the reply.
>
> On Thu, Jul 29, 2021 at 07:53:38AM -0700, Ed Tanous wrote:
> > On Thu, Jul 29, 2021 at 2:46 AM Paul Fertser <fercerpav@gmail.com> wrote:
> > > Here follows my naive exploratory patch. It works for the sensors
> > > we're interested in (unless they appear after the first Redfish
> > > request made to bmcweb as the cache for the expensive D-Bus calls is
> > > never invalidated). It doesn't handle complex inventory associations.
> >
> > The "unless" is kind of important here.  Sensors can show up or be
> > removed at any time, especially on an entity-manager enabled system.
>
> So bmcweb can subscribe to the signals from entity-manager and
> invalidate the caches just in case if any EM event registered.

You have to monitor signals from all connections.  bmcweb doesn't only
run against entity-manager.  FWIW, what you described is essentially
entirely what the mapper does;   Handling all the race conditions, add
events, remove events, with and without object manager support was
non-trivial, and this is why Andrews attempt tries to put it into a
library so we don't lose that code.

None of this is to say "don't try".... please, give it an attempt and
let's see if we can tease something good out here, but just understand
that there are race conditions there.

>
> > As a general rule, bmcweb has avoided having a cache at all.  There
> > have been several attempts at adding one, but most failed because of
> > the same thing you found: cache invalidation is hard.
>
> Even if it's just dropped on any ObjectMapper or EntityManager signal?

Those aren't the only signals you need to monitor.  If you're
interested in going down this route, I'd start by looking at the
mapper implementation.  You'd also have to handle connections,
disconnections, and other stuff.  At some point, what you've done
starts to look a lot like the mapper.

>
> > If we're going to implement a cache, I'd really like to see it done
> > at a higher level (somewhere in the connection class) and done more
> > generically than this is here, which would ensure that all endpoints
> > are sped up, not just sensors.  With that said, if this really
> > solves the problem and solves it well, I can't very well ignore it.
>
> But is it really a problem? I'm still not sure; probably it's just
> that we invented a weird usecase not worth optimising for? Have the
> others faced it and do they consider it to be a problem?

It's for sure a problem, although your 4 second response times sound
worse than most.  On an ast2500 I've normally seen a 700ms (ish)
response time, but depending on how many sensors you have, and how
fast the backends are for each one, I could easily see it getting up
there pretty easily.

Just one thing to double check;  You don't have any custom sensor
daemons running on your system do you?  Ideally everything should be
implementing object manager.  If it doesn't, the code paths to build
the sensor schema has to take the very slow path (ie calling Get on
each property individually).

>
> > > I would be willing to work on doing the right thing but for that I'm
> > > lacking the understanding of the complete picture involved in handling
> > > all types of sensors and interfaces, so I'm kindly asking for your
> > > help with it.
> > >
> > > diff --git a/redfish-core/lib/sensors.hpp b/redfish-core/lib/sensors.hpp
> >
> > Can you please submit the below to gerrit as a WIP instead.  There's
> > much better tooling there for reviewing and testing patches.  I can
> > review it more there.
>
> Sure, will do. I didn't mean to offer it as a solution, it's just to
> prove my understanding of where the bottlenecks are was about correct.
>
> My real point is that apparently bmcweb is (in some cases) requesting
> way too much data in way too many calls, using only a tiny fraction of
> the obtained values in the end. That's why I made that lengthy
> description of how data for a single sensor is obtained. Caching can
> hide this to a degree, but shouldn't the root cause be fixed as well?

Yes, we should come at it from both angles, because a cache will still
have to invalidate quite a bit, and nobody likes a bimodal
distribution of response times.  The next thing on my personal list is
to get a new version of GetSubtree added to the mapper, that accepts a
list of optional interfaces as well as required.  I talked about this
a while back on discord.  This might clean up a couple of the extra
calls in the sensor code, but the primary target was inventory
initially.

In a perfect world where software is easy and architectures are
beautiful, ideally I'd like to see most redfish calls go:
Call mapper once with a list of interfaces;  Find all connections and
objects that implement this interface.
Loop over connections, calling GetManagedObjects on each to read in
the data and write directly to redfish tree.
Send response

> Does bmcweb really _need_ to do all the calls mentioned? I think the
> fact it performs two identical D-Bus calls in a row gives a clear "no"
> answer.

You are almost certainly right, two identical calls is wasteful, and
we should clean that up if we can.  I'm certain there's probably
several speedups to be gained by someone understanding the sensor code
and optimizing it a little.

> After reading my outline of the process can you tell that's
> exactly the way the OpenBMC D-Bus API is designed to be used?

I'm not sure I quite follow this question.  The sensor code you're
looking at evolved significantly over time into the behemoth you see
today.  It quite likely has several anti-patterns and duplicated calls
that can be consolidated, but that didn't really show up in the
individual diffs as features were added.  I'm really happy someone has
gone through the full flow.  Ideally we can start cleaning up the
obvious stuff (duplicated calls, ect) in some patchsets.

>
> --
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
> mailto:fercerpav@gmail.com
