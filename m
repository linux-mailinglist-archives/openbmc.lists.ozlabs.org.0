Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0E489B57
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 15:36:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXbws5qTxz2ybK
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 01:36:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=tsyoIfsd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=EbR3u4UX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=tsyoIfsd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=EbR3u4UX; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXbwV0rJgz2x9Q
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 01:35:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1269D3201DB9;
 Mon, 10 Jan 2022 09:35:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 10 Jan 2022 09:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=u+bX6elSXM6jcpXZ0bp5Fdypdem
 mDvrEry+P+0meVzI=; b=tsyoIfsddJISULeqFe5GIKqRXhN9co2P4kXKoI33bXh
 mikamuj324gAaaHYTSsFLn3qaCHpC+xKf5oW6iIdwvpk0jqQpwOIWPQlUa2xGvkb
 1BzM/qtqAarMDOpg85beFZmMbL9wCTH0wMZ6l8S3wADwxlgUc+Jt7zkaqHIB0R+m
 dPF5uGR9awSmaSN6CF8WC8RwmVnaxf1VBC8MLI4VyyNmGgIkUzv83wbs1baYQ2NU
 sCfUi/0PQ7poZQlhAV07Qp4X95v5xq3k7iUhtYR2YQGV4HdUwV60fILSms0S/awg
 7Zy7HFTAYQGg7UndmMko7nRNDfqMfS3Vbyz/cLPc+SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=u+bX6e
 lSXM6jcpXZ0bp5FdypdemmDvrEry+P+0meVzI=; b=EbR3u4UXcACVvvox6LBCvE
 ZFJHolUhtPB9jrxvxwOZalBUIb0x8OjL1STc94+V5sMG3zalDIPMT4q0nADtQQh8
 Q/MkL9GCODPSXqTTEMW9vv2z3X2CWOc6JH6IFJMKKEo1xVvbLJdm3NEwE0C9SkRP
 8PwNaKMvD4069MfFsur7PecwuCiBg3ASv3MEdC2lGscEzUNTtr0BS3ETqbLvtg9C
 nymGam0eX/jOpzFV9lFUQN14lwxQLCrcYFmRa+FA3sJOfrm+4c/VYzwzxRxkazIk
 M9nymidJbb2MrljMsxdwUY6DNIoh5aCx6wd/ZNJyBNS/ApuCQZ0698Hh+3z2Uq+g
 ==
X-ME-Sender: <xms:R0TcYVIIWJ7b1FuwDvV239kdMNJLzlgCqQRSwb-nCEsAlEVuT0DAGQ>
 <xme:R0TcYRJTg5LcUL8hGiLx7N95ODpxyfDajcZgH6GYvqpt7Q27UoZ_edAkGCawJ39HE
 gUoK18gCYzrlOPj1gc>
X-ME-Received: <xmr:R0TcYdvihIYRbtbqMlv4QbobNOJTd8IFGobs3qj4jmIiUc6SlHgHvcFw7wsrDo8DpO7_dZzjfj24u6EZuRdZqEx5XhsTQw8YiXBAtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtroertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeeikedvjeejheetgeeggeefgeff
 teeugfegtddvudeggfeugfefjedvuedvveevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:R0TcYWbFLPtdR5cT-gXlLc-FubxbgGXohI-Tnrw3virEVa4QzYLKHA>
 <xmx:R0TcYcZ0tdUq0TRCYEMNPDbaRKkV1mmLiBtyyqTqCxvosuJONRV28A>
 <xmx:R0TcYaA4m-BZ3XeR1ibLccBtSZfjtUjS3jw6NYRGGG153sb9XGfeYQ>
 <xmx:R0TcYVBg-9ZQVXsLeStfEZENi5mW-BcWC03bdl4kIYMG-r-mhyZQlg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jan 2022 09:35:50 -0500 (EST)
Date: Mon, 10 Jan 2022 08:35:49 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Zhao, Jiaqing" <jiaqing.zhao@intel.com>
Subject: Re: Configuring VLAN interface via redfish
Message-ID: <YdxERQcSndKvmtSy@heinlein>
References: <CO1PR11MB478536190313942A25F149BB8E459@CO1PR11MB4785.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wdViFOInfE/YI0Ij"
Content-Disposition: inline
In-Reply-To: <CO1PR11MB478536190313942A25F149BB8E459@CO1PR11MB4785.namprd11.prod.outlook.com>
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


--wdViFOInfE/YI0Ij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 30, 2021 at 06:08:38PM +0000, Zhao, Jiaqing wrote:

> For #3, I got two ideas, I'm not sure which one is preferred
>=20
> 3.1 Action CreateVLAN in each physical interface. Payload will be {"VLANI=
d": 1} format
> 3.2 POST method of /redfish/v1/Managers/bmc/EthernetInterfaces {"Id": "<I=
nterface>_<VLANId>"}, e.g. {"Id": "eth0_1"}

Shouldn't this be discussed at the Redfish forum?  If it isn't documented in
their schemas whatever we implement is effectively OEM.

--=20
Patrick Williams

--wdViFOInfE/YI0Ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHcREUACgkQqwNHzC0A
wRlVSBAAk8sCvXktoW7PjqdfQsr/6ZQECx/5z3LIsnbG+k76sViFkJyJrqjmGKu1
dwpN2eqxRsI4EiI28tMh7anKPQi+pOG1J23ldEYqUE8PZYpKyzk6r2iOUsZhzlXC
AaSESWRU99JPZjEDClUXR0VGcDBSH0MLynkZrb/ZZMMZP4frUU2qPXbVBxNWXesj
l/dV+ba3wyCO0D2zoE7Ay5m8MjeyXqjBnKo1iYlV1Angdt40sx3RqoamL90QUta2
fb1rZ0mHBW6feP91mtKTJsYm8ZJFkLJ44W2LoTyK6UECUChzvX4aL9YtI96Dc5Y+
0jnml94oCBArgXjKjJ4BYSvpJBzeWKVv4s9U4vJo+Dr9v7/J0YRFVOrJ2oy74Ljp
JE2K2C3Yxz0/jd3LdfOnANzSyhtJyR/5fE4JYG6TEmyOzjue+2qJ2b48WAbdf+AR
5pGOgq61ZzN3bq4acQGJ+aeMkZuySKsaPUz1o6uN2d+32rM+ItUkpFzDXzk2oppz
gJ3S54E3pcIWu0UK9gA9by6KsQ/8SLAMzMiYPKEUEH1pxa7w0MV4clHoE4/NSgz8
GVtPRZDGggQ4TJsykzVdUUYeFtLmhbsLmxyfS7HT66EWNotd8k+Jp7n+rHygtTN6
48R88IOm3P9efz4X/tajjoVjhVfoukqgHn8XorFq63Sfw9UTV0Q=
=bH93
-----END PGP SIGNATURE-----

--wdViFOInfE/YI0Ij--
