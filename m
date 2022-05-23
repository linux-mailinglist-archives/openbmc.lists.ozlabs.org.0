Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF853531D65
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 23:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6VLB6Jsdz3blX
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 07:08:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g23sOIsI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2b;
 helo=mail-io1-xd2b.google.com; envelope-from=jebr@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=g23sOIsI; dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6VKl2ZcRz3bbQ
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 07:08:09 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id q203so16641130iod.0
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 14:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ru9eDkB30qtxNIuiLDOfJ5nmTE3xLwTo1DLW7FD7d4Y=;
 b=g23sOIsIgxOFlyA1izkJOm45zoBqxhHytRdBE8X3jqezCE+u6/xV4cTGLx5m+Zuf0a
 6RrUXKtXGkGXXz1Rm31zXmGaCj2y/yzJCyZ1OoFHECVwbdGCaqkB/nnkhfzNcKPkBXdc
 4AYTWtg1J8G8VMR+K5rUtnaxx0EY9gNBB32dft5OKpp+xsdzcWuYaY+TkkPnH1mAyhge
 LyEWK4T/uhVpN7y754RSmeP6Q1feN04xYc3DxQlRGlF+el11kEHX+bSaGx00nyF/iujc
 +3aeb2y2qD87ufbdKgWnKizcxnq9gjUhlstoAPe93/268MvyXrzSGfdLENr8YT952l/5
 Upig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ru9eDkB30qtxNIuiLDOfJ5nmTE3xLwTo1DLW7FD7d4Y=;
 b=0NWIOyI9FrYLwdnrExFVimICzkInXbtI+0/TmYcyq0hFSJxop30kArHZojRnnxMwxz
 I/MiPY1mLNQ4XbN3pwMqw0iaKAtWJ78qnlaXIja9sHxcTbFYYRa89krrUz1XmIKbv/HR
 jrejptLJWNLpE6vlbjiPdmPy5Sh20lBC3hfzTucWDcDdxqLIaAjIScMQNDblnL4jj7rd
 huFWElE9H+CSkVdBqnWyRKrMHGber8jhpDfy2SoyITupMSjINop/4mHwMp4D96CUsaQK
 LShqZI0cvs5BVCUeb/r/N9SKG1KXsuRHmY/Qzz4AwoltJV9TLuTW1fvlBXv9nuKVXB73
 wPGA==
X-Gm-Message-State: AOAM532zFaV0y2Xc72AL3PHlORN7CxaoUlq+X1Suvvho1Cn1GdWfkPv2
 iLWmx4kgsARZ5EcmWOcAfpmsdlukR3qgviGaCaNCLA==
X-Google-Smtp-Source: ABdhPJxa6NrrGLzAr4LfKDXC5Po0NrO7lPTwfrGNbnc7lW1JPlCroM1bRAx/FIJY7hvkj/YsKw/3pO6msrl7LKMhOdA=
X-Received: by 2002:a02:230a:0:b0:32b:6f71:4411 with SMTP id
 u10-20020a02230a000000b0032b6f714411mr12877651jau.214.1653340086399; Mon, 23
 May 2022 14:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
 <CAEAQM=Lo9AcUrw1c2bT_pYNtG0LpT9w2=McMbx=RY=SP0V_4PA@mail.gmail.com>
 <CAH2-KxBqT-A91Jpj9ENTcajvgzO=oDRsTUPe=eLaOVBhVSjDqw@mail.gmail.com>
In-Reply-To: <CAH2-KxBqT-A91Jpj9ENTcajvgzO=oDRsTUPe=eLaOVBhVSjDqw@mail.gmail.com>
From: John Broadbent <jebr@google.com>
Date: Mon, 23 May 2022 14:07:55 -0700
Message-ID: <CAPw1Ef_dMf43e567LLAfMZp6khWWQAm=i63LHfOwWkyiSe-MFA@mail.gmail.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="0000000000008b5b7805dfb43c7b"
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

--0000000000008b5b7805dfb43c7b
Content-Type: text/plain; charset="UTF-8"

Main thoughts:

We have several patches that we apply to the project. When we update those
patches we see a diff of the patches, and it can be difficult to review a
diff of a diff.
I believe this new repo system would allow us to apply those patches to a
source tree, and manage/maintain the patches better.
>  "I have no interest in making this easier for you (if it is worse in
other ways for the project)."   - referring to downstream only features.

