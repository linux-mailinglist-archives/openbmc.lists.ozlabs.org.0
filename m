Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74244A4985
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 15:42:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnW4T2dGrz3bPH
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 01:42:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Cac3ITSC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZBJzAfUE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Cac3ITSC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ZBJzAfUE; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnW3z6vYPz30Mr
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 01:42:07 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4F3EF32009F3;
 Mon, 31 Jan 2022 09:42:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 31 Jan 2022 09:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=qupwSld2ya6UMVqH8JAKoHxs0rpGV1IKA9Poqd
 x7/zo=; b=Cac3ITSCJaNILS9/PYdOp3J87Evw8PVJNrLlyuukqZvTuRR9J03ps+
 ZhRUtqt6jxyula5b3hpnRTqYUMFPa9RAF4c9hg1SgJMrrBSPf28FBebuW8FIboJo
 GD+yFOd/iUVOhMjOBhlDkBTlIBWfEbMuKV+3G2WWvQnJOshGCIxeShMQAZKzKPNz
 bTZp8MpicH2DglxUN3q4k2NtFBgMF0urQwSdBABcVqct5gCuZiFCLwPlmWF473Kq
 G1UTTVZJVD7xHtC1uhmQj84kTUMJv4Ddjje4eCw6QVebOOhZ69dg1AvW31BMzJDn
 aT8n0IM8Ld7oC1tXTZmwunOJLM43ZKtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qupwSld2ya6UMVqH8
 JAKoHxs0rpGV1IKA9Poqdx7/zo=; b=ZBJzAfUErFY6LcgqwfuRy9f8fHroXe93T
 Y1EuwDPuw4CUHtfBwHql1dLp5rHIrZcTk483kiMuyZgJXgo4O2AVj0JdmCHxOmG0
 iBwiVkuydwTGsIbBvmlvduDkkdamvC1ScZkHhdh5g+3zFLYsBMfPx4sQkTp+XYso
 EWK5VYUxE3k52YNxz624yuxYwV1pOs5nv2t8kCBqybyXukPbElnzwA8ikpwJhzr3
 DqqhrHdPrDE+O1lu+8f7o4LqnojhELysXT+5sLwcsxfEPhGAb9c1AFLUyidHYRMb
 hZ8r8oKLsBaU53QrEoYDJakBHFthwlWbWZoRpDofAVulvBkGLv7sg==
X-ME-Sender: <xms:OvX3YWSxhr-5OJ_9y7Aj_dm9I1dgpk1dygpi8LiKOYPfVvogwklVew>
 <xme:OvX3Ybx73xecMKxA5CfZuvhiyaasWdGmHlFTyRKqsTPc567lg2rtUjK0TOfpjxTTw
 la3bgMBxeg7no3dxYM>
X-ME-Received: <xmr:OvX3YT3vAgRB9T7EjqL1P24H75ChZ9r5CwGNDYAca5BMY4i7AsWkv6PUYB8yNzinsJXu77Gssvtxvq8ByyL1hWCzcVglwVhNpD3rSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekteejuefhkeejuedtledugeelueev
 teeuueehieetvddtiefggedukeefffegveenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhrvghlvggrshgvqdhnohhtvghsrdhmugenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:OvX3YSAXUA9Cbs9P0KuFQ2ZMiWUdojtoG_P6aG07vF1fIRul-gaPiQ>
 <xmx:OvX3YfhcpMfbsW6JjxMfO_5gQCs4KeieL0e0J7r80rTcx5sOyFSX7A>
 <xmx:OvX3YeoBCfLigwenqhhO2q3C9ZlXVnXoBmwkxOMTJyesufwiDT0DEw>
 <xmx:OvX3YfLWFfYvSrWrKEyVufT_ebWwnJfZMUpv8rSGssTI_w8O135nLg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jan 2022 09:42:01 -0500 (EST)
