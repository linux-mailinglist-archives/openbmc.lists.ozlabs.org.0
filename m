Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5740B618333
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 16:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N37Qb1hs9z3cLT
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 02:46:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=BeI4ExSz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=BeI4ExSz;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N37Q255d0z3c4B
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 02:45:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667490307; bh=D2NeIitACzdIeTwQNCj4aXAQCOyb03SsB/bk9aAJFbg=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BeI4ExSzbLn/NzfReS6EG9pS4/PI4JHh51EC9Bm652qnenuMq7QNbozkEWRgfzA0k
	 zMsPXiAKID8TzuZuPc0Hwyz4744XiQapeDvdW+BEsEcWcFVj2FnetXammZqkZr8Ph/
	 HG+Euil4hJmmzA9C3srOQ8Bkk9RZnrTvdn2hJ6zzFe4WOPGocg/CKHBP+RhqkKM8lh
	 yWmbahlG+rECBJQOg5S17r9ftXDYnlCEucsOFACZkpEcsUSbdued2rygftTH9Kbz3M
	 slUW3cxkYqkm/RQADzFU8OoDpg/NlmuS87oOZb92kHTUaqLs0unqbSESKa40zB361U
	 tKQyKKND1njhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.126.36]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1ode7w0h2l-00O31Z; Thu, 03
 Nov 2022 16:45:07 +0100
Date: Thu, 3 Nov 2022 16:45:04 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v5 RESEND] soc: nuvoton: Add SoC info driver for WPCM450
Message-ID: <Y2PiAKBTtnAjlToY@probook>
References: <20221031223926.241641-1-j.neuschaefer@gmx.net>
 <CACPK8Xfa=SPaYogqfUpCG61J7U-Z8pE2Oycicd_D=4vJsZcaSw@mail.gmail.com>
 <CAP6Zq1iHOm1sQTHshmVobzy9yX_REt6OL5qyFz+R77vYw=7yBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z9Gk8xtTBSjinse8"
Content-Disposition: inline
In-Reply-To: <CAP6Zq1iHOm1sQTHshmVobzy9yX_REt6OL5qyFz+R77vYw=7yBg@mail.gmail.com>
X-Provags-ID: V03:K1:B74ShnSYqz3yjVKmNIwYvGyYzNI7c8HwuxQD3aZX01toJPb15Ae
 4XwHcweCb/XUa4MVguYVI6juos6+bvAT8feskwRRoF99B/6+XWEF80EMU2bgY2usjhtnb2u
 ojQvTZ8W1rXDOc83fuayVlAvzjUYcfZPS9gV0YQ9T8F5pWprJ4SbK9sl+jcEKhUmmWQcnhK
 DlExVDGkswz3Aj6BOSuhQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:la8mB4y0vLQ=;etpPBLNCdJNEMYZHWh/q4+MyA9c
 fmJeWOsda5DRiI8cxtRDiXs+IvTC8WM0aAYvQNhHXvNyc9UY67w+Sk6cbapdRmFXvLKJjZw4b
 S/pyjDkKMApi1H59/EhQ4YH+Zh0WHWLr/XyXbHb6PeZ+Xy2BhhIy5LEYFm8p8Kp/+ZDx3T0ZO
 gApG2BRUyt6np8Us2gmhfVycJvQhj1eed7ecoWH6f/zhjxO4R0Bu3xbd8YN1JKpSSzpLeZK80
 JtvQOChiUlQ9oP51ufMmSQOKLVmGr/flF0NqPfi6xK+HZHStaQxP6+2FmOtm/DzoM7M0BBgzg
 +rrGtGILnrR/qWSubrYS7eNVrSv7iaVjHEZT5RlCIElKL4LNpjLT6kYozw1vtc1iNw1kbMdDl
 +LJTcKIR2FjJuV+sSh5hoRPTA0J6p32IaLTaJYQuma/ekFLS0O8B5A0KO670dMhvPYBeZGs0Y
 S8dPDjtLeMZJSoRrJRIKvxnLYlHNY6Lkrv//qB3HngI6VfwjgI6zYpPOJzOJsZ9yN0UQVlDXM
 rWAc3dMiDFMMCdHhjnaTBXsdhXhg7oc9g7Y/Z4ayqRjWFbvOmMwsl8C7rKCdbJK1awNTuLk4D
 alth1x40yLP+qvgN0xJ7IG6X3iteY36/M0O3PIHzy4PPk27gHLC8LpDTtIXtHetfELsqTTYn4
 ZndFzlS+n+hquVUTtRIw+SLibyBlYfSJapbjoXBzVeIEzFyYx3HyI5S4T8Snc42oU4wHWX879
 3SwCD11LF8H5SvdMKNCHcEDf94KwuL/FybFaewptNWSyyIZ4OZIn3vIXVpocGWDHgTVnXccaY
 WtzYW/nKBVRY30RYln3vFnvyyXbBiiWuitEqrA1KHaK40MHy1MDc6yDVpYnQOHj2t/Avihlvj
 UZoAA5zkYGpUyP1H1YLiJQu9Kcz+bEpqvSPT4Z8F2OD1UisrI2HtGrWqz9X8lAbFgKXmtYuuO
 80oPjd1NU/eAfZC8txIECdpAL8s=
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Brian Norris <briannorris@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, openbmc@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Conor Dooley <conor.dooley@microchip.com>, Joel Stanley <joel@jms.id.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--z9Gk8xtTBSjinse8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2022 at 09:11:08AM +0200, Tomer Maimon wrote:
> Hi Jonathan,
>=20
> Thanks for your patch.
>=20
> On Thu, 3 Nov 2022 at 01:09, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Mon, 31 Oct 2022 at 22:40, Jonathan Neusch=C3=A4fer <j.neuschaefer@g=
mx.net> wrote:
> > >
> > > Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
> > > information such as the SoC revision.
[...]
> > > +++ b/drivers/soc/nuvoton/Kconfig
> > > @@ -0,0 +1,11 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +menuconfig WPCM450_SOC
> > > +       tristate "Nuvoton WPCM450 SoC driver"
> > > +       default y if ARCH_WPCM450
> > > +       select SOC_BUS
> >
> > Sorry for not noticing this earlier. This is a bit confusing. If we
> > have a menu option, the soc driver should appear under it. Or we could
> > do without the menu all together, as there's only one driver so far.

