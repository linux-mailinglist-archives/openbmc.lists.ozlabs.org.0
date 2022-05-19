Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A552DEFD
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 23:13:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L42dX29syz3bWg
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 07:13:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=p1w3T+tl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=scody@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=p1w3T+tl; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L42d42w3qz2ywr
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 07:12:55 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id h29so11218002lfj.2
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 14:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hsixOBg1J9MuCdrniyXcllOu2SH7tfPYRYlUvZofSN4=;
 b=p1w3T+tlu3Da3Q96oxyOBfq2FVb/obTV1nHA05P355EjSbdtvH274PsBzVrKy4WtAn
 72TOLDsKhvx+PMPe4U5ulDQaUKstmE4A+U3ZfngAxtQM/BmE0JJUFqmZdx6tNJd2qnAF
 05ecZddk72KpdAb5iLNcZavICwYiychhvPv5ZSRM4X0DQIWF5Guut8g+HEJioKoNfLTY
 YCi+PMHxqJuivcnhYy9yz9NyBcZXJuravDw7K5k0cTAO1mm7nUExlivI2UHlbISH+RHP
 P5zXsCN1VDHNndpzxE+r3+kibOkqqSKtg35gmn7TDd7/4iUuH/gfQHHeuzDVTDJ8Dmp9
 8h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hsixOBg1J9MuCdrniyXcllOu2SH7tfPYRYlUvZofSN4=;
 b=ogw4lr3cYj/1b6g25KMU/snfs1Fd+2lywFNziSxGVK+vXHunvFmoIsDj6ldEez5Rt0
 O5Ot+5uUCJNNWZyM3guhxWshfCOjUg7GO68+NfgfRntFaP35L0byH96lk0fGwMp0DA4p
 KgriManEx+BD9qAYTzP7emKCKsCBPH+LsMTxZVdP0X9JAvhfNcti1N1tMDLDL1d06/pd
 7IGLmnAZc+Qjmw7ia9twVK9hLhDo488xR4j0Luo37SR/q1rkP1RNwQ0q6z4HZzM22B26
 xr7VW5zwHkVYhLk2qWbP1usuoOg5/UraUfgX/BbzQyPMVvjj1DXX6L/wDu2OdJyJ2vlG
 MLYg==
X-Gm-Message-State: AOAM5325ajOj3TgKbwmqOB5IGHtfUoiYLaCPgHemhWnnPTbK9SF9u7rB
 O1lIEeXjCjwAHdCbKGD8rJ3VL+J3SUgKh7hbPj8cdA18/lp8PA==
X-Google-Smtp-Source: ABdhPJzoZyZeqMv5MvdyXJYVu/RrLk3UMBEeBaMwlaTTRR9B6Mf3NepCYSckRVfqWMZhgYJsc0Qpf9T8e6DJzp+J5xE=
X-Received: by 2002:a05:6512:1529:b0:474:bb8:1d6e with SMTP id
 bq41-20020a056512152900b004740bb81d6emr4517225lfb.557.1652994765719; Thu, 19
 May 2022 14:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com>
 <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
In-Reply-To: <43a7fff2-2616-4f81-9c18-01454f0b30b2@www.fastmail.com>
From: Cody Smith <scody@google.com>
Date: Thu, 19 May 2022 14:12:34 -0700
Message-ID: <CAEAQM=Lo9AcUrw1c2bT_pYNtG0LpT9w2=McMbx=RY=SP0V_4PA@mail.gmail.com>
Subject: Re: Proposing changes to the OpenBMC tree (to make upstreaming easier)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d43dcb05df63d5c1"
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
Cc: Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d43dcb05df63d5c1
Content-Type: text/plain; charset="UTF-8"

I don't seem to have the original message, so this may get added to
Andrew's branch of this thread. Sorry about that in advance.

