Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EB6EE213
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 14:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5MCQ6PYrz3cfB
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 22:44:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=TreMTERY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kaIdAfNg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=TreMTERY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kaIdAfNg;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5MBm5KFKz2ylk
	for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2023 22:44:14 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 528D75C01A3;
	Tue, 25 Apr 2023 08:44:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 25 Apr 2023 08:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682426651; x=1682513051; bh=rW
	l2oyL70NeJSeDWdvpEB+ZG1StPbZA2O+tz+i1qtW0=; b=TreMTERYwooPVr/E+t
	48Odss7jhcm/qMIYGRJ0XCSuZkvHogJOhV++yQQkmh1jCt4M/ASpM7Mk+IqK9182
	LV0uHW1x149mLNI+76+lyIEJvyzFBQMPK6wxhQNsXIrqVqs2vb//Nfor9mKrqD0u
	uj3Nk2ip9fP2cSVQt+rM+URF4MQSHw386P6KGzUJyjgiT7sMmpRLuyJyQDlVGEZr
	LziDxoBFUe3xPoBDHqjM27M63hwAsGMt62yWFElqXGQux/CgxLx96bc+bTc1VYKU
	QkM/24bV31DAfrrP/1kIuubXPeLU5GQfY3bYB+G7CTEFBlcQnLD8BMYoWAFe9A+S
	/BEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682426651; x=1682513051; bh=rWl2oyL70NeJS
	eDWdvpEB+ZG1StPbZA2O+tz+i1qtW0=; b=kaIdAfNgqOZbYHd5dlZRCZNbINIUh
	yp1HkeL6Er5WKFaQMVMT4uVWC7F+9hnzfPKloJPdRvavsxQjMTelggUf1NVFOKht
	jJ1/tL+MkF6tasZkoEWlOaHgpiJPjQFW7SB22cNwT2Uoi9C4Ja8BUANKWohcINQq
	2yC5qKBaI9u5R8PfPZIfNmH9ExPTffTMNBAxHIxYgby1ZRszoX/qFohD15Lb53HJ
	sdaPyeKeT/KI39/4f2nWnL8uwpd6nuVLT55n71wZLgAOJujKvG8HW30SwfPIg3zv
	SdA4HuOYQoo7FUcQ6v3z/wCM6nfoBDfKtnLTxcS4G9oyECJ6LqFG/f//A==
X-ME-Sender: <xms:GstHZN1q61kkWfTm967WtDkVksrqAVKnnmpRtPYHP7Z2vL9glTiyIw>
    <xme:GstHZEEq8TyouYqomsDz1haP2fIxF2H3HWwSlb4rfPTpiGESSlY7hv6NthX5b1fOb
    bzWbuqHkYYAkZQT6bM>
X-ME-Received: <xmr:GstHZN678eerNdIQQlZLgOWlRvlu88OCiHujCGqitTXDQ22jMZw6mrypcwaJoY44fBAtyXAMo2ZP0tXkMsaaYEtCE6bpG665z-8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeetteeigfefgeetffdtteeuledt
    udevgeelgeekvdekgedukedufefhhfettddutdenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:GstHZK3dQeqUEodx452bKsFrF9qpiX2GxKqi0-W28TGV4tqgXpxMXw>
    <xmx:GstHZAGV9Ij5ioOOGJNr2BGFh6fsCYBsj1_k_90Rg3yn4m_lTJUknA>
    <xmx:GstHZL_z1MmwgDDg0fU-VZ4bHoMQvHrm5V-e4N93nRphM6mrHirh6g>
    <xmx:G8tHZMjEe07zqFOrBnIkNEPemrbbf6d4pFdOVWi40psCZP4TRsbefQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 08:44:10 -0400 (EDT)
