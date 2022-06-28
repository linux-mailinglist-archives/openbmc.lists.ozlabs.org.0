Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D955C09F
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 13:21:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXMc91ndKz3c81
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 21:21:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=YJxxqGpS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o0u8ukxh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=YJxxqGpS;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o0u8ukxh;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXMbf04dvz3brR
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 21:21:00 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 0704F32005BC;
	Tue, 28 Jun 2022 07:20:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 28 Jun 2022 07:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1656415255; x=1656501655; bh=sOInFEs8QG
	HCbHYgnShniWBJ1DRgQEpwDdXuRsr8eAY=; b=YJxxqGpSt6M25mnBUoBWwv8ZQI
	1uW3tqapt29KsVSUDZ7wywGjqJ+N55JWbwfi44B0V1nO6sjastgsYKkgtdJa9Lsa
	a4SjjXF2qpTbsMNP6FhzuPohraASk+TKKUIg6cA9DBuaAPSfxnBkMTXivmp/UdCW
	uObuXEnxJTE9BFW/k8XMCDyYr0lt+o/MPXgYUPAzG3Nlplh4On+ebjKsudUhQ3IK
	LoHOY0xSLrdQbu023Jy/AjTjbUaKZrYCd0PONBV5bFEdrhRSCmAwEEyjbHnxt92U
	1WiwSe7Y7zDpZB1qLPBBsscERApCi5AWb9dyVeIjFuR6aGInr3BFVdCaVWHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1656415255; x=1656501655; bh=sOInFEs8QGHCbHYgnShniWBJ1DRg
	QEpwDdXuRsr8eAY=; b=o0u8ukxhFbMi86veL8zHVT7Tx1JWBxjSXb6OqU+RPi91
	YmHJ1cj2YujBBzoIKKZykBUt//F5BYXZ0BOiK31Lh1yHROoKzd5IRfrtfqfpVjfp
	pIQIT11ae8xZKKA9UXNL9JvGWiFUm7hBV2x5YU/yCgwFhz2X4vWn0/IVJJKImJJE
	P/eeL3tprog3vqrWLQbh4ES8K/AMS7+7tUZutm4dhaxH1oOudNGU0An3iPIgIPsq
	v3DCj5Gzn6MIEKYRW0DwKxr6HyReaseRGkR41gBTWvF4hU4C4A6tzqAfFloz3Tm4
	62LVg2d6Ms/fjwB3XoOV9lyvY+uRsbkSF+5ML3zCIQ==
X-ME-Sender: <xms:F-S6YultS9D79SVnWUqJTz5tc1gn5ZYK7dyT-ZvD_o8ErM7gwY673Q>
    <xme:F-S6Yl0-nx3RGIBTg0Q1XWcCJ-sVJISIu4GYjUsff1PgKHOblf0EmUWyerFr1ar9v
    EnA5-PGfvYNd4T60mE>
X-ME-Received: <xmr:F-S6Yspz8cnP1qxKTqfWfHkkdfhfIty6f_tGT8tE4d8V6t56URaG_TZc08DN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegjedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:F-S6Yik18RigZ7UFNk5hEo0TSF4r31KGCJAreDfxTXSuo_XozElf2A>
    <xmx:F-S6Ys08hiDIJgkLq9skSplUPgB5Oc7T1eD5krfXgk1otq_M1nFpWA>
    <xmx:F-S6YputqsfAnXPrpkOacXmum-a4S18wb5S_cQQJhHxOk41A6Ipegw>
    <xmx:F-S6Yh-AiVmzA86lbrzExJ0GKURHiSN4BTaNQRKOpHJ8NUM8z4oNhg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 07:20:55 -0400 (EDT)
Date: Tue, 28 Jun 2022 06:20:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
Subject: Re: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
Message-ID: <YrrkFWpbWyfx90CL@heinlein.stwcx.org.github.beta.tailscale.net>
References: <DM6PR08MB55142CF0ABFA607D4F2C8317DCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="78Y2JrVqk25x0jb6"
Content-Disposition: inline
In-Reply-To: <DM6PR08MB55142CF0ABFA607D4F2C8317DCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
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


--78Y2JrVqk25x0jb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:
> And each library and tool is built successful(only one thing that is I ha=
d to disable C++20 for the ipmi-blob-tool, others were fine) untilI started=
 to build the stdplus. I encountered a build failed issue as below. It look=
s like there is a problem for using libfmt.a, I tried to figure out a solut=
ion on google but nothing is related to this. Could anyone help on this? Th=
anks.

