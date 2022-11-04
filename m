Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C856F619D07
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 17:22:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3m9V4R0Rz3cNN
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 03:22:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=OV+mNK+a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=OV+mNK+a;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3m6m4WZ8z3bhR
	for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2022 03:19:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667578740; bh=LhRYUcUS4u8OV+9RNXhDtH8dqOK1KsFZcv0nUDJIzxE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=OV+mNK+aouDnE1zZgQzYWSElBgiiBK82WKd/GrLOXQ2i7K3MQ8Ffd3CiVlhMCJY3J
	 SkS12t2741T7FH0iEkMI63d7FFgbET9dl7ur3lzQVFuYMM0Mcag4z200iv64c9II2L
	 N9easJDcXfoXktA5ugq6JF8YfduJVkHwjL4nI4TAkcMKz6i4VX5v2tkvyeePn0s2kf
	 BCf4xfGUqoKvoJd5zRb/7DnfUQ7GC2WJRdN4tXoNFwywLfcCJpyg15S4rHDJZZTZIC
	 yJCHb+0R1L+aekmPptJ+sWotCkMkVhfrLKznW92sLeagOcCR+azy34B6EUbapOCz2g
	 hnLkhH/9ij+YQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1oUSZ808xC-00WSCd; Fri, 04
 Nov 2022 17:19:00 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v5 0/6] Nuvoton WPCM450 clock and reset driver
Date: Fri,  4 Nov 2022 17:18:44 +0100
Message-Id: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FCwV9JvsPcP+/ukEXvtT5JQEPjjCfNvZiG04kNrMA+7aEUxckfE
 VLjTmKQcGPL9TfVkYY331ujiSgniBvINDKuNEOWQvc/gzmjP8G/cnbhtdF2eEGnAmQlkw8o
 SJJNjV6o+uJY721cIs4xqtVJgFh20KJQ7vAG3o4/59lPUpk9g5pGiWOFNgiANIS8hcI0r9B
 Z2GTnbBPwO7EqNlCB/k5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ify3fxgaC30=;mA6KToZbBe+f3Vg/mn6fKdaf0V6
 iSVO2hwj9T9QMPOvhsSZzmoT1kpZylcE0ED3SlU399Z6G7nOGBzMdnAtA0X/yLKxCQvmXmsQO
 Bgt2V7yT7RCOgMXyxu97+s8iz3O9qXvNDbr5s+nFwpRlC0TJMDrzHrgZbGUKbTWawoyx7M4Fw
 6LjmPIUi5c4YCiwIaxh8+Tw2+8ba/V9SY7TRHpEI4b2lYwT2I7UG/PQIp9Rg4LWwUS+UbJ9d7
 kEdeds3o9G/1YwpGXp4VMbSu9UvPVHVTtOPGOqksqDy+13tPWe3FqWt38bXrGn1XFBA+rGHA2
 o4lPFuho76sOf1pXyB96bu7gEfnmio1P++vbXx/NpCxm6dibmtqpJSg7NEbFamXMQ6fXWrFHD
 7AY7nipe22CnECqQEAhr7IshuJy+B5zgK570jcTU1Lyv9X+LDzXD0phUiEuyvU8M+rNNOfYdN
 SoOhdM1zaCjW5DPDBkR+e9oUBGju/x3UHy37BCNYVXw9L8HVWPTQGhJw3PUjM1LjpzKYW4Otv
 u4uHsvDYC+iXUPa4CNkEh6Jk+FEi5bhxWiqpQhyCA2SKAVSyezTKKyEajvFsTBlVKWZUDgmtZ
 IyafM7zGCOP9vGuY8M++OkBn93oKei1+y/hGQrRLmk6RImn2rLh+H3KIQI0bcgw9CR04okwqF
 UCGaWoi0eCa0cZ0tNegVcjSEFmmBkl6SepenEQgJUrcp8k6aI/7csz7Q4ZrZL69WAQ8l+zdv0
 xBXVIgcmcNWQ2x+09ihWPNspqX8VWE/vc3thAtRuRB9pSfS7HG0GdRpLBtzZaYPPalEWpUzG7
 1GSlqITGx719BwJyn67RlQmDaZy0HxIlnH5n5XUIsPnLGxRoF9ciE0b/zadMRVuQCFaTacTie
 jz6czV8KyToySocxcxKLe2UKwOnIwyuzFYG3BOhpG4jh6peQYvmNv/J7L8AmtoUCjETLSXmD1
 6MLq5G/7To9SnWArzRv61nECtLs=
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
- The clock controller bindings and driver should go through the clk tree
- It probably makes sense to delay the final ARM/dts patch ("ARM: dts:
  wpcm450: Switch clocks to clock controller") until next cycle to make
  sure it is merged after the clock driver.


v5:
- Dropped patch 2 (watchdog: npcm: Enable clock if provided), which
  was since merged upstream
- Added patch 2 (clocksource: timer-npcm7xx: Enable timer 1 clock before u=
se) again,
  because I wasn't able to find it in linux-next
- Switched the driver to using struct clk_parent_data
- Rebased on 6.1-rc3

v4:
- https://lore.kernel.org/lkml/20220610072141.347795-1-j.neuschaefer@gmx.n=
et/
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
  clocksource: timer-npcm7xx: Enable timer 1 clock before use
  dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
  ARM: dts: wpcm450: Add clock controller node
  clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
  [NOT FOR MERGE] ARM: dts: wpcm450: Switch clocks to clock controller

 .../bindings/clock/nuvoton,wpcm450-clk.yaml   |  66 +++
 .../bindings/timer/nuvoton,npcm7xx-timer.yaml |   8 +-
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  29 +-
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-wpcm450.c                     | 375 ++++++++++++++++++
 drivers/clocksource/timer-npcm7xx.c           |  10 +
 drivers/reset/Kconfig                         |   2 +-
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   |  67 ++++
 8 files changed, 549 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 drivers/clk/clk-wpcm450.c
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

=2D-
2.35.1

