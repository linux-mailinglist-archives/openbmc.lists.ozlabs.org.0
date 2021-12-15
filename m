Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA0478352
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 03:44:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFYH5572Zz3bhh
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 13:44:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NP0vZ+FU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=seanga2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NP0vZ+FU; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDkPP2rbhz2x99
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 05:32:25 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id jo22so21053956qvb.13
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DqCTkekrYdxUkdUMUBmKp4SWDRJWlUTJWmdQHFONGSg=;
 b=NP0vZ+FUr+sIKC58VcciFSPZPxouwhht12Ah/rhtHQkutFHigSfAnIyLl/6RMplwcZ
 XDHH0Q0Idjbc7VUvC7rVdafd25Bavg4YLgf5pZt0O4Bv83m1hZ5yLempgP4ctr8GxpHK
 WNWJtQUq8dwm8o/abBqvdgrSsw0mYTv/SDXE9EoyGka35TlhQJj7/3XjL7KyinxRkrm5
 q90NuGmNWre0u+3fDwbkX/UXPa6JHcIGSr8wxclcMSTpHHoaehXSgEwfBHoJBSX1ctka
 m4lm7ZaCC6YgrcmINyX+aFZXWKdmYMZwdR4AJagM2gBqfkSn386JbrahYJqeQtEAsXdl
 7kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DqCTkekrYdxUkdUMUBmKp4SWDRJWlUTJWmdQHFONGSg=;
 b=IhEMS9wXaU+ZSBMWLjvWmZ+81a207p4j8R5tA215kqBWXWe3wQ7Eu0Wk9GI6BNfFPT
 tE+Kw+W5ZuIfYlxqq+kF1Vm+ij1wA0G4nbLP5aiX7REkRyKgGDiMkQndcfeBRSLevjKr
 xjzdexod8MUd5I+hV+TBUQ+xaqc3YM6kAGAPhTWz8kYuE9sHF4onvM4g00rg3t6bYETw
 VVVKQ75bV2i+B6jvhijOiVlp6f2nl2tUIWhQ1XNrcYLLCaOQKT9Gyc7LpSH54hMsPnAC
 jduRm4lPHZxU7I+SAfMt0sl9qk5+Jz6u61LW4gaCX/UEJO8kChy/+NrhzyzER+ACjyeX
 uG/w==
X-Gm-Message-State: AOAM533bXZrng4jOyOaCu0lJhS5YcnsDQKwylDM39ZcJV0Z/a/rgZJXh
 Xakv9t6kJscLCMgx7VC2Kyj2MzNfPrCwaw==
X-Google-Smtp-Source: ABdhPJzqMZXnkRCX/73g9yZ7bgytVekx0Xnccmaj5rNTlEr7cWD6/7nvTxxq6DsEPQEFjp5TBNCzcw==
X-Received: by 2002:ad4:56ed:: with SMTP id
 cr13mr12507927qvb.127.1639593142214; 
 Wed, 15 Dec 2021 10:32:22 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-207-184.washdc.fios.verizon.net.
 [108.18.207.184])
 by smtp.googlemail.com with ESMTPSA id a20sm1438229qkh.63.2021.12.15.10.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 10:32:21 -0800 (PST)
From: Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v1 2/9] clk: nuvoton: Add support for NPCM845
To: Stanley Chu <stanley.chuys@gmail.com>, lukma@denx.de,
 jagan@amarulasolutions.com, andre.przywara@arm.com, festevam@denx.de,
 narmstrong@baylibre.com, pbrobinson@gmail.com, tharvey@gateworks.com,
 christianshewitt@gmail.com, lokeshvutla@ti.com, sjg@chromium.org,
 sr@denx.de, michal.simek@xilinx.com, hs@denx.de, weijie.gao@mediatek.com,
 hannes.schmelzer@br-automation.com, harm.berntsen@nedap.com,
 sebastian.reichel@collabora.com, stephan@gerhold.net, fangyuanseu@gmail.com,
 kettenis@openbsd.org, dsankouski@gmail.com, vabhav.sharma@nxp.com,
 bmeng.cn@gmail.com, patrick@blueri.se, samuel@sholland.org,
 giulio.benetti@benettiengineering.com, mr.bossman075@gmail.com,
 yschu@nuvoton.com, kwliu@nuvoton.com, ctcchien@nuvoton.com,
 avifishman70@gmail.com, tmaimon77@gmail.com
