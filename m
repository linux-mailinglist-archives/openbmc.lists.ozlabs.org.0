Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8D940103
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2024 00:24:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=pnrffvXO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DTr8l5C3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXtFZ6HMLz3ck4
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2024 08:24:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=pnrffvXO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DTr8l5C3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.155; helo=fhigh4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXtF40JCXz30Wg
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2024 08:24:07 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 594C41140128;
	Mon, 29 Jul 2024 18:24:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 29 Jul 2024 18:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1722291845; x=1722378245; bh=PuCthxiV/o
	ot+hi4ffP4V4H1Yi+A8Keb7zroefVs0+4=; b=pnrffvXOGNJxxyBM+DjPqevvIo
	NAWRHrFX//xkviqEXQNZWpISVhoTT0e9wsI2Kj9nvWJbrmc3klDhlVQL7ijwLot8
	JA1i5fLcaBNOhMbsiDGHWpf5Gmsto0pSRgF+phrxU4sWQpl901JvHjXmCD92bVHC
	d/rfwu8wW4OoxhaETMqwcrO9cFEdDn1UoBqFxVymLY87Kp/B1GFEVLLNrurtyWP4
	XsBsRJHBtwF0PPh+rmCUxl+ILKBjDrR1BSOVRjb9zeZToAeUYmL495Nh8ZrSvTtz
	6t39TBUN68BFM6p1FeV1EO4kCa8KcJzo8FqM+ghRHFrZFc1ob8jch5y5irdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722291845; x=1722378245; bh=PuCthxiV/oot+hi4ffP4V4H1Yi+A
	8Keb7zroefVs0+4=; b=DTr8l5C3w/o1VOfuetMvI5NBFqQOz792tl7qBnWHd3r7
	HYzyyRFmnVqUNQl93zb5QKVLlLoqy3IcOdSIjJtSgemlmglGpmxJWJxDAKQIlODH
	KHxxJEKOyDE5n1BM13kG8tHHHrK+vFsJDihbhTT6J/t82JqhFfgqsUiR0IKxe3pi
	0H0px6C1hzent5C5R1RvpGcoJaGNAT3vMgthyqLjJReEKiwjTiLX4awzh4LfL0k8
	AVvjICC7IfE04J51ovqByJnEQmMSdGe+PTRpm2LS4QZJ2SoPzC4c4zLgKa7jKt2g
	7n8kYERSWxrafNaODuiaE5GSSssmT1y6PsXfC0J0xg==
X-ME-Sender: <xms:hRaoZukRF637NgKxIRiE5x9FIG4re_9FooIDN4Xnf1kUsNafp7SesA>
    <xme:hRaoZl0SrEWEpaAI8loOYqOm3cVQoZoKEeW4xS0h6PHmVr7VXpnjpcUdDdIpb_MNb
    5tCJGX6VPwTkjKAY_Q>
X-ME-Received: <xmr:hRaoZsq3381qHWxBfBZKu0HbRK4PwnzZ9CNtYtJvgUpyw3blLtuZ6LExV-7PlavkkP-ogG5UeHMhBD2pSMZRydTr106Rpc5kzlI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeefgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgfelteevhffhffekieffheeiveet
    ffethefffeeiudehfeegtddtlefhkeegueeinecuffhomhgrihhnpedtgedrsggsnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgt
    khesshhtfigtgidrgiihiidpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:hRaoZikpfIbmZvKw2SAENwixmTbZ1CGFnWadjU7hRo-d2Mz8TaT8hQ>
    <xmx:hRaoZs0g6IvMbtrQaHvWVZN2UKWP5wNHi2Ji9L9_ldTpl3dhJ1KmFg>
    <xmx:hRaoZpvBMKNntCtgNy31fbFutXhaYkYTjAdifP9T9CbU_gEF3hsHkA>
    <xmx:hRaoZoVCNaE7KPtVastYyoNsR_-S-abfhOhSY-qIw9esD7jvQABIiA>
    <xmx:hRaoZqCatwK6sioVvUhsEfTEPK-LQtS8YiAO5k7m8bsBlpZFAFWdGM6L>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jul 2024 18:24:04 -0400 (EDT)
Date: Mon, 29 Jul 2024 17:24:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Chuck Kamas <chuck.kamas@getcruise.com>
Subject: Re: including libubootenv in Ampere's openbmc
Message-ID: <ZqgWg0UFtdk49apn@heinlein.vulture-banana.ts.net>
References: <CABMF29msHomoDwHG_kDjnT-ytdY0mxS_bh_1kZmtLk6z=7H0nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jeg0xEvWxSq5yoZT"
Content-Disposition: inline
In-Reply-To: <CABMF29msHomoDwHG_kDjnT-ytdY0mxS_bh_1kZmtLk6z=7H0nA@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Jeg0xEvWxSq5yoZT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 11:32:29AM -0700, Chuck Kamas wrote:
=20
> openbmc/meta-aspeed/recipes-bsp/u-boot/u-boot-fw-utils-aspeed-sdk_2019.04=
=2Ebb
> has unique provides:
> u-boot-fw-utils-aspeed-sdk

Looks like back in Yocto 3.1, u-boot-fw-utils and libubootenv were
split.  Yocto 3.1 was Dunfell, but was in April 2020.  Looks lieke the
u-boot-fw-utils-aspeed-sdk is based on a uboot from 2019, so that was
probably pre-split.

poky/documentation/migration-guides/migration-3.1.rst
114:-  ``u-boot-fw-utils``: functionally replaced by ``libubootenv``

I don't know an obvious solution here.  You might need to bbappend
something to remove the library from u-boot-fw-utils-aspeed-sdk so that
the version from libubootenv can be used instead.

--=20
Patrick Williams

--Jeg0xEvWxSq5yoZT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmaoFoIACgkQqwNHzC0A
wRlIJQ/+OH6euj+zAhQjIivZEc1osUs7vaEIfqgn0naNR9hHS6TVcC0k89O3qXvu
c2kuZVYbVgIVP9euhVxXegI5fjkrowi+yB0a3JhZciWN8uizqz8uAglVm23H8vHy
ZvlX04dc8lMrpc908dU4EHC1/ggGhzk2/YQuG1ZPPed3rBVAmMoGrzsOwICEX3D3
U1Q3Vyk+H+jEubckz6UKk9XwxdhCCTPotubL+U2UQXbb6PjscqF7ailkiZMn5SpS
NzYKEtPFoR9c7wL25/r3e5UpLbD8uQQ42CmlmHwQCjUnyDuruqjVAZZDT9gPvSDs
rjk3dnmZITHCyvDAV7uGdpzRisdI3F9wXLtWwakNDzcod9bx3nNH+ZyB96SDxnl4
+M9ox5FAjZ/vK5u7uG1epaBMrZ6BVitfTy7voLMTqzqHHMYNrAu9qkFcFnJAUIFK
L7E/Raw5gB0C2y5H1b4wcR1eisbL58Xk2LhPOIAZk5PbYfAFGi3YZ3gID2Q/Kg4J
KzNTzEkQ/FHPhIlV9kydkfnKmypjGXfKt+EMcMMNr1Ruukf+ZkltAQGiZrFzuPxT
soJEjESrJ2//bfoHuaYSQEUKIFZwBzjqclV6JeKWQ3eBy4N27j166gZ6cqpgvz1U
fFho74n8LNmpgixJw3hEaQsH0FcHVUWLKxvrQrYyR8B81CPcCwA=
=RGeo
-----END PGP SIGNATURE-----

--Jeg0xEvWxSq5yoZT--
