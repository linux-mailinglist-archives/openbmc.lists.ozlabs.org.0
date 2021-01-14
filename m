Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 416512F6EE5
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 00:19:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH0cx0TrtzDsW1
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 10:19:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nkhcomsA; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH0br3r9zzDsVH
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 10:18:11 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id r9so6828486otk.11
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 15:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJzmLQgF2bexs6272gQ5qEITce8pFQCX4L8f0iMzeYM=;
 b=nkhcomsAiOuRr57fn8MhkRBYOM6yizY+jSDMBr1jauSs9Agoxpukmm5UXuWAvqfwbD
 YONoBcy7Ew95iRESW1NgMaJIj6ZSSiaWghtVNdkYaqgID0QVkQeoz2f40j62S2qRRACU
 AxE0TT+mOlnUHTDHcyHar6crwoZ/xMACHmD7eI7RkJ09wRJS7TkJks6xJHiHd25sFeE0
 1jQqYDTcO1tzdKHFaP0unWn/4elQeKjwdGlCa9bSQRm5S68UwNJbNhaxtXrn4i9mcEX/
 kmErgzvsV0h5C8LVYKFo8MbEjaeI/7UET0pZ86YWm6aOCDKQeKyYIEOmvuYVpFGfUP2K
 VQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJzmLQgF2bexs6272gQ5qEITce8pFQCX4L8f0iMzeYM=;
 b=omg+h80geCBoqRd7xR0mLXtorEYxBvX+D1pM0be/IquIg2WmCIRCrBn6YET4tMk+ew
 8WB/RpRuk0Cs98EbuWZsLtSa4u7gyf94jqib769Yb78FEInaJliTzkGSGsgac7dIZsJ4
 fX/zgpn3SKqNcj+cMT3FAJG9eVx/SvTfV9aDezafFvvif96ZgvuOPNxuJ/m7Urc9NtB9
 KUYunUuP4s5gOJL4POOPw5Q3JrcY9B6dopvHN408WAdbO6Y0s49hbk97IzymrssflbaY
 ji+bfo0QoxyRCPNVE4l04Xiggv41SvYwbjHVSPi9kJWe/hiezO728MWx3LuqesCi+YNn
 oBTA==
X-Gm-Message-State: AOAM531Sup1fsSPqggCh8XRtS0MCPQ3g5TgPZ+ZphcKCcfIXBCjhmPmb
 tBUGta2m69a3oNR70tpXOeI1MBlf22IkwvCsfEwDuw==
X-Google-Smtp-Source: ABdhPJxaFTvUERkXNafbaQegDjhCwPrVpbE6YwXgDyMNp8hPNJQgreE9EJemcXZ3TdmYSvz98PgeggHTOe1r5QH2y7U=
X-Received: by 2002:a05:6830:1d0:: with SMTP id
 r16mr6214631ota.54.1610666288329; 
 Thu, 14 Jan 2021 15:18:08 -0800 (PST)
MIME-Version: 1.0
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
 <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
 <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
 <X/y/es6hNBbWR/bq@heinlein>
 <CACWQX839PL=5eYtRsmD_ZZ+OgWb_xZeuVvxOxzt7Ye1dc2Kt4Q@mail.gmail.com>
In-Reply-To: <CACWQX839PL=5eYtRsmD_ZZ+OgWb_xZeuVvxOxzt7Ye1dc2Kt4Q@mail.gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Thu, 14 Jan 2021 15:17:57 -0800
Message-ID: <CALGRKGOBTW-MY_wXKvh26Dow0xWoUh4TGwjXacZFs2Y9RJneEg@mail.gmail.com>
Subject: Re: Upstreaming downstream Google BMC repositories
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000f8297205b8e4779b"
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
 Ed Tanous <edtanous@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f8297205b8e4779b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Wanted to ping this thread to see if there were more concerns on creating
an openbmc/google-misc repository.

Thanks!
Brandon

On Mon, Jan 11, 2021 at 1:51 PM Ed Tanous <ed@tanous.net> wrote:

