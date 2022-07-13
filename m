Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 041ED5735AF
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 13:39:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjbHz72JHz3c3r
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 21:39:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=JDM/lacx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bToL/Pvk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=JDM/lacx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bToL/Pvk;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjbHZ2lG7z3by8
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 21:39:06 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 55EEA5C01B6;
	Wed, 13 Jul 2022 07:39:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 13 Jul 2022 07:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657712344; x=1657798744; bh=a7laY8M3xK
	BqEOg/vObmUV84b7Gpb8OnCU9kczRztrg=; b=JDM/lacx0k5oKXOvbuQAdSOO/g
	Wv26Ju9MhJb4QxhEMYzu8wgCva5Q6JDOhkmDhHPybT/ryaDAybrdGMtq3yBo2OrH
	GCUd9Aafg1n/icUsEjWxs11FkMqfg+UXTG8apA6pLGe555kdbHICo8m3i0WJvJsC
	z7uTY3IbKdCfqQ0mFQvrgtmNUp/dGPuxVEd72V3VT/S/1XR5hsd7sxLs2m9FeJTE
	t/6UBGARX75Iq//SQY1NOFRDIozlrU+ior8ehlkw6jrwL9jdo/JaGr7/G3g3koaw
	HbWqjPK6kh4Dyytn7hdO02wE/x9ahlATBdva5I2Jeh9GAVN/YwP4RVREUMxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657712344; x=1657798744; bh=a7laY8M3xKBqEOg/vObmUV84b7Gp
	b8OnCU9kczRztrg=; b=bToL/PvkQ8SOIMmdpc2DbwgHyK5RunlRW4XsN3VaLF1t
	KLx2/Rvz5w09hK9JKz+q6pB+APooQ+3u7aqmCKWW3MlvGIKIBEGgkwFRab8mxWvX
	q3u1MiawFmgryne0A1gnwZuDg825ZtjpBT637idrMqrftQcno1SksJi6Vzw31PpJ
	bEneQ6J0839XLQV0B2PKR/UUseapzqNtohg2SHdsVRRelwgl8nHvy/882FEmtRGZ
	AIxBQKukGyGoT1mJrCvw2HPtSDNb5rck2Xlu5eXa3ziek7GEUSx5qSzmiwIwHf6R
	HnpgxJ5cBkVvDkh5DkAWr81id7yLz++LKwzpj39rxg==
X-ME-Sender: <xms:2K7OYm77O4lwtXYqjgZoS9SeTfeQihYmf6NCYj8Lvt5aAxzt9xkSFw>
    <xme:2K7OYv79zMfz-2mo8TQa-4woneqnwFJ0oisCnKqv8dwU468nzu8RUItBqzPagQfeM
    PGHezg-FvQ0WkFKjzs>
X-ME-Received: <xmr:2K7OYlexAqCyrPRUQfqqNbuuqA63-_4rGG21GHD7Lf0ZRRPoS8kPPlbDTZN947ISETYDqUrshFAVXfkIhT3nfvq5iB-2rmz2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:2K7OYjIYkb9TMF8Do0FIFtpXGzdFbwBnjPqYocTXpElt80-7eGNgpQ>
    <xmx:2K7OYqL939IFwwswI8ZYIavE6MC2geWDGzhdzE9I-5xLotBsPP8Qdg>
    <xmx:2K7OYkwmfdX0wMeGEaspgck1EcNJ8hwFfzanVSh_Yy8Pq8Zwy1k8cw>
    <xmx:2K7OYkwCXh8Uckw79tQjVihjaEPECv8e9nhFZRkkFoOz0ZX7JnvZxg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 07:39:03 -0400 (EDT)
Date: Wed, 13 Jul 2022 06:39:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: dbus prefixes (was: DBus ObjectManager Interface usages within
 the project)
Message-ID: <Ys6u143YCgQwujIP@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <adb35a4e-718e-03b2-a562-2c2c6d59f3b0@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w3IJx2KrRoNBszWy"
Content-Disposition: inline
In-Reply-To: <adb35a4e-718e-03b2-a562-2c2c6d59f3b0@yadro.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--w3IJx2KrRoNBszWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 01:17:10PM +0300, Alexander Amelkin wrote:
> As a side note to this discussion, have we considered using shorter and=
=20
> more convenient paths for dbus?
>=20
> I don't see any real reason for the project to be using this long and=20
> cumbersome /xyz/openbmc_project/ prefix.
> Why not use just '/obmc/' or `/phosphor/` ? I believe that would be more=
=20
> than enough to separate all our services from any third-party ones on d-b=
us.

