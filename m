Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 927AB4A4955
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 15:31:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnVqZ3C9Jz3Wtr
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 01:31:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=SQi0+qGQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=SQi0+qGQ; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnVq84gsyz2xb8
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 01:31:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643639446;
 bh=cvP66XLBo1tA/1NqtRz9tAMUUM7FbuNRovgufc8YVCg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=SQi0+qGQ/8cFJF0IQv5/Rm/HWHavFPE07kJrx0EDZmduEqWC2RYmoyByHEugix8xM
 aKra8cxtVAlRyolA93iO5VELUvL56fdGWd+uV3u92F6tTSBu8C1PyYEM0og8OfbmMs
 O1K9s9xrZvIMn5L3QW3arusi8AtOmC496GBsiaXE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgesQ-1mbu1q2Z4e-00h2Lg; Mon, 31
 Jan 2022 15:30:46 +0100
Date: Mon, 31 Jan 2022 15:30:45 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: nuvoton, npcm7xx: remove bogus unit addresses
 from fixed-partition nodes
Message-ID: <YffylboRjcfX9cz2@latitude>
References: <20220129092957.2189769-1-j.neuschaefer@gmx.net>
 <CACPK8Xfa8dYaAqg=8MA7zm82ve-K+t_sCfwXF82-9EV97rUYNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rAX5NXH1poDvzv0I"
Content-Disposition: inline
In-Reply-To: <CACPK8Xfa8dYaAqg=8MA7zm82ve-K+t_sCfwXF82-9EV97rUYNg@mail.gmail.com>
X-Provags-ID: V03:K1:H9zxdogpEi7RKDIQoE/qcLE/xh4/erV7/Wdu/LDpsXznxY6nPiq
 a7qlms8M8GRG/Fj+yR90Jro+cskkL6o1X7AuoO2N0Rqyo+DpfdOnBhNF/e4GuW/mc5l6GPq
 c37cNIKqZG3aSR6bUpKWqsFpvtN6/XgO/Y+uQh1IPx8QbdW5HVT4TQr+T4gmBu8ql++EFHq
 c8ujDBqO9y1JaflsAoWyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:msJLetRTpsI=:8hRL9IaFvOlZUtKrRa6vOn
 4BYbKmRIxqaCnnYimqGnhb14e7UMxNcuHZYOMbmSsHE7MqEvNu0LJ+WEcpavOnH5Mlg6pXA1i
 IlWqBm+XVNASFR3Zb1gr18OLBOZ8rhipWR3Lgf9mG9U6fOEuSVjiiW9514UXslJbugxu8QXYj
 HTZ8sk+Z9c86SHqGvGKHM8nqgddwT/qSnMQSGb1FsjrTfQuMw8MAYkLGuy7M8xaZEpTMbMmyf
 7nvv8hk/syztc6OUT0xVvkZODkpGIzihJhhHLyaTpa9Qqpj7Ldj5xugEpcG9OVb3lP1PqyVaN
 ZPBQMaDj3FPW0bWJ7jY/2Wp7pxANS9CoxeeXs+tzIOTyy/cniDEpCoOBOLkGyiMd1p8UyRS4w
 TQqEsbnp6wkGXv6ZY1NU1TauyP1atsfXDR07p/5OK4crRRE8V9pIgXxoW7MOWLDmh+1u9nC95
 unksqNdKPxOjxwIofHwQYJQqxIIVGyFH/OT2AqRrS/HsnadOX1SP3ggf1TOQ29Shhq8hPKy/j
 N7aE7AeJQVMoZbgQfsFHE7bxA4ahtn8lKgJxgXe8rR73avxi4TlpxJHI9Yx9RAC1ei5gJgDvs
 /MuO8cPtqoNV3o748uTCit3xpBGzZJ4aDfUwsl848K8oaurz+4uAPkPrzxmLN9Jx34++mtS0h
 w9yaLSx0FtH2YDyf6D6x8wtZBKSqvjKlrda50JnM1H61PhxuoHCNeEfN6BwNbVUJqiqI+VFol
 g9gdJH4TyirggWsQgmx9Phwf+9k+zuxTDC/VOTseDXT6lQP+PD1oDQkonRwerDKIUD9rhKdOh
 XvD2q6FDOonALZ1w4dX6yrrS2525DXrbQhd2RoIWonnet7o2G9yPwCBsMfPzTWSRSONYUxAs4
 S4/rOYjX5giCKaz89oEKEpornbhnVDxqQLF5sNvfD0NZYaTqfz2T3Ef1nYjEpbNkLyEoEvUqU
 sqQG5J3pk1T18ZetSp76ejz8yrKUoMmXpYVMs7dMlNgv3xY6N0xx5xRC5NXSHEZLLOEAwtmxW
 JlG/uWfjZhmMKIOROXbdkQJk59UEm8rRZcMFlnLDZS7oi1b2aaJADVnAbzPrC1JCnH88R7sGo
 b7HiEv1Vdoz4M0=
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--rAX5NXH1poDvzv0I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 31, 2022 at 06:29:42AM +0000, Joel Stanley wrote:
> On Sat, 29 Jan 2022 at 09:32, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx=
=2Enet> wrote:
> >
> > The unit addresses do not correspond to the nodes' reg properties,
> > because they don't have any.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20
> Do you want to add a Fixes: line?

