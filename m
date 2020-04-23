Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F191B533A
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 05:49:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4973FV3w0mzDr3G
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 13:49:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=uPsY6/K6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=K8MFie4O; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4973Dn0q5PzDqwB
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 13:48:24 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 78B3B5C028A;
 Wed, 22 Apr 2020 23:48:21 -0400 (EDT)
Received: from imap25 ([10.202.2.75])
 by compute3.internal (MEProxy); Wed, 22 Apr 2020 23:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=dqhB4
 u2mYmbl3WP2ZrGFlEEt29pugGZP43tvXXSrbtg=; b=uPsY6/K6RGLkIQUE3sFZf
 NTw0fRA0EnhFQ+UqKXVpA3KDdkRdJedHo7nJ0UeCdcf5XZkxY4wh/ud7TXWMKH+R
 T/VyOSg9GpmMiam4rgp0qYQ8v67uhLHPOi4XBUN89xFRXkZ7ypxHvwsXwwrOpETI
 HQ7b9Tmf6F7CTjq75QZrCdcNloD4FXpwH7VOgbv43P445w7UIyIfwb5XHZTBN5/A
 9/IAGFIdNZqp375QJTcoDU30XafDG7QNaWnBiBbEtqVElWkGQnaDnUQgUmv7h/C+
 8tYk2erEBgA2qrtS1E8P4D4vNw0h9p2SxXBHyRVV1z2s8s84DX6wrmNjR6fmCZ9q
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=dqhB4u2mYmbl3WP2ZrGFlEEt29pugGZP43tvXXSrb
 tg=; b=K8MFie4O7FcSc52iv1zjc08kXtlnnt7oTlQxH0O9OXWi+fxaueKVWH9U7
 HKj4WpEJyPpuA8ENd/mCMqfkjYq0gDGAEskfAnEwkVyc5d9+KUyuypx5WbMb4oxZ
 A9SSauxkSVNofhcYqP82XGgcFYYyFEWmwsJFbTSYF7AeLJK67od0RgSLipQfJFez
 8PsTbKzBmYOt0aOkkQf2w/j4k76R2WCrY118jlX1EHDv6Jyn6vmvGQHV5S26I5c9
 cULn6vWfmm1FFccpjWxTDIeG+cXHlC1peIAVkAX46wU9T+SxH/p3ThhNT1qtC04p
 nPbRRPQ3OWtO/L9A4gKDx5yIFn7zw==
X-ME-Sender: <xms:BBChXrSAl6A9W7bS-rlyLBqat-6dvbRq4I7EB9afylVDtC4vWtY1TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeekgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpeihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:BBChXs-gaPmFl3mD_PeIWCTMjY7ZPMHrakyNACdLzWBIG_iPMjYrdQ>
 <xmx:BBChXjfXvUbUIJNDuWwPR3Gu8tJTZNk0bwbFyRB-Zce6FAeRucpWTg>
 <xmx:BBChXmkDZB0C7OOub8XSzFAHgZsfbQ1Qa-77pGRPlbUK0JGoOeGLLg>
 <xmx:BRChXuLlZ6NnkhWh17OsSWBFXCYilFAgTQeb0iCXl65pz7BiaaWH5A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8AA24BC00C3; Wed, 22 Apr 2020 23:48:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <1e8ef9af-f417-46ec-b657-2997c4b4beac@www.fastmail.com>
In-Reply-To: <PS2PR04MB383294A0D7402F9204C46C97FED50@PS2PR04MB3832.apcprd04.prod.outlook.com>
References: <5e9dd66f.1c69fb81.45fc6.0118@mx.google.com>
 <PS2PR04MB383294A0D7402F9204C46C97FED50@PS2PR04MB3832.apcprd04.prod.outlook.com>
Date: Thu, 23 Apr 2020 13:18:55 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>,
 "Sui Chen" <suichen6@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_about_power_control.=E5=9B=9E=E5=A4=8D:_Call_for_Gardening?=
 =?UTF-8?Q?_Tasks?=
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
Cc: "uperic@163.com" <uperic@163.com>,
 "shinerocky@yahoo.com" <shinerocky@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 22 Apr 2020, at 00:20, zhouyuanqing8@outlook.com wrote:
>  Hi=20
>=20
>  This is a very good idea. As the first time to do openbmc, I look=20
> forward to it. Currently, I am being troubled by the problems you=20
> describe.
>=20
>  The following questions, please also help you answer it, thank you ve=
ry much.
>=20
>  1.I modified the dts file, how to use the command "bitbake -f=20
> linux-aspeed" to Generate fitimage and dub=EF=BC=9F
>  Now, I modify the dts file in the kernel source directory. When I=20
> compile, bitbake will re-fetch the source code, decompress, patch,=20
> configure, and compile, causing my changes to be overwritten. I=20
> currently use manual call scripts to compile dts files and make images=
=20
> for debugging.Is there a way to make bitbake skip the previous steps=20=

> and compile directly=EF=BC=9F

Two approaches here:

1. Use `devtool`[1], (`devtool modify linux-aspeed`), and then hack
on the source that gets extracted

2. Use your own fork of the kernel hack the linux-aspeed recipe to point=

to your local repo.

[1] https://www.yoctoproject.org/docs/2.0/dev-manual/dev-manual.html#dev=
-modifying-source-code

Diverging further, you can just build your own kernel out of your kernel=

source tree and netboot it on the BMC (either hardware or qemu). It
depends on what your needs are, but netbooting is great for doing kernel=

development and testing (as opposed to building images to be deployed).

>=20
>=20
>  2.The size of image-rwfs is 0, I want to use rwfs debugging, how to=20=

> configure to generate a normal image-rwfs?=20
> -rw-r--r--. 2 harleyzhou harleyzhou 9443 4=E6=9C=88 7 17:27=20
> obmc-phosphor-image-xxh-20200407092558.rootfs.manifest
>  -rw-r--r--. 2 harleyzhou harleyzhou 18214912 4=E6=9C=88 7 17:27=20
> obmc-phosphor-image-xxh-20200407092558.rootfs.squashfs-xz
>  -rw-rw-r--. 2 harleyzhou harleyzhou 33554432 4=E6=9C=88 7 17:27=20
> obmc-phosphor-image-xxh-20200407092558.static.mtd
>  -rw-rw-r--. 2 harleyzhou harleyzhou 33566720 4=E6=9C=88 7 17:28=20
> obmc-phosphor-image-xxh-20200407092558.static.mtd.all.tar
>  -rw-rw-r--. 2 harleyzhou harleyzhou 22384640 4=E6=9C=88 7 17:28=20
> obmc-phosphor-image-xxh-20200407092558.static.mtd.tar
>  -rw-r--r--. 2 harleyzhou harleyzhou 308218 4=E6=9C=88 7 17:27=20
> obmc-phosphor-image-xxh-20200407092558.testdata.json
>  -rw-r--r--. 2 harleyzhou harleyzhou 0  4=E6=9C=88 7 17:27=20
> obmc-phosphor-image-xxh.jffs2

As long as the flash partition is erased jffs2 will be happy to mount it=
, so
depending on your circumstances you may not need any data in
image-rwfs.

Hope that helps,

Andrew
