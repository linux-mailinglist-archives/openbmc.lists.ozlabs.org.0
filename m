Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB0C8230CE
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 16:49:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=sL8Ab9HB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l52ne/j2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4vKt3Hczz3cTG
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 02:49:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=sL8Ab9HB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l52ne/j2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4vK70Dvvz30fn;
	Thu,  4 Jan 2024 02:48:57 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 48AF25C01A4;
	Wed,  3 Jan 2024 10:48:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 03 Jan 2024 10:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1704296933; x=1704383333; bh=t2o8Mw2ZMm
	KTwiVDDaiNKiFCvU6VgZlkt0pKLX3ZNLA=; b=sL8Ab9HB78YPzTe3LUmU4OKfIl
	MMNR9BmvHv0bYllciytC6z5SKiToQfV9h0f0fPTaln845B3QMnmo82yV7tPhRGe+
	/YKinkh0xqJLYwdSBjvxI0yqyufCP8V+2diy9OvJ8cSap7i6zqKEEFSHNA3cu1Bv
	+vS6K6SL9zKpYvV2U3X3Ra2isUAsH31VZovzRprKFerZ4RHb5grjKkyMxQnaG+Ez
	Wt5zPqwMD7bHh5XxbLsoCTEtOsJLRnben7ySHe4eWKR+J74UtQrN0b3ATbBULALV
	uqiHUPliCXLPPK9Ei7OEWGE/OuR9BpEadHqc51Si5F+3mGW0N6ILD2CxVA1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704296933; x=1704383333; bh=t2o8Mw2ZMmKTwiVDDaiNKiFCvU6V
	gZlkt0pKLX3ZNLA=; b=l52ne/j2jwEJ+wyF3epS32mmS4KSND06Z5iVkt9NlANy
	WEsbmje+tACmpQcveIPfP9KCSYOXBVexUYfRLksr8Yge39GzsNY5QAB/fjtAKlhz
	cvM3TyfIblSS/rcv6S/eGR2fb7cJKhwcNTaIdHeXfTrB0UrtjK5P6If5q47XFERB
	+6QMvUq4t15JJbyJqcgZtQ5swYAL7pxFdohuQl+LuoOeIiGTc96PZFyGlE8bqyT5
	sF80GDx6kHWcI09F0QK6Jq+aLPvgTRoHbxrgphHbo2Zsu2q9po9Ez20PDnUIsHHV
	hgPnU1UNEYDgSkxP/LNDIAyiAAnJEUTha16qdmxrIg==
X-ME-Sender: <xms:5IGVZa4D5qIOTA9oPZpJHhFvwEj1uHJXRO_zS_3d5_Qyp1HIRMIeYA>
    <xme:5IGVZT4BnJOLSyPRiA_MUSfin2MRG_6pZqsUvANFFEGsGQafsfJFAxIeaSKZO3sCp
    gDbiq659LJhgHT8_gg>
X-ME-Received: <xmr:5IGVZZeTEuOYt9Ma9I8G-lnC1pCxenE_-qLeHJfyafOJchvcrqfODpJaWdVTxZ4bZT4S_a9hdMsbKWmvtc0F_7ahSoBX9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeghedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehiedtudehvddutdejgfdufeeh
    uddukeeltdduvdffteehhffhjeevhfdtjeevfeenucffohhmrghinhepghhithhhuhgsrd
    gtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:5IGVZXLtmaXW6Kbl9BZtINmkmf7KZ3cX65sZUvOVJKoRWeO-u7NUsg>
    <xmx:5IGVZeJJOsveBuJMvOxn-we-qgdlWmDrCqGAW8E5Nv05dy-GqYfffg>
    <xmx:5IGVZYwdcX_jlfgulpN2tILHuCX47lPuGAS3meGfSGYEpk48nrVgIw>
    <xmx:5YGVZbVOrbQkkvwolnPXpr7QzFTLIHgo4RAczsfRMW3g2bUoXwPbLw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jan 2024 10:48:52 -0500 (EST)
Date: Wed, 3 Jan 2024 09:48:51 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 3/6] ARM: dts: aspeed: Common dtsi for Facebook
 AST2600 Network BMCs
