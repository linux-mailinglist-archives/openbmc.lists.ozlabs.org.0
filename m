Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A562862C73
	for <lists+openbmc@lfdr.de>; Sun, 25 Feb 2024 19:01:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RMPQl/fm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjWlR2yKDz3cTQ
	for <lists+openbmc@lfdr.de>; Mon, 26 Feb 2024 05:01:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RMPQl/fm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjWkr4RRpz3bl7
	for <openbmc@lists.ozlabs.org>; Mon, 26 Feb 2024 05:00:51 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dcd94fb9e4dso2482937276.2
        for <openbmc@lists.ozlabs.org>; Sun, 25 Feb 2024 10:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708884047; x=1709488847; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v7hj3qPHZDiFNqcyMxHDzUtXEC97xlVmyESxHtz3Chs=;
        b=RMPQl/fmHYgUOyjyHl0DrEGOlPJ1baVSfNNL2gaHSP5/Tgcia0bBUDb4sDzeL+44bY
         ND/0MiD9YFIg4E/aEUO+VOyH5vpKEFdZSRpaOHJEVcKbENOJZcQIztfTTYCoB/R5PqeI
         wucxyEX39BM+mtYfGqZh1m3NPxTJM8doKDEOioiXJto1J3rdsUKCqCrsXjU4IpAysavi
         gtamFLNTBeSfXkZ4YiXt8f5DMDFhGa2jkh+m3FNNgQNaEH6NPoETy1AIjBdwH0lkYW5K
         1hMLMxBYylR4VS0LIQ9NAUrr3XZLHIYwl0XKF7C2NjsYas9bjkO2kuJ4KZm961NGUmez
         erqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708884047; x=1709488847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7hj3qPHZDiFNqcyMxHDzUtXEC97xlVmyESxHtz3Chs=;
        b=usHJRllVFCssozjRo/gVQcxDG6lVTg0lP7hMrQAzmq/APDvBnGmGIEddvy7SquMcIg
         UsGezdcjA1G+wmBaQXT6Q5CBpZO4sjMZjxIgIkzQUcBApv6PQHjARMWZzOSvhPxqMYJe
         CNJHolWMaiD6kAGHLMe0KnUUf504k/aGQDOgYXi/QJp3ICupNHoiYGq/FUECwS/Rxvrm
         boqqdHNU56jGTFCqpbB5op+bu1GE7CY4L96d3mzUeqsBOt5RNg6YCpYC3LPUoQ9smwxZ
         Eg6mMreRaFLFA3/cIdeLnvPdOLxRXolK2GFxcdHUdtu6LIhgxg2NGCdfStbmRhgMA5cQ
         mb8A==
X-Forwarded-Encrypted: i=1; AJvYcCW2RQ90yeaKpvtlWWv7Z7lP5Ik/IYqp3z0IGzTUQOMn47HOWhHIJDW0sMnRUS+oqOahsYr0Vb5FSU9qnjrJZWThi+RjWATiAy4=
X-Gm-Message-State: AOJu0YxvaRsi5Ry77Hour3xC6m/cL4gRATcmVjn5CLfWyhzDQ8F11/rV
	wL2owAsoZ+rwWrrZ7tATV1kwEH9p2Jv+QCO5Iq9cxmhWbxDeP8APBZCXhZo+BbRtkE+58nm16Cb
	2Jr9+/2vd675idrBpTq41jtC/g/4=
X-Google-Smtp-Source: AGHT+IF4EvwHUZxVL9CRSsQW/MThQust/DkQXRqtjG4TICjIiIZP4vpENrHjQNHjq734sFRem08C/FQu+uxH2rgBN5M=
X-Received: by 2002:a25:e0d6:0:b0:dc7:4067:9f85 with SMTP id
 x205-20020a25e0d6000000b00dc740679f85mr3160931ybg.58.1708884046001; Sun, 25
 Feb 2024 10:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20240131182653.2673554-1-tmaimon77@gmail.com> <20240131182653.2673554-4-tmaimon77@gmail.com>
 <74e003c6d80611ddd826ac21f48b4b3a.sboyd@kernel.org>
