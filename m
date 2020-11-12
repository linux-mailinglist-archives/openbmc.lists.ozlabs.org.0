Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B58112AFD8C
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 04:19:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWmzZ1JrvzDqtY
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 14:19:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=MQt20/kP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=VvQTr1BJ; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWmyj0JJ4zDqtQ
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 14:18:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9C25AB3B;
 Wed, 11 Nov 2020 22:18:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 11 Nov 2020 22:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PI+Uj0fEHIXD5fotEiMxeL9UVre
 tyEkuGpP+BkHzNZw=; b=MQt20/kP910bOei9BuSJUZcFMQtnEqXsJtzVlRblbR9
 JKyW4afcF7Hwhc1C9FtGIc621tX+pxselVRjx34XYGbcVv53Bxu+W3FpoSQdB/l1
 BzhtlfBrp7C+f2cgdCBlInir3WJx3gob1KXNj7kRKTekzQKz1FeXQnoML//H0BIg
 PfdByOTXhdvaZdIBCrcuhQeYlJTsCjOqhFGvSyTushDMvncUc25HX4qE3sZ05qaI
 UTvBoDMMT8WvAGrfBT1X1zduBSLvMUmMpJVhwzOO9aBO7Q9sBy8SMupYPHENZvB+
 mHiZoztN1utRjXCBakLSOIIMmUeBA0vtKe1XMVQ6osA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PI+Uj0
 fEHIXD5fotEiMxeL9UVretyEkuGpP+BkHzNZw=; b=VvQTr1BJYwEukjB+21MHfZ
 eIdIe5Zt0c00pMgvu6rXcj8ZHfPjGm4PK83dGmVtpxQZgbSl2MUOIBBnTUFtnYl0
 r20kHStPRjxkwpTT+nvNUVHIqnduQk3I0Fx4iOkbTeqeUIJUtLw2ul5F86aGASCx
 VC03Il9CtP/PuK+Fk88OtOEcI27bB+8yuKxGOeb81vo2iunbb6pduKxFXK/Mm/Uk
 iCqBtyEhuTEh6HYKqM/8vBQBvN2TX4XQDw83a1NFf37IntRnrK/b14C1zsFVGb0w
 ITKkIpOOZ2BiZavmgF8wJkILBULIHIqL+8tbF86J+v0yWsSV0ab4INxKaXYpgJ0w
 ==
X-ME-Sender: <xms:hqmsX9reRdV5uNDrwCNtsvrnQAKCOwafAoOsH4lzHWauNEP-FhgXIg>
 <xme:hqmsX_ra5VnDoiK0py1ougo432YQQmhSfZvB-EBV2uJB9wQZdCbsZ4aL-TEe-18lS
 XIkRfXO0y5Rsy4DVHM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvuddgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:hqmsX6Mwc2tat3qGDWBwvSYLS_ka-LIAwCcuU40KQbo4a06kN_Xbog>
 <xmx:hqmsX46T5bKbNtlO6ZFDGN1gt-FYRli6WFn-8jDlBotv6XVrXDl3yA>
 <xmx:hqmsX84rfdX0tIaLxrPQKOaC1lfBF1BydhP-U4sFYfQiLm5fgmfl_Q>
 <xmx:h6msX7YXxIo2VhJ8cx1Cv0otvVgUgOh6hJlXDyY7ysxO4jq2Z0Um6Q>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4080C30644A1;
 Wed, 11 Nov 2020 22:18:30 -0500 (EST)
Date: Wed, 11 Nov 2020 21:18:28 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Add Facebook Galaxy100 BMC
Message-ID: <20201112031828.GA4495@heinlein>
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
 <CACPK8XdC8FRKOLQ9e583gVuDrL5829MOfx5L=O68dou6mjW_6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <CACPK8XdC8FRKOLQ9e583gVuDrL5829MOfx5L=O68dou6mjW_6g@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <rentao.bupt@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 11:34:10PM +0000, Joel Stanley wrote:
> On Wed, 11 Nov 2020 at 23:23, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > The patch series adds the initial version of device tree for Facebook
> > Galaxy100 (AST2400) BMC.
> >
> > Patch #1 adds common dtsi to minimize duplicated device entries across
> > Facebook Network AST2400 BMC device trees.
> >
> > Patch #2 simplfies Wedge40 device tree by using the common dtsi.
> >
> > Patch #3 simplfies Wedge100 device tree by using the common dtsi.
> >
> > Patch #4 adds the initial version of device tree for Facebook Galaxy100
> > BMC.
>=20
> Nice. They look good to me.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20
> Is there another person familiar with the design you would like to
> review before I merge?

Also,

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+sqYIACgkQqwNHzC0A
wRkjOA/+MVToyQOs6gmPPw8Mbeu5twaJfK1kiwCdZ85CUbMW4HPwsiibBYpy2boG
AcxeQGuO7xoC8j5QJ4Rr7dvm5IDhk/nlnpXiP7g4b+Qq9HYZhTY7DjiuuLgUYOg8
t2k47k3Mo+ttSfCH31afQ8whjiD26tVq0yj9mjAY9+VdrSwh6iuz02GG9bswHyw7
MJsZUvWEHZP4aH/eKMd+X4MF/BN80hAF02KTQT3Foj2gPFBRiatvGFRcPb/e8xh/
VN5R8N6MEDu09OKBGw7VBhWoWjjYt83XozqQwFM5R90gNOCyF9Ej/zCkmuGU6fxa
hKoL/ESEHOCJa65B8hTcVLRInr8BrqJUK1GQzSnXj9n+jrMiwE12N2iffzrFUV0n
LrO6fXhbg8yT7Z8t8lFxHTTVmIqTJJiZ8MPjPuu5DvqZQsXiFTebv+AhGk/tE9gp
0xUge0NlPhN1IoQ6tBinGNmO42Q/X6tvEIfwm1bUkHn+orvDVc/By5d6dUyqjqiz
HuTt3w5OgDI99qVoIVtmv27ZL8aleSRjNSc0SZ81lcnBEbqPwM1n7fQ6ymOX+wHQ
uK90MNfNhdcSLIl68shGHbcsW/FVkqBilzV+XYIhOkwf9qYGyuLalRxFZyGjhm6S
bxXZ/jaUt6kvKDqzf7FVQbDrXqhva9ZWadjuV0af1MZCsUiqVc0=
=i9rh
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
