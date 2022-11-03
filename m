Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B5618477
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 17:31:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N38QH3F97z3cLr
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 03:31:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=kiQ3dmgz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Tev/WExl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=kiQ3dmgz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Tev/WExl;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N38Pc6NmNz3c6k
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 03:30:27 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 94701320097A
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 12:30:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 03 Nov 2022 12:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667493023; x=1667579423; bh=w5iQO1ddQa
	CGo6Le/uDpsO87PS449YOHJY+eB9QWGPs=; b=kiQ3dmgzbivUnFK8+ArY54Mtfz
	t1MRoIYGekliri9fQedlfbhZe3z4w2D3PHvaVLLMmT957TFuifg0afaSv7MPkOHW
	M/VL55cblb2oim9Sv+4S5rg2ws423YctkHlMfu7w6sFuVifjnxMrq0/IfZEAunwm
	zLQcY46HvPAK9vH9cw3w4ZK4nOt5krXvHTDB5OFWdXqYnpdy0xZhetS0+aAESVHK
	qDCJvFVqHX2o/0yK7DjlQISyF8gieypw2wHfs6CEMc5iDPwCkdwF2eRh0psXqdeH
	NSRoYkVnoFYRavA4SaFQPSaoy3QYFZpzGynGiLNmzHMqmZ0NYzeVMDFgpNDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667493023; x=1667579423; bh=w5iQO1ddQaCGo6Le/uDpsO87PS44
	9YOHJY+eB9QWGPs=; b=Tev/WExlFx6li+ccpAOiQruXu4cWQVvs+aYpr3vd8FpC
	llnwWnBEDiSRA26w4sU99SbIcxO3WZHLCuPFY6zVIu09JE/Y5y0wLEv3GxDEFG2Z
	X0paXFTq5bNJ5rym3Yqx4l53Vj32KCfafBq3ts0Ljl1sMkKEoad5lsaTcHvGl2AE
	ogh0TTOMs0LC5a/uW7OzGaabdHnvkZTd+8+CGmqiW03jmeuXsJ7WCoYiBTjvvmig
	pYkmsWzMG/tnaXXZ7ziqgDtIeHTP6W6cwRDMkxmNZsNCQc2orVShQg2GamcyEomQ
	ujAd6H99wqFC1Fh07HxLyUwIKVfkvyl5MIZpIVC+CA==
X-ME-Sender: <xms:nuxjY0uVKxH9mEPtCDhp-zNdeO36pVO9vTk6Zzcnh6TxCgjmOgi5Ug>
    <xme:nuxjYxcPymqgh_B3TgpI4z-CLQmzabTTg92e5ZCgaTLBXQLqxWi10FseDhAcm1Vke
    rQgU1A_vABQPfEL-5Q>
X-ME-Received: <xmr:nuxjY_xuK9QerFtTwCz1jWszLAwlMOk4auwhcczcA3Rw7eV9YUVv8u18m7jV2obrS_ezC47p1D6O3LnE4NvD_2KI7Luen58emTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudelgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
    fefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:nuxjY3MVaHkAQgu6LSsK-hfAZGP1hlPLifFORL328v-sfsZ2z9PcDA>
    <xmx:nuxjY0843vATo1Zo_KmHhqjm4JDrHxpQhA8iv31sVZuLtg5a7xxFzQ>
    <xmx:nuxjY_WP7yBnAmhxtnHdSE-UuT914Es5marzPwRZbch6iG3JheZ2Ew>
    <xmx:n-xjY9JtgioAj-9_woHa0Gak9OWp3hb-7f_wMLe_aaRhrm_xNHbmag>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 3 Nov 2022 12:30:22 -0400 (EDT)
Date: Thu, 3 Nov 2022 11:30:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC 2.12 release candidate
Message-ID: <Y2PsnaF7KfvJArBF@heinlein.taila677.ts.net>
References: <YuQEd4Ql+r0IVfPK@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="foG94L2Uv+fm5oQa"
Content-Disposition: inline
In-Reply-To: <YuQEd4Ql+r0IVfPK@heinlein.stwcx.org.github.beta.tailscale.net>
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


--foG94L2Uv+fm5oQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 11:01:59AM -0500, Patrick Williams wrote:
> Hello,
>=20
> Yocto 4.0 (kirkstone) was released back in April and around the same
> time I had branched our own openbmc/kirkstone to match.  I've been
> keeping this branch updated as upstream kirkstone fixes have come but we
> haven't made an official OpenBMC 2.12 release yet.
>=20
> I just made two new tags in our repository: 2.12.0-rc1 and 2.13.0-dev.
>=20
>   - 2.12.0-rc1 is the tip of openbmc/kirkstone and intended to be the
>     release candidate for OpenBMC 2.12.
>=20
>   - 2.13.0-dev is the point of split between openbmc/kirkstone and
>     openbmc/master (really 1 commit later on master).  This causes
>     `git describe` (and corresponding /etc/os-release files in builds)
>     to show 2.13.0-dev now.
>=20
> I will leave kirkstone / 2.12.0-rc1 open for 2 weeks for downstream
> users to report issues.  If there are no reported problems (or just
> minor problems that we're not going to backport fixes for), by
> August 12th, 2022, then I'll tag 2.12.0.
>=20
> As usual, we'd appreciate any downstream testing that contributors can
> provide.
>=20
> --=20
> Patrick Williams

I didn't hear any feedback on the 2.12.0-rc1 release and I forgot to
make the final release when I suggested I was going to.  I have just
tagged 2.12.0 now.

2.12.0 includes the fix to the OpenSSL vulnerability in OpenSSL 3.0.6
and earlier.

--=20
Patrick Williams

--foG94L2Uv+fm5oQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNj7J0ACgkQqwNHzC0A
wRlOYBAAnU1iTyRnCnza5a4cdGth1hMTo+/v5mftAHdlYk7IxFwukHQHAXgLRLP4
RfoNrk20XL362zafwMChZQX8l8mSUgU7B3i2kQCwrLIRFu9/XDgaF4/6taN+HPOX
Rdo8heW32wRJLM07P7+ksUnn82Mbej7gPFZa4+C98fNQfKCM0rZTvbRX92xUpMHT
IyDCKUr9uAnDB49glYx/hw8A5wIEzHY3vuM3qcYsC4dHHnnKQ4o1F0ZR30fiXq8c
W7zlNC6kuONKY2Dzv3Q+RrgOBt+IDkKoVSj1gtTrowu/4vkmHQWKn6/jvU6YwonL
MgiDwOKbGrbDoWtPDP7V1lPV32Hj3uR0wofxBT5zxcQxSxoCQzDRNNcQGSRi6nnQ
GCyQP2uzsOyXTqkY1i960k4pTzkMBBVUpw9LVorojt/h7q+spwtDTsLSPpaxYGyB
u/tjpHsEfHM9jQHFMWauRCfRLMNdo8JO3qVIYrByt7CiwFlri1d76EiZ6ML46W7A
0ufQLD501YHv/rTqf+Trg/pdo3w+FBxMaA/qcEN7gEkPQRx77RWBi3vr6VlN/ggc
bw1iCihZsMpt8A7d298Xeb5GzLJKNFR00Xm7+kZoNzMqxktuIQshoJZ9lKz3VbLq
ehiKBgBsTAHbh4ocIwdoNIGoN42lRWPV24IsSKcpRpO4i2Y3EHA=
=XtG9
-----END PGP SIGNATURE-----

--foG94L2Uv+fm5oQa--