Sounds reasonable, I'll add it.


Jonathan

>=20
> > ---
> >  arch/arm/boot/dts/nuvoton-npcm730-gbs.dts            | 2 +-
> >  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts            | 2 +-
> >  arch/arm/boot/dts/nuvoton-npcm730-kudo.dts           | 6 +++---
> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts            | 4 ++--
> >  arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 6 +++---
> >  5 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/=
dts/nuvoton-npcm730-gbs.dts
> > index eb6eb21cb2a44..33c8d5b3d679a 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
> > @@ -366,7 +366,7 @@ spi-nor@0 {
> >                 spi-max-frequency =3D <20000000>;
> >                 spi-rx-bus-width =3D <2>;
> >                 label =3D "bmc";
> > -               partitions@80000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/=
dts/nuvoton-npcm730-gsj.dts
> > index d4ff49939a3d9..bbe18618f5c56 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> > @@ -142,7 +142,7 @@ spi-nor@0 {
> >                 reg =3D <0>;
> >                 spi-rx-bus-width =3D <2>;
> >
> > -               partitions@80000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot=
/dts/nuvoton-npcm730-kudo.dts
> > index 82a104b2a65f1..8e3425cb8e8b9 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
> > @@ -388,7 +388,7 @@ spi-nor@0 {
> >                 spi-max-frequency =3D <5000000>;
> >                 spi-rx-bus-width =3D <2>;
> >                 label =3D "bmc";
> > -               partitions@80000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > @@ -422,7 +422,7 @@ spi-nor@1 {
> >                 reg =3D <1>;
> >                 spi-max-frequency =3D <5000000>;
> >                 spi-rx-bus-width =3D <2>;
> > -               partitions@88000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > @@ -447,7 +447,7 @@ spi-nor@0 {
> >                 reg =3D <0>;
> >                 spi-max-frequency =3D <5000000>;
> >                 spi-rx-bus-width =3D <2>;
> > -               partitions@A0000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/=
dts/nuvoton-npcm750-evb.dts
> > index 0334641f88292..cf274c926711a 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > @@ -74,7 +74,7 @@ spi-nor@0 {
> >                 spi-rx-bus-width =3D <2>;
> >                 reg =3D <0>;
> >                 spi-max-frequency =3D <5000000>;
> > -               partitions@80000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > @@ -135,7 +135,7 @@ spi-nor@0 {
> >                 spi-rx-bus-width =3D <2>;
> >                 reg =3D <0>;
> >                 spi-max-frequency =3D <5000000>;
> > -               partitions@A0000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts b/arc=
h/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> > index 767e0ac0df7c5..7fe7efee28acb 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> > @@ -107,7 +107,7 @@ spi-nor@0 {
> >                 reg =3D <0>;
> >                 spi-rx-bus-width =3D <2>;
> >
> > -               partitions@80000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > @@ -146,7 +146,7 @@ spi-nor@1 {
> >                 reg =3D <1>;
> >                 npcm,fiu-rx-bus-width =3D <2>;
> >
> > -               partitions@88000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > @@ -173,7 +173,7 @@ spi-nor@0 {
> >                 reg =3D <0>;
> >                 spi-rx-bus-width =3D <2>;
> >
> > -               partitions@A0000000 {
> > +               partitions {
> >                         compatible =3D "fixed-partitions";
> >                         #address-cells =3D <1>;
> >                         #size-cells =3D <1>;
> > --
> > 2.34.1
> >

--rAX5NXH1poDvzv0I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmH38pUACgkQCDBEmo7z
X9tMVBAAwevMH6Wfum5ueAOh4Vbal0I1DSk/wmTaKTN7uO6saDzRT7SaGHAEPiif
buVC/uZRol2ek6dcvrwPFXciY/Rijcahdu7jvkKFC3nIB2uk/R/IeTta5KC35Wkw
Kt4l9gU6OIqxOBvz2LKKDWZ7UpC++Z4ygHsnjAhr3pttL78RR1TLl+DEcz1arMYY
2KP4fa0Jq8cF5iUfPAYCDHh3T3sw4bYkZ+8uA5feXZpDf2dkW+DZ3FQpv/G6Tx4E
iRdpxQNt8iqc6e+RNHq2PPpInwnVzIAZj0QemWjaGJdDJBv0hS1vfl7iq1Omu66Z
+Slm4gK5nYVD/bsUAft+8yykTULdjQBC6YoTCFhi6XRSdoJxhJuNh5po+DmH9Xdd
5qwP8eX4CoGI1USNfVghnZHmeqbGMNwgwvA8aFIAJ3S7htQuBsuve/X5S3nlYcYJ
YMnXDn0C0NY7kI5HdDAIGQIh9hUdStZxo+YeCcAlO2/JkwWfLg6+W8QpQD4zcd8y
OCNoPvXi4yjHQ6+IioanwtHEH2dry0KhrqYQWYVtjd70pO/VJdLNxyfr2iLa3biG
ykL7MM5YNnV94SPBm7vPIAAKKNhK/z1qzqhAINxMxLLl2gipUOP872IXLNngRm8t
47nWNj8pVwqORkisq+oYg6f1CXyg4ilkBpoY+iga2MCwmHjME+o=
=9aSg
-----END PGP SIGNATURE-----

--rAX5NXH1poDvzv0I--
