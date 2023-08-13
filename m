Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2215977AEEF
	for <lists+openbmc@lfdr.de>; Mon, 14 Aug 2023 01:29:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=oE6SDvq5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPDJk0K5Gz2ytV
	for <lists+openbmc@lfdr.de>; Mon, 14 Aug 2023 09:29:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=oE6SDvq5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 317 seconds by postgrey-1.37 at boromir; Mon, 14 Aug 2023 09:29:04 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPDJ05h71z2xsY
	for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2023 09:29:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1691969336; x=1692574136; i=j.neuschaefer@gmx.net;
 bh=pGJeUnDImPRPNunS+2pOV6IilzoLrirJ8ueyqSgmc1E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=oE6SDvq5CIduQ7fZxdKeyukFCYLbjansp7pwKM2pVyJbZGj02ApcbX9LPLrmUgQD9m+wG+H
 E9wk8ZpDyRxPZxMQVhwkwfSsQK1eUHw4YWcoI1yeMrNRMzDMMZmWG45BLI2QiLSLnSPFpsM5S
 uhGXB0F7x7qpSy4gj0NbX9+J1e75KeTn41T1iaBeQLMnGfJu4VkBfjDamot/ebXtrLLN4BzAR
 O31ylOmvdBdonpI4qGNvlFu7AtV+fu7osFhkRR3B37pcR+0YLmagVWLy5DtjiqKKXgFCMP9tG
 Acg8AkyJ49WLUfm0cA3P7tBzLISd77eYqcMWB4F9o4DuhZPafFxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.152.144]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1pkM0E3Vln-0168vI; Mon, 14
 Aug 2023 01:23:29 +0200
Date: Mon, 14 Aug 2023 01:23:28 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Upstreaming Nuvoton EMC (100 Mbit Ethernet MAC Controller)
 support
Message-ID: <ZNll8LJYTNuolh9N@probook>
References: <ZEwbPFW5p6jB0kLR@probook>
 <CACPK8XcONxSRa=5vq3uDxiAQww6ULVJr+OkQp3Q72MDLSJrBnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QL1EbuT5nhITkkwR"
Content-Disposition: inline
In-Reply-To: <CACPK8XcONxSRa=5vq3uDxiAQww6ULVJr+OkQp3Q72MDLSJrBnQ@mail.gmail.com>
X-Provags-ID: V03:K1:SFX8dfX5dwCeV1Dk8oLszPBT+DAyFlc9BJt0AfOHTkWTSbdrPFA
 MHaTg5DcZdHViGY4h1c+Rxdsr6mCf/LjhIYPvAYQXUtz3D0Yw2YM54yf+vjjHEGEwemBEe9
 e4Uu/alAb34dEv/LNH/AU895iFmu3ueOHJsNnqVNEEaEfqt4h2dy/+XN83m5rnNPF5tCAvQ
 rWsUwVOXu9/kUx5XN0yeg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d1+aW3XkxjM=;sFkuuzYy8D5eMizWWOmf50nST4t
 IOla/onhPbOtNkq2BjB9RlqbJWwM2FeHMNjA705gZ+UbEeg0GXAY8SRDNEU8Iiq8dq+3MQiRu
 oHu2iiNSv98JvQ2py6Pusbu46YlqdPbP81tIGXWPQL2eikdKI2iTeXqdmdjAeg9ojhT0oN/Jl
 S6TiCSOfKfEmxEhWtZjHcD69wU1NXVzZeChJ8xtB9iwRXjva81MkyhefDhAfg2SxnEhLNmYZG
 kPTcCwzktiMuSqYGri2HRjpxCt+0p55L1UZ5RJqmLuRPTxVOP0ME+uyXZXjL32yOQOI21R2Tb
 hzBg3LInHx4Qxoyh1BVeQpMSkWSOARmEU8JDscorZuxH19wAfqxlKqQGcxF0/2W6A9Hr07kqF
 DCWRkpJJM4VAy0ObCGobhW8bI8tysrNAFWP6xJzwSRvtRdGNPniybiQLwPgVPTQ0DSADGS+oj
 ak4mDGBT5ORiE7lKbsQeb4nbchMyrQ35QtJSEfYh4cI16Zo+wtvL2FGvvTaQ/xXUlYQhkhn3F
 IQ2ww5N6wkcBbHVW6a4+V2N1Hew+OMyyUzCXm4Yjf9/GjfiXZMeIe8m7nY6pgkn/9hyGfisfO
 0yOvPyVHL0NXNdj4whh0+jt3YaIpgFXhUcHm3tsb+PJztr/1iVS51Ge4cx4SAM1BduFv003LV
 +DXItGsZXr85861fyuHPnvGCwS/HIM54xwmrSJB18n58K4Hic1QaidHfUpar3DKOpRfwbleL7
 uWIxSCQDreoqPLYowYHDnktIMHPqnvnQs37f1EJohwTtMP8gbFt4Z+kAekyHwVwAUzR5r60qp
 H9cBBzLVXn7Dzfl3gqfu4dVGRgRkUqymME/mhhipmpih84Vp+H1AHMPFfPq4yfPhXA3Pgzbr2
 PS2jiqw8aF5SvobdmyaeadKvFvfLkYlcv4MqDKCX8duilUGPf2Y4viXKEwKcWjYtmxHx8T9aI
 4kRtGa9YXUt3HkWxzcj7pIAERWs=
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
Cc: Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--QL1EbuT5nhITkkwR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

