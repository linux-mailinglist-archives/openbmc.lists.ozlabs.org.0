Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0047F6F608B
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 23:33:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBVY66V0fz3cfg
	for <lists+openbmc@lfdr.de>; Thu,  4 May 2023 07:32:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Ykptutjh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bkYf2/1g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Ykptutjh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bkYf2/1g;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBVXW2KMpz3c9y
	for <openbmc@lists.ozlabs.org>; Thu,  4 May 2023 07:32:25 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 0891C320099F
	for <openbmc@lists.ozlabs.org>; Wed,  3 May 2023 17:32:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 03 May 2023 17:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1683149540; x=1683235940; bh=73rw6VA0i23iuRz9+xEqWhoZY
	lLmCqUolH/qXegInwk=; b=YkptutjhaNSLFnfHc7qbBrQ1xB6GNB/pUZBbLzFPK
	DCdJhhtcqXlPVHCbABYSj1J/8RTM9YHjsqL7dHmhCOSYYvm38RkolOLBrSuwByLe
	vENr0UhsLajZ7XI8JD4/p4IkRc/q0jUP3J5YQZJlBFU9RNhqGW5vbgObE+7Jy2bn
	RZPfkO7jqi+lRYQJIhCDO6es2ipMrPREhBCyv6uNlkncQrIK0JiSriG4CysRbLh0
	hIb3Xtk4fmpLEO4nUFtWsFgFzJb1bls1GLP0mzfz8f27uKZVs1W7wsZkF2c4VU9/
	mSKMC6/LXSFE9QIkmlNoPU1t///iB0bcaYNd/cAIEh9+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683149540; x=1683235940; bh=73rw6VA0i23iuRz9+xEqWhoZYlLmCqUolH/
	qXegInwk=; b=bkYf2/1gOIjytsvsilJzeN84RXrGCtppF5Vp0hIr0ukuhYQ0vqD
	q53FT7dR2hIRErPiupAkXZ14wDmUuJSgE0b3v1PUAHNxy4R6FuJqXTLGTmCrZqV9
	LCaH+nlsZnNpEXJTbQIYTUCCBBvwP7/FBrg3TeZC5RRGeBV4pNmQZkXOoXpZH0gi
	sXLuC+o/lVhLQmujqW0wXra0MPdjF7EZT2ofK9K+L7DJscocVfEDG4N/i8E/rwNu
	G/wp1AqyUvobchOdAOiafc6MTMUFxXjG+9VFxgP4Rmu+lJEGo7Q+lpve5HApRmcS
	zWqGYq4pf42jpcrjJwoD955JoWB5YzAaz4Q==
X-ME-Sender: <xms:5NJSZH_l9UNdBUTisCJGvs9sARg5bkQR_oRLmpFH6NdZlPB4Mk2Vxw>
    <xme:5NJSZDvt7NYcNsh_njWtewS1dOgw5Wo8Wj69L2xmDSsKDxCe6E9Dnp46pcVPC1kWT
    g9H5dmBJTgcYxsmb5M>
X-ME-Received: <xmr:5NJSZFBcyDP-bbQGuQObBzMQ5AKIEFHffbe3gX9jSsehMKJ06tiM7_RUTEsxjc6s5642rjci2Pna6g4t-xhlbF0ziOmkQWrPyP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfggtggusehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejffeuleehledvfeevjeeuffejjeev
    ueevhedtudfftdegleekvddtveevtefgteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:5NJSZDea4s0HDOuAcWbSI11TLGC5wUoLgEd7Day97_KKK1axR4bqJw>
    <xmx:5NJSZMPXAFlnukXEgech1VAXECsqwf-6mS77uIplVYQPNFRXWCkFVg>
    <xmx:5NJSZFms3yl-Y2Ix_1YMCdLXVpABA-iqRgLX8mmnQmGhf98gADZfpw>
    <xmx:5NJSZHZsLTrUiKYiHQqsJ6OenSuitxf5UuljkfND08j_X-q1KZ2gmA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 3 May 2023 17:32:19 -0400 (EDT)
Date: Wed, 3 May 2023 16:32:18 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: OpenBMC releases
Message-ID: <ZFLS4odjmhjBEoh_@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="77xPrp5cM/D8WnIz"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--77xPrp5cM/D8WnIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Upstream Yocto made the Mickledore release recently.  Correspondingly
I've created a mickledore branch in our openbmc/openbmc repository and
created the 2.15.0-dev tag on the commit in master immediately after
this split.

I split for the langdale release a while ago and did not get any
feedback for a 2.13.0 release tag, so I simply made the tag today and
pushed that as well.  Consider 2.13.0 released.

I am manually testing the compile of the mickledore branch and then
will be creating a tag for 2.14.0-rc1 shortly.  If you care about such
things, please test the mickledore branch.  I've set myself a reminder
to tag the 2.14.0 release on Friday May 12th if I do not hear any
concerns.

--=20
Patrick Williams

--77xPrp5cM/D8WnIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRS0uIACgkQqwNHzC0A
wRmhxg//bDenjkYy/SZSnNhbi6Tmt31HYNADNdztRVJ66gDHmUIXg/7g5iT5QEZA
dIkVTqKs38y2crvFNlqxTJCO7HfuXor74gqAHmiqcR+HoacSR/4ndmWSymW0lOXz
p2V7OfUcv2uZq/miA5s9bAdTVTk5nBqRcHPNOpsFqeDHaNGoulArs2zSgHtlnZQF
7Jc47Sd1okXccLwnS+jbUYTT5PCjQ8Rcr7cdyg7aLVRMP+acLEuusy44XvT7PQSp
NMr6wWwJPt8XghHysNfs/OZ5s1UyXM5zam1vyIBnmSeayKvrqBWBleOxI1oEplcO
80LUKgxnE7D3nR8O6kYPox9H9C8LSKz0qW8bT+Jvobchkjxzp6pW8nr1fjZg5y8i
xUv/vS686S7WuGRDSty5aRVacysuoUjVKNn/c/X3GSSvgqCxku8D5/TisgBTd/Jg
lcuMMbQhtt5ttgEuNIuxdOVdkBmgiVuWEBnMi2asr4CCatl4fI/6VlbXsLsKqQuH
IGwBBtrjZHT+d/PmklgSxJNgNt0aXfRtHSrCKpfHtoC6mLVmmYItgxQh1bHbvkfz
0aNBBoVTaqBlUsQ5TqbvNib99ZX/BMFk3KPyEs/wEzK/nkjv5cr+KTiXcBMQgvuK
lF4f3kgoGKiLZkXrpSsUKtqVw2GKQX2Tcm4RkO7grpe05ng0tkc=
=ZBfA
-----END PGP SIGNATURE-----

--77xPrp5cM/D8WnIz--
