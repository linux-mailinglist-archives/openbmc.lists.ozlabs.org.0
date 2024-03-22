Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08908887426
	for <lists+openbmc@lfdr.de>; Fri, 22 Mar 2024 21:24:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=mreO9Vj2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aXeDyliS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1Yh35kJsz3vgn
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 07:24:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=mreO9Vj2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aXeDyliS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1YgN0Dxgz3bmY
	for <openbmc@lists.ozlabs.org>; Sat, 23 Mar 2024 07:23:25 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B11895C0055
	for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 16:23:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 22 Mar 2024 16:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711139000; x=1711225400; bh=RsXtMQ0H0i
	ZS1HnpPwAAp9Cb8qehAK1Vwkuh4loxJG8=; b=mreO9Vj2g93PhuuxYQCi376QvF
	IGdiooezHkf1lBDbd0Rl7CfutAEth8hbFJnMfdnIG0OLHUE1hTWx7SkxadoT22yr
	sph2N5bWrz/OSJf9eyp44mMXJBTv6KRVXDGmKmeLEdfB9vdSEfahgX1vYmJ41o7e
	1BUIcv2Rc+QYdQ7CUor/83c13EO68zI/nufpppPt4N8W6L1X2eN6ygObjTgItfUv
	LCck8Tjw/Hz19Ojxxmi83ZA3x6KqR94A5phz8sh+Gs0rHITp59YOyWyJUeL7Udf3
	JwzE8s9735bUptEFvkEN2y+ws8a9VYzmn4eSfV35ffY0Tq1sXYyJQXXEspcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711139000; x=1711225400; bh=RsXtMQ0H0iZS1HnpPwAAp9Cb8qeh
	AK1Vwkuh4loxJG8=; b=aXeDyliSnkrI/ZB6pMs6mN240EMAr5xpsODPL+IASyHm
	5Yo/gTUkpfg7ZuI2/+FvlJNfWABTHfI0pC2RN43jjyH7SJ8zyaU5+iscpK3pWHdk
	XOL1AJQjxq47pWUEhKfLuLV98OdduZOTjMDrFYVy9xy7wd+dKxI98HJ6cm1drMIG
	vxNpHHze2AUJtpOw0RxdOsgUcA7B05kaIM53Cn+jUle27lzkW31J8v2Fhe+ciJOQ
	zorP5d37wnIfUz+GcFv+kTl2z1Lj/Y37jSka0hHa2dnMvjKVrXmDV9tUSVB+/wax
	p/Zjc+wMXqFGboJ4Vn2U2VNOjQLyMnOAOxh6sYLvAg==
X-ME-Sender: <xms:uOj9ZWLZrVngTnBaW42NDPjSNmKyvp2PC6YwzO4AipI3PLWW226LnA>
    <xme:uOj9ZeK2oQqnTUYqxJXqTqv26NG1YNtQIWglMWlNVsL6uTsJs1jct9Wgtt73EMAaV
    mFrnjXfCDzjtAdeNlY>
X-ME-Received: <xmr:uOj9ZWtC4lx3pq084OCIWRZmVXKOpneTIn0Y5xByqY6HzCDFqn4_NruExqh7TRHHAwAncu4y6LlNRqooH4teoRhx5-OQUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtvddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepffehueeltdejvdegtdetlefgveei
    gfevfeejudfgueeghfdvveeljefghfduteevnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhdpmhgvmhgsvghrshhhihhpqdgrnhguqdhvohhtihhnghdrmhgupdifihhkihhpvggu
    ihgrrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:uOj9ZbbViR2aZ50C-UokVRAzPL9GWl3PjrMQ5G4-BMSWQHeTcWDTog>
    <xmx:uOj9ZdZGvX3YXH3MNUeRMtyce2nm_DYiT2s4Alr2D1SHkfVOxoE9YA>
    <xmx:uOj9ZXAJavkgY38AnGoHR9ADCayF3qOlCC_NDx6drMgyomU-z_fdpQ>
    <xmx:uOj9ZTY2frwqtxirpd5xm2Vr-yBWdRH22rEuIUCTxRujx5yVWIdE0Q>
    <xmx:uOj9ZeAhL7fzGM2fNMOWOGYQpnCrZpkxUOFGj4VAGqgCIW42TD5Jrw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 16:23:20 -0400 (EDT)
