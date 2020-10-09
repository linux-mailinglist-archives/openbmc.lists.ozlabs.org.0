Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDC02899AC
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 22:22:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7KJ41LQBzDqJM
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 07:22:44 +1100 (AEDT)
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
 header.s=fm3 header.b=dgS7o/Bi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jEhDQm1i; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Jby0cNVzDqbf
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 06:51:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B42A5C00B9;
 Fri,  9 Oct 2020 15:51:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 09 Oct 2020 15:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=98eY1vLG6Hv84oxRXNlNFiMPvQ+
 9Tz0GdExXSDni6+w=; b=dgS7o/BiVHlbm88v3j3dkgDr/T3ujQnEEdvytYqcL43
 zeUawV4fWXjGJo0oc4jmToZ3IlqfJ/+YA+soTAX5HAdA25CMQkkbCyIrqq7jru0X
 VGRFZzUVLsf1CEtsZpRBIJ0KrmmMoycM6sFwHd/uiHUkUEyidGnKF+rpdZj0wSfB
 ygahiSO7p//PW7MTD+KJFhCcFTKz6//kh9xorCm1goDelr72FjLunBCMuGGrLCbV
 OrqAcMJveg2l3s8JMNZo09z0AM0e4/ZEcWRB85wGRRfOx6X39yVxhmb8rpHkv1yD
 GQ8PbdQlpLxIqc58hNvG7Qb2MOixfEqA8K1De3+y6Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=98eY1v
 LG6Hv84oxRXNlNFiMPvQ+9Tz0GdExXSDni6+w=; b=jEhDQm1idI769vBMmhhZNB
 YOg8MdaedH63XGKvnBkGOuWpGD5+0pHMD4fCaza6Tbx2TctG7/8ZN7JoUFN8Gb3d
 dq7qPmGPtUPSgxSrkYuA2RSwK+f2Gb77iKZi8cK2g+YAV4m8BQJreWwUwrdSIqqB
 4youZfp7of5fOL+FT9wLWzn/iVNJKWh+iJbtBIPH4Za9cBJXE1zdKq/3QyVvcqQd
 5a2usAKN6FYl+R9dwHt1/i0da1lvjCBL0475c1GcvMZqXMWJYmzFEMcmt8FbxpR8
 nBGMOLY5LaBZEFqGBDH7602/D+pbrIk85vTKJejHglIDWIv2bUfQYsgVPK6B9MZQ
 ==
X-ME-Sender: <xms:Or-AX-jRDN2qW4ALDMteiX7ObMROGVAcrvLb617YRLqzbLdY8DOYzQ>
 <xme:Or-AX_Dr4ZwYdv_2rD9Ssr8GBLUxb1yk9m8OHRiBB2rQ9NMmIf-s4vj_6PkweXtLY
 249SiwWa9-8JLfK--4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedugddugeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnegfrhhlucfvnfffucdlfeehmdenucfj
 ughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomheprfgrthhrihgtkh
 cuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgr
 thhtvghrnhepgeevueelvdehhedvvdfgheekjeeluefhkeduheeguedvtefgtdffhffhtd
 ekudejnecuffhomhgrihhnpehgohhoghhlvgdrtghomhenucfkphepjeeirddvhedtrdek
 gedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Or-AX2Fty16SkG4PkV_WXIEWPLL7wNfYtoteXcuqmXp6C6nmWZyqSA>
 <xmx:Or-AX3QkMlm2L6c9ubta6_I70779GalHkLISXuioHQ_sbC17BARJ4g>
 <xmx:Or-AX7yBTXak9tamO1GsPFkruOjp8mXxW1lC8AwrUM414yvAfWkZEw>
 <xmx:O7-AX5Z1esfcKcvpOxDwgsJ8advlHGbCneOYP2dRLkddNBqf8khAkw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8AC2D3280060;
 Fri,  9 Oct 2020 15:51:22 -0400 (EDT)
Date: Fri, 9 Oct 2020 14:51:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: OpenBMC Learning Series - security
Message-ID: <20201009195121.GO6152@heinlein>
References: <DDAFCC55-7CF7-469F-B3AA-F61459CCCCF3@fb.com>
 <4d47eaf7-286e-b31e-acbc-d26f850b48f1@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hR5hZbB3sAoKVpMi"