Date: Mon, 31 Jan 2022 08:42:00 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
Subject: Re: OpenBMC v2.10/Hardknott status please
Message-ID: <Yff1OKHtWj+xN7HN@heinlein>
References: <DM4PR84MB1855478F75965FD5275971E6D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gCIf0NWSlklWgG88"
Content-Disposition: inline
In-Reply-To: <DM4PR84MB1855478F75965FD5275971E6D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gCIf0NWSlklWgG88
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 04:50:40AM +0000, Muggeridge, Matt wrote:
> Hi,
>=20
> OpenBMC v2.10 is desirable because it has the 5.10 kernel, with an LTS of=
 Dec 2026. Though, I need some clarification, please.

The v2.10-rc1 tag is also based on Yocto Hardknott which is EOL in March 20=
22.
To me, this is far more important than the kernel EOL for 5.15 being in Oct=
ober
2023.

> I see a few pieces of information that cause me to question if there will=
 be an OpenBMC 2.10 release.

The v2.10-rc1 tag was made back in May and nobody seemed to care enough to =
push
for a formal release to be done.  I don't expect this to be done now.

> In a message from Patrick Williams (appended) he states 2.9 was the last =
release and the plan is to target January 14th, 2022 for a 2.11 release. Wh=
at about 2.10?
>=20
> Meanwhile, at the time of this message, there are no release notes<https:=
//github.com/openbmc/docs/blob/master/release/release-notes.md> reported fo=
r 2.10.  Though, the Current Release Content<https://github.com/openbmc/ope=
nbmc/wiki/Current-Release-Content/b8934b1382409fdecf996fed6c56339e76717f2c>=
 suggests 2.10 has been released.  If so, when was it released?
>=20
> Can someone clarify the status of v2.10?

There don't seem to be anyone vocally interested in any releases.  I mentio=
ned
hypothetically making a release for v2.11 and nobody responded.  I think th=
ere
was a simple regression test ran on Witherspoon but beyond that we have no
information on the stability of that branch.

As best I can tell, most companies that are active in the development either
work off `master` or have their own internal release process.  I keep heari=
ng
small comments here and there on Discord like "I'm building a machine based=
 on
vx.y" but I have no idea why they chose "vx.y" and quite often they're only
asking because they ran into a bug that has already been fixed on `master`.

If there really are people that are interested in us making formal releases,
we need people to express a real interest and contribute (at a minimum) some
testing to the release-candidate branches.

--=20
Patrick Williams

--gCIf0NWSlklWgG88
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmH39TYACgkQqwNHzC0A
wRnEOQ/+Kf21mqYdNd2mua5j3NTUavsKqu5CSs7b4o/gyRjtlQGGx4hrxrbnV0Wk
U5gialyjiMHtW3ovDk3NEcCkBNy3OuQTT04CmdylCB0WJx3TUkNsJm0y6hBnzEk9
eu3H8kTjQFRhg73tqHUaqFsDYXi1i72qb+mH8lAxEzLyQa53mJM7V6RyWUMDP1aP
z5Za55MoN9ZIraN/VPDSZ/cTn2DdomhcP+EuygT4ZQCxU6dgPnsHhBcGf3PPict9
cwEFgiV6DGj1TX7gcbPOfXrK+zyLM8ZMt5PWarYFpBZKqZQFv0kjx2dZV8XdOsuQ
D3lqXYGAGCJLQ01fdRlCZu6ISg1pSmZKMl8hNPpow7ju2CIu5d98zANdestyyZ7b
uoJR5N3699z5PBSeLkZkHa9MA5ajKoCOeqj6rWVJOH7ISXJYltefVmoiQoIcpaid
XkdgsV/REAkSswRo64eif6ZkIOXpQdcoJB4rGPtpmHNZh6dzXvjtB2IOKJUa39ca
Ww7HrpmxPNO7DKnYGn7J4Xs+XeoB+lPYIeFmyXRc9z/w8Eo/WcvXkZFQ4Cz5LeBy
xGMKgDVm7PtmmZBWN4TnA5ITrZXdEnBseuGGok+GCuk6TsMfyxt6FHlMx3JYE9Wo
fhABhfekK5PumId0iDftrIuqJdtqkuh+FJEzBxmoM6zEJ9GNJpU=
=8LrU
-----END PGP SIGNATURE-----

--gCIf0NWSlklWgG88--
