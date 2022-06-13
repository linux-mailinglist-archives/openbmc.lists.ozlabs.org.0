Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42664548399
	for <lists+openbmc@lfdr.de>; Mon, 13 Jun 2022 11:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM6B212GRz3brp
	for <lists+openbmc@lfdr.de>; Mon, 13 Jun 2022 19:45:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LtmAWDnr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LtmAWDnr;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM69f3TwLz3bkv
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 19:44:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1655113483;
	bh=JV08/kjmQgd4Qe/JyQ5XWzd1+ENzu/6aRjVgufY/viA=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LtmAWDnr6zYw+r4RHApWEQM1jdjbDBPbkIHdoJ1c4PXyTf5hKUH9aF6M44pXtWdbM
	 sRWari1IWHC3oSKNsTB7GB6iegjFyGl83abNCisPWTmip8fTz5DRcSGY9Ox3NWpDf2
	 QhQjEGdV/M1xxp/DFqTt/GkN13EAzfmZQDfHJgGc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8qd-1nUfCI3Twj-00fBb4; Mon, 13
 Jun 2022 11:44:43 +0200
Date: Mon, 13 Jun 2022 11:44:42 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] pinctrl: nuvoton: wpcm450: Convert irqchip to
 IRQCHIP_IMMUTABLE
Message-ID: <YqcHClQU0hNYTbgt@latitude>
References: <20220610001609.276220-1-j.neuschaefer@gmx.net>
 <CAHp75VcLn5Ue0efoH_3kKJJqrD5OMbvetPh13FCQFshG9hnN9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nFuUPyBHrWNRC1jf"
Content-Disposition: inline
In-Reply-To: <CAHp75VcLn5Ue0efoH_3kKJJqrD5OMbvetPh13FCQFshG9hnN9w@mail.gmail.com>
X-Provags-ID: V03:K1:ganESRDkMTNhY/3vfP34bJRGjKRv1dXv6gfWQaz9IJ1+21uuv+Y
 Xd70/lMlnvkj1BupWk0HgtU7Q/kNhcaiQ88+dJ/GJbJFbUvGrliLPkXn5Y61mVepEMARZNs
 ZKuGwKTrQ/oOwRKhm02CnZdEJnW+gHhiq9ufzZa9qI3xQASwNO6OFx59r50xxi95Mx0qz13
 HnkNDfa1CcYqnS9ZNuKrw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y5stFMT5I88=:TidO2uItKM8jjIkwI9u6Ar
 BkBb+Gn4HmfTqh+85Q0T0O1trkKnvhW23Cph9ih9O8yX28DJxM7jd9F9YGe/vadGjd0NI0aux
 pLQbw92zSNWwtxIbiSjF0oH4ImwPNLc4CQ9fWDVg0PyTsNlgSJxFNsZqY4cNOVse8uH52CAQX
 Lznt6MTl3qCx8/NQt7lE/A1ebkgfKc0YWm0yKfttmBlb/s6AFmYiCzt29xn5o7wSKoP4p/3tV
 SVmM5zfALbtEdSl90Gfx6r+Oh5tDwafY05oCnT9QLeotKKNEYcFHkFFtKXZuMSPOhvMCTjQse
 YdkO7ShTtBXyBRTviKGG0EHmjaBL2MGf0pVt+IK2cnYiNo5Ocq0zoOxuyoEErkzG9c67Z9k78
 UfFuAntsvtArdAo0AyWXSJkIhh0L47jZZ2dWIruVuBj07E2Ryw3XrzTaAR4152jqHM0l87ItW
 ur2hcBRhYbXKDzI95qi2nRMhcgjxb37f2Pv3GxdhWrau/gaiYO9nrtkUgsv2BqqhVQaaDkn0r
 oAmZPS77b2ebGV6finM7JN3kAS5OXvekttvPMf0HFfX75k1EPhIHhNEOVWxf8jTF2FaA5Rchp
 IddQCa9FHG3PEhvO9GXrM1mWVYLddjV4ZUcwAOznBNnSqKxIL8bRtW1fnVnz3jNIJe0bRz3GJ
 gGk29vQwESKkqsjOlzyKpjIB3IviIqXsanf56/yYnSgNiF302PNPPA44//nN0qedY0d1DrHUJ
 FHaYpZ0GuZMBokXFnuIRP+4l/zE8mLV9VUh6O1FFX9LCKIF7V9DwL2yAay2/6Gq3k2gZanmgI
 nMKcxpjedG63YkWAJ54QA3aKPCkm93+AeLBtEV6dU/pkBKco2QNQ4DoT0SoY+MpCa0MBjgTBI
 HfzKTNs9v7qtDEGkvS7kL7SWv5AoHxgQnWHgotiEXu8t2i5LOFogwSFQEl30KiZnDp4gbCb7l
 4l3TnXsVRe0awusfDmcGfQJ9UoFiwKXggq6Owcl+5Va/kCbj4Svr1xBXJTmvWtl99DsexrMjy
 sveMmkOEvggiNVOoGpN1ZaHZhkjcJtIGo0oxNcsZecIOpsTGOOtDaIJvHqjygGvyyv44Id//D
 gK1gzAbOqCdoKbufPy3tGW/NkCuqRrrkBNxoJWm1X0C/sbZPMJRIiiXGQ==
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nFuUPyBHrWNRC1jf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 02:07:55PM +0200, Andy Shevchenko wrote:
> On Fri, Jun 10, 2022 at 2:24 AM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > Commit 6c846d026d490 ("gpio: Don't fiddle with irqchips marked as
> > immutable") added a warning for irqchips that are not marked with
> > IRQCHIP_IMMUTABLE.
> >
> > Convert the pinctrl-wpcm450 driver to an immutable irqchip.
>=20
> ...
>=20
> > +       gpiochip_disable_irq(gc, d->hwirq);
>=20
> > +       gpiochip_enable_irq(gc, d->hwirq);
>=20
> Can you use the helper (*) as stated in the documentation?
>=20
> *) irqd_to_hwirq(d)

