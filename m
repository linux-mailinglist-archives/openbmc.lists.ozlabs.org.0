Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6669512F1A
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 10:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpqGh4JWpz3bcG
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 18:56:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=iwGwqXjh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=iwGwqXjh; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpqGK5KKmz2xrS
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 18:55:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651136123;
 bh=/SVF4atjZnUZPZ6or4RTo2SDRpctHhG+DQ/FLVQqUBg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=iwGwqXjh5Fbm6UEpQaRmnfup9aDxA8ACV6lpYhKJ+iXp/rSdUXgGUV08nKyAPzO8j
 Vy112wAE9UObX/iKQ4mf8Tj0Nm8y57gn1rdPK1bhkmkZAtuview18+44xcNLj+kojF
 aRfLKgeGdGQo+fphwPYy9nAyNHZjvvdpSZNyEbhU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvrL-1oMteB48q5-00hNta; Thu, 28
 Apr 2022 10:55:23 +0200
Date: Thu, 28 Apr 2022 10:55:20 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Nuvoton WPCM450 clock/reset
 controller
Message-ID: <YmpWeOb3oetvqyvl@latitude>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
 <20220422183012.444674-5-j.neuschaefer@gmx.net>
 <31cb9af1-173d-bef5-64da-ccf5a01f2485@linaro.org>
 <CACPK8XdRYvike9Z98JzfO1r0W2jfkESr8xMGSH4kkigwZ_MkyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GfjnlrXCmbggFVO5"
Content-Disposition: inline
In-Reply-To: <CACPK8XdRYvike9Z98JzfO1r0W2jfkESr8xMGSH4kkigwZ_MkyQ@mail.gmail.com>
X-Provags-ID: V03:K1:vDtCw1Xqk5WwFlslQt86xYSwXrubTIv3D0/ZX8XF0n41y4TsV/g
 vdzerk1EQZUuborMZpzy7oVBQ6hWJwjTkRzK+ITa/ze+Md6ns9/+gTmPLyk9ITEx7XAR+L3
 WsWvnGsjqHoF1as+Uy/rtQQ0yssil32ujMeDmsKBlxmHl6ek8pWVcDHND44cTNRQQomIKrs
 jAYXRVtG5Qxg/6fCWeDCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BByf02oW4YI=:u4M/RLZzldBz6Nn+6AuIJg
 XFSyqh6DA1pJWizob4aPCGfNK0mzAiDQAXfnSK0MnzE2Fh3+h0TuyopeZD3m/CjfWsqcLmkc4
 S0wKl4YASO5JUNIgdPoqrZulRMGjfrFM5buM84mwOZT3cA68s/4hX6o/kVNBPVDnsWKeUZqki
 sLkXgxisM59qeABrwqpLJ9JS18cwYzmDe5NKJuXPLKLw7aH0Xo3abnxSAjf836c6zeNgpiuLY
 lR4iVUbC23Q5luTONAoWGwpRk++LE0fNozCMFFshxaR2XfESLCpsdd2SBaAuA98LhnIpDb2OT
 /7+LW+mjIJzgxmqgqrHTqggW0cgtSx0RyUBRdY93f40apKuNzQlDmJcqJKDU0E5wlAAVlAqtO
 0AfVx7ZtiEyvMPun0rVT+Q9a1UD9HmqevComkc3nxB8zAFrqpsRV/cBSw42BPFLLmss0Htloy
 76r7jLXSH3zsjFjyJWZiin7C7f688Qgnzyw4NluetTLAPZfBy5cb8R5UdjE1wd5UejdKBRgJh
 ZZNqIDXFzko5WAkN7KgpHqBm5GHLvHt6GkPUHUiKH9YBzF8lZ4q4VUkyCAhbx63XVDwB4QTLO
 u6MT8ejEJH8aqOQsbJch7RTAGyKSzCxU2TwARmBQau5oDrfWKTOv/UcGOAyiuq0fwb/+wPPnG
 r/1RkaUFOh06MLuRlQDv0QfKwnhBnzmZ3JECGAVCbj6gJF5YjTnAofKkNxvUEhDEUAkBZCbtN
 s36fjUUI5Jss5OwQTqSdWUaQBxaGsl5TQVsWSszb61+QF4JWF7tavG4De5LCzTZ89gF/zwoOV
 cU/NlEpn+3IDyzmfK1+ntCKu6RmACZar/wCOJqxOWmz7uGFanSaFwUXXW6gIbPOVfjzVCGrMc
 855EZoF7wFoJlXu06Co3A4eMIDHk+zWyvqT2ec+h4l3Np6l7l1Q1RGtuFlt6aoh64smk1u6Ro
 W/h6v3T4E3MDVhREix+bQTUHYvO456H1ximnFgRuHhHFJu3uTn3zDbpPcR5jf0dqXMa+UcVS4
 TjOTtZG8Cf5Bpik0xJopRuHGQV1WMiBjyym36xdc9wHx+B0opgBHpdONINRw1Z8X9oWuGDPWx
 sCI7F7ptieIBdA=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Tali Perry <tali.perry1@gmail.com>, linux-clk@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree <devicetree@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Stephen Boyd <sboyd@kernel.org>,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--GfjnlrXCmbggFVO5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 08:35:43AM +0000, Joel Stanley wrote:
