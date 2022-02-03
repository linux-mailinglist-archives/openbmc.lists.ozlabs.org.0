Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0474A86BD
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 15:41:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqLvK3kMXz30Mf
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 01:41:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=XeDnwBrz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=XeDnwBrz; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqLtv6vXpz2xb1
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 01:40:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643899223;
 bh=rRjmFdAesvKhjyp7CmXgshmx7Slt/RMJF7feElgQOgg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XeDnwBrzzivc02u0dt61dSPYT0i3jk+vZPYNQWHHut7tdGgJhqA6dQFmklX3OojdY
 BnWIHy5R6xzLcB4+2cTjbIDDbrt/hlf9JSUVhGqIbm/jX08ZTo0FQBkb02534/2jBW
 xB81Kk9Rr34KFYfFw8s0ih0Lx/nRzsg046GgQDpw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([185.66.193.41]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacOW-1mdXe12BII-00c7Un; Thu, 03
 Feb 2022 15:40:23 +0100
Date: Thu, 3 Feb 2022 15:40:21 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: nuvoton: npcm7xx: Use %zd printk format
 for ARRAY_SIZE()
Message-ID: <YfvpVVigOc4eEdR3@latitude>
References: <20220203133736.246397-1-j.neuschaefer@gmx.net>
 <20220203133736.246397-2-j.neuschaefer@gmx.net>
 <CAHp75VfrygdyjgQJ7iRnGL-CELCQ+6D30r5aWwitCTUJvGVf_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eVcSzelghXg5He3N"
Content-Disposition: inline
In-Reply-To: <CAHp75VfrygdyjgQJ7iRnGL-CELCQ+6D30r5aWwitCTUJvGVf_g@mail.gmail.com>
X-Provags-ID: V03:K1:4bBE4nsJxFwrk9zc0XZ0PREFwZZ1cGi0gqitsnTcJKy/+lrRauz
 b9vy3mLTWGwrHzedGDbuRRyQe5gy1LKRVIArrtG8YzQ/QmrKZxQtwNOlC5Iblk8TgrpjIyG
 1ckR8eF5g39XIWw4Q4M8I/fyd2UjO2nN08NVZKQ4/V7HBmdVvlq5Pog3IYdhOVF6pSovm2v
 YxqT2SxvUiUxcAcl/gCrw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+52ExvH9WdA=:afTqJsb4yJJzNZf4ZDGLbP
 RcAVcOHm3lvpx+0qhqnud/B0YwPmGlP5voOgryctjJShdF+TJYFH3hxbBTeH/4ZA2uSfZBELH
 nNnq1TTh1DKLtgGPaYP2hmX4B0T9/NjtbQ1BjsLrEAk16RioaoXILW+oNsdM6gmYARLIq8eP6
 YaTUKWTUueUaUBHdwyJglj8kmaMwtUwfZw3Pd3G+GoaWBqsmcqR0uiGFvE5WPc1LGDDGxNu6K
 73CD0CgwtxxU7bgkhyESuHXVqWUQPL4EW2v0cryr0owqjdss64Z6u2FiSb8K27y7Lb8TzyPyo
 h/IDiqRXEAPEOt/FH1WeJ9SaBJgIkuee3LuCZN1FpfcDd87FDYdK7r142xOegNSORpAmrDkHh
 vYczgpVTFSDXRYgJ7Md1AKHkwtgNZmWd9iRLo4LdN05TKrY4W1t/HZVRJeRCLbirAQBfBczGM
 bTao48P8tl0cIEVAcHizfzNOjBQ8kOGcgx4A/JO3WpJaYY7Vy0A4vrxFuY4cmCg8gEn4L8XZx
 iSUk4wPUTiB3zyq3BCJ952hUHKmIEVorhnkzjM1nlev5//m9HfutCrt8oz4LwUtD/wb2GiOKj
 Od0jgoeEH1uW4gowDePceu7wxnekyysOEoId+cqs8wQuYtTyKELaCNg2yy7mkiDsOzctS1RDi
 TMzBHEqrLdIOGJHo5HK2dn9y1GFGW/31u2uB09gLmSAyNM+dcX/ReFKDI2I+5A7n/AfmgeVVF
 8DYQDk513RSRubZyzaXai5L/9M+v1czQjPrL+1W5gLTBCbrWfe81VP33jSHvh3XyhynwoIqcI
 XLUJEHE5v8wlwDTzCwpYxozqvHB44h3953TP20enPX3g3aBwZ2FZ79BniuV+hIABiodmffnxx
 mlwQnn1w/8Pa2Db61pLhdhqWMiBuGqv1bNT5Zd88R0hDQ6Ec1UeUKDAuw+n7/+01eSeGT7XFD
 6ADqTA2KOoZT3qZr091oeseG/g4+hK6/CoYOlKHemQKq8yEfbR2W1reRyaHGoYm+4zctVEMfo
 SrwatIdIhHJDcsKgFo+J+Lt7OmAZGVonmMSxxfOapRvtPLFqo7oSH2JPaqoL+88gOECWHL56q
 Vk67uhmqCccHPQ=
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
Cc: Benjamin Fair <benjaminfair@google.com>, kernel test robot <lkp@intel.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eVcSzelghXg5He3N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 04:16:56PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 3, 2022 at 3:37 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > When compile-testing on 64-bit architectures, GCC complains about the
> > mismatch of types between the %d format specifier and value returned by
> > ARRAY_LENGTH(). Use %zd, which is correct everywhere.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: 3b588e43ee5c7 ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO d=
river")
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>=20
> ...
>=20
> > -       dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_group=
s));
> > +       dev_dbg(npcm->dev, "group size: %zd\n", ARRAY_SIZE(npcm7xx_grou=
ps));
>=20
> Dunno how it's slipped away, but the proper specifier is %zu.

