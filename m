Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA75E4F6403
	for <lists+openbmc@lfdr.de>; Wed,  6 Apr 2022 17:55:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYTcG4WpJz2ym7
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 01:55:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dXSueVqq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=dXSueVqq; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYTbs35PXz2xrc
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2022 01:54:47 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id j12so3904571wrb.5
 for <openbmc@lists.ozlabs.org>; Wed, 06 Apr 2022 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bsd3/W4hGUVAIghmytd9bLjYv6jNG+4knAz0LIF4B3w=;
 b=dXSueVqqMErqYfe45w75F6kqPUdSOt0saH+j/gWpKfLqCeHFoHBdaipvU//h3ymi+W
 N8ESgvcJOzWNQ3qb1TdN10MuRTRthMuqZPvUP2PpUq4YaJxoB4U6mup41K4gIB+C2ars
 SzX+983tt9TfpyTzcCioz1nR2E9KaKl+7IPOjJv66biYvomUElozGRVYfYW5qdQI3owE
 RqUebav/SD0nc7Xs1Lk29bl+zf109n4j6bLHLwBeuMOB0RrURoq9nWEo4d35m9XtGITg
 o+0JQcWcGcXE/xiYr4HiIJfVfaomX6lLKzcIl32v9gZ49FrQTyc5N6v3Q7kDvVXxEfF8
 2r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bsd3/W4hGUVAIghmytd9bLjYv6jNG+4knAz0LIF4B3w=;
 b=Bwr01lWOJxDWVhCXZkDoj+3FLq39fSirMubd1HBeLshqjPQa4M4U5353s11gjduAux
 faBxnBTRD9tI3pAtQo2HlNRX3DGhOOmSWrKvjQmHfOgQ3JqbFWvP4Rpeh8jqVHIWJssN
 EOFnyo+fuv4339GtV5OLZE4J9LuDrpxvhp/N+ziAhFZ6rBiPdvC3eI/Bvsm+1wgvkLE3
 VzO96jTzKn0F6A4EfCdHjp8MlKVFCrU3psKnWeuzv9QtdQw02NggEGUueqPijFKcHjkA
 d20i+Cc/NhK7xsR3/D68bM49P0aCFWzyDcvcGmu+4mwY+MFatrT0e8yGA4kanPCqYexX
 sLfw==
X-Gm-Message-State: AOAM5305zLv2yx9Q4QNg7CMlqvHRZC+Bisbj1z3JWhumYDiaD1LqMg4f
 kRCcWGM7Crx19khFDjLLvYoz7xkVnLNx3dZj+CT8FQ==
X-Google-Smtp-Source: ABdhPJz9c3rXQ4wWRsJsMyjE+iJIXDI58XkTQ0F4XpWTEaNcpcIlZRaZgg6+09bCDxgO7Y63kIIoi8IGUNPa2zqETiU=
X-Received: by 2002:a5d:47a1:0:b0:204:9a7:22cd with SMTP id
 1-20020a5d47a1000000b0020409a722cdmr7283096wrb.186.1649260480799; Wed, 06 Apr
 2022 08:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
In-Reply-To: <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 6 Apr 2022 08:54:28 -0700
Message-ID: <CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: Andrew Jeffery <andrew@aj.id.au>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi Ed,
>
> I think what's below largely points to a bit of an identity crisis for
> the project, on a couple of fronts. Fundamentally OpenBMC is a distro
> (or as Yocto likes to point out, a meta-distro), and we can:
>
> 1. Identify as a traditional OSS distro: An integration of otherwise
>    independent applications
>
> 2. Identify as an appliance distro: The distro and the
>    applications are a monolith
>
> You're proposing 2, while I think there exists some tension towards 1.

I didn't really think of it as a monolith in anything more than the
codebase itself.  Admittedly, having one repository could potentially
lead to lower friction in abusing interfaces, but that should be
pretty doable to safeguard against with some guidelines.  FWIW,
considering that individual OpenBMC applications don't maintain
version numbers, or version to version guarantees would imply that
we're already treating it as a monolith for some portions of the
codebase (not saying this is good or bad).

