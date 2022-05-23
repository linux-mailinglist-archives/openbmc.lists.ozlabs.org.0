Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07820531F38
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 01:27:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6YQs5sV6z3bmt
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 09:27:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ock59I8o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=nanzhou@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Ock59I8o; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6YQF4Kk4z3bn5
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 09:27:16 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id gh17so18887591ejc.6
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0POD9XGMRl7CAKd8W8YPaSIdOA/KNyCyHWliRhAjtpE=;
 b=Ock59I8osFD2QuE9TlDkapykyXVWAFavHEIsuLQASPm9tsKVF7CETFJ34iNa8dENTD
 slUDwv1LfPjRJJ6RTs66ProXkxS2Ehxfss/5BX8UnfTZk5vFyDD1+W8VbfnhaNjSfQsq
 udCKbVoKhQE0BSYxG0j+wf+5HWoWkBgFHHXQn5THJhd1cmq5tT7WuhgGhsb5aSCmPthE
 LBHkKd82WxzKSGtzif+PwQ8lnLhmm8XzyZin4vSsHymdJdCo8lXg9qP+RP+nJtOiLprn
 AUl3SOyqXTCwik0lfP7KEXU6o/Nu/QZlMWzhTXoqQV/OzfAyFN1NNbgbmVnC41Y/Rfby
 BRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0POD9XGMRl7CAKd8W8YPaSIdOA/KNyCyHWliRhAjtpE=;
 b=ciGDl1vf5ID6tmBiswNmxNVP4GmANYSJgOVJGKEjOs7oZybpWLgu/Sv7sa0iSJcBQ4
 n4aPYA0DtJe7hOx3EQq8ZJZT8UTsDjF8FvKoHBm3BZmBcwolbA3Duw7kY3nNG2vSnSti
 pv+bvB6moqNxjyiWMPbt6IFWeRHwWvC43im+bCCt0tFZK/OSRykY7BCCEMZ7Djr+jpD1
 Cb4v9YYLaHgBFtdLbx1XdU3LdWWadpbuKxM5nFKuSio0qUbycJByN1hX2SejQV7P2IDG
 vINqniEuuQzyBVDmNiRngEEqjcX7u1n0yjr0Zkc++R+3Op5ya0vb0ty54kqKbEQeKCBf
 bncA==
X-Gm-Message-State: AOAM5313lKfEO0CqNb/Puxa0ju9rJmnbFEtKTI7qsGaq0YKvbWoGdFcu
 H+z0HSGZH+N0Y8cVcoDv4IUVMqK/L2oBLJzi3D9VXQ==
X-Google-Smtp-Source: ABdhPJz65nwYHiRCBVlI8i+MpQe5JfV+ZKqp9DnNFlgfmGKr0BSkPwVjdcPTJcfAE8otpu5PZ+T5jjuQzpawxFVQq/0=
X-Received: by 2002:a17:907:7ea0:b0:6fe:f024:d006 with SMTP id
 qb32-20020a1709077ea000b006fef024d006mr4982837ejc.248.1653348432623; Mon, 23
 May 2022 16:27:12 -0700 (PDT)
MIME-Version: 1.0
From: Nan Zhou <nanzhou@google.com>
Date: Mon, 23 May 2022 16:27:01 -0700
Message-ID: <CAOLfGj4rKXeiVLuL_8q0NWZdTBFw2NDb5zybVPj9GGYj+3yy4w@mail.gmail.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: John Broadbent <jebr@google.com>
Content-Type: multipart/alternative; boundary="00000000000004f73605dfb62e45"
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Cody Smith <scody@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000004f73605dfb62e45
Content-Type: text/plain; charset="UTF-8"

This is an email thread with a lot of information. We have discussed this
internally inside Google, too.

An important advantage of the monorepo I like is that it makes maintenance
of patches easier. For example, Google puts a lot of attention on Redfish
these days. With the monorepo, Google can maintain its own BMCWeb branch
and continuously rebase on the master. And there's only one branch for all
these customizations: Yocto, core C++ repo, etc. +1 to "A better model
would allow openbmc to be flexible enough to enable downstream features.".
I believe this will make OpenBMC even more popular.

Best,
Nan Zhou

