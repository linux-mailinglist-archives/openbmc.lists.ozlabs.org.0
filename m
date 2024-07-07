Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87832929A12
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 00:40:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Y0YQeh3j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHMfT1lxLz3cl9
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 08:40:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Y0YQeh3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHMb61nPtz30Vg
	for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2024 08:37:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720391852; x=1720996652; i=j.neuschaefer@gmx.net;
	bh=dklvWoDTcs2ZcyzzLa5WGCFsugD5VSmp2zIVjmINOMo=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Y0YQeh3jHML8I6MYi8A6ZGNII5Z3hrLouDirv5oyqR24vAstrw7rgy/oLnJUpzX0
	 bv+Obu4drruuDh7gELd1SMZzxRm9+6kmqxjyDPKB4BlXFBXU9jd0CaDF8qJc+RHtI
	 g7GFGPx4aDGexcLRzhaMmMm9AMT6ullmUh618dN9UBstINl+BxYDVw3pbmHI5pIIf
	 bZ+xx1NzjDVdiPNr6EUVTgSVdwodOf8saj1eGjW9OyBWewfVq1ZOoJlbFdIjHK4h+
	 174AbMXU5E2hjATHYsKIMC9ButCNfZbIud3MbbUzoWFIKPVLpkhaQ2E73hcz1IJQh
	 Q8g2IvI9lB1cbxD4bg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5rO-1smddk0DwG-00NnN9; Mon, 08
 Jul 2024 00:37:32 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Mon, 08 Jul 2024 00:37:17 +0200
Subject: [PATCH RESEND v12 4/6] clk: wpcm450: Add Nuvoton WPCM450
 clock/reset controller driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240708-wpcm-clk-v12-4-1afac539c37d@gmx.net>
References: <20240708-wpcm-clk-v12-0-1afac539c37d@gmx.net>
In-Reply-To: <20240708-wpcm-clk-v12-0-1afac539c37d@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720391846; l=18702;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=CnpmnTxCPw0ZHYlAwXR+9/ZSlVlvc95MlZAI2y8gBo0=;
 b=QDI7YOLzGwTn1kqeqcs+gucFXQFzxGBWNYLVUCjAmaPm+Z8zmIuHrmG8mEJ7Z4cYrkLczz5mx
 6IuJdr7h513DfEgbeLRdj+cbyvVQaphiiEFuPktwWLWy4XuLnDU1c89
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:/UC9jBeZp3BMmUpmXdjcBBYYwnEnAOhtQKdlqPvc3W5XrhqO9aI
 uwFuOcQ9JvCmGWKjWfNJEf1I3dlrb6BlFMxWqvMD/qcgTM8Xp6yU0VXWdmZJqfilsFMWZQk
 LTSUmXllhiMHmYmgGBBvNl+Cd0ObTf3R6xbpLEK5t7waHqOQ3UmFbS95xqAewfxv358/ukJ
 /r/oE99+UopZKsnkrMfZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LT420Mq4WUQ=;sfMiFJch1oT7kU9jg0rcQLrRdK3
 j5xgnuLn2yLEPpWI6y5Zzca/g6gXGtp6I9DLH1G8xeP9Jrfe0w1THSkjheu0gTRriGxfGzH5r
 hAO3fgh/s64LF532T/EnBmwK38AvUfcNDd4fGm+IW+oAJ/pC24OdIsbUKTQF8b/Livm+fLEDS
 ljNovjW8n7Crze8DUXUTCIfRw16mhmSW45bXTj3Bl+slwcaVhIo/yB7fnZl370J+CM89QmdGh
 gd+Lv7hTEAGAhx7vb6/2EKIgZ+eq/v6sEWXFYWCHmpr93gJDlbm54fIle9qYZAkK5JuaR7W2b
 TbqJ2s9xlIvqgpMO0c+ALHUN4ky7uzmArbOVUL3B8l9T8P+0Tq1NHtXalXgBPE7LaDc3bqd6p
 vyjfBJiMXngmq38BfzzxJcx8Q9lgUrg3+YONj2NeP46YTmDB68EE7uUYntwS4Nf0PKMGsxygZ
 h+A0sTBtHVbRAZr3T3nbaRKuvTySUIAcDmBm+2yCoJ956AdPJ+4CzXCa0zJ52smTQ6PNEm1/i
 ud28eIWMipKfvONoyq0d6BpVwutOgeZBh87pi89GZcYjVMuq2BiXh2Im14krsqw9e4E7aknHB
 2nFKMOlTF3OIuiycc2K4tha2FDH0vRj05rBYHW0t9PwQYgZaW2Qq3U4dBMdTgqNHYC8n7fyHX
 wX5snwH7J0kO3Qrfsn3evv7JDraIMcJJSwatZl5ClVOMSWqXWhJerbPSiKkRfYmBqiSsa4BeP
 xPgYLuKwB6PpwAV5npnIwrR3ML2yE0itmTdrY5mI4wjdiPF1bk5ed5xnruGrFaR7U2XlMtAYm
 RScWTsDGrmgaoqlFUH5IVdm7WAC99MafF0m/SUQ7vDnAQ=
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

