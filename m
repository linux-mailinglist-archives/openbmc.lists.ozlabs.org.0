Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24136157E4
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 05:09:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yl2R4qjWzDqLv
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 13:09:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="m2qsxWi5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AFTpd30y"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yl1R3tc3zDqJW
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 13:08:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3F0432460C;
 Mon,  6 May 2019 23:08:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 06 May 2019 23:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=gutNr
 tcSrkd6PVjXQcwbdvmLiL0K1SMmnf+BEMOCGCA=; b=m2qsxWi5VHdMLKmqbaF+y
 bMgiTMZR+ZxF5Z3R1L+Ezl9sXlrIqZJeA69F6ug1qz7b+bcxrj8dNd220JSfVywC
 bt1coaK3GNkI8OffudnOKo8N6ez/ORwGw1dFrIFLgo6nc9ic5QgNw3HEScj6qdX9
 ZpHR6zKxVTtl6nGtDKxSkfZiukkMLoos0L/oDaIOtap+VRvM1hZf7YRaB3MuG+pL
 Q3qrDGHyT3UXBekIgerqwXJId0ZczHTX8egVdntulu6R7qO5iKyF3N5J/wwFewOe
 XygFEmJH0x05D9x7Na8fQWbKhLBabnjekvDlj57mc5wbynHyirqtkIrY2ipd6jk9
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=gutNrtcSrkd6PVjXQcwbdvmLiL0K1SMmnf+BEMOCG
 CA=; b=AFTpd30y/Te4WlT+kaBsihRa2PIK94t0nzJUJH9quf0WnrLqVpPDuE+KM
 JjtQO3Xi9iJaHOfREFgihxXKvbFdvrTGfOMHTxiV/3bEq5m7q0qHxV3GXJac/YeO
 luJt5MVigWkh5Q39yKA5Cz2Px4r2sTyoYz7WJChgJ4Z9m2LVxJjHDAKZyueDeL3V
 crGpAqgI+k34NGG2nbdaQCa99QwmbfVIDg/qJ96JOZo9I+7fzWabJyJqdSO8UqfM
 40QppnyVlNY3PJJzO7uCXESR48uEgmYCIgnsXhMoyipx7aRePFce9F3iXol1VnHD
 matb6MsaZoxkwAQ7xPdrXYNumCp2g==
X-ME-Sender: <xms:t_bQXJJnZnYBbU8TKvDbicZi5vjwbMSigPzVnwb3ljLKeTFumiVnAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeelgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehoiihlrggsshdrohhrghenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:t_bQXKiiURxK2tZV6u0SkE8N-11vH2oTG40MikIrXG1I9Gy9nuNQbg>
 <xmx:t_bQXOIz6dz89jXBWJVvVFDh8vZqhDmZgy_K-c0YiK6PMpxOdxf9sw>
 <xmx:t_bQXPi0gIj7TIA4Qu0Q7I6AHwLRX8Ew_qF6GVWAuI35dkMjBxYbmw>
 <xmx:uPbQXBObfcp7lmRyLlsFm-KNbyKoA0AmaQFR1h-VIX68yAGtsc4TGQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3856E7C3DB; Mon,  6 May 2019 23:08:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <6372fa6d-4b64-4736-a62a-6f1926992d70@www.fastmail.com>
In-Reply-To: <06e8cf91-5a80-a6ad-fa93-11e4e2e37b7c@linux.vnet.ibm.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
 <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
 <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
 <20190424181851.fzfkef4ycqy3yuws@thinkpad.dyn.fuzziesquirrel.com>
 <36d7934c-4870-8ed9-a61f-a4fe69a6e76b@intel.com>
 <20190501180547.kzgnxxsfv2tkgr6x@thinkpad.dyn.fuzziesquirrel.com>
 <06e8cf91-5a80-a6ad-fa93-11e4e2e37b7c@linux.vnet.ibm.com>
Date: Mon, 06 May 2019 23:08:38 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Deepak Kodihalli" <dkodihal@linux.vnet.ibm.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Ed Tanous" <ed.tanous@intel.com>,
 "Vernon Mauery" <vernon.mauery@linux.intel.com>
Subject: Re: Redfish OEM commands in OpenBMC
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 6 May 2019, at 18:21, Deepak Kodihalli wrote:
> On 01/05/19 11:35 PM, Brad Bishop wrote:
> > On Mon, Apr 29, 2019 at 10:32:36AM -0700, Ed Tanous wrote:
> >=20
> >> On the nose, it sounds ok, but it would be good to see a proposal
> >> that's a little more detailed.=20
> > I put a proposal here:
> > https://lists.ozlabs.org/pipermail/openbmc/2019-April/016126.html
> >=20
> >>> Agreed on option #2.=C2=A0 However I still think you should consid=
er
> >>> runtime pluggable dynamic resolution.
> >>
> >> None of the features I've heard so far necessitates the use of runt=
ime
> >> discovery, or even fall outside what configurability is available i=
n
> >> bmcweb today.=C2=A0 "runtime pluggable" on an embedded system is a =
strange
> >> concept, given that all uses I know of today are really just an
> >> extension of compile time plugability, using the rootfs as the medi=
um
> >> for "discovery".=C2=A0 With that said, I'm imagining you're thinkin=
g
> >> something like what IPMI has today, which I might be misinterpretin=
g
> >> based on our discussion this morning?
> > Yes, this is what I was thinking.=C2=A0 I agree with you that we don=
't have
> > features that require the use of runtime discovery.=C2=A0 My reasoni=
ng is
> > rooted in concerns around code maintanence and adoption.
> >=20
> > maintanence:=C2=A0 I don't think code with a bunch of #ifdefs is des=
ired or
> > readable.=C2=A0 It might not be too bad starting out.
> >=20
> > adoption:=C2=A0 Do you recall how one of Michael Brown's issues with=
 bmcweb
