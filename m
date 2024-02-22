Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C367F85F131
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 06:58:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GWCqeQ9Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgMrm59h4z3dTG
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 16:58:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GWCqeQ9Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgMrG4Lhtz30Pp
	for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2024 16:58:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B39F0CE20AA;
	Thu, 22 Feb 2024 05:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AF1C433F1;
	Thu, 22 Feb 2024 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708581484;
	bh=EofOeYODL7p7e0qVfaAW76kCTVxz6mRFJbAg2DnJq6A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GWCqeQ9ZA1pgle3Iuf7PUTJs1bgjWohQyYsMFUTPzRZGI++viJ1Aw35r3Swl9n+Az
	 JtVUJOUlMh90vDDB6B+KW9HdAKhSBi9LA467AZ1x1obMjVVPe8EB8Ugy8/ctbH0PiE
	 YKEfrSXf+bY9FZ01Zt3dtuOFSdUnnGUb85QVkYrTt2SqTqHwQ9NZ93PpgV4JguFXdX
	 oUYl0IXL74hD0FaDm0cjD1It5FLJi/GBlJHS5jtBgpc+4/qP7sCGaGP2mmmc4809Vn
	 gOTKfzm0o7+x9xGgtt1ywmWS+R32cwBqVvzaxsokYr3b3NWGz40FEhTcdKJOaExXDp
	 7pp+W0XQxTt1A==
Message-ID: <74e003c6d80611ddd826ac21f48b4b3a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240131182653.2673554-4-tmaimon77@gmail.com>
References: <20240131182653.2673554-1-tmaimon77@gmail.com> <20240131182653.2673554-4-tmaimon77@gmail.com>
Subject: Re: [PATCH v23 3/3] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>, benjaminfair@google.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, tali.perry1@gmail.com, venture@google.com, yuenn@google.com
Date: Wed, 21 Feb 2024 21:58:01 -0800
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2024-01-31 10:26:53)
> diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> new file mode 100644
> index 000000000000..eacb579d30af
> --- /dev/null
> +++ b/drivers/clk/clk-npcm8xx.c
> @@ -0,0 +1,509 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NPCM8xx Clock Generator
> + * All the clocks are initialized by the bootloader, so this driver allo=
ws only
[...]
> +
> +/* external clock definition */
> +#define NPCM8XX_CLK_S_REFCLK   "refclk"
> +
> +/* pll definition */
> +#define NPCM8XX_CLK_S_PLL0     "pll0"
> +#define NPCM8XX_CLK_S_PLL1     "pll1"
> +#define NPCM8XX_CLK_S_PLL2     "pll2"
> +#define NPCM8XX_CLK_S_PLL_GFX  "pll_gfx"
> +
> +/* early divider definition */
> +#define NPCM8XX_CLK_S_PLL2_DIV2                "pll2_div2"
> +#define NPCM8XX_CLK_S_PLL_GFX_DIV2     "pll_gfx_div2"
> +#define NPCM8XX_CLK_S_PLL1_DIV2                "pll1_div2"
> +
> +/* mux definition */
> +#define NPCM8XX_CLK_S_CPU_MUX     "cpu_mux"
> +
> +/* div definition */
> +#define NPCM8XX_CLK_S_TH          "th"
> +#define NPCM8XX_CLK_S_AXI         "axi"

Please inline all these string #defines to the place they're used.

> +
> +static struct clk_hw hw_pll1_div2, hw_pll2_div2, hw_gfx_div2, hw_pre_clk;
[..]
> +static struct clk_hw *
> +npcm8xx_clk_register(struct device *dev, const char *name,
> +                    struct regmap *clk_regmap, unsigned int offset,
> +                    unsigned long flags, const struct clk_ops *npcm8xx_c=
lk_ops,
> +                    const struct clk_parent_data *parent_data,
> +                    const struct clk_hw *parent_hw, u8 num_parents,
> +                    u8 shift, u32 mask, unsigned long width,
> +                    const u32 *table, unsigned long clk_flags)
> +{
> +       struct npcm8xx_clk *clk;
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       clk =3D devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +       if (!clk)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name =3D name;
> +       init.ops =3D npcm8xx_clk_ops;
> +       init.parent_data =3D parent_data;
> +       init.parent_hws =3D parent_hw ? &parent_hw : NULL;

Is it necessary to check? Can't it be set unconditionally?

> +       init.num_parents =3D num_parents;
> +       init.flags =3D flags;
> +
> +       clk->clk_regmap =3D clk_regmap;
> +       clk->hw.init =3D &init;
> +       clk->offset =3D offset;
> +       clk->shift =3D shift;
> +       clk->mask =3D mask;
> +       clk->width =3D width;
> +       clk->table =3D table;
> +       clk->flags =3D clk_flags;
> +
> +       ret =3D devm_clk_hw_register(dev, &clk->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &clk->hw;
[...]
> +
> +static unsigned long npcm8xx_clk_div_get_parent(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       struct npcm8xx_clk *div =3D to_npcm8xx_clk(hw);
> +       unsigned int val;
> +
> +       regmap_read(div->clk_regmap, div->offset, &val);
> +       val =3D val >> div->shift;
> +       val &=3D clk_div_mask(div->width);
> +
> +       return divider_recalc_rate(hw, parent_rate, val, NULL, div->flags,
> +                                  div->width);
> +}
> +
> +static const struct clk_ops npcm8xx_clk_div_ops =3D {
> +       .recalc_rate =3D npcm8xx_clk_div_get_parent,
> +};
> +
> +static int npcm8xx_clk_probe(struct platform_device *pdev)
> +{
> +       struct device_node *parent_np =3D of_get_parent(pdev->dev.of_node=
);

The parent of this device is not a syscon.

> +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> +       struct device *dev =3D &pdev->dev;
> +       struct regmap *clk_regmap;
> +       struct clk_hw *hw;
> +       unsigned int i;
> +
> +       npcm8xx_clk_data =3D devm_kzalloc(dev, struct_size(npcm8xx_clk_da=
ta, hws,
> +                                                        NPCM8XX_NUM_CLOC=
KS),
> +                                       GFP_KERNEL);
> +       if (!npcm8xx_clk_data)
> +               return -ENOMEM;
> +
> +       clk_regmap =3D syscon_node_to_regmap(parent_np);
> +       of_node_put(parent_np);

Is there another binding update that is going to move this node to be a
child of the syscon?

		gcr: system-controller@f0800000 {
                        compatible =3D "nuvoton,npcm845-gcr", "syscon";
                        reg =3D <0x0 0xf0800000 0x0 0x1000>;
                };
