Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD79987784B
	for <lists+openbmc@lfdr.de>; Sun, 10 Mar 2024 20:25:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=lRy1TceE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tt8xn3J61z3d40
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 06:25:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=lRy1TceE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tt8tk0ncJz3d28
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 06:22:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1710098513; x=1710703313; i=j.neuschaefer@gmx.net;
	bh=HQDSQDOdxp9YZkECmYHBYTYQZL9fFJLaU2GENuM1weM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=lRy1TceEaskgIRMGejC1XdpFVltesQ04ZblVRtcm2ulE+otJHeZ0HVQ+gmna4uyJ
	 ihHisIvU/q6dFUfTY6eoRkRszmQfMMVYf6P7U9q25R/iqdRUftC1Brao/dhWOfKtZ
	 FukGgisTTMm55wZuNst1x5Kxb+liQ6pX9mCEXpO5hgneJ1zyRhOhuxBFRbJ3rQUAJ
	 48VXgRJintvew07QkCkZwlw+Y+PLinlISztdtz1gIbQUEX6/PBo0NbBdUoj0xOEFm
	 OgZTi6x2eONRmYXBSvqXevJhlFTxJ2gFbeKzRgXmyNCeDGaTYBF4aZFOAXbxXGXRR
	 6HFt7gfN/KX0dyt4yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.216.168]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkHMP-1qzdo93jrt-00kf9N; Sun, 10
 Mar 2024 20:21:53 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v10 3/4] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
Date: Sun, 10 Mar 2024 20:21:01 +0100
Message-ID: <20240310192108.2747084-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240310192108.2747084-1-j.neuschaefer@gmx.net>
References: <20240310192108.2747084-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VUvmWc7FGu1I3vUCrTN4TGUiRzyoTnAGI+ma982Aw7H51WgYamN
 lJxmL39iyQrBojPDkmm6uF2ME3WKTv8sogHtM6ObnIT1JMKXOizIm/1Of02zJbKnWA6aNoP
 mOEFhBZF+tQGH13kMTi+ppX7Tu9zOvkrZZMbopx1RAq8JFS2ZbphF1ZUF59tT4sXitE90ju
 aG25HWOyuL5WVEYYf1rsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AxNMiufJGsE=;BHUqa/Fib2c/0UdZmiyMbIC14h5
 aHa1YnMR9Tzt3tGvbb54HQ9AvB74YZgTTuLMJ0KTBMn5ZhU1W/lO4bqczPdO96AI2ATPG7h1Z
 NHQjZdGvdxyXq4Hodjsf/iYVKWENo5uJybFpXdhfujPutontohM+MCiNVCC6+QPBCzQFgrrQr
 7GnVT/+FI5oNlWPnLWAsrjY9empWic6m5HyTC9Hq8F+QPpuzapNKpVCvA86S8BrowNe2CBRud
 b12h8ATA0S5P71bnNjS+kfgiJHZNZxeUP1Eattry3Xp/KrevyPEq3VXT145bCLtmj2pgOA8w4
 cMtYMoZYviEu9kMz4Zcgf5Kz2cdHoGSMVPVQrWsZAVj+aSZc0WXBlhlbxKYZxXT5j3gUvoTUa
 isMU9P7wU7fhJkoPHCr0isPmuXI7yJ0Nc8HwNRyxEND9MSV/RSE4FimHpZ1jopBXNJM0Cp0Av
 xatmtlFN1tMw6xy/jTagiZdY1sa572Qe8HFI7SBnNJ9jLl1Cp9SNbcmLjwtQlsNs6XTYn2bGU
 n3t6ZpjgzZOqY5UoQb/bbGzK7P+7S/EHYIOUSGNc1/+DkZqWTO1jEwS9yo9LDVy4+7+x/LDpO
 QGZIx1YapRk/OGV9QT17BOd48rEgFjDHikrrlZvK27YiQ/z99gD1jyoGoNZ2A4cjywlGrN1IG
 qlKE4U1O/7VqNUABZn8XqEu5gpV5xqaEAGC4+OevwKFmhJgG/aakffhCxzSpRiMEhPMUwTvXr
 yyKRfUjErmpQRp0Pjo1AuEHy2F7iMnBSh2lfC8MYWA813qs7HNRYk0mKr8xUPrCuCvzbgYQUK
 JrfE+TmuzXHubRfrRc6asFapnTwnc11HY/0pwYPyJEM68=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Jacky Huang <ychuang3@nuvoton.com>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benjamin Fair <benjaminfair@google.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver implements the following features w.r.t. the clock and reset
