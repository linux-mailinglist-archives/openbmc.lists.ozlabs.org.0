Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA9E38018D
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 03:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhBM20Lfnz2ym8
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 11:50:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=blU1VJvO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YIIAZSDX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=blU1VJvO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=YIIAZSDX; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhBLf0n33z2y8C
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 11:50:33 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D64925C0124;
 Thu, 13 May 2021 21:50:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 13 May 2021 21:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=O1xif
 JkUZp6s8Hxy8mQHUlslsEKU/mVI7LO60FWq/9s=; b=blU1VJvO6k+GAceIvDxMl
 VjM4PvJ5qenBOuRdF/l1yowyLPOcZdBUtESL2cNvUV5gvLU1b9oJn2WtT3Bvnp9k
 My+jZLDVyv02e6ZPOwH6TbYzISjUbp3FSJPU3FrZ8yiAMD3vPAzmIpBFHSRDxYnJ
 6rY/yPyKVyFU5CXW5ZYDt3d47ER9Jgv6MHg5yyBsWxq/OGRT1LDh5xmrszJkv9Qg
 O/Jwnv4+aRsByXlVFfeR5JDcueEzmLFAgb93G2e6RGoGMGy/+wNrK/xvOCLwC3/s
 WZFqTqcs6nBt6qoILjfNHuo+pWShQnmzfJV0SaPGcgIurUIYJYBCYNmH5hxb9Oep
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=O1xifJkUZp6s8Hxy8mQHUlslsEKU/mVI7LO60FWq/
 9s=; b=YIIAZSDX9d2a2y6shPe9imuMx5tri0Bi5JNFMuF5kt833rkZaTRKcVNWg
 Lv5YEWs1zDxI/7FKvfmiDpI+GmPIRJILbAHpJ5vri6X/TKhra/IRr3PEssSZevFS
 /2gdF/ay56McV0i56FZ5dDJqh8Mw5tWNVP7VX8F7ujCHHBfKlqi3E82IPmUh7bNZ
 +ySRE/1ABDhhgkhDkdzpWPffmHeaMop4o5imydKZT42q6T8+XRA8RPcyDaMWFAxk
 YiJX/Q4p2lWcYLwiKlLi8npb4r76Iy7ULQuDm4wZBzprkZNjE142hPMJHPgWWMoy
 S+wLVR5YSXiK3BfFC/SReLe+RtLLA==
X-ME-Sender: <xms:ZNedYA4Nv-FMSWpyhL-mqz496TILY8biPmDVyNqp0YPCDd_9-GcW7w>
 <xme:ZNedYB4_8TjvHprBTpujQpJQrVo7xCeR7krLzsorfGDiygHFjuhyBsmxGMqx462-M
 YbsVWItqHLi02pr2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepvdegkeehgeefvdfhteehhf
 duteetgeeugefgieeigeeuheekudegtdekgfelgfehnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ZNedYPcrdSjy58B4_bMh64L4Cts18JjC5m3KXd8YQs8jrAUXkqQ7LA>
 <xmx:ZNedYFIO-31jbj2PpjzUaSIGM9AxYW_msRQ1jSBUd1__sz-Ibb2ZzQ>
 <xmx:ZNedYEKJnr4QkJ0kTuMGCj-GmwZL9IVde5TWQUi6RehZl5c_7WjVyg>
 <xmx:ZNedYLn3Zl4pIzIQlJrkGOEi629dUIOb5mLUZw22bWftw_5Nm4JdtQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E81A4A00079; Thu, 13 May 2021 21:50:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <6a1ed3ac-c09c-4596-86b4-4d7d82698c64@www.fastmail.com>
In-Reply-To: <BN3P110MB05467667602EC7ABA6A3C029BC519@BN3P110MB0546.NAMP110.PROD.OUTLOOK.COM>
References: <BN3P110MB05467667602EC7ABA6A3C029BC519@BN3P110MB0546.NAMP110.PROD.OUTLOOK.COM>
Date: Fri, 14 May 2021 11:20:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eric.Wetterlind@gd-ms.com" <Eric.Wetterlind@gd-ms.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Aspeed2600 EVB Hwmon problem
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



On Fri, 14 May 2021, at 07:12, Eric.Wetterlind@gd-ms.com wrote:
> =20
> Hello,
>=20
> =20
>=20
> I am currently trying to add a simple temp sensor to my image, which i=
s=20
> based off of the evb-ast2600 image.  I have successfully been able to=20=

