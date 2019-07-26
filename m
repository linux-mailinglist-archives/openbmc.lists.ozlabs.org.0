Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9195675C22
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 02:37:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vqsh15pnzDqQV
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 10:37:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XP5kTap3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ERrlDtAI"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vqrw3ThczDqCx
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 10:36:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EBDB422131;
 Thu, 25 Jul 2019 20:36:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 25 Jul 2019 20:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=dTgP9
 kU5JR+3PV18gMOr8fPmj3xAxpxnOhIr0Ik6Qbs=; b=XP5kTap39ha1YEQav3tXh
 Kyd+Nt9pTCaTSG/cdUW5z11YqMaAuaXCUYXVMG3bV+QADnVamPxJ+LjXck9CSJM8
 NadDy/vKTzKSqCuretV0cnGmObZpq4yOQdlgkQD6NKO6VnOUn82XJmqhUDyOk9ON
 f6kIhRfI0R5fx8zOeSuv5PDkcHEwdjK6Cuae44y1ofHcfKhHJ2mexcgmXyrGGZ9H
 zcQwE1OGrVA2uMlHJe31nH5hSXMu/hokgq0idfimdX6+AX8iAODyTxKzDE2p+DfS
 5FuWVDLyxmVnGThyEETX1VsA0Ee/ZYOor9AUdG2rTqC4vN2JwyJvOfR2eHtRCbNp
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=dTgP9kU5JR+3PV18gMOr8fPmj3xAxpxnOhIr0Ik6Q
 bs=; b=ERrlDtAIt1Tzu+v7nImBOsbvfAyYba0wKBiLKXoz/05W4FBK5w8uzc0M6
 jgqyJe01C9Qw2JwBb+M58pxzkYEddxTSw5aR7dy+P+ZjKUns+0xiN56aECXRzklX
 Mq0deWmBCzWlnBCz74/FtwNiRAkiI7yXeT0OzwGoxG19QXbZ9cDOInVyRv2vrqG/
 osFI5mUunz9F0yzEcd/EagMt59vDcxGViwisYv875zwAfUSucJIgHX44ZQBhHJsg
 IsnOkTGOZ/WYzxqW1ECbglhUlKlptemAu2Kdlea7YngfU455eBqq7Jtf4YWcvhYx
 5hSj7wG9p38O2uxva4DySeXz+dRIA==
X-ME-Sender: <xms:Cks6Xav9E1tfpV5sBD4T9JivxEBbVKjfjnroW8e-fYNntrO5xMp0tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:Cks6XaO0OjlZ86Acw1R617IAkOoeWtBvtF4jJJIKd-_mcQ5DZTE0PQ>
 <xmx:Cks6XUorMAniDMy0j7L8xNzYPbZmqWU38lQzeRT7p1TM4rvwAvrzPg>
 <xmx:Cks6Xb9D5-DiR1PAgvcDykTLoBsEplphyvC9iA0cz42vwr-9QF8pnw>
 <xmx:Cks6XTXdSxMbDotCVW6e8dzWZWM3SPDZHTZ5WGddfCILQG22xXSJ5Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E73FCE0129; Thu, 25 Jul 2019 20:36:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <59358350-cbf2-4855-83a2-7d6a274f5cf7@www.fastmail.com>
In-Reply-To: <CALLMt=oR-0C4PGgJxJ_Q06qqbuAwyQ0Yx_Yu1OXhiOmK0Qceiw@mail.gmail.com>
References: <904952B3-C01C-489C-BDD6-AB96F6734201@fb.com>
 <dd457a99-5202-415c-abb6-b4fad030e9ee@www.fastmail.com>
 <20190725022922.dqwkb2g4djsnobnw@thinkpad.dyn.fuzziesquirrel.com>
 <51140097-5a0b-4f5a-a198-c2c76b1013b9@www.fastmail.com>
 <7AF31809-55BF-4F0A-B2C4-A56A21BE1F5F@fb.com>
 <CALLMt=oR-0C4PGgJxJ_Q06qqbuAwyQ0Yx_Yu1OXhiOmK0Qceiw@mail.gmail.com>
