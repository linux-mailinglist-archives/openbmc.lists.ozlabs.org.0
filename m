Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86195671C01
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 13:25:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxlNG39Kbz3c9M
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 23:25:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=0Ux9IvTX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Bur9Y1IE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=0Ux9IvTX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Bur9Y1IE;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxlMQ4kYpz3fB4
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 23:25:06 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 99AC55C0076;
	Wed, 18 Jan 2023 07:25:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 18 Jan 2023 07:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674044704; x=1674131104; bh=X+O9MNCfsk
	UhKd0PpxlGzy5R9/PXi4ZPMu3v3vCeQNE=; b=0Ux9IvTXFjOZ9gdhW0EkF6ovIB
	OXOibIPbm7WyNxCU3zy1mhGB5f8Xhx1TbnowXGHrALlZ1eJ345wOrl7PRLQgNW8j
	VDR+uzuCpezwA4Nbd7bvSvFIZmdMcAD9yte41ipv0QkcvvMBXAwi+tNGzmnIePZN
	QhcyIQoZVRrwK+Brl0mSAxCpeLG2GyS5OajZfkZ7ZbW4izdY2CmYHdr5igJrd3vk
	u7YsNLZzu0UmgyfDddId4f1+eM7G/2YZ1LtgN4junZCVv+hTTjYiv6MYtfncNLsV
	o5WarNj88mj41XbvEe+/Z05souEaD9zyqW5x4vuBhi/CT+QzmBbfQS+6nQXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674044704; x=1674131104; bh=X+O9MNCfskUhKd0PpxlGzy5R9/PX
	i4ZPMu3v3vCeQNE=; b=Bur9Y1IEV49XdjErwH0gjJ+Be5Bf6eXa27NwUxV8TaYK
	c2E/SR83PVX/r1TThu4RLpXr4RST6FDkTfGXtCZEuCE3xIIWM2VwR7Bb43RDkSIM
	czniObelKt9lSd4ZAkIoKc9/So1+seUp57KKpTvNH80eUFF6mwzfpsn4Dq9ONjzO
	kbXB5CNFns4hToUkklcVGIfJlex/ximJV78bR8Uf5Q3HbUmox4sTKqeULhwqbC4i
	F2RqYlAsKwimbP2xV1j38q5in9NHRJ09dpbXsZushLLfhOmZ1wy979P1wS9IS4pe
	LI0t1bN8traDg8VhpsrnlQMqHrH/Rg0Agf8nsRtULg==
X-ME-Sender: <xms:H-XHY1vS9f43iPpI1znqRv5tg7M-pqdA3h8AKLIsle7TRZqMbS_xSA>
    <xme:H-XHY-dugof2Kkvpj4m-0ANxxoB3r_i9yTCVPIyanCMo_-AlUZ6mZQ529avfAIe1v
    mwD5W0TNZCjZZoqX28>
X-ME-Received: <xmr:H-XHY4wagWjalV1e5dBZgWpJRr6BgyByb6bax8nxMk8hCG-YHDOn-sa5DZxzT8j6M8814iTFTJfH1toCty2GiPKktpM6nx48sR4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:H-XHY8OBxaJRbyaGOd3b3pd17-8Z-s8prkw43iuJSc26nV1WrPbigg>
    <xmx:H-XHY182tbZZSf8QrJH3_OD2pr6hXmM5tGUO4ranyGFPNxybntHhlA>
    <xmx:H-XHY8UcfJxKplFUH8HtibQ5p4lFG5DmzRStgKFhxbGoG0vkJ449zA>
    <xmx:IOXHY3nik6Dj_jBGNkPSh-o8ZGKgBEnJOiXoqjeABkQ4JLwXoT3fyQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 07:25:03 -0500 (EST)
Date: Wed, 18 Jan 2023 06:25:02 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: zehra.ozdemir@inventron.com.tr
Subject: Re: Sdbusplus Build Errors
Message-ID: <Y8flHvpWocGnpWrU@heinlein.taila677.ts.net>
References: <000201d929ae$266f7fb0$734e7f10$@inventron.com.tr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aLqGyFsuvp2NfDto"
Content-Disposition: inline
In-Reply-To: <000201d929ae$266f7fb0$734e7f10$@inventron.com.tr>
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
Cc: openbmc@lists.ozlabs.org, "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--aLqGyFsuvp2NfDto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2023 at 04:26:32PM +0300, zehra.ozdemir@inventron.com.tr wr=
ote:
> Hello,
>=20
> I am trying to build sdbusplus for phosphor-ipmi-flash host-tool.
> Currrently, the ubuntu version  is 22.04 LTS, the gcc version is 12.1.0,
> g++ and c++ versions are 11.3.0.=20

Your compiler will need to support the C++20 constexpr strings.  I think
GCC 12 is the first that supports that.

I don't understand why you say gcc version is 12.1 but g++ is 11.3.  Did
you install separate packages for those?

--=20
Patrick Williams

--aLqGyFsuvp2NfDto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPH5R4ACgkQqwNHzC0A
wRndRw//QdBG3oV/fkpXDh+COsY7JrFNCZoLGMHtzDXmPa+bqQDzdzaHY0ZeD8+w
c9LVSmw773HZJHv2jeGI8iHIgWpuDj2QUOGToiio+Z2Qog88JDb4FRrV3UmQbsaz
qGMgmCx4gZkcYqd/ktUS8ygF7zkEUy/huxDA1QDmF/ziPkfqJd1wTatVyfYoJO76
qX+Xr/e4wQ1SoPaAhO+yWH2lHx6EZ4beJ7eh1wcWdW/9RCPu8KyFTWQ8/w6pd2/j
NY5ADIitd83X+510MFeoMhRHEaWA0PimRlV1MBkP2wyFZD9DhCPhDdQgyn9Sgp60
1SnwCTgMJ9OTYmlR9OpI3Ajowv80rOMn1A7omwaqed/F/y774XBnD174JfI1Co6G
rfEqIkZloYbzg3uqMDSNUhcNcLTYJ+81lmV26ZBZROiBhjvIVFxxVI+AL5Jc1HgI
4Yn+t9PVAJeOMcUw9nLTr1IIhTw/4CS3pJpclPVJZaMSCRbtllZ5ytdwwGUuPi5o
zhqUgw9nbVVp/qnlLyrERF4McXdicpKuYWl9y9AxiXIWQrACc18Oxmg3qPGQ1xd2
P41n89b6Boy8smPRQ3sT7tBhUN37+UVlVk8KaU6CHTerl0M82piOG/PjkZRVhHXf
bcrvmvICHZNBJmYtzKeSDJuRWkW3Y02Djw0EIddNSsQJMnZ3pNc=
=YyMO
-----END PGP SIGNATURE-----

--aLqGyFsuvp2NfDto--
