Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C96E83FA
	for <lists+openbmc@lfdr.de>; Wed, 19 Apr 2023 23:54:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1vh159BRz3chv
	for <lists+openbmc@lfdr.de>; Thu, 20 Apr 2023 07:54:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=LMkeOne8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=LMkeOne8;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1vgN6Bnwz3cgV
	for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2023 07:53:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1681941173; i=j.neuschaefer@gmx.net;
	bh=E3MwaTC39cHV5jEqiGIoFdw7WcRGnfVKbe7RZwo68iw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LMkeOne8W12inAaZ/YilffTeUnstAOesHyxyoojqAF5QqEUyGHFxXGenviIBKVZDv
	 JnFaTLZIwIz3H+zJWTjMJ/H7Fpp+Gcf37ot94tS7gYcv30+KcJjbDGk6+QUbyjlRsc
	 sEXODlI9TmrUm1cnPr8pVmari2bYex5Hp2SPEZ6F+rTqtyxKZKvg1n7n2SSHHdCqQT
	 dr/LDcwBco9ZBLrQXmOqurNrgJzOy62MvR4W/y+N4LS8VaWG/i259Gqywatxeuextl
	 ZuMxy4V9fyIuQhAxmG9bH4+B+NE6EvnU6fY6FZOvo7gZJ3nfZXxM4mLMo2i8DZjc1o
	 I6NB30sJayYag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QWG-1ptfZl1Qe0-004QMs; Wed, 19
 Apr 2023 23:52:53 +0200
Date: Wed, 19 Apr 2023 23:52:57 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v6 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Message-ID: <ZEBiuRH3DjVUO/Kp@probook>
References: <20230415111355.696738-1-j.neuschaefer@gmx.net>
 <20230415111355.696738-3-j.neuschaefer@gmx.net>
 <c04038f2-b7aa-7c37-df93-6950831579f6@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nBgbEHe+7HdynUHs"
Content-Disposition: inline
In-Reply-To: <c04038f2-b7aa-7c37-df93-6950831579f6@wanadoo.fr>
X-Provags-ID: V03:K1:TTKfScm3X+1lV46i2xneBJJ+mRnIdHaebMSneyl8EkLY7S7V6ir
 tmEvh62wdv/WVjbqdH7A84xGNb3RKFAch9n0YeCEcF0Igi49ekDymYcVSXXM2R9hgXdaLO7
 dp/ICD4eIfn/dwbQzeE8iunQWMeFvF0BYiArqRE9d8zM1ppM0/o03p5BANY3lRmUNvTqR9u
 b8Xg1w19VhdJqSmL5lteA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wJFEDQxfRL4=;ah7J+2kmEogfH5rqEMt6ppjheoH
 KrP7wiEcbiG50T6ZYLvyues+omkXepggjO1En8RKwfFQvj9Q+/y30OpG4QV4dyzjUN32pBp8k
 ZTOgqXUIPXH09ZtfnfM5ucGA2R7aA9xIY/8m0Qx0Yx4uhsV16pEv2Ha7tGLWu+a/yy6tayKSP
 xPZUwjW4slngP1ZdWok+JvE2R5s/MzPU9UbEGeuW32Lvdi4Qsmy2H+O/D+Mll3FavTSh+cu0A
 HRhfEflMdgGaYjR3Wrk9oXiLuozTAkbmMf3jCKoqkZbfksy0A2NgAmXsk8syQv9WZri75JWBM
 XOZe5Wg+QW0I6VMzgyXpbPtoSAvWQEFICalKEQfNxdnhRuXGb5EfRaolqY4L4+OjPFFKcEzFH
 Kwpj5X72qUDcZG1Wc4Ll5dlHra46FzDl/zktU65dDa0zbQWPNcGMkFeldM2tQ0KORW+S17Vxv
 bJI0IoSK+2qbFL8239d0Q9Ri/Cjp8AnawJWxWswlaEDN/ItKwjHD1P8WoNStTpfMfT7OBdGsJ
 Y4YhWqJPLhP/d1YvVS8CbI19IEIVGctfHMOh++sB4XXw9mAdMi983yL9429cG7UYEBYHLk7Mo
 HcNDjXXcynLxVelOIm0Wt2I4V9gB+p1H2V59i/4ozElhg74t2lo4Q6NXbx15TBHKhuyY4rZoM
 /PpP7mqUYeLL169L133ueg8iz2uzY3DtntdvNPRlHBO1J24vRPukY6oxol70s1Vk3cqi6vldI
 Z2OWlxj7ZzhJI4goYOm21BAmiSmrNtz07c0UP8kJgq5AUTo/YZexa5Yc8mrZqSyJi77YimMQe
 xf0z2cjZPWQdKZxeMR0MwDmDHCf//oF/Hr+QkfMG9d6w9yVC0UU05ikuA8AZS36uNOTOHH08q
 hKRT8qoU1bMND9hd87X4fZRw/56xTQwjo7noyODDFxPbqIBT8EW0TwbyA2MPek3sGnt7MVPDk
 oJSfanfvsoDljHysdHMo1TiqsIc=
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
Cc: devicetree@vger.kernel.org, wim@linux-watchdog.org, benjaminfair@google.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, mturquette@baylibre.com, daniel.lezcano@linaro.org, tmaimon77@gmail.com, j.neuschaefer@gmx.net, linux-kernel@vger.kernel.org, sboyd@kernel.org, robh+dt@kernel.org, tglx@linutronix.de, p.zabel@pengutronix.de, venture@google.com, krzk+dt@kernel.org, tali.perry1@gmail.com, linux-clk@vger.kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nBgbEHe+7HdynUHs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Christophe,

