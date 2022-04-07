Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B49B4F83B6
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 17:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ5F12t00z2ymb
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 01:40:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FmEnB0PW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=FmEnB0PW; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ5DZ5G1Zz2yYJ
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 01:40:12 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id u3so8457154wrg.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 Apr 2022 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=76qtVBnTYsGcyYKruotywQvYzkxw8eCdbuDSdgX3euQ=;
 b=FmEnB0PWjxTRf7xdyib90lpLovDWoPvGY0ww8qX9HKEfTtthlZm6ECVND9/g5MSXoX
 R/0DkCBQ/2CBkNL3lCDSyx66jJKGGoABjKMH9rJwbAxUsSSXe0kVo56LXvS1LjaIlMXF
 Mi8eJxD0A9cvaubG3Q/jept+7R/q9m0SyxLUoPRdX5ssX82IFTOLyy0EQ4F0DMoS5/Ie
 jlQAMRxeEJyjY3k9R8tRVli5ACrezXp4vupY1LAAKfByB62RRlkx4OUx11hFh1WPztrJ
 mOMCH3Q3r2FJR/z0SSjrHupvVOkG5H6o+N7csEXENhcfMUZfE12Go2ihYWFmHNdVJWSV
 /7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=76qtVBnTYsGcyYKruotywQvYzkxw8eCdbuDSdgX3euQ=;
 b=vUkxklYYBbIwWYbuy5WKIWXgWI7tE/Kp6bzDPeldV6ghjUEvNJS4SUt78Y7Zf7Y80P
 f13CZBQrivDHqjW7xPaAuNdqOKqhtSW1au6VfT493BmH2jRuODgephC0oYy5mXOqZMzT
 uqmihALMXiYVtrUJAeBLepfCq1ijiYUVyJJCfpQLGXg8iCSb4ECbxPxUT7omgQr/xT4L
 7JezcckQ/pfD3hpVXPC2tgtS2MTu/2t7G6p5fb6WlMHtEdvNMZtE3reMFFBniqtoRNGj
 C/n3V26K6cTzN4W2y3SoZK+D7qMlWMVoZVZIQS4yfoWWFp8fXB9LPHuAhi+cy9Uwozig
 Ot6g==
X-Gm-Message-State: AOAM5318+yChHSS+lh60J/YBRqGAd8aunmcDLKwCNDyXlS9kRcYSXwdL
 cxAzlvOG+7Y5kbGhaAXUf5/+/WFJ+iyIPAkO6rtmjmwiqzDVLA==
X-Google-Smtp-Source: ABdhPJwukZ7xFKnbmo1nEUJh4clhYpp/lR9eCWKf3dWNmuhUJ3ck8j0C3n6IA4OxIpTq4tvPxXrAuCJ1qeWkJjLmUvY=
X-Received: by 2002:a5d:47a1:0:b0:204:9a7:22cd with SMTP id
 1-20020a5d47a1000000b0020409a722cdmr11436604wrb.186.1649346007542; Thu, 07
 Apr 2022 08:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAH2-KxCXYzmLS7OhEDCaDX2pvYHcshLgqL=7gu5XCsNXb=wEGg@mail.gmail.com>
 <Yk3N1EG21r+NRQa5@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Yk3N1EG21r+NRQa5@heinlein.stwcx.org.github.beta.tailscale.net>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 7 Apr 2022 08:39:54 -0700
Message-ID: <CAH2-KxAz1i4tEbs0zTSi2yqth8dtqAVGtcvaYx4bCw+5R3f8VQ@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 6, 2022 at 10:28 AM Patrick Williams <patrick@stwcx.xyz> wrote:
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

Absolutely we should have clearer definitions.  From my perspective it
comes down to is, "are the maintainers willing to maintain this as a
generic usable library?".  Agreed, libpldm (assuming it's intended to
be used outside the project) being within a repo with openbmc-specific
stuff isn't a great model, and we should try to improve in that
regard.  Had we implemented this proposal originally, I suspect that
libpldm would not have evolved that way in the first place.


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

