Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E6E87784A
	for <lists+openbmc@lfdr.de>; Sun, 10 Mar 2024 20:24:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=V8TY9Ze+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tt8wr1P1Pz3d40
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 06:24:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=V8TY9Ze+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tt8tN1W18z3bvW
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 06:22:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1710098497; x=1710703297; i=j.neuschaefer@gmx.net;
	bh=OXX/LbaU7GJrUUhq8phRnsYSS16aaUbuS71uc4P5kmk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=V8TY9Ze+YTe382UrgndqBxwz5hqS5fJLAI7fB8uRGo6fH4kZJ46feIMj4voZLID5
	 RvGb1TLgm6bu7u1zpXpn2mclOvCiV+JeQ0W4iiMXLx2yFakyyWL3QPdxbA6RAK2bd
	 XSHxqrHfTnN67JzdE/6F2ASRY4UUvAMnS0ynUvQirt56VVh3aSPIZ62JghDQ73ZVV
	 wP0ICXm9S1ESLUz+ZVq9CGFS8ED5EqGGikhvWMuho0XeVv2c+XOqa4W8WDy3sxQLn
	 VxAVA8c1l+oRywe61KOlc7+VgufHVB129Jyva1QA2o3m6DEImxWjDlN/N00K/sgP3
	 RIN+BWvp5Npsc13HXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.216.168]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma24y-1rMQLt175g-00VzLi; Sun, 10
 Mar 2024 20:21:37 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v10 0/4] Nuvoton WPCM450 clock and reset driver
Date: Sun, 10 Mar 2024 20:20:58 +0100
Message-ID: <20240310192108.2747084-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h8nNCU1eVa9eOlYmr5/DlSxu2gYJ2DGv4jpVv4LW9vCiALtYAFJ
 ePH5GCBPDGmbpfjl/xbZ3kp8GxEbKydLT7w0Kq/oyB3Rx/wzYm71htKr4T5xcGPla7HQK/+
 tYq8ZkPy2vB5zYTJUmCi0pV50mtVOHOx4kTa1e+0+cojYzWR16eQ4B88NkxGUA3rSKXrC5t
 AnkhS6HcZ9Bk9aehLRDcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4MR0BT5pui4=;WqG0QuHADYmx2iw2xGIjrJ4Annf
 073tj58pKE3mU7r2NStD9h6Z+DY/VoZYCYkkYrvQws6NB9vqNSvYITJQ3bvwYSWGa7Fj73iBU
 d1wAxYJxpciLESc9KUwDIAnEQ9eP1HL20dbgdOSiBWGZQyKSqXAIgQZv4bllX3prOmWjDt8C3
 EAM9Tv4HtOBTT2l4A1kNYWznIEX8t6bN17+J7XF+ZjQhDdmhChYJRNXXBTdIF9Ggu2VjrSHeh
 EhPyG0w9ZKAgqMFoacd6H90hyZlwAbES64/ktzMay7cUqn6WYO5xp9e9l/h57ZDCttaw/C6IW
 KMS75K5C4fLELU8aHkfB/hE+keyN+uQN3daJqQ9XhuIV28h3bkFdYC00aunvxWfSnh6WWfaS7
 jZb25f9o4hkOPb6LmEbO8lOESS/a1BPesBWzUtSKZRuBgxFifMfhXxCKvRHqjIC5sstr4Vi3f
 OumVoOQSXpcf+Wk+QZ0A9xyhue8vDaFV+A06omhawZ2MPDpIHzODPSNfEGGweC0IdxXorfMbp
 urNvhx+sDUbrEjTrmLH3e6Z6Z+gnR+cJyr9sqv+oitXQecR8DhNoK2UYGAF2hfXvqgUq0/fiC
 66o6VOrWOv4EI4vTHcticMvsOfaH3IzNdAZ0kyPfE19XHB045idVNDcWAopLYgB/yvnGsv6XW
 XiKDWlLfa5ew3FB3fxxKqjCeaQnB7TAW/Dt5eJCsc3t9x/PuT+01bL8XWox4xeJem5dNEhnID
 qMJpLLNeYy6NoMLfIehSGgIt8UHEpwEAkMSaRgntN2j39DpwsunCiWjo0UvOCldd1nsE+8Zdh
 9If5m6mHPJbsT2tyLz2Icl2+VuzfzCxaEjKCQabqIPUjQ=
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Benjamin Fair <benjaminfair@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Tali Perry <tali.perry1@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
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


Jonathan Neusch=C3=A4fer (4):
  dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
  ARM: dts: wpcm450: Remove clock-output-names from reference clock node
  clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
  ARM: dts: wpcm450: Switch clocks to clock controller

 .../bindings/clock/nuvoton,wpcm450-clk.yaml   |  65 +++
 .../arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi |  23 +-
 drivers/clk/Makefile                          |   2 +-
 drivers/clk/nuvoton/Kconfig                   |  10 +-
 drivers/clk/nuvoton/Makefile                  |   1 +
 drivers/clk/nuvoton/clk-wpcm450.c             | 372 ++++++++++++++++++
 .../dt-bindings/clock/nuvoton,wpcm450-clk.h   |  67 ++++
 7 files changed, 525 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,wpcm45=
0-clk.yaml
 create mode 100644 drivers/clk/nuvoton/clk-wpcm450.c
 create mode 100644 include/dt-bindings/clock/nuvoton,wpcm450-clk.h

=2D-
2.43.0

