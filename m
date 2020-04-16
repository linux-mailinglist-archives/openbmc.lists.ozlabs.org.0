Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD9A1AB710
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 07:01:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492nB71VwVzDrK3
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 15:01:19 +1000 (AEST)
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
 header.s=fm2 header.b=ngBeGGW4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=tkKr2zK1; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492n8y0Q1bzDr8N
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 15:00:17 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E14CC5C02A7;
 Thu, 16 Apr 2020 01:00:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 16 Apr 2020 01:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=vuZVQ
 m8GMUEE2HhPInhz7MkPCG75SyHYuejsOSNbhsY=; b=ngBeGGW41I43KN3Y9pK3M
 w/lDt48rHn0IUg4qz5tKglj1y5WfZAmhEgyUDTAZzSQqm23jhjVnOKTAsbT6FQqG
 WX/e5NvIQj0G/PFsyFjo6HR+SJ97VnyiD4dlOy0Ot+I6G1jSNso0ZwtCe32QLXp9
 7hhdpLMdD+JhRhITISodVtBcZlZ9PNbxNHMNeoDSEP1IqQq9rvlqiYqrXegP3d2U
 rHrOxNGstKVFI/R3zsFDWFuI1w3nVfjWoA6chJ7IZLnHNK7UOGEuIvTHWY1j22o9
 Xcjy8/Afg5ZeYAGUgRkQoTPaFGT0kNuWDr8j+0iD1RYToqbkmgYyzcbd4OvBhSE5
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=vuZVQm8GMUEE2HhPInhz7MkPCG75SyHYuejsOSNbh
 sY=; b=tkKr2zK1lJYmRYBoHLfWoeIzfv42Z6xskZg3gabLNpDoazuwiuPyOphkI
 DTrfCsgPsI24Hi7x/i0zDt06a7KKqzBGcq1CZTJxSITdYEHr4r8rytEnzrjaL8qM
 u5AapYQtX6m6ieioB72u8obqqoHHxzcglrBIyGsubBr3SsHDG+kER4Uwl7yC6LZD
 wkDahttylz5FMllL4Uk/YcIejw2PkwOnMIRDbBNbrBmrukSVjhKV5g5oWqMOfoLz
 0JPQGAUff3s9wyrxpqOkDUMOWZ3eQ9cFYvwlrH0ieXEUMqVzyTIqwmDzicK8MCr2
 ywozMlTrkzf/503HOedW7CB+Yzg+g==
X-ME-Sender: <xms:XeaXXtcOYMKM9f3Gw2efN-h1u5cgKtjv3v6mi9U2JBrwL8iesRnIzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruh
X-ME-Proxy: <xmx:XeaXXmJvHXrfiVlycgGe2kW2B8ZaUaxWMzC9yfXLa06sW-3SpJ3Kag>
 <xmx:XeaXXldJuPw3IFyFF5KFLKSnVOCjPbyHNvLC9J0ulNLUNz9kar9uig>
 <xmx:XeaXXrYgPxWs5AsQAjgZzjUHeVyPqrSzi-dV54tH8f41281ZAzQBjw>
 <xmx:XeaXXofYqrlzHuST4p64rc93koOe-VT7sz3wZkOrK-cDSuNPjRGh1g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 423B9E00B9; Thu, 16 Apr 2020 01:00:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <e77335c2-97a8-42aa-ad93-394fe6f9b420@www.fastmail.com>
In-Reply-To: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
References: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
Date: Thu, 16 Apr 2020 14:29:45 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Applicability.
>=20
> These guidelines are for the BMC's "intended external user interfaces"=
.=C2=A0=20
> For example, its management interfaces including its web server and al=
l=20
> REST APIs.=C2=A0 I haven't given much thought to the BMC/host interfac=
es or=20
> interfaces internal to the BMC.=C2=A0 IMHO, it is less important to ma=
intain=20
> compatibility in these areas.=C2=A0

Lets split this. My feelings are

1. Inband (BMC/Host) interfaces are in the same class as "intended
external user interfaces" and therefore should not have incompatible
changes unless _absolutely_ necessary. What we implement here should
have passed through a specification process under e.g. DMTF.

2. Interfaces between applications on the BMC (e.g. D-Bus interfaces)
is the class where compatibility is less critical, on systems that do no=
t
expose the D-Bus interfaces via REST. However, while any system exists
that exposes the D-Bus interfaces via REST we must constrain changes
to these interfaces as well.

> For example, if you need an incompatible=20
> change in an internal interface, you have a smaller set of users who=20=

> ought to be active in the project, and can give you feedback and adapt=
=20
> within a release cycle.
>=20

This is true for interfaces between BMC components, it's not true of the=

host firmware interfaces, hence my split above.

When we remove the ability to directly access the D-Bus interfaces via
REST we will gain a lot more freedom as the D-Bus interfaces then truly
become internal.

Andrew
