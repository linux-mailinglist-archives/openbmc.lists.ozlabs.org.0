Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED71EEF6E
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 04:23:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dRJt3ZljzDqxD
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 12:23:26 +1000 (AEST)
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
 header.s=fm2 header.b=koj+MPMU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=P4BV3ZW9; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dRHy5xSSzDqgL
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 12:22:38 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EFB3D6BB;
 Thu,  4 Jun 2020 22:22:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 04 Jun 2020 22:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=1iHBh
 5Haq/0Km92QFe+b0U46pUuMDL7FD4/1LbxzvSs=; b=koj+MPMUkvVeQvEhfGC/e
 mlrEY9QrJ1xR04uIbAvsUvDBAPO8F9W/A/j/EHvNZfIFlxA7NCOeKGkGgTED05x3
 J9VnvVb6Lvj4Q+FxWs7YUeVooFZFcjkVgtZwuC/RmKXSoPXfUuziaXzd2WeKJFai
 htAuZD/CFkzVnJbmLVAG/Vrbk69pk0e7cmUk//Mw319rE+IkAImf+b3Mox+htoBG
 493Zjf7KW+9zgX8d6Dyx7s4G911XfYMAP08neizsZn3RN6MFltDZid+Cs95VdKNU
 Mesz1OM49eGQCJNhyG2kx40//lavdPPVK2HaiZ2XjiIMlXc4t1a1+SFUKY74PNHM
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=1iHBh5Haq/0Km92QFe+b0U46pUuMDL7FD4/1Lbxzv
 Ss=; b=P4BV3ZW9VKufp1SAV/Nup78vwdtC3YBHfJSv1Av/ZIZEwFLCtSeoc61HR
 Da/O8oLW7EtKxpcCXg6nFqNNVn/T5Cs+ZJdw6EASr3C7Nh7QzfGHD9fj1JLvbzBd
 mCvSxuGjkDA3V9r2IfBY3Y5asrCnplM2z+aneHcZG+cwj6THmXmjSEuDi21JhJPZ
 IRRJcqX5HVBY/U01JDxtKP7kJXqrSFuNcVc/FEo2ep19/CTWMCCfKhXNWVYSEU1x
 F6TNNxA+NWQ95mQ85tU5AyXoTAnd+o+VAhUkH1vSbxIEGzEX4HwFGE2OflDOrR29
 A5r9Z7aCU6Z9iS483XrIOBc0KPWnw==
X-ME-Sender: <xms:aqzZXmaNaKpNFmigr3Prtthmfm4F_NcS2B4MvYOTeVe8HR3mYmTOIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegvddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:aqzZXpb0i5Mpw9LvQ7NOpIxA-2grof32nD5zCR4snEzK28i4EPJ_6Q>
 <xmx:aqzZXg9A_hXsnRUnUyP8p2Fr18g-EF2DCM2oDjFiwlArvF6PzVpDgg>
 <xmx:aqzZXooshh9p13ucX_kOjj-9OXL3BOQ9CmFuRYhQyyytVVHjs3j6FA>
 <xmx:a6zZXiB_Pqfoy_SerjTlZjnfU44oxXIefHkibe11-YzsQF9UjSdSQg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 01D7BE00A9; Thu,  4 Jun 2020 22:22:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com>
In-Reply-To: <54948e11-946b-49ad-945e-2d73c41c1a8a@linux.intel.com>
References: <b774a6d0-97f3-8cc7-9289-3792b5094cdd@linux.intel.com>
 <7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com>
 <54948e11-946b-49ad-945e-2d73c41c1a8a@linux.intel.com>
Date: Fri, 05 Jun 2020 11:51:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Jeremy Kerr" <jk@ozlabs.org>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>,
 "Hawrylewicz Czarnowski,
 Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@intel.com>, 
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_MCTP_Null_EID_-_Physical_addressing_support_-_Binding_priv?=
 =?UTF-8?Q?ate_in_API?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Richard,

