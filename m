Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356C97849B
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 17:21:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4ygS5sblz3cGc
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2024 01:20:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726240846;
	cv=none; b=mHAEWrhBqVhmVF6K+l7YbH6RYums88MFhkyV9zVHy3aJ9/bkotAyRbmohlc/br+O5D0OQFaewpbOCN4IMR3YN81A6luxFfJFpSVM35dT3dUdJBA2aDx1zeGDIcjXUcbDGybMKBpPwnArOWbV8dEI1fcZ+fAy8RpVWBtJQelbE7j3lBY/t5DCDJCKgO2hnrHhtwJW5UcG+IvDNkKcikaYDr1YP3WzP4jGFdAMJ/DiDOuaSOi7sOXKlZ+lcH29JrUKZxdkxCa8yJXCIOV2dqGP0Irsiblw9r5jo/DnMsCFei9F2cHKlPSpZI70FdWpUxL76D3wUke1/6HNBgXH2et7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726240846; c=relaxed/relaxed;
	bh=t9WLTTEAfmIo/h8DCHSGBKwP19w+IMf5wBBH3pxpDQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiVkQwlRO7WQgQtZHcormfYsVW051lkvsZV/sUxGIZ97aklkSsen/GUwlVj6srmf32Ug7lZ56CT+x/y6dR07NUU0SNmnBlO48frTtHcpc965UKSTs+tA1oBzbhO/vd6I8WQItTEVy4XazB6COe1FeIopDbAqimdCOv2Wg3AR9VJNalOF/hy0whm7LM+NZc5k5WkVTezz0lB3r6Sv2+E3nreUBJh8ZQnd08dKcfk7Rr0RKjnBnYse5C3fyiJKizKQK6m+rnBL85VT3X5gpK/0Do8ELlTVDc7bQqugJsPCTjpIannR+agRIbdzP+kt0EmFOIWx1egdSMfTMxD444YxWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Q2TVatOn; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=VKlWXaO7; dkim-atps=neutral; spf=pass (client-ip=103.168.172.146; helo=fout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Q2TVatOn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=VKlWXaO7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.146; helo=fout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4ygH1JPfz2yps
	for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2024 01:20:41 +1000 (AEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 4AAA71380303;
	Fri, 13 Sep 2024 11:20:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 13 Sep 2024 11:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1726240838; x=1726327238; bh=t9WLTTEAfm
	Io/h8DCHSGBKwP19w+IMf5wBBH3pxpDQA=; b=Q2TVatOnErdBwrg6qhQ+Tmeein
	us3KGN7YzNn9z1kX6U35o8MM0JALTq/BDK75AVCrNM+S91JO83RRiZOmKpLHHJH7
	5gfix1W/EwA9wvLlNCNKRS2CQHqn5OQQg5c87WAqfbPSn5Enwh2e/XaKwj0Snn3U
	I52K5b3HOnP+cew6cwX2148n7+3HagBuO2tHFbSQV1NEVSQGvik7ESQPcJ8c9Q8T
	wEEkZDisGXtVA+KrcES8jkYTbq9ep4jxg2fJLPr01ZYVtgPGj5vD1gcodxcGRmqI
	JE26Pgl6wa7nnzHYQ949qEDzk3C4yLBIH5OEReXHg/iW01VrVD51cilRXqiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726240838; x=1726327238; bh=t9WLTTEAfmIo/h8DCHSGBKwP19w+
	IMf5wBBH3pxpDQA=; b=VKlWXaO7/8alrW/3LCipsgrduiOMoN+AEzARYj+Z/yI1
	cg0xzIfVm47x7DoEDPVMCPeJsP1xiCEf7iRvPjfw6Rej4Fux0wdunfgxasV3Kt+H
	Cs1xMjtHdaHn+sqWgyTHKegb9MuUGmBwCtVzWyHT28od2DLp9Hd/UriMKhkiUX6O
	fdoGYXJkuaVSlKBzyRsUTuVjWJs6ey/2YxNGsXpasaZgeP/fFTsLjed2FUlC9vWO
	c9JX+pE/34L77h8YCstUxEy5AK5k7tiGh44dK0nRZ+RSOq1WsMOmC2m1uFc+Fl2f
	o+Lba6for0N5CBh+HXYGj40bDS4PuFBUXjg/cDlBTg==
X-ME-Sender: <xms:RVjkZnUfjyBC_vIUxl8viQajK-L06o9mg0At1tHSA2Ts3CGQywPCIw>
    <xme:RVjkZvmeBTFSFVGtpNB23TBnsik_VoXxtWG8txpSHtar0kWMuwsKDycKuO7k3FByb
    qo84-Sh2jrBzDXXlW0>
X-ME-Received: <xmr:RVjkZja-JF-pr2kwTGunEgW5-9RjH4Tca6YaMcbxdUKH5PT-XjJuAqK-NIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmsh
    cuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeej
    heeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehs
    thiftgigrdighiiipdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehguhhnughurdgsrggsrghsihhkrghnuggrrheslhhtthhsrdgtohhmpdhr
    tghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpth
    htohepsggrlhgrrdhsuhgsrhgrmhgrnhhihigrnheslhhtthhsrdgtohhm
X-ME-Proxy: <xmx:RVjkZiXtNPgbWCckMMx7cEoWrTVf6Kooxesx_7w-3s_5iFc7YUiKeg>
    <xmx:RVjkZhn79ytkLd4DMQmudEJ3zSRG1RFrekCX-PAmYbz53Do5bE1x0A>
    <xmx:RVjkZvf7IC4J2vfN6MS3aGP5PU55OpxqO4RYCfw-2Um2yeh_Kxqeww>
    <xmx:RVjkZrHDvDLUvyFLey81D4fY1r3-P3MVCzYRg4sYU79-1KmTn4sC8Q>
    <xmx:RljkZnhJGigqHQ0ArIfsg6o51KtLGUl8kFAREdFWth2ghzvP9EbmUnPi>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Sep 2024 11:20:37 -0400 (EDT)
Date: Fri, 13 Sep 2024 11:20:36 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Gundu Baba Sikandar <gundu.babasikandar@ltts.com>
Subject: Re: Help with "ipmitool chassis power on"
Message-ID: <ZuRYREE7yKY-u4wK@heinlein.vulture-banana.ts.net>
References: <PN0PR01MB9336C133AE2B5EC1C3415336E09B2@PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uL+XKfKOpls5eA15"
Content-Disposition: inline
In-Reply-To: <PN0PR01MB9336C133AE2B5EC1C3415336E09B2@PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM>
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
Cc: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--uL+XKfKOpls5eA15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 02:37:20PM +0000, Gundu Baba Sikandar wrote:
> Hi all,
>=20
> I am working in openbmc and using ipmitool for chassis power control. Bel=
ow is the error I'm getting for "ipmitool chassis power on".
> root@ast2600-default:~# ipmitool chassis power on
> Set Chassis Power Control to Up/On failed: Unspecified error
> root@ast2600-default:~#

There is far too little information here to
help you out.

1. What commit are you building from?
2. What hardware is this that you're targeting?  Do you have
   un-upstreamed configuration for this machine?
3. Have you checked the underlying dbus objects for state-management,
   rather than going right to `ipmitool`?
4. Are you using `phosphor-state-manager` or `x86-power-control`?

(Generally people do not use `ipmitool` from the BMC itself and instead
 interact with local facilities)

--=20
Patrick Williams

--uL+XKfKOpls5eA15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmbkWEIACgkQqwNHzC0A
wRk3phAApl8MxYTAU20cpAkS0koQrg0OUjjtPx1FVfAARSTF7tohlP0NiaM9hXPd
5fU+q/w+DSr2luZY/8pyK8mJ+ZQt4AQDBizv8naGFYEdHPFuhz0fccGLO5PMUXVv
JjW/3dZQv+iyKplL9G4gWTkLi9Gd9kSlMPEs8pDVRiAMZrP/A1xypUDypjC7EVGa
sEHa3y4t5IqhuHHUXDhc98WV3RTk3KamZHwGPk6VWAKOoGCVNDEQRjzgcgKiEFhe
UNn0DmM41Plpwayu8tD0hdz6Kqa6SNt+389msOdkTaSPL1IJ9sY5mOZ6SFpv4OTY
RtHsfGgZRs8HRcQRgOYE/QB2wLDKZlu7x5pvH9lNq0ihB7BSx0CSjlYZm3Ol97T9
DnKPhhd4JiJjTP122cfY2CeSeyVvelf5+Er/MX5b1xpnomQzNjX5fpxKhOP2qa0Y
oQCzZCKgDVCrN3S1Kq7Qol7DXXdEmpV3V5PpIOKwaQbrIAy+ceowPxyduct0wa1X
MAiGMLmZuvBa9Dm0U7+xI8MvbeGshvDMRI1ShUur82mmKxlFbtjKhFhFAj+SQElX
8RHcbHZN0KoGEjWVJRYsA0jWKjDl+cvqZNUJyyolpXJD5pSSbY/OAT6Ubzptwv9j
yAlPW98VWbCUc/xMObGWfqdI9I1j4mebJMZ5SnqEEnGPD67ETx4=
=IG4U
-----END PGP SIGNATURE-----

--uL+XKfKOpls5eA15--
