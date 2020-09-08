Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D7260A81
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 08:02:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blvgb1KsvzDqQb
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 16:02:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=E1i8A7QI; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlvfH0T08zDqMw
 for <openbmc@lists.ozlabs.org>; Tue,  8 Sep 2020 16:01:07 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id q3so10559891ybp.7
 for <openbmc@lists.ozlabs.org>; Mon, 07 Sep 2020 23:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kM42Z6PyzMLCaKwBPGySli/yPMryKwGLMsidsbv4rdE=;
 b=E1i8A7QI766kt9+eKqYnJ9s9Hc+QhZJv0dQP4+F/qTcm54dGkUQCP87Fga77zXILlj
 FHASvsWG1bTuF391uz+5QhNtvPRgoz1fXlbuVe/bNO9pXS/cVePcqgi8z2KkDb1DFEA+
 Zlehi0HXYHiJOPs5Ks7o9kp9t/1lb3WYT9/pmPW/vBuYZ6ezs+sUv2RBqhXPX8VDOCWs
 8x5N3EZsL24c+nBEiBPPGCkwWFYGa5CP8Ab/8hqEFhYWEgk6nymi6H+k9bWvviV6fYdj
 aIQNVuxYBHaM/+jGn6tHqxQtfz9TlkBFBfylLvjdPkDgmyTGyBtCbuBms+6MiwFEO3Pp
 HZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kM42Z6PyzMLCaKwBPGySli/yPMryKwGLMsidsbv4rdE=;
 b=h8/aJ6IxH3aLJoCJ6wSWTP+QibHVS4TdIpRmJ+wQWKvi/22Nk0Q34eeU0wOsr7bgKx
 u4Z16TYkMho9R0W5Bbyq067pvHDi2x6hFUELQHDv/2iyGJG4ociSTh9e0Y2sSXJV/+79
 UFunSYY6t5PpxsIdi3VIcrD/2deHm8PZ2z8v/BAEmQzXjZ6N9UVz5AAo2i/qq4EKvXlX
 ERK9wBVd72B9NR83nyrY/XSWPnjAmT/sFNPVeprfPTFsNnyz9jKGCg4MHu5KvAYRhXpq
 /Gmpx+BEn9ac/AT1AOsEKi2RudqoBvExiAlYG73eM2SDp47n2PldSki/fHrOMA5Wz/1j
 KwZA==
X-Gm-Message-State: AOAM531m24NCROJCK74U1czP0HDkKMe1GT2EvBu0tOvgTdq0r9jMydld
 qy9AUEOpYJoQ+NraDTAi7kdv6N84bCXDvXEPGxB9sQ==
X-Google-Smtp-Source: ABdhPJyAS1dIL7yepZccH6NxPNdNx8AYtSdzc0ZjelHbqVRKSuKrulPEvoT5Xw6up5SR06SUVtPSX9QWYsioUUD2PJs=
X-Received: by 2002:a25:2d69:: with SMTP id s41mr31813476ybe.417.1599544863746; 
 Mon, 07 Sep 2020 23:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <b114645e-1736-db35-5e35-027b60b02a44@linux.intel.com>
In-Reply-To: <b114645e-1736-db35-5e35-027b60b02a44@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 7 Sep 2020 23:00:52 -0700
Message-ID: <CACWQX839okH5F=BcYcYHV91SjkFLChP_sMPpyzZCr4_CNjsBig@mail.gmail.com>
Subject: Re: openbmc\telemetry - upstreaming process boost
To: =?UTF-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 7, 2020 at 3:03 AM Adrian Ambro=C5=BCewicz
<adrian.ambrozewicz@linux.intel.com> wrote:
>
> Hi all,
>
> For those who don't know - we are currently in the process of
> upstreaming first iteration of DMTF TelemetryService D-Bus back-end at
> https://gerrit.openbmc-project.xyz/c/openbmc/telemetry/+/34273 . After 2
> months of review and almost 300 comments and discussions, together with
> team we've decided to propose slight change in the process to speed up
> development time.

Can you estimate how long this was in development before being
upstreamed?  There's a lot of code here;  A decent rule of thumb is
that it takes as long (calendar time) to upstream as it took to build.

>
> =3D=3D The past =3D=3D
> Let me admit to several faults and mistakes first, so we could all know
> our lessons learned:
> - patch is too big for the review, even as an initial commit.

+1

> Unfortunately it was not our decisions, but unpleasant side effect of
> legal processes;

There's a number of developers from your company that somehow are able
to upstream code in pieces, using small, logical commits, even for
large projects.  You might look to them for how they were able to
bypass the "legal processes" in those cases.

> - we didn't expect amount of effort nor prepare properly for
> simultaneous upstreaming and developing the same code;
> - because of above - we have two separate implementations to maintain,
> test and fix, which are diverging over time;
> - part of discussions in upstream code aim to rework parts of
> implementation, which in some cases doesn't apply for downstream (more
> ahead) implementation, making both ours and reviewers efforts .

