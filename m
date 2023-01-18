Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA7671B98
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 13:11:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxl3F5pDBz3c8F
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 23:11:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=mESUTBNp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gbLbA7tZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=mESUTBNp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=gbLbA7tZ;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxl2d4L5Gz3c4x
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 23:10:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8E9235C00DA;
	Wed, 18 Jan 2023 07:10:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 18 Jan 2023 07:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674043831; x=1674130231; bh=7tt1ozXFx0
	Pf2pefuW3olAVgLHVXnuRhYm106FhJJ/g=; b=mESUTBNp6FtgdxP6ie3BR60Pz/
	yIEwsqj3x8HwyMBijCh0KSO70vSzsoGGyBI4vkzNAz1G7uS2mIofD196DAj0dPyR
	+WJIWVe5JdYqu6AiM5Umv6uJj6LvdSEfVKxyHNLURv1hdekJ8s+pFNjddBHCzIWL
	3uomuPUDcEgA3kkbjfbzQaMQUkHHKmFqAeesqiAT4FlAgQM2zqDbJuAOK2Iv1U6Q
	NiHMUkJEsvFvdXpDTQ+44yUZMtFEUn8vjP5pOjZMdAj/DS1lgK5QkZuPSL9EnAg4
	02uFHcDGYCOFeHJ6BH+hM24i+Ygqt5K51TxZWXXJIpVqTLNDhGIrBqG/ruaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674043831; x=1674130231; bh=7tt1ozXFx0Pf2pefuW3olAVgLHVX
	nuRhYm106FhJJ/g=; b=gbLbA7tZIup5N4w3H8Q/bA2GhZpZd3tnyN34U/RtG3uy
	F8tMzmGmtEg2c7Cyt/vIH+apnWkugwLfv9baGImcmHX9XJW1lOn33ANjSg55/6x2
	xUwhbPs1UQCyABLZYV3mI4VxblxEqclg7gcbYfLSlj00WrpoWAA/Zhy9v2zdCN6E
	XhraXe6mzQ0bg84ylONXlcv/WCOYR2nkAu7J2rS3UjNR2MeB5LtFexhYQRVUcY3P
	4jwwwlNAAsyZdMRJnVcp0Wk2MKrl30Vwe1pUacCoYK26wP7iC4vWPooTX+eH18fL
	gJxUXYfpFE6HaY688eW3bx0DgAOW62Mtub4Dv40pcw==
X-ME-Sender: <xms:t-HHY-8C3sFIkPzf0dCfF8BL4xQXRDfBae68MvP_gcgzXmnPPMQXuA>
    <xme:t-HHY-sVdECQWYRQeP6exOQZgEKFwlXUI3wbtORYPR4gJ1okDYSdRVGp4nwibik1O
    JurY9UVuJiHWlItrZU>
X-ME-Received: <xmr:t-HHY0DPIrPPusEWlS6kJiiYYJXmtsQ3QIOwrlFk4zZHbQ7wMNGJ6NyGxKeTfczWt_E33eXSKxhQAjK3UA9ovb92nT2BlzITXgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeegieevuedufedvgeetleekkefhjefgieeilefhtdegvdehkeffkeduvdfhfffhheen
    ucffohhmrghinhepohhpvghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:t-HHY2cq6V_qOzrSmKPcwKLn8gb26QbWbDsGgv_rfFyKDVzv4S-HMw>
    <xmx:t-HHYzNcl_d6l-_1iCKeVbgKyhGwveUST5aj4YyFfJHq0Bdpxd1BrA>
    <xmx:t-HHYwmwMiKpP4YNGLIa-7l_bO5JlykwrSX4Ws1MjMdvyCR6RAP-WA>
    <xmx:t-HHY1WUwpJk7NcnzQ8SDJOi87s76dpgPou3adRtWQ2bFASru0GawA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 07:10:30 -0500 (EST)
