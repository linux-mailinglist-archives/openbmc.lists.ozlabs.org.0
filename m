Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE4545D25
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 09:23:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKC9S1gDTz3bw4
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 17:23:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=hxPjyxIJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=hxPjyxIJ;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKC9150h3z2yxj
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 17:22:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1654845717;
	bh=WTXdRmpNWHVZt4Pw6LPt3l+43M1dfxQOCdp1a0FiYPU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=hxPjyxIJxmrTV9Wr7Wc0OooaZ9LifuFqDBphswy7SOyf2SDvpjgS08kh4ABF9mJ7M
	 ii/f/OO1SI1Ffezne/+As1wnO24PB7jlVGPpWZOwlbDlRWGVDVkamekc83NAL1s+xG
	 FhuH/nUrafWCjixHbY/5soJB9ed16Oe9fbmWaxN0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU4y-1nRKfw2Xno-00aU5K; Fri, 10
 Jun 2022 09:21:57 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v4 0/6] Nuvoton WPCM450 clock and reset driver
Date: Fri, 10 Jun 2022 09:21:35 +0200
Message-Id: <20220610072141.347795-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1kuBg+7igqos6GbUcXPQEvCtiSFIGEOJEao4BKzcgU6daJds40V
 IC2kvpVWTYuqW+3qK8qc5dzrNFBw9+rXhLtvVT2cWx1zDi4kquUl8OcXbzL4354cWfAQN8Q
 bRaDCt0nJeZLKOjrxCfxqE3DcS3cBskJ0hjwvnmDs3bT3wpqoP/SXw5cpwqbkGqbxdXFwvg
 OS84VsELokgxPwrmam1Ag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:suInKowovQg=:GPGBiAoq6NlXMdOwhi509A
 qJ6kTT/m+MgUUQOlf+FfwvYpjvMkjf/DgR9bAzCtAAltaNRncBLB+9HT6gojSu8ZQI7JiQ7Yl
 17xKjq/FMr443PcHYaiEIgnNLBeThxlm45JNkFy4lBoG/G2vUVKGrylSVqeA56UuEzmnUnAS8
 JEsGDvdPt9t4pwCmLK5j+hGBpIsGUKqiQ60LjViJrvP21zwRsiSlS/oIaSs1yKOf5b83+pRTj
 9l236NGpiX5kvLuP4PAQCDBZMhKNCyW8e4nKksrRROklx8sQaUQd0SzRx/xwpq/iaFKH9ctvL
 pjT8RYkZiyVkQZVhI+oPCGI4ei5o1yofizbBL2lMQYhWEnU1Wl0cuq2FzZ88pX7hVyxGYA65R
 c/sxry/+xYh33QuiLxwV+dRBghSAa9uVTixKfD0zgxZXmS06o9G6ZmCHQ5o0Cbv9vfdYKgcMo
 cypQYWvXQAq0OrnTGmGF88K9UhclQjN66e1x5JG0ABWP8QL7iD/cuDM5C1wNlfMtQ7PBarnRq
 +tQWInPzlTmWpUTl/xmFyfbRzwSu5tBasODGewFkUhVDMbsX8vmvJmND4K8cJen6+DtETv5p4
 nP+111tvEM93Q+r8gs0nL1QOqCCE02cNKnbriDYMU7/9DdXvVVjjdyznRaI7jmVepWZpqE5bt
 jqSiUAhH8Ncwzx6EWq6AlQTMUWF2bEwE54gYeW8KSWG9VZHckwDbx0PG+MQhxYmJEskZG5vbd
 OZH/5JVZ9sbV9rHZS+C/ah32QbfbmZCclZPXDLdeMREO1iiFoTqjS3E+PsapO3Mu2etHQYWmH
 Z0pZ8QP6Do2wAsAei75dT3F56wpOfNpr3GWnc2XzvxZiEipsSRJleQajIc9WFXnu+DurJBZe/
 edDtRTIPeAxGEiTt6Vse0sCc4ELqCVra3lkQYaatveyL49mUslJYeJejqoEfkf6VjpnOboPsN
 CktHGANE8dMRf2dD54pb/A5rD8TQxSYowc9j/rjhDRIBb7JXhAMxxikVVTN63rxwhcWRmPztE
 rPx+SmLkU+zGXcyJrNQ2mhtdbwrNpNt4LVu9QoYaG8pR4iXsytct5ljD3+x8jf7QbrhXm4WzC
 iOEIn2DGt5ejCDpHS4NmIg60FXSrMul7OfTuBdspIbTq10D/6nCEesUDQ==
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
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


Upstreaming plan (although other suggestions are welcome):

Once reviewed,

- The ARM/dts changes should go through Joel Stanley's bmc tree
- The clocksource/timer changes should probably go via Daniel Lezcano and =
TIP
- The watchdog patch should go via the watchdog tree
- The clock controller bindings and driver should go through the clk tree
- It might make sense to delay the final ARM/dts patch ("ARM: dts: wpcm450=
:
  Switch clocks to clock controller") until next cycle to make sure it is
  merged after the clock driver.


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

Jonathan Neusch=C3=A4fer (6):
  dt-bindings: timer: nuvoton,npcm7xx-timer: Allow specifying all clocks
  watchdog: npcm: Enable clock if provided
  dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
  ARM: dts: wpcm450: Add clock controller node
  clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
  ARM: dts: wpcm450: Switch clocks to clock controller

 .../bindings/clock/nuvoton,wpcm450-clk.yaml   |  66 ++++
 .../bindings/timer/nuvoton,npcm7xx-timer.yaml |   8 +-
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  29 +-
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-wpcm450.c                     | 364 ++++++++++++++++++
 drivers/reset/Kconfig                         |   2 +-
 drivers/watchdog/npcm_wdt.c                   |  16 +
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   |  67 ++++
 8 files changed, 544 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 drivers/clk/clk-wpcm450.c
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

=2D-
2.35.1