In general I support moving to a monorepo. We at Google do this, and my
significant other at Airbnb also utilizes a monorepo. The advantages are
significant, as the world gets a lot less silo'd and making changes that
would have spanned across multiple repos now only span the monorepo. This
is particularly useful when feature X requires changes to repo A, B and C,
and the changes on their own break things but shipped together are just
fine. I don't even really know how such a feature gets shipped today to be
honest.

The other thing that tends to happen with monorepos is a lot more
conformity, as reviews are carried out by a larger set of people. Suddenly
`bmcweb` is being reviewed by people who may not have previously cared
about or touched that part of the codebase as a bad example. At a
minimum more people will have eyes on the changes happening.

I also think that a monorepo avoids one maintainer "lording" over a repo.
It happens, the +2ers kind of play a role of the bridge troll, when repo X
only has 1-2 +2ers, this can be a real problem. A monorepo with 10+ +2ers
will force the +2ers to engage in debate when they disagree with each
other, instead of lording over their own kingdoms and having no influence
over other kingdoms so to speak.

I haven't made a great set of arguments here but in general I feel like a
chance like this would help from an organizational perspective and maybe
with that better org. in place maybe we can begin addressing some of the
other issues we need to address.

[image: Google Logo]
Cody Smith
System Software Engineer
Google Cloud Platform Core Services Team
scody@google.com
720-515-6105



On Tue, Apr 5, 2022 at 7:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:

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
>
> With the amount of custom userspace we've always kinda sat in-between.
> I'd like to see libraries and applications that have use cases outside
> of OpenBMC be accessible to people with those external use cases,
> without being burdened by understanding the rest of the OpenBMC context.
> I have a concern that by integrating things in the way you're proposing
> it will lead to more inertia there (e.g. for implementations of
> standards MCTP or PLDM (libmctp and libpldm)).
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
>
> CI prevents these from being submitted, as it should, but there's nothing
> to
> stop anyone using the `devtool modify ...` / `devtool finish ...` and
> committing the result as a workflow to exchange state (I do this)?
>
> Is the issue instead with devtool? Is it bad? Is the learning curve too
> steep?
> It is at least the Yocto workflow.
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
>
> [6]
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-interface
> [7]
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus
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
>
> >
> > - It would centralize the bug databases.  Today, bugs filed against
> > sub projects tend to not get answered.
>
> Do you have some numbers handy?
>
> > Having all the bugs in
> > openbmc/openbmc would help in the future to avoid duplicating bugs
> > across projects.
>
> Has this actually been a problem?
>
> >
> > - Would increase the likelihood that someone contributes a patch,
> > especially a patch written by someone else.  If contributing a patch
> > was just a matter of cherry-picking a tree of commits and submitting
> > it to gerrit, it's a lot more likely that people would do it.
>
> It sounds plausible, but again, some evidence for this would be helpful.
>
> Why is this easier than submitting the patches to the application repo?
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
>
> Andrew
>
> >
> > [1]
> >
> https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/
> > [2] https://git-scm.com/docs/git-rebase
> > [3]
> >
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
> > [4]
> >
> https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-externalsrc
> > [5] https://github.com/edtanous/obmc-repo-combine/blob/main/combine
>

--000000000000d43dcb05df63d5c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t seem to have the original=C2=A0message, so thi=
s may get added to Andrew&#39;s branch of this thread. Sorry about that in =
advance.<div><br></div><div>In general I support moving to a monorepo. We a=
t Google do this, and my significant other at Airbnb also utilizes a monore=
po. The advantages are significant, as the world gets a lot less silo&#39;d=
=C2=A0and making=C2=A0<span class=3D"gmail-il">changes</span>=C2=A0that wou=
ld have spanned across multiple repos now only span the monorepo. This is p=
articularly useful when feature X requires=C2=A0<span class=3D"gmail-il">ch=
anges</span>=C2=A0to repo A, B and C, and the=C2=A0<span class=3D"gmail-il"=
>changes</span>=C2=A0on their own break things but shipped together are jus=
t fine. I don&#39;t even really know how such a feature gets shipped today =
to be honest.</div><div><br></div><div>The other thing that tends to happen=
 with monorepos is a lot more conformity, as reviews are carried out by a l=
