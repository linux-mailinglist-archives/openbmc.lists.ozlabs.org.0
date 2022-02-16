Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197E4B9305
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 22:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzVvk6hCcz3cHf
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 08:09:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=wkxQKvcn;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HxIdT0OC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=wkxQKvcn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HxIdT0OC; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzVvF1XsFz2yQG
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 08:09:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C5FB932020A8;
 Wed, 16 Feb 2022 16:09:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Feb 2022 16:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=jkLMflRLFmS5w4TuJMgOW29qje327xPFMKHs+m
 crfPc=; b=wkxQKvcnM8rEMscIDjPOnC2tKioBzP6cyr/qseIq4e6m+ppFZrbeXo
 XZiExG4UukoK7GKecjYLdEuVFkShF5/GrLK+SFpRzAb3h8KjZnDu4Qb78mJzghMZ
 ImFkY8FM1wLs+M07WMxfLaNI3QHegX5j+Py3pi3oZvPNQNtNhy+WCCSU6dWjqGUI
 GZ6NETaFLDQhUP1mHMIWW+Qt+m6JOaGzUfe0BFpm1t2YTsztL2bL6thPKSZiD51L
 rRZDCXGN/s5qqn9m0mFASdJi1Y+ukMXBVHUtdbuidJMCswtZhiRifFIHXnsWYybm
 m2ulN1dQsRzkdCswbisLZ4v0nzNxn26w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jkLMflRLFmS5w4TuJ
 MgOW29qje327xPFMKHs+mcrfPc=; b=HxIdT0OCQ1iUim8tkFjDL8ynDPFdIE22v
 OJVP5VODr0VTlSw3HaFLUVAvB7nXliAIj2E1/sao0OV0cLPZe6Jgpihr7NQWbD/C
 LLdoNkqvOm3fzc4By9zeJJZTUtOr9PXpnkXpsbrVGBlYIYnaNFmRPx8HVQFJyZO8
 LgrKkX3pY3tOYVI5Nyz0dopdSwUGMxnBvTC1oUKXnUpvFLVVJUqOhEyXgncS3TY0
 Wr2sHlnogDLSWB+EfAp2Kqr75i7vUn9dsYvz8M4Dgkf/8h1AaoVDdoVqbXnqUrr3
 Xo/j0HwvUTDKnMu0O+7/YovklSxsJ0XwNFu4EQ7Ne/FxOKb3swvRQ==
X-ME-Sender: <xms:82cNYvzrwd-OUjwFn6hQdXuE7TlwC_JnxuF2MoeZMGkmQ2gHTmDiqg>
 <xme:82cNYnT-29uaSd_j99F4kBNK2KlfENS0-4aCOIqiFHcPVuCrmoduSedXjQmPAM6sp
 q65GfUVKXsAgi0S3AE>
X-ME-Received: <xmr:82cNYpXnl2Vc0UwxivnT7TvGAtUafCrBB916bTYwRurIZWCFx5Pn5s-azq-WUZPAXt4Wg--0JCoRO6E4pDCtGWZ2Her23uWM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigddugeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueej
 hefhtdeludefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:82cNYpjk_LPgBvpeIHR93n064CnIIVvogdFOCaNArduRsX8j-o02nQ>
 <xmx:82cNYhCpcaATOnmizyjTGMkhuKKSA-y8WmU9y-SsLSsOXRC5Mw9L9A>
 <xmx:82cNYiL476k_wjGIce7MQ7GHKq_8QWzLeC2we0eLTAO8FmuaQxCnHA>
 <xmx:9GcNYu7q4tJ__gQa5yGqFA8faBxIE4wwXj2Wly-VOxjxEvOvkK4lQg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 16:09:07 -0500 (EST)
Date: Wed, 16 Feb 2022 15:09:06 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: request to add Gilbert Chen to CLA repository ACL
Message-ID: <Yg1n8r9QfhPwHkHT@heinlein>
References: <PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
 <af16b2be83e516ee1315ed6c238e98384fdf473b.camel@fuzziesquirrel.com>
 <PAXPR08MB6560E663519DBD5399A077CB862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
 <PAXPR08MB6560715A7152F90C9274667B86359@PAXPR08MB6560.eurprd08.prod.outlook.com>
 <20220216175620.qwdoegm5d7ja3hof@cheese>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2e3b8D1+toQ6e5mS"
Content-Disposition: inline
In-Reply-To: <20220216175620.qwdoegm5d7ja3hof@cheese>
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
 Gilbert Chen <Gilbert.Chen@arm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2e3b8D1+toQ6e5mS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 12:56:20PM -0500, Brad Bishop wrote:
> On Wed, Feb 16, 2022 at 01:48:55PM +0000, Gilbert Chen wrote:
> >Hi Brad,
> >
> >The change of openbmc-build-scripts has been merged. My gerrit account i=
s also in arm/ci-authorized group.
> >But the gerrit patch I submited still cannot let OpenBMC CI work for me.=
 When I push new commit.
> >The change log of gerrit still shows "User not approved, see admin CI"
> >https://gerrit.openbmc-project.xyz/c/openbmc/pldm/+/51184
> >
> >Sorry for trouble you again. Do you know if anything I missed?
>=20
> It is no trouble.  I forgot that Gerrit creates private groups by=20
> default, which would cause this.  I've corrected that and it should work=
=20
> now.  Please let me know if it doesn't.
>=20
> -brad

I retriggered Gilbert's commit in Jenkins and it appears to be working now.

--=20
Patrick Williams

--2e3b8D1+toQ6e5mS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmINZ+8ACgkQqwNHzC0A
wRl5fw//UbXsVC59Q2AFIdQi4TVKrN6Z+O3gVq7vsNl7q+xVul9c/YaGNYSumDr5
nkhoZ6VkVh9OKnP/sL7WFIL3cTpJPxQ8gNW21YBwdeJbJxN4LLVwsm4sR/l8yJEL
9G3zFiATW+Joj4EsPnF0PjyNO9XcBjvzSriXbRXTq9HtKC0HFWsBbvVRomI9HHpF
OeHO6u1kmRlX7uFBcOpSbmX15k4/YFEyvyH+gk2t0zg0S3UvuKLqXTz+rcEcrhwx
xaCLQuR3uab2gJU2oAeXJboSad3h5Hwo6M2G7jrVoEqEPmiXKWokobqs3/88bE/a
STic6Y+cxYIrWU8yGiJMU9RT4LVesYK2jI562lqUtTH+Cy2SGWdFsaXFSx1HpvGn
B/Y7nojkAh+28czg5VkcPix/VSUg51PWcexbMC3WrOb4hoba1rM4Fbp6sC7t67wn
1VvFqkdmj7dnSRuDM3Q6Q9b1nm1XZNJn0U6A5bJM7U+uUJgVayuS2C1wcEKGmnmH
2ig/dWJryLrG7v6lOFxK+bVkJ3zAwp5M/hrH1/X2PNRUeE64kJ3BW0ccTJlTH8n3
RrUUH32kX+xogszgS3HSlW18gCCXxiGKnIBdmWqZdeINxJnKJ5nGfrapfh5ckrkN
OJR9UeFS+N5nKHB8RpzMqjOPCGobdBT5BUIAMxvyYR8sPqtHau4=
=QsJt
-----END PGP SIGNATURE-----

--2e3b8D1+toQ6e5mS--
