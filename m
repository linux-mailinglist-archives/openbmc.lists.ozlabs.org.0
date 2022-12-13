Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D792E64B7E7
	for <lists+openbmc@lfdr.de>; Tue, 13 Dec 2022 15:55:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWhPB4s0zz3bsK
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 01:55:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=EfYG+kjI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=EfYG+kjI;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWhNb49bLz3bgF
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 01:54:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1670943238; bh=p2V7s/+ws7X71BvYRIZHw7xsRmehJjPbd5XZsH+u/kY=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EfYG+kjIktEbtgitzOXzPiOmwbfKYZrdBcFfzvLXgM5ccUgKcRm6x57W46TG7PxBB
	 ORQ3ZDeBcniVBw3lYH0D9U6yORuMyftys+LFinsIWieI369Y/ZA9rzE7JFqMbTTizb
	 QbmeSraKJGkxs9N/AkewwQeI5upq0QdhwJEfi2gdKMQp9cN0cuEHiqJrV31NzAEY5D
	 taWNh7m8/ySvMNLj/QVXRUode3imfeaY6FB3rky6iD3CrE+HWIe0udQRr0PU8Mei7Q
	 BvwneEl4BmvQESWI9oqsCkW79E1sSzh/Dn/dqPS1DlGDURcZ+B9VUPM9bmcYiRV+6g
	 lvzJK8mURDP9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.166.74.222]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbgE-1pLggE305k-00Kvo9; Tue, 13
 Dec 2022 15:53:58 +0100
Date: Tue, 13 Dec 2022 15:53:54 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v5 5/6] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Message-ID: <Y5iSAmJimekv1vkZ@probook>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
 <20221104161850.2889894-6-j.neuschaefer@gmx.net>
 <CAP6Zq1hjbPpLMWST4cYyMQw_-jewFoSrudOC+FPP5qOxJz4=xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BUhB5f8R8Qwj7WNX"
Content-Disposition: inline
In-Reply-To: <CAP6Zq1hjbPpLMWST4cYyMQw_-jewFoSrudOC+FPP5qOxJz4=xw@mail.gmail.com>
X-Provags-ID: V03:K1:qAZlPKx9k174kKCeqsHXUbFKERd19qHGzg2rpCT1Cq/gwIE/rSl
 FRD4UBzf2HLKJoR7aa60QRyfVkCJGa9VbOQ1jjer8b+RJcBuIPAQhHQ0jL39MfHu+s3D9fJ
 bopLEv1LIDJV/csOPud+R4TcdnTC6IBl3Z9+aenIAy4/0aMtUHaRO2Na30U0jwK/AiwBf60
 uzB6JKiSf4O9zNEpE5zRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gGW4xdaesKw=;SkdxK5f2/9uUDiqfD41ZIZwzBaU
 cYDhwjj/Jlo5LplNONkgLkYWeDsGvV4zmUl05FeLi9Z1Aw+9eEUW5d/Z/8mGS3mIVGxQRqsfO
 jnXj/vjUwUnuighzSRS6OB0Xv+di8nE4pT3SV6bNVkdah57Mub8AehzI9UKff5R8AXpre6Cdq
 TibfIcKqI1Eq8EjF4zLyYtBzmLbo1Q5WgOFJeClw5s6bKzZHlO40S4i8ecPhKsNNORdsh/cgJ
 vlj0zIE0pebxFiTRPjvgu68m+fkx1Z0uhzJM5HqvYpgbUTg1HjWI/xYqEywwOjFNv+yVL7K97
 tKAiMLlz75qVZDugaXs/12CO3KCR+lestoqmmmfdWlsEvk/Yib09e5GbZ+P496ssNcE55EgJ4
 /oxp1bioFkHob84fR1Swd9oiU6f6eEe6AW9QrW/PemtTx8T+vEl/1etfOaX0DkrLSybXLpOMD
 0T4HR1nJJyI7r1QEuT7WBUawXbj7l0Rd4vtK57d7lCY7qNu3nhFT5h1PTZbl+Bda4mhj83b5m
 w9qYEH9i8TfmqhevkTNz+F+NMEVr6rMCvAcxGqRLG6ljpMErZDmSbfbloRvIvh2YBrRwGHsoL
 O9tvF8m5QHXNJy403labgjzI1g+C4D1Xg6gNUkTbFaTWMfPDNbf/x6hRpzerHjDTV+wLpJOUO
 rn5/+BphkMigEtQ/xOu7oW8KLmWflIhcbYs5p2/Px2xE7fHyDYEpf6MoVitcQgoFb2pMmrF0i
 tbKdpfafkRkCf45kkdIupk1C94XzaqQygbBQX25RWsugFZrcLTgGzWbXX6EodQumGbVb3ArWw
 OZVfLeDkk0MDEV9y0gYBW2CP0wMs0Yk5C9EhIrSy1vMFldnR/XgpIML/BSJyenzy1+ejnlsSC
 oNR4o0IP1E7X1dDkFFj+pIoLuxgsRvaxpHhNcbLQWb5I/ti6sQV9XYSRT0Amjq3H9mXpEDuNf
 iorfu+Sxl1bq1yzK2mrnmRmZcms=
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, linux-clk@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BUhB5f8R8Qwj7WNX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2022 at 09:30:46AM +0200, Tomer Maimon wrote:
> Hi Jonathan,
>=20
> Thanks for your patch, and sorry for the late reply.
>=20
> On Fri, 4 Nov 2022 at 18:19, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.=
net> wrote:
[...]
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index de176c2fbad96..de5662830fce8 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -208,7 +208,7 @@ config RESET_SCMI
> >
> >  config RESET_SIMPLE
> >         bool "Simple Reset Controller Driver" if COMPILE_TEST || EXPERT
> > -       default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REAL=
TEK || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
> > +       default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REAL=
TEK || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC || =
ARCH_NPCM
> Please modify the default ARCH_NPCM to the specific Hermon use,
> ARCH_WPCM450, since NPCM7XX and NPCM8XX use a specific NPCM reset
> driver.
> https://elixir.bootlin.com/linux/v6.1-rc8/source/drivers/reset/reset-npcm=
=2Ec
> we prefer not to have two reset drivers when compiling ARCH_NPCM.

