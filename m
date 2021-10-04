Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87543421699
	for <lists+openbmc@lfdr.de>; Mon,  4 Oct 2021 20:35:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNTtH31mmz2ymb
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 05:35:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=SpD0j2Xe;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jAtTAYk4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=SpD0j2Xe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jAtTAYk4; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNTsm6xR8z2yb9
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 05:35:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D68D5C0145;
 Mon,  4 Oct 2021 14:35:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 04 Oct 2021 14:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=GZ4mvYiaOko74nf/xjJkVpVYgt/sYfMTQPXahGibNiE=; b=SpD0j2Xe
 cqyfSA2+M4MZCQN/gsMTr6AlehwVkR1InLfovLrtNy+KT9g2LzFaB3p99KCg/DM1
 SbPRYRbzE8+JmcFtsIAfjaAnkUVX5wgBDKC9HiyC+Tdd3v9Rr1Vm4PLrSOuvnfhH
 WB1aqPddrj71WkFfJpryAeixqSkvF1sb9y0qbzVhIVx6Ti6rnlBjRZq5OEPhAnO4
 aTC1HSP1sT209MmGt1p8ZOYylC4Lq3p7KXw4Ig1U/oplw3drqEfwMismB8/G1yDO
 yKY3aTBTYGbm8CUQhD/8YsRGopv6W/8MThLRpvrCs7qWsNdMWfRpViztBLF9Y8bF
 sWg8cH1Xbfjinw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=GZ4mvYiaOko74nf/xjJkVpVYgt/sY
 fMTQPXahGibNiE=; b=jAtTAYk4vUQ5jKazzT/CEGrhlWz0rFyb6vqGefNoBXeda
 iV87eMfIHq8fwd7ibxWR6aBUbCNLjL44xwWkkb0Mxf5UcVdxmLPiAnDZnSkWhFBa
 uevabnuHpjgQLrjrxTVGVeUNhrZG2AiePYj5xN5UX/TOI5AUjrTj2Ec5l0UFdqIa
 IDBn1+A7C6oXsGfI8beZR794I+Xla45LBJYN3GTaW2Yu2cqX95EgqJ5z3etHqR4R
 AGb6TnkMoyRUC0SQDGnuL57UAqtzjRR2nAKz7TcgH4v2Wu0Zmq3wcA44kDBKYTdB
 GAooc1UgJC2YIU2p3DGEnJuwa+YTEEFx03i8y2w6Q==
X-ME-Sender: <xms:UElbYSAxaCZElyOZJ0eh7eSPkQ74t0JowevDRnikTyNNMhr3V-WdFA>
 <xme:UElbYcjG9UeYSQWf6ED90vbu0aLvHq7P2TTFWGRvUyDyMjJNopt5QHkyjmEOJ_fEz
 AZgBKwZNz99H4EMo6k>
X-ME-Received: <xmr:UElbYVmr_Rt_Y5L5GembiosrgbMoC1SCNDpbyEhIRHQG6EmFlUSE_6y8jcbUiImudS-C9LPFk6Xdg0AruTteRtIFYWOinHNgmQvMrfcGGjoN-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfggtggusehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduuedvfedtvdevjeduueelleekiedu
 veejffffffdvffdvjeekueejveetieeffeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:UElbYQxX4zuTUZ5MVxlCF9-lgv1bAJ0AJW_yWxf6WzxDF3mm5i1KnQ>
 <xmx:UElbYXScVKMpWIPoX4tuwNnZNdvPjkKPt-gjnARDxszHj6zJF1t01A>
 <xmx:UElbYbZxbeMFAazACw-zYHGB30YZlV62fxftMfibpz3fBsPcjKIw1Q>
 <xmx:WUlbYeK3cQ-Xy8FtANLKrcV6IoS3uvrjOhf1-3zzB9acKHe7oksC3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 14:34:56 -0400 (EDT)
Date: Mon, 4 Oct 2021 13:34:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: aspeed-adc driver kpanic
Message-ID: <YVtJTrgm3b3W4PY9@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uQCKveLIIPAf7NyV"
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


--uQCKveLIIPAf7NyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Billy,

When I run the latest linux-5.14 on QEMU with the Witherspoon config, I end=
 up
with a kernel panic[1].  I think there is an ordering problem in the aspeed=
_adc
driver. =20

See [2,3].  The code registers with devm a pointer to the prescaler object =
which
is not yet created.  I think it is possible that the struct value contains
uninitialized data as well.  Can you please take a look at this?

1. https://gist.github.com/williamspatrick/4a0f0d1e0ca6f54816461a8df09e6cb8
2. https://github.com/openbmc/linux/blob/dev-5.14/drivers/iio/adc/aspeed_ad=
c.c#L513
3. https://github.com/openbmc/linux/blob/dev-5.14/drivers/iio/adc/aspeed_ad=
c.c#L527

--=20
Patrick Williams

--uQCKveLIIPAf7NyV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFbSUwACgkQqwNHzC0A
wRkV+A//bGtZ3h5uJqjDoSpq6DcaSP/DUjjMpSLZQMQoibfIS2Pw8f7r48pQ+tzC
xB6G6w3mEiaGNjqwogwYlw72OAF5/2h0HSFz/MvBMUHEvQkroIFJesZRX4Ds9mio
jNR0iDecA7onDc9QddekEx8TIjS3yBLDPqSAv2/pn5IilouHSqQilHX2WvB/z1VC
SQ/AKY3WMDgNStCFji8h54B2OJnLALmqvNgbxRFNNTbpbrcjkejSoC3y+TBsikhy
yR5PPE/qfFQliW2mDEZ2Z+D2dASYjCnCsE9RRySCU0WTQXGBk+0KbM6/DBtt4ukK
+nHOP52Sx6zp/gTLJlVRJbT18dPWA6ywWVUwck2e7D4q+W1U/MA32U4Dzf81LwBO
zaaNd8SFkcbwkpDPijf+PCF3H1w2QaR+bSpsnxUUGsCL6hcn6bf+geF56H4IxZ8A
y5fN7j8sM7nDrMw00fAoJSBeZoXtyxBHGNyh5VBkSd1yDA987ZallA01gqLSD3qJ
3+vqly8Xi8/OsimdmaZCPyJvuCW6Apbx6dH0s5oi1MNdkAqKsQ5ePdg52lhG0qi0
v1R6C2q9Mo7WIBNliY258Pf6UBWyb47JaxVccYwqdA2nRkf1FTDtAfbx2ZXwEUO5
6FBsnoW6LmfZZ9aDXSsKQMchfnWsk/SkOwlO5vufyg8l1SIPUIU=
=jnHh
-----END PGP SIGNATURE-----

--uQCKveLIIPAf7NyV--
