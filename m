Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EC7289234
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 21:49:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7JYs12jNzDqbk
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 06:49:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=0jk8Lf+c; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZiqqNbWe; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7JY24BM5zDqXs
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 06:48:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 30AE45C012E;
 Fri,  9 Oct 2020 15:48:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 09 Oct 2020 15:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=VpkMWmzPhYsTc2plaZnDnj+g2P1
 E+8vwXE6qmCAk2BA=; b=0jk8Lf+cXGRd3G6pDh155fIjibXLoIzCZoF58WEI4uI
 7bN/mrObGu+l/YaDhxuEOnIxwIVCFoSQv9aMFC2i+dkOaZpOmS8N4yfsci8F4a1p
 9kalwk+Jlktf/cqA6f6rl+D60jR1eWFS/sX+T6MJIt/i+jtxNF1IBKW5Gsz9zU8M
 i36MvqljPGYIx+CyrC9N06N52vDqykUjV0Hweu12e/GpbWab8pz6g8xHEfw79tOC
 IM5R+tHPvAmL9WG9gbCTIFTk/7aFy7fE3o2g0J3B4Uy/iYq8wIKVSqqBtAS1lPcF
 u1oJ7PGTUTs7/xDKzbNLUh3sA14K3U3xFSUSXEl2nQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VpkMWm
 zPhYsTc2plaZnDnj+g2P1E+8vwXE6qmCAk2BA=; b=ZiqqNbWe3NpZynLjmXKOD+
 S2ax6IGvhZpsMBm5aRiyKm2jvA5Bpp8BchDVsGztq4WrajP/0oAmDJQQbqrFD/XV
 Kig6U3/kOfkP1MVO6NAA4wWmREcC6VUSut5BpL08ye9YzjFMWeXqw5dgffaqiZ1T
 Dpb4U5IwGIKkV03y7T7qRCo19KOPOUjFj7kDvotDpjLLJMNe5bZ9g3uhLQiIEgky
 RAHFn7Jg0oqI+mk2ZmQdjcFKrXCWV1VU9XOiIad3MxHiUL3zMYwsxyJJA0mmpO15
 mMEZjN18YuE+ezhiiVx5LdgQZedPiRPIH4XKO5WclEGYPxOC11gRbPGdPY6eBIsg
 ==
X-ME-Sender: <xms:n76AXwHjtFyZQfVYQG2rmFoe0GVU8UAuMbScswwrTN_LIM4Ei0G9YA>
 <xme:n76AX5Wp2Wf48V6IgMM3YJuuX1HrHqNBwtkWAXTcdYGtuvyBqlkNjYU_D8Qq7_0qA
 VUJ8KEc41no5JUaK-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedugddugeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:n76AX6JqxUj6m4eKk0jUXFZXLtoSWyoOxkyBZprUV6pO1qxDwNHfLw>
 <xmx:n76AXyFfF2gbbX08zsNJG_CDxwAOUJkapZKNwlfcf10GqbMUVYCwog>
 <xmx:n76AX2XrGt6cHVDC78lRRE8lv4ThjOJR96lkqQHHQkBN355_NsD4mA>
 <xmx:ob6AXzggENeTM2QY-BUBQkNHfOWOgKTFtsuu6wTUn3SM0OV4FxEKxA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 452C73064610;
 Fri,  9 Oct 2020 15:48:47 -0400 (EDT)
Date: Fri, 9 Oct 2020 14:48:46 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Subject: Re: 12v slot AC Support  in x86-power-control
Message-ID: <20201009194846.GN6152@heinlein>
References: <TY2PR04MB3311209CF7859852B33802E8CA080@TY2PR04MB3311.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ubLUeOwAbUG/ZPBB"
Content-Disposition: inline
In-Reply-To: <TY2PR04MB3311209CF7859852B33802E8CA080@TY2PR04MB3311.apcprd04.prod.outlook.com>
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


--ubLUeOwAbUG/ZPBB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 03:49:55PM +0000, P. Priyatharshan wrote:

> The earlier "power on/off/cycle the computer card" sequence will only han=
dle the computer card portion of the host.
> But the new feature [Slot on/off/cycle] will power cycles the entire card=
 [ BIC + computer card portion + rest of the hardware in twin lake] for eac=
h slot.

Got it now.

Take a look at [1].  You should implement the 'chassisN' objects (in
x86-power-control?) to handle the normal power sequence to each of your
compute cards.  I think in your case N =3D 1:4.  You should also implement
the 'chassis_system0' object, which will be a full power cycle of the
entire system.  Finally, you'll want to implement 'chassis_systemN'
(again N =3D 1:4) to do the slot-level full power cycle.

1. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/State#chassis-system

--=20
Patrick Williams

--ubLUeOwAbUG/ZPBB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+AvpwACgkQqwNHzC0A
wRlCeRAAkrEIhF0aTb8TXsZmVfzoJgE48f4cne9naYWYSId0P+BFMbhW+ywOIrj0
bn25zFKGjF0moLrPvumkwmgUSkxEo+15qQZ+O2gFGpa2y/x9jrF6IYbMNICXRnRZ
4FhrSgR2E/F5GUVb7iPVq771li8+eHc/ymLbrJUFY8IWybNDln822/9lEA0uD2+q
7F7rZaW/A5eVev3JKdd4mZqVQKkRLY5cCJEm6FzCjfKd6+7Ljz8bg0ZTo3KFQMTi
Y0k3nEUEsowVv/8K7gP4E+1LW2oNDA4pIwVc44eQM4tUEv2R76Gick3/sga7u5Nw
Lr6CgJpd/mTOwMYxkbaKuN6fndyeXHx/xYh6alfR/ZBd8E431rdPorauvaBUBfak
iR0+I89bRi0X4ZQ6HTPTYW/4XE17iBHH0yR1oSDMLXbbcYtA/vRx9sdyOFJ8X2Yc
4zQETVNbifL6eFwT0KPXZEJ3LaKBmY9KRBW151vtq3Sw0HFEhrJpIS1nDR2jStIs
TttiShPAzxnTaeS7ySgBJZTmT8ghF4vmUxEi1CMg64WQ1+8GveKiEF8Ubbjax+C+
1zIUcM/PJNrZThIERnt2grVeUGwvRML1KJKIpZxkOn4oF94bhTecSMO5487Cay5/
2iKSYvHueUOvOfKMJo3PgNJWfx3HLsaapTSgUVgPb0oXGS+COh4=
=M7JH
-----END PGP SIGNATURE-----

--ubLUeOwAbUG/ZPBB--