On Tue, May 02, 2023 at 06:44:26AM +0000, Joel Stanley wrote:
> On Fri, 28 Apr 2023 at 19:15, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx=
=2Enet> wrote:
> >
> > Hello Avi and others,
> >
> > in my ongoing project to support the Nuvoton WPCM450 BMC in mainline
> > Linux, I have reached the point where the next useful step would be
> > Ethernet support. The WPCM450 contains a Nuvoton EMC, which is also used
> > in some older Winbond SoCs, and newer Nuvoton NPCM7xx BMCs.
>=20
> That would be a great contribution.
>=20
> I have a npcm750 eval board that I can test it on, please cc me when
> you post the patches.

Unfortunately, I haven't been able to work on this project in quite a
while, due to personal circumstances. I'm not sure when I'll be able to
continue, but I still intend to do it.


Jonathan

--QL1EbuT5nhITkkwR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmTZZckACgkQCDBEmo7z
X9voaQ/+NKwBjL7VzlpmTXl9QjmQT20f2hHWwxBfk7kR6SCEEQWj0QPNhZg+bFAN
wZtIUYtpOoQ2K8ht6EesZr9gf1SUUBjH6pvWasiPZPuCo0px/Mu7/El62Vn/UYMO
XBRAgDnZlmgPbAH5Jtz3FqsCo84Xu1t8JbS+V+1DBOqSXQOgLZoIVCHap6w0AamH
L97eSAADWMked12kYHjJB2FLTnpi3NBU8JTvF7cVkn5RAT93mAqZ7EZQApeDPmb4
iOJ6sAuxxejMX7AI6ikeVe6qYWHo0VK35kppbie2FJ69Sh5nnVX2gSx7BHXE/j+l
st2S8NWCncpVWolho3RN6gYSzXs7mMbArt0Byow3MdnTeFC5iPmuTjmlVQpw5mPt
BTRZh6Zu/fwpxuBF65QcexwbZc6pZCejglMkFxOhoOFVi5igm4yubYAPKmrNdhuJ
tC1NrxksVqK0FFNon65EjcOkSpzA0ZXrwmj9npXRFvG1X/ZvoMdGn/8aKkY3OIuC
VwMSGzXhK0Hkjj7r4vhHdlvMbRg8as6WpMySaaUxSK/AtZ6AgU5QUfbQ0Kj2WleS
Or+TNkBkxzfBhh5BeyAmt9SCsdMgy3MMJEdj6q88AfhJklkjIS65Vg2LoohcQcW3
loIkDOJMQavpdYS/v0ZogXm17I/z7W3UiSl7HYjjrAF5XsPRDC8=
=2oSA
-----END PGP SIGNATURE-----

--QL1EbuT5nhITkkwR--
