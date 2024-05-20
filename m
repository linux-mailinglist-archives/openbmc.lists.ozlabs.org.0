Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7B18C9CD3
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2024 14:01:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ruqHOW5P;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RfAMIAId;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjbbH0xkWz3fqw
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2024 21:54:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ruqHOW5P;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RfAMIAId;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.144; helo=fout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjbZf5yhQz3cb8
	for <openbmc@lists.ozlabs.org>; Mon, 20 May 2024 21:54:17 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 3BC6013815AE;
	Mon, 20 May 2024 07:54:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 20 May 2024 07:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716206053; x=1716292453; bh=hWLmBz+HG/
	LzOS0wZ5wckZu9Yo7Fg6esAtr6eAz22aw=; b=ruqHOW5PEOg5wvZ7kzE9/afuKm
	tW/Blj0XFX5QE7eMi1gSqpxj+vUnWD1qyYwq1SPPjn7/aNxlkIH9gdz94q960faq
	w1ci/G4V4HyPVQFD5ZrYBsuFv73Dz7c+xo/P3XRcfZLGwl55EmZVbKSZe9FfGb1o
	STXwGUIcOAPl4Z4Y3+XgWj+gzmR6IPiSaTB8hugRuW9+jNL0zeYtIFVZjJBCizvM
	b7fnt+CYGlH45rUZhFUUa10uAC1upn+DaoEziv20LZgu8YfrPel/jOQuMKjUu3Lq
	sKbMmqQsfmJ4JMjW/PdygcEUwMy1DQggJuyOqFS4RRmbAuStMbhqMU21AzQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716206053; x=1716292453; bh=hWLmBz+HG/LzOS0wZ5wckZu9Yo7F
	g6esAtr6eAz22aw=; b=RfAMIAIdunD9yE8w2oWbEyBusSWVb/ZBQzTW9d3F1nWJ
	keroOs2R2VV/hx8FQrF53OZnbaEmN5USyLLzfxXpy5QVkR3ylHaCrkBMrr4vJySE
	+ELa3mQp2PIM8IzmSaePbvvklatVL5i3ZGVNMfWXqW5u59Pdax1yRyN4NG8epVUg
	ngDFs5ICgND4INdJEwPb2X8bsGRMlfcOrszX9/qk+aEzJDcKkEXOM59SQf0rMdHE
	2XUPFW1PJetwhm6fi5wllO3XWq9vSQqppb7yOn9jx+d6Gvr7SY9PZeQevhIfZAZr
	ZpHJSBP1LyFdTMxPgT5mbSCrAnf4pGhSqgptRL5ZDQ==
X-ME-Sender: <xms:5DlLZl2z7ZnglT2Ck_QAPjHvtnsMjFu_kIDHXCRsipQVq9WJpQ86QQ>
    <xme:5DlLZsEIDWGp9zGHVsp-T23xREtBx09HBZhFyEWoH3EvGjB_cVebF7c-XP65Cudq-
    6xWBpEG76H4TyQW_5o>
X-ME-Received: <xmr:5DlLZl54tm9veXtXW-f2meeX-ZRLF7ywjclLQf7TyDazRbcPurZCMxedupjBPCrzDBheWHNclkDSbWwQd7S7i3D5h7S4DHJihpo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeitddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:5TlLZi0gYUBiZW9CRZoeFP9H2ykbQ8XfxiJuExWA-DcJiwm8fdm8Vg>
    <xmx:5TlLZoHlAphBILyKpNmEPtGdqf68egdr35MNwi6nUgau9y-t3P_D_A>
    <xmx:5TlLZj86QEU8HXFkgpP4vKcHKq7ZtV1zCgaC1yvpUgDqlyO66KB_8g>
    <xmx:5TlLZln4XvcsjhWuldqw0UOAj7A1-KaKJAMOo9w0gJ6cJ6gEXeNqIA>
    <xmx:5TlLZtTBWmwcr5N2Dx4p-N137nQGoC5_2WhzEwEFnC6Fl2qUwOapBNa2>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 May 2024 07:54:12 -0400 (EDT)
Date: Mon, 20 May 2024 06:54:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kasra Amani <kasraamani80@gmail.com>
Subject: Re: SDBUSPLUS in OpenBMC
Message-ID: <Zks541wbH_SSkr4s@heinlein.vulture-banana.ts.net>
References: <CA+_cdqZ+ifXb1MMi3HvSrOi_xdoWMtSYzm2C+-Jruw2ou5xX5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sGEfVhuFaLFPqHaF"
Content-Disposition: inline
In-Reply-To: <CA+_cdqZ+ifXb1MMi3HvSrOi_xdoWMtSYzm2C+-Jruw2ou5xX5Q@mail.gmail.com>
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


--sGEfVhuFaLFPqHaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2024 at 02:20:50PM +0330, Kasra Amani wrote:
> I am trying to create a D-BUS service for an evb-ast2600 build and have
> written a server for it which works fine on my local intel ubuntu machine.
> I have been trying to deploy it on my image but have had no luck. What I
> wanted to ask is does a workflow guide exist on how sdbusplus can be used
> to create new D-BUS services for OpenBMC? and how it can be done through
> bitbake.

Can you give more details on what you've tried and what isn't working
for you?  Almost every one of our applications is just as you describe.

1. Write a meson.build to build your application, link against
   sdbusplus, install into /usr/bin (or wherever is appropriate).

2. Write a bitbake recipe that uses the meson.bbclass and
   `DEPENDS +=3D "sdbusplus"`.

3. Add your new recipe to the image.

About the simplest examples you could look at would be the
phosphor-virtual-sensors or phosphor-health-monitor recipes.

--=20
Patrick Williams

--sGEfVhuFaLFPqHaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZLOeEACgkQqwNHzC0A
wRnIgw//bOf7D6ZjDy6OeHXjKhkDRFIyfx7gTLwEYPJc0xLksCubSq02NvRxBqOH
UKKH2hdZe+qGm0hW0tEvb5nojzDUV5cZfcQE5ZE0QDMQj5gfJ+oGJurkgPmXJbkU
dWI1pw6I73muGR0R7+MhFoZcrqUu7Z0Ez2kachaPp5qijfHOuMxA8TqHJ991DjOo
m2XVAVel6SBDR1AMRlL5SDwaumFQByJcb9qJkLfCi6R1dK5oNooT5Gb0m6eE5yDj
m0s962eZ4XauxQlEnkgztvxXw3v7oW7KVMBE+GZZKW+mbTyTetJT8WDyf5PSK2sd
xVc/llQg9nxXqG3M8CyJHbM6pl0yIuBKfESvHhQXEyBvHguvc1HLHijeTg84SKaK
LA2w3NBh2t/YwqiiUo4i2rmAzFfy1hcs6BwfXWajq4PBUh/9CwnKmcIY9+K0+WdS
Q3rdj7TZkOle7N6CiN2kbh5KDmPpXo3kmJcWPd9qVgLII8qz98zM9m3blrLmAy2z
hT6BUyZDM83bac7WUpc6bnbr1+qni4E8h+yKDv7NPlCBP+8XBHrQPb6nOGP3plYP
VLujUvmf4Dx9TpjH4ZeF5MUu/SPTH486RZJyf+Gbi742w9f92AB4Ex+D9ePaFOxY
AIMZWihGKH8vAWs1ab/m/75JfUL3x5E0oYLeRdt3wFcoFZSiwA0=
=wCE2
-----END PGP SIGNATURE-----

--sGEfVhuFaLFPqHaF--
