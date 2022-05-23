Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AFA531519
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 18:53:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6NhN611Fz3bcB
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 02:53:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IZ5yxOfB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=IZ5yxOfB; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Ngy12bTz2yn3
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 02:53:32 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id f2so22283424wrc.0
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 09:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vSQZTA7ofBIzIsxjMxowtR2l93aSQLwHd2Cm0ZVy3Bc=;
 b=IZ5yxOfBGbtZwIKYw4ykKD/PhLLRqqFjp1stfjufaKhtH3SyLAo2RpfzHn8Vqvh36s
 VSBPuJ9MJlZ49lJEroLx5xk9/HVyCaC4aQz3T/kkvE8qG2hR/I5PvXMUN7FA3pGfouM3
 2hQG76DU8FhdLNQ8k+7w3M6fszGnI4RGc6h7M4+cVdfV54g2gCrfMfeYhq20DFUwi71P
 MeWjZln0DRAJDJiljnLTSQ1RzM2Z+0xiVWQVWljK5OITxwEVe1uamU4AmOtJZXeB7aR4
 iKMOIZozZaimhfdpM04kK4eFT+pkixeY75fLMSI9SBceVF+bRl6ArirFmf9YZKoMApZp
 IjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vSQZTA7ofBIzIsxjMxowtR2l93aSQLwHd2Cm0ZVy3Bc=;
 b=d9R6jq3HxfYbijS+OSw+//zxc+hTkKxG6fxoGJ+c27a0NNg5yQD0+TxGdrP+fOBufI
 6E2fMAZFBSK/oLkZ1M7nCJbgXRfscikHKD1k9zemj71CmikrEG6iuFFQrApoHXfN/Ozv
 fY3Qy0nKfs0652ITeMaeUg4csSXlxf7biJ1eHuxHPpPDAlKmNWSj4fNIHnGpf2D/QTu6
 cFs6bzfsrV4MJ4OTTmfwPJE/vfNrk5TkBpXlNEJyB9cRWYM/sdCf80Zvw9ODFUXsrQvn
 tsgjjMuZlklxAJeocW2HNsjqf7hRAvLlbi7H0mEFj7wBjeiLrSi9Sko4fZaA+6jGAhSC
 h2CQ==
X-Gm-Message-State: AOAM532p2t6DiNl8Hh9Oyd3f6VfXfgs0yq7MWLK3hl5cB4VK31cZiGPw
 eg1a58VO+z9RRHHBJulYYAfgtzRr84HGhNrEW2tJWg==
X-Google-Smtp-Source: ABdhPJyptVwDXmFVMLmyxhGxjtxk6oDt3N1fyXQTt3iB64PbQB4DB2E0owRy3OcyaCaRid0RqrdZV1shpmTKSGSeUkQ=
X-Received: by 2002:a05:6000:1562:b0:20f:c999:fda7 with SMTP id
 2-20020a056000156200b0020fc999fda7mr9995021wrz.65.1653324807612; Mon, 23 May
 2022 09:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <Yk3y3IHSh2/XMu6e@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Yk3y3IHSh2/XMu6e@heinlein.stwcx.org.github.beta.tailscale.net>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 23 May 2022 09:53:16 -0700
Message-ID: <CAH2-KxCCJG3okVtF_UTUH3h6H8-SB37u7E-h8fGjB3hrhjeOZg@mail.gmail.com>
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

On Wed, Apr 6, 2022 at 1:06 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Apr 04, 2022 at 11:28:06AM -0700, Ed Tanous wrote:
> > The OpenBMC development process as it stands is difficult for people
> > new to the project to understand, which severely limits our ability to
> > onboard new maintainers, developers, and groups which would otherwise
> > contribute major features to upstream, but don't have the technical
> > expertise to do so.
>
> This is, to me, a rather bold and surprising statement.
>
> You're saying there are people out there who can work on an embedded
> system like the BMC at layers of the stack where they might be modifying
> everything from the kernel up to REST APIs to "contribute major
> features" and yet they can't figure out how to manipulate multiple git
> repositories?

Yes, myself included, but the primary friction here is yoctos
management of said repositories, pinning, and revving, not necessarily
just "manipulate multiple git repos".

>
> I get that I've heard "Yocto has a big learning curve" over and over,
> but you're not actually proposing moving away from Yocto and I admin
> that it is quite likely the "Yocto has a big learning curve" is actually a
> conflation of some of these points that you're raising along with Yocto
> itself, but still, this is worded rather boldly.

I'm not saying we go away from yocto, I'm saying that we move it to a
point where, unless you're implementing a totally new daemon, you
don't need to know yocto is the build system, it's just a command you
run to produce a binary of the code you have checked out.

