Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDD06D278C
	for <lists+openbmc@lfdr.de>; Fri, 31 Mar 2023 20:08:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp7Yy6Lrfz3fTb
	for <lists+openbmc@lfdr.de>; Sat,  1 Apr 2023 05:08:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UBIDq+EW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UBIDq+EW;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp7YN5tXlz3fQp
	for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2023 05:07:35 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx10so5616653ljb.8
        for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2023 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680286051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ii8LD6WV3C4Mz3PNT9z7qUlfncWckLBytbPn5yKSnc=;
        b=UBIDq+EWVVrV/nFkG74e6Ck3KsIBeFYPLC7Xt2wx83p6yLICE4/wZmSiWaTvztxI8v
         CV1Dv9YQFFyKTlwnfasNaspTw7NfJz+SBro6PXjhY3wx9ZM3A1AsbK4FqwAFir9NMjc8
         9UXZNt3ipnWeBi5Dui/8fZS8cHHLaZ+P50TBFZK528A9gZd16gpis7aplDKLJx7+shDJ
         wtXqoL2A0L8n13TIlX9QA/p4RLyy3eRi+73eoRJkv8TW9sLF9cOGV/szXVXj/gU6Heu8
         BwMPQA4OPbakFlcV9Om+ysvLY/l3ncY3AgavC7TjuIlYApks3KdnfFkSQmvi2dqpjk1+
         Wnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680286051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ii8LD6WV3C4Mz3PNT9z7qUlfncWckLBytbPn5yKSnc=;
        b=G6D2XUyCChY+6B4xtezc8a/9vovyqqgwTLpTUj/p5bPr5MT0n9TtxF2Y1wO9CQYFEx
         2yJxfEV9aoQO/WDhgNNZR8MA7LOfGPbvmrWvNXJcdwnL9ez4ePiKswrhsgP4b54aqll3
         MjcmwR0qiyT2+NnfoyQGZlsbxSfBTbqtOSo73zsY2GdrOobb6fUyxfzG4MEjLTf9yXx2
         2d6ja4Z1nk9qgsKLpCU9ONlWq5p+VczRjLNzvQSNwsRfs+RqhNUWo/I/jbWo+DltOS6G
         ze4bxYvUf4V16QD4VTB9KFixulZjIMXvBG9SXUSyp0GjxkaOAoz8uQPD+tZdpXZ5FN6p
         XqFw==
X-Gm-Message-State: AAQBX9f2q/7ukYeyacpNHUTUrCkm+VYQqphTUaulu1RqNEi4WMh8E0b/
	7b9tq7+9Gq0Bxg8RuidKH0485muPJjOrbVIjT/c=
X-Google-Smtp-Source: AKy350aJZ07tOb0BEmK67XU1aSTjWS5ZWGMRUNpAkCOO67wCOY4oPZGH0a+FVKSihdSNPSHW7CcfwJie1AFAbCCto40=
X-Received: by 2002:a05:651c:108:b0:29a:9053:ed24 with SMTP id
 a8-20020a05651c010800b0029a9053ed24mr8730992ljb.6.1680286050817; Fri, 31 Mar
 2023 11:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230309194402.119562-1-tmaimon77@gmail.com> <20230309194402.119562-2-tmaimon77@gmail.com>
 <495fcc93ab28ff8949569ededee954c1.sboyd@kernel.org>
In-Reply-To: <495fcc93ab28ff8949569ededee954c1.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 31 Mar 2023 21:07:19 +0300
Message-ID: <CAP6Zq1hOHJWQSmGoVDz5bSjwdhNyQmaZVOEE8_dX6S4HCFQ2Jg@mail.gmail.com>
Subject: Re: [PATCH v15 1/1] clk: npcm8xx: add clock controller
To: Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

HI Stephen,

Thanks for your comments

