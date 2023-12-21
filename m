Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E4F81AC5E
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 02:54:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=m7SV52NW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XIKs48uP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwYQT3hbmz3cR3
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 12:54:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=m7SV52NW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XIKs48uP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwYPr0D7sz2xcn
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 12:54:07 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 039873200A04;
	Wed, 20 Dec 2023 20:54:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 20 Dec 2023 20:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1703123642; x=1703210042; bh=JpqgEDGqRa
	hNtQtp1JuzdKL8mnb3/5TpNwdQQ+iOqps=; b=m7SV52NWx+TzeST0yinW1xJJS0
	GjRZFPjAPRZPvfH0xolOOls5//d+Cozd1l6yVDd/iFI7WJJUl9pTi01cu2bo0zjm
	MCyt6q02YcQyYluOmXsZnDqcTfzR9OIfBVa387/Tg6ddXneiqFFylH5tT9k96pFw
	WctLkh+Wg5jMO8d2dAzPzRxhfOyVakcIiOqsEqjJGZ3au59lAt5c2yR7BMzIIZwi
	BgLRl5zu+IKXzXHsqG/Pk3L98YCVmpi2wDsbLY4x7JKgdMw2tPXNP0c5quIZ4T5F
	ypv3ydGyHEWGWs/X8jg8RP/eKFNdvv86d2zzYGp4OI22iuoMkzkz1jzCgyHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703123642; x=1703210042; bh=JpqgEDGqRahNtQtp1JuzdKL8mnb3
	/5TpNwdQQ+iOqps=; b=XIKs48uPiMPLN57WDFMhW3llUkwxTKtHcSskBPpWd9gN
	bcrN78ZyNXnEE85dHQv1jcSN5kigJGtwCJocleKfbhyTOijphm6fVqlyK7jeKc4d
	a65uWwTKIoVA6Dl0aJlslaNw1BzoLnfDuma3MaGe7WNKuaZ1DU/3Dv7hVxu/OC8O
	ORQUQ+AjQb+hzD7Em4EI6rmvxvgQStY/flkajCe0pGgWhtSqIynbwzZJDSJOPM6X
	KJhw2RjaIrDasj48YloC2c/XiOl/NYPHXN7uUZfyD7hV+ZJO4IievhyduhT7uEfM
	Ip3NfagVMHpp86JNWqNdp9hNNLSKnhF+WSNs5f4ahw==
X-ME-Sender: <xms:uZqDZa1tp43OOtlIRG7IpNpVLLmehKSHJVYBezGyarQHBP66nwkKAQ>
    <xme:uZqDZdE8RSYuZ3DKZGRlOV4CWuiFl-PQO9O7EkLv-wz_5vUwG_ox2UTazC3wnmQes
    5c4yGKhIexqRqMptPc>
X-ME-Received: <xmr:uZqDZS4DK8bHPNeTORwDrBY4KK0EY5hCMpCNmdleB0kfgOj2K-W0H1-Nn115qObvEcg7w6Ym8MHp5qELt5BTK1X-fBPIaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddufedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:uZqDZb0adxykD1n9gbkQXF1OV-52SWZGoqoP4CJJjggdY3JQkkBDKg>
    <xmx:uZqDZdH0O-nWMg8spZgXmVukb4kt1UxcyMuNZGXGsGdHY-WqNVrlQg>
    <xmx:uZqDZU-fDZz2iCZm1csSZaPgS8DLv-PhjzOaVBdme64aAcQ2fP5uNQ>
    <xmx:upqDZRhr43oSLEZa_SoyMAHSPavwCAt9-eZ0vKCQHDKcR2yocVJqoA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 20:54:01 -0500 (EST)
Date: Wed, 20 Dec 2023 19:54:00 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
Message-ID: <ZYOauLkWwg-7bsI7@heinlein.vulture-banana.ts.net>
References: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
 <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
 <fcd703f2-b05b-4c21-9d66-6506b7aafa01@linux.intel.com>
 <ZYMc0jRDhpuaP_KR@heinlein.vulture-banana.ts.net>
 <508682f0a990cbc8f34121d8b891c1ee9f934dd7.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RjSFhzN2uleJYTZe"
