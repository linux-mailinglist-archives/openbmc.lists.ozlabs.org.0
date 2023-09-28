Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 334C67B2817
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 00:04:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=GWNgLpt2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxSF00cc9z3cmQ
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 08:04:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=GWNgLpt2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.24; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 5412 seconds by postgrey-1.37 at boromir; Fri, 29 Sep 2023 08:03:46 AEST
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxSDL6H5Hz2yVw
	for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2023 08:03:40 +1000 (AEST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id lxa7qtM09s3p2lxa7qE71e; Thu, 28 Sep 2023 22:25:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1695932758;
	bh=WB4u7hJNotn/oO7SrKl1RiTvC7V6GdDk62G1wtVmWy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GWNgLpt2DZbKBZdKA9Z6Yt3WX9L2sKCs6nrUlWb1jd8Njmh7h6DblzBn92oVSfD4j
	 HyHBQazZS7p61N+qFbjxAMMlkn0SYwKGGOlKFELi4WjjPUmy98LozLi2dUBB7StWcI
	 9llHIuly0UHHL92lDfHq39MzWEJwTsOi1ghEF/I/iW5HEbiLpqA18slMmUkukA+ZZI
	 rYj2ytv9vb0VKrb/z9kswE9Zr/N9OJwbwykja9wpYBHEM/XjINz8qKCryL07B/BSHa
	 /hIc+mJFXcPmERsxC9mQTHjT6G5rPcni0jC5cgC2JY4+6qN0HXqg8JbjezANa/ITN5
	 WyNCIJ4KmEakQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 28 Sep 2023 22:25:57 +0200
X-ME-IP: 86.243.2.178
Message-ID: <1712d776-2170-3a48-3bce-b39128edd4ab@wanadoo.fr>
Date: Thu, 28 Sep 2023 22:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RESEND v19] clk: npcm8xx: add clock controller
Content-Language: fr
To: Tomer Maimon <tmaimon77@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com,
 joel@jms.id.au, venture@google.com, yuenn@google.com, benjaminfair@google.com
References: <20230928194508.141138-1-tmaimon77@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230928194508.141138-1-tmaimon77@gmail.com>
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

Le 28/09/2023 à 21:45, Tomer Maimon a écrit :
> Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller which
> generates and supplies clocks to all modules within the BMC.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---

...


> +static struct clk_hw *
> +npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
> +			 const char *name, const struct clk_parent_data *parent,
> +			 unsigned long flags)
> +{
> +	struct npcm8xx_clk_pll *pll;
> +	struct clk_init_data init = {};
> +	int ret;
> +
> +	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
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

Double free. pll is devm_kzalloc()'ed.

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

Defining pr_fmt() would simplify the error message.

Also dev_err_probe() could save a few LoC and log the error codes.

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
> +		dev_err(dev, "npcm8xx_clk: Can't register pre clk div2\n");
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

return 0 is the same but more explicit.

> +
> +err_div_clk:
> +	while (i--)
> +		if (npcm8xx_divs[i].onecell_idx >= 0)
> +			clk_hw_unregister_divider(npcm8xx_clk_data->hws[npcm8xx_divs[i].onecell_idx]);
> +
> +	return PTR_ERR(hw);
> +}
> +
> +static const struct of_device_id npcm8xx_clk_dt_ids[] = {
> +	{ .compatible = "nuvoton,npcm845-clk", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, npcm8xx_clk_dt_ids);
> +
> +static struct platform_driver npcm8xx_clk_driver = {
> +	.probe  = npcm8xx_clk_probe,
> +	.driver = {
> +		.name = "npcm8xx_clk",
> +		.of_match_table = npcm8xx_clk_dt_ids,
> +	},
> +};
> +
> +static int __init npcm8xx_clk_driver_init(void)
> +{
> +	return platform_driver_register(&npcm8xx_clk_driver);
> +}
> +arch_initcall(npcm8xx_clk_driver_init);
> +
> +static void __exit npcm8xx_clk_exit(void)
> +{
> +	platform_driver_unregister(&npcm8xx_clk_driver);
> +}
> +module_exit(npcm8xx_clk_exit);
> +
> +MODULE_DESCRIPTION("Clock driver for Nuvoton NPCM8XX BMC SoC");
> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> +MODULE_LICENSE("GPL v2");
> +