This is the wrong way to view features the community does not want, and
features we would not be allowed to share. There is a layer of complexity
that we use to integrate with our data centers services that only we need.
A better model would allow openbmc to be flexible enough to enable
downstream features.

Other thoughts:

   - I suppose it would make it easy for others to fork the project, but I
   don't think that is a strong enough reason to prevent consolidation.
   - The consolidation would make it easier to bring new people up to
   speed. (the system we have works fine, but I suspect the consolidation will
   be a improvement)
   - We are not changing OWNERS in the change.
   - Applications vs distribution: I have always viewed openbmc as a
   collection of application services/applications, combined with a distros.



On Mon, May 23, 2022 at 9:38 AM Ed Tanous <edtanous@google.com> wrote:

> On Thu, May 19, 2022 at 2:12 PM Cody Smith <scody@google.com> wrote:
> >
> > I don't seem to have the original message, so this may get added to
> Andrew's branch of this thread. Sorry about that in advance.
>
> The original message got caught in a lot of peoples spam filters, I'm
> hoping that explains some of the lack of reply to the initial
> proposal.
>
> >
> > In general I support moving to a monorepo. We at Google do this, and my
> significant other at Airbnb also utilizes a monorepo. The advantages are
> significant, as the world gets a lot less silo'd and making changes that
> would have spanned across multiple repos now only span the monorepo. This
> is particularly useful when feature X requires changes to repo A, B and C,
> and the changes on their own break things but shipped together are just
> fine. I don't even really know how such a feature gets shipped today to be
> honest.
>
> I agree with your general sentiment, although a couple nitpicks, what
> I propose above isn't pure "monorepo" and more analogous to
> "consolidate a lot of the repos".  FWIW, although I really think it's
> the right thing to do, "other companies do it for other things" isn't
> the best of arguments we can make for this.  There are plenty of
> counter examples of companies with much more entrenched command chains
> that use multiple repos and the creation of repos as a form of project
> management to great effect.
>
> >
> > The other thing that tends to happen with monorepos is a lot more
> conformity, as reviews are carried out by a larger set of people.
>
> +1.  Applying consistent clang-format to the codebase for example
> would be a lot more trivial.
>
> > Suddenly `bmcweb` is being reviewed by people who may not have
> previously cared about or touched that part of the codebase as a bad
> example. At a minimum more people will have eyes on the changes happening.
> >
> > I also think that a monorepo avoids one maintainer "lording" over a
> repo. It happens, the +2ers kind of play a role of the bridge troll, when
> repo X only has 1-2 +2ers, this can be a real problem. A monorepo with 10+
> +2ers will force the +2ers to engage in debate when they disagree with each
> other, instead of lording over their own kingdoms and having no influence
> over other kingdoms so to speak.
>
> In what I propose, I don't really think this changes given that the
> existing OWNERS files would still be largely the same, although I
> agree, more +2er debate would be a good thing if it was the result.
>
> >
> > I haven't made a great set of arguments here but in general I feel like
> a chance like this would help from an organizational perspective and maybe
> with that better org. in place maybe we can begin addressing some of the
> other issues we need to address.
>
> Thanks for your input.
>
> PS, plaintext is generally prefered on this ML, given that it diffs
> better in the tools.  (Click triple dot in the lower right of gmail,
> then check "plain text mode").
>
> >
> > Cody Smith
> > System Software Engineer
> > Google Cloud Platform Core Services Team
> > scody@google.com
> > 720-515-6105 <(720)%20515-6105>
> >
> >
> >
> > On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >>
> >> Hi Ed,
> >>
> >> I think what's below largely points to a bit of an identity crisis for
> >> the project, on a couple of fronts. Fundamentally OpenBMC is a distro
> >> (or as Yocto likes to point out, a meta-distro), and we can:
> >>
> >> 1. Identify as a traditional OSS distro: An integration of otherwise
> >>    independent applications
> >>
> >> 2. Identify as an appliance distro: The distro and the
> >>    applications are a monolith
> >>
> >> You're proposing 2, while I think there exists some tension towards 1.
> >>
> >> With the amount of custom userspace we've always kinda sat in-between.
> >> I'd like to see libraries and applications that have use cases outside
> >> of OpenBMC be accessible to people with those external use cases,
> >> without being burdened by understanding the rest of the OpenBMC context.
> >> I have a concern that by integrating things in the way you're proposing
> >> it will lead to more inertia there (e.g. for implementations of
> >> standards MCTP or PLDM (libmctp and libpldm)).
> >>
> >> On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:
> >> > The OpenBMC development process as it stands is difficult for people
> >> > new to the project to understand, which severely limits our ability to
> >> > onboard new maintainers, developers, and groups which would otherwise
> >> > contribute major features to upstream, but don't have the technical
> >> > expertise to do so.  This initiative, much like others before it[1] is
> >> > attempting to reduce the toil and OpenBMC-specific processes of
> >> > passing changes amongst the community, and move things to being more
> >> > like other projects that have largely solved this problem already.
> >>
> >> Can you be more specific about which projects here? Do you have links
> >> to examples?
> >>
> >> >
> >> > To that end, I'd like to propose a change to the way we structure our
> >> > repositories within the project: specifically, putting (almost) all of
> >> > the Linux Foundation OpenBMC owned code into a single repo that we can
> >> > version as a single entity, rather than spreading out amongst many
> >> > repos.  In practice, this would have some significant advantages:
> >> >
> >> > - The tree would be easily shareable amongst the various people
> >> > working on OpenBMC, without having to rely on a single-source Gerrit
> >> > instance.  Git is designed to be distributed, but if our recipe files
> >> > point at other repositories, it largely defeats a lot of this
> >> > capability.  Today, if you want to share a tree that has a change in
> >> > it, you have to fork the main tree, then fork every single subproject
> >> > you've made modifications to, then update the main tree to point to
> >> > your forks.
> >>
> >> This isn't true, as you can add patches in the OpenBMC tree.
> >>
> >> CI prevents these from being submitted, as it should, but there's
> nothing to
> >> stop anyone using the `devtool modify ...` / `devtool finish ...` and
> >> committing the result as a workflow to exchange state (I do this)?
> >>
> >> Is the issue instead with devtool? Is it bad? Is the learning curve too
> steep?
> >> It is at least the Yocto workflow.
> >>
> >> > This gets very onerous over time, especially for simple
> >> > commits.  Having maintained several different companies forks
> >> > personally, and spoken to many others having problems with the same,
> >> > adding major features are difficult to test and rebase because of
> >> > this.  Moving the code to a single tree makes a lot of the toil of
> >> > tagging and modifying local trees a lot more manageable, as a series
> >> > of well-documented git commands (generally git rebase[2]).  It also
> >> > increases the likelihood that someone pulls down the fork to test it
> >> > if it's highly likely that they can apply it to their own tree in a
> >> > single command.
> >>
> >> Again, this is moot if the patches are applied in-tree.
> >>
> >> >
> >> > - There would be a reduction in reviews.  Today, anytime a person
> >> > wants to make a change that would involve any part of the tree,
> >> > there's at least 2 code reviews, one for the commit, and one for the
> >> > recipe bump.  Compared to a single tree, this at least doubles the
> >> > number of reviews we need to process.
> >>
> >> Is there more work? Yes.
> >>
> >> Is it always double? No. Is it sometimes double? Yes.
> >>
> >> Often bumps batch multiple application commits. I think this paragraph
> >> overstates the problem somewhat, but what it does get right is
> >> identifying that *some* overhead exists.
> >>
> >> >  For changes that want to make
> >> > any change to a few subsystems, as is the case when developing a
> >> > feature, they require 2 X <number of project changes> reviews, all of
> >> > which need to be synchronized.
> >>
> >> Same issue as above here.
> >>
> >> > There is a well documented problem
> >> > where we have no official way to synchronize merging of changes to
> >> > userspace applications within a bump without manual human
> >> > intervention.  This would largely render that problem moot.
> >>
> >> Right, this can be hard to handle.
> >>
> >> It can be mitigated by versioning interfaces (which the D-Bus spec
> >> calls out[6][7] but OpenBMC fails to do (?)) and supporting multiple
> >> interfaces for the transition period.
> >>
> >> That said, that's also more work, and so needs to be considered in the
> >> set of trade-offs.
> >>
> >> [6]
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-interface
> >> [7]
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus
> >>
> >> >
> >> > - It would allow most developers to not need to understand Yocto at
> >> > all to do their day to day work on existing applications.  No more
> >> > "devtool modify", and related SRCREV bumps.  This will help most of
> >> > the new developers on the project with a lower mental load, which will
> >> > mean people are able to ramp up faster..
> >>
> >> Okay. So devtool is seen as an issue.
> >>
> >> Can we improve its visibility and any education around it? Or is it a
> >> lost cause? If so, why?
> >>
> >> Separately, I'm concerned this is an attempt to shield people from
> >> skills that help them work with upstream Yocto. OpenBMC feels like it's
> >> a bit of an on-ramp for open-source contributions for people who have
> >> worked in what was previously quite a proprietary environment. We tried
> >> shielding people in the past wrt kernel contributions, and that failed
> >> pretty spectacularly. We (at least Joel and I) now encourage people to
> >> work with upstream directly *and support them in the process of doing
> >> that* rather than trying to mitigate some of the difficulties with
> >> working upstream by avoiding them.
> >>
> >> >
> >> > - It would give an opportunity for individuals and companies to "own"
> >> > well-supported public forks (ie Redhat) of the codebase, which would
> >> > increase participation in the project overall.  This already happens
> >> > quite a bit, but in practice, the forks that do it squash history,
> >> > making it nearly impossible to get their changes upstreamed from an
> >> > outside entity.
> >>
> >> Not sure this is something we want to encourage, even if it happens in
> >> practice.
> >>
> >> >
> >> > - It would centralize the bug databases.  Today, bugs filed against
> >> > sub projects tend to not get answered.
> >>
> >> Do you have some numbers handy?
> >>
> >> > Having all the bugs in
> >> > openbmc/openbmc would help in the future to avoid duplicating bugs
> >> > across projects.
> >>
> >> Has this actually been a problem?
> >>
> >> >
> >> > - Would increase the likelihood that someone contributes a patch,
> >> > especially a patch written by someone else.  If contributing a patch
> >> > was just a matter of cherry-picking a tree of commits and submitting
> >> > it to gerrit, it's a lot more likely that people would do it.
> >>
> >> It sounds plausible, but again, some evidence for this would be helpful.
> >>
> >> Why is this easier than submitting the patches to the application repo?
> >>
> >> > My proposed version of this tree is pushed to a github fork here, and
> >> > is based on the tree from a few weeks ago:
> >> > https://github.com/edtanous/openbmc
> >> >
> >> > It implements all the above for the main branch.  This tree is based
> >> > on the output of the automated tooling, and in the case where this
> >> > proposal is accepted, the tooling would be re-run to capture the state
> >> > of the tree at the point where we chose to make this change.
> >> >
> >> > The tool I wrote to generate this tree is also published, if you're
> >> > interested in how this tree was built, and is quite interesting in its
> >> > use of git export/import [5], but functionally, I would not expect
> >> > that tooling to survive after this transition is made.
> >>
> >> I think it would be good to capture the script in openbmc-tools if we
> >> choose to go ahead with this, mainly as a record of how we achieved it.
> >>
> >> Andrew
> >>
> >> >
> >> > [1]
> >> >
> https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/
> >> > [2] https://git-scm.com/docs/git-rebase
> >> > [3]
> >> >
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
> >> > [4]
> >> >
> https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc
> >> > [5] https://github.com/edtanous/obmc-repo-combine/blob/main/combine
>

