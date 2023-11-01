Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4387DE260
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 15:28:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=dVljCipO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=E2mYtmhp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL8WG6YhTz3cGY
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 01:28:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=dVljCipO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=E2mYtmhp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL8VZ4GKLz3c2G
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 01:27:49 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id 80CD45C0242;
	Wed,  1 Nov 2023 10:27:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 01 Nov 2023 10:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698848865; x=1698935265; bh=ie
	E4A4dM9Ln3wZ4qo/z+2SO2gK8hH+Ptvpz42RRoiHY=; b=dVljCipO6PK7PAt3+s
	yMKbQddM8uqhFH/XT0Do4xKjY6o6uYAQEiw3t5t638Au3RzuNWWpEkkNClHcyg3l
	W8UBuitx/tR78+93WHHWBSnzIo1PHlXcMkF3FMY8zxCtxW6i2Yv8zTflC4+LnUcG
	VoJeYNlKtC0X77D8kkHM8+XTpotzYXPI1oQtKSnecItS7/RXe9/myFOjfEqy+wjX
	RChhO8sMFwvO2ZRRACps7kkMOY/nAWw6/Oq5Y1VgB2270J6alKk7AClyPa/ZtW2i
	FHX6wZtnhFQtrmfkrl6oDo5JssGyO5aJs3zqG2Cc8bV7810yaPyau/IexIOlF+Vn
	UPPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698848865; x=1698935265; bh=ieE4A4dM9Ln3w
	Z4qo/z+2SO2gK8hH+Ptvpz42RRoiHY=; b=E2mYtmhpl5WPQ59nvi4L/2TYVja9z
	hLxOedL+t5CECiEl9khVyH6WNJIJ39nVE3Pa+l0Pn98OXh9mCXz/EynrSsazDv3e
	NpSQmOszwYIUrOY9/LUtYPWah4xmZtKMpwfVLp1Cw7vSRkc80FueqOVT7Hc/9Sgf
	Hq8Uz7FUsW9cXSyI5KGSEyaz7WP+k7QPlSXwv0n5XhAwdgwlf31xNGUQFwFWanvI
	udQbltmwHV92Z01WcLAcRZyjuIEYQWImHKX1SGMLHG6vOPVi0mLqwlZqnCemDkEy
	yP7zVFDyZ5hZYVKgVu/84P9VQpW+CNWpQP+yw85rIHsPOWydoZVMDtcCA==
X-ME-Sender: <xms:YGBCZWWuMxZBuM5xUdJ23D4nkRDC_YGbKahnVa7Fw6l-LaNmNyNJsA>
    <xme:YGBCZSkbwoXs_shgzOVPAhGoTkQcSFl0v2SM8ibZlgv49ZhT3k7YR5MGDP9AcFP6b
    jQkGWDb2xCL_c1PCIA>
X-ME-Received: <xmr:YGBCZaa-OOeEI-C05KbuCw603mE2747lkUsp5SNxOgLfhFhfhnOnOrOesnT2mWDhROH16IZTCg_2ouULkXae7TegvkU_eYQHuEM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddtgedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeehfeejheeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
    hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:YGBCZdW8XWhhf1q5LM9OXXWVgZkdejEPVdZmuQowkPIUcj0GbeJIYw>
    <xmx:YGBCZQmJMK48lJF5bheMc5jSAuSjWYJ5u2z1_gekJbFCBPiki29UIg>
    <xmx:YGBCZScL-2jIruNiTXHy1bDmHCUkFudTwb7qVoMXYRIzjIG7ojAXbQ>
    <xmx:YWBCZXvKBN2rBZy-MRMGhfVHIL0n6iW-6MSDdzf9cCAV0F3gVEGJSA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Nov 2023 10:27:44 -0400 (EDT)
Date: Wed, 1 Nov 2023 09:27:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Hakim.Cherif@microchip.com
Subject: Re: Documentation/Guidance in order to support another hardware
Message-ID: <ZUJgXhNhtxNHG7-4@heinlein.vulture-banana.ts.net>
References: <PH0PR11MB564243302F521949E3D0477086A0A@PH0PR11MB5642.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="llRpy1Z+/SKV9JXF"
Content-Disposition: inline
In-Reply-To: <PH0PR11MB564243302F521949E3D0477086A0A@PH0PR11MB5642.namprd11.prod.outlook.com>
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


--llRpy1Z+/SKV9JXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 10:40:59AM +0000, Hakim.Cherif@microchip.com wrote:
> I am evaluating how to make OpenBMC support one of our custom hardware.
>=20
> I am completely new to OpenBMC and I struggle doing this.
>=20
> Would you have any documentation ? Any guidance about how to do so ?

It isn't obvious what you're trying to accomplish.  Some possibilities:

1. You have an alternative to Aspeed AST2600 you want to propose as a
   BMC SOC.

2. You have an alternative to a host processor you want the BMC to
   manage.

3. You have a new system design based on an already supported SOC and
   host-processor.

If you are trying to do (1), you should look at meta-aspeed and
meta-nuvoton for examples.  You'll likely want to create a new EVB
reference in meta-evb.

If you are trying to do (2), we'll need to understand what custom
recipes you're trying to propose.  There generally isn't a lot of
chip-specific support that we put into openbmc recipes.

If you are trying to do (3), you should find lots of existing systems to
follow as a pattern.

--=20
Patrick Williams

--llRpy1Z+/SKV9JXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmVCYFwACgkQqwNHzC0A
wRmdtA/+N6xN2JCRB0uC0IqnIAyP94lsjT0uCigQYtBsIBWLzQEokSLmxehORlrQ
M8ubqqri/QpbWyIIfv7HYHsTn3NdwBuxZ4fO9JD5dsFIN+SBXmnufvtKFBalE1DF
AtmQKVMfB3bar8h3Ft6ybAwmbxGF0oVTqLKf+TWzQLPkNaTd3jCWjUmyRjb2ekD2
5L3rXxUNeVPsrYB0fMj2YtIpthO3w7nc5DyhAVOqdyu8WNmNnXfAumpkSAVse1ju
HDhSPK8no4nLClVX/K/cRcHQfRYW3naNYK+ptDwjxW9B3YSE1A6cclXr6iNI6l3l
/mvOHBdQBuj5aGrXtoVKqPQTmC3mBbC3QL7XDGpIqQbQrUN08DTGZe8HTOH4XIDh
vy5BjcjJJQXIo29kRoM0mffBO3ehL863lWopUpMltmxRDi+4VIptheLYKAnfFuDT
6fJiX+C1YdgfuDP5Ac6cimbNEo4wPCoMYi2QI6WlrfyUcMrzI5YvQbG/D9g0nH5v
UXfOql7i3NMXJxXnampmLYlFCmTz/g9W7z1I0/FYeo4lWp09DZa2+I81v4X7o0hx
fqgHgHWdpTJwTZflA7wj9+JoQConRgPzGo6wM2ypqkJU8PLjBBB3Jr8qH/LTbULw
YvlumR0ZUTm6e7iAJc3lyoj61ugC/Ubzt9WNGDblR60s6ua3e6o=
=EzhC
-----END PGP SIGNATURE-----

--llRpy1Z+/SKV9JXF--
