Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 346387DE266
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 15:31:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=JB0HmjEL;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MfeDm5o4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL8Zq0m4gz3cWP
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 01:31:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=JB0HmjEL;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MfeDm5o4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL8ZF4xrtz3c4t
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 01:31:01 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CC48C5C00E9;
	Wed,  1 Nov 2023 10:30:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 01 Nov 2023 10:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698849059; x=1698935459; bh=tT
	XVStourMIVqv2y5Tc8Mm9pJw+8zS95HKHAmdN8r9s=; b=JB0HmjEL/Tc0DHryzk
	jgqYHUyQREaY3wldAmvfokWEJMdfXugoNcDnwUl/0cYbQur+E1l/nLiudeYxUcH6
	RPyuu26n2qGd5pSviaKRCHKDZNpkoltjSAtWQiTyqvHLAhY/A/caxS3r7fup+EkN
	4uZiGAxiSE13MP0I3uGL0njLW3P+H5sb+y6AOy07BpOuKczZ9nPidWj3MOnSEknF
	UVUWP4xgHh8zvK4qD209yOyoRRuHLRDnw8hHMFHc4XV06yRW9voxhYAzqtWCVj02
	hjl5I1zENI4DbqHco7mCcgpqArWOW5UB9E4tveS1vwkMgB3Xf3IwYqL1CfwTXs/q
	LnQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698849059; x=1698935459; bh=tTXVStourMIVq
	v2y5Tc8Mm9pJw+8zS95HKHAmdN8r9s=; b=MfeDm5o45OTDAZgdaqK6+HuVNGqMG
	+ujtcP8pVj+0+Y7ISfYYkpLFLimyKfA/5kK9nPzq5+v1kwwjr3WlB2aI79L/H5N0
	du6qFfmw6hvWJ1a4VSc505w9UetQi0U00xoO+SkGiLzJXq/OKkiqWUdyt17XgKkM
	Akut3LA+hgKgGoDknGPeewMdZfnkIiRIQTOgzMju7dDSUm19BSH1JlamoDZ+A19d
	8ew+HjzcKaj5uHA5n6lrE0A04QcxgUeBaD1Ck6pZ6ewKqlznrucJZH4QMQEgO0Lq
	cI7srG27a3CqYQ8mkW76NWJNdVjYsYd95TBPhLovyP5OFMHA89jpJUSqw==
X-ME-Sender: <xms:I2FCZTQjKGmXg3HtlTilceKBnj44ac3WVeSbcZX1zkY318_90KeMGQ>
    <xme:I2FCZUzRnakmnEHYzz4koGorrrSUo-WYXBlzTQ3BYjPzT61Z2x76HRqtojN0CcwKq
    ZkzF0wrPkKWPe9kMok>
X-ME-Received: <xmr:I2FCZY29rNNP12OGL421-6U8it6GDE7gEZtVa_JVy8ra4O0f7NjjGE7eFEkpcIytOkmpwmO-x8jvRcCIrY3C800LFM6GsDVH_HE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejudekieefudefgefgfeefhedv
    vddttdehhfekvdfhgefhueeugeehhfevheffleenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:I2FCZTDPuJvVm2KwZT5it8DEOY850ti-InUqgcs4PNwA8wA9DxBFpg>
    <xmx:I2FCZcgbWTQp1K2Y_GSacKplBaEtQrBeqzBGSpC0B5h6hL4b3WkC5Q>
    <xmx:I2FCZXogLea_Vdh9OWAmqiUKedYzERp5SLGbHtLS3RdRsj2h9l7MqA>
    <xmx:I2FCZYaQyLjMwEpZH1Qx_l5XjvayWoawLey5-vq0SAa0rl4i217a0w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Nov 2023 10:30:59 -0400 (EDT)
Date: Wed, 1 Nov 2023 09:30:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Documentation/Guidance in order to support another hardware
Message-ID: <ZUJhITh0f6o1zuzo@heinlein.vulture-banana.ts.net>
References: <PH0PR11MB564243302F521949E3D0477086A0A@PH0PR11MB5642.namprd11.prod.outlook.com>
 <445D6672-5358-494E-9163-5B4F91148971@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ov4zDW8uof0Z2J1x"
Content-Disposition: inline
In-Reply-To: <445D6672-5358-494E-9163-5B4F91148971@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Hakim.Cherif@microchip.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ov4zDW8uof0Z2J1x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 07:19:50AM -0600, Andrew Geissler wrote:
> > On Oct 31, 2023, at 4:40 AM, <Hakim.Cherif@microchip.com> <Hakim.Cherif=
@microchip.com> wrote:

> >=20
> > To give you more details, we already have our own meta-layer that is me=
ta-atmel :=20
> >=20
> > https://github.com/linux4sam/meta-atmel/tree/kirkstone
>=20
>=20
> I=E2=80=99m not sure what we=E2=80=99d do here. We run some scripts perio=
dically to import other meta layers
> Like meta-openembedded, poky, meta-arm, =E2=80=A6 so in theory we could a=
dd this too but
> It may be better for you to just create what you need directly in openbmc=
 under a new=20
> meta-microchip directory.

Since meta-atmel is using Kirkstone, there is absolutely no way we can
import this into our tree as a sub-tree like we do with meta-OE, etc.
We need to have confidence that the trees we import are going to keep in
line with upstream Yocto releases.

There appears to be a `master` branch in this repo.  But, since the
LAYERSERIES_COMPAT doesn't include "nanbield", I'm not convinced it is
actually aligned with Yocto's master.

--=20
Patrick Williams

--ov4zDW8uof0Z2J1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmVCYSEACgkQqwNHzC0A
wRnAGg/+MOt8oCqxt7goFZg82k2cIiCx3e962shXClMtoFe0kx4/VcjVduuNmgJL
kbaj6Jh6xv3JHnhwuIxogSF+anZV4/LzLCArosiKj8tu6gFhFVkFBnP/CbSPI7oM
GHKBogYfOS6m5jNM8kU4XGmnfvdDPzbQFOfWvwrpMsgf9OS3pOAC4aOq37SukbU0
ozG5mj3zV7DM8TSKy6Mrg1P4BruFgpbJEJk30ukZw9ejr4yoYzZoKqFy7XncBiEr
Na9dhqNZUTX1mJ4vUCRWM8UAzLLfAboKIqQB/cCOO0L+Afj9A0VCWhtAmEBK4si5
Nw90sN24dxKa1KEcAQ/uDQXerVJuIB0cIHle5Zu4y1Sc/PHkU7JUoY9xg0KevVqp
uuW4UQhZ3XiEr6F9g8KEruu9+jxK6ldBJzQhDAMKxmY0rd9eeHM6Yfu/JrAyvhSe
oPVDZ/LQPSglT8OwZqa925opH3lOi6xFomfG9NDWeFRwDWMwG+teaWscNjIqFFuF
Ou0IJMgKJGa5Qr2U9lQKFP8pMjFZfZUvmxRgUTwO2Ult5sGZm/PXh3ZJtmCRloZf
qxsQG2icfje+sE1+exROh06Inw3iBQXatnYbec7oDmc0nOymf67KlBhEvOgCX446
xgZ46l4xU/IRIM45AI5fIlEAXqUERA+Mhc/RLrTZLj3+0QQl/8w=
=VZcg
-----END PGP SIGNATURE-----

--ov4zDW8uof0Z2J1x--
