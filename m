Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBA14F6B7F
	for <lists+openbmc@lfdr.de>; Wed,  6 Apr 2022 22:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYbt92gd7z2yPR
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 06:37:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Xr3KnuoA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42f;
 helo=mail-wr1-x42f.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Xr3KnuoA; dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYbsj3vWdz2yMD
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2022 06:37:11 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id w21so4963829wra.2
 for <openbmc@lists.ozlabs.org>; Wed, 06 Apr 2022 13:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Iv1ooirrlE73Io/L6onQpL3YZX3A5aVfP8JnO5woUw=;
 b=Xr3KnuoAdtxuyIPi4wswqceqIR1UHmhj5pg8RULDu0Ba52f13YxOw35jUO5wwIKhw3
 8UQaW/6+xJN3zf6mTNT2yN9bnvI2g+FgB1WTdnbpfuDT9jNX77Xd9qHnvtWxE0Tza3eF
 SkHpVMy6/g4uSJqJp+xLSVvMObyGKUCUt+aWzjgFjoV9sYimwnfqTBK6mOetct8B1Sx6
 KVeC+uE8qKaHAah8JHy7FWozMQsFg1lZnr3cIFgR19U2S++O/WGDCdmbOGHNyoQaA0KE
 rdfOP8UMnrR8bJpeIkkClD8924eyjVI1FmPDViCWAim2FPxIoA4t+JRQFWtRweWEp3Ur
 9n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Iv1ooirrlE73Io/L6onQpL3YZX3A5aVfP8JnO5woUw=;
 b=FIDiGw/V0LsEUwjIQ8FevGmWoX3IwHI3GGzLPx0v8QClsWHAvHET1eW2am9yDGKryQ
 7NDuhWxpLViL9cNRf+yBLY3oRCtA3lhYekU9fh9XenIWIuzwJhRf+Unsi0rTeZIayTqr
 aMrmam2cDpdKGHax1BS6bS9HESDPWiws3J3encNMXFxFcuZIqE/a/xrJn24F0QiBES62
 dUQbZKoeryDwcmC7aGDQPtJo2p/v2lYdG9YmT1XymYlPhZnck+SnFXthIm8D1VDr1ha+
 dM4jedpLMJThS/dM/E5+zymltfyF1CCpXlJWmigajVhHfSX5qc48HnKEAhRImVcFlYSN
 5nHQ==
X-Gm-Message-State: AOAM5339qcamLkce2o5A7IcGeUo2yGIVqVsS/RY2VRkHCnLsVUk+1OP5
 7DVdiQ/dgKuGCG3rKOpjkQuBWJ9UUJ/PbmFMuoV5ng==
X-Google-Smtp-Source: ABdhPJyP7D7/VhezcKM4ddez8nRtVoLduH6Ne2oXpIPyrGbWh4cTOniCsxf738go674Q16IRYa0DS65ZWGiixQjcALE=
X-Received: by 2002:a05:6000:386:b0:203:f8d8:f70 with SMTP id
 u6-20020a056000038600b00203f8d80f70mr7938879wrf.163.1649277423946; Wed, 06
 Apr 2022 13:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com>
 <Yk3N1EG21r+NRQa5@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Yk3N1EG21r+NRQa5@heinlein.stwcx.org.github.beta.tailscale.net>
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 6 Apr 2022 13:36:26 -0700
Message-ID: <CADKL2t54-0kUXjDdqajHun4ssQ1WO2gYcH8F9QE8Xnbuoz91kg@mail.gmail.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ed Tanous <edtanous@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 6 Apr 2022 at 10:29, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> I'll likely respond to the original post with more thoughts later as
> well...
>
> On Wed, Apr 06, 2022 at 08:54:28AM -0700, Ed Tanous wrote:
> > On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> > >
> > > With the amount of custom userspace we've always kinda sat in-between.
> > > I'd like to see libraries and applications that have use cases outside
> > > of OpenBMC be accessible to people with those external use cases,
> > > without being burdened by understanding the rest of the OpenBMC context.
> > > I have a concern that by integrating things in the way you're proposing
> > > it will lead to more inertia there (e.g. for implementations of
> > > standards MCTP or PLDM (libmctp and libpldm)).
> >
> >
> > I had assumed that libmctp and libpldm fell into the "intended to be
> > used outside the project" category and would retain their own
> > repositories, given that they publish interfaces that are not OpenBMC
> > specific, but lots of things within the project are openbmc-specific,
> > including the daemons that attach both of those libraries to dbus.
> > The only real difference here is that it makes the difference
> > explicit.
>
> It wasn't long ago that the TOF discussed some of these libraries w.r.t.
> "intended to be used outside the project" and we really had trouble
> determining clear language on what classified as this and what did not.

