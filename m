Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153795F0A0C
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 13:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf7FY5smrz3c7h
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 21:25:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=IpB9UmTo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ByHaYA8B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=IpB9UmTo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ByHaYA8B;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf7F2359Mz2xkn
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 21:25:09 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 108D55C0161
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 07:25:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 30 Sep 2022 07:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1664537105; x=1664623505; bh=mrrVz087RL6GJOqgY8QkOwyq/uuarJ/KpJm
	kt/PfrsI=; b=IpB9UmTommeqelpFgjmsIe8AHjy8mlL7a51k24p9QX/AaXTarN/
	jE8PKILrZT4b/1k5kXdbe2gYi8LEFfekatd0LePi6nO4N3dkaEwwXIxWcdpHMGek
	Zfzyg71h6aKpnjnkr/7dyDRkCNgqaRyZgy9x9Np6uW2gUu9LAexM2Ky29j7wWwDh
	smhkb8p3A/UIDNNbQO9bI/Akl8PpyWKdfF2braqNXAJBaX9foVJtZ6rB4Eh4t+dy
	tVM/Iboywldi3VdUG4eN2pSFPkj/FuiySuue0VAqqkNj+sHJJnSrioOTKAP9cfBk
	eOFs/l3ML4ejtufU9Kd+xX0dxuO4a/JB1Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664537105; x=
	1664623505; bh=mrrVz087RL6GJOqgY8QkOwyq/uuarJ/KpJmkt/PfrsI=; b=B
	yHaYA8BW97QNYv4FqdS2WpYQGCPY6FiBOaO+Q9N91hKFjR7IW/do6q3hiQRLbMHJ
	moZwBbfNIH/IBww+AgtABYPBB3m3T4xLeRLqJkRobaPmG3SScjDmZyJR0nWj7GUN
	v4iib5hwsS6eRJ1gFR9qlmSyUfzyBlQu0vYPhLc1RcZcpAR9rWw6Rka4OTQwm89l
	oIQgfZcGwfCMd17WZ3p2WUSIhLj903B0/z/tUO/HtmzA0b5HqAYs8kPml2TPcOQh
	a5a8KoAkZLtY3hhINopQBu3tQWqTnjJT4hqisZRPR0zi9kw2FT3njCLqXQUBqeTV
	TIaWBHRvH6or+RPXbOQtw==
X-ME-Sender: <xms:ENI2Y_psZnteXpftfh1b4wbDjSNcluWlf7nIsCDlNQvboURTxm-Dhg>
    <xme:ENI2Y5oe8xr2gbJ-d-a-FWOZ2-Y4PGAvsZSbOML3w3qWh479vuzH_aCg5yDj_AhhN
    vHZrSVvut5s8q-MSG4>
X-ME-Received: <xmr:ENI2Y8O7WqB05nmFYXBLzDboO5i1BcVw4MagfWL1KVfG0py86MRMuAxYCj7ZqzB2__b78Vkozt_mN_1jpjXMlD7mjv4MLLlx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepffehgfdtudektdetuddvkeetgeehlefh
    vddtieffueejffeiteekvefhjefhueeknecuffhomhgrihhnpehophgvnhgsmhgtrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
    thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ENI2Yy6Q-kFU93s2xMW7ozD6d4lbJSSJPTpEUU1NsULmRMvPvNEh9A>
    <xmx:ENI2Y-575D89LTYRasRLp8n9R8atcubDnbIap3LLLS1dLU0UZiKGww>
    <xmx:ENI2Y6g075_XiqHYfi57o7NT-LDPwajzNYUSWFaAboIBY_p3LCGjDA>
    <xmx:EdI2Y7XKXvsRnAnHldsgYEDGRALd3uNteq1PaaLWPjKn7lyUvdlqPw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 07:25:04 -0400 (EDT)
Date: Fri, 30 Sep 2022 06:25:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: clang-15 in CI
Message-ID: <YzbSDyBFwmRc6TxM@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YimZdHnPO4eatOG0"
Content-Disposition: inline
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


--YimZdHnPO4eatOG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

TL;DR: I am updating clang and you might encounter minor CI issues as a res=
ult.
Generally these require re-running clang-format.

--

I'm going to merge a commit which updates our CI Docker image from
clang-14 to clang-15.  I've checked every repository that has a
=2Eclang-tidy to ensure there are not any regressions and I've spot
checked a few repositories for clang-format issues.  I've seen one
clang-format incompatibility in sdbusplus (between 14 and 15) but
by tweaking some of the format flags I've been able to make it
consistent[1].

In clang-15, clang-format supports formatting of C++20 Concepts.  I've
proposed a set of small changes to our global .clang-format to utilize
this and a few other tweaks [2,3,4].

If you encounter any troubles with clang-format in the next few days you
probably just need to re-run it on the affected repository.  You might
consider copying over the latest global .clang-format as well.

The commit to update clang is [5].

1. https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/57552
2. https://gerrit.openbmc.org/c/openbmc/docs/+/57556
3. https://gerrit.openbmc.org/c/openbmc/docs/+/57557
4. https://gerrit.openbmc.org/c/openbmc/docs/+/57558
5. https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/57486

--=20
Patrick Williams

--YimZdHnPO4eatOG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM20g0ACgkQqwNHzC0A
wRn/Pw/+NKfe608lwMiYDL5cb/ckxsSuHTjXvQaBZWT+4NsTeUA9qqDI3hkhGZuR
VBxAEJS7KReE6T0x3aXVUZWpJbFLl/E3wXOm4/kL0DIQLe30GhmzHwYiJFmjuFdS
Q2vbzVztfIlUYenptl28Utx57bROPd0ocL5PVN7SfIWc7cUbU/p4L5NYEZeGPdKZ
egMXYmSVW8rfwAtgESD39q6HbWpDdQFaHYfpkvN9FAeiH3OhYibTO6Z5LhPqm76l
btN8MJabioDTLS991fG+fHp9bPe0i8JB6RDXKYnOa8lXtl6fURKEX7kb53Z66bqX
RSTMaIxEHzbbPbH7rg16AydTrTULwjkoJdBXYIbIyPACpOMod/5VSd2oK2x6q48P
RSTK6WgTKiAZU0/oArIW7ZWli5l7ocKP1h1rw41/HiDq09zCGX4T0hp/N0kCmABe
zqj2WKg/2Pjgh0pj4f4EkJWPkaJrNXtLPYjOQ6UjVCj4rrzQu2P9rb/kCeaRbxdt
8GEYBX77rBAp0qyFSUd/P31GS1Cg4cZCmXbmG/BInHdzm+qkqDq/eyjP+zxu8IP2
LGdunyeZIXyYdDSyRpJ4PDlYYv24KL9HW6Q2/V4cK1yi8XqyOELN6pkjo15E68s0
QaR+hmX84SFljcl+ItntXOPd36xWFhAcZW/D8gDmsv/aVPAy3NA=
=wY+E
-----END PGP SIGNATURE-----

--YimZdHnPO4eatOG0--
