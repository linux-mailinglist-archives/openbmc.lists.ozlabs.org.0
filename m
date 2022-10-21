Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 220AD607FEF
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 22:40:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvGZ26m4dz3dtK
	for <lists+openbmc@lfdr.de>; Sat, 22 Oct 2022 07:40:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=F2UrHObg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AlEhzxd0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=F2UrHObg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AlEhzxd0;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvGYR4wPsz3chN
	for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2022 07:39:55 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A062E5C0125;
	Fri, 21 Oct 2022 16:39:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 21 Oct 2022 16:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666384793; x=1666471193; bh=zP96qBWKtC
	2e0zBVgXhLzzYBoUgJko3urhKx5opvMFU=; b=F2UrHObgpEFaOoAWYr6WBlkjn5
	OSHn/1n56epzYTAYhGlwUksTQ3axKyWtzgEhYflEbSKyyZgFAk6+GQKtNDdm2/f3
	N4pR5YuwTOf5huk6UbI7+i2E0iNM4ZQiY4lSbsYI8m4Y1uBJlX3E4Aj1Ql3co086
	5u6BZLyxNw8bPgwxvDz1uMem/mCEZ8ocVTJkCVZDjubBvq5naVmbaN2zf5z7AW17
	+hxBKJDLVgeMZyh+yvsT8ixM3J5IYGDUQ0CQpnjX8oHhEWFlgc2d1fyE+0SS7UZH
	34DHGYuPZNDb8rT+TLBOf7OmV2ImAeO5aiK5IqasjlKsxnono4tVjL9Hkw8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666384793; x=1666471193; bh=zP96qBWKtC2e0zBVgXhLzzYBoUgJ
	ko3urhKx5opvMFU=; b=AlEhzxd0wgX7qffm4Yx6TbPjkDi9LIMTm0Sv8XybP3us
	j9AzheURGha2hbLIecHmePtk+mq1iGacSO+suUkAlYxPESJpJ5gnxBZn6k4vvR3m
	wUmHiFCnSTxWqU1rbz8XO66rOfOqQ7QbqCLVVAov/glGQPp7o6ftoHo4kosgA5ja
	L0WzmLAf2KA2huywgT6kJtCZy66uZ2fHzB3Tc8DoMAEoMZ/pDHUVILTywl0R0W5L
	N64lTpTjmoS1Rhe9uxxg/hTb6AiMK8ahL4g8WveQerUoqED0l9/7XmbYAUdN+Hvb
	vJ3l5J7WWLrLU8ZULD9ikEF2D1RCZYlgNeACRx4BlQ==
X-ME-Sender: <xms:mQNTY8qYatlXx43-_4sGbAA_J6__hmKjAlfXpQIraBUGnkTM5CNB-g>
    <xme:mQNTYyqm1qWgt6Dk8eUHfbQnQ5Hjij5SzF_1_UL6RC0b1suqnTf3GujF4uEwNXRY6
    _H3VGjeLJBLXWu4nSo>
X-ME-Received: <xmr:mQNTYxPUxgfstporSRJ549zoze1ZY9sZqkT9iRRSFlQVpnVg6O0TdCWU5EpszVfxTluvHJON6yH8xItO2lHROySRWm-6ygkf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:mQNTYz7KmDKMV8HyZ36faoJx5vUZ54HtMvfdfv1R2rKTp7Twr5dOVA>
    <xmx:mQNTY76ULUKraVNxDscL8BKS0m2Qf4TarrN5MfHawWWJ0EXyc4TVNQ>
    <xmx:mQNTYzilGYVGYqR5qlykY4Al2pDKx8T4KveXSnQLLeWCVtxS3mUpGQ>
    <xmx:mQNTY4hAZRo6_HXEY8XDcB4A7egABb_25wx-x1kSoJVmJWCjxx4RLg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 16:39:52 -0400 (EDT)
Date: Fri, 21 Oct 2022 15:39:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Francine Sauvage <francine.sauvage@atos.net>
Subject: Re: compiler error : get_if<> with a variant enum ?
Message-ID: <Y1MDmAFeL1kg/5ip@heinlein.stwcx.org.github.beta.tailscale.net>
References: <PAXPR02MB768084801092880D4746547FE4299@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y03nKztaGeEn1tZg@heinlein.stwcx.org.github.beta.tailscale.net>
 <PAXPR02MB7680EE5542E3508B583D4BDFE42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <PAXPR02MB7680E1F677D12D5656CA3F72E42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j9MnuX1nXWZGvJZg"
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7680E1F677D12D5656CA3F72E42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
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


--j9MnuX1nXWZGvJZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 04:32:40PM +0000, Francine Sauvage wrote:
> But, I get a runtime error as all my objects are different:
>=20
> what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString: An enumer=
ation mapping was attempted for which no valid enumeration value exists.
>=20
> Is there a way to add enum types to the variant of a ManagedObjects that =
potentially are NOT in the object interfaces/Properties ?
>=20
> Or is there a way to filter the objects in ManagedObjects dbus calls ?

I'm sorry, I'm having trouble figuring out what you're trying to
accomplish or where it is having trouble.

I think you could unpack a `variant<YourEnumType, std::string>` from the
message (or dbus call result) and if it is your enumeration it'll be
interpreted as so but if not it will fall back to the string.  You can
even do `variant<Enum1, Enum2, Enum3>` and it'll turn into the correct
one.

The important thing is that you need to pass all possible types into the
variant when you attempt to unpack it.

Patrick Williams

--j9MnuX1nXWZGvJZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNTA5cACgkQqwNHzC0A
wRliig//RxQppRCvBEu8M7oKPweIz70e5Zut+9FR3oHKcgjE7K4p/e5jl7BTAAVO
K2E8YT0PTlE2Mwhv8EIIDfvW+Grgj6mCx3206PxY/n6JMKonwN1LcFRxmgQQnBAk
X1YIFgFNHt/sSIjGaLybSUxCWeOQw4U2boAJEDu+FaRm/dFMVXBLI+6OQ+F4ROuO
BQKoCvZo5yJLzvyiDn2zYB4+kf1+pCjxBJI6WcbkimppqKepQeDLImui8ZnUJTiA
8F/AAUOpEn1kZUFgabElz/mZJI6ocUdg7aEDOMGstmaSpU+IE58M9xjlEl1wMLBe
gtLTtZNeQhGm+mZMkN+/FjpEBFyzRZBPHBxlGVuM+Qd8gi0WWXm8gWdnFas6ylSG
ya/XTaztUpiwHXDYlo6q3LWT6QanTXSJMj2Fp/JMf+MRelyw1u9jBjXuvAfuFhij
FVeWIAbF5UnS+6tJieJZVvbLYLsG293OZDmm653Xw6RPtoqf2vtXMjuJMS651CLl
2v2xkFbkCTw1RBJi7u5IWZKZN4ROs8/L7M70QuT9zT/yvs4ahD7TcI31zIlImZir
WMeSf5tkzokLD3C5bJIdo9NivMw1W9yyjUJ26J5cSIfZlrG9WeMPwkso/bZPD+o2
F2gWKWoMnnP5JeL9dG3YFxjOJbc2ReZekfUWo6H+Vr2hwRxrZ/U=
=ka+n
-----END PGP SIGNATURE-----

--j9MnuX1nXWZGvJZg--