--0000000000008b5b7805dfb43c7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Main thoughts:<div><br>We have several patches that we app=
ly to the project. When we update those patches we see a diff of the patche=
s, and it can be difficult to review a diff of a diff.<br>I believe this ne=
w repo system would allow us to apply those patches to a source tree, and m=
anage/maintain the patches better.<br></div><div>&gt;=C2=A0 &quot;I have no=
 interest in making this easier for you (if it is worse in other ways for t=
he project).&quot;=C2=A0 =C2=A0- referring=C2=A0to downstream only features=
.=C2=A0</div><div><br></div><div>This is the wrong way to view features the=
 community does not want, and features we would not be allowed to share. Th=
ere is a layer of complexity that we use to integrate with our data centers=
=C2=A0services that only we need. A better model would allow openbmc to be =
flexible=C2=A0enough=C2=A0to enable downstream features.</div><div><br>Othe=
r thoughts:<br><ul><li>I suppose it would make it easy for others to fork t=
he project, but I don&#39;t think that is a strong enough reason to prevent=
 consolidation.</li><li>The consolidation would make it easier to bring new=
 people up to speed. (the system we have works fine, but I suspect the cons=
olidation will be a improvement)</li><li>We are not changing OWNERS in the =
change.</li><li>Applications vs distribution: I have always viewed=C2=A0ope=
nbmc as a collection of application services/applications, combined with a =
distros.=C2=A0</li></ul></div></div><br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, May 23, 2022 at 9:38 AM Ed Tanous=
 &lt;<a href=3D"mailto:edtanous@google.com" target=3D"_blank">edtanous@goog=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, May 19, 2022 at 2:12 PM Cody Smith &lt;<a href=3D"mailto:scod=
