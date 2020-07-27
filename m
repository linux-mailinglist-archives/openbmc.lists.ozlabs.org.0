Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333F22F32C
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 16:58:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFjbw2FB7zF0YY
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 00:58:20 +1000 (AEST)
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
 header.s=fm2 header.b=Y3ANwajY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=A8vzOrth; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFjZD680XzDsTG
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 00:56:52 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 567FF5C00D9;
 Mon, 27 Jul 2020 10:56:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 27 Jul 2020 10:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=VbD7QsNERtKnKIA8R4NckKeKsp8
 O/+tdqNlPVsu5XBI=; b=Y3ANwajY0PssFnXk9eMZ27sr1ebvb2K88yoTf2srAA5
 OXZimrIx2oSGjabukh3TE7Db2tGBn1NDFbiJAcxxS0vHaB/iNHELVgEJ9S3R1v2g
 /pR30oeEfBDdX1UhoCmUTypQNDAN8AJY4cLUVtwSIIrIq4NT55nLE0qXxG/SruAT
 5hn8ZTHZ9dGAga/Cizgn8mZ+iv6LvJGNjNwXJ18h7H2zv77GEIc3CGnhBLzEDyhl
 8iOru5ugNQOOL64VPtNx+hRsBCFOA63zvqa/eruVwDNRFJn4F8vjqJbNybe7J9Gl
 FTD4HFCgJuMccS7Z0VruGg57+mT1z/t61/yzhZAuIYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VbD7Qs
 NERtKnKIA8R4NckKeKsp8O/+tdqNlPVsu5XBI=; b=A8vzOrthUv1fszAWfcUt/N
 +LGdbAHDgp/yqPxg+0g3qyZn9Q/KgsEit+aRH1svh4KFrpZs8IIXh1B7AnbAKTCP
 x+glfk+YdAdxml6lacv3EHOeEJ3XglEZpVuY7NCe2IEFzinB7z8nZlW337eEOkKs
 ELjxHHs+581LCrwJNCIMigZl9C3AJiwcpJUN/n9/hCMgkIGj0uQ16uFsybYBD0b7
 7ATwKWKogWzDPB4fIyIrGABceb63292eLxGgVvkMUISvDXuZnNPAgVXg3WgT3VJU
 C/GSmbSBwCSxNyT0DihQv2ylm48hQP6ilophuhATinGk3x3FVY+aZGbgbkj8cKTg
 ==
X-ME-Sender: <xms:MeseX_mfOTQR_542eCJ0Wg5ABvDEfoPAzDU9XL-BWGwVvFfo3peycg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvfeelkedtleejhfeitdduhfeviedu
 jeelheektefgieefiedtjeegvdeggfffffenucffohhmrghinhepohiilhgrsghsrdhorh
 hgnecukfhppeduieeirddujedvrdduvddurdduudeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:MeseXy3vxLFLeW29eCph-2PN2zCcA1YRwHe4Ok3LFfnO_xzWnPDErg>
 <xmx:MeseX1qcmBqCJHt0akY9ok1Soj76sRPhkCSWMsfRAWNbEepm0d2IUg>
 <xmx:MeseX3naTuPSKOGesjTdJeA-AwBS8BdbdpRrySK6inQcEqX_VPqHZw>
 <xmx:MuseX2zjQikLV-jR4o4XOB2Evfp8rwbrCaX9pUgCvVit5JOXsqBI2w>
Received: from localhost (mobile-166-172-121-118.mycingular.net
 [166.172.121.118])
 by mail.messagingengine.com (Postfix) with ESMTPA id 41BD83280065;
 Mon, 27 Jul 2020 10:56:49 -0400 (EDT)
Date: Mon, 27 Jul 2020 09:56:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
Subject: Re: Fix content rendering issue on RemoteBiosConfiguration doc
Message-ID: <20200727145648.GP3922@heinlein>
References: <CS1PR8401MB11443DA57173714807F29080FF740@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <877be4a0-fac1-1787-c31f-9a670e1cfa7e@linux.vnet.ibm.com>
 <CS1PR8401MB1144271C5D55D6896ED55982FF750@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <20200727142244.GM3922@heinlein>
 <AT5PR8401MB06262BBAB1DDDAE7B9BE80498F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G+DT6X5ssgZ56VG3"
Content-Disposition: inline
In-Reply-To: <AT5PR8401MB06262BBAB1DDDAE7B9BE80498F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
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
Cc: "Chang, Abner \(HPS SW/FW Technologist\)" <abner.chang@hpe.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--G+DT6X5ssgZ56VG3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 02:41:52PM +0000, Garrett, Mike (HPE Server Firmwar=
e) wrote:
> Thanks Patrick,
>=20
> The CCLA shows the "initial list" of contributors on Schedule A.  What is=
 the mechanism for editing that list and adding names?=20
>=20

Hi Mike,

What appears to be past practice is to have either you or Scott send
just an updated copy of your "Schedule A" to the mailing list.  Brad or
Kurt will then process it by adding it to the Google Drive.

1. https://lists.ozlabs.org/pipermail/openbmc/2019-November/019495.html
2. https://lists.ozlabs.org/pipermail/openbmc/2019-November/019487.html
3. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019885.html

--=20
Patrick Williams

--G+DT6X5ssgZ56VG3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8e6y4ACgkQqwNHzC0A
wRncCA/9HIcSsspjvBXz6GwEsj0iCcdw3Hihn3rugRsmHsKt2WrSPgIupS4RsVDM
VziQj+bV/pYcH0R/x2HFwZfZcHHM6nCxgLOXdPlOSG36sOaHwZTUIyfDHPPt5nh2
dyRA6cRugoiKzijpsXtTTVSul2AMNfhXMi4BD9NaXaTRdiPeRGJ+eACiUHhWZ7kL
GcBW+2h9DmpPqJzllWOIMcRpfJSQB1iq+AYpft8KmkabEJ/SAYh50vCBdJkAl0kA
Ugo0nUrdJtF/LMiDKAY9fC2XhC+1iYsBtna3EZEKc0HtWxoyuEt4XTLd35+puN2z
2PdCWIREcNyZA2zTGFVXsCDOHddnkvt5F7IRKWKA9PISW4Bi9TUbTW4dydSmmaNP
X+Ui5bOiI/y0WmCeMlKJqVF75r0ky51KPfD24d6in5iUToVXha4/RUNXiJFeyF1P
U0flzgB63lSHhIC4qFH3uj61GN52VXmBH+wDRJ1qOEeVyBj8HSifHbFXLap8fFq6
R+zMDgH5aUDwgd3BowF3fS8ZRRICZEGkrubmE3n9upXcLz5w4cn+suhYSJ9Ks4Fj
Yy3WqJVGuPWWCi/xpZWCXm1iy92pKjpxTE6A5YNorcl0nDpZajiCTG7zc6g1nt+Q
wziGcFHm39MMvfNTvVgt8/KBO8bwZtAdQ0FqQ6IzxkM7zqF8Yro=
=arXP
-----END PGP SIGNATURE-----

--G+DT6X5ssgZ56VG3--
