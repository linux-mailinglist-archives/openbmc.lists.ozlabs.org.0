Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD58693397
	for <lists+openbmc@lfdr.de>; Sat, 11 Feb 2023 21:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PDhfC5Zxqz3f4H
	for <lists+openbmc@lfdr.de>; Sun, 12 Feb 2023 07:14:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=W6OzjpCx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=W6OzjpCx;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PDhdY1mXlz2xT9
	for <openbmc@lists.ozlabs.org>; Sun, 12 Feb 2023 07:14:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1676146407; bh=mR4G8Da3PcoC4Ndmfyh+gy1+Eq3ntzsdbd77B7zeMwg=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W6OzjpCx4Kzb33x7mUMpapNSAujsM5ujnx9GAfSJweGhq7k2TWOxtMHrbHlk0WTEJ
	 xcRf9f1qVcH9AdkYQWx75E/JjLAF497NJm2EkYb7fBRLRc/r5ASaSUbiRshOLrHG6/
	 /WG7TfC/n5wOTr72KyMtuEbNcOvFuhEma3AxTgpAe579Toi9Aa/921Lz7z1ivV55NW
	 Vh5oNonWSF2jhTWFHa7y4wCYN8OlsIXM1KPZnHyyflUMfRwnyEOVItQg9M770Ai6ZB
	 CB7tWlZkUwJaKJzooFAiglsrO36p+dKzNiavjeln0T48U5/AQaCLwN/hwqCAA7YVHU
	 UHEOyeu3QKSIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.79.96.39]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1odlVl337i-00vxB3; Sat, 11
 Feb 2023 21:13:27 +0100
Date: Sat, 11 Feb 2023 21:13:23 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6] soc: nuvoton: Add SoC info driver for WPCM450
Message-ID: <Y+f245CgehS4Eet2@probook>
References: <20221103213420.1395507-1-j.neuschaefer@gmx.net>
 <CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQmQ5u+4Q8c7-wYQ@mail.gmail.com>
 <Y+bpODkxY3FlCjPg@probook>
 <CAMuHMdVzbSvA=1fm1ArwsN0=vU4-Ke_J7=s=N0i9jc69=Xa0qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GNhp1dz4imwcRsMG"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVzbSvA=1fm1ArwsN0=vU4-Ke_J7=s=N0i9jc69=Xa0qg@mail.gmail.com>
