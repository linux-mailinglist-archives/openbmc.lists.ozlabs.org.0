Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6CD2879FE
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 18:32:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6cF66WjWzDqX8
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 03:32:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=a2L+2CXV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=QBPack0v; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6cDD2D1mzDqWm
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 03:31:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C3A1E5C004B;
 Thu,  8 Oct 2020 12:31:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Oct 2020 12:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=1MFOe1Z6vw2Y/JLMad53eZpvlpx
 p0rRxhXMqar5WuI4=; b=a2L+2CXVmaMbqJgk3iaBhRSOu1OwCzHOay1GkSNxFFw
 g5uiX2aMcMfdS8YHQFz0gXx1taMCKHZWdvfnT19w8wTPgsMTyorztlOqSS/DYdE9
 Pc7LnHY4yMfS0Dm+A1xdYvgXUtOw+KF9wgsZV9fC+CHkM1928wPMjxSkgMD/yHXJ
 7PZL9qJsaJy1xPD/MyyF643TcPSWCFYUO7bsglzCvp4cANdycnj/gmopjHRahWc2
 wkhFkrGsxaig/NfeBkEv79XxMloQCvxwzddmNCHSm+Zb9LSriabsQwIzOp0aXa5I
 14sZOtyNz4j3gazmmEt69jZZWKTQxHLaOr5b6lK3pgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1MFOe1
 Z6vw2Y/JLMad53eZpvlpxp0rRxhXMqar5WuI4=; b=QBPack0vlPcHxeN236Rlp4
 +PBhCPTZt6S09w0EsrRmeIyNV4Hq2gQ200yCEhD884VpM31lq1aNhoiOcULUYEdB
 vMSaQmhwWIRceQMGIXG4EWC+jjnpLLFa6RYAUDuIfHkfHpzrR9SzwJCQ84J+uvNZ
 ALlW2IDGaJQqFFXEoXzvhbhJ0Obo01mlFg8TuU3B8RJFEsCKSl3evtzYOzoy9jch
 ejOg1IYxPgoua1xS3EBf+mNTvWYbkivSg3OYHOzciIWK5vUIYrqI7qj3Pmm2ElvY
 +qL6Q/8dwfCYfehfvA2wiI+0U54cTh4L4HPufo/fdhm0TYcYx9O8JjTWvW9FpQQw
 ==
X-ME-Sender: <xms:9j5_X8W17uQM4JZCuqFpplHCL6fW2Qb9_vrZoHsxzjlKt1CxD3Gg_Q>
 <xme:9j5_Xwl_hKDHEAdbHvPD7YQrAnD_3-a03Or7jZOIX3C0F9GY967qi4I6Hb8rDlmX-
 5L1lHPH9dQ6pL0CS5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeelgdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvfeelkedtleejhfeitdduhfeviedu
 jeelheektefgieefiedtjeegvdeggfffffenucffohhmrghinhepohiilhgrsghsrdhorh
 hgnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:9j5_XwaFOETODqS0SmOu1Q6b9p3SY-13IzeqlTgujQd-1VqBzPk2uQ>
 <xmx:9j5_X7Vz_-1x6Ie9zDUXblD7gk5rfGK2Lq_vJ_gBnQalMneR5FGRzg>
 <xmx:9j5_X2mm2LQimIhOydAtLVeTwAP0opjcFC9ywt_1DYYliuTTNW2W3Q>
 <xmx:9z5_X7y3QOAnr4ohJl2PzuHXZTUaMbesZnrIKPfVPBMlyIAc64xwHw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8AD963064674;
 Thu,  8 Oct 2020 12:31:50 -0400 (EDT)
Date: Thu, 8 Oct 2020 11:31:49 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Subject: Re: 12v slot AC Support  in x86-power-control
Message-ID: <20201008163149.GM6152@heinlein>
References: <TY2PR04MB3311FEF038529B122E1123DECA0D0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <EC03A9B2-FE8C-499C-B456-E76EE677E28D@fb.com>
 <TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0@TY2PR04MB3311.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NqBeRcvybb6C9jMF"
Content-Disposition: inline
In-Reply-To: <TY2PR04MB3311145637BFB1FAB1CFF2C4CA0B0@TY2PR04MB3311.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "ed@tanous.net" <ed@tanous.net>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--NqBeRcvybb6C9jMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2020 at 01:13:49PM +0000, P. Priyatharshan wrote:
> Out platform is multi host system and we  have the host as FRU and it can=
 be plugged in to a slot. The slot has an option to control slot power and =
this can be used for a AC cycle.

Priyatharshan,

I'm still very confused by the word "AC" here.  I know your server
doesn't have a single joule of AC power on any voltage rail.  This
server plugs into an OCP rack with a 12V DC bus-bar powering all the
servers in the rack.

Vijay implemented, for Tiogapass, the 12V system power cycle.  This,
in hardware, uses the HSC* to remove the server from the bus-bar, which
power cycles the entire server including the BMC.  This is as if someone
physically pulled the server from the rack and then pushed it back in
but implemented via the HSC.

On the server you are working on, we should have that same design for
the "full system power cycle" which interacts with the HSC.  This should
be done the same way as what Vijay implemented.

You also have power control to the multi-host cards which feed 12V to
each of the compute cards in your chassis.  What I don't understand is
why does this also need control of the full 12V and why is it separate
=66rom the normal "power on the compute card" sequence?  This "power on
the compute card" sequence is what is suppose to be modelled by the
'chassisN' objects referenced by others.

Can you expand on what the difference is and what functionality you are
enabling by having two different slot-level power controls?

> We proposed  a design to add the slot power control in the x86-power-cont=
rol.The earlier discussion can be found in the below link.
>=20
> https://lists.ozlabs.org/pipermail/openbmc/2020-August/022481.html

* - HSC =3D Hot Swap Controller.

--=20
Patrick Williams

--NqBeRcvybb6C9jMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9/PvQACgkQqwNHzC0A
wRlKsA//SH1EDusLiZwm0u4ZfBp0u2u26fHPBPBs2QWJWV6Rrxh3taLJFEb9yM8L
opezZcn7QUSp1CIZOuN/48S8nHLOrNM131e5OrnEC9khtFv00/hHMcUjudEpfi7n
3TdElbAg0KlwfQq9sj1fBBeBfUv8TGeCwireRfxkAbB6hhGxg5SUc5/I7+GeEx8Q
eBsZdH9wwXmHVBSA13owywr1NVBnrjVDsoKC6UByEZYNUZyRhP/wp1y03HRnE+/A
tjB79ICariJGn/6lfIPfBias5AEOJWf2eZvxLbgEeo+gh+QKkZs6VsaVFba1TtXR
b+AloAJb5ag/RNsPGc4L0b2SZ/bV/GspZQx/AQESP/ikgpba8sLTUuqGnObTDcUn
2YiUFTSba8um5z5F49EmdraH3NCxnIgLnrXHpq88tsGZDTlyk9ikhrMKEW+xZ2yQ
Fxc5dITihUAUlOSjUn1igpmavhHOWSBVylV/4PHt3q6RExh5V7Ujt15Wm0natb4d
plWjjGHh2Xk72iIwIcIqmjSJPI8vUKkJB/rrCYNpeub5N0m40U7rs0xVJuLq4xVM
DB3F0tMM/HUmAD/6q9U4uyLcA3DO+wzs7U+jkNJrWSe5BsxXshAHUxB45BmD7mss
d/duFLaHs/kMEdpUUc/7b96Ot4YqPf+bn/Ap1+fBMvsElObWfUE=
=EsfO
-----END PGP SIGNATURE-----

--NqBeRcvybb6C9jMF--