> add this sensor to a ast2500-based image, but the 2600 is not=20
> cooperating.  Any pointers would be greatly appreciated (and=20
> sanity-saving), as I am near the end of all paths I know of.
>=20
> =20
>=20
> Project bblayers.conf.sample contains the following:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>   ##OEROOT##/meta \
>=20
>   ##OEROOT##/meta-poky \
>=20
>   ##OEROOT##/meta-openembedded/meta-oe \
>=20
>   ##OEROOT##/meta-openembedded/meta-networking \
>=20
>   ##OEROOT##/meta-openembedded/meta-python \
>=20
>   ##OEROOT##/meta-phosphor \
>=20
>   ##OEROOT##/meta-aspeed \
>=20
>   ##OEROOT##/meta-ourproject \
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> =20
>=20
> The device tree has this (and using the standard aspeed_g6_dtsi):
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> &i2c1 {
>=20
>         status =3D "okay";
>=20
> =20
>=20
>         tmp423@4c {
>=20
>                 compatible =3D "ti,tmp423";
>=20
>                 reg =3D <0x4c>;
>=20
>         };
>=20
> };

Are you actually using an AST2600 EVB? Or is this for your own board=20
design? Or are you using the EVB and adding some additional sensors via=20=

e.g. the SATA connector?

There's no such sensor on the 2600 EVB, though there is an LM75 at=20
0x4d. Then there's the additional complexity of the groups and jumpers=20=

to select the I2C buses.

>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> =20
>=20
> Recipes-phosphor/sensors contains the directory structure=20
> phosphor-hwmon/obmc/hwmon/ahb/apb/bus@1e78a000/i2c-bus@100, with=20
> tmp423.conf in it.
>=20
> =20
>=20
> The phosphor-hwmon_%.bbappend file contains this:
>=20
> =20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> FILESEXTRAPATHS_prepend_ourproject :=3D "${THISDIR}/${PN}:"
>=20
> EXTRA_OECONF_append_ourproject =3D " --enable-negative-errno-on-fail"
>=20
> CHIPS =3D " \
>=20
>         bus@1e78a000/i2c-bus@100/tmp423@4c \
>=20
>         "
>=20
> ITEMSFMT =3D "ahb/apb/{0}.conf"
>=20
> ITEMS =3D "${@compose_list(d, 'ITEMSFMT', 'CHIPS')}"
>=20
> ENVS =3D "obmc/hwmon/{0}"
>=20
> SYSTEMD_ENVIRONMENT_FILE_${PN}_append_ourproject =3D " ${@compose_list=
(d,=20
> 'ENVS', 'ITEMS')}"
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> =20
>=20
> When booting up in Qemu, the device is recognized:

Is this the only way you're testing? Or are you also testing on=20
appropriate hardware?

How did you invoke qemu? Does the machine you chose model a sensor at=20=

the appropriate address?

>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> #cat=20
> /sys/firmware/devicetree/base/ahb/apb/bus@1e78a000/i2c-bus@100/tmp423@=
4c/compatible
>=20
> ti,tmp423
>=20
> =20
>=20
> # cat=20
> /sys/devices/platform/ahb/ahb\:apb/ahb\:apb\:bus\@1e78a000/1e78a100.i2=
c-bus/i2c-1/1-004c/name
>=20
> tmp423
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> =20
>=20
> There is even a link in /sys/bus/i2c/devices/1-004c to=20
> /sys/devices/platform/ahb/ahb\:apb/ahb\:apb\:bus\@1e78a000/1e78a100.i2=
c-bus/i2c-1/1-004c.
>=20
> =20
>=20
> The .conf file shows up in=20
> /etc/default/obmc/hwmon/ahb/apb/bus@1e78a000/i2c-bus@100.
>=20
> =20
>=20
> The problem is that nothing ever gets populated into /sys/class/hwmon.=
 =20
> It is an empty directory.  On our ast2400 and ast2500 images, this sam=
e=20
> procedure, stripped down to almost the exact same specs as I=E2=80=99v=
e=20
> mentioned above, produces a link as /sys/class/hwmon/hwmon0. =20

All the paths you've expressed above are for the device, not the=20
driver. The devicetree is essentially an assertion that these devices=20=

are present, so if you describe them there then they will always appear=20=

at the paths you've listed above.

It seems an appropriate driver is not bound to the device. This could=20=

be because the driver didn't find the device present and bailed out, or=20=

the kernel is not configured with the appropriate driver.

What's in your kernel config? Do you have CONFIG_SENSORS_TMP421=3Dy?

Is there any output in dmesg about the driver failing to probe?

Andrew