Right, I should have noticed that.

> I guess that's what I also mentioned in reply to LKP's report.

True,

>> Should be %zu


Thanks,
Jonathan

--eVcSzelghXg5He3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmH76TMACgkQCDBEmo7z
X9ut4A//aOQLQWn/GISMFzJ4/Pq/g4sc9jjB+rZZhAxaAYaJXKdOoIq++a00Ng0/
MUq7qOV18RJQiA/KYLud7LOmRNsbQXGNzDo1Z4TcplE/MjJr2VsJe+OuXO3fzvNN
oJmEtfn0k3cwbiAPTkF00izWfjMGHfou/0xRX+NDoJybCt9eVwj8SUUW8fPdhwTC
smiOUgLo39wHTlvP6WQiLSHu1RP53qe5aiqL11ZCmeSHMzH/vlQcG0jhBb4/46AR
rB1wnbMEFap3VoZtRs73al6Ze+wPdmdL6sUB4e8L+5d59LDi9ROe02DbamgMf0VB
C+sDv3GsemHp62J/id20G8eFit9C/xSyjVmng7uHMxWt75issT62gIxrfK2P81q+
1dTEH64apssen6L1w4NiPs0pxzKmQ3vzO5FhypsaqHv/Qgc+C/nEu7drwaJ4MtSs
nXZR+QU2vSKBxR5GK3ezz4UIuZKU8ZOYVlryQPm+wX4MBDumeH41RPqdSX3U/OZf
OmCnFxWxTOFxc2aMt1JnKSxqMMFqLtQ18EDrj0WlxMOiW+f2f4RmS4yNAOyU0h5J
ToH0Undp8fPD3fCsIJhI+io7VR13Jq0pJVqG0XbnEd2ljRcL9fRLaGf1ggwT3Ork
ZKST+SfL/krulH/yaPmmB4ty2/1mDvNgWMXlc1zbeNwWmNBjsQU=
=r2Xy
-----END PGP SIGNATURE-----

--eVcSzelghXg5He3N--
