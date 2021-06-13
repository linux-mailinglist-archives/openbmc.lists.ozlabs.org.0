Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D9F3A576F
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 11:53:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2qfF5cZKz2yyC
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 19:53:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=PBD7O8uJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=PBD7O8uJ; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2qdy6sKJz2yhm
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jun 2021 19:53:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623577992;
 bh=0kpyZbGSx5JAM84EgmJkbBps8ECGSxZ3E65rk8u8364=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=PBD7O8uJm09k1iRvPDbQAvQGOQr+wC6zAdKun87vrGvv+uz6Ljapvdt0rzOjytdNc
 q8amxIPNn+Hs4RfMzdZfS4/AXiDI6QF5JlQgkCPnBYYQDaixYbTTBHmsSOBGXa1GhL
 ofyekc/TChbdzf+UM0umPfZj6U19u2OZkn8m6NwU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIwzA-1ldSa22OOg-00KNPF; Sun, 13
 Jun 2021 11:53:12 +0200
Date: Sun, 13 Jun 2021 11:53:11 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
Message-ID: <YMXVh9FiW9SOWUCV@latitude>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-5-j.neuschaefer@gmx.net>
 <CACRpkdY6c750Dnh2H_6uEhOHJv-kLd_OpHqnuDKu4DQezZ2C_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eeAjEw1TF8Acq/Ni"
Content-Disposition: inline
In-Reply-To: <CACRpkdY6c750Dnh2H_6uEhOHJv-kLd_OpHqnuDKu4DQezZ2C_w@mail.gmail.com>
X-Provags-ID: V03:K1:w8V/EC+bd+jIcKisoLQPcYP8Xx/SbGdpKgtGNr0oSPFe3hawrXI
 iSrPtnSEMlCzm5mVFspA4U+O1CTWaHqkmAXIoOtPt8rLVnTzl6FWFPAZS3z9SG78tyOT4rB
 j6rmhY8MrcimQUUTe+nC24mL0aAfEczemru/r23KKf+XuKqzUZnxDYjFb9xukRy0LPcgrPF
 /vTHpr2b2H2geeEDl3zEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JT47csGo7bg=:CtSzEQvlfbTQAHx/iqp8yl
 i2vMKWSa7NVsTQbkQ3cNOHXp650+6/M6HWiFjDk3nVEUSUNKWBudPMln/9Y8wCksTrin00/HE
 FxC1iQRhTF7YUzIEtN/GHLseFDU10YLTMqccQSUI/kko+QASoFbrmZVhb67A5LN8iH6s9mtVo
 avTUkcNkTh3EFF4QA83RGeXQNML/cVKs+IU3GmZtBUWY+cWf+YeHhTaXESWTh1OWQf5ENkaoS
 9c2naFSZyPz3BLCnE/k4pWzHYtMsB3BpstNE+gOQoq/M6jKlW6849LNPOBEp8LaXe8XXKJ9zM
 CMsnf8ZtPk0ObhRKGeCPK/6QLG2EFulgXzck8TWYF9+Od2xRNaEeChEuJMr6e/irzoFV4lMjX
 E0xhD/zYloucj2Z7c4hoLI5SZIeqUAo03zY7WWM8zybhg0qJefMsCq59XCNwge7aah8b71b3m
 qIj27SQjh/gxj+QtAV6SPfOwoyqOHl/om8Mbts8lId3622T+OCSvk9Rve7Dwx0Zz47y6Bmzy3
 b3+SCw2ezf0ZJqMOHDlZLkeaXu83KmOXcXEOTskXlzNbsbHsdvj4b90oeb4X4rOvfCccVqwRm
 GV6OYCwiAgtBL9G2o9yK53B1jqHFW3kj1lG2mJXLmt6SnN7pAFJiKn+Q5ZfKv/SCQEs5ZNPls
 keLee2WLO4JQxX34x9WNJm4nDcQmwfa46q2I71oymE02Vmm0oRrF2YWpFdrMoh8QPLLDZmDuj
 KBRneQ/vFZdapH+iPqFVXCpR7bobOUUq9BPbCubcTCj68PncbUeOArtHppU/LsihwkAoY3ZTI
 CDad6WsekDiOZLy1OA6HK6ipFFdCotoagLrkh/pz2q5YUamT1mvzjdcc7intVQnxXpZjkz/wY
 wMgVH5GHSkR13Vh/ZlhUlKxd3dqOuRpzJHaaXrePwjNT2mEXOHXzqLNdOf3nTVNBTbdPVKM0e
 pBYX3Cq/BicifeO1at15h4bklrxZMa5VytBmhrxBFeSjqbp1KZBaU4UrQZKkVwQdAQc5VFV6U
 dkhEvKj+EkK36wFR/Zubc+5fyhpfw1wY5bipaR+iO1cBVhixpU+UnZUs84rXz10FRa/pk6eSG
 6TsVOscYKH9/7VQ6b9Hx7BjPeQEt1kXh9qu4cb/S9b8SGwB3YGOPSI1yg==
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