y@google.com" target=3D"_blank">scody@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I don&#39;t seem to have the original message, so this may get added t=
o Andrew&#39;s branch of this thread. Sorry about that in advance.<br>
<br>
The original message got caught in a lot of peoples spam filters, I&#39;m<b=
r>
hoping that explains some of the lack of reply to the initial<br>
proposal.<br>
<br>
&gt;<br>
&gt; In general I support moving to a monorepo. We at Google do this, and m=
y significant other at Airbnb also utilizes a monorepo. The advantages are =
significant, as the world gets a lot less silo&#39;d and making changes tha=
t would have spanned across multiple repos now only span the monorepo. This=
 is particularly useful when feature X requires changes to repo A, B and C,=
 and the changes on their own break things but shipped together are just fi=
ne. I don&#39;t even really know how such a feature gets shipped today to b=
e honest.<br>
<br>
I agree with your general sentiment, although a couple nitpicks, what<br>
I propose above isn&#39;t pure &quot;monorepo&quot; and more analogous to<b=
r>
&quot;consolidate a lot of the repos&quot;.=C2=A0 FWIW, although I really t=
hink it&#39;s<br>
the right thing to do, &quot;other companies do it for other things&quot; i=
sn&#39;t<br>
the best of arguments we can make for this.=C2=A0 There are plenty of<br>
counter examples of companies with much more entrenched command chains<br>
that use multiple repos and the creation of repos as a form of project<br>
management to great effect.<br>
<br>
&gt;<br>
&gt; The other thing that tends to happen with monorepos is a lot more conf=
ormity, as reviews are carried out by a larger set of people.<br>
<br>
+1.=C2=A0 Applying consistent clang-format to the codebase for example<br>
would be a lot more trivial.<br>
<br>
&gt; Suddenly `bmcweb` is being reviewed by people who may not have previou=
sly cared about or touched that part of the codebase as a bad example. At a=
 minimum more people will have eyes on the changes happening.<br>
