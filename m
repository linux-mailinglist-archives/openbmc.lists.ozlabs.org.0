Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017275DD2E
	for <lists+openbmc@lfdr.de>; Sat, 22 Jul 2023 17:23:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=LDk6irps;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R7VYH0hPxz3bcJ
	for <lists+openbmc@lfdr.de>; Sun, 23 Jul 2023 01:22:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=LDk6irps;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 339 seconds by postgrey-1.37 at boromir; Sun, 23 Jul 2023 01:22:24 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R7VXc4Dd0z2yW5
	for <openbmc@lists.ozlabs.org>; Sun, 23 Jul 2023 01:22:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1690039335; x=1690644135; i=j.neuschaefer@gmx.net;
 bh=DKp45IIBYoScM3gOq89irlgG4MZZBXYk35aNvXEQOVo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=LDk6irpsjHLbhBQ8tN0ugPkrXno9RfhJRwqRq0nGx1gEYWUN1IURfgp8IvDQuL5aRhnkzjM
 mq/NV5ufPE/RcrdBKy1Ddz/YhBcsIRL9Uklyv+fJ2ADbim8X4h6tJOv2B9Bi8t2mYk3wnJsBH
 8+J48Wgrw4TG2r0EvuzkYa3GfSFWYr0Qz+VzNn83Gy0bFInhjNf5KDi7qe1rinwLgtt1SKfj2
 yG0VbLqHWxZashf4NX6tcuRp045lgTweBQU1Zv9M/wG36KUo4R25jzYJZGl/bET4HOTnlmdCZ
 W+J1iliUvcV9mPGM8YdHP5iY6xq8q7nbcfKzeza4khHAYe0cGBuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.5]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5mGH-1pp9mS0NVT-017FN3; Sat, 22
 Jul 2023 17:15:47 +0200
Date: Sat, 22 Jul 2023 17:15:43 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Message-ID: <ZLvyn0xq3Msk+lxF@probook>
References: <20230428190226.1304326-1-j.neuschaefer@gmx.net>
 <20230428190226.1304326-3-j.neuschaefer@gmx.net>
 <4e0a5db18ed7d37038e67be0f1ddcb08.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xFMPhOBEsOewdD2L"
