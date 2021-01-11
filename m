Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 287D02F2238
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 22:52:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF6rc3jVzzDqXP
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 08:52:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=P7Nsd16d; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF6q86xtKzDqW5
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 08:51:31 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id w127so220758ybw.8
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 13:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+MeLXajhssb7LFZyujbCXvsfEFWgVixFgERLC4kw5Us=;
 b=P7Nsd16dgEeOWrmB8+nsKpV5nRGZ+CGXhIZqrcsPwyAJvvictqLHoAIBQqKDUhDkJf
 uznq6RZIJtX2usEkqDD3S71oZ5lsRm2/8/NMa1PFdLf/TerJqgaF5bwmy9EE1ZrEx3wv
 v3msdQqz+pDfWLR92so5ZVG8izVXYQxJzUBKtCDlH8yLUYs8EeuyRIlyMQ8Ntuw+KZmH
 RzRx+8Wxuu2WOVvTcwz4Sn7Q/5cjh+EixgN6sBupc9gq0T9raxoljxLPsAbrjNAtuzY0
 DdTr2oqKNG4O/r3I2t7vKw+zNENX7yPeJSufrgKmRzi9dFwr6LHQwToigsSkx74Yx8Re
 PWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+MeLXajhssb7LFZyujbCXvsfEFWgVixFgERLC4kw5Us=;
 b=shVPPr1EZ/dbgmhkaIyB6lnC9iZy13RStCDTuNrOEZI4DzMXSPlIuAS7YrIYHv9yM2
 0up3uAGmUDST1GEG8nwjybkjVTw04JaHwEyNazCKnEEE2XpX//A0kTDTFg5z6HsiSY9u
 CixiOz9mpXYYZjHWhp/bmQK4vE4bSLgzJ/t5JqlYvpei356qkXpkTznCyioj7l8jmAdm
 Bv9GPioy4Rjro0/H3K3HvQP6g6gsQAb287lh4rEEDBYiGk1ajPm0bAndfkzCCsOyMGx5
 m4JuwWMj/HtAuApNdyVqZBt1mNOfJuhoeTF3MEwVIaPJJJTo3OVtOicy7jncsKM0edM/
 Gd5g==
X-Gm-Message-State: AOAM531uXdiURLxn0Tl61hdvc7Q+u9Vf3ThfZ9NbaD1oiIRBaiIFgw/t
 RjMR+vABisLwC36f3S4Tho9YgWPo5TAWEYHHTfOt3A==
X-Google-Smtp-Source: ABdhPJxMhq8bTUJt+VGY2HOxXwMimJOvZHwrittC4gyVmxXE8de8fdAx4A5LIaWnMpS2xkkSiIZ7zheWbWTvuBIlHeo=
X-Received: by 2002:a25:77d3:: with SMTP id s202mr2867927ybc.148.1610401889396; 
 Mon, 11 Jan 2021 13:51:29 -0800 (PST)
MIME-Version: 1.0
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
 <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
 <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
 <X/y/es6hNBbWR/bq@heinlein>
In-Reply-To: <X/y/es6hNBbWR/bq@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 11 Jan 2021 13:51:18 -0800
Message-ID: <CACWQX839PL=5eYtRsmD_ZZ+OgWb_xZeuVvxOxzt7Ye1dc2Kt4Q@mail.gmail.com>
Subject: Re: Upstreaming downstream Google BMC repositories
To: Patrick Williams <patrick@stwcx.xyz>
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
 Paul Menzel <pmenzel@molgen.mpg.de>, Ed Tanous <edtanous@google.com>,
 Brandon Kim <brandonkim@google.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 11, 2021 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Unfortunately we don't have a great policy on any of this.  Hopefully it
