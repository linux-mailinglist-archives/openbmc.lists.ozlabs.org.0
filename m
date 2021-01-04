Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D02282EA093
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 00:15:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8s1l4kg1zDqSg
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 10:15:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=p2Y4ieA1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=hfebrRSP; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8s0w38s2zDq5t
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 10:15:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F9305C0148;
 Mon,  4 Jan 2021 18:15:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 04 Jan 2021 18:15:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=exiZtSUPIlvfInJQrv/5PXA7Mje
 A24rL1rXRkMNzZew=; b=p2Y4ieA1ZC1HT4r48kAIJEizm2+1Ae3mu2hLcPTC2ud
 2vp9S+crwErNci0aMagM67fELjGA42FgAdcGf0h2ENtd5NBo2Y8WBnDcgKjILwU4
 AK8b5inwYRK+CGZiuHPPmzQylClwDS6yIDeNw5XFwLuy+ND16ju9ndHMDVtYKc0q
 JGMhkxGe2KNB7ZerzPoR0AR/lcyApznn1Vs2gG4bwBAAzmJdYfnU6JFGO8bEShsL
 GZtAOJd0dRW4Kua6zNZaERfnAWWnt+adiB/tuOgiCAZP5R4660Qdj2sQPw5Odg2p
 tNeTD6oRAOszA/0zMYIjncGcQXJu0gEcwMXZs+KcNEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=exiZtS
 UPIlvfInJQrv/5PXA7MjeA24rL1rXRkMNzZew=; b=hfebrRSPv9wzD/kE5yNSm2
 5FGSoddE4Hn2KvkZ6AiDFVG74WnVzlusK1t0mUaSfzfpsY11FzZci6qiBI08cF6i
 Pav6gi0Hn5+c1bZrI9Lp10lJOzcO2Wzr0DfKKyv08bm4y5kmabSVSdbFd9k+Peyl
 uxB+XbU/AkYjPawnyU+JukqJJ4YaalluOeeE5oxQbRgl2vJ2ZmQPV6iemG0AkYZG
 u6KkF8bnmGVmx3FJUrBSyVwTHEAo8jg3LaDCgu85gAwlefuQk7I5yFAhY1HxfQYj
 TyRoAZQYY4N5so5vJoGGNIb8tSAE2cvOnhfUriD28HWOdJoaY+926o5aGUIynTFg
 ==
X-ME-Sender: <xms:fKHzX3Y1qlRiYrSJ__qJnEIdZwNi423CcGyYgKFAEj88EXXBpXAxGg>
 <xme:fKHzX2bjPt3l63KNy7_ghY7nDOZAFvvw5AMgDKTbHUQL5stuW6V69UgESgWjF7_Id
 5dKh5E5ZoN1v_yhcNY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeetveevfeethfeljeekveelheev
 vdeludeffffhiedufeeukefhkeejhfevjeffnecuffhomhgrihhnpehmvghsohhnsghuih
 hlugdrtghomhenucfkphepudeiiedrudejiedruddvuddrhedvnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
 drgiihii
X-ME-Proxy: <xmx:fKHzX5_OfMEFL41j81Ujr_XougM9bYPDdEB5pkiWLSPIzBnrrCqDkg>
 <xmx:fKHzX9o_PiWsUP_M2frYUxkB6CsEPmnguvrDXyztLGc54bAjk_-qEw>
 <xmx:fKHzXyrQGu6NYJoPMPj7jrgBWDfGR_JekE7b0ScYpUN8VzqyPJ4BCA>
 <xmx:faHzXwHd2TuUgIuNia0ITU_HLlk1505Lzq512cGhAYH3-B6yV0mzAw>
Received: from localhost (mobile-166-176-121-52.mycingular.net
 [166.176.121.52])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E6601080057;
 Mon,  4 Jan 2021 18:15:08 -0500 (EST)
Date: Mon, 4 Jan 2021 17:15:07 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Subject: Re: add a new yaml interface definition
Message-ID: <X/OhexuWrZFhy+v6@heinlein>
References: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/OVFwJ9589BhkXb@heinlein>
 <SN6PR17MB2558F662101C2B4AE4A09F5096D20@SN6PR17MB2558.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WVIY23Kv/0X7cRVW"
Content-Disposition: inline
In-Reply-To: <SN6PR17MB2558F662101C2B4AE4A09F5096D20@SN6PR17MB2558.namprd17.prod.outlook.com>
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


--WVIY23Kv/0X7cRVW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 11:05:18PM +0000, Mahesh Kurapati wrote:
> Hello Patrick,=20
>=20
> Thank you for the quick reply.  Step 3 fails.=20
>=20
>    3. `meson subprojects download`
>=20
> ixia@ubuntu:~/git/development/openbmc/build/fender/workspace/sources/phos=
phor-dbus-interfaces$ meson subprojects download
> Error during basic setup:

> [Errno 2] No such file or directory: '/home/ixia/git/development/openbmc/=
build/fender/workspace/sources/phosphor-dbus-interfaces/download'

I'm guessing your Meson version is older than 0.49 then?  That is where
the 'download' subcommand was added according to:

https://mesonbuild.com/Subprojects.html#download-subprojects

Can you use 'pip' to install a newer one if your distro doesn't have a
newer version available?  The meson.build file in
phosphor-dbus-interfaces requires at least 0.54.1 anyhow, so there
aren't even instructions to otherwise download the subprojects using
meson's build flow (which is what happened before the 'download'
subcommand was added).

--=20
Patrick Williams

--WVIY23Kv/0X7cRVW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/zoXkACgkQqwNHzC0A
wRnsVA//b39WksJD/gxfm6dKMfYKa68Xt/Mrq0wBod9GEGZaAuuZ6bWY9iVA2qmo
S+UbX0uK/DMysU8sFDFNJDSxatnghtM5ox1mulv2OBLSUkZv3r1urvBIa1VbdCcO
5mRSAgcB0OcImh53hBX0IgraC1ZcUyC0kMaXvDrJGfOQK/A8ITzbdVI8S+2VoWJ3
DnKtZ2yKQ9YXbi6yYLsmsJwbLQNZwbboBlhlieB676hI5/mmHrza0MzaQdGalEtG
BsjNw6rJyMeKxs2N5wH3Pj6z1D7dOYyds+qGfcWBt4TMvgxSfDwenJE7i2PB003w
PJXznSLHqnWtOYd1UzFO5LSU4jeyLtTRt/s2k2g1sUxj/lf/2MR9CmphiVSzE3rS
lTGoLW6k81T+zNPi7lx0hjodwtnhmW+HDw6lVpOr05a7yEGXhpJDF+6RQ5HIOMUH
DgQXqDGaEtz2u4VRbSdUjeScQd+cypZ4DOT3cUjsM+OfPorCL63mKh+71S8NlJ6H
SGrNzO8ODeZkPwGJ4X1M2Ic8LEFPR8e07qo4k0lM4ztUTv4bTG/0Dkx/VpnTa976
yiMxj7bztqR8ODJMXsDdVBAzmoMRP/qb3nh4Vmba6m7XbXgx9IkJ5UIJR/4j2DhJ
jeJ592z6vFaCZKnA+1X94LwY6VmC6PNHl69vhekXrcgAPv/Ld7s=
=6pNz
-----END PGP SIGNATURE-----

--WVIY23Kv/0X7cRVW--