>
> > This initiative, much like others before it[1] is
> > attempting to reduce the toil and OpenBMC-specific processes of
> > passing changes amongst the community, and move things to being more
> > like other projects that have largely solved this problem already.
>
> I'm not sure what is OpenBMC-specific about this process though.
>
> There are some large successful projects that work in a mono-repo and some
> which work in a micro-repo model.  Android and OpenStack are both micro-repo
> models that use Gerrit, just like us, and have similar "how do you put the
> dependencies together" problems, which they have solved: Android with `repo`
> and OpenStack with `zuul`.  `repo` and `Yocto recipes` are pretty similar
> mechanics to me (and I would like to see something more `zuul`-like in our
> CI).

It's quite possible some of those tools could be good solutions to
this instead, especially considering repo integrates well with gerrit.
I'm open to the possibilities, but in the case of repo, it would look
very similar to my proposal (whole tree gets checked out at once).
Compared to combining the repos, I'm not sure how it would be much
different workflow wise from what I propose, aside from having to
learn another tool, which isn't great, but I'm happy to entertain it
as a different class of solution.

>
> Many open source communities work in a micro-repo model; the challenge
> is always about pulling dependencies together.  Newer languages like
> Rust and JS make this easier, but again, there isn't much fundamentally
> different than Yocto recipes out there.
>
> The mechanics of how we maintain our dependencies might be different,
> because we're built on Yocto, but I would argue that this proposal is
> itself _more_ OpenBMC-specific and not less.  I say this because we are
> deviating from how every other Yocto project I know of works and how
> most other "Linux Distribution" projects work (which is what we are).

Examples?  I listed a few examples of firmware projects that work from
a single repository.
I think the difference here is most Linux distributions don't generate
a single system-specific binary at the end, or if they do, it's a
subset of the packages built and has things like installers attached,
and has the niceties of being able to load one image per many classes
of system (ubuntu for example produces amd64 and arm64 installers, and
maybe a few more) .  In the case of firmware, we're generating one
final image to be loaded onto hardware that is hardware specific;
That changes the problem space a bit IMO.

>
> > - The tree would be easily shareable amongst the various people
> > working on OpenBMC, without having to rely on a single-source Gerrit
> > instance.
>
> What do you mean by "rely on a single-source Gerrit instance"?

http://gerrit.openbmc-project.xyz/

The main point is that if I wanted to push a version of my tree for
others to see (like I did for this proposal) it's pretty trivial to do
using tools in the project, and encourages the community to experiment
and improve on it.  In the current model, if I wanted to push a
version of my tree, I would have to fork every application I changed
separately.

>
> > Git is designed to be distributed, but if our recipe files
> > point at other repositories, it largely defeats a lot of this
> > capability.  Today, if you want to share a tree that has a change in
> > it, you have to fork the main tree, then fork every single subproject
> > you've made modifications to, then update the main tree to point to
> > your forks.  This gets very onerous over time, especially for simple
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
> I'm almost certain that nobody would do a git-rebase of their fork even
> if everything were in one tree.

My team certainly would rebase.  There are prominent examples of forks
that already do git rebase (Intel-BMC) that rebase and just live with
the need for creating side repositories for every new feature, or rely
on patch files.

>
> Why do we want to improve outside testing of forks?  I don't understand
> why that is an advantage.

Because it's a way to get consensus, and to keep the master more
stable, and make sure that features are used and useful before they
merge.  We would ideally do this within the master tree as well, but
that I don't think requires this proposal.

>
> Most of what you're describing here is making it easier for people to
> live without getting their code upstreamed, which doesn't seem like a
> good thing to the project as a whole, and seems to actively work against
> the title of "to make upstreaming easier".

If rebases are easy, and patches that others wrote can be directly
applied and sent to upstream reviews, it makes upstreaming and
community testing easier.  I'm reading your above as "what we have
today is fine".  FWIW, our build system does this every day, by
pulling pre-built distros from ubuntu instead of pulling directly from
torvalds/linux and building ourselves.  This reduces friction on test
teams.

>
> If you're maintaining a few fixes in a backports tree, maintain them as
> Yocto-supported patch files.  If you're maintaining whole features
> elsewhere, I have no interest in making this easier for you (if it is
> worse in other ways for the project).

If we don't make this easy, it makes it a lot less likely that these
features can be contributed back to the mainline by ANYONE, not just
the individual making the feature.  This is bad for everyone, and
leads to a belief that companies can't rely on OpenBMC upstream
directly, that "upstreaming is hard", and that openbmc/openbmc is some
ivory tower that we put big walls around.  We should be reducing the
friction on integrating with upstream (including rebasing) to improve
the openbmc security, and to expand our community.