arger set of people. Suddenly `bmcweb` is being reviewed by people who may =
not have previously cared about or touched that part of the codebase as a b=
ad example. At a minimum=C2=A0more people will have eyes on the=C2=A0<span =
class=3D"gmail-il">changes</span>=C2=A0happening.</div><div><br></div><div>=
I also think that a monorepo avoids one maintainer &quot;lording&quot; over=
 a repo. It happens, the=C2=A0+2ers kind of play a role of the bridge troll=
, when repo X only has 1-2=C2=A0+2ers, this can be a real problem. A monore=
po with 10+=C2=A0+2ers will force the=C2=A0+2ers to engage in debate when t=
hey disagree with each other, instead of lording over their own kingdoms an=
d having no influence over other kingdoms so to speak.</div><div><br></div>=
<div>I haven&#39;t made a great set of arguments=C2=A0here but in general I=
 feel like a chance like this would help from an organizational=C2=A0perspe=
ctive and maybe with that better org. in place maybe we can begin addressin=
g some of the other issues we need to address.</div><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><table width=3D"90%" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" sty=
le=3D"margin:0px;padding:0px;font-family:Times;max-width:348px"><tbody styl=
e=3D"margin:0px;padding:0px"><tr style=3D"margin:0px;padding:0px"><td style=
=3D"font-family:Arial,Helvetica,Verdana,sans-serif;padding:0px 0px 5px;font=
-size:13px;line-height:15px;color:rgb(153,153,153)"><br></td></tr><tr style=
=3D"margin:0px;padding:0px"><td style=3D"padding:0px"><table border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0" style=3D"margin:0px;padding:20px 0px 0px=
"><tbody style=3D"margin:0px;padding:0px"><tr style=3D"margin:0px;padding:0=
px"><td valign=3D"top" style=3D"padding:0px 20px 0px 0px;vertical-align:top=
;border-right:1px solid rgb(213,213,213)"><img src=3D"https://www.gstatic.c=
om/images/branding/product/1x/googleg_64dp.png" alt=3D"Google Logo" width=
=3D"72" style=3D"margin:0px;padding:0px;display:block;height:auto"></td><td=
 style=3D"padding:0px 0px 0px 20px"><table border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" style=3D"margin:0px;padding:0px"><tbody style=3D"margin:0p=
