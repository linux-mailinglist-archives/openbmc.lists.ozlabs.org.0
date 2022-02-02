Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCB74A70EE
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 13:40:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JphH34Fqmz3bcy
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 23:40:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=NdkqWDdn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=NdkqWDdn; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JphGg2qHlz2yg5
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 23:40:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643805612;
 bh=lZ4316Q44PluVsj1sPcy2CFLDYO7r+nhpKEFqWsIIjg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=NdkqWDdn0NXzC/h0pU0+zBc2tw3R3Lai9pmWTF8lgCOr3eUGgnZDsZJ88V8z0/E4t
 fFDfHWPUoEe/BLNkpf1YgfAR83ZxU9fpxilpfak2Kvgv1muIfs/kR5Mmy7UNKedCQ8
 Yf82lDuZkvnHxmRUmMCgsJFxmxTp7YY4mDhhzdEU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGRK-1my7mk0F4I-00JLCU; Wed, 02
 Feb 2022 13:40:12 +0100
Date: Wed, 2 Feb 2022 13:40:10 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
Message-ID: <Yfp7qni4djRCr52u@latitude>
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
 <YfZkis8M81Ejpagq@latitude>
 <CACPK8XdFXRQf3MpPh3z=EMAKtnQSHL+iwwMCVYc5dP9DfQEN+Q@mail.gmail.com>
 <YfpyjDBH83FE7r4o@latitude>
 <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R5woTQRwH04BjSJ1"
Content-Disposition: inline
In-Reply-To: <CAHp75Vdg8zFSHaTP_8jQua5QfRYbvZ4_rLdCtt3ks8YEibseTg@mail.gmail.com>
X-Provags-ID: V03:K1:manlM35z/hW/kYRc4Z+Fu1gQic/531v5Rk2b8zODaOSCQ/pEik9
 9OmFYjoMPaoibAtxV3rpuIo1t+FoURAzkDZfDn4YnR0G2ZZAiHFDCVwfe9RlujHs0lgSMVN
 guJn3RP410fuecCTPK4ZYk18IaDuRcgvIciVGf07XOT7b8PiminOY2t5E36dZS0gWQ95UuS
 3q67h/iyI/UvyyZriOUxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UeiIv49JUjY=:DRkoabxXjIY4rxCd709AjA
 eCkHW91FMqYuvUm0vn4MnIIljx9nwYDCIHNqNU7KPbx6/h5jHw7ognyt4pZGal4FIb+QZ4fI9
 FS3ZtFXnn6RlmlIVR5QkcsEqaPcxqravCn9H5j/kdaPHi1sThm9Pj3c6y8loGy04dEmEM3dkQ
 9OKZNv71pxxAqFCHp1zM6xL46ImCaFbcS8guI680/aOpx8qf7eWzqrDx/IJuuSD0VGFrlCs5E
 KZ8lm6jVCG+60juJMUJNxHwHNQo6Z6wmwKezaC4y7r6ed5SdwROPYfNJxJvRanGrucVNw4qz1
 HMKLW4j1ns0JYtsdC45s5G3ISWa7P3C/J8tnBf2cNRn10Mqbr5V4Vi4OBCmxxdMJpdpRUgVNW
 GhsAdQ6cZG/0kjl3ZE8X6A0yMBBfFHjEkft0dbkwIP2Gx1A2bZfV2w6POpWtbFxSwRrjG/qFy
 6ULfZWugq7GXreMzaLoGDsRzFkOyBPfjYi4FjCJK8hUKH9PhTQNL5vWHEliyyxl6jEFMIdzUZ
 WVp+5ikh278qipsoQnm06gSaGXFUf05poT8lTQev5romc1KwM4GtmgOYgEWkKxorqblHtj+az
 yh8e0h9oT55Hog6fnILe3ew6qw57maEZ5jjsvK8pNSltAwhygcmNXlXwtck6y1Vk9gUkJOZ44
 96biw3PcpOBhv90C+OeInckVwAsgYoWR89DM6ECoGftHbIiSAJd0oRUOcgQ/NT2fXmRD8zCfA
 C4qba5wUtNZ5ssK8+69G5ZpRzEnIu6O5gCCUI92yoSInzBEJaZ/8cOAYxtYdjilHgVl/KDJUg
 dDELl7H4x3iaueYp9Qyp6fJRpCXnJMtxLoiC+B02cPG1ojz5RH0f3xayGfWH1qQStVyRmhGav
 b8zcChswCJi8d3qNtrBjfCVZTwSZDUiufSRi24kBgyT5GDAu0LrfUdIpy90Ghtqfkv/DXhgOz
 WWkjYvdsJtN4jq2h79xXolebIFeXHL6XogBg754r5unz1seB3BBF5MN2yYXo3Y74yzy8wwxiU
 ppnNtGrDN14QbNisxUXOsIBrXMGTG6StbrtUUJf3BmM/xCjUPsqrVzCiIUKzrDu6AZ9QATkEe
 jX/7V4Hq+q41Es=
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--R5woTQRwH04BjSJ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 02, 2022 at 02:10:44PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 2, 2022 at 2:01 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> > On Tue, Feb 01, 2022 at 11:42:11PM +0000, Joel Stanley wrote:
> > > On Tue, 1 Feb 2022 at 13:05, Jonathan Neusch=C3=A4fer <j.neuschaefer@=
gmx.net> wrote:
>=20
> ...
>=20
> > > I assume you're sending a v6 to fix some of the warnings?
> >
> > No, the warnings are fairly independent of this patchset, it's just that
> > the adjacent pinctrl-npcm7xx driver started to be built by the bot, due
> > to my Kconfig change. I'll fix them in a separate patchset.
>=20
> I guess you need to fix that first.
>=20
> Because now and then all CIs will complain to your patch and confuse peop=
le.

