Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 983662ED4F8
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 18:04:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBXdB6DPLzDqjY
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 04:03:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=getEo9X3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Hyxkdf1m; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBXcS5jGMzDqXM
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 04:03:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F5765C010A;
 Thu,  7 Jan 2021 12:03:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 07 Jan 2021 12:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=be2563FtECk0OO8B1DIJe/029V6
 YFgNvLf5zuHbLsgg=; b=getEo9X3mYGpk5iBqkQbvmWDvvmVVrmn8RpEz2u9FOt
 pyCZ/s1Ywfb2ITPxVWUN3qJVThGPaiYtMv+J9Cu/Pqc6lWUYzgRQVq2f2Z0TUehZ
 xwJTfzezaLV69pl/J1L6KZytsg1YBqdM8rNbxmssULABhqiP/22aqLB8Tl+NaK9u
 muOR9tlE7KUX2H7AUjD46ggPtOokI1+l8k76oxuxDF8R/TTK7tUebSWJTDey/XEt
 cjaDumHawvR/N41skOGhQ0iwypIfoW7E/LNiW4gb4ZBLr6M6KdAwBjFBuIruuB2w
 wEu4ASKUZ5J3YSyS7H6II9wrJdIvksDyJQtczTgxsiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=be2563
 FtECk0OO8B1DIJe/029V6YFgNvLf5zuHbLsgg=; b=Hyxkdf1m4c5Jqg303Q2sMT
 o0xzm1lcv+Sas6x3NqXycRYFus9w9C6tldOzt1vQd9WJJ8a5uEvY7Do1HebILAyZ
 fvAiMBzCqV62vfKodtLILxB4G3CmUq4bj8I8AEs245XPViAFVt2i86RrSQO1MDAB
 e2sCsFFZCpdHdkhawBpUBTRsC6hbHvogXPmFwOOYpWsC849fhXjn2jvDiBBh33DS
 mB+l9LTXK98cr1e9fObffXbfnyerv1O/zxsJ4xlTgVRUndOqpeTuQK8thzLRIWno
 6RDvbyxfMXJNu6nT/8RxZYqQUGmFHr4Rspr7KMOZU4fSmTSIbSBSCgOdKb9XllIw
 ==
X-ME-Sender: <xms:1D73X2R-9tABZuq4MZCjx1FqC4fo9caXNyVHhnnJKbsj_S1yI3YHLA>
 <xme:1D73X7zEp_KeH7fFcjl9_vPadv6c0MtLJhbDF2Ua9RS1MggGsHoBlVY7UQulshsJs
 Zhtv03LiLz1hro8_4s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegvddgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:1D73Xz0E4GgaCT40L4bgyq8OFUQbOAKhHybbjfP8bsZGYtP2ItlDRQ>
 <xmx:1D73XyAIUP4wkcMCq1G3VOsEkYHQrCiFtCncL_uu-wGatNSpaasT9w>
 <xmx:1D73X_j5I6mJOOXfJaaHqiB_pP-xS9LfLStNdYh4Nj6sP2W7OSYD1w>
 <xmx:1T73XxdTwR0cjDhXA074lg1hDgySfzZCNkmosbfAwZCefo4KpltTgQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 12B3924005E;
 Thu,  7 Jan 2021 12:03:15 -0500 (EST)
Date: Thu, 7 Jan 2021 11:03:14 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: GPIO pin is reset to default value after release.
Message-ID: <X/c+0jLRBygRgPqr@heinlein>
References: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
 <0ff1c69a-a6c8-462e-86d4-a08d981b80d2@beta.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L3f0CIp2C9ULKxfS"
Content-Disposition: inline
In-Reply-To: <0ff1c69a-a6c8-462e-86d4-a08d981b80d2@beta.fastmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--L3f0CIp2C9ULKxfS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 11:42:26AM +1030, Andrew Jeffery wrote:
> > Do we have any gpio lib which don't reset the GPIO when the handler is=
=20
> > released?
>=20
> No. This is a property of the GPIO chardev interface provided by the kern=
el. libgpiod makes the kernel interface a bit nicer to consume in user spac=
e, but isn't where this behaviour is contracted (i.e. any use of the charde=
v interface might result in this behaviour, libgpiod or otherwise).
>=20
> At the moment the way to get the behaviour you desire is to keep the line=
 handle open.
>=20
> The deprecated approach is to use the sysfs interface instead, but that's=
 strongly discouraged.
>=20
> That said, your problem is something I have on my to-do list to address w=
ith upstream. I'll Cc the openbmc list whenever I get to it.

Glad you're looking to fix this.

I'm sure you are already aware but this makes usage value of libgpiod pretty
low for a lot of BMC function.  There are many cases where we need to prese=
rve
GPIO state even through a BMC reset, but certainly in the event that the app
holding the GPIO crashed.  If we don't retain the state adverse side-effects
happen to the host.

I had a similar issue on the last non-BMC embedded device I worked on as we=
ll
and we couldn't use libgpiod as a result.  It is unfortunate the current
state of affairs because officially the sysfs gpio interfaces were
suppose to be removed last year.

https://github.com/torvalds/linux/commit/fe95046e960b4b76e73dc1486955d93f47=
276134

--=20
Patrick Williams

--L3f0CIp2C9ULKxfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/3PtAACgkQqwNHzC0A
wRl70A//TDUNAGG48+Nl/IEX96/lrdVxysoDcKRXmSwvic3TtQUcf6A9BFOQcUR7
P9hjM5ltXavuyP008JH+RtFkryW+vaU6Tvb8haD0WBzkCeXAxLKnfRIKoJp16h9y
i5cRaITnFTtbVguVGoZTGKWjah65qza1Sk2QU7I1dcxz2Zs/JqEDxv5NP7/yWr6R
1LehqbunahqlTDaWLRF2QdUqXHoDU6/B0MdyStjTSeB96JTR/gVZmr2FrAhtZblg
pLfONcIukv0Mfs6k5laAMRwe6q9xcdEa/Nd4MmHIrur2LsN4SZhplyHlvomqvTgb
bZWhQqE/EGtei9Hn4ChS9eIclKpjAebU4ghE2fUDwrHJGRj3wn0EI9N/onWX1VmJ
/1Wbi/a/WYDxaKOVNZvj0Uq6WtTZNuudvbVGczseAVYyhASKE4KA+dR3Ac8W02aM
G5AVq1Mu0IoP7DK2Ljl+hnW48Ptxy5dgrIA//FpgjuQG/TNBFwz6pMpOSY+WZl2I
2Y1eDhyNnvmBWd/BJhF5pDT2zvyGY1hQL/MD/vMwyVXsmIJkwmPRYwb7DAFa0thl
txyMK8OEAa+yqJONg1JL/IpCGWuxStQqHq04zeElj6pS+Jb2ZhDXQkaMfsnjCito
828ySlOAgDnjMi/gR3TnhLOyehBs+V1oABkc6Q2vfHB5Yg05524=
=YnB7
-----END PGP SIGNATURE-----

--L3f0CIp2C9ULKxfS--
