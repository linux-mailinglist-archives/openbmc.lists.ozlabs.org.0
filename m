Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 573561ECF45
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 14:03:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cSHM6mTVzDqY7
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 22:03:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=SVKIaHlw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=tIV2YZ44; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cSFl1TcHzDqQS
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 22:02:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 91B544C1;
 Wed,  3 Jun 2020 08:02:14 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 03 Jun 2020 08:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=1uCZe
 cZ8qhvQo+laOMD1sVASn+yv4Ee7/TPxqAIbbnU=; b=SVKIaHlw1yqJomJufQVTu
 xyOCHbasVjqA5KkZvw6kH8l9um1E1VJ/pm38rRQjsK1TQllP1hPNNWzIdvDFm9I4
 EomOFJCkAdRttWtSk9f3WXILPw24gJaqGksoPWzhGmdVdg/sgoaJev6enYMuCiLF
 4bZ6D8GFkcW5n1VLL+wVwgtJmt0BduY3h/P6FSCNa/JLk+/mG63s4z7x2iM7UQrb
 VjqduBwj1u3w9QDkzE+3JPSgzabHERVkQ+TK/N8H26PS0YkN433Yh9pt/s6T5UMR
 Fi+0wJu+1Dd/OjrFOl9hlnue56SOJpeuW5dzjqJHOB7LlV4D6MBPuvx3jZEMdU0f
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=1uCZecZ8qhvQo+laOMD1sVASn+yv4Ee7/TPxqAIbb
 nU=; b=tIV2YZ44INyDCqMwY3NnvLIbIjEVL3DQjBax+48S2NCKOzbzWa9GeXeLj
 cCvAS+YFcS1vm9wZPqEUZMT4HexcApFf/FpwxArPDrtje63I1sj+mQhNaM0oHi1X
 XYgWSEq9KxdNrslTY0Mw82c6DhAZnqmG8LrXGO22/luSFQTGHH1H4h8MBzYCAYQ5
 OT7TtykVoDBa3vfXpUeRBPLioZRyQjCbS75Z3zEE4XIsvqyOma2XVKv5kRXWFrCR
 gvB9QSxvu4etNuUhmcskrRlou4hLtzCb9YU9H92m8ElEO3EoWJ6GChOao/keGIcq
 A6wSqY+jBNUORaZ7EZQ0Dlv0laXpw==
X-ME-Sender: <xms:RZHXXjUEHRMb3rDsS-8ks3Yu8zREnLVqytsxv0S27oQFcppE8ckVRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefledgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepheethefghfevheevgfektd
 dvtddvjeetgfevudfhheeghfffffdukeelleevjedtnecuffhomhgrihhnpehkvghrnhgv
 lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:RZHXXrmE9FPJVb23orrmXBqO2MJA_HolBqx9iwgmYx-cnEIAFNR0eA>
 <xmx:RZHXXvYQRy6aIxjto74_2OF9ope4RlLlHKt2djyd1ieYg2boFGKoIA>
 <xmx:RZHXXuWoKsnasEc8L4R9uYwSwKCEzO2sHofuQPn3vDA9n-qalQYpYw>
 <xmx:RpHXXpzgU4-rl-HysJEOvwE8yDElbi5HTVHV5gizjbI0uc6ms4fOdw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 508D9E00A9; Wed,  3 Jun 2020 08:02:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <ee8302a6-4303-457b-add1-8fa9d532c4a9@www.fastmail.com>
In-Reply-To: <tencent_1D864FA41CFA3E42D4A9B236FC75E41BA609@qq.com>
References: <tencent_2D6AE7A4D981E94342BD340BC7DF4EBE7F05@qq.com>
 <4813264f-fe81-4563-838d-f5356acb768a@www.fastmail.com>
 <tencent_720F45F5C22C1BFF2BF99029CA933807E907@qq.com>
 <b59bce6b-52d6-427b-84fa-defae872af10@www.fastmail.com>
 <tencent_1D864FA41CFA3E42D4A9B236FC75E41BA609@qq.com>
Date: Wed, 03 Jun 2020 21:31:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9?=
 =?UTF-8?Q?=E3=82=B4?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_Re=EF=BC=9A_Re=EF=BC=9A_How_can_the_host_access_BMC's_SPI_?=
 =?UTF-8?Q?Flash_via_LPC_and_How_do_BMC's_CPU_read_uboot_from_SPI_Flash_?=
 =?UTF-8?Q?when_power_up=3F?=
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

On Wed, 27 May 2020, at 22:30, =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 wrote:
> Hi Mr. Andrew Jeffery
>=20
> Thank you very much for your help. I really thanks for your=20
> explanations, very detail and very clear.
> Now I am clear about the iLPC2AHB bridge. I found the iLPC2AHB bridge=20=

> device in AST2500, but I do not find the LPC2AHB bridge. I think maybe=
=20
> it is integrated in LPC controller, and about how LPC2AHB work, perhap=
s=20
> I still need some time to study this.

Right, yes, it is "hidden" in the LPC controller. You want to look at re=
gisters=20
HICR7 and HICR8. Now, the descriptions for these two registers in the da=
tasheet=20
are quite cryptic. You mentioned you had found the aspeed-lpc-ctrl drive=
r in=20
the kernel earlier. This is the code that drives the LPC2AHB bridge, and=
 it has=20
the following helpful comment:

		/*
		 * The top half of HICR7 is the MSB of the BMC address of the
		 * mapping.
		 * The bottom half of HICR7 is the MSB of the HOST LPC
		 * firmware space address of the mapping.
		 *
		 * The 1 bits in the top of half of HICR8 represent the bits
		 * (in the requested address) that should be ignored and
		 * replaced with those from the top half of HICR7.
		 * The 1 bits in the bottom half of HICR8 represent the bits
		 * (in the requested address) that should be kept and pass
		 * into the BMC address space.
		 */

		/*
		 * It doesn't make sense to talk about a size or offset with
		 * low 16 bits set. Both HICR7 and HICR8 talk about the top 16
		 * bits of addresses and sizes.
		 */

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/soc/aspeed/aspeed-lpc-ctrl.c?h=3Dv5.7#n101

Hope that clarifies how the LPC2AHB works!

Andrew
