Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A31502730EA
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 19:36:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwBSN14mXzDqhm
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 03:36:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=UnVXTznx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=tvmXnUMj; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwBP93YyzzDqVv
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 03:33:32 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 305BA5C0238
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 13:33:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 21 Sep 2020 13:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=qheuTMPaJjj6PZ4aesg1+i0e9yzbYXgnx8p+DDGQk+A=; b=UnVXTznx
 NT3ttJARDqR08zhwS5J+JIfnREZXi+oMH5rFKbBv9oE/SkWr3nJFrMmo76w8BWcz
 zWFMJRUFfuE0tVVFFdn52+MlieC8j432I9yCykFbpguBVFOH8CFp4iTy1OlERVEd
 GQzxEM1fp8kSSTqTLcGsH+pnLnHCqRJKL504m+cI05FC2pMnIhTpDmRdI4Lzwx6+
 PuqNOdJjoW8LO1fjH0gb03AGEtAUWI5yEskGPZBU7TR60mLAfdGwin5Rf9ZAyGW6
 qR6svDJG8iuGth/BltDmednPc6dafscRehiWzoiIW37bSGdMLLQVFdzB5XIfmAQY
 Z1UtsjaBH6Ho4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=qheuTMPaJjj6PZ4aesg1+i0e9yzbY
 Xgnx8p+DDGQk+A=; b=tvmXnUMjVOAgwro5w2lOu6GAn+f2ivJuV1kirGlyPAvKv
 aypRPfmPQHEk+0/0GiIoyyuh/+U8aJ7aavLz6NmLsA2eS5acZgHQsPWd48vQnriQ
 z2ujLgXgb7JX+4k+egB+LujzEh2LJ49H8FvZhsadVNorOmLE7I1TopirMP4datAP
 8ApuzlkpFtQqcaUyJ1/bQeEAa5M+AKnFnhWNn6aEnt3PZYRuE2Tc+UgxKuHYGke9
 y+M/kc0JdxrV1BEoCQ/WEbe0TVHHQiQpZH8s1IvINyGuusxUa36cYXXY76vfuZuV
 Z00xUOgr0WbjFkJLRhdb2Zf3hw8OaiqQhB2KKuRYw==
X-ME-Sender: <xms:5-NoX0ZAwJZGALT2UAt4hqjJm0U48Skui-PH2l-qWM5llvcrv7IePw>
 <xme:5-NoX_ZdGCbErx-Xs1BrhzkZhdXLVwi7wukZZIavFTMEMW3pZBjqZqHHJqzF954Yx
 EkFPhg2i_qFsPmiwvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepfedtffevgfegleelheetleekgfehudfh
 jeefgeegieefuddthedvtefhheevhedvnecuffhomhgrihhnpehophgvnhgsmhgtqdhprh
 hojhgvtghtrdighiiinecukfhppedutdejrdelvddrheekrddvvdeknecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:5-NoX-9d8wa4EQaE0BFPWemMVE8f_h8dHkom-RroHOjLkRtF0dp1Jw>
 <xmx:5-NoX-okO7vOgW_rQUZALd7Oddp0ZktgzXz8NRU_6ZZiLX1fnFf64A>
 <xmx:5-NoX_q3VAsdQ84zjekUhMrvJBWGGyQZILjGn__6D2QWn24jUNwqIA>
 <xmx:6ONoX80tIidBTwutyoqLRJRh8I5MEVmUy9KY3jkAwcXUGTwQf3rW1g>
Received: from localhost (mobile-107-92-58-228.mycingular.net [107.92.58.228])
 by mail.messagingengine.com (Postfix) with ESMTPA id 99D0E3280059
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 13:33:27 -0400 (EDT)
Date: Mon, 21 Sep 2020 12:33:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: xyz.openbmc_project.Sensor.Value units
Message-ID: <20200921173326.GK6152@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tKtFalx5NIx0HZ72"
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


--tKtFalx5NIx0HZ72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Currently all xyz.openbmc_project.Sensor.Value's have metric units.
There is a proposed commit [1] to add a non-metric unit.  Are there any
opinions on this subject?

In this case the proposal is to add an "airflow" unit, in CFMs (cubit
feet per minute).  An equivalent metric unit would be L/s (liters per
second).  CFM tends to be the standard unit to measure airflow from a
fan, but L/s is used for liquid cooling.

Options:

    * Allow CFM for airflow.
        - CFM is the "industry standard" measurement for fans.

    * Require Sensors.Value to use L/s instead.
        - All units will continue to be metric.  Any external interface
          which is expecting a non-metric unit can do the conversion at
          that point.

        - We won't have duplicate Units defined for similar concepts
          (air vs liquid flow in this case).

Thus, it seems like there are two underlying questions to resolve:

    * Do we require only metric unit or do we allow non-metric?
    * Do we allow duplicate unit definitions for the same concept (ex. flow=
)?


1. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/=
36573

--=20
Patrick Williams

--tKtFalx5NIx0HZ72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9o4+QACgkQqwNHzC0A
wRmUXw/9GN7b0CuuJPwH4v9csljueLqZ6WA20wyrUinoNxqWLHfcCZHnuOdCrjK6
2IxQKF9BkaKfQvxrCSR520uC2lqyNJBxFZbL8VXu6v44bH4blgmFH+mNnEKG4spo
m7lT/L+ZRG9H25snZyZfbdyewqYNmqRpXOAUE2nH3+mqUWGEFrfaoXrKi+7Oes0f
3Ebqqw4v0Q2ovQE5DbQIA0ctEMssH3NrCAa51eZYRW504Q83DDGk683QQ5zISSgL
EBWki2teH/cpPcHA2vAntFk08nEozhWUR4H8GgF8oQlCEayfYEBK739ybLj5ytgk
dqJ00Nk6RIP22l77moEss3tJAZonZGd0PeofeLlIQk2q5lcUPprWo4ulJIVHBpbR
QHvTCxQzBY31nXPhpjeuKSpVrZCAdfogt6PdYCaxLKs3J6/C+wObYelE3fbB/bKZ
LMWOXfjdQ0mWCeTbizkB265JWT5fWHsQiKl/cLPhFQo+RpTPvDP/VHquA00thA2D
D1NCZiFiRLaUa3eppNFljoLqN7K4WovInike6FZU4kXW3KAKcz3zOlsJXVEueJbv
fC2d2qcXKuQPzJf6BKvJ6CiTqU4ynKjTbAxYvBuA7I+hxgn6/vplFm8dg6vmHOQa
hphj0Ok1+XTruEWNjnedilLnTahhR3sCjOTrkmohyXnSChPpqpg=
=UnBA
-----END PGP SIGNATURE-----

--tKtFalx5NIx0HZ72--