This driver implements the following features w.r.t. the clock and reset
controller in the WPCM450 SoC:

- It calculates the rates for all clocks managed by the clock controller
- It leaves the clock tree mostly unchanged, except that it enables/
  disables clock gates based on usage.
- It exposes the reset lines managed by the controller using the
  Generic Reset Controller subsystem
- A few clocks are marked as critical because they don't have consumers
  in the common clock framework:
  - CPU clock
  - timer clocks, because the timer-npcm7xx driver (in its current shape)
    can't depend on a platform driver (clk-wpcm450), but the timer clocks
    must not be disabled

NOTE: If the driver and the corresponding devicetree node are present,
      the driver will disable "unused" clocks. This is problem until
      the clock relations are properly declared in the devicetree (in a
      later patch). Until then, the clk_ignore_unused kernel parameter
      can be used as a workaround.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
=2D--

v12:
- Switch ref clock inputs to .fw_name =3D "ref"
- Use .hw to refer to internal clocks
- Remove unnecessary pr_fmt definition
- Convert to a platform driver, to avoid use of .name; use devm_ API
- Mark timer0/1 clocks as critical
- Update copyright year to 2024
- Split reset controller initialization into a separate function
- Change MODULE_LICENSE to "GPL" according to commit bf7fbeeae6db
  ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")

v11:
- no changes

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
 drivers/clk/nuvoton/clk-wpcm450.c | 455 +++++++++++++++++++++++++++++++++=
