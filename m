Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DBC9F95CC
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2024 16:51:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFBjX51Bgz3cV1
	for <lists+openbmc@lfdr.de>; Sat, 21 Dec 2024 02:51:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734709885;
	cv=none; b=BEFzVKNC71jAhj5R2Vxal5ESA7IujOZSu49cU/U/j/MIZYoshdDBvAuJ8s05PeUqHjPylc8TMCFkVqEAVFWSD2KcASHOZoPLGl62a4QJKF2HvFpWkXrrx6zdYvsWUQ+I0wrM6nsjTprI5rKpTOGfd/+kis+oL/KSSV+6M41mRssTGmayHgyJmCn6s214S99ykSygqZenbcS+PxoFnUKQPYnR/p/R2VPZawylYEfxWVdu+NzJlkdnqarUQpPlldCd5KVoHyfd5q2xzSYFnulEty+CV89+LKDHKzM6xHAGDBz5RMcReQtZLmZ+7b2CJJUgPqxndlVWMJlNZaTst8akFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734709885; c=relaxed/relaxed;
	bh=W0k/L2rO55IkwcShey0zf079ae6K4vEkYO9GI3PX1AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K06ueZ6v9cnstSN5cjJuCyZFlcy8JoT15C4w3veQRH9UlwA0/2mlnjgYYVwHRm6eHss0rzh/QX868e9qRmHDdoCvHA1u3OnDibgQLNIWoV+1t2vQQgDC5r7gVrx6CTs0j2R0tra1SfYS+wvf68FTR/+mnyDOe0hiNSFgXncbmRCK9vJoy8rn7cWi+GIpCiimKlzzintUcSJ/IKulO5WjMJiTw/Y1hKurj3542094cOY3Xq25xYWsFGYeVS+fFhsYFIZbLtuhvSEzyCC3/WyuneZ9w5Jdb4/GA57VnKhztDwrLGhb+nFOteZeVtEw1rSh2MYFdSrcWq9LeOyYOnZfhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LTSMukUo; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=SGU+bNWr; dkim-atps=neutral; spf=pass (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LTSMukUo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=SGU+bNWr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 453 seconds by postgrey-1.37 at boromir; Sat, 21 Dec 2024 02:51:19 AEDT
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFBjM30V3z2yJ5
	for <openbmc@lists.ozlabs.org>; Sat, 21 Dec 2024 02:51:19 +1100 (AEDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 73BA51140221;
	Fri, 20 Dec 2024 10:43:41 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 20 Dec 2024 10:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1734709421; x=1734795821; bh=W0k/L2rO55
	IkwcShey0zf079ae6K4vEkYO9GI3PX1AQ=; b=LTSMukUoAu26UmbfA7akcb2ywV
	XN3FH1QHhJ4nPNiLvM5cxbg38E1zMWAJLri1LH/ncVyKMMFIZQV/Y9xIB960lLAl
	CFZD3cxttuQxhzpt2ZfYVITUoFlZaStCLES/OjvlHAlESuMPHKOwNX/3/2Q413wK
	/4kPGEv6NQ2FF8IkaZFG4ZLVHbIP7R+Ihl3yH0HsM2grCJC8x4woAutvteIhblsO
	4hb0BFlXE+zFId+sR7wjDgzJaQqjGLefaUXzvkRR3mKndvljyD8SeUGDeJJ1fqUh
	lJYRcjP/uWvr7aMWGOgRywAd5PUGf4sNatDhiyFHoc9hvFD4z8Sn7xEpguBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734709421; x=1734795821; bh=W0k/L2rO55IkwcShey0zf079ae6K4vEkYO9
	GI3PX1AQ=; b=SGU+bNWrQ+3/zZcHOR+aDcfsAARNcBB4IZKskkyLNbn3sUZWwrH
	5iPzI//YSkJ8wDNEdy41Zuz3wf1KbeOIZDRpM5FVVSfeUoemBH3j7HXwFImdZ9Qa
	Hw7yFHSVFoXti21kqdugGTYaM/AEGASLky/dwQ5hs/oPzoY5si4tc79cGW4AJnfr
	03wRRkuA6oc22bd6Seh/8puMVkDPM5zWZfABo3gSqB6+oZVtZZF007cRAuxvqZZ4
	48pjOeEIf53RFMyKhdykRoB57h8yo0E+FU9rf7zn+cxZdLxDbk9iVXwjpjWb3a8n
	fYNV+NFg9mS/8WUc6fCShmeDh4x0zURIddw==
X-ME-Sender: <xms:rJBlZ-yhVvD7pGcD-hHPb3mYiBQDo2yuo-ncViHpaOz45LdZ4Biaog>
    <xme:rJBlZ6QV419X9QBgpGbvB4PAM8Kv7cCBPsstATz76hEMDGGpOR31DUY4qCMdpnIos
    8YZw34QcdX-e4qTSn0>
X-ME-Received: <xmr:rJBlZwXnsft-p_BP17fZ-8QdD2msRC81_Hegrmee9fwegeiZdFIT4jo3rWM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmsh
    cuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefkeel
    udeiffegtdffvdeiiefgheejkeeltddutdetueetieefvdegieduvdevgfenucffohhmrg
    hinhepohhpvghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtph
    htthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfrghnhihisehivghi
    shihshhtvghmrdgtohhmpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilh
    grsghsrdhorhhgpdhrtghpthhtohepshhtvghfrghnsgeslhhinhhugidrihgsmhdrtgho
    mh
X-ME-Proxy: <xmx:rJBlZ0hHzZPS6Olo3pisRpGYSzS5br4BownqPkSXMo052HNTfMG7Xw>
    <xmx:rJBlZwDOFb8XKBnblVeZJNPBeK8Cllm5-x2o13LoU5ZL4p2QnnY0TQ>
    <xmx:rJBlZ1JSQ1x7aoyOScC2_Rlee-Y1rnGdMWSM09U9fZHm2lDub6XFig>
    <xmx:rJBlZ3BK1TYgcjhzfd6t0AxD1Ge_6nHlEMfPLWm4VAT72-a75DI_Tw>
    <xmx:rZBlZzPwUG6PjyUmrCyhJOm7dqC6bjlj-KNhq7G2X733XfeFQ8HSi30w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Dec 2024 10:43:40 -0500 (EST)
Date: Fri, 20 Dec 2024 10:43:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vantler Fan =?utf-8?B?KOiMg+ebiik=?= <fanyi@ieisystem.com>
Subject: Re: Consultation on the invalidation of OpenBMC IMA/EVM function
Message-ID: <Z2WQqlEfJHyGRDCa@heinlein>
References: <056238eba5b645c180b31dfbac427c41@ieisystem.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z+6bi5ly0ph3i4KW"
Content-Disposition: inline
In-Reply-To: <056238eba5b645c180b31dfbac427c41@ieisystem.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Z+6bi5ly0ph3i4KW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 07:52:55AM +0000, Vantler Fan (=E8=8C=83=E7=9B=8A) =
wrote:
>=20
>        I have a problem with IMA/EVM func of OpenBMC. I enabled IMA
> function, but it doesn't seem to work.

I don't know of anyone actively using IMA on OpenBMC.

Stefan Berger @ IBM was working on a commit sequence at one point but I
haven't see much activity there.

    https://gerrit.openbmc.org/c/openbmc/openbmc/+/74136/2

--=20
Patrick Williams

--Z+6bi5ly0ph3i4KW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmdlkKgACgkQqwNHzC0A
wRkIGw//YPr2G6yauXXl1EbxcEI2HdstZkw/BPit1cl7ZaK/RJprOl9OVRZnrYy/
rfxdqnhfajHJEDgcNYuxRrz9KjBEEQ3FEeZ1xyjtf01IOsMgY1/CtJ8OIf9RqxzW
h9oGJ+6OdWv5jiF0bUr6uBBRITLs1VoVDKNIuqIHr228eGBsm+Q1OFCzd8eWlPLD
VXujXwmSRVwGeaKxCMYDkdcj5gXBdLfzGyHqFw8lh7kfHqZmjplNuN9qsEM1KIOG
NPSEvZmuJt9evroGTWkGwITND7/LI228pORkPj1Lc0xI6FRGf0HVpNxevSfoSa2s
K94WK69bXZCDtePbZ05fDoQmgdjQnv64bgD8vrh7AQiSvXkBQYGzNxDzijGstdZ6
OLEc/BlV78TRwV7TB5vVU2jbttOKT9icNJ7CsLWDwj5J4/VOnTkZKkEmmJW64D7s
iufwyAOkQ7uzObSpNZSoU8Mbo55mb8t6fjhdtxZOuCyaIT9gWWdDpvjBmemOSK71
PT1fRm0KP7o1Xw5BGk/277fco/XbgU22CLCGZk5E64KWXVgjyXpbw8YNSRdoBiKk
rnhyJLHK7YRBzWi2YR9OG9wFMEzB3pwBB6YgJwpd2gLAQS8ylAZUepQQtUlyLMs+
AfEjA15FqPMtF9kZoYJu5NdMeXEi5+prRDdRpJ2/Y+o1MbGSvaQ=
=bsP1
-----END PGP SIGNATURE-----

--Z+6bi5ly0ph3i4KW--
