Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B3C8C7FB9
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2024 04:00:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=P+ooEucT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MGAlk7RN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgVXt23Qyz30WS
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2024 12:00:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=P+ooEucT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MGAlk7RN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.145; helo=wfout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wfout2-smtp.messagingengine.com (wfout2-smtp.messagingengine.com [64.147.123.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgVXK5DfNz3fwN
	for <openbmc@lists.ozlabs.org>; Fri, 17 May 2024 12:00:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 8422D1C00199;
	Thu, 16 May 2024 21:59:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 16 May 2024 21:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715911198; x=1715997598; bh=5WuVdFa01z
	Txg+wrL41bF9gY63RV6sDmbRv8H//BBSQ=; b=P+ooEucTeHxk0kBiwnxLMdVFd8
	KZM1cAs6nmGu+GcQ4dmnGSwEw65eATu2TfqZ1UuYLIHH/VLTu3xkg+i0kWO1OSz/
	JjbbFt5vl1qvq0uycGQ/Ra+Y8Zzee+c+RJpajwfHIOZNHhZcrwNYWUdpU+2kTUE6
	Nqz4S9gqAZLJWCQZD0YZq5jABGSdNzPymXW13fcY4V4Kua8YlqwgNp7OSVwaHqED
	I4GdGv4gBLOFrJCVQeOT/BMnEQq3pDuiPXP0KONYesvP2J+s+sliMPf26DUt5z3y
	kJH+FNuX3ISv9KqKDRiOoNGLYZT7/mJalxZ7luyedk6tF2b1edGS9WYDBj9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715911198; x=1715997598; bh=5WuVdFa01zTxg+wrL41bF9gY63RV
	6sDmbRv8H//BBSQ=; b=MGAlk7RN/UcNCZL3Yr34I70jRSqsZU+MBLiyam4RJ4Wl
	PM75gTIWrVNkCZ0kLKZ+cKe/mkuz/OH5RDMLck156AXNuzMCfU5mx33i4dsFDctc
	AWuJBdfOHKzKAx91wx31MCvxVVwQlB7wNBRt9aaTTkCTV86Onv7QmToPtxLgp6C/
	E5p6MZtch2Ih5N/rpgcJ7H+rDEU2q/fdst5tpuZuR3O+YMmxZ5IV6470+HVRcgC5
	sLiUDoWbDHcpvShYZreWOQoZkhfbfgY/gZvIT6/n66Ikc1PI+gv5wU2uyQyA6bCT
	6EJ5z51zyeIIJayEcHRf8qBZHreqUZ/4cEziNLv0Kg==
X-ME-Sender: <xms:HbpGZt6dNOMmc_9B48fH-kry4mrHxa6tyQzjm-7ygvchDC1ik5VZdw>
    <xme:HbpGZq7H2ld4KParp6QrZcAqNaY1bJMlMjFY0vDRdmIdO_QtHbdX3Y3MuaMc1QTNX
    wjYTZeRBD7a9jk3VPw>
X-ME-Received: <xmr:HbpGZkexVeccWLHeTMXE80Qqtm5kvdWcmWZlcEuaH4zwEYph1ZLomBIyYedRkOrl2nFGxpme_enfLHVxsximIYEy4tHjK8E8cjk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehvddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:HbpGZmKxGcFDCxfucs4VN_UCbh8MkjrkecaRgMtLQaoLd3CVv4MaJA>
    <xmx:HbpGZhJX6gtFBQEwk9fHKCjVxC4uDZtiPrilqU2BXjM2h3_ku08mZA>
    <xmx:HbpGZvzaf_7afK67YpX1ThOkircwnjPSH1D3rX-RNEvBaBap3PGRxw>
    <xmx:HbpGZtI2HBa2hvfhK5aZRP79qBc7xagOcjDcc0RV0Dqu0byhCC4UkQ>
    <xmx:HrpGZuEN-w5lFGsV2Me0y60LxOM7eK2oswEA-VE2kiDpRn7aqfl-Yz79>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 21:59:57 -0400 (EDT)
Date: Thu, 16 May 2024 20:59:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/1] ARM: dts: Aspeed:
 Add Facebook common dts
Message-ID: <Zka6HNpuhmrDz2X_@heinlein.vulture-banana.ts.net>
References: <20240513144917.952612-1-peteryin.openbmc@gmail.com>
 <fe42afa01a7980d8934f437fbb01e2b27d46d7d9.camel@codeconstruct.com.au>
 <CAPSyxFQ0DWMMAV87NUW-wmt8hudeK2PSDdgWCuiTbthDwAd=vw@mail.gmail.com>
 <ff7a6703c15a93f5f776caa836f0d0ccf870415b.camel@codeconstruct.com.au>
 <ZkVxdHBLOG2BeRui@heinlein.vulture-banana.ts.net>
 <242c8e796123208e3a3d133a292b8409a03c0e89.camel@codeconstruct.com.au>
 <ZkawtsDBMGT-rTJx@heinlein.vulture-banana.ts.net>
 <d1437d773ea682e85cd9f7197453e466ac362fb7.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Tm17W5SWRhAiV4+"
Content-Disposition: inline
In-Reply-To: <d1437d773ea682e85cd9f7197453e466ac362fb7.camel@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--1Tm17W5SWRhAiV4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 11:00:08AM +0930, Andrew Jeffery wrote:
> On Thu, 2024-05-16 at 20:19 -0500, Patrick Williams wrote:
> >=20
> > I don't currently have a lot of faith that if we sent a trivial "add the
> > new compatible" that it would be accepted in a timely manner.
>=20
> Well, I'm responding to the patch because I intend to help you get it
> merged. I'm trying to keep on top of the patches people send these
> days. Can we give it a chance?

Sure, we can give it [another] chance.

Peter, please send independent patches for minerva and harma DTSs for
u-boot.

--=20
Patrick Williams

--1Tm17W5SWRhAiV4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZGuhoACgkQqwNHzC0A
wRlHig/8DYFwKpGtaJPFqNIaGl9POMnmsh4nZ726JaBN35VwX69bXL65p7OoloxT
Qvq6lTefPiTnVB50LsaUc41rBesUFzfubTWASVJKYhDu06fZH7Ys3GTyroXjhavq
drP83lqkP+pdk1W1F2JWEjheWB7I/alhLtvKB+8GRjj6DeILDWGggIwBbPYHTDk3
nxwYjfrBCKUQRWEA9qGW6knAuv+nr4NWFCk69EkZVY1w15XbvWdm8cpo9dym5NuM
yqT4wZKnP+By40D5Eze4Ez0GqhGDPys+t+9sHwFdypdJ69R7muagLN5LcYySGECT
4yQNtyMDXFEovFIzRrO8/yutKpP+wuv0uFvRZzsS/ueGJWXDuN1cFVCbSPlup/wF
AO9GA3ealJSXTcrC1jElFo3YA0jA4F4pXvKx67BJUXiX6ivanY1V5nlqw+5Zg2gR
KqK1wg1SC2nqbyvzc1iGN7hyK8jM33ktY/1YTxRy1X+c+OMb/FQcXqQogbhywjh7
rOJGBmgSCUTkEYLBACTil/QE10RxQdCE6sZZD9MW3rnCzO35zRFt5nOIZhWUnWxd
C/zShUQTZYYOKGiY7q0M0MUxS3ohFt4ItuREfD7j5OyPPgW1z6xY1QkWRIIt+dz5
zDIfZPW/Q1VC3nfUtsfUoW+BaCGyv1VxFtpfmqWotGJ6CxjiSXo=
=ZbmB
-----END PGP SIGNATURE-----

--1Tm17W5SWRhAiV4+--