> On Mon, 25 Apr 2022 at 07:59, Krzysztof Kozlowski <krzysztof.kozlowski@li=
naro.org> wrote:
> >
> > On 22/04/2022 20:30, Jonathan Neusch=C3=A4fer wrote:
> > > The Nuvoton WPCM450 SoC has a combined clock and reset controller.
> > > Add a devicetree binding for it, as well as definitions for the bit
> > > numbers used by it.
> > >
> > > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > > ---
[...]
> > > +/* Other clocks */
> > > +#define WPCM450_CLK_USBPHY        32
> > > +
> > > +#define WPCM450_NUM_CLKS          33
> > > +
> > > +/* Resets based on IPSRST bits */
> >
> > All these defines should be in second header in dt-bindings/reset/...
>=20
> I disagree. It makes more sense to keep the definitions together, and
> it's all for the same hardware and driver.

It's for the same hardware, DT node, and driver.

I could imagine splitting it into

	include/dt-bindings/clock/nuvoton,wpcm450-clk.h  and
	include/dt-bindings/reset/nuvoton,wpcm450-clk.h

if someone insists on it.

For convenience (being able to see all relevant definitions for
nuvoton,wpcm450-clk at once), I'd prefer to keep the definitions together.


Thanks,
Jonathan

--GfjnlrXCmbggFVO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmJqVngACgkQCDBEmo7z
X9ue9g/+P4ECjYmwtgmxnY8aEuQIf5yQn622vliBjNoRr4EraBUuEfits2QCcitI
R2Y34KdwIryYwTuA1iTKPY7jxY4pMEXU/OhhnJ92yYz7KspcVyQDrxeGsY01PYgw
x5YWib5keVy22f76rbuTd0LROzC2tP/ubLBvu9+4hVU3HDp3WsVhAeLEVf3gcavU
fmS502AAHFtbWgMDHutulyeWwJmmVfYmAvxbC6BoNuitSSzuQZDbNi86hrLh2ytv
tXmup5bVOmiXx9oakQuoNBE3f50tQPwYTdQLRX1yxzfiRhpY+UvybdRpUZvzGgvn
qyJEqgWWcpTsbLtHK+65LMbBhO3EwYxzPsrtSDmc/rwPcgrT2A1y7GwNbBQhNvJm
PRhJtrZ/w4fgzGhkfzidXHlpsMR3BcieWZEUaRx861KDOT6ilzCHf1/7CWDel5u5
M8aNJggId/aycnjWYSUjdAZjpME090eKku2pbD1HUu9ks5rUZhhTWX+5FYYbufAK
wi2W5jxUOfroRwHdQF2XQXU97LhcZC3afA3u4UAGR9yWZzfasFDDg/Z0S7sZIJ9q
evrCyV6VT0WaqlKBPpCLf3Zav7Kic9cdDGbGbKCL7yTBB1kCsD7klQa16/dHCcYE
ZrzJBoMgpZ8oEuGNBvTUnSr4bL8aKfS141ZhZiZ3xtaTXWZxYYo=
=lG9e
-----END PGP SIGNATURE-----

--GfjnlrXCmbggFVO5--