Hm, right.

I'll send the pinctrl-npcm7xx fixes, and then a version 6 of this
patchset if necessary.


Jonathan

--R5woTQRwH04BjSJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmH6e4MACgkQCDBEmo7z
X9vqjA//XOr8yfUq5cP1/TPoekmsBBV4OcpprXWKtONJX8zrJhuLbde1yIrOpoD2
L91zOk8aZysJxABmHucetpGBBtvM/ddJbX4PV0B308hrmSQ2sOY4Y3ZDMTsyd1kr
k2J6wna7RAC9AToOk7VGEg4XXbEu5FDFIdkcSBfa16sKIZU3MzlHhl2Z1Wwckf+Z
duzmJSpaDlTQxaDPwTr5fN3QYJ9Q56EgPBXuPa83ZMsal1VBZf5MrzoDBbAveN9j
Z+oeurb761NmtjT15ioLeug+Ym1v2Dr3fhjpoj8cdXkL2FJsIqV7S+Dxdqe6ApoL
RKYA0yGdZglW4XjLIjudGU+T68u4slrvl+OUs99YA7pV+MhG40heSGP8PdEeDIpS
XRNGboQV0mqgtIREoczo8Y3hJLBA3HfKL1jLUa9QXD1sNCTxiBp8ELnSfFY4xOtN
JXvks9+4hRw8C4ML3SWLjgqJfnlrBYPHDZWe4pctVdYqL13hLdv6qIe3hzI7MHdk
CfEhgf5KqSaJp3bz/YaGtIdmA8e7j3tIqt3VqmxsJEYH+i39VRywtM4dfuIxVA0U
c+YSPU531ARyTmssDLNwzZpXjXtjEIwXf8OA0Fzfz3GHqkaqHXLdT82CRo8+XTKK
IyDcNhp1R5oXdVfk7O6bhniQo3xN5H1xKYx6ijQoHlH9G0lkqDM=
=nFA4
-----END PGP SIGNATURE-----

--R5woTQRwH04BjSJ1--
