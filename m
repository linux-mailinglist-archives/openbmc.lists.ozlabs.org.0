Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41B47657A
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 23:14:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDqKr4FDXz3bvH
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 09:14:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=BqwZBny9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=PtUUs2pD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=BqwZBny9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PtUUs2pD; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDqKQ5Hpmz2xDV
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 09:14:18 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 76A5832009BE
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 17:14:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 15 Dec 2021 17:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=pG+NBTpUiB3O0OcMvrGM8X/1rbMdBuAa98hOKW7P1Q0=; b=BqwZBny9
 2VMftOG3WfcBw6qGVK6tUMh5k0LWqfP/SNCRyQB11gA3XzB0zNHj/HfEBw7DX/kN
 Nu2gawJGPzhAMelLIjNt9huUFR9df/vEzrwBL+1DUbE8Cd7ZM3Pwc650nlfr8mX2
 LbDCny+okdehBcMlVRADJOyRSpbviFi1jBn9KPTdWA9uFOZzKJUgv7PqZmNrVxqg
 c5jd79MNArGtkDYfDtpBAvbRYedW9jb2f0qtBlMgifINSlO+j6a1V5j8EsATX+6Y
 5SDVX9LB9FdpgUu2990DAp6cV5pV9F8k3syLGc7yWTV6oGBe+BtgK+L2UZG93hnD
 n2Ym5ZttDn1hZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=pG+NBTpUiB3O0OcMvrGM8X/1rbMdB
 uAa98hOKW7P1Q0=; b=PtUUs2pDNqr2kzb8P28OebZLXwp9d2NTYms+eHtxBhMEH
 zeIJ0eUCbrXJlGGJpPUQEag2yJxv8gwiXBobeMvp5iqlhKe0hNivTZzdZRuOwa86
 JTE2b+mwbPLpxEihLBsVRRC3YjI2CJUhR1cv0xtO+lIHcohK8zjyJTM3aOHk5uYe
 OFn798/0R5wjjZIMfFPuaKHouKr3Q9BkZLn+e7/AFxNMbNe7Jh+UpKzfNqzH5LRP
 2RwLHsY8/Ww6GKog5ZaDFS5afwv/qarI0YM/WxCadrZ+OJSkrAOz9ce7UqgbrHin
 nAxRvcJOV+APgyjhkWJoQ0rLmliZfyNQ8EfQCKb5w==
X-ME-Sender: <xms:t2i6YQycbV6FYY24YnKT7KgmnBBf0COFleeDs73NvhUuFCGN8WxEYA>
 <xme:t2i6YURV5DlFqovi4dtTvyoaTFzKN53ln0fiHB2chgoVWxiFOf6cnfru7GGJZY00h
 -_mqAYMeYaUEWi2bUM>
X-ME-Received: <xmr:t2i6YSW-41ScH6RJ9qrGpYg8T8_o6s84qXWLfSdBjzunLntoY2270Ad_heIY9v93OgYZr5WU8z8t0S8rEybulktOUP5ajz5GfccFRUOMMRGL1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdduiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepjeffueelheelvdefveejueffjeejveeu
 veehtdduffdtgeelkedvtdevveetgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:t2i6YeifzGY_OOMUud4Hm2GK_aVeZoEUVVyTGWlqXMGBZiW1a5FA6Q>
 <xmx:t2i6YSBK7nIOrfoZZY_6GIAPIqkITeuQM4Ir8rOkcsM7_rX8Eka-oA>
 <xmx:t2i6YfLrdJye5gbn2ItetadbmsRO_Yp1v-C56SJr6NuR2xRBgu4JTw>
 <xmx:t2i6YZ9s_EVtshdybTGI3NAFfzuaAtmyEnJFRHnBHCIdEWY3cM2sow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 17:14:15 -0500 (EST)
Date: Wed, 15 Dec 2021 16:14:10 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Upcoming OpenBMC release 2.11
Message-ID: <YbposjOPwc1puNvR@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S1TQUNcVffmMxChw"
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--S1TQUNcVffmMxChw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

It has been almost a year since our last release (2.9).  We created a tag f=
or
2.10.0-rc1 but it was never completed.  We recently created a branch for the
upstream Yocto Honister release and primed it with everything that was in o=
ur
`master` plus an update of Yocto to the Honister release branch.

What I'd like to do is target January 14th, 2022 for our 2.11 release.  If =
you
are interested in your systems working on that release branch, please test =
the
'honister' branch and let me know of any issues you see either here or in
#release-planning.

Since there has typically not been tons of demand on release branches and
support of them, this is going to be a low-effort process.  If anyone is
interested in better defining (and executing) a release process going forwa=
rd,
we are certainly interested in volunteers.

--=20
Patrick Williams

--S1TQUNcVffmMxChw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG6aLAACgkQqwNHzC0A
wRkc9g//fOTa4c2wjesOK/SS7owIXZqR4G5aSwbT08NpQmIUc+ANKv2Rmv3MCWYl
cFCiwShQwCPBeKILl7eeyx0FMTeTT3O42gOIUej5v2SOY1Yw385cs1e0T1iLC7zX
y+PwpnW6kvZN0ZXoKxs4ociZsZWaROucTBONH32aGa6PP0Lh9jVz8YF63InfsZcs
nICASbN8IzyZThMGPfT919uPm5MGBXg4eobm7cllj3hQJ4TBpxbdK5nEmlH0A94H
djd079iUtb+k8ArhelQ9bddAJFZYb0AfAFFxy5pDPXFA9gXrocws2WliUsi33g1B
81W75YIhh/g+zCncJ6l7qoKWqfvEXYLYhfmt7oGl8Qm3NoAJaAo8RBERTwz8qNHH
Dl2DkQTCzFhoKOUHaOlT/i88Atq7sJ6YYo0jKAT0lsdgOx1nKEsVBw8eSoZYwCl6
SeJ19aQq/Cg7zythuhUL02U5JIgIPoVgJfOTSMErjD82ILgaQMif0fbGEEb+HO7i
Vynp3dPi0sLVgl1v/BZE4R3aUD2v01Wg5XZ3oSh9AHuKgaBd5zj9JDO1GwuocHxf
UstLSnhBWdT5kMPEOwLHuvDClFVSYMl8jArTUOmG9Tq09knZTs9qkmlPeIIHiPp6
/+It1HaRbKrvsFxQ421dbtXiBVMBaS0digk0HsbAZ/7JRisiP54=
=lHRs
-----END PGP SIGNATURE-----

--S1TQUNcVffmMxChw--