controller in the WPCM450 SoC:

- It calculates the rates for all clocks managed by the clock controller
- It leaves the clock tree mostly unchanged, except that it enables/
  disables clock gates based on usage.
- It exposes the reset lines managed by the controller using the
  Generic Reset Controller subsystem

NOTE: If the driver and the corresponding devicetree node are present,
      the driver will disable "unused" clocks. This is problem until
      the clock relations are properly declared in the devicetree (in a
      later patch). Until then, the clk_ignore_unused kernel parameter
      can be used as a workaround.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
=2D--

I have considered converting this driver to a platform driver instead of
using CLK_OF_DECLARE, because platform drivers are generally the way
forward. However, the timer-npcm7xx driver used on the same platform
requires is initialized with TIMER_OF_DECLARE and thus requires the
clocks to be available earlier than a platform driver can provide them.


v10:
- select RESET_{CONTROLLER,SIMPLE} from CLK_WPCM450 instead of messing wit=
h the 'default' statement

v9:
- Apply comments made by Stephen Boyd
- Move to drivers/clk/nuvoton/ directory
- Update SPDX license identifier from GPL-2.0 to GPL-2.0-only
- Rename clk_np variable to np
- Use of_clk_hw_register
- Refer to clock parents by .fw_name

v8:
- https://lore.kernel.org/lkml/20230428190226.1304326-3-j.neuschaefer@gmx.=
net/
- Use %pe format specifier throughout the driver, as suggested by Philipp =
Zabel
- Add Joel's R-b

v7:
- https://lore.kernel.org/lkml/20230422220240.322572-3-j.neuschaefer@gmx.n=
et/
- Simplify error handling by not deallocating resources

v6:
- Enable RESET_SIMPLE based on ARCH_WPCM450, not ARCH_NPCM, as suggested b=
y Tomer Maimon

v5:
- https://lore.kernel.org/lkml/20221104161850.2889894-6-j.neuschaefer@gmx.=
net/
- Switch to using clk_parent_data

v4:
- Fix reset controller initialization

v3:
- Change reference clock name from "refclk" to "ref"
- Remove unused variable in return path of wpcm450_clk_register_pll
- Remove unused divisor tables

v2:
- no changes
=2D--
 drivers/clk/Makefile              |   2 +-
 drivers/clk/nuvoton/Kconfig       |  10 +-
 drivers/clk/nuvoton/Makefile      |   1 +
 drivers/clk/nuvoton/clk-wpcm450.c | 372 ++++++++++++++++++++++++++++++
 4 files changed, 383 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/nuvoton/clk-wpcm450.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 14fa8d4ecc1fbe..cdeb2ecf3a8e99 100644
=2D-- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -107,7 +107,7 @@ endif
 obj-y					+=3D mstar/
 obj-y					+=3D mvebu/
 obj-$(CONFIG_ARCH_MXS)			+=3D mxs/
-obj-$(CONFIG_ARCH_MA35)			+=3D nuvoton/
+obj-y					+=3D nuvoton/
 obj-$(CONFIG_COMMON_CLK_NXP)		+=3D nxp/
 obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+=3D pistachio/
 obj-$(CONFIG_COMMON_CLK_PXA)		+=3D pxa/
diff --git a/drivers/clk/nuvoton/Kconfig b/drivers/clk/nuvoton/Kconfig
index fe4b7f62f46704..908881654b2e91 100644
=2D-- a/drivers/clk/nuvoton/Kconfig
+++ b/drivers/clk/nuvoton/Kconfig
@@ -3,7 +3,7 @@

 config COMMON_CLK_NUVOTON
 	bool "Nuvoton clock controller common support"
