Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7741CCEE3
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 02:43:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49L2Gk1DDjzDqYM
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 10:43:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=DWnPEwBF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=iCIxmzlx; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49L2Fz1nTjzDqhK
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 10:42:29 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E3FBE5C00F0;
 Sun, 10 May 2020 20:42:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 10 May 2020 20:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=IZZoF
 hjJfa4j9JYbbwP/8kr/fwATvPkfVz9HUSVB4bI=; b=DWnPEwBFFeMDmLvp+VVRr
 gbSVagf/jaiISLwsueG3G1CNkVa4IPH75VI0V+0mNfCT8WBow0yyQZ6kpNLefyuK
 ondsEtNrcq37wB+nQN3HFZ8AQBAkJIcEO6uz4PEK4IIr/3U1PLbFgGGHlB9I1HXN
 X+m5QgIiiNWZB7x5rQw16murObxiwnOGuIYMxilqxyDmacYnIUn5yvCI1vp8syZg
 4LeBXr6MiQ4lCWfq6auKbyA1BYZbnojmihrU44a5rQkqtGHTj4kPKeYaU97YpT5Z
 1sxaeY+WEUKOmlZyDLD5XJofGeknuiDpM0SHw37dCVgW+SVVZvw1Ymjsk++jO8Ds
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=IZZoFhjJfa4j9JYbbwP/8kr/fwATvPkfVz9HUSVB4
 bI=; b=iCIxmzlxjGMprldN0Ji6J9LXSpl3/iKuUoOFT7rc3IGMc1xeFQAVjgulX
 tFhBoSD9E79mXJlGoCjfEmY1xxtsxZ7VspuLPtYkwQxtZAQlG+fYLrRs1aA+9kM8
 XKUio2KjFA7AVQldEc+tBauOHUq8Nemk8TXf+zMOlp+qY/D2ldWGCYlKCveSkPh4
 46Xpaw/CesoNFYaCgI2xzL/HfErxU7AKaUHXSqIQQzlo6IRWng+Z1tsXn3OBmFDV
 nEeikDHURZPwIXZWiL75101vDnguw8PFnC8Q6K972dSegw5RglahS5bTiICUSb9u
 C2jatzJouVEOEir4vNUY0zCIUYGaw==
X-ME-Sender: <xms:cZ-4XjzXWWemq-EUAsygI3fhshkT0rVh7BtL_DesENKdYL_pGuIWxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeelgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeetveevlefgteduhfekvefftd
 ekveelgedtveegtdetjedvvdffvefffeduuedugfenucffohhmrghinhepihhnthgvlhdr
 tghomhdpmhhithhrvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:cZ-4XnbXzjZi9vmyq0Dj6YkFhLGm5wPe92Cnxs5IIXOlJDF6AjE7FQ>
 <xmx:cZ-4Xmndwt0ZnpyK_bo8WQdPK0HOzXPGpDkuTmn53u2_RW9ycuS5AQ>
 <xmx:cZ-4XskAlP2sD2x8TxRSedBPttOirZ4lcjZhC_tpBi7gSN2QPFbnFw>
 <xmx:cZ-4XgNOh48pHR5NoVwV5qdsZjl-eEMZ8Rpc6qg8E9AFGHhr2IGzrA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0CAB8E00BB; Sun, 10 May 2020 20:42:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <b59bce6b-52d6-427b-84fa-defae872af10@www.fastmail.com>
In-Reply-To: <tencent_720F45F5C22C1BFF2BF99029CA933807E907@qq.com>
References: <tencent_2D6AE7A4D981E94342BD340BC7DF4EBE7F05@qq.com>
 <4813264f-fe81-4563-838d-f5356acb768a@www.fastmail.com>
 <tencent_720F45F5C22C1BFF2BF99029CA933807E907@qq.com>
Date: Mon, 11 May 2020 10:12:03 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9?=
 =?UTF-8?Q?=E3=82=B4?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_Re=EF=BC=9A_How_can_the_host_access_BMC's_SPI_Flash_via_LP?=
 =?UTF-8?Q?C_and_How_do_BMC's_CPU_read_uboot_from_SPI_Flash_when_power_u?=
 =?UTF-8?Q?p=3F?=
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

