Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F42256FDE0E
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 14:47:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGZYF6Z2dz3fNT
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 22:47:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=0ofe+QHH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JY7DY1Hc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=0ofe+QHH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JY7DY1Hc;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGZXZ2Y9mz3cjC
	for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 22:46:32 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 7E7F83200987
	for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 08:46:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 10 May 2023 08:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1683722785; x=1683809185; bh=zO6Kv97gWOoys8O3i2cUghiKR
	4NEhDhKynO/c0Q1OkA=; b=0ofe+QHHffeHyMmCCD170JDFf7uPFHXgI1Jzm6b1J
	JAc3H9kE/EES8Iiu46w+3WTEPfhRNt/BhAqLhqeSZcMPxPlwaJynL5UYbmH/Uq6m
	c0O2Y/ypTH/uFY9mshpfP+rvpknvLqw050qkNMK6FNmG95leZQ4bQ4/PgpKSywEW
	Quulad5xa40kGmKoxIyg64JDqOoUWyeLdqNwAfsIsT6uts3Bh5Ili5VBYRjC8Kxq
	C2Gwvwh9o90rcBHL05YG0JVcvlkPuj6SVGRMAl2je0Ch4MtUKCttTAbUYN5iemfV
	JbKXt+aqVQgGgoEe5G12+U9ieb8nboKv2uAD5jaJZECtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683722785; x=1683809185; bh=zO6Kv97gWOoys8O3i2cUghiKR4NEhDhKynO
	/c0Q1OkA=; b=JY7DY1HcsBdjVfMh1gyeVnwkqAmomOKidyvzmxxjQOZc2yx4iai
	RNiFhfvbJwhEnF2LeUcGk+Y/CYAY8K5rPH7xWJmAb7y7Q9Mbi6G0nsxns3D5wZLJ
	wkNKM1Kw+1DYA+ugEOnzHP7wapiAuEdnA5v+rNrhlvTn/7YdcHYpaIFD4BPMRfhp
	Ohb1WzNKNo0SRxjmPQTLKZVG91AAx1g4fbDDPt8iP1LSZU1Wn75xgQ6m5Bszht7S
	v9kl6/Xnq5khu/yVWBndpyPZyk35neO/wwXAdsR2W2/G0w5jzRqCLlubOmJSo8Nr
	CVzHp6h8l1b5flyi1f1dRspAwVrvqG071VA==
X-ME-Sender: <xms:IJJbZCGPWFISjCCGzoSQ3S9DQu2lhYoyaFfal8JBvcWUMOh462HtfA>
    <xme:IJJbZDWzrnhQIcCDZVjSo0NYBZHw5qYJr33ueJoZ3rFL3mqLmMXveBmTHr7jKqiAK
    xzd-fQ2_CyaY5mDH8g>
X-ME-Received: <xmr:IJJbZMJDoHnNu4yLbT1TIRORAkzv6NX-G9IrlhKpKUqJnPHd1DTPs1U_cLEzNqlzmikLiMFQGfR_ZhkAs_Nhi4uL5jQGvBDPAxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegiedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeelhfelhefghffggfeugfeitdevtdeg
    jeeufedtkeffhfeijedvhfetvdelgfdvnecuffhomhgrihhnpehophgvnhgsmhgtrdhorh
    hgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:IJJbZMGR2L2eyuu2MJaLlTiJoJfKqJZSLRLmS8id-wLjW2Okud4rZg>
    <xmx:IJJbZIU5WWBuWcI31inBheS7pRFALLbX43AE5rgaeBXMbN4qFkuUwQ>
    <xmx:IJJbZPOXLQ1hgQUPExYtMBzIhQEIRFE1UCE2W-2grd-iFNtybfYSvA>
    <xmx:IZJbZLA3QFFZOH9jo62hpOSfNiEBEn5bcSoUdKZi4SUh_DaKSxkGng>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 08:46:24 -0400 (EDT)
Date: Wed, 10 May 2023 07:46:23 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: clang-16 rollout
Message-ID: <ZFuSH0kBl3uOp2wg@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bzun4ZwZF46lf4Ra"
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


--Bzun4ZwZF46lf4Ra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

In a few moments I plan to merge the commit that updates our CI Docker
container from clang-15 to clang-16[1].  In my early investigation,
clang-format-16 does not format 100% identical to clang-15.  I've made a
few changes to our reference `.clang-format`[2] file that attempts to get
the results closer, but it is still not identical.  As a result, it is
quite likely that pushes to Gerrit will fail CI until the formatting is
adjusted.

I will also be pushing up to Gerrit under the 'reformat-clang-format-16'
topic[3] fixes across all repositories which:

    1. Copy the reference .clang-format from docs into the repository.
    2. Re-run clang-format on the repo.

We will need maintainers to merge these in order for CI to start passing
again.

It is also possible that clang-tidy-16 is stricter than clang-tidy-15
was.  I expect the commits in the above topic to pipe-clean this and
I'll keep an eye on CI failures to see if we need some tweaks to the
various repositories to keep clang-tidy appeased.

[1]: https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/62485
[2]: https://github.com/openbmc/docs/commit/231ad0cd23ad990f46218fc82e809ee=
9e65930c5
[3]: https://gerrit.openbmc.org/q/status:open+topic:reformat-clang-format-16

--=20
Patrick Williams

--Bzun4ZwZF46lf4Ra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRbkh0ACgkQqwNHzC0A
wRlZKg//U03QvOOuwLYwmQeFg1C4HtbVZe+XpYEuXgyymkMv+/ezvtJp69GruIgX
lQxMe+5zWbnyw/Gr7J8LQO2l9qaa+Iho3g5U2dQy1myvwCidCnlJT+diVk/lXMFZ
16eO567OjpAaLpUtGCZL9Pm3LkYukhLoTDxixiFDokYcnxhmDEml4eh3i4eWVmpp
qLE+H4EJCjOmNAaBuereOgdSwXXMPaJxMOwRZN5tO41Hg/1ziY3gyJLGZb1581IY
jHUKH3ZW+ryBjrqUiZSmpt6WWZSu6k6rtBr8fhOHLN/E8NdUab7x9hXeG4zrurrI
X7fgUUIKx8M9hJ0zICG2qs6HsWXwHzjpmSqRnTExqEc8HdpBwqvj39zxHeEhpIIR
f97GYS0JQvezaCtgTthWt6DHAYjt0QJmlWb43W70hJkLpT6adoBPB/rJarO3G6wN
XR2E6PBVp1ROSFv4HaIpIsPJqf2M9d3lq77v+gVJTYjPqpWdt34+86vgOSh8jInp
e3egCkLbIr14tmk7hJpwAk5c+hqgIY8zbvsT9qi2H8BbMeRDr68nnjnPGd07QgXA
zCh4KS1DLkbJvelUjkQ1AbbvjNrcqIhgpjfx9zJcYCX3bPOyqcuE2j2wtTZzO9KN
+fhsq7cKYVTVupu51D+rkCWw9kUnZQ8zHiRljS1chY6EDMqv0Sc=
=gt3d
-----END PGP SIGNATURE-----

--Bzun4ZwZF46lf4Ra--
