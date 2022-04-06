Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08F4F5093
	for <lists+openbmc@lfdr.de>; Wed,  6 Apr 2022 04:22:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KY7Zk5pzjz3bZZ
	for <lists+openbmc@lfdr.de>; Wed,  6 Apr 2022 12:22:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=AuAWdC6B;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j563V3ib;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=AuAWdC6B; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=j563V3ib; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KY7ZC2R1mz3bdB
 for <openbmc@lists.ozlabs.org>; Wed,  6 Apr 2022 12:22:10 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A0DE75C01B5;
 Tue,  5 Apr 2022 22:22:06 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 05 Apr 2022 22:22:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=VEcI7mok92JlAFDBBPMq0l/cJTlWWCsw7hAR/4
 aYdlY=; b=AuAWdC6BxYQ6+tq8QOjV6qUvfULdIXO+tmKiTLRTtFLV87t0bqZlfu
 uBzehOzWfhFx4+hIJWFTlUevNGuWAZFf3v+0B8kRu3TjyQZ8pMztpC7ZaH4ZHnH5
 o4ooVKQs7uSDwQnsxLH1fVKGM4t9hGvLjAOEzWzZWZE5jZAhyfcusztB7FeRAZtH
 1j1/6jOtMKGXZv8Z26Dt+pzr0ZVR3BC8c79LkDojgMX/OIibTsL5Fd8JMbGg8uTc
 4oKTHHgHXF+0jGoi5fm/UfY880mhLOVGDbb0QU1poer/g4Jy0wi7GswLx8ukLiZp
 Ro8ArcC58uYUhj2OhBoBqLi8w04pU0tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VEcI7mok92JlAFDBB
 PMq0l/cJTlWWCsw7hAR/4aYdlY=; b=j563V3ibdLQGIg2ffLYvrnbHrXriOR6FA
 3j1ccVqfwcZW9EkBp+4O8nASpBcSlFiqPg2ZC5yo4tYtmlgwhDM+OsbAJ9xrLVXy
 IVlpM119OlYwH/oFo42aI6b74j+tcCsipXF5zlKOLhuwEU/30yo3YnaVSTYIeK2F
 C/O6vj5W/h4YM8vK/cbowdubHO/QEbJ4IUXLUR+dpXHLWPOHn0czlDrfqXQ/MYv7
 W0yCZOV0lRrfxTiCZgy7vo2yA+WH2vJmeEZd3r7MC5eCHryN0G5RFF9l4GA9zZXU
 TFDZY0zepCBsDlMtb3d2l3AueMYc21QXxFGtSSv5r2h0BSZ60k/ZA==
X-ME-Sender: <xms:TvlMYiUo1Prgr5eIAbMF8i7SWIR_jdGAj7bXH4EFZ5NPMsiV-EdN1A>
 <xme:TvlMYulxeMimp13p3exs3wodQmZM010nCrYeK3loFpFhvDTVbB5aQZpdfs42lQfzC
 2EPtKhV8_QVDkfN8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejhedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuedtieehgfeuheejfefhffetjeffvdefuddvvefhgfeuheetieduleej
 gfeftdejnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgpdhgihhthhhusg
 drtghomhdpkhgvrhhnvghlrdhorhhgpdhgihhtqdhstghmrdgtohhmpdgtohhnthhrihgs
 uhhtihhnghdrmhgupdihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdr
 rghu
X-ME-Proxy: <xmx:TvlMYmYuzJndb_Qy5eUQXVFKBt2zy9RVnzdU_8suiZtil3lsGUk3Bw>
 <xmx:TvlMYpXRimwHv4Nl-NDA7DhuRyIrQsHR3rfdVO81D7WZe9V5l2aFVw>
 <xmx:TvlMYsneBpcERDBWL0otDWz1Y-asMWaZ69h91mm2SIO0eOY9f_ps-g>
 <xmx:TvlMYoua8CY6CEj0fEVheh9BQ1d7Mr20z-O72u08P2dpDV3BNlv1sw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4C93715A005D; Tue,  5 Apr 2022 22:22:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-385-g3a17909f9e-fm-20220404.001-g3a17909f
Mime-Version: 1.0
Message-Id: <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
In-Reply-To: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
Date: Wed, 06 Apr 2022 11:49:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <edtanous@google.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
Content-Type: text/plain
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,

I think what's below largely points to a bit of an identity crisis for
the project, on a couple of fronts. Fundamentally OpenBMC is a distro
(or as Yocto likes to point out, a meta-distro), and we can:

1. Identify as a traditional OSS distro: An integration of otherwise
   independent applications

2. Identify as an appliance distro: The distro and the
   applications are a monolith

You're proposing 2, while I think there exists some tension towards 1.

With the amount of custom userspace we've always kinda sat in-between.
I'd like to see libraries and applications that have use cases outside
of OpenBMC be accessible to people with those external use cases,
without being burdened by understanding the rest of the OpenBMC context.
I have a concern that by integrating things in the way you're proposing
it will lead to more inertia there (e.g. for implementations of
standards MCTP or PLDM (libmctp and libpldm)).

On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:
> The OpenBMC development process as it stands is difficult for people
> new to the project to understand, which severely limits our ability to
> onboard new maintainers, developers, and groups which would otherwise
> contribute major features to upstream, but don't have the technical
> expertise to do so.  This initiative, much like others before it[1] is
> attempting to reduce the toil and OpenBMC-specific processes of
> passing changes amongst the community, and move things to being more
> like other projects that have largely solved this problem already.