+++++
 4 files changed, 466 insertions(+), 2 deletions(-)

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
index 00000000000000..9a0f9c0bd8e6c8
=2D-- /dev/null
+++ b/drivers/clk/nuvoton/clk-wpcm450.c
@@ -0,0 +1,455 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton WPCM450 clock and reset controller driver.
+ *
+ * Copyright (C) 2024 Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
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
+wpcm450_clk_register_pll(struct device *dev, void __iomem *pllcon, const =
char *name,
+			 const struct clk_parent_data *parent, unsigned long flags)
+{
+	struct wpcm450_clk_pll *pll;
+	struct clk_init_data init =3D {};
+	int ret;
+
+	pll =3D devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
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
+	ret =3D devm_clk_hw_register(dev, &pll->hw);
+	if (ret) {
+		devm_kfree(dev, pll);
+		return ERR_PTR(ret);
+	}
+
+	return &pll->hw;
+}
+
+// Additional clock indexes for internal use.
+enum {
+	WPCM450_CLK_REF =3D -1,
+	WPCM450_CLK_REFDIV2 =3D WPCM450_NUM_CLKS,
+	WPCM450_CLK_PLL0,
+	WPCM450_CLK_PLL1,
+	WPCM450_CLK_CPUSEL,
+	WPCM450_CLK_CLKOUT,
+	WPCM450_CLK_UARTSEL,
+	WPCM450_CLK_HUARTSEL,
+	WPCM450_CLK_CPU,
+	WPCM450_CLK_ADCDIV,
+	WPCM450_CLK_APB,
+	WPCM450_CLK_AHB,
+	WPCM450_CLK_AHB3,
+	WPCM450_CLK_UART,
+	WPCM450_NUM_CLKS_TOTAL
+};
+
+static struct clk_parent_data index_to_parent_data(struct clk_hw **hws, i=
nt index)
+{
+	struct clk_parent_data parent_data =3D {};
+
+	if (index =3D=3D WPCM450_CLK_REF)
+		parent_data.fw_name =3D "ref";
+	else
+		parent_data.hw =3D hws[index];
+
+	return parent_data;
+}
+
+static size_t index_to_parent_data_array(struct clk_hw **hws,
+					 const int *indexes, size_t num_indexes,
+					 struct clk_parent_data *parent_data,
+					 size_t num_parent_data)
+{
+	size_t i;
+
+	for (i =3D 0; i < min(num_parent_data, num_indexes); i++)
+		parent_data[i] =3D index_to_parent_data(hws, indexes[i]);
+
+	return i;
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
+	int index;
+	int parent;
+	unsigned int reg;
+	unsigned long flags;
+};
+
+static const struct wpcm450_pll_data pll_data[] =3D {
+	{ "pll0", WPCM450_CLK_PLL0, WPCM450_CLK_REF, REG_PLLCON0, 0 },
+	{ "pll1", WPCM450_CLK_PLL1, WPCM450_CLK_REF, REG_PLLCON1, 0 },
+};
+
+struct wpcm450_clksel_data {
+	const char *name;
+	int index;
+	const int *parents;
+	unsigned int num_parents;
+	const u32 *table;
+	int shift;
+	int width;
+	unsigned long flags;
+};
+
+static const u32 parent_table[] =3D { 0, 1, 2 };
+
+static const int default_parents[] =3D {
+	WPCM450_CLK_PLL0,
+	WPCM450_CLK_PLL1,
+	WPCM450_CLK_REF,
+};
+
+static const int huart_parents[] =3D {
+	WPCM450_CLK_REF,
+	WPCM450_CLK_REFDIV2,
+};
+
+static const struct wpcm450_clksel_data clksel_data[] =3D {
+	{ "cpusel", WPCM450_CLK_CPUSEL, default_parents, ARRAY_SIZE(default_pare=
nts),
+		parent_table, 0, 2, CLK_IS_CRITICAL },
+	{ "clkout", WPCM450_CLK_CLKOUT, default_parents, ARRAY_SIZE(default_pare=
nts),
+		parent_table, 2, 2, 0 },
+	{ "usbphy", WPCM450_CLK_USBPHY, default_parents, ARRAY_SIZE(default_pare=
nts),
+		parent_table, 6, 2, 0 },
+	{ "uartsel", WPCM450_CLK_UARTSEL, default_parents, ARRAY_SIZE(default_pa=
rents),
+		parent_table, 8, 2, 0 },
+	{ "huartsel", WPCM450_CLK_HUARTSEL, huart_parents, ARRAY_SIZE(huart_pare=
nts),
+		parent_table, 10, 1, 0 },
+};
+
+static const struct clk_div_table div_fixed2[] =3D {
+	{ .val =3D 0, .div =3D 2 },
+	{ }
+};
+
+struct wpcm450_clkdiv_data {
+	const char *name;
+	int index;
+	int parent;
+	int div_flags;
+	const struct clk_div_table *table;
+	int shift;
+	int width;
+	unsigned long flags;
+};
+
+static struct wpcm450_clkdiv_data clkdiv_data_early[] =3D {
+	{ "ref/2", WPCM450_CLK_REFDIV2, WPCM450_CLK_REF, 0, div_fixed2, 0, 0 },
+};
+
+static const struct wpcm450_clkdiv_data clkdiv_data[] =3D {
+	{ "cpu", WPCM450_CLK_CPU, WPCM450_CLK_CPUSEL, 0, div_fixed2, 0, 0, CLK_I=
S_CRITICAL },
+	{ "adcdiv", WPCM450_CLK_ADCDIV, WPCM450_CLK_REF, CLK_DIVIDER_POWER_OF_TW=
O, NULL, 28, 2, 0 },
+	{ "ahb", WPCM450_CLK_AHB, WPCM450_CLK_CPU, CLK_DIVIDER_POWER_OF_TWO, NUL=
L, 24, 2, 0 },
+	{ "apb", WPCM450_CLK_APB, WPCM450_CLK_AHB, CLK_DIVIDER_POWER_OF_TWO, NUL=
L, 26, 2, 0 },
+	{ "uart", WPCM450_CLK_UART, WPCM450_CLK_UARTSEL, 0, NULL, 16, 4, 0 },
+	{ "ahb3", WPCM450_CLK_AHB3, WPCM450_CLK_AHB, CLK_DIVIDER_POWER_OF_TWO, N=
ULL, 8, 2, 0 },
+};
+
+struct wpcm450_clken_data {
+	const char *name;
+	int index;
+	int parent;
+	unsigned long flags;
+};
+
+static const struct wpcm450_clken_data clken_data[] =3D {
+	{ "fiu", WPCM450_CLK_FIU, WPCM450_CLK_AHB3, 0 },
+	{ "xbus", WPCM450_CLK_XBUS, WPCM450_CLK_AHB3, 0 },
+	{ "kcs", WPCM450_CLK_KCS, WPCM450_CLK_APB, 0 },
+	{ "shm", WPCM450_CLK_SHM, WPCM450_CLK_AHB3, 0 },
+	{ "usb1", WPCM450_CLK_USB1, WPCM450_CLK_AHB, 0 },
+	{ "emc0", WPCM450_CLK_EMC0, WPCM450_CLK_AHB, 0 },
+	{ "emc1", WPCM450_CLK_EMC1, WPCM450_CLK_AHB, 0 },
+	{ "usb0", WPCM450_CLK_USB0, WPCM450_CLK_AHB, 0 },
+	{ "peci", WPCM450_CLK_PECI, WPCM450_CLK_APB, 0 },
+	{ "aes", WPCM450_CLK_AES, WPCM450_CLK_APB, 0 },
+	{ "uart0", WPCM450_CLK_UART0, WPCM450_CLK_UART, 0 },
+	{ "uart1", WPCM450_CLK_UART1, WPCM450_CLK_UART, 0 },
+	{ "smb2", WPCM450_CLK_SMB2, WPCM450_CLK_APB, 0 },
+	{ "smb3", WPCM450_CLK_SMB3, WPCM450_CLK_APB, 0 },
+	{ "smb4", WPCM450_CLK_SMB4, WPCM450_CLK_APB, 0 },
+	{ "smb5", WPCM450_CLK_SMB5, WPCM450_CLK_APB, 0 },
+	{ "huart", WPCM450_CLK_HUART, WPCM450_CLK_HUARTSEL, 0 },
+	{ "pwm", WPCM450_CLK_PWM, WPCM450_CLK_APB, 0 },
+	{ "timer0", WPCM450_CLK_TIMER0, WPCM450_CLK_REFDIV2, CLK_IS_CRITICAL },
+	{ "timer1", WPCM450_CLK_TIMER1, WPCM450_CLK_REFDIV2, CLK_IS_CRITICAL },
+	{ "timer2", WPCM450_CLK_TIMER2, WPCM450_CLK_REFDIV2, 0 },
+	{ "timer3", WPCM450_CLK_TIMER3, WPCM450_CLK_REFDIV2, 0 },
+	{ "timer4", WPCM450_CLK_TIMER4, WPCM450_CLK_REFDIV2, 0 },
+	{ "mft0", WPCM450_CLK_MFT0, WPCM450_CLK_APB, 0 },
+	{ "mft1", WPCM450_CLK_MFT1, WPCM450_CLK_APB, 0 },
+	{ "wdt", WPCM450_CLK_WDT, WPCM450_CLK_REFDIV2, 0 },
+	{ "adc", WPCM450_CLK_ADC, WPCM450_CLK_ADCDIV, 0 },
+	{ "sdio", WPCM450_CLK_SDIO, WPCM450_CLK_AHB, 0 },
+	{ "sspi", WPCM450_CLK_SSPI, WPCM450_CLK_APB, 0 },
+	{ "smb0", WPCM450_CLK_SMB0, WPCM450_CLK_APB, 0 },
+	{ "smb1", WPCM450_CLK_SMB1, WPCM450_CLK_APB, 0 },
+};
+
+static DEFINE_SPINLOCK(wpcm450_clk_lock);
+
+static int wpcm450_reset_probe(struct platform_device *pdev, void __iomem=
 *clk_base)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D dev->of_node;