Date: Wed, 18 Jan 2023 06:10:29 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: BMC image generation without private key
Message-ID: <Y8fhtUlvD05Z3qop@heinlein.taila677.ts.net>
References: <CAGm54UG=i8Ym-23N7R468xCsH3px5QAr52+zY+1MULBYVcf3Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pAKBV1+8kmmf7Vdd"
Content-Disposition: inline
In-Reply-To: <CAGm54UG=i8Ym-23N7R468xCsH3px5QAr52+zY+1MULBYVcf3Xg@mail.gmail.com>
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


--pAKBV1+8kmmf7Vdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2023 at 05:53:40PM +0800, Lei Yu wrote:
> The OpenBMC build requires a private key to:
> 1. Generate the public key that is put in the image;
> 2. Sign the image and generate the whole tarball.
>=20
> For dev builds, it uses the insecure development key in the tree.
> For release builds, it requires the `SIGNING_KEY` env to point to a
> secure key to sign the image.
>=20
> It is considered insecure because it requires the build server to
> access the private key.
>=20
> An alternative is proposed:
> * A new `SIGNING_PUBLIC_KEY` env is defined to point to a public key.
> * The above key is default to empty, and the behavior is the same as
> before, using the insecure development key to generate and sign the
> image.
> * With a valid `SIGNING_PUBLIC_KEY`:
>    * The public key is installed into the BMC image.
>    * The generated tarball is not signed, only containing the MANIFEST
> and the image.
>    * A new `gen-bmc-tar` tool will be introduced to sign the above
> tarball, like `gen-bios-tar`.
> * If both `SIGNING_PUBLIC_KEY` and `SIGNING_KEY` is set, throw an error.
>=20
> With the above proposal, the build does not require the private key
> anymore and the user could install the public key during build, and
> sign the image separately.
>=20
> Comments are welcome.

I don't have much opinion on this if you think it is the right direction
for your purposes.

My companies' existing signing system does not rely on the signatures
done during the build.  The output of our build is a single MTD image,
with a FIT image.  When we want to sign the image, we [external to the
build] extract the FIT signature device tree, re-sign it, and update the
MTD with the new signature set.

I've recently added some of the code upstream that eliminates the
separate rootfs and puts everything into a single initramfs.  This is
still in-progress but I plan to have it mostly complete by the end of
the month.

1. https://gerrit.openbmc.org/q/topic:no-rootfs
2. https://gerrit.openbmc.org/c/openbmc/openbmc/+/60110

--=20
Patrick Williams

--pAKBV1+8kmmf7Vdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPH4bUACgkQqwNHzC0A
wRnXvA//aKP2iL2aotYWVBHKgUp3Sg4prWnWGPSpkl3FdKOoitIK9Orl43+WqRen
fDM4fX5VhZmnd5jUHF29IC5d+D+RlgE0fqLNqShIAkem5bEaXBjPYWySpXMOlK/8
oJYaflHJWK/BMnQNehvGKiJfz0XK9jx5fU3xFCCcp4fKiMxbsnygSYd72gys8w/a
Jmle/wR4KSrGPzEhT/BELn/7GO8CKe3LpFJNzV51j41wmcsGmeC0/wtgmyrd/1G2
6f2ulU52dkZkTTcJv+nUpAhCUnfZraPnl+6VYM5DZ/8hQzV7q1qXNLoYfdKbNYGC
VnzrVDNBvPvC+gXK9YqGUoVlwzc4lbWodvtKnlgb17FznqtGoKL6NoGtuOcVVWti
r1G+R0FtzTq5mKUCTAHShUwRXNYQ+U+1139s1V/ySvEWQZCR4fnIPLuPqwLzAeZp
+UKKRALouxCfzwb6uk16574B8z/VcoVCEg6QMuTH7xTKhmjCcEJJ09nTxDC5Dsf8
pbYSHxrkkeb6QM2YVFp0jP4R0W8sjBsrIYsXAB3eG3fopvVA8hy2+M0vHzrl4SZu
5u4959o+inmfZZwGGAnEixFDpm1SvA7gi7Swpn/2gnFsU4Q6KoeRaugNvFQ6c6fR
k8otIlYobufNlc3OPWxA5ws0Wu315EjxH9wZjmwqlJBh8Ns7L7g=
=Q0eX
-----END PGP SIGNATURE-----

--pAKBV1+8kmmf7Vdd--
