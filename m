Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9666C21EE
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 20:51:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgQNC2sbkz3cQl
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 06:51:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=js9pUDIS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=js9pUDIS;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgQMd3Kfwz3cKj
	for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 06:50:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E160617B5;
	Mon, 20 Mar 2023 19:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72937C433EF;
	Mon, 20 Mar 2023 19:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679341850;
	bh=VD5TRZZRaexzJ2W5HrqpTQ+oq8DTCJBVLAWbveaqmt8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=js9pUDIS/Af0joB+Vco9V2asSvobONowoLqaOp59vtwnfLzyaTObuPlmvWDaQWxia
	 jewH2U6UnwvAjoNZr1FAVTXok95MDWhsk9EzeBbiEBOPIMrGhljyPjOWOIHdxeyE7T
	 cvYlPi5plQ8qkBZ9RUwIAMW5hPEMRhDsi84Gt3h2APO98ipRJS89C6iNqqp0VyFtqQ
	 727hA+lw6pZgqw/kOoCcEOC/LeM7jpSbu2TcUNtLuTnExuVWS15Ybn/J4Em5d2C/7o
	 vmWBHsjezyymk3Q6601/2ffDDlcbh19vGk91JoXs3MMcPHNr2JBCZnr3qhEXtx2axN
	 f/xtWBkOWjEmw==
