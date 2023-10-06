Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A07BBE11
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 19:55:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Wngdtah6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=G1FhAeV1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2GLd1Qnwz3cc6
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 04:55:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Wngdtah6;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=G1FhAeV1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2GL03nxgz3cPS
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 04:55:20 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id 542B45C02D1;
	Fri,  6 Oct 2023 13:55:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 06 Oct 2023 13:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1696614918; x=1696701318; bh=AN
	i6+t9JVaCnC5PA9SzoKu5clPpkI/IZZxcUQfvmShE=; b=Wngdtah60JkpJ1+b9R
	7c4wpsgr0v+5ZQyE25j6VUpD7vUFEZERuETy7s7b0ggdxhQnREsgMGBQwRZhc0bs
	CReW2ejg21G4z4YkNBwDumURXAouaeR89cMV0QuJpGiRi8dMlCCiOdOx5rRUKaGb
	SZxTKgRJTy6ekiGEvU5OFmIZknFayIioDuLhD0twHK4wKG9TrMd7XC9d+FbxJ133
	JLHSbMvU8zo4aYXGqZuR4z+hq3JPtVS/gmttjso1TZbmg/1MQfQzb4qq+QnbTaD2
	SYtKuO2b5qz7Et9BL5SHPYkJEgCtPMBCxwDwGC+v0+VZk8elA+DjXjOps5xvDV4l
	VuBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696614918; x=1696701318; bh=ANi6+t9JVaCnC
	5PA9SzoKu5clPpkI/IZZxcUQfvmShE=; b=G1FhAeV1aBwycmMi4QQmKmnv27XxI
	vmoEFww3ReGhkpU/cVUgoUsvKisQB0q8/U+LPeGgs9IDqaAnHzsYg3bW4qJp57n6
	ibF6MFa9JbuOgmdMGA/ph81ZYBpsa0p3jb55fplrSautIRsFve+nY10NMAA8li3S
	B1BefoxCHJOpesCoRRv/8HCKulIQQTiLIOKtK0aebSyMNq0zxRaz4fksQUHr3JNw
	3j66CUmjlnfQKorbHUONfy5NKVA+CkrKZO/1Lo52Q7ZbijgN4g15tP2Er5pKH+9d
	jn1+yxgUHG2Dq8NeB0KHDu911oyPbicLcD2f6gsjmLFC90fJRX1JWRhYQ==
X-ME-Sender: <xms:BUogZXxcTigJ0P070ZqMGmKwmfMqmVRnDzSRNqPwBOBzjyF5CksR9w>
    <xme:BUogZfTkuqL_5P4NZJn9dWDrI4ToRL7AgRzDlcWCHH711F1yiryogYYdxr9wwlXh0
    oR2M3k-wmSeJYqEZZQ>
X-ME-Received: <xmr:BUogZRUMl9NG_8kFKJZ0dm8heUTcZoMIjwSi0dlc5q09A-TVsjECWRDwWNspYXbLOudKYgbAainO9n49mpfrQ91U4in3V7dMhR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:BUogZRhvamqdvD8ESTfjgMkZzVKCNb2A4uqY5BqCfnVtYHnAV1ZuUg>
    <xmx:BUogZZChhGXrcXkBb5a8bsLU_YK-F6a7yW5w-tIKcOE1SWr-06n7Ug>
    <xmx:BUogZaLGRrSUaHWpq3NsdQC7D0_CMGE46KZrhNcfwN7mToE4ZM4b_Q>
    <xmx:BkogZc40el9NIzQPjGBY4St3k_EH3fPOUcNYFhj5JjlFNOdIWXpCuw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 13:55:17 -0400 (EDT)
Date: Fri, 6 Oct 2023 12:55:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
Message-ID: <ZSBKA2D8Euw2DMjU@heinlein.vulture-banana.ts.net>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein>
 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9y2T7Iw0T/KHMGxo"
Content-Disposition: inline
In-Reply-To: <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Brad Bishop <bradleyb@fuzziesquirrel.com>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9y2T7Iw0T/KHMGxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 07:29:27AM -0500, Patrick Williams wrote:

> So you're going to add some custom PLDM commands to offload this to your
> host firmware.  How is this helpful to the rest of the community?
> Again, why do I want to take on the maintenance risk and legal risk
> associated with this feature?  Why would anyone else in the community?

I had someone ask me offline if this mean that only features that have
applicability to more than one community member would be acceptable.
This was not my intention by saying this.  I was speaking specifically
about *this* feature.

Originally this proposal was that the license server would be a way that
multiple parties could collaborate on it.  Moving it to a custom PLDM
command set diminishes that.

My overall point is that this proposal is, as currently presented and in
my opinion, a net-negative for the project.

In a very general sense, as long as a contribution is going to be
maintained, the contribution follows our processes, and the contribution
isn't considered a bad idea for a variety of maintainer-determined
reasons*, we should be accepting of features that might only be
applicable to one party.  It isn't the wide-spread applicability, or lack
there of, that is an issue.

(*) I'm leaving a lot of wiggle room in that statement because I don't
    want someone to interpret this to mean "Patrick says any code we're
    going to maintain should be acceptable".  It is entirely reasonable
    for maintainers to say: this is not a direction we want to go. =20

--=20
Patrick Williams

--9y2T7Iw0T/KHMGxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUgSgEACgkQqwNHzC0A
wRmN1w/+LJvg7JblL3xnwp3lhvZjNpPWkpW6jcc8U/pIJQwD5F/oxg3vRkz6vZtd
1z9sj3ldtrkmmWq19MUB4BhGpCDIHv8rdnomVu7dH9c6+zptCocE/b3xRifARw0f
vDISl9pDlECLNnNt8u8U35mc3RViONgOmK0FaGEMwLwhTwBvsWzR0yEbTNXddyhy
FCLhF4bkFe5/2mupKEjJXM4yWEGj4i7ZhzzzRm6/9VZuqxO1JdpCK9n+RbfATYSc
Opg7gJ+2CCCSPVvHW93O9sAvMKqQ0usxE3c7AZICKdCduOZDC6n0Fhd1V+A5hrQi
gQkadGRAF/ikeD1wTGssBfCQJbhh4ByjV8uH6ZP0nHHFZIHQ0dENPmTMDhlH3Jv6
Vo6eob2gN9Q3RnTwm41TWyq3Mgh0hDQZRMztX9qGUKaglZl919xbVp6bzCFRGwS+
DgYTwzTnAhQv8gBv2TlBy3GPR3zzOZX2PxIm3Awu/yC/EXtK7tWUoTnLN3RRUxbc
poP8kUeX5c+sw3Y4VtZn4yPUXRrILT13AOE+R330ejMOOqugO59XT2MD/LzIlTgt
GokqrznpqduOlHsh7BH+q2QXMGqwD210Zv3r1mKAAA6B/9z3Yagc4Libp+IvMUFc
3j1KWGlZFs5PWcn2VznCP1GzxX8aHXmdTPdkhmfYzSZOP0ZTuVU=
=9NQA
-----END PGP SIGNATURE-----

--9y2T7Iw0T/KHMGxo--
