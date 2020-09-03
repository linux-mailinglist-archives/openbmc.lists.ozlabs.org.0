Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D226C25B994
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 06:19:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhndR2ZNNzDqvg
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 14:19:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=RS9jRkUq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=u03Vj+bV; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bhnbn0ngjzDqws
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 14:18:12 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5292B5C0160
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 00:18:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 03 Sep 2020 00:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=ScoXy
 69x5+7ikMfdhmvOmObgDTuC0NKTsDx++hFUeXE=; b=RS9jRkUqj3WeWapFkrfIj
 5SbsI1Xngk5sNCGJZsxmYY6j4gHjiBVKb0Q6inS6K28gDIlgAsIwPQbVi10ygmBc
 fuaAt8flCU4U0L5dYMCJcjDAlTKAEsLwzOEBM69fkyHh6IaqfPOAXTSWcY1b3f00
 +Ummaqe6Ys5Vpl+nauJrsrkBUeCaOurCW6fbZ7PVXKcfdlDJZAK3gTeNPMwyJ5kE
 Di+Xz4Fl8QOqItJ+xZnc/WsqonhitM0SGDVSnlJmLgJKd7MdLyyqMgFPRc0N8YMQ
 StUj377VKSLteQhNzS10QH8y8GvGQqUpWmNTZGzD0ydmRN22d3uxkizh17Rh9T+e
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ScoXy69x5+7ikMfdhmvOmObgDTuC0NKTsDx++hFUe
 XE=; b=u03Vj+bV1sIgG2NKXnb0Z2vWJiicSSfT6VwWuY3ITM6tNtEDUN9WHNQAa
 YCqCdGQr1Huc9j8HAfiNiYEwmnbDZngK9F9JfkE3Egd+xsRl8uAhGNSjjnOJVAnz
 P9n+EzGb04ImEmGRjfBf3QHMRycMCyyS0lhl9BcBRzfovexei8jOvGqAoF0Nb3Ys
 abtZrVjjrlVKJnfYSczdemxTFXsXm/ECY5ZucDI3DFUfN+PCVnwavZodIbMtH2fq
 jRfUnu5aGWLJRoS912+UFubJBYw9K78f/ROE50RivELCL19o5sBWNUNW9McVzClk
 EpVpKWLswpjUMbMs39++01jZ708gw==
X-ME-Sender: <xms:gW5QX0IyMbKcEw4boyMK9Rn0knmcfpC7_gtCISuZkaEpS0u3gd4P5A>
 <xme:gW5QX0LO5-ow_x4P9FYnRoT2TTFUhUugyBBrcBtLALU8QhpQf06j8A_1m3gFDiNU6
 OIFz6vVDqOApu7liA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegtddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepvdegkeehgeefvdfhteehhf
 duteetgeeugefgieeigeeuheekudegtdekgfelgfehnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:gW5QX0t2OqB4Z78GDLOMhfV52q9wOZW3Vjjv-965b7rxzsiDqFtd-Q>
 <xmx:gW5QXxYsMxvD4VikcMTrPk8g7B_ByZG-qoN7pept4xyjEfaCLMJnzQ>
 <xmx:gW5QX7ZN8YKlUfen8Zn9eV6xTx3WbnJuk7Esbr4QicoQfBI1nG9zDQ>
 <xmx:gm5QX0njaFS5k55InHb-joTEQyX3f6kX0ZqXthu0D-Hfpu0WAjbRug>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A1702E00DF; Thu,  3 Sep 2020 00:18:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-257-g770afc8-fm-20200903.002-g770afc8a
Mime-Version: 1.0
Message-Id: <16b6de5a-0910-40c9-92c9-f897500414ad@www.fastmail.com>
In-Reply-To: <4416929b.6eb5.1737fc69da9.Coremail.junhengdi@163.com>
References: <5e18b54e.8d5f.1737b18e7dc.Coremail.junhengdi@163.com>
 <5F1A49A2.5040900@linux.intel.com>
 <4416929b.6eb5.1737fc69da9.Coremail.junhengdi@163.com>
Date: Thu, 03 Sep 2020 13:47:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: how to change debug uart from uart5 to uart1 on ast2500 romulus?
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



On Fri, 24 Jul 2020, at 17:13, =E4=B8=8D=E8=AF=AD wrote:
> Dear openbmcer,
>=20
>  Thank you for your quick reply.
>=20
>  My code is based on openbmc meta-ibm/meta-romulus.I think it is=20
> similar to ast2500.evb. I tried to change debug console uart5(ttl) to=20=

> uart1(rs232) on uboot and kernel linux.
>=20
>  I read the ast2500 manual,find we can set Hardware Strap gpio or=20
> Hardware Strap register bit29 to changedebug console between uart5 and=
=20
> uart1 but not effective.
>=20
>  I also tried these:
>=20
>  (1) modify CONFIG_BOOTARGS to "console=3DttyS0,115200n8 root=3D/dev/r=
am=20
> rw" on uboot ast-g5.c
>=20
>  (2) modify stdout-path =3D &uart1; bootargs =3D "console=3DttyS0,1152=
00=20
> earlyprintk";  on kernel aspeed-bmc-opp-romulus.dts
>=20
> =20
>=20
>  Any advice will be appreciated.

Just to be clear here, the "Debug UART" is not the same as the BMC seria=
l port.=20
The debug UART is a feature of the Aspeed BMC's that allow for emergency=
=20
recovery in the event of flash corruption; it's a shell implemented in h=
ardware=20
that has a small command-set for doing MMIOs that has no dependency on v=
alid=20
firmware existing on the flash.

The strapping bit you mention affects which physical serial IO exposes t=
he=20
Debug UART functionality, not which IO is used for the BMC console.

The BMC console's UART is typically UART5 (ttyS4), though you could alwa=
ys=20
arrange for Linux and u-boot to use UART1. UARTs 1-4 can be plumbed thro=
ugh to=20
the host processor for its own purposes. Typically the BMC console (UART=
5) is=20
not exposed outside the system enclosure, so for the purpose of BMC reco=
very=20
the debug UART function can be switched to UART1 (which typically is exp=
osed=20
for the purpose of providing a physical host console).

It sounds like you're just trying to expose the BMC console on UART1, so=
 the=20
strapping bit is irrelevant. Changing bootargs as you have should be eno=
ugh to=20
get kernel boot messages, but you may need further changes to make=20
userspace expose a getty on ttyS0.

Hope that helps.

Andrew
