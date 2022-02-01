Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B44A6224
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 18:17:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpBSc5WLbz30gk
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 04:17:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=WSON+aBl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=eZ80zK2o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=WSON+aBl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eZ80zK2o; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpBS626bgz30RD
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 04:16:53 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7C9EA3201F1A;
 Tue,  1 Feb 2022 12:16:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 01 Feb 2022 12:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=JXRD3N/RzXO4tALsC7jjYQZE5To54zenxnCe14
 hhiis=; b=WSON+aBlinDKjdQMWxnxhM9K8Yj8swsUztYFxTQLx3zN1Ctwx35pKe
 u11O2R7WFH1MR5TiJoCsJjYPzi6sLzk+MIjS3RpqOQiorect7ucQh7pNVpteDKCv
 FJDT68926k7T7D0aHKz1iAF3Zccm32tHlF4FsE7kZd2sjIGBssOG0Ei17MDNTEOj
 SCqbNznE7pCFD1lNbA+njRKyaMlMsoZbnvIy9JwWUpMiJlbnl8TMwKXYTgud+6pC
 DcIacc90wQ9bSs1k793zpY6yRjfn1aK4tdZm5Rn62GIgiMl3rVECtGu64DMrsjwn
 FZrjdvA5z1d6BP+5KKW0aSe1+JYkUuJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JXRD3N/RzXO4tALsC
 7jjYQZE5To54zenxnCe14hhiis=; b=eZ80zK2oMPUSbx0WUTddyuDE5HFlaWXUl
 DoDlsMm5P5ft+IcbdbTV4VPH4jYzDEVdttrgGEmqEHl6m8afEWUzYPKtgGihwhdb
 +zdE+aZ6Hppeejof6O9PBFeuxcAgwENHsPT27LRkwghqdVuBODrTl9phKFc4CjrU
 AIToYwvGR04geiQlwxpT/8XSEfgyubgWT3zUKyJx3BsTKyi9fmoRtR+wDz/OfrHh
 PXRXfqqYAilMk0acx5gH41tY7t8My/1QpGGmcTZw2yCMq08ubRARNTZ1J4jdI00o
 /b2AruzaGoMAirjaCGPI7MSTzz1Pyx9Tw31UAvoCidxAO49nx/3ng==
X-ME-Sender: <xms:AGv5YYUs-YUWp3GkrO0plTBH0x2bGVG-PtoK9dM2rK4v5L3yw3Zs1w>
 <xme:AGv5YcmOqZF8VXcZENN6zv-B4_508-RLE8SwY_VNnRvEpDbD7AE2F-t8TI9SkliiI
 5G4m_Yy4lQr7_etRpE>
X-ME-Received: <xmr:AGv5Yca5JkI_R3reDm3Wav2qio1bEKjfH10Ze102e9lFCI2skfXZFqmcpvIursjq0MLcL9ehkT_DmpWl9tcUZgbhIKzWuBXhKTU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeefgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudefheel
 feehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:AGv5YXVp0DAY6Bn3LK5UuOuVhjhzjlNIMsiZnPUZ0Ms2D_4H3fVB7Q>
 <xmx:AGv5YSnJm_Hw5QiAZcLFQynsjcV0W0ibmWw_B4db7Vu_h3atTjcMmg>
 <xmx:AGv5YccYwlaoUboLa6jQsSd9DWUd_LYUVK7YsvsAKWOwnJKg4-IJkA>
 <xmx:AWv5YZsJS5DWt_fiJm81Qf-xf6wJoszsALMZc-KMMIJ9VXKYokvR4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Feb 2022 12:16:48 -0500 (EST)
Date: Tue, 1 Feb 2022 11:16:19 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
Subject: Re: OpenBMC v2.10/Hardknott status please
Message-ID: <Yflq4zasxDJrQXgw@heinlein>
References: <DM4PR84MB1855478F75965FD5275971E6D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yff1OKHtWj+xN7HN@heinlein>
 <DM4PR84MB1855BB4EEAB345B6A0FDB8E2D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yfhop9g2lX+DZ5iN@heinlein>
 <DM4PR84MB1855EFA80B04010BEE80ED3CD8269@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Gy7m6dLBA8Ht+x+n"
