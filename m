Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2B1EC77C
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 04:41:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cCpv3hGwzDqXR
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 12:41:43 +1000 (AEST)
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
 header.s=fm2 header.b=KHby66Nb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=WBc31Ev/; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cCnq6vgXzDqX1
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 12:40:47 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 721B36EA;
 Tue,  2 Jun 2020 22:40:43 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 02 Jun 2020 22:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=COkbE
 6fY1KotrX9h+TrvWTRLonNaFqgwy/nXyRN5sAY=; b=KHby66NbWwG5MAAqz4niE
 8B6j4aOhkF5N1/yDav95jUTF9zlhXbixGwUHprV5wHcHAzSPaLxk+ZDmF44OhfIV
 hLkLsU/X5HWODdLiX+/SRjQ1GBptj74OjzU4bMW2ln20AtwFEJQR7uebiNzxDuMm
 rKhCq8tQohdW/VYkQ2CLNLNVvq5NZ+p4lt5YALJ3cGKqpgGozYqH/c3PZTX8pbnD
 ZXr19U2nA99VivXvxA/zze9JCSW4BbdHGdn0rw5Rb8xIBa19wMYbxRG2olpUbG2U
 0UsI22aWqJFPMEleSvIFPPgDItwH0BGpM9k4EQ7HVPjh4AVhGYjCVILgRMUlaN1n
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=COkbE6fY1KotrX9h+TrvWTRLonNaFqgwy/nXyRN5s
 AY=; b=WBc31Ev/upfGWYPxC1raDcMqUaPT74J2Up2luuTJrmdAw1sUdX69eustn
 +7+qHiAAIZkHI3VAfS9f8tlFgr9wSHsU9x6IFRwc13W0vdwLk2yoKHajJzdpmYrS
 +AiBfqpuDGiywkY7EXibeakPXNe2DXlCnTWyNsz37IPZvafhHGA70EycpPLiRAAQ
 yv5Zy+0GMWip6s6hzEqXkdjLmq88CIBtx9vqS6uAk6czQ+vLcAWwdQWlUREIEG81
 WmyXhHGig+meCgQrxjQDevunUKZZdLcYQB8zGOymhIPAdcxkXME9ZH2IYJFH1D2p
 FRTwVfrLx6BHzr97Y+zuXKNp1eXzg==
X-ME-Sender: <xms:qQ3XXjI4J7ONgf8fi_VwxPMJQ8QWmXnmdg_7REuNUeH-ymeh3kZU7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefkedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeeiffetjeetiedttdehheehteefgefgheehleejvdeufefhhfejueef
 udfhieejfeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:qQ3XXnL1PfZr8tGbdfeBU31psB1fz4UtxxydCwu3Jw2RvhmZtSHDrQ>
 <xmx:qQ3XXrtFXpsYSvUG8Zttdxs-e3PJpv1mNCldCwyRQyioDs3mP5X7wg>
 <xmx:qQ3XXsYeEZFf89i6oN76IXYRdVHrwQ3QaeeupOOq5w0selj0Olv5XA>
 <xmx:qw3XXtz8Rt1-Ruw3pH1vRiVJ1bDYL0TRvkJvv14mbgntE6UwYj13wg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A4230E00AA; Tue,  2 Jun 2020 22:40:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com>
In-Reply-To: <b774a6d0-97f3-8cc7-9289-3792b5094cdd@linux.intel.com>
References: <b774a6d0-97f3-8cc7-9289-3792b5094cdd@linux.intel.com>
Date: Wed, 03 Jun 2020 12:10:21 +0930
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

On Tue, 2 Jun 2020, at 02:43, Thomaiyar, Richard Marian wrote:
> All,
>=20
>  MCTP specification doesn=E2=80=99t restrict communication without EID=
=20
> assignment. i.e. MCTP devices can communicate with each other, even=20=

> without EID=E2=80=99s (Spec limits bridging MCTP commands only =E2=80=93=
 Sec 8.2=20
> Special Endpoints in DSP0236). The scenario can happen in following=20=

> cases

Before we jump ahead, as far as I can see this is only a problem in libm=
ctp for=20
local bus communications involving at least one device requiring dynamic=
=20
address allocation.

Obviously that doesn't mean it's not a problem, just that there exists a=
 class=20
of configuration for which this is not an issue. Where it's not an issue=
 we can=20
follow the usual message routing path. My goal is that the flow for send=
ing=20
messages is the same regardless of whether we're communicating with stat=
ic or=20
dynamic devices irrespective of whether the dynamic device has formally =
been
assigned an address (i.e. we follow the same routing path in both cases)=
.

For static allocation, each endpoint in the network must be aware of the=
=20
allocated EIDs a-priori, and how this is managed is out of scope of the =
MCTP=20
base specification. If the EID assignment is known statically then there=
's no=20
need to worry about the special case of EID 0 as alluded to above.

