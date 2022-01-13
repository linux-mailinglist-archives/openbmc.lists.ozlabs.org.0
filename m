Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B2C48E086
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 23:42:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZfZt3jpKz2yg5
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 09:42:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ltNrURul;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DfuG31tl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=ltNrURul; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DfuG31tl; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZfZQ1qgvz2x9d
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 09:42:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0D7493200B23;
 Thu, 13 Jan 2022 17:42:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 13 Jan 2022 17:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=BBxgMEGNaaj+gNfcem2k/eAGN2c
 f8+cc+UjEWCFfkqY=; b=ltNrURul4dXkudDAdbvQ6iCSjS8B2O3vAb7EwTdz+KQ
 N+rSWTlO84sAsWuD8ZudHv74hcpGO3RRophf4C6rA48b9kkCummhKckzGFnFPAmT
 lffv6T+7I9J6f1m5G/GLjU+g9+3ijxbGVi1HLpAe0VmhgntviDaiNWpuDAV9CWkI
 NCEq3v3yVqD29w/nmaD+gCQS9ngi14z7wrNvcVdQsKnbVuXuJ+wDKeliE76l7yr/
 vmrLsmneQ+D7dgJzABvSwrJqTrfs9+JOWybf6wmmWItgGXjGEvpGQUDhcr+F+rYv
 NSQ7QuLl4L4mEtE1pTbg+UgjLBErWP8DNG5HeF5EEOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BBxgME
 GNaaj+gNfcem2k/eAGN2cf8+cc+UjEWCFfkqY=; b=DfuG31tlESBogPijCd6ny/
 vjpolOc3wEu00Sc62ZB1bSHE5TcnFxqCDbOJqyxWu9/2BvaFIOnxr2fvQ4av/SIU
 y3ibwWfbP3MAbjAB5HdDcA/L9RgNx2dErnp1M+4uLmKQarbRDeCJhOPeFFbfH+9T
 un1x6DhMBvljafDHlfaNeA5mEtgZGfmqHeXoiyqpt91RV0D+9BjFMQc57G/Hfun3
 77aUbWgtjx/gpfmXLvIMbHbE5rHG/wE5ewyDaKcqMt2P22B9U29NJaLQ7vkoK2NS
 e8bUUHaEacQ2BRYr8b8RxMnEhNAYasqzEvHwH4ReKTdkQ/wJv7l7Km9d0Udqc2qw
 ==
X-ME-Sender: <xms:yargYZ_HQ0S9_gbdmkHE5Pvtbdem9608PkyANsOHdjb2AWWZjT_Vtw>
 <xme:yargYdv0viZ_gGbPKVL5-xs-YtkhzwdYK30yVV3gNSjNoN89G8QUnuI3vyLaYK04R
 m-7kImsKyJ4Wb7YAxg>
X-ME-Received: <xmr:yargYXBbj6pOdzC5Yh5AEJ1rlkVG8iJp64VPBN7xCf8o-17KHL2xuQzrfR47Rn6tEVD8njDPQnYNqtpJj2ObcnrqfNx_Nty45g-YRiJUCzWxrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdeggddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudefheel
 feehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:yargYdf6UxtHW9NMi6oU0t6GuGFDSL1yiXYruf8ICsOwxbA2Ftwc3g>
 <xmx:yargYeO7lgIiMyt0leSig9S3IjW0MSK45CupJKO4lfbcD85Blq9GKg>
 <xmx:yargYfmNJhdTiTOiLaDTXmEY7vqOcqAeyMMz9tsP1Qt1VgE4FqEqXQ>
 <xmx:yargYYV2wvXJoy4Lm5RP21-DjF_MDt-ICMRQcWxSerzzwHCvFsQFkA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 17:42:17 -0500 (EST)
Date: Thu, 13 Jan 2022 16:42:15 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: Sanitycheck problem
Message-ID: <YeCqx/CTU7pRDVyj@heinlein>
References: <BEA6AAA9-904A-40D7-B114-A9229B38F0DE@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jxITUiAZXBtOdASi"
Content-Disposition: inline
In-Reply-To: <BEA6AAA9-904A-40D7-B114-A9229B38F0DE@gmail.com>
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


--jxITUiAZXBtOdASi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 02:30:43PM -0700, Mike Jones wrote:
> If i bitbske -c devshell dbus-sensors, them meson build, sanitycheck.exe =
fails with a exec for at error.

What is 'sanitycheck.exe'?  I don't recognize that in any way and a
search on our GH repo isn't showing anything either:

https://github.com/search?q=3Dorg%3Aopenbmc+sanitycheck&type=3Dcode

--=20
Patrick Williams

--jxITUiAZXBtOdASi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHgqsUACgkQqwNHzC0A
wRmT9w//TKJ965wQRTyvX5ufi+iw4MRGeshc305mTioA+RbpZHTJrz3FCRFeKPJN
TeGt+1/K3DTrjsbeHLUMfBY0WPsigz39FeCeT7K29yyip2vx1D3sgzcnCr7RIW+G
LKaaX9pDyFkazEJlzttzq6LrjvXxcesNcxGxeKK0mQGmTpqtzSekxoXyFcoZWfni
4ar4uc0x8/GwUAspy7nO1SWhHybQnzWiFivkUEDb27z+A7PdwZrDWAeCq1ltSgZo
5F0Djdm5plZBU6Sz9DnAWoSbLzuGCrGuU7CV2wmbcTJh5UzUH69tTB6Vk3lKFguu
2zHTXU6R2mP5n4nHlQ35S0oT1AWZncAQ9YRT4zFiFdIXuAmE2QJ7IdaKeIo3lWKJ
I/1sbGRS3xjiIarb7l28E4abOR4yrh9qqhalUQweYuwKJQHeHeoE+qBorCMJuFFw
csFQEDWjoOBbpDpulFeao0LyQNMltF3gmzCG4DUpuOW2GYLpB0pPXooAkWY78Uu2
Q5+0qx3HaEoyRAURkXTrJmrC+qHYHMbja8dT+QZ9KdiArbgMOME8TDqz13Igb0RT
Jnclp0lvZUvuGuc8XdbneXPqIRa4L4sovxtNxi7t2hgXwwZsCr389tuPCnmPZbbv
iaht4d+CYgmL0ZZeMLGXM8A+vwtmXJDjr42J7wm9W00Di4x7fkw=
=yIax
-----END PGP SIGNATURE-----

--jxITUiAZXBtOdASi--