&gt;<br>
&gt; I also think that a monorepo avoids one maintainer &quot;lording&quot;=
 over a repo. It happens, the +2ers kind of play a role of the bridge troll=
, when repo X only has 1-2 +2ers, this can be a real problem. A monorepo wi=
th 10+ +2ers will force the +2ers to engage in debate when they disagree wi=
th each other, instead of lording over their own kingdoms and having no inf=
luence over other kingdoms so to speak.<br>
<br>
In what I propose, I don&#39;t really think this changes given that the<br>
existing OWNERS files would still be largely the same, although I<br>
agree, more +2er debate would be a good thing if it was the result.<br>
<br>
&gt;<br>
&gt; I haven&#39;t made a great set of arguments here but in general I feel=
 like a chance like this would help from an organizational perspective and =
maybe with that better org. in place maybe we can begin addressing some of =
the other issues we need to address.<br>
<br>
Thanks for your input.<br>
<br>
PS, plaintext is generally prefered on this ML, given that it diffs<br>
better in the tools.=C2=A0 (Click triple dot in the lower right of gmail,<b=
r>
then check &quot;plain text mode&quot;).<br>
<br>
&gt;<br>
&gt; Cody Smith<br>
&gt; System Software Engineer<br>
&gt; Google Cloud Platform Core Services Team<br>
&gt; <a href=3D"mailto:scody@google.com" target=3D"_blank">scody@google.com=
</a><br>
&gt; <a href=3D"tel:(720)%20515-6105" value=3D"+17205156105" target=3D"_bla=
nk">720-515-6105</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery &lt;<a href=3D"mailto:an=
drew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Ed,<br>
&gt;&gt;<br>
&gt;&gt; I think what&#39;s below largely points to a bit of an identity cr=
isis for<br>
&gt;&gt; the project, on a couple of fronts. Fundamentally OpenBMC is a dis=
tro<br>
&gt;&gt; (or as Yocto likes to point out, a meta-distro), and we can:<br>
&gt;&gt;<br>
&gt;&gt; 1. Identify as a traditional OSS distro: An integration of otherwi=
se<br>
&gt;&gt;=C2=A0 =C2=A0 independent applications<br>
&gt;&gt;<br>
&gt;&gt; 2. Identify as an appliance distro: The distro and the<br>
&gt;&gt;=C2=A0 =C2=A0 applications are a monolith<br>
&gt;&gt;<br>
&gt;&gt; You&#39;re proposing 2, while I think there exists some tension to=
wards 1.<br>
&gt;&gt;<br>
&gt;&gt; With the amount of custom userspace we&#39;ve always kinda sat in-=
between.<br>
&gt;&gt; I&#39;d like to see libraries and applications that have use cases=
 outside<br>
