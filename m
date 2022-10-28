Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B6610FEE
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 13:42:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzLJd1khJz3cCZ
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 22:42:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=OerYpw0H;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pAZXfIpN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=OerYpw0H;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pAZXfIpN;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzLHx5WzCz3bcw
	for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 22:42:21 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 20096320070D;
	Fri, 28 Oct 2022 07:42:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 28 Oct 2022 07:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666957336; x=1667043736; bh=7cfw1M0wP4
	KDxkPs3qzCpTnz1N4DYNWIiQETB0oJPXE=; b=OerYpw0H8i2nV09ouIssq0kErj
	fVkCeWr0uXiUSvKQb6yzdM7UugSIVWWSyI0hQw+mPqXf/5hW8K92nkebNOGAHlH9
	UdJvOF1FLiG2WmyZCd9K8sOIykEgSS0jwYipkMsiECgu/59t7MDLshK5tfOJ+iJB
	XClFRNekKykc2pBQgT/n9yq8teeSmupqYK9iy8LAEmGQi+yqn1JnOgBTUt0SVKiF
	g6f+ZoFeSpqBxj4ivhQFyxzXjhg67zsHMEX29DkhwzXsFLX7ydQJCfd4AyLF0qBl
	xhaOIuvH0zEsMrGrDWKc7Zi3YnyNq0F8cTBIo3bVlcXK+I9D9USsRN6jQSyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666957336; x=1667043736; bh=7cfw1M0wP4KDxkPs3qzCpTnz1N4D
	YNWIiQETB0oJPXE=; b=pAZXfIpNfW3qmWS3LuUYFXRdQdxm+xMAG9kfeD7NdTz0
	YpjyBgBO0TsnJJza8NDtKS4wCQu9wMR9tlCWHYWOz0XTqrCBaz+BdkNBXPSiuWar
	8d7Tl7+P6YRNo5LMRqfPomUcudE7YWr7G1LmNv8d6KgjIdg6aEJCgdeCZ1YcUFkc
	YuteOeVu0wdztlGlrwc24lASNr7ddgGMbd8cd6Fw28a/mOHwuxjEG2TCkS5ALh9B
	E1x/1pUzkaHIYpbjLPI7UmlPBSuvi5HrQExwH0zOIZqMuzp+SoDfAlvgJNkKV/IN
	/19F/w2iQ7tD080bu8oQ0vev+BxEPKPvdvvEf2pE3g==
X-ME-Sender: <xms:GMBbY35VRcVpPDJj1uB3Rts0d_cwx_4GaU3qEyrzaGxrw9wua8SLEw>
    <xme:GMBbY862cqXHNWko0GbcwnSoTiYTKTaG0cBEvlcXa1r5Gt2DcOqUtTqWASPtFAtqh
    38Hfs15WY8AYb-Iv4s>
X-ME-Received: <xmr:GMBbY-dBXaOIMGIsYJblKjQ6JTR_pCr8VjiVOIm0hVNVHXUQsverkoLxcgSwKGrJs9pJ-NnQozlxaHzLRBcx48eUIalSykJ3ZNY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheel
    udekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:GMBbY4IFwq9szBi-OymTPSn0vcOUM74QhUb8QNY7C6I8PyQ3J6Y6YQ>
    <xmx:GMBbY7LoqjI6HCVN8I5X7N8Vi-uWpErOOQaeQx9zluviWQG3r1I4hg>
    <xmx:GMBbYxyc04CVXoCdorQ9m95A-CHnosTwGepAWd4n-BToPJhEUjpK2g>
    <xmx:GMBbY9wUpCLmheUzCk7YmYcKx2nY4smpBs355gNteauIOLDPrphvKw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 07:42:16 -0400 (EDT)
Date: Fri, 28 Oct 2022 06:42:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: AKASH G J <akashgj91@gmail.com>
Subject: Re: RISC-V Support in OpenBMC
Message-ID: <Y1vAFpmfGFC0mOtK@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAE33tLG4oOjTmNJ=a0jNEEdTj_501offkYUFcEVwk6rAnZYKSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ns/OIOSanWVevms8"
Content-Disposition: inline
In-Reply-To: <CAE33tLG4oOjTmNJ=a0jNEEdTj_501offkYUFcEVwk6rAnZYKSw@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Ns/OIOSanWVevms8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 07:30:00PM +0530, AKASH G J wrote:
> Whether OpenBMC supports BMC controller with RISC-V architecture? If so,
> how we can generate BMC firmware image for the BMC controller with RISC-V
> architecture.

There is nothing to preclude a RISC-V based BMC being contributed and
running OpenBMC.  Yocto already supports RISC-V, so it should not be
difficult other than getting kernel support for whichever SOC you end up
with.

I am not aware of any RISC-V BMC chips at this time.

--=20
Patrick Williams

--Ns/OIOSanWVevms8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNbwBUACgkQqwNHzC0A
wRnuxA/9GsnC5ThRpJGiQi9FmYIheAyNelHBwhnvDZhDdrnjZj+tJ2irHdRh9vXL
1gpRBm7q/zUk06TphhMBaeeFP8XrVZK5oRyMXoOVUJTJ2Snq0VbRJv4UY1/lEqld
Evv2/bl/fSdeYjPslyT1cT/DeDpEviVL01UpYhlGUKVQKBwPUu5NpnCvwrxKvfe8
bl6ogvp0L5NGGMC0MVLF0V3/xABv2ZWpXfc9HMioW93rDxSW2BzMdbnq4eF0AxIZ
iqRwOAGZIJr/YYUrByrAiH+ektaouISy5rWZbV4QXAAdyAz4R1aCAE8/jybZz0o+
LnMNqUcw2fMgnL8l9Vnze3+YsudV6/by+OrFubynS68p/5SB9G2SHs1Uckmg/Oaw
7o0iqMza+resydjD2a+B3X0P6q7PKuNleifFKVusCt+DihHvuujMHynqAczEeD5Q
V96SKUyaHA4+gGfkepKOnSThHqzbJ+t6yXu4v1r8aZ7C335fZnx13UVdIy5cuPec
l3kZR2/iFLWu4KkVToBEzG7acAbvATlJWQp4EMURHvE1qphhC28TzU3oZadVR9Ws
aoebbgCAh8LLb+LDYH8aX8AiSMa0F1PKf6rKx4Ymm7ZGyeNLL7GQ6GUDM8Kw9eC4
kHYaao3sl5gJEyhvv80R75ByC6vDjp8QtUq5ZpM6tYjjG3MfwLA=
=Egwi
-----END PGP SIGNATURE-----

--Ns/OIOSanWVevms8--
