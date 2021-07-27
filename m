Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BBF3D7F30
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 22:24:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ7Z11BnMz3bWB
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 06:24:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=Dto3I+Zx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=r+yJBn/p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=Dto3I+Zx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=r+yJBn/p; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ7Yf1C6bz2ydJ
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jul 2021 06:24:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C2740320090E
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 16:24:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 27 Jul 2021 16:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=+wN0yI6gnPk05HHyD7zsx8RhLbQ9q8IPcD1HObteYKQ=; b=Dto3I+Zx
 3NZ4lD8w8gPEf8lDTHsdf7LbPGtToqa+KN9rKS8lNIXu1lDW95H1D4bOw4ypJTVI
 /vcvsBWefZ/mhumCx8a1K+Ngy7F2XEsToEzNfWIWg8GC3iYW3YV//ApX4Z1U7n7G
 Zhpiio/a1SUgZsbKqk1o4eub5XyxS4qkzlmDXHa1RTvO7zgRKv3wa2bDPgVh74G5
 teksxWqZI0B4Askh+UFy9DT9RBxthQKUiGdQ//Gi8rJ3UGgpPzF8Ib/8IIySmRW5
 eOB66cU5GC9xGc5BqTgyHzMGVP3zN10LTegC8wE0qeWuBywGGYEEad6O3hbEIZrJ
 zGrMWsiAXkNJgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=+wN0yI6gnPk05HHyD7zsx8RhLbQ9q
 8IPcD1HObteYKQ=; b=r+yJBn/pLhKguV9Th1cBPA3Rkz6rgw2gLQnpTl8ReVqoP
 uQtPjy+jZNv6k3QUYeW/WuAS1YAbegX2tuYjT9Um0GvbWDwUV6bzIQ+6CHXB/KrS
 0vu0qNbYl2uFrkSZVukEh2Q0Po3qqB3PKlV5BK+NdUiIErwS+xhy/jBzCly7cofw
 PLdJUf0eYvhiRWtRS6fk0n2+tQqMot674MwPJkKiY4qSyytqhx4NiQHBj4a4rzZV
 n7GAhug6Mmj19kIJKe/XuccMJFcCyFWn+aFh402p752bz7Rf40BM/ytSBhKvNtHY
 vPifFT6DejGlatMGiPkmtdugEbI6aqbb9jQNBawkA==
X-ME-Sender: <xms:cGsAYWYjg0PloyQkDyvgNUwy5Dmp8MS1wBD1O_eRf98uZlBZCuy33A>
 <xme:cGsAYZbSoe4CZ3IBQJjBlc1F4VY9qoepP6kXW_vB4_N4U5ELaNdX5_79I1jVJQZOB
 E8qp3hYYaN5LsnRbjA>
X-ME-Received: <xmr:cGsAYQ_GwSsDQkL7z7OPuHbH0b3r6GU4UnSreML1B7gxNQKMcuH7LLtUQ_1VUwrWVEPKF7vNU229I_IVH1EThC0ymHiDezbssWN7-kSIrEx3hA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeejgddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepfedtffevgfegleelheetleekgfehudfh
 jeefgeegieefuddthedvtefhheevhedvnecuffhomhgrihhnpehophgvnhgsmhgtqdhprh
 hojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:cGsAYYo6KpaO3T05cfpkeebf-wMMpRiPtbR62YacI9bQchjH4DL3Hg>
 <xmx:cGsAYRqtDsD8LDSM-8zsxeReI-kgdi8HOoNdWSbdFC63Wu5n5vV5Gg>
 <xmx:cGsAYWSso5aHKRyvnyt7U6wy9nV2qks8yrkDANWR3Xv_G6_hR0HkVA>
 <xmx:cGsAYTGCGU7I1c3sh4pOX7dpqOKC2eN6LsoIesitkQ-Z68_zjtBhVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 16:24:15 -0400 (EDT)
Date: Tue, 27 Jul 2021 15:24:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: `phosphor-logging` APIs (RFC)
Message-ID: <YQBrbuQFz4JihBAE@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4V/J/CuypNMHDHWR"
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


--4V/J/CuypNMHDHWR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

There have been discussions before on this mailing list about the APIs pres=
ent
in phosphor-logging and some of the shortcomings they have.  I've implement=
ed a
new API, inside phosphor-logging, that I think resolves the issues discussed
here and in some offline forums.

If you have an interest in the logging APIs, I would appreciate any feedbac=
k you
may have.  If there are additional issues with the APIs that I might have
missed, please feel free to let me know and I'll see what can be done about
resolving them.

lg2: introduce motivation and API
    https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/45310
lg2: initial implementation of C++20 structured logging
    https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/45311

The main highlights of what I attempted to fix are:
    - Verbose and clumsy API for previous `logging::log`.
    - Poor compile-time identification of certain (common) issues.
    - Source location data is invalid (issue openbmc/openbmc#2207).
    - Useful data is missing from `journalctl` resulting in people working
      around it by generating strings with `fmt` et.al.
    - No logging present when running on a TTY.

--=20
Patrick Williams

--4V/J/CuypNMHDHWR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEAa2wACgkQqwNHzC0A
wRnuNRAAlx5L+fBpBN5m9ppqyvdLU9dLeETIhkrvcLeDxw9fVvYU5nOPMlwxqBU7
jAnJ9bVYdX+GvxqT3f70yfJrb5isLK8Mh+H8wko0JtIfsLX+Q7lza4JDi6y6wSIZ
0MPD7Gl+EUxGBsMVdjvbwCyW4yXnyo453yMf3N6Fuyg7UgJkVfGb8TBMTtBPpmcD
vsOVwjUdzsh5ffqQLqZGXDf8C4ZobwjwG09oVRmLd8zYypbpQmVU+VB+l8V+QVHA
PkOCyhOIJu+o2W2KnUV8jTbhUUiVu06+TZibKi+YjqaeHxRLM/OEDrAyFHqDGhvr
UbkvWrvbNU4wOEOTVEsa7JbmBLFe/7ioyv9oxk+PKEvidIQMHHodrLfrBq5qTgO0
lrbxayfIqO0asagfELXPX6TlPsRc4sSYZy/fl2hIwj4bsOg9eKOtH68ShAk3Kai5
fGHIRBTXEGcXjPsoGz3+0z1RX6Xl6CJ+/S/exSPIeuCJjQnu7K3wjeoSlszyhILJ
+5hvKTcB/DfobM9NWvyHEX+2i5xxswTftZCicMeIj6E8Em5xST/I88SrhFTZevNm
KcAhOTlF2C9hXURnzjVHrUazBr2HshPXD6mAlU3Pu8m3p7C6E3YF2VP6ZjyIic0L
/4MqsbwI1lxjf4ukZVl15QavbYHxmsltYVw9xwjbmubDsEL4fGU=
=VDdT
-----END PGP SIGNATURE-----

--4V/J/CuypNMHDHWR--
