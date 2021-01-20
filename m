Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C26212FD92C
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 20:10:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLZq72BxDzDqdm
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 06:10:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gn5rZ/jE; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLZht1DpJzDqnF
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 06:05:01 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id a9so20677092wrt.5
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 11:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JYp8J2vHTx6eZ7HJqKmdcNoPadjJXAgWymWLjS+DvOM=;
 b=gn5rZ/jEDPRnM6mVwTTr8rejm0KrLVRfdjFEIKKMgFwKvV1W+/Y4zRcdCDR2G0EKyR
 qYB3hmsUkoEVP533rVLr6ni59Xfvg+S8nTJYjnJ5tm2QWxX+guARkli+cdI9ST7HFvVu
 awScR0yHLt77ihKgi2R2Jsa7X51Mp9lCLGbTA9OsCzW2u7zv2uX+FfRTohpwgJkI8WeA
 q2EHF2BRUx5fXU+2oXcPOL13gN/wtRv5xAJl9Ku/dtdUv/s3aunW4dfP8rsH3KWD8qwd
 e/4XX9V3wcoPCBKsNAWSgSX+M4Z2ckCWdI8mM/OoBbtuGFhbGLO7KsN7lpUHBt+1jqTq
 gOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JYp8J2vHTx6eZ7HJqKmdcNoPadjJXAgWymWLjS+DvOM=;
 b=O1csEGjWpSvQWDXiSoBwFIiLlN0WdM6eeYucWHJ8KyyreJf65PAvvp+p4dKYRd4qF6
 2lbFaCXZKwtW9fIlRF+K5L+M7Vl2pXJD6KvpfTTlPjM+FlX219x5bR7uSSDJ0iEYHyak
 rLHqr5tdOcamFR/g4PwgagyBxhvuLByGQn278swfR4u9uMh2a4qDi7MQWYfdhy0xH6yH
 Xj/Hdx0GEiQQdDfPGwBQ6H76iiO/J9paM8Cm0mpJvhXkK5gR554rEKVzGIgmun3Kj1Ih
 IZjHTinpwtfKS0ybbj9pIrZZCT7Z9sAkxGTwtsyoTeMy+R/AaQZni6lkkP/E3guCfuNi
 3T6Q==
X-Gm-Message-State: AOAM531U5iUPB8lYuxYY7C4OsOXQhl3GeillM0t35SZkCSXSEZoJq8+G
 X5Kd3Eyusp3sp3LPNNxlGe2hgPCSh5CPUX2+ZhMv2A==
X-Google-Smtp-Source: ABdhPJyQEi3b3Q083Bd22W0llGxqy/ztkEEKSWBppPEnudWY1qPhpGj59IpLpPLQk5jVFHV3GJarA0+d2fp5+A9ESfA=
X-Received: by 2002:a5d:660b:: with SMTP id n11mr10701172wru.407.1611169498285; 
 Wed, 20 Jan 2021 11:04:58 -0800 (PST)
MIME-Version: 1.0
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
 <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
 <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
 <X/y/es6hNBbWR/bq@heinlein>
 <CACWQX839PL=5eYtRsmD_ZZ+OgWb_xZeuVvxOxzt7Ye1dc2Kt4Q@mail.gmail.com>
 <CALGRKGOBTW-MY_wXKvh26Dow0xWoUh4TGwjXacZFs2Y9RJneEg@mail.gmail.com>
In-Reply-To: <CALGRKGOBTW-MY_wXKvh26Dow0xWoUh4TGwjXacZFs2Y9RJneEg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 20 Jan 2021 11:04:46 -0800
Message-ID: <CAH2-KxBeUbErfrk7USSO3ATC70cUXtqfSzf1j7UfiPGySWgzVw@mail.gmail.com>
Subject: Re: Upstreaming downstream Google BMC repositories
To: Brandon Kim <brandonkim@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Benjamin Fair <benjaminfair@google.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

No concerns from me.

-Ed

On Thu, Jan 14, 2021 at 3:18 PM Brandon Kim <brandonkim@google.com> wrote:
>
> Hi everyone,
>
> Wanted to ping this thread to see if there were more concerns on creating=
 an openbmc/google-misc repository.