I've trimmed out all the bits we agree on.

On Thu, 4 Jun 2020, at 19:35, Thomaiyar, Richard Marian wrote:
> On 6/3/2020 8:10 AM, Andrew Jeffery wrote:
> > Hi Richard,
>=20
> On Tue, 2 Jun 2020, at 02:43, Thomaiyar, Richard Marian wrote:
> >> All,
>=20
>  MCTP specification doesn=E2=80=99t restrict communication without EID=
=20
> assignment. i.e. MCTP devices can communicate with each other, even=20=

> without EID=E2=80=99s (Spec limits bridging MCTP commands only =E2=80=93=
 Sec 8.2=20
> Special Endpoints in DSP0236). The scenario can happen in following=20=

> cases
> > Before we jump ahead, as far as I can see this is only a problem in=20=

> libmctp for=20
> local bus communications involving at least one device requiring=20
> dynamic=20
> address allocation.  [Richard]: Intentionally didn't talk about static=
=20
> EID - networks as this problems won't be there. If you meant to say=20=

> that libmctp is not designed to handle non-static network case, let me=
=20
> know. I brought this topic to cover it in libmctp.

Let's not get ahead of ourselves :)

I _intend_ libmctp to handle non-static network cases just fine. We need=
 to do=20
some work though, mainly implementing support for routing.

> >> 1. MCTP Bus owner available only in Main power and not on stand-by.=
 In=20
> this case, devices are required to communicate using NULL EID, till=20=

> main power is applied.
> > Again, only for communication involving a device that requires dynam=
ic EID=20
> allocation.  [Richard]: Yes.
> >> 2. Till the EID=E2=80=99s are assigned by the Bus Owner, devices ca=
n=20
> communicate with NULL EID(Source & Dest).=20
> > Agreed, except for in the static case there's no need to do this=20
> because we=20
> know the EIDs.  [Richard]: Now for dynamic only EID case, how this wil=
l=20
> happen is the question here.

It is handled by the provisional EID proposal.

> >> Even Bus owner, when it sends=20
> out SetEID or query GetEID, it must send with NULL EID (for Dest =E2=80=
=93 Sec=20
> 12.3 Set Endpoint ID, 8.17.6 =E2=80=93 Reclaiming EID=E2=80=99s from h=
ot-plug devices=20
> in DSP0236)
> > Here's an extract from 8.17.6:
>=20
> >> Attempting to access each endpoint can be accomplished by issuing t=
he Get=20
> Endpoint ID command to the physical address of each device and compari=
ng the=20
> returned result to the existing entry in the routing table. If there i=
s no=20
> response to the command, or if there is a mismatch with the existing r=
outing=20
> information, the entry should be cleared and the corresponding EID or =
EID=20
> range should be returned to the "pool" for re-assignment.
> > Note that it says "can be accomplished" and "or if there is a mismat=
ch". So
> "must send with NULL EID" is too strong here - if we know an EID we ca=
n
> use it.
>=20
> This is where breaking down the process of sending a command into the=20=

> three=20
> phases becomes useful: The application uses the EID to specify the=20
> device it=20
> wants to talk to in the Command Generation phase, while the Message=20=

> Routing=20
> phase performs the mapping of EID to physical device address. If=20
> necessary, the=20
> EID in the message can be substituted with 0 in the Message Routing=20=

> phase.
>  [Richard]: Not really. This section 8.17.6 talks about reclaiming. i.=
e=20
> Basically, in this case, don't send GetEID command based on EID to=20
> physical address mapping, instead send GetEID to the needed physical=20=

> address with Dest EID Null, and cross verify it's EID.

That's an option but not a necessity as far as I read it. And if it's no=
t a=20
necessity, we can still use our current understanding of the EID to perf=
orm the=20
EID to physical address mapping in the routing phase. If we're unsure of=
 the=20
device's assigned EID, we can always mark what know as was its previous =
address=20
as provisional before sending the GetEID command. The provisional mark w=
ill=20
cause the routing layer to replace the message's destination EID with 0 =
after=20
resolving the physical address.

