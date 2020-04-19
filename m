Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B411AF6D1
	for <lists+openbmc@lfdr.de>; Sun, 19 Apr 2020 06:31:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494cNH49vBzDrDg
	for <lists+openbmc@lfdr.de>; Sun, 19 Apr 2020 14:31:27 +1000 (AEST)
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
 header.s=fm2 header.b=y1jiUd1Q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Oy7wy9QU; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494cMP0M9DzDqgl
 for <openbmc@lists.ozlabs.org>; Sun, 19 Apr 2020 14:30:38 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B8195C0071;
 Sun, 19 Apr 2020 00:30:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 19 Apr 2020 00:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=i3pwb
 hkEUnwoB2E9UMfD63locfeNwtPHGBaOiL9MpbA=; b=y1jiUd1Qw4GF7AmIGniCM
 8WWKv9FPhGRvfhjB55hwuiDt0TYDxQGVk3zjkvIRHY5ylVMPN/zcB0T6aKOMZBoS
 kdw/jnfoPpQ/GoLQrJoAVhYbWbJyecmwQNTPYLTcInoSK8BRR1HQDPvAXBX7SFoD
 t7kp0iIIKRjg/Wvi5Yu2q95+sl5y0F993zA5d8PZhUoH32WcVI+b6wVS2G4wSNur
 2SO6OhJdYD5bJuSoPaEsIkHyeu4T+eDO3e08lTAlMiBT6IOP8R1pmaHf7IN8Fo0v
 5FdHAXFvri9tRGylFh4FIfTFUry39l4Y1dq5khodAX3Qh6mdpYuWrkmeMP5KBq7g
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=i3pwbhkEUnwoB2E9UMfD63locfeNwtPHGBaOiL9Mp
 bA=; b=Oy7wy9QU3Uqf0t2Zo32S6OqqQcyfsr+2DGT9wNTcVcF+oqxyLk373/DJb
 vtp6mzWlXTMYNMryl4AlFiF0MwG/pl4LuQs2ni6IKnaxe+gA8fEqeKtA24KMjANF
 fwaZfSaazvtjv6TJZ1+lVu8VaREluBpvU2WLfNykIUUq8vULGFKlzF3BrbSUpLRo
 6xcjCO7YlwPM7EMdGqe4xHSbSo5ZDiHwju12gRUHKCaZ7V5gWhSyBMBQ/DvgFeQx
 z3qgy78M8SSo6pVzmwjtkvF6ZVb83NPgYLzRhrO99zM2BzZRfna2WA/A2YnaJERE
 y8AqhCgtcyPRuSd2NpJxaDatPTS6A==
X-ME-Sender: <xms:69ObXm5Tm8HZeo_OjtI4zvGQcSp0zCnKa7FtimNxEpi6yTatiPinng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgedtgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruh
X-ME-Proxy: <xmx:69ObXuyA70yoQgId5jdrKZlLKLMUcYRQUuY9eVIEi_xSid2L9pNAAw>
 <xmx:69ObXl141FY0r7nKp-p2NtT5lNTadVwjeOooAQKiztAr6jA7hKgUeA>
 <xmx:69ObXoLWm6M3sNLNKBt94P6G9mJNcNIGZOYBO9K_6RHdsPaKbNcpVQ>
 <xmx:69ObXnEFIFzQQJkE7SK6a8pMZxpMfcZvjxwDF6TuR466HkA5_wiFpg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2D68BE00B0; Sun, 19 Apr 2020 00:30:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1131-g3221b37-fmstable-20200415v1
Mime-Version: 1.0
Message-Id: <1fbb893d-6a13-4d33-b11e-407f5283368e@www.fastmail.com>
In-Reply-To: <HK2PR04MB3826A2AAD55E77655BDFB558FED60@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB3826A2AAD55E77655BDFB558FED60@HK2PR04MB3826.apcprd04.prod.outlook.com>
Date: Sun, 19 Apr 2020 14:00:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: About RGMII mode setting of MAC0
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

Hi Harley

On Sat, 18 Apr 2020, at 20:44, zhouyuanqing8@outlook.com wrote:
> =20
>  Hi,=20
>=20
>  My name is Harley, I am currently developing an openbmc project based=
=20
> on the AST2500 chip. There are a few questions that need to be=20
> consulted. Please help me to answer them. Thank you very much!
>=20
>  1=E3=80=81About RGMII mode setting of MAC0
>  The current openbmc project and uboot code support 2 modes: MAC0 uses=
=20
> NCSI, MAC2 uses RGMII, but my board uses MAC0 RGMII. How can I simply=20=

> configure this to complete this work, or do I have to modify=20
> aspeednic.c and add the new patch file under the directory=20
> meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files ?

The way to select NCSI vs PHY is via the u-boot config files. Here are s=
ome
examples of different platforms selecting between different configs:

```
$ git grep 'UBOOT_MACHINE =3D' | head
meta-aspeed/conf/machine/evb-ast2500.conf:UBOOT_MACHINE =3D "ast_g5_phy_=
config"
meta-aspeed/conf/machine/evb-ast2600.conf:UBOOT_MACHINE =3D "ast2600_ope=
nbmc_defconfig"
meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/machine/evb-ast2500.conf:=
UBOOT_MACHINE =3D "ast_g5_phy_config"
meta-evb/meta-evb-enclustra/meta-evb-zx3-pm3/conf/machine/evb-zx3-pm3.co=
nf:UBOOT_MACHINE =3D "zynq_zc702_config"
meta-facebook/meta-tiogapass/conf/machine/tiogapass.conf:UBOOT_MACHINE =3D=
 "ast_g5_ncsi_config"
meta-facebook/meta-yosemitev2/conf/machine/yosemitev2.conf:UBOOT_MACHINE=
 =3D "ast_g5_ncsi_config"
```

Essentially, you want to configure your platform (i.e. in ${MACHINE}.con=
f) with:

```
UBOOT_MACHINE =3D "ast_g5_phy_config"
```

>=20
>  2=E3=80=81There are lot of recipes under  directory meta-phosphor, Ho=
w does=20
> bitbake choose specific recipes? I read the manual of bitbake and the=20=

> project of openbmc, and I didn't find a way to choose. openbmc has man=
y=20
> recipes, we can't use them all=E3=80=82

This is handled by variously by packagegroups, DISTRO_FEATURES,
MACHINE_FEATURES and IMAGE_INSTALL. Additionally if we look at
e.g. meta-ibm/meta-witherspoon/conf/machine/witherspoon.conf, we find:

```
require conf/machine/include/ast2500.inc
require conf/machine/include/obmc-bsp-common.inc
require conf/machine/include/openpower.inc
require conf/machine/include/p9.inc
```

If we drill down through these files we find things like
meta-aspeed/conf/machine/include/aspeed.inc:

MACHINE_EXTRA_RRECOMMENDS +=3D "udev-aspeed-vuart udev-aspeed-mtd-partit=
ions"

So if recommended packages are to be installed, then these two packages
will be installed on ASPEED-based images.

The hierarchy of `require` directives helps build up the set of packages=
 to be
installed in the image via at least the variables I mentioned above.

>=20
>  3=E3=80=81There are many common recipes under openbmc / meta-phosphor=
, is=20
> there any documentation about the architecture and detailed=20
> implementation principles of each recipe? For example, chassis power=20=

> control.

Less so documentation of the recipes themselves, but you'll find design
discussions, cheatsheets and guides in the docs repository:

https://github.com/openbmc/docs/

Hope that helps.

Andrew
