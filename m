Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 815DE3E1BD0
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 20:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgdCF3JPqz3cnL
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 04:57:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kA+p2zUB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kA+p2zUB; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgdBz4D8jz300S
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 04:57:15 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id h11so8388730ljo.12
 for <openbmc@lists.ozlabs.org>; Thu, 05 Aug 2021 11:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8LqgJof58HVSUqAeHpEaUL+rlBvLmB6wAFyN5yZUP3M=;
 b=kA+p2zUB+faUcZH2XMPj3gqRA5lw1kcgsmw/DS3RGlpi6eylkvQzJvByxhye2j0XSj
 29vv6BWkTuO4SiNCelVb0TIFWF6BoP1Q256Uc4W8RV+jN73GMlxV2C+dQ3mJ2dFnVJCA
 pBwjGPXxCC/rzBp2eb8nDqu+mRTdRkK0kz0bmGWTv3lyVXXu+NVBSx9KpsEp3cYHj05k
 FD9OCATERknsUeCRdYwwyzqXv29tauPkd9TmPj3haAwmxEI+MjFQCQLxXlFo3mFSnmMs
 eeE3rkxlATfX0NBrSEKFJI+q9N7L1XCzpgTT68o2rWZEjcMaQOpmYlhIKJcO5zhEXcPU
 PWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8LqgJof58HVSUqAeHpEaUL+rlBvLmB6wAFyN5yZUP3M=;
 b=dnWhz2ohCpNFeJiLN0TzOKhM4bJbRbvNm+uYvvIMcyDgQA2HxfXXgXYd7huz8m0ZLc
 0kID/4WnBYsZPVurzh5Wqm48pfR2CfJllprzTRbcRag3eKS/PIu9hj1iBFmX0qVW3uTm
 mZYYtmPQ906iMN3FzCe9rU6PJK4k1rpHvfIAWnbpjCwqyxReYAC/2cW1K7MQJAG0+kSn
 +c7AgiqMX/siJEdaQ05xUVEIwWAksJory/0WRR5rv7sfMVLh6oo8lhpfIV/ptpeBvPu3
 CIjz+lOGmUt4EvdyzEps7pCYay8IoDjLI4HX5OLbZW9zhuIvhRYM3HoewAsdbJ8Q/d5m
 KVbw==
X-Gm-Message-State: AOAM532ie5pj+wMNXpUuo31iqu6zIWi6w+D2peknIC2OwxUqLDi0b7vr
 bGJihM/7NzvLabdjVGdu/m0=
X-Google-Smtp-Source: ABdhPJyFwyNEyzvuNlh0qSiNA5a56iOrVymdED7PKlTSub7R9tDNFGgRBZw/UdvGkcC+VP6GUfFnkQ==
X-Received: by 2002:a05:651c:515:: with SMTP id
 o21mr4060941ljp.125.1628189830829; 
 Thu, 05 Aug 2021 11:57:10 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id m2sm594280lfo.221.2021.08.05.11.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 11:57:10 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 175Iv6j3013303; Thu, 5 Aug 2021 21:57:07 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 175Iv4Gq013301;
 Thu, 5 Aug 2021 21:57:04 +0300
Date: Thu, 5 Aug 2021 21:57:04 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Redfish requests for dbus-sensors data are needlessly slow -
 analysis
Message-ID: <20210805185704.GF875@home.paul.comp>
References: <20210729094640.GT875@home.paul.comp>
 <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
 <20210729152919.GX875@home.paul.comp>
 <CACWQX809PpP5MtikAYUm=tZhBBVZcJ78XdbHB6Ex=Y9z6EOu4g@mail.gmail.com>
 <20210804104059.GV875@home.paul.comp>
 <CAH2-KxD7vEhM7u0SiLV2AKm+fgOwM37xMxaNkKiqxnXJL8Oi5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2-KxD7vEhM7u0SiLV2AKm+fgOwM37xMxaNkKiqxnXJL8Oi5A@mail.gmail.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Timofei Nikitin <t.nikitin@gagar-in.com>,
 Jason Bills <jason.m.bills@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Aug 04, 2021 at 11:51:01AM -0700, Ed Tanous wrote:
> One thing to keep in mind is if you use the work in progress mode
> within gerrit, non-admins can't see the change.  Generally I just
> either mark them WIP in a topic, or put "work in progress" in the
> commit message somewhere.

Noted, thank you.

> Because the mapper interfaces are non-ideal for building Redfish
> resources, and we have to work around them a lot.

Still mapper is aware of all the devices appearing and disappearing
from the bus, and should be emitting signals accordingly. In what case
invalidating all of the (hypothetical) bmcweb
connections/mapping/associations cache on receiving such a signal
would not be enough?

> > PSUSensor backend is caching hwmon values so it's reasonably fast.
> 
> ..... This is the way it _should_ be.  Unfortunately PSUsensor has
> some really bad behaviors in terms of blocking dbus transactions while
> pmbus reads are happening.  There's been a couple proposed fixes to
> this, but nothing has landed yet.

