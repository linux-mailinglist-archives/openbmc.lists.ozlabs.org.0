Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD658B991F
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 12:42:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZF4mUG5D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVVrQ2DGhz3cXy
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 20:42:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZF4mUG5D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVVnw3prjz3cVs
	for <openbmc@lists.ozlabs.org>; Thu,  2 May 2024 20:40:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714646409; x=1715251209; i=j.neuschaefer@gmx.net;
	bh=k/2wUJqCS/1bOuRYIc422cgLx2nAzXVqfJrn7v4mg+Y=;
	h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZF4mUG5DqFM+LQHs9i4WnhvAbKSJ9PUbP42b6h271JYxQV1ycWv5J8f8yXJ6kZ+9
	 YFyKG8tX6dgZ+Qb73dTHjZli5KO3Rj7sCdrn2vbv81qFHrWVmpKmV9GwYxsgHpqn3
	 llhKu2dcZdVtvRQaPd5D8OjR3s9eygWYtIfNnuLS6jetEXSjwbNtOjWzMP+rkBcVw
	 tMfFJTexSsPEHvKr5m748lOQdC7cyZgSDeyprTJHE2fIlUrsaelTWPBkFbftblorB
	 qJ0mVccIGCkkYoMrs+UP4ILOIol6CLBlidFxkfAAwmV9AcOy8JBw3aLqDRpq14g6i
	 2FoaIzL6qY0qAJFs7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.78]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s4r-1s2khz3hd1-000Cw0; Thu, 02
 May 2024 12:40:08 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v12 0/6] Nuvoton WPCM450 clock and reset driver
Date: Thu, 02 May 2024 12:39:59 +0200
Message-Id: <20240502-wpcm-clk-v12-0-1d065d58df07@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAH9tM2YC/0WMwQ7CIBAFf6XZsxhYUIKn/ofpoSK0Gy1toKk1D
 f8u1oPHmfcyGyQXySW4VBtEt1CiMRQQeKjA9m3oHKN7EYAcFZeSs9dkB2afD4aIrdT+ZKy/Qbl
 P0Xla99a1KdxTmsf43tOLEF/9qygu/pWyMM6kNkqjOQtUqu6G9RjcDE3O+QMbB2QqoQAAAA==
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714646407; l=4460;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=LHlwXz0xY3IxreqHfZl/rfZVPyckYCVZucb0Ic/3Jx4=;
 b=F54kmxg0OgdLxDQ6n8T8nlUtGboDka/0NnhB9hGwtdXdLifx7EuW5EaGIfPMQ0DP6Ek0fRHB7
 w2cZbenVOwbDDnW8T1iJCrqsJLsp7GwKN0VAAK3u904HZbv3elyiXGY
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:5F32MW6LwlGRQ2sFNPeMQd2ujwcE7rwYB86X7T5DYtUUJaabFx6
 kmwN05r9Y+bQbCdgGB3JfNIgYXQYyFco8mV1t5TM++QyO446bux72hfOhBgJ6+A9FEjBOyz
 tLmf9mvkfdChj6eNgCg9F7cQX7PthRNVPO30nE8+MrSzdPCss5RMat7V7MErOKjiVaePsMW
 wi5PeUwF8HSLXL8ercUZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1TBB1C6c6xs=;Ibiv6q8LQCiq4B4fzLlZf1ufCI9
 twrI09m3Wevff5LCixbUPv92Pid4anhOtzQDShhBCIYCAZn5iZFq/vy+qoU2popZJEJrjyti5
 E+o5oTugKy1KP0yJqNhfitUi/xptTdw4wlM+SOWCxeU/hRfv8i4vVS94KrCh68yvbMwx2LmSv
 y/2NivJjNLuP4EpJ+QUhAwsSTm0ymkSgXlzGELBTFWQBc2P1gfeHAuvtsKAiYML/oL7HwMvGo
 weTcgfTf6tUZCJLrxcHXItd72dAfkQe8GjR2IUhqAmxHFttqKtz7Kmu/qr/FJCp0LkHHv1TtF
 2K+KAhNSlIkgpVnd4Vohqkf+CFNV+InFTNEoNuBWXeDoDCdHkEPHQMRRuT0jG5oi+lwq0sJv/
 BM9M/7zgbanb9WokOIN9xaDREx00T7A+2gqbAAdiEDzxQXW6eZgV81AnmRIW4plkjmOkfO8CN
 5UvGv09B4KLXTYVKrVLnnz/c+jTHPpSt//SN5tFlrcfVBp8hIH9TBxOdURMDpQnHs84MHu891
 JAQ0d1Nb40wOHyvM9vpdI6VdNRY7YE3dD4C3BsV3gOz6dj/8sq8MElwdknHWYpjw3N5tKGJR0
 JOANSq43wpt9TvBoy16fTH7YdCtqroRjZjK721w5XyqzeB+boUyyGygSR1f8hPjhd1H/lJmzn
 Filffp8OtcW3mMXjUCBNAXvdbrfcubBv7sn8JAQb8hdsHyQP8nnRMLD7lZnC0BYIRA/O2vR79
 qcRgCJA8GC9eut790Jlyz/bgqr8sr7UX9Ca14MraIqIi/vCpyHkierxbR1E+eNzCoqd0Tcu8o
 PlDH8PdmbzWlDhgmA9N1Q0l/3x1GTcY34FfbcrJGk62cU=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds support for the clock and reset controller in the Nuvoton
WPCM450 SoC. This means that the clock rates for peripherals will be
calculated automatically based on the clock tree as it was preconfigured
by the bootloader.  The 24 MHz dummy clock, that is currently in the
devicetree, is no longer needed.  Somewhat unfortunately, this also
means that there is a breaking change once the devicetree starts relying
on the clock driver, but I find it acceptable in this case, because
WPCM450 is still at a somewhat early stage.

v12:
- Convert to platform driver, but use fixed-factor-clock for timer
  (a necessary workaround because npcm7xx-timer needs its clock earlier
  than a platform driver can provide it)
- Various driver improvements suggested or inspired by Stephen Boyd
- New patches:
  - clk: Introduce devm_clk_hw_register_divider_table_parent_data()
  - clk: provider: Address documentation pitfall in struct clk_parent_data

v11:
- Link: https://lore.kernel.org/r/20240401-wpcm-clk-v11-0-379472961244@gmx=
.net
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
=2D--
Jonathan Neusch=C3=A4fer (6):
      dt-bindings: clock: Add Nuvoton WPCM450 clock/reset controller
      clk: Introduce devm_clk_hw_register_divider_table_parent_data()
      clk: provider: Address documentation pitfall in struct clk_parent_da=
ta
      clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
      ARM: dts: wpcm450: Remove clock-output-names from reference clock no=
de
      ARM: dts: wpcm450: Switch clocks to clock controller

 .../bindings/clock/nuvoton,wpcm450-clk.yaml        |  65 +++
 arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi     |  33 +-
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/nuvoton/Kconfig                        |  10 +-
 drivers/clk/nuvoton/Makefile                       |   1 +
 drivers/clk/nuvoton/clk-wpcm450.c                  | 455 ++++++++++++++++=
+++++
 include/dt-bindings/clock/nuvoton,wpcm450-clk.h    |  67 +++
 include/linux/clk-provider.h                       |  26 +-
 8 files changed, 643 insertions(+), 16 deletions(-)
=2D--
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240330-wpcm-clk-222a37f59cfb

Best regards,
=2D-
Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

