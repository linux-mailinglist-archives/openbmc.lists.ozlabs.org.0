Return-Path: <openbmc+bounces-62-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE55AC2B51
	for <lists+openbmc@lfdr.de>; Fri, 23 May 2025 23:26:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3yrn1ZQnz303B;
	Sat, 24 May 2025 07:26:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748035577;
	cv=none; b=YHg1MQdYFhnT8NjG4IaCzKpuG6OlucQR3z8HzbAWhqIY2bcwzEiO4Q2FTC6PTn2DWIPj6PE2rO79/b8bLAAauI5wXHpv2f+VsnFToB9cR7E4HFLCxwsI+DwjPKPGv7+SNLpYnOAIHuiMLGXsTBO98p/yILn2PNKJXIvyBaTXrR5jx3qE9QjRl6pibWG33h6zuoK3uOumRdky9N7KtbQkKMsqxWn09VoI76NPtquk2f4m5EWZzARgSmJWGqM9pqv9Iev4wQ/HzcS3Ejob+e2za9tlr0db1KdUKxux+2go2YXrcsQm6nSjVkCI7FEl4n9Scde6Hh/koyQVamp2gDSEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748035577; c=relaxed/relaxed;
	bh=/O2EIhin5QR40E8LOlyyTq+81Bd/Ua2NG/vlshOGHiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mi5/hPuytF2T5VYI1jeZ+sCTOajXDxRiO0wNmnmft0FYmD5bhYNmb2B/PHx8Urwpb1zyHg8ccu0b1Vr6zQWpZcD0SWvVBvSoN5117awRmcSLVnNVl+oPAjDoRvDnpd0+q6qUObBKtKrTKlz+T6eI9Gps4v5OnUecgsZt5TWedV7kODaSeY/nBR+FTotm218sdwJyJuCOG7s2D92nXn9ACmSQkfoQ6sW7cc5e9NwN13d+3zLksB2XqCEOfM6uAm2n/3VtNqfSn9tBi4d9KPw9TVpdz/3c87C3m0SAI3E8Eu4KifsHSRncB6Ojt6GfINFq9i8+qBs1jyV6vZ6YgwePmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=tSob+T/S; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=l6Ah4FIO; dkim-atps=neutral; spf=pass (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=tSob+T/S;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=l6Ah4FIO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.155; helo=fhigh-a4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3yrj4bYQz2yrW
	for <openbmc@lists.ozlabs.org>; Sat, 24 May 2025 07:26:12 +1000 (AEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DB13111400D7;
	Fri, 23 May 2025 17:26:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 23 May 2025 17:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1748035569; x=1748121969; bh=/O2EIhin5Q
	R40E8LOlyyTq+81Bd/Ua2NG/vlshOGHiI=; b=tSob+T/Su2UA7K5CaXRce4OAM3
	mH9+pTOSdxMLKIpDU08uRBTFd9ch3D2cP7IWISELoFGePOJqPirkYpcizl3Ck5Ho
	pkJM0KAl0qgN5T4fZ9pPX3oWJ4K8eXRlv74Fx4mzNVcUsOsu0fYNAU6pm7wfCxSU
	cUNa+36LlrqNqIsqp+zM2ttcZa7z6rF43Bnd2QB+ZpgOd79zbQfKHEMva4JqcQ/L
	F3X4AA+hB6kbjeJNz5Qa1ddtzAXD6dpTomZyf9IdVEn6Ug4NiygEvyvpX90qj8FS
	RuNgspZUGRhIYqH1UhLNd13X8SUd5WrtRMvUSNuavhe5Lrfh6LKDDfkyXKKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1748035569; x=1748121969; bh=/O2EIhin5QR40E8LOlyyTq+81Bd/Ua2NG/v
	lshOGHiI=; b=l6Ah4FIO3O3Up7QsVgpua7YYEjxwrJLrNlSyJMsD2c6/vu2zAaC
	WMWYOvu/PoMtiqkeLHMWvqcY+/ctGs0OXjAU2Z/ttF98VBOwNEAeWBrUFQc5MvxE
	DXmsKLUIMnMnlHoXxYCH9Awy3gspKQ2aIdrdIpr29s3NdLyOH0w4gnGutm1uc4+K
	aisOdjFplZO/uIY0Y8/CmdFG8DV52ORWuIDA02IbqJDjjFicaMKFwiwsQKPspM22
	Q+nxJsbe1ZHQrN3AAS0Vag6xU+CbwNgosKJLYlZQDKhZL3Ihj+D5y0iCIZEUraeg
	DXbDpeF2s0WyRGSkbHp/Lt67Emf/lhBSoOQ==
X-ME-Sender: <xms:8ecwaGflJS5Pn5p3rrfmWgMWKtWRsPQhimQeCyrCtM_7PsIvpjrZ_w>
    <xme:8ecwaANTJ8dU3of-4voOzGln9cp6oZqVia5XRe2wJFOIPT667-o4o9hym2LTSul7S
    zdocfU2g7TNs7J14ho>
X-ME-Received: <xmr:8ecwaHhidzjGSEHnNJxm3lZ7mh2uBqmFmJSwVJdOuU1gBRKygbQWR69_zd8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdelleefucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfeehmden
    ucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrh
    hitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucgg
    tffrrghtthgvrhhnpeegieevuedufedvgeetleekkefhjefgieeilefhtdegvdehkeffke
    duvdfhfffhheenucffohhmrghinhepohhpvghnsghmtgdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
    igrdighiiipdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehojhgrhigrnhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgsmh
    gtsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:8ecwaD8p0GhlyPwdX0m6LVzH2iuFkRyx4aJ2VKzMR1iUyfa32xwvpw>
    <xmx:8ecwaCvuB4pgBoDHFq4lkevyznfoQoB2RfA4zMqv71lTQ1uAIejnqg>
    <xmx:8ecwaKGm5T9EkbduvOZkF8lvrVFkHsocTyYiv0D6kMWaZN-Mys2nyw>
    <xmx:8ecwaBMqhjWFeyNXRfNWCN0aykt8o30FqaEZw9ci0TITtu0i3QFzMg>
    <xmx:8ecwaB1F5ZQIuOhwv0IcNeoM1bVrSR2CWybZKsxAJl05bdmr1IXrboDc>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 May 2025 17:26:09 -0400 (EDT)
Date: Fri, 23 May 2025 17:26:08 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Jayanth Othayoth <ojayanth@gmail.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Standardizing Clang-Tidy Configuration Across OpenBMC
 Repositories
Message-ID: <aDDn8JF2rvD74pvk@heinlein>
References: <CACkAXSo87MHi-+A2ZWLijejAdxfK89suaZC+4AN=+UnwZr2afg@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="QEAPU4XulzhxsIWE"
Content-Disposition: inline
In-Reply-To: <CACkAXSo87MHi-+A2ZWLijejAdxfK89suaZC+4AN=+UnwZr2afg@mail.gmail.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--QEAPU4XulzhxsIWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Some of this clang-tidy enablement didn't get fully rolled out to the
organization. One of the impediments was that it was difficult to agree
on clang-tidy settings and difficult to roll them out to the various
repositories.

I've written a tool named `config-clang-tidy` which can be used to
automate the roll-out of clang-tidy changes:
    https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/80527

I used this tool to reformat the existing clang-tidy in entity-manager:
    https://gerrit.openbmc.org/c/openbmc/entity-manager/+/80530

Similarly, I used it against phosphor-virtual-sensor, which had a pretty
simple clang-tidy config, to both reformat and sync with docs:
    https://gerrit.openbmc.org/c/openbmc/phosphor-virtual-sensor/+/80531
    https://gerrit.openbmc.org/c/openbmc/phosphor-virtual-sensor/+/80532
--=20
Patrick Williams

--QEAPU4XulzhxsIWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmgw5+4ACgkQqwNHzC0A
wRmW+w//dvkOqEbelXuMO2awhbFzQiBDVCJYA/wkb/J2VylW2gsXziUWzS9YmMY+
rvMz9AdG05UMh5nSZQV1nug1VK9E15hHRzPHgySG30cz34unanwNNlmkt2VhtgjC
+Sz5p6pKuRAvZoynJV3jlqBbHp5tacH4ZA8gikQHeKUNcUz3EZEf6s32TvMcFfRS
36RXJCF2WfXVrGpoY7YanX7//BxE/Q0jBstzaW94wIL809t1Gpi/Ei+uiXWyo/mx
5MF31P2SqPrAImm461me+yCkG95tw53XS1Zp5tEyGUVcFl2FrV6tbwGcwGyeDv7q
1PAXSfPbDmY4tgpjrDPHSnswLf6wAws6gFDceqguSGm0cLpfX5PGMpjPS3q8Luj1
OS7ZcYY3Tq09FMEYkS9T+7NtQ4OeIsPcU+epDaNFdPfdtoJNXzJvEqS98YLzmVC5
FMXx7om8eDHWro1qDo0Gc3T4ABWflZRUKyhxuka9x/19H3wQexdtMiL74+xLeA4B
B3cjIVdxawC9ZewDVmS2zKMVwHXCYwAd8sOOba2EJClFokdyM6WfbkisXc+NcoXn
ZNFoCn0vejeduQ1gJbhJMPSn+MyxQ+q5WkcJ0tb5f0wa3vOAB59P0TprLCw++6mM
aIYTiNmoQbxFsTiAPWkloAL7gXP/kqXmZEnmNLo7x99kzH5sXlw=
=WX4D
-----END PGP SIGNATURE-----

--QEAPU4XulzhxsIWE--