--eeAjEw1TF8Acq/Ni
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 11:35:48AM +0200, Linus Walleij wrote:
> Hi Jonathan!
>=20
> thanks for your patch!

Hi again!

> On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>=20
> > +  interrupts: true
>=20
> maxitems 4 right?

Yes.

> Make an enum:
>=20
> interrupts:
>   - description: what IRQ0 is for
>   - description: what IRQ1 is for
>   - description: what IRQ2 is for
>   - description: what IRQ3 is for
>=20
> And describe how these interrupts are used.

Good point.

- IRQ0 is for events (interrupts) from GPIOs  0 to  3.
- IRQ1 is for events (interrupts) from GPIOs  4 to 11.
- IRQ2 is for events (interrupts) from GPIOs 12 to 15.
- IRQ3 is for events (interrupts) from GPIOs 24 to 25.

> Because I am suspicious that they actually correspond to 4 different
> GPIO blocks, which should then be their own nodes.

Unfortunately, It's not that simple. The GPIO ports (as defined by the
groups of registers that do GPIO direction/input/output) are organised
like this:

- GPIO port 0 starts at GPIO   0 and is 16 GPIOs long.
- GPIO port 1 starts at GPIO  16 and is 16 GPIOs long.
- GPIO port 2 starts at GPIO  32 and is 16 GPIOs long.
- GPIO port 3 starts at GPIO  48 and is 16 GPIOs long.
- GPIO port 4 starts at GPIO  64 and is 16 GPIOs long.
- GPIO port 5 starts at GPIO  80 and is 16 GPIOs long.
- GPIO port 6 starts at GPIO  96 and is 18 GPIOs long.
- GPIO port 7 starts at GPIO 114 and is 14 GPIOs long.

(They didn't even make it so that each one has 16 GPIOs...)

As you can see, only a few GPIOs are connected to interrupt logic; most
of them are in port 0, and the remaining two are in port 1.

Forthermore, the GPIO ports don't all have the same set of registers, so
that the register layout of each can't be predicted by the offset of the
first register.

>=20
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    pinctrl: pinctrl@b8003000 {
> > +      compatible =3D "nuvoton,wpcm450-pinctrl";
> > +      reg =3D <0xb8003000 0x1000>;
> > +      gpio-controller;
> > +      #gpio-cells =3D <2>;
> > +      interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH
> > +                    3 IRQ_TYPE_LEVEL_HIGH
> > +                    4 IRQ_TYPE_LEVEL_HIGH
> > +                    5 IRQ_TYPE_LEVEL_HIGH>;
>=20
> So these.
>=20
> > +      rmii2 {
> > +        groups =3D "rmii2";
> > +        function =3D "rmii2";
> > +      };
> > +
> > +      pinctrl_uid: uid {
> > +        pins =3D "gpio14";
> > +        input-debounce =3D <1>;
> > +      };
>=20
> I challenge you here and encourage you to put a node for each
> GPIO "port":
>=20
>   port0: gpio@0 {
>  ....
>   };
>   port1: gpio@1 {
>  ....
>   };

Hmm, well, if the unit addresses simply go from 0 to 7, rather than
encoding offsets, this could work. But it won't help much with the IRQ
problem.


Thanks,
Jonathan Neusch=C3=A4fer

--eeAjEw1TF8Acq/Ni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDF1WYACgkQCDBEmo7z
X9vvgg/+NjP0ej1MKT9aUcOcF5Vp77+zynVdqbXduGemb16BNYTXsULObigZyQqe
5LJshwRpK5jRZNRIdWDscndY+rzg0vwjlcG0lF75a4Ol/bWs/uI/d7sIaZPO13s7
zfCWLw240N1NkNFDcK449Z1OrQ7nAkn6BEeJrZ1TTBHV6GyTGqD7WZGMRCA9Kcag
xFwjRNWEhxeuxaQklbm1PADy8qt4WBk7z4yt+SGZmJYZyHloAFJOsHVIiOlxSYQH
DWoFc9ydsK6jK+Rxdo8Xsgt7G2Ei2u/tBly1og5iR9gWh2abA3pO2xLIm9QDud9+
hIwPjzH/XAUbqVFy6fGmOM+qif1Uvs2rAcybx5ewRQRFhA7mQeOd3Wfv+DW05QXG
OKHBR0fGeqqE4gHBTscy5eftpmToIczYwFP+oZx8uIksReJ3IQv3SS5s9JjHFoe/
Yy06P8rm06jqvt+cZeSEg55yLe95IZvVMZxbbGNhRXF80afMExfVLBx6YJaSI8cz
7aHmTlDTG1HyLdCTLrDBDB8pP+fke/FN+uBiJucEg+jzz64qQheW30DyKjlSMP+W
QCx3k9eTBl5AzPqvpEfQwMcyZpMdMFpwg3Dm/kulKU/zIwI4nu1Ef1+5aTz8T+Ze
oRnm+9VQmzSV0W2HC24PxJrtbmpTbID1XRN/95gZfl0K17OFuZQ=
=negl
-----END PGP SIGNATURE-----

--eeAjEw1TF8Acq/Ni--
