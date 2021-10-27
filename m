Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF3043CEA8
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 18:23:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfYrs35hSz2ymv
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 03:23:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=K8vr1rW9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=K8vr1rW9; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfYrP0bWRz2yHH
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 03:22:42 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 192so1596963wme.3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iuugYmCk4u0giw3apu1YOi8zrwkVrZ9aP4Jt2giYiQA=;
 b=K8vr1rW9oBVODVXNHVQo91b1iER9SmHZlwoSSvXcdPyxhszLbO1nhNCQGQGV38PrK8
 aTT857UWK+LRkkIrMYEG5ZG9FeYZt+cbCjnz68pRd1U5m+jGaq2LAP/Ix0jXV2UnhbV1
 3t2tBI2NeFSDsnuKJEAaJB8jJ88wz6zMJb8AW8EgccTJsVgdfrrQ+sYU4R5lZ5htYdb/
 ZZT9HKpBva+Q2VOpVqCX96i0kFFafYPQGp88xFTMeFULT0l1oi1hOq5T0KQcJpWpnp5S
 2BIS7bcmOl4WdGOlH8YvhW4namH+v4W79rl14EKR3+dtr2d09GpoATv6+08Iq6dgbquk
 WLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iuugYmCk4u0giw3apu1YOi8zrwkVrZ9aP4Jt2giYiQA=;
 b=dnVJ+sMGt4CUG+K3zGvvI3OXMUXRn8+TK3rnVn2qOpW17xne8rCaTL5OkvceAzIQ4T
 4JcLoVEnVmGE3oJqEgNrp5NEwLO8xONIKE3ucGC1p3SZW6LB+FIac2KmroPI3Oo+54zI
 Ejdm4m05Yx4U4d3i/TAmM4pkSJzi4vcWTwLmi3EYJwNNPXGlmVfmreRiHYaB0QAf8jcw
 sqLd0O9b4X9IkDRy/5A0D2JLwnlfnYR8oYqBcuQEPs3BFpoBsvfnMvo5vHHvwKgx3lh4
 Jhc5F5fdI5Q87xeQ4rqsJVGzaxMsdddO5Vze1GCtNzhcDCd65uFkWddiFxFVfKDiC9JH
 91KQ==
X-Gm-Message-State: AOAM531Xt81BJc7gj8Y5xVpjVeYJMFTI/1+FoKlAMGjzKwMuMN24ufTp
 1XKvSHzAsD91Y1AvTKXM9uoz06/WplMFOJO9sI1A4Q3YJXfabg==
X-Google-Smtp-Source: ABdhPJwUn7O333xVPRzf3m4GTdk58ZAkNPC8WUqPY+FXTMVRB1oXnjZyehSDkRRZnrUk2xosPijQPOTCWMxgku4s0pM=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr6824495wmc.117.1635351759505; 
 Wed, 27 Oct 2021 09:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211027043751.GB1786414@mauery.jf.intel.com>
In-Reply-To: <20211027043751.GB1786414@mauery.jf.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 27 Oct 2021 09:22:28 -0700
Message-ID: <CAH2-KxDa=vPjOxpq9fnC85azUTmdre1TaxEtb8m7isaTU0Fhpw@mail.gmail.com>
Subject: Re: bmcweb non-standard OEM integration
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
Cc: Development list for OpenBMC <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 26, 2021 at 9:37 PM Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> I can't imagine that Intel is the only company on this project that has
> a set of patches against bmcweb. Some of these are for features that
> have not yet been released. Some of these are for OEM things that don't
> fit any of the Redfish-OEM schemas. Some are for features that are
> long-standing upstream reviews that have not yet been merged for
> whatever reason.
>
> We want to move away from patches.


As an attempt to make this more concrete, I tried to look at Intel-BMC
to figure out what you're talking about.  The only OEM schema I see is
0001-Firmware-update-configuration-changes.patch, which adds support
for defaulting the setup on a firmware update.  DMTF has been
discussing this idea of defaulting a setup very recently (I think we
talked about it last week), so that will hopefully be in the standard
soon, and if you're interested in particular properties of it, you
might want to participate there.

That's the only OEM patch I see;  Is there more?

> We want to be able to share our
> changes with the community. Right now, there is not a way for this sort
> of OEM changes getting into bmcweb.

I'm not sure why you think this, but the current policy is definitely
not "no way".  Have you read the doc on this?
https://github.com/openbmc/bmcweb/blob/master/OEM_SCHEMAS.md

