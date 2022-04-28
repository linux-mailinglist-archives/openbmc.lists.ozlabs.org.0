Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870835130A5
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 12:03:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KprmR0NDlz3bhK
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 20:03:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=EVZb7nTx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=EVZb7nTx; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kprm13JGqz2yQG
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 20:03:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651140147;
 bh=5RkR0AnFX7vQTXrSZOyaEfFUYVNtE06t7X96bNHnpAk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=EVZb7nTx/v4hqEQf/0UL39mQpzEJu4VuF3dvdrAbo9fT0Iy7igpqwmPyfEMJBQtY+
 Pn2PmbzUQek4kJ1q1UIKaX7rOPl7Nf+Z9+fZ7S5dVF162uhqw3qb51QsEG+6vdrbcR
 mhe7sT9dEFYcunjyIuD3Du0g/9QZgJK5vWxpSLEo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTqW-1nOTRM3hrC-00WUrz; Thu, 28
 Apr 2022 12:02:26 +0200
Date: Thu, 28 Apr 2022 12:02:24 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Zev Weiss <zweiss@equinix.com>
Subject: Re: [PATCH 2/7] clocksource: timer-npcm7xx: Enable timer 1 clock
 before use
Message-ID: <YmpmMGsI2GLrvMg5@latitude>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
 <20220422183012.444674-3-j.neuschaefer@gmx.net>
 <20220428091158.GD11809@packtop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yOapqzkiMt8+dk0+"
