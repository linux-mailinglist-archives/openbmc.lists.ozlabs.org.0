Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F396F1E85
	for <lists+openbmc@lfdr.de>; Fri, 28 Apr 2023 21:03:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7MTM6DjFz3cJY
	for <lists+openbmc@lfdr.de>; Sat, 29 Apr 2023 05:03:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=gxQGLql0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=gxQGLql0;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7MSn1cfMz3c6Y
	for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2023 05:03:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1682708555; i=j.neuschaefer@gmx.net;
	bh=CF1sZz4k02QBYfgP0eXXL7Vnco7PO6Xo/WIy5gteZNg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=gxQGLql0UO32aR/fayGJyyJG34yeGaU3BgFp8KPOK9BuvAr4esK/8G+0dosUz0lDA
	 GFC5CjWxzZz6CvelhNRw9G5NPAeiT+aafWjjNg0GeG5E8BeZmdgpQDrkhI9ppMgdjE
	 wucdaF8MVTW4kWU/HAM00OhqBcxypUKyyev35jM9IlnQ9UIrW3TyMhg5foEtnJieCJ
	 UN/KrjbQV+jV+QXpLNhfZrYP1ytO6Ht7RxjXUMTVmjko7U3Uhgt9iQ3S3TevXs/zGJ
	 HfSz5TwZS/O3kB28S+SLovA8OfHlM/rWWOJFv+IoJwJH05+gtytdHcVQ8X4KB5KNx4
	 70tyK7f7YTAXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.41.149]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzyya-1qE7Js3YIA-00x1DS; Fri, 28
 Apr 2023 21:02:34 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v8 0/2] Nuvoton WPCM450 clock and reset driver
Date: Fri, 28 Apr 2023 21:02:24 +0200
Message-Id: <20230428190226.1304326-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wZTKlMlvr8MURaloy/YrVGLiLLZde8R5/fNsaUu9vm9S0L/O5Lo
 TWvjUFoxXbdneU/gfEioYGwkhrcBE39X2xRHtThROq5sjsoc98PqlfZCnPcYhTKPMUveSdA
 BZIduuv40QXtWWbQpDiVnVqnIExZzWmoIgu8oMScvX5v76dQNllRuZyL6cNegGJrXLvIsjI
 Hz00laEJ15UrvkwcKinVw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hK/VS9yiUgg=;bXepyBgIkaLm4FvnsH2jSDzoNYo
 w7h+kaFOnKAFRI5yZVrczC8qfOVrfUcI0o1JhwH0UfoZNA60e8u63qJhldz8mnJpRtQub0IBe
 H2ajjZXGYSazTy18shkdIrZWVEQ8x83YEGZHW/tORAqKIAQE7dMBLdpnPZWij+/IndI1Zc8B4
 dxWE8sQFz0KQjBuMVg+ZsLZJ+zDL7bdDZZk+gkcLNk3vzHVorA0/SAB5T3PKSFQlUf4YBZ7i7
 BOnj0LRvSTlBnT5qJ6btIlbEiMrLRBXvqU1ROv2sgR2R/DukQK0vQ8YJBW+bl4h5jvOQb4TnI
 XRHqrnMeBeYusFpiaij+MQNxPyViDqxFagmjqFBP+/7F8hKqFv0850GNXZWUhiKNCiWPpi4z8
 s/EQ0pklmMs86xj3ne+rGHRImDP4iQ3A+dFjwwrK59QLBZjFJBCMmdTG2S/cDzNS9cEL6hqVi
 rNhO6tdQPOcf1wYWxUiEbL8svYQmnIQHJQuZLARemNlFQrlSh6jxmAo8EB4cVUdh5aCpQ07RV
 SZRMgBytx2UlsXS1tC/otvqgHSf1595eS9SntJxf0Pi/QbKOSBzIzx/YsZVWVSM/5ZZx10Qi0
 6pw1fDkfRtzpEE4GzR4MEMOJ/vb83aLDVjOphMIPFtx6yisKnvRe6iGNQt11saT97kgrO7edm
 6E2AWvKsKiCb3ZUAao30/S33t1El8w+7upUoqlfeKv0b9M+Avy2Dfep3wuaVs1nFVFDSJN7AA
 KJ5Sgd5Et4RdmnmxCiUIdtOwDoD+YFI/Lgft6sWC/gZpxt+0MXkRwproXmnR+RsUaKlaVCyIb
 vS5rGI7fWdv9XRaV9C5UNDQR3HPjuPj2maJcK/9ejOXlhwLAsr2Lz8O1W4Jir0NmeUiflPRFa
 q5F8QdMgdztYg9ROW6BztI+vw5tnq+W34CB8KGxnOX8mDrAypfGSYnbMAMrkFcCfkc8XCT45i
 JjRs6MpNsi3aTqub4MY1Z+BZCQ0=
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds support for the clock and reset controller in the Nuvoton
WPCM450 SoC. This means that the clock rates for peripherals will be calcu=
lated
automatically based on the clock tree as it was preconfigured by the bootl=
oader.
The 24 MHz dummy clock, that is currently in the devicetree, is no longer =
needed.
Somewhat unfortunately, this also means that there is a breaking change on=
ce
the devicetree starts relying on the clock driver, but I find it acceptabl=
e in
this case, because WPCM450 is still at a somewhat early stage.

v8:
- Use %pe throughout the driver

v7:
- Simplified the error handling, by largely removing resource
  deallocation, which:
  - was already incomplete
  - would only happen in a case when the system is in pretty bad state
    because the clock driver didn't initialize correctly (in other
    words, the clock driver isn't optional enough that complex error
    handling really pays off)

v6:
- Dropped all patches except the clock binding and the clock driver, becau=
se
  they have mostly been merged
- Minor correction to how RESET_SIMPLE is selected

v5:
- Dropped patch 2 (watchdog: npcm: Enable clock if provided), which
  was since merged upstream
- Added patch 2 (clocksource: timer-npcm7xx: Enable timer 1 clock before u=
se) again,
  because I wasn't able to find it in linux-next
- Switched the driver to using struct clk_parent_data
- Rebased on 6.1-rc3

v4:
- Leave WDT clock running during after restart handler
- Fix reset controller initialization
- Dropped patch 2/7 (clocksource: timer-npcm7xx: Enable timer 1 clock befo=
re use),
  as it was applied by Daniel Lezcano

v3:
- https://lore.kernel.org/lkml/20220508194333.2170161-1-j.neuschaefer@gmx.=
net/
- Changed "refclk" string to "ref"
- Fixed some dead code in the driver
- Added clk_prepare_enable call to the watchdog restart handler
- Added a few review tags

v2:
- https://lore.kernel.org/lkml/20220429172030.398011-1-j.neuschaefer@gmx.n=
et/
- various small improvements

v1:
- https://lore.kernel.org/lkml/20220422183012.444674-1-j.neuschaefer@gmx.n=
et/

Jonathan Neusch=C3=A4fer (2):
  dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
  clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver

 .../bindings/clock/nuvoton,wpcm450-clk.yaml   |  66 ++++
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-wpcm450.c                     | 374 ++++++++++++++++++
 drivers/reset/Kconfig                         |   2 +-
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   |  67 ++++
 5 files changed, 509 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 drivers/clk/clk-wpcm450.c
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

=2D-
2.39.2