Ah, oops. I'll fix it.


Thanks,
Jonathan

--nFuUPyBHrWNRC1jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmKnBukACgkQCDBEmo7z
X9vOiw//dDj/H/znJVravzUdFFJgpBmzBRjArecl9dEDhZj+Cgw7HXPNn2G0MgBh
+RqDSwTl+gtMn1n+a8sCt4m+O7inm4I29Za1AzaKTEfoG3Iw01QpCrHoFEyhpcpV
oeNoyTDBaj72D2XJmlgC5oMwFql5jtnOCh2gJ77Uoi7synnH4822GoleNj27zCpf
98Ch1TbqRWygSATj93FUHH0kPSLdWwYO1kaCofq80YwAOG+NkjBqzTEawdsb4CqI
DLc1Zu4sptwe6NrrqIgj1/iD4oTjc0oYUnH4R2QY8pRF1LBS5y/3yLF3EByqww5z
vY7Rv0j5qwM6yjYGb9mD3Ig7nhKk8/fGk/1y0QNsti21Gnz6wY6Wz9smfig/6X51
7fIYUrRBrVG6b9nxGuhXev5/P5s/VxkD87RpBHqXKGdJf9PMMt8EviYwy1Ys4oHT
NucOrKLS3ErEiNG63xTiwEMYflaVvpJz15PJ4hLZHrHeUx3bV5MqHeV0F/c69rKf
NVWyD4zuhCU3u98Pbfvrdlhz83rfEWmNdC60PQ4Qwg1MF5yQR0B8ZjmKjCXvC1yU
Id6Svok5zN+WdrYag+aYyri7F52ny/YEAYLDBJISzHDxy4471HSlIF8pTIdHJeVn
YrPTuNChRzjXRTTq67Kl+1SmuwYUyMM3q9Ej8JtQWYp4mPRgOTI=
=I1MA
-----END PGP SIGNATURE-----

--nFuUPyBHrWNRC1jf--
