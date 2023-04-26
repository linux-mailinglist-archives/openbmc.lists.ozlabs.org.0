Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4FC6EEC38
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 04:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5hy91p3tz3cLr
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 12:04:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mMcFRri2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mMcFRri2;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5hxZ4tRpz2yWN
	for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2023 12:04:02 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94f7a7a3351so1229756366b.2
        for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2023 19:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1682474636; x=1685066636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxSWBEYZlNZW+jua4S5nwDI2g/pXBGbnN7kJRXndEJM=;
        b=mMcFRri2XhK92cm9ONSfhIHOskPYOezAiz7KtBazwVydRV9bNBdWJSqnlmu4EIwBGe
         qoJ/3tP4lDpACNbh9x56XZmqQuVYQWiHaeJ+f4JvNR8crq03nfPz1bEpAg9NF0CBq+3Q
         33RVC1aXLn8BAki29ZWTBnRRHkdGOYmJjbY4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682474636; x=1685066636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxSWBEYZlNZW+jua4S5nwDI2g/pXBGbnN7kJRXndEJM=;
        b=TXNE+T+qXv2zhjagK/gbzEZMZ10BXZUbXPYf587xRRChB3kr1TR0IgFCwO0Aj8yCgj
         66dizJgAmk5ZuK+90N7QT0D1h0cThR03IzqAD0KIr715VSHyhpEKR3a0wuqO3iPYM64X
         DgisHsjurwMuyBhYZNHJ/SmxSUctED2E239/T0mMpMxF1h6Vh4XjR+aomXU3RBeZjAGs
         iacd32fsFFzP60XH74KApOcAjvwqHq6o0a6Cs+mqquVNZ969KVeQEUr0v7TcE6i1Q6Uj
         J1/uQNqmH+8f6B0Q7C8AFwVikj4NGOZ6ba1J++Z0FqqjW+F3wEa8UmvFwMov0n4wNhYl
         Bclg==
X-Gm-Message-State: AAQBX9fFd/NCr606QBbqVlL0CQriBRMzdJTrUsPz2T4Bdp/24V4es0v4
	fWJVt4N87InwyAW2Mgfds0RKqg91fLVzwUMGZDY=
X-Google-Smtp-Source: AKy350ZOI+ko0D9fPxZonz73kkuyXFvzUA/i4XqsHbYulra6AKuPTqmpZO0S8kB/PASzaQE0536n8GGZHpEWRLDt594=
X-Received: by 2002:a17:907:7208:b0:930:b130:b7b with SMTP id
 dr8-20020a170907720800b00930b1300b7bmr15637808ejc.6.1682474635512; Tue, 25
 Apr 2023 19:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230422220240.322572-1-j.neuschaefer@gmx.net> <20230422220240.322572-3-j.neuschaefer@gmx.net>
In-Reply-To: <20230422220240.322572-3-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Apr 2023 02:03:44 +0000
Message-ID: <CACPK8Xd7ebqq0m+xLOxsOXuxqRw31BXUBjhwuSpMJaH27NQZ6Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-clk@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 22 Apr 2023 at 22:05, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> This driver implements the following features w.r.t. the clock and reset
> controller in the WPCM450 SoC:
>
> - It calculates the rates for all clocks managed by the clock controller
> - It leaves the clock tree mostly unchanged, except that it enables/
>   disables clock gates based on usage.
> - It exposes the reset lines managed by the controller using the
>   Generic Reset Controller subsystem
>
> NOTE: If the driver and the corresponding devicetree node are present,
>       the driver will disable "unused" clocks. This is problem until
>       the clock relations are properly declared in the devicetree (in a
>       later patch). Until then, the clk_ignore_unused kernel parameter
>       can be used as a workaround.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>
> v7:
> - Simplify error handling by not deallocating resources
>
> v6:
> - Enable RESET_SIMPLE based on ARCH_WPCM450, not ARCH_NPCM, as suggested =
by Tomer Maimon
>
> v5:
> - https://lore.kernel.org/lkml/20221104161850.2889894-6-j.neuschaefer@gmx=
.net/
> - Switch to using clk_parent_data
>
> v4:
> - https://lore.kernel.org/lkml/20220610072141.347795-6-j.neuschaefer@gmx.=
net/
> - Fix reset controller initialization
>
> v3:
> - https://lore.kernel.org/lkml/20220508194333.2170161-7-j.neuschaefer@gmx=
.net/
> - Change reference clock name from "refclk" to "ref"
> - Remove unused variable in return path of wpcm450_clk_register_pll
> - Remove unused divisor tables
>
> v2:
> - https://lore.kernel.org/lkml/20220429172030.398011-7-j.neuschaefer@gmx.=
net/
> - no changes
> ---
>  drivers/clk/Makefile      |   1 +
>  drivers/clk/clk-wpcm450.c | 374 ++++++++++++++++++++++++++++++++++++++
>  drivers/reset/Kconfig     |   2 +-
>  3 files changed, 376 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/clk-wpcm450.c
>
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index e3ca0d058a256..b58352d4d615d 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -75,6 +75,7 @@ obj-$(CONFIG_COMMON_CLK_RS9_PCIE)     +=3D clk-renesas-=
pcie.o
>  obj-$(CONFIG_COMMON_CLK_VC5)           +=3D clk-versaclock5.o
>  obj-$(CONFIG_COMMON_CLK_VC7)           +=3D clk-versaclock7.o
>  obj-$(CONFIG_COMMON_CLK_WM831X)                +=3D clk-wm831x.o
> +obj-$(CONFIG_ARCH_WPCM450)             +=3D clk-wpcm450.o
>  obj-$(CONFIG_COMMON_CLK_XGENE)         +=3D clk-xgene.o
>
>  # please keep this section sorted lexicographically by directory path na=
me
> diff --git a/drivers/clk/clk-wpcm450.c b/drivers/clk/clk-wpcm450.c
> new file mode 100644
> index 0000000000000..6f6d8a1ea3484
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
> +       for (i =3D 0; i < ARRAY_SIZE(pll_data); i++) {
> +               const struct wpcm450_pll_data *data =3D &pll_data[i];
> +
> +               hw =3D wpcm450_clk_register_pll(clk_base + data->reg, dat=
a->name,
> +                                             &data->parent, data->flags)=
;
> +               if (IS_ERR(hw)) {
> +                       pr_info("Failed to register PLL: %pe", hw);
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
> +                       pr_err("Failed to register div table: %pe\n", hw)=
;
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
> +               pr_err("Failed to add DT provider: %d\n", ret);
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
> +               pr_err("Failed to register reset controller: %d\n", ret);
> +
> +       of_node_put(clk_np);
> +}
> +
> +CLK_OF_DECLARE(wpcm450_clk_init, "nuvoton,wpcm450-clk", wpcm450_clk_init=
);
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 2a52c990d4fec..16e111d213560 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -208,7 +208,7 @@ config RESET_SCMI
>
>  config RESET_SIMPLE
>         bool "Simple Reset Controller Driver" if COMPILE_TEST || EXPERT
> -       default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTE=
K || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
> +       default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTE=
K || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC || AR=
CH_WPCM450
>         depends on HAS_IOMEM
>         help
>           This enables a simple reset controller driver for reset lines t=
hat
> --
> 2.39.2
>