Date: Fri, 26 Jul 2019 10:06:40 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>,
 "Wilfred Smith" <wilfredsmith@fb.com>
Subject: Re: CLI Tools
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 26 Jul 2019, at 06:03, Andrew Geissler wrote:
> On Thu, Jul 25, 2019 at 2:20 PM Wilfred Smith <wilfredsmith@fb.com> wr=
ote:
> >
> > All,
> >
> > I=E2=80=99m not sure what OpenBMC=E2=80=99s or Facebook=E2=80=99s of=
ficial stance on CLI is, so consider this comment to be a =E2=80=9Cshot =
from the hip=E2=80=9D of someone who means well.
> >
> > It seems to me that at least three buzzwords require invocation: con=
sistency, discoverability and automation. Obviously any developer who ca=
res enough to plumb the bowels of a vendor=E2=80=99s D-bus implementatio=
n can write his own utilities and has many means of accomplishing his ob=
jectives. But those areas are critical for the devop who just needs to g=
et a task done and cares little about a particular vendor=E2=80=99s impl=
ementation.
> >
> > 1. It would be good to agree on a set of common, simplified commands=
 for key operations that do not impose a steep learning curve. (Committi=
ng =E2=80=9Cdisable auto-reboot=E2=80=9D to memory is reasonable; commit=
ting =E2=80=9Cbusctl =E2=80=A6long hierarchical path=E2=80=A615 paramete=
rs=E2=80=9D is not)
> > 2. It would be good to have a common means of discovering the availa=
ble tool(s), their most common usages and adaptations. =E2=80=A6possibly=
 as simple as having a good base =E2=80=9Cman=E2=80=9D page that vendors=
 can adapt. (it=E2=80=99s 3 AM, there=E2=80=99s a power grid failure and=
 you need to recover from a cluster fault without doing a Google search=E2=
=80=A6can you figure it out, even if you=E2=80=99ve never done it before=
?)
> > 3. To enable automation in production, the commands should be script=
able and the means of catching and handling errors should be well-define=
d. (Thanks for the exit code 1, I know =E2=80=9Csomething=E2=80=9D is wr=
ong=E2=80=A6let me determine =E2=80=9CYou can=E2=80=99t reconfigure the =
FCoE connection because the NIC is offline=E2=80=9D and allow a script t=
o detect that, enable the NIC and carry on).
> > 4. Further, I think obmcutil should be extensible in a manner compat=
ible with Bitbake layers. This may avert the proliferation of vendor-spe=
cific, incompatible, functionally differing tools. It should be a framew=
ork that makes it easier to develop and extend compliant tools than to r=
oll =E2=80=9CAndy-dbg-nvme-cfg=E2=80=9D
>=20
> I definitely agree on all fronts. I've gotten a lot of complaints as w=
e've
> changed D-bus API's and target names over the years. We created openbm=
cutil as
> our standard for out of band access[1] (similar complaints with our cu=
stom REST
> api's). Moving to Redfish and our ability to use off the shelf tools l=
ike
> Redfishtool should slowly deprecate most of openbmcutil.
>=20
> As noted above, for internal, we've got obmcutil[2]. We recently moved=
 obmcutil
> from a python based app to bash so that we could make python optional =
in our
> phosphor layer.
>=20
> I'd definitely be interested in ways to add bitbake-layer based option=
s to this
> tool, but hopefully without having to add python back.
>=20
> The biggest issue I've seen with tools is that it becomes a new interf=
ace which
> must continue to always be supported. It definitely comes with a cost =
so we
> always want to be conscious of what we add to it.

Right. This is where mapping the supported actions to high-level uses-ca=
ses is
important - we want to make sure we don't bake implementation details in=
to the
interface. To a degree some of the structure imposed by IPMI (via ipmito=
ol) /
Redfish (via redfishtool) / phosphor-dbus-interfaces can be used to info=
rm what
these high level operations might be.

The fact that obmcutil is a shell-script as opposed to python shouldn't =
have too
much of an impact.=20

Andrew