> This needs to be=20
> performed, to figure out whether EID of the device changed due to card=
=20
> replacement or reset etc. If we don't send with Dest EID as 0, then=20=

> device may drop the packet, if there is mismatch with it's EID.

This is why in the provisional EID proposal we substitute the supplied E=
ID with=20
0 in the routing layer.

> >> Similarly, as EndPoint device, need physical address of the bus own=
er,=20
> so that when SetEID is received from secondary/backup bus owner, we=20=

> will know what to do?
> > This isn't dependent on the physical address - the specification say=
s=20
> that if a=20
> device receives a subsequent SetEID to the first it must respond=20
> indicating the=20
> EID it has already been allocated. This has no tie to the physical=20
> address of=20
> the device sending the SetEID command. Further, we know both the EID=20=

> and the=20
> physical address of the device that propagated the SetEID from the=20
> received=20
> packet, so the local routing table should simply be updated with the=20=

> information=20
> captured.  [Richard]: Not really, if the same bus owner sends SetEID,=20=

> we need to accept that, but if the request comes from different one,=20=

> then we can't accept that one. Assume bus owner crashed / reset and=20=

> coming back up, it may start with different EID assignment, based on=20=

> number of devices at that point and devices needs to identify the bus=20=

> owner with UUID or physical address to uuid mapped.

This isn't what the spec says as I read it. Can you point to the section=
s that=20
made you come to this conclusion about the specific device that's acting=
 as bus=20
owner?

>=20
> > Going the other direction, upon receiving a message with EID 0,=20
> libmctp core=20
> will populate the routing table with a provisional EID, replace the=20=

> source EID=20
> 0 in the MCTP header with the provisional EID, then propagate the=20
> message up=20
> the stack.
>  [Richard]: This means that Provisional EID is carved out of the EID=20=

> Pool. With bridging - (Multiple networks), this can't be handled. We=20=

> will end up with real EID for the same provisional EID, and hence we=20=

> won't know when we send back data to which device we need to deliver.

This case can be detected by the routing layer, however I need to think =
through=20
the impacts some more. I don't think it precludes the provisional EID ap=
proach.=20
To get a bit more specific, provisional EIDs are only used above the rou=
ting=20
layer where an inbound message contains a 0 source EID, and for the outb=
ound=20
case where the destination EID should be 0. If an inbound message arrive=
s with=20
a non-zero source EID then we know it is a legitimately assigned EID and=
 we can=20
de-conflict the routing table.

I just need to make sure this works for each scenario.

> >>  This requires to pass physical addressing information to the MCTP=20=

> Control command layer or to the upper layer from libmctp.
> > I think I've demonstrated above that this might not be not necessary=
. Please=20
> poke holes in what I've proposed!
> [Richard]:=20
>=20
> _*For control command handling:*_ As stated, we need a mechanism other=
=20
> than EID (Note: I meant we may need to introduce one more field, to=20=

> make the difference - if you are saying that as provisional (i.e. not=20=

> the same mcpt_eid_t then that's what we are saying as binding private)=
.=20
>=20
> _*Now for other Message types*_ say PLDM etc. Other than EID, PLDM=20
> doesn't use any of the MCTP Transport header, but we still need to=20
> expose the transport header in the upper API, as other OEM types may=20=

> use it or rely on MCTP transport header for informaiton.

Can you please provide concrete examples of this being necessary?

> Now, having=20
> said there are cases where devices behind mux=20

For muxes it should be possible to determine the necessary mux state bet=
ween=20
the routing and the binding. The mux configuration should be encoded as =
part of=20
the physical address. This may mean we need binding "decorators" to hand=
le the=20
case.

> or requires special=20
> handling, now we need to see how to handle the same in terms of API=20=

> (which is second part of this discussion).

Can you please be more specific here? What do you have in mind?

Cheers,

Andrew