+	struct reset_simple_data *reset;
+
+	reset =3D devm_kzalloc(dev, sizeof(*reset), GFP_KERNEL);
+	if (!reset)
+		return -ENOMEM;
+
+	reset->rcdev.owner =3D THIS_MODULE;
+	reset->rcdev.nr_resets =3D WPCM450_NUM_RESETS;
+	reset->rcdev.ops =3D &reset_simple_ops;
+	reset->rcdev.of_node =3D np;
+	reset->membase =3D clk_base + REG_IPSRST;
+	return devm_reset_controller_register(dev, &reset->rcdev);
+}
+
+static int wpcm450_clk_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **hws;
+	struct clk_hw *hw;
+	void __iomem *clk_base;
+	int i, ret;
+
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np =3D dev->of_node;
+	resource_size_t map_size;
+
+	clk_base =3D devm_of_iomap(dev, np, 0, &map_size);
+	if (IS_ERR(clk_base)) {
+		dev_err(dev, "failed to map registers\n");
+		return PTR_ERR(clk_base);
+	}
+
+	clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, WPCM450_NUM_CL=
KS_TOTAL),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num =3D WPCM450_NUM_CLKS;
+	hws =3D clk_data->hws;
+
+	for (i =3D 0; i < WPCM450_NUM_CLKS_TOTAL; i++)
+		hws[i] =3D ERR_PTR(-ENOENT);
+
+	/* PLLs */
+	for (i =3D 0; i < ARRAY_SIZE(pll_data); i++) {
+		const struct wpcm450_pll_data *data =3D &pll_data[i];
+		struct clk_parent_data parent =3D index_to_parent_data(hws, data->paren=
t);
+
+		hw =3D wpcm450_clk_register_pll(dev, clk_base + data->reg, data->name,
+					      &parent, data->flags);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "Failed to register PLL: %pe\n", hw);
+			return PTR_ERR(hw);
+		}
+		clk_data->hws[data->index] =3D hw;
+	}
+
+	/* Early divisors (REF/2) */
+	for (i =3D 0; i < ARRAY_SIZE(clkdiv_data_early); i++) {
+		const struct wpcm450_clkdiv_data *data =3D &clkdiv_data_early[i];
+		struct clk_parent_data parent =3D index_to_parent_data(hws, data->paren=
t);
+
+		hw =3D devm_clk_hw_register_divider_table_parent_data(dev, data->name, =
&parent,
+								    data->flags,
+								    clk_base + REG_CLKDIV,
+								    data->shift, data->width,
+								    data->div_flags, data->table,
+								    &wpcm450_clk_lock);
+
+		if (IS_ERR(hw)) {
+			dev_err(dev, "Failed to register div table: %pe\n", hw);
+			return PTR_ERR(hw);
+		}
+		clk_data->hws[data->index] =3D hw;
+	}
+
+	/* Selects/muxes */
+	for (i =3D 0; i < ARRAY_SIZE(clksel_data); i++) {
+		const struct wpcm450_clksel_data *data =3D &clksel_data[i];
+		struct clk_parent_data parents[4];
+		size_t num_parents =3D index_to_parent_data_array(hws,
+				data->parents, data->num_parents, parents,
+				ARRAY_SIZE(parents));
+
+		hw =3D devm_clk_hw_register_mux_parent_data_table(dev, data->name, pare=
nts,
+								num_parents, data->flags,
+								clk_base + REG_CLKSEL, data->shift,
+								data->width, 0, NULL,
+								&wpcm450_clk_lock);
+
+		if (IS_ERR(hw)) {
+			dev_err(dev, "Failed to register mux: %pe\n", hw);
+			return PTR_ERR(hw);
+		}
+		clk_data->hws[data->index] =3D hw;
+	}
+
+	/* Divisors */
+	for (i =3D 0; i < ARRAY_SIZE(clkdiv_data); i++) {
+		const struct wpcm450_clkdiv_data *data =3D &clkdiv_data[i];
+		struct clk_parent_data parent =3D index_to_parent_data(hws, data->paren=
t);
+
+		hw =3D devm_clk_hw_register_divider_table_parent_data(dev, data->name, =
&parent,
+								    data->flags,
+								    clk_base + REG_CLKDIV,
+								    data->shift, data->width,
+								    data->div_flags, data->table,
+								    &wpcm450_clk_lock);
+
+		if (IS_ERR(hw)) {
+			dev_err(dev, "Failed to register divider: %pe\n", hw);
+			return PTR_ERR(hw);
+		}
+		clk_data->hws[data->index] =3D hw;
+	}
+
+	/* Enables/gates */
+	for (i =3D 0; i < ARRAY_SIZE(clken_data); i++) {
+		const struct wpcm450_clken_data *data =3D &clken_data[i];
+		struct clk_parent_data parent =3D index_to_parent_data(hws, data->paren=
t);
+
+		hw =3D devm_clk_hw_register_gate_parent_data(dev, data->name, &parent, =
data->flags,
+							   clk_base + REG_CLKEN, data->index,
+							   data->flags, &wpcm450_clk_lock);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "Failed to register gate: %pe\n", hw);
+			return PTR_ERR(hw);
+		}
+		clk_data->hws[data->index] =3D hw;
+	}
+
+	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data=
);
+	if (ret)
+		dev_err(dev, "Failed to add DT provider: %pe\n", ERR_PTR(ret));
+
+	ret =3D wpcm450_reset_probe(pdev, clk_base);
+	if (ret)
+		dev_err(dev, "Failed to register reset controller: %pe\n", ERR_PTR(ret)=
);
+
+	return 0;
+}
+
+static const struct of_device_id wpcm450_of_match[] =3D {
+	{ .compatible =3D "nuvoton,wpcm450-clk" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, wpcm450_of_match);
+
+static struct platform_driver wpcm450_clk_driver =3D {
+	.driver =3D {
+		.name =3D "wpcm450-clk",
+		.of_match_table =3D wpcm450_of_match,
+	},
+	.probe =3D wpcm450_clk_probe,
+};
+module_platform_driver(wpcm450_clk_driver);
+
+MODULE_AUTHOR("Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>");
+MODULE_DESCRIPTION("Nuvoton WPCM450 clock and reset controller driver");
+MODULE_LICENSE("GPL");

=2D-
2.43.0