x;padding:0px"><tr style=3D"margin:0px;padding:0px"><td colspan=3D"2" style=
=3D"font-family:Arial,Helvetica,Verdana,sans-serif;padding:1px 0px 5px;font=
-size:13px;line-height:13px;color:rgb(56,58,53);font-weight:700">Cody Smith=
</td></tr><tr style=3D"margin:0px;padding:0px"><td colspan=3D"2" style=3D"f=
ont-family:Arial,Helvetica,Verdana,sans-serif;padding:0px 0px 5px;font-size=
:11px;line-height:13px;color:rgb(56,58,53)">System Software Engineer<br>Goo=
gle Cloud Platform Core Services Team<br></td></tr><tr style=3D"margin:0px;=
padding:0px"><td colspan=3D"2" style=3D"font-family:Arial,Helvetica,Verdana=
,sans-serif;padding:0px 0px 5px;font-size:11px;line-height:13px;color:rgb(5=
6,58,53)"><a href=3D"mailto:scody@google.com" target=3D"_blank">scody@googl=
e.com</a></td></tr><tr style=3D"margin:0px;padding:0px"><td colspan=3D"2" s=
tyle=3D"font-family:Arial,Helvetica,Verdana,sans-serif;padding:0px 0px 3px;=
font-size:11px;line-height:13px;color:rgb(3,112,248)">720-515-6105</td></tr=
></tbody></table></td></tr></tbody></table></td></tr><tr style=3D"margin:0p=
x;padding:0px"><td style=3D"font-family:Arial,Helvetica,Verdana,sans-serif;=
padding:0px 0px 5px;font-size:13px;line-height:15px;color:rgb(153,153,153)"=
><br></td></tr></tbody></table></div></div></div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 5, 2022 =
at 7:22 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.=
id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi Ed,<br>
<br>
I think what&#39;s below largely points to a bit of an identity crisis for<=
br>
the project, on a couple of fronts. Fundamentally OpenBMC is a distro<br>
(or as Yocto likes to point out, a meta-distro), and we can:<br>
<br>
1. Identify as a traditional OSS distro: An integration of otherwise<br>
=C2=A0 =C2=A0independent applications<br>
<br>
2. Identify as an appliance distro: The distro and the<br>
=C2=A0 =C2=A0applications are a monolith<br>
<br>
You&#39;re proposing 2, while I think there exists some tension towards 1.<=
br>
<br>
With the amount of custom userspace we&#39;ve always kinda sat in-between.<=
br>
I&#39;d like to see libraries and applications that have use cases outside<=
br>
of OpenBMC be accessible to people with those external use cases,<br>
without being burdened by understanding the rest of the OpenBMC context.<br=
>
I have a concern that by integrating things in the way you&#39;re proposing=
<br>
it will lead to more inertia there (e.g. for implementations of<br>
standards MCTP or PLDM (libmctp and libpldm)).<br>
<br>
On Tue, 5 Apr 2022, at 03:58, Ed Tanous wrote:<br>
&gt; The OpenBMC development process as it stands is difficult for people<b=
r>
&gt; new to the project to understand, which severely limits our ability to=
<br>
&gt; onboard new maintainers, developers, and groups which would otherwise<=
br>
&gt; contribute major features to upstream, but don&#39;t have the technica=
l<br>
&gt; expertise to do so.=C2=A0 This initiative, much like others before it[=
1] is<br>
&gt; attempting to reduce the toil and OpenBMC-specific processes of<br>
&gt; passing changes amongst the community, and move things to being more<b=
r>
&gt; like other projects that have largely solved this problem already.<br>
<br>
Can you be more specific about which projects here? Do you have links <br>
to examples?<br>
<br>
&gt;<br>
&gt; To that end, I&#39;d like to propose a change to the way we structure =
our<br>
&gt; repositories within the project: specifically, putting (almost) all of=
<br>
&gt; the Linux Foundation OpenBMC owned code into a single repo that we can=
<br>
&gt; version as a single entity, rather than spreading out amongst many<br>
&gt; repos.=C2=A0 In practice, this would have some significant advantages:=
<br>
&gt;<br>
&gt; - The tree would be easily shareable amongst the various people<br>
&gt; working on OpenBMC, without having to rely on a single-source Gerrit<b=
r>
&gt; instance.=C2=A0 Git is designed to be distributed, but if our recipe f=
iles<br>
&gt; point at other repositories, it largely defeats a lot of this<br>
&gt; capability.=C2=A0 Today, if you want to share a tree that has a change=
 in<br>
