Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16253755DC
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 16:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbbxN4XYSz309X
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 00:46:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=G/yzzW3m;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=UMlFul2G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=G/yzzW3m; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UMlFul2G; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbbx00mGBz301J
 for <openbmc@lists.ozlabs.org>; Fri,  7 May 2021 00:45:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DC7925C0158
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 10:45:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 06 May 2021 10:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm1; bh=fuTF09IKrxlQcPcVjgRI9NbLoCT2XttsBjP3cl9wIZ0=; b=G/yzzW3m
 HEjqi6HjqSz9o8D2DmHj0tzFeqU9omllx83wP0POOiQ4QEG+wb+5O7+lHKR+N6Pg
 vzDH6jxZ886puMc35B/i6cAcuL5Dlisx/VddvKIXWCZq46GSrofmXuvNVu4SfQcX
 R09PRCxDleZlz9yDQV7znmAoK7NH0fslYO+P7EtHtvAXI+a6X/kmS70+kBVtnG2O
 oV4CerUa2exlbSVaCQB/zL8vHC0bGOxVdWCDnd8PDwk7DUgyRm4v2UyLT+F5XBLT
 BmY7ugJCZJMHViH3Elz30q/iRXqgSFdx8oFuGFAH9Xkbdh/i96p4GvOzJAlnM5ap
 1ixV5Z0QXh0QkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=fuTF09IKrxlQcPcVjgRI9NbLoCT2X
 ttsBjP3cl9wIZ0=; b=UMlFul2G12YNnHYgtpyWOeyAN5eKAJqWBD9ooe32RwEui
 fjQo1ppwickXpBgHEYZYi2cucW7RrOYQ/QPL19pw/M2YeCVwHVkfLodK2VKUE/hR
 1aL+u/SkOOP3jOlA7V0YNBxiNJQ7sBQkEFB1MEJt+wtiKhX0SFFuLu9z7eskH9pU
 pVCEQ2WdJmh2zVs6Wkf8rjnDNuUh7VuSOvHb9xjmYAau2vdFgfD7/SSQ+8f0lSTI
 tmSiV7fxRhft3RYe3RUN8aTTEJBlxMWREYd4YP6lb+ROdMsyDA7JeZzWmkEAsXhv
 /jNENWs9/XfmkGA5CLkqfsS2Bu0xduhMetOVsXnqw==
X-ME-Sender: <xms:HQGUYDux4sKoJSfwlNUCpWcAq_LFCWV1MzKEFqCZ2GzLrW4sNmxdGQ>
 <xme:HQGUYEeUGnpS1vTXRwDM5xJnyosxOfnziOLw8jPXYEI57e00fa91NveqX5g1HoZ7P
 sufDrKrdCKHMkXM4-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepfedtffevgfegleelheetleekgfehudfh
 jeefgeegieefuddthedvtefhheevhedvnecuffhomhgrihhnpehophgvnhgsmhgtqdhprh
 hojhgvtghtrdighiiinecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:HQGUYGxEXRl5P38b4vxoTGUCKb1tXUYuQs9K-4Smp7LeeuM6NWnZSw>
 <xmx:HQGUYCOWopixJHBMYkcRe4G45iccSks9F0USS6OBXDz_Axx1GNQp5g>
 <xmx:HQGUYD8jpQ7Juz90bbLPt64BbxI236A_4H0E8HNe7wWGp8NooCCEFQ>
 <xmx:HQGUYGLoI7rfe08D7FeHttzYPHcV2QAWYy3q2jsGPE_roz0LHRg8lg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 10:45:48 -0400 (EDT)
Date: Thu, 6 May 2021 09:45:47 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: CI upgrade to clang-12.
Message-ID: <YJQBG5s+M2bgYBaC@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Giz3i4Yt3+esdLB4"
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


--Giz3i4Yt3+esdLB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I'm merging a commit to upgrade the CI scripts to clang-12.  The main
way this may impact you is that it means we are upgrading the tools
like clang-format and clang-tidy.  Usually there are subtle formatting
changes between clang-format versions and CI will flag those. =20

Note: It is possible that you could see formatting errors from code
already in repositories, which will need a small commit to fix up the
inconsistencies introduced by clang-12.

Commit for reference:
* https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/42434

--=20
Patrick Williams

--Giz3i4Yt3+esdLB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCUARkACgkQqwNHzC0A
wRm/pg//QhghuG3vyObZ16MY3GCALYJIzTeyEk8g5HJak0GO9cdIO9/yFO3H++ie
y5dQafmXOB5+Idw1ddRQf3pHrEfYhdtEE4xVBNolBDM8eawnoGpNLn0xbGJjEfpl
bXJYsipYB6HjX3dJJWQKon+e+xv9ziJVLY4/XkEnINqVlXFAiMdWVy8BXJvlDm41
yT3FWsvkTMHVuwwHzR0UkVVmdc59ILlflbaeNIh5r+y8OmsjqfQIoY60catfLJwS
h5+YB0lnwCy2tCeppSEXV3iGG7+AcUCcGkVbZVOsFJ6Qnmmm/4P5lxnk9BbuhM12
xk6mWfIkEOIZNkLzCWZT6rUd8P3/pzFOU/u2INP2rXM6vFpSUGJSgxCnQ2vJqFgF
3B5K1YKnzJJI3RUjoBt4E2srWmOlgLVBSSsRfdytkfdsByt8un3F4JUS7TE9wdwk
NkXD6tB3Lb7qXy9e4gqRM+XCViceUCBmyAPse3EjNL6sn3UpHUN05JGzxNZJrroa
h5T2eStanCH9HIthuQRhywPOObvn1YQeCTU69oVUMmFPJ3ZfPv57V2G5SHs5lBO9
yplKdqsmMYPRqTuqaGSKn/elJOvSCDGzoHukWw/hXzaABOaTqjvJhDr5CBQ6sFgA
L8py3BqvPhOT3S0DxXehlwi3NQvvDkKsEVTAoRYanVohSmls4ks=
=ixZy
-----END PGP SIGNATURE-----

--Giz3i4Yt3+esdLB4--
