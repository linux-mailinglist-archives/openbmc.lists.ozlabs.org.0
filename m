Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E121551F0E2
	for <lists+openbmc@lfdr.de>; Sun,  8 May 2022 21:49:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxFHM5k1Pz3c7W
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 05:49:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Dpfznk9P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Dpfznk9P; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxFBB71X7z3bdR
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 05:44:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652039035;
 bh=ARdVvvj+QR6zj7jH7tmlSixKEYcbCohZuth1Zlpb6F4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Dpfznk9P5+Yq1uW37Fv+kXuztyzVDIJqiZ1RTH0o+osGfBHJO90neIqP/+FOyxJtc
 uwqj3Qlsc2B2Gffe4g+gZntbf2dT4xv+/r9oxkFdbLFnZ615SzAS9WECWigsgPNFrK
 Hty2UuYQUUGltmw/PqHEOrLDQsRRmeVFHIUS3wws=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KUd-1nqTVy18WX-016eKc; Sun, 08
 May 2022 21:43:55 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v3 6/7] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Date: Sun,  8 May 2022 21:43:31 +0200
Message-Id: <20220508194333.2170161-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KrpzxJaSjCYOmWH1WrKsORKB3XhG/BxLuk+BPqLi4ogcSYKtqLf
 OWP9cG9FxjGoYQ9KxPIPzhQkWVg0cd7t9Jo2j6f46VPCExNnJDiTfoT9WI0f77BQhtp0HxG
 /nkghhKP7ya9gw4jiOrYctS8YU10mhgpZo55fkTGyXIsFo95TrU1M52MAEOmX8lSKN8x5vK
 SAhv3vArrb/5JqeMe2cgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:agU9m9EU81E=:b49ndZc+x+GHg9prjc6On9
 VyHjkR9O4Bo51NIQPB48B/VmmBOhi+CyHHWDWVowcAfxMJtyPF0L1DWqKcUQDmXaykCYh0lvx
 v8PoWV/5/jUmn1yRVIznPby2RXC9JCvjcwo9vZq4cTZEbOKgM9km4PzRVzFTN9V57h0UiHyIX
 0KjbOD9eCO+iwhEz8VRxz0vk28iEtd07U96LNlHrAbUaSzh2UQwxdIAuJU0T7jPNyq347erUn
 MQMESDHVfL3dgUZl8Wbd9Eg+71FqVaZPab7PB9f/xtXz/W3RhVtKsO2glPxHG3m/hz5YENz53
 89Gacz0BqrpzrH1dwC5jVAgC5qybsNuU9l2xOc/GDCUo0L42S1YkmRCEAtqHWjtIORV9p3W+W
 +JDE7HyU4Dxbs3SsmgEbun6Z1iIDEnWt6/U7Tw9+0tA3kUjGHnVp8Vw5pkV1433NiRlfkoN7S
 mSuExaeiYsOx7U+7+8fnXqAgjpfPdD+4Zg69gHxKMx+ibJpSQMQDu8znq6CGaEL/xbCiVaKxG
 IuqCqOl22G6dQXDnnv8iD1yPFG5c6izB9RvJV64KpO6GQYC45YjshlCN+U/hOu7plv/nmTdkk
 78ykgJfxT3bABT+wE7gNoRzqkgpHZnb/elB4odJeLljOz9k2hHpvX715TpNBDo3RrOiYJ8c4H
 TxZzoZFNND9CrHSbvo2uyYuZiVtFmagly0VZgCF6+e00g4RJTIOVELDf20mmBRXpR/SGP4n4B
 QsD8HgFPzogCBn9ZdfRRxWErMg6U5XycidieCpRYuzDmlbBHmPdnGvH2p7B5G2pqJrqvbBH28
 ud6ltgGXtSJVFR2A0uCBsDrWqgWOgUlBjXc8DXAoavUusyxJ490+SjWCaqEXYA1iPTkNnLXM3
 yufm2jvSINukOJMhs0flAw1bcEJGhqUdZ4cwI0SATbi7Mdw4GVV3Ozucq5vwB23r8rYrpkFpi
 HIxI2Q1uNleK111zoBsWTuMKvrR9ZULQ1x9Mne37/bLQ3LSSMMJaFToe9YNgurVLuCagL37UZ
 2gubdWdltOppIJSN6RZ2/4Fszlr2QnRylesnhwJKxhMdjazcT5KkJD7PVarQ6d5RvJufozvzg
 Epu0x12hbKWLgs=
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
=2D--

