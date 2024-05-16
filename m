Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B328C7067
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 04:46:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=rNuygof0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LWu3Ghz7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vfvcs1GBjz3dKm
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 12:46:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=rNuygof0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LWu3Ghz7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.146; helo=wfout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 510 seconds by postgrey-1.37 at boromir; Thu, 16 May 2024 12:46:19 AEST
Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfvcC6CpSz30VH
	for <openbmc@lists.ozlabs.org>; Thu, 16 May 2024 12:46:19 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id 8FF591C0013A;
	Wed, 15 May 2024 22:37:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 15 May 2024 22:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715827063; x=1715913463; bh=n46YEu0mOM
	Gzba/AVqHWrbF5l1k1D7P0idaQS1mbgvY=; b=rNuygof0T/tU9Dq8fgo1z4Gmtc
	LbMQoCNAcHFO3exC9FBvhKwl3yfkKxFGbXly0kii9BBeMSrzY5ows38+Kha5TSCX
	Nda3P9bys7Thlt2iBYG1Malz7uSFNwd1xVBsBh3FjwMowSJLFXH/WCJrSo0fFfOx
	dZL4mu0DhIkEOU4F0w9ljWKUeR6KxEN1j8WXo7Wigp5eKJmZhQoZy/lf0vuXIdMD
	dAZzDzf/dZGI2p7bNorkX3662Gj6iiYA5vrVejzr8NQyUGEqHntWcRm7EEZFGtap
	G2Qm6Eg8zHEklJNtTHJo9fIbC0p7aJLkfr+/bTmTaJdZAppEn4Si0sNbsOBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715827063; x=1715913463; bh=n46YEu0mOMGzba/AVqHWrbF5l1k1
	D7P0idaQS1mbgvY=; b=LWu3Ghz7LGfd+9NMNA2EUM3udLdBeG3PzxqimiqTycBI
	bJyLSGEhfC8+WO4EUoKJ6M+NMh8JZbMVg0RSMM75J1KdePffodqzHznEiHnVZFeY
	adE/oh5pbdKCP/zczHhhTweFvqUhqXnqWoFGmHYUIoKqkTxS+1GYDFdJZOBvL9z+
	F6j3RMzcORKfFTOfcS5g8XR3PH7B7nrXZ/5Q9fIhV9yd3WHk4PW3B58eboUJvs8S
	R86aZUm+fLcnZ0JK0zMvBQaJaBvu0pfsS2OeJV1stGItJHG++UL8fiTI4nyEVKyo
	Un5pQ07wRe3UYwNxv/K5yX3tY2DEOCq/Xs9HRX/+UA==
X-ME-Sender: <xms:dnFFZsuN66FlDT6SuxkNiugNEfcb0Pj7BvFn9W3eDTVaZQXH6dk-Ig>
    <xme:dnFFZpfdyZuklYXhP-5ldXJaRg3lIqbzc8sLANCulNMlNm-dQm7cWS_Lr_ikM3XMh
    U6A-tWa_PgtSOtdrM8>
X-ME-Received: <xmr:dnFFZnxbneKgNSXnwv2hshmuROlfOCHLl9w-pU9q_Z2k1M7o8OWUUeLqqTuOwm32zQEqhl8oJhTSJgkR8q6dpxYP_obm9PZ-Q2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegledgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:dnFFZvPHZABe9PMkSAR7wXFCQCEQL75bjopHxbv5FMtneHOb3Rk-JQ>
    <xmx:dnFFZs841QC2JSJf0aU_Fy1nN6UrJT7MBQ_AOvY2G908MPyNkgiJMg>
    <xmx:dnFFZnXGjU0377eKKpq57imPHfsZN00fPwHdbpKG4x7cjSEVODFkoA>
    <xmx:dnFFZlcvJEKIVRyW44lwQOGBqzUDXGyYezmOByPk-9C_A11ca2yn_g>
    <xmx:d3FFZgaylTUUzO5tOuo5sgpB8HsDRgMKpeX-4xFFAYmW-Vvp6KM66_KX>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 May 2024 22:37:42 -0400 (EDT)
Date: Wed, 15 May 2024 21:37:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts: Aspeed:
 Add Facebook common dts
Message-ID: <ZkVxdHBLOG2BeRui@heinlein.vulture-banana.ts.net>
References: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
 <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
 <CAPSyxFQ0DWMMAV87NUW-wmt8hudeK2PSDdgWCuiTbthDwAd=vw@mail.gmail.com>
 <ff7a6703c15a93f5f776caa836f0d0ccf870415b.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sRG0vxOmNnpoBcHS"
Content-Disposition: inline
In-Reply-To: <ff7a6703c15a93f5f776caa836f0d0ccf870415b.camel@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--sRG0vxOmNnpoBcHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 10:30:30AM +0930, Andrew Jeffery wrote:
> On Wed, 2024-05-15 at 17:41 +0800, Peter Yin wrote:
> > Hi Andrew,
> >      Thank you for your reply, Do you mean something like this?
> > compatible =3D "facebook,harma-bmc", "facebook,minerva-bmc", "aspeed,as=
t2600";
> >=20
>=20
> Right. It removes the nebulous "common" concept that might be upset by
> future changes.

I agree that just "common" is probably not appropriate because this
device tree only covers ast2600-based platforms.

We are trying to design our BMC hardware such that at a u-boot level,
the same device tree can be used for most of our platforms.  This is
partially so we can avoid having to add new changes for u-boot for every
new platform.

Should we do something like "facebook,ast2600-standard"?

--=20
Patrick Williams

--sRG0vxOmNnpoBcHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZFcXIACgkQqwNHzC0A
wRkVtQ//ZNhI3dz/l8oaTmUpiCfwiH8WEFS+IYfB5S9tO3YEJkOISf0cAfoIeCa9
4/Ay24i1Xo/MxYVFCC9oT0GMdzOhZM72uurQJDyCUQUL//sXHqVOAnZi2tDD511K
uSUXVRWbqwvyn89LXzXB1jwbAys18haHAnw37QPZf4ubsPxoCRO3iwxSndGmIxVf
XwapD+MaFOvZjLT1Yv/HYHPB74E1asakctEQjS8Dk/arWnOzVaBhIUcyv4F67AhX
9gOl3W7M+AXeDXXMKNsltuNkS9Dn8I75C3jQtck+ySSjV4bKZ7xakZnzfvIVjpEg
SZTKTaXUunh9AjOmz5ck3Gt780NqsU6/albVzDTmx3cFbinSHcgZuDqVC4wktW54
BGMa4tR2b/vZpaz/XO18RG5WcuS/8oQXqw9O48nIQVHcbwaplwewdX90dyO0O6mF
KFu5hFNyZ1n2Qs8FfYh+3xNI5o1JkR1KiKubc6LbhNYgwrUqSDkNH9Npc3pXrJRZ
E7YDi1BTe9upNhmUs1s94N9i0VD8ocMa5JfNIdUhR6OIZq6b71ZTuG2GqxlvUjbe
OXrnsueiczTrbZce0D9kxVbMfxZOuxM41j/ASYuF57r1QcIoLSwaiPK7VsQWkVQJ
t4gFePJ8aG9eQrf7OepAoveWgzWWzA3S/6Q6m2z0xcJhUg6ZuIQ=
=1HFA
-----END PGP SIGNATURE-----

--sRG0vxOmNnpoBcHS--
