Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C18151F0DF
	for <lists+openbmc@lfdr.de>; Sun,  8 May 2022 21:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxFFG5BLVz3c9H
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 05:47:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=g+/mU7So;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=g+/mU7So; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxFB25DH3z3bd7
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 05:44:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652039021;
 bh=F4hpWVjFvpqMCwemAl2z39vRoOEsiSoGp9rSz1F1/+E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=g+/mU7SoUFXR0pMX0f/tDjz/Ei6WblXyDaJJYkT8nFUbGfwcM+PUfSxUtblVDdIEF
 EebIZzgocMZj6BY/JBpGvIZfp+md4RcSDBgYSTo3wRm1jkmpULaXx5O4YhvX+l2ZwV
 0Gd16QIF2p75HHXhVBGwR0S7PU9hWPqKUESO1kLM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1nPu8y2sll-00OWeA; Sun, 08
 May 2022 21:43:41 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v3 0/7] Nuvoton WPCM450 clock and reset driver
Date: Sun,  8 May 2022 21:43:25 +0200
Message-Id: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DUrKjj9a6jTNCSAXIMTL+32UvpFfbMWVMeduiJnOB22p9vBDes/
 oMOOTY1V99JhK6XGiPLWMCVYKPi8DOI+K8Eig4A5Jl3sfLDTY+KqX6PDQrfHMprT9a8VWWZ
 MlKLLrx5owTsaZZbVkX2jKVs0ZVyBxJkKLT76b2Y0kC+Cp6xyCh/0z3PtmS76Z1CxB2GOo8
 tCrWaOTTquoW5AebXdUDg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gA7hVeznCgU=:iBXOY2Lo5osORmZNpmZcm/
 nnJVb0OL1mfMk97XuMqv38zbcNrUQg8yN7O29x0JOAGWJZlie2E3QXwYeQv6GVj4XvZzuS4Wm
 NL9xBjm/iBNPGi8VK83n69FsbK1KNmXPeSMyxIITmr+nhoCEdIvDI3bJUiow4+YxmgdI7omOH
 DzWiUTY9OLYyvQ4dkVe0R9C3qMvKZqJbpK28eQeQDAuyNgChq0PTK5rRK4pW5iK0mhGaaXtlQ
 T3OFqZwtI0kv19VULt3tZZWknrhSCDm+27M5cItZ4Ap2PF0o+Tu4RCmIcVY7tX05YFT36JVoi
 wHOVGz1hvFeHBx2wuZo65LG8z1bIgpIAlN44g0I+ESFgs37xI/GweP5JCEuRndYzFxECah2Bo
 NDI6nCl7YsP6nCfaV3GjXt3nNyHB4XanFecAF5KlEk5So3m9HB0gD4RZzG3tkWu7LHwsnPNqq
 JfMpvRSyleu39IZYUyod9Gbv/UE94oKtW26C6zOXqNDCJljFJsu8lIOkdD0swkL3iq9Sc4hAO
 DZ06HsFGEDgT6kJWni+m2HTLm2u66rYd8VAXry9hhlDZiYYCeOwUF09ePyslp/10FWauYG0GD
 BE4uu41aaoqlwuPKhrC+e4NN6Hpp7yZTwDwVQ74EKil6JNGFtxLtDRR+laUXXNAlhH9ySEf8a
 a02cSskMjKGlo/EiXwjMW6nB0MhPybv3FxHNf4DzwbpV6UkEyeetYN2/V2VVKODzG93n1MEyT
 yVhA9Vyq50Jg9zHBPm/Ym4fMC5lsTSH4fUrxaEzU6FaKwtYKeB+gWogtAE0YR+7ldDV7HYxuc
 ulucSr6hUwGvUbFncxK0Fv80DJBGs4qYgpQnm2Dm2BgKwfDbAh2C2gap6vMgfx2/HtF5hJudu
 BFsIt0FO8RKTTmVfXVsUatkam4fX2V5H8H4y9yL1iAiIIbZZli7ZZCwJQ8uEGvMvo8g1EbOeq
 o+TXZMaA17Rie6tfyYiMf+R8l0QhU/Z4cEioflxYACjUsuXYbfX0ewMIYFkqfP5P8wgMJezjK
 RaJlFdVzfEDa2HT2AykTmiBp7Zbhn3RQKQFnHPB0RDUcEzOmbceGmQ5Ci+SqJ6pYM0FCQt5p9
 xBDLNM1hQb48mY=
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Tomer Maimon <tmaimon77@gmail.com>
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


v3:
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


Jonathan Neusch=C3=A4fer (7):
  dt-bindings: timer: nuvoton,npcm7xx-timer: Allow specifying all clocks
  clocksource: timer-npcm7xx: Enable timer 1 clock before use
  watchdog: npcm: Enable clock if provided
  dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
  ARM: dts: wpcm450: Add clock controller node
  clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
  ARM: dts: wpcm450: Switch clocks to clock controller

 .../bindings/clock/nuvoton,wpcm450-clk.yaml   |  66 ++++
 .../bindings/timer/nuvoton,npcm7xx-timer.yaml |   8 +-
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  29 +-
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-wpcm450.c                     | 363 ++++++++++++++++++
 drivers/clocksource/timer-npcm7xx.c           |  10 +
 drivers/reset/Kconfig                         |   2 +-
 drivers/watchdog/npcm_wdt.c                   |  18 +
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   |  67 ++++
 9 files changed, 555 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 drivers/clk/clk-wpcm450.c
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

=2D-
2.35.1

