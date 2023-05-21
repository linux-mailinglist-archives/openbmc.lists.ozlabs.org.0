Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5CC70AF4A
	for <lists+openbmc@lfdr.de>; Sun, 21 May 2023 19:30:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPSJS28d0z3c9Y
	for <lists+openbmc@lfdr.de>; Mon, 22 May 2023 03:30:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=QDON1IcH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.13; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=QDON1IcH;
	dkim-atps=neutral
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPSHt574qz3bm9
	for <openbmc@lists.ozlabs.org>; Mon, 22 May 2023 03:29:27 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 0mkfqJIn4ZV0d0mkgqyDCA; Sun, 21 May 2023 19:21:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1684689712;
	bh=GnoOf0xWLQliOYfqdOBB5QyrQ9P0hooDp7U/JgfRxhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QDON1IcHnHw69grnW6tznLI6KTYLejaGitd81P2nJq5WPI2l87j3T1kHItWJ/50gh
	 sR+pnniHAug6z7owl99WwN2PEOZYI1vHBZFiloIAUCz2QSUzIf717W/RKRMxtebMZH
	 L7vVSPQGoa3/qDx+Qf3PGPbyDbiR/o8YGlraeSg6jc0dKjjUxXTeZDgfFC9JTkfeS1
	 LLvgqBrEuYF6/EST+4gGjz2Ah1yiZ6vxHFMBa0IM44UUaZAxMPduxCiFhoQmD7Swo/
	 qwoVPe5uavA0bp+bQI54jb7pK8RY5Rdkm2uK92me5x78uQjvN0/s5IDn7bAsnvYS5P
	 4accYLgEahIKw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 21 May 2023 19:21:52 +0200
X-ME-IP: 86.243.2.178
Message-ID: <0e72c35f-5d9d-45a7-5f85-3971b8029106@wanadoo.fr>
Date: Sun, 21 May 2023 19:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v16 1/1] clk: npcm8xx: add clock controller
Content-Language: fr
To: Tomer Maimon <tmaimon77@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com,
 joel@jms.id.au, venture@google.com, yuenn@google.com, benjaminfair@google.com
References: <20230521143202.155399-1-tmaimon77@gmail.com>
 <20230521143202.155399-2-tmaimon77@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230521143202.155399-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Le 21/05/2023 à 16:32, Tomer Maimon a écrit :
> Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller which
> generates and supplies clocks to all modules within the BMC.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Hi,

should there be a v17, below a few nits and questions.

Jusrt my 2c,

> ---
>   drivers/clk/Kconfig       |   8 +
>   drivers/clk/Makefile      |   1 +
>   drivers/clk/clk-npcm8xx.c | 566 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 575 insertions(+)
>   create mode 100644 drivers/clk/clk-npcm8xx.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 016814e15536..2249de28a46a 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -325,6 +325,14 @@ config COMMON_CLK_LOCHNAGAR
>   	  This driver supports the clocking features of the Cirrus Logic
>   	  Lochnagar audio development board.
>   
> +config COMMON_CLK_NPCM8XX
> +	tristate "Clock driver for the NPCM8XX SoC Family"
> +	depends on ARCH_NPCM || COMPILE_TEST
> +	help
> +	  This driver supports the clocks on the Nuvoton BMC NPCM8XX SoC Family,
> +	  all the clocks are initialized by the bootloader, so this driver
> +	  allows only reading of current settings directly from the hardware.
> +
>   config COMMON_CLK_LOONGSON2
>   	bool "Clock driver for Loongson-2 SoC"
>   	depends on LOONGARCH || COMPILE_TEST
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 0aebef17edc6..88713cbfbab5 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_ARCH_MILBEAUT_M10V)	+= clk-milbeaut.o
>   obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
>   obj-$(CONFIG_ARCH_NOMADIK)		+= clk-nomadik.o
>   obj-$(CONFIG_ARCH_NPCM7XX)	    	+= clk-npcm7xx.o
> +obj-$(CONFIG_COMMON_CLK_NPCM8XX)	+= clk-npcm8xx.o
>   obj-$(CONFIG_ARCH_NSPIRE)		+= clk-nspire.o
>   obj-$(CONFIG_COMMON_CLK_OXNAS)		+= clk-oxnas.o
>   obj-$(CONFIG_COMMON_CLK_PALMAS)		+= clk-palmas.o
> diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> new file mode 100644
> index 000000000000..9e6ed073d124
> --- /dev/null
> +++ b/drivers/clk/clk-npcm8xx.c
> @@ -0,0 +1,566 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NPCM8xx Clock Generator
> + * All the clocks are initialized by the bootloader, so this driver allow only