Message: 2
> Date: Mon, 23 May 2022 14:07:55 -0700
> From:
> To: Ed Tanous <edtanous@google.com>
> Cc: Cody Smith <scody@google.com>, OpenBMC Maillist
>         <openbmc@lists.ozlabs.org>, Brad Bishop <
> bradleyb@fuzziesquirrel.com>
> Subject: Re: Proposing changes to the OpenBMC tree (to make
>         upstreaming easier)
> Message-ID:
>         <CAPw1Ef_dMf43e567LLAfMZp6khWWQAm=
> i63LHfOwWkyiSe-MFA@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
> Main thoughts:
> Message: 2
> Date: Mon, 23 May 2022 14:07:55 -0700
> From: John Broadbent <jebr@google.com>
> To: Ed Tanous <edtanous@google.com>
> Cc: Cody Smith <scody@google.com>, OpenBMC Maillist
>         <openbmc@lists.ozlabs.org>, Brad Bishop <
> bradleyb@fuzziesquirrel.com>
> Subject: Re: Proposing changes to the OpenBMC tree (to make
>         upstreaming easier)
> Message-ID:
>         <CAPw1Ef_dMf43e567LLAfMZp6khWWQAm=
> i63LHfOwWkyiSe-MFA@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
> Main thoughts:
> We have several patches that we apply to the project. When we update those
> patches we see a diff of the patches, and it can be difficult to review a
> diff of a diff.
> I believe this new repo system would allow us to apply those patches to a
> source tree, and manage/maintain the patches better.
> >  "I have no interest in making this easier for you (if it is worse in
> other ways for the project)."   - referring to downstream only features.
> This is the wrong way to view features the community does not want, and
> features we would not be allowed to share. There is a layer of complexity
> that we use to integrate with our data centers services that only we need.
> A better model would allow openbmc to be flexible enough to enable
> downstream features.
> Other thoughts:
>    - I suppose it would make it easy for others to fork the project, but I
>    don't think that is a strong enough reason to prevent consolidation.
>    - The consolidation would make it easier to bring new people up to
>    speed. (the system we have works fine, but I suspect the consolidation
> will
>    be a improvement)
>    - We are not changing OWNERS in the change.
>    - Applications vs distribution: I have always viewed openbmc as a
>    collection of application services/applications, combined with a
> distros.
> On Mon, May 23, 2022 at 9:38 AM Ed Tanous <edtanous@google.com> wrote:
> > On Thu, May 19, 2022 at 2:12 PM Cody Smith <scody@google.com> wrote:
> > >
> > > I don't seem to have the original message, so this may get added to
> > Andrew's branch of this thread. Sorry about that in advance.
> >
> > The original message got caught in a lot of peoples spam filters, I'm
> > hoping that explains some of the lack of reply to the initial
> > proposal.
> >
> > >
> > > In general I support moving to a monorepo. We at Google do this, and my
> > significant other at Airbnb also utilizes a monorepo. The advantages are
> > significant, as the world gets a lot less silo'd and making changes that
> > would have spanned across multiple repos now only span the monorepo. This
> > is particularly useful when feature X requires changes to repo A, B and
> C,
> > and the changes on their own break things but shipped together are just
> > fine. I don't even really know how such a feature gets shipped today to
> be
> > honest.
> >
> > I agree with your general sentiment, although a couple nitpicks, what
> > I propose above isn't pure "monorepo" and more analogous to
> > "consolidate a lot of the repos".  FWIW, although I really think it's
> > the right thing to do, "other companies do it for other things" isn't
> > the best of arguments we can make for this.  There are plenty of
> > counter examples of companies with much more entrenched command chains
> > that use multiple repos and the creation of repos as a form of project
> > management to great effect.
> >
> > >
> > > The other thing that tends to happen with monorepos is a lot more
> > conformity, as reviews are carried out by a larger set of people.
> >
> > +1.  Applying consistent clang-format to the codebase for example
> > would be a lot more trivial.
> >
> > > Suddenly `bmcweb` is being reviewed by people who may not have
> > previously cared about or touched that part of the codebase as a bad
> > example. At a minimum more people will have eyes on the changes
> happening.
> > >
> > > I also think that a monorepo avoids one maintainer "lording" over a
> > repo. It happens, the +2ers kind of play a role of the bridge troll, when
> > repo X only has 1-2 +2ers, this can be a real problem. A monorepo with
> 10+
> > +2ers will force the +2ers to engage in debate when they disagree with
> each
> > other, instead of lording over their own kingdoms and having no influence
> > over other kingdoms so to speak.
> >
> > In what I propose, I don't really think this changes given that the
> > existing OWNERS files would still be largely the same, although I
> > agree, more +2er debate would be a good thing if it was the result.
> >
> > >
> > > I haven't made a great set of arguments here but in general I feel like
> > a chance like this would help from an organizational perspective and
> maybe
> > with that better org. in place maybe we can begin addressing some of the
> > other issues we need to address.
> >
> > Thanks for your input.
> >
> > PS, plaintext is generally prefered on this ML, given that it diffs
> > better in the tools.  (Click triple dot in the lower right of gmail,
> > then check "plain text mode").
> >
> > >
> > > Cody Smith
> > > System Software Engineer
> > > Google Cloud Platform Core Services Team
> > > scody@google.com
> > > 720-515-6105 <(720)%20515-6105> <(720)%20515-6105>
> > >
> > >
> > >
> > > On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >>
> > >> Hi Ed,
> > >>
> > >> I think what's below largely points to a bit of an identity crisis for
> > >> the project, on a couple of fronts. Fundamentally OpenBMC is a distro
> > >> (or as Yocto likes to point out, a meta-distro), and we can:
> > >>
> > >> 1. Identify as a traditional OSS distro: An integration of otherwise
> > >>    independent applications
> > >>
> > >> 2. Identify as an appliance distro: The distro and the
> > >>    applications are a monolith
> > >>
> > >> You're proposing 2, while I think there exists some tension towards 1.
> > >>
> > >> With the amount of custom userspace we've always kinda sat in-between.
> > >> I'd like to see libraries and applications that have use cases outside
> > >> of OpenBMC be accessible to people with those external use cases,
> > >> without being burdened by understanding the rest of the OpenBMC
> context.
> > >> I have a concern that by integrating things in the way you're
> proposing
> > >> it will lead to more inertia there (e.g. for implementations of
> > >> standards MCTP or PLDM (libmctp and libpldm)).
> > >>
> > >> On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:
> > >> > The OpenBMC development process as it stands is difficult for people
> > >> > new to the project to understand, which severely limits our ability
> to
> > >> > onboard new maintainers, developers, and groups which would
> otherwise
> > >> > contribute major features to upstream, but don't have the technical
> > >> > expertise to do so.  This initiative, much like others before it[1]
> is
> > >> > attempting to reduce the toil and OpenBMC-specific processes of
> > >> > passing changes amongst the community, and move things to being more
> > >> > like other projects that have largely solved this problem already.
> > >>
> > >> Can you be more specific about which projects here? Do you have links
> > >> to examples?
> > >>
> > >> >
> > >> > To that end, I'd like to propose a change to the way we structure
> our
> > >> > repositories within the project: specifically, putting (almost) all
> of
> > >> > the Linux Foundation OpenBMC owned code into a single repo that we
> can
> > >> > version as a single entity, rather than spreading out amongst many
> > >> > repos.  In practice, this would have some significant advantages:
> > >> >
> > >> > - The tree would be easily shareable amongst the various people
> > >> > working on OpenBMC, without having to rely on a single-source Gerrit
> > >> > instance.  Git is designed to be distributed, but if our recipe
> files
> > >> > point at other repositories, it largely defeats a lot of this
> > >> > capability.  Today, if you want to share a tree that has a change in
> > >> > it, you have to fork the main tree, then fork every single
> subproject
> > >> > you've made modifications to, then update the main tree to point to
> > >> > your forks.
> > >>
> > >> This isn't true, as you can add patches in the OpenBMC tree.
> > >>
> > >> CI prevents these from being submitted, as it should, but there's
> > nothing to
> > >> stop anyone using the `devtool modify ...` / `devtool finish ...` and
> > >> committing the result as a workflow to exchange state (I do this)?
> > >>
> > >> Is the issue instead with devtool? Is it bad? Is the learning curve
> too
> > steep?
> > >> It is at least the Yocto workflow.
> > >>
> > >> > This gets very onerous over time, especially for simple
> > >> > commits.  Having maintained several different companies forks
> > >> > personally, and spoken to many others having problems with the same,
> > >> > adding major features are difficult to test and rebase because of
> > >> > this.  Moving the code to a single tree makes a lot of the toil of
> > >> > tagging and modifying local trees a lot more manageable, as a series
> > >> > of well-documented git commands (generally git rebase[2]).  It also
> > >> > increases the likelihood that someone pulls down the fork to test it
> > >> > if it's highly likely that they can apply it to their own tree in a
> > >> > single command.
> > >>
> > >> Again, this is moot if the patches are applied in-tree.
> > >>
> > >> >
> > >> > - There would be a reduction in reviews.  Today, anytime a person
> > >> > wants to make a change that would involve any part of the tree,
> > >> > there's at least 2 code reviews, one for the commit, and one for the
> > >> > recipe bump.  Compared to a single tree, this at least doubles the
> > >> > number of reviews we need to process.
> > >>
> > >> Is there more work? Yes.
> > >>
> > >> Is it always double? No. Is it sometimes double? Yes.
> > >>
> > >> Often bumps batch multiple application commits. I think this paragraph
> > >> overstates the problem somewhat, but what it does get right is
> > >> identifying that *some* overhead exists.
> > >>
> > >> >  For changes that want to make
> > >> > any change to a few subsystems, as is the case when developing a
> > >> > feature, they require 2 X <number of project changes> reviews, all
> of
> > >> > which need to be synchronized.
> > >>
> > >> Same issue as above here.
> > >>
> > >> > There is a well documented problem
> > >> > where we have no official way to synchronize merging of changes to
> > >> > userspace applications within a bump without manual human
> > >> > intervention.  This would largely render that problem moot.
> > >>
> > >> Right, this can be hard to handle.
> > >>
> > >> It can be mitigated by versioning interfaces (which the D-Bus spec
> > >> calls out[6][7] but OpenBMC fails to do (?)) and supporting multiple
> > >> interfaces for the transition period.
> > >>
> > >> That said, that's also more work, and so needs to be considered in the
> > >> set of trade-offs.
> > >>
> > >> [6]
> >
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-interface
> > >> [7]
> >
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus
> > >>
> > >> >
> > >> > - It would allow most developers to not need to understand Yocto at
> > >> > all to do their day to day work on existing applications.  No more
> > >> > "devtool modify", and related SRCREV bumps.  This will help most of
> > >> > the new developers on the project with a lower mental load, which
> will
> > >> > mean people are able to ramp up faster..
> > >>
> > >> Okay. So devtool is seen as an issue.
> > >>
> > >> Can we improve its visibility and any education around it? Or is it a
> > >> lost cause? If so, why?
> > >>
> > >> Separately, I'm concerned this is an attempt to shield people from
> > >> skills that help them work with upstream Yocto. OpenBMC feels like
> it's
> > >> a bit of an on-ramp for open-source contributions for people who have
> > >> worked in what was previously quite a proprietary environment. We
> tried
> > >> shielding people in the past wrt kernel contributions, and that failed
> > >> pretty spectacularly. We (at least Joel and I) now encourage people to
> > >> work with upstream directly *and support them in the process of doing
> > >> that* rather than trying to mitigate some of the difficulties with
> > >> working upstream by avoiding them.
> > >>
> > >> >
> > >> > - It would give an opportunity for individuals and companies to
> "own"
> > >> > well-supported public forks (ie Redhat) of the codebase, which would
> > >> > increase participation in the project overall.  This already happens
> > >> > quite a bit, but in practice, the forks that do it squash history,
> > >> > making it nearly impossible to get their changes upstreamed from an
> > >> > outside entity.
> > >>
> > >> Not sure this is something we want to encourage, even if it happens in
> > >> practice.
> > >>
> > >> >
> > >> > - It would centralize the bug databases.  Today, bugs filed against
> > >> > sub projects tend to not get answered.
> > >>
> > >> Do you have some numbers handy?
> > >>
> > >> > Having all the bugs in
> > >> > openbmc/openbmc would help in the future to avoid duplicating bugs
> > >> > across projects.
> > >>
> > >> Has this actually been a problem?
> > >>
> > >> >
> > >> > - Would increase the likelihood that someone contributes a patch,
> > >> > especially a patch written by someone else.  If contributing a patch
> > >> > was just a matter of cherry-picking a tree of commits and submitting
> > >> > it to gerrit, it's a lot more likely that people would do it.
> > >>
> > >> It sounds plausible, but again, some evidence for this would be
> helpful.
> > >>
> > >> Why is this easier than submitting the patches to the application
> repo?
> > >>
> > >> > My proposed version of this tree is pushed to a github fork here,
> and
> > >> > is based on the tree from a few weeks ago:
> > >> > https://github.com/edtanous/openbmc
> > >> >
> > >> > It implements all the above for the main branch.  This tree is based
> > >> > on the output of the automated tooling, and in the case where this
> > >> > proposal is accepted, the tooling would be re-run to capture the
> state
> > >> > of the tree at the point where we chose to make this change.
> > >> >
> > >> > The tool I wrote to generate this tree is also published, if you're
> > >> > interested in how this tree was built, and is quite interesting in
> its
> > >> > use of git export/import [5], but functionally, I would not expect
> > >> > that tooling to survive after this transition is made.
> > >>
> > >> I think it would be good to capture the script in openbmc-tools if we
> > >> choose to go ahead with this, mainly as a record of how we achieved
> it.
> > >>
> > >> Andrew
> > >>
> > >> >
> > >> > [1]
> > >> >
> >
> https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/
> > >> > [2] https://git-scm.com/docs/git-rebase
> > >> > [3]
> > >> >
> >
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
> > >> > [4]
> > >> >
> >
> https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc
> > >> > [5] https://github.com/edtanous/obmc-repo-combine/blob/main/combine
> >
> We have several patches that we apply to the project. When we update those
> patches we see a diff of the patches, and it can be difficult to review a
> diff of a diff.
> I believe this new repo system would allow us to apply those patches to a
> source tree, and manage/maintain the patches better.
> >  "I have no interest in making this easier for you (if it is worse in
> other ways for the project)."   - referring to downstream only features.

