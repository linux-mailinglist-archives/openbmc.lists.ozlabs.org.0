Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0985ECC2C
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 20:33:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McSv932kgz3c2N
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 04:33:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=R4qxv5tn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=R4qxv5tn;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McStf3QNKz3bmK
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 04:33:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664303595;
	bh=53cuAKl4+6V2r0luXj5DLEifbyiTT6MTrfmNNiUmdC4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R4qxv5tnCRSe58L7/dI/DH5vqWO6307gOuvUXqFdDweRgEBloJcqxTKYGVjbEcf3a
	 XjU0pbzoSzUtJzIUBjEIjp1EHR7RnGRoBUbIVkRpCr+dVCetFXgQfzTrl8VeVkPfTB
	 RmCLGqapyg2Ix6q2HBWNrr8NXkDRIiu+lLWJzEKs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from probook ([88.78.142.174]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1oWgs724sK-00B0KS; Tue, 27
 Sep 2022 20:33:15 +0200
Date: Tue, 27 Sep 2022 20:33:13 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] pinctrl: wpcm450: Correct the fwnode_irq_get()
 return value check
Message-ID: <YzNB6eg/caVtPEHA@probook>
References: <20220927175509.15695-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Km42Vwm6MZWulEDn"
Content-Disposition: inline
In-Reply-To: <20220927175509.15695-1-andriy.shevchenko@linux.intel.com>
X-Provags-ID: V03:K1:GBttuH6Yja2j0kYfXLwCxLfKcE3uAKwo0uuhJHsSqCOyY6HKIGN
 2sHYF8ZEnW41xYiw+bnIjMztGptrx22z9Q7WXqQMvksDyffK3Xk6Abvoy6HVlZvtDyEieml
 6gCDQtFzWXNJZVHKQl+RlFrXyTDCHQyT3+5LdKMEPxplZ0JRuRhkx0S27a6nMTODEu7/d8w
 TUZVZLycXpvXC2Ry9N92g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j5JOV09qQco=:74LG8tZoC7HdVWImdEGlqf
 TPnCF/o5vdpLc24PXvcKCSHjj2mwrXqQ16QMb0US5qBbEb6zsS+vEdizTsv1CgfevCCzq65XC
 g2ZS6sPnk+0+2xk2IgdevhsQO6F95kraeoA2+SGe3zB2/YpZyTjselpnhFayEJUiSXjxS8d9d
 BU4Y7lU8bNdsCPQRGfJ5+ag3HsKWfkDaMwxO3FyiJsChSHuRdMzzEr3yamazWMKUlCRNX78Lc
 aYUssuASvB/xBYHdEbL889n8JwBaKnY65r1CAvRECNpce40fheeAp4mIyxJkv2dK604eiLWb7
 A5Ab2IJklER9wKR9DRXXjmZGgldv0diNMFZpMwapxdWYM7HCj1KlOiVG/mGkDkr17z3L6rem6
 3BYbCiXkeADtKCyTS7tRRNoWZWbe4ZowuLMsdt3bH0K2iX0mOla3rg+A6A0tgJTa2sw3s7Eww
 X4ch5Ujg0sLz6XBN9ziM8GGGE1OB+hAE0c5Nr3ir6uUIUYKO6AEtHFCRmh/wSvc4MHupyN7hm
 sX+yj4g/HWECdvHDy0rVbUkD469e+RRi67E+8yjI/Ed0uB5VgcJD7gIWwUT92zfLWAGEBfMys
 S7DZlh9a2QCsoAMgI0Xz4Qn+BD+1vg/xIJDMNy2WWu2t7e9dHAm8mgL5eB0g4tJYbK83AdACb
 9oQmAqPSqmTYXmz+UUSC63SxLhq2F+yxVgNN98sO1MBKvqUGPu2iNZvv+qsJOWVCBILsL/aGE
 DePliV+BVv0iwwwjWWcstG0CJHB0XI+/kUMe1Txxh3ENUrZAyZ+f1vEhPROfHCeyBBUKRYJBT
 JGvjiLASnWnLwX68sR2b0U+NxAgJMTnnbBAR00NIZ6XSVZkSDcpGAA4XorxfQfb62oeaBZGy0
 SMEk73GqRfEOjThVj64o5QX2UptV422A4wChnMft9N3YvRrCYYOd9rQ5iuCJ0P1tOSwtfgKE8
 T4/3DglwcMxVDj7027LleE5jeL/EDp8PE2nBaeXYvWE10yFB9vMcL8nAsroyBTH8cBKkjsGL/
 tZlvBXyrPBtiBenWUxvhWMRRTiNM1W80malcwsi9TiEW/uaT2iK85MQmhwjypG69TmL/O7vON
 7jdQBTuASjZAgBN51NCmFQ6SM8FdOu2/ARJ3fCGrWYjH+YQG5BULjMDFWYBki+KGxxq73UQ7/
 h8tRCEvwZcWm2qY918fHiOlcHp
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
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Km42Vwm6MZWulEDn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 08:55:09PM +0300, Andy Shevchenko wrote:
> fwnode_irq_get() can return zero to indicate IRQ mapping errors.
> Handle this case by skipping the interrupt resource.
>=20
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: amended commit message (Jonathan)
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 0dbeb91f0bf2..8193b92da403 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -1081,10 +1081,13 @@ static int wpcm450_gpio_register(struct platform_=
device *pdev,
> =20
>  		girq->num_parents =3D 0;
>  		for (i =3D 0; i < WPCM450_NUM_GPIO_IRQS; i++) {
> -			int irq =3D fwnode_irq_get(child, i);
> +			int irq;
> =20
> +			irq =3D fwnode_irq_get(child, i);
>  			if (irq < 0)
>  				break;
> +			if (!irq)
> +				continue;
> =20
>  			girq->parents[i] =3D irq;
>  			girq->num_parents++;

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Thanks!

--Km42Vwm6MZWulEDn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmMzQa4ACgkQCDBEmo7z
X9sndw/9H/f2KjwV37CMZvF046GEPoj6Ym1c02TBbGn2/DBvMpoS/Rp60VlzpwkC
8XUojHU+N8+YRscTc2A6WdSo4QSqq37oiC9H0Pqd6TBZjukG/kKpYZGLXnathsGu
HapskWBvxdqKljT3Aiw69Ttk+NulabMVXS6l8Nnqs9ERk44qlUQcvvR2ATPczHcp
aZcxaf4qrqXMDTqmv2K2sYEgbOG72NMVu24aeGhpPtDAFfOeQ6E8W7MYvEJsMi9s
PoPc3du+qbsUunnhCIB+ozfk9FgA0Asx2TKJo3gyr50fLcH3+OYo9yBt/qLg0vwW
54t14RAFlZJ1uMpiS9GtVTeaRf+Ihun57TJSlPMSPKCD8a+6OLk6SDiIbYHtlySN
AoGYdeGlErKsa/LPL366REj7sngwta1GHT3n0vTvl9f5/o5NOW88ILOwXXpMAMUA
JI4zAC8+rJRUmGXxD4yRnnhmz8UyjhRBy72AoSstB81Yr2TIYFWGP4K81KMfNNE+
NztMj0xmJnoQGBuSvEQsjm8lA7fXt8DLQPBVTfg9uyLmzUgteRwnGNKad9EmHGZt
F6NgSdSKlYOGVwCa9DME0zuv/d1ahW35FybPgZ5P+ynbC9iSXQEpdrsuw/zZ5W8s
K0P76rwROYwmWqBTdoePsBgPc4NCLWhiLGIN/reNDiSmcBXfAVE=
=JTuN
-----END PGP SIGNATURE-----

--Km42Vwm6MZWulEDn--