Finally, conceptually, we can split the process of sending a command int=
o
three phases for the purpose of discussing addresses:

1. Command Generation: Performed at the application layer
2. Message Routing: Performed in libmctp core
3. Message Dispatch: Performed in the libmctp binding implementation=20

Keep this separation in mind. My goal is that we maintain abstractions a=
nd do=20
not propagate physical layer information beyond the libmctp core. I'll t=
ry to
build the case for EID 0 being a corner case, and that we should treat i=
t that
way in the libmctp public APIs as well (i.e. not let it impact the usual=
 interfaces
for sending messages).

>=20
> 1. MCTP Bus owner available only in Main power and not on stand-by. In=
=20
> this case, devices are required to communicate using NULL EID, till=20=

> main power is applied.

Again, only for communication involving a device that requires dynamic E=
ID=20
allocation.

>=20
> 2. Till the EID=E2=80=99s are assigned by the Bus Owner, devices can=20=

> communicate with NULL EID(Source & Dest).=20

Agreed, except for in the static case there's no need to do this because=
 we=20
know the EIDs.

> Even Bus owner, when it sends=20
> out SetEID or query GetEID, it must send with NULL EID (for Dest =E2=80=
=93 Sec=20
> 12.3 Set Endpoint ID, 8.17.6 =E2=80=93 Reclaiming EID=E2=80=99s from h=
ot-plug devices=20
> in DSP0236)

Here's an extract from 8.17.6:

> Attempting to access each endpoint can be accomplished by issuing the =
Get=20
> Endpoint ID command to the physical address of each device and compari=
ng the=20
> returned result to the existing entry in the routing table. If there i=
s no=20
> response to the command, or if there is a mismatch with the existing r=
outing=20
> information, the entry should be cleared and the corresponding EID or =
EID=20
> range should be returned to the "pool" for re-assignment.

Note that it says "can be accomplished" and "or if there is a mismatch".=
 So
"must send with NULL EID" is too strong here - if we know an EID we can
use it.

This is where breaking down the process of sending a command into the th=
ree=20
phases becomes useful: The application uses the EID to specify the devic=
e it=20
wants to talk to in the Command Generation phase, while the Message Rout=
ing=20
phase performs the mapping of EID to physical device address. If necessa=
ry, the=20
EID in the message can be substituted with 0 in the Message Routing phas=
e.

>=20
> Similarly, as EndPoint device, need physical address of the bus owner,=
=20
> so that when SetEID is received from secondary/backup bus owner, we=20=

> will know what to do?

This isn't dependent on the physical address - the specification says th=
at if a=20
device receives a subsequent SetEID to the first it must respond indicat=
ing the=20
EID it has already been allocated. This has no tie to the physical addre=
ss of=20
the device sending the SetEID command. Further, we know both the EID and=
 the=20
physical address of the device that propagated the SetEID from the recei=
ved=20
packet, so the local routing table should simply be updated with the inf=
ormation=20
captured.

> (Note: Secondary / backup bus owner may send with=20
> same bus owner EID, but it=E2=80=99s physical address will be differen=
t, and=20
> device can request for force Set EID).
>=20
> 3. Devices without bus owner in the network trying to communicate in=20=

> peer-to-peer =E2=80=93 single / simple network.=20

Again, if the EIDs have been statically assigned there's no reason not t=
o use=20
them. So again this is the case where communication involves at least on=
e=20
dynamic device.

>=20
> There are also scenario=E2=80=99s where device=E2=80=99s issue Get EID=
 command to the=20
> Bus owner to do a discovery or initiate discovery based on the need. I=
n=20
> this case, there can be 2 / 3 devices which will issue this GetEID, an=
d=20
> physical addressing is the way to differentiate the same.=20

Yep. And this is covered by the proposal I previously outlined to Sumant=
h (the=20
sequence outlined near the bottom of the reply):

https://lists.ozlabs.org/pipermail/openbmc/2020-April/021293.html

The summary is that for sending messages we populate the route table wit=
h a=20
provisional EID assignment before sending the message.

What we lack at the moment in libmctp is proper route table handling and=
 an API=20
to interact (add/remove/inspect) with route entries. However, continuing=
:

The fact that the EID is marked provisional in the routing table will ca=
use=20
libmctp core to replace the EID in the message with EID 0 before passing=
 the=20
message and the physical address to the appropriate binding.

Going the other direction, upon receiving a message with EID 0, libmctp =
core=20
will populate the routing table with a provisional EID, replace the sour=
ce EID=20
0 in the MCTP header with the provisional EID, then propagate the messag=
e up=20
the stack.

>=20
>  This requires to pass physical addressing information to the MCTP=20
> Control command layer or to the upper layer from libmctp.

I think I've demonstrated above that this might not be not necessary. Pl=
ease=20
poke holes in what I've proposed!

Andrew
