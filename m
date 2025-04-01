Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D28A7850E
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 01:02:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS3RL3WD8z3c8Y
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 10:02:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743548523;
	cv=none; b=UNJMGdGN4GH9VrlxZ8lKM5KfQc77rFXav912HXsQwA7GZzwJUHNgdf3EPDFericM8fFSR0oxTEdO+0vpmMg7jsFfbu0+5JQ46LHvm6tIeRGUAJskc7x9BVLAZOremtRiploCOUpv6pkZQqxwLO4QIJ9a7HcnvAjGwk7cIJ5dyniNqgAwxeESgEa1FxGsKvn74XQPvVoZlOX4MdG1oClLujirCLPr0K9KzrCKWMIxDQRiSiaPY7O7uXvXLyNWfrm3uFKE0w2BSsFULOk/OHd/ckHQQp6h9LQpLT+Opvq0iHcVexDmBQ5TZU+Fc4drtmgpVCGrmwyhWGOqQ2xCra/s2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743548523; c=relaxed/relaxed;
	bh=2f471leayA/yWpzQ4deI5Fu/atZ0USkqpvnfYQn0peE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdvjRZUpjqxO6ezUywA+54ogrez0eJgXaj1ktn3A4a5HXEB/cIQmEa/wnGRcTZ/RI6JO8GmtvSVgq8ykqLmOAR1gNCjBQTr2eXERBsEnlYEMuzRyMZaXsWlv+2qPW9aQo0Z/cCn+C5gfgEBaFhFoD85iIYldKwoe9U4E/w32m9RSIO7dBi3aUvLpFHl0QKsORmTB/63xhpVTXustoy39Xc9wQ2B2i24ayDTPtxwzbSqZvDR2rv92po67OHvwH72iQ919iKCDYkpK2DOL/8AIbZ/j9sNXgLHrsDhE03BxKNl7GgqXx78Va5kJAxOKI5nntSCZkDJz3twMLFnCJHEOXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=btSwsfkQ; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aTo+ySGg; dkim-atps=neutral; spf=pass (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=btSwsfkQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=aTo+ySGg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS3RC33fnz2ySc
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 10:01:58 +1100 (AEDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 865B91383DD1
	for <openbmc@lists.ozlabs.org>; Tue,  1 Apr 2025 19:01:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 01 Apr 2025 19:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1743548515; x=1743634915; bh=2f471leayA
	/yWpzQ4deI5Fu/atZ0USkqpvnfYQn0peE=; b=btSwsfkQ23zr1MvpmR5iHoVZbJ
	g1IZTxvz//9Zzil2oJ4h/LWm1W3OWbnKFVDsQKp532owtSMs7BmTwakO3trnaOF/
	PMvJYoIcuo5NOLSNKwoh/cBDiTif+V8uAUL7aRkrO39DYqraswyr/26kb35uU8aL
	bskovP5IkjZloocDM7eozWAuiMWGf0CpR2LN21hxv/3Vwv8v9FjJvlddzXEaOanf
	Ze7FId9GyXPUONqVVisWMotbFPUJuX9okmd1xuJesM2tBoJawEDukHfoUyagFvhU
	h7f+bzcZwGmWEJLPPxN1L8RAoJ+Wy+tN1MfjnIUgf4bMfjIqEo5bqQzsdeHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743548515; x=1743634915; bh=2f471leayA/yWpzQ4deI5Fu/atZ0USkqpvn
	fYQn0peE=; b=aTo+ySGgZKaTCBKrMq6+vo0G0sxg/TH+pz3hZZ6Qbs65xVIL1Uc
	8668rAgvhFzazVTisjwyPBbimuJqnBv44gEULM9BzWv7uFEr4Knug55vpOtA68Iv
	fFpgFqKOrbVdCA2wVy4CYYOW1QDkDU+ymH3GXGqQ8mWt3RPgYOrjMSLE+Z7RK8s0
	28R7mY5pa1tbQNsbPW2lahOyuG7dZPfF2tDq1xK8UGqiNhRFRupSt3f5ZCQoYX6e
	fV6yg/8ipIu0dPIwVtFIlMjwDLGdNyvSCKuLhhexo8yaZ8wIFP4gCeRemh0Mp72n
	C7X23Coa2B8BJsIQetjNnZjkzwTkeFVB+lA==
X-ME-Sender: <xms:Y3DsZzagDEZOAL_6bZ1IiE2ncz20veonP6H0e8O7CWWPBsSJXHuxxg>
    <xme:Y3DsZybXDvmGiif5mcsg7hUpPwVC3bjs3clFKQ7OQY65mZOfZVDRPCB8whaHWB19R
    hLqMoTZw72PWCqGpLY>
X-ME-Received: <xmr:Y3DsZ18XBqMYx2ZA_XCRvMGW_WtNnlhvVfxlCoBssuRnAXh0WNQpiRGcVzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeegtdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffk
    fhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmh
    hsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeeh
    heefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhes
    shhtfigtgidrgiihiidpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:Y3DsZ5q5DhVH7JYAFOygUUg1BHJWSMev_oaj3n7RgDpn9086qI254w>
    <xmx:Y3DsZ-omQRRWEvcF1luxcwfaG-iS0LYx-shDQX-cev2835sbO0-HqA>
    <xmx:Y3DsZ_RpUnXTwka_toViEvU2C2vXHmeJLNx0kxrvQXmgPIFK0yZYoQ>
    <xmx:Y3DsZ2rm1bZbXrutNgcx25B2eIu78dFq6UNDz2u_VbsVJXGXx7hCpA>
    <xmx:Y3DsZzCexXA3qgMY2q3fSUrTFK16ZtA53CHfr3B2Xa2VnUTWbIIMewBD>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 1 Apr 2025 19:01:54 -0400 (EDT)
Date: Tue, 1 Apr 2025 19:01:53 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2025H1
Message-ID: <Z-xwYYAhMpEd2vPc@heinlein>
References: <Z8ec-DOTlSM8FMhC@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xkhh1mbb869CmmsG"
Content-Disposition: inline
In-Reply-To: <Z8ec-DOTlSM8FMhC@heinlein>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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


--xkhh1mbb869CmmsG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 07:38:16PM -0500, Patrick Williams wrote:

> For this half, we have 4 seats up for election. =20

There were 4 nominations for 4 seats, so those nominees will
automatically become members:

    - Andrew J
    - Jagpal
    - Jayanth
    - Patrick

--=20
Patrick Williams

--xkhh1mbb869CmmsG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmfscF8ACgkQqwNHzC0A
wRlHZhAAkIBRNOrOf0eN7BICv8zWPsMlIgdMfqk3D/973undexbzHkiEkpLcCSDU
ud2lcnYLt3NQrX0/uqeRndob3/utKGWbZtKTbMQNiTSontCUki07scFEweNWyc5c
o3t4N5wUAwKNWm9nkOQc0udxLjnSoo4HEnxZs3wtFDvhQ4LsUkEn4ZJ8a8nHJaZE
JBwv4c8jWwLOjZ33Gir8XFKLb4rJgio4Fz686ZM5P0arvWR6ZP6ghaVd0/RaAqC+
sh7pGax4y1hHgTVDqh4vjs5cFRhfgpMZavC5aZGpmMq/x1BqVqTeyBBWB3OB1Cq5
F81MVxYxne/qUBTuHPC+fxFnHOWeVqcZm/lofgBM2TrR9fb5IXHb1LRr8zUBom9F
ejJD+Lah8AppmWnc4os6kr25eyZO8vmTiJ5G3FS12HHaDMSC8IGcDfXowofjb5TB
Q6I7liitY0jNRP53MUdNEJpz6mNsowTN2puYB319iT9T2WpJ6KQ/pKttbuHtkDGs
kOyoKuGOCgK19sDBbk0wYZsjoI9BEy3u4SqfWMIwgz+5bVfZ4vURjL5pW1UIW7Em
QuX0MajWIMuV+6Ug6p5N+03A5jtWnWMN2h4M0fsHz9KWWmxaHIGOKxTHKCojjhDf
szZsd2MetdQRIxjzE0iPu0OQJEfLWoqXjy0TonFy0KNBSHfs0xk=
=jD1o
-----END PGP SIGNATURE-----

--xkhh1mbb869CmmsG--