This is the wrong way to view features the community does not want, and
> features we would not be allowed to share. There is a layer of complexity
> that we use to integrate with our data centers services that only we need.
> A better model would allow openbmc to be flexible enough to enable
> downstream features.
> Other thoughts:
>    - I suppose it would make it easy for others to fork the project, but I
>    don't think that is a strong enough reason to prevent consolidation.
>    - The consolidation would make it easier to bring new people up to
>    speed. (the system we have works fine, but I suspect the consolidation
> will
>    be a improvement)
>    - We are not changing OWNERS in the change.
>    - Applications vs distribution: I have always viewed openbmc as a
>    collection of application services/applications, combined with a
> distros.
> On Mon, May 23, 2022 at 9:38 AM Ed Tanous <edtanous@google.com> wrote:
> > On Thu, May 19, 2022 at 2:12 PM Cody Smith <scody@google.com> wrote:
> > >
> > > I don't seem to have the original message, so this may get added to
> > Andrew's branch of this thread. Sorry about that in advance.
> >
> > The original message got caught in a lot of peoples spam filters, I'm
> > hoping that explains some of the lack of reply to the initial
> > proposal.
> >
> > >
> > > In general I support moving to a monorepo. We at Google do this, and my
> > significant other at Airbnb also utilizes a monorepo. The advantages are
> > significant, as the world gets a lot less silo'd and making changes that
> > would have spanned across multiple repos now only span the monorepo. This
> > is particularly useful when feature X requires changes to repo A, B and
> C,
> > and the changes on their own break things but shipped together are just
> > fine. I don't even really know how such a feature gets shipped today to
> be
> > honest.
> >
> > I agree with your general sentiment, although a couple nitpicks, what
> > I propose above isn't pure "monorepo" and more analogous to
> > "consolidate a lot of the repos".  FWIW, although I really think it's
> > the right thing to do, "other companies do it for other things" isn't
> > the best of arguments we can make for this.  There are plenty of
> > counter examples of companies with much more entrenched command chains
> > that use multiple repos and the creation of repos as a form of project
> > management to great effect.
> >
> > >
> > > The other thing that tends to happen with monorepos is a lot more
> > conformity, as reviews are carried out by a larger set of people.
> >
> > +1.  Applying consistent clang-format to the codebase for example
> > would be a lot more trivial.
> >
> > > Suddenly `bmcweb` is being reviewed by people who may not have
> > previously cared about or touched that part of the codebase as a bad
> > example. At a minimum more people will have eyes on the changes
> happening.
> > >
> > > I also think that a monorepo avoids one maintainer "lording" over a
> > repo. It happens, the +2ers kind of play a role of the bridge troll, when
> > repo X only has 1-2 +2ers, this can be a real problem. A monorepo with
> 10+
> > +2ers will force the +2ers to engage in debate when they disagree with
> each
> > other, instead of lording over their own kingdoms and having no influence
> > over other kingdoms so to speak.
> >
> > In what I propose, I don't really think this changes given that the
> > existing OWNERS files would still be largely the same, although I
> > agree, more +2er debate would be a good thing if it was the result.
> >
> > >
> > > I haven't made a great set of arguments here but in general I feel like
> > a chance like this would help from an organizational perspective and
> maybe
> > with that better org. in place maybe we can begin addressing some of the
> > other issues we need to address.
> >
> > Thanks for your input.
> >
> > PS, plaintext is generally prefered on this ML, given that it diffs
> > better in the tools.  (Click triple dot in the lower right of gmail,
> > then check "plain text mode").
> >
> > >
> > > Cody Smith
> > > System Software Engineer
> > > Google Cloud Platform Core Services Team
> > > scody@google.com
> > > 720-515-6105 <(720)%20515-6105> <(720)%20515-6105>
> > >
> > >
> > >
> > > On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >>
> > >> Hi Ed,
> > >>
> > >> I think what's below largely points to a bit of an identity crisis for
> > >> the project, on a couple of fronts. Fundamentally OpenBMC is a distro
> > >> (or as Yocto likes to point out, a meta-distro), and we can:
> > >>
> > >> 1. Identify as a traditional OSS distro: An integration of otherwise
> > >>    independent applications
> > >>
> > >> 2. Identify as an appliance distro: The distro and the
> > >>    applications are a monolith
> > >>
> > >> You're proposing 2, while I think there exists some tension towards 1.
> > >>
> > >> With the amount of custom userspace we've always kinda sat in-between.
> > >> I'd like to see libraries and applications that have use cases outside
> > >> of OpenBMC be accessible to people with those external use cases,
> > >> without being burdened by understanding the rest of the OpenBMC
> context.
> > >> I have a concern that by integrating things in the way you're
> proposing
> > >> it will lead to more inertia there (e.g. for implementations of
> > >> standards MCTP or PLDM (libmctp and libpldm)).
> > >>
> > >> On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:
> > >> > The OpenBMC development process as it stands is difficult for people
> > >> > new to the project to understand, which severely limits our ability
> to
> > >> > onboard new maintainers, developers, and groups which would
> otherwise
> > >> > contribute major features to upstream, but don't have the technical
> > >> > expertise to do so.  This initiative, much like others before it[1]
> is
> > >> > attempting to reduce the toil and OpenBMC-specific processes of
> > >> > passing changes amongst the community, and move things to being more
> > >> > like other projects that have largely solved this problem already.
> > >>
> > >> Can you be more specific about which projects here? Do you have links
> > >> to examples?
> > >>
> > >> >
> > >> > To that end, I'd like to propose a change to the way we structure
> our
> > >> > repositories within the project: specifically, putting (almost) all
> of
> > >> > the Linux Foundation OpenBMC owned code into a single repo that we
> can
> > >> > version as a single entity, rather than spreading out amongst many
> > >> > repos.  In practice, this would have some significant advantages:
> > >> >
> > >> > - The tree would be easily shareable amongst the various people
> > >> > working on OpenBMC, without having to rely on a single-source Gerrit
> > >> > instance.  Git is designed to be distributed, but if our recipe
> files
> > >> > point at other repositories, it largely defeats a lot of this
> > >> > capability.  Today, if you want to share a tree that has a change in
> > >> > it, you have to fork the main tree, then fork every single
> subproject
> > >> > you've made modifications to, then update the main tree to point to
> > >> > your forks.
> > >>
> > >> This isn't true, as you can add patches in the OpenBMC tree.
> > >>
> > >> CI prevents these from being submitted, as it should, but there's
> > nothing to
> > >> stop anyone using the `devtool modify ...` / `devtool finish ...` and
> > >> committing the result as a workflow to exchange state (I do this)?
> > >>
> > >> Is the issue instead with devtool? Is it bad? Is the learning curve
> too
> > steep?
> > >> It is at least the Yocto workflow.
> > >>
> > >> > This gets very onerous over time, especially for simple
> > >> > commits.  Having maintained several different companies forks
> > >> > personally, and spoken to many others having problems with the same,
> > >> > adding major features are difficult to test and rebase because of
> > >> > this.  Moving the code to a single tree makes a lot of the toil of
> > >> > tagging and modifying local trees a lot more manageable, as a series
> > >> > of well-documented git commands (generally git rebase[2]).  It also
> > >> > increases the likelihood that someone pulls down the fork to test it
> > >> > if it's highly likely that they can apply it to their own tree in a
> > >> > single command.
> > >>
> > >> Again, this is moot if the patches are applied in-tree.
> > >>
> > >> >
> > >> > - There would be a reduction in reviews.  Today, anytime a person
> > >> > wants to make a change that would involve any part of the tree,
> > >> > there's at least 2 code reviews, one for the commit, and one for the
> > >> > recipe bump.  Compared to a single tree, this at least doubles the
> > >> > number of reviews we need to process.
> > >>
> > >> Is there more work? Yes.
> > >>
> > >> Is it always double? No. Is it sometimes double? Yes.
> > >>
> > >> Often bumps batch multiple application commits. I think this paragraph
> > >> overstates the problem somewhat, but what it does get right is
> > >> identifying that *some* overhead exists.
> > >>
> > >> >  For changes that want to make
> > >> > any change to a few subsystems, as is the case when developing a
> > >> > feature, they require 2 X <number of project changes> reviews, all
> of
> > >> > which need to be synchronized.
> > >>
> > >> Same issue as above here.
> > >>
> > >> > There is a well documented problem
> > >> > where we have no official way to synchronize merging of changes to
> > >> > userspace applications within a bump without manual human
> > >> > intervention.  This would largely render that problem moot.
> > >>
> > >> Right, this can be hard to handle.
> > >>
> > >> It can be mitigated by versioning interfaces (which the D-Bus spec
> > >> calls out[6][7] but OpenBMC fails to do (?)) and supporting multiple
> > >> interfaces for the transition period.
> > >>
> > >> That said, that's also more work, and so needs to be considered in the
> > >> set of trade-offs.
> > >>
> > >> [6]
> >
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-interface
> > >> [7]
> >
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus
> > >>
> > >> >
> > >> > - It would allow most developers to not need to understand Yocto at
> > >> > all to do their day to day work on existing applications.  No more
> > >> > "devtool modify", and related SRCREV bumps.  This will help most of
> > >> > the new developers on the project with a lower mental load, which
> will
> > >> > mean people are able to ramp up faster..
> > >>
> > >> Okay. So devtool is seen as an issue.
> > >>
> > >> Can we improve its visibility and any education around it? Or is it a
> > >> lost cause? If so, why?
> > >>
> > >> Separately, I'm concerned this is an attempt to shield people from
> > >> skills that help them work with upstream Yocto. OpenBMC feels like
> it's
> > >> a bit of an on-ramp for open-source contributions for people who have
> > >> worked in what was previously quite a proprietary environment. We
> tried
> > >> shielding people in the past wrt kernel contributions, and that failed
> > >> pretty spectacularly. We (at least Joel and I) now encourage people to
> > >> work with upstream directly *and support them in the process of doing
> > >> that* rather than trying to mitigate some of the difficulties with
> > >> working upstream by avoiding them.
> > >>
> > >> >
> > >> > - It would give an opportunity for individuals and companies to
> "own"
> > >> > well-supported public forks (ie Redhat) of the codebase, which would
> > >> > increase participation in the project overall.  This already happens
> > >> > quite a bit, but in practice, the forks that do it squash history,
> > >> > making it nearly impossible to get their changes upstreamed from an
> > >> > outside entity.
> > >>
> > >> Not sure this is something we want to encourage, even if it happens in
> > >> practice.
> > >>
> > >> >
> > >> > - It would centralize the bug databases.  Today, bugs filed against
> > >> > sub projects tend to not get answered.
> > >>
> > >> Do you have some numbers handy?
> > >>
> > >> > Having all the bugs in
> > >> > openbmc/openbmc would help in the future to avoid duplicating bugs
> > >> > across projects.
> > >>
> > >> Has this actually been a problem?
> > >>
> > >> >
> > >> > - Would increase the likelihood that someone contributes a patch,
> > >> > especially a patch written by someone else.  If contributing a patch
> > >> > was just a matter of cherry-picking a tree of commits and submitting
> > >> > it to gerrit, it's a lot more likely that people would do it.
> > >>
> > >> It sounds plausible, but again, some evidence for this would be
> helpful.
> > >>
> > >> Why is this easier than submitting the patches to the application
> repo?
> > >>
> > >> > My proposed version of this tree is pushed to a github fork here,
> and
> > >> > is based on the tree from a few weeks ago:
> > >> > https://github.com/edtanous/openbmc
> > >> >
> > >> > It implements all the above for the main branch.  This tree is based
> > >> > on the output of the automated tooling, and in the case where this
> > >> > proposal is accepted, the tooling would be re-run to capture the
> state
> > >> > of the tree at the point where we chose to make this change.
> > >> >
> > >> > The tool I wrote to generate this tree is also published, if you're
> > >> > interested in how this tree was built, and is quite interesting in
> its
> > >> > use of git export/import [5], but functionally, I would not expect
> > >> > that tooling to survive after this transition is made.
> > >>
> > >> I think it would be good to capture the script in openbmc-tools if we
> > >> choose to go ahead with this, mainly as a record of how we achieved
> it.
> > >>
> > >> Andrew
> > >>
> > >> >
> > >> > [1]
> > >> >
> >
> https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/
> > >> > [2] https://git-scm.com/docs/git-rebase
> > >> > [3]
> > >> >
> >
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
> > >> > [4]
> > >> >
> >
> https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc
> > >> > [5] https://github.com/edtanous/obmc-repo-combine/blob/main/combine
> >