FWIW, it isn't required but it is encouraged to use a reverse-domain prefix=
 on
paths by the dbus spec itself.

>> Object paths are often namespaced by starting with a reversed domain
>> name...

> I understand why this prefixing is for in 'big' open desktop or server=20
> systems where there on d-bus can be any number of software from any=20
> number of vendors. In an embedded system, such as OpenBMC, on the=20
> contrary, the set of software using d-bus is strictly limited and we=20
> always know beforehand what prefixes are used. I'm pretty sure none of=20
> the software included into OpenBMC builds will ever use '/obmc' prefix.=
=20
> So why continue using the inconvenient long prefixes when it is safe to=
=20
> use short ones? I would even propose dropping all prefixes at all, but=20
> ok, let's pretend that there can be some other 3rd-party 'Inventory'=20
> than '/obmc/' ('/xyz/openbmc_project/').

Generally speaking, isn't the content in a single process pretty well
known no matter the type of system the daemon is installed on?  I think
it is pretty rare for a shared library to create its own dbus objects
and if it did it'd probably create its own bus-connection too.  I'm not
sure what is unique about a desktop vs embedded system in this
discussion.

What are we saving by switching to something shorter?  Can you
elaborate?  It seems like it is mostly just typing...

>=20
> Am I wrong or missing anything? What's stopping us from switching to a=20
> shorter prefix, aside from the existing code that will need to be=20
> changed to it?
>=20
> The same proposal/question actually applies to service names (e.g.=20
> xyz.openbmc_project.ObjectMapper could easily become just=20
> obmc.ObjectMapper or phosphor.ObjectMapper), let alone just 'ObjectMapper=
'.

Service names and interface names have a strong statement w.r.t
reverse-domain prefixes.

>> Interface names should start with the reversed DNS domain name of the
>> author of the interface (in lower-case), like interface names in
>> Java.

>> Like interface names, well-known bus names should start with the
>> reversed DNS domain name of the author of the interface (in
>> lower-case)...

Assuming the typical use of "should" it means "this should be done
unless you have a good reason not to".

--=20
Patrick Williams

--w3IJx2KrRoNBszWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLOrtUACgkQqwNHzC0A
wRmx3Q/475xRyeXDsmpq3wSqsAxlSKx1LFQMzWQqtYjd6ck4ZdaqhQ04kHB2ZBHy
W6wyoui3NgKk5EvBeSM2bFuq46LYqSX/oT9xibpbtvOa6BYrMD/ul9FRpcUaeo0M
klSgH8FPX+CZwfOtCO9Uy+HdkCNlJ77c0gZBz6IJCM13Mum9rFaQ/5NK3EuZOXzP
+jJxMqOInVYd+nx8nZxpvTGEMiO8hGz+J8De4q5Q1B64JwLZFzpSsReKxUaO/pU2
3ODMg4dxh0+xAsaJjapWkZmscfj+fUusngZbWdZV/2WzWAyOnoZy+ECdut9ZxA2O
+1ENdyfueOBPm8/k3XNfDFSJ7QoSksoyBBpCVUdi3M1RbGX8QoqiitdMxvT7MQIA
jKd5iC56xL1+D6rj1Wpl5tQN3K32GBTG0949iRywon8eRF1swlJU4CtrA/G5Ndf2
LNKLK1QVihVk8X+/KaFLPclML7TuglLhxEBMs8hGiWZn+sz/dysfEMlO0Ibdu6Tl
YlPycEwkpaLTVwiMMOTgGTjV4jrqAiKX9JJL1TtuWS12uPRrlS36dRRGbYaPv2bp
Dd1JSQLWc8c198Ro8BujdfcxAqfBXM0W1DFrJQZIJs/LFdPD1azdQZuOME/+UChM
0gpmvU4ritNZo12NqJW1UCVtc1UbJLPSLA55KIxYxHcmpOIBtw==
=oc+n
-----END PGP SIGNATURE-----

--w3IJx2KrRoNBszWy--