References: <20211215025800.26918-1-yschu@nuvoton.com>
 <20211215025800.26918-3-yschu@nuvoton.com>
Message-ID: <a461da7a-14cc-0119-6d0b-4fa08d7ee5ce@gmail.com>
Date: Wed, 15 Dec 2021 13:32:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211215025800.26918-3-yschu@nuvoton.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 17 Dec 2021 13:39:52 +1100
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
Cc: u-boot@lists.denx.de, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/14/21 9:57 PM, Stanley Chu wrote:
> Add clock controller driver for NPCM845
> 
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>   drivers/clk/Makefile                      |   1 +
>   drivers/clk/nuvoton/Makefile              |   1 +
>   drivers/clk/nuvoton/clk_npcm8xx.c         | 213 ++++++++++++++++++++++
>   include/dt-bindings/clock/npcm845-clock.h |  17 ++
>   4 files changed, 232 insertions(+)
>   create mode 100644 drivers/clk/nuvoton/Makefile
>   create mode 100644 drivers/clk/nuvoton/clk_npcm8xx.c
>   create mode 100644 include/dt-bindings/clock/npcm845-clock.h
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 711ae5bc29..a3b64b73c2 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -53,3 +53,4 @@ obj-$(CONFIG_STM32H7) += clk_stm32h7.o
>   obj-$(CONFIG_CLK_VERSAL) += clk_versal.o
>   obj-$(CONFIG_CLK_CDCE9XX) += clk-cdce9xx.o
>   obj-$(CONFIG_CLK_VERSACLOCK) += clk_versaclock.o
> +obj-$(CONFIG_ARCH_NPCM) += nuvoton/

Please keep this in alphabetical order (I know the file isn't perfect).

> diff --git a/drivers/clk/nuvoton/Makefile b/drivers/clk/nuvoton/Makefile
> new file mode 100644
> index 0000000000..998e5329bb
> --- /dev/null
> +++ b/drivers/clk/nuvoton/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_ARCH_NPCM8XX) += clk_npcm8xx.o
> diff --git a/drivers/clk/nuvoton/clk_npcm8xx.c b/drivers/clk/nuvoton/clk_npcm8xx.c
> new file mode 100644
> index 0000000000..c547c47e82
> --- /dev/null
> +++ b/drivers/clk/nuvoton/clk_npcm8xx.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021 Nuvoton Technology.
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <clk-uclass.h>
> +#include <asm/types.h>
> +#include <asm/arch/clock.h>

Please add this include file in this patch.

> +#include <asm/io.h>
> +#include <linux/delay.h>
> +#include <dt-bindings/clock/npcm845-clock.h>

Please order these correctly. See https://www.denx.de/wiki/U-Boot/CodingStyle#Include_files

