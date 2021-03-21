Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B80343273
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 13:31:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3H7D3cVnz300P
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 23:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=K4MFOgmk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=K4MFOgmk; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3H6z2gDLz2xg6
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 23:31:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616329869;
 bh=50Y/rHSssdb5Pwhs5XahNE/25EWb0MYPd2+DkOjaeSo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=K4MFOgmkGsCESMw93aZbF3tNIhXEMdLh8c1/gCzCjBH47PHtNeSWRNCNZRDxQlsUH
 yRxoc+T5plK26zQtl0Eo4BDqsF4WdAAKSqJpupnrggn93jlEwyvM/Cbix2x7zMkf/i
 iQvMC3sj5QLEfdHlgvkS2UZykwEJSgmnQ3ElbCbE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8mV-1lrUhF3pG1-00fAWY; Sun, 21
 Mar 2021 13:31:09 +0100
Date: Sun, 21 Mar 2021 13:31:07 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH 00/14] Initial support for Nuvoton WPCM450 BMC SoC
Message-ID: <YFc8ix6TsQhLIC2v@latitude>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <CAP6Zq1jdO_kw-B-SX0VNiVqQ1rz1vbt+DJ1quvm286+cbKec1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ilxIgzm+yXs67A+p"
Content-Disposition: inline
In-Reply-To: <CAP6Zq1jdO_kw-B-SX0VNiVqQ1rz1vbt+DJ1quvm286+cbKec1Q@mail.gmail.com>
X-Provags-ID: V03:K1:FQs9pDrWozbdgB4aDvQJNyPj2qq4NUi4WXWfmpdJ9Ugs4le4doN
 vAUyUjwOFkMcwaivZp+wkpUWkuzY4nri9ZCR7tZhFTEffA/Lh1Xw9rm1HtP9E3Ni7Dz20xh
 y9JZYMocTjRBzWsA7voim/gFXOapLP5ZSrGeer53sOdnZpZIAgGjXNBPwSU/yoQurDCbuA1
 jierxz6Mvs/CkddABmvSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Sqz6zrCVGo0=:fb6rpxLt5B0hw5thCb9eeF
 bQIIdxRE9R5+SKzws+F0Y1QssVXt7m1y8Uuc0x0B+3xT4mcR4ov/ubEmpi3/oB67VnR9Z2bI6
 dEaxreH4+J1oKkZ8cqsBiWk7k5Q//Rvo63jodH0Gqo67Dj25EcKUkzG0gWhrZTnZPDlVSKyjh
 wTaQdhWy9H+IrOHyXFJomY+UURogtjyOf0EXtK+8vnYHULbEUFhRJO8CfVDL7LPLTdgCPBaIc
 T0re3EOMeir1Bvy/kByR6M2WblaHNghIMtr5BZc2Qeiq9MPzJlSzYo5tVx/4DvYQFnTpah6ok
 BLl6SbskYQ+jJvKZcYOFm505FpYA8EWt0OkHN2BqTC5smZ79uBuwjsIMUAzHhjctEOAoYv/+1
 4d8WN2msJZuvmWaYHOkEtLB+HSH/6/AYU6deVWnFKlkqYVbiv6Q6YzSUc3cAxQA4gP/zW0XC8
 KH85vAd3L2eILogfWC71pEKRfsx722rBddYulqVlYoN0pYhgsydwSdMJzzF6G9GrFcz2mK7eJ
 UNkKJSsQhZ+zK9R0bKMAjROJp/7YKRht2GIHdsK5KkEhP/p4SnBZGv5yK7Mf/vmHZV8Da0qs5
 MtEeifs9tZHSsdCED+dOcJ7dkB1u7C0cFhmKgLpzubqY4ONuH+vB6y0ZE/mezLKm2WoGhPJBx
 FdIlAMKshvmwrX4f/06vvVfANJYvf3d1XpEJ2Thmgj5YT5UFZEC53Xb1WaWhtFH7XxXOriwQ9
 ekmp57ewVjoW5Fw61i7JgXTPFJMHNdhWD2PHz7WnDB3yknetESFKmvd3W+lp21zPmBDhG+puU
 SYINtf3viibAseRDs/Dmh9Uo2XmvJ8c3CorsiqkxpzWn7j7NfhXa4R5uwC/nU+JzIbrKVCob6
 O2Lvrj9/hyCVNhy4JnGw==
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
Cc: devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ilxIgzm+yXs67A+p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 21, 2021 at 01:07:53PM +0200, Tomer Maimon wrote:
> Hi Jonathan,
>=20
> Thanks a lot for trying to add WPCM450.
>=20
> Hoever WPCM450 is in EOL for several years and we are not supporting this
> product anymore.
> As you said it is only available in the secondary market.
>=20
> Due to it is better not to add the WPCM450 under Nuvoton maintenance.

I understand. I will instead add a new, separate section for WPCM450 to
the MAINTAINERS file.

> Again we highly appreciate your support and time on NPCM750 patches.

I expect there will be some more cooperation, because the SoCs share
some architectural similarity, for example the 100Mbit Ethernet
controller.


Best regards,
Jonathan

--ilxIgzm+yXs67A+p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBXPIMACgkQCDBEmo7z
X9u1mA//SQ1OYXP0aAQV5lmvmwj1JJq9R1Hxu1Bu4plirEkWUGR9IYbUpNEb0Wjt
aslffTV/Y9LjLYryXv2lQRVdbylFF2IsQL2oM+N6H9wl+GqoYswLdSuJ7YtQnWYs
yw2hEtB3Dt9vS+p86JWT8cb2r0v+hpdnuYuhFG9kLx4hl/HI8//NsDmP9LuzLgR8
ebh1k25S7SFGuHYQDw1LFoTCZuh43RTM0EdR8NXyPLIbAcE6DZC2d160E7cSfRcN
+RMt/GDMwlFdsbVoN/jH0yknDm+sLlDtSquixbztH65lcWiDliYtPYbFB1HopJrP
dSikkJQFP6agSKeyHNUlHwChQxulkqV5EmS3HoF+SQcG/1WySakvz/qWKn3p1cBl
v9wKLbPvCw1H3UnWuXG5ZRZ6E8cTnoqvDyBFdCCeYmGchZc7CV0nBk2ldibD8Sd2
1a1nXau6B+GeVDFfgNoIulFSb+xJpar8/soZc3YyZHDnGsj3HuQBVech2X7zHccj
ZXrUeLetzM0HZ8wARcMsKQCcNhCVEot8d+4zdInLafEGZk1htAnvK89TKYdIXbks
5m43CTcDF7mn1Kb/6EJliXoR/6WtXXceEnMhYaGqFzIuCgH3hRpR8msqjHbnbYr7
C3PTO9D22Hb5puORp1jhJD+jNSyvIG23MnSDtJbQTZd4xSikR4k=
=QlNO
-----END PGP SIGNATURE-----

--ilxIgzm+yXs67A+p--
