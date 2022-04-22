Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4750BFCA
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNNK46XQz3bcr
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:34:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=G5XCNs1A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=G5XCNs1A; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNLR34Gtz3bYG
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:32:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650652304;
 bh=FASJJR2Tx4uF4/s/WY7/LWoW20ycDshiMItQZbSs9bU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=G5XCNs1ACxz79EQwAvrBUsVH0js8miERrkpIGnBksPsNaS5RAdUYzybKS/YXc8ozF
 miffkkIG54DvwbtkvEIQ/tzuGwm7hC1U9hxPleaXf/PmMcyzTgkTPue5TvCt6Os24h
 5+HSHDchIEcLdrdHetIxAAkrY9D/K2SRZ7549EXw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.190.74]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mlw3N-1o7vEZ2TLf-00izyL; Fri, 22
 Apr 2022 20:31:44 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/7] Nuvoton WPCM450 clock and reset driver
Date: Fri, 22 Apr 2022 20:30:05 +0200
Message-Id: <20220422183012.444674-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lUBjNycijZc1q4is3LS9ZHsMWEXwBBLNpAxLeKbzlS/j8Due5p2
 ljr6755Dqs0uo5UTwhnk2Ib3iRRxTbS5Smc24rInSA9LcKoMsBxfM3ZWZ/dVZ/wSUBKXWr6
 Xf+kT3a3SsjJBWESluVcRlWa6VD3IcYWQm9jGqM/0ZPIcNQa3SScSfnxtrXoqY6l8IdVyb3
 x7/RLynriNGKabyGwlBCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cMP1HqxQpuk=:ncKdcWEUny0y88+UXCI8kt
 i3+iG+JU8iEjzUHkTDRlslT/Zys9O5hennPZjNNmAExzdSkPKso65HX2kqbkE/24vUQUWQrCL
 aoIO9E+jfNw+WqsqVZgp+UIDfOZ/PA87e9D1dLKDqwB4mdtLj3gG5CiDJbzYD0DfTMrz/+iYY
 clE9AQDQtxBTK6M7LnhHbhUTIL9b3HDAvFjfTZgiXh0/7YiVt99qGm0Ds0IsxXPvzpO2Li6IK
 XiLYA4iGUARCdjIKp5E/W6Xu9NsKih4b/FLOTnv0moq341Av9V7ax0eERkrUlfT8m6DxLdlEc
 kS4SBNAbREmtHu9ouxIC4sRfw8ZzvibdC8Jo5WphkqPKEQXrqlxt9PHoi9sEvmXI3As1L+cG0
 oIrVXwj1WVpXlvjkeKSZQprUTk8/7wvTeQNtTGFZ17UiYD9Fjam2iAIdk+IxvjSKzHD7/qUNU
 Iv6tjQug2CsGQTN79p9kTf5MajZzmrAuxQE9LB6esbLOJ76fgr0QG8M+1jfoGtjvLRnYfcwUj
 31O1rLOYYP0Uqc7SI2pHzKLI6EpP8LdJOMpmr7F2GgMcbySv2I/W26McrKe9xNiyQB1yfXx6u
 daxTn3kSQD3hbP3yGGrn1/YKE3g5xMTEuJrTVHtPEUkAgeZ3L5yxDBSd9Qu6rWTVxkGyAK0al
 7cTULCElVZHh9nMRuVomEagnXZTuLq0zAxvcPYP6ilTk16nDEWjC5vnKmqANMJFoo4MnHmIFP
 lGwgRwX598+cwbhzCmg3YJA2q27EGd/TED6sxdHHiLPnE7P2LKED3Oe97Pz+JPeJr/MNyM5KF
 Rv0+qevK3DRMjitjyP/qyh7Ob/e+XOlf+SMKk7YnQqICWkOnE72U4qkdNQp2st5FP3WCc/wVl
 heFDigL2y/YPJe5k3kQ4Bsn9BCDJMU7KqFi8LykMOrVJc+jfMqARdohTFQUPNO4I6y6tJQCVE
 CPGU2ZDc1BGWVsxzckX0Kd8USiWA3LqEENh+rpIumiMnbqX4POCEgwttgxXLAP6UyN2KnSZdy
 ypreiKhV6ITWLswiqT8syc0XG43VHt8szPZct8jJH9Q10LR4R6Fg9UeQuEuViun95iVu/wmpN
 1l8cNRkeKTI8bQ=
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

Jonathan Neusch=C3=A4fer (7):
  dt-bindings: timer: nuvoton,npcm7xx-timer: Allow specifying all clocks
  clocksource: timer-npcm7xx: Enable timer 1 clock before use
  watchdog: npcm: Enable clock if provided
  dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
  ARM: dts: wpcm450: Add clock controller node
  clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
  ARM: dts: wpcm450: Switch clocks to clock controller

 .../bindings/clock/nuvoton,wpcm450-clk.yaml   |  74 ++++
 .../bindings/timer/nuvoton,npcm7xx-timer.yaml |   8 +-
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  29 +-
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-wpcm450.c                     | 378 ++++++++++++++++++
 drivers/clocksource/timer-npcm7xx.c           |  14 +-
 drivers/reset/Kconfig                         |   2 +-
 drivers/watchdog/npcm_wdt.c                   |   9 +
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   |  67 ++++
 9 files changed, 572 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 drivers/clk/clk-wpcm450.c
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

=2D-
2.35.1

