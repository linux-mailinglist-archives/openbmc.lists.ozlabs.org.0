Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F3603922
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 07:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsfCR2cb4z3c3W
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 16:18:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ZDx2rCDP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=r4fJi5bw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ZDx2rCDP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=r4fJi5bw;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsfBt1c5Fz30NN
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 16:18:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2A3A05C0088;
	Wed, 19 Oct 2022 01:18:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 19 Oct 2022 01:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666156692; x=1666243092; bh=SSmpjScpNO
	Hx7X6P39Z2mtcM/Yb9Bpp0E/Smcalc/Ms=; b=ZDx2rCDP8TBREfRk/7BWAnwcj/
	JsqpdIxOoHQN/ODdKVhnQmKpqUqijTZyYLbanfg6CxLXT61rIttPAj8JwD/SZ9QZ
	uhtU8iSFQ0KYO7HbX3yAoqDIfbxMLb1C2PlJE4PBC/sTnX88sHCzR3SYFH1EG3LI
	yQYrsk/fW4s6DDhTbW8wq+DfBkMiWBVfB1DWyX/Lc9KTxNZDJqecent6ix5qt6nX
	c5JM4gbc1Mwm9hTCUKNbHBPposqgadIEyd4z2YPhMF6A8mUFHvvmdXjEHRrIoQP+
	IW+EdgWs/WrVsKLtLOWuBsPHmVPC6gRSDsyZU82Sz/tC29C5SKz1uinBUAGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666156692; x=1666243092; bh=SSmpjScpNOHx7X6P39Z2mtcM/Yb9
	Bpp0E/Smcalc/Ms=; b=r4fJi5bwGDpxxQxZ+AS+V7V0lZoIVDDyq9ISlJcKAhTm
	iKQR+wQLLh9m4Hm/M7JbVfOHz9CG88zBCmPCahET0zRoql6eQye+hxxDlGh4L6mb
	R9OEJibQdvPWoRMEX6ClG17g1R1baPYdbjcvVCyeU7peX+NCEWTKZEyPkmGJ87yQ
	etnYfzv5bxRhwFBTwtegk4Wh5WU65/7fPiuRwRwjEgR5kCDYlxV0c7luP2Da99jt
	aUkPv9javikQ6S1AHwl5Ig8w0u1bcSntKnInyUm7Bx7GPL7DwFzzaP4+GspI2xaS
	++c9ybjs7JI5L64V55DJ2b/Axh0MOO66hOJZVBZ4Ug==
X-ME-Sender: <xms:k4hPY02XdySlO42kdvY_qpseIIOvwO_Lj1U-IvN9UjzYwR-p5a5O7g>
    <xme:k4hPY_G1zIFHKxhjQyM0Xef487Y73W0aH2ID80wLCGDxY9qhIBn5iXI5em6r0jUPT
    W3jcRgTEvhkWJnxz2Q>
X-ME-Received: <xmr:k4hPY85VLN88kyWP3Db_zXaMVLpnhgv--aO0Py-a7UyDdEGK2ihxzWO5zJOo_qhwMNQ5UgS4Zop0XxTPnJojrFuT1FuWG-y4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelfedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeehfeejheeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:k4hPY90Iw93eMY8et2G-ngYO_VBe8WrRKY5lyWQWK4vIMB8MSqa2lg>
    <xmx:k4hPY3EYAbTv9_Ajk7N8Aikf3Nji1fcIRq6XRwXYawHxxRsW9nTxjA>
    <xmx:k4hPY2-Kf6fkBvOGWoRUCBeVU1_P78AHAzv8uFIJ4e_0SmnVxl3YSg>
    <xmx:lIhPY6MeFc_6n5D1T9fDdXRlFjz3S3aedA5t1oG8hDcbiZgJSWXliQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 01:18:11 -0400 (EDT)
Date: Wed, 19 Oct 2022 00:18:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: Blocking call in phosphor-networkd
Message-ID: <Y0+IkgQYAypeE5Zb@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAGm54UF_XeQivcVozvjMjWbc4J68E+PJSbyVRFdScoyfKh9oEQ@mail.gmail.com>
 <Y0+CuVkotsGxecxW@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6Esx3Lh+sHSwnGLf"
Content-Disposition: inline
In-Reply-To: <Y0+CuVkotsGxecxW@heinlein.stwcx.org.github.beta.tailscale.net>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--6Esx3Lh+sHSwnGLf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 11:53:13PM -0500, Patrick Williams wrote:
> On Wed, Oct 19, 2022 at 11:40:17AM +0800, Lei Yu wrote:
>=20
> > An alternative is to make async calls, but phosphor-networkd is
> > written in "sync" way so it may require more effort to change it
> > async.
>=20
> Does systemd-networkd emit any signals on this property?  Should we
> match/cache the property instead of calling over to the other daemon?

It appears like it does.  I'd recommend this approach.

```
$ busctl introspect org.freedesktop.hostname1 /org/freedesktop/hostname1
=2E..
org.freedesktop.hostname1           interface -         -
=2E..
=2EHostname                           property  s         "heinlein"      e=
mits-change <---
```

--=20
Patrick Williams

--6Esx3Lh+sHSwnGLf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNPiJAACgkQqwNHzC0A
wRkqIA//RSYnnnvejwInm46aJ+4b9fJYgvpTVtJc4MDblQ4c53rye8PASGUeYLpn
CqGhbbFcHbN17q6O5mkE62a2GsYwNeznWCQ5jOO+yUDfBJZBnwtstPxEKcWA/GHA
C05yR/GXXLFuNO/nFPz+PYRH3ztcKXzwZXeIrtNqencHpRO12aZoiGHQb+KtiEQ6
mTlexsPvrLMmuFYyTOahYH/DpDYz9noP7qiHqrQIGy17ZODyLzs6Cl6N4SsSXbW3
YJ/3kQHIHwz4niFKGrg2F4VJ21VDGh4LnY4oAHqaxwM7nBQK2xspcyUs7af3zXjt
Lvhjmh97MjH71fgMdDqEut/mARc1aolzjswbdla1ZSRE3cidU8fDXoCLmxWt35R/
79lTLbp6IzpxASRijkG9NY9reTYAxhYDFB+OwpyQvzj5yp9qIFZQYjIKhRMezzoa
IDUKMmfU+Q+Di3cb0ik0JWauqn7w5ZohwZL/VHG30UxAFKIrsQPY4LStl/FBotVl
P95ojIxcceTBgxJiWtO9WY1q4MMhHaAaras4sAL9oD0zw0fqecdzBxcdM0Korkg3
3/a1BzbeaNgHF9/XEmD3xVL/nPY8389tK4f/x+vX5YIw+h1Q5H2cKArXTAAeRyxK
kxN4jLZhpNOs++gT71W8MZY8no42mEKNEFhn+TZjBdGdkEeFf1I=
=qBl7
-----END PGP SIGNATURE-----

--6Esx3Lh+sHSwnGLf--
