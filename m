Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B78A27EF
	for <lists+openbmc@lfdr.de>; Fri, 12 Apr 2024 09:25:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PH3Q5Lnc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG7QD5CqWz3vlp
	for <lists+openbmc@lfdr.de>; Fri, 12 Apr 2024 17:25:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PH3Q5Lnc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG7Pg5d6Gz3dWr
	for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2024 17:25:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C746CCE3796;
	Fri, 12 Apr 2024 07:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED614C113CC;
	Fri, 12 Apr 2024 07:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712906708;
	bh=1kX9kfzHzhrxx38AopTffWG2kYPAhrnomHNnphARmp8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PH3Q5Lnc1/dyrDs7XafAWFsC4e9SKfVWIecn+kI7jaBT27bEfiFtdA0uHmPVH5J8c
	 9zHCfa84p3D1trAOIsnNiRi2IrN9qyCN+jtVbqwdjkKfMWppvw0lEVhdLmTapBNjFE
	 rvDW8Bh6PFK/legh5nAd4uYCYoU/zH0xqH3HT8hdEdXDgTxJIp+nOl1ztSTmQUfUCn
	 gjTKu+ceV1jgF5L3ssNdSDwGG5izOj/yNTE8nZFJXsucVcMxw8IX87zJS9LHlOEd6+
	 CcuDo4gtH0wPsrQvNqfxxjCc90PoSfLzkdcB+jPGcf8kxMFQ2VAlTuIr8MBIofSurI
	 k13csdn57iP2g==
Message-ID: <9be144291cda6d9714252c9cd83649c2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240401-wpcm-clk-v11-3-379472961244@gmx.net>
References: <20240401-wpcm-clk-v11-0-379472961244@gmx.net> <20240401-wpcm-clk-v11-3-379472961244@gmx.net>
Subject: Re: [PATCH v11 3/4] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
From: Stephen Boyd <sboyd@kernel.org>
To: Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Fri, 12 Apr 2024 00:25:05 -0700
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Jonathan Neusch=C3=A4fer (2024-04-01 07:06:32)
> This driver implements the following features w.r.t. the clock and reset
> controller in the WPCM450 SoC:
>=20
> - It calculates the rates for all clocks managed by the clock controller
> - It leaves the clock tree mostly unchanged, except that it enables/
>   disables clock gates based on usage.
> - It exposes the reset lines managed by the controller using the
>   Generic Reset Controller subsystem
>=20
> NOTE: If the driver and the corresponding devicetree node are present,
>       the driver will disable "unused" clocks. This is problem until
>       the clock relations are properly declared in the devicetree (in a
>       later patch). Until then, the clk_ignore_unused kernel parameter
>       can be used as a workaround.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>=20
> I have considered converting this driver to a platform driver instead of
> using CLK_OF_DECLARE, because platform drivers are generally the way
> forward. However, the timer-npcm7xx driver used on the same platform
> requires is initialized with TIMER_OF_DECLARE and thus requires the
> clocks to be available earlier than a platform driver can provide them.

In that case you can use CLK_OF_DECLARE_DRIVER(), register the clks
needed for the timer driver to probe, and then put the rest of the clk
registration in a normal platform driver.

> diff --git a/drivers/clk/nuvoton/clk-wpcm450.c b/drivers/clk/nuvoton/clk-=
wpcm450.c
> new file mode 100644
> index 00000000000000..9100c4b8a56483
> --- /dev/null
> +++ b/drivers/clk/nuvoton/clk-wpcm450.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Nuvoton WPCM450 clock and reset controller driver.
> + *
> + * Copyright (C) 2022 Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Isn't KBUILD_MODNAME an option already for dynamic debug?

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
[...]
> +
> +static const struct clk_parent_data default_parents[] =3D {
> +       { .name =3D "pll0" },
> +       { .name =3D "pll1" },
> +       { .name =3D "ref" },
> +};
> +
> +static const struct clk_parent_data huart_parents[] =3D {
> +       { .fw_name =3D "ref" },
> +       { .name =3D "refdiv2" },

Please remove all .name elements and use indexes or direct pointers.

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

This actually is  { .index =3D 0, .name =3D "ahb3" } and that is a bad
combination. struct clk_parent_data should only have .name as a fallback
when there's an old binding out there that doesn't have the 'clocks'
property for the clk provider node. There shouldn't be any .name
property because this is new code and a new binding.

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

Don't break words across lines with hyphens.

> + * by a few leaked resources.
> + */
> +
> +static void __init wpcm450_clk_init(struct device_node *np)
> +{
> +       struct clk_hw_onecell_data *clk_data;
> +       static struct clk_hw **hws;
> +       static struct clk_hw *hw;
> +       void __iomem *clk_base;
> +       int i, ret;
> +       struct reset_simple_data *reset;
> +
> +       clk_base =3D of_iomap(np, 0);
> +       if (!clk_base) {
> +               pr_err("%pOFP: failed to map registers\n", np);
> +               of_node_put(np);
> +               return;
> +       }
> +       of_node_put(np);

The 'np' is used later when registering PLLs. You can only put the node
after it's no longer used. Also, you never got the node with
of_node_get(), so putting it here actually causes an underflow on the
refcount. Just remove all the get/puts instead.

> +
> +       clk_data =3D kzalloc(struct_size(clk_data, hws, WPCM450_NUM_CLKS)=
, GFP_KERNEL);
> +       if (!clk_data)
> +               return;
> +
> +       clk_data->num =3D WPCM450_NUM_CLKS;
[...]
> +       /* Reset controller */
> +       reset =3D kzalloc(sizeof(*reset), GFP_KERNEL);
> +       if (!reset)
> +               return;
> +       reset->rcdev.owner =3D THIS_MODULE;
> +       reset->rcdev.nr_resets =3D WPCM450_NUM_RESETS;
> +       reset->rcdev.ops =3D &reset_simple_ops;
> +       reset->rcdev.of_node =3D np;
> +       reset->membase =3D clk_base + REG_IPSRST;
> +       ret =3D reset_controller_register(&reset->rcdev);
> +       if (ret)
> +               pr_err("Failed to register reset controller: %pe\n", ERR_=
PTR(ret));

It would be nicer to register this device as an auxiliary device with a
single API call and then have all the resets exist in that file
instead of this file. The driver would be put in drivers/reset/ as well.

> +
> +       of_node_put(np);

Drop this of_node_put()