>
> With the amount of custom userspace we've always kinda sat in-between.
> I'd like to see libraries and applications that have use cases outside
> of OpenBMC be accessible to people with those external use cases,
> without being burdened by understanding the rest of the OpenBMC context.
> I have a concern that by integrating things in the way you're proposing
> it will lead to more inertia there (e.g. for implementations of
> standards MCTP or PLDM (libmctp and libpldm)).


I had assumed that libmctp and libpldm fell into the "intended to be
used outside the project" category and would retain their own
repositories, given that they publish interfaces that are not OpenBMC
specific, but lots of things within the project are openbmc-specific,
including the daemons that attach both of those libraries to dbus.
The only real difference here is that it makes the difference
explicit.

>
> On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:
> > The OpenBMC development process as it stands is difficult for people
> > new to the project to understand, which severely limits our ability to
> > onboard new maintainers, developers, and groups which would otherwise
> > contribute major features to upstream, but don't have the technical
> > expertise to do so.  This initiative, much like others before it[1] is
> > attempting to reduce the toil and OpenBMC-specific processes of
> > passing changes amongst the community, and move things to being more
> > like other projects that have largely solved this problem already.
>
> Can you be more specific about which projects here? Do you have links
> to examples?

Linux is the primary example I think of, which hosts libraries within
it (libbpf, ect) that are meant to be used elsewhere.  u-root, u-bmc
are other examples of firmware that put all of their application
specific code in a single repository.  As a counter example, openwrt
sticks with multiple repositories, but seems to have significantly
fewer repositories in total than we do, despite being a much older
project.

As a side note, one thing I find interesting is that they host staging
branches for contributors/maintainers on their main project page.
That's a different model than I've seen elsewhere.  Unrelated to this
dicussion, but interesting nonetheless.
https://git.openwrt.org/

>
> >
> > To that end, I'd like to propose a change to the way we structure our
> > repositories within the project: specifically, putting (almost) all of
> > the Linux Foundation OpenBMC owned code into a single repo that we can
> > version as a single entity, rather than spreading out amongst many
> > repos.  In practice, this would have some significant advantages:
> >
> > - The tree would be easily shareable amongst the various people
> > working on OpenBMC, without having to rely on a single-source Gerrit
> > instance.  Git is designed to be distributed, but if our recipe files
> > point at other repositories, it largely defeats a lot of this
> > capability.  Today, if you want to share a tree that has a change in
> > it, you have to fork the main tree, then fork every single subproject
> > you've made modifications to, then update the main tree to point to
> > your forks.
>
> This isn't true, as you can add patches in the OpenBMC tree.