For these repos, we could always retain the source-of-truth as inside
openbmc/openbmc and have automation to subtree sync changes out to
read-only mirrors.

This would make it slightly more difficult for external users of these
libraries to upstream their changes to us, but that's likely worth
reducing the friction of OpenBMC community members contributing to the
libraries (which are the main contributors anyways).

> Actually, neither of these libraries were mentioned, but it was a recipe
> contribution by someone pointing at a non-openbmc github repository.  We
> couldn't really come up with a clear definition but we settled on
> "intended to be used outside the project" recipes that also weren't in
> the openbmc org needed to be submitted upstream to Yocto.
>
> Are we going to be able to come up with a clear definition for this,
> which is actually for code that is _within_ our org?  libpldm, for
> instance, isn't even in a separate repository but covered as part of the
> bigger PLDM with some special build flags for "library only".
>
> > >
> > > On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:
> > > > The OpenBMC development process as it stands is difficult for people
> > > > new to the project to understand, which severely limits our ability to
> > > > onboard new maintainers, developers, and groups which would otherwise
> > > > contribute major features to upstream, but don't have the technical
> > > > expertise to do so.  This initiative, much like others before it[1] is
> > > > attempting to reduce the toil and OpenBMC-specific processes of
> > > > passing changes amongst the community, and move things to being more
> > > > like other projects that have largely solved this problem already.
> > >
> > > Can you be more specific about which projects here? Do you have links
> > > to examples?
> >
> > Linux is the primary example I think of, which hosts libraries within
> > it (libbpf, ect) that are meant to be used elsewhere.  u-root, u-bmc
> > are other examples of firmware that put all of their application
> > specific code in a single repository.  As a counter example, openwrt
> > sticks with multiple repositories, but seems to have significantly
> > fewer repositories in total than we do, despite being a much older
> > project.
> >
> > As a side note, one thing I find interesting is that they host staging
> > branches for contributors/maintainers on their main project page.
> > That's a different model than I've seen elsewhere.  Unrelated to this
> > dicussion, but interesting nonetheless.
> > https://git.openwrt.org/
>
> I was going to point to Android and OpenStack as two large open source
> projects, which also use Gerrit, and seem to have no trouble with the
> micro-repo model.

When I contributed to Android in the past, their process was even more
frustrating and difficult to figure out than ours, requiring lots of
purpose-built infrastructure and tools (treehugger bot, repo tool,
etc.). I don't think their model is a good direction to move the
project towards.