To paraphrase, the above doesn't say "no OEM schemas in
upstream".  It says "OEM schema features need to be discussed in the
relevant communities".  This policy as written was attempting to be
similar to our policy on systemd, linux, ect.

> I know not everyone is a huge fan of
> the way that the ipmi-providers code works, but it does work. Companies
> need to be able to have those changes that allow them to differentiate
> from the common phosphor core. I am proposing that we make changes to
> bmcweb that would allow this sort of OEM customization.

Intentionally avoiding the comparison with ipmi-oem for a moment,
let's see if we can agree on some things:
1. We should implement Redfish schemas (be they OEM or not) to the
standard, with the same level of quality as the standard.
2. The OpenBMC community has a track record of writing incorrect
schemas, then abandoning them (there are positive examples as well).
3. We should avoid duplicating code between schemas in as many cases
as possible.

Now jumping into the comparison, I would posit that Redfish is
different from IPMI:
1. There is a very active standards body, with new spec changes coming
every few months.  IPMI has no such standards body at this point, so
even if you wanted to get a change in, there's no path forward.
2. Redfish has a configurable privilege system, and its interfaces are
reflectable.  This significantly complicates any runtime-dynamic
plugin solution, given that previously static resources would now have
to be generated at startup, which would be quite a bit of code.

None of this is to say "no OEM schemas", more to point out that in
terms of engineering and code, they're not very similar problem
spaces.

>
> I don't have a full proposal yet. But I wanted to get this concept out
> in the open before diving headlong into a metaphorical brick wall. While
> I compared what I would like to the ipmi-providers mechanism, there are
> other ways to do this that can work around many of the objections that
> have been raised to that architecture.
>

I'm not against having OEM schemas, but I do think we need some
guardrails to keep them useful and maintained in the long run, and
there's a good bit of architecture work to make them possible.

Some things to consider in your proposal:
1. Redfish requires a PrivilegeRegistry.  The moment you implement an
OEM resource, you now need an OEM privilege registry to manage the
privileges for it.  Up until my patch recently, bmcweb had a hardcoded
privilege map, which didn't allow for modification on a per-system
basis.  After a few patches, we're at least generating our privilege
tables now, but this would need to be significantly improved to handle
OEM schemas privileges properly.
2. Redfish requires schema files.  In general for company-specific OEM
registries, it's not desirable to have another company's OEM schemas
show up on your systems (and for all I know, might be a copyright
violation, but I'm not a lawyer).  This requires some mechanism to
switch features on and off, which bmcweb already has, in the form of
the meson options.  If we're going to allow OEM options in a lot more
places, we'll need an engineering solution for this that scales
better.
3. Redfish schemas are VERY difficult to write, and the current batch
of maintainers (myself especially) is not up to the task of reviewing
schema file submissions at this time.  I'm personally working to get
better, but at this point every single OEM schema that we've accepted
has bugs.  Side note, I tried to generate type-safe client bindings
for a project recently, and I ended up having to comment out all the
OEM schemas, given how broken they are, so this has real-world effects
on clients usage.
3. As it's in one piece of code, bmcweb can make changes to internal
details, clean up code, and make things more usable over time by
simplifying and reducing code.  Some examples of this include
readJson, boost-dbus to sdbusplus conversion, variable naming,
clang-tidy and many more.  Any change to how we inject OEM handlers
should understand that and make sure it's still possible in the
future.
4. Functionally, code shouldn't be duplicated.  Please plan on your
design doc covering how we're going to deal with that functionally
when others want to reuse OEM code.
5. In your proposal, please plan to propose a set of guidelines for
determining which things should be upstreamed to DMTF, which things
should remain as OpenBMC OEM, and which should remain company specific
OEM.  There are definitely examples that should be each of the three,
but the vast majority of things that I get asked about belong in DMTF
upstream, and I struggle as a maintainer when the DMTF community tells
me they want more participation, but OpenBMC OEM schemas immediately
bifurcate the conversation to a much smaller audience.  IMO in many
cases, OEM resources are used as a trapdoor to avoid having to
upstream things, which is not a pattern we should promote.
6. Given that we've had problems in the webui with hardcoding
resources, please plan on coming up with similar client usage
guidelines to avoid similar problems as we've had with uid handling in
our clients, as well as deprecation policies when things do get
supported in upstream.


In short, I don't see a "metaphorical brick wall", but a gentle set of
rolling hills to climb.  If you can point to something specifically
you'd like to see made OEM that we can use as an example for this kind
of thing to work through the engineering and process changes, please
do.

> --Vernon
