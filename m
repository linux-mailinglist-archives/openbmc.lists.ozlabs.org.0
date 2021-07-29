Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45C3DA79D
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 17:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbDwt0MMJz3cRX
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 01:29:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r1r8MxWR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r1r8MxWR; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbDwY14Y1z2yXc
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jul 2021 01:29:31 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id n6so8024943ljp.9
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 08:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DKxZHQ4xt1SYS8tKvlyQod8Qp2Bgi6y5gJozKgKATKM=;
 b=r1r8MxWRyT+ewMTYcjGRK7sJseHJTXwVssbXw3ua4VMC1NzF+vzGP4jSGa4ZGaeA57
 INQ2aaTevzeCrZmnfgB8F0715ItFm4vaKc4MAyc58EnHA6f8gRw8fe1tu/ynRZaAH4mF
 mXq/oNmwurt+XDAual3MKZx0lMR/hB6B6E66NNWQnGs09F/1Ap3rq4EvLQXhrP5QK/ma
 p3gX2Irns2n97yfB0zG62YIBeCp3mxDjxG6KGPV/0pANON8bD2hR0/GnAxYc3MvtI19T
 clB3brbr/PAVSK2z2encZfoA6uJZ8SYbObAkuYtAqXvN/dUtKsfk4h+DEY123NixvPhQ
 lCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DKxZHQ4xt1SYS8tKvlyQod8Qp2Bgi6y5gJozKgKATKM=;
 b=aaZTD1RHzHMZbeKjvMMBZ8Y8Z74SIg4tSEIu/9rVVrntWBiKDlNRkpHSPN4QHsi/rg
 rqhQEWDG4LGwszavciE9zw6DBOUIINx15m3TCh58Iy2HY5MkwmVzpRiRgI6+YR3M24sB
 gJb+ZJYXfKjeMIKQmFI2Is5A1c/dy2eB3Yh/2P0BCop9KvFjv4j9czKRvKq5J2ozxYYw
 Cdp9TLaNKRptJ4sMeA6ts1Cyvi/aP0d+SWLP2e4u0io4Y7xdHf0c158ZeKJ8DjRwpDv7
 LnN1eonn5sS2/xtd/JjutvD692oNLoT8h6C48NL8vV1tOWiZ2wWeE0zl+CS5hYEoyTHO
 qRbA==
X-Gm-Message-State: AOAM530YC9Mfl34B32mEivGjTiT3zhgOjgN8KGHCJDGs50qj0cOsIHaX
 5N0hNb/GIjbfQRG9Ur4xLE0=
X-Google-Smtp-Source: ABdhPJx98RT7X5JGJpSG7VrpLTfBeVeNa6lGj/rK9r6YR/V8GYRSFc8oV2L2Pma29RbiOd49F8wgew==
X-Received: by 2002:a2e:bd81:: with SMTP id o1mr3332108ljq.504.1627572566449; 
 Thu, 29 Jul 2021 08:29:26 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id f14sm177409ljk.42.2021.07.29.08.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 08:29:25 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16TFTMKs014287; Thu, 29 Jul 2021 18:29:23 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16TFTJH9014286;
 Thu, 29 Jul 2021 18:29:19 +0300
Date: Thu, 29 Jul 2021 18:29:19 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Redfish requests for dbus-sensors data are needlessly slow -
 analysis
Message-ID: <20210729152919.GX875@home.paul.comp>
References: <20210729094640.GT875@home.paul.comp>
 <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
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

Thank you for the reply.

On Thu, Jul 29, 2021 at 07:53:38AM -0700, Ed Tanous wrote:
> On Thu, Jul 29, 2021 at 2:46 AM Paul Fertser <fercerpav@gmail.com> wrote:
> > Here follows my naive exploratory patch. It works for the sensors
> > we're interested in (unless they appear after the first Redfish
> > request made to bmcweb as the cache for the expensive D-Bus calls is
> > never invalidated). It doesn't handle complex inventory associations.
> 
> The "unless" is kind of important here.  Sensors can show up or be
> removed at any time, especially on an entity-manager enabled system.

So bmcweb can subscribe to the signals from entity-manager and
invalidate the caches just in case if any EM event registered.

> As a general rule, bmcweb has avoided having a cache at all.  There
> have been several attempts at adding one, but most failed because of
> the same thing you found: cache invalidation is hard.

Even if it's just dropped on any ObjectMapper or EntityManager signal?

> If we're going to implement a cache, I'd really like to see it done
> at a higher level (somewhere in the connection class) and done more
> generically than this is here, which would ensure that all endpoints
> are sped up, not just sensors.  With that said, if this really
> solves the problem and solves it well, I can't very well ignore it.

But is it really a problem? I'm still not sure; probably it's just
that we invented a weird usecase not worth optimising for? Have the
others faced it and do they consider it to be a problem?

> > I would be willing to work on doing the right thing but for that I'm
> > lacking the understanding of the complete picture involved in handling
> > all types of sensors and interfaces, so I'm kindly asking for your
> > help with it.
> >
> > diff --git a/redfish-core/lib/sensors.hpp b/redfish-core/lib/sensors.hpp
> 
> Can you please submit the below to gerrit as a WIP instead.  There's
> much better tooling there for reviewing and testing patches.  I can
> review it more there.

Sure, will do. I didn't mean to offer it as a solution, it's just to
prove my understanding of where the bottlenecks are was about correct.

My real point is that apparently bmcweb is (in some cases) requesting
way too much data in way too many calls, using only a tiny fraction of
the obtained values in the end. That's why I made that lengthy
description of how data for a single sensor is obtained. Caching can
hide this to a degree, but shouldn't the root cause be fixed as well?
Does bmcweb really _need_ to do all the calls mentioned? I think the
fact it performs two identical D-Bus calls in a row gives a clear "no"
answer. After reading my outline of the process can you tell that's
exactly the way the OpenBMC D-Bus API is designed to be used?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
