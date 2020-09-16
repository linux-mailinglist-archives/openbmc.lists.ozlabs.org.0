Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68E26D074
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 03:14:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJsc6LxlzDsRF
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:14:44 +1000 (AEST)
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
 header.s=fm2 header.b=K9NT+5pd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=uGj4DzGy; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ6q1bLQzDqrC
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 10:41:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B47355C12BD
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 14:57:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 16 Sep 2020 14:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=tvKdBNVb8FQ7A85uS5W5bX+a/37
 WulZ/l3cr90/g+x8=; b=K9NT+5pdu9RG0E/x0AlxgSejWA0XZg8cb+T3CZ/qyTm
 0D8AINEpadIQf/+rsrUKvXTYj0xyakGbfFIjeM/0ObquLNf+j1GVkcnLpNQj57Xe
 Y8XdZsIN9VffUDfe8n3DH1h32GMCOJVylP8Uc90iNsYfxMxDiyiBmWZEJuy5s7a/
 1zpv6PDnuwS99ek9Gdj9xFp3/c6wUw7Z+2DmXMOu0eCLeyzCb77vNcFp3Mm1EdM1
 P/dwbJiKWITNiWi5ezHRAfG/oEsF4LgprpPvOqW0GFUtsCaxa9glfp2MJltMRumD
 s+SsXsUhv0kM+4tpwrZ2Z9P7aqxHC0/Om5ai/JaStWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tvKdBN
 Vb8FQ7A85uS5W5bX+a/37WulZ/l3cr90/g+x8=; b=uGj4DzGyAtc+etzlHw8lvY
 Kf/495US/BrXVlOTY5/Ob9L3kywASm8Zr5SkKboYhChdRXeS8fzZpgCYmZIEfHns
 Mdb7UJA4NpwE83/iLcQ+zZzLSaHB39rZVrUG+jZuRk1go8M6goq8BeJ1skR/qe6A
 qiCqQ6qQUfvMzTyquSM624dWwXEWYJN6Y+/F2hZmw+8xE1jfkPmZ/EUebI4MB4++
 rO0sFCc0DItRVcw/r/MLPJM+rx9zcEFuoU2FPLTaBuojCXjIdwnONuv5xP3mnMB0
 qogfz9YH4RVwqEml+GKTPbKixxOpUm6pOGiwmPcNZWLYZATyTwmPwgTtL4vB468Q
 ==
X-ME-Sender: <xms:MWBiX5WEQLED9aU9Zev87S3hyYg9LjtHsCrR5s5FR_FBXg7VphIG_A>
 <xme:MWBiX5lt6CZDfNXvagNm2d0eGQbRavOWMcf_O7yTcC8S5cW8BxigqNBWqB0Uo8bHG
 SXIQIw7Ok81I42GUE4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgddufeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:MWBiX1Z42hH6j69uyUiXc_kd02oeUqLC2CKz4xMtVamvhz6kXkINRg>
 <xmx:MWBiX8XsTaoroFqd0a45kXubHVpoPba8iGJvKQ2a7QM_Gnh8NdBk1w>
 <xmx:MWBiXzmSxt2T7gcjFc4SUjKXfHsdZB0DY5PpUnBtygGE7_XSFGH-8w>
 <xmx:MWBiX_wMgyzrdCXf-_V7zdkctHwNOnhtze44vBWokJSUQKY2YTDDIw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1F573280063
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 14:57:52 -0400 (EDT)
Date: Wed, 16 Sep 2020 13:57:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: phosphor-dbus-interfaces transitioning to meson
Message-ID: <20200916185751.GF6152@heinlein>
References: <20200905170407.GA6152@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline
In-Reply-To: <20200905170407.GA6152@heinlein>
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


--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05, 2020 at 12:04:08PM -0500, Patrick Williams wrote:
> Hello,
>=20
> I will begin transitioning
> the bitbake recipes to use the meson as well and then after that I will
> clean up the autotools support.

The recipes now use meson and autotools support is now removed.

--=20
Patrick Williams

--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9iYC0ACgkQqwNHzC0A
wRlauBAAn7OwYE3tPBE60tzD9qkZGAVOJDLmQdlvC0k3rRV9NrN+QRoOLd4MbTjZ
Uv7E+DE1VcSCiU+92cjLbew4CYIdLItU2UOfHdjxsTKi8htPnwrbjnEyuEOBZovS
NSQjONPmp+eIxJHYiIRScAGbrYhhMnB4lCbboOIQcl0bFSPBiEj3r5U4Izv9PKM1
4zP2MFAWednsgnTvjqZbzyDGhhHJ3d4nqClmOd3uplYCZ7E0yhmgTvZeYOVyibz6
N8nP8Dv1xS8Ap1szU88UlSArZ4g0TJ8H/uzzq6Bla7hcMVDx617zpQkrZHsn/7/S
n54YVfiWSYvuc4h1kRI8OPIz4kKyJYtAi4gNWA9XQufzOYANqhtL6qvw61U7v3cU
lAEYLOXa+ExU0UX/qs2IAgtTibZZ1TecxsVST6mZSmn3ix5jQJ9Qmgtx2bUVJLdR
doIKcb9KtsSjpqHg8vYuCcnd4ZwlMWBDaiK7f5ogUmdPEF7D8hLQhNlnY0A3YcHn
cedI9dD7GEKcwY3LKqIa3fwvHFBvpsu4pbLjq/IMsnhNzWTM6c3ROufI9tPuxVpa
jesWfNTxkUag5AgsfVeHnmAddJaHQ1Db6TJoCjubiNck2b82DH8PNbnXGuk/lxl8
02jiTRZ9TysZmjjTW1qqHuhPJfVXSt1wkilbUyJvfhJlv59ICqg=
=zZSn
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--