Content-Disposition: inline
In-Reply-To: <4e0a5db18ed7d37038e67be0f1ddcb08.sboyd@kernel.org>
X-Provags-ID: V03:K1:U3JFa06nPX+yAAtsBGx7TZSMDiakMlG1SjIVlktrFkuwfBB9xYO
 npBSX+mt1v6aO8JRI4lMroP4+yEhRco9SIzyMmPBNCouS17ywTTjDwXxdpol0cHFnwqAyLd
 XXYTiaUp4PeJXAlqSXZrR003DaxOanpw7Z93EUPlVq9B/8LTFJ98ujQbF3FzchNLIKaVktI
 cxoeOkLixXqT5UkPjahvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QQpIqyfNgTs=;SOFPQk7SzZIPN6QwbbEksHUd67B
 tc2vtOfrTiCbezM+XDDsLi2Szei+sfRGBvLsgtVbRWrN0od3TKiav+LROPk5m0j5OLp9RPmuc
 IiSylBYDZXFJm0tBPFUEhWi5V/lh6ecRLvN1rf/PErvCPsPfFJjh4DcTi3RZ2afaPipno/1Ds
 f9dEJ1qPVknycWS3Er3G7/5//CXrb6VRjdu6faDFCN3YZUVOoVmJr20g9PoT/htRN07CuzDFr
 Y+lUVPMDSn/7hraFZw02MCvI9iBI1QJfi8L3A/QlnX4CH4cxBwwlkQQwj0X0NOD+/FiNkG3fC
 Me9YsMvkDNkWhxP86I2SnK/GPk+18VEb3aspc13aoKoWm7aotJpZJLY60V12IXPnluOXrxVEb
 L4emgAGGgu1PjDUdrrWVaifXapUNNi9vxJgotQC9j4ogUfbqBMqdoIongBDCMAEv0kOGejIWy
 A/73+m5aTuJhVZuTN6VO4lDopynhViqpdB1IfnFWPeU782SkuRPIo2bDLdVwbMSvlWnNf0dfs
 7rOXN6+8WTZ5kGpRMNmHq0DoBbsgdvENNtQM6x8niLMzpjHeich6vEltIKyXmFw+COw9oaChp
 F3p/tVbd7OuBr5WEhIxqDvT9SRu5sgpmQ8bmIvasoddp5y6z2KLDdwUpRWzzYyv9kJzhT6PEV
 nALr6Ce1vaoNjtIAJ/7qkuoRnBja67kClbi6no5SBRdKFvJktY0j/+5t0o2jDaDLOuZr9s4Nu
 e+7Fed2kfWRwELufcjJ+TwHHHoBct2AJVM0jJYlXX4JajXf41BePpKJ8fORfDlPHawwpv6wfB
 eEBr62OL3UWM5oRP5K6kt7wUpPpFXgOwC7Ko8CIZSY7OdQ0SfPzXYA1Wk6f51+B7xrj8BIqb9
 44blDluGsckzADc5duNIcSOMhG7OkshzqgPclEQOcvvnJdFVk4NXQ+mqwb2nbfApXrYAEGaQS
 k14NiA==
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Tali Perry <tali.perry1@gmail.com>, linux-clk@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xFMPhOBEsOewdD2L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 05:02:15PM -0700, Stephen Boyd wrote:
> Quoting Jonathan Neusch=C3=A4fer (2023-04-28 12:02:26)
> > diff --git a/drivers/clk/clk-wpcm450.c b/drivers/clk/clk-wpcm450.c
[...]
> > +static unsigned long wpcm450_clk_pll_recalc_rate(struct clk_hw *hw,
> > +                                                unsigned long parent_r=
ate)
> > +{
> > +       struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
> > +       unsigned long fbdv, indv, otdv;
> > +       u64 rate;
> > +       u32 pllcon;
> > +
> > +       if (parent_rate =3D=3D 0) {
> > +               pr_err("%s: parent rate is zero", __func__);
>=20
> This can happen more often than you think, so probably best to remove
> it.

Alright.

> > +static const struct wpcm450_pll_data pll_data[] =3D {
> > +       { "pll0", { .name =3D "ref" }, REG_PLLCON0, 0 },
>=20
> This is new code, please don't use .name. Instead use .fw_name or .index =
with preference to
> .index first and .hw if the pointer is available in this driver.

As far as I can see, .fw_name and .index depend on a struct device*
being passed to clk_hw_register, which won't be available unless I
actually convert the driver to a platform driver.

Not relying on .name would indeed be nice.

> > +       // PLLs
>=20
> Please use /* comments like this */

Ok.

>=20
> > +       for (i =3D 0; i < ARRAY_SIZE(pll_data); i++) {
> > +               const struct wpcm450_pll_data *data =3D &pll_data[i];
> > +
> > +               hw =3D wpcm450_clk_register_pll(clk_base + data->reg, d=
ata->name,
> > +                                             &data->parent, data->flag=
s);
> > +               if (IS_ERR(hw)) {
> > +                       pr_info("Failed to register PLL: %pe", hw);
>=20
> Missing newline?

Indeed.

> > +CLK_OF_DECLARE(wpcm450_clk_init, "nuvoton,wpcm450-clk", wpcm450_clk_in=
it);
>=20
> Is something preventing this from being a platform driver?

As far as I remember I have tried to convert it to a platform driver but
wasn't very successful/satisfied. Unfortunately I didn't take detailed note=
s.

I'll give it another try.


Best regards,
Jonathan

--xFMPhOBEsOewdD2L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmS78nsACgkQCDBEmo7z
X9u0+RAArvX9QnMGiJdfJImygGn8bpW2vxZ7dWdP7trBycIf1ZXh1tU5g7ryDS7d
NuxbqryAcfcP1cWUbSStRPW+0lrHGGEbloDIUL1gjqNF3aPmHIftvLWeeX7hYXKw
fqUb/EYfBB6hJbiOXX97QkBrniwZ9o6SolV8xuc6QBU3LahtVV3BsO1RTWfQy72r
LSbHSW3K2JEPRAhHbPHoYNCJMmP+A5g16vnohM756tcDKAZkPc5VSN+d8PAlR+H4
k8LJE5d7MmXsAvi+MsURxgeNnrGuNuxASQ/P1Sym9jKa8/wgduDtBLs1heXFbmD5
0BfOPdEcYcDMpMmVbhFCwUa9qzuHYGJ6D1Bw8/GbtIiVqzgBYjyknjpPqSCEWQM+
OL9vqeEN4MIOFRwA1qaqvoEry3CFDsFJUsAXgTQ8cQ987xj2Wq90hcZtK2zD2aVa
2xpkvcneV8mHnnm7O3yOKeBXTK8n8NZIbl8wH4QmNLIlT0qbFaELRKRviOHb1piD
VY7Jgg2JQFcwnxAnU33IJRWpaPHraJRo/54jpjUAotIDrjYuESvSXIHPmfzecvzC
GEvuyRRgXjuC0IWJWZh5Jui5gU8UhK+UPbRpmuJtAAxCQok60maGBGl3eV4+ktwV
asLAGFJl5orQhr2PfMs01B87/Jv0QAGOGYqDGRUVGwFUZ6vmu3Y=
=pwkb
-----END PGP SIGNATURE-----

--xFMPhOBEsOewdD2L--