Content-Disposition: inline
In-Reply-To: <DM4PR84MB1855EFA80B04010BEE80ED3CD8269@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Gy7m6dLBA8Ht+x+n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 12:40:38AM +0000, Muggeridge, Matt wrote:
> > > - The 5.15 kernel is in OpenBMC/master, which I guess will be branched
> > > as kirkstone sometime from June (based on historically OpenBMC
> > > releases branch ~3mo after Yocto release).
> >=20
> > FWIW, our honister branch, which should become 2.11 if we ever make that
> > tag, is also using the 5.15 kernel.
> >=20
>=20
> That is interesting!  How do I determine which version of the kernel is i=
ncluded in which version of OpenBMC?
>=20
> I had been checking the poky.conf file for PREFERRED_VERSION, but for hon=
ister that shows as 5.14. (e.g. see https://github.com/openbmc/openbmc/blob=
/honister/poky/meta-poky/conf/distro/poky.conf#L22)

Uh, I guess I didn't even think to check how you decided that we were using=
 5.10
for our 2.10 branch.  I don't think anyone in OpenBMC uses the default/vani=
lla
kernel tree from upstream Yocto/poky, which is what you're looking at there.

You'll want to look at the meta-aspeed or meta-nuvoton depending on your
hardware.

- 2.9 aspeed is on 5.10.36:=20
    - https://github.com/openbmc/openbmc/blob/d767d3fb1ba70f03e0e212c24f414=
04f1248f660/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb#L2
- 2.10 aspeed is on 5.15.5:=20
    - https://github.com/openbmc/openbmc/blob/415294223a164a804e31e39c90043=
d15e9b153de/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb#L2
- 2.11/master aspeed is on 5.15.18:=20
    - https://github.com/openbmc/openbmc/blob/9a2a1dade6b355dafe6e72cfb2673=
2ca5e12587f/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb#L2

Nuvoton might be slightly different.  Surprisingly they are on the 5.14 bra=
nch
in master.  I currently only use Aspeed hardware so that's what I pay atten=
tion
to.

Since you have a HPE email address, I assume you don't even care about Aspe=
ed or
Nuvoton but really care about your own GXP hardware, so none of this is even
relevant to you.  You're going to have to get your drivers upstreamed and t=
hen
backported into one of our kernel trees.  I don't think Joel is maintaining=
 the
5.10.x tree, so if for some reason you really want to backport onto that yo=
u're
probably going to have to have a discussion with him about how to do
maintenance.  The simplest path is going to be to be on 5.15 like Aspeed /
master is.=20

--=20
Patrick Williams

--Gy7m6dLBA8Ht+x+n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmH5auIACgkQqwNHzC0A
wRnDbQ/+IXY4kmgiQUo0GDGmDqPvlY3ndqTjf8K36gtzzM8olREP2xzV9HP+7gtS
J6phgpV8m7IWhL3FQPgXrpnZeAccn7o9nkXwBVy2KGXfUtFdyY1lx4BDQVNQziXU
C/RRkoj79MdkdjpGvVOcGPydickagAToKu2JzfVv7Oel/HpFD/LT+JWLpABsFAtn
SrVNftc1c1R2GtCepMIRRU0KGhmzYK3CTE6QYO4dAeuFpIlry0BBTzhciCT+h8hQ
kX3Oe5fx38AvTN60UGBkdfhV55o+CzLdE/hzRWpb4ssnEzfrUTsOmv9PEJY9AAm2
wH+JB12XqycvJgEbO8wu08KH8pLE8TYUcym2GzMNoU8kmTITYBL+ivScsYxfB8fc
7bMIibhGku/6+Xj1yDkEvtVHJ+cIkxADv+fOcYL85sbC9JjhW7VBnAi49bCP5/6B
TmoxZ9qf18N61XldFAIdZ6eG0WO+008BFTDo553QqTuG+uTd6FaSvBCTq6f+/Lwm
h5JsrZJ/fzWln1YBpx9MmNH3NBkWKzBSyYk8TyniL0mp/52POSP654TF17fFote8
Ua/GJGrclI2qoNUbCO+5Wu7o8aMH2c5bxiMVxpR7iJ4gV/MqreF6fegMLgO6Cc8E
494/xmtUO3UUd8ClnOFlySCjfFy9yEod0HzAHDTEvAVmDpC/LWk=
=tCX4
-----END PGP SIGNATURE-----

--Gy7m6dLBA8Ht+x+n--