Hello again!

On Sun, 10 May 2020, at 02:06, =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 wrote:
> Hi Mr. Andrew Jeffery
>=20
> Thank you for your help. Sorry for late response. After getting your=20=

> replay, I read AST2500 spec and OpenBMC linux kernel again.
> I found a "SuperIO controller" in AST2500 spec and "aspeed-lpc-ctrl.c"=
=20
> in linux kernel.
>=20
> 1. I found there is a logical device "iLPC2AHB" in SuperIO controller,=
=20
> and it is said the register can be accessed by Host CPU through LPC=20=

> bus(I am not sure but I think the SuperIO controller will be used for=20=

> Host CPU, and no BMC driver will use it).

Correct, the iLPC2AHB bridge is driven by host firmware.

> I also found "SIO iLPC2AHB=20
> address" register in SuperIO controller. Given that this register can=20=

> be accessed by Host CPU, can I think that the Host CPU firstly=20
> configure the "SIO iLPC2AHB address" register, then if the LPC slave=20=

> controller is configured rightly, Host CPU can access the BMC's memory=
=20
> space by using memory reading or writing to the address written to "SI=
O=20
> iLPC2AHB address" register?

Yes.

> If I am right, what does SuperIO controller do, is it between Host's=20=

> LPC bus and BMC's LPC slave controller like:
> Host-->LPC bus-->SuperIO controller-->LPC slave controller-->LPC2AHB=20=

> bridge-->SPI Flash mapping
> or SuperIO controller is independent of LPC slave controller like:
> Host-->LPC bus-->SuperIO controller
> Host-->LPC bus-->LPC slave contrller-->LPC2AHB bridge-->SPI Flash=20
> mapping

I think we need to separate out firmware accesses from what you're
describing above. The iLPC2AHB bridge is slow and is generally not
used to access the host flash. To access the host flash we use the
similarly-named but _different_ LPC2AHB bridge (no "i") that maps
LPC Firmware cycles into the BMC's physical address space. The key
point here is that the iLPC2AHB (with "i") bridge is accessed with LPC
IO cycles instead.

You can read more about different LPC cycle types in the specification:

https://www.intel.com/content/dam/www/program/design/us/en/documents/low=
-pin-count-interface-specification.pdf

So what is the iLPC2AHB bridge used for? Well, writing a SPI-NOR flash
directly is not possible with just LPC Firmware cycles as, for example,
we need to issue WREN, ERASE and PP commands in order get the data
to stick. In the naive case we use the iLPC2AHB bridge to drive these
commands through the BMC's host flash controller and then write the
data through LPC Firmware cycles.

However, as the iLPC2AHB bridge is unconstrained in what it can access
in the BMC's physical address space, you can do pretty much anything
else you want to the BMC peripherals with it as well. As such it can be
a significant security concern (depending on your threat model), and
there's a CVE that covers it:

https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2019-6260

>=20
> 2. I found "aspeed-lpc-ctrl.c" in linux kernel source code. Although I=
=20
> am not very familar with this driver, I found that by configuring the=20=

> LPC slave controller's host interface control register, this driver ca=
n=20
> decide which BMC's memory space can be mapper to Host CPU.
> And In the picture you draw for me
> Host CPU
>  -> LPC FW
>  -> LPC2AHB Bridge
>  -> SPI flash mapping
>  -> SPI Flash
> Does the "LPC FW" means aspeed-lpc-ctrl driver?

"LPC FW" simply means LPC Firmware cycles as described in the LPC
specification I linked above.

However, yes, LPC FW cycles are related to the aspeed-lpc-ctrl driver
as this driver is what controls the mapping of the firmware cycles onto
the BMC's physical address space. For some context, in OpenPOWER
systems we use the aspeed-lpc-ctrl driver to point the LPC2AHB bridge
at a specific region of BMC RAM that we have reserved (i.e. the BMC
kernel no-longer considers it generally available to applications or the=

kernel). In this configuration, all LPC FW read and write cycles issued
by the host access this reserved region of RAM (instead of e.g. the
host flash device).

Hope that helps,

Andrew