--00000000000004f73605dfb62e45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is an email thread with a lot of information. We=
 have discussed this internally inside Google,=C2=A0too.</div><div><br></di=
v><div>An important advantage of the monorepo I like is that it makes maint=
enance of patches easier. For example, Google puts a lot of attention on Re=
dfish these=C2=A0days. With the monorepo, Google can maintain its own=C2=A0=
BMCWeb branch and continuously rebase on the master. And there&#39;s only o=
ne branch=C2=A0for all these customizations: Yocto, core C++ repo, etc. +1 =
to &quot;A better model would allow openbmc to be flexible enough to enable=
 downstream features.&quot;.=C2=A0 I believe this will make OpenBMC even mo=
re popular.</div><div><br></div><div>Best,</div><div>Nan Zhou</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Message: 2<br>Date=
: Mon, 23 May 2022 14:07:55 -0700<br>From:=C2=A0<br>To: Ed Tanous &lt;<a hr=
ef=3D"mailto:edtanous@google.com" target=3D"_blank">edtanous@google.com</a>=
&gt;<br>Cc: Cody Smith &lt;<a href=3D"mailto:scody@google.com" target=3D"_b=
lank">scody@google.com</a>&gt;, OpenBMC Maillist<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a>&gt;, Brad Bishop &lt;<a href=3D"mailto:bradleyb@=
fuzziesquirrel.com" target=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;<b=
r>Subject: Re: Proposing changes to the OpenBMC tree (to make<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 upstreaming easier)<br>Message-ID:<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;CAPw1Ef_dMf43e567LLAfMZp6khWWQAm=3D<a href=3D"mailto:i63LHfO=
wWkyiSe-MFA@mail.gmail.com" target=3D"_blank">i63LHfOwWkyiSe-MFA@mail.gmail=
.com</a>&gt;<br>Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>Ma=
in thoughts:<br>Message: 2<br>Date: Mon, 23 May 2022 14:07:55 -0700<br>From=
: John Broadbent &lt;<a href=3D"mailto:jebr@google.com" target=3D"_blank">j=
ebr@google.com</a>&gt;<br>To: Ed Tanous &lt;<a href=3D"mailto:edtanous@goog=
le.com" target=3D"_blank">edtanous@google.com</a>&gt;<br>Cc: Cody Smith &lt=
;<a href=3D"mailto:scody@google.com" target=3D"_blank">scody@google.com</a>=
&gt;, OpenBMC Maillist<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto=
:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&g=
t;, Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=
=3D"_blank">bradleyb@fuzziesquirrel.com</a>&gt;<br>Subject: Re: Proposing c=
hanges to the OpenBMC tree (to make<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 upstream=
ing easier)<br>Message-ID:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;CAPw1Ef_dMf43=
e567LLAfMZp6khWWQAm=3D<a href=3D"mailto:i63LHfOwWkyiSe-MFA@mail.gmail.com" =
target=3D"_blank">i63LHfOwWkyiSe-MFA@mail.gmail.com</a>&gt;<br>Content-Type=
: text/plain; charset=3D&quot;utf-8&quot;<br>Main thoughts:<br>We have seve=
ral patches that we apply to the project. When we update those<br>patches w=
e see a diff of the patches, and it can be difficult to review a<br>diff of=
 a diff.<br>I believe this new repo system would allow us to apply those pa=
tches to a<br>source tree, and manage/maintain the patches better.<br>&gt;=
=C2=A0 &quot;I have no interest in making this easier for you (if it is wor=
se in<br>other ways for the project).&quot;=C2=A0 =C2=A0- referring to down=
stream only features.<br>This is the wrong way to view features the communi=
ty does not want, and<br>features we would not be allowed to share. There i=
s a layer of complexity<br>that we use to integrate with our data centers s=
ervices that only we need.<br>A better model would allow openbmc to be flex=
ible enough to enable<br>downstream features.<br>Other thoughts:<br>=C2=A0 =
=C2=A0- I suppose it would make it easy for others to fork the project, but=
 I<br>=C2=A0 =C2=A0don&#39;t think that is a strong enough reason to preven=
t consolidation.<br>=C2=A0 =C2=A0- The consolidation would make it easier t=
o bring new people up to<br>=C2=A0 =C2=A0speed. (the system we have works f=
ine, but I suspect the consolidation will<br>=C2=A0 =C2=A0be a improvement)=
<br>=C2=A0 =C2=A0- We are not changing OWNERS in the change.<br>=C2=A0 =C2=
=A0- Applications vs distribution: I have always viewed openbmc as a<br>=C2=
=A0 =C2=A0collection of application services/applications, combined with a =
distros.<br>On Mon, May 23, 2022 at 9:38 AM Ed Tanous &lt;<a href=3D"mailto=
:edtanous@google.com" target=3D"_blank">edtanous@google.com</a>&gt; wrote:<=
br>&gt; On Thu, May 19, 2022 at 2:12 PM Cody Smith &lt;<a href=3D"mailto:sc=
ody@google.com" target=3D"_blank">scody@google.com</a>&gt; wrote:<br>&gt; &=
gt;<br>&gt; &gt; I don&#39;t seem to have the original message, so this may=
 get added to<br>&gt; Andrew&#39;s branch of this thread. Sorry about that =
in advance.<br>&gt;<br>&gt; The original message got caught in a lot of peo=
ples spam filters, I&#39;m<br>&gt; hoping that explains some of the lack of=
 reply to the initial<br>&gt; proposal.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; I=
n general I support moving to a monorepo. We at Google do this, and my<br>&=
gt; significant other at Airbnb also utilizes a monorepo. The advantages ar=
e<br>&gt; significant, as the world gets a lot less silo&#39;d and making c=
hanges that<br>&gt; would have spanned across multiple repos now only span =
the monorepo. This<br>&gt; is particularly useful when feature X requires c=
hanges to repo A, B and C,<br>&gt; and the changes on their own break thing=
s but shipped together are just<br>&gt; fine. I don&#39;t even really know =
how such a feature gets shipped today to be<br>&gt; honest.<br>&gt;<br>&gt;=
 I agree with your general sentiment, although a couple nitpicks, what<br>&=
gt; I propose above isn&#39;t pure &quot;monorepo&quot; and more analogous =
to<br>&gt; &quot;consolidate a lot of the repos&quot;.=C2=A0 FWIW, although=
 I really think it&#39;s<br>&gt; the right thing to do, &quot;other compani=
es do it for other things&quot; isn&#39;t<br>&gt; the best of arguments we =
can make for this.=C2=A0 There are plenty of<br>&gt; counter examples of co=
mpanies with much more entrenched command chains<br>&gt; that use multiple =
repos and the creation of repos as a form of project<br>&gt; management to =
great effect.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; The other thing that tends =
to happen with monorepos is a lot more<br>&gt; conformity, as reviews are c=
arried out by a larger set of people.<br>&gt;<br>&gt; +1.=C2=A0 Applying co=
nsistent clang-format to the codebase for example<br>&gt; would be a lot mo=
re trivial.<br>&gt;<br>&gt; &gt; Suddenly `bmcweb` is being reviewed by peo=
ple who may not have<br>&gt; previously cared about or touched that part of=
 the codebase as a bad<br>&gt; example. At a minimum more people will have =
