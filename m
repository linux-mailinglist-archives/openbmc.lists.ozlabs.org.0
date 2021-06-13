Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0873A57AE
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 12:27:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2rNn3C4hz2ymb
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 20:27:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=VoOw6l/G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=VoOw6l/G; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2rNW2kxsz2y0C
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jun 2021 20:26:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623580000;
 bh=d4E+kciTQxcNlP5jSRxQvEg4hYKuus+UUXiR7+u147Y=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=VoOw6l/GPeE4xqQYgqKWY8Bhm9f8AvkOEF3NOV+91A7EbzSDuUzmXS/xgT0rQol79
 BTN5TRo1X+olvtPeeNv/42/4HZUPGSaUUZ9FQlpYlNAOwCaC1iT1WOuozKCzjsLkBZ
 QKJ08Ik4yNeJAt2zToNTJjsSZxiUrlhyz2LGWcEg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1l2BRt00Fh-00uXXE; Sun, 13
 Jun 2021 12:26:40 +0200
Date: Sun, 13 Jun 2021 12:26:37 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/8] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <YMXdXY+R4e1m3nbx@latitude>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-6-j.neuschaefer@gmx.net>
 <CACRpkdb=8e=D9JdwxA+oPGj80WnsV86apuECBp1m-Edd+hKPFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4WYBDV7PX24WFKS5"
Content-Disposition: inline
In-Reply-To: <CACRpkdb=8e=D9JdwxA+oPGj80WnsV86apuECBp1m-Edd+hKPFQ@mail.gmail.com>
X-Provags-ID: V03:K1:xDElZdTm30JePFgpUqRFCJry4/CcaELo2vki50JqN2GNP87eerU
 CMUVtFIPMZGLEOQbIvRb95mh6xRKsRABGWfRRbbQlcGPhIJgQGFoUFejPN/tdKVmWQHgk6k
 gqZ9jb68naPqkOBiXEEOtEUFW9TvqgXl4HxQJF3wvOzabaT6luNXXLdEjcHhjUQStYeGP7z
 JY5L4qE6BR7xAxAwd7YwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VGEL0/EOpvk=:68gPD6XLLZrtbjYwkbMxMV
 mlZVE+YdS7bUos8wvhGhURtz+RplzvBxj6MlqXOyyP9kR7GP/aY+EYT0OWuUqWQnNsMkfnivh
 zi/SlvHOieewSVa1GckASeMQEWuqOl5OYNLouVngLeVh4OIgCsCzYSZf/RbAH0kB7K0A4Rgho
 Ndz/iMOxeDppWUTGyz5sS17uabzwihpiJvUDk3zzmeGimRf+3ix+NyU2lkWkfo+Fz2Aox9yVc
 mRXKR4bXoJkPkNMJlxLJDcj/c8JBKAJe8NrySFH2tH+5tqYF/7k2J+yL5aOj8K+iALXYENTYv
 VtC4pHnxzaYm2mvz2IN2WfR3ssK0U03SXhRso7SOi6wjNs+HtCf3zXNnwwWeFFTNT0XfFeM0l
 tidBDwldtWQQv7AnJNQMrvMxPieUQl2XObvR7x0STZ8mtSTed2PRUBS7dSa07AsG62ZZXwpsv
 AdkKGJx9Lo7PzVuA1nA+MWRUEU2mUZovM+FMQbb3wDKFOVZbx17k+ahVJZhC5Bh9CgYEz2gOS
 qi8Oyb7D2NPrn0ReFXyihj+TRJzSrCC3h8il4BXkTrQnnzH+v0YURwc41rC6ODZYJFY5pXJbf
 J15JXuVxAXRdDJInq7EZL/GkVm19gxQjYBwF3tA7prew5xkvAz696WQEf90gW8gPVXLg6gnC2
 oDFscLsaSvs8PToLzfm4VTBzzMN8P/dAttNogf+XGrvq6JRJT26WGuz0CGtLE6oAbTpeKnArj
 +nOedFkoot0Jz8YuK1ZHbmGXdgJxjhhxx8CeNHc9XeYMt5TJZOk5QfVFi5nfO753tJvKe0xxm
 sWU7iIuJWHHEyma3PxbsLq+8STnAvVfbkoWgiLkx/EkzYBbMhBEMhQVeAVWEVqyXlVaDj8m/E
 wHXTTuqJ4k8V/60nRP04PHq0yl2IgQYneExpg92FAE59snWUNAPZJGWUYEclbrPpNxNqFw3ib
 /oc/1b5PPwIsOVmN1gW/lNXKxxf0/VHA0dhtYPXfBCEYKyrRhBjLjOVzAGKuXMyfQp2OwqhjW
 EHulGUolczcl8DTTJEV7y5UxbL/UnA9i+2y7QdkDxiljkd0SQmqae8jd8UhtIeuSyB+Y+Gik/
 PQS4KIrPf40xZdmZQM6KhdbBtqaCWfpKAZFtK1i/oBActOIRWM1Q/OdZA==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4WYBDV7PX24WFKS5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 11:31:07AM +0200, Linus Walleij wrote:
