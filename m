Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C8E601DAD
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 01:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mrthk736nz3bj0
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 10:37:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=dSL6oIYg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=P4iigjOj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=dSL6oIYg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=P4iigjOj;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mrth43g5Lz2xJ7
	for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 10:37:23 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5E27632009B0;
	Mon, 17 Oct 2022 19:37:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 17 Oct 2022 19:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666049837; x=1666136237; bh=GJAZMmR4zb
	G7woWj+r3bkkKan0yNg7lT9SeX+S6bV4A=; b=dSL6oIYgxlmUTTC1ohY0EmHCIR
	9cqvU/QQyQl2JNod0++PcOmdNpVtezUGzJ/WF0Z0cyP22564AYfoDnHT/dMj9N0h
	/nQqEBavupjTvI0+pSbSdq5RDyvJAof8E/tAb/iQxSzGJzu5kIGRbL0LIugQqtqq
	I1iuzi5YoWVoxXLgYDJwmU7HTuiOcY/5e+SsUg6IhNsyxuhRw3yMB5//Qku1jtzP
	NsVJQXrbiThFewc2kow96IqsrHLh4GLJZlgwJYN+fYFPqgAglcSLqzOjBUAA7ai8
	tkeI7TVVzpNvilyaNG6CauHsbE9q3+rQtg5APgWRUjMLAFwDfxiWgvIhPeXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666049837; x=1666136237; bh=GJAZMmR4zbG7woWj+r3bkkKan0yN
	g7lT9SeX+S6bV4A=; b=P4iigjOjbAymphRTPDw/G4m+Zf3ZeJikGIUPlG79ZLU/
	61bWV8Yr59dTqOoCOpapbgxKukT3A5asV9Dz1HZLcg9i1KkvoNET0scXRA2nof0i
	UeoFH/T29pSBAOjABU7yypGf/zEzGCjM9mi2HQr2Swrj9mWoTKP1UYJWMMtk6DiK
	YqbFPr+Ka6wFBdBiZb8QTt7+nGQMEH/1l/zZ91N9g0bEan79LYjoKrsTleufl8pa
	0txGEWO3mZjPNBFMzt1/Xc5xJtEp+x9LhMdOa9SsBbvFUOCv85LFJvFQCrZlxSY5
	pzM4pSqLAEj2Wvh9khbgA+GN/pMJYyCVk5G3A2xHkg==
X-ME-Sender: <xms:LedNYyoSL63Csw7epBw_SthUHphL3YKeun4EWdfGYF7Xv7KKo-_hjg>
    <xme:LedNYwqUCnoMV8viZgHymBgQeDbulj7kXqbAJfHnWaX9KXsPkl0stLZyp0989wA0A
    E-_JO0MPlrXxpCsA8I>
X-ME-Received: <xmr:LedNY3NcGpQbfJ6jN-KdlDdlYK22sjbaOPnyGEiHvcWDv3wWEjOKdjozJr8fGlSwdtGY6TmZn-kuJVaFC8DBNzKojoxcGmap>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeltddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:LedNYx4bMPdIrCQ8BTs0bqD6N44KIKJY3yxJPFc_Jlsu4lwv_k1wQw>
    <xmx:LedNYx5ExLefYmMkyfwV8z74hY-ym7dU3gPs9xCXjA_iE1RXHYnIbw>
    <xmx:LedNYxiRUuRxaA2pKkUsqWxVSw-SP_zlT3MbJ1LYMn0HoHl0aEZ1Zg>
    <xmx:LedNY-h0vWjMnmhBGJxOsoUSSTgQwn_s7IVvj3QaO2U1wNpA4vSw3w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Oct 2022 19:37:17 -0400 (EDT)
Date: Mon, 17 Oct 2022 18:37:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Francine Sauvage <francine.sauvage@atos.net>
Subject: Re: compiler error : get_if<> with a variant enum ?
Message-ID: <Y03nKztaGeEn1tZg@heinlein.stwcx.org.github.beta.tailscale.net>
References: <PAXPR02MB768084801092880D4746547FE4299@PAXPR02MB7680.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cm/vvCEau+jGOAtF"
Content-Disposition: inline
In-Reply-To: <PAXPR02MB768084801092880D4746547FE4299@PAXPR02MB7680.eurprd02.prod.outlook.com>
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


--Cm/vvCEau+jGOAtF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 08:13:20AM +0000, Francine Sauvage wrote:
>=20
> const auto* flexible_module_type =3D std::get_if<sdbusplus::xyz::openbmc_=
project::Inventory::Item::server::FlexibleModule::ModuleTypes>(&flexible_pr=
op_map_iterator->second);
>=20
> ** I tried to replace auto with sdbusplus::xyz::openbmc_project::Inventor=
y::Item::server::FlexibleModule::ModuleTypes>
> No success.
>=20
> Error is :
>=20
> bmcweb/1.0+git1.0-r0/recipe-sysroot/usr/include/c++/10.2.0/variant:1150:4=
2: error: static assertion failed: T must occur exactly once in alternatives
> static_assert(__detail::__variant::__exactly_once<_Tp, _Types...>,

What type is `flexible_prop_map_iterator->second`?  It seems likely it
is a variant that doesn't have the enumeration type in the list of
contained types.  "T must occur exactly one in alternatives" seems to be
saying that `ModuleTypes` wasn't part of the underlying variant types.

--=20
Patrick Williams

--Cm/vvCEau+jGOAtF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNN5ykACgkQqwNHzC0A
wRnDRxAAi7+TnD8W/DNQuzA2RJ9D5fHnj+PZ8Ckizll2df9+v7X3VSGbjHw9HHu/
pkUtwEAKgra29CFWuFsuPw5/hpjfMRVKxYbXCjd6bKRo1QMhwjpdSV2PwmRMW0PR
RqLa0O2tmnybZt10vAD/v4K8Dj8Pj46ZB36ebVBEzLZqpSkWydRYvDAMN4ZPefP+
r+hx0aX76j6owprM1uP3G0/Ed74PwrB3rcXbBs5AG3CLcPNkyMoc0z5qXc7pv042
vUB/jM6OPJ305C1tX8WqWQQmlDYCURO2rr6sMlePo7piJYoeNfrAE5OZzJFHDPoN
SKSu1TtlO7SP95pL7kL3ICfsfE3STbpinBK/p+r13f8VrCkhewdfSOUSj7nWPIxe
95QrPn3BnydNXp23xtWi4ms3FS4kfB5DRb37s/3jvPW/lbt5UEWzeKWqkI/kRMsz
8qi3crmrTKvXQdP/Aocw8AQ0hi8+1+A0qyN8uCjoJu+Y0x8ixIzI+GAeNWkyBtU4
bQ2ffgDkjh7Z1dvrth1+NV65nfrjzh6VmNMFbHyfnJ6BJ3fegjFLbUzrp5N04nH9
gORKVPwxE250QCQgTHARMNGK845HPn2rY/szkbAl6oYwQ9mQApzJCsMiI2PSHccw
nGxLB4vjJJTCws8q6IbOi4si0fhNygAzr0afaFDT66qE852M1xs=
=odwm
-----END PGP SIGNATURE-----

--Cm/vvCEau+jGOAtF--