>
> > > > To that end, I'd like to propose a change to the way we structure our
> > > > repositories within the project: specifically, putting (almost) all of
> > > > the Linux Foundation OpenBMC owned code into a single repo that we can
> > > > version as a single entity, rather than spreading out amongst many
> > > > repos.  In practice, this would have some significant advantages:
> > > >
> > > > - The tree would be easily shareable amongst the various people
> > > > working on OpenBMC, without having to rely on a single-source Gerrit
> > > > instance.  Git is designed to be distributed, but if our recipe files
> > > > point at other repositories, it largely defeats a lot of this
> > > > capability.  Today, if you want to share a tree that has a change in
> > > > it, you have to fork the main tree, then fork every single subproject
> > > > you've made modifications to, then update the main tree to point to
> > > > your forks.
> > >
> > > This isn't true, as you can add patches in the OpenBMC tree.
> >
> > As most people that have stacked patches can attest to, managing patch
> > files in a meta layer over time is very difficult (unless you meant
> > something else).  Yes, I should not have said "have to", but a number
> > of the forks that I've seen have ended up resorting to that. Example:
> > (https://github.com/opencomputeproject/HWMgmt-MegaRAC-OpenEdition/tree/master/openbmc_modules)
>
> Why is managing patch files difficult?  Is it lack of documentation?

Managing a few patch files for a single machine in a single meta-layer
doesn't have much overhead, but the complexity scales superlinearly
with more machines, distro features that may be on or off, other
meta-layers trying to add patches, etc. The usual "solution" to this
that I see is just avoiding rebasing to newer versions of OpenBMC,
which makes upstreaming patches even more difficult in a vicious
cycle.

>
> Upstream Yocto deals with patch files all the time.  The Facebook BMC
> tree has machines in production that are still on Rocko-based Yocto
> distributions and we have plenty of patch files we support there.

Supporting patches for older versions of upstream isn't as difficult,
but the project would benefit more if we make it easier for downstream
users to stay as close to upstream as possible. This would make them
more likely to contribute these patches back upstream to us too.

>
> I wouldn't be surprised if Yocto doesn't already have tools to simplify
> "git-format-patch" -> "package.bbappend" workflow, but if they don't I
> could probably write something.

"devtool modify" -> "devtool finish" does this workflow, but I've seen
it fail in subtle, difficult to debug ways many times before (although
to be fair, it has gotten more reliable in the last year or so).

>
> For what it is worth, I'm currently doing a change for sdbusplus that
> requires fixes across tens of repositories (as I wrote about recently).
> I pretty quickly hacked up this shell function in order to automatically
> update my OpenBMC tree with commits from another repo that I've pushed
> to Gerrit already.
>
> https://github.com/williamspatrick/dotfiles/commit/df180ac2b74f2b7fcb6ae91302f0211bc49cb2e9
>
> I don't see using 'git-format-patch' to create the patchfile instead as
> too much additional effort.
>
> > > CI prevents these from being submitted, as it should, but there's nothing to
> > > stop anyone using the `devtool modify ...` / `devtool finish ...` and
> > > committing the result as a workflow to exchange state (I do this)?
> > >
> > > Is the issue instead with devtool? Is it bad? Is the learning curve too steep?
> > > It is at least the Yocto workflow.
> >
> > devtool provides just one form of friction;  There are also a number
> > of cases where devtool modify and devtool finish fail in non obvious
> > ways (usually due to some not-quite-optimal yocto handling in a meta
> > layer, or patches being distributed across meta layers).  The biggest
> > key is that it's yet another tool that seasoned firmware developers
> > have to learn to jump into our codebase.  Each tool adds some friction
> > compared to if it just didn't exist.  It also adds the "which recipe
> > do I need to devtool to modify the webui?" type trouble that people
> > have talked about many times.
>
> Do we have pointers to when devtool fails?  The only time I've seen it
> are for recipes that aren't in the rootfs image: kernel and u-boot and
> they've all been due to bugs in the image.bbclass on our part.  There
> was actually a fix to one of the u-boot recipes very recently.
>
> I personally don't use devtool all that much, but when I do I want it to
> point at the central "workspace" of all the openbmc repos I already have
> so I can get it to pick up code I already have in progress there.  Do we
> need better documentation around those workflows?

That's the usual way I use devtool too, but note that using it this
way prevents "devtool finish" from working properly.

Also cloning all the OpenBMC repos in a centralized workspace and then
pointing the OpenBMC recipes at them is the exact workflow that Ed is
proposing, just in an automated fashion and without the toil of having
to sync and generate patch files from these repos individually.

>
> (At one point there was a statement made that we didn't want tooling
> written to assist with one workflow or another.  This was somewhat made
> in reference to the `setup` script, but I think it had extensions that
> made it that any workflow-related tools people have are hosted in their
> own personal spaces and not talked about.  Maybe we need to change this
> mentality.)

Agreed. I think we should at least have a small number of
well-supported workflows documented that people can choose from - Ed's
proposal here creates an obvious choice of recommended workflow
though.

>
> > > > This gets very onerous over time, especially for simple
> > > > commits.  Having maintained several different companies forks
> > > > personally, and spoken to many others having problems with the same,
> > > > adding major features are difficult to test and rebase because of
> > > > this.  Moving the code to a single tree makes a lot of the toil of
> > > > tagging and modifying local trees a lot more manageable, as a series
> > > > of well-documented git commands (generally git rebase[2]).  It also
> > > > increases the likelihood that someone pulls down the fork to test it
> > > > if it's highly likely that they can apply it to their own tree in a
> > > > single command.
> > >
> > > Again, this is moot if the patches are applied in-tree.
> >
> > Meta layer patch files in my experience tend to not layer well, and
> > require a good amount of maintenance.  They also have problems where
> > they're not versioned against a git base, so there's no guarantees of
> > where in the history the patches were forked from, and whether they
> > apply to your tree, or if they fail, what patches likely caused them
> > to fail.  Admittedly, tracking them in git isn't perfect either, but
> > at least it publishes "this is the source base these were based on" to
> > give some indication.  In practice, the public forks I've seen just
> > embed the custom meta layer within an openbmc tree to solve this
> > problem.
> > https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods
> > https://github.com/HewlettPackard/openbmc
>
> I could entirely be misunderstand what problem you're pointing out here.
> Why would it matter "where in this history the patches were forked
> from"?  Aren't they forked from whatever the SRCREV in the recipe says?
> It is on the maintainer of the meta-layer to ensure they apply to that
> revision.

.bbappend files don't list their target SRCREV for the patch files
(they can of course, but this is well known to be an anti-pattern
which is extremely difficult to maintain)

>
> Having all the code in one repo doesn't give you any more visibility as
> to where the code was "forked from".  It ends up being exactly the same
> as a patch file except that the patch file has been "applied" already to
> the code.  You still don't have visibility to the underlying upstream
> commit number.  And, I would suspect it is going to be even worse
> because you're going to end up with back and forth merge commits trying
> to pick up the latest upstream code in these forks.  You're not going to
> have a nice git-submodule number indicating openbmc/openbmc was from
> here.

"git merge-base" shows this information trivially

In my experience, forks usually use "rebase" rather than "merge", so
they wouldn't have lots of extraneous merge commits.

>
> In my opinion, this is a problem with how people maintaining these trees
> are doing it and not a problem with how our code is organized.  In the
> facebook/openbmc tree we use git-submodules internally to hold the
> upstream trees.  For our github-side we have a script that updates them,
> but there isn't a strong reason we couldn't do the same git-submodule
> layout there (I think it is due to a deficiency in the way our
> internal<=>external mirror tool works).
>
>     https://github.com/facebook/openbmc/blob/helium/yocto_repos.sh
>
> If people are not treating the openbmc/openbmc tree as an unchanged
> blob, that is their fault and not ours.  Having all the source imported
> in one repo doesn't really solve this either and in fact is likely to
> make it worse because you now _can't_ treat openbmc/openbmc as an
> unchanged blob because you're going to have to patch-in-tree any changes
> to code you want to make.

I don't quite follow the exact workflow you're using here, but it
seems like a single "git rebase" command could handle this in a
simpler way, and be more likely to automatically resolve merge
conflicts.

>
> > I also think that having
> > one or a smaller number of reviews would concentrate a lot of the
> > discussion when we make treewide changes.  (OWNERS files, ect)  When
> > they get distributed among many reviews, in my experience it tends to
> > dilute the discussion a bit.
>
> I would argue this is actually a bad thing.  We're going to more likely
> end up with large cross-repository commits that are harder to review,
> require more people to review them (a larger set of OWNERS), and are
> harder to revert.

Once a large-scale change has been agreed on, the exact implementation
of this change on the individual repos shouldn't need much review or
discussion. Owners for individual repos would be able to approve it
pretty easily, and a project-level owner could always give approval
too.

>
> If there is larger discussion to be had that should probably happen on
> the mailing list anyhow.
>
> > > > - It would give an opportunity for individuals and companies to "own"
> > > > well-supported public forks (ie Redhat) of the codebase, which would
> > > > increase participation in the project overall.  This already happens
> > > > quite a bit, but in practice, the forks that do it squash history,
> > > > making it nearly impossible to get their changes upstreamed from an
> > > > outside entity.
> > >
> > > Not sure this is something we want to encourage, even if it happens in
> > > practice.
> >
> > I think when done properly, it would be a huge help to the project.
> > My main point is that this isn't something we can stop (companies and
> > individuals have and will continue to do it anyway), so would we
> > rather make their changes easier to ingest back to upstream?
>
> In my experience the difficulties with upstreaming are not related to
> logistics of sending patches to Gerrit.  They are related to the effort
> involved with getting other people in the community bought into what you're
> trying to do.  Having all the code in one place alleviates 1% of the
> upstreaming effort while doing nothing for the remaining 99%.

