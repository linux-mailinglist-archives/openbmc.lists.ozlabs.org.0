Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B628E80
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 03:05:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4597TW1G44zDqbY
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 11:05:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QH/cP17p"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lfZGRnaX"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4597T13vzDzDqYS;
 Fri, 24 May 2019 11:05:09 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 29937210F2;
 Thu, 23 May 2019 21:05:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 23 May 2019 21:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=p7kN7
 mk8EXLfdXUL8t+PIY5hNTzZuEsfgMtxYg4SzpE=; b=QH/cP17pMGuxxmS0j6iiq
 APCIqx1HplLSuBq7aoerwf0yxMbd6SWP4DqyQ39n2GbPzs3aylluQe28djZRPgd/
 KA9q1OJKtaVLsTqFI93RvrTIPW6t1pH651GcRwO1pXLNhaO+qD/3o95NiCHa3B8X
 oaaBOo3Eq+RMVxyVisUx3IQiPzkJkylHKswvJF3734vRqc9ct3MNPZ2TevbnXku1
 aKfIZRIOOfCgG0OIaPU4oXyhRViuzDsERD9U7fBNbGO8t6hCok87YTbOHLdVxfSA
 +kxXyXdKTMYvnoWRT2fLs91znBaUmMBv5Ee8wJBrm3B2v7we/DLEU4+DfTi33+tY
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=p7kN7mk8EXLfdXUL8t+PIY5hNTzZuEsfgMtxYg4Sz
 pE=; b=lfZGRnaXjgRh0LML4vw8yt7KHl20MF5i949XR2orQawV5lztyf1SL4XvG
 TArioex6PIFaH90U29ZPmw8LmQady/aJuO0nasBnSSufJpIaWPyBZb5PfWC3RjL7
 YVVemN1n402FVsl0FyDnao9q1xqF3WZ38Croq0f7VYRM/0nCrJASF+2pI9g5zFHi
 xi9IJPNEBH36R3+U27jVWW/v8tEbBkI4IbsSCGa8h6nZeSB4T2Vxwseh8Jr7wqG2
 Nq2nMBJSz5iD89G+A83I42d1D1uzd0UwK6f/ghEtJVezm6Jy25HuVhA/IRPZURQo
 N/k31NLOGpgJZOVJs7JXhiAASOaZg==
X-ME-Sender: <xms:QkPnXO4U1fetTShz3-RhMnyrBCv34XIaFs9Ng51pNphaPtyfcv8K5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduhedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlqdeimdenucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredt
 reerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifse
 grjhdrihgurdgruheqnecuffhomhgrihhnpehnihhsthdrghhovhenucfrrghrrghmpehm
 rghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:QkPnXH654iEgLoaKyZPmio7gltJJjSyyodCswQcN42vHmiN3gU-oEQ>
 <xmx:QkPnXDnNg21C-S7iXP3ALDfng82VFHr4b5MqFgh6ft7aA7OGoSf8Gw>
 <xmx:QkPnXJ1yI62ql3RjMqG3T0vy_k_aHZAvIjFBhnphChxwx01tFQhBtQ>
 <xmx:Q0PnXFAV0gEcHTNitaZbrM9NdOIGPqHhmd0PyH6ck8y4dExl5wPtsw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 619DAE00A1; Thu, 23 May 2019 21:05:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-550-g29afa21-fmstable-20190520v1
Mime-Version: 1.0
Message-Id: <2fbdcca4-5e16-469f-91b5-9dbb646628c1@www.fastmail.com>
In-Reply-To: <6fc6b3b5d3872ad73316b7a82cce498d@linux.vnet.ibm.com>
References: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
 <8d8c463f-5043-4d95-b907-02cb182dd5da@intel.com>
 <6fc6b3b5d3872ad73316b7a82cce498d@linux.vnet.ibm.com>
Date: Fri, 24 May 2019 10:35:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, "Ed Tanous" <ed.tanous@intel.com>
Subject: Re: [Design] Kernel-based BMC firewall
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
Cc: openbmc@lists.ozlabs.org,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 24 May 2019, at 07:10, Joseph Reynolds wrote:
> On 2019-03-04 10:14, Ed Tanous wrote:
> > On 3/1/19 1:31 PM, Joseph Reynolds wrote:
> >> ## Problem Description
> >>=20
> >> OpenBMC needs an integral firewall to monitor and control its IP=20=

> >> traffic.
> >=20
> > Why?  I believe this needs more details here on why the current=20
> > solution
> > is inadequate.  If some document/security policy is driving this, we=

> > should reference that here as well.  There _must_ be a standard or
> > authority for network security that we can reference rather than
> > creating our own.
> >=20
> > I would like to see the problem description be a lot longer than 1
> > sentence given how long the requirements section is.
>=20
>=20
> Ed and Andrew,
>=20
> Thanks for your email.  Based partly on your input, I=E2=80=99m droppi=
ng=20
> requirements which can be solved in better ways.  The remaining=20
> requirement is blocking ICMP packet types 13 and 14 (timestamp=20
> requests).  If this can be done without using a firewall, then I don=E2=
=80=99t=20
> see a need for a firewall at all.
>=20
> Here are the requirements my previous design attempted to address, wit=
h=20
> updated ideas about what the firewall should do.
>=20
>   - Block specific ICMP packets: Block ICMP packets of type 13 or 14=20=

> and/or code 0 per https://nvd.nist.gov/vuln/detail/CVE-1999-0524.  Giv=
en=20
> this is rated as LOW severity, I wonder if it is worth pursuing. =20
> Alternatively, can the Linux kernel be configured to not respond to=20=

> these packets?
>=20

There's no mechanism in the kernel to configure out ICMP timestamp
support, or any sysctl knob to turn it off at runtime. As it stands the
only approach to avoid responding is to patch the kernel or use netfilte=
r
(a firewall) to drop the packets.

Andrew