Message-ID: <ZZWB4wRiAyDtlLJM@heinlein.vulture-banana.ts.net>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-4-rentao.bupt@gmail.com>
 <20231220081402.GA3831@wunner.de>
 <ZZSmMJ//l972Qbxu@fedora>
 <20240103124502.GB23899@wunner.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="okJL0W4XmHaJ4PYq"
Content-Disposition: inline
In-Reply-To: <20240103124502.GB23899@wunner.de>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, taoren@fb.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Tao Ren <rentao.bupt@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--okJL0W4XmHaJ4PYq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2024 at 01:45:02PM +0100, Lukas Wunner wrote:
> On Tue, Jan 02, 2024 at 04:11:28PM -0800, Tao Ren wrote:
> > On Wed, Dec 20, 2023 at 09:14:02AM +0100, Lukas Wunner wrote:
> > > On Thu, Aug 05, 2021 at 03:28:15PM -0700, rentao.bupt@gmail.com wrote:
> > > > This common descirption is included by all Facebook AST2600 Network=
 BMC
> > > > platforms to minimize duplicated device entries across Facebook Net=
work
> > > > BMC device trees.
> > > [...]
> > > > --- /dev/null
> > > > +++ b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
> > > [...]
> > > > +		tpmdev@0 {
> > > > +			compatible =3D "tcg,tpm_tis-spi";
> > >=20
> > > What's the chip used on this board?  Going forward, the DT schema for=
 TPMs
> > > requires the exact chip name in addition to the generic "tcg,tpm_tis-=
spi".
> >=20
> > Sorry about the late response. It's "infineon,slb9670", and I will
> > submit a patch for fix it soon.
>=20
> Thank you Tao and Patrick for the replies.  I've prepared two commits
> to fix all violations of the TPM schema on this branch:
>=20
>   https://github.com/l1k/linux/commits/tpm-dt3
>=20
> The commits are named:
>=20
>   e95bdbc arm64: dts: Fix TPM schema violations
>   63e5dfd ARM: dts: Fix TPM schema violations

Feel free to add to "63e5dfd (ARM: dts: Fix TPM schema violations)":

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

>=20
> I've now amended the ARM commit to use "infineon,slb9670" for:
>=20
>   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
>   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
>   arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
>=20
> I intend to submit the two commits once the TPM schema is applied
> either to Jarkko's or Rob's tree:
>=20
>   https://lore.kernel.org/all/20231220160422.GA282877-robh@kernel.org/
>=20
> Thanks,
>=20
> Lukas

--=20
Patrick Williams

--okJL0W4XmHaJ4PYq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWVgeEACgkQqwNHzC0A
wRkvTw//T1cnJTGzg/6kFDNyAZuvtL3/7mfpjO8xbDu2rsJTZVsniLO2FOqAZEJ8
m34ZaDfrxU6afTZ/A0vDE0gszHYchlJkalJq7jIonvB7dyJAF0jZ/JXDHvQa8H1B
TqqjjY4lJEir0l+xTlCoGZ1/bRUJGb202H2KYxQebvrV6qOKn39hvz6CMmB2FiXB
7iCGeQzMucKPvb0ZYe+OQvbPHwe+WF/vkjBqKaQzRBKCNF6YCIAAY28gV4QW9clo
OCasLcIZiaUNeWF7S3GFR1y1vU/PGpiELAMvwQ5YaXj8zyDclh0RePR77uwxGUbQ
594CoIdF9NvaTh598DRow1bHBmK6PIC4tqD5or6g29PnR2PW6OPUrmwu8o/4KsAc
tgzJovsaCmnoCv+uKAj3QVcVP5++9Uq54oI4BC8tWNl/y5Pr0yj2H5v+WdfRJYxd
/pE/Zm4O3S9i+a55T7e5Me9GRgf8PHnjPlfNeOtVppxTn4gqkVvLGv6eVXQPh0vf
Ho0K5BBekzdqtK7pES3B9WPvDUQi2XqjzMFzxfsQ+qdt6Ylxb+cIPtfd1Ybpvijl
hwqAOMDZgTFIklmT4hPDSdTPzF3ECwopGoNdjFrDeqy9Y3sHwgL3fRHeWCojwoXy
HtjcjfNjZa9Kgpswis/r80jVGMGHgrNDhnUxcrbts8WpovGX4FI=
=xr0d
-----END PGP SIGNATURE-----

--okJL0W4XmHaJ4PYq--