-	depends on ARCH_MA35 || COMPILE_TEST
+	depends on ARCH_MA35 || ARCH_NPCM || COMPILE_TEST
 	default y
 	help
 	  Say y here to enable common clock controller for Nuvoton platforms.
@@ -16,4 +16,12 @@ config CLK_MA35D1
 	help
 	  Build the clock controller driver for MA35D1 SoC.

+config CLK_WPCM450
+	bool "Nuvoton WPCM450 clock/reset controller support"
+	default y
+	select RESET_CONTROLLER
+	select RESET_SIMPLE
+	help
+	  Build the clock and reset controller driver for the WPCM450 SoC.
+
 endif
diff --git a/drivers/clk/nuvoton/Makefile b/drivers/clk/nuvoton/Makefile
index c3c59dd9f2aaab..b130f0d3889ca0 100644
=2D-- a/drivers/clk/nuvoton/Makefile
+++ b/drivers/clk/nuvoton/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_CLK_MA35D1) +=3D clk-ma35d1.o
 obj-$(CONFIG_CLK_MA35D1) +=3D clk-ma35d1-divider.o
 obj-$(CONFIG_CLK_MA35D1) +=3D clk-ma35d1-pll.o
+obj-$(CONFIG_CLK_WPCM450) +=3D clk-wpcm450.o
diff --git a/drivers/clk/nuvoton/clk-wpcm450.c b/drivers/clk/nuvoton/clk-w=
pcm450.c
new file mode 100644
index 00000000000000..9100c4b8a56483
=2D-- /dev/null
+++ b/drivers/clk/nuvoton/clk-wpcm450.c
@@ -0,0 +1,372 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton WPCM450 clock and reset controller driver.
+ *
+ * Copyright (C) 2022 Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
+
+struct wpcm450_clk_pll {
+	struct clk_hw hw;
+	void __iomem *pllcon;
+	u8 flags;
+};
+
+#define to_wpcm450_clk_pll(_hw) container_of(_hw, struct wpcm450_clk_pll,=
 hw)
