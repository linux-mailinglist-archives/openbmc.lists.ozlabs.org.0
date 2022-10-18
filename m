Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8A6031A5
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 19:34:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsLZW2lZsz3cDb
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 04:34:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=sDElQm4W;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N7qDUkOZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=sDElQm4W;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N7qDUkOZ;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsLYs6rdyz3bjw
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 04:33:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 3DD1932007F0;
	Tue, 18 Oct 2022 13:33:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 18 Oct 2022 13:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666114412; x=1666200812; bh=c7n7JMT4al
	UYJiJI7FMlVtz+tZVAfbIF7BBAW6INTts=; b=sDElQm4WjB3WfjHm95f2QHwch5
	xa7CVod+x9eOz43J7W4pVy3WAqeOBpmngUdyqETP3ZxamZFpa+dDeMhONBXNg+EK
	Y/rCxcwCw4A6u46M14rgIm9E9slCiP1RnAVVCuYyTdoZRADAVfpq3YyIbOjzickH
	U1ibaZhzvjAckAm5+XtczVBfHyGai0pNF5KJN3EocvQVGyHgUCiw+S26PVZSXABr
	KVfQ/aYSSC0kkWS1GbhPPECHtMo8qf1v+tzcAli9lzLUdq4DS8DTwxcu6Sc7/lYL
	MViI8MhWi/GuOEdrHjv/SWcgZjQ9IEq0yKjlhZ1IPS4pnyfE5uyog+GCijBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666114412; x=1666200812; bh=c7n7JMT4alUYJiJI7FMlVtz+tZVA
	fbIF7BBAW6INTts=; b=N7qDUkOZNhotAGYVSN3nrurE39Urr+14ruIyU48Qttu3
	MHAR8nYSV+otXT7MsldBwoenUjXzV2HYRt1NCJ6G00IDx62FpRcRGXMS/PzPKvwE
	ip3c2rZQru0JrkDK5HZiBphLiD1X6BYT4yvIfqPmgv+iY5oefpSd2/4DrgxSLETm
	83Wn3wTPT24C2rwRk+JaqVSZAsPesZDg9D1icTedvtEd3alabBlo6Aq04B+esqTY
	D3vLTh3Y3rHZIzYBEVlZo1x6jR4WzAYXDThjzQSCL70OXfXI57B3BjIcHflU6Zkx
	AsCyvmzI6toeaRGfbe8rJMLxh+r3B7X6+3MW40tqeQ==
X-ME-Sender: <xms:bONOYyBwrqPHBc9GvNIlnK-muRXFDahOR-Q-JYY4-qzXOhKENYheSA>
    <xme:bONOY8iZeM9dpHBusK3N2XJESfrFHNCKS--DCqLrEM6acFzOg2cdLnYPdzFlyDGsb
    IzK14K6w4B4mbNyZuw>
X-ME-Received: <xmr:bONOY1mCQ9yreUFtpdj_FABTT5VV_IZpGYM7IyGG-app_lyxZ8VFDO_wJYuBAGLrAheNsY8PVT4VGB4NBhwY4hFgXBtczRdX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeuueegtdfhteeikeekteegudet
    ieekueegjeeludevueegudfhledtffdukeduteenucffohhmrghinhephihotghtohhprh
    hojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:bONOYwziyQxT-I2VWvJshxxAW3eP7bKyPnNAxDxUk_rP1gg0yAsBXg>
    <xmx:bONOY3TLX9qr6ASV7BPBvDMMIP1LKl9JpWPw0QwHzAf79KdtyU2-rg>
    <xmx:bONOY7Z0arMsZtWViHMO7cluuKohz85aFJ7YOdJL_okpedR0j4S3Gw>
    <xmx:bONOY44x05jlm9q_OE_z-euv0QJVaJoXtIF08IiGVrlMmayByXbvXg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 13:33:32 -0400 (EDT)
Date: Tue, 18 Oct 2022 12:33:29 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Miller, Troy" <troy.miller@hpe.com>
Subject: Re: Are there plans to merge up to Honister 3.4.4?
Message-ID: <Y07jaeJ9/WjPUrEs@heinlein.stwcx.org.github.beta.tailscale.net>
References: <DM4PR84MB180655396433F817B6361197E5289@DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N+FDSHOpFRu4Fo1q"
Content-Disposition: inline
In-Reply-To: <DM4PR84MB180655396433F817B6361197E5289@DM4PR84MB1806.NAMPRD84.PROD.OUTLOOK.COM>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--N+FDSHOpFRu4Fo1q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 04:04:16PM +0000, Miller, Troy wrote:
> The Yocto repo is showing 3.4.4:
>     https://git.yoctoproject.org/poky/tree/meta-poky/conf/distro/poky.con=
f?h=3Dhonister#n3 =20
>=20
> OpenBMC is still at 3.4.3:
>     https://github.com/openbmc/openbmc/blob/honister/poky/meta-poky/conf/=
distro/poky.conf#L3

There aren't many people who seem to work off our past release branches,
so we don't always keep them promptly up to date.  Since honister was
EOL, I assumed nobody was using it and hadn't checked on updates in
while.  I can do a subtree pull for honister.

--=20
Patrick Williams

--N+FDSHOpFRu4Fo1q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNO42cACgkQqwNHzC0A
wRnjkg/+LZp4lSIsviwORs+BAJVCGfjoYk5q9BaVUz/4382t3U+iuB4iUBdNEG/T
WnczYAKboM6hAO07fCZ7Sjk3PxUSMmDgZLa6hDMF1+YU8ulVneqmAnhLWpGXMMe1
Deu6JCrBwFagXYPvs6KZsbsfp6tbjSc/GG7tDm9UZAduUL3v5uDqfRcwuYOK8VQo
+1w/35AEjTLZG5V8AiN0/RYwQkLXX24LIn34CDplmGqKgY1v2y7gE2pn3mkvbT18
L9P9h6geRy91NoKFTgAWtsDhXuRa4PJ5hYPliC++CJOd6lwFd0Rij2+xJQiwZoXp
FOWo8p1+Zb0xiLEveN49is3Pp7inDgLNooqUbClbbAR79Nt7usypANUdu/XcNXLf
Hq7+Kl649xqi/9BVlQYzwdNkw2D3iX4dCNtDuL9mP/Cb93tcgZElI0qIbePdZVql
O2Ald3r8cQ19EA+DWeheX9dLEtUJnDGL5U1YA5/b9wp5gaHA+vubgMQezLLo4UgN
lRcLiudXVu3iHZOY9HbHQDovTxNMG4zUCnewuBlpxe79YVv6EmatG8258+S1Qowv
FZ0K+vpEDESxRSW21mtIODDQYRVYjRBf/mr1aFJrvinyu+D9YIPrpUqxgYJba7FK
TUI2V1xdW+GCWV2UfDRqwn1iIvejdwyD4E343bS9l+wV3hvu6aM=
=NHIi
-----END PGP SIGNATURE-----

--N+FDSHOpFRu4Fo1q--
