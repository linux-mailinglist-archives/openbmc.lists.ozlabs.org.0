Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDAE444B46
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 00:10:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl2Yg0VPSz2yJv
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 10:10:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=AuPjmGzB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Z7C25Y7Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=AuPjmGzB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Z7C25Y7Y; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl2YD3Jfbz2xCy
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 10:10:07 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 23EF15C01F4
 for <openbmc@lists.ozlabs.org>; Wed,  3 Nov 2021 19:10:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 03 Nov 2021 19:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=y8q1qPWog/e/mc+xOFDBHGIPjQo
 msyl4+PbPyMwO6SU=; b=AuPjmGzBMtHFqAIWUdN6ePXmMNEC42+NuRrSzrj8Wzk
 o8RFfHhrEN3CqRwEEW3yKOABDflnz5iK6vaefVmdD4RUM4auZtCOSLV7JIyjX79o
 tU8ew5EbPLUgteJTTQ2+niP8bOKS1vaRrwLBabCF/tIH8u+hBIPxQVxQtpgUa2b4
 CRtBjhBH18w/wFXKDtJd0eZ25vpg+bS9XolcWWRt1kUHwWB0o9/2zSkdfX8BfZVx
 47Ob6xpncmfvng1ow1iXUvHibbm6Y3A/lGbpamWfeSv7/fzyDrCeUqbawNrseuIt
 PfDQMIKdAburcyZkI8l8CppYpxT/4p6bzsXyqHDB3YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=y8q1qP
 Wog/e/mc+xOFDBHGIPjQomsyl4+PbPyMwO6SU=; b=Z7C25Y7Yp02QP87L+qK8E9
 8/cdpjQuGm5Jn50OmvXqm8ZRv0HEKI3rZXeIHSJ4XYT+/LHky0/Z8vkw1DMxeMC9
 0LQpKLCiVc2+BYJhZey+Gw6bJ12es5ePGwTOj6HRe2pSdx6CWdlpkqFlDXKvqBMo
 oaDoxMmdCQ0/YbKhJtte2MWu9ObCy3UcKE1PUJl54ZveKXiGyWcFL+1JgE82r/bR
 l4Gou2tA3aQsGzjdbpbZgkQAaCEKLKpIBEJQ/QuFICHfIol+0qSserMPH6pICx5C
 xj5C0GkJd8q4vpUEZw+eiz7owmCuVbYszn/pM/Burhn9ESpwfo9GK48Pz7P98o/g
 ==
X-ME-Sender: <xms:zBaDYf4L6adOCGMmSXTRZwCcr_9uTRAjPKs5SN5GqKoYv_C1-z-VvQ>
 <xme:zBaDYU5rHnkgZKE7BWGC9VSn8BKGGsLuUHNcpLbZabxWmZ1tTzL3RuTlBHO2zZrmK
 iec5ByD4FEXXg7FfSA>
X-ME-Received: <xmr:zBaDYWccpG30ci4pPfPIak8iIlcJLZtiqco3oVfAvE6X4YRbDx4dIkSUYoYMfqxGgegiVZ7EmJpKnQZ-y3zW7tz3UOTvV3ZnAYAyYk42J6WdOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdefgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefiefgfeeigeelleeugeffgfevieeh
 jefhfefghfetgeffteegheefhfegteffgfenucffohhmrghinhepkhgvrhhnvghlrdhorh
 hgpdhgihhthhhusgdrtghomhdpohhpvghnsghmtgdqphhrohhjvggtthdrgiihiidpfhho
 rhhmrghtqdgtohguvgdrshhhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:zBaDYQIOPOaypBH8WDTh3cz9mnKgST3cLJRoog91VxVAHcf8C4OcvQ>
 <xmx:zBaDYTKHQ94DQmNun61Go-2EsrKU3qFl1P1skjPFZH6N5PwlRMcmEg>
 <xmx:zBaDYZwYNs1MEgFXiZeypXCGTUyNl6R__-5oETFSUw3wgdVWmCX1Og>
 <xmx:zRaDYel5m-V023wpMUNTHvQNR4YjSiovV46HgEswSo6eEiX_M02ZxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 3 Nov 2021 19:10:04 -0400 (EDT)