With respect to the fine work you've done, the project cannot be in
charge of your downstream process.  With that said, I took a look at
the Intel downstream (in Intel-BMC) and I'm not seeing telemetry
service there, nor has the repo been pushed to the org.  What
"downstream" are you referring to?  From what it appears, it doesn't
even look like it's enabled there.

>
> In short - we've screwed up, ask for community understanding and
> forgiveness, and the most importantly - we ask for help.
>
> =3D=3D The present =3D=3D
> Current situation and arguments for change are the following:
> - we have big chunk of code in the review with many discussions already
> resolved. It looks like the most crucial issues were resolved, leaving
> mostly coding style or micro-optimizations.

I fundamentally disagree with this statement.  The code as a whole
still doesn't follow coding standard #1 "Code should be clear and
concise." and breaks a number of other coding standards as well.  It
should be noted, I'm not talking about variable naming or something
small here.  I have legitimate concerns that this code will be
difficult to extend in the future.

> - we're working on new features (i estimate that around 50% of planned
> scope is completed).

Your upstreaming process would be accelerated if you focused on
cleaning up the existing code to get it into mergeable shape, THEN
worked on new features.

> Due to limited resources we cannot afford to keep
> maintaining two versions of the code and we want to switch to
> upstream-only as soon as possible.
> - upstream code is becoming more and more behind our downstream 'top',
> and the incoming task to sync them will be harder the longer we wait.

See above.  As you push forward, you solidify the constructs you're
hoping to get merged, and you make your problem harder as people
review it.  I would also add, at present, you haven't even opened a
review for bitbake file to build this as part of the project, so the
idea that enough people have reviewed it such that it's ready for
merge is a little odd, considering there's no way for people to
actually try it.

It should be noted, there's so much code there that I haven't even
made it through the full code review of all the files.  Looking at the
review comments, it doesn't look like anyone else has either.

>
> =3D=3D The future =3D=3D

Before we start this section, I'd like to point out, this daemon is
something I'm hoping to be able to use in the future.  As-written, its
complexity would prevent me from doing so, and would likely lead to me
either rewriting it from scratch, or significantly refactoring it
before I used it.  This is why I'm reviewing it now, so we can ensure
its utility in the future.

> So.. Having said all that we would like to propose a solution which will
> not only allow to continue the usual review and improvement process,
> while enabling working on next iterations and making life easier for
> both reviewers and maintainers. Seems like a good trade, right?:) I
> would like to propose a plan of resolving that situations and seek for
> your advice and acceptance.

What does "acceptance" mean to you?  That we allow it on master?  That
we turn it on by default?  What would the post-merge review process
look like?  Would you commit to an SLA for fixes?

>
> Plan is to do the following:
> 1) Merge current big-bang review as-is, opening GitHub issues for all
> existing comments to address them at convenient time.

What does "convenient" mean here?

> 2) Sync downstream implementation with upstream. Split changes in chain
> of reviews to separate them as much as possible.

I'm not really following why you're asking for permission to do this
part.  You could've been doing this all along.  Gerrit reviews chain
nicely.  We've had significant efforts in the past (like the
phosphor-webui) that opened LOTS of changesets all dependent on one
another.  While it was a lot of code, it eventually got reworked and
merged in, and we learned a lot of valuable things in the process.

> 3) Work on the chain of reviews and addressing aforementioned issues
> until in usual manner.
> 4) As soon as code is more stable - work on new features.
>
> As you can see - only 1st step of the plan is diverging from usual
> Gerrit flow.

Yet... It's the arguably most important step.

>
> We really hope for your understanding and count on acceptance of such
> workflow. Let us know what you think.
>

Overall, I really don't like the above idea, disagree that the
projects process is broken here, and disagree that we should bypass
it.  I also don't like the lack of review the code has gotten, despite
the interest on the earlier threads in the past.  So far as I can
tell, only Krzysztof and myself have commented on the "inital commit"
review, I haven't even made it all the way through the code.  I'm
assuming Krzysztof was part of the internal development based on some
of his responses, and how quickly he came up to speed on it  I see no
reviews from the existing Intel maintainers, nor do I see it checked
into the public facing fork, which makes me wonder about the level of
testing and review this has gotten internally (although I have no
actual knowledge of that, so maybe it did).  The testing statements in
the commit message also leave a lot to be desired, and don't come
close to covering the functionality this daemon produces.

On the whole, I really think that this resistance you're feeling is
the project process working, and the trouble you're seeing with
merging is healthy.  As the project's stability and maintainability
goals get rolled back into your process, you and your team will get
more efficient at getting stuff merged.  With that end goal in mind, I
think the above reviews need to continue, with no special allowances.