Content-Disposition: inline
In-Reply-To: <508682f0a990cbc8f34121d8b891c1ee9f934dd7.camel@codeconstruct.com.au>
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
Cc: cezary.zwolak@intel.com, openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com, jozef.wludzik@intel.com, "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--RjSFhzN2uleJYTZe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 09:28:06AM +1030, Andrew Jeffery wrote:
> On Wed, 2023-12-20 at 10:56 -0600, Patrick Williams wrote:
> > My gripe is that you should not be holding up the open-source project f=
or
> > your own unpublished, undocumented, non-aligned tests.
>=20
> My understanding is now that Adrian is aware of the patches he is doing
> some of his own testing to build confidence in merging them. *That*
> latency should probably be measured from around the time I sent the
> initial email, as I suspect that's when he became aware of the patches.
> So far that's a few days, which isn't unreasonable to me. As a
> contributor I sympathise with measuring from when you pushed the
> patches for review, and that this seems like yet more delay, but
> hopefully we can separate out the events here.

My concern is not about these specific commits and the timelines on
getting them merged.  My concern is on the general concept of secret
automated tests and/or maintainer-intensive "test driving" of every code
change.

I've seen a few other maintainers say something similar of "this code
tested fine on my system", so this isn't a one-off.  Don't read this as
I don't want people testing code, but, especially for trivial changes, I
don't think we should be constraining the review and merge process by
separate "test driving".  If that is an expectation I can see why nobody
wants to be a maintainer...

Even still, I have no idea what the process is if any code fails the
maintainer's "test driving".  Can I become a maintainer of any repository
and require testing on my super-secret hardware before merge?  And if
it fails, too bad, the code doesn't get merged?  (I know this isn't what
you're suggesting and I'm being far to one extreme here).  I frankly
don't see value that this kind of "test driving" is doing for the
community other than being a time sink and road block.

A big portion of our repositories don't touch hardware enough that they
should need any testing on hardware (certainly not openbmc/telemetry in
question here).  If we can't get sufficient coverage in unit test,
something seems missing.  If we absolutely need some integration tests,
those should go in openbmc-test-automation and aren't even
single-repository-dependent.  I don't understand what the motivation is
for "other testing".

> I'd be more concerned about a knee-jerk merge due to getting a mildly
> stern email and having the merge breaking things. The fact that he's
> testing them to build his confidence seems like reasonable maintainer
> practice to me. The fact that it's felt that tests are required in
> addition to the automated testing is a concern, but I wouldn't yet
> class this effort as "holding things up" in a tar-pit sense.
>=20
> Andrew

--=20
Patrick Williams

--RjSFhzN2uleJYTZe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWDmrYACgkQqwNHzC0A
wRl6pQ/9FCKXkGkDV7DMLPH5UmG3n3KE/iT/1Rvvjdjak4MbvXnTVy9At9OYwnkd
3MKxpMtjo0/Dl7iHblBczEYac6Y5ztBEqJqWDsnxYA2qgWiHKvtcoD5HgbkIESWN
YuPFUdur2wce3mTil0RVFB+Pr/c0MamKInZiHq6HyhMHgXYTZPK9SgvOKL0wDt1N
nBftwHzjn/JBLcZZdXLam2QAZUQ3viM5OhEPdjPZzAbQzxfZqye0xLIbBn2gZfs5
X5/0Dk2nUuLT+XYmBxpo0HUnwJonQonnfxkEglXxrjY2cuPd5O3uHjGGob+IZqy+
IZvGAGQkDTXvpfB63IolIZaMSZPft6/V3ilGapwRLE/eNxkHJEDdlFxepzzpRN/a
VIvB9L1zNzTDmM9aWUwcOuMxmMyeephjD6rf9oz0FgbXPlEoS4sML8HDS+iO5AWJ
tiRct5l4WdTkLYzbATNmLQ+LKTSxIs1G/jtyMES+DgkolykQ56pVQpppauLXJig3
T1crIj3nGcmuwyN5X/82j4+vy3Me+IMvib2z+G71aLYuQhkCYwA5t0TWqCT8Zkhb
x7osmxi3rZ99mQCmxvPZ1/XVnFy7r9OULcSlYJfwQtR/bkzJOSBZjZ08OU+4vD+q
3w2tIVZCUru3XyofigbCty9Lnaszt9Lv6oYDMBNqV6xnCjCG8g4=
=AwwD
-----END PGP SIGNATURE-----

--RjSFhzN2uleJYTZe--
