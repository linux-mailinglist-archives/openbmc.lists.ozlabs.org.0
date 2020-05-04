Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 145D11C377B
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 13:01:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0KT3FGFzDqYk
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 21:01:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=bhg6CgDu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gAtn+7Nw; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0JY6sSGzDqMf
 for <openbmc@lists.ozlabs.org>; Mon,  4 May 2020 21:00:45 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 98B1C5CE;
 Mon,  4 May 2020 07:00:43 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 04 May 2020 07:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=ezNhl
 9QzPi6qHSS0SnMlzx8CYSytmKgIMvInZKhrhh8=; b=bhg6CgDuEjxfK5s3wqUeI
 Y/V//K6n0ULYx5BLCqEcl3ovWM2JOR+po4oUuSxwk7wo2g+s+woyfxTNxZ6CbJCe
 qFTDcbOwq7X6JmxSYp1dV1EbB4ef9cTtZSby5KShgexhSrIj5omRX8qWsfZOajtt
 /ZBEy2AIp10bUX1ibGoV/MiCYXBI2Hkd9PGkWqL34z4/gnkJ3Qi36OWOvUe55qAg
 qvfJk3rkj1JH2jaPewKatlgTSmpvQAnerPctlKjgzpF8IdZUQh1nQGMMT2Q6HMJd
 NGPY1HGv2t+yoztNS/E0E2pJn9/yKE1e+ulsrmCHBHbgasUmnJ/YJji4QfUcvEwE
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ezNhl9QzPi6qHSS0SnMlzx8CYSytmKgIMvInZKhrh
 h8=; b=gAtn+7NwkztPAAaFcGDKCx4zMB4tTELkYwFyEVwt26Mqu1Wi9PxqGm7Gm
 NzrpJjZexkFekGbExlCpuEbebtZ4P8ajfa394FG4C/jES2AabByyzHGjvI5GThO9
 PJm8mkmd7EP5BF0kzd+TufoXsoGLmZiYNwiGeyo09iwzQJbJQL1RCkZIt9xsKGff
 u4oTYJmm5AKQ5TKRl+NHBcb68oy9gSe0FxQz29PsKfAugPsODjp5DrBYaZvvsyrn
 D+fM2UB+9nfd78fxekI52kKWZPzKVPHdSAjapi3o5yU69dmNKmY8LB7tOBiB2Imf
 tTQIMWPgMBWUbgfnPjCaCxWrHoOug==
X-ME-Sender: <xms:2vWvXjY1r4nVgP_YLQRtU5bv-tOS3xkyAuGzxCi-ksw7ik9LC7oVjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeggdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgfgsehtqhertder
 reejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedvgeekheegfedvhfethefhudetteeg
 ueeggfeiieegueehkedugedtkefglefgheenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2vWvXuJhvudMBuA3SnbSZoE8l0029idPhMFU8tTuWeok0qBgI1P_xw>
 <xmx:2vWvXouKxo8-_zoLlgky74EykJCMptNdSDbAYE2EAjNhLo-tbvFmEA>
 <xmx:2vWvXvrdC8pD4XVDCrHHIeR79XFmJj7QeH09HAmchCRkMUYcsnIZTQ>
 <xmx:2_WvXuEUbLTPHgc7KcgvzHroExu1Y8XLsW7ZHGjrcC0B7NKBCkaXpQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 05A4FE00A9; Mon,  4 May 2020 07:00:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <091f5b26-3b31-4550-b5a0-22cae666ddbd@www.fastmail.com>
In-Reply-To: <3FD402A3-DEBC-49DF-9AE7-E07C04A964A7@fuzziesquirrel.com>
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
 <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
 <DA097328-158E-48DA-9F8F-6CD0C7FC4DDE@fuzziesquirrel.com>
 <20200424145635.GB26818@heinlein.lan.stwcx.xyz>
 <3FD402A3-DEBC-49DF-9AE7-E07C04A964A7@fuzziesquirrel.com>
Date: Mon, 04 May 2020 20:30:20 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: Proposal: how to make incompatible changes
Content-Type: text/plain;charset=utf-8
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
 Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 27 Apr 2020, at 23:17, Brad Bishop wrote:
> at 10:56 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> > On Thu, Apr 23, 2020 at 12:20:53PM -0400, Brad Bishop wrote:
> >> at 8:11 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:
> >>
> >>> Internally, for inter-process dbus communication the interface ver=
sion
> >>> could be checked during compile time to prevent problems that coul=
dn't be
> >>> detected by compiler/linker automatically.
> >>
> >> I like the idea of a stable, versioned DBus API.  Does anyone else?=

> >>
> >> In the past there was opposition to that.  I=E2=80=99m not sure if =
there still is.
> >
> > Since we're deprecating the REST-dbus path and moving towards Redfis=
h is
> > there much advantage to a versioned DBus API?
>=20
> It helps lower the barrier to comprehension and entry.  Unversioned & =
=20
> unstable IPC APIs are not normal and probably shocking to anyone that =
comes =20
> across them.
>=20
> An unstable, unversioned API encourages bad behavior - e.g. I can just=
 make =20
> this in-compatible change to the API and fix all the applications at t=
he =20
> same time.  lock-step dependencies between 3 different projects =20
> (phosphor-dbus-interfaces, the client, and the server) is not a good t=
hing.
>=20
> Put another way - with an unstable and unversioned API - what is the p=
oint =20
> of having all these different projects and repositories?  It just beco=
mes =20
> one giant monolithic code base.  If that is what we want, then we shou=
ld =20
> structure it that way.  Nothing inherently wrong with that, but it see=
ms =20
> like it would restrict how the code can be used.  Does that bother us?=

>=20
> > Alexander mentioned
> > compile-time checking of the interface, but we already have that thr=
ough
> > sdbusplus.  The issues are:
> >     1. Client bindings are not currently being generated.
> >     2. Not every implementation is using them.
> >     3. We don't have a good mechanism to deal with cross-repository
> >        interface changes.
> >
> > I don't think a versioned DBus API solves any of these, except maybe=
 #3
>=20
> That's just it - these are the solution to the problems that an unstab=
le =20
> and unversioned API bring, not the other way around.  It is all work o=
ne =20
> way or the other - we can do something atypical like have an unversion=
ed =20
> and unstable API, and then write a bunch of frameworks and tooling aro=
und =20
> that so that it can work.  Or we can put in the effort to have a stabl=
e and =20
> versioned DBus API.  I would rather do the latter because that is how =
=20
> people have been using dbus effectively for a really long time.
>=20
> > but that is only if we're going to write servers that support N-vers=
ions
> > of the interfaces.
> >
> > It seems to me like a better investment is #1 and #2?
>=20
> To be clear on #2, use of frameworks is an optional thing.  To get =20=

> universal adoption of a framework, you have to first get universal =20=

> acceptance of the merits of the framework.  So I suggest interlocking =
with =20
> the specific application maintainers before working on #2 to avoid was=
ting =20
> time.
>=20
> > I'd personally
> > like to have #1 implemented by the end of Sept at the latest.
>=20
> Nice!
>=20
> > Solving
> > #3, I think, requires us to do some CI investment to support Gerrit
> > topic-based testing.
>=20
> Or we can avoid entirely, with a stable, versioned API :-)
>

+1 for stable, versioned APIs.