Can you be more specific about which projects here? Do you have links 
to examples?

>
> To that end, I'd like to propose a change to the way we structure our
> repositories within the project: specifically, putting (almost) all of
> the Linux Foundation OpenBMC owned code into a single repo that we can
> version as a single entity, rather than spreading out amongst many
> repos.  In practice, this would have some significant advantages:
>
> - The tree would be easily shareable amongst the various people
> working on OpenBMC, without having to rely on a single-source Gerrit
> instance.  Git is designed to be distributed, but if our recipe files
> point at other repositories, it largely defeats a lot of this
> capability.  Today, if you want to share a tree that has a change in
> it, you have to fork the main tree, then fork every single subproject
> you've made modifications to, then update the main tree to point to
> your forks. 

This isn't true, as you can add patches in the OpenBMC tree.

CI prevents these from being submitted, as it should, but there's nothing to
stop anyone using the `devtool modify ...` / `devtool finish ...` and
committing the result as a workflow to exchange state (I do this)?

Is the issue instead with devtool? Is it bad? Is the learning curve too steep?
It is at least the Yocto workflow.

> This gets very onerous over time, especially for simple
> commits.  Having maintained several different companies forks
> personally, and spoken to many others having problems with the same,
> adding major features are difficult to test and rebase because of
> this.  Moving the code to a single tree makes a lot of the toil of
> tagging and modifying local trees a lot more manageable, as a series
> of well-documented git commands (generally git rebase[2]).  It also
> increases the likelihood that someone pulls down the fork to test it
> if it's highly likely that they can apply it to their own tree in a
> single command.

Again, this is moot if the patches are applied in-tree.

>
> - There would be a reduction in reviews.  Today, anytime a person
> wants to make a change that would involve any part of the tree,
> there's at least 2 code reviews, one for the commit, and one for the
> recipe bump.  Compared to a single tree, this at least doubles the
> number of reviews we need to process.

Is there more work? Yes.

Is it always double? No. Is it sometimes double? Yes.

Often bumps batch multiple application commits. I think this paragraph 
overstates the problem somewhat, but what it does get right is 
identifying that *some* overhead exists.

>  For changes that want to make
> any change to a few subsystems, as is the case when developing a
> feature, they require 2 X <number of project changes> reviews, all of
> which need to be synchronized.

Same issue as above here.

> There is a well documented problem
> where we have no official way to synchronize merging of changes to
> userspace applications within a bump without manual human
> intervention.  This would largely render that problem moot.

Right, this can be hard to handle.

It can be mitigated by versioning interfaces (which the D-Bus spec 
calls out[6][7] but OpenBMC fails to do (?)) and supporting multiple 
interfaces for the transition period.

That said, that's also more work, and so needs to be considered in the 
set of trade-offs.

[6] https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-interface
[7] https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus

>
> - It would allow most developers to not need to understand Yocto at
> all to do their day to day work on existing applications.  No more
> "devtool modify", and related SRCREV bumps.  This will help most of
> the new developers on the project with a lower mental load, which will
> mean people are able to ramp up faster..

Okay. So devtool is seen as an issue.

Can we improve its visibility and any education around it? Or is it a 
lost cause? If so, why?

Separately, I'm concerned this is an attempt to shield people from
skills that help them work with upstream Yocto. OpenBMC feels like it's
a bit of an on-ramp for open-source contributions for people who have
worked in what was previously quite a proprietary environment. We tried
shielding people in the past wrt kernel contributions, and that failed
pretty spectacularly. We (at least Joel and I) now encourage people to
work with upstream directly *and support them in the process of doing
that* rather than trying to mitigate some of the difficulties with
working upstream by avoiding them.

>
> - It would give an opportunity for individuals and companies to "own"
> well-supported public forks (ie Redhat) of the codebase, which would
> increase participation in the project overall.  This already happens
> quite a bit, but in practice, the forks that do it squash history,
> making it nearly impossible to get their changes upstreamed from an
> outside entity.

Not sure this is something we want to encourage, even if it happens in 
practice.

>
> - It would centralize the bug databases.  Today, bugs filed against
> sub projects tend to not get answered. 

Do you have some numbers handy?

> Having all the bugs in
> openbmc/openbmc would help in the future to avoid duplicating bugs
> across projects.

Has this actually been a problem?

>
> - Would increase the likelihood that someone contributes a patch,
> especially a patch written by someone else.  If contributing a patch
> was just a matter of cherry-picking a tree of commits and submitting
> it to gerrit, it's a lot more likely that people would do it.

It sounds plausible, but again, some evidence for this would be helpful.

Why is this easier than submitting the patches to the application repo?

> My proposed version of this tree is pushed to a github fork here, and
> is based on the tree from a few weeks ago:
> https://github.com/edtanous/openbmc
>
> It implements all the above for the main branch.  This tree is based
> on the output of the automated tooling, and in the case where this
> proposal is accepted, the tooling would be re-run to capture the state
> of the tree at the point where we chose to make this change.
>
> The tool I wrote to generate this tree is also published, if you're
> interested in how this tree was built, and is quite interesting in its
> use of git export/import [5], but functionally, I would not expect
> that tooling to survive after this transition is made.

I think it would be good to capture the script in openbmc-tools if we 
choose to go ahead with this, mainly as a record of how we achieved it.

Andrew

>
> [1] 
> https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/
> [2] https://git-scm.com/docs/git-rebase
> [3] 
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
> [4] 
> https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc
> [5] https://github.com/edtanous/obmc-repo-combine/blob/main/combine