Content-Disposition: inline
In-Reply-To: <20220428091158.GD11809@packtop>
X-Provags-ID: V03:K1:z2GOvnE2pOoTKqPS2YNCdWH3PNgLZoY46dfHyKNgxU1cCV0GDMV
 CD5eXdswQsXQqcWJUlISm7/TxvKACGZ4FJS9IDAcStlPoqFOQYnAZI7jcX3dsNtIq+i3Uai
 bV9ZDeHO2mpbW/oJIk5KYUBSGI1btTH9/yVMpNt9Z3sK8JIRqdkp0d4QnB1agCrftN6tB+z
 hl6MQKVaa1728yKtcJiBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I6+m8IwNZtM=:6UfzdwNcOAsy6GnUAtfJdl
 6wW0Ip1MRPMbRrjB6AtLBRlzFqB1TJGg49uanx9G2aDNNU5pL8oveu/t/XhdSZajLVc5avdGp
 NexHpCpVrfm9P39HdsWE+Ys0gF5QOD5VLm3XEWSI5IdTpZsFl7rQ94GZjPGUpWOS5M76yKJQO
 HeWPP47IHdCOxj/g+3/yoa0SYC27v2lijBV9F7FWfqcucbNme9MQT/UxwHB2BLrKQLGcgtP0z
 5rStsWFJ54Iq9YDnP8b8tVrx/Sc//6o3MXvyIh/OkHoTLP4lYouNjmscUocxJtxtH4CKDs8qB
 cdEK434ilq2GkCAN3j5DoTJi2f2UfvZ9vB5TIiogM1+pA7qjknwRhqo/RIEowtMKxS/PNemy7
 t/aweHpEDnlavP/XMBrSilu1mvq9/MexyqSaj14pLowIvu8DzJCMmo30/9pMkK869u/52W25Q
 ZqZ/AhaY5EgRs+XOFnj08nwmP4HGhxJB8bIkqKo4w40TNY1TIdYEqzuRdH+MlUIulHi6rXNJb
 TGUDj7BY57On5x8ng2FbF2MW5O5fd0dvWacwKvHpXWuzIdm9DIAqi+yxIcVlEvEcKpj+qPxrD
 SBJblxieQUAoPKOQtX8gWNEohdd1rHRawppM1/Z+FI7k/Uon7jxgZC31gGr/Jlqfs6PMHMu+6
 dkAnnrMfloM04cXPGgRYSj2VSeqVByrtPwPz4pk1B7KKU0VCv9a2xIt040qiByoAHM/DaRM58
 8jzU8vbzjdXK//fpWL3sgAOuwHczM9ehyQmebFImrgk8TS04eqHqLPzFemNgdEFNE4TJSL8Ty
 cPIrK7irweN9tan58XCt1MY5okntg1dfih6GoblOwfDQx15BfNZHr6Wsq7eOWqkBdoCtl71cf
 PmUjzBsd7Biv33otqAby6iBMcSagwzXRKkat4/SDggUsVTbB2j6CM8AGH263eL15nFSXjuLdK
 Qrm32UaVAEYWCUxxY2hQnRutwHuYpvl5gCn65xUAmw3wX7JsNdEk02CsFWSKJ3zVEDIg2pSlj
 1wEn2oH1yI6FqC7f+fn0la/L81NfleUMxBBcscy6H2UGlh57PD2dm7zmQ7rt/a0GA/1M0avLy
 oo+FpSSyPXgUvQ=
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yOapqzkiMt8+dk0+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 09:11:58AM +0000, Zev Weiss wrote:
> On Fri, Apr 22, 2022 at 11:30:07AM PDT, Jonathan Neusch=C3=A4fer wrote:
> >In the WPCM450 SoC, the clocks for each timer can be gated individually.
> >To prevent the timer 1 clock from being gated, enable it explicitly.
> >
> >Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> >---
> > drivers/clocksource/timer-npcm7xx.c | 14 +++++++++++++-
> > 1 file changed, 13 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/t=
imer-npcm7xx.c
> >index a00520cbb660a..974269b6b0c36 100644
> >--- a/drivers/clocksource/timer-npcm7xx.c
> >+++ b/drivers/clocksource/timer-npcm7xx.c
> >@@ -188,17 +188,29 @@ static void __init npcm7xx_clocksource_init(void)
> >
> > static int __init npcm7xx_timer_init(struct device_node *np)
> > {
> >+	struct clk *clk;
> > 	int ret;
> >
> > 	ret =3D timer_of_init(np, &npcm7xx_to);
> >-	if (ret)
> >+	if (ret) {
> >+		pr_warn("timer_of_init failed: %d\n", ret);
>=20
> This seems like a somewhat opaque message to emit, especially given this
> file's lack of a pr_fmt() definition -- maybe add a %pOF so it's
> slightly easier to trace back to the device it stems from?

Now that I look at this code again, I think I should just drop the
pr_warn entirely, since I didn't mention it in the description, and it's
unrelated to enabling the clock.

> > 		return ret;
> >+	}
> >
> > 	/* Clock input is divided by PRESCALE + 1 before it is fed */
> > 	/* to the counter */
> > 	npcm7xx_to.of_clk.rate =3D npcm7xx_to.of_clk.rate /
> > 		(NPCM7XX_Tx_MIN_PRESCALE + 1);
> >
> >+	/* Enable the clock for timer1, if it exists */
> >+	clk =3D of_clk_get(np, 1);
> >+	if (clk) {
> >+		if (!IS_ERR(clk))
> >+			clk_prepare_enable(clk);
> >+		else
> >+			pr_warn("Failed to get clock for timer1: %pe", clk);
>=20
> Likewise here (though to a slightly lesser extent).

I'll add %pOF here.


Thanks,
Jonathan

--yOapqzkiMt8+dk0+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmJqZg4ACgkQCDBEmo7z
X9v7UA//XinB73NhiIWuAgNkGTSfPjaFxOvIHuRuFLsnTcJHlorK0w1BmfZHecD+
ZdHnpqPtkXz3gnReMqx8qJcO/0lHmJTkgvddzHqEu4wcWFROMTNs8Tbrd7TUvaxx
9jmxWWOE5f9P5EXHCLUlo0c03r6Iq8R7BlMUVSh0wZz6RtPujFoHjw6A8uhE9tbt
ZzoD4XhdNl4BkUpC/NUNIHSxbb/VYZYy7GxqP4N9yQ0QSYGIJm7ESR3RRGhMFoEO
BZziQtQiH/zJSj71FbG3q8vnXJF4mVozFqnTk4UHngq5nJrM7ZFmE6tVRBf5EPzY
aaBOk7Y7gcYdPDFMHszp+TtlxcGk7IuTs3I4lVA1JjCX7YPBfxA6AVt6Haf15YkL
TmosKy8EOB+QqfwKLwddQafB9FXSkRSWr0fn3WboeAolBa+omi+5NMVfq4X1kbHL
FNO1MlBA0IdDIuMwgRAm5aVTFiIuDoyYIm7qytMFvve4nSlLS3sL3F7qzT783Dvm
jbSSOUGrQa4XrQoO/N0HRiYj6FkZGE00Deg7e2qY6mqVi7PT9AIzWakASES0LqSd
kRiHXIqXlsjp65wuJ6xL/hj0PUg9ziUTurX31k1BXomattaHbz5ZSq+bGBD9vuvI
muA9b/srdaA7jEkkLs6AqWGSsFl8CXAEwI1Rh5VRZ+MStwIBicg=
=8ywP
-----END PGP SIGNATURE-----

--yOapqzkiMt8+dk0+--