> is something we can come up with a better definition on in the near
> future.
>
> On Thu, Jan 07, 2021 at 01:20:00PM -0800, Ed Tanous wrote:
> > On Thu, Jan 7, 2021 at 10:26 AM Paul Menzel <pmenzel@molgen.mpg.de> wro=
te:
> > > Am 07.01.21 um 18:33 schrieb Benjamin Fair:
> > > > On Thu, 7 Jan 2021 at 00:09, Paul Menzel <pmenzel@molgen.mpg.de> wr=
ote:
> > > >> Am 07.01.21 um 02:49 schrieb Brandon Kim:
> > > >>
> > > >>> We're exploring ways of upstreaming some of the downstream reposi=
tories
> > > >>> from Google to openbmc/* .
> > > >>>
> > > >>> Half, if not most of the downstream repositories are C++ daemons =
that are
> > > >>> specific to Google so we didn't want to create a bunch of new
> > > >>> openbmc/<repo> that no one would use.
>
> Just out of curiousity, if they're not going to be useful to anyone
> except Google, what is the utility of getting them into an openbmc repo?
> (There are reasons but I don't want to put words in your mouths)

A slight clarification: the theory is they're not useful unless you're
building a machine that intends to live within the Google
infrastructure (similar to zaius, or q71l).  The meta layer _is_
useful outside of google, with companies that design and build the
aforementioned platforms.  Having the specific tweaks made available
in the public means that the companies we work with can build 1:1 the
image that we're operating with, report bugs against it more publicly,
and we can share more code in the open, without resorting to
public/private forks of OpenBMC for our own purposes which have their
own problems as has been proven in the past.

The other hope is that if we're wrong, and something within that repo
is useful outside of google (seems likely it might happen for
something), it's available with a public license and whoever finds it
useful can simply move it to a common repo where others can use it,
with minimal fuss, or asking us to upstream something we've built in
the past.

>
> > > >>> An idea that Ed gave me was having something like openbmc/google-=
misc
> > > >>> repository for all these repositories and if there are any that s=
eem useful
> > > >>> to others, we can break it out into a different, separate reposit=
ory in
> > > >>> openbmc/* layer.
> > > >>>
> > > >>> Please let me know if this seems like a good idea and I'm open to=
 other
> > > >>> suggestions!
>
> I really dislike dumping-ground repositories.  If we're going to allow
> company-specific "misc" repositories, I would really like a policy that
> they may *only* be referenced from that company's meta-layer.

That sounds completely reasonable, and in-line with our intent.

>  If anyone
> has any use in that code it really should be broken out into its own
> repository with a proper maintenance structure.

 +1.

>
> > > >> Thank you very much for putting in the effort to make these reposi=
tories
> > > >> public.
> > > >>
> > > >> Using the openbmc/google-misc approach, how would the git history
> > > >> (commit log) be handled?
> > > >>
> > > >> Personally, I would prefer having small repositories as git makes =
that
> > > >> very easy to handle. Also it might save you time, as you do not ha=
ve to
> > > >> think about what to do with the git history, and do not have to me=
rge it.
> > > >
> > > > We would most likely squash the history together, in case there's
> > > > something confidential or private in the earlier commits.
> > >
> > > Understood. If that could be avoided, and only the confidential stuff
> > > removed, that would be great, as the git history gives a lot of insig=
ht
> > > into design decisions.
> >
> > It should be noted, there isn't really much git history to speak of
> > for the things we're looking at pushing.
>
> How was any code of significance developed without a git history?  It is
> unfortunate we're going to lose all of this because of how often I tend
> to dig through 'git-blame' to understand the "why" on code.

A lot of the commits aren't really "openbmc worthy" in that they're
not signed off, have no tested statement, might have > 72 character
lines ect.  They definitely do have a git history, and if the
preference is that we push it with the messy history, we can certainly
do it.  I don't have a strong opinion here other than not wanting to
rewrite and retest every commit we've had to these things.

>
> > Some examples of things that would go in this repository.
> > 1. The google public keys/certs.  I would hope that non-google systems
> > are using their own root certificates.
> > 2. Disabling of ssh login flows.  This is done in a very specific way
> > that requires interfacing with out of network components and protocols
> > that are specific to our systems.  I'd be surprised if anyone found
> > this useful.
> > 3. In-band telemetry code implementing interfaces for interfacing to
> > google infrastructure.  These haven't been built yet, but will likely
> > be a translation from the public facing APIs (Dbus/redfish/ipmi) to
> > interface them to google infrastructure.  it's unlikely anyone else
> > would use this.
>
> These make me more curious on the value of opening them.
>
> > > > Many small repos would be easy to handle for us, but OpenBMC may no=
t
> > > > want to have lots of small Google-specific repos in their org as th=
is
> > > > may make it more cumbersome for others to find the relevant repos t=
hat
> > > > they're interested in.
> > >
> > > Understood. On the other, with small repositories, they can only use =
the
> > > parts they need.
>
> I'm more comfortable with others utilizing this code if it is in a small
> repo like "google-ssh-cert".  As others find it valuable we can rename
> the repo.

Right now the process to create new repositories takes a very long
time, and requires interaction with core maintainers for
CI/gerrit/github/user groups setup.  That model doesn't scale beyond
what we have today if things like certs for every company needs its
own repository.  I don't see a way to make it scale to the "new repo
for everything" model, unless you had some ideas there.

In other tracks I've had good luck simply extracting the history from
a subfolder, and pushing that to a new repo when things needed to be
split out.

>
> > See above, if there are pieces that people want to use on non-google
> > systems, they don't belong in meta-google.  With that said, your
> > statement is incorrect, recipes are not required to be 1:1 with
> > repositories.  Multiple recipes can point at subfolders of the same
> > repository, allowing you to "use the parts they need" by simply adding
> > recipes.  With that said, this is not the intent, and I would much
> > rather move code to a more common layer (meta-phosphor for example)
> > rather than have non google systems including meta-google in their
> > bblayers.conf.
> >
> > >
> > > > There's also overhead for the project maintainers to create the
> > > > relevant groups and permissions for each new repo.
> > > Please note, that Without knowing the contents of the repositories an=
d
> > > the size, this is all just my opinion. If the OpenBMC =E2=80=9Cadmins=
=E2=80=9C can
> > > easily create several repositories, I=E2=80=99d prefer that route.
> >
> > Today creating new repos is non-trivial, and IMO we already have too
> > many of them, which is causing a lot of thrash.  I'd really like to
> > see us start consolidating some of these (see my patches to
> > consolidate all the meta-layers into openbmc/openbmc with the owners
> > plugin)
>
> What do you mean by "thrash"?  Ideally it should be cheap to create a
> repository.

Ideally, yes, but we're not there today, and I don't see a path to get us t=
here.

>  If there is significant overhead to create a repository
> with the current infrastructure we should document those challenges and
> look to improve them.

The biggest challenge is that a large percentage of the work needs to
be done by relatively few people (those with core permissions), and
they have their own things to get done, and  rightfully aren't able to
prioritize creating new repos/permissions/other stuff.  This topic
alone is probably worth an email thread, as it's worth trying to
tackle;  I'll try to get that written up.

>
> I don't have any issue with consolidation of the meta-layers because
> those are effectively all built together anyhow.  Right now I'm not in
> favor of consolidation of code repositories and we've even talked about
> splitting out some pieces (EM and fru-device come to mind to me).

We talked about splitting those up?  I'd be a little worried about
that, as they're pretty intertwined in their dbus interfaces.

We're currently having the problem where nearly any new feature in
dbus-sensors needs a commit to entity-manager to add a new schema, and
that's non-obvious, and requires a commit done in lockstep to get code
through.  I had actually considered the other day doing the opposite,
and proposing merging entity-manager and dbus-sensors, but that's a
different discussion.

>  Can
> you quantify what the advantage of a big[ger] multi-function repositories
> are?

The biggest advantage is time-to-create new repositories and the
significant reduction in autobump-like recipe changes that need to be
made to keep everything in lockstep.

>
> --
> Patrick Williams
