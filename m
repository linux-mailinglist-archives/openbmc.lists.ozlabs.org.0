Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94937B13C
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 00:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfsML4Jblz2yYB
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 08:01:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=WEECGMbX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=u3OiRsaf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=WEECGMbX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=u3OiRsaf; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfsM44PCjz2xv8
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 08:01:20 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C00655C0170;
 Tue, 11 May 2021 18:01:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 11 May 2021 18:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=pyaDexWPEmCnwSkf4gRzuy36Mkx
 cPWF+JRVTCQU9oH0=; b=WEECGMbXQHgvqRHMtD/2f1S9TYuLvH4budOzU4yd1VP
 xg9VybtTvGzcxFJqJqatFVDJvuoATh06l6YxNDoSSyq9WRJQdW2AqFhwvD8epx+4
 Ydg/FG/r1AlWlsFDwiJma2/is6gMKLBj/SOkNzMuEPXH1VCsKcHSCdSGrP2FKrAe
 wcW5f2yhEUlQCsV9q4EqOJaPMAG1J+FdwXee2cPBsTkqDvjP0gBtJHlNFy5GgiPN
 gkT6twa21IzAkblKkiVEfkUpFrrx7Xj3nSqzZkXnevGVDGsISm+u9a2fym8E+BDE
 W0tK9nAGU/XSpUVeu3Q5Owlo+3Cm/aGOVcprix+w1mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pyaDex
 WPEmCnwSkf4gRzuy36MkxcPWF+JRVTCQU9oH0=; b=u3OiRsafVNySLyegu4GGAi
 vdlyeDipsEZGZSWmTFKMVvuX7f/ex4B0O+YP4TuoCCLYukGN4W5MCUjcgIL7Wb69
 dZmQXJU+Id6rk8cTW7HdzDZ7s7gCFEdG995kI4yIHXEzz5+B9KEX3ih2aNCLx+H7
 HsPECsmqQZl+onNHMhdQU7BC6k4YwX0Miwl4ymOO9bt5OU0v9eZiCMB3juGBKexX
 kLONokoJp8sbeIeN+Cib7xGoNfXFUYfDEruohXkSif1TS1Lb17gOujasPtRSzvHl
 qVe7DY0oUilrPF9cxus3oBtBH9SXRC4FmcTiQh2mMlDQ3MZ/i5gQtc/R4jIRrRuQ
 ==
X-ME-Sender: <xms:rf6aYD1694cbR1Pybxd9Nsrcx3_pClZHQQZ-2tVY-ww2zJRhcbmPGw>
 <xme:rf6aYCH2Yxo1ViAHCi0Et5-A5TLUEkE5nRYrtOlBDFjhDXJg0XAToF3wrBKpUC2G1
 0uq5Ge2YOoB4LVS9uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehuddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecukfhppeduieeirddujedvrdduvddurd
 dvhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:rf6aYD7KfYdggb9QCd2MNjjIMgFjZ-llkr9fzLtpNaBvvAUF7575Pw>
 <xmx:rf6aYI08Ti7KY2avO-xQBMaBtkfPsmkntS5NVlLgXKn86TgU1nC9oQ>
 <xmx:rf6aYGE69lXDDR5JwJgNreRNGiSMR4fdGjYR29swPbDewcU90LeOcA>
 <xmx:rf6aYBxsSv71U4rT_hlVwHitWL1gbJNRJLlSUe3-17Ky9xdpFzWX1g>
Received: from localhost (mobile-166-172-121-251.mycingular.net
 [166.172.121.251]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 18:01:16 -0400 (EDT)
Date: Tue, 11 May 2021 17:01:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike <proclivis@gmail.com>
Subject: Re: mtools bitbake failure
Message-ID: <YJr+rFl5pV3HsDTN@heinlein>
References: <YJr5+PsBEvGtJGfB@heinlein>
 <517DD65A-6077-450B-8C14-29385D469AA8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lFuw/R+HhzM6caHq"
Content-Disposition: inline
In-Reply-To: <517DD65A-6077-450B-8C14-29385D469AA8@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--lFuw/R+HhzM6caHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 03:55:42PM -0600, Mike wrote:
> Perhaps tags 2.8 and 2.9 are too old? Both had this problem, but I don=E2=
=80=99t know which version of poky they use. My description above worked fo=
r 2.8

Very few people work off tags and we do not have a committed support
structure for them.  We barely can get people to raise their hand and
say they compile for their machine when we go to release them...

Unless you have a good reason to work off a tag, I would strongly
encourage you to work off our master branch for all your development
efforts.

--=20
Patrick Williams

--lFuw/R+HhzM6caHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCa/qoACgkQqwNHzC0A
wRnxVBAAi0EZd7bsH9JGUe/GMQApxFV8Oua42GMcGqj4jZTcAX70KdmFYjXSkfbJ
9xKNs1TV+ygr+S/dh2/dbyjTRPY79oBusae2P5LWE+fNXzauU6r8YUt/Kdjgmx3Y
4hDyzZ9HvDYYhFwYZSnUaXoo0VQbS0F8cQb+FOhFYQ6Vaw3VRvswYhKZWBO0t695
QADPMXf3EVFdVINss34Y/5boI64b33rlnXCQ8JGB911nWCI8EVgpgcfZI297P8i+
RF9fIHN+cdRdf1LBW9IS0B1SZdtH9HyA/gSpKYlV/ZWMYM0kHjxzuUk6FgKQdb/K
9lDkKBAUt0/h6NtiNum5Bc88Thrq7d/E4HCBYBAK6ZAde1lOHCNQt+Xyc1dQDnLv
e++6BxvLD0KzzXGW82qie/N/9wp4ikMxSgmP/b6p3sDMsg/fb94+MgHNfNA/rWmJ
Y0YtCnioe1AtIs8md2o88WO7UCF1NV1E5itbMOaMT9eE3GbfmMvShW+vvDSQR8xf
aWwUFwTmbYqR7iqnCopSUAYYFzZWosHj6aDKZqkp57NY0fM697j21reiN5BBwnyC
IgTJoKDn62m2k4FHGLGVG7Z98RmVdYIv0Yu5WkZq25HY8KrbFip+sTXCqfw1GHEd
1Sou3rQ8n+gXPmSxBCq3gXZIMwCx4mjm8YQM5WiqETIqttV9b5c=
=EQET
-----END PGP SIGNATURE-----

--lFuw/R+HhzM6caHq--
