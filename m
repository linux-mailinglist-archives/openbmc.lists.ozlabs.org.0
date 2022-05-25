Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353F533FD7
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 17:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Z7c2Nhhz3bk8
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 01:03:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GYOh3LJN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=GYOh3LJN; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Z791nrtz2x9X
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 01:02:44 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id f2so30555903wrc.0
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0LAkKD5QSaaciBVJJPgM6YkW1TUiidjXZeQ9ApdyNsc=;
 b=GYOh3LJNIGOdrc1CILbH1PUUXICR3/uOBMIwvsgch/iiMo1fk7d25WrVG3/VF+cOv+
 2HinZxlIIYbr2J9Skv0FZWM96wRrX/jBOYLGsozQCPANFxCbsCwLkdxG8jr9vl+QyAeI
 2zLpBG3vh6SadFVykPmk3MqYc+CMy1CPJCk3ZDv4zohiNT4djRRvVEsR0TC6QZbabC9N
 gLLPGWmcpKSM2lb6eVbu5poxpR6XYWWU5BPJq4RYLelk4fnV6TRDL8qO3JX8ecJwCMzo
 h/gWX5t9Q0Hjf3wjLE241bOGi9xOoP0KzwoLIKAZuL5VFYYU1d5WstckpDjT7HoZ0wIX
 7nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0LAkKD5QSaaciBVJJPgM6YkW1TUiidjXZeQ9ApdyNsc=;
 b=XrI8aRZ3Vv1Q4ilMllkquYJEcZg3IqPVduR5VP1VYgIQhpmQ6OeFU/2P4bbg9t5lVT
 lJGX9EiP1BtropHvxtyN8q13qyo1OEHXd7cOT65XJ7NXlNUvIQ/M+MIZjaImEFy6gEUB
 oUGNwj6843g9oH0oSN4NQ0G6O2UUDw5m8K/pFMJSyjiZdnCp7jpexwB1j9xZbgEBmtI+
 s3wjpMaErvgXpAM9AijV6gVOGMkS5DUUWCA+bY1ksidvCylnzB8sgVIpGCclBc5XCPTp
 5OqXYt4mIT2fCluOthir8KcstR4IxjLu8GmqHG5tlj/GxuQ6pRwYvDLlorZna5V63JuG
 orvw==
X-Gm-Message-State: AOAM530va4fmx120ysvAZCa3j+y9eO/0v+I84GHjgPhGh7/jDdmaJ1Ii
 3AHBpT3yZyUESrBa76myWobLBScfkRE/BOMLvaA3iw==
X-Google-Smtp-Source: ABdhPJxEaL3hPuznUOJHA1/IX1nEnOV3NscpzvU3kqxUYr26OVzw7o0T3w4z7bWlAcx4CT/E2LZEK9qn/883rLr84dw=
X-Received: by 2002:a05:6000:1562:b0:20f:c999:fda7 with SMTP id
 2-20020a056000156200b0020fc999fda7mr17861513wrz.65.1653490956720; Wed, 25 May
 2022 08:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <baabb8ca-e1b2-049b-e112-cfe8e211c301@linux.alibaba.com>
 <CAH2-KxDjU_S6Jdd_QpvnHbXh7KBjCRJ1vHxEfBiFZ1HoOPKAPQ@mail.gmail.com>
 <9deaad03-a625-b087-46ef-bc3ebed15974@linux.alibaba.com>
In-Reply-To: <9deaad03-a625-b087-46ef-bc3ebed15974@linux.alibaba.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 25 May 2022 08:02:26 -0700
Message-ID: <CAH2-KxBGAMUoHSSEB_bL3ekPzGROjL7qW2_95WPHxgN21wksqw@mail.gmail.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: Heyi Guo <guoheyi@linux.alibaba.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 25, 2022 at 6:32 AM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
>
> =E5=9C=A8 2022/5/24 =E4=B8=8A=E5=8D=8812:27, Ed Tanous =E5=86=99=E9=81=93=
:
> > On Tue, Apr 12, 2022 at 12:23 AM Heyi Guo<guoheyi@linux.alibaba.com>  w=
rote:
> >> I like the idea, for we don't utilize additional tools like repo to
> >> maintain the code, and it should make it easier for us to maintain
> >> multiple internal branches.
> >>
> > Hi Heyi,
> > Glad to see you on the project.  Do you think you could elaborate a
> > little about how you're hoping to use OpenBMC and its review process,
> > and if any of the changes being proposed here would help you?
>
> Hi Ed,
>
> The background is our team uses basic git commands to manage the
> repositories of openbmc, so the current multi-repositories structure
> costs extra effort for our code maintenance, including:
>
> 1. Normally two commits are required for one single change, one for the
> component repo and one for openbmc, for our internal release versions
> are more frequent and the fixes are required to be merged ASAP. We also
> created a script to check if openbmc has included the latest commits of
> all component repos.
>
> 2. Not easy to maintain stable branches, which require to have branches
> for openbmc and the integrated components.
>
> 3. Not easy to search code across all the component repos; I'd like to
> use "git grep" to search keyword in a single repo, but it doesn't work
> here; and it is not easy to make generic fix for all repos, as you said.
>
> I think monorepo will help to improve the situation, and it may help
> prevent the division of the community.
>
> The code review process is not difficult for us, for reviewers are
> chosen automatically by gerrit.
>
> If you also have better practice for the current multi-repo structure,
> please advise and help us improve :)
>
> Thanks,
>
> Heyi

