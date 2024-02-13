Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C81853343
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 15:36:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=MIsBoL86;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Fp8XgkqA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ3mS21SVz3dWZ
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 01:36:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=MIsBoL86;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Fp8XgkqA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ3lx5QC7z30YS
	for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2024 01:35:57 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 812A93200A3D;
	Tue, 13 Feb 2024 09:35:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 13 Feb 2024 09:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1707834955; x=1707921355; bh=bQ1AKpgT8T
	YA0AmwqNQa+T+tWpjqOLSYn2b5Mo0g/5o=; b=MIsBoL86v2xJe9p6t/o60bf9yL
	X5fxbUX8xK8RcfAymOhFtlSKJCpcAiLJvB0sMOXKyeH7Y0xgfGfhDIbKmcx2nfqI
	DDq7XaeFaR3msL0Ew8LSGsKLQgdOqwstOwPLKbazEaLjCJMsSsz/nw36rfAWV6nb
	K6etHXa9jt9wJVqBa7+JRy1XuaNFMD5GYdZSZKrwfY9SwQiIUBePcrGBv/IyZZxz
	Y+fkXdBmP39gOWkzELuhKtYz7IJDYlFRQ/02zXbC2O09tuecBcwJAm45xH29x+2c
	cfOcQLa2aIYSJY/00euGs/Tb1A3+vVfb/hc513d8Y64eBg0/7uhkNgBSi1sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707834955; x=1707921355; bh=bQ1AKpgT8TYA0AmwqNQa+T+tWpjq
	OLSYn2b5Mo0g/5o=; b=Fp8XgkqAg+jRhwlS0u07wr4EIeQh+ISHPmGozhQvcjOw
	BcosAgE/mga5O1KmzS6wag/U+pPTrmjjDkL2hkmjAG9IW4e28OGLYe8/flwoxcTN
	XvnNVVc0sMPgQRf00g7yv0+fYq17x+Wy8KugCRtKzFGpS01WP0hR/bUnONVtf0qR
	8doH1qQtgQf7LcIpcRxsXNPueOpSfhzlePy9+zplC1QsghqhZh23j4sfMZbN29BF
	bhm0TfnPjl3vQCg19GqB0jGHjzTQunVdCjb/VxHjF7ZBP0LhSmRv47Ira/IOjpdG
	sDkDbj/TUfBw6QjjMDlFzynKJLbmEyJ74B1N/JENUg==
X-ME-Sender: <xms:Sn7LZZCz0TvA1ggbCLVd2g9FIyhJ2qjy5ws9IGwNLjmLa5-rQ2n-9A>
    <xme:Sn7LZXjwUpAMeyr1GpKJCw4rzuy5XJEDnJGDCeZWWPOSljZFeGaa_nd93-5roy8TH
    P6RP_y2nhTIvO8KYMI>
X-ME-Received: <xmr:Sn7LZUmLXK0Vo5c30sWIz1O_9igLucBNWPCk-TG85r2d6p4WeF67AYftWDW98L9Fn5OB93ggcwf5EzjunbV8vh1GapAh1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheel
    udekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Sn7LZTxQuu_GGPOA1bVZnbndXFXSJjtTiZ-0l_HpioXpDtGu3z2L1A>
    <xmx:Sn7LZeTV_bHzs27CdNJaOD4kIUAJnyEdTMQgSza4OSxwa3n9Q3Xh_Q>
    <xmx:Sn7LZWaGVT6ocMpk87JhiMirJcRpvKVz2vSRE54EVPsZyqOVIuYhFQ>
    <xmx:S37LZccS5tOw6ZPcU44w0IG5bLropaZQ1YoJdVCXM66sXMPSMjNqjw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Feb 2024 09:35:54 -0500 (EST)
Date: Tue, 13 Feb 2024 08:35:53 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: File Manager Service in OpenBMC
Message-ID: <Zct-SbPMtzAAvU9O@heinlein.vulture-banana.ts.net>
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3xR5LWKbrhc9nFSg"
Content-Disposition: inline
In-Reply-To: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
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
Cc: gmills@us.ibm.com, openbmc@lists.ozlabs.org, ed@tanous.net, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3xR5LWKbrhc9nFSg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2024 at 12:52:11PM +0530, Sunitha Harish wrote:
> This usecase is being re-designed, to stop=20
> bmcweb from modifying and accessing BMC file system directly.

Why?  What motivated this?

> To achieve this, a dbus & backend application is needed. This should=20
> provide APIs to Create, Update, Get and Delete a file. This application=
=20
> should also take care of security aspects of the File upload usecases,=20
> before letting the BMC file system updated. Please share your views on=20
> adding this application.

What are the "security aspects"?  This is a very broad statement and
feels a bit hand-wavy.

I'm not really sure what views you expected anyone to give.  There are
basically 2 sentences of details here.  My gut reaction is "this sounds
like a CVE waiting to happen", but, if you want to write a design
document proposal go ahead.

--=20
Patrick Williams

--3xR5LWKbrhc9nFSg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmXLfkkACgkQqwNHzC0A
wRk6ABAAoAeAxjUdM0jEbO2jaanFZdCNrZBR/87RYo68BusQhY+U069q0COg+Z9j
yIYKhagDfzcgQnfG+KG7/mf9cUzeBniPvKpRDpvdLANsJMrPn5dfC3wgBw+Rvkzm
tXA/lJwwfaSjhgo/sg4yDqvz0Xt0Ac1kLYPeUxkiRyknCsJqfvkj/BdFm6/S2dsN
USmCL54sCvam4Q/xn92LuLeF1ApceZnI8Meh8kFsu574T+1RcJ6AmPGZMCFM6w0g
NJeZUx0eqqKZGS/kpL9XDhCkRRY9UcfqRnfeYfsrimd1uJ4/x04HAWwKo24eqILu
XCOiLKLlOMZ+g6LcZbdRIMeYWptfMKRfa7WfMLqS54SC59AqCZpXf3fieX/W9K1j
VoF916ksmOLt6dlVKrP+aKDaCqo4N7vQtS5pW7brUOm8k7iXxrDKV+7cO1/SBQKU
CDYMUcM/xvdw1DfnX7dscgbJQYvHr548ehPjHrJBmBcXeCPDPp29phsr+XI3ViTj
3j4Ha+u6I0K7XoRbnuNth8u1ao1OlJo6XoJTXWVd4OBNIU2VvDfl49Qt+dlmdiJU
UF5ic+oLQF2ggaWs8F5twZhN6Q3mO0GpkIm5wBJM25NFAp0xGla71CWGqDR5+l9p
THSyvMLosh0/mm5js7h0zGWrQOyBDRQozTfVsgKxh4XSW1Sqlqg=
=zbcA
-----END PGP SIGNATURE-----

--3xR5LWKbrhc9nFSg--
