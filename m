Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2275BB6A
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 02:03:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JjuT3oWf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6VBD04FKz3c1n
	for <lists+openbmc@lfdr.de>; Fri, 21 Jul 2023 10:03:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JjuT3oWf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6V9V1HlKz30CT
	for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2023 10:02:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3510461CB8;
	Fri, 21 Jul 2023 00:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C2AC433C9;
	Fri, 21 Jul 2023 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689897737;
	bh=bDQXCaFCIYRDQPR+Jh93yf7za4S33vw+7H6/V7RQn5s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JjuT3oWf5CElJto6nJgbfQFpEZzCh5fA5HVQSR4P31zuOBDALJ8Ep6rCso8Akqd49
	 HN2d8WjYOgrWqY4zGvF692tZOTWYVpq+yrNyi/aP5yoSY4411tofrmhRugvjnVGU4S
	 ElUiMx8v44e7OmEczYGMIKTThjcWimToSJmQ5vnl16Uqz0HhWnQuqI0o/n29Fj1i3R
	 E84QsOFeS/ZgAAcD0rmV+B7mNl9PLGaFvJs+VsIcXjf83FwRJGZBC/7XOOCO699HF5
	 lIhOMt1KveD65AK1JUvRgBBSUu9bckKOEXjWO0pnmM67ndt6Onir+edsH7qNMyPx30
	 WM19jjcHvOEaw==
