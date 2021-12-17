Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B519F478C0E
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 14:13:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFqDV4khjz3cBq
	for <lists+openbmc@lfdr.de>; Sat, 18 Dec 2021 00:13:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=inAsOBon;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BZjnXSpA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=inAsOBon; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BZjnXSpA; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFqD36PDWz2ynV
 for <openbmc@lists.ozlabs.org>; Sat, 18 Dec 2021 00:13:07 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id F0EDC5C01A5;
 Fri, 17 Dec 2021 08:13:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 17 Dec 2021 08:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=uwDUCG3QUXCNFtC8QII3Ebc596s
 SG+IMw6q0N3uw+lw=; b=inAsOBonVmLHE3FCGrMqNLU0On6mkUb5LNqHu19yLtv
 6a6T4+lNzrZT3AB0BIzAkGrCKy/TTxW6TB6I7BKU/6CZRaoTcB1wdjla2XEugPZr
 K7AvIGRPO6UyD2wY8U+bT6yJqMcL2rx5JDVkJ9WvJdgNblAa5pa7rp/mEQrOxyCm
 cm+/1YKExuL3MQ8nYJu8PULY4/u7KpVBhbmdZ+oXbdMS504dVG5eaRCDKK+ucWEh
 1n1dlv5VltvbNWcJecluNoYu7WLrjuObkyGQnSNA/N0QSvBgxsBh/FliRQV7HEK/
 jEQKFvrkaiXZ7JWuonpSdrXY6+e2iK5ya6RwLc8z46g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uwDUCG
 3QUXCNFtC8QII3Ebc596sSG+IMw6q0N3uw+lw=; b=BZjnXSpARP6iKmt2x6a/Ya
 ps8Pc9MDhEKYVNoxs9RABbCCO2F7YRxvQlnq9Ha1rOc7Whzq6VP3zz0CEkHYE1el
 tiYGkuQW/W1K5S4s5vq2R/j5xvn+GMT+Xp3rXBnsxqnEVBxZDnWkdatrKutF1DHI
 iv00uYDck9CmdeEORuOin//s+6vw0X2jsNgq7omj+TwaM8RaJezj1STpp/1v6O5c
 Of/ORPntB4qSp8w/Q+DXyoz282R/8KW2Hq1Gp+JCbSpikzTDWiqjtDHIHCxLGnwk
 GbuNHJ+RThFSA+DUv56OiSKanKhMn8ZCG13i7VDgFmCtE9HTmQT27gSWMFWFU4bw
 ==
X-ME-Sender: <xms:4Yy8YYPmwil3hBpXb_w648XS8BQoxSpRLkv6modRhc0OqwK9uqUU4A>
 <xme:4Yy8Ye_zz0XmdWXgWm9ILTwKO3SJ9pwSoUA9eKeimiSk66Fw_x36JNoLfLpY5YnID
 lV42qzaFD4yTdJeVIs>
X-ME-Received: <xmr:4Yy8YfTuZ6g_YSAniQANv2CsTuI1w9qiZ2LkcmL1mYgabwwlEJ6XkBT-9nCV5Z72Z-U5AILBwZr4yO7IdBkv6u4wrkudlkdJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 egheehfeffgeekveehtdfhgfduhfegfefgtdehhfektdelffevkefgueffhedtieenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
 hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:4Yy8YQtiwzqNMVDCLmArNTPtS1rfm7QaYzV3nQLW3iq8ASl9WaZ3UQ>
 <xmx:4Yy8YQdlrrf6vDNBQQ9Crtlo3Ji3PsqM3P398IVP36y3jb-IMO_iGg>
 <xmx:4Yy8YU3qX5nDCJWFQo3sSY0TXzHaKyn48cMwVatyVFTQPT66wGjE7A>
 <xmx:4Yy8YYl2YIDI6hET_4s8an08ypODLolKH5nvmV778Ll4x045LauvBw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:13:05 -0500 (EST)
Date: Fri, 17 Dec 2021 07:13:04 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Kun Zhao <zkxz@hotmail.com>
Subject: Re: Any cmdline tools to modify DBus
Message-ID: <YbyM4NqhGKEDFDii@heinlein>
References: <SJ0PR14MB48051F038B0094EDF6662CCDDC6A9@SJ0PR14MB4805.namprd14.prod.outlook.com>
 <YauoG2/JyAeyqT1z@heinlein>
 <SJ0PR14MB4805E542324051E7A3E55BFADC6F9@SJ0PR14MB4805.namprd14.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cmvSqdyfAuIwF+Zp"
Content-Disposition: inline
In-Reply-To: <SJ0PR14MB4805E542324051E7A3E55BFADC6F9@SJ0PR14MB4805.namprd14.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cmvSqdyfAuIwF+Zp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 07:33:19AM +0000, Kun Zhao wrote:
> Thanks Patrick. Any plan to implement those?

Like anything in an open source project, it'll get done when it gets done. =
 If
you want to contribute code in that area, please let me know and I can poin=
t you
in the right direction.

--=20
Patrick Williams

--cmvSqdyfAuIwF+Zp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG8jOAACgkQqwNHzC0A
wRmgfQ/+IAbQFF/u3fdkYP8HYRcON0GlrMXpIDPVaeat+6iXYTZOYoKeJXxyM+5v
27KE1whk1BtzQ/rfFDuL4ucUFDwYXoL9TqOT2IfIjEjRgfMzbh5DVvwo9Tu//t/c
S7PBKNKzdrN0emajz9ItuYvZ2iR4QPxQ87200hk3My8xU8/Sw+I/TBo0GU4m5LwW
lZljQ5ujVrMc2iCx8yCWbcTKoCbNSrKrrOH+qqabMEo3XsQWcB3mr+8TVpqW7JBE
M7yxURUpZTOsf2/HWvpikhcecBNW1lGMK3euTbJJxiM6glwdXSzr5VZGAjGmbh/r
v3OeRaav1LVcY17UT7SI7+C69rp8ZM/ylph3tqGGM4NeJ4pURYQrg9IvRKrNjQFE
rqVRx0uD7u55+GztFymbeeM1TfJIzMR93kxjP5xHhbkVvjyXATEkbawyRnSxQwql
ipI6dYIlhbUZPuLABeq+uZ/GAOOMo5i5vvNHLBNWm4LfJ7+2qkTCQ27CfGxBYmNM
2HN7x67kj2DCuqljrJ9u5IldSF6CRv6EsT+7LYpJnuJOa4VcydQGF77ne6AzFD65
ezH4k80EALkFT5UI1KcfR2/88/B6pHZckVpw6vcqghTXnSdVzmViFRknxFDcJZ80
RbDpYMpF5QYgmRM2QJ6zMRERX57Bn2Phg9HOg0OQk9NhP0O932w=
=NnN+
-----END PGP SIGNATURE-----

--cmvSqdyfAuIwF+Zp--