Haven't noticed that in my tests. I had an impression that all reading
from hwmon files is performed in fully async mode, Boost::ASIO not
blocking on anything and letting the other handlers run.

> > > Yes, we should come at it from both angles, because a cache will
> > > still have to invalidate quite a bit, and nobody likes a bimodal
> > > distribution of response times.
> >
> > This sounds cool but I'm not sure I understand the point. We face
> > caching everywhere, and it's usually multi-layered, so when
> > appropriately benchmarked we often see tri- and more modal
> > distributions. And when not building a hard real-time system the
> > median is much more important than the modality I guess?
> 
> I'm not sure I'd say we have "caching everywhere".  About the only
> thing we really cache today is the mapper, and that only really
> invalidates on startup.  My point is really that if we implement a
> cache in bmcweb, we'll see one response that takes 200ms, then some
> responses will take 4 seconds when the cache isn't valid.

I thought "nobody likes a bimodal distribution of response times"
referred to a general notion, so I thought about all the caching in
computer systems on all the levels (CPU, RAM, disks, Ethernet etc
etc). One particular example of caching we really dislike would be the
one resulting in network bufferbloat, but that's not because of the
modality.

And regarding this specific question, I do not see anything
particularly bad about having to wait for 4 seconds few times a day if
thousands of requests are processed in 200 ms over the course of the
same day. Better than having to wait 2 seconds for each of them every
time.

> > > This might clean up a couple of the extra calls in the
> > > sensor code, but the primary target was inventory initially.
> >
> > I'm still rather puzzled by the relationship between different
> > sensors/entities/inventory/leds/etc. Is there a document describing
> > everything that's currently essential?
> 
> One systems "essential" is another systems "optional".  This is the
> short way of saying, no, I don't think we make any distinction between
> essential and non-essential relationships on dbus.  The best way to
> understand is to go look at the code like you've done.

TBH, looking through the Boost::ASIO async code was painful and most
importantly it often doesn't provide full rationale. I can eventually
understand what is being done, but my ideas about why that is needed
are speculations prone to errors, that's why in the absence of a
design rationale document I was hoping to get answers from the authors
of the code in question.

> > > > Does bmcweb really _need_ to do all the calls mentioned? I think the
> > > > fact it performs two identical D-Bus calls in a row gives a clear "no"
> > > > answer.
> > >
> > > You are almost certainly right, two identical calls is wasteful, and
> > > we should clean that up if we can.  I'm certain there's probably
> > > several speedups to be gained by someone understanding the sensor code
> > > and optimizing it a little.
> >
> > I'm happy I managed to get my point through finally.
> 
> I'm looking forward to the patch.

I wonder what kind of testing would be needed to make sure it doesn't
break all the systems I have no idea about. Those that have
sub-sensors, complex associations and related LEDs, and probably those
that are using phosphor-hwmon and not dbus-sensors...

> > Since I do not understand the role of /inventory/ pathes, and I do not
> > understand how LEDs get involved (apparently we do not have any LEDs
> > like that in our Tioga Pass configuration) and I didn't even try to
> > dig the "power" nodes I'm certainly not in a position to offer a
> > worthy code contribution in this area :( (other than fixing the
> > duplicated call which can trivially be done by passing an extra
> > argument; but that alone isn't fruitful much)
> 
> Reading and understanding the code is probably the best way to become
> "worthy".  It would be great to have even a simple change land on
> master as the result of this discussion that can start to work on your
> concerns.

Thank you for the prompt review for my simple change, I'll be working
on fixing the issues you raised.

> > I very much hoped for more involvement from the bmcweb maintainers, as
> > solving this issue properly, in a way that doesn't break any usecases
> > obviously requires plenty of domain-specific knowledge (domain here
> > being the extensive OpenBMC D-Bus API, specifically the
> > sensors/inventory part of it).
> 
> I'm not following here.... I (a bmcweb maintainer) have given you
> several pretty lengthy replies about things that could be worked on.
> Is there some other involvement you were hoping for that doesn't
> involve the maintainers just writing up and testing the patches?

Yes, and I appreciate it a lot.

What I hoped for is for somebody who has all the knowledge about
bmcweb Redfish implementation and OpenBMC architecture at her or his
fingertips to chime in and say something like: "we need steps M and N
for X and Y reasons, and step K was needed for Z but is redudant by
now, and L should stay for a while until <some> cleanup is merged." Or
"you're barking at the wrong tree, do /this/ and /that/ instead to
monitor the health of your servers."

I can be reading
https://github.com/openbmc/docs/blob/master/architecture/object-mapper.md
and
https://github.com/openbmc/docs/blob/master/architecture/sensor-architecture.md
and
https://github.com/openbmc/docs/blob/master/architecture/LED-architecture.md

for days, and the relevant source code, and experimenting on Tioga
Pass, and digging all your hints, and reading all the conflicting
changes that Gerrit nicely shows for my caching patch, but that won't
ever give me the breadth of the insight into all possible cases
(especially the edge cases) that those who developed and evolved this
architecture have.

Thank you for listening.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