Content-Disposition: inline
In-Reply-To: <4d47eaf7-286e-b31e-acbc-d26f850b48f1@linux.ibm.com>
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
Cc: Openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--hR5hZbB3sAoKVpMi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 12:33:17PM -0500, Joseph Reynolds wrote:
> On 7/24/20 7:13 PM, Sai Dasari wrote:
> >
> > Team,
> >
> > Thanks to all volunteer speakers stepping up to share their expertise=
=20
> > with community. For speaker convenience, the sessions will be held on=
=20
> > two *TimeZones* (USA/PDT and INDIA/IST) on *Thursdays@10AM* starting=20
> > from 8/20 onwards.
> >
> > I encourage you to take a look at the shared doc @=20
> > https://docs.google.com/spreadsheets/d/1RRO5cgutKE7zRPcjcFjrNn-GI5AYoW0=
FivEZJe_EyWs/edit?usp=3Dsharing=20
> > for more information regarding this series. If you would like to see=20
> > more topics (either as speakers or new community members), please feel=
=20
> > free to add them for extending the topics in future sessions.
> >
> ...snip...
>=20
>=20
> Sai and the OpenBMC community,
>=20
> Here is my big-picture idea to organize OpenBMC's security effort. I=20
> hope this material will guide the project's overall security effort,=20
> including the learning series.
>=20
> I want to take this process one step at a time to help build consensus=20
> for my approach.
>=20
> My big idea is to apply the world's best publicly available security=20
> schemes to the OpenBMC project.=A0 Schemes like Microsoft Security=20
> Engineering, IBM Secure Engineering, and the Common Criteria evaluation=
=20
> have been developed over decades of experience and give us the most=20
> complete guidance for the OpenBMC project and its users.=A0 We should use=
=20
> them.
>=20
> Does this seem like the right approach?=A0 See discussion in footnote 1.

Hi Joseph,

What I can't tell is if you're describing the current state of affairs
or where you'd like to go.  My impression is that these education
sessions should be more current state of affairs with only a taste of
the future.  The education sessions are for people who have little-to-no
experience with OpenBMC already in order to make them more productive
quickly.

--=20
Patrick Williams

--hR5hZbB3sAoKVpMi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+AvzkACgkQqwNHzC0A
wRmLPhAAkz/YsJ4Rl2iiuWkB6jbvo/EUT8qm2WSTDBUTqrO0RszyP58UcCMYvfNw
ExWAIjL5Y9qtWYEYckI6txOULP/9bxxOh0pQxVkQKVP1md0E+1dVpS+rOgTVqlqL
bNapWcKe48d5O/0sFsjnX9/jG5tiRt9FOlYv7NnbPmzz8xQA9ZIR/XlQQL9jJVc3
hYeZde8rGPl7HLQdeOLoTZOvAGSAbQR7ySoREDwtfzZYqx5Nj+ZnNthRu2RUeonc
v+ZAJLe9AJ8UWX80VSURCA+yHlrbj+MGw51No12X/nkG+6nuwEiiuiCU7s6XSkk+
MFqwUpurZFeJ9MehDFF9K8VR7qoadC7yKQnz87DmwBm8QnUSjl9x1EexHyg+QqTb
O21QeBrNorf+jl6KWaRTwZ6QtMj4xyZFUS6B2cXywsIbliAh9SGU6NeBtyNowSj8
kYyaTpOgJUkP1O1rgWuQVXSw28V5z5yVOHEV+vOrtQGlcYSgkcZBZvh2TOkbrsGD
nJZrehcWAE+m91G/2mU1aHs8AAk6dtGA2iOZOmGc8g/Tu2/yiz92n5RB5ZhQiM3a
m73A/hK9jqOQlBYu73KBUPvLGd4IGKS+rztTohJt16ad4a6BnazqEAtg6qQGUiDF
7u+HiEf2w4iBOiC+NIzd06k0pz1L9+XzvOACmKrDEMlWW4SpZxU=
=Y982
-----END PGP SIGNATURE-----

--hR5hZbB3sAoKVpMi--
