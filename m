Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CB76D43D5
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 13:51:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pqq430NKdz3cNF
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 21:51:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=OsEA32vF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=om86IyBI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=OsEA32vF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=om86IyBI;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pqq3V6gXqz2xbC
	for <openbmc@lists.ozlabs.org>; Mon,  3 Apr 2023 21:51:02 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 60A715C012F;
	Mon,  3 Apr 2023 07:44:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 03 Apr 2023 07:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680522296; x=1680608696; bh=F/
	nhFSNt530ZQhJbLKdYC7cdNUf2onSrdPSdTUhKfdA=; b=OsEA32vFB3KIRNQ/Ll
	U48WJyXCLae5WpAgIqOqbpgqEr07rADa6AyYRa2NUqAFInBngzu7BOeU7AA/YsQh
	xjNUGrIgrAjY6HOXdpWP3TK/XFGoLhUe8l+cXe2myQCsiDPmZw9nwy7SsXrCqcWU
	BguGlS5NUTFQydAAHS/txu0XWeRQNTh7F7XpIpjZLj2UZ3n6LKLKaWChTFQP+lrp
	adH1MXiXZWS09J/rosg2L4h8Ff71XkOogtFwmPeDkVpmFufnO3htpLqUYSKqYQM4
	iyhkDB+LGSOdMydVbuRIM1XkfMOLSHCMOCvtdr1zX6jeLCh3vwZicZfWF2aaFAom
	4ZyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680522296; x=1680608696; bh=F/nhFSNt530ZQ
	hJbLKdYC7cdNUf2onSrdPSdTUhKfdA=; b=om86IyBIGISxIc8djndLYKd3Do1TV
	B43zWTv8eIvgtdWldDzmS0KebViKAkJYz5+B8/lxoHKDnw3Y/nl5FNaDiFIu9GGO
	KJP19uc7AwuD6mv6emALoHaOCaBJmKZH7EZt/zcZSY6pCBHIde1vUJd1rWq4SjUu
	m4V9p4BarrevxcpLWUkrocpNvAfxdM/xp94r8mF/5hNTmJcsVnfrQ9pAlpaGFdzW
	ucrECwsCbIPdWEWd+Ke62FUV1QiV56SmP385zpvCxZU6s9W+fGtRwofu2uUdtAb9
	wvnDqmC7+CtMMNyG51TuAAANtFluCtRX9PJOge340at+9xpNTN++fXKlw==
X-ME-Sender: <xms:N7wqZKezWWyuuWALumFyawxVRw3YO0tX2jIqlnRIMmjFpDrIh2kmFw>
    <xme:N7wqZEOkg3FC-xFaE-NmAXVH5NE88bWTxo1s4oTP1nH8FPKh5FtfRLcQI5MSewLCg
    Mt0kDOQmIBrTCXJMiA>
X-ME-Received: <xmr:N7wqZLh6xRlchXDVdWdIF1AMisAcRpp5gTHkHWMIYKBb1PZys4nnAP8imKoRJjfByENkrUfxHZl_KJrt8ZQ7dzDVnFocBPxiZMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeijedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejjeetleehleeijedutddufffh
    ueeufefhfeelheevgedviefgffehudelheelhfenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:N7wqZH_82Vv4Z27ZW-tZTD-PhQunEEWoD6WOpJ3agt6WjciXq8XPYA>
    <xmx:N7wqZGtgAhgqxTe9-eDjlkaArkBbGY9Tbzw579nGnKsNlTXkGXjmlQ>
    <xmx:N7wqZOHLLYkB7dIKbPQeuOHZPjzpVLGzUgk1jwLip1ueseUZy9sWrw>
    <xmx:OLwqZKhQR-nSnsdPzOmXd_qEcdxmB5rB78HioJWd9HjYxpHMhCRtdA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Apr 2023 07:44:55 -0400 (EDT)
Date: Mon, 3 Apr 2023 06:44:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: Re: [RFC] BMC RAS Feature
Message-ID: <ZCq8NrJdaT7UTd8J@heinlein.vulture-banana.ts.net>
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com>
 <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com>
 <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
 <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
 <CAGm54UG+S7gFkCaKJm_7PxOCDu0haZ4FWUxj716JBGVY-gaTFw@mail.gmail.com>
 <d9f7b650-2e8b-7bd0-2125-035531ce549c@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TfBRo5SGHl+/9wJX"
Content-Disposition: inline
In-Reply-To: <d9f7b650-2e8b-7bd0-2125-035531ce549c@amd.com>
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
Cc: Lei Yu <yulei.sh@bytedance.com>, Michael Shen <gpgpgp@google.com>, openbmc <openbmc@lists.ozlabs.org>, dhruvaraj S <dhruvaraj@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>, Abinaya.Dhandapani@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--TfBRo5SGHl+/9wJX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 07:07:24PM -0500, Supreeth Venkatesh wrote:
> Can someone please help create bmc-ras or amd-debug-collector repository=
=20
> as there are instances of openpower-debug-collector repository used for=
=20
> Open Power systems?

The typical process for requesting a new repository is to open an issue
to the TOF:

    https://github.com/openbmc/technical-oversight-forum/issues

Ideally you would submit a refreshed version of your design into the
Docs repository, as one of the questions the TOF will likely have is
"what is the proposed design for this repository".  You will also need
to have a list of who you expect to be the maintainers (OWNERS) of this
repository.

There have been a few other issues requesting new repositories in the
last year.  You might want to read those for examples of the kinds of
discussion to expect.

--=20
Patrick Williams

--TfBRo5SGHl+/9wJX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQqvDQACgkQqwNHzC0A
wRkwYw//Uo3azBxGcmBp9CpBQLQm/hvHZIb0hEs1Ss+P86GKctfaPn2GiDxnTy6i
rsii6slRiVTjT+zsMrLulg+exVvF8i1uW1h4YNFOvyB7xuNc/NMeuh9StnUZrA6t
u8apqCase6OGeakf9mPG4VV1QTm5mHb1JMTK4gUebhuFqgf2XHqAJ6h7Y0onmwH0
UIcLLbNrAf+msIE/Inr4aqr7zxcCHBz9m/dtynuwF4wSrFjC0B9UnDISoNtJ+D7e
Mvm+Z3K68GpPCzCaaJyT63dshpn2U1fmiGjE7rssSkVNx0KB/iGu6zpDiCzE9hc6
DdtFDb8nB6RWGp4v1Bb4spZeGFPvee532C0J6AmXGsekc4VzjJ7V5CKHjRDFOcYw
eNulq1Od+n3Sl+I0BB4vDLiyS7VeKxdyYYWlYGgzA0PivNI3K74N+GUr2Cnp2Anh
NJ7Nhqyj1ACuRtN6B/LlYkTL2AJBVMRoc3V86tvBKSTUFV0OSfr5UBgnVwG7Hg95
DohMI7nrBKY5++V83DCJjp8ulmKtsk395EYTdEYxGEOIHIGvl84ZgptKfjOtOxis
H9JYTXiSU5W6mwGubsVZLrO8gngxrT9ykgzt8VOh6W6/RhncbqP9k39wO6a6uGB0
THecSSpMxNkw5X76a/dl1H2jqGIG0aTX5R/F2OHeYs1ScaRTxcg=
=UM5O
-----END PGP SIGNATURE-----

--TfBRo5SGHl+/9wJX--
