Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF0E2B8837
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 00:11:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cbz7q6JH3zDqdf
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 10:11:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=AYSjUvs1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Iugvallp; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cbz6P1V8DzDqJH
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 10:09:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 86D674B0;
 Wed, 18 Nov 2020 18:09:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 18 Nov 2020 18:09:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=uttPJGIm3wZevfB0pESGGUPA6ui
 tC3D6V/xx/oQD3V4=; b=AYSjUvs1nU8ACHDbyEjIGnKIzxE5zvL4m6mgovC+PD+
 zSzGdF/VWKzsOsBFoiDhiKX/lOXrV3cIoSqCGqFw6A7bVWnAAnAaS9PgtTX4u7UB
 HDXDXIddenVrskUA8U3X8sDTVf4CuaU5fQk7hPMUWuTM14bHjpLplcmk08eQfIVU
 5N2tXJLhibjoK3LCfA2S1QDjxXME8kznhausULgq0Tje1r4YyMbc3ADOe8cs0CDA
 uGGgsZa728SufR9dnBw0PvN/m30G9j7oxuoLxhtlFOlOpvCvV41K4Xr3849pVa4h
 cq+qytYL6JzPgxQP0WCf5BmxV/lz7KSzuIlZQjuZTvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uttPJG
 Im3wZevfB0pESGGUPA6uitC3D6V/xx/oQD3V4=; b=IugvallpOEeQgQKufdOX5y
 wQbMknlNUvfKz0n373dlRqek+YoEcbEm5swC0r8DeZl8uh0wr917mwha3+Gdtp96
 lDfusjY8r7NcGUTo4Gnoj/RVOr5iBizhOc7N9t24hGI0ETrJbz4cuah5iVDTT1lS
 he/uP/H136yKUW/HvOA/VW3Q20a2gLFnavskPnvT05YxkHQ/gGBaUE93rTO1JO5B
 dIpoKBWfpWUazqhhqrgvvF2jqOZp4/I6+yXirxJ6mjBW8veR1NjgJcUMBhaFsXAm
 qlcu8pEvobQSMFE/Y9/whkCKZeY+zGHt6WUnuFGgK/lEX+TMZaK10XGlqFUu35wA
 ==
X-ME-Sender: <xms:t6m1X3S--rnTsbUqlAcD-gc08qq0JS9k609Mu_knbmcJZALXF_thCQ>
 <xme:t6m1X4xrxelkCXcApbpuGltL2zV_zxCoiKHd3YBwoeUnnG8if5RJUGw7dexxDT0iN
 D6La4pyj_LoK-IJNus>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefiedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:t6m1X83qHmxs2DxAzwQyb0aiFUNVUagdDCEpAIvOZVrHnGw15wGRRg>
 <xmx:t6m1X3CT_U8n3gtS3bGKUo4vxvGehGExa33pTSJFC2sYgxQzKyzTng>
 <xmx:t6m1Xwgr8ih2thSFrrO7-o1Ze45pRkWR55Sl3-z1S46req98dWWtTA>
 <xmx:uKm1X-cDP69sfC_AvTUK8N0qopnx_Rxu1B6oFquGR2EHkMAUcxvzHw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9B48C3280060;
 Wed, 18 Nov 2020 18:09:42 -0500 (EST)
Date: Wed, 18 Nov 2020 17:09:38 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Patrick Venture <venture@google.com>
Subject: Re: qemu for bmc
Message-ID: <20201118230938.GA1261035@heinlein>
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
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


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 01:11:42PM -0800, Patrick Venture wrote:

Hi Patrick.

> Patrick;
>=20
> I was looking at a patch series of yours that landed,
> https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
> this line you're referencing a device that appears to be missing from
> qemu - namely, the pca i2c mux.
>=20
> My question is to the community at large, and you also, is anyone
> currently implementing this i2c-mux or a similar one?

Timely question.

I don't know of any current work going on in that space.

Facebook has a hack-a-thon kind of event we are sponsoring at a local
university this weekend and that was one of the projects I gave as a
potential item.  So, maybe, if we're lucky, it'll be done by Monday.

I'll keep you posted.

--=20
Patrick Williams

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+1qbEACgkQqwNHzC0A
wRkzsw/+NaLZSmO9TnxZacXnxwbe+Yp4zSPuJ83kiXdY18C6EUoxRHPfd86gL8YA
f6rQ3fXXUmBNcq8frUVZfLt/MOaybqUKhmUnSqvdpeU5P3eSN9aCac3WLcSIcPn0
zZ4+wht0n0G+4xB3lUPbG16gO+pAGFXMtX8rEfVcxhNFY4PiYn0uEtXd1oZ9+3TA
hbR7NOC1GxGMT9zmlTynqafUjhtuLd26DC5lI/szGeiUv3kXPbN/APfFOyKgAbnG
92S0O5AtwwsGudETLwpu/6LAM847NIGx/fbG+bjRapStAzyBHkfspU4zuAbAEkfj
IYVvqk4l2Lc3mT4Q6TJ/vUQJmgeciajuaVZuH4WMvyaz6eJAKSdKSQ4VsvnjbGil
WDynzrdq4qyGjl7xxcRh+YKWtbbplzgwgpjpMG/PoSiJd1opxMnUX1ArVCtIKrrD
my09Lks8tRSAch97Gvwgu5iYZhdWRpPiBbDFQY99/oKjP7wgqgsKSMIra9+DVVGz
E+9c0JMOYZHTG2s58/is0hDAshs79gWGwJ+BMd70rYGH6enf1PmGuW/PVEpQy/RO
FknUxSpA0T50YDn0kKfH0hygS3KNcaC4cLqFBX1d4Vt41SZ8xGu1fVUBbLiiNHkW
KYQXG2wC7Yb3ocTAQzTwBIPTBTfsWGEwlnhXihc/l5l5D6iZlwQ=
=c2b8
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
