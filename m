Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D34F1BE34E
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 18:06:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C3K41jN2zDrBy
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 02:06:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=QBTEBQlf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=uVwt5pcV; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C3HG4s3czDrCD
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 02:04:25 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E622D5C0525;
 Wed, 29 Apr 2020 12:04:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 29 Apr 2020 12:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=I13gw0jH9qa2G9qWryze+8eJ4Yg
 hZCP6//NYyNXHIic=; b=QBTEBQlf2BuLV7foj50UCH1OgRoKDdCBLa+pbblUZW/
 R35OPNESbhGLbFChSZ1dfwIAeBkPEkW6lABsMWK88l/KUV5L3254EjAJNLqj5rMk
 v+hkKuNj1de0iIUwrySy42f6OyClBuijaeO1DaBU77opuOvHgUTm/rD/x/VR6aol
 URaj83p85jter/N4MhF9ATE331dPhl/uCTIDDZ2GH77WoqJUL7ZagR+sg6ZVLRlk
 8QIHIEbaPuU6T19BtveWQb3NYrsQ61WQMI9+JoQv1r7exOtidV6/haRqD4q+tpAs
 uKZ5lCndQQH3Bigbx3eh0TBOiJ+c3m9o3X4iAgC0vdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=I13gw0
 jH9qa2G9qWryze+8eJ4YghZCP6//NYyNXHIic=; b=uVwt5pcVGcdE3OuFdIp8cn
 ImDgrtPw2Ll40HSnC4HMW5MZvAGIwkke3bdGj8Vto/6t9PDyJo/KvJ1X7Lx0LQ3O
 BV79T41zIiQegL9TJmDwcnuUxkj3w6UoerOr08gMfIJPVqAlXCIoXRk/xOVWhYNO
 UsfZTOZRuRGssb0nXr1WpLoVkyb4rUA1vfxlETohBTJPX00/IYY6/+Oh9dfnvcd/
 2xuZi8czX1VH5JCrHGkMkgH+gdOcPJPcZBNHM+sufbIf7CWjbHFDQwpjlAGRjjBz
 GzNcaZR7h05fioJLaQ/Akdl8TYeIDzuDbi3tYQPjxbeSvP19iRzWojgeOqCjARzQ
 ==
X-ME-Sender: <xms:g6WpXqyOik2EXGefu-mIidQWDc1uUFKQp3C_sw_oFDnfC8Wi-D0SjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 elhfejfeekteevffegteffudefheelfeehvdfggfdvgffhjefhfeffkeeiieevjeenucff
 ohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduieeirddujedvrdduvddurddvvd
 efnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:g6WpXrfV-1YPQRxn6q8nmnAskb81JHaFFZIIuif26XUXuXzOPlr5gA>
 <xmx:g6WpXtNmqOLFS3ZR4bXtCG2S_vKQYY9i28VgSx-GnBBg2mguVGRmrg>
 <xmx:g6WpXmuqXBV72l1HNyIzmTHhUpsrGKxMKDxwXkxLcgOm3pOxi2FeFw>
 <xmx:hKWpXj8zJPgBQZLzbEAHqNcbDA9iakmJ6Y166wlbJoPbz30acaYr1A>
Received: from localhost (mobile-166-172-121-223.mycingular.net
 [166.172.121.223])
 by mail.messagingengine.com (Postfix) with ESMTPA id 777433280068;
 Wed, 29 Apr 2020 12:04:19 -0400 (EDT)
Date: Wed, 29 Apr 2020 11:04:18 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
Subject: Re: Regarding power control
Message-ID: <20200429160418.GB5268@heinlein.lan.stwcx.xyz>
References: <HK2PR04MB3826D1F6EF548308AC59B65AFEAD0@HK2PR04MB3826.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <HK2PR04MB3826D1F6EF548308AC59B65AFEAD0@HK2PR04MB3826.apcprd04.prod.outlook.com>
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 01:50:09PM +0000, zhouyuanqing8@outlook.com wrote:

> Regarding power control, I read the codes in the following two directorie=
s(github.com/openbmc/x86-power-control.git & github.com/openbmc/skeleton/tr=
ee/master/op-pwrctl). The power control is controlled by GPIO, but the powe=
r of my board is controlled by CPLD.=20

The x86-power-control implementation uses GPIOs from the BMC, but those
GPIOs are wired to a CPLD for the signalling.  The CPLD monitors the
GPIOs to know when to begin the power sequence.  This is what we use on
Tiogapass.

--=20
Patrick Williams

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6ppYAACgkQqwNHzC0A
wRkMyRAApw1avCne3Ent0WfmTrzTw2SMf03BIyE57j//JEITHUVe5nlIwCtpmCfz
vVPmYsB1VFeRPHVKVjjTuoGtRc96E+0U+11ObvQtn1fELSbkBDlG1ceYXBPaeqPe
Uo5ScBQexbJKZ7/dqGTjWZ33zFAxP/OFblMeAxagPR/0DaQDTzD/2yBxg9DwAMGM
NDkFZhFck0loFI95V95+HVOBMNleSkB+RxRL9Mcfckw7BamZQR9Un89sqWolGiSJ
gVNe+6MhZoUSXN4/7k5LTvA8mLjpsqrcdclUXu3dgEmmKERouS7qgxzq7f2Pi4iV
Ff+jzsqw9DS2A7K1G8qM4Kze+q8nJ6Y2nL3yZEwsN17XScDc0J3Yc13dIX/mxxsg
ToXg8Qsapv+hPve3H/ZJKCvChzGPBU8VhOfcmUq1pGz5+1OghQ5r7JB3IlXyfwLG
Y56aVQgoPiGFe9MUx8Sl4FLtm/QRpd2YAH1tc1GTzGtZZRrath2jBNkY/Lwk/fRA
jrCpbUc3Oxh0qnQzdlrMyMUvdhQ4fug+lAf4zd4qY+bFcZ7D9FTG3zZUp9Ox7MPU
LRSpu/8uEsCxkRxIP5iby+CiPn1QBH9Up3Rledr5kd+z2BR86ylkmJ+T/2TG4ypP
V0UvSYB3kL86HDWdMUvTm7fbOpHsaq+2NJlwkVbU1yoqQj4LEUs=
=0hg9
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
