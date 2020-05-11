Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D21CCED7
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 02:14:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49L1f31zdBzDqjb
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 10:14:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=t+s4T7rG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=B8zm+NJg; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49L1cv47FnzDqg5
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 10:13:50 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 662625C00FC;
 Sun, 10 May 2020 20:13:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 10 May 2020 20:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=Ya8Bg
 PfkV7wt2CU0gZETOSmMOEXcq1gWmC4HwjtzfYE=; b=t+s4T7rGW+zuI2l583paw
 25CwzL82sMt+s0+6Uohw34+y7yr/+LnCUlw1p8k6ypsP0W4NlZfXA4D6pM+UAusr
 VHxfRj/kfvMDP5sIQ+m5CQvN6GHDiYJ2BdpiUxrqu0J6SrRPEnn0YIDfcL9w6R71
 KpMFVqe+B0KvBD2FMsPo7IvUx6B5i2LXwXocWJI00Pw8bwly49iOaaQwsHIbLIXF
 OBydCdeTXk4oAr82i6OE2oTYvqAZ5HnL6hcZgV5MQNBO5zJ0p5kEJqCIQ6BVxfXQ
 PSDfPrJ5x4NMMe5HNR+dL/ZZ7ioZlMHY2cgaE9sUYk+Wd/xOqps8UBXOhhgLinNO
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Ya8BgPfkV7wt2CU0gZETOSmMOEXcq1gWmC4Hwjtzf
 YE=; b=B8zm+NJgVCgddhtR6npxa9rkVZokkp/U4nXGQ6Da1WcXfSa87L1DbiIBx
 tPZo3FR0SAM87auzI2LfJSmiLM+RlA/VudKD+NghqdiUXL2gRt8TUn0eMncMT2cI
 RhwZKRY/S/8+PWGsgeraauRNVlguflWbYVX7fMkBYs5I5wdAqfJOCE0mq3fsqXg7
 TRHqWsCTJF16ceqOfDxzwdyBfy+MHyUQD0HsGjteddtAZd308hlHPAShTllVs89r
 kI4hE9YW81ycuJhASHWQyeyj5sGviP9aA25dq9fsRPm3WzxOqnSe/LYjCYfCF3ZR
 KT+yT075uZvatFPZ1i5joJb0C6dng==
X-ME-Sender: <xms:uZi4XrektSwStJ1n71pq8Tpwb-g-lG0soAjOV1X4GvR2uH_82bVB1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeelgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:uZi4XrraR_kV9FleDeiPsvZVQIQ_IpvJM5hPCEs_IbL6CwlC9yGkMA>
 <xmx:uZi4Xk9rvMKNGYNnxFVE0FVNbN4vWYfPbvZWcmUCaK0Zzu50K-_F6Q>
 <xmx:uZi4XvJkv9VHxuNbMki2arHG2LGpRQv7PXMjp7SouxUzjx51KAXmGg>
 <xmx:upi4XmCa-WBA2YIk91xi0PhpaDWvGih9k0B5hEz2iOEKMUngRCHCpg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4B6DEE00BB; Sun, 10 May 2020 20:13:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <775abd77-ce5b-4f1d-99e6-8f14b06114fa@www.fastmail.com>
In-Reply-To: <50cce7b2.1057.171fdb24f4d.Coremail.zhang_cy1989@163.com>
References: <50cce7b2.1057.171fdb24f4d.Coremail.zhang_cy1989@163.com>
Date: Mon, 11 May 2020 09:43:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: zhang_cy1989 <zhang_cy1989@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: How to use eSPI between Host and slave BMC in openbmc project
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
Cc: James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Felix,

On Sun, 10 May 2020, at 17:57, zhang_cy1989 wrote:
> =20
> Dear Andrew Jeffery
>=C2=A0I noticed that you mentioned eSPI in another=20
> mail thread.But I can't find some information in openbmc=20
> project.=C2=A0=C2=A0=C2=A0=C2=A0There are some questions about eSPI:
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01 Are there some soluti=
ons to use eSPI interface in openbmc project?
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02 Whether the Host side=
 needs eSPI controler driver? I can't find any=20
> info about eSPI in linux kernel for host os. Is eSPI transparent to th=
e=20
> Host side?
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03 Whether the slave sid=
e=EF=BC=88Ex BMC/EC=EF=BC=89 needs slave eSPI=20
> driver? I know there are some registers descriptions of eSPI controlle=
r=20
> in the ast2500 data sheet.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0Unfortunately, I don't find slave=20
> eSPI driver either.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04 which intel products inclu=
de eSPI=20
> feature?
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A05 eSPI interface can transmi=
t io cycle and mem cycle=EF=BC=8C=20
> but in which case or applications eSPI transfer mem cycle?

Unfortunately I'm not well placed to answer your questions - I work on
IBM POWER systems which use LPC rather than eSPI.

Some of the Intel crew will no doubt be more helpful here, I've added
James on Cc to see if he can give you any pointers. Jeremy has also
been poking at eSPI recently, so I've added him as well.

Cheers,

Andrew