>
> Thanks!
> Brandon
>
> On Mon, Jan 11, 2021 at 1:51 PM Ed Tanous <ed@tanous.net> wrote:
>>
>> On Mon, Jan 11, 2021 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wro=
te:
>> >
>> > Unfortunately we don't have a great policy on any of this.  Hopefully =
it
>> > is something we can come up with a better definition on in the near
>> > future.
>> >
>> > On Thu, Jan 07, 2021 at 01:20:00PM -0800, Ed Tanous wrote:
>> > > On Thu, Jan 7, 2021 at 10:26 AM Paul Menzel <pmenzel@molgen.mpg.de> =
wrote:
>> > > > Am 07.01.21 um 18:33 schrieb Benjamin Fair:
>> > > > > On Thu, 7 Jan 2021 at 00:09, Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>> > > > >> Am 07.01.21 um 02:49 schrieb Brandon Kim:
>> > > > >>
>> > > > >>> We're exploring ways of upstreaming some of the downstream rep=
ositories
>> > > > >>> from Google to openbmc/* .
>> > > > >>>
>> > > > >>> Half, if not most of the downstream repositories are C++ daemo=
ns that are
>> > > > >>> specific to Google so we didn't want to create a bunch of new
>> > > > >>> openbmc/<repo> that no one would use.
>> >
>> > Just out of curiousity, if they're not going to be useful to anyone
>> > except Google, what is the utility of getting them into an openbmc rep=
o?
>> > (There are reasons but I don't want to put words in your mouths)
>>
>> A slight clarification: the theory is they're not useful unless you're
>> building a machine that intends to live within the Google
>> infrastructure (similar to zaius, or q71l).  The meta layer _is_
>> useful outside of google, with companies that design and build the
>> aforementioned platforms.  Having the specific tweaks made available
>> in the public means that the companies we work with can build 1:1 the
>> image that we're operating with, report bugs against it more publicly,
>> and we can share more code in the open, without resorting to
>> public/private forks of OpenBMC for our own purposes which have their
>> own problems as has been proven in the past.
>>
>> The other hope is that if we're wrong, and something within that repo
>> is useful outside of google (seems likely it might happen for
>> something), it's available with a public license and whoever finds it
>> useful can simply move it to a common repo where others can use it,
>> with minimal fuss, or asking us to upstream something we've built in
>> the past.
>>
>> >
>> > > > >>> An idea that Ed gave me was having something like openbmc/goog=
le-misc
>> > > > >>> repository for all these repositories and if there are any tha=
t seem useful
>> > > > >>> to others, we can break it out into a different, separate repo=
sitory in
>> > > > >>> openbmc/* layer.
>> > > > >>>
>> > > > >>> Please let me know if this seems like a good idea and I'm open=
 to other
>> > > > >>> suggestions!
>> >
>> > I really dislike dumping-ground repositories.  If we're going to allow
>> > company-specific "misc" repositories, I would really like a policy tha=
t
>> > they may *only* be referenced from that company's meta-layer.
>>
>> That sounds completely reasonable, and in-line with our intent.
>>
>> >  If anyone
>> > has any use in that code it really should be broken out into its own
>> > repository with a proper maintenance structure.
>>
>>  +1.
>>
>> >
>> > > > >> Thank you very much for putting in the effort to make these rep=
ositories
>> > > > >> public.
>> > > > >>
>> > > > >> Using the openbmc/google-misc approach, how would the git histo=
ry
>> > > > >> (commit log) be handled?
>> > > > >>
>> > > > >> Personally, I would prefer having small repositories as git mak=
es that
>> > > > >> very easy to handle. Also it might save you time, as you do not=
 have to
>> > > > >> think about what to do with the git history, and do not have to=
 merge it.
>> > > > >
>> > > > > We would most likely squash the history together, in case there'=
s
>> > > > > something confidential or private in the earlier commits.
>> > > >
>> > > > Understood. If that could be avoided, and only the confidential st=
uff
>> > > > removed, that would be great, as the git history gives a lot of in=
sight
>> > > > into design decisions.
>> > >
>> > > It should be noted, there isn't really much git history to speak of
>> > > for the things we're looking at pushing.
>> >
>> > How was any code of significance developed without a git history?  It =
is
>> > unfortunate we're going to lose all of this because of how often I ten=
d
>> > to dig through 'git-blame' to understand the "why" on code.
>>
>> A lot of the commits aren't really "openbmc worthy" in that they're
>> not signed off, have no tested statement, might have > 72 character
>> lines ect.  They definitely do have a git history, and if the
>> preference is that we push it with the messy history, we can certainly
>> do it.  I don't have a strong opinion here other than not wanting to
>> rewrite and retest every commit we've had to these things.
>>
>> >
>> > > Some examples of things that would go in this repository.
>> > > 1. The google public keys/certs.  I would hope that non-google syste=
ms
>> > > are using their own root certificates.
>> > > 2. Disabling of ssh login flows.  This is done in a very specific wa=
y
>> > > that requires interfacing with out of network components and protoco=
ls
>> > > that are specific to our systems.  I'd be surprised if anyone found
>> > > this useful.
>> > > 3. In-band telemetry code implementing interfaces for interfacing to
>> > > google infrastructure.  These haven't been built yet, but will likel=
y
>> > > be a translation from the public facing APIs (Dbus/redfish/ipmi) to
>> > > interface them to google infrastructure.  it's unlikely anyone else
>> > > would use this.
>> >
>> > These make me more curious on the value of opening them.
>> >
>> > > > > Many small repos would be easy to handle for us, but OpenBMC may=
 not
>> > > > > want to have lots of small Google-specific repos in their org as=
 this
>> > > > > may make it more cumbersome for others to find the relevant repo=
s that
>> > > > > they're interested in.
>> > > >
>> > > > Understood. On the other, with small repositories, they can only u=
se the
>> > > > parts they need.
>> >
>> > I'm more comfortable with others utilizing this code if it is in a sma=
ll
>> > repo like "google-ssh-cert".  As others find it valuable we can rename
>> > the repo.
>>
>> Right now the process to create new repositories takes a very long
>> time, and requires interaction with core maintainers for
>> CI/gerrit/github/user groups setup.  That model doesn't scale beyond
>> what we have today if things like certs for every company needs its
>> own repository.  I don't see a way to make it scale to the "new repo
>> for everything" model, unless you had some ideas there.
>>
>> In other tracks I've had good luck simply extracting the history from
>> a subfolder, and pushing that to a new repo when things needed to be
>> split out.
>>
>> >
>> > > See above, if there are pieces that people want to use on non-google
>> > > systems, they don't belong in meta-google.  With that said, your
>> > > statement is incorrect, recipes are not required to be 1:1 with
>> > > repositories.  Multiple recipes can point at subfolders of the same
>> > > repository, allowing you to "use the parts they need" by simply addi=
ng
>> > > recipes.  With that said, this is not the intent, and I would much
>> > > rather move code to a more common layer (meta-phosphor for example)
>> > > rather than have non google systems including meta-google in their
>> > > bblayers.conf.
>> > >
>> > > >
>> > > > > There's also overhead for the project maintainers to create the
>> > > > > relevant groups and permissions for each new repo.
>> > > > Please note, that Without knowing the contents of the repositories=
 and
>> > > > the size, this is all just my opinion. If the OpenBMC =E2=80=9Cadm=
ins=E2=80=9C can
>> > > > easily create several repositories, I=E2=80=99d prefer that route.
>> > >
>> > > Today creating new repos is non-trivial, and IMO we already have too
>> > > many of them, which is causing a lot of thrash.  I'd really like to
>> > > see us start consolidating some of these (see my patches to
>> > > consolidate all the meta-layers into openbmc/openbmc with the owners
>> > > plugin)
>> >
>> > What do you mean by "thrash"?  Ideally it should be cheap to create a
>> > repository.
>>
>> Ideally, yes, but we're not there today, and I don't see a path to get u=
s there.
>>
>> >  If there is significant overhead to create a repository
>> > with the current infrastructure we should document those challenges an=
d
>> > look to improve them.
>>
>> The biggest challenge is that a large percentage of the work needs to
>> be done by relatively few people (those with core permissions), and
>> they have their own things to get done, and  rightfully aren't able to
>> prioritize creating new repos/permissions/other stuff.  This topic
>> alone is probably worth an email thread, as it's worth trying to
>> tackle;  I'll try to get that written up.
>>
>> >
>> > I don't have any issue with consolidation of the meta-layers because
>> > those are effectively all built together anyhow.  Right now I'm not in
>> > favor of consolidation of code repositories and we've even talked abou=
t
>> > splitting out some pieces (EM and fru-device come to mind to me).
>>
>> We talked about splitting those up?  I'd be a little worried about
>> that, as they're pretty intertwined in their dbus interfaces.
>>
>> We're currently having the problem where nearly any new feature in
>> dbus-sensors needs a commit to entity-manager to add a new schema, and
>> that's non-obvious, and requires a commit done in lockstep to get code
>> through.  I had actually considered the other day doing the opposite,
>> and proposing merging entity-manager and dbus-sensors, but that's a
>> different discussion.
>>
>> >  Can
>> > you quantify what the advantage of a big[ger] multi-function repositor=
ies
>> > are?
>>
>> The biggest advantage is time-to-create new repositories and the
>> significant reduction in autobump-like recipe changes that need to be
>> made to keep everything in lockstep.
>>
>> >
>> > --
>> > Patrick Williams
