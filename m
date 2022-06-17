Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27154FB24
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 18:36:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPl7B3Frjz3cD9
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 02:36:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=E4QXulJG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WIio+3NC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=E4QXulJG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WIio+3NC;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPl6g1wm7z3brQ
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 02:36:25 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 18E513200997;
	Fri, 17 Jun 2022 12:36:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 17 Jun 2022 12:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1655483779; x=1655570179; bh=ojudnx4yMn
	QPbv8REuFLT2Ar5BXa8HRwWn3kMiZ+Vuw=; b=E4QXulJG5kKLunMUr+ufwdBnYZ
	A/srwzavHnB0To7OTEH2ahfxZ4xUjc4ipe0WKlriYEmOBKHxy9WgqPMIwghS/HiB
	17iieWX4S9UJHOx4G++ZPGIo6T5YjouzRhZvCftt2GT2gdmYKV2oU7cy9oUwh0AC
	aGM+I8zY4RMGajHaSJPVB26PnlddXw65LqqpnJpZyRryeo9nshkK24gV05PmTloV
	rXpspsxrrNCg2g0YY34InYTPMvUYjADpEnQmm+pJuYHIG/C5Pd5EHpAZoqtA3ghW
	/40UlzihSQQS6k8lY6+5lui6tUbnjwZ7Isbs4ggGD5OlFvD8KvjpW7H+HdqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1655483779; x=1655570179; bh=ojudnx4yMnQPbv8REuFLT2Ar5BXa
	8HRwWn3kMiZ+Vuw=; b=WIio+3NCdIl0LXyIVpuFFbgfNhhReb4jaLw7rAipF5yJ
	DtLldr/IiY4a0L4lvrsX+wxKl0tLDDtm02Tny+TE6jjWmvD+yP4BF+ns7m0cRvKk
	Yurx0hh6YLf0aW/N9P0iCOxm0TX144qdGa/CVVlVHz4NL7VnrwGH3kZ/siGCWppO
	md8WCBi+kquja58KgfhaAWt1AqScgWmHggu5K7wDhemYm48rQFfUawQyj2lnH5uZ
	IcUB7X9MXX0srVQPL55rmEDc99iONrU6SIK/5yH6TFhXerlmACA3InI++MBSTgmW
	iBwn+oOkiup9XvWjvbOQXdgRAL17zJVK7aXp55u4tA==
X-ME-Sender: <xms:gq2sYr7NwmM3h2xU5Cx4hCAYPZUHvRi609x2uM5k6At18jx7K-j58A>
    <xme:gq2sYg5q6DWoGVD-aPF-2Cm5twLgI8mncXWeO4e5NwUH5JkFgALpRu6PvBK8tcRTz
    vDkKRYY0PEs2gP_OhM>
X-ME-Received: <xmr:gq2sYicUhqPPvqT6Ybh7L_wzA9gz0NOmXRv4P2RVkesXmoJzfRmWnUY2xVoXcb04VjRxV59DKtGR-T4HEB9uFsUrqNZd92UENcs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvhedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejjeetleehleeijedutddufffh
    ueeufefhfeelheevgedviefgffehudelheelhfenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:gq2sYsIKCcHa9NHZPWNxJ4MB3CPC4Pqg73GKxC0jbigRx4Z-XRGxiQ>
    <xmx:gq2sYvKkn7M3SyZ-d1VyllFnOMnwDw4rpPFLL_fId5sUKcVMXUak-Q>
    <xmx:gq2sYlxDKVUoERIe2qmH1AphoizWpKIio7ZdAI2hKPchaGH7nSSYjA>
    <xmx:g62sYljsOafkXwgWSGuNtokCFOh7i78IGWNkxOv6SBz-M3FtzJOS5Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jun 2022 12:36:18 -0400 (EDT)
Date: Fri, 17 Jun 2022 11:36:17 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
Subject: Re: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Message-ID: <YqytgdIR0kZUXZMN@heinlein.stwcx.org.github.beta.tailscale.net>
References: <HK0PR03MB5090481BE38DBC9CBC513F99CFA49@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <HK0PR03MB5090F2D83AD05E5774A65910CFAF9@HK0PR03MB5090.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c+2sDTqpRFKAnR9W"
Content-Disposition: inline
In-Reply-To: <HK0PR03MB5090F2D83AD05E5774A65910CFAF9@HK0PR03MB5090.apcprd03.prod.outlook.com>
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
Cc: Tim Lee <timlee660101@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--c+2sDTqpRFKAnR9W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2022 at 03:20:04AM +0000, CHLI30@nuvoton.com wrote:
> Hi All,
> Share the root cause about this kind of compile error in ipmid at aarch64=
 platform.
> After debugging with boost/multiprecision owner, we have found the root c=
ause why boost v1.79.0 got this compile error in ipmid.
> More detail you can refer from https://github.com/boostorg/multiprecision=
/issues/472

Hello Tim,

I saw a PR that someone submitted related to this problem:
    - https://github.com/openbmc/phosphor-host-ipmid/pull/183

Was that from your team?  Can you have someone resubmit it by Gerrit as
we do not accept Github pull requests for the project.

--=20
Patrick Williams

--c+2sDTqpRFKAnR9W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKsrX8ACgkQqwNHzC0A
wRn3sw//Qgoc+oDmq/HVqJTYFDrk6AfNJUxlEdH/xNUVqnqZm4nHE0yQ5bK0jD//
Kfc+pSGontroAufzUFLNA/ecieJhtdCiFSohj60GmbLe0VaWy+QQyyGay4scjv6U
GNJdKa7MVZsMPlXbVXdSMMaSCw1Ou0TvGyblPtQblS7/T5us88xEsuZIjqJILsWh
A4Fa38mv+A/jeJFxKgtgRVj5X+g4+3pJRZ/6U2KoSQUWUsPxeviFfLUAb9DYDHQL
V74S6luGXfht1p+gSlDCnnUEl1V6i/wOzVouF7ZMP586DCIFXt0q2vTfdRjzyrpN
b5WhPEEX0rtc3v2lJinglJ0w2ZVkirzSxklZIl8AdxPGjQ9YaE0ysLNPb7V22EUz
Pe6/ADvDJ60i8cKNuXAp0NX94k8kvn3/fCsjQVlcpqi9TgGk8iXyZnMWpnan1/AU
66xffOPLtiuJWHQK75f4WyFaLsdz7NIHWE77+kETZK2ycgfWUrVd9iGhjac91Rt3
ikI2zbshoGlK2YOwnjQxeNfUT7cqw79jpNDUzBAIDy7N7hlttr9doxW8tBT59dFC
K3swmqt6EgN4ykEUF3Mkma44FHGi6abzcpYXWwBgPao/OAhHqy0VJVfnsiFcPLBt
mnjWKjGceLwzWi/sxhc0yE6g14hboq0xXnxdLCwuBGd80rr0p3g=
=iz8Y
-----END PGP SIGNATURE-----

--c+2sDTqpRFKAnR9W--
