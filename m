Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E676031B5
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 19:41:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsLl81qZlz3c71
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 04:41:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Nlg5jT+I;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GACXhFYn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Nlg5jT+I;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GACXhFYn;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsLkY4n6pz2yZK
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 04:41:09 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 9EE8732007BE;
	Tue, 18 Oct 2022 13:41:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 18 Oct 2022 13:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666114866; x=1666201266; bh=Q6okgcVHIt
	aoExVOi5SkkOso3h4h/RzJ+S9nwxd2z/4=; b=Nlg5jT+IBsfgEln+pp+4mtICP2
	Tx6rDABIWfaCGrCq61PnZyg6+0X2fxTNJeuHsF4VUZNJdA5N4dVrozCfCBgX68Nm
	2p6z33o9yHhQpFDxq91Mfn0ijzuc2h7qvmhEPp9t5Z0IUI+ff4UrTAyqmUNzbbdB
	5rMAyCLeSCD6P0bVxYbgBEvOvp2FUiD35wJ/YkfsbmV3e3KSoc+hWE6B9jcpIib6
	/Ad2MY9uJ/MeG+chJSo1WQZVffkaRYKiff6ngVykS1P4Tlaf/SVLOM0vtsR2LVUQ
	DGFXGHZZSeRKyjnd6p9an5VzhXLESMrdGugnlCq/rBXxPNcAETG/fYBVY60Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666114866; x=1666201266; bh=Q6okgcVHItaoExVOi5SkkOso3h4h
	/RzJ+S9nwxd2z/4=; b=GACXhFYnlGwtU8AKa6BW7qNVpaNF7GpcKzwZTc49ypQf
	y/qtyPEa9BQWliN0qcWVS/ygrggnZCpGGsw+qOVc/H6A+fTPN+0uEhC6Sff9uogL
	a2sWD+llqPr5MTldiBtP3l0uA64Ks32yl9zaqpXMghx7JMNz87qP8k5LuOmKl3PM
	ojp0QEhGd1blc7Wkzmg+FTDtvFI+wTwXHkCNfpatr+3gOTvwrlKcoy5Yoml+Osqa
	MNdEbU5hik8BsiBXk3+haUyhVG9An/q1TwMhpMY+rlaGuCFCSzi9ZlbOzxQMoIGW
	x8D0S5ur71c2OtRittcux8X/CJySY3Z80qNMFUOA6w==
X-ME-Sender: <xms:MuVOY11Zp40eqzFH7g_FXSsuxYyEc-1uRsq3X3o5P7iSMuYn-ZT4PA>
    <xme:MuVOY8G2PPq1Vri3C6frVSivh5KIGUNw6-HdK4pWXJbwLxnDNm_C8Pw0tAARwRw2x
    uHluasskJjIOAZOkgM>
X-ME-Received: <xmr:MuVOY16OV-c4l6haozDRDwt3b01eGZS9t6ILwy4H54fft9RuhO5srMesP-keLydktJEPG4hqOcy7IfD0Qd-m-nEAkGv2IY1n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeifeekudfhtedtgfekgeelveej
    feehfeegueekieelgfekveeguefghfeivdfgieenucffohhmrghinhephihotghtohhprh
    hojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhdpohhpvghnsghmtgdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
    hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:MuVOYy1-uzGqbJVkVJl8ZRzfP6cMibd8jziEdJG7Mn0DKjAZSb1bLQ>
    <xmx:MuVOY4Hr8DMYtDaGkKpFtx_BY-s2Gs10kIov7I1SWTA_Um63UTeUZA>
    <xmx:MuVOYz_I_ApGWVV-Jm7VVWcq1mXzIGsuqlyTI4dNbI7CkrsPLB3pwg>
    <xmx:MuVOYzPZmFFddQ7fPhKE0AdRArAkJNpMdL0GRQle82Q3IvjPYpnz6A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 13:41:05 -0400 (EDT)
Date: Tue, 18 Oct 2022 12:41:04 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Miller, Troy" <troy.miller@hpe.com>
Subject: Re: Are there plans to merge up to Honister 3.4.4?
Message-ID: <Y07lMANd/vVL9ph6@heinlein.stwcx.org.github.beta.tailscale.net>
References: <DM4PR84MB180655396433F817B6361197E5289@DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM>
 <Y07jaeJ9/WjPUrEs@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/kuSAmvpM9NKrQgI"
Content-Disposition: inline
In-Reply-To: <Y07jaeJ9/WjPUrEs@heinlein.stwcx.org.github.beta.tailscale.net>
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


--/kuSAmvpM9NKrQgI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 12:33:29PM -0500, Patrick Williams wrote:
> On Tue, Oct 18, 2022 at 04:04:16PM +0000, Miller, Troy wrote:
> > The Yocto repo is showing 3.4.4:
> >     https://git.yoctoproject.org/poky/tree/meta-poky/conf/distro/poky.c=
onf?h=3Dhonister#n3 =20
> >=20
> > OpenBMC is still at 3.4.3:
> >     https://github.com/openbmc/openbmc/blob/honister/poky/meta-poky/con=
f/distro/poky.conf#L3
>=20
> There aren't many people who seem to work off our past release branches,
> so we don't always keep them promptly up to date.  Since honister was
> EOL, I assumed nobody was using it and hadn't checked on updates in
> while.  I can do a subtree pull for honister.

   https://gerrit.openbmc.org/c/openbmc/openbmc/+/58003 subtree updates [NE=
W]

--=20
Patrick Williams

--/kuSAmvpM9NKrQgI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNO5TAACgkQqwNHzC0A
wRlzDA/+LWaiU7uc0nFvNTSV7UVHkSmZ1Nb417JxADiE3XAOhRsxrFNtoaBlUaV/
U2gwHlp3Dc56EfUJR+lOGfZH1EaxIjOyAd0polTadGxjK6cvH/rPGZRwwDFpIkJX
iw2p0pGYXiG11QH1weif+PsZ5gr/7cVqsPSHymS3bv+9kqImIT/lLrpUlNb6Tpx0
YfLR4F8d1GX9ynkgedobQbVBaj5YzkMWeImdIwT2c+0in0TTFCemeA5D0BxRg0+9
xXXB6lbNw76D8sU7sPyg6V1XQB9Gl2ysimLZe9NoMZNsDppy8K7LQImPK0G9z78h
3qa6v8LT593rUTz1L/zv/oNp0NVkDxajBPIgHQUbr6le6FJExt7GHJnLj9WvxcO7
A42npZzI5PWk7ZfhA1PpoFGIKDXML1u/XLvqzQITzburo9iSRUAsOQDoH+byZqwD
XGFxZnwFItAFCupHHMxoUgZZ/P8GLJlQ0rDqLSx7ayouArJGIbzdgnXoU2i+CS1U
Iqq4jtQnvyL36eubpjbWvJ7/qcWahrQ3ho95dKQsqCA/SDXXSVMAJW+t725iSyFh
/W7tvVJLbT+gHSCSb3glAiSs1DPySr3reeIpE35odzCPi7HO4RgIaRXkTkJbVLrf
WjHxRH7s5DjIVk+TJnwZ3HZ1nyJCM9kCYSLk+jvlE9/G00QwUMs=
=5ykW
-----END PGP SIGNATURE-----

--/kuSAmvpM9NKrQgI--
