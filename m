Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9E44A52AD
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 23:55:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnk0l3Kk9z3bTt
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 09:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=xpzHUqyd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fiG1ry7F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=xpzHUqyd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fiG1ry7F; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnk0G5NCmz2xWd
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 09:54:37 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0AAAE32020C9;
 Mon, 31 Jan 2022 17:54:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 31 Jan 2022 17:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=mb3cla5nk/g+8BhGMo3iwLj1qxSfeQZmGD7N2c
 +R4/Q=; b=xpzHUqydzAMCXZgDUTUAGelqNFog1P9kLhKVeY0xgs1D+9b9cp6JnU
 em0PMgn0gFLU2io4uqPPSsduOSYXo/r/vS0SlKt/utroka24Bnlbh9NY2euUkZQ2
 C6i0ipUuh+C/UGaVFKVS4NwYtfckAUGEGd95XfgE00U8zOZKQvTQGQQzMSmYXjLY
 VtxWvQiuZoykqmLzj8YC79yj0bu6qmmbPmnBMjUPKI5JEdwclSyOW91slSJm4JI5
 2oe50YyLEimi3orMTKdc8ShKQe8vt9GBlrpvZJmRtVDs4yWobcJmajvrSRA+Fp0/
 y/TvzdvKHabcNgRPdAqT+4fwXjtkVX0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mb3cla5nk/g+8BhGM
 o3iwLj1qxSfeQZmGD7N2c+R4/Q=; b=fiG1ry7FqrZbMlgYJrTnFnxN3qzOm5A5p
 MucyNNu6Wud6VxsLWgJiFvQfcJf8CP+DQ06pZvou5CB/kOENHH0DR4PfiTE+TV8w
 KvST8JGjYbkG7KbN/mCPUDjlJOqi0P1Men3wwNK6RxUGZ6tPrrd/tU+ECx2MElph
 o+n//FEQ/ina3O+JgHOqat0aPrGA+EjLm7jFkF5MYjix7DfZUTf66KUo55sSfgjK
 FnPr+b/N+5dRSX5kApF7pZPqEXPJm9ny0uRQUJWzi/jNZv658V6tuXgpaccy8UGi
 u8G94giyYgwHV5Abf2ju26chIVb3LUbYInkKHt08VvheEMQbMMNaw==
X-ME-Sender: <xms:qGj4YbnIa_TcFBQXzcHDurxyTvPAwfQ1Cc1Z4fDuPTL27OgPQIm1mg>
 <xme:qGj4Ye3IvKifBG_ZAJK6trdxHXBW85QbXKUkOrXg5bY79ymeBJiAT-FhsL0Of1Bgf
 mc3Gq0weloPp23VMv0>
X-ME-Received: <xmr:qGj4YRrTwiysRq_VSlAIWRb7tC1B8Z8aT8Pg3CzX4VJbKa6zQSDTCsBE1NzL9-nJ2gzN0HUFILDmXdM5p_doCnyfomAmgGOCFpaEwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedvgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:qGj4YTmqeIX3YBrZE4xS7XBPWwe--I_csbIgefcAx374HxuMfHo5wg>
 <xmx:qGj4YZ10H9RAr5IbWKeSs41OLjrim_ANjbQj-RkI3Tq0M6D5V7uaFw>
 <xmx:qGj4YStRzLtO4hx1IcSWPNgGSF8rSzWEpukAEhopy6BSKdfqvDQ8Ow>
 <xmx:qWj4YW95SZdEllxlOHsnyUAydMSzqhbcXD01sT7EsHZfua5fjA3Yyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jan 2022 17:54:32 -0500 (EST)
Date: Mon, 31 Jan 2022 16:54:31 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
Subject: Re: OpenBMC v2.10/Hardknott status please
Message-ID: <Yfhop9g2lX+DZ5iN@heinlein>
References: <DM4PR84MB1855478F75965FD5275971E6D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yff1OKHtWj+xN7HN@heinlein>
 <DM4PR84MB1855BB4EEAB345B6A0FDB8E2D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2ZfqUNr3Gk5iRZ5/"
Content-Disposition: inline
In-Reply-To: <DM4PR84MB1855BB4EEAB345B6A0FDB8E2D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
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


--2ZfqUNr3Gk5iRZ5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 09:01:31PM +0000, Muggeridge, Matt wrote:
=20
> - The 5.15 kernel is in OpenBMC/master, which I guess will be branched as=
=20
> kirkstone sometime from June (based on historically OpenBMC releases bran=
ch=20
> ~3mo after Yocto release).=20

FWIW, our honister branch, which should become 2.11 if we ever make that ta=
g,
is also using the 5.15 kernel.

--=20
Patrick Williams

--2ZfqUNr3Gk5iRZ5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmH4aKUACgkQqwNHzC0A
wRnCuRAAhOf4br/vKjgpfVCRYZLnORMqlYCy7tRillsFWGlydP4SIJ+cu4FSuZlj
XEvPbexbgzv7R9SbkYKB9gvAx6GaiRF6oxzPyNl2o5fVVQDbSIefwyk5XjWWYpqk
hhToEiPrBPjb9zuZnxtJr0z6ePbSkkPIXXoftUMROp6YpN4WNBuGTc2STfyn3u3r
9M5YLgu5nLCYVcn1CngFJobH/CKBJk7oNBl8BwiP+UnDxYZSZiNdGzK+rQ97ML+J
YlRkThaNr7cYHaKCNWKn3uUfji6zeVvmICBoUjvS88//Q0tw1eg57M04OZiGZUi9
9dMyWCjZr3sFElG5RopZjrnHXpPC5AfRhnFweIOhG79Xyw0O+9bZaJyE+FyK0dCv
53j9XBLgDGS9AhTE2JG6O1eJdITYW4n//RvTvOwDKcDJv1nw0NDlGRo5Ll1igbGW
hmSpEVmnaQh89xnITsf2xmDQTRXFcbUYyY85rqb20M0Vsug9y1orMnLW4wcOxL2W
PIF4Xd4SIcLxgWxSqNT84fFq2zlBJpwJuPCQrjebVYdJYKj9enTjfzqjy1mKg3PD
MZK3V6NY5OT6dtT+WLLjYsFiwuaNAiU3SDVO2pyb62Ps5Dy4liO3mmv9U3knrEzV
J3zqNmiGjiYN57N5ny6y/At6Amr4m0jdTXywhjVCfF7h5JN/i0I=
=t8lp
-----END PGP SIGNATURE-----

--2ZfqUNr3Gk5iRZ5/--
