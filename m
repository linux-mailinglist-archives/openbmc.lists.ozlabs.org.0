Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD76E3118
	for <lists+openbmc@lfdr.de>; Sat, 15 Apr 2023 13:15:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pz9hw4Hc3z3f5J
	for <lists+openbmc@lfdr.de>; Sat, 15 Apr 2023 21:15:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=uZXx8dQM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=uZXx8dQM;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pz9hN4254z3cZp
	for <openbmc@lists.ozlabs.org>; Sat, 15 Apr 2023 21:14:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1681557263; i=j.neuschaefer@gmx.net;
	bh=ouLPlj+JJ99qgDIlMPBR/EYcxhVRtACUcMPo8tbwbOQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=uZXx8dQMxVULrYtSTRXPEzJijQbvPJRt/WbbEFmHD1PV6fQ3UZmEpVnpwhkRe+rXu
	 LRauDwg2IcZ/xQgWnURE9d6OlpM7JTvwB+rwUlnpkWTqetFEEF2i8k8rqOTXTU0aua
	 Nvq2Dcb+cTbWBWozgiWZk99detq8pSJ7NNvIl8pdvbLMiH/8IUsGNlksAj3q61gRcX
	 CZrY5EOsw+lik9nqnCnI/ZumOTc1OvA5QoOxAI8H8DROaPeDftbWoGFm6M/dFf9J9q
	 M7vg1meF/S+gvEXTUIVWLDK45L6XO5vf9d3SS0c3yUkRFwBYzoWeAilnEbwr5YK1Nf
	 T7elsU8P8PqkA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmKh-1q3OOF3S81-00K6p4; Sat, 15
 Apr 2023 13:14:22 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v6 0/2] Nuvoton WPCM450 clock and reset driver
Date: Sat, 15 Apr 2023 13:13:53 +0200
Message-Id: <20230415111355.696738-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gExXOv/2O3gKNHbYkqgUMQ+ff5aeYbPJIikimhemjhH8coxNWKa
 EEXwdHe8j9t7sUlqDan9uKna2szlA7gkK0cpO1k9nKhaiuzKB/XAlOsQXGqUy7Kh5l42ODp
 t3UZ6Ae8vPSc95VMUGDSELK/yKC2DPGS7kjwhQy5IM79H91jL3T2kuLA2/57V68tAJrZF74
 bB/OzytdSMR2HWATIO+HA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:abN0CqTbuGw=;vNQ4JrSDd3wHvjX8plDu8+6GDPW
 KKECW+/CCA3QPoMbP/JGQVSryqDm1EPgixyD9trdQ4csPDhEuDD0Mh5auy5GUhRI+mcZV5Ezf
 vr7MvWrsmJywfyoxRvji48Hz6AM6XDaUSbuOKhuuWxtpBtvPPRGr/7My0s3hTARY4u42LMpV5
 1m9WAsyu2Er94lptU+X0tMvWy3o7v9sdrtZUHDiUAhTateq37AuWJlrEJAeQWzqRzIHzaSN5M
 d6wnwCRw5n+6hZpyOrEUEPzK8ADgsgbQjGGs67GdZTxnA2cCZ9PPuMDNOXhsWoKRy4S1nYtgN
 mOkbqm6DOztQr/QAZNnknEuKWghVpn1di/SMxKgnkZvscvdTxaZpzi6s2A9Bv+U79jLV1pf6O
 E+stgaZ+rzcorjiFlYrf8bQtBTlTOwD3vFk3UbxbFlTX3DaRd6Jz249VvcZIsx+7s+dEQOYY0
 Z1B6PbZHYC5auIEc3fqc+QOBuSStS9NEAXqvAIgULVBakabcd0G5TyO/L87dtMOxy8i4DgTQ6
 JyJ/4SDHx4GhGzDg2/g3JmP7zcuv5a2Jp2TL3w9zr2yYRpYo/H0ZIfxafP0gsBolFrnCGN+fT
 GqlTGLbTrpL3NcvLuNzbIK/dwbs9WAmf8sU7Q7AKs4Ly/sj2QGzuvTkeL+N/COZLglFG0UADS
 TVIXW9JFTDedRCMpGRWGbQshdyPvD1iCcJSI+c+GEDcGQ93UzOYf/isdt4qKZknWiyc4Wh8lN
 +GTi0JnFWbcNfdKTrvOg2qnVORZwjz5laaA9APTMO4ZJKlgSxYCmlw09yFEtGm4ykl2he3v2V
 mwhnoMES9P85/8dMSJzG75w2XZmTNevAPdqLh3cqyhQxDqUbf9xi9ut4ZwBodJla/fkNH+fA6
 LeE2U5ckpfF7DCts/jxVWsO0Q/ZXo/4yvPwL7cuT7prk7Mpy51vlHGsxRzGFTT0agTiFiv77C
 DZHhOxAwrr++bG2F2Z6Emv4yHnk=
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

 .../bindings/clock/nuvoton,wpcm450-clk.yaml   |  66 +++
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-wpcm450.c                     | 375 ++++++++++++++++++
 drivers/reset/Kconfig                         |   2 +-
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   |  67 ++++
 5 files changed, 510 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 drivers/clk/clk-wpcm450.c
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

=2D-
2.39.2