X-Provags-ID: V03:K1:5uTXs6C60uVYn+tu5XGB2UQZvxOdnDCLvrG+k9cvP/zE4PIgsqB
 PsZvEi/4U9hSXS/dmK05qi9q6ooP4DkIAZUFJ+4RzBdSmWboXcboJhbL7qdrxPEH2Ey/uQM
 gddL5QodrNEnn6PBUAs0ru+GM6g15yxcvICv5WQVPX4X5MuQLsNIguH/zpTzD/zyUVWGt9V
 pxyZPS4C0dGCibRq55vjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VTwYI0P0DqI=;mJxP7sCxLVqusisa8j6gODvYwZe
 A7zJW/epFOPMNo8pn68BX9w4Vm6VPRXMPixN13Z8LPdoViXtJK7tTWrPsFm/YTOik5TWR99u/
 py73knGrZu0rQViGQ8QAOkSOQvB1m/y9uI2IRVV4q55O1GCJe4q4bog/24yXcQvHMqiCrvM2k
 D4/SH2pSh2Md3SohD4E52SHE4MN0sTDYMIsCGPlfMahtbY8xLhQGH/S9eStH+SWQ1wsiwbElg
 TTlc9FqibToA/pUlJnr8kclpkLzCrw5WeyTVDDOOseBg1Ozh4jX/3YSMcBHF4PZqXLrb9v4rd
 l2Z8vb4Yt/UW90IGPLdq96jMCb9WkzsXrSsSQ2G8cjPWqYYVXI5fInHAWQ2cGHMOlecx2X8j+
 mElHZcEk/jUfyqstnhBumegYAsj9ERP/s0Qj+tjO+5pZy2M7lgMxQepsVbIqSzZCd9IBrx1tW
 wSqc0Z98QiXacCflVl6npXhumWoNahxLha+01wc6Uq7zjZawxo0NEC1NX6J7I00LalAZZ6+f2
 UuhlPMlIDkHY9rQMQxCnHx8T2jkwmILh48cQGQBLfmKUEL45FVJCYCRj7C16xcfX9GW+zuoJ7
 VtHw7xdqx3dstdfY2uN1mV+5tJFrMEsQFunF516HnKFjd1hvvquUXibuYAe2VLlejKKFfxZeK
 uXlJAt7lNE/YXmsH5WH6h6G4JvlEclk/P2mJh/jgMZZH+5O/GuFC7pUae3abdrWIoUTimcfXu
 Kcr7BKRv61HnsM6zRP+xaGOrBif56Lbvatp7lzdTciH1vG1VOfx8PfBvxjTQ6rX/YDLpMWUBM
 vH1EjDF+LJ96yGK1ndZ66hMOfS1WppXikvnOSmaqVcCx8/D4eN/5rVcVJI/45/lN1TFFeuH5f
 DiVfrOXI0n6xoxoRpmcQpR+wMau8oZ8BClenNJnj30v98My0sgKXsQMtw/z6IG6tJFfltgBdY
 Zbg23Q==
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Brian Norris <briannorris@chromium.org>, Tomer Maimon <tmaimon77@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, Joel Stanley <joel@jms.id.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--GNhp1dz4imwcRsMG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2023 at 10:33:05AM +0100, Geert Uytterhoeven wrote:
> Hi Jonathan,
>=20
> On Sat, Feb 11, 2023 at 2:03 AM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> > On Fri, Feb 10, 2023 at 11:26:28AM +0100, Geert Uytterhoeven wrote:
> > > On Thu, Nov 3, 2022 at 10:37 PM Jonathan Neusch=C3=A4fer
> > > <j.neuschaefer@gmx.net> wrote:
> > > > Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
> > > > information such as the SoC revision.
[...]
> > > > +config WPCM450_SOC
> > > > +       tristate "Nuvoton WPCM450 SoC driver"
> > > > +       default y if ARCH_WPCM450
> > > > +       select SOC_BUS
> > > > +       select REGMAP
> > > > +       help
> > > > +         Say Y here to compile the SoC information driver for Nuvo=
ton
> > > > +         WPCM450 SoCs.
> > > > +
> > > > +         This driver provides information such as the SoC model and
> > > > +         revision.
> > > > +
> > > > +endmenu
> > >
> > > Do you plan to send a follow-up patch?
> >
> > Yes, hopefully I'll get around to it a few days after rc1, when the dust
> > of the (upcoming) merge window has settled a bit.
> >
> > Or should I rather send it earlier?
>=20
> I'd say sooner rather than later.
> If I hadn't found your v6, I would have sent a patch myself to add the
> dependency.

Ok, I'll send it today.

>=20
> Does the "select REGMAP" fix a build issue? If yes, that's a very good
> reason to send it now...

Unfortunately I wasn't able to find the build issue report.


Jonathan

--GNhp1dz4imwcRsMG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmPn9sMACgkQCDBEmo7z
X9tpYA//aphJFeq1uG2GYPGO3an3t6prRG9DA+Nn3M1auOjxjE7uI1lYoZNE6YEh
g++zMFw6HFilz/vquGvW+hQX7nQ0uf+qLrq9c7g7svMorOmSWT+I+//yvR752Azb
TDZiMlijiqvtX8DnTGkYMfiY521kt700CMYJfcvItv5O3juboV0SUAjS7Dp84HO2
UHltaPm+mKEKl+rKvkaWWY0IWcZdydH1uO9oAIvoZOteX/5Sj3WZrJosnJcO0q7I
efNzNaqKd5crpYkJgr9iLZhZOgu/QSQbusmN09zpAmntxKv+MaoUPRRKTiuHkUIU
pVnZUXzHMGZl0IDtZdc/CPcU+EF73d0MwhlM8Q0W4K6+/ptYsSbOP6Mj4lPWTCnP
0CD5rZbUGfQsnWrKmssusLpuCVCOgRXF+h8Ecdd1BFeOGeGaMTfXEvyrDN8nv8hl
F5Gj3ogDuydkk8m9o9F6fo5ZvRH8XEgXnTAKgAXnPE7yyyxEIyHSpJi8wol4ZQNe
YDFzQ5mlRKipwCPSxS98X45+tTB6Ldp7uDQTGNIWx0iaDWoFgnxo68V+9EsEeXs5
bYfBpnG4nvqDwdmE7F/VswQChrMUzg7+4+pU5p/I6Oie9xG0muObHel1jZzdzFiN
fkMacVqFGX0l/0UesS6gmgMlmZj9YTKqdzNkmkaAmSbfTA8XuO8=
=2lZE
-----END PGP SIGNATURE-----

--GNhp1dz4imwcRsMG--