As most people that have stacked patches can attest to, managing patch
files in a meta layer over time is very difficult (unless you meant
something else).  Yes, I should not have said "have to", but a number
of the forks that I've seen have ended up resorting to that. Example:
(https://github.com/opencomputeproject/HWMgmt-MegaRAC-OpenEdition/tree/master/openbmc_modules)

>
> CI prevents these from being submitted, as it should, but there's nothing to
> stop anyone using the `devtool modify ...` / `devtool finish ...` and
> committing the result as a workflow to exchange state (I do this)?
>
> Is the issue instead with devtool? Is it bad? Is the learning curve too steep?
> It is at least the Yocto workflow.

devtool provides just one form of friction;  There are also a number
of cases where devtool modify and devtool finish fail in non obvious
ways (usually due to some not-quite-optimal yocto handling in a meta
layer, or patches being distributed across meta layers).  The biggest
key is that it's yet another tool that seasoned firmware developers
have to learn to jump into our codebase.  Each tool adds some friction
compared to if it just didn't exist.  It also adds the "which recipe
do I need to devtool to modify the webui?" type trouble that people
have talked about many times.

>
> > This gets very onerous over time, especially for simple
> > commits.  Having maintained several different companies forks
> > personally, and spoken to many others having problems with the same,
> > adding major features are difficult to test and rebase because of
> > this.  Moving the code to a single tree makes a lot of the toil of
> > tagging and modifying local trees a lot more manageable, as a series
> > of well-documented git commands (generally git rebase[2]).  It also
> > increases the likelihood that someone pulls down the fork to test it
> > if it's highly likely that they can apply it to their own tree in a
> > single command.
>
> Again, this is moot if the patches are applied in-tree.

Meta layer patch files in my experience tend to not layer well, and
require a good amount of maintenance.  They also have problems where
they're not versioned against a git base, so there's no guarantees of
where in the history the patches were forked from, and whether they
apply to your tree, or if they fail, what patches likely caused them
to fail.  Admittedly, tracking them in git isn't perfect either, but
at least it publishes "this is the source base these were based on" to
give some indication.  In practice, the public forks I've seen just
embed the custom meta layer within an openbmc tree to solve this
problem.
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods
https://github.com/HewlettPackard/openbmc


>
> >
> > - There would be a reduction in reviews.  Today, anytime a person
> > wants to make a change that would involve any part of the tree,
> > there's at least 2 code reviews, one for the commit, and one for the
> > recipe bump.  Compared to a single tree, this at least doubles the
> > number of reviews we need to process.
>
> Is there more work? Yes.
>
> Is it always double? No. Is it sometimes double? Yes.
>
> Often bumps batch multiple application commits. I think this paragraph
> overstates the problem somewhat, but what it does get right is
> identifying that *some* overhead exists.

To be clear, I said doubles the number of reviews, not doubles the
work, completely agreed.  The key point here is that there is work
that in this model would now go to essentially zero.

Admittedly, not every commit gets easier, but there are a lot of
commits that would now synchronize better.  Just this morning I had a
case of this in bmcweb, so it happens a lot.  I also think that having
one or a smaller number of reviews would concentrate a lot of the
discussion when we make treewide changes.  (OWNERS files, ect)  When
they get distributed among many reviews, in my experience it tends to
dilute the discussion a bit.
>
> >  For changes that want to make
> > any change to a few subsystems, as is the case when developing a
> > feature, they require 2 X <number of project changes> reviews, all of
> > which need to be synchronized.
>
> Same issue as above here.
>
> > There is a well documented problem
> > where we have no official way to synchronize merging of changes to
> > userspace applications within a bump without manual human
> > intervention.  This would largely render that problem moot.
>
> Right, this can be hard to handle.
>
> It can be mitigated by versioning interfaces (which the D-Bus spec
> calls out[6][7] but OpenBMC fails to do (?)) and supporting multiple
> interfaces for the transition period.
>
> That said, that's also more work, and so needs to be considered in the
> set of trade-offs.

Totally agreed;  Avoiding "more work" is the point of this whole proposal.

>
> [6] https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-interface
> [7] https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus
>
> >
> > - It would allow most developers to not need to understand Yocto at
> > all to do their day to day work on existing applications.  No more
> > "devtool modify", and related SRCREV bumps.  This will help most of
> > the new developers on the project with a lower mental load, which will
> > mean people are able to ramp up faster..
>
> Okay. So devtool is seen as an issue.
>
> Can we improve its visibility and any education around it? Or is it a
> lost cause? If so, why?

Lots of experienced openbmc developers use devtool every day, I'm not
saying it's not useful, it's just one more tool.  "more documentation"
I don't think solves this, given that devtool is already well
documented in the multi-hundred page mega manual;  Between openbmc
docs, yocto docs, and the docs of the projects we pull in, there's
already more documentation than a developer can read when ramping up.
The best kind of documentation is that kind that doesn't need to
exist;  The second best kind is where we can point to very well
used-in-industry and maintained projects (ie git) and rely on their
documentation.

>
> Separately, I'm concerned this is an attempt to shield people from
> skills that help them work with upstream Yocto. OpenBMC feels like it's
> a bit of an on-ramp for open-source contributions for people who have
> worked in what was previously quite a proprietary environment. We tried
> shielding people in the past wrt kernel contributions, and that failed
> pretty spectacularly. We (at least Joel and I) now encourage people to
> work with upstream directly *and support them in the process of doing
> that* rather than trying to mitigate some of the difficulties with
> working upstream by avoiding them.

I'm not quite following the above, can you elaborate a little?  The
kernel, u-boot, and yocto would not be shielded in this model at all.
In fact, they would be less shielded in a way in that the repos look
very different from the "normal" which hopefully means people would
ask questions before immediately trying to modify them and push a
gerrit review.

>
> >
> > - It would give an opportunity for individuals and companies to "own"
> > well-supported public forks (ie Redhat) of the codebase, which would
> > increase participation in the project overall.  This already happens
> > quite a bit, but in practice, the forks that do it squash history,
> > making it nearly impossible to get their changes upstreamed from an
> > outside entity.
>
> Not sure this is something we want to encourage, even if it happens in
> practice.

I think when done properly, it would be a huge help to the project.
My main point is that this isn't something we can stop (companies and
individuals have and will continue to do it anyway), so would we
rather make their changes easier to ingest back to upstream?

