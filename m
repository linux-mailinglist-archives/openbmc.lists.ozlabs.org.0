Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D97361BCE82
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 23:19:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BZK60nPFzDqFv
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 07:19:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=qX3RfuEy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=lyOX6GOx; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BZJ83fBnzDqBN
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 07:18:30 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 5E0E281D;
 Tue, 28 Apr 2020 17:18:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 28 Apr 2020 17:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xngAL88YJhNtanFYusRV9pzC1nc
 LgGbUV/Fa/slJbaA=; b=qX3RfuEy+iRMz5GETLS7HzMihb/r2WKpr8Dj2mtmIdz
 SsC9KbpSvTc4tUuTdQWvCZz5O5AOFw7mjC4pCPZAKa2eHWl6MhpUYif7r7zRIMWb
 jdIrIrh0StvjtgfUDcEdRvY+3z8M3zrA1yKwh3NUamfx5JpolHfz/kl3aGCUxvYh
 3B/0p1WaI9JjmzsPrGLAQOLoTIdLl1KWbab48bodJxt8r6E9eY4r+Kg2Z2JRMx47
 rh0snXyFUsHfdPMkU8qf+rPcsuNJUxdKh7kpHVZlGezFdkHYQpPZI9vEK4l7QsM2
 fg2WobCu/dBx1A+UMGO6T9kQ9dpuOPr5r+4ZhZTsFmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xngAL8
 8YJhNtanFYusRV9pzC1ncLgGbUV/Fa/slJbaA=; b=lyOX6GOxJ/me8RGhS/Gl1r
 AZzcTsZ6+z9gbSxdqOL38u4lvv50tzWLutb+B/9zjeE+snBe1rxOwlOkzltYgZq1
 s8gdO9YW/fAbv3FmS7j0tQUQkOKXKCgQ6j2XvfUDQkj42DmhDOoIN0vbTHmap1h+
 QsKT+7HfI2/Yq+oxwZ5xSm6z1NBrZIRN/olYiMv/puVIBKjTaFu79jO7CHslfDvn
 wU9yYK2RFXL+dzQvyuOV2xc9ReoIn1iRqX/6V7E42kp6tuK40SM3foE86OZ15O9y
 PkfTR9f+p0hQKqpDMcoKycpS4EwI43WTFljtvvDSZXsTsXZfc1fmkc8NCQpuFyhg
 ==
X-ME-Sender: <xms:oJ2oXvRlyb2lTC9s6zkI3OWCCbJppVcB41WkV637E4RUugeq9U6CxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedugdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduieeirddujedvrdduvddvrddvtdehnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:oJ2oXhhwv7tIjxQZtmT829aG8rfe21gvC6z-El5X5tOrSlL53n-NKg>
 <xmx:oJ2oXg9piKQ78onbIedjdTdZLYxe5pzXAAB7h7sWUtEnhCL9xgH2lA>
 <xmx:oJ2oXgGsVIads_Uj5xlAwBuCzUYx-l1D28medaMHARVQNMtudz6wtQ>
 <xmx:oZ2oXrNHjyDFUXjGZW06MeXLUG3d12RMTntKNJ4c0wLSK2JJBYJ7Vg>
Received: from localhost (mobile-166-172-122-205.mycingular.net
 [166.172.122.205])
 by mail.messagingengine.com (Postfix) with ESMTPA id 163103280063;
 Tue, 28 Apr 2020 17:18:24 -0400 (EDT)
Date: Tue, 28 Apr 2020 16:18:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
Message-ID: <20200428211822.GA5268@heinlein.lan.stwcx.xyz>
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
 <CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com>
 <32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com>
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


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 04:41:15PM +0530, Ratan Gupta wrote:
> >     I'm not seeing us with an interface to adjust the metric for an
> >     interface.=A0 I think we need to add that at the same time?
> >
> Not now, As per my testing if metric value is not defined and both the=20
> routes
>=20
> having same metric then kernel tries one after other. We can bring the=20
> metric
>=20
> later.
>=20
> >     Otherwise, I
> >     don't think we have a way to specify which interface
> >     outside-the-subnet
> >     should go (vs today we can set the default-gateway to the desired
> >     interface's gateway).
> >     --=20

Hi Ratan,

I just want to reiterate that by not doing metric I think you end up with
a slight regression in functionality.  I'm not sure if anyone cares though.

Today, if I have two NICs attached, I can set the gateway to NIC1's
gateway and my traffic will go out NIC1 (if it isn't on NIC0's subnet).
Without the metric, we have no way to specify this behavior and the
kernel will likely default to NIC0.

--=20
Patrick Williams

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6onZwACgkQqwNHzC0A
wRmliw/7BzEXh3DiXc3D4eSYWwNUEutkX9OoryifEIzbxOM+294PM4UhzEXtFnyp
2sFAy+EN1jHjW0o9I4zgMGVWPGzdqfMBBYrgdzPhoFWMxGEYT2FATyhRBQerY3VP
Lo1uYqBqZjr5L4OsiG7T2N9w+4MIyNUUMWEo4sehSY609h573F0CppO0pGxFCL4C
H3lPOiE9lUSnrGK8f3QakEZB+0rSP8Aeuv7yP1MEAhZBWIu6/HC0KFRr0FHDrdtZ
CXAfxQgnpw659iWGbZN4ekhP8nrYo2k9orCJ8qNM/LO//LIr2Mc07u/hzlHt6VpW
w289SBLNuKIdpOQIj+uUdFvgkHDM8OG/rdHOfABzWJIMHBBicGawnJh/t9rMTyo/
pr/N45b0BILoyWJtFQBHthaFsjmipF9IqmW9psXQ/MdTxf9KCNLEfR6RwtF6xNzj
oadporh1B9bH9TWXFFvavxBcTtfXct6ooYjmGo1eMWFQzua6daNX26xTUndYiHdE
jMfZMM0J+GZIPZKRgJ/kzUnQ0pDPdKVxOKIpep7+lYoPnyiWsJVN9LegBor9mdxP
ae9f50ep6BuNwsKrYh3PDvRSpK2iwA6Wx3rXpOYX2CfBCCWqsOoNudt6+HNT875F
Eh01g3L/X/4QmLvSyuRfHK1MXOXpgfzeJM22G/GtDIltmCIZvKU=
=d8Qt
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
