Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292081A22A
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 16:23:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ddM6Se4F;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RQB08W+c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwHPh0xh1z3cST
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 02:23:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ddM6Se4F;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RQB08W+c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwHNz6lkpz30ht
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 02:22:26 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 7233C3200A2F;
	Wed, 20 Dec 2023 10:22:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 20 Dec 2023 10:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1703085741; x=1703172141; bh=swA2zRrLHM
	J0E25QRyGKtwnrpcatKjsBkhyxiGFuK/M=; b=ddM6Se4FSm7ymyZ8bOwMdnjtWG
	Tg3s52uQM/3PrHRXFb21skT6x3sJWnxn/7SkvzxWM5gQASItadt2m3j/GXLRdwq9
	hcyHWRe0SMmbSUEdkzxGftrxdUauZ2vbuBfTWiKakA+Q8f1vp03MGOZ1qzyMPHjc
	tsmYWRDYhx/ixPNtxoDrUVmvMU0pHn+k9WxRNVcDhFzyeedE34GVdVXJlPNTBI0D
	O8K30hl6vHu3zaeXbdxs9KTuX85d4x8JVNTRvfNeAQIli8WuCGjQRhbYSni0dvQj
	Y8XbYSKqsCiLQEV4ipJhGT3u5xkD8TROyz/VibBztMGtQzBeB7WbFwvqL43g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703085741; x=1703172141; bh=swA2zRrLHMJ0E25QRyGKtwnrpcat
	KjsBkhyxiGFuK/M=; b=RQB08W+cQxkpbgLHd+MKY5Jd+65JKKgxP3GzYROnL1Gk
	rH14j66MTRk9Ar9u9DLWwzTvRgrwhakgs0B6fnQRUpZ29WAo8rl1Bant3frN/CF9
	55f3xNWIjZtdy8wpBUzqkF4zoZhYky5fDDaTwHz5GVzgzqe3lWpw+dej0dXAJ8mb
	vWQZ7v5GFWKFrTJZcS4mI5yZoujReMJ5Zay8gCr3WI8JaM6h/80oB9WyZOIUWLt8
	W25Ljqp4Wn8S48fv8vwtMX8d8Rh4krqspjONSU5jN8R6q1IpC77EtF6l8/Ox7iYw
	E9UjZQXKOm8mNw1zYS7R3j5KWCHjQFDW6PDOKjEDLg==
X-ME-Sender: <xms:rAaDZWyvFZYd2ntH8bDyIxQzp-_0Mji0E0xWlEgHKLTMV5cLHsBX3g>
    <xme:rAaDZSTVXApGrsaKqhG2fSsskcyZWOMhipfAxd8TA9qZpzlI3PyA24KHXvy-nVkdO
    53GsBSHYE06X3gElLk>
X-ME-Received: <xmr:rAaDZYVwlX2glHiMX4QznUzDQGMDG_BeWixxSuk6QMFFmJugvW4M3O--1y68f6VOouQ-dIKV7n_F1Bu7NzeuOrXOcPi8Fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduvddgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:rAaDZcjSNxGx7zYMTOGxo32ZUCcVmy58rfH3j_19FYydxeoL-oq-bQ>
    <xmx:rAaDZYAzyHhLQaTya0REb23Qg6_lDBG9hCaHUi-YqMjgo7ned0KORw>
    <xmx:rAaDZdKJaUasMBtazD7z_ZG4ZH4w3jXQymVg6CMEGPdcMT55jAmfxg>
    <xmx:rQaDZb8IIQLNNh0KGg0thKix0PC7hQLLBiC-UcIw_zpd-aR1041Z2w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 10:22:20 -0500 (EST)
Date: Wed, 20 Dec 2023 09:22:18 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
Message-ID: <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
References: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fEaMZAhYclkdhXdY"
Content-Disposition: inline
In-Reply-To: <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
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
Cc: cezary.zwolak@intel.com, openbmc@lists.ozlabs.org, jozef.wludzik@intel.com, liuxiwei@ieisystem.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--fEaMZAhYclkdhXdY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:18:38PM +0100, Ambrozewicz, Adrian wrote:
>=20
> Currently we've integrated proposed changes and wait for feedback from=20
> automated regression test suite.

Hi Adrian,

What did you mean by this?  Commits go through CI when they are
submitted.  I don't see any change in Gerrit for any of the 3 commits.

If you have an internal test suite you haven't contributed upstream and you
are holding off merging commits until you run them through a private test s=
uite,
this is unacceptable for the open source project.

--=20
Patrick Williams

--fEaMZAhYclkdhXdY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWDBqgACgkQqwNHzC0A
wRmkXA//fpmf6D7Zg/jBTz+4GVnhLTa5Su991FmHyualQtxmSl1JNFHwD3h4rfrG
4wwij1tYVa6UqgFP3fDbZ+LwdSVDPS/5mnZt1NT+6ux3/yRb9fgzq2+AMh3opbwL
INVIw7/07CV7yATOBa1YruSGCWbsX4+wZ21FKnbQRj53NtQWrpSZOg+Ah8S2OqBW
xGL5QJL/5LDlMg/KKChVM5NUazaaelewstT0F/Uh6fIVlmIDPfeExra10TSWQFB2
DYUmQwKH69v4mWMg3COe40z86ofVA1oBWEnd3HnWuFGVCiTVpZB4wF3j5RrhEZbj
R384nRzL97paVcqMxrshFOBCNQJdc/X57Z7d2RX98Zkb86l50IcShL5aYRJID/3u
5uJiVuwqTgBzuScCGwLV7TPJ6gJ+mLxMwfWhSJ3xMh00qkgP51MxwNhOzi9sOYyf
LDFDJAIDNLuda2BGknNyDlmLmgk0dcd2bIS1iIrx5gnXrGlVeNHn+M39hsCuGG8T
EXvlQkfzaQRmq7WJV9xvLzc2NANU4VDrcJ7LJgu/ZX709mgvs6y6BLHnOSK2zlpG
yWk9kVKU39Gymj0EXvEG84dGolIC45Cs/TWifFHNb7rYCNd1Od54sZ1tHHKUJYce
Mq/fGIOMXTpRkMv2eNVBvloRUfTkP5NMVCXS1vwPxXub3ubUmQM=
=ICKz
-----END PGP SIGNATURE-----

--fEaMZAhYclkdhXdY--