On Sat, Apr 15, 2023 at 02:16:09PM +0200, Christophe JAILLET wrote:
> Le 15/04/2023 =C3=A0 13:13, Jonathan Neusch=C3=A4fer a =C3=A9crit=C2=A0:
> > This driver implements the following features w.r.t. the clock and reset
> > controller in the WPCM450 SoC:
> >=20
> > - It calculates the rates for all clocks managed by the clock controller
> > - It leaves the clock tree mostly unchanged, except that it enables/
> >    disables clock gates based on usage.
> > - It exposes the reset lines managed by the controller using the
> >    Generic Reset Controller subsystem
> >=20
> > NOTE: If the driver and the corresponding devicetree node are present,
> >        the driver will disable "unused" clocks. This is problem until
> >        the clock relations are properly declared in the devicetree (in a
> >        later patch). Until then, the clk_ignore_unused kernel parameter
> >        can be used as a workaround.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer-hi6Y0CQ0nG0@publ=
ic.gmane.org>
> > ---
[...]
> > +	// Enables/gates
> > +	for (i =3D 0; i < ARRAY_SIZE(clken_data); i++) {
> > +		const struct wpcm450_clken_data *data =3D &clken_data[i];
> > +
> > +		hw =3D clk_hw_register_gate_parent_data(NULL, data->name, &data->par=
ent, data->flags,
> > +						      clk_base + REG_CLKEN, data->bitnum,
> > +						      data->flags, &wpcm450_clk_lock);
>=20
> If an error occures in the 'for' loop or after it, should this be
> clk_hw_unregister_gate()'ed somewhere?

Ideally yes =E2=80=94

in this case, if the clock driver fails, the system is arguably in such
a bad state that there isn't much point in bothering.


>=20
> CJ
>=20
> > +		if (IS_ERR(hw)) {
> > +			pr_err("Failed to register gate: %pe\n", hw);
> > +			goto err_free;
> > +		}
> > +		clk_data->hws[data->bitnum] =3D hw;
> > +	}



Best regards,
Jonathan

--nBgbEHe+7HdynUHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmRAYpUACgkQCDBEmo7z
X9v2qw/9EiZBIWVLXrb/H+SBZLajTH8gs/+wWatpfYY9MHKe6PQ4wEqD3wHZvC1j
XNyEizeN9zKD617uEUNnj4LS65mXB9jpk+IBn2V3S9m8aK0ZnohGPIBQbp7fJxRD
scBOpgCKxii9YUjJFDwfJc+aGteD1FZCV5ufF6W7tAlpqdpRJiV4Sxyui6tplBjb
tmz3EbyRRYJ5IW+qM84oS9xocMvIyFUcSqIAyHZNzS2QyUzl48dHpwjfGn2jJ2q8
enIxwqOsbNUNyYJHynYGVqQGTusRYJxd6Qg7c2fZyOtsRdvvS/cvTvaNeFap27zr
4ciW+NTiD40FzGgrq8glOz18+fBi4HIpR9XYDIYSPNAIiQEmj3Uzn78EQ7xNrSk5
6pjoPtE6AkYtGe/M7CAAjHkV6xiuKIXTXxZQMCI/vw22rg76CJkNzq1UapIqmYUQ
klfYRnd/UFavPt57hVLC94KgBZO2tmikTOksaSnZw6tN0CCXwaz9MnAPR/aaA8YC
8eO/7oNgydKM/K1fUrFBWbR0Td8MLlHmH35xsa9kdVayHin9v7oK8oqtCDFQvDHL
1cd6KQcPHppWTQ7A8nWIjlmm+lm0Y5n1dfRL7/k/Lj6RrpkTOp6BQ+xqIM4LCpQb
SQNXKoHLuiincVsxMWIWi+qDKYENxeosPds/iY3v6vSY82fkv50=
=r2E3
-----END PGP SIGNATURE-----

--nBgbEHe+7HdynUHs--
