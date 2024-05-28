Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 832398D229A
	for <lists+openbmc@lfdr.de>; Tue, 28 May 2024 19:41:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ubscnkok;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XWZnF72U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpfhW4dWjz79nS
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 03:31:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ubscnkok;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XWZnF72U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.150; helo=wfout7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vpfgs3YKSz3vgd
	for <openbmc@lists.ozlabs.org>; Wed, 29 May 2024 03:31:19 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id A06E01C0018C
	for <openbmc@lists.ozlabs.org>; Tue, 28 May 2024 13:31:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 May 2024 13:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1716917475; x=1717003875; bh=hHZ71bfBH/1zhzm8DOv0miyLrMuQbXMT
	NC1Nl+wZ+VA=; b=ubscnkokEt0/3+cbWu+lAHBcJl/pNvLdSRXsWik3l5P+NFy3
	ORdF7n+8RfivRHKfeAKfz9FXBYNJi2esIcgeKTDJDesIqwPudrgDQJyvPsZhb5uV
	SuJTwH4mj6x1flKrLP7TT33GGJFcKtCRK/pLfT2zjqhLgVxA1mHeYvzkglt6e5xb
	FZfaZntTSiqCWcBdZX5cOxT6cjG9uDRJ+wPR96/ZzP/AMVaoyLnIR3fdbrAr4oBO
	F16OTKJS30TCwpLnNj90O68UkEvuOnjlGL7B4+B+BPDEzbwh4KDFKr/bqTatsrYr
	SYAiuVXGUgt2Pd47bRT0uJczQMBKNSqSdE5JMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1716917475; x=1717003875; bh=hHZ71bfBH/1zhzm8DOv0miyLrMuQbXMTNC1
	Nl+wZ+VA=; b=XWZnF72Uxe79RlksMyS9pYmZVDyW8PszuPfzrWdm79Z1abR72lM
	RFM4D7xNf/48q66odfB6Lx49Be5N+lJlSDn7ibV7izL7YsdUG2x39ak/az2lZu1s
	IV4vITj2WvbiypK7Z7lkxeugjghCr3JSR2PK3oXYDAfkle0/9WQOlgZ58PTG1ocR
	L+UcJ2SlaIRGQXcbo9rj51wpNkKYGjdC8RYIocSVqe5m1Gt6oFfoaaIDpQ+0ogGs
	ok11p/+BhtysqiODPIws9qsZntKHpeWEaTj3CTJ2REAOnek8CjZ6r1tmZpRJmD/6
	ttZP/pAOI39oaaVoTYjL6DQYuEW30kvl3Rg==
X-ME-Sender: <xms:4hRWZvm0Oen3jfuKkJyClmSJlLIdVd-WcxOb70G23jnhrbIQNnf-yg>
    <xme:4hRWZi3gqzF2W1RTVYKwQUIQPvmy-V1KNvxbHBoBETIMVh0TPFpoBr7Xa68OlkHke
    rmJchCcyGE4zFzRMuA>
X-ME-Received: <xmr:4hRWZlo5czgspRYXtzLgmBYENVXhGF6-cxLlLN_deAyw9BySiG-As--ctN0v0tmWm_7NeR3tR4_quN6A7GJwmILxAKnZjwdpGb0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepffehgfdtudektdetuddvkeetgeehlefh
    vddtieffueejffeiteekvefhjefhueeknecuffhomhgrihhnpehophgvnhgsmhgtrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
    thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:4xRWZnmzcb7-KmPSgcocfxkrrf8K4VPPypwcDAx8Y0dmqh-J0eZQnQ>
    <xmx:4xRWZt3kd9vzc0b4AR6ZVNUmivaDM4jo7Jei2QXseR8w25zbvf3Kag>
    <xmx:4xRWZmucTUwYHFUMZp6mbRhUx7RfMemh_mGJkXqT-TmSEB1eWcZIAA>
    <xmx:4xRWZhVN1aYv3_sOQfMMfgPjPtifws3sOAKwF_XZ4mqQ-yEWyVUDmw>
    <xmx:4xRWZu9U9F2cDGMomNUp61I10ndnFe7UHCwCGJ1lhnBtJW9i2GH0kxzc>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 28 May 2024 13:31:14 -0400 (EDT)
Date: Tue, 28 May 2024 12:31:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: /var/log as persistent
Message-ID: <ZlYU4X1sXIou-C6L@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eIHCE9cNNd/iHQrz"
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eIHCE9cNNd/iHQrz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

It was pointed out that I did not do a good job of broadcasting a change
I made back in March, so I am sending this out for awareness now.

https://gerrit.openbmc.org/c/openbmc/openbmc/+/69959

A default setting from bitbake (to VOLATILE_LOG_DIR) was causing some
platforms to not be able to persist `/var/log` and instead it was
mounted as a temporary directory.  This meant that even if you
explicitly configured journald to use `/var/log` (instead of the
`/run/log` it uses by default) you would not get persistent journalling.
It also meant that applications like `obmc-console` log files were not
persistent and would be lost in a BMC reboot.

I had asked a few machine owners and most of them either had it set to
explicitly unset `VOLATILE_LOG_DIR` in their meta-layer or through some
downstream changes had overwritten it.  So, I made this the default.

I thought this only affected:
   - machines that explicitly set `Storage=3Dpersistent` in the journald
     config.
   - everyone's obmc-console logs.

Based on the report from a downstream user, it seems like there might be
more effects?  I'm not sure at this point, but advertising it wider.

--=20
Patrick Williams

--eIHCE9cNNd/iHQrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZWFN8ACgkQqwNHzC0A
wRmAWxAAkLyAcv/NYu9KULo/Vh/NA42jkqFriylM4R5/qa74WCROGcKpNKsGmmq4
wiEzs5AUXoIV6e4unWECt2aoYah5fi80s4izVck3SRY0mJhzfUeeETagzZDGhw7b
RuDY24m0243fe4a5Hzfshz15rpm/QxmyrTi+6jpngWupXNekxPxqLDC2dsix6l+L
kbEhpk0J9RPzaVJUb1RWzM236e6xG2dzzM+CWmViGDWBY0s15RCScGS3ZswlGlNx
qWbIA75i1x4+FcdCwzXz/qLdy+1Q3lsLMU98rJGRkMt2jBpg0RdBU1ew3EpwDe+U
JwV9DeTOs5VXr5YWc2n3LcJy6B8iXCESMGOZAFrNFp6OBY3CDXYNOeTkU8lHmcJG
5zm4i//e62LyNzNCm00DcuLCE9XJfjrvmylAq2+JB2DO7uHC6hYH6+nWxw2yOKUY
7fp2yBJ2ZpHQzcdTME8ASbjLZrakJ5YKkGNu8WrOhh2Wq1O/a+3+y1ZIRstzRrPR
HxEU5a8c893EkG2ButdMRfahQwKbefe6sL0UCEtZuLragTr7fdHwOP7Tl+dsQIi3
ZCruZFrf5dt75MdqgPlY7TDhO1SaJvLgJTbB2WLdRRBNiUj0ig3PlRYnZZdJP2a3
ToR/FUZSnxCPzENTs2RoXVdrqu0Ry+dqPUaVLwXmIpSFVULmgl0=
=AuLY
-----END PGP SIGNATURE-----

--eIHCE9cNNd/iHQrz--
