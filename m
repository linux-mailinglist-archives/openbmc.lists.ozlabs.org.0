Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B89DF1B82B2
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 02:24:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498BcD492gzDr8C
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 10:24:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=NYbv+Im/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=XqqI4xw4; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498BbP6fMmzDr7P
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 10:23:28 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CC41D5C006A;
 Fri, 24 Apr 2020 20:23:15 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 24 Apr 2020 20:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=tyk8k
 AlIjYSTibzcpgWnxLLxJI6jX2aEwdUUU7Vzk14=; b=NYbv+Im/llA+bg0fCIsdp
 lv3ASpPKmG6zAgGHUcZt5R9xIeOxsFDAQ8/DMOtrjLvtMjhxgj0cvL7M9kSuCBrG
 lgtCl8ph6bCdGOVvm8rbAMTnxenrnvsso1o1m0WhgO9OLRCvq1XoW1psLwJpolfQ
 gdCThCc/3/gmJJ+ID3J/Z/Rtqcw/6JZnrViq16mSkSTERezkO3MHSra5vNm++LF5
 Q81l0zzagES5iSS9Wx9rKKRjHFj8MD3rDDhMxZvzwa5qCDl9lIyLCwtYa5U2xmmp
 1NY3GJvwvsACIw/l5iWOYXhXCBzd46PioJ7AWrRR91sPzLJf7cztNsZpwD6IMnc+
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=tyk8kAlIjYSTibzcpgWnxLLxJI6jX2aEwdUUU7Vzk
 14=; b=XqqI4xw4O3g31a+pkUMTijwsbv8s0nn0fVMAU/n9tc7NC2bgdTclFg6H7
 UM+cymYNTWXGo/h3cb9dB89DyN6Cd3cVNg2LCJ9OPa5thdbYbiv4fXmo3Z1ROBTp
 l/k56PChShB7Vk/CzcVuJkSmJZ30n3uS55PMmtZUxDfj3Qu1+IZ8KGimhTQ5D4Kq
 bKh/0Ww0Zx329LrE4x7JWFDAGGkVtmvBSdEPf5XMplqqkk1ya75jRsxqxOIk/prZ
 jD4aeHSlss6lErBkPb2BJwpRwrSQvNYASoZvjJeJkcyEgir95Lburn3hpOsHHyMB
 34c8UKG3ptbMuoPM8xb4zMhunz4TQ==
X-ME-Sender: <xms:84KjXoe0dQTDi88jd-g4bLg_NS0rkfzpBt7ZP7yV6W8Xx6YgTONuUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedvgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:84KjXl7-D8Dye1R_FORDwekoSxU3wEFP9BpNs1gHitUVIu-UeA2n4g>
 <xmx:84KjXga6cfTJDsyfE1sDfmKqmhZie6bWH9p2zPpbjbuS6Y2m0gywrw>
 <xmx:84KjXixZAkG9ol09-zeZI73hfDPddFIXdCnjsqW6Iav9OGAFzKBMiQ>
 <xmx:84KjXl9JDtmNtbP86-cZcLpU26Gcq_ZMc8ufrl3olbFWuicqHRJczw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 36C17E016C; Fri, 24 Apr 2020 20:23:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <747b91e6-9245-4561-a349-f7e978146298@www.fastmail.com>
In-Reply-To: <9354f120-6e19-98bd-6e67-db22f61fc094@linux.ibm.com>
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
 <05835fa0-508f-d3ba-13be-280f4dfc92e4@yadro.com>
 <9354f120-6e19-98bd-6e67-db22f61fc094@linux.ibm.com>
Date: Sat, 25 Apr 2020 09:53:52 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>,
 "Alexander Amelkin" <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
Subject: Re: Proposal: how to make incompatible changes - versioning
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



On Fri, 24 Apr 2020, at 01:27, Joseph Reynolds wrote:
> On 4/23/20 7:11 AM, Alexander Amelkin wrote:
> > 15.04.2020 02:00, Joseph Reynolds =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> Proposal: how to make incompatible changes
> >>
> >> This is a proposal to add guidelines for making incompatible change=
s=20
> >> to OpenBMC interfaces.=C2=A0 Is it okay to make incompatible change=
s? Yes,=20
> >> IMHO: the project will continuously break compatibility in various=20=

> >> ways, and its users will adapt.=C2=A0 The main idea is to minimize =
churn=20
> >> and make it easier for users to adapt.
> >>
> >> As the OpenBMC project moves forward with new releases, it will mak=
e=20
> >> changes that necessarily break existing use cases.=C2=A0 My=20
> >> recommendations are:
> >> - Try hard to maintain forward compatibility.=C2=A0 For example, ma=
intain=20
> >> all of the BMC's intended user interfaces.
> >> - Identify changes that break compatibility.=C2=A0 Briefly describe=
 the=20
> >> use case, what breaks, how a user can adapt, and cross-link technic=
al=20
> >> discussions (Gerrit reviews, issues, emails).
> >> - Work with maintainers to determine which incompatible changes get=
=20
> >> merged and what documentation is needed.
> >> - Give users time to adapt to incompatible changes.=C2=A0 For examp=
le,=20
> >> deprecate interfaces in a previous release.
> >> - List incompatible changes in the [release notes][] so community=20=

> >> members will know they have to adapt, and link to how to adapt.
> >>
> >>
> > I'd say that any incompatible change must be reflected in the=20
> > interface version.
> >
> > As far as I understand, RedFish has all the interfaces strictly=20
> > specified and those specifications are bound to a specific RedFish=20=

> > version that is then encoded in the URL (e.g. /redfish/v1/).
> >
> > Any other interface should have a similar approach. A more relaxed=20=

> > one, if we keep our own flavor of REST, could be that each interface=
=20
> > could have a Version property (probably also encoded in the REST URL=
).
> >
> > That way, any user trying to access an old interface (thus via a=20
> > non-existant URL) would get a 404.
> >
> > Internally, for inter-process dbus communication the interface versi=
on=20
> > could be checked during compile time to prevent problems that couldn=
't=20
> > be detected by compiler/linker automatically. Those problems are, fo=
r=20
> > instance, incompatible change in the meaning of the values of a prop=
erty.
>=20
> Agreed.=C2=A0 The question to ponder: What is our REST API versioning=20=

> strategy?=C2=A0 What=C2=A0 best practices do we follow?

The D-Bus specification already recommends how to version D-Bus interfac=
es:

https://dbus.freedesktop.org/doc/dbus-specification.html#message-protoco=
l-names-interface

Andrew
