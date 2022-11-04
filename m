Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24541619D25
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 17:25:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3mFf0B9Wz3cLf
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 03:25:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=C/qYWSoL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=C/qYWSoL;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3m6s387Gz3cJY
	for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2022 03:19:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667578750; bh=Wnd7nHwelk1HMxLZzx1cKFh3+OsW4pY50xstEg8UDmY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C/qYWSoL3bBlRR27V7bESWFCMKZTN7JdcdOq18SaMkdNZFMLvhOcQtGA29X5xvKtZ
	 JrBKHhHXzqQcVdwPKQHKtiIxjwDBh5rMz/yRYQFUW+c8MDFwkJQE9eDu2avsblPPoi
	 cHG0bY0jnuzjBrmpCoteOyvP+WKIGtAOXaO7Uxm5XdTDYP3+75JBbIvdwfLB/EVdUo
	 kkmH1Qk6tPu0WfM66892MjsLCC4hG0ccSSgA6/QWGDs/obFulsSr7KqvT1vZWTgKWn
	 2CMD32S9GCayykpQpAPcVnEOOesUK2E4PqfnqCZ+T8j37h0YlUMvXOoPrSvEBvDg0S
	 E1Ls+lS4f85Lg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mz9Yv-1pDRu91Mxv-00wDqg; Fri, 04
 Nov 2022 17:19:10 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v5 5/6] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
Date: Fri,  4 Nov 2022 17:18:49 +0100
Message-Id: <20221104161850.2889894-6-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/76Kmmk0ThmjT41TrN6EY1x/On2WFUpm8Lg4RAp+axxh+1aG2aJ
 pnbGat0YxoNl2/79hD19CpiSKfgsq7Kp9V/ytFwlFqHaKZz8R5f+u8YPRLUKo+95flpaAKv
 IykChka8ooiBaZuLHorCgyVVuSIBgRAkTvZ9KNyTZq0Gt+HWYIfKWdDGrWnlAd7DZtiju9U
 7KrZO8ob+kuHdXucGvZ8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vFl+7BzfaFY=;84Lx/oq9/zgO02KtCFIyM0uJdyO
 EXRMlkdzwTJlqFYzNFC5GGalo1PpmJan+usUt5Tu8Fvv0iz98lXGNKgtmVpN2cmSF6gqHfzfj
 kw8jZnRxqQY/s3CeHK8jM2jHQvUlsFAdFak+hoN9LPGDtOJp39pC9GQmqLHHxkj1o6gJbcR+W
 0TnsubgiQhtLrywMwrZnxCg4J7PoU5xsH4tmT1KPOCoixqwov7BSYuN8xz+0ERg8bpTy6NL9v
 pWIydGfkfuQU3XIWu8k9MHPlUhcx9lMQeO1aAqsDv1maWF7fRYEcrou6V3PFmyRqyWsjfV3qH
 ywUjEaTRP63iklKQQQTABpX55wO13AL/Ly9LYog/kPT3faEo62/nPZziL8IsPrip6jF0Usb3M
 8czWqHP/VNcUkUAmbRtA5ayWsEuUmWYuqougoxbmFFB4R805dBCeTbVR0E4ohgS4PtMIa3Omn
 U2mrmrjEol059kMGgU2QRK6pv63WBxvWwAbdHcy49RQBjkB17HpbdvPBwkncuzBe0L95q35y1
 YRjbevCzeW+WXksNC1OCAjrSSy3sdHUJSWd33jVqSToOS6X2bkKsAvA3NicBI+hYvhYJfHoH1
 8cuGtzbdHaQkgAaseJtH9PwFN4QBglrjo8SqfvLFboEgc+N+olrok0IRq+5uQu650xD/qF2oT
 LZAEbdHyxOV0IH/NUT2K/hVfx8a9L6BCq4di2h4cXO1ZPwXwSReQftMIf5SqAQ50OY41q62Rk
 DwChB4GvgWauhJn8mAhE6zwy1miitE9pTI6z6RzBlsOvteEtsObl8OrIZCaqS6VM75+grIeDH
 dur/73+RYlp7J16J7OOUOuKZPa25ma65xaT43O8+Dhc5nf3Im+Sq/T4c/Y4Xu+43/Yct4VA04
 ddH2Uw5ndN2ec948UsoO88iSXdssU9woZN/sXvAwBZt9d3u6CTY44XeJbboYmpAX8PQU27L24
 q/UcQgMSpe4IrFZJayaDD83ehVI=
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

