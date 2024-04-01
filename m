Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017C893BE1
	for <lists+openbmc@lfdr.de>; Mon,  1 Apr 2024 16:10:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=aaQTO7eq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7Xvz0DSNz3bvW
	for <lists+openbmc@lfdr.de>; Tue,  2 Apr 2024 01:10:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=aaQTO7eq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7XsQ419Vz30PD
	for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2024 01:07:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711980449; x=1712585249; i=j.neuschaefer@gmx.net;
	bh=AJT1ovR10GNNIJp+vlYbEU1GFYCPHFPKFuEOnsjs83A=;
	h=X-UI-Sender-Class:From:Subject:Date:To:Cc;
	b=aaQTO7eqOledBa6jKrqBJlIQORQTH0gdDIFN0ep/u15YoQdHE4h8yYnQN1fDjDoF
	 cGQyaHHUbe6oj1yHSUg9Aspe7eNZpHGCUeC5Jyx66DPR+tVVk15FktO8FsEiskqHs
	 XimH2Ka8ppUtp629gRRHGLUOJfxIctRYusfs0PYOtWB2RJRISw6W+ARifQnLFI/91
	 iW5bSjc7USw+TiM60Qc5yqDjEW2oIWY+2WApR/OeKqgSF8qqdfmD+NrjducXyUSyh
	 xaXKbQ6IR9Im/AioR7oBH6gYEfoC4Nt4O9FEOiQ+x2QsI6i6jg8GIE/c2mqwddqJz
	 bcoP00160GWg9fRhTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([5.145.135.152]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQEn-1seJqp3fwV-00oVPb; Mon, 01
 Apr 2024 16:07:29 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v11 0/4] Nuvoton WPCM450 clock and reset driver
Date: Mon, 01 Apr 2024 16:06:29 +0200
Message-Id: <20240401-wpcm-clk-v11-0-379472961244@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAGW/CmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDA11FJSSM
 xLz0lN1M1OAAkpGBkYmBsbGBrrlBcm5usk52bpGRkaJxuZpppbJaUlKQOUFRalpmRVgs6Jja2s
 BoO9g/lsAAAA=
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711980406; l=3742;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=Kl6CezGJIDoc9XeJoRN/6eD9BLu5r6gr9/3StTzWMUI=;
 b=2u+HTgcSe3sUxqTBhtUhq+A4Lu1TqRJGnog4buVkjaM1k6Hpbv7ciDJFXbCGRKG+g1y7hok6V
 qdLErSEPrW6Cd8ILI0ZxttoM9qxPGd+AoyX9M5AnC+14Yhf7QvLcFlY
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:cyySDrrKirn+ToHT9aaY/AC7KWDEorGm74pJrNcR5+BPS+yJVI9
 aalXz1lgOnj16FK0OSDS9Pah7DLBsOR3ds+74DHWT1np7AQU8Qp9kU14BZ0Mon8PPcZJm32
 OOCPPTSvGYBwul4mAJkxX9VzXt3W+2xqQ7LUULPRusE5Q7mH0h2SiQEAEy0PBBmDW6yfC8e
 ZrvLGxb/u7ryW4/n2IUkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+dONRBp9TGU=;rgTdho7sM1sBznkbJ3iFKkFmGTh
 3+HdJxvBjK2aRafXiIT2ysckP2G4TO7hGgTFKMuBlkm/sxo5u+iIgMzNlbcrA7mqq4KiD0icP
 1AzT/l+93x+pnCw5n2dm7ojUwaLLSwoaz48wXMOu2wn/IKNWtKWEps+0wiw664qxNya+mY8Vt
 GHutYb17RpYRpZbzwUCD1tKa25Vuio9z6ayyACEcq3CfcU5QObqiFNHIVcUBra5QLARSigtHj
 YiVq0SHMc3Jrl6a+fDS2GfBrKbH2pWG+yEexX0uneX16qNX4b8eGl9vTZ/NrNdjeK90ffsBn6
 /kaD7bFn3BkfDQL6D8Q+lQ4doLVrlSJYLXKojqjFE7juDu1I5R/VNmCmSL1iz4wf8LJOBh/P9
 lc54qtCH/fIrIaWz01zQCMAu8xFVBE/EiZNaYdA2FXMQm+aapHMueg3KaJaTbtkGAwjK3Oz+X
 VxGwi6Th2ZW7ToAAxXU1c5PC2KnjdkKArOrWidty5Q1RC5B4j2CGB3pN3i8FJawxLrprMtvG7
 lVz59KGBGbinyJRp4qjCu3UPcJ3L4zsrVk01zX41IWdqm0Y3rZDB33219Uto6b/Z7rx0Gexp1
 Tur4NIFfb+4zgNvNuNNHu007nZ7QCkPyhopoF3OyiqAktYH2/s6EWc9HxSzORg2yQ6w1LMyeN
 ib4JhlVW6K7MF8qWeMjeIq4YlnhRyfXORB10DkA8C+G/aVIFOURzrif/2JSMn9I60/4H2X2Yn
 mlifvn/RUbrXdkDn1y1yTt9/1DRXVvuSErtV87LNF+mx66tvyeyEgapPTZwzqsaiadY0SrLUS
 iqIS93c6mF3w3o84KQyM69p499NQ9AXOw7/jj/3hUh2HN32pLXXgvT1wM1hOpckc8t
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

v11:
- Improved description in "ARM: dts: wpcm450: Remove clock-output-names
  from reference clock node"
- some minor format differences due to switching to B4

v10:
- A small tweak (using selected instead of extending an already-long
  default line) in Kconfig, for better robustness

v9:
- Various improvements to the driver
- No longer use global clock names (and the clock-output-names property)
  to refer to the reference clock, but instead rely on a phandle reference

v8:
- https://lore.kernel.org/lkml/20230428190226.1304326-1-j.neuschaefer@gmx.=
net/
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

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
Jonathan Neusch=C3=A4fer (4):
      dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
      ARM: dts: wpcm450: Remove clock-output-names from reference clock no=
de
      clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
      ARM: dts: wpcm450: Switch clocks to clock controller

 .../bindings/clock/nuvoton,wpcm450-clk.yaml        |  65 ++++
 arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi     |  23 +-
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/nuvoton/Kconfig                        |  10 +-
 drivers/clk/nuvoton/Makefile                       |   1 +
 drivers/clk/nuvoton/clk-wpcm450.c                  | 372 ++++++++++++++++=
+++++
 include/dt-bindings/clock/nuvoton,wpcm450-clk.h    |  67 ++++
 7 files changed, 525 insertions(+), 15 deletions(-)
=2D--
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240330-wpcm-clk-222a37f59cfb

Best regards,
=2D-
Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