>
> > - There would be a reduction in reviews.  Today, anytime a person
> > wants to make a change that would involve any part of the tree,
> > there's at least 2 code reviews, one for the commit, and one for the
> > recipe bump.  Compared to a single tree, this at least doubles the
> > number of reviews we need to process.
>
> The typical bump commit is trivial to review and nobody does it except
> Andrew G or me anyhow.

No disagreement, but it's yet another thing that individuals have to
wait for after their patchsets merge, and is a manual, non-distributed
(ie two people do it manually) human process.  As a rule, we should
reduce the number of "human-speed" processes we have for things that a
CI system can do.

>
> You could argue that there is actually some velocity advantage of decoupling
> the feature support in the code repo while figuring out the minor
> implications at a recipe level separately.  Having to have every code
> repo commit pass on hardware before it can get +1 Verified is going to
> greatly increase our CI requirements, plus you're going to get lots more
> "I don't understand why this failed" because of a flaky Yocto-wget-fetch
> or Romulus QEMU failure or ...
>
> We also would need to implement everything we have in code-repo level CI
> in the recipe-level CI.  I've spoken to this later as well, but I think
> while decreasing the number of reviews it will also decrease the
> velocity of the reviews even more.  I don't think that the bump commits
> are what are decreasing our velocity here.


This hasn't been my experience, and there are many cases of
individuals forgetting to update the recipes, or the recipe updates
not going in at the same time.

I never asked for all commits to get hardware +1 before they merge
(although if we had resources for it, it would help considerably in
cutting down manual "git bisect" time).  Hardware CI would still run
to the limits of its capability, but would now have the OPTION to run
on every commit if it could.

From my perspective, bump commits increase the lag time between "this
got merged to master" and reports of failures coming in, because if
the bump takes 2 days to merge, that's 2 days where the community
at-large isn't testing, and things get stale.  There's an argument to
be made for "we should wait for hardware CI before things merge to
master", but I think that can be solved in either case.

>
> > For changes that want to make
> > any change to a few subsystems, as is the case when developing a
> > feature, they require 2 X <number of project changes> reviews, all of
> > which need to be synchronized.
>
> I think there is a fundamental problem of how we develop features here.
> "All of which need to be synchronized" implies that every new feature we
> develop has hard co-reqs between repositories.  If that is the case,
> something is broken in our architecture.  We shouldn't patch around it
> by manipulating the code layout.

Open to ideas on how to change the architecture, but as you know, to
add a new capability to OpenBMC, you need at minimum:
1. A design doc in the docs repo
2. A change to phosphor-dbus-interfaces to add the new interface.
3. A change to add the producer of said new feature. (possibly a new
repo at the same time).
4. 1 or 2 changes to the consuming daemons (bmcweb/ipmi) to use said interfaces.

If that's a "broken" architecture, that's fine, although it does seem
to function.  From where we are today, how would we get the above down
to a single patch series?

>
> > There is a well documented problem
> > where we have no official way to synchronize merging of changes to
> > userspace applications within a bump without manual human
> > intervention.  This would largely render that problem moot.
>
> This is a solved problem in projects with a similar layout to ours, such
> as OpenStack.  I've previously offered to add topic-based testing[1] to our
> CI framework and, maybe I misread the attitudes, but it didn't seem like
> it was interesting to the project.
>
> I _did_ add some amount of dependency-based testing to the repositories
> that are included in our base Docker image already.  If you change one
> of those repositories, they get included in the Docker image used for
> testing your code as well.  This has identified problems in the past
> because of, say, a change in sdbusplus that broke phosphor-logging's
> compile.

Again, if it's high friction and requires openbmc-specific knowledge
to execute, it doesn't solve the problem, but agreed, that would be a
way to solve this one specific friction point.  FWIW, having
everything in a single repo would mean that change would get caught at
review time, not after it was merged to master, which overall I think
is better.

>
> > - It would allow most developers to not need to understand Yocto at
> > all to do their day to day work on existing applications.  No more
> > "devtool modify", and related SRCREV bumps.  This will help most of
> > the new developers on the project with a lower mental load, which will
> > mean people are able to ramp up faster..
>
> I think there is something more fundamental going on here which I'll
> speak about later in "## End-to-end features"
>
> > - It would give an opportunity for individuals and companies to "own"
> > well-supported public forks (ie Redhat) of the codebase, which would
> > increase participation in the project overall.  This already happens
> > quite a bit, but in practice, the forks that do it squash history,
> > making it nearly impossible to get their changes upstreamed from an
> > outside entity.
>
> I don't see how this improves the "forks that squash history" situation.
> Rebases are hard to pull off with how most companies handle their
> internal processes, so the best case here is merge commits.