&gt;&gt; of OpenBMC be accessible to people with those external use cases,<=
br>
&gt;&gt; without being burdened by understanding the rest of the OpenBMC co=
ntext.<br>
&gt;&gt; I have a concern that by integrating things in the way you&#39;re =
proposing<br>
&gt;&gt; it will lead to more inertia there (e.g. for implementations of<br=
>
&gt;&gt; standards MCTP or PLDM (libmctp and libpldm)).<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:<br>
&gt;&gt; &gt; The OpenBMC development process as it stands is difficult for=
 people<br>
&gt;&gt; &gt; new to the project to understand, which severely limits our a=
bility to<br>
&gt;&gt; &gt; onboard new maintainers, developers, and groups which would o=
therwise<br>
&gt;&gt; &gt; contribute major features to upstream, but don&#39;t have the=
 technical<br>
&gt;&gt; &gt; expertise to do so.=C2=A0 This initiative, much like others b=
efore it[1] is<br>
&gt;&gt; &gt; attempting to reduce the toil and OpenBMC-specific processes =
of<br>
&gt;&gt; &gt; passing changes amongst the community, and move things to bei=
ng more<br>
&gt;&gt; &gt; like other projects that have largely solved this problem alr=
eady.<br>
&gt;&gt;<br>
&gt;&gt; Can you be more specific about which projects here? Do you have li=
nks<br>
&gt;&gt; to examples?<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; To that end, I&#39;d like to propose a change to the way we s=
tructure our<br>
&gt;&gt; &gt; repositories within the project: specifically, putting (almos=
t) all of<br>
&gt;&gt; &gt; the Linux Foundation OpenBMC owned code into a single repo th=
at we can<br>
&gt;&gt; &gt; version as a single entity, rather than spreading out amongst=
 many<br>
&gt;&gt; &gt; repos.=C2=A0 In practice, this would have some significant ad=
vantages:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - The tree would be easily shareable amongst the various peop=
le<br>
&gt;&gt; &gt; working on OpenBMC, without having to rely on a single-source=
 Gerrit<br>
&gt;&gt; &gt; instance.=C2=A0 Git is designed to be distributed, but if our=
 recipe files<br>
&gt;&gt; &gt; point at other repositories, it largely defeats a lot of this=
<br>
&gt;&gt; &gt; capability.=C2=A0 Today, if you want to share a tree that has=
 a change in<br>
&gt;&gt; &gt; it, you have to fork the main tree, then fork every single su=
bproject<br>
&gt;&gt; &gt; you&#39;ve made modifications to, then update the main tree t=
o point to<br>
&gt;&gt; &gt; your forks.<br>
&gt;&gt;<br>
&gt;&gt; This isn&#39;t true, as you can add patches in the OpenBMC tree.<b=
r>
&gt;&gt;<br>
&gt;&gt; CI prevents these from being submitted, as it should, but there&#3=
9;s nothing to<br>
&gt;&gt; stop anyone using the `devtool modify ...` / `devtool finish ...` =
and<br>
&gt;&gt; committing the result as a workflow to exchange state (I do this)?=
<br>
&gt;&gt;<br>
&gt;&gt; Is the issue instead with devtool? Is it bad? Is the learning curv=
e too steep?<br>
&gt;&gt; It is at least the Yocto workflow.<br>
&gt;&gt;<br>
&gt;&gt; &gt; This gets very onerous over time, especially for simple<br>
&gt;&gt; &gt; commits.=C2=A0 Having maintained several different companies =
forks<br>
&gt;&gt; &gt; personally, and spoken to many others having problems with th=
e same,<br>
&gt;&gt; &gt; adding major features are difficult to test and rebase becaus=
e of<br>
&gt;&gt; &gt; this.=C2=A0 Moving the code to a single tree makes a lot of t=
he toil of<br>
&gt;&gt; &gt; tagging and modifying local trees a lot more manageable, as a=
 series<br>
&gt;&gt; &gt; of well-documented git commands (generally git rebase[2]).=C2=
=A0 It also<br>
&gt;&gt; &gt; increases the likelihood that someone pulls down the fork to =
test it<br>
&gt;&gt; &gt; if it&#39;s highly likely that they can apply it to their own=
 tree in a<br>