> On Mon, Jan 11, 2021 at 1:14 PM Patrick Williams <patrick@stwcx.xyz>
> wrote:
> >
> > Unfortunately we don't have a great policy on any of this.  Hopefully i=
t
> > is something we can come up with a better definition on in the near
> > future.
> >
> > On Thu, Jan 07, 2021 at 01:20:00PM -0800, Ed Tanous wrote:
> > > On Thu, Jan 7, 2021 at 10:26 AM Paul Menzel <pmenzel@molgen.mpg.de>
> wrote:
> > > > Am 07.01.21 um 18:33 schrieb Benjamin Fair:
> > > > > On Thu, 7 Jan 2021 at 00:09, Paul Menzel <pmenzel@molgen.mpg.de>
> wrote:
> > > > >> Am 07.01.21 um 02:49 schrieb Brandon Kim:
> > > > >>
> > > > >>> We're exploring ways of upstreaming some of the downstream
> repositories
> > > > >>> from Google to openbmc/* .
> > > > >>>
> > > > >>> Half, if not most of the downstream repositories are C++ daemon=
s
> that are
> > > > >>> specific to Google so we didn't want to create a bunch of new
> > > > >>> openbmc/<repo> that no one would use.
> >
> > Just out of curiousity, if they're not going to be useful to anyone
> > except Google, what is the utility of getting them into an openbmc repo=
?
> > (There are reasons but I don't want to put words in your mouths)
>
> A slight clarification: the theory is they're not useful unless you're
> building a machine that intends to live within the Google
> infrastructure (similar to zaius, or q71l).  The meta layer _is_
> useful outside of google, with companies that design and build the
> aforementioned platforms.  Having the specific tweaks made available
> in the public means that the companies we work with can build 1:1 the
> image that we're operating with, report bugs against it more publicly,
> and we can share more code in the open, without resorting to
> public/private forks of OpenBMC for our own purposes which have their
> own problems as has been proven in the past.
>
> The other hope is that if we're wrong, and something within that repo
> is useful outside of google (seems likely it might happen for
> something), it's available with a public license and whoever finds it
> useful can simply move it to a common repo where others can use it,
> with minimal fuss, or asking us to upstream something we've built in
> the past.
>
> >
> > > > >>> An idea that Ed gave me was having something like
> openbmc/google-misc
> > > > >>> repository for all these repositories and if there are any that
> seem useful
> > > > >>> to others, we can break it out into a different, separate
> repository in
> > > > >>> openbmc/* layer.
> > > > >>>
> > > > >>> Please let me know if this seems like a good idea and I'm open
> to other
> > > > >>> suggestions!
> >
> > I really dislike dumping-ground repositories.  If we're going to allow
> > company-specific "misc" repositories, I would really like a policy that
> > they may *only* be referenced from that company's meta-layer.
>
> That sounds completely reasonable, and in-line with our intent.
>
> >  If anyone
> > has any use in that code it really should be broken out into its own
> > repository with a proper maintenance structure.
>
>  +1.
>
> >
> > > > >> Thank you very much for putting in the effort to make these
> repositories
> > > > >> public.
> > > > >>
> > > > >> Using the openbmc/google-misc approach, how would the git histor=
y
> > > > >> (commit log) be handled?
> > > > >>
> > > > >> Personally, I would prefer having small repositories as git make=
s
> that
> > > > >> very easy to handle. Also it might save you time, as you do not
> have to
> > > > >> think about what to do with the git history, and do not have to
> merge it.
> > > > >
> > > > > We would most likely squash the history together, in case there's
> > > > > something confidential or private in the earlier commits.
> > > >
> > > > Understood. If that could be avoided, and only the confidential stu=
ff
> > > > removed, that would be great, as the git history gives a lot of
> insight
> > > > into design decisions.
> > >
> > > It should be noted, there isn't really much git history to speak of
> > > for the things we're looking at pushing.
> >
> > How was any code of significance developed without a git history?  It i=
s
> > unfortunate we're going to lose all of this because of how often I tend
> > to dig through 'git-blame' to understand the "why" on code.
>
> A lot of the commits aren't really "openbmc worthy" in that they're
> not signed off, have no tested statement, might have > 72 character
> lines ect.  They definitely do have a git history, and if the
> preference is that we push it with the messy history, we can certainly
> do it.  I don't have a strong opinion here other than not wanting to
> rewrite and retest every commit we've had to these things.
>
> >
> > > Some examples of things that would go in this repository.
> > > 1. The google public keys/certs.  I would hope that non-google system=
s
> > > are using their own root certificates.
> > > 2. Disabling of ssh login flows.  This is done in a very specific way
> > > that requires interfacing with out of network components and protocol=
s
> > > that are specific to our systems.  I'd be surprised if anyone found
> > > this useful.
> > > 3. In-band telemetry code implementing interfaces for interfacing to
> > > google infrastructure.  These haven't been built yet, but will likely
> > > be a translation from the public facing APIs (Dbus/redfish/ipmi) to
> > > interface them to google infrastructure.  it's unlikely anyone else
> > > would use this.
> >
> > These make me more curious on the value of opening them.
> >
> > > > > Many small repos would be easy to handle for us, but OpenBMC may
> not
> > > > > want to have lots of small Google-specific repos in their org as
> this
> > > > > may make it more cumbersome for others to find the relevant repos
> that
> > > > > they're interested in.
> > > >
> > > > Understood. On the other, with small repositories, they can only us=
e
> the
> > > > parts they need.
> >
> > I'm more comfortable with others utilizing this code if it is in a smal=
l
> > repo like "google-ssh-cert".  As others find it valuable we can rename
> > the repo.
>
> Right now the process to create new repositories takes a very long
> time, and requires interaction with core maintainers for
> CI/gerrit/github/user groups setup.  That model doesn't scale beyond
> what we have today if things like certs for every company needs its
> own repository.  I don't see a way to make it scale to the "new repo
> for everything" model, unless you had some ideas there.
>
> In other tracks I've had good luck simply extracting the history from
> a subfolder, and pushing that to a new repo when things needed to be
> split out.
>
> >
> > > See above, if there are pieces that people want to use on non-google
> > > systems, they don't belong in meta-google.  With that said, your
> > > statement is incorrect, recipes are not required to be 1:1 with
> > > repositories.  Multiple recipes can point at subfolders of the same
> > > repository, allowing you to "use the parts they need" by simply addin=
g
> > > recipes.  With that said, this is not the intent, and I would much
> > > rather move code to a more common layer (meta-phosphor for example)
> > > rather than have non google systems including meta-google in their
> > > bblayers.conf.
> > >
> > > >
> > > > > There's also overhead for the project maintainers to create the
> > > > > relevant groups and permissions for each new repo.
> > > > Please note, that Without knowing the contents of the repositories
> and
> > > > the size, this is all just my opinion. If the OpenBMC =E2=80=9Cadmi=
ns=E2=80=9C can
> > > > easily create several repositories, I=E2=80=99d prefer that route.
> > >
> > > Today creating new repos is non-trivial, and IMO we already have too
> > > many of them, which is causing a lot of thrash.  I'd really like to
> > > see us start consolidating some of these (see my patches to
> > > consolidate all the meta-layers into openbmc/openbmc with the owners
> > > plugin)
> >
> > What do you mean by "thrash"?  Ideally it should be cheap to create a
> > repository.
>
> Ideally, yes, but we're not there today, and I don't see a path to get us
> there.
>
> >  If there is significant overhead to create a repository
> > with the current infrastructure we should document those challenges and
> > look to improve them.
>
> The biggest challenge is that a large percentage of the work needs to
> be done by relatively few people (those with core permissions), and
> they have their own things to get done, and  rightfully aren't able to
> prioritize creating new repos/permissions/other stuff.  This topic
> alone is probably worth an email thread, as it's worth trying to
> tackle;  I'll try to get that written up.
>
> >
> > I don't have any issue with consolidation of the meta-layers because
> > those are effectively all built together anyhow.  Right now I'm not in
> > favor of consolidation of code repositories and we've even talked about
> > splitting out some pieces (EM and fru-device come to mind to me).
>
> We talked about splitting those up?  I'd be a little worried about
> that, as they're pretty intertwined in their dbus interfaces.
>
> We're currently having the problem where nearly any new feature in
> dbus-sensors needs a commit to entity-manager to add a new schema, and
> that's non-obvious, and requires a commit done in lockstep to get code
> through.  I had actually considered the other day doing the opposite,
> and proposing merging entity-manager and dbus-sensors, but that's a
> different discussion.
>
> >  Can
> > you quantify what the advantage of a big[ger] multi-function repositori=
es
> > are?
>
> The biggest advantage is time-to-create new repositories and the
> significant reduction in autobump-like recipe changes that need to be
> made to keep everything in lockstep.
>
> >
> > --
> > Patrick Williams
>

--000000000000f8297205b8e4779b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>Wanted to ping this thread=
 to see if there were more concerns on creating an openbmc/google-misc repo=
sitory.</div><div><br></div><div>Thanks!</div><div>Brandon</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan=
 11, 2021 at 1:51 PM Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net">ed@tano=
us.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, Jan 11, 2021 at 1:14 PM Patrick Williams &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; Unfortunately we don&#39;t have a great policy on any of this.=C2=A0 H=
opefully it<br>
&gt; is something we can come up with a better definition on in the near<br=
>
&gt; future.<br>
&gt;<br>
&gt; On Thu, Jan 07, 2021 at 01:20:00PM -0800, Ed Tanous wrote:<br>
&gt; &gt; On Thu, Jan 7, 2021 at 10:26 AM Paul Menzel &lt;<a href=3D"mailto=
:pmenzel@molgen.mpg.de" target=3D"_blank">pmenzel@molgen.mpg.de</a>&gt; wro=
te:<br>
&gt; &gt; &gt; Am 07.01.21 um 18:33 schrieb Benjamin Fair:<br>
&gt; &gt; &gt; &gt; On Thu, 7 Jan 2021 at 00:09, Paul Menzel &lt;<a href=3D=
"mailto:pmenzel@molgen.mpg.de" target=3D"_blank">pmenzel@molgen.mpg.de</a>&=
gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; Am 07.01.21 um 02:49 schrieb Brandon Kim:<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt;&gt; We&#39;re exploring ways of upstreaming some of=
 the downstream repositories<br>
&gt; &gt; &gt; &gt;&gt;&gt; from Google to openbmc/* .<br>
&gt; &gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt;&gt; Half, if not most of the downstream repositorie=
s are C++ daemons that are<br>
&gt; &gt; &gt; &gt;&gt;&gt; specific to Google so we didn&#39;t want to cre=
ate a bunch of new<br>
&gt; &gt; &gt; &gt;&gt;&gt; openbmc/&lt;repo&gt; that no one would use.<br>
&gt;<br>
&gt; Just out of curiousity, if they&#39;re not going to be useful to anyon=
e<br>
&gt; except Google, what is the utility of getting them into an openbmc rep=
o?<br>
&gt; (There are reasons but I don&#39;t want to put words in your mouths)<b=
r>
<br>
A slight clarification: the theory is they&#39;re not useful unless you&#39=
;re<br>
building a machine that intends to live within the Google<br>
infrastructure (similar to zaius, or q71l).=C2=A0 The meta layer _is_<br>
useful outside of google, with companies that design and build the<br>
aforementioned platforms.=C2=A0 Having the specific tweaks made available<b=
r>
in the public means that the companies we work with can build 1:1 the<br>
image that we&#39;re operating with, report bugs against it more publicly,<=
br>
and we can share more code in the open, without resorting to<br>
public/private forks of OpenBMC for our own purposes which have their<br>
own problems as has been proven in the past.<br>
<br>
The other hope is that if we&#39;re wrong, and something within that repo<b=
r>
is useful outside of google (seems likely it might happen for<br>
something), it&#39;s available with a public license and whoever finds it<b=
r>
useful can simply move it to a common repo where others can use it,<br>
with minimal fuss, or asking us to upstream something we&#39;ve built in<br=
>
the past.<br>
<br>
&gt;<br>
&gt; &gt; &gt; &gt;&gt;&gt; An idea that Ed gave me was having something li=
ke openbmc/google-misc<br>
&gt; &gt; &gt; &gt;&gt;&gt; repository for all these repositories and if th=
ere are any that seem useful<br>
&gt; &gt; &gt; &gt;&gt;&gt; to others, we can break it out into a different=
, separate repository in<br>
&gt; &gt; &gt; &gt;&gt;&gt; openbmc/* layer.<br>
&gt; &gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt;&gt; Please let me know if this seems like a good id=
ea and I&#39;m open to other<br>
&gt; &gt; &gt; &gt;&gt;&gt; suggestions!<br>
&gt;<br>
&gt; I really dislike dumping-ground repositories.=C2=A0 If we&#39;re going=
 to allow<br>
&gt; company-specific &quot;misc&quot; repositories, I would really like a =
policy that<br>
&gt; they may *only* be referenced from that company&#39;s meta-layer.<br>
<br>
That sounds completely reasonable, and in-line with our intent.<br>
<br>
&gt;=C2=A0 If anyone<br>
&gt; has any use in that code it really should be broken out into its own<b=
r>
&gt; repository with a proper maintenance structure.<br>
<br>
=C2=A0+1.<br>
<br>
&gt;<br>
&gt; &gt; &gt; &gt;&gt; Thank you very much for putting in the effort to ma=
ke these repositories<br>
&gt; &gt; &gt; &gt;&gt; public.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Using the openbmc/google-misc approach, how would t=
he git history<br>
&gt; &gt; &gt; &gt;&gt; (commit log) be handled?<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Personally, I would prefer having small repositorie=
s as git makes that<br>
&gt; &gt; &gt; &gt;&gt; very easy to handle. Also it might save you time, a=
s you do not have to<br>
&gt; &gt; &gt; &gt;&gt; think about what to do with the git history, and do=
 not have to merge it.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; We would most likely squash the history together, in ca=
se there&#39;s<br>
&gt; &gt; &gt; &gt; something confidential or private in the earlier commit=
s.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Understood. If that could be avoided, and only the confident=
ial stuff<br>
&gt; &gt; &gt; removed, that would be great, as the git history gives a lot=
 of insight<br>
&gt; &gt; &gt; into design decisions.<br>
&gt; &gt;<br>
&gt; &gt; It should be noted, there isn&#39;t really much git history to sp=
eak of<br>
&gt; &gt; for the things we&#39;re looking at pushing.<br>
&gt;<br>
&gt; How was any code of significance developed without a git history?=C2=
=A0 It is<br>
&gt; unfortunate we&#39;re going to lose all of this because of how often I=
 tend<br>
&gt; to dig through &#39;git-blame&#39; to understand the &quot;why&quot; o=
n code.<br>
<br>
A lot of the commits aren&#39;t really &quot;openbmc worthy&quot; in that t=
hey&#39;re<br>
not signed off, have no tested statement, might have &gt; 72 character<br>
lines ect.=C2=A0 They definitely do have a git history, and if the<br>
preference is that we push it with the messy history, we can certainly<br>
do it.=C2=A0 I don&#39;t have a strong opinion here other than not wanting =
to<br>
rewrite and retest every commit we&#39;ve had to these things.<br>
<br>
&gt;<br>
&gt; &gt; Some examples of things that would go in this repository.<br>
&gt; &gt; 1. The google public keys/certs.=C2=A0 I would hope that non-goog=
le systems<br>
&gt; &gt; are using their own root certificates.<br>
&gt; &gt; 2. Disabling of ssh login flows.=C2=A0 This is done in a very spe=
cific way<br>
&gt; &gt; that requires interfacing with out of network components and prot=
ocols<br>
&gt; &gt; that are specific to our systems.=C2=A0 I&#39;d be surprised if a=
nyone found<br>
&gt; &gt; this useful.<br>
&gt; &gt; 3. In-band telemetry code implementing interfaces for interfacing=
 to<br>
&gt; &gt; google infrastructure.=C2=A0 These haven&#39;t been built yet, bu=
t will likely<br>
&gt; &gt; be a translation from the public facing APIs (Dbus/redfish/ipmi) =
to<br>
&gt; &gt; interface them to google infrastructure.=C2=A0 it&#39;s unlikely =
anyone else<br>
&gt; &gt; would use this.<br>
&gt;<br>
&gt; These make me more curious on the value of opening them.<br>
&gt;<br>
&gt; &gt; &gt; &gt; Many small repos would be easy to handle for us, but Op=
enBMC may not<br>
&gt; &gt; &gt; &gt; want to have lots of small Google-specific repos in the=
ir org as this<br>
&gt; &gt; &gt; &gt; may make it more cumbersome for others to find the rele=
vant repos that<br>
&gt; &gt; &gt; &gt; they&#39;re interested in.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Understood. On the other, with small repositories, they can =
only use the<br>
&gt; &gt; &gt; parts they need.<br>
&gt;<br>
&gt; I&#39;m more comfortable with others utilizing this code if it is in a=
 small<br>
&gt; repo like &quot;google-ssh-cert&quot;.=C2=A0 As others find it valuabl=
e we can rename<br>
&gt; the repo.<br>
<br>
Right now the process to create new repositories takes a very long<br>
time, and requires interaction with core maintainers for<br>
CI/gerrit/github/user groups setup.=C2=A0 That model doesn&#39;t scale beyo=
nd<br>
what we have today if things like certs for every company needs its<br>
own repository.=C2=A0 I don&#39;t see a way to make it scale to the &quot;n=
ew repo<br>
for everything&quot; model, unless you had some ideas there.<br>
<br>
In other tracks I&#39;ve had good luck simply extracting the history from<b=
r>
a subfolder, and pushing that to a new repo when things needed to be<br>
split out.<br>
<br>
&gt;<br>
&gt; &gt; See above, if there are pieces that people want to use on non-goo=
gle<br>
&gt; &gt; systems, they don&#39;t belong in meta-google.=C2=A0 With that sa=
id, your<br>
&gt; &gt; statement is incorrect, recipes are not required to be 1:1 with<b=
r>
&gt; &gt; repositories.=C2=A0 Multiple recipes can point at subfolders of t=
he same<br>
&gt; &gt; repository, allowing you to &quot;use the parts they need&quot; b=
y simply adding<br>
&gt; &gt; recipes.=C2=A0 With that said, this is not the intent, and I woul=
d much<br>
&gt; &gt; rather move code to a more common layer (meta-phosphor for exampl=
e)<br>
&gt; &gt; rather than have non google systems including meta-google in thei=
r<br>
&gt; &gt; bblayers.conf.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; There&#39;s also overhead for the project maintainers t=
o create the<br>
&gt; &gt; &gt; &gt; relevant groups and permissions for each new repo.<br>
&gt; &gt; &gt; Please note, that Without knowing the contents of the reposi=
tories and<br>
&gt; &gt; &gt; the size, this is all just my opinion. If the OpenBMC =E2=80=
=9Cadmins=E2=80=9C can<br>
&gt; &gt; &gt; easily create several repositories, I=E2=80=99d prefer that =
route.<br>
&gt; &gt;<br>
&gt; &gt; Today creating new repos is non-trivial, and IMO we already have =
too<br>
&gt; &gt; many of them, which is causing a lot of thrash.=C2=A0 I&#39;d rea=
lly like to<br>
&gt; &gt; see us start consolidating some of these (see my patches to<br>
&gt; &gt; consolidate all the meta-layers into openbmc/openbmc with the own=
ers<br>
&gt; &gt; plugin)<br>
&gt;<br>
&gt; What do you mean by &quot;thrash&quot;?=C2=A0 Ideally it should be che=
ap to create a<br>
&gt; repository.<br>
<br>
Ideally, yes, but we&#39;re not there today, and I don&#39;t see a path to =
get us there.<br>
<br>
&gt;=C2=A0 If there is significant overhead to create a repository<br>
&gt; with the current infrastructure we should document those challenges an=
d<br>
&gt; look to improve them.<br>
<br>
The biggest challenge is that a large percentage of the work needs to<br>
be done by relatively few people (those with core permissions), and<br>
they have their own things to get done, and=C2=A0 rightfully aren&#39;t abl=
e to<br>
prioritize creating new repos/permissions/other stuff.=C2=A0 This topic<br>
alone is probably worth an email thread, as it&#39;s worth trying to<br>
tackle;=C2=A0 I&#39;ll try to get that written up.<br>
<br>
&gt;<br>
&gt; I don&#39;t have any issue with consolidation of the meta-layers becau=
se<br>
&gt; those are effectively all built together anyhow.=C2=A0 Right now I&#39=
;m not in<br>
&gt; favor of consolidation of code repositories and we&#39;ve even talked =
about<br>
&gt; splitting out some pieces (EM and fru-device come to mind to me).<br>
<br>
We talked about splitting those up?=C2=A0 I&#39;d be a little worried about=
<br>
that, as they&#39;re pretty intertwined in their dbus interfaces.<br>
<br>
We&#39;re currently having the problem where nearly any new feature in<br>
dbus-sensors needs a commit to entity-manager to add a new schema, and<br>
that&#39;s non-obvious, and requires a commit done in lockstep to get code<=
br>
through.=C2=A0 I had actually considered the other day doing the opposite,<=
br>
and proposing merging entity-manager and dbus-sensors, but that&#39;s a<br>
different discussion.<br>
<br>
&gt;=C2=A0 Can<br>
&gt; you quantify what the advantage of a big[ger] multi-function repositor=
ies<br>
&gt; are?<br>
<br>
The biggest advantage is time-to-create new repositories and the<br>
significant reduction in autobump-like recipe changes that need to be<br>
made to keep everything in lockstep.<br>
<br>
&gt;<br>
&gt; --<br>
&gt; Patrick Williams<br>
</blockquote></div>

--000000000000f8297205b8e4779b--
