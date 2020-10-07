Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE21286210
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 17:25:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5yp25rj7zDqP9
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 02:25:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=CIpKs6qJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=GCJ2GQ05; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5yn03Dn2zDqH6
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 02:24:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A27079D7;
 Wed,  7 Oct 2020 11:24:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Oct 2020 11:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=2tafazyMlo2ocejNm3LRha+40L1
 l7ko/AZPHXsQBIac=; b=CIpKs6qJ2UcNLEwEx+mfPPHXspVR/98Eqmdv3PhR/wk
 5xFUzwsoTdEpTIk91w6NBNqjIwX1Ci+Fxqz0e82B4CTMdEYxEeH9ytKFPgxW/nr2
 hFc9eE73Etk4TpRwRGlPF/EJec/dPq+8OMBWuaT5BrME0DDLy3IoDllPAMOlDoUs
 4ncBNd//SvxZ8EEeALkKOipgP5YD/NACDyNFcQuP0AlyfTa02yRDJcdPg28DfVw/
 sQX2EWEqBp8lLnrByrGtYE6Vl8EnLtIr/V21vv6GpfwK3ewuvN4JviFDzbIWmIgy
 0ZdrqWNd7cRmeNdPahETmB2BvkL4gdBvr1UxikI0Xmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2tafaz
 yMlo2ocejNm3LRha+40L1l7ko/AZPHXsQBIac=; b=GCJ2GQ05h16c6UXivjHaOk
 WtW2J4owicJTIGTRQnb2QXIIBGcGDT0LK/CBksjuX7vIGT5iUfrexvEEtB8iUPpv
 9HDh0z25D3XGiftGLO/75lAUaVHHqqkeTfXL6veMsrQ2DdMBQAtn4iO9u5Eq+mIq
 EQSA9W7NiM1exsc5Up6SQxJBur8rUmJ2BpVaLkv/O67jpnvYsf19zkma1qoYdhUt
 QokvI0C/zhoc9a3bMCiOEf7e5xsie9VS1CZVVS5upJLl+1T3xVAJEik4yT1/PTuY
 nr6KSfbo9CzB7DWMXSD8OWHYC5a8IpIpZGfjRnxVyYhcGNz/uV349yOmtVpfZp2w
 ==
X-ME-Sender: <xms:rd19X0gHGWVWTMxGSirQEqdv8QqGYuXnpSt8VxYm4U84oXpSUlUv_g>
 <xme:rd19X9DliPbGlYm3VqHUPNFv8d0jZNglcTZDf5MTRh6s1DGrNgrG7vE54JA7-zIF1
 11g7AWU_gnV1GQu0b4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeeigdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudefheel
 feehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecukfhppeduieeirddujedvrdduvddtrdeijeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:rd19X8ER4yn6fVowoaf6Lgx3EsXwMMVRWzd1EjcEcqUNLDU6uEVPAw>
 <xmx:rd19X1RhcdhzaW7Ckk1f35VvDsrzJ1WhLcTqGpRvb8dIjXL6gTPODw>
 <xmx:rd19Xxyta9MUo6DTYuCnVJicK9QYrOXholGuFiXDHEbS_Gphd31JHg>
 <xmx:rt19X6sCNqWXLdBkrsBl0IEDIoTN-k8-ldFTt74UhJTOvBDQGtXJ_A>
Received: from localhost (mobile-166-172-120-67.mycingular.net
 [166.172.120.67])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0D4B3280059;
 Wed,  7 Oct 2020 11:24:29 -0400 (EDT)
Date: Wed, 7 Oct 2020 10:24:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nguyen Chanh <nguyenchanh2201@gmail.com>
Subject: Re: [c++] [hwmon] std::ifstream read file with timeout so long
Message-ID: <20201007152428.GJ6152@heinlein>
References: <CAPGDkaHzu5UOES-irDLtu9jwLULyX9_BWAX7rgTPiaeXOT2ByA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3r2sERxeG5twY2zu"
Content-Disposition: inline
In-Reply-To: <CAPGDkaHzu5UOES-irDLtu9jwLULyX9_BWAX7rgTPiaeXOT2ByA@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3r2sERxeG5twY2zu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 10:42:18PM +0700, Nguyen Chanh wrote:
> In https://github.com/openbmc/phosphor-hwmon =3D> hwmonio.cpp , I saw we =
use
> the std::ifstream to open and read a device sensor.
>=20
> But, I met an issue with it. In case the sensor was disabled (Ex: the Fan
> was unplugged), the std::ifstream read will take a long time . The timeout
> in there is so long. It makes my system have a BIG delay in each checking
> sensor.
>=20
> Other observation : In case the sensor device is ready, the time for sens=
or
> reading is expected.
>=20
> Measuring std::ifstream reading:
>=20
> In case unplugged sensor: 91385 microseconds
> In case plugged sensor. : 507 microseconds

Do you know which device driver it is interacting with?  This sounds
like an issue with the underlying driver.  Perhaps it is attempting
too many retries.

>=20
> The patch to measure the std::ifstream reading, please see attachment !
>=20
> Unexpected behavior you saw
>=20
> The timeout in there is so long
>=20
> Expected behavior
>=20
> Do we have any better solution in this case? take less more timeout.
> [image: Screen Shot 2020-10-03 at 11.32.36 AM.png]
> --=20
> *Nguyen Minh Chanh *
> *Embedded Software Engineer *



--=20
Patrick Williams

--3r2sERxeG5twY2zu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl993aoACgkQqwNHzC0A
wRlPVg/+PMzLzKqhSZeJ1LYChuD/zMqBMj0ffkzlLhXmKscVIXZHQNHopbxZoqev
uBd4qp/ZDZ3Xk4nWOucewS8h9P5LfbLseBTiQzcQgArJKTZ3C2INVE1cFZ0P6oI5
x/QmAKzPcQGi/A19kW0enIn+fuaxldEVKfgGL+1dnNr8p1dyTqjsu2ZuZke5CgcU
yPOxVu/nJGv1KHBVG4BqQDdGRWFBu+82mvWFJLyl4Vg/ZXlHZiMz06HchVJ4RJVJ
xmgHuCnIigMR5uJXnVN8ug130JYrj7fx1KYescVhSO+TN05mzjfJsmMT38EUYz6w
s/v85xjCDMZ6vJQXVfiehIGs+Ex8X2nDJPV6Uewp916aa6uTxpPv3UwgdXdvlzN5
oHHo6x2NbUsd71pLNVBm/Hmc/mctbJ3UuGqLe0o4+uULpMiope3nDaEhZVEI2qQ8
WBsf3RFSFmuMUlMawR7cjIrgSv3au8B4n62uvEOXYtCpUQEFXlzKD7NGPpjAFPbB
RnYQ9KCen0QJPdFcOHHrwZCgJxKn4M/ezd6rB7IX1Vb3oyxvKrooV6+59rRmNDGg
7R+0fDnQxJwX4jtPjHp1b73A9IxmpR3k2OC+FOx6OIcM+QQ6bFqRYptuIct+b9nZ
8MoCHFI+QMbXIDt6HGfiBG6IwL23ZVY4pmn9MVIkiwAk7lLlTT4=
=4Jg2
-----END PGP SIGNATURE-----

--3r2sERxeG5twY2zu--