eyes on the changes happening.<br>&gt; &gt;<br>&gt; &gt; I also think that =
a monorepo avoids one maintainer &quot;lording&quot; over a<br>&gt; repo. I=
t happens, the +2ers kind of play a role of the bridge troll, when<br>&gt; =
repo X only has 1-2 +2ers, this can be a real problem. A monorepo with 10+<=
br>&gt; +2ers will force the +2ers to engage in debate when they disagree w=
ith each<br>&gt; other, instead of lording over their own kingdoms and havi=
ng no influence<br>&gt; over other kingdoms so to speak.<br>&gt;<br>&gt; In=
 what I propose, I don&#39;t really think this changes given that the<br>&g=
t; existing OWNERS files would still be largely the same, although I<br>&gt=
; agree, more +2er debate would be a good thing if it was the result.<br>&g=
t;<br>&gt; &gt;<br>&gt; &gt; I haven&#39;t made a great set of arguments he=
re but in general I feel like<br>&gt; a chance like this would help from an=
 organizational perspective and maybe<br>&gt; with that better org. in plac=
e maybe we can begin addressing some of the<br>&gt; other issues we need to=
 address.<br>&gt;<br>&gt; Thanks for your input.<br>&gt;<br>&gt; PS, plaint=
ext is generally prefered on this ML, given that it diffs<br>&gt; better in=
 the tools.=C2=A0 (Click triple dot in the lower right of gmail,<br>&gt; th=
en check &quot;plain text mode&quot;).<br>&gt;<br>&gt; &gt;<br>&gt; &gt; Co=
dy Smith<br>&gt; &gt; System Software Engineer<br>&gt; &gt; Google Cloud Pl=
atform Core Services Team<br>&gt; &gt;=C2=A0<a href=3D"mailto:scody@google.=
com" target=3D"_blank">scody@google.com<br></a>&gt; &gt;=C2=A0<a href=3D"te=
l:(720)%20515-6105" value=3D"+17205156105" target=3D"_blank">720-515-6105</=
a>=C2=A0&lt;(720)%20515-6105&gt;<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt;<br>=
&gt; &gt; On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery &lt;<a href=3D"mail=
to:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>&gt=
; &gt;&gt;<br>&gt; &gt;&gt; Hi Ed,<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; I thin=
k what&#39;s below largely points to a bit of an identity crisis for<br>&gt=
; &gt;&gt; the project, on a couple of fronts. Fundamentally OpenBMC is a d=
istro<br>&gt; &gt;&gt; (or as Yocto likes to point out, a meta-distro), and=
 we can:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; 1. Identify as a traditional OSS=
 distro: An integration of otherwise<br>&gt; &gt;&gt;=C2=A0 =C2=A0 independ=
ent applications<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; 2. Identify as an applia=
nce distro: The distro and the<br>&gt; &gt;&gt;=C2=A0 =C2=A0 applications a=
re a monolith<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; You&#39;re proposing 2, whi=
le I think there exists some tension towards 1.<br>&gt; &gt;&gt;<br>&gt; &g=
t;&gt; With the amount of custom userspace we&#39;ve always kinda sat in-be=
tween.<br>&gt; &gt;&gt; I&#39;d like to see libraries and applications that=
 have use cases outside<br>&gt; &gt;&gt; of OpenBMC be accessible to people=
 with those external use cases,<br>&gt; &gt;&gt; without being burdened by =
understanding the rest of the OpenBMC context.<br>&gt; &gt;&gt; I have a co=
ncern that by integrating things in the way you&#39;re proposing<br>&gt; &g=
t;&gt; it will lead to more inertia there (e.g. for implementations of<br>&=
gt; &gt;&gt; standards MCTP or PLDM (libmctp and libpldm)).<br>&gt; &gt;&gt=
;<br>&gt; &gt;&gt; On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:<br>&gt; &=
gt;&gt; &gt; The OpenBMC development process as it stands is difficult for =
people<br>&gt; &gt;&gt; &gt; new to the project to understand, which severe=
ly limits our ability to<br>&gt; &gt;&gt; &gt; onboard new maintainers, dev=
elopers, and groups which would otherwise<br>&gt; &gt;&gt; &gt; contribute =
major features to upstream, but don&#39;t have the technical<br>&gt; &gt;&g=
t; &gt; expertise to do so.=C2=A0 This initiative, much like others before =
it[1] is<br>&gt; &gt;&gt; &gt; attempting to reduce the toil and OpenBMC-sp=
ecific processes of<br>&gt; &gt;&gt; &gt; passing changes amongst the commu=
nity, and move things to being more<br>&gt; &gt;&gt; &gt; like other projec=
ts that have largely solved this problem already.<br>&gt; &gt;&gt;<br>&gt; =
&gt;&gt; Can you be more specific about which projects here? Do you have li=
nks<br>&gt; &gt;&gt; to examples?<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;<br=
>&gt; &gt;&gt; &gt; To that end, I&#39;d like to propose a change to the wa=
y we structure our<br>&gt; &gt;&gt; &gt; repositories within the project: s=
pecifically, putting (almost) all of<br>&gt; &gt;&gt; &gt; the Linux Founda=
tion OpenBMC owned code into a single repo that we can<br>&gt; &gt;&gt; &gt=
; version as a single entity, rather than spreading out amongst many<br>&gt=
; &gt;&gt; &gt; repos.=C2=A0 In practice, this would have some significant =
advantages:<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; - The tree would be=
 easily shareable amongst the various people<br>&gt; &gt;&gt; &gt; working =
on OpenBMC, without having to rely on a single-source Gerrit<br>&gt; &gt;&g=
t; &gt; instance.=C2=A0 Git is designed to be distributed, but if our recip=
e files<br>&gt; &gt;&gt; &gt; point at other repositories, it largely defea=
ts a lot of this<br>&gt; &gt;&gt; &gt; capability.=C2=A0 Today, if you want=
 to share a tree that has a change in<br>&gt; &gt;&gt; &gt; it, you have to=
 fork the main tree, then fork every single subproject<br>&gt; &gt;&gt; &gt=
