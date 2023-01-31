Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32094682055
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 01:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5QHz0h7Gz3cBk
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 11:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=L9PRkTy4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FG6QSBGi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=L9PRkTy4;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FG6QSBGi;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5QHN4XMBz2yYt
	for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2023 11:03:12 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id D6EE35C02AB
	for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2023 19:03:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 30 Jan 2023 19:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675123388; x=1675209788; bh=fH0OE4ErKi
	+VUCTkJJjMhungXbNSLfFIYPgs2yOv2Jc=; b=L9PRkTy43ObAwT/4f4n9cOAlMz
	xSMQ0cw6VnfzImz5vac9N7PJAaREv8vGQTyJGIUkL0rVFxybZu7xCeaGw1np1rLA
	oRJ1ZklRv0x9V87WOIir0Wj2OHqEz7YtxNv49+bEdoAXNfysjZTYzD3tgnp5XkeS
	UPH0L1A1oND6QJUvjshZeG8WAg2MwTe2nl3HGBhpJmgSmPuDjHkZuOPS0/zjkNmU
	LUOI++mBe80j8V17r2rUsv+vu9Hqy20q/QMZnlKeSVkuMdHRFLgz7GwW5qr9/VBx
	l6LvaA1rnWIYK3bD7hofRhHUzzM7RFEEAs4keVgVe/rCvk18hPHSNtRkCauw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675123388; x=1675209788; bh=fH0OE4ErKi+VUCTkJJjMhungXbNS
	LfFIYPgs2yOv2Jc=; b=FG6QSBGiffym/90Yir6gAn7K7dYAnCi31LyeeTvR5oyC
	QGe5xEJx1fhaShVjbJsAEqfTTLzLOJJmJjvIujzz9r4PL1pxYdFRTDzlga2uA1oq
	TY66KEaOITeTddfZHP4uGUH0Hg+ufbuTFJN2dkI204yJE1X67M3p9xKkrzSz3OGz
	GJ/5HXWGzOeHGiIf0zjwP6dVWTBpwfo12/JINIbYKvLmmOM4L6yehwsxB6w1lUQ7
	wxb7iul4RB/+mSjP4wIt35YfArrbbF8AMOKcjCGdzL0R+T5TpGD09GH3CyGLffdw
	oj6tvLAI62GCCk2hOkA7lQKiJZXySiJbObCHchp3HQ==
X-ME-Sender: <xms:vFrYY5i6oaEzUii61O1P9y5-Klw2njNtVn9VrSvoa2bNSvTXiKB2qw>
    <xme:vFrYY-AelztrQ6jf4NfdxR2NBiQp1BqLecJ8OCV0qfct0sbxiqKJ2y4c0ogaHm5xe
    Viv34pz_MldPzX0Lvg>
X-ME-Received: <xmr:vFrYY5G99dI2dKnaoNVquk-IrOJjGdHaYcBFK9CohS3hs7jbyBlFpzihOB9QodAvtTGBjVGjW54r_IinrPxsyxLY0w81rubZbZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeffedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
    geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vFrYY-RogV8ig-TpZ85If_Dx58x_CHpMIWuVWpdzSeaYn4R_gOjBZQ>
    <xmx:vFrYY2xFypTlsJNDixmOO_TE_IEoOelvEfc2Xv-l6OcmYmHmkxLvUA>
    <xmx:vFrYY04z9TyXlzBO-FX4kpy2eKfnvGNrgIowzSxygg1FkK7nxuA0yw>
    <xmx:vFrYY7tNzJB80ZJZ2Rbo2HhyAL3sMp-vifgBCB1U5GC433D9ZD0h4Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2023 19:03:08 -0500 (EST)
Date: Mon, 30 Jan 2023 18:03:07 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2023H1
Message-ID: <Y9hau8eAn3W6Tf13@heinlein.taila677.ts.net>
References: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j4Y1jbDwqdnVj25N"
Content-Disposition: inline
In-Reply-To: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net>
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


--j4Y1jbDwqdnVj25N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 05:47:21PM -0600, Patrick Williams wrote:

> B. We have 4 members who's 1 year term has ended, which means there are 4
>    positions up for election.  These members have an ending term and may
>    be renominated:
>         * Andrew Jeffery
>         * Jason Bills
>         * Patrick Williams
>         * William Kennington
>=20
> C. Nominations for (B) may be sent to the mailing list by replying to
>    this email.  Only those eligible to vote may be nominated.

I'll self-nominate to continue serving the community on the TOF.

--=20
Patrick Williams

--j4Y1jbDwqdnVj25N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPYWrkACgkQqwNHzC0A
wRncjRAAiP0a2dVB4lOtu+mmmdFn5iJ7DxylyfNQtGe/97NU6LMtU18OrBX+sqnH
EhNE6boAwXfiZtmkUxYM12yaQiUeh5il+nQ97JyeOBIrtS1RG/fqHsXp4Du/6+rl
SiQuZojMWO99kh4Kj7Opo7xAOo+FiKv2WUYQIveFBHymdbe5of5RDHWjkB8bSJjh
LtqW277ZqZOLPqq65ZSLsNBD5RxznKFrXIAXHcEYz8hFOcMgy4yk/uFNH18qsPig
FDAtDW3QXpxhkvjmGN62fHqrotZ4mDuEqStlFOHq2Aoo9ib89wJyDcswcBnEalRO
CUgMlO32P1vDMGzfEdsFhq1M2/ga49hk8PLd4PtQcjydIef0arbKH6ZRwHWyDl/G
t1ojZ7tWnOFemNgn/pQMrV8o0IrTNqYFaS77dhi6ys2DS/1Q6SG5bP5tfjK5bzkx
LbgopnuUeVU00KOB2hTp56FrHG33Q/rGj7LMfgMgg9GUQBO87RbgshwnSnS7Wdu8
Z9yiRGrUwO94zGhsPWcoVZlUwa1crBpHJi7F1tVxvfmKrxkci5s9NgtWP5+il4EJ
fQpx9hvu4KM1y6xCFAFS2Qxe0/qol7hXU39a11+lwgpNaCdccqzeGr1QLW38BxUU
+y7SHp797wuHkNWVCnAgc0luT+M6C40AFkb2+dmFpgrCbFlCG/0=
=JVrC
-----END PGP SIGNATURE-----

--j4Y1jbDwqdnVj25N--
