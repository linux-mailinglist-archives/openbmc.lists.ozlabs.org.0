Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C98C512F03
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 10:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpq7X1SnSz3bWm
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 18:50:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=EqvyOWXB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=EqvyOWXB; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpq773WTjz2xm2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 18:49:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651135740;
 bh=bLfGt3R90RHCX6880JK5SZuBWa/YQY2ZRYJAYi3rHtk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=EqvyOWXBKQdV5qx4PklF3CHo13tltjabFvlhzWAY9squNAn9iIQ61gIGMsCDzvSzy
 K9Mvccn8xkcZEVQ/aBQj/MxbMcKpA4R+sRBzO11CGUr3S/zRTdoF08/RypQpR1ZHxI
 r1YY/u+wubtWzznpshNwS+nZ5U+nB+UPQ4g1ddPI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1ns4un1ooH-013JoB; Thu, 28
 Apr 2022 10:49:00 +0200
Date: Thu, 28 Apr 2022 10:48:59 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Nuvoton WPCM450 clock/reset
 controller
Message-ID: <YmpU+zATKIgHlJjF@latitude>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
 <20220422183012.444674-5-j.neuschaefer@gmx.net>
 <31cb9af1-173d-bef5-64da-ccf5a01f2485@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CZHfdAoeIHmEJg6q"
Content-Disposition: inline
In-Reply-To: <31cb9af1-173d-bef5-64da-ccf5a01f2485@linaro.org>
X-Provags-ID: V03:K1:nBEmoewX0m4zGMA3/a3yHcdhNWlEnkyZQK6tdFT5oIrkxnj8Jfv
 dh+5BhJW3MisxUBFMF4xh/ERB6JpydlwuzBohvbfDSV1O0gcNP/2uzihbVvF914FkmE77Hm
 eBoxOGFMLQGBGKJJYU6tGJezyAUCI66pDwpDLmi1ykLz2s1/057XlZFiq2iDAFlkSJq3ekn
 vfPlU327v/6BaL6Ow7YTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P0wbeQQbqA4=:Yz9w6OZOygUTfgdvqfpKev
 zh0Sznvp1Mi0X9Gd76Ecj1euzsLJmOqkjVXm3N3XGT5V3S484dCRE5wKw52VNe+iCLyUKOpLx
 /dybnjnAE/dclj3GMQ1Q50tXii5xc9A2Fy5scwQBjilxPMKX85n0G2hCHT/HRk2ENOvsCy+uw
 kH71LmGu2+PYsxz3SdPZCuLR+hj/q6mbMaAV7LUgJCYX/i1mA8pNlRqKcSq5Cbbc+hSkk27Ug
 5Iw9puL9+lkLh6OTj1acYxgF6A2iljUNZusOLxZgzIv99N76OJx+WcbooIiqvmZPF7VfQPNgh
 ebvGmg3fYSOJ5H5+J56L/Rw+62GdbFKtA3t0VogkX/HdMrUFCCrRpHDiJshS3c2fCxK1bzO3a
 nnreGiwNrWDXvHQHtlA8qc449/32ddIg5O8iOfyJMlG3euXt3cCUjVtLQ+mT92Qg3KdnoHwdR
 QGha+f2X48cwo/em01NnfTgCFni1wrvieiCt7jw71TFhL3up6Bi47Xai0THDmv6l+vTvVc7e8
 B+ioiorcGQa8vq9PpLYwApuzt0Bhwf9jdBGWrLW/f9B/KIaCAlsknd083MPtfQPrb0KaJ4iyU
 T4Uxy6UY782PQg/7fU6a9WR/NHMdQjlJrzkv8w3MKArSsWhRfV8mzqje+LWlv6SYbOn5XtHEy
 b62NG1ktrjlFgi4QtZyy9YQZchku8XnR6MMlucyKtkEcb12SSV80CtmP8z04k+klkfhI5UHi4
 XOOCGHKm8uQIUNLTdNAPJu4GI4sChUYe6VyKpNNts0j1zl5qv4FT9BDfkbGaXQlVFr/bkRkNb
 xmonY+uEzYBTBwTjFVvw23Pr2xSnNWBJ8STBOeKT9m8DF2VTXSV3p46aRaQtk0LvZHkQJ5FnL
 kkPjhu+5dSLvKrGJHLVKe7vufS/4Jnc4J52IJzDFiVAnB7HRKDyVIREQmZbQr6KDyznewzqjp
 D6/KWPP9AV9+fURw8L+VctmeYoEuRKoKnhWK71u7w7FhC08Tb1n+8jV+xH52fB8598JMF6pL9
 etoVgoRRcjHyzWK+Q3VWEQvOSK6ySdbXmo3aYzoP7PO1vxelCxbleKAHFFuS+NYueZqYe4748
 JnJAyEvVcitoJE=
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 linux-clk@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--CZHfdAoeIHmEJg6q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Apr 23, 2022 at 11:56:42AM +0200, Krzysztof Kozlowski wrote:
> On 22/04/2022 20:30, Jonathan Neusch=C3=A4fer wrote:
> > The Nuvoton WPCM450 SoC has a combined clock and reset controller.
> > Add a devicetree binding for it, as well as definitions for the bit
> > numbers used by it.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
>=20
> Thank you for your patch. There is something to discuss/improve.
>=20
> >  .../bindings/clock/nuvoton,wpcm450-clk.yaml   | 74 +++++++++++++++++++
> >  .../dt-bindings/clock/nuvoton,wpcm450-clk.h   | 67 +++++++++++++++++
> >  2 files changed, 141 insertions(+)
[...]
> > +title: Nuvoton WPCM450 clock controller binding
>=20
> s/binding//

