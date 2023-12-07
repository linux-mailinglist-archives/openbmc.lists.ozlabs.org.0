Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD375807F80
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 05:18:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=IVWT+MYr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gQ3eOqmr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm1Gv2ds8z2ydN
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 15:18:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=IVWT+MYr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gQ3eOqmr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm1GL4D5kz2yG9
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 15:18:02 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AF7B05C0227;
	Wed,  6 Dec 2023 23:18:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 06 Dec 2023 23:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701922680; x=1702009080; bh=tz
	AMRSdJRDyI7757cQC8eQRpjI82DQVnr8QpIuCLT7g=; b=IVWT+MYrTpKDF8PDBN
	x3p9nfr2eaqvWkA6wdR6WHHM+OiHaNGNYh2byY8LJ4BtPfl5UjWS44m1DpClDZ66
	H6RWpLya2Pxf0e17yptqRarw6ek7uMkgblCwiSgxgBB1MsLFb3SJKmeq38xqQGTk
	PmzAQoerWqNDFq0xMcT/mssX45ylPKeegQEMYADWCiINIozQay9ETYyjaS++AVFl
	c+phtRpItmH912oRtTWV8Gc6Tnnq9/C60Nkvo4MaqSl5JftctE3I/2GMcRHd95Fy
	dIltxRDTJBe3JuzZYLk9fwFzzoJbQ791su9F9ZyuKDcx6Qf0iBfkjKW69IxqVSU8
	Ptag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701922680; x=1702009080; bh=tzAMRSdJRDyI7
	757cQC8eQRpjI82DQVnr8QpIuCLT7g=; b=gQ3eOqmr1DFzHEie8cermidMsbALy
	ZncDvfTCvGH7krEilVYJjr6S3G4/OJfzXHCp8jul8Yzci4ZphrJ+rCfu6CtJUOG0
	l6oXR1Nhj0ze2xl3WnLbw6hyIU0q6Zohx4WS6CWe2SZAdBvIM193RbqTWKhzuPkG
	Fd04GCG0yZkYGFLVk82A987o3rt/fl3+uza5jKR7ir7nwbnB6U+d13kxXdYXttb5
	kEexrNU8HpfO1igeDBvo1m1zPo0BKYZjIx3nbNtqgEvXldO+PRvwAMXd2rJiK8e1
	64xprHkhAosSFNKzViJ+IbFpHhvC2fkrHVlHqou63sDE7B5i+DwtGjuxQ==
X-ME-Sender: <xms:eEdxZeLCAKQC82r8ZG1FJ73gDdT30ckxtKELjfsGmVkvqmdtNiruzA>
    <xme:eEdxZWIiuG-Dvt6sGdDlPjFboJN9WqOBqgXRM0Bqo7hqfPXNVhDmEkOgjZQWOWcSn
    ogddrScKSFrolCRGN4>
X-ME-Received: <xmr:eEdxZesHA6b5z6knWnmMT-LW-XGUaarEKwuv7j6WRzNli6O1ioCK69T58e5o8ziVgGjKCoAGIlHo70nKjgESkBCIB5TR-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekuddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefghfeiveeuueefvdffieehteeg
    iefhfefgjedtgeeugefhlefhhfdujeeugfdtheenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:eEdxZTbt7sOIdtWBhAeLYPFWenW-wuGy5mUBSFR2FRFpFka9O4jD3g>
    <xmx:eEdxZVZI5dOniSiVaeavf6yCXl59T9hZDNt5sOqn4_HTzO4Ea1wO0A>
    <xmx:eEdxZfCsy_u63qtA3c3q2nqj-D9QKw-k8CfvtYUPt9cla6GIoPpETg>
    <xmx:eEdxZUnKtFOWaTFqfdbSGd26GfDMssOTL27i0BA2x7XOWm_ASNjHew>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Dec 2023 23:18:00 -0500 (EST)
Date: Wed, 6 Dec 2023 22:17:58 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: Re: [PATCH dev-5.6 3/3] net/ncsi: Add NC-SI 1.2 Get MC MAC Address
 command
Message-ID: <ZXFHdtNDvBshKQap@heinlein.vulture-banana.ts.net>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
 <20231205234843.4013767-3-patrick@stwcx.xyz>
 <6abc879a2c29cc8b8044c5c483bff5a01750695b.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ef4hkHwei1Ye8UGY"
Content-Disposition: inline
In-Reply-To: <6abc879a2c29cc8b8044c5c483bff5a01750695b.camel@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Peter Delevoryas <peter@pjd.dev>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ef4hkHwei1Ye8UGY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 12:23:38AM +0300, Ivan Mikhaylov wrote:
>=20
>=20
> Patrick, I've the fix about ndo_set_mac_address not so long in the past
> https://lore.kernel.org/all/20230828101151.684010399@linuxfoundation.org/
>=20
> ndo_set_mac_address do not notify network layer about mac change.

Hello Ivan,

I think you're suggesting there is a bug in the code that was applied to
net-next here?  If so, we'll need to get a fix into net-next.  These
commits are just a backport request to the OpenBMC tree of the code that
was already applied to net-next.

--=20
Patrick Williams

--ef4hkHwei1Ye8UGY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmVxR3YACgkQqwNHzC0A
wRkBFQ//XIj04vNMH+n84zJMHdGDPkGzNRH4UtovqLVT2SjVvIobRJrf+tWNLQ29
qF2BH3ikgiy8qw5Dg+Yrp03XdyFmgJUXdgcr99lHKGk+9cHTpatcucj3ygp7W/Qr
V73amardyCXDzqLNO4EYb9m3rGVtFV1WRWBG7mp2xX8r+FqYtkpRfB2y4ULVcryG
7TI3N72D+1MRHHno5q27wacvDdDRTzdmx9FkQTDpXy+O3P8yCIB0BgG2GTXh4AUK
ssJAiptxRBjORxyuYprTFrdAZV4jj6HWlViAuRtB1lVNs537IWR/r33KRJv9ztIX
LRg9UZMI05EyqzZ3hEx7rh9jc4CgZ0PhKIe1ST/DzNsihDZUgj7ns1/LTehqwKwi
fFxhL2KfW163y+YFrmgYcn8mezU6w1dafcHMx5uXc534DG2zSGJgy4McuQq7ybvY
h9RzN/8Kr8d7NoFltmlFQLzS0BfmmzQfEqYWGtlpUvb3KhXD9zRsIjINKbjSo4of
lTgkAZtgeuiGdKIi5zibZrRMCkP6nPFZd9GY3w/dfzV1hKItL78wvxW20mbwDb58
wJisntDCM78vzLlqnAG/+GrzCmXGWI2uV8EgAiUqcMHwmHLLV0FXksNKMvFdU6ib
Ck1iXPPyD6avIOaHcweht0xd0bqXgr1By2kOIw1VGOqY3zq08NY=
=T/JT
-----END PGP SIGNATURE-----

--ef4hkHwei1Ye8UGY--
