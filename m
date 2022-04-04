Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E14F19CE
	for <lists+openbmc@lfdr.de>; Mon,  4 Apr 2022 20:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXK6S0Vpvz2yMk
	for <lists+openbmc@lfdr.de>; Tue,  5 Apr 2022 04:28:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Lkj1At5K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Lkj1At5K; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXK633Kbdz2xdN
 for <openbmc@lists.ozlabs.org>; Tue,  5 Apr 2022 04:28:25 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id n35so6443354wms.5
 for <openbmc@lists.ozlabs.org>; Mon, 04 Apr 2022 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4Em33kj42am5GHXwEDj4lSMVqjyGTrxWvxTYbdbInZQ=;
 b=Lkj1At5KKMuI2Nu0wAkLByT2LZwh97F4WKSDPvCcRt3CN5fRd1IvR0hoGmyIyqkWt8
 MhaSOq0ePDz+ZqriEkp0vPp8iqyODufq+8yMfq5GiYx6vJ0lEpbW2JTT+eaAXDIqmjnK
 YDquzsogKGIXyqMVra/cfqIZMzTXbuvq13aaNn0/zq3U8vPIFQwd9OQsEk8Oc7qRC6bk
 Z7ZFOJ3mpTb+0hs7IfaZnjUAAGw4kZi7aBOZVYy52TKOju4PLQ4eBrR/dI0ZAc4PZzbt
 BUPsNo0J1d/mAZ6MKHkag1FiF4vxtwG9ifTl+Tgd/ZvrBbZLLRxYDPXNKWcyIKDN1ndj
 viaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4Em33kj42am5GHXwEDj4lSMVqjyGTrxWvxTYbdbInZQ=;
 b=2zSimMP0Cb0a+bvWGy3+nrAVmgBi5AX8rZ4YAtjMDJCRvtQHBo073iJ0w7ZltBv/It
 e1fvvv26Ni/jb0FOOs8khS7yOQsbqL3F7mk7uKtFKBH3W6GSxAmFZUo6KP5R8a/VR4Zx
 4JrrhW7eM9e8ZmT77JJ8Xs13g6Yzuz8SmG/1OyzMOqyNn1s9tn8u+568wp2BUbW0qXJR
 RKC02/ZSRd+R9DxP/4SExAN6LVbeABLUmJW06pNcxQUlmJd6nani1L1N70XmAFQowBVn
 UDV1LJLYf3fnl+ZnkzAWp630Herl6ASlqNqIwQ79ecd7OQWMnDBeWv7Ll0eKUqGxxtyc
 eFUw==
X-Gm-Message-State: AOAM530FFN9P5M9Hua8UX+8Z9c57F/HErdU25yHwCpYk+v0eXQHISYiB
 yMWwYl2vZsMxYxEHenchpKxiLFOApG/ddKf3OWFxiKwCw6U8Wg==
X-Google-Smtp-Source: ABdhPJxPslyySFeE2foq5R+cIYwX0UAdznMltWED3GEsrjcSunXjZP6HWoZxuVjFIrtI2TbfnGr7I27U1pzDLppShRo=
X-Received: by 2002:a05:600c:302:b0:38e:7b73:2bd5 with SMTP id
 q2-20020a05600c030200b0038e7b732bd5mr349644wmd.163.1649096897783; Mon, 04 Apr
 2022 11:28:17 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <edtanous@google.com>
Date: Mon, 4 Apr 2022 11:28:06 -0700
Message-ID: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
Subject: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The OpenBMC development process as it stands is difficult for people
new to the project to understand, which severely limits our ability to
onboard new maintainers, developers, and groups which would otherwise
contribute major features to upstream, but don't have the technical
expertise to do so.  This initiative, much like others before it[1] is
attempting to reduce the toil and OpenBMC-specific processes of
passing changes amongst the community, and move things to being more
like other projects that have largely solved this problem already.

To that end, I'd like to propose a change to the way we structure our
repositories within the project: specifically, putting (almost) all of
the Linux Foundation OpenBMC owned code into a single repo that we can
version as a single entity, rather than spreading out amongst many
repos.  In practice, this would have some significant advantages:

- The tree would be easily shareable amongst the various people
working on OpenBMC, without having to rely on a single-source Gerrit
instance.  Git is designed to be distributed, but if our recipe files
point at other repositories, it largely defeats a lot of this
capability.  Today, if you want to share a tree that has a change in
it, you have to fork the main tree, then fork every single subproject
you've made modifications to, then update the main tree to point to
your forks.  This gets very onerous over time, especially for simple
commits.  Having maintained several different companies forks
personally, and spoken to many others having problems with the same,
adding major features are difficult to test and rebase because of
this.  Moving the code to a single tree makes a lot of the toil of
tagging and modifying local trees a lot more manageable, as a series
of well-documented git commands (generally git rebase[2]).  It also
increases the likelihood that someone pulls down the fork to test it
if it's highly likely that they can apply it to their own tree in a
single command.