On Mon, 20 Mar 2023 at 21:50, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2023-03-09 11:44:02)
> > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > new file mode 100644
> > index 000000000000..67058f121251
> > --- /dev/null
> > +++ b/drivers/clk/clk-npcm8xx.c
> > @@ -0,0 +1,561 @@
> [...]
> > +
> > +struct npcm8xx_pll_data {
> > +       const char *name;
> > +       struct clk_parent_data parent;
> > +       unsigned int reg;
> > +       unsigned long flags;
> > +};
> > +
> > +struct npcm8xx_clk_div_data {
> > +       u32 reg;
> > +       u8 shift;
> > +       u8 width;
> > +       const char *name;
> > +       const struct clk_parent_data parent_data;
> > +       u8 clk_divider_flags;
> > +       unsigned long flags;
> > +       int onecell_idx;
> > +};
> > +
> > +struct npcm8xx_clk_mux_data {
> > +       u8 shift;
> > +       u32 mask;
> > +       const u32 *table;
> > +       const char *name;
> > +       const struct clk_parent_data *parent_data;
> > +       u8 num_parents;
> > +       unsigned long flags;
> > +};
> > +
> [...]
> > +
> > +static struct npcm8xx_pll_data npcm8xx_pll_clks[] = {
>
> Can this be const?
Will add
>
> > +       { NPCM8XX_CLK_S_PLL0, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON0, 0 },
> > +       { NPCM8XX_CLK_S_PLL1, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON1, 0 },
> > +       { NPCM8XX_CLK_S_PLL2, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON2, 0 },
> > +       { NPCM8XX_CLK_S_PLL_GFX, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCONG, 0 },
> > +};
> > +
> > +static const u32 cpuck_mux_table[] = { 0, 1, 2, 7 };
> > +static const struct clk_parent_data cpuck_mux_parents[] = {
> > +       { .fw_name = NPCM8XX_CLK_S_PLL0, .name = NPCM8XX_CLK_S_PLL0 },
>
> You should only have .fw_name or .index when introducing new drivers.
> The .name field is for existing drivers that want to migrate to
> clk_parent_data.
I thought using .name was done when the clock defines in the DT, like
the ref clock.
If the other clocks are not defined both .fw_name and .name the clocks
are not registered properly.
>
> > +       { .fw_name = NPCM8XX_CLK_S_PLL1, .name = NPCM8XX_CLK_S_PLL1 },
> > +       { .name = NPCM8XX_CLK_S_REFCLK },
>
> Note, this line says to use '.index = 0', and .name will be ignored.
> Maybe just use the index for everything? That makes it simpler and
> potentially faster because we don't have to do string comparisons
> anywhere.
Should the clk_parent_data mux use only .index? if yes how should the
clock tree have a connection between the parent's clock and the mux
for example:
for example, how should the driver connect between
NPCM8XX_CLK_S_PLL1_DIV2 and the index number in the clk_parent_data?
>
> > +       { .fw_name = NPCM8XX_CLK_S_PLL2, .name = NPCM8XX_CLK_S_PLL2 }
> > +};
> > +
> > +static const u32 pixcksel_mux_table[] = { 0, 2 };
> > +static const struct clk_parent_data pixcksel_mux_parents[] = {
> > +       { .fw_name = NPCM8XX_CLK_S_PLL_GFX, .name = NPCM8XX_CLK_S_PLL_GFX },
> > +       { .name = NPCM8XX_CLK_S_REFCLK }
> > +};
> > +
> [...]
> > +
> > +static unsigned long npcm8xx_clk_pll_recalc_rate(struct clk_hw *hw,
> > +                                                unsigned long parent_rate)
> > +{
> > +       struct npcm8xx_clk_pll *pll = to_npcm8xx_clk_pll(hw);
> > +       unsigned long fbdv, indv, otdv1, otdv2;
> > +       unsigned int val;
> > +       u64 ret;
> > +
> > +       if (parent_rate == 0) {
> > +               pr_debug("%s: parent rate is zero\n", __func__);
> > +               return 0;
> > +       }
> > +
> > +       val = readl_relaxed(pll->pllcon + pll->reg);
>
> Is pll->reg ever set?
Will remove.
>
> > +
> > +       indv = FIELD_GET(PLLCON_INDV, val);
> > +       fbdv = FIELD_GET(PLLCON_FBDV, val);
> > +       otdv1 = FIELD_GET(PLLCON_OTDV1, val);
> > +       otdv2 = FIELD_GET(PLLCON_OTDV2, val);
> > +
> > +       ret = (u64)parent_rate * fbdv;
> > +       do_div(ret, indv * otdv1 * otdv2);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct clk_ops npcm8xx_clk_pll_ops = {
> > +       .recalc_rate = npcm8xx_clk_pll_recalc_rate,
> > +};
> > +
> > +static struct clk_hw *
> > +npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
> > +                        const char *name, const struct clk_parent_data *parent,
> > +                        unsigned long flags)
> > +{
> > +       struct npcm8xx_clk_pll *pll;
> > +       struct clk_init_data init = {};
> > +       int ret;
> > +
> > +       pll = kzalloc(sizeof(*pll), GFP_KERNEL);
> > +       if (!pll)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       init.name = name;
> > +       init.ops = &npcm8xx_clk_pll_ops;
> > +       init.parent_data = parent;
> > +       init.num_parents = 1;
> > +       init.flags = flags;
> > +
> > +       pll->pllcon = pllcon;
> > +       pll->hw.init = &init;
> > +
> > +       ret = devm_clk_hw_register(dev, &pll->hw);
> > +       if (ret) {
> > +               kfree(pll);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       return &pll->hw;
> > +}
> > +
> > +static DEFINE_SPINLOCK(npcm8xx_clk_lock);
> > +
> > +static int npcm8xx_clk_probe(struct platform_device *pdev)
> > +{
> > +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> > +       struct device *dev = &pdev->dev;
> > +       void __iomem *clk_base;
> > +       struct resource *res;
> > +       struct clk_hw *hw;
> > +       unsigned int i;
> > +       int err;
> > +
> > +       npcm8xx_clk_data = devm_kzalloc(dev, struct_size(npcm8xx_clk_data, hws,
> > +                                                        NPCM8XX_NUM_CLOCKS),
> > +                                       GFP_KERNEL);
> > +       if (!npcm8xx_clk_data)
> > +               return -ENOMEM;
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       clk_base = devm_ioremap(dev, res->start, resource_size(res));
>
> Can you use devm_platform_ioremap_resource() instead?
We should use devm_ioremap since the clock register is used for the
reset driver as well.
>
> > +       if (!clk_base) {
>
> Then this is checked for error pointer.
>
> > +               dev_err(&pdev->dev, "Failed to remap I/O memory\n");
>
> And no error message.
>
> > +               return -ENOMEM;
> > +       }
> > +
> > +       npcm8xx_clk_data->num = NPCM8XX_NUM_CLOCKS;
> > +
> [....]
> > +       if (IS_ERR(hw)) {
> > +               dev_err(dev, "npcm8xx_clk: Can't register axi div2\n");
> > +               return PTR_ERR(hw);
> > +       }
> > +       npcm8xx_clk_data->hws[NPCM8XX_CLK_AXI] = hw;
> > +
> > +       hw = devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_ATB,
> > +                                              NPCM8XX_CLK_S_AXI, 0, 1, 2);
> > +       if (IS_ERR(hw)) {
> > +               dev_err(dev, "npcm8xx_clk: Can't register atb div2\n");
> > +               return PTR_ERR(hw);
> > +       }
> > +       npcm8xx_clk_data->hws[NPCM8XX_CLK_ATB] = hw;
> > +
> > +       /* Register clock dividers specified in npcm8xx_divs */
> > +       for (i = 0; i < ARRAY_SIZE(npcm8xx_divs); i++) {
> > +               const struct npcm8xx_clk_div_data *div_data = &npcm8xx_divs[i];
> > +
> > +               hw = clk_hw_register_divider_parent_data(dev, div_data->name,
>
> Do we have a devm_ variant of this function? If not, can you add it?
I will try to do it.
>
> > +                                                        &div_data->parent_data,
> > +                                                        div_data->flags,

Thanks,

Tomer