> Hi Jonathan!
>=20
> thanks for your patch!
>=20
> On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > This driver is heavily based on the one for NPCM7xx, because the WPCM450
> > is a predecessor of those SoCs.
> >
> > The biggest difference is in how the GPIO controller works. In the
> > WPCM450, the GPIO registers are not organized in multiple banks, but
> > rather placed continually into the same register block, and the driver
> > reflects this.
>=20
> This is unfortunate because now you can't use GPIO_GENERIC anymore.
>=20
> > Some functionality implemented in the hardware was (for now) left unused
> > in the driver, specifically blinking and pull-up/down.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> (...)
>=20
> > +config PINCTRL_WPCM450
> > +       bool "Pinctrl and GPIO driver for Nuvoton WPCM450"
> > +       depends on (ARCH_WPCM450 || COMPILE_TEST) && OF
> > +       select PINMUX
> > +       select PINCONF
> > +       select GENERIC_PINCONF
> > +       select GPIOLIB
> > +       select GPIO_GENERIC
>=20
> You are not using GPIO_GENERIC

I'll remove the this line (depending on the outcome of the rest of the
discussion).

>=20
> > +struct wpcm450_port {
> > +       /* Range of GPIOs in this port */
> > +       u8 base;
> > +       u8 length;
> > +
> > +       /* Register offsets (0 =3D register doesn't exist in this port)=
 */
> > +       u8 cfg0, cfg1, cfg2;
> > +       u8 blink;
> > +       u8 dataout, datain;
> > +};
>=20
> If you used to have "GPIO banks" and you now have
> "GPIO ports" what is the difference? Why can't these ports
> just be individula gpio_chip:s with their own device tree
> nodes inside the pin controller node?

The naming difference is a fairly arbitrary choice by me.

The real difference is in how the GPIO registers are laid out.
On NPCM7xx, there are blocks of registers at +0, +0x1000, +0x2000,
etc., and within a block, the registers have the same offsets.
On WPCM450, the registers are all mushed together as tightly as
possible[1], so that (a) the ports/banks don't start at nice addresses,
and (b) the register layout can't be predicted from the offset of the
first register in a port (because not all ports have all registers).

> If you split it up then you can go back to using
> GPIO_GENERIC with bgpio_init() again which is a
> big win.
>=20
> All you seem to be doing is setting consecutive
> bits in a register by offset, which is what GPIO_GENERIC
> is for, just that it assumes offset is always from zero.
> If you split it into individual gpio_chips per register
> then you get this nice separation and code reuse.

Indeed, if I keep the wpcm450_ports table but use it to call bgpio_init()
with the right register addresses, I think bgpio_init() can work.


Thanks,
Jonathan Neusch=C3=A4fer


[1]: https://github.com/neuschaefer/wpcm450/wiki/GPIOs-and-pinmux#gpio

--4WYBDV7PX24WFKS5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDF3TEACgkQCDBEmo7z
X9uaQRAAgPgT9cAFmkTos1fzl8wauxYh9+aWU8XP1j3aKFa3dkNRBwqe6dKfp8lm
VeyK7U9Tl0V5nunMa26tnD2/emiP4DYSqwUlC6YdItePWflbl7XEm3M56MWQU6eQ
Y6QkMEKrKU8CoRvjA/kBGrsgzCdR0NgNqmhnONuGZuqUJqsOsRkDfYwjHGdybHb7
1WVTLzDW6wsWFmLjKUkxxYCFaxN9EAFpYY00Bb7SD/x+bFhW1GY0rwBuMXKltITN
iQAnpYvj5GZpYZYmXtIlEoGvXj7U2ScPtNQNojE6cPL/pu7In4Mi6GdkO+OYzmb0
bsod4VMccwurLUuF2TdVmLb8L/8CGfGgPuq2EpRrnX4pTLvReZrFRPiku0mioFjH
hPre6tpLtqSA3AXF+R0S6Y8vF6800iFMTwgJx5tqATSHkjpVZTv1VlFQnynHF2mA
XXr3RDdeXa2zcQbm/0uEs5rpFN/4xmMUVvNjvlHgdTEBchLMYn0Ua1bwDHIcnoal
ozd8VH5Paq/vJms8wlJUM2sdqrgYDef1++IH5JYifaZ1NVCUfYHlAsIbgT9swsQa
NjKui87mkPU+Xox2/Aaq3oigOjyg+1LXtz9v5aikhhROkHHSTom7oe0CjZg4/Uf+
j6ISpEZRPBac67UiKJuNYfApbZIFg/4s7ZAECQNgtWDJWPEnlts=
=OZD3
-----END PGP SIGNATURE-----

--4WYBDV7PX24WFKS5--