- There would be a reduction in reviews.  Today, anytime a person
wants to make a change that would involve any part of the tree,
there's at least 2 code reviews, one for the commit, and one for the
recipe bump.  Compared to a single tree, this at least doubles the
number of reviews we need to process.  For changes that want to make
any change to a few subsystems, as is the case when developing a
feature, they require 2 X <number of project changes> reviews, all of
which need to be synchronized.  There is a well documented problem
where we have no official way to synchronize merging of changes to
userspace applications within a bump without manual human
intervention.  This would largely render that problem moot.

- It would allow most developers to not need to understand Yocto at
all to do their day to day work on existing applications.  No more
"devtool modify", and related SRCREV bumps.  This will help most of
the new developers on the project with a lower mental load, which will
mean people are able to ramp up faster..

- It would give an opportunity for individuals and companies to "own"
well-supported public forks (ie Redhat) of the codebase, which would
increase participation in the project overall.  This already happens
quite a bit, but in practice, the forks that do it squash history,
making it nearly impossible to get their changes upstreamed from an
outside entity.

- It would centralize the bug databases.  Today, bugs filed against
sub projects tend to not get answered.  Having all the bugs in
openbmc/openbmc would help in the future to avoid duplicating bugs
across projects.

- Would increase the likelihood that someone contributes a patch,
especially a patch written by someone else.  If contributing a patch
was just a matter of cherry-picking a tree of commits and submitting
it to gerrit, it's a lot more likely that people would do it.

- Greatly increases the ease with which stats are collected.
Questions like: How many patches were submitted last year?  How many
lines of code changed between commit A and commit B?  Where was this
regression injected (ie git bisect)?  How much of our codebase is C++?
How many users of the dbus Sensor.Value interface are there?  Are all
easily answered in one liner git commands once this change is done.

- New features no longer require single-point-of-contact core
maintainer processes (ie, creating a repo for changes, setting up
maintainer groups, ect) and can just be submitted as a series of
patches to openbmc/openbmc.

- Tree-wide changes (c++ standard, yocto updates, formatting, ect) are
much easier to accomplish in a small number of patches, or a series of
patches that is easy to pull and test as a unit.

In terms of concretely how we would accomplish this, I've put together
what such a tree would look like, and I'm looking for input on how it
could be improved.  Some key points on what it represents:

- All history for both openbmc and sub projects will be retained.
Commits are interleaved based on the date in which they were submitted
using custom tooling that was built on top of git fast-export and
fast-import.  All previously available tags will have similar tags in
the new repository pointing at their equivalent commits in the new
repository.

- Inclusive guidelines: To make progress toward an unrelated but
important goal at the same time, I'm recommending that the
openbmc/master branch will be left as-is, and the newly-created sha1
will be pushed to the branch openbmc/openbmc:main, to retain peoples
links to previous commits on master, and retain the exact project
history while at the same time moving the project to having more
inclusive naming, as has been documented previously[3].  At some point
in the future the master branch could be renamed and deprecated, but
this is considered out of scope for this specific change.

- Each individual sub-project will be given a folder within
openbmc/openbmc based on their current repository name.  While there
is an opportunity to reorganize in more specific ways (ie, put all
ipmi-oem handler repos in a folder) this proposal intentionally
doesn't, under the proposition that once this change is made, any sort
of folder rearranging will be much easier to accomplish, and to keep
the scope limited.

- Yocto recipes will be changed to point to their path equivalent, and
inherit externalsrc bbclass[4].  This workflow is exactly the workflow
devtool uses to point to local repositories during a "devtool modify",
so it's unlikely we will have incremental build-consistency issues
with this approach, as was a concern in the past.

- Places where we've forked other well supported projects (u-boot,
kernel, ect) will continue to point to the openbmc/<projectname> fork.
This is done to ensure that we don't inflict the same problem we're
attempting to solve in OpenBMC upon those working in the subproject
forks, and to reinforce to contributors that patches to these projects
should prefer submitting first to the relevant upstream.

- Subprojects that are intended to be reused outside of OpenBMC (ex
sdbusplus) will retain their previous commit, history, and trees, such
that they are usable outside the project.  This is intended to make
sure that the code that should be reusable by others remains so.

- The above intentionally makes no changes to our subtree update
process, which would remain the same process as is currently.  The
openbmc-specific autobump job in Jenkins would be disabled considering
it's no longer required in this approach.

- Most Gerrit patches would now be submitted to openbmc/openbmc.

My proposed version of this tree is pushed to a github fork here, and
is based on the tree from a few weeks ago:
https://github.com/edtanous/openbmc

It implements all the above for the main branch.  This tree is based
on the output of the automated tooling, and in the case where this
proposal is accepted, the tooling would be re-run to capture the state
of the tree at the point where we chose to make this change.

The tool I wrote to generate this tree is also published, if you're
interested in how this tree was built, and is quite interesting in its
use of git export/import [5], but functionally, I would not expect
that tooling to survive after this transition is made.

Let me know what you think.

-Ed

[1] https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/
[2] https://git-scm.com/docs/git-rebase
[3] https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
[4] https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc
[5] https://github.com/edtanous/obmc-repo-combine/blob/main/combine
