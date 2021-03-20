Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A67342F0D
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:45:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2qSt42skz2ysp
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:45:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=gNCTz1TE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=gNCTz1TE; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2qSd2VQNz2xYb
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:45:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616265888;
 bh=d1vLtDraAtkMqHk6HROk38CMMUZVffe5COQYlFCGvjg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gNCTz1TEHRD3nAWVERGBvz4eZtmiAjN1QtMt2n43X0jxFLlx4dSyyFpRWQbcD7SsG
 sqrCM1lJJwfsbL8EjJBEkZE+mXVWXFRgmBZt+DK62V5ObZHYr734SKMdSgrODFrMCv
 08bhd2ueFbhd2Y4GAwbVyobiuRz+UtgWVNnoLfW0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzFx-1l6IKX1U3N-00HveN; Sat, 20
 Mar 2021 19:44:48 +0100
Date: Sat, 20 Mar 2021 19:44:47 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 13/14] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F
 based on WPCM450
Message-ID: <YFZCnwmKT89wTGml@latitude>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-14-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Z1VQwSmFz+hiTBWT"
Content-Disposition: inline
In-Reply-To: <20210320181610.680870-14-j.neuschaefer@gmx.net>
X-Provags-ID: V03:K1:vkJZm344XxWzxVLFJbgPxKxyIbETOxSDelWoxR9zduf2ke/h6S1
 rtcyQ5bS8j4Rt1IDy2rYrFSM/cuqC6RUd0+uJIXVOWc4/R/8ry4RiC4AC6IeX4s6kmaklSs
 mWjcRN/cGCa0iejgJRV8O9Ppe9EyXj3k3/uyyGjkKaWXe+1OvAoMcSlHY1KB31CmuJ1qdoy
 vBo4qhz5Tiz27mr9mdfHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+XV7oEPMWik=:6W/DHQC9ZT3vehD8OtkMIu
 1Q2hSz5ctzZElAhfO1eiNyvI0ZpY6n9mD2ARiG0vz3FOoMqg2knX52cLYLaYd5RZJB96ZUuhd
 2vP3RiVRgwxR//WtvvV1uajqChJy6j6qYXtuDAqkQBhdZ8aY6EiDPjiRIvq+rzPe5XtmuBf6h
 YtViZ9E0yMIUaPl4qBHQ9g58YnwEqWj9JZQTKzxb4HNsfgZsXLO+SRBSVmmMVgh+kjByVhah7
 MGDHRaiaNIqGpww63zlH+ekbe1ZnYAKU7M77iKzKnu7O64Lw1Krh2kT7OHQRUCD1SryHpNu1F
 iuHKoc1BzAHFCyGGHoJ3+tYRB/g3NN6QnietagsiOuPJ79PmLgAxM6sXNeJrQFY1glj0SP1jx
 aJ9Yk7FxHv/gKf3dMnjAQ7u15/AhmbUQG5hFwH/Ajdk5GPDiBUrFHtqhGcVRcHa2vgGrIAoU1
 HNMBOivEKSckt6jADpfWyj8wRcDJ4vhFTckcbaF9C81ngCaDmiFmGPsfd/UcXOOYIJXj2rAux
 dmz0Sv+K1Gw1egALPtpwkmuOC6cAUF679QbP+TUL97uwZIhyBgZT7dObxFz+6s/dIf5eVDEUM
 JNB345QHXf4XYRoA2qgkLVlM1S+YPP6PMh2u7lFJqutlI7nsagZdap9qoOzRTaMQ6JOEPv0cs
 3ULNTZU6gySFjwPIay9idSzIruxCEg1LPQt4vceRC/UmeTD8y6V9bOMyQbEfOBjJZ4yEACYSz
 fT3OM63NVixoiFAyboAPnlISGJFatBZG36IKP7skabR3uQhIrmPoCH8ALs3uWR24X9UbFLhlO
 DANHgr3HLhaGDnY0IlKFdezhjxgA3tgd9RswMlwxnNSOOAemOB13kDzXAmL/Iw+l7NtPjIkUw
 ycJX27yhIUASt+Ij4DoA==
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Z1VQwSmFz+hiTBWT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 20, 2021 at 07:16:09PM +0100, Jonathan Neusch=C3=A4fer wrote:
> The Supermicro X9SCi-LN4F is a server mainboard featuring the WPCM450
> BMC. This patch adds a minimal devicetree for Linux running on the BMC.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
[...]
> +&serial1 {
> +	/* "Serial over LAN" port. Connected to ttyS2 of the host system. */
> +	status =3D "okay";
> +};

One thing to note here: The SOL functionality doesn't work with this
patchset alone, because it requires a special register setting in the
SoC's System Global Control Register block (SPSWC.SPMOD =3D 2).

So it might make sense to drop the serial1 enablement for now.


Jonathan Neusch=C3=A4fer

--Z1VQwSmFz+hiTBWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBWQpAACgkQCDBEmo7z
X9tGjQ//aEFlx3SOxaQ8W9hBuavu5Rzz+ztJmvFmw6zDW89XgAdw4nn8blv3UG1M
Kb1DiUuvsCJZMmr0xeKYn98lMpewRE6n0xIc5EFSVrS8TYJ6A/eWZPlc5YLF4KrX
A5IKyQSOjkBx6X1joLYVGvPjTwf0JSY7m1k4l30hcYhnnGSd37tIxcw08THb9fQd
JmB5t8zM5zmDicoPJbH2TUZW1ndLVbBLCzcYKWeIf2aSUFA6R9sZqeXSb9L6TQpp
sdoWXnNlGPOKZmUc4A1SvOOyFf1IdgfQ/lXar53EP0PgC8amX+YL/hm+vRY0iVk5
XLLlfp2e7jCdoDd0jpaY7HrdgBWTMJUOkJVLVqFAEo/N9k2eqroelzw9pywLoxvT
nr5gG32XJvV5+v8Y7hfr+9QzEYPMR50Hb/XbY3urdnoCBVyleRs30CsCqHoitn+X
krhg6Py0Ri8WCx86gfdCcOx1wUorV6V6U5iRQRxkwxnlDWxZwg6LHtm5juAmMxzS
/sIv5FluU2oOgyVrAMVcH1D1soadCyOkhoY2uuF90rNj8C9e9KkVPpvWeIEjOFNv
Ew3Lc2X6s4wQ9Vqvsa0tvvwLwxVBf10T7qSuiFTR+UMcbqEm4vSjHK0a+Lpbaepe
tUYQ5x4fCGzXlYGsujtxYreG3wQK4KqnXITrnov7WM4pOVa2Fxg=
=b1Yc
-----END PGP SIGNATURE-----

--Z1VQwSmFz+hiTBWT--