Thank you for your feedback.


>
> >
> >> Thanks,
> >>
> >> Heyi
> >>
> >> =E5=9C=A8 2022/4/5 =E4=B8=8A=E5=8D=882:28, Ed Tanous =E5=86=99=E9=81=
=93:
> >>> The OpenBMC development process as it stands is difficult for people
> >>> new to the project to understand, which severely limits our ability t=
o
> >>> onboard new maintainers, developers, and groups which would otherwise
> >>> contribute major features to upstream, but don't have the technical
> >>> expertise to do so.  This initiative, much like others before it[1] i=
s
> >>> attempting to reduce the toil and OpenBMC-specific processes of
> >>> passing changes amongst the community, and move things to being more
> >>> like other projects that have largely solved this problem already.
> >>>
> >>> To that end, I'd like to propose a change to the way we structure our
> >>> repositories within the project: specifically, putting (almost) all o=
f
> >>> the Linux Foundation OpenBMC owned code into a single repo that we ca=
n
> >>> version as a single entity, rather than spreading out amongst many
> >>> repos.  In practice, this would have some significant advantages:
> >>>
> >>> - The tree would be easily shareable amongst the various people
> >>> working on OpenBMC, without having to rely on a single-source Gerrit
> >>> instance.  Git is designed to be distributed, but if our recipe files
> >>> point at other repositories, it largely defeats a lot of this
> >>> capability.  Today, if you want to share a tree that has a change in
> >>> it, you have to fork the main tree, then fork every single subproject
> >>> you've made modifications to, then update the main tree to point to
> >>> your forks.  This gets very onerous over time, especially for simple
> >>> commits.  Having maintained several different companies forks
> >>> personally, and spoken to many others having problems with the same,
> >>> adding major features are difficult to test and rebase because of
> >>> this.  Moving the code to a single tree makes a lot of the toil of
> >>> tagging and modifying local trees a lot more manageable, as a series
> >>> of well-documented git commands (generally git rebase[2]).  It also
> >>> increases the likelihood that someone pulls down the fork to test it
> >>> if it's highly likely that they can apply it to their own tree in a
> >>> single command.
> >>>
> >>> - There would be a reduction in reviews.  Today, anytime a person
> >>> wants to make a change that would involve any part of the tree,
> >>> there's at least 2 code reviews, one for the commit, and one for the
> >>> recipe bump.  Compared to a single tree, this at least doubles the
> >>> number of reviews we need to process.  For changes that want to make
> >>> any change to a few subsystems, as is the case when developing a
> >>> feature, they require 2 X <number of project changes> reviews, all of
> >>> which need to be synchronized.  There is a well documented problem
> >>> where we have no official way to synchronize merging of changes to
> >>> userspace applications within a bump without manual human
> >>> intervention.  This would largely render that problem moot.
> >>>
> >>> - It would allow most developers to not need to understand Yocto at
> >>> all to do their day to day work on existing applications.  No more
> >>> "devtool modify", and related SRCREV bumps.  This will help most of
> >>> the new developers on the project with a lower mental load, which wil=
l
> >>> mean people are able to ramp up faster..
> >>>
> >>> - It would give an opportunity for individuals and companies to "own"
> >>> well-supported public forks (ie Redhat) of the codebase, which would
> >>> increase participation in the project overall.  This already happens
> >>> quite a bit, but in practice, the forks that do it squash history,
> >>> making it nearly impossible to get their changes upstreamed from an
> >>> outside entity.
> >>>
> >>> - It would centralize the bug databases.  Today, bugs filed against
> >>> sub projects tend to not get answered.  Having all the bugs in
> >>> openbmc/openbmc would help in the future to avoid duplicating bugs
> >>> across projects.
> >>>
> >>> - Would increase the likelihood that someone contributes a patch,
> >>> especially a patch written by someone else.  If contributing a patch
> >>> was just a matter of cherry-picking a tree of commits and submitting
> >>> it to gerrit, it's a lot more likely that people would do it.
> >>>
> >>> - Greatly increases the ease with which stats are collected.
> >>> Questions like: How many patches were submitted last year?  How many
> >>> lines of code changed between commit A and commit B?  Where was this
> >>> regression injected (ie git bisect)?  How much of our codebase is C++=
?
> >>> How many users of the dbus Sensor.Value interface are there?  Are all
> >>> easily answered in one liner git commands once this change is done.
> >>>
> >>> - New features no longer require single-point-of-contact core
> >>> maintainer processes (ie, creating a repo for changes, setting up
> >>> maintainer groups, ect) and can just be submitted as a series of
> >>> patches to openbmc/openbmc.
> >>>
> >>> - Tree-wide changes (c++ standard, yocto updates, formatting, ect) ar=
e
> >>> much easier to accomplish in a small number of patches, or a series o=
f
> >>> patches that is easy to pull and test as a unit.
> >>>
> >>> In terms of concretely how we would accomplish this, I've put togethe=
r
> >>> what such a tree would look like, and I'm looking for input on how it
> >>> could be improved.  Some key points on what it represents:
> >>>
> >>> - All history for both openbmc and sub projects will be retained.
> >>> Commits are interleaved based on the date in which they were submitte=
d
> >>> using custom tooling that was built on top of git fast-export and
> >>> fast-import.  All previously available tags will have similar tags in
> >>> the new repository pointing at their equivalent commits in the new
> >>> repository.
> >>>
> >>> - Inclusive guidelines: To make progress toward an unrelated but
> >>> important goal at the same time, I'm recommending that the
> >>> openbmc/master branch will be left as-is, and the newly-created sha1
> >>> will be pushed to the branch openbmc/openbmc:main, to retain peoples
> >>> links to previous commits on master, and retain the exact project
> >>> history while at the same time moving the project to having more
> >>> inclusive naming, as has been documented previously[3].  At some poin=
t
> >>> in the future the master branch could be renamed and deprecated, but
> >>> this is considered out of scope for this specific change.
> >>>
> >>> - Each individual sub-project will be given a folder within
> >>> openbmc/openbmc based on their current repository name.  While there
> >>> is an opportunity to reorganize in more specific ways (ie, put all
> >>> ipmi-oem handler repos in a folder) this proposal intentionally
> >>> doesn't, under the proposition that once this change is made, any sor=
t
> >>> of folder rearranging will be much easier to accomplish, and to keep
> >>> the scope limited.
> >>>
> >>> - Yocto recipes will be changed to point to their path equivalent, an=
d
> >>> inherit externalsrc bbclass[4].  This workflow is exactly the workflo=
w
> >>> devtool uses to point to local repositories during a "devtool modify"=
,
> >>> so it's unlikely we will have incremental build-consistency issues
> >>> with this approach, as was a concern in the past.
> >>>
> >>> - Places where we've forked other well supported projects (u-boot,
> >>> kernel, ect) will continue to point to the openbmc/<projectname> fork=
.
> >>> This is done to ensure that we don't inflict the same problem we're
> >>> attempting to solve in OpenBMC upon those working in the subproject
> >>> forks, and to reinforce to contributors that patches to these project=
s
> >>> should prefer submitting first to the relevant upstream.
> >>>
> >>> - Subprojects that are intended to be reused outside of OpenBMC (ex
> >>> sdbusplus) will retain their previous commit, history, and trees, suc=
h
> >>> that they are usable outside the project.  This is intended to make
> >>> sure that the code that should be reusable by others remains so.
> >>>
> >>> - The above intentionally makes no changes to our subtree update
> >>> process, which would remain the same process as is currently.  The
> >>> openbmc-specific autobump job in Jenkins would be disabled considerin=
g
> >>> it's no longer required in this approach.
> >>>
> >>> - Most Gerrit patches would now be submitted to openbmc/openbmc.
> >>>
> >>> My proposed version of this tree is pushed to a github fork here, and
> >>> is based on the tree from a few weeks ago:
> >>> https://github.com/edtanous/openbmc
> >>>
> >>> It implements all the above for the main branch.  This tree is based
> >>> on the output of the automated tooling, and in the case where this
> >>> proposal is accepted, the tooling would be re-run to capture the stat=
e
> >>> of the tree at the point where we chose to make this change.
> >>>
> >>> The tool I wrote to generate this tree is also published, if you're
> >>> interested in how this tree was built, and is quite interesting in it=
s
> >>> use of git export/import [5], but functionally, I would not expect
> >>> that tooling to survive after this transition is made.
> >>>
> >>> Let me know what you think.
> >>>
> >>> -Ed
> >>>
> >>> [1]https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=3D1SSLCv5p=
Tee7jaoVo2Zs6havgnA@mail.gmail.com/
> >>> [2]https://git-scm.com/docs/git-rebase
> >>> [3]https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclus=
ive-naming
> >>> [4]https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#r=
ef-classes-externalsrc
> >>> [5]https://github.com/edtanous/obmc-repo-combine/blob/main/combine