Sure, merge commits or rebases are roughly equivalent in this context.
The point is both are now available to users.

>
> > - It would centralize the bug databases.  Today, bugs filed against
> > sub projects tend to not get answered.  Having all the bugs in
> > openbmc/openbmc would help in the future to avoid duplicating bugs
> > across projects.
>
> We could do this without changing any code.  Just turn off the issue
> tracking on all our code repos[2].

Agreed.

>
> > - Would increase the likelihood that someone contributes a patch,
> > especially a patch written by someone else.  If contributing a patch
> > was just a matter of cherry-picking a tree of commits and submitting
> > it to gerrit, it's a lot more likely that people would do it.
>
> I'm not following why this can't be done today.  Aren't you just
> cherry-picking commits at a different level?

Which commits do you cherry-pick?  if the feature requires recipe
changes, a tweak to a related daemon, a per-system configuration file,
and a user-facing daemon (ipmi/bmcweb) change, it's not a simple
cherry-pick to make the feature work.

>
> I think there is likely legal apprehension about trying to take code
> from a fork that isn't your own and trying to contribute it upstream.
> With the current CLA structure, the SOB in "fork/repo" doesn't have the
> same meaning legally as our SOB+CLA, so I cannot comfortably add my own
> SOB on code I picked up from "fork/repo".  No change to the repository
> layout will fix this.

Sure, if there are no sign-offs in the source repo, that's a problem.
Many of the patches I see in forks have signoffs, and I message
heavily that if you're pushing public forks, they should still contain
sign offs for exactly this reason.

>
> > - Greatly increases the ease with which stats are collected.
> > Questions like: How many patches were submitted last year?  How many
> > lines of code changed between commit A and commit B?  Where was this
> > regression injected (ie git bisect)?  How much of our codebase is C++?
> > How many users of the dbus Sensor.Value interface are there?  Are all
> > easily answered in one liner git commands once this change is done.
>
> I'm not saying some of these aren't positives, but most of them can
> already be answered today with existing tools.  Either github or grok
> search or gerrit queries can answer almost all of these except "how many
> lines of code changed between A and B", if you're expecting to count all
> the code in subordinate repos, but I don't see that as a particularly
> interesting question.

Maybe I'm missing something?  Can you give some examples of how, say,
I would bisect a regression down to a single commit across repos using
existing tools?  I can bisect a regression down to an autobump, which
helps some, but so far as I'm aware that doesn't work cross repo.
Some of those stats aren't interesting to you, agreed, but they are
interesting to others, and they are stats that large codebases like
ours tend to track.

>
> > - New features no longer require single-point-of-contact core
> > maintainer processes (ie, creating a repo for changes, setting up
> > maintainer groups, ect) and can just be submitted as a series of
> > patches to openbmc/openbmc.
>
> If the single-point-of-contact is the issue, let's solve that.  I don't
> think it is though.  I think the bulk of the issue with new repos is
> disagreement on if something belongs in a new repo.  Submitting as a
> series makes _that_ situation worse because it doesn't force the
> discussion upfront and instead someone is upset they spent a bunch of
> time working on a new daemon that is rejected.

Completely disagree on this point.  Many times pushing the code is the
example of "here's why this can't go in an existing repo" that is
really hard to convey in text;  It also makes it clear that the
problem is solved.  In addition, if you have the code, and it
duplicates a lot of functions, it's really nice to be able to point
to: Here's code that basically does the same thing, can this be merged
with it?  rather than just making the blanket "don't duplicate
functions" statement.

>
> > - Tree-wide changes (c++ standard, yocto updates, formatting, ect) are
> > much easier to accomplish in a small number of patches, or a series of
> > patches that is easy to pull and test as a unit.
>
> Patches that are also much more difficult to revert if they break one
> particular area...

No disagreement there, but I think having the option is important, and
we should use good judgement when making these kinds of changes.

>
> Why would we want these pulled together and tested as a unit anyhow?  If
> I update the formatting or the C++ standard used of repo A, that doesn't
> affect repo B.

Because it's much easier to test one commit than test 100 individual
commits, basically the same as above where you were pointing out
limitations in hardware CI.

>
> I've been involved in almost every difficult Yocto subtree update and the only
> case I can think where we couldn't apply the changes to the older Yocto version
> was the OpenSSL3 changes, which we had to #define check around based on an
> OpenSSL version they export.  Even if all the code were in one repo
> would we have wanted to cram all that into a single "Yocto update plus
> fix all the code" commit?  I suspect not.  Doing the #define was
> appropriate no matter how the code was laid out.

No disagreements, but having the flexibility to say, resolve the same
openssl problem across the tree in one commit would be pretty useful.