&gt;&gt; &gt; single command.<br>
&gt;&gt;<br>
&gt;&gt; Again, this is moot if the patches are applied in-tree.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - There would be a reduction in reviews.=C2=A0 Today, anytime=
 a person<br>
&gt;&gt; &gt; wants to make a change that would involve any part of the tre=
e,<br>
&gt;&gt; &gt; there&#39;s at least 2 code reviews, one for the commit, and =
one for the<br>
&gt;&gt; &gt; recipe bump.=C2=A0 Compared to a single tree, this at least d=
oubles the<br>
&gt;&gt; &gt; number of reviews we need to process.<br>
&gt;&gt;<br>
&gt;&gt; Is there more work? Yes.<br>
&gt;&gt;<br>
&gt;&gt; Is it always double? No. Is it sometimes double? Yes.<br>
&gt;&gt;<br>
&gt;&gt; Often bumps batch multiple application commits. I think this parag=
raph<br>
&gt;&gt; overstates the problem somewhat, but what it does get right is<br>
&gt;&gt; identifying that *some* overhead exists.<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 For changes that want to make<br>
&gt;&gt; &gt; any change to a few subsystems, as is the case when developin=
g a<br>
&gt;&gt; &gt; feature, they require 2 X &lt;number of project changes&gt; r=
eviews, all of<br>
&gt;&gt; &gt; which need to be synchronized.<br>
&gt;&gt;<br>
&gt;&gt; Same issue as above here.<br>
&gt;&gt;<br>
&gt;&gt; &gt; There is a well documented problem<br>
&gt;&gt; &gt; where we have no official way to synchronize merging of chang=
es to<br>
&gt;&gt; &gt; userspace applications within a bump without manual human<br>
&gt;&gt; &gt; intervention.=C2=A0 This would largely render that problem mo=
ot.<br>
&gt;&gt;<br>
&gt;&gt; Right, this can be hard to handle.<br>
&gt;&gt;<br>
&gt;&gt; It can be mitigated by versioning interfaces (which the D-Bus spec=
<br>
&gt;&gt; calls out[6][7] but OpenBMC fails to do (?)) and supporting multip=
le<br>
&gt;&gt; interfaces for the transition period.<br>
&gt;&gt;<br>
&gt;&gt; That said, that&#39;s also more work, and so needs to be considere=
d in the<br>
&gt;&gt; set of trade-offs.<br>
&gt;&gt;<br>
&gt;&gt; [6] <a href=3D"https://dbus.freedesktop.org/doc/dbus-specification=
.html#message-protocol-names-interface" rel=3D"noreferrer" target=3D"_blank=
">https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol=
-names-interface</a><br>
&gt;&gt; [7] <a href=3D"https://dbus.freedesktop.org/doc/dbus-specification=
.html#message-protocol-names-bus" rel=3D"noreferrer" target=3D"_blank">http=
s://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names=
-bus</a><br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - It would allow most developers to not need to understand Yo=
cto at<br>
&gt;&gt; &gt; all to do their day to day work on existing applications.=C2=
=A0 No more<br>
&gt;&gt; &gt; &quot;devtool modify&quot;, and related SRCREV bumps.=C2=A0 T=
his will help most of<br>
&gt;&gt; &gt; the new developers on the project with a lower mental load, w=
hich will<br>
&gt;&gt; &gt; mean people are able to ramp up faster..<br>
&gt;&gt;<br>
&gt;&gt; Okay. So devtool is seen as an issue.<br>
&gt;&gt;<br>
&gt;&gt; Can we improve its visibility and any education around it? Or is i=
t a<br>
&gt;&gt; lost cause? If so, why?<br>
&gt;&gt;<br>
&gt;&gt; Separately, I&#39;m concerned this is an attempt to shield people =
from<br>
&gt;&gt; skills that help them work with upstream Yocto. OpenBMC feels like=
 it&#39;s<br>