Message-ID: <4e0a5db18ed7d37038e67be0f1ddcb08.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230428190226.1304326-3-j.neuschaefer@gmx.net>
References: <20230428190226.1304326-1-j.neuschaefer@gmx.net> <20230428190226.1304326-3-j.neuschaefer@gmx.net>
Subject: Re: [PATCH v8 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
From: Stephen Boyd <sboyd@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Thu, 20 Jul 2023 17:02:15 -0700
User-Agent: alot/0.10
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org, Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jonathan Neusch=C3=A4fer (2023-04-28 12:02:26)
> diff --git a/drivers/clk/clk-wpcm450.c b/drivers/clk/clk-wpcm450.c
> new file mode 100644
> index 0000000000000..358be5befa887
> --- /dev/null
> +++ b/drivers/clk/clk-wpcm450.c
> @@ -0,0 +1,374 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton WPCM450 clock and reset controller driver.
> + *
> + * Copyright (C) 2022 Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/reset-controller.h>
> +#include <linux/reset/reset-simple.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/clock/nuvoton,wpcm450-clk.h>
> +
> +struct wpcm450_clk_pll {
> +       struct clk_hw hw;
> +       void __iomem *pllcon;
> +       u8 flags;
> +};
> +
> +#define to_wpcm450_clk_pll(_hw) container_of(_hw, struct wpcm450_clk_pll=
, hw)
> +
> +#define PLLCON_FBDV    GENMASK(24, 16)
> +#define PLLCON_PRST    BIT(13)
> +#define PLLCON_PWDEN   BIT(12)
> +#define PLLCON_OTDV    GENMASK(10, 8)
> +#define PLLCON_INDV    GENMASK(5, 0)
> +
> +static unsigned long wpcm450_clk_pll_recalc_rate(struct clk_hw *hw,
> +                                                unsigned long parent_rat=
e)
> +{
> +       struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
> +       unsigned long fbdv, indv, otdv;
> +       u64 rate;
> +       u32 pllcon;
> +
> +       if (parent_rate =3D=3D 0) {
> +               pr_err("%s: parent rate is zero", __func__);

This can happen more often than you think, so probably best to remove
it.

> +               return 0;
> +       }
> +
> +       pllcon =3D readl_relaxed(pll->pllcon);
> +
> +       indv =3D FIELD_GET(PLLCON_INDV, pllcon) + 1;
> +       fbdv =3D FIELD_GET(PLLCON_FBDV, pllcon) + 1;
> +       otdv =3D FIELD_GET(PLLCON_OTDV, pllcon) + 1;
> +
> +       rate =3D (u64)parent_rate * fbdv;
> +       do_div(rate, indv * otdv);
> +
> +       return rate;
> +}
> +
> +static int wpcm450_clk_pll_is_enabled(struct clk_hw *hw)
> +{
> +       struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
> +       u32 pllcon;
> +
> +       pllcon =3D readl_relaxed(pll->pllcon);
> +
> +       return !(pllcon & PLLCON_PRST);
> +}
> +
> +static void wpcm450_clk_pll_disable(struct clk_hw *hw)
> +{
> +       struct wpcm450_clk_pll *pll =3D to_wpcm450_clk_pll(hw);
> +       u32 pllcon;
> +
> +       pllcon =3D readl_relaxed(pll->pllcon);
> +       pllcon |=3D PLLCON_PRST | PLLCON_PWDEN;
> +       writel(pllcon, pll->pllcon);
> +}
> +
> +static const struct clk_ops wpcm450_clk_pll_ops =3D {
> +       .recalc_rate =3D wpcm450_clk_pll_recalc_rate,
> +       .is_enabled =3D wpcm450_clk_pll_is_enabled,
> +       .disable =3D wpcm450_clk_pll_disable
> +};
> +
> +static struct clk_hw *
> +wpcm450_clk_register_pll(void __iomem *pllcon, const char *name,
> +                        const struct clk_parent_data *parent, unsigned l=
ong flags)
> +{
> +       struct wpcm450_clk_pll *pll;
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> +       if (!pll)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name =3D name;
> +       init.ops =3D &wpcm450_clk_pll_ops;
> +       init.parent_data =3D parent;
> +       init.num_parents =3D 1;
> +       init.flags =3D flags;
> +
> +       pll->pllcon =3D pllcon;
> +       pll->hw.init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &pll->hw);
> +       if (ret) {
> +               kfree(pll);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return &pll->hw;
> +}
> +
> +#define REG_CLKEN      0x00
> +#define REG_CLKSEL     0x04
> +#define REG_CLKDIV     0x08
> +#define REG_PLLCON0    0x0c
> +#define REG_PLLCON1    0x10
> +#define REG_PMCON      0x14
> +#define REG_IRQWAKECON 0x18
> +#define REG_IRQWAKEFLAG        0x1c
> +#define REG_IPSRST     0x20
> +
> +struct wpcm450_pll_data {
> +       const char *name;
> +       struct clk_parent_data parent;
> +       unsigned int reg;
> +       unsigned long flags;
> +};
> +
> +static const struct wpcm450_pll_data pll_data[] =3D {
> +       { "pll0", { .name =3D "ref" }, REG_PLLCON0, 0 },

This is new code, please don't use .name. Instead use .fw_name or .index wi=
th preference to
.index first and .hw if the pointer is available in this driver.

> +       { "pll1", { .name =3D "ref" }, REG_PLLCON1, 0 },
> +};
> +
> +struct wpcm450_clksel_data {
> +       const char *name;
> +       const struct clk_parent_data *parents;
> +       unsigned int num_parents;
> +       const u32 *table;
> +       int shift;
> +       int width;
> +       int index;
> +       unsigned long flags;
> +};
> +
> +static const u32 parent_table[] =3D { 0, 1, 2 };
> +
> +static const struct clk_parent_data default_parents[] =3D {
> +       { .name =3D "pll0" },
> +       { .name =3D "pll1" },
> +       { .name =3D "ref" },
> +};
> +
> +static const struct clk_parent_data huart_parents[] =3D {
> +       { .name =3D "ref" },
> +       { .name =3D "refdiv2" },
> +};
> +
> +static const struct wpcm450_clksel_data clksel_data[] =3D {
> +       { "cpusel", default_parents, ARRAY_SIZE(default_parents),
> +               parent_table, 0, 2, -1, CLK_IS_CRITICAL },
> +       { "clkout", default_parents, ARRAY_SIZE(default_parents),
> +               parent_table, 2, 2, -1, 0 },
> +       { "usbphy", default_parents, ARRAY_SIZE(default_parents),
> +               parent_table, 6, 2, -1, 0 },
> +       { "uartsel", default_parents, ARRAY_SIZE(default_parents),
> +               parent_table, 8, 2, WPCM450_CLK_USBPHY, 0 },
> +       { "huartsel", huart_parents, ARRAY_SIZE(huart_parents),
> +               parent_table, 10, 1, -1, 0 },
> +};
> +
> +static const struct clk_div_table div_fixed2[] =3D {
> +       { .val =3D 0, .div =3D 2 },
> +       { }
> +};
> +
> +struct wpcm450_clkdiv_data {
> +       const char *name;
> +       struct clk_parent_data parent;
> +       int div_flags;
> +       const struct clk_div_table *table;
> +       int shift;
> +       int width;
> +       unsigned long flags;
> +};
> +
> +static struct wpcm450_clkdiv_data clkdiv_data_early[] =3D {
> +       { "refdiv2", { .name =3D "ref" }, 0, div_fixed2, 0, 0 },
> +};
> +
> +static const struct wpcm450_clkdiv_data clkdiv_data[] =3D {
> +       { "cpu", { .name =3D "cpusel" }, 0, div_fixed2, 0, 0, CLK_IS_CRIT=
ICAL },
> +       { "adcdiv", { .name =3D "ref" }, CLK_DIVIDER_POWER_OF_TWO, NULL, =
28, 2, 0 },
> +       { "apb", { .name =3D "ahb" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 26,=
 2, 0 },
> +       { "ahb", { .name =3D "cpu" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 24,=
 2, 0 },
> +       { "uart", { .name =3D "uartsel" }, 0, NULL, 16, 4, 0 },
> +       { "ahb3", { .name =3D "ahb" }, CLK_DIVIDER_POWER_OF_TWO, NULL, 8,=
 2, 0 },
> +};
> +
> +struct wpcm450_clken_data {
> +       const char *name;
> +       struct clk_parent_data parent;
> +       int bitnum;
> +       unsigned long flags;
> +};
> +
> +static const struct wpcm450_clken_data clken_data[] =3D {
> +       { "fiu", { .name =3D "ahb3" }, WPCM450_CLK_FIU, 0 },
> +       { "xbus", { .name =3D "ahb3" }, WPCM450_CLK_XBUS, 0 },
> +       { "kcs", { .name =3D "apb" }, WPCM450_CLK_KCS, 0 },
> +       { "shm", { .name =3D "ahb3" }, WPCM450_CLK_SHM, 0 },
> +       { "usb1", { .name =3D "ahb" }, WPCM450_CLK_USB1, 0 },
> +       { "emc0", { .name =3D "ahb" }, WPCM450_CLK_EMC0, 0 },
> +       { "emc1", { .name =3D "ahb" }, WPCM450_CLK_EMC1, 0 },
> +       { "usb0", { .name =3D "ahb" }, WPCM450_CLK_USB0, 0 },
> +       { "peci", { .name =3D "apb" }, WPCM450_CLK_PECI, 0 },
> +       { "aes", { .name =3D "apb" }, WPCM450_CLK_AES, 0 },
> +       { "uart0", { .name =3D "uart" }, WPCM450_CLK_UART0, 0 },
> +       { "uart1", { .name =3D "uart" }, WPCM450_CLK_UART1, 0 },
> +       { "smb2", { .name =3D "apb" }, WPCM450_CLK_SMB2, 0 },
> +       { "smb3", { .name =3D "apb" }, WPCM450_CLK_SMB3, 0 },
> +       { "smb4", { .name =3D "apb" }, WPCM450_CLK_SMB4, 0 },
> +       { "smb5", { .name =3D "apb" }, WPCM450_CLK_SMB5, 0 },
> +       { "huart", { .name =3D "huartsel" }, WPCM450_CLK_HUART, 0 },
> +       { "pwm", { .name =3D "apb" }, WPCM450_CLK_PWM, 0 },
> +       { "timer0", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER0, 0 },
> +       { "timer1", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER1, 0 },
> +       { "timer2", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER2, 0 },
> +       { "timer3", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER3, 0 },
> +       { "timer4", { .name =3D "refdiv2" }, WPCM450_CLK_TIMER4, 0 },
> +       { "mft0", { .name =3D "apb" }, WPCM450_CLK_MFT0, 0 },
> +       { "mft1", { .name =3D "apb" }, WPCM450_CLK_MFT1, 0 },
> +       { "wdt", { .name =3D "refdiv2" }, WPCM450_CLK_WDT, 0 },
> +       { "adc", { .name =3D "adcdiv" }, WPCM450_CLK_ADC, 0 },
> +       { "sdio", { .name =3D "ahb" }, WPCM450_CLK_SDIO, 0 },
> +       { "sspi", { .name =3D "apb" }, WPCM450_CLK_SSPI, 0 },
> +       { "smb0", { .name =3D "apb" }, WPCM450_CLK_SMB0, 0 },
> +       { "smb1", { .name =3D "apb" }, WPCM450_CLK_SMB1, 0 },
> +};
> +
> +static DEFINE_SPINLOCK(wpcm450_clk_lock);
> +
> +/*
> + * NOTE: Error handling is very rudimentary here. If the clock driver in=
itial-
> + * ization fails, the system is probably in bigger trouble than what is =
caused
> + * by a few leaked resources.
> + */
> +
> +static void __init wpcm450_clk_init(struct device_node *clk_np)
> +{
> +       struct clk_hw_onecell_data *clk_data;
> +       static struct clk_hw **hws;
> +       static struct clk_hw *hw;
> +       void __iomem *clk_base;
> +       int i, ret;
> +       struct reset_simple_data *reset;
> +
> +       clk_base =3D of_iomap(clk_np, 0);
> +       if (!clk_base) {
> +               pr_err("%pOFP: failed to map registers\n", clk_np);
> +               of_node_put(clk_np);
> +               return;
> +       }
> +       of_node_put(clk_np);
> +
> +       clk_data =3D kzalloc(struct_size(clk_data, hws, WPCM450_NUM_CLKS)=
, GFP_KERNEL);
> +       if (!clk_data)
> +               return;
> +
> +       clk_data->num =3D WPCM450_NUM_CLKS;
> +       hws =3D clk_data->hws;
> +
> +       for (i =3D 0; i < WPCM450_NUM_CLKS; i++)
> +               hws[i] =3D ERR_PTR(-ENOENT);
> +
> +       // PLLs

Please use /* comments like this */

> +       for (i =3D 0; i < ARRAY_SIZE(pll_data); i++) {
> +               const struct wpcm450_pll_data *data =3D &pll_data[i];
> +
> +               hw =3D wpcm450_clk_register_pll(clk_base + data->reg, dat=
a->name,
> +                                             &data->parent, data->flags);
> +               if (IS_ERR(hw)) {
> +                       pr_info("Failed to register PLL: %pe", hw);

Missing newline?

> +                       return;
> +               }
> +       }
> +
> +       // Early divisors (REF/2)
> +       for (i =3D 0; i < ARRAY_SIZE(clkdiv_data_early); i++) {
> +               const struct wpcm450_clkdiv_data *data =3D &clkdiv_data_e=
arly[i];
> +
> +               hw =3D clk_hw_register_divider_table_parent_data(NULL, da=
ta->name, &data->parent,
> +                                                              data->flag=
s, clk_base + REG_CLKDIV,
> +                                                              data->shif=
t, data->width,
> +                                                              data->div_=
flags, data->table,
> +                                                              &wpcm450_c=
lk_lock);
> +               if (IS_ERR(hw)) {
> +                       pr_err("Failed to register div table: %pe\n", hw);
> +                       return;
> +               }
> +       }
> +
> +       // Selects/muxes
> +       for (i =3D 0; i < ARRAY_SIZE(clksel_data); i++) {
> +               const struct wpcm450_clksel_data *data =3D &clksel_data[i=
];
> +
> +               hw =3D clk_hw_register_mux_parent_data(NULL, data->name, =
data->parents,
> +                                                    data->num_parents, d=
ata->flags,
> +                                                    clk_base + REG_CLKSE=
L, data->shift,
> +                                                    data->width, 0,
> +                                                    &wpcm450_clk_lock);
> +               if (IS_ERR(hw)) {
> +                       pr_err("Failed to register mux: %pe\n", hw);
> +                       return;
> +               }
> +               if (data->index >=3D 0)
> +                       clk_data->hws[data->index] =3D hw;
> +       }
> +
> +       // Divisors
> +       for (i =3D 0; i < ARRAY_SIZE(clkdiv_data); i++) {
> +               const struct wpcm450_clkdiv_data *data =3D &clkdiv_data[i=
];
> +
> +               hw =3D clk_hw_register_divider_table_parent_data(NULL, da=
ta->name, &data->parent,
> +                                                              data->flag=
s, clk_base + REG_CLKDIV,
> +                                                              data->shif=
t, data->width,
> +                                                              data->div_=
flags, data->table,
> +                                                              &wpcm450_c=
lk_lock);
> +               if (IS_ERR(hw)) {
> +                       pr_err("Failed to register divider: %pe\n", hw);
> +                       return;
> +               }
> +       }
> +
> +       // Enables/gates
> +       for (i =3D 0; i < ARRAY_SIZE(clken_data); i++) {
> +               const struct wpcm450_clken_data *data =3D &clken_data[i];
> +
> +               hw =3D clk_hw_register_gate_parent_data(NULL, data->name,=
 &data->parent, data->flags,
> +                                                     clk_base + REG_CLKE=
N, data->bitnum,
> +                                                     data->flags, &wpcm4=
50_clk_lock);
> +               if (IS_ERR(hw)) {
> +                       pr_err("Failed to register gate: %pe\n", hw);
> +                       return;
> +               }
> +               clk_data->hws[data->bitnum] =3D hw;
> +       }
> +
> +       ret =3D of_clk_add_hw_provider(clk_np, of_clk_hw_onecell_get, clk=
_data);
> +       if (ret)
> +               pr_err("Failed to add DT provider: %pe\n", ERR_PTR(ret));
> +
> +       // Reset controller
> +       reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);
> +       if (!reset)
> +               return;
> +       reset->rcdev.owner =3D THIS_MODULE;
> +       reset->rcdev.nr_resets =3D WPCM450_NUM_RESETS;
> +       reset->rcdev.ops =3D &reset_simple_ops;
> +       reset->rcdev.of_node =3D clk_np;
> +       reset->membase =3D clk_base + REG_IPSRST;
> +       ret =3D reset_controller_register(&reset->rcdev);
> +       if (ret)
> +               pr_err("Failed to register reset controller: %pe\n", ERR_=
PTR(ret));
> +
> +       of_node_put(clk_np);
> +}
> +
> +CLK_OF_DECLARE(wpcm450_clk_init, "nuvoton,wpcm450-clk", wpcm450_clk_init=
);

Is something preventing this from being a platform driver?
