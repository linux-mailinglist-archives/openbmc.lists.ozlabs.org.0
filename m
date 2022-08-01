Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5500E5871BF
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 21:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxTHx09dXz30Lb
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 05:50:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=V3kHXqkf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=f2Maep85;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=V3kHXqkf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=f2Maep85;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxTHP73v8z2xJ1
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 05:50:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EB7D15C01AB;
	Mon,  1 Aug 2022 15:50:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 01 Aug 2022 15:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1659383404; x=1659469804; bh=hzTypHJ8gC
	GGwoncGdZauugWheV4tg/iJsN/POVycdI=; b=V3kHXqkf/iU/BJqK3QYExXNdOb
	EpXC0KMgohPmXh4wOV7JMbiXJZO7n8ulfLA0XYy4zK6dis16zILDtYS7y08EnDgU
	Aj3EFW3bMoKW8zYqEOfW6/2I07HQJzmpysQqHuHG5fApsOdqUiXPuIIh/a/3Q3cf
	suZKztosdaZ/NNVFBAsYdr2kqrxG0XsNbgL/zkPlUKCOIMTwWLHPyiekeQg4PoJQ
	OZSx0y2D+Ik+SGXm81gBTpHCX9eZcNeofieACqstRUOVSqzR36rGeD3Lr8+tiGRa
	+BeKQwglGe3pAxUSeBVDea1jUZGpF93eeRpv1ovHQkXcerJ3DIimjL+2oVpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659383404; x=1659469804; bh=hzTypHJ8gCGGwoncGdZauugWheV4
	tg/iJsN/POVycdI=; b=f2Maep85ZXJzJffAnyaBUgi63ZjTZsPHQ6uv2qAYYK//
	Tvs6Z2YIYrJuTN0JCSpJWgHf0+K6Afk200jEjMw+Pdz1PDWl1H95Q2gNmizmZclI
	c1AZTTR2nrIVsO+q53InNGG4j43lwgVTiSKqhFWVfM9y9TCEZ4tHqZ5c6Mg6LGl5
	DjEXA+2MFRX3tnPqjXHYl94uaFQMOx2R8IJHk8Baxko4jxcfpSvaTjX0YOKEcUZL
	NHngrSrWAs3Cpmo5+gaOcA/m2512ck9zrCTGq9Dm90gK9Upw8/WTEQhAVmH/4i3Y
	59Gpx3KgrV+QP2SZWB7YqNRdzdVW4zN9gZE0Mxx3zQ==
X-ME-Sender: <xms:bC7oYsu7mg5ZwD9_AfYY0v39K9T0L2mzvXFTff6xbxisrLKKBVzObQ>
    <xme:bC7oYpdztK3hf2E1IfcwE_MnAusevOvHD4udry0u0ERyvyGGBorGJvgqYwZ_0htqM
    VC7lg3QRbcgCWh3Jj4>
X-ME-Received: <xmr:bC7oYnw5Q45WuRIVCmyF5458L-v2gOgrCz5Yb9L1JgX_wHteO6Froe7vt9O5_q1aoFDzPylfrnZAwaHze4HsaEX_dcNcI403>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeekvddvtdelleejvddttdeh
    leetudduhefhudejffeijeelheduvedvhfeuheehnecuffhomhgrihhnpeihohgtthhoph
    hrohhjvggtthdrohhrghdpohhpvghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighi
    ii
X-ME-Proxy: <xmx:bC7oYvNNeMNtXGkY2xEad8SLHVinMJ3d_lQeBVETZqiSjnRExDT_pA>
    <xmx:bC7oYs9GiSKn7ipLh1SooyFap7-w77_aspNTyObcAtLgAJ_FHJ9nwA>
    <xmx:bC7oYnW8y1MT3Tw7NqGWZT52r1G-vh9wQtNSizSKd5YibRBr_7lQGg>
    <xmx:bC7oYrZb4ST4MUP7aZADbLbb8w90zx6MctODWvOU6GdeIXqn3t1Fcg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 15:50:04 -0400 (EDT)
Date: Mon, 1 Aug 2022 14:50:03 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: Request to add Yocto meta-arm to OpenBMC
Message-ID: <YuguawbhVP+y4jAv@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CADKL2t6YYHWfw_4jt5Z+QbEV+x+bZeVB7OnQh7cceRh=VvFEPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cJ/BGcm7NQ/uebO8"
Content-Disposition: inline
In-Reply-To: <CADKL2t6YYHWfw_4jt5Z+QbEV+x+bZeVB7OnQh7cceRh=VvFEPA@mail.gmail.com>
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
Cc: timlee660101@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>, peter@pjd.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cJ/BGcm7NQ/uebO8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2022 at 10:37:20AM -0700, Benjamin Fair wrote:
> In order to support ARMv8 SoCs, we will need recipes from the meta-arm
> layer in Yocto[0] such as OP-TEE[1] and ARM Trusted Firmware[2]. Can
> this layer be added as a subtree to openbmc/openbmc?
>=20
> [0] https://git.yoctoproject.org/meta-arm/tree/meta-arm
> [1] https://gerrit.openbmc.org/c/openbmc/openbmc/+/55235
> [2] https://gerrit.openbmc.org/c/openbmc/openbmc/+/55234

Seems to me like it is reasonably well-maintained, so we should be able
to pull it in.

Brad, I don't recall the magic to do this and don't see it documented.
Can you start the steps to get it done?

--=20
Patrick Williams

--cJ/BGcm7NQ/uebO8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLoLmkACgkQqwNHzC0A
wRninQ//ccCv6dsjjlDJij1i4lwiXcPV0+8oRdltoyFa0Gsd+u2fdPcU79KWX8as
1F2/AuNa8oL2JD4qwhHn/oO75oy9JjtNigvI9ZV57lCaIP9m5ETp+oRJo3K7R6Se
vAlXl7yTOVgVUlM9lgsFmQ50bEdbtHYvhY3KEYfHD/EIlb5KtCz8U8A6e/FUHklX
Qa3PXoBfoJHg0F3m8BfUSwS0taVBYzFQ6ZLr4QJLMF9+yOqpzSK7ZMEDZr9B0gqR
pCFsfqO0QCdoE0dmYjBmgtW0ragjoJgp7nCfWYeaSfeL/KyIe4LdaLrrVqnyCPP6
SdC2ENlSGIzFQEueoj4dBnBQLmlR73CcAH33GwwedFCLTkKprivPyANKrls2ahXH
sC0P86pZ3eqwfNiOwUDnGNpJumyhiTDYYr7UiKC+VxiPA8B5Ro7pfEL8ru1KqBO+
4SkOO27SULq8Oivpo/8RA2R0LnVviai7UyEcbDgGwxHSh0jrGWtCiHXlEW+YPe9z
I8ok4YbYLoiNVxwbPZgh6brcl5lSyk7k1W0AZT1gRUKvJoQB1rALwhPBUlwQJuNq
598IGOXAAS3iEWOgTyEl5eSVmKlUg9D5lozg0VXp+3L5waobSpsWiSr+TvfDnUNb
InNZ55cisUkKuka2i8ShEREsMfEIpDyaUfUd6gWglB3Ra/jeeQc=
=mRya
-----END PGP SIGNATURE-----

--cJ/BGcm7NQ/uebO8--