> +
> +struct npcm_clk_priv {
> +	struct clk_ctl *regs;
> +};
> +
> +enum regss {

perhaps "pll_id" or similar?

> +	PLL_0,
> +	PLL_1,
> +	PLL_2,
> +	PLL_CLKREF,
> +};
> +
> +static u32 clk_get_pll_freq(struct clk_ctl *regs, enum regss pll)
> +{
> +	u32 pllval;
> +	u32 fin = EXT_CLOCK_FREQUENCY_KHZ; /* 25KHz */

Please get this from the device tree.

> +	u32 fout, nr, nf, no;
> +
> +	switch (pll) {
> +	case PLL_0:
> +		pllval = readl(&regs->pllcon0);
> +		break;
> +	case PLL_1:
> +		pllval = readl(&regs->pllcon1);
> +		break;
> +	case PLL_2:
> +		pllval = readl(&regs->pllcon2);
> +		break;
> +	case PLL_CLKREF:

This is not used.

> +	default:
> +		return 0;
> +	}
> +
> +	/* PLL Input Clock Divider */
> +	nr = (pllval >> PLLCON_INDV) & 0x1f;

With

	#define PLLCON_INDV GENMASK(6, 0)

you can do

	nr = FIELD_GET(PLLCON_INDV, pllval);

This applies to all your other register accesses.

> +	/* PLL VCO Output Clock Feedback Divider */
> +	nf = (pllval >> PLLCON_FBDV) & 0xfff;
> +	/* PLL Output Clock Divider 1 */
> +	no = ((pllval >> PLLCON_OTDV1) & 0x7) *
> +		((pllval >> PLLCON_OTDV2) & 0x7);
> +
> +	fout = ((10 * fin * nf) / (no * nr));

Can this overflow? Can you add a comment about that?

> +
> +	return fout * 100;

Where do these 10 and 100 factors come from? Please combine them.

> +}
> +
> +static u32 npcm_mmc_set_rate(struct clk_ctl *regs, ulong rate)
> +{
> +	u32 pll0_freq, div, sdhci_clk;
> +
> +	/* To acquire PLL0 frequency. */
> +	pll0_freq = clk_get_pll_freq(regs, PLL_0);
> +
> +	/* Calculate rounded up div to produce closest to
> +	 * target output clock
> +	 */
> +	div = (pll0_freq % rate == 0) ? (pll0_freq / rate) :
> +					(pll0_freq / rate) + 1;

div = DIV_ROUND_UP(pll0_freq, rate);

> +
> +	writel((readl(&regs->clkdiv1) & ~(0x1f << CLKDIV1_MMCCKDIV))
> +	       | (div - 1) << CLKDIV1_MMCCKDIV, &regs->clkdiv1);

example of FIELD_PREP:

	clkdiv1 = readl(&regs->clkdiv1);
	clkdiv1 &= ~CLKDIV1_MMCCKDIV;
	clkdiv1 |= FIELD_PREP(CLKDIV1_MMCCKDIV, div - 1);
	writel(clkdiv1, &regs->clkdiv1);

You don't have to break out each line, but please apply this to your
register writes.

> +
> +	/* Wait to the div to stabilize */
> +	udelay(100);
> +
> +	/* Select PLL0 as source */
> +	writel((readl(&regs->clksel) & ~(0x3 << CLKSEL_SDCKSEL))
> +		| (CLKSEL_SDCKSEL_PLL0 << CLKSEL_SDCKSEL),
> +		&regs->clksel);
> +
> +	sdhci_clk = pll0_freq / div;
> +
> +	return sdhci_clk;
> +}
> +
> +static u32 npcm_uart_set_rate(struct clk_ctl *regs, ulong rate)
> +{
> +	u32 src_freq, div;
> +
> +	src_freq = clk_get_pll_freq(regs, PLL_2) / 2;
> +	div = (src_freq % rate == 0) ? (src_freq / rate) :
> +					(src_freq / rate) + 1;
> +	writel((readl(&regs->clkdiv1) & ~(0x1f << CLKDIV1_UARTDIV))
> +		| (div - 1) << CLKDIV1_UARTDIV, &regs->clkdiv1);
> +	writel((readl(&regs->clksel) & ~(3 << CLKSEL_UARTCKSEL))
> +		| (CLKSEL_UARTCKSEL_PLL2 << CLKSEL_UARTCKSEL),
> +		&regs->clksel);
> +
> +	return (src_freq / div);
> +}
> +
> +static ulong npcm_get_cpu_freq(struct clk_ctl *regs)
> +{
> +	ulong fout = 0;
> +	u32 clksel = readl(&regs->clksel) & (0x3 << CLKSEL_CPUCKSEL);
> +
> +	if (clksel == CLKSEL_CPUCKSEL_PLL0)

Use a switch here.

> +		fout = (ulong)clk_get_pll_freq(regs, PLL_0);
> +	else if (clksel == CLKSEL_CPUCKSEL_PLL1)
> +		fout = (ulong)clk_get_pll_freq(regs, PLL_1);
> +	else if (clksel == CLKSEL_CPUCKSEL_CLKREF)
> +		fout = EXT_CLOCK_FREQUENCY_MHZ; /* FOUT is specified in MHz */
> +	else
> +		fout = EXT_CLOCK_FREQUENCY_MHZ; /* FOUT is specified in MHz */
> +
> +	return fout;
> +}
> +
> +static u32 npcm_get_apb_divisor(struct clk_ctl *regs, u32 apb)
> +{
> +	u32 apb_divisor = 2;

Just inline this. E.g.

	return 2 << ...;

> +
> +	/* AHBn div */
> +	apb_divisor = apb_divisor * (1 << ((readl(&regs->clkdiv1)
> +						>> CLKDIV1_CLK4DIV) & 0x3));
> +
> +	switch (apb) {
> +	case APB2: /* APB divisor */
> +		apb_divisor = apb_divisor *
> +				(1 << ((readl(&regs->clkdiv2)
> +					>> CLKDIV2_APB2CKDIV) & 0x3));
> +		break;
> +	case APB5: /* APB divisor */
> +		apb_divisor = apb_divisor *
> +				(1 << ((readl(&regs->clkdiv2)
> +					>> CLKDIV2_APB5CKDIV) & 0x3));
> +		break;
> +	default:
> +		apb_divisor = 0xFFFFFFFF;

Isn't getting here a bug?

> +		break;
> +	}
> +
> +	return apb_divisor;
> +}
> +
> +static ulong npcm_clk_get_rate(struct clk *clk)
> +{
> +	struct npcm_clk_priv *priv = dev_get_priv(clk->dev);
> +
> +	switch (clk->id) {
> +	case CLK_APB2:
> +		return npcm_get_cpu_freq(priv->regs) /
> +			npcm_get_apb_divisor(priv->regs, APB2);
> +	case CLK_APB5:
> +		return npcm_get_cpu_freq(priv->regs) /
> +			npcm_get_apb_divisor(priv->regs, APB5);

I think you can use a more modular approach here:

	struct clk parent;
	
	switch (clk->id) {
	case CLK_APB2:
		parent.id = CLK_AHB;
		ret = clk_request(clk->dev, &parent);
		if (ret)
			return ret;
		
		fin = clk_get_rate(&parent);
		if (IS_ERR_VALUE(fin))
			return fin;

		return fin / FIELD_GET(CLKDIV2_APB2CKDIV, readl(&regs->clkdiv2));
	}

And of course you can go further and create some arrays to hold those
parameters if you like.

This switch statement should also return -ENOSYS in the default case.

> +	}
> +
> +	return 0;
> +}
> +
> +static ulong npcm_clk_set_rate(struct clk *clk, ulong rate)
> +{
> +	struct npcm_clk_priv *priv = dev_get_priv(clk->dev);
> +
> +	switch (clk->id) {
> +	case CLK_EMMC:
> +		return npcm_mmc_set_rate(priv->regs, rate);
> +
> +	case CLK_UART:
> +		return npcm_uart_set_rate(priv->regs, rate);
> +	default:
> +		return -ENOENT;

-ENOSYS

> +	}
> +
> +	return 0;
> +}
> +
> +static int npcm_clk_probe(struct udevice *dev)
> +{
> +	struct npcm_clk_priv *priv = dev_get_priv(dev);
> +	void *base;
> +
> +	base = dev_read_addr_ptr(dev);
> +	if (!base)
> +		return -ENOENT;
> +
> +	priv->regs = (struct clk_ctl *)base;

You can directly assign to regs. And there is no need to cast here,
since base is a void pointer.

> +
> +	return 0;
> +}
> +
> +static struct clk_ops npcm_clk_ops = {
> +	.get_rate = npcm_clk_get_rate,
> +	.set_rate = npcm_clk_set_rate,

Please add a .request callback which enforces the max clock id.

--Sean

> +};
> +
> +static const struct udevice_id npcm_clk_ids[] = {
> +	{ .compatible = "nuvoton,npcm845-clock" },
> +	{ }
> +};
> +
> +U_BOOT_DRIVER(clk_npcm) = {
> +	.name           = "clk_npcm",
> +	.id             = UCLASS_CLK,
> +	.of_match       = npcm_clk_ids,
> +	.ops            = &npcm_clk_ops,
> +	.priv_auto	= sizeof(struct npcm_clk_priv),
> +	.probe          = npcm_clk_probe,
> +};
> diff --git a/include/dt-bindings/clock/npcm845-clock.h b/include/dt-bindings/clock/npcm845-clock.h
> new file mode 100644
> index 0000000000..fca10d39c8
> --- /dev/null
> +++ b/include/dt-bindings/clock/npcm845-clock.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _DT_BINDINGS_NPCM845_CLOCK_H_
> +#define _DT_BINDINGS_NPCM845_CLOCK_H_
> +
> +#define CLK_TIMER	    0
> +#define CLK_UART	    1
> +#define CLK_SD		    2
> +#define CLK_EMMC	    3
> +#define CLK_APB1	    4
> +#define CLK_APB2	    5
> +#define CLK_APB3	    6
> +#define CLK_APB4	    7
> +#define CLK_APB5	    8
> +#define CLK_AHB		    9
> +
> +#endif
> 

