Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814847E30AA
	for <lists+openbmc@lfdr.de>; Tue,  7 Nov 2023 00:07:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=KbxNpx29;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KDncfMID;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPRnn3JhCz3cHH
	for <lists+openbmc@lfdr.de>; Tue,  7 Nov 2023 10:07:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=KbxNpx29;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KDncfMID;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPRn6671kz2yVN
	for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2023 10:06:49 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 36CC932009A8;
	Mon,  6 Nov 2023 18:06:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 06 Nov 2023 18:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1699312004; x=1699398404; bh=Sy
	ozeJ+KyEm808VrItdr6Nc4O0bS+Po1444eqqeoC10=; b=KbxNpx29wua3lkTyFa
	wKeo+S2aV1frr+rGsGMYFequohsXy5ddz6MWhlZJlg3fHBcDf46/WVV4V0yB+2UA
	6d+41rnQcmjKsM7e0hKIvALGQVUHpKBo4jDRBh+MpPYOnK5Im70NlkUziXHqTnI4
	gg4L2ithW8hgae1DtduscG1xP7BD6OYqmgVewNkduMhnnpTKL5GYhh4tvPUimi6F
	+EZjxDmc2O9EDvB+tFF9cREozMC8IoYuObWI3LdL4T6gd6qiC5MyjFWnC3hJ3+L7
	KqAxSdlFv933YicDcH5y1m4xeu6dUhF02E2t8rcGoLmM8eCcBSW+6yNYvCW7xY/4
	16+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1699312004; x=1699398404; bh=SyozeJ+KyEm80
	8VrItdr6Nc4O0bS+Po1444eqqeoC10=; b=KDncfMID2r7nzlO3afVfbZA1Syaac
	08UohU4M+8s4UR/grApOKihTkbdtljyLdH7hsfxH9lAXBXRWnqVEZPhrJ5s26P9F
	DHSXUv9pXGvCSac9EAfhoAhtWEQ9h5NX4szHMhWUEvAJWaDLiHYCQfMsdglvjm5q
	PDF16Tdd+TO0f5BetTLJu7igbv2NrsDVVh3CCup9i9DjNRCcuHsp5RII4VnZaO9r
	qFm3DF/r4IIRKxKrWfI/+BolKAsX3sRzxX0tP+nJs9yMp/RW8vEYK9PXCX1FTcR1
	fXMa5CeCqeCZpMNCdnm8OsLOdRR2xmYI24gs7+8PA9RpfUF2zZkGqkbpg==
X-ME-Sender: <xms:hHFJZYmK0eMjvTjhpqYYpUt6X9BAXx9ewqe0_Z0lsjx66583fS2mxg>
    <xme:hHFJZX0u8Q6thUc5eTNJQjbfpghDwG3QkkvFY5RPQLIQ87ifj9cPDIoghJ648Lbhe
    8l7WM8AuvX50pGsMJk>
X-ME-Received: <xmr:hHFJZWpxEUUhquYnK6T8IFNNaakMZReWL0DC8_2d2c6ExZAfzYD8A6IutSriaieSm1zO9h7ten8KiFKcoITGo6_PoMVlWTUbUgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduhedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludejmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpedtgeevueeikeffudfguddvkefhudeihefggeejffevieejfffhhfeileekgfffkeen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggtthdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
    rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:hHFJZUny7dIegL4DgkXJksoGs5w2gJg9pr32NY6M3ihlqRTKrjMV8Q>
    <xmx:hHFJZW2DjXz1y5_L2f8K_IJLjy5jhT4Fi70EBhWepn7ymWjyrXTSSg>
    <xmx:hHFJZbt_t1tmdm20P89eO34E-I6f7cefgyuT2UoxDqgITEeZetkPBA>
    <xmx:hHFJZUCxamGBGql_tQqcNYevIdSxfSuhCkC_hzhKvbtEXdsA76yTEg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Nov 2023 18:06:43 -0500 (EST)
