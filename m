Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD82879D6
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 18:19:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6by36wjvzDqWp
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 03:19:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=NVHt4wn3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=o0b70wTt; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6bx75wvQzDqWm
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 03:18:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B8D909D7
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 12:18:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Oct 2020 12:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0ho8LTossTmw5kU36KA3n2z+B4F
 ARR3uSwPLomeModo=; b=NVHt4wn3iFu+WNjNKr+BBpPNouLuEJznTA8N3b3H12O
 pSMweptqV+jE4WYJ0r4WxPGo31JbLt2dqMteMYbGRDgfqIPbrCxnTuYlAaLGeyCU
 uqD2FWrJWVJEI66npqNJUJsTlRCpF32TL8txhgQHDQZYkVgR4Nn6nXxnenODhXp5
 IaSqqeGfoiQzcXJidfUeS688lUJA86d6DITCSX53hWW3mup8gCYfDMJnMUPIi1pn
 liZHqj3I9kbuG/joXSOJp8EgIjj9hlM+emXWZzZ2uj0UnW9PpHWELimN+XwalZ3C
 vL+rMem/I/kGlz7YkokVXjWXp3L2wDpyOPKn0GyRkIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0ho8LT
 ossTmw5kU36KA3n2z+B4FARR3uSwPLomeModo=; b=o0b70wTt3R/abIgzxrALRj
 PYQEyTd7/Z9kOsCy6fu1qT/SJjf6GYQt3ND5uIqiSl07iLWFCxUQTo5BbsO5fdnV
 8kj7IO9NzoOvWOPX6XbTrB3u9XYQGKxSxaU9L+fHHftmiIhVvfDN5nQ1NZeS8hS5
 pTGZrVSM3B0Z6J38tZS9Go0RunoS6fBTnvj8cm4rTTOKwhxoCj7iv9B8vCdtuV1S
 GvHmBzSObeTsF4AFHkYv3mznb/vbzsKKy2rOJzWEbP4Va+IrLuzBcdA11EkCDOmU
 YIvTDq3nU6l/kWxDH6pk7J/C0BCTsU8Wkrvjta7qD4q3zgba7pTGFmrp4MmYUDvw
 ==
X-ME-Sender: <xms:5jt_X5-wHEoLxLU0lhoaMkQJ76kfFVeFl4z-GCoga0hEEq2DGDEk0Q>
 <xme:5jt_X9spcFFSefqXPS8K8CRL7tmbt0H0Q2YZXu-iMhNAoO5nqaFOU79DxZ0x4CkJx
 oN_dlBNeYuczYF_t_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvkeeuveeuudelgffgfeelteeffeeh
 jefhtdffudettedujedvhfeikefhhfeuheenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecukfhppeejiedrvdehtddrkeeg
 rddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:5jt_X3DsoOnLWPmujGHt5IYOtvm1BZfa4usGaWSoT7v4J_4BrSBl8w>
 <xmx:5jt_X9e3FGpKgi8CjFO7YW5cWJtHeSn5MNH2wVwa4wbybJo7UlERXw>
 <xmx:5jt_X-M0dfCaI5mHckqZMJX3LIEkqgjvBNeNR9sLxw9CiF3e9pNRBg>
 <xmx:5jt_X0bwsDPz4zgQAnvsaqs1Wu21ukaGAA14hzO5O9NAYWuk-Iyu9Q>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB0F63064610
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 12:18:45 -0400 (EDT)
Date: Thu, 8 Oct 2020 11:18:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: sdbusplus: size/ssize types and 'object_path' type.
Message-ID: <20201008161844.GK6152@heinlein>
References: <20200915190230.GB6152@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="InRyi6yyXSYzKD4c"
Content-Disposition: inline
In-Reply-To: <20200915190230.GB6152@heinlein>
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


--InRyi6yyXSYzKD4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 02:02:31PM -0500, Patrick Williams wrote:
> For the sdbus++ interface YAML files we use in phosphor-dbus-interfaces,
> I recently added support for 'size' and 'ssize' types[1].  I did this
> because I've seen many cases where there was some discussion on
> appropriate integer sizes for countable items (ex. uint8 vs uint32 vs
> uint64).  Generally, in C++ we recommend size_t/ssize_t as the most
> appropriate type for countable items (and anything else is likely a
> premature optimization).  We should now take this same approach in PDI
> interfaces.
>=20
> 1. https://github.com/openbmc/sdbusplus/commit/4ac7e56e8e18202fad3b273434=
6c6d4c7a6957fc

It was mentioned to me in a code review for PDI that there was some
problem taking advantage of 'size_t/ssize_t' type properties when the
interface already had a 'uint32_t/int32_t' type property.  I've
identified the underlying problem and fixed it with this commit:

    https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/37227

--=20
Patrick Williams

--InRyi6yyXSYzKD4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9/O+IACgkQqwNHzC0A
wRmz7RAAlu9vRBqoE7lkKipi05+vGbohALVjn0HRULXGkN+XKHzifAJ4GDOoi+8w
COYmYvUwHZK3/fOttvb8ttA4VfrA+FsqTNJj5zi+Wb+aEu0w+HCq9LxOr74K6v0w
3ybBHOriFIEGXbEPZ6irQhfHGFD1+o2NLBHG9gxs60HTX/Ss0nNooPQiXGy+ddBw
fmPqTGOB5hRsxF6kWnz1KG8jE246yNvXAyx01kAov9HU0rVhY1HHwqH52CkIvIPT
A19q1U14op3qnVnDwh4QgiG1v1KkFEeropDn5mKrR6hF7ln3VyHB2Kc1zHtma9eF
ud2JjJxUDI8rJ17Ld4HCnPNs4TYovHZlDUO1uoz6Yg0/fOhVGFmVulEo+a8YrXvz
F0yJeFc0axW48TZXv0gh5W2hk2+cqKSTrlFcaTQJrRhzV5ySl1dW+kD/ki89TrTs
q6QkwfRt4ywmjTdg0a4cXqrBfu06Dr4eCSUHhvkQN7zt+9ou+Gq2npvjfxkChhkd
2S89LOERpBRvXce88tSSVbP/qb+kmVwp/3z6qSvoDymP73tpGYvzSbgpij5aFTHy
T39zzfWhnYOjYL9NOtwhgQShD0AGI6AaS+OGccGogoct9+sqfbd9nfE2HLP8mcEH
/b84dRCifCifPUPdY/bBI2aewafGAnRw+Lp8KYUDXXhIxI60I5M=
=W35C
-----END PGP SIGNATURE-----

--InRyi6yyXSYzKD4c--
