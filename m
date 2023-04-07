Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934D6DB3F1
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 21:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtSbt0Spsz3cjb
	for <lists+openbmc@lfdr.de>; Sat,  8 Apr 2023 05:09:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=ywFmqYps;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mynDxuIY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=ywFmqYps;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mynDxuIY;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtSbC6jcKz3bg5
	for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2023 05:09:10 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 270A232001AB;
	Fri,  7 Apr 2023 15:09:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 07 Apr 2023 15:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1680894545; x=1680980945; bh=UU3S1OyYZm6rMOYGQLrosQmDs
	H0z8jOPEfkVKsU/6aY=; b=ywFmqYpshjoNtWTaXTGU15I/8vtWojKLdFVZ8lNXG
	AbRTIbp7Z0HSxNLAK8DwjzT/zJIUt8ysBCVZn6rt6rVa+Jdx9lv30PEqcpsnqE5T
	pumK7rTNinfIye4lE29h/Cug/MIPqBZgyZsVBNov/jXqCq4yjGCFbQBEMaJa0FG5
	0Pg/gqaxzt3MmZGKXumZC4KZklonLqkVBu85Imh6m6SnVP9mLzCRG4GilNllwf0k
	EyuFgxWjnMjOoNO6lRfu1j71g1CkRtgtyCzwvj/lgugGDALQMizWnEWCjfp8tESx
	AQC64WSYzJ7zmuBMP3wYHA5fCpV8CbH43BVIqlMSSeAnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680894545; x=1680980945; bh=UU3S1OyYZm6rMOYGQLrosQmDsH0z8jOPEfk
	VKsU/6aY=; b=mynDxuIYshm9hcgVbVKjlKaYFi2kpBQy6CH0x+no51u2yoLlSS0
	3vT2tqnBLT+F24I/Hbpvl1j/tIv7JToH6lQct384izRbUoTyR6VLYvi6zQl+8/nX
	KHGudaJiFc7p2dveNIZQnCQGBPQuDytkyKFGvEWbU0zWAwq9FR6cot06uorDi2Nk
	z/x820oHMDTMJssay9nvB0JPjW/CZmlD3jZeuxj8j/jDTXKwfD+wW/ukGr37xPqg
	T8JtQ+VuJvWJt4A6wR5i4Oo9Ggtg79hCkOBPDzc/WuUohdtC1l23WEN/v3qejcSZ
	kt+nE6jgUClmckZ88RpFlo1NG3Mx+k2gl5g==
X-ME-Sender: <xms:UWowZKwtd_dfqXXMZTmTErFfuRuKfJ5hx9CTjdOKpNgLlr_0Nkp0jA>
    <xme:UWowZGQWTftqSePje0GGqMclMq_j6NKpBdfregJekduumyNxq3FxdjFCbuOU3K8xT
    4X8ykR9qNMydQVQCFM>
X-ME-Received: <xmr:UWowZMW4gJVl_dhbyFrcWZIzkqLAG1DxCelB9kTNDbkKfNF2BSWYij5XL0366jiqk5KjNcJTXGkMDrhXf6ds1myO_aORpgx9ZAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejhedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkgggtugesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgfehledujeefheduteetuddtveet
    vefhleffieegvdduteeltdeihfeugfdvffejnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:UWowZAgWT77RechCPS8v6_3hO6GbEXUtESF9rBNb_x28QGzzig5dTQ>
    <xmx:UWowZMBVG5F3e16Z3laQWBsGgk0JfQh8DKUNqsfMrabQsUgzWTcE_g>
    <xmx:UWowZBKflGUueEslt_2r_vKWh3fKivw3OUjFxt47_-5-7uCBq2IjHw>
    <xmx:UWowZHpJIHDhwjDhR5QXZO2T6Km3ckvrH-np9At_eLjfouFfkh1yjg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 15:09:05 -0400 (EDT)
Date: Fri, 7 Apr 2023 14:09:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: OpenBMC kernel and CONFIG_PREEMPT
Message-ID: <ZDBqT-V-nM0ipaMq@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B20B2HeA1nbg7B9N"
Content-Disposition: inline
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--B20B2HeA1nbg7B9N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Joel,

Would you mind looking at this commit[1]?  Nuvoton seems to have a lot
of data that suggests that disabling CONFIG_PREEMPT leads to
significantly better performance.  The boot time is almost 50% faster.

I'm surprised that:

    1. CONFIG_PREEMPT really results in that worse of performance.
    2. The Nuvoton chip is special from any other ARM variant in this
       regard.

Should we disable this across the board on all our platforms?

1. https://github.com/openbmc/openbmc/commit/52ec37dd0b8776ce7f43e65e0be578=
c3606340b7
--=20
Patrick Williams

--B20B2HeA1nbg7B9N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQwak0ACgkQqwNHzC0A
wRm6Cw//Vp8mlTE0VZ2orp2ItxI9up9Jba8xnES7aYgRimGJMezmF27b5OAj22MI
eAkA+zqegPsn9QqnUxX8X5P1QT2N/BbxXpt5EVTlAmzY5sjsafloc9kGO9jVZYP2
AYTlWAd1oHdKMT79Ejxi5zctlWPMx/Xy3LG6Cm/h1pME9gn5itPDGbmTA3/y2++1
Wiyk0PI26CTbz6l8dzUL2MtEvjsfC7pJNkkjZUaHBuXaQtrobLt3hPMiqqH0C1qU
l6hcmJNc/bg8hTydHSZyTbTr553gLm+LfDjTloyoESgAh/jVgnORO0wHeftLdFxk
lrzp0l4vEQXYMOuvYTeOCxSSl3KHwgxSjR7/9fBPPiVr2iYShQGlH6FtPe2Z3Lm/
udZ+xb8R7ZmQsVhEJ+fMM3LQqSlOw8Eau6xl5KL6mn7AyzCcgzuX5Xvey3qKeabm
c7/T2vnZtKauDKBZIYsKnnur4/exLmaBGhH+tbjckR4Y/jr8nQUDwTjO0pt3NNab
i9ZTMHyBt77WWrbX109I354d98hlKcVsheyFfv5S8TMy50E8LK1dvMGYlZlnL+3E
BImKD0mu/gV2z9AF71ESIdGl4+B+rTOCmw1lcV02d4VfpDM+4ONsB4c3qtUANOOO
/F5ZgWzkostQvKx41R/ii8WVZ0TUvAyg2CgUr1HF/DBS9rvx0mA=
=T5RK
-----END PGP SIGNATURE-----

--B20B2HeA1nbg7B9N--
