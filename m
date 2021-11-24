Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B343145CC02
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 19:24:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzqCW3DrMz2yjS
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 05:24:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=akONOIUM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=akONOIUM; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzqC15cM7z2yMc
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 05:23:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637778212;
 bh=/9rmTd1NOgvxfbdOqmnU4CEQE7qGAvavwqFQFviJEBg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=akONOIUMrC3CSnTeUQg/MU7DjWok9lLYAdKXXEGpws3dMhwYo6eYxIpBJkuOKDfZy
 xVHcw5AtbD2MTJrQ3cFZjYTPyfVtR/VPThvMlC+FczBT1LutDHm09Wbrr7PHVb85wU
 tqvxMxYGvh6nWk8UbPsm95eTpEXHbxmCT/JMKCfo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Ue3-1mjeLF0mkr-00700o; Wed, 24
 Nov 2021 19:23:32 +0100
Date: Wed, 24 Nov 2021 19:23:30 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andrei Kartashev <a.kartashev@yadro.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 vegman machine dts
Message-ID: <YZ6DImerODeksDI5@latitude>
References: <20211124122214.19669-1-a.kartashev@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+vwz9t7pxwpJcIhP"
Content-Disposition: inline
In-Reply-To: <20211124122214.19669-1-a.kartashev@yadro.com>
X-Provags-ID: V03:K1:09pMBVb2f9GLXt+DDzMIoqlgscKKUwMPFcFYta5Hy/81SC5Vr+e
 o7N0RNRmDFtVPYhFji1Hmx/gvnBz/rAoJglc2EsbjZnmpGyIbY/eYzIcX68IOVdGjjUxGEM
 wI9gUNk8sMhCs7B8ME/ERLOSPqvESi7JVf4nm4Y0I1/+OxzBVbjdwydJRa/7iIipIX9dITg
 squknuzn69/3m3eP6R7uQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8mnPTT9D30I=:9t1+TRvFBb6CY1NXJpxlWq
 Y14Hinea3IZwFfAaZ0iAUXm1+y6RC0NCIdhPcyQwkkyvGrFbUjXgWkzxv6QaT3XNHjGWuHpEJ
 k6ieXrjGkVyeLSMJQ82jT9ULZQuERjvxLU1LLWYJ4RVSz+QZddmhzO4c3gF9i+DYaY+Nb+pWT
 KBBgiHwG2d13VtMUgcMFqmA7kFUamj4uenEyuszH/CaDFnXJFn5vNcMTGEjCQIszHzs/MfK2f
 waLmWm6JduqUOgCJUyoyKLxb4ybm55UoUeYZDwb4Ua8zcsrbsv8q+GSO57DS6xtWw/2BR99n+
 GYAqPBcjQCYgXtkdY2oqTQET4pGs0dgDppFGiKGP+cVPeLydpr1ckkc0t/BjvwcfVOelHMpH0
 dmMeZp9HISDx56COB27SYxflwDEuxiJtw16N6Z5QlyV63jxxl/Q8IHYOHGuBW3VoOq2U6pBDC
 0rNxwDWs+BDxSvI5N+Tr8kNMjebmysikTsd0uYTXI47ugD5x7i/AwFNRq5PJzEo+cBklf8MF6
 C20x+JcIc0VpwAmhsmOoVi8SvRgKoQOe+fhWGLbacFV/yKuZozU1D7d4BcailgOnSPFyXOnx/
 NCKxPxrYMsDuWoed3WQz9X/DfgpcHPuponm3wWkNPOML/FdPqfNsV0lO8cC6AFnrmzak1tBvl
 SyUPptmkeNH1vArqqtCKeX6VbUik8YvCUCGhyF9D0Uw6NUAukhwlSzYQxOrfaWfuDKTosa0GS
 Ya6UadDe5KgNsynn/Q+2JmSjQyLaH87480pgsZ80KBiPuGDf2QWThIPPCitY7DlZw7rD+iBfA
 T89FrPf1teg/1EGIqKy4IIooIdebtCwqpLBDPtHfQrOQc1woIxIk8FB5hm8u10ECQXD0R0d/b
 8r6LKiiNZ0PVgNLin9YVIRsaKvuIEmmYPHPl28916U8F1hMKXl0fLPJdxIP4EUoL6M4HvHri7
 fqdb2Q+WzpL/0f2yiY4w6E7n0iyUuIEs9an5g+DS+3NQi8khO9iro2cDOm1P+MFGjsxIuhrZq
 QTtofmPlXUN+GUBxhPSLlE31TgXlo1KaTzMJGB72LeqwoYBBENPwTEtsSM13+bMWv1KmHrk7A
 3HWxTgW6MFh9QY=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--+vwz9t7pxwpJcIhP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Nov 24, 2021 at 03:22:14PM +0300, Andrei Kartashev wrote:
> Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
> ---
=2E..
> +++ b/arch/arm/dts/ast2500-vegman.dts
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (C) 2021 YADRO
> +/dts-v1/;
> +
> +#include "ast2500-u-boot.dtsi"
> +
> +/ {
> +	model =3D "AST2500 VEGMAN";
> +	compatible =3D "aspeed,ast2500-vegman", "aspeed,ast2500";

The board-specific compatible string "aspeed,ast2500-vegman" seems
wrong, if the board is made by YADRO rather than ASPEED.


Best regards,
Jonathan Neusch=C3=A4fer

--+vwz9t7pxwpJcIhP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmGegvcACgkQCDBEmo7z
X9se5A/4zjuDeV0/jd3yKfqVCgzI3EiBS3h2n4qOD4qf1eqFzHAhIBMPe5yh2lst
tM7HSsA5zA8G6DXbjssuSwuU47oQQn69eMiPdGnx5JsUYOYuG7JespWDNJv2pf2n
57Awg+/4HFMhqjxDLdfMXUTIkWPWdURMlDZ85GEV40oQr4nVaMMbfeB3fmjjsxzV
Z/P2owGkmCw1G8EzE/8E5W4XYxRboBXWs5uyYGFcsajXIasL4Wuo2Cy5rhKNB9ZA
no9dkxmU8K3TrpESXZ1h7SnodHz87hNAXrVGHeyL5N8hSw03/1pdEV73pH3WVi+4
fWEmIp/TiM6khP+0kLFiWPXL1OwRPrQB6X50XjmTgYld2jXXXs3GnuJvIwoJdi+z
MLt4TyNugl/uT3MEFfaFG4R8A0/3il5vOnUc5rWYwLsZjTBt4+lHxWMCt+7yU4K6
kBi8Wi/90XChwGChnaQhlKTu82YvhHcYuCYQPLrclLAHir33+P2q4/ZroBXKQKks
HvfFW5GqF92WwNBNkWB9S5eh/6fNiUrYc0twM5nVcCZqJ2yMW49WvEK25tIRduYw
BjV0aTeJZmthgy3Ggilh0OP7nHT5sfY9aoYON56X9zM+iFTeGZ269xIrh+ZPWw7j
HLy79gaEaBtkmwI21jUGSgR8rhCFSLC1vsOVuOxShJ5dkHe7nQ==
=3Qmh
-----END PGP SIGNATURE-----

--+vwz9t7pxwpJcIhP--