Date: Tue, 25 Apr 2023 07:44:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sandeep Kumar <sandeep.pkumar@tcs.com>
Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Message-ID: <ZEfLGN2-vVIwILuK@heinlein.vulture-banana.ts.net>
References: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <8e23c99e-0e62-3866-ce61-c75a14453a37@kaod.org>
 <MA1PR01MB4129EB6FA57EA28AA9002E9C879B9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <2231ac88-3005-0fb4-6aad-e7652ffd3467@kaod.org>
 <MA1PR01MB41297891E40E6E5652661662879D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <9c136acf-ea18-130b-41bb-5001b01ee8cf@kaod.org>
 <MA1PR01MB4129E3F1719B297B56DC148A87629@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB41294AC02644C3CB98E6F84187639@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB41299E9B9A723B06576C522787649@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+8NN2AFZkiHUNPR5"
Content-Disposition: inline
In-Reply-To: <MA1PR01MB41299E9B9A723B06576C522787649@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
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
Cc: Ninad Palsule <ninad@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <jms@jms.id.au>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--+8NN2AFZkiHUNPR5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 03:40:52AM +0000, Sandeep Kumar wrote:
>=20
> Would appreciate any help on my earlier query(i.e., generating obmc-phosp=
hor-image.rootfs.wic.qcow2 image).
> How to build this image =3D>  obmc-phosphor-image.rootfs.wic.qcow2 ? In o=
penBmc build directory we don=E2=80=99t get this image built.
>=20
> Also, remaining image formats used while running on qemu are available in=
 the build directory. i.e fitImage-linux.bin, aspeed-bmc-ibm-rainier.dtb an=
d obmc-phosphor-initramfs.rootfs.cpio.xz .
>=20
> Please advise if we have to build openbmc stack in a different way than t=
he standard procedure. We follow the below steps for build,
> 1. . setup Romulus
> 2. bitbake obmc-phosphor-image

I don't understand what you're building and why you're looking for a WIC
image.  You said you were building Romulus, which doesn't use WIC, but
then you referenced a Rainier DTB.

WIC is used for eMMC devices.  MTD is used for SPI-NOR devices.  Romulus
is a SPI-NOR machine.

--=20
Patrick Williams

--+8NN2AFZkiHUNPR5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRHyxcACgkQqwNHzC0A
wRk7TRAAiJ/v9NRn8HLYEu6VmX/sVFA5yi8G9vmIEyy9V2Ang8zfsKsJXkNXqMYw
2dtBMDA0b65SPpnFKIa9sZH7bOYGYnDRMgPSovJW0bYkMM7K3I30xiCdotHXQB6v
lepF/zD+7yqUrCSjkMVVbzWw22uQrX1b8Y3qTZsFUe9B+Hr/S7odNjW6/mA7K1HU
Wsb+wcZq1m+g1K7jiEZ4WwyPxfYiqUqitRORfiDIHsGMibgarCGl3aDkYloYteHT
8F7bTNFb75eavaX1b1FkPiaMwCdD+2EqV4bqzaT/0AXTn0wJe/GNNXXBGuSdVOef
tYR847Y8RACFuqrwZnxXP3qtxUF9JY90XTnmzZG9FTkF0AjPv4h8/rg15XU+pHAB
konpGv0aDhWMPP97FF5qkpRSAyJqjUTCXe/5dKUN3gV0iSRollQV9ijhyFD7UM4k
o5eKatXRBrgIqo2+YQbOoMwcCkaPUO5eLpezcQdTLYgdeAWfU2BQtsCVMDwSRp+l
ZEBx0q79vDa2g/3kzKBrWHla5Vjqrfu7FAvq5dTj6ztxqpiarK9gNjFreR5rzJUE
H1Hj45YizW84R16hcEq94fFk3BYW5JitG8NLMLrZowjVwc1IDKidmaKUooUgec2P
S/3IZeXQhso462n/gq92NLhviWctSTdBuIr2Ne2T3uWrqp4wC1g=
=CQ/Y
-----END PGP SIGNATURE-----

--+8NN2AFZkiHUNPR5--
