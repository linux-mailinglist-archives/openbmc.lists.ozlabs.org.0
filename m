Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF691D6E39
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 02:09:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QKBB1LvdzDqXW
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 10:09:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=DhJAqPNQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ebTUqV2u; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QK9H1yqHzDqND
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 10:08:17 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D76A5C00AF;
 Sun, 17 May 2020 20:08:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 17 May 2020 20:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=v2ZcXD0YQfe20cgeJmurfHwmgHy
 JALRgoe8PCmOkuQ4=; b=DhJAqPNQiegXijdqTWhweQmoh9I57+Ar9ycBPk5zf2e
 VTlCqntTQhiTNa9v8WyDBigb4kXXVM5yt9/zzHtsGYSEQ+k0lAhYhps0ZGVU1d8X
 jNF/ycLeWBghGIDY7JEjeG4RlTMQfb7I6kYac/13mUBkhvqBVlNydWs46VXfbHJm
 NJ/6Q4GEiJDm3Ozir8u5ISGJJ4yy/12r30RSzE2i7Fq+cU6u4DbbtuDK1LZ5xwye
 s8/TDJxOtekiFb5HN9VjmvgCgyIRcMKWGuOYLB4JBfw8z8CzFyiwyP+kWzVE0tZX
 Z35BZIvbcs+mXzumtJy5P0m2uOxvJpVaZaFZhinmWxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=v2ZcXD
 0YQfe20cgeJmurfHwmgHyJALRgoe8PCmOkuQ4=; b=ebTUqV2uqgZd1JV8zOFdMf
 tsOdM/unE5a2VEellpG4jU9ycEc0xtBnHpBs8iEpvr+c/69zLT5UzyDsgKHJEdjJ
 CQT+3990xKIla5QdHyvQZPB4hGwl1rt6t7EEgAdmILTEzSjB2UKeXVy5psV6jiFy
 D7Zto7l7+fzZvsgDL7VGvM8Qe5iygLH1VJU1w0LdCEizm4YbgtgO9CtctvusbWdA
 17SFbZB8AFcmoXhFp63/vhc6GKtK6fQ5ASq5XqbJaIxaENvlXebgQBbEdwIPj66f
 RFVfc7v9WqzWg2155XsdAMeNi0cIYn18spJdICTH4tPwc0KMIg4QvKk/x+RU9+SA
 ==
X-ME-Sender: <xms:7NHBXs13k-kCRboD3Cf77ttBlqRhLTKpwAC_R6-IegOyKsxyNfTu0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtgedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppedutdejrddutdejrddukeelrd
 duheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:7NHBXnFMXnD_lsKAH9Tc0ParboEX-ZcRoN7G8rtK-Eb2lGbb0aQNjQ>
 <xmx:7NHBXk5qYP4vY-ClzDqR4GLiT5Dez-lw0LamDB4793Eq7Xq5wCSNCw>
 <xmx:7NHBXl3DWtert0OcTLZV3K3nW0u3j_WRE9n0lpHDpQeoBN_zPMR5Rg>
 <xmx:7dHBXjQvXOMyggjEzZF0IgvtbocqLm1OrJ7t9FEBLQaMyIhbLKzbeQ>
Received: from localhost (mobile-107-107-189-157.mycingular.net
 [107.107.189.157])
 by mail.messagingengine.com (Postfix) with ESMTPA id A6C03328005E;
 Sun, 17 May 2020 20:08:12 -0400 (EDT)
Date: Sun, 17 May 2020 19:08:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Upstream Yocto Bringing in GCC 10
Message-ID: <20200518000811.GI1166713@heinlein>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wZdghQXYJzyo6AGC"
Content-Disposition: inline
In-Reply-To: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
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


--wZdghQXYJzyo6AGC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2020 at 12:19:39PM -0500, Andrew Geissler wrote:
> Ready or not, this weeks upstream update brought in GCC 10 (along with th=
e normal slew of new packages).

Alright!  The great thing about GCC 10.x is that it brings in support
for most of C++20, including co-routines.  Looking forward to playing
around with it.

--=20
Patrick Williams

--wZdghQXYJzyo6AGC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7B0ekACgkQqwNHzC0A
wRltlA/+NPabwl9xTpM3fY2i2+ryLIsxWhTvHDk0jWaTxRgfc687P6F/unSlnIxQ
gYBpYOnHjCMHr3OrkUhTiO6RoBj89v8duZjYH86e2UQAS0nk3mtMhIukcqc9ndGX
RnblYcABUIzVczgSdiy4t49xDkTfxTiULDTbGThhptlH53Y7I6GBAZWZCEmTSE6G
SszdvqpPfdeC5lgJuTItKI9iGMD4rBl1U0HmN4nZfpllDv1NhsaKzPNWOr1KYFDE
1ZY4OYHk/o7nC4cuhMZ+edGlte5D7EN3Mkq3pn5LYDKnjESA2h7sBwHp6Jd5TUb6
GkkFxi/nZLb+FSz92BzbCxbYQaHzYSINt0ILz1py1RkGr4e08aOkERdpHcCkK9Vx
aDh4+Wv4LQ7rQTHV9B+zGaIaYZv11HwCfSqF5HS/LJwX0QfOfThAwHd/I0M79EsY
+qCHJQC9RjGRUX6AumPlVqmg/krppZGEOzFLZBS4a+H+ScMTgv39GwotSoN5WpAI
E13muUVk6VX1ZGoyMr70OwznbR+9XT2IETuefCbErWt4k88T+XTCHP+9CfADaQvH
Tk+CreBJokyEsMgn6snfISMwglMKqQqvTN495HEp27MCTuBmgjSWFC0XPV524/Ry
YJI66kVsym0+cRhL2m/W+GrUllc7PQNoTuf+zzR2URRbGmcf86M=
=eBqF
-----END PGP SIGNATURE-----

--wZdghQXYJzyo6AGC--