+
+#define PLLCON_FBDV	GENMASK(24, 16)
+#define PLLCON_PRST	BIT(13)
+#define PLLCON_PWDEN	BIT(12)
+#define PLLCON_OTDV	GENMASK(10, 8)
+#define PLLCON_INDV	GENMASK(5, 0)
+
+static unsigned long wpcm450_clk_pll_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
+	unsigned long fbdv, indv, otdv;
+	u64 rate;
+	u32 pllcon;
+
+	if (parent_rate =3D=3D 0)
+		return 0;
+
+	pllcon =3D readl_relaxed(pll->pllcon);
+
+	indv =3D FIELD_GET(PLLCON_INDV, pllcon) + 1;
+	fbdv =3D FIELD_GET(PLLCON_FBDV, pllcon) + 1;
+	otdv =3D FIELD_GET(PLLCON_OTDV, pllcon) + 1;
+
+	rate =3D (u64)parent_rate * fbdv;
+	do_div(rate, indv * otdv);
+
+	return rate;
+}
+
+static int wpcm450_clk_pll_is_enabled(struct clk_hw *hw)
+{
+	struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
+	u32 pllcon;
+
+	pllcon =3D readl_relaxed(pll->pllcon);
+
+	return !(pllcon & PLLCON_PRST);
+}
+
+static void wpcm450_clk_pll_disable(struct clk_hw *hw)
+{
+	struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
+	u32 pllcon;
+
+	pllcon =3D readl_relaxed(pll->pllcon);
+	pllcon |=3D PLLCON_PRST | PLLCON_PWDEN;
+	writel(pllcon, pll->pllcon);
+}
+
+static const struct clk_ops wpcm450_clk_pll_ops =3D {
+	.recalc_rate =3D wpcm450_clk_pll_recalc_rate,
+	.is_enabled =3D wpcm450_clk_pll_is_enabled,
+	.disable =3D wpcm450_clk_pll_disable
+};
+
+static struct clk_hw *
+wpcm450_clk_register_pll(struct device_node *np, void __iomem *pllcon, co=
nst char *name,
+			 const struct clk_parent_data *parent, unsigned long flags)
+{
+	struct wpcm450_clk_pll *pll;
+	struct clk_init_data init =3D {};
+	int ret;
+
+	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	init.name =3D name;
+	init.ops =3D &wpcm450_clk_pll_ops;
+	init.parent_data =3D parent;
+	init.num_parents =3D 1;
+	init.flags =3D flags;
+
+	pll->pllcon =3D pllcon;
+	pll->hw.init =3D &init;
+
+	ret =3D of_clk_hw_register(np, &pll->hw);
+	if (ret) {
+		kfree(pll);
+		return ERR_PTR(ret);
+	}
+
+	return &pll->hw;
+}
+
+#define REG_CLKEN	0x00
+#define REG_CLKSEL	0x04
+#define REG_CLKDIV	0x08
+#define REG_PLLCON0	0x0c
+#define REG_PLLCON1	0x10
+#define REG_PMCON	0x14
+#define REG_IRQWAKECON	0x18
+#define REG_IRQWAKEFLAG	0x1c
+#define REG_IPSRST	0x20
+
+struct wpcm450_pll_data {
+	const char *name;
+	struct clk_parent_data parent;
+	unsigned int reg;
+	unsigned long flags;
+};
+
+static const struct wpcm450_pll_data pll_data[] =3D {
+	{ "pll0", { .fw_name =3D "ref" }, REG_PLLCON0, 0 },
+	{ "pll1", { .fw_name =3D "ref" }, REG_PLLCON1, 0 },
+};
+
+struct wpcm450_clksel_data {
+	const char *name;
+	const struct clk_parent_data *parents;
+	unsigned int num_parents;
+	const u32 *table;
+	int shift;
+	int width;
+	int index;
+	unsigned long flags;
+};
+
+static const u32 parent_table[] =3D { 0, 1, 2 };
+
+static const struct clk_parent_data default_parents[] =3D {
+	{ .name =3D "pll0" },
+	{ .name =3D "pll1" },
+	{ .name =3D "ref" },
+};
+
+static const struct clk_parent_data huart_parents[] =3D {
+	{ .fw_name =3D "ref" },
+	{ .name =3D "refdiv2" },
+};
+
+static const struct wpcm450_clksel_data clksel_data[] =3D {
+	{ "cpusel", default_parents, ARRAY_SIZE(default_parents),
+		parent_table, 0, 2, -1, CLK_IS_CRITICAL },
+	{ "clkout", default_parents, ARRAY_SIZE(default_parents),
+		parent_table, 2, 2, -1, 0 },
+	{ "usbphy", default_parents, ARRAY_SIZE(default_parents),
+		parent_table, 6, 2, -1, 0 },
+	{ "uartsel", default_parents, ARRAY_SIZE(default_parents),
+		parent_table, 8, 2, WPCM450_CLK_USBPHY, 0 },
+	{ "huartsel", huart_parents, ARRAY_SIZE(huart_parents),
+		parent_table, 10, 1, -1, 0 },
+};
+
+static const struct clk_div_table div_fixed2[] =3D {
+	{ .val =3D 0, .div =3D 2 },
+	{ }
+};
+
+struct wpcm450_clkdiv_data {
+	const char *name;
+	struct clk_parent_data parent;
+	int div_flags;
+	const struct clk_div_table *table;
+	int shift;
+	int width;
+	unsigned long flags;
+};
+
+static struct wpcm450_clkdiv_data clkdiv_data_early[] =3D {
+	{ "refdiv2", { .name =3D "ref" }, 0, div_fixed2, 0, 0 },
+};
+
+static const struct wpcm450_clkdiv_data clkdiv_data[] =3D {
+	{ "cpu", { .name =3D "cpusel" }, 0, div_fixed2, 0, 0, CLK_IS_CRITICAL },
+	{ "adcdiv", { .name =3D "ref" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 28, 2, =
0 },
+	{ "apb", { .name =3D "ahb" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 26, 2, 0 }=
,
+	{ "ahb", { .name =3D "cpu" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 24, 2, 0 }=
,
+	{ "uart", { .name =3D "uartsel" }, 0, NULL, 16, 4, 0 },
+	{ "ahb3", { .name =3D "ahb" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 8, 2, 0 }=
,
+};
+
+struct wpcm450_clken_data {
+	const char *name;
+	struct clk_parent_data parent;
+	int bitnum;
+	unsigned long flags;
+};
+
+static const struct wpcm450_clken_data clken_data[] =3D {
+	{ "fiu", { .name =3D "ahb3" }, WPCM450_CLK_FIU, 0 },
+	{ "xbus", { .name =3D "ahb3" }, WPCM450_CLK_XBUS, 0 },
+	{ "kcs", { .name =3D "apb" }, WPCM450_CLK_KCS, 0 },
+	{ "shm", { .name =3D "ahb3" }, WPCM450_CLK_SHM, 0 },
+	{ "usb1", { .name =3D "ahb" }, WPCM450_CLK_USB1, 0 },
+	{ "emc0", { .name =3D "ahb" }, WPCM450_CLK_EMC0, 0 },
+	{ "emc1", { .name =3D "ahb" }, WPCM450_CLK_EMC1, 0 },
+	{ "usb0", { .name =3D "ahb" }, WPCM450_CLK_USB0, 0 },
+	{ "peci", { .name =3D "apb" }, WPCM450_CLK_PECI, 0 },
+	{ "aes", { .name =3D "apb" }, WPCM450_CLK_AES, 0 },
+	{ "uart0", { .name =3D "uart" }, WPCM450_CLK_UART0, 0 },
+	{ "uart1", { .name =3D "uart" }, WPCM450_CLK_UART1, 0 },
+	{ "smb2", { .name =3D "apb" }, WPCM450_CLK_SMB2, 0 },
+	{ "smb3", { .name =3D "apb" }, WPCM450_CLK_SMB3, 0 },
+	{ "smb4", { .name =3D "apb" }, WPCM450_CLK_SMB4, 0 },
+	{ "smb5", { .name =3D "apb" }, WPCM450_CLK_SMB5, 0 },
+	{ "huart", { .name =3D "huartsel" }, WPCM450_CLK_HUART, 0 },
+	{ "pwm", { .name =3D "apb" }, WPCM450_CLK_PWM, 0 },
+	{ "timer0", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER0, 0 },
+	{ "timer1", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER1, 0 },
+	{ "timer2", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER2, 0 },
+	{ "timer3", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER3, 0 },
+	{ "timer4", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER4, 0 },
+	{ "mft0", { .name =3D "apb" }, WPCM450_CLK_MFT0, 0 },
+	{ "mft1", { .name =3D "apb" }, WPCM450_CLK_MFT1, 0 },
+	{ "wdt", { .name =3D "refdiv2" }, WPCM450_CLK_WDT, 0 },
+	{ "adc", { .name =3D "adcdiv" }, WPCM450_CLK_ADC, 0 },
+	{ "sdio", { .name =3D "ahb" }, WPCM450_CLK_SDIO, 0 },
+	{ "sspi", { .name =3D "apb" }, WPCM450_CLK_SSPI, 0 },
+	{ "smb0", { .name =3D "apb" }, WPCM450_CLK_SMB0, 0 },
+	{ "smb1", { .name =3D "apb" }, WPCM450_CLK_SMB1, 0 },
+};
+
+static DEFINE_SPINLOCK(wpcm450_clk_lock);
+
+/*
+ * NOTE: Error handling is very rudimentary here. If the clock driver ini=
tial-
+ * ization fails, the system is probably in bigger trouble than what is c=
aused
+ * by a few leaked resources.
+ */
+
+static void __init wpcm450_clk_init(struct device_node *np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	static struct clk_hw **hws;
+	static struct clk_hw *hw;
+	void __iomem *clk_base;
+	int i, ret;
+	struct reset_simple_data *reset;
+
+	clk_base =3D of_iomap(np, 0);
+	if (!clk_base) {
+		pr_err("%pOFP: failed to map registers\n", np);
+		of_node_put(np);
+		return;
+	}
+	of_node_put(np);
+
+	clk_data =3D kzalloc(struct_size(clk_data, hws, WPCM450_NUM_CLKS), GFP_K=
ERNEL);
+	if (!clk_data)
+		return;
+
+	clk_data->num =3D WPCM450_NUM_CLKS;
+	hws =3D clk_data->hws;
+
+	for (i =3D 0; i < WPCM450_NUM_CLKS; i++)
+		hws[i] =3D ERR_PTR(-ENOENT);
+
+	/* PLLs */
+	for (i =3D 0; i < ARRAY_SIZE(pll_data); i++) {
+		const struct wpcm450_pll_data *data =3D &pll_data[i];
+
+		hw =3D wpcm450_clk_register_pll(np, clk_base + data->reg, data->name,
+					      &data->parent, data->flags);
+		if (IS_ERR(hw)) {
+			pr_info("Failed to register PLL: %pe\n", hw);
+			return;
+		}
+	}
+
+	/* Early divisors (REF/2) */
+	for (i =3D 0; i < ARRAY_SIZE(clkdiv_data_early); i++) {
+		const struct wpcm450_clkdiv_data *data =3D &clkdiv_data_early[i];
+
+		hw =3D clk_hw_register_divider_table_parent_data(NULL, data->name, &dat=
a->parent,
+							       data->flags, clk_base + REG_CLKDIV,
+							       data->shift, data->width,
+							       data->div_flags, data->table,
+							       &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register div table: %pe\n", hw);
+			return;
+		}
+	}
+
+	/* Selects/muxes */
+	for (i =3D 0; i < ARRAY_SIZE(clksel_data); i++) {
+		const struct wpcm450_clksel_data *data =3D &clksel_data[i];
+
+		hw =3D clk_hw_register_mux_parent_data(NULL, data->name, data->parents,
+						     data->num_parents, data->flags,
+						     clk_base + REG_CLKSEL, data->shift,
+						     data->width, 0,
+						     &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register mux: %pe\n", hw);
+			return;
+		}
+		if (data->index >=3D 0)
+			clk_data->hws[data->index] =3D hw;
+	}
+
+	/* Divisors */
+	for (i =3D 0; i < ARRAY_SIZE(clkdiv_data); i++) {
+		const struct wpcm450_clkdiv_data *data =3D &clkdiv_data[i];
+
+		hw =3D clk_hw_register_divider_table_parent_data(NULL, data->name, &dat=
a->parent,
+							       data->flags, clk_base + REG_CLKDIV,
+							       data->shift, data->width,
+							       data->div_flags, data->table,
+							       &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register divider: %pe\n", hw);
+			return;
+		}
+	}
+
+	/* Enables/gates */
+	for (i =3D 0; i < ARRAY_SIZE(clken_data); i++) {
+		const struct wpcm450_clken_data *data =3D &clken_data[i];
+
+		hw =3D clk_hw_register_gate_parent_data(NULL, data->name, &data->parent=
, data->flags,
+						      clk_base + REG_CLKEN, data->bitnum,
+						      data->flags, &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register gate: %pe\n", hw);
+			return;
+		}
+		clk_data->hws[data->bitnum] =3D hw;
+	}
+
+	ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		pr_err("Failed to add DT provider: %pe\n", ERR_PTR(ret));
+
+	/* Reset controller */
+	reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);
+	if (!reset)
+		return;
+	reset->rcdev.owner =3D THIS_MODULE;
+	reset->rcdev.nr_resets =3D WPCM450_NUM_RESETS;
+	reset->rcdev.ops =3D &reset_simple_ops;
+	reset->rcdev.of_node =3D np;
+	reset->membase =3D clk_base + REG_IPSRST;
+	ret =3D reset_controller_register(&reset->rcdev);
+	if (ret)
+		pr_err("Failed to register reset controller: %pe\n", ERR_PTR(ret));
+
+	of_node_put(np);
+}
+
+CLK_OF_DECLARE(wpcm450_clk_init, "nuvoton,wpcm450-clk", wpcm450_clk_init)=
;
=2D-
2.43.0