Android had to invent their own tool (repo
https://gerrit.googlesource.com/git-repo/) to handle this for that
level of scale.  As a possible pivot on my proposal, if the suggestion
is to use repo at the openbmc/openbmc level to check out all the
repositories, and enforce some structure on related-reviews, I'm open
to the possibility.

FWIW, we (Google BMC) use the repo tool internally for managing our
meta layers, and in the current model, and while it does make things
better, it just adds one more level of inconsistent dev experience (If
doing X, use repo, if doing Y, use devtool, if doing Z, use gerrit
directly).  It might be a possible solution, but it feels like a half
measure to me.  One important thing that I think we lose if we go to
repo is the idea of "I'm doing something new, but I'm not far enough
along to request a repository, where should I push the code?".  This
question has blocked the upstreaming of many (intentionally unnamed to
protect the innocent) projects, some of which eventually did make it
into upstream, but late, and in a less open way than would've been
possible if there was an easily accessible, dev-pushable answer.

I don't have a lot of knowledge of the openstack dev process.  Is it
similar to Androids?


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

A few reasons:
1. When patches conflict, resolving the rebase conflicts is a manual,
difficult process.
2. Many devs aren't familiar with the available tools (given the
overflow of documentation) and can sometimes resort to rewriting patch
files by hand because they're nor familiar with the relevant tooling.
3. Patches sometimes apply to one system, sometimes apply to all
systems, and generally cause a complex tree of dependencies.  If Yocto
has a patch file, then openbmc has the same patch file, then a private
meta layer has the same patch file, there's no mechanism for "patch
already applied to upstream" like git rebase has.  If certain systems
have pinned a given version of a subproject because of a regression,
there's no easy way to apply different versions of patch files pre and
post regression.
4. Patches could be applied at vendor-level, platform-level, SOC
level, or distro-level, and explaining all of these concepts to new
engineers is difficult.  In practice, most will opt for checking it
into the lowest friction place.

No, I don't believe it's lack of documentation.  Yocto documents
workflows very well, there's just way too much of it to expect anyone
to read it in that level of depth.


>
> Upstream Yocto deals with patch files all the time.  The Facebook BMC
> tree has machines in production that are still on Rocko-based Yocto
> distributions and we have plenty of patch files we support there.

As a design pattern, I don't think we can recommend everyone stay on a
5 year yocto + kernel release.  I get that it works for FB, and that's
their prerogative (seriously, no judgement at all, I understand), but
there are features in the newer kernels (SOC support, kernel support)
that the project would like to rely on, not to mention security
improvements.

Also to some degree this is proving my point, if an OpenBMC
application wanted to rely on a feature that's only present in the 5.1
kernel, but there are systems on 4.7 in the tree, we'd need to
backport patches of the feature;  That gets more onerous.

>
> I wouldn't be surprised if Yocto doesn't already have tools to simplify
> "git-format-patch" -> "package.bbappend" workflow, but if they don't I
> could probably write something.

I think it's supposed to be bitbake finish, but from our experience it
doesn't handle scale very well.

If we write another tool, then we're back to "tool that you need to
know exists to use".  git is a tool that exists, and has these
features already;  We should avoid writing openbmc-specific tools
where we can.


>
> For what it is worth, I'm currently doing a change for sdbusplus that
> requires fixes across tens of repositories (as I wrote about recently).
> I pretty quickly hacked up this shell function in order to automatically
> update my OpenBMC tree with commits from another repo that I've pushed
> to Gerrit already.

Yes, you, me, or the other maintainers can hack up shell scripts to do
what we need in short order.  This doesn't help more junior developers
for which coding doesn't flow as naturally.  Also, if we, the core
maintainers, are having to hack up shell scripts every time we want to
do some kind of analysis/changes, that's not an efficient use of our
time either.

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

We don't have patch files upstream (by and large), so we don't tend to
hit these failure modes in public settings.  I can try to come up with
some contrived examples if you want, but they generally involve some
form of patch conflict, which devtool can't resolve so it crashes out.

>
> I personally don't use devtool all that much, but when I do I want it to
> point at the central "workspace" of all the openbmc repos I already have
> so I can get it to pick up code I already have in progress there.  Do we
> need better documentation around those workflows?

When you do this, how do you manage if you're working on more than one
cross repo feature at a time?  Maybe there's some workflow that I'm
not aware of?

FWIW, the central workspace idea tends to not work too well for me,
but I make do, but maybe that's just a difference in style.

>
> (At one point there was a statement made that we didn't want tooling
> written to assist with one workflow or another.  This was somewhat made
> in reference to the `setup` script, but I think it had extensions that
> made it that any workflow-related tools people have are hosted in their
> own personal spaces and not talked about.  Maybe we need to change this
> mentality.)

Might be reasonable, although I would point out that workflow scripts
still require the user to know they exist.  If we're talking about
workflow scripts around "devtool all openbmc recipes" and "roll up
openbmc changes into review and send", that gets us closer in the "how
do I open reviews" regard, but I'm not sure that's the right approach.

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
> from"?

Because the patches were applied and tested against a particular
version of the tree.  If you change the tree they're based on, you
generally invalidate your testing, which hopefully pops up in a merge
conflict, but doesn't always.

