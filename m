Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED236FBE5
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 16:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWvPL5SHNz3035
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 00:09:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=OmWnCD83;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HVrrXV23;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=OmWnCD83; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HVrrXV23; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWvP55DTvz2xfY
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 00:08:57 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F3385C00BA;
 Fri, 30 Apr 2021 10:08:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Apr 2021 10:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xWVu5ru6cwqWgkj/i0mPCMTxOOm
 7rtII4xtS6PwjDjM=; b=OmWnCD83GI514K9mfo+WmT/HPY9b4moGPwuMHCrUoou
 H9M4bVp8OxUYEQV68xw0UOuKzBPEs0fTBVjJBog2zdsqxltxRj9BUgU3JWDqS22k
 C9gbAipQEeJqmRlolhgAYAhv/e8ou8VYJDErOt7ecThuV/3DZlyusFqrVXhEQlOG
 f9Hp36PdZegp/vt92cMzNH3N0X2i+ZJou92LEm7B2s3ir/iuOTtbttjuHcyrJV1b
 2JYAx8YXAr6yEkoZI3+v68NKBaiO41oyQ2K0P+XObvWZ6HgmfCUPgm7WINyqF26L
 hXitkvwe/shc8N7qBBg7S3cWbVvotDvzT0aYU8kDAMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xWVu5r
 u6cwqWgkj/i0mPCMTxOOm7rtII4xtS6PwjDjM=; b=HVrrXV23rQtNEAmmb9XaRa
 Z7rQ/1CYAe4pa71B8FR0eka4RDW6YQgF5VAmfNCJ7TG2DVZw2ikj3TPb6bK6b8w5
 sn/HOK+OyYWGEWSMV4no8l5Wv4Ao9VUtzBCBbUQPAdApIa1MtqauR5Ez5ZHRtIDy
 a15IAfhI9oUriwDhMxa3LtalP8n9DNDi/YCkP7zXxxf+uS9CH3FWAGyNnyRIaJTV
 3M4JEor7SNmL2HvhvRaAlEjajaxPrNbsQkck+BhZOoY7Ar+plaPogw/n5GeiQj4H
 C8+20SSRAO4idqNsJ1aQcpZDCIKtyYb+M/owzxo4wqtBA5RFr1BEkF+4ki0+0Xcg
 ==
X-ME-Sender: <xms:dg-MYB2RQY1MCE9UlzufF8bobx27hTjIQh0-to55Z6MGI2yInoRsfw>
 <xme:dg-MYIHz_EGADxHAQ6zcw73D-AAFhcZ8V-_HjA2nHorG3-Z6JLarLZPaRvvj-btX0
 Wt7qhr8BhyETlKRahc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:dg-MYB7sxatdLG_6kQ_KkLCP9m-96bd6dEhHiFwUuA0aZcf5yb1bIQ>
 <xmx:dg-MYO3o8-lisetBdv3zwU1dQ6dBN_o6fhx6Yxh-acEwzjs8ecfGww>
 <xmx:dg-MYEHf3jyi4w6i7k82_h5DNnyPBb_DSPiKW_Bk8jI5xIIWyozHKA>
 <xmx:dw-MYID335lj_frYK6V1VMOugdbgWkue8v29DHOq2_WNXgCWCKUN_g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 10:08:54 -0400 (EDT)
Date: Fri, 30 Apr 2021 09:08:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kumar Thangavel <thangavel.k@hcl.com>
Subject: Re: Include sensor monitor for our platform
Message-ID: <YIwPdXmVD5CCJWzX@heinlein>
References: <HK0PR04MB2964D4D925F6883DF2342D48FD5E9@HK0PR04MB2964.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Oo4BS6XnxmqyCo5L"
Content-Disposition: inline
In-Reply-To: <HK0PR04MB2964D4D925F6883DF2342D48FD5E9@HK0PR04MB2964.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Amithash Prasad <amithash@fb.com>,
 Manish Kumar Thakur <manishkumar-thakur@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Oo4BS6XnxmqyCo5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 09:37:17AM +0000, Kumar Thangavel wrote:
>           We wanted to enable the sensor monitors like "ShutdownAlaramMon=
itor" and "ThesholdAlaramLogger" to our system to monitor the sensor values=
 of our fan.
>            These monitors were created under phosphor-fan-presence.

I don't think there is anyone using the monitoring of
phosphor-fan-presence with the control of phosphor-pid-control, but that
doesn't mean it can't be done.

If you look at the phosphor-fan recipe you'll see that the default
PACKAGECONFIG is "presence control monitor".  I think you'll want to
bbappend this to only enable "monitor" (and not control/presence).  This
should configure the package so only the monitoring parts are enabled at
compile time.

You may want to cc the MAINTAINERS of phosphor-fan-presence for any
detailed questions you run into when giving this a try (and copy the
list).

```
M:  Matthew Barth <msbarth@linux.ibm.com> <msbarth!>
M:  Matt Spinler <spinler@us.ibm.com> <mspinler[m]!>
```

--=20
Patrick Williams

--Oo4BS6XnxmqyCo5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCMD3MACgkQqwNHzC0A
wRlKmRAAiND/oWI6g1fX/wRmDC9EG4hA4W0y/kmfjUtToe6iDFztaO7SKXPe5a/I
dCKqPYdV9KBea2Ls1ruNJn5d/vzuc2XxKeVQoTxQSUiAyJ/R0PxSAmoRvUnshoJK
0ggIwp/rCANDUFkzMVlxOyquDeISQaerGUWIKIe0++H6qs/7vStZ9WIrgUMKMf51
1JPot8H9/rOIFk/IGwxAtvWSr62JkFd9WDPvMAmZbrlsi9ifzP+nsFA9pRGENOxU
ZdFXbfcDyxjghuEEyW1ZBzkF/KG+8Rf6GRrVMT3VTx5EuXczl0tpn96++IkaYTIJ
Kn9bxr+fERju+DF0S8XpgIO3Lcj3Q1kx6Uv9d47suOsK2PBAOKi6XL23gd13+82M
5c/0DZwTuSyubmPSx1Cz84XFCcarUHeP0dx8M0hyzLzjuqrc9lAEWjmVr8LjObh9
p91ouSYWaW6Oaog+5ISJhlFGRtCb8ZMFyTppkIcJgt/1Mw+8+QLLnCxT5pCwgu9R
1Nq6VMmOijr+dR3eiamGFwWM+jyYokTLPL7RGp5IM1np/CBO247QwaSnkXOlhMfw
yK7kc42IMYyJJt3X/98NAC30sGNkgjLFAM1ebqXOsLkpZ1RAyxUUWNie/vpAZgCl
97Ennu+Zgr9pAwvbuBrRXLfVbTZ2q/cQkFznJVVQrxBOrXv1dBg=
=Zmkz
-----END PGP SIGNATURE-----

--Oo4BS6XnxmqyCo5L--
