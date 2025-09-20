Return-Path: <openbmc+bounces-677-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4222B8D236
	for <lists+openbmc@lfdr.de>; Sun, 21 Sep 2025 01:17:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTldX69Ynz2ywC;
	Sun, 21 Sep 2025 09:17:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758410240;
	cv=none; b=bNsgWdY11LeJh9t6VbgnJgsEdbvSAOj2uHnAusIDm6ij4kDjz3BfiAiuiQki7jrqkaB5IErLvqLlukdXGVbEXozcpi1XIrpTSiWv9FPX1UNVvcSWeO+nqcnRkfFJMWrTVrLoqU1S/iZ7Oe4ApfEY5gFIHLWnZ7FfatK0t8Q/v3pqxtNoGGE5nTw6wQfxLSRSXaGYl2HZ377thjAY16fF/COXfbeaHuGry3jZrH4qkGp5TzTi2BZvf236PfnqXQYWfGzoDQgngqHMe/DhX04Jt1IC4FZl3jARCZcsnNQqmNaO96SyEhvI7nYb5Oftysf0CFvh9zd63OTnBB+/dnbrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758410240; c=relaxed/relaxed;
	bh=DbtFS64mBX69Xh8PtKz0KVGQVxiK+NJkKtQcbFTYmQI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwYE9amm8c4A3/Fq8Ld1Sb36lncWem9S0Za1uzpHN8MKCMz8jY/6YgTZIHJapksLEud93c9cGvc3Mmv1rHYQc9QP4ZRFO6v0SVVthCWIorbGvu61LL5doW1K+7tjKjSoYEERKxRvFaotnoTxDuzGzjbDQBYvbQ8ASkb0c4mkFBfeCP2sxJ7yGD3CYKzuohV/q8mCwPhBdr3m71/WsYPeDmBC+/5zRoZnzdCt8bevY4IcS7W87dIfc7u7S8UzaSNvvWaAM7vXC88fmQqLv8xGbOs60YqnrhxuMpk2aXHYTjeNM8nNt530MRKAGSs+EN5ZNhpR7ddxPVgwvnWcj9/RTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=bmfzn8P9; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YDCwJ+8k; dkim-atps=neutral; spf=pass (client-ip=202.12.124.158; helo=fhigh-b7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=bmfzn8P9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YDCwJ+8k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.158; helo=fhigh-b7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTldV3hpDz2yw7
	for <openbmc@lists.ozlabs.org>; Sun, 21 Sep 2025 09:17:17 +1000 (AEST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8FED37A0093
	for <openbmc@lists.ozlabs.org>; Sat, 20 Sep 2025 19:17:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sat, 20 Sep 2025 19:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758410234; x=1758496634; bh=DbtFS64mBX
	69Xh8PtKz0KVGQVxiK+NJkKtQcbFTYmQI=; b=bmfzn8P9p43xqEShX+3WMoVge6
	s/jfRrteOCFJfv3bAG1H5kOTKYvtles/qkqbnBBCD1ezWNla+Mz8dMXTBOU8IJcA
	z/+5cMEgMiMKxiZ49RrrFs5rc9s8hAgr9KdWwEV6SIx9JIlMUAsPWITSOk2l+rpv
	PAgMpJvQhMouZmwNX5YK/ub6+EpAXphVYhiLOo+BgbPRUJOqtld8JGeITygYT4v0
	DHVeCfm6eGl0s+oCvb5aP+JrZWHWw0MM/n/kAwWESGIMpVwqBUIlRoeyLDY6PedW
	ftdOIKG1JW/ezH5Imikz5sfXROr4Jmo0SHbvtquxG6LGn+uey+TULRQd5crw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758410234; x=1758496634; bh=DbtFS64mBX69Xh8PtKz0KVGQVxiK+NJkKtQ
	cbFTYmQI=; b=YDCwJ+8kVisQx8UarbxjB7nQYHaZjOfAFEO8JkUOjcd9guD81vo
	o8In4XlOiFu0aqasbtJ8QTPI6WngNKAqIrGUuTqaEEviYyA9crtDeqtk7WFX9VTz
	vdfDR1BEmwKTYOpT6FHsGaYc9kEt7ZoZ8RHfvEDocayaOWNuxdWIBO9RJucckcZK
	Ac8QTL2j1S5bDB6H7koDqABRnPjzXrS9ot6S5zbubQxVjBuPaLAIzb74qhsTCqQu
	4F6vFMYgoHNZf6MclFS3ez7crLyqPKrjUq1yBUjAe6jPKBaMeeOlh4VUR6TDSgC9
	FjoMjq+yRCh2RGJSQ80hZOeW9eRcOHnOSnA==
X-ME-Sender: <xms:-TXPaPrcfuVIXUTvJuJVJabHcHq_qY3bgbHpwIwhPKmGTP5UegOqFA>
    <xme:-TXPaLodJ7Dsv53YF0ahAsgEzQuz6MvQp3MlbLkP0HZX0YRqtYGf-uIcNFU7vWOEz
    hV6h40cA5dceGF34Hk>
X-ME-Received: <xmr:-TXPaFlFSkEgfWzuFiBxQiY7Q9NyhVDH-A0og9eW5VqGSU60rA8qLZrHncc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehfeeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlh
    cuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecu
    hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
    igrdighiiiqeenucggtffrrghtthgvrhhnpeekveeggefffffhtdekfeekfedugeehueel
    heehgedvhfdtueetveevvefgjeffueenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hmvghmsggvrhhshhhiphdqrghnugdqvhhothhinhhgrdhmugenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrd
    ighiiipdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:-TXPaFFyHkTXxAewibqg_KDJWdGLDe7gaG0Ctz_tUJtkhqK-7d2tpA>
    <xmx:-TXPaGpfAr6cyWTz0c3ELiyF_v1PVMAqyyVsRh1IN5RhbMZZQxhtig>
    <xmx:-TXPaJ7lcvnA9qd2NNt-40BDEWiwm0Tu9Fj67qQBh2DWE9DPfEgWDw>
    <xmx:-TXPaM5Xc_q77AZ1WpgE0zuZjBmrqygzGGTUsSdKV_HvE5ATprE3Pg>
    <xmx:-jXPaNH5Mm7j9lwQFwQnfYtND8S6dQOJ5G9TBNsVWOLWaRCe4bFvijDL>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Sat, 20 Sep 2025 19:17:13 -0400 (EDT)
Date: Sat, 20 Sep 2025 19:17:12 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2025H2
Message-ID: <aM81-Pc2kcBs6oCU@heinlein>
References: <aKOKlY97pOtfuaEv@heinlein>
 <aLek2wDSYDGMLPH6@heinlein>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kyjFHpmVcM+yJkKB"
Content-Disposition: inline
In-Reply-To: <aLek2wDSYDGMLPH6@heinlein>
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--kyjFHpmVcM+yJkKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you to those that participated in the election.  The following
candidates have been elected for a one year term on the TOF starting
October 1st[1]:

    * edtanous:         Ed Tanous
    * geissonator:      Andrew Geissler
    * manojkiraneda:    ManojKiran Eda

The election results can be verified by running the following inside
the openbmc/tof-election repository: `tally --election 2025H2`

The important elements of the tools output are captured below.

```
Election for Seat 1
Round 1
Votes this round: {'dkodihal': 11, 'edtanous': 8, 'geissonator': 25, 'manoj=
kiraneda': 13}
Rejected edtanous from the next round.
Round 2
Votes this round: {'dkodihal': 16, 'geissonator': 28, 'manojkiraneda': 13}
Rejected manojkiraneda from the next round.
Round 3
Votes this round: {'dkodihal': 17, 'geissonator': 40}
Elected geissonator
Election for Seat 2
Round 1
Votes this round: {'dkodihal': 11, 'edtanous': 18, 'manojkiraneda': 28}
Rejected dkodihal from the next round.
Round 2
Votes this round: {'edtanous': 29, 'manojkiraneda': 28}
Elected edtanous
Election for Seat 3
Round 1
Votes this round: {'dkodihal': 17, 'manojkiraneda': 40}
Elected manojkiraneda
Final election: ['geissonator', 'edtanous', 'manojkiraneda']
```

[1]: https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.=
md#terms-and-elections
--=20
Patrick Williams

--kyjFHpmVcM+yJkKB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmjPNfYACgkQqwNHzC0A
wRlgXQ//VfbHZu712FrigbB/LsG7199Cc4zRO6LG5kIkeZd6NUZA3O+VVy+eaBjw
QMndMejn6bSWLftE1YIrC6I7gjC/jxkRb++4JmxpCvaSUtKFJwIdfMi4nGZkwWzJ
wa3SU3dzsJr7Zx0kqfF/LrMMgZb9WJ4UcUdCrXSWndYuRJBuda8oXkHsy/J/QXna
FII1EYDUBDQDBuclbfueELKzDKzRFQnHUj88AhAKfl1hpaolyPfV4EFeCz0GCVqm
ezqW9ej4cTLEem5OT605DeDJe1sqyICn2G7xEKbiwJeIlUsFpU01MZOkFaSPxdZE
YZ8zdGRkhu2q+EjZWrjpZS49FS6r1bxP0xNX6+9EWzN+tfaiYJNyx/kEDA4Mc73Y
hbuRJFnxFlDJI4mgVPf8b3Q0AHc1ZHFF+z4SgPzZ1V3zH9m9nUlDTVEz7527UGyM
8ry5PekOOsjHmK6oCM/icu9da4XU5mkVfkvId/01wkrUBuas4LXyTpxY9B58zwba
Yi7g9/0831WGyjZb0HN6Cqw3AFYFU8JXJnLx3nqiMvTZzZH5CXn5A21kBOeA97s7
z+zpIFUHKGtpHOHiLPJPHHJDEv7xYPb0oatUIRB+tWWiyAJWmt9lkl0NBUsamlbx
Z1+1sH9SrIdkW+O/evH743NAWmwfVF0XTS6bIxu9KhI8CHr87Ow=
=Hr/G
-----END PGP SIGNATURE-----

--kyjFHpmVcM+yJkKB--

