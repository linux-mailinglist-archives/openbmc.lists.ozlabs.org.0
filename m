Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E44A52C5
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 00:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnk7f1Chlz3bVd
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 10:01:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=StfSY2NV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iqPrSo+M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=StfSY2NV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=iqPrSo+M; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnk7G6k0dz2xWd
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 10:00:42 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3441F32020BE
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 18:00:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 31 Jan 2022 18:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=4BUsqc5V+YvbkkzSNHwdZsIfGQGQnOkzOjKGWr
 AvsiQ=; b=StfSY2NVVGlZXDiokboWlTha79tZ+L1nL3Ci5KMeKi42qE9c6iB5R3
 o1BRkL2CZBq7WubVyt/9LBJyPGEXm+KFzSg/DipgIpTIgwOcD1E623qRDfxaOnyH
 QLXqYQLnfEZwZRLAJaeYP7e3UhrZstATID+mobNVJfwQEdT+l4/Al4KEnk2je81f
 Thi9kuZYbMiTxnVboVR/GrTMYKPQn4SozDFdy6vwx4gKMEH+ffe8a2G66vHesB80
 EODzZOa3Zfz1CCwDEXt6kBTuACbuLAZTHpTep7K4+NuoaVt62mVQw4nI2wKVrV6u
 SUHzwMravFVXD8sFPLSheafZJ5BuJAlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4BUsqc5V+YvbkkzSN
 HwdZsIfGQGQnOkzOjKGWrAvsiQ=; b=iqPrSo+M4rO244J7+H4ifT21LBtZ+WAgk
 zLXRNSE7XjqtPa6+n3ljnhCxGeF9l3DPR/DCqfoAPln2cEGtxLAQVlklcR7WIt8T
 niRiPcM+BU/0dWvhVQWPZp9rbesac6R2xu6ejW/eCv1JDoeOVLZG/hJwUCfxPJeu
 oCs6vp/MgYGP6CJQlFXH2IyzWUHjuS8VrRs8L/TrHzEU863okbvF9+Sq+6lBTI9b
 ckptZ0dOZycqhRv0QoBYxTcTBZ2SMADMLu40SCK03tNXqYDmtfsMO8H7WdkNc3IK
 R4ZoTW3RXYVA8W5FmqMM9JuzTGeQ+S4XU3wZljRPuSLMrKHstMI4A==
X-ME-Sender: <xms:GGr4YUTz3FApIVSxBqtcqtUhr2oO8jJxGqAsnIMbVXedk3FXn2E7sA>
 <xme:GGr4YRzISHOmIh7No6Q1QHKzXebparz7Besg8Ctft9peCy8LM-iYq0RDhUmNp6_Sp
 AIiwWJxORz6hFhliOs>
X-ME-Received: <xmr:GGr4YR209jJR-BfW_jhAniqLqSV4-8lDOev5K737CBNZx8SwuWUOhhN3kzao_3oVJiZEB-inUK8DxEXIJjFAyNbjnuGPrwqBPZTl6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedvgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 dvffeggfefteeigfethfeiveeuudegvdfggfejfeehudetjeefffetkedtleehhfenucff
 ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:GGr4YYAqfM682guiCQUlq3AfDzC984CXtf0RlXeTiF934OP9XWpQnw>
 <xmx:GGr4YdjcUOOqwSsBWFN_9u7e6V6ivqozifoHjPQ2djCPIiA8NK7yRQ>
 <xmx:GGr4YUq03teLIdnbONz1VwI6oXOnQo6w2rrz-HrbtBoyoZ1gMFjJrw>
 <xmx:GGr4YXdie9BY-3BNy7EDbGmAF7bbO3eVQpJ3cmvxUY6qf3vfNCl2Mg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 18:00:40 -0500 (EST)
Date: Mon, 31 Jan 2022 17:00:39 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Re: [PATCH dev-5.15] mtd: aspeed-smc: improve probe resilience
Message-ID: <YfhqF1MtIgjfhsZh@heinlein>
References: <20220131225904.137769-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lq8yrbfjO9n2YIET"
Content-Disposition: inline
In-Reply-To: <20220131225904.137769-1-patrick@stwcx.xyz>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--lq8yrbfjO9n2YIET
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 04:59:04PM -0600, Patrick Williams wrote:
> The aspeed-smc can have multiple SPI devices attached to it in the
> device tree.  If one of the devices is missing or failing the entire
> probe will fail and all MTD devices under the controller will be
> removed.  On OpenBMC this results in a kernel panic due to missing
> rootfs:
=2E..
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Link: https://lore.kernel.org/linux-mtd/20211229143334.297305-1-patrick@s=
twcx.xyz

This was backported from the mtd-next tree:

https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=3Dm=
td/next&id=3D7f852ec58af6ce8d7c6fc799b82d45d76e4bd994
--=20
Patrick Williams

--lq8yrbfjO9n2YIET
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmH4ahcACgkQqwNHzC0A
wRkq6A//XuBzhkFmgefq1HcJ492Vbc0dSTMqotqtBdbAdEsvKA1ifjKYAWmMJkm+
jsjy4OLJGf4Vg/MlWH6F7mBRnYnCCQmv0JTmKZfswaG0uDz2uaFlf4/BxLap5yt+
DwcHLMRrOR2pWf/usDibEBNdLEbH3vyRzi6wWW99rF3/VEWkbzAoJOe7mTgZC5GH
Cfe3bp10TpyDyiQPUJM9CHPrrmsN50LJ8d3Eh4F+jZhlHLf+INa/JZuZgrKER7/c
eV3tKM/olNRnHJrIsiAjREH4AGfiqaWx721RYNyruMjraXgS/YtFX+O6L7pUjrkk
VAYHjKg/b7MICq5PPOkNWPyYbAkg/a8EGdZf1DfsxssUQbmRT5at/y33b68koNZF
t0Q1TxOXoEUx88pFzAaKTGB+PL8ZmWqYQut0KMjHtgqf28o8aiugdCPe6SEYa9Tf
NPK6wxegNprVHYHQg7prANfvNVL+V3w0U4Vusj3ZXt0AS7iYoBrN3+JejZd085ur
kZOJD0+gNrcm+o0bEpP3DIEW1jcV4TLQd9cqtlP7fPiEOlh4quhczY/UorgPkfw9
mJxjC/FcdyZbaGwd1fg59MdWZg9qgex2qxxwFml5OTCL9Db1kJ7OJgvBDr39pCnL
EFprxcNtXZbtCAbDHrKQTU20vWJ3AqV0/rCLjr28VxgtabaxwqM=
=k2kh
-----END PGP SIGNATURE-----

--lq8yrbfjO9n2YIET--