; you&#39;ve made modifications to, then update the main tree to point to<b=
r>&gt; &gt;&gt; &gt; your forks.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; This isn=
&#39;t true, as you can add patches in the OpenBMC tree.<br>&gt; &gt;&gt;<b=
r>&gt; &gt;&gt; CI prevents these from being submitted, as it should, but t=
here&#39;s<br>&gt; nothing to<br>&gt; &gt;&gt; stop anyone using the `devto=
ol modify ...` / `devtool finish ...` and<br>&gt; &gt;&gt; committing the r=
esult as a workflow to exchange state (I do this)?<br>&gt; &gt;&gt;<br>&gt;=
 &gt;&gt; Is the issue instead with devtool? Is it bad? Is the learning cur=
ve too<br>&gt; steep?<br>&gt; &gt;&gt; It is at least the Yocto workflow.<b=
r>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt; This gets very onerous over time, esp=
ecially for simple<br>&gt; &gt;&gt; &gt; commits.=C2=A0 Having maintained s=
everal different companies forks<br>&gt; &gt;&gt; &gt; personally, and spok=
en to many others having problems with the same,<br>&gt; &gt;&gt; &gt; addi=
ng major features are difficult to test and rebase because of<br>&gt; &gt;&=
gt; &gt; this.=C2=A0 Moving the code to a single tree makes a lot of the to=
il of<br>&gt; &gt;&gt; &gt; tagging and modifying local trees a lot more ma=
nageable, as a series<br>&gt; &gt;&gt; &gt; of well-documented git commands=
 (generally git rebase[2]).=C2=A0 It also<br>&gt; &gt;&gt; &gt; increases t=
he likelihood that someone pulls down the fork to test it<br>&gt; &gt;&gt; =
&gt; if it&#39;s highly likely that they can apply it to their own tree in =
a<br>&gt; &gt;&gt; &gt; single command.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; A=
gain, this is moot if the patches are applied in-tree.<br>&gt; &gt;&gt;<br>=
&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; - There would be a reduction in re=
views.=C2=A0 Today, anytime a person<br>&gt; &gt;&gt; &gt; wants to make a =
change that would involve any part of the tree,<br>&gt; &gt;&gt; &gt; there=
&#39;s at least 2 code reviews, one for the commit, and one for the<br>&gt;=
 &gt;&gt; &gt; recipe bump.=C2=A0 Compared to a single tree, this at least =
doubles the<br>&gt; &gt;&gt; &gt; number of reviews we need to process.<br>=
&gt; &gt;&gt;<br>&gt; &gt;&gt; Is there more work? Yes.<br>&gt; &gt;&gt;<br=
>&gt; &gt;&gt; Is it always double? No. Is it sometimes double? Yes.<br>&gt=
; &gt;&gt;<br>&gt; &gt;&gt; Often bumps batch multiple application commits.=
 I think this paragraph<br>&gt; &gt;&gt; overstates the problem somewhat, b=
ut what it does get right is<br>&gt; &gt;&gt; identifying that *some* overh=
ead exists.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;=C2=A0 For changes that w=
ant to make<br>&gt; &gt;&gt; &gt; any change to a few subsystems, as is the=
 case when developing a<br>&gt; &gt;&gt; &gt; feature, they require 2 X &lt=
;number of project changes&gt; reviews, all of<br>&gt; &gt;&gt; &gt; which =
need to be synchronized.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Same issue as ab=
ove here.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt; There is a well documented=
 problem<br>&gt; &gt;&gt; &gt; where we have no official way to synchronize=
 merging of changes to<br>&gt; &gt;&gt; &gt; userspace applications within =
a bump without manual human<br>&gt; &gt;&gt; &gt; intervention.=C2=A0 This =
would largely render that problem moot.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; R=
ight, this can be hard to handle.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; It can =
be mitigated by versioning interfaces (which the D-Bus spec<br>&gt; &gt;&gt=
; calls out[6][7] but OpenBMC fails to do (?)) and supporting multiple<br>&=
gt; &gt;&gt; interfaces for the transition period.<br>&gt; &gt;&gt;<br>&gt;=
 &gt;&gt; That said, that&#39;s also more work, and so needs to be consider=
ed in the<br>&gt; &gt;&gt; set of trade-offs.<br>&gt; &gt;&gt;<br>&gt; &gt;=
&gt; [6]<br>&gt;=C2=A0<a href=3D"https://dbus.freedesktop.org/doc/dbus-spec=
ification.html#message-protocol-names-interface" rel=3D"noreferrer" target=
=3D"_blank">https://dbus.freedesktop.org/doc/dbus-specification.html#messag=
e-protocol-names-interface<br></a>&gt; &gt;&gt; [7]<br>&gt;=C2=A0<a href=3D=
"https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-=
names-bus" rel=3D"noreferrer" target=3D"_blank">https://dbus.freedesktop.or=
g/doc/dbus-specification.html#message-protocol-names-bus<br></a>&gt; &gt;&g=
t;<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; - It would allow most develo=
pers to not need to understand Yocto at<br>&gt; &gt;&gt; &gt; all to do the=
ir day to day work on existing applications.=C2=A0 No more<br>&gt; &gt;&gt;=
 &gt; &quot;devtool modify&quot;, and related SRCREV bumps.=C2=A0 This will=
 help most of<br>&gt; &gt;&gt; &gt; the new developers on the project with =
a lower mental load, which will<br>&gt; &gt;&gt; &gt; mean people are able =
to ramp up faster..<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Okay. So devtool is s=
een as an issue.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Can we improve its visib=
ility and any education around it? Or is it a<br>&gt; &gt;&gt; lost cause? =
If so, why?<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Separately, I&#39;m concerned=
 this is an attempt to shield people from<br>&gt; &gt;&gt; skills that help=
 them work with upstream Yocto. OpenBMC feels like it&#39;s<br>&gt; &gt;&gt=
; a bit of an on-ramp for open-source contributions for people who have<br>=
&gt; &gt;&gt; worked in what was previously quite a proprietary environment=
. We tried<br>&gt; &gt;&gt; shielding people in the past wrt kernel contrib=
utions, and that failed<br>&gt; &gt;&gt; pretty spectacularly. We (at least=
 Joel and I) now encourage people to<br>&gt; &gt;&gt; work with upstream di=
rectly *and support them in the process of doing<br>&gt; &gt;&gt; that* rat=
her than trying to mitigate some of the difficulties with<br>&gt; &gt;&gt; =
working upstream by avoiding them.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;<b=
r>&gt; &gt;&gt; &gt; - It would give an opportunity for individuals and com=
panies to &quot;own&quot;<br>&gt; &gt;&gt; &gt; well-supported public forks=
 (ie Redhat) of the codebase, which would<br>&gt; &gt;&gt; &gt; increase pa=
rticipation in the project overall.=C2=A0 This already happens<br>&gt; &gt;=
&gt; &gt; quite a bit, but in practice, the forks that do it squash history=
,<br>&gt; &gt;&gt; &gt; making it nearly impossible to get their changes up=
streamed from an<br>&gt; &gt;&gt; &gt; outside entity.<br>&gt; &gt;&gt;<br>=
&gt; &gt;&gt; Not sure this is something we want to encourage, even if it h=
appens in<br>&gt; &gt;&gt; practice.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;=
<br>&gt; &gt;&gt; &gt; - It would centralize the bug databases.=C2=A0 Today=
, bugs filed against<br>&gt; &gt;&gt; &gt; sub projects tend to not get ans=
wered.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Do you have some numbers handy?<br=
>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt; Having all the bugs in<br>&gt; &gt;&gt=
; &gt; openbmc/openbmc would help in the future to avoid duplicating bugs<b=
r>&gt; &gt;&gt; &gt; across projects.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Has=
 this actually been a problem?<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;<br>&g=
t; &gt;&gt; &gt; - Would increase the likelihood that someone contributes a=
 patch,<br>&gt; &gt;&gt; &gt; especially a patch written by someone else.=
=C2=A0 If contributing a patch<br>&gt; &gt;&gt; &gt; was just a matter of c=
herry-picking a tree of commits and submitting<br>&gt; &gt;&gt; &gt; it to =
gerrit, it&#39;s a lot more likely that people would do it.<br>&gt; &gt;&gt=
;<br>&gt; &gt;&gt; It sounds plausible, but again, some evidence for this w=
ould be helpful.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Why is this easier than =
submitting the patches to the application repo?<br>&gt; &gt;&gt;<br>&gt; &g=
t;&gt; &gt; My proposed version of this tree is pushed to a github fork her=
e, and<br>&gt; &gt;&gt; &gt; is based on the tree from a few weeks ago:<br>=
&gt; &gt;&gt; &gt;=C2=A0<a href=3D"https://github.com/edtanous/openbmc" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/edtanous/openbmc<br></=
a>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; It implements all the above for =
the main branch.=C2=A0 This tree is based<br>&gt; &gt;&gt; &gt; on the outp=
ut of the automated tooling, and in the case where this<br>&gt; &gt;&gt; &g=
t; proposal is accepted, the tooling would be re-run to capture the state<b=
r>&gt; &gt;&gt; &gt; of the tree at the point where we chose to make this c=
hange.<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; The tool I wrote to gene=
rate this tree is also published, if you&#39;re<br>&gt; &gt;&gt; &gt; inter=
ested in how this tree was built, and is quite interesting in its<br>&gt; &=
gt;&gt; &gt; use of git export/import [5], but functionally, I would not ex=
pect<br>&gt; &gt;&gt; &gt; that tooling to survive after this transition is=
 made.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; I think it would be good to captur=
e the script in openbmc-tools if we<br>&gt; &gt;&gt; choose to go ahead wit=
h this, mainly as a record of how we achieved it.<br>&gt; &gt;&gt;<br>&gt; =
&gt;&gt; Andrew<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt=
; [1]<br>&gt; &gt;&gt; &gt;<br>&gt;=C2=A0<a href=3D"https://lore.kernel.org=
/openbmc/CACWQX821ADQCrekLj_bGAu=3D1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.c=
om/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/openbmc/C=
ACWQX821ADQCrekLj_bGAu=3D1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/<br></a=
>&gt; &gt;&gt; &gt; [2]=C2=A0<a href=3D"https://git-scm.com/docs/git-rebase=
" rel=3D"noreferrer" target=3D"_blank">https://git-scm.com/docs/git-rebase<=
br></a>&gt; &gt;&gt; &gt; [3]<br>&gt; &gt;&gt; &gt;<br>&gt;=C2=A0<a href=3D=
"https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-nami=
ng" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/docs/bl=
ob/master/CONTRIBUTING.md#inclusive-naming<br></a>&gt; &gt;&gt; &gt; [4]<br=
>&gt; &gt;&gt; &gt;<br>&gt;=C2=A0<a href=3D"https://www.yoctoproject.org/do=
cs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc" rel=3D"noreferre=
r" target=3D"_blank">https://www.yoctoproject.org/docs/1.8/ref-manual/ref-m=
anual.html#ref-classes-externalsrc<br></a>&gt; &gt;&gt; &gt; [5]=C2=A0<a hr=
ef=3D"https://github.com/edtanous/obmc-repo-combine/blob/main/combine" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/edtanous/obmc-repo-com=
bine/blob/main/combine<br></a>&gt;<br>We have several patches that we apply=
 to the project. When we update those<br>patches we see a diff of the patch=
es, and it can be difficult to review a<br>diff of a diff.<br>I believe thi=
s new repo system would allow us to apply those patches to a<br>source tree=
, and manage/maintain the patches better.<br>&gt;=C2=A0 &quot;I have no int=
erest in making this easier for you (if it is worse in<br>other ways for th=
e project).&quot;=C2=A0 =C2=A0- referring to downstream only features.</blo=
ckquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is the wrong=
 way to view features the community does not want, and<br>features we would=
 not be allowed to share. There is a layer of complexity<br>that we use to =
integrate with our data centers services that only we need.<br>A better mod=
el would allow openbmc to be flexible enough to enable<br>downstream featur=
es.<br>Other thoughts:<br>=C2=A0 =C2=A0- I suppose it would make it easy fo=
r others to fork the project, but I<br>=C2=A0 =C2=A0don&#39;t think that is=
 a strong enough reason to prevent consolidation.<br>=C2=A0 =C2=A0- The con=
solidation would make it easier to bring new people up to<br>=C2=A0 =C2=A0s=
peed. (the system we have works fine, but I suspect the consolidation will<=
br>=C2=A0 =C2=A0be a improvement)<br>=C2=A0 =C2=A0- We are not changing OWN=
ERS in the change.<br>=C2=A0 =C2=A0- Applications vs distribution: I have a=
lways viewed openbmc as a<br>=C2=A0 =C2=A0collection of application service=
s/applications, combined with a distros.<br>On Mon, May 23, 2022 at 9:38 AM=
 Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com" target=3D"_blank">edt=
anous@google.com</a>&gt; wrote:<br>&gt; On Thu, May 19, 2022 at 2:12 PM Cod=
y Smith &lt;<a href=3D"mailto:scody@google.com" target=3D"_blank">scody@goo=
gle.com</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt; I don&#39;t seem to have t=
he original message, so this may get added to<br>&gt; Andrew&#39;s branch o=
f this thread. Sorry about that in advance.<br>&gt;<br>&gt; The original me=
ssage got caught in a lot of peoples spam filters, I&#39;m<br>&gt; hoping t=
hat explains some of the lack of reply to the initial<br>&gt; proposal.<br>=
&gt;<br>&gt; &gt;<br>&gt; &gt; In general I support moving to a monorepo. W=
e at Google do this, and my<br>&gt; significant other at Airbnb also utiliz=
es a monorepo. The advantages are<br>&gt; significant, as the world gets a =
lot less silo&#39;d and making changes that<br>&gt; would have spanned acro=
ss multiple repos now only span the monorepo. This<br>&gt; is particularly =
useful when feature X requires changes to repo A, B and C,<br>&gt; and the =
changes on their own break things but shipped together are just<br>&gt; fin=
e. I don&#39;t even really know how such a feature gets shipped today to be=
<br>&gt; honest.<br>&gt;<br>&gt; I agree with your general sentiment, altho=
ugh a couple nitpicks, what<br>&gt; I propose above isn&#39;t pure &quot;mo=
norepo&quot; and more analogous to<br>&gt; &quot;consolidate a lot of the r=
epos&quot;.=C2=A0 FWIW, although I really think it&#39;s<br>&gt; the right =
thing to do, &quot;other companies do it for other things&quot; isn&#39;t<b=
r>&gt; the best of arguments we can make for this.=C2=A0 There are plenty o=
f<br>&gt; counter examples of companies with much more entrenched command c=
hains<br>&gt; that use multiple repos and the creation of repos as a form o=
f project<br>&gt; management to great effect.<br>&gt;<br>&gt; &gt;<br>&gt; =
&gt; The other thing that tends to happen with monorepos is a lot more<br>&=
gt; conformity, as reviews are carried out by a larger set of people.<br>&g=
t;<br>&gt; +1.=C2=A0 Applying consistent clang-format to the codebase for e=
xample<br>&gt; would be a lot more trivial.<br>&gt;<br>&gt; &gt; Suddenly `=
bmcweb` is being reviewed by people who may not have<br>&gt; previously car=
ed about or touched that part of the codebase as a bad<br>&gt; example. At =
a minimum more people will have eyes on the changes happening.<br>&gt; &gt;=
<br>&gt; &gt; I also think that a monorepo avoids one maintainer &quot;lord=
ing&quot; over a<br>&gt; repo. It happens, the +2ers kind of play a role of=
 the bridge troll, when<br>&gt; repo X only has 1-2 +2ers, this can be a re=
al problem. A monorepo with 10+<br>&gt; +2ers will force the +2ers to engag=
e in debate when they disagree with each<br>&gt; other, instead of lording =
over their own kingdoms and having no influence<br>&gt; over other kingdoms=
 so to speak.<br>&gt;<br>&gt; In what I propose, I don&#39;t really think t=
his changes given that the<br>&gt; existing OWNERS files would still be lar=
gely the same, although I<br>&gt; agree, more +2er debate would be a good t=
hing if it was the result.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; I haven&#39;t =
made a great set of arguments here but in general I feel like<br>&gt; a cha=
nce like this would help from an organizational perspective and maybe<br>&g=
t; with that better org. in place maybe we can begin addressing some of the=
<br>&gt; other issues we need to address.<br>&gt;<br>&gt; Thanks for your i=
nput.<br>&gt;<br>&gt; PS, plaintext is generally prefered on this ML, given=
 that it diffs<br>&gt; better in the tools.=C2=A0 (Click triple dot in the =
lower right of gmail,<br>&gt; then check &quot;plain text mode&quot;).<br>&=
gt;<br>&gt; &gt;<br>&gt; &gt; Cody Smith<br>&gt; &gt; System Software Engin=
eer<br>&gt; &gt; Google Cloud Platform Core Services Team<br>&gt; &gt;=C2=
=A0<a href=3D"mailto:scody@google.com" target=3D"_blank">scody@google.com<b=
r></a>&gt; &gt;=C2=A0<a href=3D"tel:(720)%20515-6105" value=3D"+17205156105=
" target=3D"_blank">720-515-6105</a>=C2=A0&lt;(720)%20515-6105&gt;<br>&gt; =
&gt;<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; On Tue, Apr 5, 2022 at 7:22 PM =
Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_blank">and=
rew@aj.id.au</a>&gt; wrote:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Hi Ed,<br>&gt=
; &gt;&gt;<br>&gt; &gt;&gt; I think what&#39;s below largely points to a bi=
t of an identity crisis for<br>&gt; &gt;&gt; the project, on a couple of fr=
onts. Fundamentally OpenBMC is a distro<br>&gt; &gt;&gt; (or as Yocto likes=
 to point out, a meta-distro), and we can:<br>&gt; &gt;&gt;<br>&gt; &gt;&gt=
; 1. Identify as a traditional OSS distro: An integration of otherwise<br>&=
gt; &gt;&gt;=C2=A0 =C2=A0 independent applications<br>&gt; &gt;&gt;<br>&gt;=
 &gt;&gt; 2. Identify as an appliance distro: The distro and the<br>&gt; &g=
t;&gt;=C2=A0 =C2=A0 applications are a monolith<br>&gt; &gt;&gt;<br>&gt; &g=
t;&gt; You&#39;re proposing 2, while I think there exists some tension towa=
rds 1.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; With the amount of custom userspac=
e we&#39;ve always kinda sat in-between.<br>&gt; &gt;&gt; I&#39;d like to s=
ee libraries and applications that have use cases outside<br>&gt; &gt;&gt; =
of OpenBMC be accessible to people with those external use cases,<br>&gt; &=
gt;&gt; without being burdened by understanding the rest of the OpenBMC con=
text.<br>&gt; &gt;&gt; I have a concern that by integrating things in the w=
ay you&#39;re proposing<br>&gt; &gt;&gt; it will lead to more inertia there=
 (e.g. for implementations of<br>&gt; &gt;&gt; standards MCTP or PLDM (libm=
ctp and libpldm)).<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; On Tue, 5 Apr 2022, at=
 03:58, Ed Tanous wrote:<br>&gt; &gt;&gt; &gt; The OpenBMC development proc=
ess as it stands is difficult for people<br>&gt; &gt;&gt; &gt; new to the p=
roject to understand, which severely limits our ability to<br>&gt; &gt;&gt;=
 &gt; onboard new maintainers, developers, and groups which would otherwise=
<br>&gt; &gt;&gt; &gt; contribute major features to upstream, but don&#39;t=
 have the technical<br>&gt; &gt;&gt; &gt; expertise to do so.=C2=A0 This in=
itiative, much like others before it[1] is<br>&gt; &gt;&gt; &gt; attempting=
 to reduce the toil and OpenBMC-specific processes of<br>&gt; &gt;&gt; &gt;=
 passing changes amongst the community, and move things to being more<br>&g=
t; &gt;&gt; &gt; like other projects that have largely solved this problem =
already.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Can you be more specific about w=
hich projects here? Do you have links<br>&gt; &gt;&gt; to examples?<br>&gt;=
 &gt;&gt;<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; To that end, I&#39;d =
like to propose a change to the way we structure our<br>&gt; &gt;&gt; &gt; =
repositories within the project: specifically, putting (almost) all of<br>&=
gt; &gt;&gt; &gt; the Linux Foundation OpenBMC owned code into a single rep=
o that we can<br>&gt; &gt;&gt; &gt; version as a single entity, rather than=
 spreading out amongst many<br>&gt; &gt;&gt; &gt; repos.=C2=A0 In practice,=
 this would have some significant advantages:<br>&gt; &gt;&gt; &gt;<br>&gt;=
 &gt;&gt; &gt; - The tree would be easily shareable amongst the various peo=
ple<br>&gt; &gt;&gt; &gt; working on OpenBMC, without having to rely on a s=
ingle-source Gerrit<br>&gt; &gt;&gt; &gt; instance.=C2=A0 Git is designed t=
o be distributed, but if our recipe files<br>&gt; &gt;&gt; &gt; point at ot=
her repositories, it largely defeats a lot of this<br>&gt; &gt;&gt; &gt; ca=
pability.=C2=A0 Today, if you want to share a tree that has a change in<br>=
&gt; &gt;&gt; &gt; it, you have to fork the main tree, then fork every sing=
le subproject<br>&gt; &gt;&gt; &gt; you&#39;ve made modifications to, then =
update the main tree to point to<br>&gt; &gt;&gt; &gt; your forks.<br>&gt; =
&gt;&gt;<br>&gt; &gt;&gt; This isn&#39;t true, as you can add patches in th=
e OpenBMC tree.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; CI prevents these from be=
ing submitted, as it should, but there&#39;s<br>&gt; nothing to<br>&gt; &gt=
;&gt; stop anyone using the `devtool modify ...` / `devtool finish ...` and=
<br>&gt; &gt;&gt; committing the result as a workflow to exchange state (I =
do this)?<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Is the issue instead with devto=
ol? Is it bad? Is the learning curve too<br>&gt; steep?<br>&gt; &gt;&gt; It=
 is at least the Yocto workflow.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt; Thi=
s gets very onerous over time, especially for simple<br>&gt; &gt;&gt; &gt; =
commits.=C2=A0 Having maintained several different companies forks<br>&gt; =
&gt;&gt; &gt; personally, and spoken to many others having problems with th=
e same,<br>&gt; &gt;&gt; &gt; adding major features are difficult to test a=
nd rebase because of<br>&gt; &gt;&gt; &gt; this.=C2=A0 Moving the code to a=
 single tree makes a lot of the toil of<br>&gt; &gt;&gt; &gt; tagging and m=
odifying local trees a lot more manageable, as a series<br>&gt; &gt;&gt; &g=
t; of well-documented git commands (generally git rebase[2]).=C2=A0 It also=
<br>&gt; &gt;&gt; &gt; increases the likelihood that someone pulls down the=
 fork to test it<br>&gt; &gt;&gt; &gt; if it&#39;s highly likely that they =
can apply it to their own tree in a<br>&gt; &gt;&gt; &gt; single command.<b=
r>&gt; &gt;&gt;<br>&gt; &gt;&gt; Again, this is moot if the patches are app=
lied in-tree.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; =
- There would be a reduction in reviews.=C2=A0 Today, anytime a person<br>&=
gt; &gt;&gt; &gt; wants to make a change that would involve any part of the=
 tree,<br>&gt; &gt;&gt; &gt; there&#39;s at least 2 code reviews, one for t=
he commit, and one for the<br>&gt; &gt;&gt; &gt; recipe bump.=C2=A0 Compare=
d to a single tree, this at least doubles the<br>&gt; &gt;&gt; &gt; number =
of reviews we need to process.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Is there m=
ore work? Yes.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Is it always double? No. I=
s it sometimes double? Yes.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Often bumps b=
atch multiple application commits. I think this paragraph<br>&gt; &gt;&gt; =
overstates the problem somewhat, but what it does get right is<br>&gt; &gt;=
&gt; identifying that *some* overhead exists.<br>&gt; &gt;&gt;<br>&gt; &gt;=
&gt; &gt;=C2=A0 For changes that want to make<br>&gt; &gt;&gt; &gt; any cha=
nge to a few subsystems, as is the case when developing a<br>&gt; &gt;&gt; =
&gt; feature, they require 2 X &lt;number of project changes&gt; reviews, a=
ll of<br>&gt; &gt;&gt; &gt; which need to be synchronized.<br>&gt; &gt;&gt;=
<br>&gt; &gt;&gt; Same issue as above here.<br>&gt; &gt;&gt;<br>&gt; &gt;&g=
t; &gt; There is a well documented problem<br>&gt; &gt;&gt; &gt; where we h=
ave no official way to synchronize merging of changes to<br>&gt; &gt;&gt; &=
gt; userspace applications within a bump without manual human<br>&gt; &gt;&=
gt; &gt; intervention.=C2=A0 This would largely render that problem moot.<b=
r>&gt; &gt;&gt;<br>&gt; &gt;&gt; Right, this can be hard to handle.<br>&gt;=
 &gt;&gt;<br>&gt; &gt;&gt; It can be mitigated by versioning interfaces (wh=
ich the D-Bus spec<br>&gt; &gt;&gt; calls out[6][7] but OpenBMC fails to do=
 (?)) and supporting multiple<br>&gt; &gt;&gt; interfaces for the transitio=
n period.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; That said, that&#39;s also more=
 work, and so needs to be considered in the<br>&gt; &gt;&gt; set of trade-o=
ffs.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; [6]<br>&gt;=C2=A0<a href=3D"https://=
dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-int=
erface" rel=3D"noreferrer" target=3D"_blank">https://dbus.freedesktop.org/d=
oc/dbus-specification.html#message-protocol-names-interface<br></a>&gt; &gt=
;&gt; [7]<br>&gt;=C2=A0<a href=3D"https://dbus.freedesktop.org/doc/dbus-spe=
cification.html#message-protocol-names-bus" rel=3D"noreferrer" target=3D"_b=
lank">https://dbus.freedesktop.org/doc/dbus-specification.html#message-prot=
ocol-names-bus<br></a>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; =
&gt; - It would allow most developers to not need to understand Yocto at<br=
>&gt; &gt;&gt; &gt; all to do their day to day work on existing application=
s.=C2=A0 No more<br>&gt; &gt;&gt; &gt; &quot;devtool modify&quot;, and rela=
ted SRCREV bumps.=C2=A0 This will help most of<br>&gt; &gt;&gt; &gt; the ne=
w developers on the project with a lower mental load, which will<br>&gt; &g=
t;&gt; &gt; mean people are able to ramp up faster..<br>&gt; &gt;&gt;<br>&g=
t; &gt;&gt; Okay. So devtool is seen as an issue.<br>&gt; &gt;&gt;<br>&gt; =
&gt;&gt; Can we improve its visibility and any education around it? Or is i=
t a<br>&gt; &gt;&gt; lost cause? If so, why?<br>&gt; &gt;&gt;<br>&gt; &gt;&=
gt; Separately, I&#39;m concerned this is an attempt to shield people from<=
br>&gt; &gt;&gt; skills that help them work with upstream Yocto. OpenBMC fe=
els like it&#39;s<br>&gt; &gt;&gt; a bit of an on-ramp for open-source cont=
ributions for people who have<br>&gt; &gt;&gt; worked in what was previousl=
y quite a proprietary environment. We tried<br>&gt; &gt;&gt; shielding peop=
le in the past wrt kernel contributions, and that failed<br>&gt; &gt;&gt; p=
retty spectacularly. We (at least Joel and I) now encourage people to<br>&g=
t; &gt;&gt; work with upstream directly *and support them in the process of=
 doing<br>&gt; &gt;&gt; that* rather than trying to mitigate some of the di=
fficulties with<br>&gt; &gt;&gt; working upstream by avoiding them.<br>&gt;=
 &gt;&gt;<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; - It would give an op=
portunity for individuals and companies to &quot;own&quot;<br>&gt; &gt;&gt;=
 &gt; well-supported public forks (ie Redhat) of the codebase, which would<=
br>&gt; &gt;&gt; &gt; increase participation in the project overall.=C2=A0 =
This already happens<br>&gt; &gt;&gt; &gt; quite a bit, but in practice, th=
e forks that do it squash history,<br>&gt; &gt;&gt; &gt; making it nearly i=
mpossible to get their changes upstreamed from an<br>&gt; &gt;&gt; &gt; out=
side entity.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Not sure this is something w=
e want to encourage, even if it happens in<br>&gt; &gt;&gt; practice.<br>&g=
t; &gt;&gt;<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; - It would centrali=
ze the bug databases.=C2=A0 Today, bugs filed against<br>&gt; &gt;&gt; &gt;=
 sub projects tend to not get answered.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; D=
o you have some numbers handy?<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt; Havin=
g all the bugs in<br>&gt; &gt;&gt; &gt; openbmc/openbmc would help in the f=
uture to avoid duplicating bugs<br>&gt; &gt;&gt; &gt; across projects.<br>&=
gt; &gt;&gt;<br>&gt; &gt;&gt; Has this actually been a problem?<br>&gt; &gt=
;&gt;<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; - Would increase the like=
lihood that someone contributes a patch,<br>&gt; &gt;&gt; &gt; especially a=
 patch written by someone else.=C2=A0 If contributing a patch<br>&gt; &gt;&=
gt; &gt; was just a matter of cherry-picking a tree of commits and submitti=
ng<br>&gt; &gt;&gt; &gt; it to gerrit, it&#39;s a lot more likely that peop=
le would do it.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; It sounds plausible, but =
again, some evidence for this would be helpful.<br>&gt; &gt;&gt;<br>&gt; &g=
t;&gt; Why is this easier than submitting the patches to the application re=
po?<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; &gt; My proposed version of this tree=
 is pushed to a github fork here, and<br>&gt; &gt;&gt; &gt; is based on the=
 tree from a few weeks ago:<br>&gt; &gt;&gt; &gt;=C2=A0<a href=3D"https://g=
ithub.com/edtanous/openbmc" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/edtanous/openbmc<br></a>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; I=
t implements all the above for the main branch.=C2=A0 This tree is based<br=
>&gt; &gt;&gt; &gt; on the output of the automated tooling, and in the case=
 where this<br>&gt; &gt;&gt; &gt; proposal is accepted, the tooling would b=
e re-run to capture the state<br>&gt; &gt;&gt; &gt; of the tree at the poin=
t where we chose to make this change.<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt=
; &gt; The tool I wrote to generate this tree is also published, if you&#39=
;re<br>&gt; &gt;&gt; &gt; interested in how this tree was built, and is qui=
te interesting in its<br>&gt; &gt;&gt; &gt; use of git export/import [5], b=
ut functionally, I would not expect<br>&gt; &gt;&gt; &gt; that tooling to s=
urvive after this transition is made.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; I t=
hink it would be good to capture the script in openbmc-tools if we<br>&gt; =
&gt;&gt; choose to go ahead with this, mainly as a record of how we achieve=
d it.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; Andrew<br>&gt; &gt;&gt;<br>&gt; &gt=
;&gt; &gt;<br>&gt; &gt;&gt; &gt; [1]<br>&gt; &gt;&gt; &gt;<br>&gt;=C2=A0<a =
href=3D"https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=3D1SSLCv5pT=
ee7jaoVo2Zs6havgnA@mail.gmail.com/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=3D1SSLCv5pTee7jaoVo2Z=
s6havgnA@mail.gmail.com/<br></a>&gt; &gt;&gt; &gt; [2]=C2=A0<a href=3D"http=
s://git-scm.com/docs/git-rebase" rel=3D"noreferrer" target=3D"_blank">https=
://git-scm.com/docs/git-rebase<br></a>&gt; &gt;&gt; &gt; [3]<br>&gt; &gt;&g=
t; &gt;<br>&gt;=C2=A0<a href=3D"https://github.com/openbmc/docs/blob/master=
/CONTRIBUTING.md#inclusive-naming" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming<b=
r></a>&gt; &gt;&gt; &gt; [4]<br>&gt; &gt;&gt; &gt;<br>&gt;=C2=A0<a href=3D"=
https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classe=
s-externalsrc" rel=3D"noreferrer" target=3D"_blank">https://www.yoctoprojec=
t.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc<br></a>&g=
t; &gt;&gt; &gt; [5]=C2=A0<a href=3D"https://github.com/edtanous/obmc-repo-=
combine/blob/main/combine" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/edtanous/obmc-repo-combine/blob/main/combine<br></a>&gt;</blockquot=
e></div>

--00000000000004f73605dfb62e45--
