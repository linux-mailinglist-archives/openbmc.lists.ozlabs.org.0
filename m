Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A61515314FD
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 18:38:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6NLd4QDJz3bl7
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 02:38:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mQAi/IAV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=mQAi/IAV; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6NLC24Ctz2ynL
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 02:38:09 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id r23so22221825wrr.2
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 09:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hZEOy8XQGpsAgLfumIkd7XPCvEzCP07vM+XqrStRkHM=;
 b=mQAi/IAV3JySvSbTc/3KS/GlbwumrOIVOyHJxv3XQxDEtKoPwFv0lvHJ4r7x1P6rgc
 dFV2Cjv7VDveYmVEIh7Q5aLsSp5Jb4/z/Gb8BQOsv3r9bk/+W8DbqUCE24VZhaotjSPr
 4sGKx3D1u3S58p+EE+E+0RhIPuRQUgjoiDEzFuO1rFDO4YKkYRXt4dAvRcxFfhhOt3ai
 KBOZDEapDlV0OKV/xpUGCMs2fHjSVd6omo/mvXQeugup7+m48X6bFWx7yniZgvdFz3nt
 6yjZKvaaXIv2/B4c2jntUF4UmPUx1Pni+pCil28iWr+bw/ogdVWnVUdZSC+8ZUkr823V
 x+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hZEOy8XQGpsAgLfumIkd7XPCvEzCP07vM+XqrStRkHM=;
 b=rgXpNQ1f3oyknBD3SOSLzerhieYzBrB+TF84EbhFhlnxjaf7D52JJns7elE2ihbO86
 PCJ7947U7qpT4a3xIUu5Zr3ZcEMsJHERZnvKFHvkUKxi3glkK+n1w6G4kmCthp6Bnspf
 8epEg0Ds6deNOqKM3XPnSzYxGF1tW4cwnkdtLVHmiul0oBkzlADjdQph07MS3UtyfZNM
 oeBI6jqiqsU75fPT5rDsot/P2uBjftSchR0w3LL9NZTryqKA5VtHVY5nB1MeTyyEMhj3
 LD/pMQ9OArTunE3x2Vc3MYiN9LlbtsepB3XLY9PbsNC7lA3Oq+KoQAOs8c47s11W7UaN
 Sjsw==
X-Gm-Message-State: AOAM530T8CLrwZhO97GNoTVjezeuGdt7uvn2y+9Gj1IdZdUy9qPyufuP
 yA4jRYv0cT2Muf+WoyBvyk37jjXMIJr52SmepabbKw==
X-Google-Smtp-Source: ABdhPJxMYV6jlir81ngo5/w8IE+OKSxnr6WkiXPRYoX3iOMPUfIgxv4Rh3ILA2y+jJmAfrjyM21ia1n9XqP98K9n3rU=
X-Received: by 2002:a05:6000:1562:b0:20f:c999:fda7 with SMTP id
 2-20020a056000156200b0020fc999fda7mr9944855wrz.65.1653323885403; Mon, 23 May
 2022 09:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAEAQM=Lo9AcUrw1c2bT_pYNtG0LpT9w2=McMbx=RY=SP0V_4PA@mail.gmail.com>
In-Reply-To: <CAEAQM=Lo9AcUrw1c2bT_pYNtG0LpT9w2=McMbx=RY=SP0V_4PA@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 23 May 2022 09:37:54 -0700
Message-ID: <CAH2-KxBqT-A91Jpj9ENTcajvgzO=oDRsTUPe=eLaOVBhVSjDqw@mail.gmail.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: Cody Smith <scody@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 2:12 PM Cody Smith <scody@google.com> wrote:
>
> I don't seem to have the original message, so this may get added to Andre=
w's branch of this thread. Sorry about that in advance.

The original message got caught in a lot of peoples spam filters, I'm
hoping that explains some of the lack of reply to the initial
proposal.

>
> In general I support moving to a monorepo. We at Google do this, and my s=
ignificant other at Airbnb also utilizes a monorepo. The advantages are sig=
nificant, as the world gets a lot less silo'd and making changes that would=
 have spanned across multiple repos now only span the monorepo. This is par=
ticularly useful when feature X requires changes to repo A, B and C, and th=
e changes on their own break things but shipped together are just fine. I d=
on't even really know how such a feature gets shipped today to be honest.

I agree with your general sentiment, although a couple nitpicks, what
I propose above isn't pure "monorepo" and more analogous to
"consolidate a lot of the repos".  FWIW, although I really think it's
the right thing to do, "other companies do it for other things" isn't
the best of arguments we can make for this.  There are plenty of
counter examples of companies with much more entrenched command chains
that use multiple repos and the creation of repos as a form of project
management to great effect.

>
> The other thing that tends to happen with monorepos is a lot more conform=
ity, as reviews are carried out by a larger set of people.