>
> > - Inclusive guidelines: To make progress toward an unrelated but
> > important goal at the same time, I'm recommending that the
> > openbmc/master branch will be left as-is, and the newly-created sha1
> > will be pushed to the branch openbmc/openbmc:main, to retain peoples
> > links to previous commits on master, and retain the exact project
> > history while at the same time moving the project to having more
> > inclusive naming, as has been documented previously[3].  At some point
> > in the future the master branch could be renamed and deprecated, but
> > this is considered out of scope for this specific change.
>
> This is a separate topic and should be tackled separately.  I guess it
> is simpler if you're pushing all the code into one repo to only deal
> with it there.  If this is something we want to emphasize now, I think
> the Yocto bits are in place that we could just do it relatively quickly.
> The only painful part would be all the existing commits in Gerrit that
> are unmerged and targetting `refs/for/master` but we'd have to tackle
> that with this proposed move as well.

Hence the statement "unrelated but important goal".  Agreed, this
could be tackled elsewhere and in other ways;  If we're rebuilding the
tree, this just seemed like an opportune time to do it.

>
> > - Each individual sub-project will be given a folder within
> > openbmc/openbmc based on their current repository name.  While there
> > is an opportunity to reorganize in more specific ways (ie, put all
> > ipmi-oem handler repos in a folder) this proposal intentionally
> > doesn't, under the proposition that once this change is made, any sort
> > of folder rearranging will be much easier to accomplish, and to keep
> > the scope limited.
>
> At a minimum I'd like these all put into a subdirectory off the root.
> It is bad enough with how many meta-layers we have, but we shouldn't
> then add a hundred top-level subdirectories for the code.

Seems reasonable, and is in line with what other projects have done
when they've done this.

>
> > - Yocto recipes will be changed to point to their path equivalent, and
> > inherit externalsrc bbclass[4].  This workflow is exactly the workflow
> > devtool uses to point to local repositories during a "devtool modify",
> > so it's unlikely we will have incremental build-consistency issues
> > with this approach, as was a concern in the past.
>
> Are you sure this works?  I thought externalsrc required the code to be
> in an absolute directory and not a relative one?
>
>     if externalsrc and not externalsrc.startswith("/"):
>         bb.error("EXTERNALSRC must be an absolute path")
>     if externalsrcbuild and not externalsrcbuild.startswith("/"):
>         bb.error("EXTERNALSRC_BUILD must be an absolute path")