I strongly disagree about this apportionment of effort. For people
like us that are familiar with open source processes and procedures,
the logistics of sending patches seems minimal and we focus instead on
the challenges of forming consensus. But for people who have never
participated in an open source community before, just figuring out
where to push code for review, how exactly to use Gerrit, etc. are
significant blockers. Anything we can do to reduce this friction would
make it more likely that new people will contribute.

>
> > > > - It would centralize the bug databases.  Today, bugs filed against
> > > > sub projects tend to not get answered.
> > >
> > > Do you have some numbers handy?
> >
> > I do not.  I can say that anecdotally the "you filed this bug against
> > the wrong project" happens quite often in the repositories I maintain,
> > and the lack of reasonable cross project "transfer the bug" semantics
> > makes this difficult (yes, admins can transfer bugs cross project, but
> > I'm pretty sure we don't want to call on core maintainers every time
> > we want to move things around.)  It would be quite helpful to the
> > project to have less than N bug trackers (might not necessarily be
> > one) to increase the odds that someone searches for and finds their
> > bug before filing a duplicate.
>
> "bugs filed against a sub project tend to not get answered" and
> "bugs are filed against the wrong project" are different problems;
> you've shifted the discussion.
>
> The first is a problem against our maintainers.  Having all the issues
> in one repository doesn't improve that situation, but it actually makes
> it worse because you're going to shift that burden on a few individuals
> who pay attention to openbmc/openbmc issues while doing nothing to fix
> the certain-maintainers-don't-respond issue.

As a maintainer or interested community member, it's much easier to
look through the open issues on a single repo than when distributed
across many other less-active repos.

It's also not always clear exactly which repo is at fault for a bug,
and limiting the discussion to people looking at a particular repo may
miss out on the relevant knowledge of people looking at other repos
instead.

>
> > > > Having all the bugs in
> > > > openbmc/openbmc would help in the future to avoid duplicating bugs
> > > > across projects.
> > >
> > > Has this actually been a problem?
> >
> > Duplication?  It happens from time to time.  Not being able to search
> > for a bug across the project happens a lot, and in our current model,
> > requires the user to know which component they are filing the bug
> > against.
>
> Why can't people search bugs or code at an org-level?  I do it all the time.

GitHub search isn't the best. I'd much rather be able to easily search
through all the code in the project from the command line using
something like `git grep`.

This is especially true if you're looking at historical commits, since
you could check out a single interesting SRCREV of openbmc/openbmc and
have the corresponding versions of all the userspace daemons available
to grep through.

>
> --
> Patrick Williams
