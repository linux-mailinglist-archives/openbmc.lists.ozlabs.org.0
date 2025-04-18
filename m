Return-Path: <openbmc+bounces-3-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE77A93FB4
	for <lists+openbmc@lfdr.de>; Sat, 19 Apr 2025 00:06:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfTP30sDfz2yTQ;
	Sat, 19 Apr 2025 08:06:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745013975;
	cv=none; b=kv61yP0MF24OrqPXY5m1bqfIwOqqcxVHIG2MR2zjM32d8EFtcVKQCJMTjHt4vsOs5t876ZHt8k1DoiYnSjLwGglrkyT//wELuxvNUWG7x+Kn5zTmokV7MffuvkuV08cWQcrxrlhinliMsYnI22Xo3wEjKqPgmnvHVimdVAzZv53z6mMxWS70t4qUa1Qu9jL9XM8QOwA1NLe/vrT6B4QU6yUBS9OQz/rdIye+po9fxhSofWsyDVRW3WcPnk+kbI+w+j83CLygbSChwGQC9LClCqCLfTWb+/kpgcdSygOtFqdGw8b/YDB/kGxZn2OHQ7Nl5G8/tlHG+TQM75RY+t3CBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745013975; c=relaxed/relaxed;
	bh=jRig5JYSUvCCmIV3hDb/v3uPAC+nXSxEtSjdnImm8k8=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=ca6N27ck/xzxOY+qlPbldcqpHEMzACJTXeN0XvqB4AiZ9l8h7cqppJND+sMeXp0LZ1VRNrv+QNsboXU2nNSq+KenX92m3TR1SxrYvx/M0A5zKDddc9uH3PiE2FV6Qc1j6itZ7zMdQ3ZnVqKefg+RxRewAxwlLsSRPjOv3yEjn5EFchbd3pLBzP6o5tIszj5ZPEsez0TQaBE5PvQ2TCH45Yosf/98jkyC3PPTmZ7fHPstARAa3EHnX9Dx4w6BXqLx0svPvUL3hd0DT0lpi95vIKMvL8Ul47cQNvROO1Fr+u8jEsHt67W6UsWS1sK6EjH/QMu7X9IYs791o6O6+gTBjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=VDD+wrLx; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=u6Spdqlw; dkim-atps=neutral; spf=pass (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=VDD+wrLx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=u6Spdqlw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 510 seconds by postgrey-1.37 at boromir; Sat, 19 Apr 2025 08:06:10 AEST
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfTNy03gbz2ySm
	for <openbmc@lists.ozlabs.org>; Sat, 19 Apr 2025 08:06:09 +1000 (AEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EA19A2540623;
	Fri, 18 Apr 2025 17:57:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 18 Apr 2025 17:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745013454;
	 x=1745099854; bh=jRig5JYSUvCCmIV3hDb/v3uPAC+nXSxEtSjdnImm8k8=; b=
	VDD+wrLxvx6+SBq81S2EHwjXbmbeqcwPDkN7Abm6UHpbXUU1nZQx1rqG50iK/abi
	BxD3HJ2wNKN1XE7Tvovqrq7Lc0hyB7v1OfW+k+1uS/Kta8izCZx6o+Zu020ty0ee
	Cy+/+blD3h1oB4MqKrlMPhG3kit8pixZxB4+imTnkzfD364bQQuUK9zScIpJCZT7
	T9wLoD8jCvTNZtjIZKID8qlPXtXKrR4FpNDmiSM+qMBvneu64JTAowLfl6TCxSW3
	+36SjTeBhhIjapLryPdN3FQXt/SwNAPGGczao3sEWe5dameg5r5c3I25QzVA4MW1
	jy9tEVd9RyzrFSYEcPfPNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745013454; x=
	1745099854; bh=jRig5JYSUvCCmIV3hDb/v3uPAC+nXSxEtSjdnImm8k8=; b=u
	6SpdqlwsrBLEeu9rvDqJc1fjwOIedznxDKGQoOy6zbOlx0l+bXjfqE2Ntf2snYxB
	pctFpsFkNFVGSCZRoC5lcZNUPJHncTWpcivZmBOI0U4Ci8w3LLaIJhFOULuFB6xn
	vgEJbeP6J24ywAHX8qRU6UuzgeYyaelYR+o4WuE9iZtIUXBIZFqvTQKdKlum5G9o
	KaJn3LtQ/Yi3ZDXLC66Qpm85V/GPf1VMHKqdIoyBeOtvAaC64BroLkV52jz1egzV
	7QfwkJ0la3T+rMX2m/D2O7PtVhsx1HiEEvJ8cZjupIhqoOjiZuHZcLF8qBuXa/8x
	xWUKVBcyg8aGpxFwQItgw==
X-ME-Sender: <xms:zsoCaKEE5LuR6nQb7o7wuNqGdXSpnK9UDFBTuEXVK8LK4VD4bGYKOg>
    <xme:zsoCaLW6oAbxI8YbzvhP_vuw9CWHgNHHqQiznDtNL7EArKcJNDwRzHp-bh958vs32
    i7VaEBHFsC8PVqEA68>
X-ME-Received: <xmr:zsoCaEJ1akY6PdjJL87iKeTDl5k345M7G6UjsQBQM9wu7GLSAu2zVmihyjXjY-JlwWTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpegtgffhggfu
    fffkfhevjgfvofesthhqmhdthhdtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlih
    grmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhep
    ueeijeeiuefgheejjeegkedufeduiefghefguedufefgkedvjeejffdvtddtfeetnecuff
    homhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprh
    gtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgsmhgt
    sehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehnghhuhigvnhhthhgrih
    hthhhurghnrghlghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:zsoCaEGlaDoGS_6wuLNL5CDsmKYdwS5FCHbI6-ootntEnZ7xZikgwQ>
    <xmx:zsoCaAWHNtVzv0rMU_sbKjmKln2v7lujfjUIxOni1MaKw3if5apv6A>
    <xmx:zsoCaHOXCBVsyRi0f3C_UrWti2IAjFC-kJOIbI41tDdTRFoMBchImA>
    <xmx:zsoCaH1fW3forJhcaFwkr9g41wZNWmVJovgxqxxV6tG92jvF4FgD2g>
    <xmx:zsoCaJdbWEvNx8Q8CPpHX5KA0w1tahwWCnLQ4cCDshtVkk9Jy_NtFPyb>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Apr 2025 17:57:33 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Patrick Williams <patrick@stwcx.xyz>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] libsimplelog-challenge: Add C89-C++20 logger
Date: Fri, 18 Apr 2025 17:57:22 -0400
Message-Id: <BEFE350F-E222-4470-B7C9-18BAC675B146@stwcx.xyz>
References: <20250418165558.47193-1-nguyenthaithuanalg@gmail.com>
Cc: openbmc@lists.ozlabs.org,
 Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250418165558.47193-1-nguyenthaithuanalg@gmail.com>
To: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
X-Mailer: iPhone Mail (22E252)
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Are you expecting this to go anywhere?  We don=E2=80=99t take mailing list p=
atches for openbmc/openbmc but this looks like a recipe that we wouldn=E2=80=
=99t pick up anyhow.=20

=E2=80=94 Patrick Williams

> On Apr 18, 2025, at 12:56=E2=80=AFPM, Thuan Nguyen Thai <nguyenthaithuanal=
g@gmail.com> wrote:
>=20
> =EF=BB=BF1. Cross OS
> 2. Apply for both threads/processes
> 3. Simple, stable, powerful for million/billion of records.
>=20
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
> .../libsimplelog-challenge_git.bb             | 20 +++++++++++++++++++
> 1 file changed, 20 insertions(+)
> create mode 100644 meta-phosphor/recipes-phosphor/libsimplelog-challenge/l=
ibsimplelog-challenge_git.bb
>=20
> diff --git a/meta-phosphor/recipes-phosphor/libsimplelog-challenge/libsimp=
lelog-challenge_git.bb b/meta-phosphor/recipes-phosphor/libsimplelog-challen=
ge/libsimplelog-challenge_git.bb
> new file mode 100644
> index 0000000000..0a4168e551
> --- /dev/null
> +++ b/meta-phosphor/recipes-phosphor/libsimplelog-challenge/libsimplelog-c=
hallenge_git.bb
> @@ -0,0 +1,20 @@
> +
> +SUMMARY =3D "simplelog-challenge - Simple, STABLE, powerful of logging li=
brary in ANSI C/C++. Ready for billion records."
> +DESCRIPTION =3D "Async and Fast C/C++ multi-thread/processes logger with t=
opics. No external dependencies."
> +HOMEPAGE =3D "https://github.com/thuanalg/simplelog-challenge"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c5179=
52ac7c"
> +
> +SRC_URI =3D "git://git@github.com/thuanalg/simplelog-challenge.git;branch=
=3Dmain;protocol=3Dhttps"
> +
> +PV =3D "1.0.1+git"
> +SRCREV =3D "a920ed722ac05644c318c6db459a8fce68377d05"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
> +
> +
> --
> 2.47.1
>=20
>=20