Date: Fri, 22 Mar 2024 15:23:18 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2024H1
Message-ID: <Zf3otl5dVPv8wCcE@heinlein.vulture-banana.ts.net>
References: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
 <ZeE_tWHOZLdtPXu1@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oDnvFC1pn5+CKuRt"
Content-Disposition: inline
In-Reply-To: <ZeE_tWHOZLdtPXu1@heinlein.vulture-banana.ts.net>
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


--oDnvFC1pn5+CKuRt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 08:38:45PM -0600, Patrick Williams wrote:

> The 5 nominated developers are:
>     * amboar - Andrew Jeffery
>     * jmbills - Jason Bills
>     * pointbazaar - Alexander Hansen
>     * wak-google - William Kennington
>     * williamspatrick - Patrick Williams

Without any fancy tooling to handle Ranked Choice Voting, it is clear
that the votes would go to Andrew J, Jason, William, and Patrick.  They
will continue in their TOF position.

Results can be verified with:
    $ cat 2024H1/votes/*.json | grep '"' | sed 's/,//' | sort | uniq -c | s=
ort -n

One thing I noticed as the votes were coming in was that it wasn't clear
if people understood that the order of your votes mattered, as TOF
elections are suppose to be Ranked Choice[1].  I will make sure this is
more clearly communicated next time we have an election.  (I saw many
votes in simply alphabetical order.)

I am interested in hearing any other feedback on how voting went.  Are
there improvements we should make to the process?

1. https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md=
#terms-and-elections
2. https://en.wikipedia.org/wiki/Ranked_voting

--=20
Patrick Williams

--oDnvFC1pn5+CKuRt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmX96LQACgkQqwNHzC0A
wRlCkg//bMYBJjGWSQhiPkKcLuph+miVQPIqr/1M9p50aUcmNGQ1pzUcistBHtlJ
UkbAOVtGowdJ6OfCocFZsx7ssoGRLKMh6i6JEs4pObhG5+mjVtjwBPptL8sXqCK+
PwrtxiPcXTILSd/eLDIztM03HScY2xRJNjPhaKp+AYWFvXXF1yFr8uCl5y3gjziA
VePWDVCG2cPiawWt2Pd+xQL8EN53u/fOPRIgWRh3qGYkctGOPfPotIwvHvWuRtVM
JCGzvjprF0oVh/EFtUESgxQNHAosJDjvEoMtVFmAvpfCk6df9SKxkFdHW1EjIje1
R7IhvQBkkAHRqmlJmsHSsRZAq9O813/RXvP730p0uypT5b55m1RfI7eNk9mVaUQg
3Gy4G75xseOmFSmGkgUxCOBKb28MfDgbGxlDDG9CYrSCCbDeZxCNTztkXbhBM8vt
BR/NZeQuO4+BJsekQkffpd84ta6rSYNOakCwWW1PoxoCZkoBuj2yq50BsUeG012n
y656mULA9pm9e0lk8Wd4U59P0Z902pJ5Gr73cpW/61cY+Gr1mCKEFYCMFO2lueMo
Xfmbm/YIVKZg9Fo/3tA5tqMql45o3gNrdWAlLX/ZMA+hebOS4ks/eGnQMsDnXT1i
xEU/kqWgLPzUyzajwglVJzMEAw1MZ2XTZq+IlasN2ChH/iy7m04=
=wFnK
-----END PGP SIGNATURE-----

--oDnvFC1pn5+CKuRt--