> > was that there wasn't "any way to extend or replace functions withou=
t
> > forking the codebase?"=C2=A0 I believe this is exactly what he was t=
alking
> > about.=C2=A0 I suspect he didn't even consider compile time plugins =
because
> > in my experience maintaining codebases structured that way is painfu=
l.
> >=20
> >> It should be noted, we also have DBus "plugin" capability with the =
dbus
> >> interface already: anyone can host logs on dbus, and redfish will
> >> populate them.=C2=A0 That option doesn't really get to the core of =
the OEM
> >> issue though, but is certainly an option in the PEL log case that I=

> >> didn't think of right away.
> > This is an interesting thought.=C2=A0 We could put OEM things on DBu=
s and
> > maybe bmcweb looks at those to fill out OEM properties?
> >=20
> >>> It sounds like you want everyone to put their implementations of O=
EM
> >>> properties right next to each other in bmcweb and surround them wi=
th
> >>> ifdefs.=C2=A0 Do I have that right
> >> Yes, I believe you have that right.
> >=20
> >>> Shouldn't we allow the OEM to maintain their own implementation?
> >>> Also, when you (the bmcweb maintainer) look at the core bmcweb/red=
fish
> >>> code, do you want to be distracted by the twenty implementations o=
f an
> >>> OEM property?
> >>
> >> If my goal is to make my changes without breaking any of the other
> >> twenty implementations at the same time, absolutely, I want to be
> >> "distracted" by them.=20
> > Right.=C2=A0 This is the fallout of choosing to not have a framework=
/have an
> > unstable API.=C2=A0 This is also what makes this approach not scale =
very well
> > from a maintanence POV, IMO.
> >=20
> >>> Does it make sense for you to be the maintainer of code you have
> >>> zero investment in?
> >> We can definitely both agree that me personally maintaining all Red=
fish
> >> code is unmaintainable in the long term.=C2=A0 I don't want to be t=
he
> >> maintainer of code that I have no investment in, but I'm not sure h=
ow
> >> you came to the "Ed is the only maintainer of bmcweb for all time"
> >> conclusion.=C2=A0 The current maintainer files have provisions for =
layering
> >> just like the Kernel does.=C2=A0 Long-term, we can split maintainer=
ship on
> >> whatever lines are appropriate.
> > Sounds good!
> >=20
> >>> This is just the reality of the world we live in...=C2=A0 It is pr=
ecisely
> >>> why we need robust (yes, sometimes complicated, sometimes performa=
nce
> >>> impacting, sometimes harder to read) frameworks and abstractions t=
hat
> >>> allow us to share and collaborate where it makes sense and to move=

> >>> quickly where it does not.
> >> I would argue that the kernel driver interface is a great example o=
f
> >> how this should be done, and handles scales that we could only hope=
 to
> >> get to get to.=C2=A0 The kernel doesn't publish a "stable" driver i=
nterface
> >> internally, but does publish a concrete user-facing API.=20
> > It may not be a stable interface but there _is_ an interface to whic=
h
> > out of tree modules for instance can plug into.=C2=A0 And those modu=
les could
> > implement a custom, OEM ABI via sysfs or ioctls.
> >=20
> >> somewhat what bmcweb has attempted to model in its design;=C2=A0 Us=
er facing
> >> code should be able to be concrete, while keeping the internals
> >> flexible enough to make changes as better patterns emerge.
> >=20
> > This thread raises an important design point or "community norm" bei=
ng
> > established for OpenBMC.=C2=A0 IMO it has the potential to impact
> > participation rates and cost of maintanence in the future.=C2=A0 It =
would be
> > nice to get some opinions from more than just two people.=C2=A0 Anyo=
ne care
> > to chime in?
>=20
> We have a similar problem to solve with PLDM OEM commands. I was=20
> initially considering dynamically loaded libraries implementing OEM, b=
ut=20
> I am interested to know the pitfalls of the same from Vernon or others=
,=20
> as opposed to compile-time plugging-in of these libraries (not sure if=
=20
> this was already discussed in the last community call, which I couldn'=
t=20
> attend).
>=20
> Do we want to disallow someone who uses OpenBMC from writing proprieta=
ry=20
> PLDM OEM implementations - libraries which can be dynamically loaded a=
t=20
> runtime as opposed to compile time linking in of those implementations=
=20
> to the main PLDM code base, thereby requiring the OEM implementations =
to=20
> exist in the main PLDM code base?

If people are determined to write proprietary OEM implementations they c=
an
fork the codebase. It's Apache 2.0, not GPL, so there's no requirement t=
hey
redistribute the associated source. I'd be surprised if we as system des=
igners
backed ourselves into a corner where we were forced to load some third-p=
arty
proprietary PLDM plugin, given that we're working on OpenBMC.

Not that I'm advocating anyone forks, but it's not like they don't have =
any
options. That's my $0.02.

Andrew

>=20
> Thanks,
> Deepak
>=20
>=20
>=20
>
