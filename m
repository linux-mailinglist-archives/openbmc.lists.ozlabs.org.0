Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D798A6DFE8C
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 21:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxXTp4V8Tz3f4x
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 05:15:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=BMDmPowP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=BMDmPowP;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxXTB6tR2z3cjK
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 05:14:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1681326839; i=j.neuschaefer@gmx.net;
	bh=T3r05AvByQ78pgr1f+lKaqtb69c4CJPLVX+ymwewCz0=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BMDmPowP9+uvcrSgaSX3EcRgQBsMoAV4dSlY2URUK6PSdUTENrBQ3WVLDpyKF+I7e
	 sD6cUSF3TqA3yddz9KCUrVUQXlx50ilGMnA2JLiHcPzjLUM6JRCzPXrvEU2JmWtkB1
	 oVoQALEjco2fA7BFx4SvPtC2PbH1r8O8Ya2oicg2mBZYWDN1pMG82+6Cq705JjJPm7
	 sKTGbLNlXQ3vEIRvWl5y2nnhv/M6vWKXAZmyjQ8R86tJGymBi/IWzaFrIysn2L0ce9
	 4ZJqapG0/788qtp8tTcRnVyhuikYCCyI0DvuDsPoS8oJnCniaStsHqY5Pj9KTpAIWu
	 henKw6Jdd+H3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([185.66.193.41]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s4r-1pkklt3ghD-0022df; Wed, 12
 Apr 2023 21:13:59 +0200
Date: Wed, 12 Apr 2023 21:13:56 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/6] dt-bindings: clock: Add Nuvoton WPCM450
 clock/reset controller
Message-ID: <ZDcC9JBidzfu94NW@probook>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
 <20221104161850.2889894-4-j.neuschaefer@gmx.net>
 <20221209202120.0AFACC433D2@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NpfuWbq9gkMhlu2M"
Content-Disposition: inline
In-Reply-To: <20221209202120.0AFACC433D2@smtp.kernel.org>
X-Provags-ID: V03:K1:jUhIJfNgdC6wpEPx0keI2q2HMSs6qQtOBLXprOGbFfn5tkVL2Le
 D4mUx7y9IdovWAByCWzmeqOc/Jda5pRaQeNLOBlbXCyJ6kfiuhlK136i0yzPEdWy+PmdHQA
 g/YcNZCdyosbqrpM8xaMk6vPRgapkJSGCNbZQpbn6mo1XziL7xFM2Q/LtrGcXz7LtLQJZqb
 i9OAiRhoyf+BgC8bGgFWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aCI64BL1rgk=;TL2u7xYyP8bK5xqtVfvB7EBtY5T
 Gw7znmdjLs8JpkvMQFwfxDU8G8fLi47mDtkSmJzJtYQoSFOlRTgLOILJduh01l4p/hf5Ypi4P
 sxF5bGN4WfEhhaGfnuFIT2pcQJkaHqygv+MLvRXEeUT4yOx7NiZeUpOqNF9nKfoUGn4m8PB8u
 qWIzHFJyarkEcZGRgEY/gDbR93z8LW73zNWiXkJjDWdI62izJ/pm7ZxZEeaGl2uK7XH9BLH2Z
 fFFMcjQnVxgj2N8xfeuK8pbbp5++95p2HOPPHlnBnZuqql8e+XzkPljyFRtulxIrR6L7G5phy
 teL9XySDInzWUojCzPLV9TC3QyOKtCQ/yt5uXjFEcbo4U5zLCAW9ys6YYnfQ1EviXCc2GoOru
 S2cXsa7diI0rAGPyVhNVMqZUK3SozdU/XlM6MhN23EQA7OdoJmnrLhhGeUinwfVZJmBlHgT8b
 +TUQlKpPp7ZCZ0sBcKSDatfAF+fyKi5DweIw4IxSutCtmavrh3BE3s7y6eAW7IEmlJliJwOXW
 gwa5kSbNvP879KKFDngK8OpGoneGx0N40FmM4ICEuJcbIPcWg2UActy442702QD29EpZj5qAW
 1UiVCrOVNBJrvFsdSdhVnNvUiu2jxy7ixO8Dv/O7OPcUBg0JOX70p1UNKdqxYaj6PjH9LDSjt
 V8ueMb/dmvvAWQlIJQBGL/02JdlmVI99vDvmg0BMNsdM+aHx2VCg9PVEEie0amBJdUNj/Xnol
 DIRdCLxnpcjIBfgxZA/MmQhuw/dhQuI6HuL68HCvY10EZ5o2RxUBsWWQBTMLypUVy2AilStJc
 vjgsgtuNSMQE7YwPjY+4R/m1cYln8xsO8Ztm/XSg/iFDoGeowZXZ0Ztx6Ng8LOgtut+3/0zIw
 tH+jWbCo3nO0udRfne7yiuwrAWHNnaksJzBFRmVXfEWabRJkRqpIj1tqOSaW9Qjf7X9BOIHdj
 I5jfaQ==
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--NpfuWbq9gkMhlu2M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 09, 2022 at 12:21:17PM -0800, Stephen Boyd wrote:
> Quoting Jonathan Neusch=C3=A4fer (2022-11-04 09:18:47)
> > The Nuvoton WPCM450 SoC has a combined clock and reset controller.
> > Add a devicetree binding for it, as well as definitions for the bit
> > numbers used by it.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
>=20
> Applied to clk-next

I don't see this patch in clk/linux.git's clk-next branch. Did it get
lost somehow?


Best regards,
Jonathan

--NpfuWbq9gkMhlu2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmQ3AtAACgkQCDBEmo7z
X9sIKRAAiN2ZmLRYACFaEh3bwfcujm/d3XGjZwlH08eGmyruyMebk/PfHKBWvAkT
Fy4gl2t3YBljBGEK/T/TXymbEYALVNV2hIubLWjy35GCj+q/be0a1Ko3zIQTJY7P
xG6ldUH6deZOCSeyVc5VB/z+fZY1x5rMB3ZJJCLxYj6SQPjcxBuLVdIfkQExTmp6
uNf8Uxc7LMAZJ1IBfUoyTnfCgJZ5rNwSOhUQ9sDYwBKdi8lJHVR7ZQtGZPg3tKMx
BK/PP04jvsV/1BlncBsp7WVemVjaMRdJRG71mMU+Rm5Gl5//ZyyBdx1bxouPXqMZ
+hpDpvXXJ8CDGVprURGaM3U9zcR6P43RfldCwocHqNLnz4b3a11ONboiN18mujds
bB5XTWXBC7LeN+q0WC7Pv6soVK0EnQzaze+ts8Bf0DoPpTFvphwTvLlEMLYwSFeP
w2y7iH8nxWDQjxSpgrly1YdR6/ivLbnqzTWAgPEInJAT1jsVdDJM/ARza3T/WGaB
0wVAJR8A2fJz3iAwR54/LQ5av90kGQMT+Vmslzmpfrye0EW0gIuOY2iiWidcUlcz
q3kAwaN6iAILBRhko5ihBznj7fTGBBRd6//0aaP6Cr39c+N+e7dmq0cLSqgjRZjI
lL64RXXcalaOanGUa1C7lVLR8lt4pmwnNWx1GUdJonrZwTvomLA=
=diBx
-----END PGP SIGNATURE-----

--NpfuWbq9gkMhlu2M--