+1.  Applying consistent clang-format to the codebase for example
would be a lot more trivial.

> Suddenly `bmcweb` is being reviewed by people who may not have previously=
 cared about or touched that part of the codebase as a bad example. At a mi=
nimum more people will have eyes on the changes happening.
>
> I also think that a monorepo avoids one maintainer "lording" over a repo.=
 It happens, the +2ers kind of play a role of the bridge troll, when repo X=
 only has 1-2 +2ers, this can be a real problem. A monorepo with 10+ +2ers =
will force the +2ers to engage in debate when they disagree with each other=
, instead of lording over their own kingdoms and having no influence over o=
ther kingdoms so to speak.

In what I propose, I don't really think this changes given that the
existing OWNERS files would still be largely the same, although I
agree, more +2er debate would be a good thing if it was the result.

>
> I haven't made a great set of arguments here but in general I feel like a=
 chance like this would help from an organizational perspective and maybe w=
ith that better org. in place maybe we can begin addressing some of the oth=
er issues we need to address.

Thanks for your input.

PS, plaintext is generally prefered on this ML, given that it diffs
better in the tools.  (Click triple dot in the lower right of gmail,
then check "plain text mode").

>
> Cody Smith
> System Software Engineer
> Google Cloud Platform Core Services Team
> scody@google.com
> 720-515-6105
>
>
>
> On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Hi Ed,
>>
>> I think what's below largely points to a bit of an identity crisis for
>> the project, on a couple of fronts. Fundamentally OpenBMC is a distro
>> (or as Yocto likes to point out, a meta-distro), and we can:
>>
>> 1. Identify as a traditional OSS distro: An integration of otherwise
>>    independent applications
>>
>> 2. Identify as an appliance distro: The distro and the
>>    applications are a monolith
>>
>> You're proposing 2, while I think there exists some tension towards 1.
>>
>> With the amount of custom userspace we've always kinda sat in-between.
>> I'd like to see libraries and applications that have use cases outside
>> of OpenBMC be accessible to people with those external use cases,
>> without being burdened by understanding the rest of the OpenBMC context.
>> I have a concern that by integrating things in the way you're proposing
>> it will lead to more inertia there (e.g. for implementations of
>> standards MCTP or PLDM (libmctp and libpldm)).
>>
>> On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:
>> > The OpenBMC development process as it stands is difficult for people
>> > new to the project to understand, which severely limits our ability to
>> > onboard new maintainers, developers, and groups which would otherwise
>> > contribute major features to upstream, but don't have the technical
>> > expertise to do so.  This initiative, much like others before it[1] is
>> > attempting to reduce the toil and OpenBMC-specific processes of
>> > passing changes amongst the community, and move things to being more
>> > like other projects that have largely solved this problem already.
>>
>> Can you be more specific about which projects here? Do you have links
>> to examples?
>>
>> >
>> > To that end, I'd like to propose a change to the way we structure our
>> > repositories within the project: specifically, putting (almost) all of
>> > the Linux Foundation OpenBMC owned code into a single repo that we can
>> > version as a single entity, rather than spreading out amongst many
>> > repos.  In practice, this would have some significant advantages:
>> >
>> > - The tree would be easily shareable amongst the various people
>> > working on OpenBMC, without having to rely on a single-source Gerrit
>> > instance.  Git is designed to be distributed, but if our recipe files
>> > point at other repositories, it largely defeats a lot of this
>> > capability.  Today, if you want to share a tree that has a change in
>> > it, you have to fork the main tree, then fork every single subproject
>> > you've made modifications to, then update the main tree to point to
>> > your forks.
>>
>> This isn't true, as you can add patches in the OpenBMC tree.
>>
>> CI prevents these from being submitted, as it should, but there's nothin=
g to
>> stop anyone using the `devtool modify ...` / `devtool finish ...` and
>> committing the result as a workflow to exchange state (I do this)?
>>
>> Is the issue instead with devtool? Is it bad? Is the learning curve too =
steep?
>> It is at least the Yocto workflow.
>>
>> > This gets very onerous over time, especially for simple
>> > commits.  Having maintained several different companies forks
>> > personally, and spoken to many others having problems with the same,
>> > adding major features are difficult to test and rebase because of
>> > this.  Moving the code to a single tree makes a lot of the toil of
>> > tagging and modifying local trees a lot more manageable, as a series
>> > of well-documented git commands (generally git rebase[2]).  It also
>> > increases the likelihood that someone pulls down the fork to test it
>> > if it's highly likely that they can apply it to their own tree in a
>> > single command.
>>
>> Again, this is moot if the patches are applied in-tree.
>>
>> >
>> > - There would be a reduction in reviews.  Today, anytime a person
>> > wants to make a change that would involve any part of the tree,
>> > there's at least 2 code reviews, one for the commit, and one for the
>> > recipe bump.  Compared to a single tree, this at least doubles the
>> > number of reviews we need to process.
>>
>> Is there more work? Yes.
>>
>> Is it always double? No. Is it sometimes double? Yes.
>>
>> Often bumps batch multiple application commits. I think this paragraph
>> overstates the problem somewhat, but what it does get right is
>> identifying that *some* overhead exists.
>>
>> >  For changes that want to make
>> > any change to a few subsystems, as is the case when developing a
>> > feature, they require 2 X <number of project changes> reviews, all of
>> > which need to be synchronized.
>>
>> Same issue as above here.
>>
>> > There is a well documented problem
>> > where we have no official way to synchronize merging of changes to
>> > userspace applications within a bump without manual human
>> > intervention.  This would largely render that problem moot.
>>
>> Right, this can be hard to handle.
>>
>> It can be mitigated by versioning interfaces (which the D-Bus spec
>> calls out[6][7] but OpenBMC fails to do (?)) and supporting multiple
>> interfaces for the transition period.
>>
>> That said, that's also more work, and so needs to be considered in the
>> set of trade-offs.
>>
>> [6] https://dbus.freedesktop.org/doc/dbus-specification.html#message-pro=
tocol-names-interface
>> [7] https://dbus.freedesktop.org/doc/dbus-specification.html#message-pro=
tocol-names-bus
>>
>> >
>> > - It would allow most developers to not need to understand Yocto at
>> > all to do their day to day work on existing applications.  No more
>> > "devtool modify", and related SRCREV bumps.  This will help most of
>> > the new developers on the project with a lower mental load, which will
>> > mean people are able to ramp up faster..
>>
>> Okay. So devtool is seen as an issue.
>>
>> Can we improve its visibility and any education around it? Or is it a
>> lost cause? If so, why?
>>
>> Separately, I'm concerned this is an attempt to shield people from
>> skills that help them work with upstream Yocto. OpenBMC feels like it's
>> a bit of an on-ramp for open-source contributions for people who have
>> worked in what was previously quite a proprietary environment. We tried
>> shielding people in the past wrt kernel contributions, and that failed
>> pretty spectacularly. We (at least Joel and I) now encourage people to
>> work with upstream directly *and support them in the process of doing
>> that* rather than trying to mitigate some of the difficulties with
>> working upstream by avoiding them.
>>
>> >
>> > - It would give an opportunity for individuals and companies to "own"
>> > well-supported public forks (ie Redhat) of the codebase, which would
>> > increase participation in the project overall.  This already happens
>> > quite a bit, but in practice, the forks that do it squash history,
>> > making it nearly impossible to get their changes upstreamed from an
>> > outside entity.
>>
>> Not sure this is something we want to encourage, even if it happens in
>> practice.
>>
>> >
>> > - It would centralize the bug databases.  Today, bugs filed against
>> > sub projects tend to not get answered.
>>
>> Do you have some numbers handy?
>>
>> > Having all the bugs in
>> > openbmc/openbmc would help in the future to avoid duplicating bugs
>> > across projects.
>>
>> Has this actually been a problem?
>>
>> >
>> > - Would increase the likelihood that someone contributes a patch,
>> > especially a patch written by someone else.  If contributing a patch
>> > was just a matter of cherry-picking a tree of commits and submitting
>> > it to gerrit, it's a lot more likely that people would do it.
>>
>> It sounds plausible, but again, some evidence for this would be helpful.
>>
>> Why is this easier than submitting the patches to the application repo?
>>
>> > My proposed version of this tree is pushed to a github fork here, and
>> > is based on the tree from a few weeks ago:
>> > https://github.com/edtanous/openbmc
>> >
>> > It implements all the above for the main branch.  This tree is based
>> > on the output of the automated tooling, and in the case where this
>> > proposal is accepted, the tooling would be re-run to capture the state
>> > of the tree at the point where we chose to make this change.
>> >
>> > The tool I wrote to generate this tree is also published, if you're
>> > interested in how this tree was built, and is quite interesting in its
>> > use of git export/import [5], but functionally, I would not expect
>> > that tooling to survive after this transition is made.
>>
>> I think it would be good to capture the script in openbmc-tools if we
>> choose to go ahead with this, mainly as a record of how we achieved it.
>>
>> Andrew
>>
>> >
>> > [1]
>> > https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=3D1SSLCv5pTee7=
jaoVo2Zs6havgnA@mail.gmail.com/
>> > [2] https://git-scm.com/docs/git-rebase
>> > [3]
>> > https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-=
naming
>> > [4]
>> > https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-c=
lasses-externalsrc
>> > [5] https://github.com/edtanous/obmc-repo-combine/blob/main/combine
