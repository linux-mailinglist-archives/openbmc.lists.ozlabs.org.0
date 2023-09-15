Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E37A19E5
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 11:05:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=sKgQg+UR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bYtgi4XD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn7Ym2PVkz3cHS
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 19:05:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=sKgQg+UR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bYtgi4XD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn7Y95Z41z30h5
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 19:04:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id E17F03200984
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 05:04:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 15 Sep 2023 05:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1694768667; x=1694855067; bh=iS
	pTaT16kXFbXUSUAAHvIXleR33fckqOiypQot/23Wc=; b=sKgQg+URTBPaRvfhyk
	sLQURa+4wb6xFkGpyKSIJDXOSIP8KMRPLqKVH9NBOfJPD7OTGQEm6IgMdtAs5lnq
	XDzwQ1JKCXCNwNHciVAlYKSvWx5COTt+m1ZcjREr5sMRKXeFHX01PrwKt58D6QgW
	v+lIC7mERPBV3j2y/m820N7lzAcmRjLDhXSg//3fhcYbYUBr8v7aZKXUjp31Uwsa
	hs7S7G3950LzcdyAEPf2WREoCzJ9hqhgTOzsRCnC5yfZwMcA7yj9DzIbzqLIERdT
	hJ8qQ696JDD+iB6kAg6rIJloML9FPvgTZDmjDMWAWg04n694xodRJ2eoYq0Vtdro
	OEVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694768667; x=1694855067; bh=iSpTaT16kXFbX
	USUAAHvIXleR33fckqOiypQot/23Wc=; b=bYtgi4XDS613QvFG9wJkl9HqYNjDt
	IbBkArXOPg6jsykOq+pSALZk0dAlwoYdEaqlZsVYGDbDpXXfoeONYjZskVsDN+TT
	NF2pI9mR+40MqBqpMOCT0izj+GJdTIX/Ke3LZltni862UwS6kIffVY1EH7Msdt+j
	XEk/hbZyzb1z9p04/+I0G+T6mTTbitdHDqQr/VPyBvKZcNEPd4GCoMRah73PFp0O
	losP+3stV5UTLtqjtMaj/8+mWWuWHeza5hB7dN3ZAIQNSLfmgyRHm7wvM1fAHPfh
	HYcDEMA7es+byG9JGHfGQUGpdGdY7s0x4WCCVAWjhONqvJEL+9P+6/XDQ==
X-ME-Sender: <xms:Gx4EZUIgE8UsSL1QPRPzv7ePtFW-8GvCUitKeIKr_P6ZwZSMXv1klA>
    <xme:Gx4EZUIk7lh9hkevTdeqCc0EWizfAvoTkDp0dpLNPTPKJrbzDFFIvW1cTIoh7MIoX
    AYjkUL5nL1Lmijp_ck>
X-ME-Received: <xmr:Gx4EZUsUMXL0Dsr0NWSwo7MWpCaYcNLacl3abmkauuU1pByTIf1Jisdl0z-mXbBVOtk1yM45AF114hrb3ecByIbqGHpq8i8o1fo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejvddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
    geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Gx4EZRZyKLu25di7pXZlyeeTDVACvu9wzzQqzbaVXeJWEr4xlP2eQQ>
    <xmx:Gx4EZbYbRIOhWC2Pq7cuZG5N74h2Lx9Wgd650VvbS-PRubCFD7MphA>
    <xmx:Gx4EZdDsk_XUXYuQt5M-IH6694XjxkPAetAyecjCz0FJNvYqEcLteA>
    <xmx:Gx4EZV3dhQryAlxvzueahpHDVMMHxAP8fy_gGlwsO-OIOxmtwmb1Ng>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 05:04:26 -0400 (EDT)
Date: Fri, 15 Sep 2023 04:04:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2023H2
Message-ID: <ZQQeGWiNrup7CFuQ@heinlein.vulture-banana.ts.net>
References: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IK8Oz0vyVHh9IhRZ"
Content-Disposition: inline
In-Reply-To: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
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


--IK8Oz0vyVHh9IhRZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 01:26:11PM -0500, Patrick Williams wrote:
>    * Sept 15th - Election concludes

Since there were only 3 nominations recieved for 3 seats, the new TOF
members will be: Andrew G., Ed, and Zev.

--=20
Patrick Williams

--IK8Oz0vyVHh9IhRZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUEHhkACgkQqwNHzC0A
wRkiIQ/9HwEe0b16mDGeIz/KBzAKOvBTj/8pdv4Ke5m6Gpqjq4ZboV+D4QqZfDrI
073WLak/frkB37FNO/fj34FCr4OwLdr44Bsld1q5DWSTIBFzkvNzTXXB7w/fhIKd
+p+buZtywIXhXwhoTKwSWBx8qM9phJKdl7moXD5i6RMC26h/B7AFOC5wmO4jWrIg
fb9y4iQ6rAMG2/ar6Klx1BDUYLAjt24iC3xHcUeqaDcRnrRT2TCX6ryaJK3IiqT5
ZpmGZd2HsMEmgb9YPO49Q2K5P2Rp9DjIg7kV5UxrDJeDGg8X9BueLCCuCIudYpSU
LvUBnZ9J1NKUKwNHg6daE94KRXGXi6Ryfl5f6N+0+QbPIOthfDcQHiY3Wt+8aYTK
1IF+RdAhuBr9YuVAc9gSjsGAp6yDvK3lCPV/kwGGRxEnTnf73eN/LKO28cNPEZ7d
62w0S8ctlajY5lnuZrrTAcSP3omMn4Gv5E7ImG0r7BRXsZiMDhG0Voz8J7hB+4zs
+rU4rGUKUPgaAau2mMDLS7Gky86LJoslKhObzP0B5BQphQ2S4uksGnkXNHyD4ups
Fbf8LoxCTKtHLu9SrnK0Wr5TpGFfY8b9gZb41Vtqatcw95dTxgikPMgTwpuw5jdb
Qu7cvse06YAeGk32/WQHoGxx897FOkmfruWejKuvF44EXxC43j0=
=2a0h
-----END PGP SIGNATURE-----

--IK8Oz0vyVHh9IhRZ--