Good point.

> >
> > We also should select REGMAP, as you're using it,

I'll add it.

> > and hide the option behind ARCH_WPCM450 || COMPILE_TEST.
> >
> > How about this:
> >
> > if ARCH_WPCM450 || COMPILE_TEST
> These days we working on LPC BPC driver for NPCM7xx and NPCM8xx that
> will be placed in nuvoton soc folder.
> we will use:
>=20
> if ARCH_NPCM || COMPILE_TEST
>=20
> menu "NPCM SoC drivers"

That sounds reasonable, I'll do something similar.

> Maybe you should remove
> if ARCH_WPCM450 || COMPILE_TEST
>=20
> and add ARCH_WPCM450 dependency in the WPCM450_SOCINFO driver configurati=
on.

The WPCM450_SOCINFO driver would build fine on other NPCM SoC, it just
wouldn't be very useful, so I think the current "default y if ARCH_WPCM450"
solution is sufficient.

>=20
> >
> > config WPCM450_SOCINFO
> >         tristate "Nuvoton WPCM450 SoC driver"
> >         default y if ARCH_WPCM450
> >         select SOC_BUS
> >         select REGMAP
> >         help
> >           Say Y here to compile the SoC information driver for Nuvoton
> >           WPCM450 SoCs.
> >
> >           This driver provides information such as the SoC model and
> >           revision.
> >
> > endif


Thank you both,
Jonathan

--z9Gk8xtTBSjinse8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmNj4ccACgkQCDBEmo7z
X9ssaA//eNzqncSzzvszShSHI+DKqydLRmZ2jZkKhjTh1QyYswkvH+4APbIvIYK0
DWSJiXDouzNR3lpqDq2AzPbXclfWnBS2nU52n64svRf3BDTczNqkHEhUCeCo2o00
RQ+pToPS1aqhjrAg5aZB4XU2fVPUZ4OTce00NeQs+5w/8EyTKxc6knsd/H6uxkb7
2dIU9Qll+FfXF6QYJMUw73QEYgT5kzuvCkZ65G0FzCZR8uTzjS2Wole4DBp+3rvP
4Jmykgqnh9lif1+L24L6Bf6O/mplQG1poMNrIK98oXLhB22lKB4s6ShQQxWFT+Zu
saW3jxwX3Rp8Bb8nWAVG48wcRAFu+OZUREvBye6nDwV6XEFdS+MR+lLQXCpDfONm
XHtIUvUMWvpVIRYN3wgIAqCvIfjIu4QuDYCuR3gz8YEBoeyDw14ha/QWt8J2nUmQ
GfVF7LAqTvhdqP+UEr1nHHNl9i6pf9f90WYbXwuvIPuV09QTHjS9F2D63aTR0z6H
nPi1u5HyPFaNPJZXsWTgUmzNXJYrUQWWeRLCcsmDV7Jot7ZS2semcUKL3xZuRFCM
ahN/K2b01hhsl1SiiBJNGgRMvW2rek644WaWk7z+eJQPzQlHIXo384h0+wAsmqlV
6P6EQFA7nqPji1tnQydxduZIySHQhve39m04g7zQCCmce9jYGSc=
=Y2a2
-----END PGP SIGNATURE-----

--z9Gk8xtTBSjinse8--