>  Aren't they forked from whatever the SRCREV in the recipe says?
> It is on the maintainer of the meta-layer to ensure they apply to that
> revision.
>

I'm not quite following, SRCREV would be in the upstream openbmc bb
file.  If meta layers bbappend now needed to pin every version of
every package they patch, we're back to a lot of toil to maintain.
Technically to get a consistent set, you'd have to put in the meta
layer patch every SRCREV of every openbmc package, considering that
changes get made often that have cross project consequences.

> Having all the code in one repo doesn't give you any more visibility as
> to where the code was "forked from".  It ends up being exactly the same
> as a patch file except that the patch file has been "applied" already to
> the code.

I'm not quite following your statement here, so I'm not sure I
understand it.  If I had a meta layer

meta-ed/
meta-ed/meta-phosphor/bmcweb_%.bbappend
meta-ed/meta-phosphor/bmcweb/0001-GreatestEver.patch

How would I know what version openbmc that patch applies and was tested against?


>  You still don't have visibility to the underlying upstream
> commit number.  And, I would suspect it is going to be even worse
> because you're going to end up with back and forth merge commits trying
> to pick up the latest upstream code in these forks.  You're not going to
> have a nice git-submodule number indicating openbmc/openbmc was from
> here.

In what I'm proposing, you would have the whole repository, with those
changes patched on top and it would be a "git merge-base" command to
determine where it was forked from mainline, same as you would for the
kernel.

>
> In my opinion, this is a problem with how people maintaining these trees
> are doing it and not a problem with how our code is organized.

Can you point to any public facing LF-openbmc tree that has done it
"right"?  If nobody on the project can figure out the "right" way
(myself included), including a lot of reasonably smart people, that
somewhat proves my point, that there's complexities in the way these
things are managed.

>  In the
> facebook/openbmc tree we use git-submodules internally to hold the
> upstream trees.  For our github-side we have a script that updates them,
> but there isn't a strong reason we couldn't do the same git-submodule
> layout there (I think it is due to a deficiency in the way our
> internal<=>external mirror tool works).

I'm not in love with the idea of submodules, but I've never worked in
a repository where they've solved the purpose, or been easy to use
(I've heard they cause similar problems to what we're facing) but can
you elaborate on what you're talking about?

Do you think they could handle the volume of patches openbmc fields?

>
>     https://github.com/facebook/openbmc/blob/helium/yocto_repos.sh
>
> If people are not treating the openbmc/openbmc tree as an unchanged
> blob, that is their fault and not ours.  Having all the source imported
> in one repo doesn't really solve this either and in fact is likely to
> make it worse because you now _can't_ treat openbmc/openbmc as an
> unchanged blob because you're going to have to patch-in-tree any changes
> to code you want to make.
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

Nothing about what I'm proposing would prevent breaking them up still
and using good judgement, but for things like "turn on c++20" it would
be really nice if we could have one commit, determine where the
problems are, and organize the solutions, instead of breaking it up
across many repositories.

>
> If there is larger discussion to be had that should probably happen on
> the mailing list anyhow.

Our mailing list can't merge code, so it makes technical discussions
that need to reference a particular change like that more difficult if
you need to discuss a diff;  This is a big difference between our
community and say, the kernel.

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

We've clearly had different experiences (which is fine).  I've had
multiple developers describe the review process itself as complicated,
unstructured, and hard.  This was mentioned explicitly separate from
community buy-in, and as someone that goes through the process almost
daily, I agree with them that it's more complex than it should be.
For the major initiatives that I've had a hand in bringing online in
the project, having a clear concise way to talk about the engineering
(ie the code) was a much better way at getting consensus than any of
our docs processes.  In most cases, it involved pushing to a public,
unrelated openbmc fork, waiting for momentum to build, then merging
the result when people in the community wanted the capabilities it
provided.  Not having a way to do that within the project adds
friction.

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

That presumes that only a few people have access to resolve bugs.
Ideally all maintainers would have access to the bug closure
permissions, so they could field bugs by project.  Tagging or
assignments could be used to convey where the bug itself lies.

I retract my previous statement, as you're right, I don't have
numbers, propose the following as a replacement: "A single github bug
tracker against the main repo would be a better community driving tool
than distributing it across many sub repositories."
I will also admit that there are probably options where we could do
that anyway, outside of this proposal.

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

If there's a way to get a single listing of bugs for all repos in the
org..... I'm not aware of it, and a quick google search doesn't pop up
anything.  Maybe my google-foo is off?



>
> --
> Patrick Williams