Will change.


> > +description:
> > +  This binding describes the clock controller of the Nuvoton WPCM450 S=
oC, which
> > +  supplies clocks and resets to the rest of the chip.
>=20
> s/This binding describes//
>=20
> Just describe the hardware.

Ok.


> > +    clk: clock-controller@b0000200 {
> > +      reg =3D <0xb0000200 0x100>;
> > +      compatible =3D "nuvoton,wpcm450-clk";
> > +      clocks =3D <&refclk>;
> > +      clock-names =3D "refclk";
> > +      #clock-cells =3D <1>;
> > +      #reset-cells =3D <1>;
> > +    };
> > +
> > +    serial@b8000000 {
> > +      compatible =3D "nuvoton,wpcm450-uart";
> > +      reg =3D <0xb8000000 0x20>;
> > +      reg-shift =3D <2>;
> > +      interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
> > +      clocks =3D <&clk WPCM450_CLK_UART0>;
> > +    };
>=20
> Skip the consumer example, it's obvious/trivial/duplicating.

Ok.


> > +#ifndef _DT_BINDINGS_CLOCK_NUVOTON_WPCM450_CLK_H
> > +#define _DT_BINDINGS_CLOCK_NUVOTON_WPCM450_CLK_H
> > +
> > +/* Clocks based on CLKEN bits */
> > +#define WPCM450_CLK_FIU            0
[...]
> > +/* Other clocks */
> > +#define WPCM450_CLK_USBPHY        32
> > +
> > +#define WPCM450_NUM_CLKS          33
> > +
> > +/* Resets based on IPSRST bits */
>=20
> All these defines should be in second header in dt-bindings/reset/...

(my reply is further down in the thread)
>=20
> > +#define WPCM450_RESET_FIU          0



Thanks,
Jonathan

--CZHfdAoeIHmEJg6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmJqVOMACgkQCDBEmo7z
X9vnhw/+N2WvEeFLjx6SYLnNCDrrEq7sZT/nUTF0RwV4z6plsEEsFn+h7n/yuxzK
Wtm/GauP0Ap2J4ZFMyRXpCdWHWCNyt+j4Vjjl1KXBOEUQ9MwShPT9NbaFE8dQLnN
ZTBi7Xkobv/5qa9OhtCw5fYpfnqQYiXyjlFmDQmBLl8m8q/AjQutaGthRXxqOWbp
K0CuC2eDWD2iPuvTaURoTgjbEKP7FGt70Gz9Yq5T8DT7CDWz9ASkhC76SFxDaKgZ
u2CEu2G3b4KQwpl4cxR+sxuIXzlaX6615BbmDmdIEQJicwy3XCADmlRHdSbsSjoX
sVSBA5k/Gyji3mbdpxi5uMtexeZooGZxXqBlR8u+PgYa6xK3ZnfJ012zidRFWK62
+AebbaIJ9aIcTcOU+5ZrOXvawHzPndNzMKEVbJyfwZh95kDuGJXPNiM/csPI4gVP
G27nYNUdzN1go/SkFgEoM+0BXipbnryIKdTt+W1acLY1zbUK8JFqsVozn8RxXdqX
Xf0T2REw4ym76zbZjOn+aB3BEHXhmYqTj4JKlAhPjgaWbCaPQHT3b5rn8a9ptp03
FzSkkLu/6KvqTgKVy2ECmLE8JWD/GfYZOpQexZD7dIaiw6+xmVw3p9WN2EkQhsm8
Ad6XfQKFYFUpXZ+qzxZ+ZoNsE1baknGGwv/l+j2OW2jaTP8Vr6Q=
=+C+T
-----END PGP SIGNATURE-----

--CZHfdAoeIHmEJg6q--