&gt;&gt; a bit of an on-ramp for open-source contributions for people who h=
ave<br>
&gt;&gt; worked in what was previously quite a proprietary environment. We =
tried<br>
&gt;&gt; shielding people in the past wrt kernel contributions, and that fa=
iled<br>
&gt;&gt; pretty spectacularly. We (at least Joel and I) now encourage peopl=
e to<br>
&gt;&gt; work with upstream directly *and support them in the process of do=
ing<br>
&gt;&gt; that* rather than trying to mitigate some of the difficulties with=
<br>
&gt;&gt; working upstream by avoiding them.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - It would give an opportunity for individuals and companies =
to &quot;own&quot;<br>
&gt;&gt; &gt; well-supported public forks (ie Redhat) of the codebase, whic=
h would<br>
&gt;&gt; &gt; increase participation in the project overall.=C2=A0 This alr=
eady happens<br>
&gt;&gt; &gt; quite a bit, but in practice, the forks that do it squash his=
tory,<br>
&gt;&gt; &gt; making it nearly impossible to get their changes upstreamed f=
rom an<br>
&gt;&gt; &gt; outside entity.<br>
&gt;&gt;<br>
&gt;&gt; Not sure this is something we want to encourage, even if it happen=
s in<br>
&gt;&gt; practice.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - It would centralize the bug databases.=C2=A0 Today, bugs fi=
led against<br>
&gt;&gt; &gt; sub projects tend to not get answered.<br>
&gt;&gt;<br>
&gt;&gt; Do you have some numbers handy?<br>
&gt;&gt;<br>
&gt;&gt; &gt; Having all the bugs in<br>
&gt;&gt; &gt; openbmc/openbmc would help in the future to avoid duplicating=
 bugs<br>
&gt;&gt; &gt; across projects.<br>
&gt;&gt;<br>
&gt;&gt; Has this actually been a problem?<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - Would increase the likelihood that someone contributes a pa=
tch,<br>
&gt;&gt; &gt; especially a patch written by someone else.=C2=A0 If contribu=
ting a patch<br>
&gt;&gt; &gt; was just a matter of cherry-picking a tree of commits and sub=
mitting<br>
&gt;&gt; &gt; it to gerrit, it&#39;s a lot more likely that people would do=
 it.<br>
&gt;&gt;<br>
&gt;&gt; It sounds plausible, but again, some evidence for this would be he=
lpful.<br>
&gt;&gt;<br>
&gt;&gt; Why is this easier than submitting the patches to the application =
repo?<br>
&gt;&gt;<br>
&gt;&gt; &gt; My proposed version of this tree is pushed to a github fork h=
ere, and<br>
&gt;&gt; &gt; is based on the tree from a few weeks ago:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/edtanous/openbmc" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/edtanous/openbmc</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It implements all the above for the main branch.=C2=A0 This t=
ree is based<br>
&gt;&gt; &gt; on the output of the automated tooling, and in the case where=
 this<br>
&gt;&gt; &gt; proposal is accepted, the tooling would be re-run to capture =
the state<br>
&gt;&gt; &gt; of the tree at the point where we chose to make this change.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The tool I wrote to generate this tree is also published, if =
you&#39;re<br>
&gt;&gt; &gt; interested in how this tree was built, and is quite interesti=
ng in its<br>
&gt;&gt; &gt; use of git export/import [5], but functionally, I would not e=
xpect<br>
&gt;&gt; &gt; that tooling to survive after this transition is made.<br>
&gt;&gt;<br>
&gt;&gt; I think it would be good to capture the script in openbmc-tools if=
 we<br>
&gt;&gt; choose to go ahead with this, mainly as a record of how we achieve=
d it.<br>
&gt;&gt;<br>
&gt;&gt; Andrew<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [1]<br>
&gt;&gt; &gt; <a href=3D"https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj=
_bGAu=3D1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/" rel=3D"noreferrer" tar=
get=3D"_blank">https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=3D1S=
SLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/</a><br>
&gt;&gt; &gt; [2] <a href=3D"https://git-scm.com/docs/git-rebase" rel=3D"no=
referrer" target=3D"_blank">https://git-scm.com/docs/git-rebase</a><br>
&gt;&gt; &gt; [3]<br>
&gt;&gt; &gt; <a href=3D"https://github.com/openbmc/docs/blob/master/CONTRI=
BUTING.md#inclusive-naming" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming</a><br>
&gt;&gt; &gt; [4]<br>
&gt;&gt; &gt; <a href=3D"https://www.yoctoproject.org/docs/1.8/ref-manual/r=
ef-manual.html#ref-classes-externalsrc" rel=3D"noreferrer" target=3D"_blank=
">https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-clas=
ses-externalsrc</a><br>
&gt;&gt; &gt; [5] <a href=3D"https://github.com/edtanous/obmc-repo-combine/=
blob/main/combine" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
edtanous/obmc-repo-combine/blob/main/combine</a><br>
</blockquote></div>

--0000000000008b5b7805dfb43c7b--
