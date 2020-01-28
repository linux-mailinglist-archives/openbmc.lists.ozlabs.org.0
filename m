Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C272814AD41
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 01:38:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48674x0LQ4zDqGg
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 11:38:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=go4DyDoe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=XYVnqh27; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4867422lhVzDqCk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:37:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0A8D052C;
 Mon, 27 Jan 2020 19:37:18 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 27 Jan 2020 19:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=QUsHI
 3XjEYn57WGeGfBv+F6fPWDDnJTfpjOVKPp7Zvo=; b=go4DyDoeVK17nEydI4akf
 WJ1J2SiqpY2QUc/QSbgwa7wXwQtD40fIDR3D19SPtZ1DqosQ0OE+v6Z/D2GKBtig
 sdRTV8R0oYWw7fvDYQ315s+Y9UfAaEa4H5u2UNdJkmXUvpLTYA2g9nt4jTWFS6+R
 1gamlzjeIzAvBkGq3tTfXmfLdC5d8CaZDNdtJniUtpC9XPYFrJVrbdlia6CT/UuP
 P5qaVdPwTH0a0G7tjF5MLTnuoZDV7uoIIaGmimaNBYVEtuNMWigng/CkJOGgL9+H
 41MLUu8XSnKX5k/H+yLG5yK3V1wljV9yQhKE6JY1hAg4KX3RuF+RU6EQeBXRsBBD
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=QUsHI3XjEYn57WGeGfBv+F6fPWDDnJTfpjOVKPp7Z
 vo=; b=XYVnqh27ieiilvfAUY6dpneYJjciMTY1Hif2ScnAtUxVvNv6vjt9XuOqY
 3FTjyw2Ar08EhpxI8tosOvL1IVS8NpxAlKIMN5R0ZczccsShwQjUSDQ+/sV3joug
 /PivAgeeEAIktflRyzNMzmS6PO3qxNm0leoOp6GhFQ2FuBYtlibFkOeGdCV55BEK
 eFQwJLoAWnunBP0eqwjPidZS/rv6cIfPj2xOFz7HlH2fZs3HVGc90uDfxIwWY0Ia
 R39Mq43Q4citVa2WUEppE6LOuf91m7H3+fC/ad2owaFlcEt7sRtJZTO+Ut2V7jvD
 uVJU0qNNY5sfrjIua+3vIcuJ5VA9Q==
X-ME-Sender: <xms:PYIvXlwLKfXeluSLC9IeCgY2ITPY6IMTNDWxdI6aCzHO8AU2FNwqvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeefgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruh
X-ME-Proxy: <xmx:PYIvXg9Vyx4VxbnDHtYCQi8T-eGkBE3Iy4tzWRbSlBGeTtSU8PDNLw>
 <xmx:PYIvXmOpRAN3zea-AQVlnHO4V4F27cNGq39xE_oPHEEEDqA74QwRJg>
 <xmx:PYIvXsXRm2MxCXQOIACsRAkl8okngUDWVMyafZ6K4P-IcWpcpveTxQ>
 <xmx:PoIvXinUZtf7CFNf-p7l3nsH1zfjHQI3z0nW9U2TKgKQi-m8L7KBzw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D2235E00A2; Mon, 27 Jan 2020 19:37:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-781-gfc16016-fmstable-20200127v1
Mime-Version: 1.0
Message-Id: <4469ca80-8df5-43be-876b-f3e393407e59@www.fastmail.com>
In-Reply-To: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
References: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
Date: Tue, 28 Jan 2020 11:07:00 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "Deepak Kodihalli" <dkodihal@linux.vnet.ibm.com>, tomjoseph@in.ibm.com,
 "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "piotr.matuszczak@intel.com" <piotr.matuszczak@intel.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>,
 "James Mihm" <james.mihm@intel.com>
Subject: Re: Reg OpenBMC PMCI Workgroup
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



On Wed, 22 Jan 2020, at 01:32, Thomaiyar, Richard Marian wrote:
> =20
>=20
> All,=20
>=20
> In order to co-ordinate the PMCI implementation in OpenBMC (MCTP, PLDM=
,=20
> SPDM etc.), thought of having OpenBMC PMCI workgroup. Workgroups main=20=

> objective will be to discuss PMCI related design, and to speed up the=20=

> implementation in a collaborative manner with the community. This has=20=

> already been discussed in IRC, and few people already showed interest=20=

> in having a weekly / bi-weekly call for the same.=20
>=20
> Let me know if you are interested in joining and contributing the same=
,=20
> and what time will be convenient for you. Finding time convenient for=20=

> all time zone=E2=80=99s will be difficult but will try to see. So far =
people=20
> from Bangalore, Australia & Poland have shown interest / already=20
> contributing, and hence listed out times convenient for them. Please=20=

> reply to me your convenient time, if below mentioned time doesn=E2=80=99=
t suit.=20
> (Based on the reply, will try to select).=20
>=20
> Option1 : Monday - 3 PM to 4 PM IST (10:30 to 11:30 AM Poland / 8:30 t=
o=20
> 9:30 PM ACT).

This is probably going to work best for me out of all options.

>=20
> Option2: Tuesday (Same as above)

This is my second choice.

>=20
> Option 3: Monday - An hour earlier. (2 PM to 3 PM IST (9:30 to 10:30 A=
M=20
> Poland / 7:30 to 8:30 PM ACT).
>=20
> Option 4: Tuesday =E2=80=93 same time as option 3
>=20
>=20

Cheers,

Andrew