Message-ID: <495fcc93ab28ff8949569ededee954c1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230309194402.119562-2-tmaimon77@gmail.com>
References: <20230309194402.119562-1-tmaimon77@gmail.com> <20230309194402.119562-2-tmaimon77@gmail.com>
Subject: Re: [PATCH v15 1/1] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com, benjaminfair@google.com, joel@jms.id.au, mturquette@baylibre.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Mon, 20 Mar 2023 12:50:48 -0700
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
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2023-03-09 11:44:02)
> diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> new file mode 100644
> index 000000000000..67058f121251
> --- /dev/null
> +++ b/drivers/clk/clk-npcm8xx.c
> @@ -0,0 +1,561 @@
[...]
> +
> +struct npcm8xx_pll_data {
> +       const char *name;
> +       struct clk_parent_data parent;
> +       unsigned int reg;
> +       unsigned long flags;
> +};
> +
> +struct npcm8xx_clk_div_data {
> +       u32 reg;
> +       u8 shift;
> +       u8 width;
> +       const char *name;
> +       const struct clk_parent_data parent_data;
> +       u8 clk_divider_flags;
> +       unsigned long flags;
> +       int onecell_idx;
> +};
> +
> +struct npcm8xx_clk_mux_data {
> +       u8 shift;
> +       u32 mask;
> +       const u32 *table;
> +       const char *name;
> +       const struct clk_parent_data *parent_data;
> +       u8 num_parents;
> +       unsigned long flags;
> +};
> +
[...]
> +
> +static struct npcm8xx_pll_data npcm8xx_pll_clks[] =3D {

Can this be const?

> +       { NPCM8XX_CLK_S_PLL0, { .name =3D NPCM8XX_CLK_S_REFCLK }, NPCM8XX=
_PLLCON0, 0 },
> +       { NPCM8XX_CLK_S_PLL1, { .name =3D NPCM8XX_CLK_S_REFCLK }, NPCM8XX=
_PLLCON1, 0 },
> +       { NPCM8XX_CLK_S_PLL2, { .name =3D NPCM8XX_CLK_S_REFCLK }, NPCM8XX=
_PLLCON2, 0 },
> +       { NPCM8XX_CLK_S_PLL_GFX, { .name =3D NPCM8XX_CLK_S_REFCLK }, NPCM=
8XX_PLLCONG, 0 },
> +};
> +
> +static const u32 cpuck_mux_table[] =3D { 0, 1, 2, 7 };
> +static const struct clk_parent_data cpuck_mux_parents[] =3D {
> +       { .fw_name =3D NPCM8XX_CLK_S_PLL0, .name =3D NPCM8XX_CLK_S_PLL0 },

You should only have .fw_name or .index when introducing new drivers.
The .name field is for existing drivers that want to migrate to
clk_parent_data.

> +       { .fw_name =3D NPCM8XX_CLK_S_PLL1, .name =3D NPCM8XX_CLK_S_PLL1 },
> +       { .name =3D NPCM8XX_CLK_S_REFCLK },

Note, this line says to use '.index =3D 0', and .name will be ignored.
Maybe just use the index for everything? That makes it simpler and
potentially faster because we don't have to do string comparisons
anywhere.

> +       { .fw_name =3D NPCM8XX_CLK_S_PLL2, .name =3D NPCM8XX_CLK_S_PLL2 }
> +};
> +
> +static const u32 pixcksel_mux_table[] =3D { 0, 2 };
> +static const struct clk_parent_data pixcksel_mux_parents[] =3D {
> +       { .fw_name =3D NPCM8XX_CLK_S_PLL_GFX, .name =3D NPCM8XX_CLK_S_PLL=
_GFX },
> +       { .name =3D NPCM8XX_CLK_S_REFCLK }
> +};
> +
[...]
> +
> +static unsigned long npcm8xx_clk_pll_recalc_rate(struct clk_hw *hw,
> +                                                unsigned long parent_rat=
e)
> +{
> +       struct npcm8xx_clk_pll *pll =3D to_npcm8xx_clk_pll(hw);
> +       unsigned long fbdv, indv, otdv1, otdv2;
> +       unsigned int val;
> +       u64 ret;
> +
> +       if (parent_rate =3D=3D 0) {
> +               pr_debug("%s: parent rate is zero\n", __func__);
> +               return 0;
> +       }
> +
> +       val =3D readl_relaxed(pll->pllcon + pll->reg);

Is pll->reg ever set?

> +
> +       indv =3D FIELD_GET(PLLCON_INDV, val);
> +       fbdv =3D FIELD_GET(PLLCON_FBDV, val);
> +       otdv1 =3D FIELD_GET(PLLCON_OTDV1, val);
> +       otdv2 =3D FIELD_GET(PLLCON_OTDV2, val);
> +
> +       ret =3D (u64)parent_rate * fbdv;
> +       do_div(ret, indv * otdv1 * otdv2);
> +
> +       return ret;
> +}
> +
> +static const struct clk_ops npcm8xx_clk_pll_ops =3D {
> +       .recalc_rate =3D npcm8xx_clk_pll_recalc_rate,
> +};
> +
> +static struct clk_hw *
> +npcm8xx_clk_register_pll(struct device *dev, void __iomem *pllcon,
> +                        const char *name, const struct clk_parent_data *=
parent,
> +                        unsigned long flags)
> +{
> +       struct npcm8xx_clk_pll *pll;
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> +       if (!pll)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name =3D name;
> +       init.ops =3D &npcm8xx_clk_pll_ops;
> +       init.parent_data =3D parent;
> +       init.num_parents =3D 1;
> +       init.flags =3D flags;
> +
> +       pll->pllcon =3D pllcon;
> +       pll->hw.init =3D &init;
> +
> +       ret =3D devm_clk_hw_register(dev, &pll->hw);
> +       if (ret) {
> +               kfree(pll);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return &pll->hw;
> +}
> +
> +static DEFINE_SPINLOCK(npcm8xx_clk_lock);
> +
> +static int npcm8xx_clk_probe(struct platform_device *pdev)
> +{
> +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> +       struct device *dev =3D &pdev->dev;
> +       void __iomem *clk_base;
> +       struct resource *res;
> +       struct clk_hw *hw;
> +       unsigned int i;
> +       int err;
> +
> +       npcm8xx_clk_data =3D devm_kzalloc(dev, struct_size(npcm8xx_clk_da=
ta, hws,
> +                                                        NPCM8XX_NUM_CLOC=
KS),
> +                                       GFP_KERNEL);
> +       if (!npcm8xx_clk_data)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       clk_base =3D devm_ioremap(dev, res->start, resource_size(res));

Can you use devm_platform_ioremap_resource() instead?

> +       if (!clk_base) {

Then this is checked for error pointer.

> +               dev_err(&pdev->dev, "Failed to remap I/O memory\n");

And no error message.

> +               return -ENOMEM;
> +       }
> +
> +       npcm8xx_clk_data->num =3D NPCM8XX_NUM_CLOCKS;
> +
[....]
> +       if (IS_ERR(hw)) {
> +               dev_err(dev, "npcm8xx_clk: Can't register axi div2\n");
> +               return PTR_ERR(hw);
> +       }
> +       npcm8xx_clk_data->hws[NPCM8XX_CLK_AXI] =3D hw;
> +
> +       hw =3D devm_clk_hw_register_fixed_factor(dev, NPCM8XX_CLK_S_ATB,
> +                                              NPCM8XX_CLK_S_AXI, 0, 1, 2=
);
> +       if (IS_ERR(hw)) {
> +               dev_err(dev, "npcm8xx_clk: Can't register atb div2\n");
> +               return PTR_ERR(hw);
> +       }
> +       npcm8xx_clk_data->hws[NPCM8XX_CLK_ATB] =3D hw;
> +
> +       /* Register clock dividers specified in npcm8xx_divs */
> +       for (i =3D 0; i < ARRAY_SIZE(npcm8xx_divs); i++) {
> +               const struct npcm8xx_clk_div_data *div_data =3D &npcm8xx_=
divs[i];
> +
> +               hw =3D clk_hw_register_divider_parent_data(dev, div_data-=
>name,

Do we have a devm_ variant of this function? If not, can you add it?

> +                                                        &div_data->paren=
t_data,
> +                                                        div_data->flags,