>
> >
> > - It would centralize the bug databases.  Today, bugs filed against
> > sub projects tend to not get answered.
>
> Do you have some numbers handy?

I do not.  I can say that anecdotally the "you filed this bug against
the wrong project" happens quite often in the repositories I maintain,
and the lack of reasonable cross project "transfer the bug" semantics
makes this difficult (yes, admins can transfer bugs cross project, but
I'm pretty sure we don't want to call on core maintainers every time
we want to move things around.)  It would be quite helpful to the
project to have less than N bug trackers (might not necessarily be
one) to increase the odds that someone searches for and finds their
bug before filing a duplicate.

>
> > Having all the bugs in
> > openbmc/openbmc would help in the future to avoid duplicating bugs
> > across projects.
>
> Has this actually been a problem?

Duplication?  It happens from time to time.  Not being able to search
for a bug across the project happens a lot, and in our current model,
requires the user to know which component they are filing the bug
against.

>
> >
> > - Would increase the likelihood that someone contributes a patch,
> > especially a patch written by someone else.  If contributing a patch
> > was just a matter of cherry-picking a tree of commits and submitting
> > it to gerrit, it's a lot more likely that people would do it.
>
> It sounds plausible, but again, some evidence for this would be helpful.

The above is pretty subjective, I'm not sure how to collect evidence
aside from taking data after doing it.  Any kind of data you were
specifically looking for?

>
> Why is this easier than submitting the patches to the application repo?

Having one, non subjective place to submit all the userspace code
would mean one setup, one tree, only have to set up gerrit once (not
once per devtool per project).  If you want to manage your workspace
via git branches, even if they contain changes to multiple places,
there's now one place to do that.

>
> > My proposed version of this tree is pushed to a github fork here, and
> > is based on the tree from a few weeks ago:
> > https://github.com/edtanous/openbmc
> >
> > It implements all the above for the main branch.  This tree is based
> > on the output of the automated tooling, and in the case where this
> > proposal is accepted, the tooling would be re-run to capture the state
> > of the tree at the point where we chose to make this change.
> >
> > The tool I wrote to generate this tree is also published, if you're
> > interested in how this tree was built, and is quite interesting in its
> > use of git export/import [5], but functionally, I would not expect
> > that tooling to survive after this transition is made.
>
> I think it would be good to capture the script in openbmc-tools if we
> choose to go ahead with this, mainly as a record of how we achieved it.

ACK.  Seems reasonable.


>
> Andrew
>
> >
> > [1]
> > https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/
> > [2] https://git-scm.com/docs/git-rebase
> > [3]
> > https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
> > [4]
> > https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc
> > [5] https://github.com/edtanous/obmc-repo-combine/blob/main/combine