Good point. I'll fix that.


Thanks,
J.

--BUhB5f8R8Qwj7WNX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmOYkdgACgkQCDBEmo7z
X9sOfw//QKFWxH0SCpUDv5aBRt3V5G0f9oCvOuHlRz1crGkrzdIWLF78mm+rva0m
y+bUvpCoUuzhLTf8BGSfrnoaORrjzr4PgJXSaCMjjweSBMiG9PETkMtWKSA4rDCS
X1vaU/OeVHy2eW4qhkgTKAmapy95wnk8lmRgjdeLLRWuuz06bX10wrnJWE8WOox8
68QJNfQy76Ih5e/yh4lvhaWskzaUxuvLahWoZMMkX7xdUaV+bGfd4ad4tQXHwBy9
BPHh63CTwUk/aGpPjOJuycdJX0MMZ4h1UNmuHfN/z2f+/rdLF3DtGMS9CYSK+N6z
rosdZLiuzz3SQ3kB2IoCMbPq/RMtkqGlDTu/qvDh00mZd8DjaXS57u5Si4ElGjPH
cj9b6YhDhWJO4hQbnHPaHY4hFt6PGqN/odIWYbIxa/ekiEUY8hP9h/LZMAb3d26N
IUfbqHmb4iQqqLPL/E9NvAsMtrDbZcyHUtMztFThq16yNNEvWv1wqbO+UddcsfK1
6d45sgggdIbGz2nnvzAf4Ex+SUsp3pVnbqfMmDYmRpGYkwZdOBSXJejqG/OEXzYY
NVzMQcabti/Kw/u0rxyIYJUPgtdvR/lKWCtEACM7t6zqeVM/4DTsGGfmNXjyP+tJ
uMivMhp96c6eW9lkZTeMFBMHWyyrA5kGx19FRDbCdURM0qdLr/c=
=rO9G
-----END PGP SIGNATURE-----

--BUhB5f8R8Qwj7WNX--
