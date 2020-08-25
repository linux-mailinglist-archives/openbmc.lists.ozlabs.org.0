Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A34B251ADC
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 16:32:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbWg75bt4zDqSy
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 00:32:51 +1000 (AEST)
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
 header.s=fm2 header.b=E5WRahuZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TSZDQnqG; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbWWY5QYBzDqX6;
 Wed, 26 Aug 2020 00:26:17 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id BB182E0C;
 Tue, 25 Aug 2020 10:16:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 25 Aug 2020 10:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=aTF9QeBnpIsAQ0xRTTMILzpdzds
 NQO9ZOQWY0lJXDFw=; b=E5WRahuZsjMQvhMTLsD/vchYbXw2A+eoGYNFOwK0ieE
 dlmxm1h6pmt0BwJY25VVneIs3OZVWFiuh9PtfvEbtnfXICso1kAx3FMNlB+tvrUN
 ncjAZ6ltRIvATM8OkWnOVDSNB7zXyIzMsMgK9drJ3X/1XgU7T2RohjMuPW9IbAXL
 rgxc4pPynHIwxs3sOMs3fhOREK1Hon8oPpcs21rR7vnNJUsqyTIa5ROuLGNO7+dY
 YwJ0qlEIPWZlLxJI0tma+IQWnng6nkR1oBxZuwoetAEKSS49P3KgTedul5u4lHw9
 /l8VDHWx1tYORLYd0oqQd4pjHA7D4uzZv+U5eeviXTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aTF9Qe
 BnpIsAQ0xRTTMILzpdzdsNQO9ZOQWY0lJXDFw=; b=TSZDQnqGHCmU14XXJUJK5l
 AAYjthmhrI4Xfum6iVh5puHLXOiABqbEXW414pEiqi1dg6AcDY00mIUwvH70wbQp
 /ILR1WBMz1RjD7k2TOU3j6suwTsYfnc+qBOdM40F2nRD65/iKNLsVXe1RgFvndyO
 +5NKJIFSzhTrewYYI/Wrc5RYaz5Quqq0+4GtQ1wTHNzfOXX4+SSNySyP6yOe1BkA
 HSKrDFqhcazPwgv4oYyeXlbNiIt4EskjzRed4e7XOcJuABbpb/Q088CtB1xDmc8y
 vuBZ17QIxnrFZcBXxKb1d2/oiuJi7prB6ap5fjxot8fu4MxrUjR9KGdEVLS0LyXg
 ==
X-ME-Sender: <xms:Oh1FX274azyzIX59INlSBTbwQni4fHa2WxIRF04DcujVYot8L7ij4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Oh1FX_62iWyDUEb-WkaELSl13bQBIxEngSYH6A2BFKzIIDDosgvlCA>
 <xmx:Oh1FX1d2k97vZFiYWWobJog9a1yERDVi9WhTDcLN8ymxfT87G394eA>
 <xmx:Oh1FXzL5MhCirYngyd8570YuI6mEuT8KSFo7EWbFfbF0Y3U5vsvv9A>
 <xmx:PB1FXy9VoKz0zE9UwSytN-F2FjSRaxOlwx-Ma-nLO2soSKnTPCnbDg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 065A93280067;
 Tue, 25 Aug 2020 10:16:25 -0400 (EDT)
Date: Tue, 25 Aug 2020 09:16:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH 1/5] ARM: dts: aspeed: Remove flash layout from Facebook
 AST2500 Common dtsi
Message-ID: <20200825141621.GE3532@heinlein>
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
 <20200824211948.12852-2-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline
In-Reply-To: <20200824211948.12852-2-rentao.bupt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, taoren@fb.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 02:19:44PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
>=20
> Remove FMC flash layout from ast2500-facebook-netbmc-common.dtsi because
> flash size and layout varies across different Facebook AST2500 OpenBMC
> platforms.
>=20
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  .../boot/dts/ast2500-facebook-netbmc-common.dtsi    | 13 -------------
>  1 file changed, 13 deletions(-)
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9FHTMACgkQqwNHzC0A
wRlLVg//Yi7bXT2BaZK+9/u1ddHBmjb9gupHMr7tC457ocMMNTHa8wNR4QxtjMKd
VdobcwMM0bOlXZ+mA3rJ95xoSHSlpr6BV16nH619r/hjP6zWOkGFcQnSJ1vvrwVE
8rtNOJgDaV5mrkUc6Q3t5exKCa+bDN3BWxiARMvDr3xN7CqLfzOj12AaHC2P2ryt
6INPiGQSrrMdQ3NCO42ufRaiNhou9ozoLVtba+V/cWQ2B6wYItQj4HAc1SDew6zo
hEiK510DpLOSOgkkE290EL/D22ix5IdSFQ+iCq1Ej/rJVJEZRF8co3VhBlUe7+3v
mqEAJWpLsA7xnySjpflKLnYZ3foFSg4JidmeJL3QyKk24j8Uf53pJ9yrXjqlCEgg
EVovsJmZHms0Z6w1ShhBuAvbtX6vfI97ilJKuJs6Yv9qlruLdMT7ZCVZ2GA35xoA
/DVUF5J+QR/op00dZITZh3AW+yXhUFGZVDa4OqFMHS9Ln6WlGRX3Jr9QIS8dlArP
NCWM27YhPBKB4Q7ERkBJ0YtQugeo6AcHGfg+a65TYxmgIpL3lT79lEyfkNWvB7Du
QrWIe+l5bV8Jbz3EIEVB/jxPxw+bTxXaVjWkyeBbTdiy9jH49qk0PtAcE+xvjMyw
Yo0rfBKvO8IOCs38VDeMzilMu2yiJc0lnntWcCOqPny3Z39Mmr4=
=RrBW
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