nit: allows (as in Kconfig)

[...]

> +/* npcm8xx clock registers*/
> +#define NPCM8XX_CLKSEL          (0x04)
> +#define NPCM8XX_CLKDIV1         (0x08)
> +#define NPCM8XX_CLKDIV2         (0x2C)
> +#define NPCM8XX_CLKDIV3         (0x58)
> +#define NPCM8XX_CLKDIV4         (0x7C)
> +#define NPCM8XX_PLLCON0         (0x0C)
> +#define NPCM8XX_PLLCON1         (0x10)
> +#define NPCM8XX_PLLCON2         (0x54)
> +#define NPCM8XX_PLLCONG         (0x60)
> +#define NPCM8XX_THRTL_CNT       (0xC0)

nit: () around this values looks superfluous.

> +
> +#define PLLCON_LOKI	BIT(31)
> +#define PLLCON_LOKS	BIT(30)

[...]

> +static struct clk_hw *
> +npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
> +			 const char *name, const struct clk_parent_data *parent,
> +			 unsigned long flags)
> +{
> +	struct npcm8xx_clk_pll *pll;
> +	struct clk_init_data init = {};
> +	int ret;
> +
> +	pll = kzalloc(sizeof(*pll), GFP_KERNEL);

Everything looks devm_()'ed in this driver, except this kzalloc.
Except the one below, there is no kfree to free this memory, and no 
.remove() function.

Is it on purpose?

> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = &npcm8xx_clk_pll_ops;
> +	init.parent_data = parent;
> +	init.num_parents = 1;
> +	init.flags = flags;
> +
> +	pll->pllcon = pllcon;
> +	pll->hw.init = &init;
> +
> +	ret = devm_clk_hw_register(dev, &pll->hw);
> +	if (ret) {
> +		kfree(pll);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return &pll->hw;
> +}
> +
> +static DEFINE_SPINLOCK(npcm8xx_clk_lock);
> +
> +static int npcm8xx_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *npcm8xx_clk_data;
> +	struct device *dev = &pdev->dev;
> +	void __iomem *clk_base;
> +	struct resource *res;
> +	struct clk_hw *hw;
> +	unsigned int i;
> +	int err;
> +
> +	npcm8xx_clk_data = devm_kzalloc(dev, struct_size(npcm8xx_clk_data, hws,
> +							 NPCM8XX_NUM_CLOCKS),
> +					GFP_KERNEL);
> +	if (!npcm8xx_clk_data)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	clk_base = devm_ioremap(dev, res->start, resource_size(res));
> +	if (!clk_base) {
> +		dev_err(&pdev->dev, "Failed to remap I/O memory\n");

Here and below: mostly a matter of taste, but usually return 
dev_err_probe() saves a few LoC and keep the error code in the error 
message.

> +		return -ENOMEM;
> +	}
> +
> +	npcm8xx_clk_data->num = NPCM8XX_NUM_CLOCKS;
> +
> +	for (i = 0; i < NPCM8XX_NUM_CLOCKS; i++)
> +		npcm8xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> +
> +	/* Register plls */
> +	for (i = 0; i < ARRAY_SIZE(npcm8xx_pll_clks); i++) {
> +		struct npcm8xx_pll_data *pll_clk = &npcm8xx_pll_clks[i];
> +
> +		hw = npcm8xx_clk_register_pll(dev, clk_base + pll_clk->reg,
> +					      pll_clk->name, &pll_clk->parent,
> +					      pll_clk->flags);
> +		if (IS_ERR(hw)) {
> +			dev_err(dev, "npcm8xx_clk: Can't register pll\n");
> +			return PTR_ERR(hw);
> +		}
> +		pll_clk->hw = *hw;
> +	}
> +
> +	/* Register fixed dividers */
> +	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL1_DIV2,
> +					       NPCM8XX_CLK_S_PLL1, 0, 1, 2);
> +	if (IS_ERR(hw)) {
> +		dev_err(dev, "npcm8xx_clk: Can't register fixed div\n");
> +		return PTR_ERR(hw);
> +	}
> +	hw_pll1_div2 = *hw;
> +
> +	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL2_DIV2,
> +					       NPCM8XX_CLK_S_PLL2, 0, 1, 2);
> +	if (IS_ERR(hw)) {
> +		dev_err(dev, "npcm8xx_clk: Can't register pll2 div2\n");
> +		return PTR_ERR(hw);
> +	}
> +	hw_pll2_div2 = *hw;
> +
> +	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PLL_GFX_DIV2,
> +					       NPCM8XX_CLK_S_PLL_GFX, 0, 1, 2);
> +	if (IS_ERR(hw)) {
> +		dev_err(dev, "npcm8xx_clk: Can't register gfx div2\n");
> +		return PTR_ERR(hw);
> +	}
> +	hw_gfx_div2 = *hw;
> +
> +	/* Register muxes */
> +	for (i = 0; i < ARRAY_SIZE(npcm8xx_muxes); i++) {
> +		struct npcm8xx_clk_mux_data *mux_data = &npcm8xx_muxes[i];
> +
> +		hw = devm_clk_hw_register_mux_parent_data_table(dev,
> +								mux_data->name,
> +								mux_data->parent_data,
> +								mux_data->num_parents,
> +								mux_data->flags,
> +								clk_base + NPCM8XX_CLKSEL,
> +								mux_data->shift,
> +								mux_data->mask,
> +								0,
> +								mux_data->table,
> +								&npcm8xx_clk_lock);
> +		if (IS_ERR(hw)) {
> +			dev_err(dev, "npcm8xx_clk: Can't register mux\n");
> +			return PTR_ERR(hw);
> +		}
> +		mux_data->hw = *hw;
> +	}
> +
> +	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_PRE_CLK,
> +					       NPCM8XX_CLK_S_CPU_MUX, 0, 1, 2);
> +	if (IS_ERR(hw)) {
> +		dev_err(dev, "npcm8xx_clk: Can't register ckclk div2\n");

ckclk or just clk?

Based on naming only, this div2 (here and below) looks strange.
Is it on purpose, on just a cut'n'paste  from the previous message?

> +		return PTR_ERR(hw);
> +	}
> +	hw_pre_clk = *hw;
> +
> +	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_AXI,
> +					       NPCM8XX_CLK_S_TH, 0, 1, 2);
> +	if (IS_ERR(hw)) {
> +		dev_err(dev, "npcm8xx_clk: Can't register axi div2\n");
> +		return PTR_ERR(hw);
> +	}
> +	npcm8xx_clk_data->hws[NPCM8XX_CLK_AXI] = hw;
> +
> +	hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_ATB,
> +					       NPCM8XX_CLK_S_AXI, 0, 1, 2);
> +	if (IS_ERR(hw)) {
> +		dev_err(dev, "npcm8xx_clk: Can't register atb div2\n");
> +		return PTR_ERR(hw);
> +	}
> +	npcm8xx_clk_data->hws[NPCM8XX_CLK_ATB] = hw;
> +
> +	/* Register clock dividers specified in npcm8xx_divs */
> +	for (i = 0; i < ARRAY_SIZE(npcm8xx_divs); i++) {
> +		const struct npcm8xx_clk_div_data *div_data = &npcm8xx_divs[i];
> +
> +		hw = clk_hw_register_divider_parent_data(dev, div_data->name,
> +							 &div_data->parent_data,
> +							 div_data->flags,
> +							 clk_base + div_data->reg,
> +							 div_data->shift,
> +							 div_data->width,
> +							 div_data->clk_divider_flags,
> +							 &npcm8xx_clk_lock);
> +		if (IS_ERR(hw)) {
> +			dev_err(dev, "npcm8xx_clk: Can't register div table\n");
> +			goto err_div_clk;
> +		}
> +
> +		if (div_data->onecell_idx >= 0)
> +			npcm8xx_clk_data->hws[div_data->onecell_idx] = hw;
> +	}
> +
> +	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  npcm8xx_clk_data);
> +	if (err) {
> +		dev_err(dev, "unable to add clk provider\n");
> +		hw = ERR_PTR(err);
> +		goto err_div_clk;
> +	}
> +
> +	return err;
> +
> +err_div_clk:
> +	while (i--) {
> +		if (npcm8xx_divs[i].onecell_idx >= 0)
> +			clk_hw_unregister_divider(npcm8xx_clk_data->hws[npcm8xx_divs[i].onecell_idx]);
> +	}

There is an error handling path in the probe, but no .remove() function.
Should there be one?

CJ

[...]
