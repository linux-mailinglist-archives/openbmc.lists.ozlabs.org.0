Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8199F6D43CE
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 13:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pqq0B31g6z3cNM
	for <lists+openbmc@lfdr.de>; Mon,  3 Apr 2023 21:48:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=YnbDJC0H;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=r4hMuH/i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=YnbDJC0H;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=r4hMuH/i;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pqpzg0Gx0z3c6v
	for <openbmc@lists.ozlabs.org>; Mon,  3 Apr 2023 21:47:43 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 111E65C0105;
	Mon,  3 Apr 2023 07:47:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 03 Apr 2023 07:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680522461; x=1680608861; bh=fO
	/DMEcZyO2riqcFxOPDUEXADc3FtDdSEQM4BXUPlEM=; b=YnbDJC0Hc+NY/O52PA
	EFXwv414HAsvBt3iOEnASLCrj86NUJ/IUr1wM/7X99w3nfzA70I0BpkoAah7K26r
	EcH/xYf9bvYC37UQNuK28AO/MGQdPTgoEMkUcyjDiRricN+5IpxvgWvOQVk8HZ7o
	Fu423gxC51+5Tlfs6CmNjho3qtJ9fd3H0Lt4ROsLlry2U9Ast50xQijB4He43ATo
	Z17/6R1wLYi3E+KYn4TOehK8XjoHfWlh8dgcASCvMS4/mkiCFeeADz6+8p9RRiqa
	flZgII46igUsLSt0POLooHLkIDbZwAD30/6PUQQ8ONqNLivTuOPOr4HyeuRIHTY+
	79DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680522461; x=1680608861; bh=fO/DMEcZyO2ri
	qcFxOPDUEXADc3FtDdSEQM4BXUPlEM=; b=r4hMuH/iuNxsGt2xOcJ4YWWHGUFZ8
	det83G2xKL/zMQ2C6JMgzASf0s72asYwGA2mhK+biuBa6gRRGCTj/YY5jFmcQVON
	bgPZ30vTMl8jCPODXaRK6rFR0JFw6AAqI/kOHvFl51SmmAloakXZdJMfeCjVVxT2
	Ett+AdnisNlJ85n1KUOmE9PtMiMXoAJrwvjSWfx4e9W0fkcsO0mFHzWgPPhvwZtf
	ymnu5IKl6yiOBSzskYMcElMMCMWmR0mH3ZDHfs1UUII6EKEWloF0Fy9V5myCjnJM
	ZRuUhmtveDvFnQ18UfCg3xB3EmK34pOwa/VU8slKtr0uvqszYlwNooahw==
X-ME-Sender: <xms:3LwqZHm1JmkxJaZ5-e2LaRVGPobEGVnYtvnKkzgF5yC20woUO98Y-g>
    <xme:3LwqZK0WCA46RI6kbHOHBpgC0cK8ynZ4We6SV2kanm-sK_crTJouAFVV_9Kr034Oj
    UvBX2-DOR2HsUxebJ8>
X-ME-Received: <xmr:3LwqZNptrSIlmsssWRK8XCqAz_rkOYQ5ASuSPV21iZ-zFLnqDlUyASzuo9Og9WLz9PmO_68EXLkfZaxxM36scaoOItaIZQnRdvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeijedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:3LwqZPkNZSr1RdXV5hc_Fvz2IC6Uu2C00CGHCBN_4HGJfbnrepeKow>
    <xmx:3LwqZF1tZOOfkSAbE8l5gsAFRuJP4vPL1JIFJcl3yuw4qnKodvO_OA>
    <xmx:3LwqZOu6pgRfP7m3oCyXoTOG_riRGSV5KjHRNtCva-XCdIp4zMeOpQ>
    <xmx:3bwqZG9_CALEpEGFd67GovP7z0mLwma1oc2syXyTOhWylO751PzZDw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Apr 2023 07:47:40 -0400 (EDT)
Date: Mon, 3 Apr 2023 06:47:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Satish Yaduvanshi <satishroyal4u@gmail.com>
Subject: Re: Containerization Enablement in OpenBMC firmware
Message-ID: <ZCq82_K1gRdlM7Tg@heinlein.vulture-banana.ts.net>
References: <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
 <20230328224413.GB18848@packtop>
 <CAGugOWvofh+f15KuMCkC97V-9Hn4QxuVTgw5aXkTM3bVNaeEDg@mail.gmail.com>
 <CAGugOWv=XF9UHLcgcr-W5_3DE5+w3EaP4i0eHe-nbSFVgJqsHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kawkxdy22GfY5GYt"
Content-Disposition: inline
In-Reply-To: <CAGugOWv=XF9UHLcgcr-W5_3DE5+w3EaP4i0eHe-nbSFVgJqsHg@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Kawkxdy22GfY5GYt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 10:55:47PM +0530, Satish Yaduvanshi wrote:
> For containerizing firmware, I do believe architecture matters. could
> anyone of you  explain the OpenBMC firmware architecture briefly

Have you read through any of the design information in the docs
repository or watched any of the background videos on the YouTube
channel?  Was there any specific questions you had?

--=20
Patrick Williams

--Kawkxdy22GfY5GYt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmQqvNsACgkQqwNHzC0A
wRldBRAAlf07MLnDrxFA/OkccrLQtsI8Ke9Cacb4iJnHRnTlsUZQPtuPJZWMDtpS
GJ/OTY2OzqmGycEKjRDs+t2SE5rwrS54Ivl9Np1UhTtoYHvGIjxuliiiuXldlTds
nQBKBJ5BROVaAxHpPC4TJh7jDVZIKHQqhuhy1Zv0022BXdh0uZweSNuLYpJS+oLn
sVoST2HlF9ghNJ/cJX6Ojrdth3DvAyognP9ldE1n9DoaFiL0XDqaPLYwNMgaBxZA
6mopQmfgXu+BWGo7GRMr50bHHJRR5IdA4o8v0YtjR7RARMd4a/tJiVd47qQb2KF4
HNJoE8K7UmpTyRR53P/2WfGfKwS+UJs+yhkOcldzdPF6ydP5SgzsbZFpvfIfazHf
ZvBWlpx6CxgVZ54oKX0ApZ4J+ParPwHboXyKCggXDXrDswrKwEVqbvZhrt68Jnq2
/LsZa4V4dN9gO1AqCLcQkmGaqg1c8YO1liViYKhSSZbUETLM47GzWaTCB+1MCa+I
PMDy27Wf3OXUp5zac8hRoijr4jdDc987hADEZfESoFdNmWa0IGXNesGomaO/6/EF
JPHkapLJS/JCB7bg+PpqkoymoQP+8nMf1qiuj9BitWZzzKOcDSw0aed+SYQMw1vU
GsZG5W0Npbn3onG6m3GOSQT4/APmPO4ziU5yxGSSH/SzmgiL1gk=
=hZ14
-----END PGP SIGNATURE-----

--Kawkxdy22GfY5GYt--
