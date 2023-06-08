Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C957273F4
	for <lists+openbmc@lfdr.de>; Thu,  8 Jun 2023 03:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc5ch5H3Pz3dxK
	for <lists+openbmc@lfdr.de>; Thu,  8 Jun 2023 11:05:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=h30XYKc2;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WUmhxgEm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=h30XYKc2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WUmhxgEm;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc5c15lyZz3bqB
	for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2023 11:05:20 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B0B8C5C01C4;
	Wed,  7 Jun 2023 21:05:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 07 Jun 2023 21:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1686186316; x=1686272716; bh=Qf
	RzAGb+l8iJRQ+HiSRXXPKAg13/EYR7Kqb8NodZCWI=; b=h30XYKc2qQPpjdb3Xg
	DnS0CTtyMPJFIySfUsDV4lVgHarjjZ6YY3269yglcyLcJQt1j/apKOt9luBUrrjD
	TTG2OeRO7QM8l39YIxyLfWkYE/eL0ATfzKEy/2cB0G+w/qSpRGOB85Nq5jsw/Mfr
	r6BASq/IsgmJUsoPAd9HgA7J4wpeZP3R+fwc6UwobwziHJo8nICZLoGm9gyuDOY8
	B1sfbAxsDznrFX0v1kGhLn8AzjsfHomoCqN9OPLASU/opKAKvK1iCg9Ys/kVZJRt
	ljz78s51qzzY7vMt+tJRwxKO0spy7vG9zSnsznhNOHVHmm88H4pF8goXZMZ0S8zZ
	92Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686186316; x=1686272716; bh=QfRzAGb+l8iJR
	Q+HiSRXXPKAg13/EYR7Kqb8NodZCWI=; b=WUmhxgEm9BX4TkU6Aiz1fhOzYz0se
	9o8/fSGrSY1DJvTgYXSrKjeRNbiXu2mcrSRUQ9gt6ED1UfkQlW46tqcpuJ3APAtq
	OiIYhgBMFHEIfl+vSUSCRLVoVOC8byM0W1UN399gA/uQFR6nOHgsAZg1hcVT91u4
	vqyPpdfaoLCS/qWSn1BsAiWxylaBdAAmQMw5msRpi3OCb/pA7cFFZHiJrnKbQs2V
	V146lHcoCl61OWu2ekLsy6BZiTrsPlOb1J+lK7j686v77SYuyvhKM1oty4DuZNqb
	zCqq6zF18210lZ4EBr3OLQJliXAE0jF/UHmUbuWc/FnMlrKV0SBwfDEBA==
X-ME-Sender: <xms:TCmBZPcixyTRIIjIywccOEWCwAWP7IT7BX2GR28FxAlPrn7NOp0IgQ>
    <xme:TCmBZFPp3Ud76rpRJj9RkVuwiaK5C6_Bh_2CtU35a_Beb5jzAD-jnuGpa6eHht2Om
    9Xuqsk6rHP6srR08vw>
X-ME-Received: <xmr:TCmBZIhCAQMsKqE_vdBDEvldP5WQUJe6xZa_wSHzcoiUDWeRvGkXMg-17Q9n9VTCelvbrWb5AWGDQcZCMJYTCnd1qTYg4JTuzEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedthedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejjeetleehleeijedutddufffh
    ueeufefhfeelheevgedviefgffehudelheelhfenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:TCmBZA_wkvN59oN0uBL4DXEgUAhNIQ13HMvekvcABM3Z5D5bche5wQ>
    <xmx:TCmBZLt0VUVlWDUKQFscdA_KwyF4sS6iiwTfF_2cYoMnR7Y0LFdYxw>
    <xmx:TCmBZPFRjZOzfCb3-0qJr4t1bYUovvetgy2Kvo6tL8xrgmFCGOXWNw>
    <xmx:TCmBZJ0ocWnFBAb-WM1jXhGvyfDgF-oxy5W9T2LQ-bFlOLOymJz4Pw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jun 2023 21:05:16 -0400 (EDT)
Date: Wed, 7 Jun 2023 20:05:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: raviteja bailapudi <raviteja28031990@gmail.com>
Subject: Re: OpenBMC Network Route Management: Metric and Static Route config
 support
Message-ID: <ZIEpSaXg4IkZ7MZk@heinlein.vulture-banana.ts.net>
References: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
 <2d93fd2f-bde5-22f2-373a-63398963e94f@linux.intel.com>
 <CAM4DKZkvHE6AOgpaO2bCKgK9CgN_YZM9UpEDpzD3-+DSXf4EXQ@mail.gmail.com>
 <7230376b-c7f4-b931-faff-27a4da1b38a9@gmail.com>
 <CAM4DKZ=-pHzz-OuOyszYmrHMWog5uNpB-S4mQtQaVrY2iJ5=BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J+C1MS3j/7unzruH"
Content-Disposition: inline
In-Reply-To: <CAM4DKZ=-pHzz-OuOyszYmrHMWog5uNpB-S4mQtQaVrY2iJ5=BQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--J+C1MS3j/7unzruH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 07:49:06PM +0530, raviteja bailapudi wrote:

> Gentle reminder for the feedback on Static route feature
>=20
> Here is DMTF redfish PR to enable redfish static route configuration
> https://github.com/DMTF/Redfish/pull/5464

How are we suppose to review a private PR?

--=20
Patrick Williams

--J+C1MS3j/7unzruH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmSBKUcACgkQqwNHzC0A
wRlQMBAAng9uNZMSXJ8G/unR/6L0irgZaPlbCr2TfEh10x9pgUokC0dctDMQc4lj
8fwYODyj59QCu3ZD3olqMp2WMfIHcH8Az78Eg6u2k1x7lsc2oz+Z6HofEITABZKd
ND+iXZPOybetIw0Bl3WH5I7Y79OzRgkz6hq7pfKm0uODXHW7yfbACYELNJJv8xsi
NwXMGffp4E/LXjw6Dpcxay1M2a8tpSppGujF6OjXk8tSkZ4CvS+qa5nFjoRUJDP5
6dv68jKg0vlLoYG5YEuqyZ+h0WVU37MupvLcBqTLvOH4Yxh3MEdGAgqsAGaLdP/W
wnbhcRr1gv0Kn31YKyH2bSfqZX78tSMOMyC6nFLvvc9irPxT3wciDv9kAoS7EGqb
SjsYTlsqBIVsEVlWseB65vizWD6MEiiMWXBhcLZCPXvVG01YUNyCoyjRnmCMhoYy
YEtljqwNIlmTkc+mtAeAazYOF3IpPXU2f4imfe3Htss2r258TLS42iSvL4EEGhJt
lWRQrGwuEouXYKYsHgNijf5sqfV15MO5O5qHJYombGK/LA9Shm1RCIqynzLkANOu
0FhxPQHS6DLD6x7nSwBJhMjauY8M9gNuhykSq7EtT1+19ZujXDLBlqrPpcN+26iF
O8Emw5d9iUJgHycAAGZCl7FF9aLNFTOUk9/NNDfhM6nJVDqEhHo=
=OVmp
-----END PGP SIGNATURE-----

--J+C1MS3j/7unzruH--