I wasn't aware of that limitation, but the code I have does build.  If
you look at the change made in the repository, it does end up building
a full path using yocto TOPDIR (I've since figured out there's a
better variable to use that wouldn't require the ..)

https://github.com/edtanous/openbmc/blob/f84413b320249dbc3c97c2eb7abab4a3bfb3f147/meta-phosphor/recipes-phosphor/interfaces/rest-dbus_git.bb#L30

>
> The original facebook/openbmc codebase kept all of the code in the repo
> and we simply appended the directories to the SRC_URI.  It is somewhat
> of a pain to maintain the SRC_URI lists, so maybe externalsrc is better
> in that regard.  We also ran into issues with getting lots of
> pseudo-abort issues, as if Yocto didn't really support source-in-tree in
> the latest code.  In order to avoid the pseudo-abort issues I had to do
> this rather ugly hack in our code[3].  I don't know how we sanity test
> your proposal to ensure it doesn't have this issue.
>
> > - Subprojects that are intended to be reused outside of OpenBMC (ex
> > sdbusplus) will retain their previous commit, history, and trees, such
> > that they are usable outside the project.  This is intended to make
> > sure that the code that should be reusable by others remains so.
>
> How do we identify all of these?  (I spoke about this in another part of
> the chain, so we don't need to expand on it here.)

ACK.

>
> > - The above intentionally makes no changes to our subtree update
> > process, which would remain the same process as is currently.  The
> > openbmc-specific autobump job in Jenkins would be disabled considering
> > it's no longer required in this approach.
>
> Wouldn't it still be handy for the above-mentioned repos?

Yes, fair point, autobump would still be used for the projects that
are meant to be used outside of openbmc.

>
> > Let me know what you think.
>
> In general, I'm not a fan of mono-repo style.  Both the mono-repo and
> micro-repo style have issues.  I think we need to have an adequate
> discussion of what the issues are that would be _introduced_ by moving
> to a mono-repo in our case as well.  I'm not currently convinced that
> this proposal is optimizing in the way that is most beneficial to the
> project.
>
> ## Reviews
>
> You've mentioned that this will make reviews easier and I think the
> opposite is far more likely to be true.  OWNERS + Gerrit is not
> sufficient in a mono-repo (and Github doesn't solve this either).
>
> The biggest complaint, as I've heard it, has been the review cycle
> velocity.  I myself have ran into sub-repos where it takes weeks to get
> a trivial change in because the maintainers just don't stay on top of
> it.  This proposal will make the problem exponentially worse.

I'm not following how this is related;  Yes, review velocity is a
concern, but I'm not following how mono repo changes that?

>
> Our most proficient and active reviewers tend to be OWNERS higher up in
> the "merge chain".  In 2022H2, I think the top 5 reviewers handled more
> reviews than everyone else put together.  The only way I can stay somewhat on
> top of what needs my attention is by having all my Gerrit notifications
> going into a folder and deleting them as I've taken action.  With the
> current OWNERS I'm already having to delete almost half of these just by
> skimming the title (ex. "meta-not-my-company: ..." commits).  If you
> start throwing every single commit in Gerrit at me because I matched in
> OWNERS, I'll have absolutely no idea how to know what needs my attention and
> what doesn't.  How are you planning on handling this as you are a
> top-level OWNER as well?

I don't have a solution pre-baked, but my plan was some combination of
gerrit and gmail filtering;  I've done this workflow in the past for
other private large gerrit codebases.  FWIW, I don't rely on email as
much as you do, so agreed, we for sure need a solution to this that
works for the "email based maintainers" workflow.


>
> ## Out-of-Yocto builds
>
> The biggest impediment to my development tends to be the repositories
> that are not using Meson and haven't properly Supported meson
> subprojects, because it makes it almost impossible to make changes to
> those without invoking Yocto which is a much slower process.  I've
> written about this in the past[5].  If all the code is in a single
> repository, I fear there will be almost no effort put into supporting
> out-of-Yocto builds because at that point, why support them?  I wrote
> about the time involved in that post but you're taking activities that
> take seconds with Meson subprojects and turning them into 5 minutes.
>
> If we are doing something that slows down the most active developers, we
> need to make sure that the increase in contributions from other
> developers is going to more than offset it.  Based on the kind of people
> affected by the problems you're describing, I'm really not convinced it
> will.

I'm not following;  Could the meson not point to within the tree
instead of pointing at individual git repositories?  Then, from a
given tree, everything would "just build" in isolation still?  I'm
also not quite following where the 5 minutes comes from;  In general
if I want to build a given project in yocto, it's maybe an extra 30
seconds (parsing recipes) on top of doing a meson build?

Agreed, this is something we should apply effort to if we go the mono
repo approach, and I'm happy to look into solutions, even if I don't
have one fully baked just yet.  This is why I started this discussion,
so we can tease out the sharp edges.

FWIW, if both paths result in the same number of total contributions,
I'd rather it be more distributed among the community, even if it
means you and I contribute less code overall.  For the things I
maintain (user-facing APIs specifically) it would likely increase my
ability to contribute, by removing a lot of the toil (bisecting
breakages, asking "which commits are dependent on this one", ect).  I
realize that maintaining sdbusplus and maintaining bmcweb are two
different ends of the userspace stack, so I for sure could see how we
have disagreements here.

>
> ## End-to-End Features
>
> You used the concept of an "end-to-end feature" a few times in this
> proposal but talking about different things.  I'm going to specifically
> talk about a feature that requires changes across multiple existing
> repositories.
>
> A bold statement: nobody here actually implements end-to-end features.
>
> I've never witnessed a single person implement a new feature in the
> kernel, add userspace support to interact with that kernel work, add
> the Redfish APIs to interact with the userspace support they added,
> implement the WebUI to control the Redfish APIs, and then wrote system
> integration tests in phosphor-test-automation.  We draw somewhat
> arbitrary boundaries already and call something "end-to-end" because it
> happens to reside within those boundaries.  For a typical feature, for
> many developers, that boundary seems to be "Redfish + some other
> userspace app(s)".  Admittedly, this proposal does help (a little) with
> _that_ particular arbitrary boundary, but it doesn't help with anything
> outside of it.

In this case, it never has to be a single person;  If you exclude the
kernel from the above (as it's only required if you're directly
accessing hardware) I've definitely seen groups of individuals
implement a feature end to end, and there are lots of examples of
features that started in forks, developed end to end, and then merged
into the project.  Agreed, we need a better definition than "end to
end", as it's arbitrary where the ends are, but it sounds like you
agree that for a class of feature this would improve things.

>
> There is a bigger problem that this is exposing though, in my mind at
> least: many developers can't or don't work at the component level.
>
> Let's consider a "simple" change that requires:
>     - Adding a new DBus API.
>     - Adding support in App-A for said DBus API.
>     - Adding Redfish support for said DBus API in bmcweb.
>
> You're suggesting that this is hard to accomplish today, end-to-end, and maybe
> it is.  But, the fact that anyone is attempting to solve it end-to-end
> means that the resulting product is pretty terrible from a future
> development and maintenance stand-point:
>
>    * Repositories aren't using meson subproject wrap files which makes
>      developing against a change to phosphor-dbus-interfaces trivially
>      easy.

I'm not following this statement;  bmcweb uses subproject wraps, as do
a lot of the examples of applications changing that would need it.

>
>    * Developers are not developing the changes to App-A with unit-tests.

This is a totally fair statement, but for better or worse, we don't
have an official stance on unit tests, nor unit test coverage.  FWIW,
In recent history I've been asking the team members that I lead to
submit unit tests (because I believe it's in our self interest), but
this is far from universal within the project, and probably deserves a
discussion on it's own.  unit testing something with few dependencies
might be reasonable, but I don't think we have common patterns for
dependency injection and all the things that are required if we're
actually going to start requiring reasonable unit test coverage for
features.

>
>    * Developers are not confirming that their changes to App-A are sound
>      at a dbus-level, so the code is tightly coupled with however
>      they've changed bmcweb to interact with it and often crumbles when
>      another application interacts with it (ex. PLDM).

This has not been my experience.  Most developers I've seen follow the
pattern of "implement the dbus API, check the dbus api, then implement
the bmcweb changes".

>
>    * The changes to bmcweb have no unit testing and/or mocking of the DBus APIs.

I would fully support a model where sdbusplus were mockable, and
(spoiler alert) there are efforts in the works on our side to improve
this in the project which are in review;  Agreed, unit testing is a
huge problem for the project, but I really think is a distraction.
Unit tests will never cover 100% of all use cases, nor be able to be
representative of a real system to the point where, if the unit tests
pass, you can reasonably assume that the system as a whole functions.
Is there an example of another project where that unit testing model
solves this?

>
>    * There is not a single integration test added to
>      phosphor-test-automation to make sure nobody breaks this feature in
>      the future.

Agreed.

>
> Combining all the code together completely throws away the necessity to treat
> the software as components, which certainly doesn't improve all of the
> above.

I don't agree with that;  There's no reason we can't keep a
"component" architecture with everything in one repository.  Linux
maintains say, the driver interfaces in a single repository without
having to break the abstraction.

>
> Your proposal seems to be optimizing for the "I need to hack at code
> across a few repos and throw it all together into a BMC binary image so
> I can test drive it" case,

Despite disagreeing with the dramatization of the words you wrote,
yes, I want to encourage experimentation and testing in a way that
people can try stuff, fail, succeed, and in the cases they succeed, we
can reasonably get the successful things onto master.

> but I would suggest this case should rarely even
> be done by most of our developers.  The fact that this is even a "regular
> development case" to begin with is a problem.

To quote something Joel said (in a completely different context)
"There's very marginal benefits to creating a monoculture."  Everyone
develops differently, and we should support as many of peoples
workflows as we can.

>
> Everyone should be able to add a new DBus API and at least 95% of the support in
> App-A without ever touching a BMC.  You then have the other 5% that
> maybe needs some confirmation on hardware (you mocked out how you
> _think_ the hardware behaves already, right?).

Can you give an example or two of a feature that exists on master that
does that?  I agree, that sounds nice, but I feel like the reality
doesn't match with that.

>  Once that is done you
> should be able to develop the whole bmcweb feature without touching
> hardware as that is _completely_ software-based (mock out all the dbus
> interfaces for your new feature please, and please add a test case).  If
> all these pieces are working independently, you can, only then, spend a
> little time throwing it all into a single image with something like [6]
> and test-driving it, but better yet is if you also add code to
> phosphor-test-automation.

This seems like a great model, but I suspect the realities of
development would be that enforcing the above as a dev process would
cause more friction, and cause more forks, not fewer.

>
> If there are pieces of what I just wrote above that are difficult today,
> let's fix them, but combining all the code into a mono-repo is, to me,
> just a band-aid over these problems.
>
> ## Tightly coupled software
>
> I've worked on a large BMC-like product that had a mono-repo.

Me too! :)

>  The
> result was a tightly-coupled mess of code that was impossible to work
> in, so there ended up being arbitrary "component boundaries" put in
> place and nobody worked outside their "component boundary" silo.

This was in no way my experience, although it did require work from
the owners to "hold the line" on the component boundaries.  The
benefits of being able to interact with multiple portions of the tree
in a patch series far outweighed the effort that was required to hold
the component boundaries.

>  We
> already have a bit of this "silo" mentality here but at least we don't
> have the tightly-coupled aspect of it.  We have an architecture that
> allows the pieces to, mostly, move independent from each other.  How
> would we ensure that a mono-repo doesn't devolve into tightly-coupled
> code because the frictions that stop it are removed?

Good maintainership and documented intent.

>
> I think a very likely outcome of this proposal is we end up with more
> "utility" libraries that are going to increase the coupling and
> library-dependency structure, which is worse for performance.

I guess I hadn't considered that, but as it stands, utility libraries
are already being created today, is it that you think they will happen
at a greater rate?  I think shared code between implementations is
overall a good thing in a lot of cases.  Can you expand on "worse for
performance".  I'm not following.

>
> ## Reverting and large reviews
>
> I already see quite often large commits even within a single repository,
> which are difficult to review and difficult to revert.  It is currently
> on the maintainers to push back on these and request smaller commits.
> Having the code in a mono-repo seems to encourage cross-package changes
> (and in fact was listed as a selling point here), which means more
> likely that a bug introduced by one small piece of the change needs to
> have the whole change reverted.

Yes.  IMO, this is a positive, especially when the changes require
breaking incompatible changes to multiple repositories.  Ideally we'd
still separate our patches into a series, such that individual patches
could still be reverted, but that doesn't change in the mono repo
model.  "With great power comes great responsibility"  This doesn't
mean that we should avoid the power for the things that it can
improve, it just means we need to wield it responsibly.

>
> This proposal is likely to increase the average size of a commit since
> it is more likely to include cross-package changes.

Only if we (the maintainers) let it;  For what it's worth, I assumed I
personally would maintain the same stance on "split up the change into
multiple patchsets" with the added advantage that patch series could
be chained together outside of a single application, which helps
considerably in getting patches understood faster, and when reverts
need to occur cross-application, making them more obvious to
accomplish.

>  That means we also
> need more people to give feedback on an individual change and as a
> reviewer I have to sift through all the pieces that aren't even relevant
> to me.  Both of these slow the review process down even more, not increase it.

This is a fair point, but I'm not following;  Is it difficult to look
at the changelist of files changed for the subfolders you maintain?
For my workflow, I imagine it would help, because it's fewer clicks to
see a whole set of changes as a whole "ie, change made to Application
A to do X, change made to bmcweb to pick up X", even if they're
separate, but in a series.

>
> ## "To make upstreaming easier"
>
> You started with the topic of making upstreaming easier and I'm really
> not convinced that our repo structure is the major impediment to
> upstreaming.

Clearly we disagree, so it'd be great to get other community input on
this from some of the maintainers of the forks that exist.

>  Most of the advantages you talked to seemed to be around
> _development_ and not _upstreaming_.  Which is it we are solving?

Sure, we can nitpick on the title, but development velocity and
upstreaming velocity aren't unrelated, and debating the difference in
this context IMO isn't helpful.  The goal is to improve the project.
If I were able to change the title of this thread, I'd be happy to
change it to "To make development easier".

>  Do we
> really have data that indicates upstreaming is hard because we have
> multiple repositories?  I don't think I've ever heard this.  I have
> heard that development is hard[er].

I have heard this from multiple people, companies, fork owners, and
individual developers.  Without naming names, if you're one of these
people, and you're reading this, it would help a lot if you could add
your experience to this thread.

>
> ---
>
> Some of these issues I've raised could certainly be solved by stronger
> worded "guidelines" than we currently have in place (and somehow
> ensuring they are followed).  I am worried about the overall code-smell that
> will come from a monorepo (based on my past experiences with them).
>
> The biggest concern I have is with the [negative] impact to code reviews and
> I don't really have any way to solve them except for completely changing our
> code review process at the same time.  Something like the Linux maintainer
> owned subtree model maybe where a maintainer owns a fork for their part of
> the tree and we bless them at a higher level; it doesn't sound appealing.
> Maybe there is some better Gerrit tooling than what we're currently
> getting from OWNERS or maybe some other review tool.

Thank you for taking your time to make a very detailed response.
Regardless of the outcome of this, I do appreciate it.





>
> [1]: https://lore.kernel.org/openbmc/20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com/
> [2]: https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/disabling-issues
> [3]: https://github.com/facebook/openbmc/commit/e418bfbcf382185fdffb768a012e762a4600ae63#diff-b0fea89439c1004ad5229cb7058b4740ee1c542b32cfb0d2165788f9020b5da0R1
> [4]: https://github.com/williamspatrick/openbmc-tof-election-data/blob/995f0d73184db7c25446284261cc023af611e7c4/2021H2/data/report.json#L1
> [5]: https://www.stwcx.xyz/blog/2021/04/18/meson-subprojects.html
> [6]: https://github.com/williamspatrick/dotfiles/commit/df180ac2b74f2b7fcb6ae91302f0211bc49cb2e9
> --
> Patrick Williams
