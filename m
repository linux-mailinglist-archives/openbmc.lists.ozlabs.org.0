Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8BF62E21E
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 17:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NClvj2LC0z3dvj
	for <lists+openbmc@lfdr.de>; Fri, 18 Nov 2022 03:37:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCltk4G3lz3c9y
	for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2022 03:37:02 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 2AHFxsps010963
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 17:59:54 +0200
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 17 Nov
 2022 17:59:53 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 17 Nov
 2022 23:59:51 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 17 Nov 2022 23:59:50 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 3811363A1B; Thu, 17 Nov 2022 17:59:50 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
Subject: [PATCH v13 1/1] clk: npcm8xx: add clock controller
Date: Thu, 17 Nov 2022 17:59:44 +0200
Message-ID: <20221117155944.32380-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221117155944.32380-1-tmaimon77@gmail.com>
References: <20221117155944.32380-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller which
generates and supplies clocks to all modules within the BMC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/clk/Kconfig       |   8 +
 drivers/clk/Makefile      |   1 +
 drivers/clk/clk-npcm8xx.c | 640 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 649 insertions(+)
 create mode 100644 drivers/clk/clk-npcm8xx.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index d79905f3e174..0a8aad45e2a7 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -326,6 +326,14 @@ config COMMON_CLK_LOCHNAGAR
 	  This driver supports the clocking features of the Cirrus Logic
 	  Lochnagar audio development board.
 
+config COMMON_CLK_NPCM8XX
+	tristate "Clock driver for the NPCM8XX SoC Family"
+	depends on ARCH_NPCM || COMPILE_TEST
+	help
+	  This driver supports the clocks on the Nuvoton BMC NPCM8XX SoC Family,
+	  all the clocks are initialized by the bootloader, so this driver
+	  allows only reading of current settings directly from the hardware.
+
 config COMMON_CLK_NXP
 	def_bool COMMON_CLK && (ARCH_LPC18XX || ARCH_LPC32XX)
 	select REGMAP_MMIO if ARCH_LPC32XX
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index e3ca0d058a25..cae295de5459 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_ARCH_MILBEAUT_M10V)	+= clk-milbeaut.o
 obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
 obj-$(CONFIG_ARCH_NOMADIK)		+= clk-nomadik.o
 obj-$(CONFIG_ARCH_NPCM7XX)	    	+= clk-npcm7xx.o
+obj-$(CONFIG_COMMON_CLK_NPCM8XX)	+= clk-npcm8xx.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= clk-nspire.o
 obj-$(CONFIG_COMMON_CLK_OXNAS)		+= clk-oxnas.o
 obj-$(CONFIG_COMMON_CLK_PALMAS)		+= clk-palmas.o
diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
new file mode 100644
index 000000000000..ff54cf65e8f7
--- /dev/null
+++ b/drivers/clk/clk-npcm8xx.c
@@ -0,0 +1,640 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NPCM8xx Clock Generator
+ * All the clocks are initialized by the bootloader, so this driver allow only
+ * reading of current settings directly from the hardware.
+ *
+ * Copyright (C) 2020 Nuvoton Technologies
+ * Author: Tomer Maimon <tomer.maimon@nuvoton.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/clock/nuvoton,npcm845-clk.h>
+
+#define NPCM8XX_REF_CLK		25000000
+
+struct npcm8xx_clk_pll_data {
+	unsigned int	id;
+	const char	*name;
+	u32		reg;
+	unsigned long	flags;
+};
+
+struct npcm8xx_clk_pll {
+	struct clk_hw hw;
+	void __iomem *pllcon;
+	struct npcm8xx_clk_pll_data pll;
+	struct clk_init_data init;
+};
+
+#define to_npcm8xx_clk_pll(_hw) container_of(_hw, struct npcm8xx_clk_pll, hw)
+
+#define PLLCON_LOKI	BIT(31)
+#define PLLCON_LOKS	BIT(30)
+#define PLLCON_FBDV	GENMASK(27, 16)
+#define PLLCON_OTDV2	GENMASK(15, 13)
+#define PLLCON_PWDEN	BIT(12)
+#define PLLCON_OTDV1	GENMASK(10, 8)
+#define PLLCON_INDV	GENMASK(5, 0)
+
+static unsigned long npcm8xx_clk_pll_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct npcm8xx_clk_pll *pll = to_npcm8xx_clk_pll(hw);
+	unsigned long fbdv, indv, otdv1, otdv2;
+	unsigned int val;
+	u64 ret;
+
+	if (parent_rate == 0) {
+		pr_debug("%s: parent rate is zero\n", __func__);
+		return 0;
+	}
+
+	val = readl_relaxed(pll->pllcon + pll->pll.reg);
+
+	indv = FIELD_GET(PLLCON_INDV, val);
+	fbdv = FIELD_GET(PLLCON_FBDV, val);
+	otdv1 = FIELD_GET(PLLCON_OTDV1, val);
+	otdv2 = FIELD_GET(PLLCON_OTDV2, val);
+
+	ret = (u64)parent_rate * fbdv;
+	do_div(ret, indv * otdv1 * otdv2);
+
+	return ret;
+}
+
+static const struct clk_ops npcm8xx_clk_pll_ops = {
+	.recalc_rate = npcm8xx_clk_pll_recalc_rate,
+};
+
+static struct clk_hw *
+npcm8xx_clk_register_pll(struct device *dev, struct npcm8xx_clk_pll *pll,
+			 void __iomem *sys_base)
+{
+	struct clk_hw *hw;
+	int ret;
+
+	pll->pllcon = sys_base;
+	hw = &pll->hw;
+
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw;
+}
+
+#define NPCM8XX_CLKEN1          (0x00)
+#define NPCM8XX_CLKEN2          (0x28)
+#define NPCM8XX_CLKEN3          (0x30)
+#define NPCM8XX_CLKEN4          (0x70)
+#define NPCM8XX_CLKSEL          (0x04)
+#define NPCM8XX_CLKDIV1         (0x08)
+#define NPCM8XX_CLKDIV2         (0x2C)
+#define NPCM8XX_CLKDIV3         (0x58)
+#define NPCM8XX_CLKDIV4         (0x7C)
+#define NPCM8XX_PLLCON0         (0x0C)
+#define NPCM8XX_PLLCON1         (0x10)
+#define NPCM8XX_PLLCON2         (0x54)
+#define NPCM8XX_SWRSTR          (0x14)
+#define NPCM8XX_IRQWAKECON      (0x18)
+#define NPCM8XX_IRQWAKEFLAG     (0x1C)
+#define NPCM8XX_IPSRST1         (0x20)
+#define NPCM8XX_IPSRST2         (0x24)
+#define NPCM8XX_IPSRST3         (0x34)
+#define NPCM8XX_WD0RCR          (0x38)
+#define NPCM8XX_WD1RCR          (0x3C)
+#define NPCM8XX_WD2RCR          (0x40)
+#define NPCM8XX_SWRSTC1         (0x44)
+#define NPCM8XX_SWRSTC2         (0x48)
+#define NPCM8XX_SWRSTC3         (0x4C)
+#define NPCM8XX_SWRSTC4         (0x50)
+#define NPCM8XX_CORSTC          (0x5C)
+#define NPCM8XX_PLLCONG         (0x60)
+#define NPCM8XX_AHBCKFI         (0x64)
+#define NPCM8XX_SECCNT          (0x68)
+#define NPCM8XX_CNTR25M         (0x6C)
+#define NPCM8XX_THRTL_CNT       (0xC0)
+
+struct npcm8xx_clk_mux_data {
+	u8 shift;
+	u32 mask;
+	const u32 *table;
+	const char *name;
+	const struct clk_parent_data *parent_data;
+	u8 num_parents;
+	unsigned long flags;
+	/*
+	 * If this clock is exported via DT, set onecell_idx to constant
+	 * defined in include/dt-bindings/clock/nuvoton, NPCM8XX-clock.h for
+	 * this specific clock.  Otherwise, set to -1.
+	 */
+	int onecell_idx;
+};
+
+struct npcm8xx_clk_div_data {
+	u32 reg;
+	u8 shift;
+	u8 width;
+	const char *name;
+	const struct clk_parent_data *parent_data;
+	u8 clk_divider_flags;
+	unsigned long flags;
+	/*
+	 * If this clock is exported via DT, set onecell_idx to constant
+	 * defined in include/dt-bindings/clock/nuvoton, NPCM8XX-clock.h for
+	 * this specific clock.  Otherwise, set to -1.
+	 */
+	int onecell_idx;
+};
+
+/*
+ * Single copy of strings used to refer to clocks within this driver indexed by
+ * above enum.
+ */
+#define NPCM8XX_CLK_S_REFCLK      "refclk"
+#define NPCM8XX_CLK_S_SYSBYPCK    "sysbypck"
+#define NPCM8XX_CLK_S_MCBYPCK     "mcbypck"
+#define NPCM8XX_CLK_S_PLL0        "pll0"
+#define NPCM8XX_CLK_S_PLL1        "pll1"
+#define NPCM8XX_CLK_S_PLL1_DIV2   "pll1_div2"
+#define NPCM8XX_CLK_S_PLL2        "pll2"
+#define NPCM8XX_CLK_S_PLL_GFX     "pll_gfx"
+#define NPCM8XX_CLK_S_PLL2_DIV2   "pll2_div2"
+#define NPCM8XX_CLK_S_PIX_MUX     "gfx_pixel"
+#define NPCM8XX_CLK_S_MC_MUX      "mc_phy"
+#define NPCM8XX_CLK_S_CPU_MUX     "cpu"  /* AKA system clock */
+#define NPCM8XX_CLK_S_MC          "mc"
+#define NPCM8XX_CLK_S_AXI         "axi"  /* AKA CLK2 */
+#define NPCM8XX_CLK_S_AHB         "ahb"  /* AKA CLK4 */
+#define NPCM8XX_CLK_S_CLKOUT_MUX  "clkout_mux"
+#define NPCM8XX_CLK_S_UART_MUX    "uart_mux"
+#define NPCM8XX_CLK_S_SD_MUX      "sd_mux"
+#define NPCM8XX_CLK_S_GFXM_MUX    "gfxm_mux"
+#define NPCM8XX_CLK_S_SU_MUX      "serial_usb_mux"
+#define NPCM8XX_CLK_S_DVC_MUX     "dvc_mux"
+#define NPCM8XX_CLK_S_GFX_MUX     "gfx_mux"
+#define NPCM8XX_CLK_S_ADC_MUX     "adc_mux"
+#define NPCM8XX_CLK_S_SPI0        "spi0"
+#define NPCM8XX_CLK_S_SPI1        "spi1"
+#define NPCM8XX_CLK_S_SPI3        "spi3"
+#define NPCM8XX_CLK_S_SPIX        "spix"
+#define NPCM8XX_CLK_S_APB1        "apb1"
+#define NPCM8XX_CLK_S_APB2        "apb2"
+#define NPCM8XX_CLK_S_APB3        "apb3"
+#define NPCM8XX_CLK_S_APB4        "apb4"
+#define NPCM8XX_CLK_S_APB5        "apb5"
+#define NPCM8XX_CLK_S_APB19       "apb19"
+#define NPCM8XX_CLK_S_TOCK        "tock"
+#define NPCM8XX_CLK_S_CLKOUT      "clkout"
+#define NPCM8XX_CLK_S_PRE_ADC     "pre adc"
+#define NPCM8XX_CLK_S_UART        "uart"
+#define NPCM8XX_CLK_S_UART2       "uart2"
+#define NPCM8XX_CLK_S_TIMER       "timer"
+#define NPCM8XX_CLK_S_MMC         "mmc"
+#define NPCM8XX_CLK_S_SDHC        "sdhc"
+#define NPCM8XX_CLK_S_ADC         "adc"
+#define NPCM8XX_CLK_S_GFX         "gfx0_gfx1_mem"
+#define NPCM8XX_CLK_S_USBIF       "serial_usbif"
+#define NPCM8XX_CLK_S_USB_HOST    "usb_host"
+#define NPCM8XX_CLK_S_USB_BRIDGE  "usb_bridge"
+#define NPCM8XX_CLK_S_PCI         "pci"
+#define NPCM8XX_CLK_S_TH          "th"
+#define NPCM8XX_CLK_S_ATB         "atb"
+#define NPCM8XX_CLK_S_PRE_CLK     "pre_clk"
+
+#define NPCM8XX_CLK_S_RG_MUX	  "rg_mux"
+#define NPCM8XX_CLK_S_RCP_MUX	  "rcp_mux"
+#define NPCM8XX_CLK_S_RG	  "rg"
+#define NPCM8XX_CLK_S_RCP	  "rcp"
+
+static const u32 pll_mux_table[] = { 0, 1, 2, 3 };
+static const struct clk_parent_data pll_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_PLL0 },
+	{ .name = NPCM8XX_CLK_S_PLL1 },
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .name = NPCM8XX_CLK_S_PLL2_DIV2 }
+};
+
+static const u32 cpuck_mux_table[] = { 0, 1, 2, 3, 7 };
+static const struct clk_parent_data cpuck_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_PLL0 },
+	{ .name = NPCM8XX_CLK_S_PLL1 },
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .name = NPCM8XX_CLK_S_SYSBYPCK },
+	{ .name = NPCM8XX_CLK_S_PLL2 }
+};
+
+static const u32 pixcksel_mux_table[] = { 0, 2 };
+static const struct clk_parent_data pixcksel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_PLL_GFX },
+	{ .name = NPCM8XX_CLK_S_REFCLK }
+};
+
+static const u32 sucksel_mux_table[] = { 2, 3 };
+static const struct clk_parent_data sucksel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .name = NPCM8XX_CLK_S_PLL2_DIV2 }
+};
+
+static const u32 mccksel_mux_table[] = { 0, 2, 3 };
+static const struct clk_parent_data mccksel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_PLL1_DIV2 },
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .name = NPCM8XX_CLK_S_MCBYPCK }
+};
+
+static const u32 clkoutsel_mux_table[] = { 0, 1, 2, 3, 4 };
+static const struct clk_parent_data clkoutsel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_PLL0 },
+	{ .name = NPCM8XX_CLK_S_PLL1 },
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .name = NPCM8XX_CLK_S_PLL_GFX },
+	{ .name = NPCM8XX_CLK_S_PLL2_DIV2 }
+};
+
+static const u32 gfxmsel_mux_table[] = { 2, 3 };
+static const struct clk_parent_data gfxmsel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .name = NPCM8XX_CLK_S_PLL2_DIV2 }
+};
+
+static const u32 dvcssel_mux_table[] = { 2, 3 };
+static const struct clk_parent_data dvcssel_mux_parents[] = {
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+	{ .name = NPCM8XX_CLK_S_PLL2 }
+};
+
+static struct clk_parent_data pre_adc_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_PRE_ADC }
+};
+
+static struct clk_parent_data pre_clk_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_PRE_CLK }
+};
+
+static struct clk_parent_data mux_adc_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_ADC_MUX }
+};
+
+static struct clk_parent_data mux_uart_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_UART_MUX }
+};
+
+static struct clk_parent_data mux_sd_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_SD_MUX }
+};
+
+static struct clk_parent_data ahb_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_AHB }
+};
+
+static struct clk_parent_data mux_gfx_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_GFX_MUX }
+};
+
+static struct clk_parent_data mux_clkout_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_CLKOUT_MUX }
+};
+
+static struct clk_parent_data mux_su_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_SU_MUX }
+};
+
+static struct clk_parent_data mux_rg_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_RG_MUX }
+};
+
+static struct clk_parent_data mux_rcp_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_RCP_MUX }
+};
+
+static struct clk_parent_data mux_cpu_div_parent[] = {
+	{ .name = NPCM8XX_CLK_S_CPU_MUX }
+};
+
+#define CLK_PLL(_reg, _name, _parent, _flags, _id) {			\
+		.pll.id = _id,						\
+		.pll.name = _name,					\
+		.pll.reg = _reg,					\
+		.hw.init = CLK_HW_INIT_PARENTS_DATA(_name, _parent,	\
+						    &npcm8xx_clk_pll_ops,	\
+						    _flags),		\
+	}
+
+static struct clk_parent_data npcm8xx_pll_parent[] = {
+	{ .name = NPCM8XX_CLK_S_REFCLK },
+};
+
+static struct npcm8xx_clk_pll npcm8xx_pll_clks[] = {
+	CLK_PLL(NPCM8XX_PLLCON0, NPCM8XX_CLK_S_PLL0, npcm8xx_pll_parent, 0, -1),
+	CLK_PLL(NPCM8XX_PLLCON1, NPCM8XX_CLK_S_PLL1, npcm8xx_pll_parent, 0, -1),
+	CLK_PLL(NPCM8XX_PLLCON2, NPCM8XX_CLK_S_PLL2, npcm8xx_pll_parent, 0, -1),
+	CLK_PLL(NPCM8XX_PLLCONG, NPCM8XX_CLK_S_PLL_GFX, npcm8xx_pll_parent, 0, -1),
+};
+
+static const struct npcm8xx_clk_mux_data npcm8xx_muxes[] = {
+	{ 0, 3, cpuck_mux_table, NPCM8XX_CLK_S_CPU_MUX,
+	cpuck_mux_parents, ARRAY_SIZE(cpuck_mux_parents), CLK_IS_CRITICAL,
+	NPCM8XX_CLK_CPU },
+
+	{ 4, 2, pixcksel_mux_table, NPCM8XX_CLK_S_PIX_MUX,
+	pixcksel_mux_parents, ARRAY_SIZE(pixcksel_mux_parents), 0,
+	NPCM8XX_CLK_GFX_PIXEL },
+
+	{ 6, 2, pll_mux_table, NPCM8XX_CLK_S_SD_MUX,
+	pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1 },
+
+	{ 8, 2, pll_mux_table, NPCM8XX_CLK_S_UART_MUX,
+	pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1 },
+
+	{ 10, 2, sucksel_mux_table, NPCM8XX_CLK_S_SU_MUX,
+	sucksel_mux_parents, ARRAY_SIZE(sucksel_mux_parents), 0, -1 },
+
+	{ 12, 2, mccksel_mux_table, NPCM8XX_CLK_S_MC_MUX,
+	mccksel_mux_parents, ARRAY_SIZE(mccksel_mux_parents), 0, -1 },
+
+	{ 14, 2, pll_mux_table, NPCM8XX_CLK_S_ADC_MUX,
+	pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1 },
+
+	{ 16, 2, pll_mux_table, NPCM8XX_CLK_S_GFX_MUX,
+	pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1 },
+
+	{ 18, 3, clkoutsel_mux_table, NPCM8XX_CLK_S_CLKOUT_MUX,
+	clkoutsel_mux_parents, ARRAY_SIZE(clkoutsel_mux_parents), 0, -1 },
+
+	{ 21, 2, gfxmsel_mux_table, NPCM8XX_CLK_S_GFXM_MUX,
+	gfxmsel_mux_parents, ARRAY_SIZE(gfxmsel_mux_parents), 0, -1 },
+
+	{ 23, 2, dvcssel_mux_table, NPCM8XX_CLK_S_DVC_MUX,
+	dvcssel_mux_parents, ARRAY_SIZE(dvcssel_mux_parents), 0, -1 },
+
+	{ 25, 2, pll_mux_table, NPCM8XX_CLK_S_RG_MUX,
+	pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1 },
+
+	{ 27, 2, pll_mux_table, NPCM8XX_CLK_S_RCP_MUX,
+	pll_mux_parents, ARRAY_SIZE(pll_mux_parents), 0, -1 },
+};
+
+/* configurable dividers: */
+static const struct npcm8xx_clk_div_data npcm8xx_divs[] = {
+	{ NPCM8XX_CLKDIV1, 28, 3, NPCM8XX_CLK_S_ADC, pre_adc_div_parent,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM8XX_CLK_ADC },
+	/* bit 30-28 ADCCKDIV*/
+	{ NPCM8XX_CLKDIV1, 26, 2, NPCM8XX_CLK_S_AHB, pre_clk_div_parent,
+		CLK_DIVIDER_READ_ONLY, CLK_IS_CRITICAL, NPCM8XX_CLK_AHB },
+	/* bit 28-26 CLK4DIV*/
+	{ NPCM8XX_CLKDIV1, 21, 5, NPCM8XX_CLK_S_PRE_ADC,
+	mux_adc_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_PRE_ADC },
+	/* bit 25-21 PRE-ADCCKDIV*/
+	{ NPCM8XX_CLKDIV1, 16, 5, NPCM8XX_CLK_S_UART,
+	mux_uart_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_UART },
+	/* bit 20-16 UARTDIV*/
+	{ NPCM8XX_CLKDIV1, 11, 5, NPCM8XX_CLK_S_MMC,
+	mux_sd_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_MMC },
+	/* bit 15-11 MMCCKDIV*/
+	{ NPCM8XX_CLKDIV1, 6, 5, NPCM8XX_CLK_S_SPI3,
+	ahb_div_parent, 0, 0, NPCM8XX_CLK_SPI3 },
+	/* bit 10-6 AHB3CKDIV*/
+	{ NPCM8XX_CLKDIV1, 2, 4, NPCM8XX_CLK_S_PCI,
+	mux_gfx_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_PCI },
+	/* bit 5-2 PCICKDIV*/
+
+	{ NPCM8XX_CLKDIV2, 30, 2, NPCM8XX_CLK_S_APB4, ahb_div_parent,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM8XX_CLK_APB4 },
+	/* bit 31-30 APB4CKDIV*/
+	{ NPCM8XX_CLKDIV2, 28, 2, NPCM8XX_CLK_S_APB3, ahb_div_parent,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM8XX_CLK_APB3 },
+	/* bit 29-28 APB3CKDIV*/
+	{ NPCM8XX_CLKDIV2, 26, 2, NPCM8XX_CLK_S_APB2, ahb_div_parent,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM8XX_CLK_APB2 },
+	/* bit 28-26 APB2CKDIV*/
+	{ NPCM8XX_CLKDIV2, 24, 2, NPCM8XX_CLK_S_APB1, ahb_div_parent,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM8XX_CLK_APB1 },
+	/* bit 25-24 APB1CKDIV*/
+	{ NPCM8XX_CLKDIV2, 22, 2, NPCM8XX_CLK_S_APB5, ahb_div_parent,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM8XX_CLK_APB5 },
+	/* bit 23-22 APB5CKDIV*/
+	{ NPCM8XX_CLKDIV2, 16, 5, NPCM8XX_CLK_S_CLKOUT, mux_clkout_div_parent,
+		 CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_CLKOUT },
+	/* bit 20-16 CLKOUTDIV*/
+	{ NPCM8XX_CLKDIV2, 13, 3, NPCM8XX_CLK_S_GFX, mux_gfx_div_parent,
+		CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_GFX },
+	/* bit 15-13 GFXCKDIV*/
+	{ NPCM8XX_CLKDIV2, 8, 5, NPCM8XX_CLK_S_USB_BRIDGE, mux_su_div_parent,
+		CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU },
+	/* bit 12-8 SUCKDIV*/
+	{ NPCM8XX_CLKDIV2, 4, 4, NPCM8XX_CLK_S_USB_HOST, mux_su_div_parent,
+		CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU48 },
+	/* bit 8-4 SU48CKDIV*/
+	{ NPCM8XX_CLKDIV2, 0, 4, NPCM8XX_CLK_S_SDHC,
+	mux_sd_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SDHC }
+	,/* bit 3-0 SD1CKDIV*/
+
+	{ NPCM8XX_CLKDIV3, 16, 8, NPCM8XX_CLK_S_SPI1,
+	ahb_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI1 },
+	/* bit 23-16 SPI1CKDV*/
+	{ NPCM8XX_CLKDIV3, 11, 5, NPCM8XX_CLK_S_UART2,
+	mux_uart_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_UART2 },
+	/* bit 15-11 UARTDIV2*/
+	{ NPCM8XX_CLKDIV3, 6, 5, NPCM8XX_CLK_S_SPI0,
+	ahb_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI0 },
+	/* bit 10-6 SPI0CKDV*/
+	{ NPCM8XX_CLKDIV3, 1, 5, NPCM8XX_CLK_S_SPIX,
+	ahb_div_parent, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPIX },
+	/* bit 5-1 SPIXCKDV*/
+
+	{ NPCM8XX_CLKDIV4, 28, 4, NPCM8XX_CLK_S_RG, mux_rg_div_parent,
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RG },
+	/* bit 31-28 RGREFDIV*/
+	{ NPCM8XX_CLKDIV4, 12, 4, NPCM8XX_CLK_S_RCP, mux_rcp_div_parent,
+	CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RCP },
+	/* bit 15-12 RCPREFDIV*/
+	{ NPCM8XX_THRTL_CNT, 0, 2, NPCM8XX_CLK_S_TH, mux_cpu_div_parent,
+	CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_TH },
+	/* bit 1-0 TH_DIV*/
+};
+
+static DEFINE_SPINLOCK(npcm8xx_clk_lock);
+
+static int npcm8xx_clk_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *npcm8xx_clk_data;
+	struct device *dev = &pdev->dev;
+	void __iomem *clk_base;
+	struct resource *res;
+	struct clk_hw *hw;
+	unsigned int i;
+	int err;
+
+	npcm8xx_clk_data = devm_kzalloc(dev, struct_size(npcm8xx_clk_data, hws,
+							 NPCM8XX_NUM_CLOCKS),
+					GFP_KERNEL);
+	if (!npcm8xx_clk_data)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	clk_base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!clk_base) {
+		dev_err(&pdev->dev, "Failed to remap I/O memory\n");
+		return -ENOMEM;
+	}
+
+	npcm8xx_clk_data->num = NPCM8XX_NUM_CLOCKS;
+
+	for (i = 0; i < NPCM8XX_NUM_CLOCKS; i++)
+		npcm8xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
+
+	/* Reference 25MHz clock */
+	hw = devm_clk_hw_register_fixed_rate(dev, "refclk", NULL, 0,
+					     NPCM8XX_REF_CLK);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	npcm8xx_clk_data->hws[NPCM8XX_CLK_REFCLK] = hw;
+
+	/* Register plls */
+	for (i = 0; i < ARRAY_SIZE(npcm8xx_pll_clks); i++) {
+		struct npcm8xx_clk_pll *pll_clk = &npcm8xx_pll_clks[i];
+
+		hw = npcm8xx_clk_register_pll(dev, pll_clk, clk_base);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "npcm8xx_clk: Can't register pll\n");
+			goto unregister_refclk;
+		}
+	}
+
+	/* Register fixed dividers */
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL1_DIV2,
+					       NPCM8XX_CLK_S_PLL1, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register fixed div\n");
+		goto unregister_refclk;
+	}
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL2_DIV2,
+					       NPCM8XX_CLK_S_PLL2, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register pll div2\n");
+		goto unregister_refclk;
+	}
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PRE_CLK,
+					       NPCM8XX_CLK_S_CPU_MUX, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register ckclk div2\n");
+		goto unregister_refclk;
+	}
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_AXI,
+					       NPCM8XX_CLK_S_TH, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register axi div2\n");
+		goto unregister_refclk;
+	}
+
+	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_ATB,
+					       NPCM8XX_CLK_S_AXI, 0, 1, 2);
+	if (IS_ERR(hw)) {
+		dev_err(dev, "npcm8xx_clk: Can't register atb div2\n");
+		goto unregister_refclk;
+	}
+
+	/* Register muxes */
+	for (i = 0; i < ARRAY_SIZE(npcm8xx_muxes); i++) {
+		const struct npcm8xx_clk_mux_data *mux_data = &npcm8xx_muxes[i];
+
+		hw = devm_clk_hw_register_mux_parent_data_table(dev,
+								mux_data->name,
+								mux_data->parent_data,
+								mux_data->num_parents,
+								mux_data->flags,
+								clk_base + NPCM8XX_CLKSEL,
+								mux_data->shift,
+								mux_data->mask,
+								0,
+								mux_data->table,
+								&npcm8xx_clk_lock);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "npcm8xx_clk: Can't register mux\n");
+			goto err_mux_clk;
+		}
+
+		if (mux_data->onecell_idx >= 0)
+			npcm8xx_clk_data->hws[mux_data->onecell_idx] = hw;
+	}
+
+	/* Register clock dividers specified in npcm8xx_divs */
+	for (i = 0; i < ARRAY_SIZE(npcm8xx_divs); i++) {
+		const struct npcm8xx_clk_div_data *div_data = &npcm8xx_divs[i];
+
+		hw = clk_hw_register_divider_parent_data(dev, div_data->name,
+							 div_data->parent_data,
+							 div_data->flags,
+							 clk_base + div_data->reg,
+							 div_data->shift,
+							 div_data->width,
+							 div_data->clk_divider_flags,
+							 &npcm8xx_clk_lock);
+		if (IS_ERR(hw)) {
+			dev_err(dev, "npcm8xx_clk: Can't register div table\n");
+			goto unregister_refclk;
+		}
+
+		if (div_data->onecell_idx >= 0)
+			npcm8xx_clk_data->hws[div_data->onecell_idx] = hw;
+	}
+
+	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					  npcm8xx_clk_data);
+	if (err) {
+		dev_err(dev, "unable to add clk provider\n");
+		hw = ERR_PTR(err);
+		goto err_mux_clk;
+	}
+
+	return err;
+
+err_mux_clk:
+	while (i--) {
+		if (npcm8xx_muxes[i].onecell_idx >= 0)
+			clk_hw_unregister_mux(npcm8xx_clk_data->hws[npcm8xx_muxes[i].onecell_idx]);
+	}
+unregister_refclk:
+	clk_hw_unregister(npcm8xx_clk_data->hws[NPCM8XX_CLK_REFCLK]);
+	return PTR_ERR(hw);
+}
+
+static const struct of_device_id npcm8xx_clk_dt_ids[] = {
+	{ .compatible = "nuvoton,npcm845-clk", },
+	{ }
+};
+
+static struct platform_driver npcm8xx_clk_driver = {
+	.probe  = npcm8xx_clk_probe,
+	.driver = {
+		.name = "npcm8xx_clk",
+		.of_match_table = npcm8xx_clk_dt_ids,
+	},
+};
+
+static int __init npcm8xx_clk_driver_init(void)
+{
+	return platform_driver_register(&npcm8xx_clk_driver);
+}
+arch_initcall(npcm8xx_clk_driver_init);
+
-- 
2.33.0