Date: Mon, 6 Nov 2023 17:06:42 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Marco.Cardellini@microchip.com
Subject: Re: FW: OpenBMC support for SAM9X75 - follow up
Message-ID: <ZUlxgh-hMJXl_LMe@heinlein.vulture-banana.ts.net>
References: <SJ0PR11MB5056283972C71AD9B030327F98DDA@SJ0PR11MB5056.namprd11.prod.outlook.com>
 <DM4PR11MB54700AF4648C4A892E0DE879EEDDA@DM4PR11MB5470.namprd11.prod.outlook.com>
 <IA1PR11MB7918002DB77F28F1D584A232ECDDA@IA1PR11MB7918.namprd11.prod.outlook.com>
 <DM4PR11MB54704F112382D43BDFC2F898EEDCA@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB5062973F2689347ACBB44B369EA0A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <DM4PR11MB547038DD545F8C702FA6011BEEA7A@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB50623E55C582689F9A7336199EA6A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <DM4PR11MB5470969CC94F9A219F5DFF9DEEA5A@DM4PR11MB5470.namprd11.prod.outlook.com>
 <PH0PR11MB50621C4604EFE68563B3E8069EA5A@PH0PR11MB5062.namprd11.prod.outlook.com>
 <PH0PR11MB5062741391DA033DA8BB240F9EA5A@PH0PR11MB5062.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f8pIm3TWEWj2gjYa"
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5062741391DA033DA8BB240F9EA5A@PH0PR11MB5062.namprd11.prod.outlook.com>
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
Cc: Hakim.Cherif@microchip.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--f8pIm3TWEWj2gjYa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2023 at 08:37:55AM +0000, Marco.Cardellini@microchip.com wr=
ote:
> Hi Patrick, Andrew
>=20
> Many thanks for your feed back but we are not sure to understand your ans=
wer.
> .
> Does it mean openBMC team will keep updating their code based on any yoct=
o release?

OpenBMC only does development against the Yocto master branch.

If you look at our Kirkstone branch you will see it is 3592 commits
behind master and was last touched in April 2022.  That means it is
missing 1.5 years worth of BMC code development.

https://github.com/openbmc/openbmc/tree/kirkstone/meta-phosphor

>=20
> Checked the wiki, kirkstone is the latest LTS version of yocto. https://w=
iki.yoctoproject.org/wiki/Releases

LTS releases mean very little for OpenBMC.  Most OpenBMC uses take a
"live at HEAD" approach (or something very near to it).  We do not
maintain past releases and we certainly do not add new code to them.

>=20
> Did openBMC team mean if we want to put our meta (meta-atmel) to openBMC =
github, we have to follow every version from yocto release?

There are two approaches:

1. You add the bare minimum of meta-atmel recipes to support your SOC
into our tree (this was Andrew G.'s suggestion).  We need to understand
what these recipes are.  You will probably end up with a similar set as
what is currently in meta-nuvoton.

2. You ensure your own meta-atmel is a well-maintained Yocto meta layer
(by ensuring it always works against Yocto's master release as well) and
then we can add it into our subtree import tool.  This is how we keep
meta-arm, meta-raspberrypi, meta-openembedded, etc. updated.

> Is there any quick way if we integrate our meta to kirkstone branch?

No.  And even if we did, it would provide no value since our Kirkstone
branch is using relatively ancient code.

--=20
Patrick Williams

--f8pIm3TWEWj2gjYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmVJcYAACgkQqwNHzC0A
wRmH9BAAkIFsfW9utYIXhfg72uWNWZ8frQae1jqq6ZFf6+LhgIrm6CbX+o8ZGBMm
XhBtQWC1K0N3IguvmjGjSqtVCjEt5EzzXbylU4xtbypk4h9q5A5BSqiqZYrnAhW/
D3XTCN4m1aClWk7PNjvhbsptfOFT8XA5+ZdFb3oTpOVqOIKHc+DDW0yNab407JTB
GjiNe956ORQ9w2HFarfF1Bmg7fhCVQLeW8ZjdFCmB0OkomjNKphWqo/P1Y8R+dvO
5UgxbM1TzA+d+8jlEsxODDdaFo5hS91TswnZMsD3FSt61V6wwd/AMnZN0Xa/IrKu
l1nPdi6jqNftq3MLS7ss39BOQ1GyQuBkXaIIngrd/7lhhDBhWfStEzqngaAaBsPp
FnnMRsGniTCT8bwNs4tM2V1sBi6j38IzCSIwai0H1A0dl4vVdWJQPqq/C2PVErAX
O8AZsFbkSfMTvuXeXYiHIIxpHyS3PrkB/U9Hv5VxoSpGOSv0D6Ogfu13YhPvzK43
0/ovFrl0tVpBPEjSYYIOoLgR6OgZMeAut8PfIcu8l057affpgrPKT68KrZrJs4fK
BlJ+Ux3eDgscqF2ILxlZRKgPiIk2LCxPUI6t8bObbq+W2xwFZH/h32YBHwiK8R8U
Gx2LJZX6sFcLdRAxjzj07AQxQ/dsHyztGX+pjadvwD9tEWwncn4=
=5DaN
-----END PGP SIGNATURE-----

--f8pIm3TWEWj2gjYa--