&gt; it, you have to fork the main tree, then fork every single subproject<=
br>
&gt; you&#39;ve made modifications to, then update the main tree to point t=
o<br>
&gt; your forks. <br>
<br>
This isn&#39;t true, as you can add patches in the OpenBMC tree.<br>
<br>
CI prevents these from being submitted, as it should, but there&#39;s nothi=
ng to<br>
stop anyone using the `devtool modify ...` / `devtool finish ...` and<br>
committing the result as a workflow to exchange state (I do this)?<br>
<br>
Is the issue instead with devtool? Is it bad? Is the learning curve too ste=
ep?<br>
It is at least the Yocto workflow.<br>
<br>
&gt; This gets very onerous over time, especially for simple<br>
&gt; commits.=C2=A0 Having maintained several different companies forks<br>
&gt; personally, and spoken to many others having problems with the same,<b=
r>
&gt; adding major features are difficult to test and rebase because of<br>
&gt; this.=C2=A0 Moving the code to a single tree makes a lot of the toil o=
f<br>
&gt; tagging and modifying local trees a lot more manageable, as a series<b=
r>
&gt; of well-documented git commands (generally git rebase[2]).=C2=A0 It al=
so<br>
&gt; increases the likelihood that someone pulls down the fork to test it<b=
r>
&gt; if it&#39;s highly likely that they can apply it to their own tree in =
a<br>
&gt; single command.<br>
<br>
Again, this is moot if the patches are applied in-tree.<br>
<br>
&gt;<br>
&gt; - There would be a reduction in reviews.=C2=A0 Today, anytime a person=
<br>
&gt; wants to make a change that would involve any part of the tree,<br>
&gt; there&#39;s at least 2 code reviews, one for the commit, and one for t=
he<br>
&gt; recipe bump.=C2=A0 Compared to a single tree, this at least doubles th=
e<br>
&gt; number of reviews we need to process.<br>
<br>
Is there more work? Yes.<br>
<br>
Is it always double? No. Is it sometimes double? Yes.<br>
<br>
Often bumps batch multiple application commits. I think this paragraph <br>
overstates the problem somewhat, but what it does get right is <br>
identifying that *some* overhead exists.<br>
<br>
&gt;=C2=A0 For changes that want to make<br>
&gt; any change to a few subsystems, as is the case when developing a<br>
&gt; feature, they require 2 X &lt;number of project changes&gt; reviews, a=
ll of<br>
&gt; which need to be synchronized.<br>
<br>
Same issue as above here.<br>
<br>
&gt; There is a well documented problem<br>
&gt; where we have no official way to synchronize merging of changes to<br>
&gt; userspace applications within a bump without manual human<br>
&gt; intervention.=C2=A0 This would largely render that problem moot.<br>
<br>
Right, this can be hard to handle.<br>
<br>
It can be mitigated by versioning interfaces (which the D-Bus spec <br>
calls out[6][7] but OpenBMC fails to do (?)) and supporting multiple <br>
interfaces for the transition period.<br>
<br>
That said, that&#39;s also more work, and so needs to be considered in the =
<br>
set of trade-offs.<br>
<br>
[6] <a href=3D"https://dbus.freedesktop.org/doc/dbus-specification.html#mes=
sage-protocol-names-interface" rel=3D"noreferrer" target=3D"_blank">https:/=
/dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-in=
terface</a><br>
[7] <a href=3D"https://dbus.freedesktop.org/doc/dbus-specification.html#mes=
sage-protocol-names-bus" rel=3D"noreferrer" target=3D"_blank">https://dbus.=
freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus</a><=
br>
<br>
&gt;<br>
&gt; - It would allow most developers to not need to understand Yocto at<br=
>
&gt; all to do their day to day work on existing applications.=C2=A0 No mor=
e<br>
&gt; &quot;devtool modify&quot;, and related SRCREV bumps.=C2=A0 This will =
help most of<br>
&gt; the new developers on the project with a lower mental load, which will=
<br>
&gt; mean people are able to ramp up faster..<br>
<br>
Okay. So devtool is seen as an issue.<br>
<br>
Can we improve its visibility and any education around it? Or is it a <br>
lost cause? If so, why?<br>
<br>
Separately, I&#39;m concerned this is an attempt to shield people from<br>
skills that help them work with upstream Yocto. OpenBMC feels like it&#39;s=
<br>
a bit of an on-ramp for open-source contributions for people who have<br>
worked in what was previously quite a proprietary environment. We tried<br>
shielding people in the past wrt kernel contributions, and that failed<br>
pretty spectacularly. We (at least Joel and I) now encourage people to<br>
work with upstream directly *and support them in the process of doing<br>
that* rather than trying to mitigate some of the difficulties with<br>
working upstream by avoiding them.<br>
<br>
&gt;<br>
&gt; - It would give an opportunity for individuals and companies to &quot;=
own&quot;<br>
&gt; well-supported public forks (ie Redhat) of the codebase, which would<b=
r>
&gt; increase participation in the project overall.=C2=A0 This already happ=
ens<br>
&gt; quite a bit, but in practice, the forks that do it squash history,<br>
&gt; making it nearly impossible to get their changes upstreamed from an<br=
>
&gt; outside entity.<br>
<br>
Not sure this is something we want to encourage, even if it happens in <br>
practice.<br>
<br>
&gt;<br>
&gt; - It would centralize the bug databases.=C2=A0 Today, bugs filed again=
st<br>
&gt; sub projects tend to not get answered. <br>
<br>
Do you have some numbers handy?<br>
<br>
&gt; Having all the bugs in<br>
&gt; openbmc/openbmc would help in the future to avoid duplicating bugs<br>
&gt; across projects.<br>
<br>
Has this actually been a problem?<br>
<br>
&gt;<br>
&gt; - Would increase the likelihood that someone contributes a patch,<br>
&gt; especially a patch written by someone else.=C2=A0 If contributing a pa=
tch<br>
&gt; was just a matter of cherry-picking a tree of commits and submitting<b=
r>
&gt; it to gerrit, it&#39;s a lot more likely that people would do it.<br>
<br>
It sounds plausible, but again, some evidence for this would be helpful.<br=
>
<br>
Why is this easier than submitting the patches to the application repo?<br>
<br>
&gt; My proposed version of this tree is pushed to a github fork here, and<=
br>
&gt; is based on the tree from a few weeks ago:<br>
&gt; <a href=3D"https://github.com/edtanous/openbmc" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/edtanous/openbmc</a><br>
&gt;<br>
&gt; It implements all the above for the main branch.=C2=A0 This tree is ba=
sed<br>
&gt; on the output of the automated tooling, and in the case where this<br>
&gt; proposal is accepted, the tooling would be re-run to capture the state=
<br>
&gt; of the tree at the point where we chose to make this change.<br>
&gt;<br>
&gt; The tool I wrote to generate this tree is also published, if you&#39;r=
e<br>
&gt; interested in how this tree was built, and is quite interesting in its=
<br>
&gt; use of git export/import [5], but functionally, I would not expect<br>
&gt; that tooling to survive after this transition is made.<br>
<br>
I think it would be good to capture the script in openbmc-tools if we <br>
choose to go ahead with this, mainly as a record of how we achieved it.<br>
<br>
Andrew<br>
<br>
&gt;<br>
&gt; [1] <br>
&gt; <a href=3D"https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=3D1=
SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=3D1SSLCv5pTee=
7jaoVo2Zs6havgnA@mail.gmail.com/</a><br>
&gt; [2] <a href=3D"https://git-scm.com/docs/git-rebase" rel=3D"noreferrer"=
 target=3D"_blank">https://git-scm.com/docs/git-rebase</a><br>
&gt; [3] <br>
&gt; <a href=3D"https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md=
#inclusive-naming" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming</a><br>
&gt; [4] <br>
&gt; <a href=3D"https://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual=
.html#ref-classes-externalsrc" rel=3D"noreferrer" target=3D"_blank">https:/=
/www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#ref-classes-exter=
nalsrc</a><br>
&gt; [5] <a href=3D"https://github.com/edtanous/obmc-repo-combine/blob/main=
/combine" rel=3D"noreferrer" target=3D"_blank">https://github.com/edtanous/=
obmc-repo-combine/blob/main/combine</a><br>
</blockquote></div>

--000000000000d43dcb05df63d5c1--