Do you know why you disabled C++20?  This shouldn't have been necessary
and some of our code now requires C++20.

>=20
> =3D=3D=3D=3D=3D
> archer@archer-ArcherCityM:stdplus$
> archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse -Dtests=
=3Ddisabled builddir
> The Meson build system
> Version: 0.61.2
> Source dir: /home/archer/Downloads/host-tool/stdplus
> Build dir: /home/archer/Downloads/host-tool/stdplus/builddir
> Build type: native build
> Project name: stdplus
> Project version: 0.1
> C++ compiler for the host machine: c++ (gcc 11.2.0 "c++ (Ubuntu 11.2.0-19=
ubuntu1) 11.2.0")
> C++ linker for the host machine: c++ ld.bfd 2.38
> Host machine cpu family: x86_64
> Host machine cpu: x86_64
> Found pkg-config: /usr/bin/pkg-config (0.29.2)
> Run-time dependency fmt found: YES 8.1.2

Where did this `fmt` come from?  Ubuntu has `libfmt-dev` that you can
install which is version 8.1.1 on Jammy right now.

> Library dl found: YES
> Run-time dependency liburing found: YES 2.0
> Build targets in project: 1
>=20
> stdplus 0.1
>=20
>   User defined options
>     examples: false
>     tests   : disabled
>=20
> Found ninja-1.10.1 at /usr/bin/ninja
> archer@archer-ArcherCityM:stdplus$
> archer@archer-ArcherCityM:stdplus$
> archer@archer-ArcherCityM:stdplus$ ninja -C builddir
> ninja: Entering directory `builddir'
> [9/9] Linking target src/libstdplus.so.0.1
> FAILED: src/libstdplus.so.0.1
> c++  -o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/stdplus_exception.c=
pp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libstdplus.so.0.1.p/s=
tdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o src/libstdp=
lus.so.0.1.p/stdplus_fd_dupable.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_im=
pl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_managed.cpp.o src/libstdplus.so=
=2E0.1.p/stdplus_fd_mmap.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_ops.cpp.o=
 src/libstdplus.so.0.1.p/stdplus_io_uring.cpp.o -Wl,--as-needed -Wl,--no-un=
defined -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /usr/lo=
cal/lib/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group
> /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: relocation ag=
ainst `stdout@@GLIBC_2.2.5' in read-only section `.text'
> /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation R_X86_64_PC=
32 against symbol `stderr@@GLIBC_2.2.5' can not be used when making a share=
d object; recompile with -fPIC

However you obtained your libfmt, it was compiled incorrectly.  It
shouldn't have a static library but a dynamic one.

The `libfmt-dev` package has `libfmt.so` which should be sufficient for
linking as a shared library.

--=20
Patrick Williams

--78Y2JrVqk25x0jb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmK65BMACgkQqwNHzC0A
wRlFVQ//VCcxrzhSeHBcaP2GZPIXkAJNxakDTyo4f5jBGAQn9MNV2a6l+ltZE55J
hroTIEz64/JJ7uZtcFq9E5oQDRBS11s6pSbBRhc0zIB9zgLMW2ZwtWEGcYObhyNa
CAp75Sbj72Bx8LeHVMGgRK+USajNukHpxGrdO/yd6iBkwlCOqG6iejPlazbgDRD7
w4x0Bl8/zpDUhseS4mx9e221gbk4jFvzyhaRIKoUDa+RMR2VAlPANGfdW9kotcM1
IjgLsdh6nhkPkLb0yxsK+QHVACoVw+O76KTWctKDfxufssRn7Y8IGMK/tgka0r8t
eCkQctjz9eCuAvp7O+T9weND84MHi15Sbpo0XQmurqm6OePSAWe2AiBgVofTlNaC
JESIM4tY3jErOPyWzal5H73e8gsYRYszgI1JselQYVzCLOgw0ni58FgKGh2t5ySd
J2NLP8X6XSSgZ3ocULUnvPNW0ky1objhrK+DUGcyhqX70LxkOw+2+qbW0fNoeHeX
A5Mg4xClOIs4koA58g/zwsBpd3zBQifeamqF6YLBTeYvoIWZpySd5a1F6YZ+0ndB
ohHCcR514Jn5NAXtFbXGu+eA4XszWUqV5okplYtf0cDjn4gu7JyNr5iik/z3dkgT
uwdTEgWUzBr/pCNJu0y1L8/2qW482xDkEVZ3lJmcCdGplrhT33k=
=QCZ4
-----END PGP SIGNATURE-----

--78Y2JrVqk25x0jb6--
