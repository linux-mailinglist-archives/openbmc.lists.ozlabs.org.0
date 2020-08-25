Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0410251ACB
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 16:28:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbWZb5g0CzDqHX
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 00:28:55 +1000 (AEST)
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
 header.s=fm2 header.b=IUgbMKUu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=nHb4Xtuo; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbWLD75RczDq9k;
 Wed, 26 Aug 2020 00:18:12 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8C501D3E;
 Tue, 25 Aug 2020 10:18:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 25 Aug 2020 10:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=QmEs8/Z0/o2w/oQl3zJBNrpba7k
 QG47nIMOSPlw4dkQ=; b=IUgbMKUuJGl2klzpvew5RZOXzxgT4oxejy6EcWkXt4c
 UmyCtEnguOaFbzspswsQsu5s5TsfByHsUqtkVTCZoE+LkCMIYulwRO7mePSc4BKH
 WnTfha7iIJK4fnOi8soaGNQ6pIu6ae0Xt7R3HaRnAV63iXkR5at9V2hpdn/Vwz5B
 kevUcTmVG8VhWaCjgB41Dj+ANMU2XXMD2vC5f08GYP0dhP4uWwGvnh0LrXyz9wRj
 J53F5jLvUNWKvGeY1z+ggp4ZWs5LLXJPWWLJCGX7/C6iJMGm0safbUnMB5Eax7TI
 41ldXbU8p1pUY0sSTqXWT4eeEpXT+ha+x5cBJdpEAbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QmEs8/
 Z0/o2w/oQl3zJBNrpba7kQG47nIMOSPlw4dkQ=; b=nHb4Xtuo+K7SOY6c/qS+IU
 YTsTc0DPytVZGtDx3dgxVumIGtrYkZSs1jEsDfPCG/22iA+CHNHdTwmQ4bHMBKz/
 DRIM032/qsTPORddjzPW7avZdhY7AfjUjCCVPgtj+nuCMhwEeMwAZ5MYAiiQ0E1w
 ZIC0GM6qLyiqoj4fCNp3ptjh/X0djxHKYv8F+oELfCE52e/DCyOhet6zuPDPxuPh
 3dRD1earO1ucHV9D7NDXJylSe86RW7tKmQnpF4M4/nBOLd2V7KNBE+zcwPvxpoSk
 H+TFpbnd4hjXkwQs4NW7fmbFGlcQ3AwNDa7NWkPpyEU3uyQ+PIPODHMYywugBcPQ
 ==
X-ME-Sender: <xms:oB1FXwslh79Ia_3uIbKVs_-iycyPE_Uhv1YJck48pSUI5NDS78DQGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:oR1FX9fD7O9Uu6rejzrAklCAVWAPVPlLVRaloHh_uErln5vbASUbcg>
 <xmx:oR1FX7zkVtPHNmeLkTKeVixGVexe5wTRWm2uf66wOQUwyB_0R3SpmQ>
 <xmx:oR1FXzO4szcvhvCBvmRI0uxmX7Dg5vdUjq_-7Z3XlHW-lIvk2j28Bw>
 <xmx:oR1FXwzjA0Tse1MRnIqNuiKAyXDNXBKJPYxX2z_ZpgezICBQxLaygQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB28130600B9;
 Tue, 25 Aug 2020 10:18:08 -0400 (EDT)
Date: Tue, 25 Aug 2020 09:18:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH 4/5] ARM: dts: aspeed: minipack: Update 64MB FMC flash
 layout
Message-ID: <20200825141808.GH3532@heinlein>
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
 <20200824211948.12852-5-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline
In-Reply-To: <20200824211948.12852-5-rentao.bupt@gmail.com>
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


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 02:19:47PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
>=20
> Set 64Mb FMC flash layout in Minipack device tree explicitly because the
> flash layout was removed from "ast2500-facebook-netbmc-common.dtsi".
>=20
> Please note "data0" partition' size is updated to 4MB to be consistent
> with other Facebook OpenBMC platforms.
>=20
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  .../boot/dts/aspeed-bmc-facebook-minipack.dts | 47 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9FHZ8ACgkQqwNHzC0A
wRmoQA/7BzbYGmsNhCqDgSK2BBGRdfOQXzsHB7RX5l1njoX0+O85xoTB5XUVuqP2
DhjGuc4+QprGKmCnHeatfbQUOwDqWPQvFvKnEIjRlsnXSK2xYVubqHkJQnz6Is+5
LP0Zw3lIZVYVXFmjM3WOaRlnNkPSAz0UoyxwAwZzSodN/0Vp9udCHnIpIT8IafB9
4+wtW4KqfuFpJ721upa/9KrxsBB2+P0tQcmCwBEROIcL3Cj5HQz606T96vVAI+Y7
7Hh4GfLCpkePKECh+vWlQmGUp6ASUXnm3GHwX55/l+QZM4EWI5W9i8C3feJ9XYu3
aL0RD3gMbhKIykUnciO3UPGYWPPGAdqepk7/t4kEP6+ygMieYPvTO+6gHpd99XOG
NMhkNvQObj+Ypuvg88/LZZwgMXO/MmPerZ8HULEukSm20qblGgjTY1BMyAbraEld
Mtn4Q7axAuN3QeSlCgrtlJOvdhVaJdorznfuTM9LkW6+8Ct5ZMS+f3lyMRMT8Ch8
fBqVNIXVS7uCWRRZrDamDE32ioO0xQEZtDBIy2ZAaW0UMtNNkYWPBytsxIRrok1R
yFHZBON12LtqCXXtycVCCFBspH9FzpXeJixAAsCp3o0DpMf1W1QznwbYtyzsRJBP
9lp4G+UBpOsmFWpVK01kOaLv6URm7f+zBWfQKN2AV5Yy7XFHZoI=
=YxTc
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
