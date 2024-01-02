Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B53DE821B9A
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 13:28:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=NjyjPOGK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D9bgBQRk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4BwK2cYFz3bp7
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 23:28:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=NjyjPOGK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D9bgBQRk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4Bvf5jfbz2xgp
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jan 2024 23:27:57 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2B0CC3200AF4;
	Tue,  2 Jan 2024 07:27:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 02 Jan 2024 07:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1704198472; x=1704284872; bh=oT7kbmT7eo
	i5irLmYCrvCcG7zumu0Zzpu74cdnf99ec=; b=NjyjPOGKyAsno8Df24RUBQHXa/
	60WnNGC8dS4t696JHBW0AMbc2BpiMXzJoEb7jq9b55xktdd6F5cX+p5gH9LoiXbl
	RM6PaUUgfQAivg2Ru8yT20y5Vmcv5C6OA67W4Y0ApGiGMUw0RpI0hSP4NIywDFDo
	oJANhM3nTbBg3ybJKVK/mj3tP5pEbHsc2pb6RZZWqq0vONbhr985vqI1VKaAvKpV
	TOV8DT4bGiNVRiNKGL4Oq8L2pA2W9M2oBt9RUomZdxJVjPvrOPOtPyo4UBmLQ45f
	7mVN3x4BRcFs7sS7sfLoHft5fPVG8+SxGoyhV75eh81p3Ta3M+rD3nWYDwTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704198472; x=1704284872; bh=oT7kbmT7eoi5irLmYCrvCcG7zumu
	0Zzpu74cdnf99ec=; b=D9bgBQRkHwhYRZHTzLtBDms2S4goxnwW0pAJk8bYk6yp
	vrZlXy6vGMAWa4clHjMjvaWn+JvpVG5zScjC4jfk6ysyAs/4FZ/okA8HsG2YB31Z
	p0MpnYBO/Wp/qkP1HCAsF9Vt5PvdhyI/tJb9IHvuWcs3u4aGvJV8IDUhCO0xm+u2
	mm3vosJZnBHbQte3A6ZZd28XBdrN3ztvdC9UiVEXJpdFUxBgABFZHWESe/1bt0vW
	oc/xl2iWqPyqKtScAw/nAdcJUBCoiszn5ALl5qoHJDULY1frnmA2nx56Ik1e5JS6
	4P49wM7DKt6FmSocKAR+D6mBvCMzaSqiB0pXYdQ5Ng==
X-ME-Sender: <xms:SAGUZbMxpVlaUn_6kasOOoGUvNUNooRLz4fNosB1uG-4FgET6jK-eA>
    <xme:SAGUZV8X9-jnH5Dcuw0DFpqTQRrjla3wWmPVzGbN771vBWo39dIpMAqfQ4A0Z_im7
    sttJSBcYFYagGdqSRU>
X-ME-Received: <xmr:SAGUZaSlKBWRJnGx62uR03t9BVf4KJFxcNvyBGGjcGCRdAuEeph2kSDuzlJCnjajhL1jPRw6xBcTmb_X72B33BTUNo2huA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegvddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeetteeigfefgeetffdtteeuledt
    udevgeelgeekvdekgedukedufefhhfettddutdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:SAGUZftKM7fJA5cdOxDUA5EY6cxvCpJLqorkObiOt7hwkULbscy-YQ>
    <xmx:SAGUZTcz3BsrEEKnuVCaphy8kJongibsAWL25glNkqWkbUEiQ6QICA>
    <xmx:SAGUZb3UXxxDAOxHe1lZKtLE6oY5hxku9U713TQJL9HleYAa015z8A>
    <xmx:SAGUZTlTH-6CfLdMOrIfT8JwEs3ujkIzWRqiMj6JzXK8eNGqsvR49Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jan 2024 07:27:52 -0500 (EST)
Date: Tue, 2 Jan 2024 06:27:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Jayashankar Padath <padathjayashankar@gmail.com>
Subject: Re: Question on passing username and password credentials through
 PLDM
Message-ID: <ZZQBRhzMCiI3SC-Q@heinlein.vulture-banana.ts.net>
References: <CAFRDoiwOqE96Pxw9QVE7B2j_JnBbsvaEa38H5_=DVch8Xo8P9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BYDHSOJ3wMwH2HJ3"
Content-Disposition: inline
In-Reply-To: <CAFRDoiwOqE96Pxw9QVE7B2j_JnBbsvaEa38H5_=DVch8Xo8P9Q@mail.gmail.com>
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


--BYDHSOJ3wMwH2HJ3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2024 at 10:16:04AM +0530, Jayashankar Padath wrote:
> We do have a requirement in which the Host needs to pass the username and
> password credentials to the BMC PAM module for authentication OR during a
> password change. These details are passed through the PLDM stack.

This doesn't sound like a requirement, but an implementation decision.

What is the requirement from the host side?

> BMC specific requirements:
>=20
> =E2=97=A6 The ability to prompt for a username/password and provide authe=
ntication
> =E2=97=A6 The ability to change a password when the current password is e=
xpired
>=20
> Seeing two design options here.
>=20
> 1. PLDM calls the PAM APIs directly
> 2. Make use of BIOS Config manager (But this has only password change and
> no direct authentication. Also this does not make use of PAM)

My suggestion: Do whatever bmcweb does.  PLDM is another external
interface.  If you want to use BMC-side authentication, follow what
other external interface programs are doing.

--=20
Patrick Williams

--BYDHSOJ3wMwH2HJ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWUAUUACgkQqwNHzC0A
wRldrA//VZumFgvjnd8pkaGQAH7l+qG1mXW7M55IdQ0Sax8jJjXqqUJ+tc6dMyMH
nd+iY92VpmpWWnmHlZVDnVP8k3jRNDAGZbrVkQMLQxz+53Qj7Snq4eFAFa0aP1M3
8R4PxbYcWd4HYeKywvKUzaOSQfqFx3WhXX6ulypw1jgLNDQb9MzZnZm8EcRP45nN
x/SESRJMIsh4RUKgTGvtakwox9W7+uLpz/KQdwmHvwgRq5A007um2q/BKIIr1svG
2PmRVbDiAdPFZbbujoXTXhBA+rSU2SNafth65SKfnul5kwvUJiIUKOgE3p28wYK3
/NUvlY6tlJVwYVgQMoE6jB/O+W0EofEHfsFFFizvBOooFX4+s0fmdXqinW7mNdaE
QO+RCJdfArtesvH7dbs4bMYmXLkcdRvpCqB0pSIMRKU20Zv5ACudKU+sFzr1L+7F
33pxihuGNR+OP01T2WcCoOC13/NPwNEkotWHkQ1yGvYvfcLncKRqY8yJ2Z1ksJl0
qeXkRADznJhoGX6+GsLWdE8jEKFOu/V0hnwk5Y9Iug8k6is8JQfL1usmW3YG6LQ9
NjIEv8luHuWSoha7iGTNQP2bP3hI4JzY3okUQjTAn3V69drD0UCcqYhpBnCTv1b5
8m9I1h7O5Z9KMKVdw4SGg9fYffDvcjkD/PBU56IRjjUYG2Yw8L0=
=M/+J
-----END PGP SIGNATURE-----

--BYDHSOJ3wMwH2HJ3--
