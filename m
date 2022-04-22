Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF3E50BFCE
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:35:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNPg5k5pz3bbG
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:35:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=khe27MIN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=khe27MIN; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNLS6pDQz3bZP
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:32:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650652317;
 bh=Z7teJIYqUSq12c5uTIxh9gTwy/vvO4uUbKqt8v51mdE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=khe27MINcbDk1wnnET1Rnk73Da/M8lzLqxbVOIZ+ntl85vyI30kfIS5I7tGjBdi8w
 TIiuC5L5MXj/Ykql33h4URosbfF0jGYM0p8cR3IPxAVFkZPGLxXsgG1xzuQi7G35R6
 JJaZ5mNVnMEQw6bHFdueP8PFBxB+g6tvwpEMg2+0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.190.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUm7-1ncANu1Qv1-00Cxwe; Fri, 22
 Apr 2022 20:31:57 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 6/7] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller
 driver
Date: Fri, 22 Apr 2022 20:30:11 +0200
Message-Id: <20220422183012.444674-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422183012.444674-1-j.neuschaefer@gmx.net>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gaCx0O9WDw+rwOFW3kkbLxaWxszoxkpE9hactbEFpdSE8StJcBX
 NsHfbRfFTuk6t2QdKLJXiFocCpwubMjU/Hfmb/gVwljXLT+BVvvVan3Snsh4sB7B0ZOf5Z6
 RmVpMVnQ/aPMoGqQqb4yhNelNZTqSt88FZjFUuGMFq3ghJmbYFBr55CPSoOdSB1xh3+z+5p
 q528vyuc6nBZ3/yyf3mQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q9k8dyXCCz8=:sfXuxAqTQQxY6B0sW7qFsf
 xw0CmXMEyj2+gcPx5SK1bOy/ZoZQ0JSpnYSY8x7CoH/J7S9G0zaDZ+ysoZh1MRvCIx+6Rt0sS
 EZtu6do68sA5Pim2R+bDPybT0b1c2l53GxELIlzjd3knZzcCPefwKxdEIYq8Xcqe/M8h47LMO
 UEIm1c0VKxhrdHFKyZ7ON6TYgbfZ4HD3IoGn1SJjZ3GreBjugAfAUGrhqe2bjOQWked6ECt8r
 qTgJYmdg/OnDAvF212GXfMVwz+RBmLybEkCuK6hXkZTE0HMg51vSXmEQMETkDyZPNKjs1+ymj
 R29NjKB1yM1jffdtJNwg610N9FpcktWdTbHmLE9OmkJjES+wqGAWYFMFG1l14NtF15Y/2mrOG
 6js2PxD5y9eip9QQ598k5xLSCIxwCN/F4emgJHgJvHNPxKrgsey7mG6+Y33sQraAyknECWOD8
 9Bmar1C0T+eeJnSX1A6w+GhgOHbOgK8O+RwM9iMCsTMe4kdgvocFLYSl4f/HnBhc590xaF6K+
 BoMZpOixb44lhYBlQMmazV031GjB98NjChLgKJJn7PpVmUzaIEoKtKywx7Fr3E65ulrMB9L6c
 hsl+S9xGx2GGnTgDC4zIn3UHR9aqfIMnI4RHo1R8GFKT5k+PZLT4ySZ/di1S3s+ytJD0FOQtZ
 8klCYe0fu1AnUmzxNI8uUNcxHdvJSFdGQGSJHSRZcCn+EPcycQ8N41igza5Lm8Sd7yB/h7CU8
 SCupDilEpFisswiVR3U9uOPsqRdHvCyk2Iqla2OGQtG/aIQt45FBOvgjLcRgR9WMPAJUeqF9E
 WD0to2e7rQnYhHwQZkHNTYu3264pGY3eOyLD339AKebT/2yFFm42KVJRDJrKHrrxleTtvSyv1
 j2wr1UOHK2GHjkzswQj/jOOHKlLj9qdEU8Dsttox6IdQD1nXrIETPZuBaKfIY4JJC8giGkLxi
 XffU0PlnKL07KQ/4LJ4p7Bc36Ob7rLYiRnqywps0vnwkGzM5eK/cDhEsj8pxVUzGJn5Z9bv3/
 JsjbrbkSGSdkF/HxKUK8xwP4pZPOVuMght9J4ogqmybnbTTxljJKApE1dH4tB8fQ/8BgUD2PT
 VYHZdHVxch5mEI=
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
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-wpcm450.c | 378 ++++++++++++++++++++++++++++++++++++++
 drivers/reset/Kconfig     |   2 +-
 3 files changed, 380 insertions(+), 1 deletion(-)
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
index 0000000000000..3b62b5961d5f0
=2D-- /dev/null
+++ b/drivers/clk/clk-wpcm450.c
@@ -0,0 +1,378 @@
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
+	struct clk_hw *hw;
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
+		hw =3D ERR_PTR(ret);
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
+	{ "pll0", "refclk", REG_PLLCON0, 0 },
+	{ "pll1", "refclk", REG_PLLCON1, 0 },
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
+static const char *const default_parents[] =3D { "pll0", "pll1", "refclk"=
 };
+static const char *const huart_parents[] =3D { "refclk", "refdiv2" };
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
+static const struct clk_div_table div_default[] =3D {
+	{ .val =3D 0, .div =3D 1, },
+	{ .val =3D 1, .div =3D 2, },
+	{ .val =3D 2, .div =3D 4, },
+	{ .val =3D 3, .div =3D 8, },
+	{ }
+};
+
+static const struct clk_div_table div_ahb[] =3D {
+	{ .val =3D 0, .div =3D 1, },
+	{ .val =3D 1, .div =3D 2, },
+	{ }
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
+	{ "refdiv2", "refclk", 0, div_fixed2, 0, 0 },
+};
+
+static const struct wpcm450_clkdiv_data clkdiv_data[] =3D {
+	{ "cpu", "cpusel", 0, div_fixed2, 0, 0, CLK_IS_CRITICAL },
+	{ "adcdiv", "refclk", CLK_DIVIDER_POWER_OF_TWO, NULL, 28, 2, 0 },
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