In-Reply-To: <74e003c6d80611ddd826ac21f48b4b3a.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 25 Feb 2024 20:00:35 +0200
Message-ID: <CAP6Zq1g5gwXvYzO5fnHxG-6__gSCpNBY7VeEPyr4Qtijya6EfQ@mail.gmail.com>
Subject: Re: [PATCH v23 3/3] clk: npcm8xx: add clock controller
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stephen,

On Thu, 22 Feb 2024 at 07:58, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2024-01-31 10:26:53)
> > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > new file mode 100644
> > index 000000000000..eacb579d30af
> > --- /dev/null
> > +++ b/drivers/clk/clk-npcm8xx.c
> > @@ -0,0 +1,509 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NPCM8xx Clock Generator
> > + * All the clocks are initialized by the bootloader, so this driver allows only
> [...]
> > +
> > +/* external clock definition */
> > +#define NPCM8XX_CLK_S_REFCLK   "refclk"
> > +
> > +/* pll definition */
> > +#define NPCM8XX_CLK_S_PLL0     "pll0"
> > +#define NPCM8XX_CLK_S_PLL1     "pll1"
> > +#define NPCM8XX_CLK_S_PLL2     "pll2"
> > +#define NPCM8XX_CLK_S_PLL_GFX  "pll_gfx"
> > +
> > +/* early divider definition */
> > +#define NPCM8XX_CLK_S_PLL2_DIV2                "pll2_div2"
> > +#define NPCM8XX_CLK_S_PLL_GFX_DIV2     "pll_gfx_div2"
> > +#define NPCM8XX_CLK_S_PLL1_DIV2                "pll1_div2"
> > +
> > +/* mux definition */
> > +#define NPCM8XX_CLK_S_CPU_MUX     "cpu_mux"
> > +
> > +/* div definition */
> > +#define NPCM8XX_CLK_S_TH          "th"
> > +#define NPCM8XX_CLK_S_AXI         "axi"
>
> Please inline all these string #defines to the place they're used.
The version V21 you mention using define only when the definition is
used more than once
https://www.spinics.net/lists/kernel/msg5045826.html
Should I remove all the string definitions and add the string to the array?
>
> > +
> > +static struct clk_hw hw_pll1_div2, hw_pll2_div2, hw_gfx_div2, hw_pre_clk;
> [..]
> > +static struct clk_hw *
> > +npcm8xx_clk_register(struct device *dev, const char *name,
> > +                    struct regmap *clk_regmap, unsigned int offset,
> > +                    unsigned long flags, const struct clk_ops *npcm8xx_clk_ops,
> > +                    const struct clk_parent_data *parent_data,
> > +                    const struct clk_hw *parent_hw, u8 num_parents,
> > +                    u8 shift, u32 mask, unsigned long width,
> > +                    const u32 *table, unsigned long clk_flags)
> > +{
> > +       struct npcm8xx_clk *clk;
> > +       struct clk_init_data init = {};
> > +       int ret;
> > +
> > +       clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> > +       if (!clk)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       init.name = name;
> > +       init.ops = npcm8xx_clk_ops;
> > +       init.parent_data = parent_data;
> > +       init.parent_hws = parent_hw ? &parent_hw : NULL;
>
> Is it necessary to check? Can't it be set unconditionally?
Will remove
>
> > +       init.num_parents = num_parents;
> > +       init.flags = flags;
> > +
> > +       clk->clk_regmap = clk_regmap;
> > +       clk->hw.init = &init;
> > +       clk->offset = offset;
> > +       clk->shift = shift;
> > +       clk->mask = mask;
> > +       clk->width = width;
> > +       clk->table = table;
> > +       clk->flags = clk_flags;
> > +
> > +       ret = devm_clk_hw_register(dev, &clk->hw);
> > +       if (ret)
> > +               return ERR_PTR(ret);
> > +
> > +       return &clk->hw;
> [...]
> > +
> > +static unsigned long npcm8xx_clk_div_get_parent(struct clk_hw *hw,
> > +                                               unsigned long parent_rate)
> > +{
> > +       struct npcm8xx_clk *div = to_npcm8xx_clk(hw);
> > +       unsigned int val;
> > +
> > +       regmap_read(div->clk_regmap, div->offset, &val);
> > +       val = val >> div->shift;
> > +       val &= clk_div_mask(div->width);
> > +
> > +       return divider_recalc_rate(hw, parent_rate, val, NULL, div->flags,
> > +                                  div->width);
> > +}
> > +
> > +static const struct clk_ops npcm8xx_clk_div_ops = {
> > +       .recalc_rate = npcm8xx_clk_div_get_parent,
> > +};
> > +
> > +static int npcm8xx_clk_probe(struct platform_device *pdev)
> > +{
> > +       struct device_node *parent_np = of_get_parent(pdev->dev.of_node);
>
> The parent of this device is not a syscon.
Once I have registered the map that handles both reset and the clock
in general is syscon, this is why we will modify the DTS so the clock
and the reset will be under syscon father node
                sysctrl: system-controller@f0801000 {
                        compatible = "syscon", "simple-mfd";
                        reg = <0x0 0xf0801000 0x0 0x1000>;

                        rstc: reset-controller {
                                compatible = "nuvoton,npcm845-reset";
                                reg = <0x0 0xf0801000 0x0 0xC4>;
                                #reset-cells = <2>;
                                nuvoton,sysgcr = <&gcr>;
                        };

                        clk: clock-controller {
                                compatible = "nuvoton,npcm845-clk";
                                #clock-cells = <1>;
                                clocks = <&refclk>;
                                clock-names = "refclk";
                        };
                };
You can see other drivers that using the same method like
https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/devicetree/bindings/clock/socionext,uniphier-clock.yaml
>
> > +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> > +       struct device *dev = &pdev->dev;
> > +       struct regmap *clk_regmap;
> > +       struct clk_hw *hw;
> > +       unsigned int i;
> > +
> > +       npcm8xx_clk_data = devm_kzalloc(dev, struct_size(npcm8xx_clk_data, hws,
> > +                                                        NPCM8XX_NUM_CLOCKS),
> > +                                       GFP_KERNEL);
> > +       if (!npcm8xx_clk_data)
> > +               return -ENOMEM;
> > +
> > +       clk_regmap = syscon_node_to_regmap(parent_np);
> > +       of_node_put(parent_np);
>
> Is there another binding update that is going to move this node to be a
> child of the syscon?
>
>                 gcr: system-controller@f0800000 {
>                         compatible = "nuvoton,npcm845-gcr", "syscon";
>                         reg = <0x0 0xf0800000 0x0 0x1000>;
>                 };
No, sorry but I'm not going to use the GCR node the handle the clock
and reset modules, the GCR has different memory space.
the clock driver will have the following device tree
               sysctrl: system-controller@f0801000 {
                        compatible = "syscon", "simple-mfd";
                        reg = <0x0 0xf0801000 0x0 0x1000>;

                        rstc: reset-controller {
                                compatible = "nuvoton,npcm845-reset";
                                reg = <0x0 0xf0801000 0x0 0xC4>;
                                #reset-cells = <2>;
                                nuvoton,sysgcr = <&gcr>;
                        };

                        clk: clock-controller {
                                compatible = "nuvoton,npcm845-clk";
                                #clock-cells = <1>;
                                clocks = <&refclk>;
                                clock-names = "refclk";
                        };
                };

Stephen appreciate it if you could speed this upstream and apply it in
this kernel version.
hope the clarification is understood and if it is fine I can send V24 this week.

Thanks,

Tomer