Date: Wed, 3 Nov 2021 18:10:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Additional linting in meta-layer repotest
Message-ID: <YYMWyuIBPaFNp8z9@heinlein>
References: <YXlpsDxZGsbvgHpQ@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f3LaPvPhcB2e7PTS"
Content-Disposition: inline
In-Reply-To: <YXlpsDxZGsbvgHpQ@heinlein>
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


--f3LaPvPhcB2e7PTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 10:01:04AM -0500, Patrick Williams wrote:
> Hello,
>=20
> Ed recently added a test-phase called 'repotest'[1,2] in the openbmc/open=
bmc
> repository that allows us to perform sanity checking on commits at that l=
evel
> beyond a simple "does this compile".  The initial checking he added was to
> ensure that no new patches are added to the tree (in violation of our met=
a-layer
> coding guidelines).
>=20
> I'm adding[3] additional capabilities to this script to enable linting in=
 the
> repository.  This will run `shellcheck` for shell scripts and `eslint` fo=
r JSON
> (Some might be unaware that Manoj added JSON linting with `eslint` as par=
t of
> our normal unit-test / formatting scripts[4] as well).  Once this is in p=
lace
> new commits will fail CI if they add new shellscripts that violate `shell=
check`
> rules or JSON with invalid parsing.
>=20
> Currently, there is quite an extensive list of 'exempted' scripts (~100) =
which
> already fail `shellcheck` rules.  It is quite likely that some of these a=
re
> real bugs, so I would strongly urge if you are the maintainer of one of t=
he
> meta-layers holding an 'exempted' script that you look over the `shellche=
ck`
> failures.  Hopefully over the next few months we will greatly reduce the =
number
> of scripts in this exemption list by cleaning up the issues.
>=20
> 1. https://lore.kernel.org/openbmc/CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfL=
hg37E5EG42EJg@mail.gmail.com/
> 2. https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/r=
un-repotest
> 3. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48349
> 4. https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/f=
ormat-code.sh#L31
> --=20
> Patrick Williams

This is now merged.

--=20
Patrick Williams

--f3LaPvPhcB2e7PTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGDFsgACgkQqwNHzC0A
wRl8Qw//XrJs85ESifvpNNfjlXrqXVKU4MwkbbzeBxhlN/JMVR2p0pKELRYACMNu
gdZhv/pXdf93cugaYYUEDKqUaK1zCdLpqapBsjJEbDtRiAT2BA9t+I6IfFQJeJIn
jIH2R5AKO8VM9ZKx4t7SUv0mkFW8lPxR6C69VVRMCKKeQXGt5iU1KzHGbviDDtNf
mBeYp8P5+6CXs7q0MrbkhRDLfPZO7ErMPZNJjnrbxxGGqXo9j1LZJitzE71C3jdN
Lf3gBO8vSpPIQGam+EmchdUsmjYAJ3TSYvpJTepXRDHFy37LPi8RtQM7HujKtt3S
8u43d03mbPICh7lVZUVy4OSzLLnupQinnBaYM3Qkwz1kKnHe1bQkaPL5FLla8l8X
UCON4/neBZkw3RYRlQLtQFoqT3YbyGkTxjhtCbhDEidFQI1IOEDJWYmUe5hCTDyk
fkEy5g2X6sKfhMyVJBqKWIFSDHN/NyoS6XuIx0Ewk5mvr1wD2BwqZMlGSYEYOjRz
P3CUM8K69RKfEh/zvfb+NjSI8rvDVzhkb3KqJWxYomoxT+0ZQi5VUNEd8ccerxcl
Cke0XlOsLwTphk0XI9lkff+8s9IN1acRfQsLn9yZuGco8UjpSoRrf0inmn3hgv/O
nRc7BKiLHWyp2xsgqWefKnVGwQoeras62QfQ2EfsC0ZLv+mCYBo=
=Pl85
-----END PGP SIGNATURE-----

--f3LaPvPhcB2e7PTS--