v3:
- Change reference clock name from "refclk" to "ref"
- Remove unused variable in return path of wpcm450_clk_register_pll
- Remove unused divisor tables

v2:
- https://lore.kernel.org/lkml/20220429172030.398011-7-j.neuschaefer@gmx.n=
et/
- no changes
=2D--
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-wpcm450.c | 363 ++++++++++++++++++++++++++++++++++++++
 drivers/reset/Kconfig     |   2 +-
 3 files changed, 365 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/clk-wpcm450.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 2bd5ffd595bf3..07edb0f4ba8ba 100644
=2D-- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_ARCH_VT8500)		+=3D clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+=3D clk-renesas-pcie.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+=3D clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+=3D clk-wm831x.o
+obj-$(CONFIG_ARCH_WPCM450)		+=3D clk-wpcm450.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+=3D clk-xgene.o

 # please keep this section sorted lexicographically by directory path nam=
e
diff --git a/drivers/clk/clk-wpcm450.c b/drivers/clk/clk-wpcm450.c
new file mode 100644
index 0000000000000..09f40d6f9c896
=2D-- /dev/null
+++ b/drivers/clk/clk-wpcm450.c
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0
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
+	if (parent_rate =3D=3D 0) {
+		pr_err("%s: parent rate is zero", __func__);
+		return 0;
+	}
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
+wpcm450_clk_register_pll(void __iomem *pllcon, const char *name,
+			 const char *parent_name, unsigned long flags)
+{
+	struct wpcm450_clk_pll *pll;
+	struct clk_init_data init;
+	int ret;
+
+	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	init.name =3D name;
+	init.ops =3D &wpcm450_clk_pll_ops;
+	init.parent_names =3D &parent_name;
+	init.num_parents =3D 1;
+	init.flags =3D flags;
+
+	pll->pllcon =3D pllcon;
+	pll->hw.init =3D &init;
+
+	ret =3D clk_hw_register(NULL, &pll->hw);
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
+	const char *parent_name;
+	unsigned int reg;
+	unsigned long flags;
+};
+
+static const struct wpcm450_pll_data pll_data[] =3D {
+	{ "pll0", "ref", REG_PLLCON0, 0 },
+	{ "pll1", "ref", REG_PLLCON1, 0 },
+};
+
+struct wpcm450_clksel_data {
+	const char *name;
+	const char *const *parent_names;
+	unsigned int num_parents;
+	const u32 *table;
+	int shift;
+	int width;
+	int index;
+	unsigned long flags;
+};
+
+static const u32 parent_table[] =3D { 0, 1, 2 };
+static const char *const default_parents[] =3D { "pll0", "pll1", "ref" };
+static const char *const huart_parents[] =3D { "ref", "refdiv2" };
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
+	const char *parent_name;
+	int div_flags;
+	const struct clk_div_table *table;
+	int shift;
+	int width;
+	unsigned long flags;
+};
+
+static struct wpcm450_clkdiv_data clkdiv_data_early[] =3D {
+	{ "refdiv2", "ref", 0, div_fixed2, 0, 0 },
+};
+
+static const struct wpcm450_clkdiv_data clkdiv_data[] =3D {
+	{ "cpu", "cpusel", 0, div_fixed2, 0, 0, CLK_IS_CRITICAL },
+	{ "adcdiv", "ref", CLK_DIVIDER_POWER_OF_TWO, NULL, 28, 2, 0 },
+	{ "apb", "ahb", CLK_DIVIDER_POWER_OF_TWO, NULL, 26, 2, 0 },
+	{ "ahb", "cpu", CLK_DIVIDER_POWER_OF_TWO, NULL, 24, 2, 0 },
+	{ "uart", "uartsel", 0, NULL, 16, 4, 0 },
+	{ "ahb3", "ahb", CLK_DIVIDER_POWER_OF_TWO, NULL, 8, 2, 0 },
+};
+
+struct wpcm450_clken_data {
+	const char *name;
+	const char *parent_name;
+	int bitnum;
+	unsigned long flags;
+};
+
+static const struct wpcm450_clken_data clken_data[] =3D {
+	{ "fiu", "ahb3", WPCM450_CLK_FIU, 0 },
+	{ "xbus", "ahb3", WPCM450_CLK_XBUS, 0 },
+	{ "kcs", "apb", WPCM450_CLK_KCS, 0 },
+	{ "shm", "ahb3", WPCM450_CLK_SHM, 0 },
+	{ "usb1", "ahb", WPCM450_CLK_USB1, 0 },
+	{ "emc0", "ahb", WPCM450_CLK_EMC0, 0 },
+	{ "emc1", "ahb", WPCM450_CLK_EMC1, 0 },
+	{ "usb0", "ahb", WPCM450_CLK_USB0, 0 },
+	{ "peci", "apb", WPCM450_CLK_PECI, 0 },
+	{ "aes", "apb", WPCM450_CLK_AES, 0 },
+	{ "uart0", "uart", WPCM450_CLK_UART0, 0 },
+	{ "uart1", "uart", WPCM450_CLK_UART1, 0 },
+	{ "smb2", "apb", WPCM450_CLK_SMB2, 0 },
+	{ "smb3", "apb", WPCM450_CLK_SMB3, 0 },
+	{ "smb4", "apb", WPCM450_CLK_SMB4, 0 },
+	{ "smb5", "apb", WPCM450_CLK_SMB5, 0 },
+	{ "huart", "huartsel", WPCM450_CLK_HUART, 0 },
+	{ "pwm", "apb", WPCM450_CLK_PWM, 0 },
+	{ "timer0", "refdiv2", WPCM450_CLK_TIMER0, 0 },
+	{ "timer1", "refdiv2", WPCM450_CLK_TIMER1, 0 },
+	{ "timer2", "refdiv2", WPCM450_CLK_TIMER2, 0 },
+	{ "timer3", "refdiv2", WPCM450_CLK_TIMER3, 0 },
+	{ "timer4", "refdiv2", WPCM450_CLK_TIMER4, 0 },
+	{ "mft0", "apb", WPCM450_CLK_MFT0, 0 },
+	{ "mft1", "apb", WPCM450_CLK_MFT1, 0 },
+	{ "wdt", "refdiv2", WPCM450_CLK_WDT, 0 },
+	{ "adc", "adcdiv", WPCM450_CLK_ADC, 0 },
+	{ "sdio", "ahb", WPCM450_CLK_SDIO, 0 },
+	{ "sspi", "apb", WPCM450_CLK_SSPI, 0 },
+	{ "smb0", "apb", WPCM450_CLK_SMB0, 0 },
+	{ "smb1", "apb", WPCM450_CLK_SMB1, 0 },
+};
+
+static DEFINE_SPINLOCK(wpcm450_clk_lock);
+
+static void __init wpcm450_clk_init(struct device_node *clk_np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	static struct clk_hw **hws;
+	static struct clk_hw *hw;
+	void __iomem *clk_base;
+	int i, ret;
+	struct reset_controller_dev *rcdev;
+
+	clk_base =3D of_iomap(clk_np, 0);
+	if (!clk_base) {
+		pr_err("%pOFP: failed to map registers\n", clk_np);
+		of_node_put(clk_np);
+		return;
+	}
+	of_node_put(clk_np);
+
+	clk_data =3D kzalloc(struct_size(clk_data, hws, WPCM450_NUM_CLKS), GFP_K=
ERNEL);
+	if (!clk_data)
+		goto err_unmap;
+
+	clk_data->num =3D WPCM450_NUM_CLKS;
+	hws =3D clk_data->hws;
+
+	for (i =3D 0; i < WPCM450_NUM_CLKS; i++)
+		hws[i] =3D ERR_PTR(-ENOENT);
+
+	// PLLs
+	for (i =3D 0; i < ARRAY_SIZE(pll_data); i++) {
+		const struct wpcm450_pll_data *data =3D &pll_data[i];
+
+		hw =3D wpcm450_clk_register_pll(clk_base + data->reg, data->name,
+					      data->parent_name, data->flags);
+		if (IS_ERR(hw)) {
+			pr_info("Failed to register PLL: %pe", hw);
+			goto err_free;
+		}
+	}
+
+	// Early divisors (REF/2)
+	for (i =3D 0; i < ARRAY_SIZE(clkdiv_data_early); i++) {
+		const struct wpcm450_clkdiv_data *data =3D &clkdiv_data_early[i];
+
+		hw =3D clk_hw_register_divider_table(NULL, data->name, data->parent_nam=
e,
+						   data->flags, clk_base + REG_CLKDIV,
+						   data->shift, data->width, data->div_flags,
+						   data->table, &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register div table: %pe\n", hw);
+			goto err_free;
+		}
+	}
+
+	// Selects/muxes
+	for (i =3D 0; i < ARRAY_SIZE(clksel_data); i++) {
+		const struct wpcm450_clksel_data *data =3D &clksel_data[i];
+
+		hw =3D clk_hw_register_mux_table(NULL, data->name, data->parent_names,
+					       data->num_parents, data->flags,
+					       clk_base + REG_CLKSEL, data->shift,
+					       BIT(data->width) - 1, 0, data->table,
+					       &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register mux: %pe\n", hw);
+			goto err_free;
+		}
+		if (data->index >=3D 0)
+			clk_data->hws[data->index] =3D hw;
+	}
+
+	// Divisors
+	for (i =3D 0; i < ARRAY_SIZE(clkdiv_data); i++) {
+		const struct wpcm450_clkdiv_data *data =3D &clkdiv_data[i];
+
+		hw =3D clk_hw_register_divider_table(NULL, data->name, data->parent_nam=
e,
+						   data->flags, clk_base + REG_CLKDIV,
+						   data->shift, data->width, data->div_flags,
+						   data->table, &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register divider: %pe\n", hw);
+			goto err_free;
+		}
+	}
+
+	// Enables/gates
+	for (i =3D 0; i < ARRAY_SIZE(clken_data); i++) {
+		const struct wpcm450_clken_data *data =3D &clken_data[i];
+
+		hw =3D clk_hw_register_gate(NULL, data->name, data->parent_name, data->=
flags,
+					  clk_base + REG_CLKEN, data->bitnum,
+					  data->flags, &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register gate: %pe\n", hw);
+			goto err_free;
+		}
+		clk_data->hws[data->bitnum] =3D hw;
+	}
+
+	ret =3D of_clk_add_hw_provider(clk_np, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		pr_err("Failed to add DT provider: %d\n", ret);
+
+	// Reset controller
+	rcdev =3D kzalloc(sizeof(*rcdev), GFP_KERNEL);
+	if (!rcdev)
+		goto err_free;
+	rcdev->owner =3D THIS_MODULE;
+	rcdev->nr_resets =3D WPCM450_NUM_RESETS;
+	rcdev->ops =3D &reset_simple_ops;
+	rcdev->of_node =3D clk_np;
+	ret =3D reset_controller_register(rcdev);
+	if (ret)
+		pr_err("Failed to register reset controller: %d\n", ret);
+
+	of_node_put(clk_np);
+	return;
+
+err_free:
+	kfree(clk_data->hws);
+err_unmap:
+	iounmap(clk_base);
+	of_node_put(clk_np);
+}
+
+CLK_OF_DECLARE(wpcm450_clk_init, "nuvoton,wpcm450-clk", wpcm450_clk_init)=
;
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index b496028b6bfaf..50a3c1403c335 100644
=2D-- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -201,7 +201,7 @@ config RESET_SCMI

 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || A=
RCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
+	default ARCH_ASPEED || ARCH_BCM4908 || ARCH_BITMAIN || ARCH_REALTEK || A=
RCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC || ARCH_NP=
CM
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
=2D-
2.35.1