v5:
- Switch to using clk_parent_data

v4:
- https://lore.kernel.org/lkml/20220610072141.347795-6-j.neuschaefer@gmx.n=
et/
- Fix reset controller initialization

v3:
- https://lore.kernel.org/lkml/20220508194333.2170161-7-j.neuschaefer@gmx.=
net/
- Change reference clock name from "refclk" to "ref"
- Remove unused variable in return path of wpcm450_clk_register_pll
- Remove unused divisor tables

v2:
- https://lore.kernel.org/lkml/20220429172030.398011-7-j.neuschaefer@gmx.n=
et/
- no changes
=2D--
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-wpcm450.c | 375 ++++++++++++++++++++++++++++++++++++++
 drivers/reset/Kconfig     |   2 +-
 3 files changed, 377 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/clk-wpcm450.c

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a256..b58352d4d615d 100644
=2D-- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+=3D clk-renesas-pcie.=
o
 obj-$(CONFIG_COMMON_CLK_VC5)		+=3D clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_VC7)		+=3D clk-versaclock7.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+=3D clk-wm831x.o
+obj-$(CONFIG_ARCH_WPCM450)		+=3D clk-wpcm450.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+=3D clk-xgene.o

 # please keep this section sorted lexicographically by directory path nam=
e
diff --git a/drivers/clk/clk-wpcm450.c b/drivers/clk/clk-wpcm450.c
new file mode 100644
index 0000000000000..b5e81b3b6b982
=2D-- /dev/null
+++ b/drivers/clk/clk-wpcm450.c
@@ -0,0 +1,375 @@
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
+	struct clk_parent_data parent;
+	unsigned int reg;
+	unsigned long flags;
+};
+
+static const struct wpcm450_pll_data pll_data[] =3D {
+	{ "pll0", { .name =3D "ref" }, REG_PLLCON0, 0 },
+	{ "pll1", { .name =3D "ref" }, REG_PLLCON1, 0 },
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
+	{ .name =3D "ref" },
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
+static void __init wpcm450_clk_init(struct device_node *clk_np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	static struct clk_hw **hws;
+	static struct clk_hw *hw;
+	void __iomem *clk_base;
+	int i, ret;
+	struct reset_simple_data *reset;
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
+					      &data->parent, data->flags);
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
+		hw =3D clk_hw_register_divider_table_parent_data(NULL, data->name, &dat=
a->parent,
+							       data->flags, clk_base + REG_CLKDIV,
+							       data->shift, data->width,
+							       data->div_flags, data->table,
+							       &wpcm450_clk_lock);
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
+		hw =3D clk_hw_register_mux_parent_data(NULL, data->name, data->parents,
+						     data->num_parents, data->flags,
+						     clk_base + REG_CLKSEL, data->shift,
+						     data->width, 0,
+						     &wpcm450_clk_lock);
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
+		hw =3D clk_hw_register_divider_table_parent_data(NULL, data->name, &dat=
a->parent,
+							       data->flags, clk_base + REG_CLKDIV,
+							       data->shift, data->width,
+							       data->div_flags, data->table,
+							       &wpcm450_clk_lock);
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
+		hw =3D clk_hw_register_gate_parent_data(NULL, data->name, &data->parent=
, data->flags,
+						      clk_base + REG_CLKEN, data->bitnum,
+						      data->flags, &wpcm450_clk_lock);
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
+	reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);
+	if (!reset)
+		goto err_free;
+	reset->rcdev.owner =3D THIS_MODULE;
+	reset->rcdev.nr_resets =3D WPCM450_NUM_RESETS;
+	reset->rcdev.ops =3D &reset_simple_ops;
+	reset->rcdev.of_node =3D clk_np;
+	reset->membase =3D clk_base + REG_IPSRST;
+	ret =3D reset_controller_register(&reset->rcdev);
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
index de176c2fbad96..de5662830fce8 100644
=2D-- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -208,7 +208,7 @@ config RESET_SCMI

 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST || EXPERT
-	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || AR=
CH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
+	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || AR=
CH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC || ARCH_NPC=
M
 	depends on HAS_IOMEM
 	help
 	  This enables a simple reset controller driver for reset lines that
=2D-
2.35.1

