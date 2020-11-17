Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B22B6A75
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 17:41:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbBXg69mqzDqT7
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 03:41:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=tgQNnaIs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PE7lQqUq; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbBWS5xDGzDqRv
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 03:40:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5EA565C0268;
 Tue, 17 Nov 2020 11:40:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 17 Nov 2020 11:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=tkmLVJtNhhtZ3oS45xQFish2lXO
 nJOlaZtJK3ElNFEY=; b=tgQNnaIs994ZZYSN5UYmHAqP6qkupLTrQ5Xb1X3FPmm
 fkZ9w/kYBos919GlRMiztm76LzslfkqTA3vxb9Y/LC+68a+8/06Yhn4AQKXHvmIS
 NNfWVCiWRCyV523dyoghiRUy8S41mNpdRnm6YnrIE5isM31bYnjZpfWTiEdP2g1U
 84sWogcH6ToxZOdKEmi1yuDcRWVkWv7vEp1Sv6G4iCdXs9nGWisrJQBXH957U1gL
 YZP4gC1Wc8WGCvf7ew8PZgTkp8rwfrWdyMu9W50d1zvIwuB5nlKncn54+saltVZL
 Fp1r1ZuvYOGlbSkFgfsG53XaVSjLkDQGtCXX1KZB7cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tkmLVJ
 tNhhtZ3oS45xQFish2lXOnJOlaZtJK3ElNFEY=; b=PE7lQqUq5fsO1g/m9sIzrN
 ppNPI8Uj1wiQbWrWpJhVaSULf6kWHQL6ELQfOMRXngMbxkoSB2nsQ78v9qM35+jZ
 b/l7tcPFyYzIcCscVlFuc4gSBekI4gmhHGu8d5O/awApHo0kKZLnETt65TR7VSFk
 rwosTmZPOCaatIUa4DMd+A94KrbQt9lwtvIaK+E4tQtK4Q7SESBlawHkRmd6090q
 yHyzm0xuHtJsoetvUA8fCsT7ar45HlkdEYAlUe12Vjbmz6J7HwzXxFmz6hPEIzDM
 GexFCJNQmuNtB7HIZz8kLodkoAgcaPkbFRO4MSpU1lw/Wlwx1hbd6aUPnxTxaKgQ
 ==
X-ME-Sender: <xms:7vyzX2crsF0NcwsIU5Tya93H5zf1V-lcN02E9VUHuXVNYWxZwtWv6w>
 <xme:7vyzXwMh68dZw9HwhFmPNDupor5Sw_u4MGFiZmASVv7rFr6l8lqqQNJBpNQvjLdiq
 WfHUU15Na9AoBs9NVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeffedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeffffdvgfdtledufeelfedvffek
 vdeffeeuleevudeitdegueevgfdtieeuueevnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:7vyzX3gY6l5qmDs5xnFpLN56DWU6HfEdT4v9EI6_xJ6A8qhrjVU2xw>
 <xmx:7vyzXz-nK5_5g67IJtj8qw9-Hkdyr-liOP4zXrY9rlW5986G6jhQuA>
 <xmx:7vyzXyuUMAoGOkLw_k9HOSNYry5ZtUgV9cHFmlupkZ_hbek2MIlZww>
 <xmx:7_yzX3W78gmH6IeQQV28qigD-KDmS6H47tdtqWjzxPHY311Lysq3gQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id AEB943064AA6;
 Tue, 17 Nov 2020 11:40:14 -0500 (EST)
Date: Tue, 17 Nov 2020 10:40:13 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: STEPS FOR CHANGING THE DEFAULT SERIAL CONSOLE TO UART2
Message-ID: <20201117164013.GF4495@heinlein>
References: <CAFMA7evLWM5ER_KAms4may+PanjUeQPH6Wy2JoCjQkiXj84eSQ@mail.gmail.com>
 <7db605b2-2a22-7693-041d-7d85c60cadd3@linux.ibm.com>
 <66742cd3-7261-4839-b8fb-3da41f473758@www.fastmail.com>
 <ab856254-2636-1440-13df-7a351a501742@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qftxBdZWiueWNAVY"
Content-Disposition: inline
In-Reply-To: <ab856254-2636-1440-13df-7a351a501742@linux.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Radhika Pradeep <radhika@qwaveinc.in>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qftxBdZWiueWNAVY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 08:31:35AM -0600, Joseph Reynolds wrote:
> On 11/16/20 5:29 PM, Andrew Jeffery wrote:
> > On Tue, 17 Nov 2020, at 08:12, Joseph Reynolds wrote:
> >> On 11/16/20 2:30 PM, Radhika Pradeep wrote:

> Thanks for clarifying.=A0 In that case, see=20
> https://github.com/openbmc/docs/blob/master/architecture/interface-overvi=
ew.md#bmc-serial
> which unfortunately does not yet have any details.=A0 :-(
>=20
> Is the BMC's console configured in the machine config file using the=20
> Yocyo/poky SERIAL_CONSOLE or SERIAL_CONSOLES bitbake variable?
> For example, here=20
> https://github.com/openbmc/openbmc/blob/master/meta-aspeed/conf/machine/e=
vb-ast2500.conf
>=20

I think there are three places that the BMC UART needs to be updated:

- Kernel command line
    - This comes from U-boot since that is what launches the kernel and
      passes along the command line to the kernel.
    - In U-boot v2016.07-aspeed-openbmc this was in ast-common.h, but I
      don't know where it went in v2019.04-aspeed-openbmc.
- U-boot itself
    - I think this is in the same ast-common.h under CONFIG_CONS_INDEX.
- Userspace via SERIAL_CONSOLE.
    - This is the config you pointed to above.

--=20
Patrick Williams

--qftxBdZWiueWNAVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+z/OsACgkQqwNHzC0A
wRkXyA/+OhTX5q7udxjO16vYslgAHq4miN9JnZCsDO7v/oqUcPp8MpIN53PisJq4
pBgguMar5hloTKEKQN9uq50MbMq9DAMvM6PMrI/ogZV0TpHp6543thkyLRN++vhe
MaYO9KVPnpG7EnZFPZuXpCoFu3oAbojORF8Qmi9XrI89cIb8es05JwoH4l1t9tY1
ccJd41ZOU18Hl1WjhNLbdDn8PVe6VhUPNg+rmGAdzssYkPqQwMQHF1gZPJa4PRGM
jSVbMsG0FTfieqIb6VsHzs74LsZMKumdrK/9tpwSIOxCg6cBeE9GIDzhkV7xm04h
gIMHb4ZBwAfhMJBqV1nvOEIAbch757wFreLvmBiTib9yvpabnzYNrxMpehgFVPM0
M1X5PbSA8NaA3xA4aDupVpftLDC9VzDNV9CRZfeaI0AyT3fsFC8jm9ORQEECeawr
lDlp/jOif/HuHChvv4vheuOmFM4Lx4aWpyOeWy4UzJuaU1eW6n4raJ37IwA4UMDp
ENxfUjZ3XZNQ6m4aLmrVLEMFsBnV8oDnbZ6wkll/PcLfnwwClVcSMl6/YVwC8Vrg
M6hTjbQEJSmlnvEQy1kaF9DvQAVLzku3Uv9MTlU5pnxFf4B93St3GHYPLFCKaw01
G+kOKa2ZNL+ixaINHi108rxsscc8zk1mbkGfdMTNVax+rCmdJuE=
=rSfZ
-----END PGP SIGNATURE-----

--qftxBdZWiueWNAVY--
