Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5A38F394
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 21:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpn9n4T7Lz2xy3
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 05:20:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=n2XpHH10;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fpNNDCee;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=n2XpHH10; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fpNNDCee; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpn9R3W1sz2xfd
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 05:20:25 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0C84A1135;
 Mon, 24 May 2021 15:20:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 24 May 2021 15:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/zQ4MB4A4PtCs0DoLCV3sIy4VJf
 O04qjUCyBgkdJJ7Q=; b=n2XpHH10GjT8ygepNREHyhGGI88tD3+ji9JNU74pi7b
 z6h3yY5U9HOD7/UAOIQyOEG8lwBrxt8YtosQ4UOLhe2YSjlLBYWj2jLwW+7QUqbo
 vkNYJuL+EQDcPKUVYAVxY4IRucabehbn6IXDBTPb5YJ1Uu7Jls373KKkm1Lfx2wm
 lB12iqR0ezvum73bCWYH8Lf9QewgPwx+VnxEt732hJVJ/60KkTSSSGXji91ohwq6
 qKl2d8WCLBLbws/rwuA0ejA/EC/ltN3dwkaE8c51oezoNf7ejmeavypOTN0yEw0I
 sjxiCUKGN1AX+WsVf1Sazs2JCeOdEQjbuhUqKjBBMog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/zQ4MB
 4A4PtCs0DoLCV3sIy4VJfO04qjUCyBgkdJJ7Q=; b=fpNNDCeei6KOt3QPxka9Ly
 oAg7UPdvP0VhCO7SOsJP2Ute3P8Y6NZnND1TJGgEQFRsI4xGHdd2wJShHp3hACYt
 FbSz6SSqtsMttLOS3mkYtLvGlGYTlzWgkvQI0HNPXspYIPIdwsJEerwgE9FtNCSt
 5Rycc5K66UyjGV+6EOQeVgnO3ae2B+xEz18i0vIxANJzMfg3kKRowMMituDFfnrU
 8na25Ji+Kh7CkGiJSCLMvuMSQjL3L2ktigeZpxYrO09BvtxJ+WP2qsSVMvBk7y1C
 RFgNCUl3LHynm8mZa2hVgt+gOQg9iQRXjnh1/fikw4sFQjTFt/bRrXpedsq1/TjQ
 ==
X-ME-Sender: <xms:cfyrYFNRecnj8G2zyvATiVWldLQl4pG-0EXtYWHL3iqVWmsPfoyKDg>
 <xme:cfyrYH9OMgK7_d2-9cyAMr2QxPEGXIaTNMlH-izfL9TBl6kveakT4t6ADqXuJKGYe
 Hu3g8oK9-aOwlLRc78>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvffeggfefteeigfethfeiveeu
 udegvdfggfejfeehudetjeefffetkedtleehhfenucffohhmrghinhepkhgvrhhnvghlrd
 horhhgnecukfhppeduieeirddujedvrdduvddtrddvgedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgi
 ihii
X-ME-Proxy: <xmx:cfyrYETeZZgvoM9jZXKA_zr81uWZ6wF3xoM2efqNek1GJ2AXJuZ5rw>
 <xmx:cfyrYBsnpIx0ii5SkO9SUsPFuuCJ5nu80Tsy0mlUGVw6GfAegQtTgg>
 <xmx:cfyrYNesLhB7UjqlQORM5Ng08uMlEZj5tR_j5JgbBEs3qf8u7UiUMw>
 <xmx:cvyrYDoyXDAYilSte5jXbyTCHZYQwZORD34tx3oXBF0cC7LM-TNX-w>
Received: from localhost (mobile-166-172-120-240.mycingular.net
 [166.172.120.240]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 15:20:17 -0400 (EDT)
Date: Mon, 24 May 2021 14:20:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Subject: Re: push code to gatesgarth branch
Message-ID: <YKv8cCd5pSfSUwDb@heinlein>
References: <PS2PR02MB3541E7D11C2149187922E3F3902A9@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <PS2PR02MB3541DA8BEB50E318B5FFB24490269@PS2PR02MB3541.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QhoVi/lTpPCPdYC2"
Content-Disposition: inline
In-Reply-To: <PS2PR02MB3541DA8BEB50E318B5FFB24490269@PS2PR02MB3541.apcprd02.prod.outlook.com>
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


--QhoVi/lTpPCPdYC2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 05:01:19PM +0000, Mohammed.Habeeb ISV wrote:
> Do we need to push the new code only on master branch? Any inputs?
>=20

I already replied to this question:

https://lore.kernel.org/openbmc/YKbGE2s7ta47YuAH@patrickw3-mbp.dhcp.theface=
book.com/

We have only been allowing development on the master branch.  Is there
some reason you want to add your code to gatesgarth, which is now 2
Yocto releases old?

--=20
Patrick Williams

--QhoVi/lTpPCPdYC2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCr/G4ACgkQqwNHzC0A
wRlUWg/8DhnWp99jLYdgn2KmZ2ngaWxr4bDUmUyjfFOZbFjA9Pk/SMq0SzyFfPI6
accS8uRvWHh5H6uqisKhAkGEnS6FQjpxdzOvoLB8kZLDujRnRBymQbEq/NWdh96/
UhlEMFNLC7GOXB1uzs/jTY3a6teYCWaZLdf/fFAMnds0Gh5E1gKeULQv4ad+fDIR
vagKfEqA7ofdeWWgnfxZ6ujmBj3tLx5t5om23K7K4/iaCDo4KTd6LcGPsdHG4bbs
V0iTc8VhY8tplIpBKwfLXTxEG3HUN6Bm7+9KUcOzapA9Vh3hvGJJrLObu+B+0/T0
40EdZZj+qxeNhn34gR3BUS66wJmdqpGS+w6U42gk9V84sgqm/IhcI/oUcCfsErzE
RCXo30WPm3fbBmLFJOVbOdoSUOvYWjCTvpc4c6OqvaFw95ozxkKmMwCP7elw/oky
eBRCVR400qJpeenIpU4DcUCRcOqMvJzsAlY8FDWWy/cEapiaLAH8v+ZHQTiC/iDI
p8Onq1EHLfEmzWp13mOfdmmEqDFk3HLchweMYsJ+BVg/gQckrJwG0a83djlJHMXS
HPoW7J53EtJocXNWgX7QN2zkB/lugILarVzmbBA177CYq88wbnyUcijOTxs1iq6P
Z32sMOE4M/Q5GpowIhPA1jMW1AgdOed+K4/nuqkD4+FicgSThb8=
=FMWS
-----END PGP SIGNATURE-----

--QhoVi/lTpPCPdYC2--
