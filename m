Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66431895CF5
	for <lists+openbmc@lfdr.de>; Tue,  2 Apr 2024 21:43:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g5Hs740K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8JGR1CyKz3dhY
	for <lists+openbmc@lfdr.de>; Wed,  3 Apr 2024 06:43:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g5Hs740K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8JFq07PPz3d2n
	for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2024 06:43:09 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6152088aa81so12538807b3.0
        for <openbmc@lists.ozlabs.org>; Tue, 02 Apr 2024 12:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712086987; x=1712691787; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HTJVONLBOWfYIXXYyOhTTPw9XCjwbvXp4rskUKdwRDo=;
        b=g5Hs740KHXUf0uaS3+c0ROrU8hvnNRgKu/QH9bDVl6Z0M6vxmnDMWD8wc2eLQyYQb9
         uLn+hm68deg7C5tdGTJKAK7Kc66toTxyN+mcwn+aNRrOQfbXtZwHsrz51zFGCUoyjl+n
         ++grYl0JaaH36UKkUmqt7oed7dRaN7Zrlhv1nOlFDc8sVhF/Emun+O2Nkt3InhcFgBPW
         hRN2fIU72V5LeT0dYOlqpp7l7xsXIzAT3xm7x4fImT/ruK0RRTJcUmDQSvrpSyue4hmG
         7wIAQz1IpG3UuGSVHpowZe2Trvof4WB6ViPKgeExMHlVUKdojlI6FRZHadqJoIZXpSp4
         b3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712086987; x=1712691787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTJVONLBOWfYIXXYyOhTTPw9XCjwbvXp4rskUKdwRDo=;
        b=pP0gTl7ZRPQBpFT/zxgwWFrXD5gGSQwOmhDir0g6d0WcAdzNLeYB2XMQGVJWSrg9cS
         3sfXJ4gTErd5OSMoqwNaPIIuA0Jjc5Ht+SpVdArPMSTgkzdOygBLzXqsAvxfr2C2jMsT
         SgslVH7QR2XmbWdYnFPRuhnLRM2m0pkchJbNtbfAb3ZNhCaHdw5UDnYkCiHNKPiQPJ3L
         EMh0AAJAmPJmCNq0d/2bzpR+wxcgbywumYjB1GxHoGd5Wso9zIoFjFbnyWhOiWT3+Dno
         l0FjwF41Pw5Kxio0RMwMNhdFwQqjhCLnVt9YhK2BSCBERmba4BaFGWNaL0ru+r6dBOpI
         6ZzA==
X-Forwarded-Encrypted: i=1; AJvYcCWkT3eDFpQXZHQo2EQhEarQxdePXr1aQM7UNnC/Sl05a2KfUOmOkO2/njP/kFULMFjCbi+uS6oqghKT6bLjA7RqO4mLty1nFJM=
X-Gm-Message-State: AOJu0YyxZMAH6ZJJM/M4vEAuZtntdRN1GNsurWuO/7OWWAc7N0wGpFHH
	g8ZcLQL+z80ImhqKisWbodp2RIcFtDQsHo+oDpKx+/XjE5ezeesRw7z1tFF06oUauYFEWX9Z7bj
	u2uzKYrVIZkPwg8gtgkuARCuVTsU=
X-Google-Smtp-Source: AGHT+IHYFFXpr3KeU33zxXhX2ZVeehOyLXhFmaJ6JQIOHWpfhAN0d/7P9DC2ivCdw+kd0pPLfV2tNokbt93OKVRLbgY=
X-Received: by 2002:a25:4604:0:b0:dd0:aa2c:4da5 with SMTP id
 t4-20020a254604000000b00dd0aa2c4da5mr10797136yba.6.1712086986537; Tue, 02 Apr
 2024 12:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240131182653.2673554-1-tmaimon77@gmail.com> <20240131182653.2673554-4-tmaimon77@gmail.com>
 <74e003c6d80611ddd826ac21f48b4b3a.sboyd@kernel.org> <CAP6Zq1g5gwXvYzO5fnHxG-6__gSCpNBY7VeEPyr4Qtijya6EfQ@mail.gmail.com>
 <8acf846e767884978f3bb98646433551.sboyd@kernel.org> <CAP6Zq1htKQ5v0tH9HGRejnKwJ5ZauUWG_CzYUKegkVL4Ek8UxA@mail.gmail.com>
 <CAP6Zq1g4ksdLSVTm+PLqa5dSEidvHdpGZb=J9wKEftaH-Mg+bw@mail.gmail.com>
In-Reply-To: <CAP6Zq1g4ksdLSVTm+PLqa5dSEidvHdpGZb=J9wKEftaH-Mg+bw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 2 Apr 2024 22:42:55 +0300
Message-ID: <CAP6Zq1hk46xpQsVFz3RAF3CHU-PNCBxN+6SRKrdWzffRjRep4g@mail.gmail.com>
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

Kind remainder, appreciate if you can reply about the comment that
been sent few weeks ago.

Thanks,

Tomer

On Tue, 5 Mar 2024 at 17:59, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Stephen,
>
> Appreciate it if you could reply to my email afew days ago, It is
> really important to us to move this driver to upstream.
>
> Thanks,
>
> Tomer
>
> On Thu, 29 Feb 2024 at 23:29, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Hi Stephen,
> >
> > Thanks for your reply.
> >
> > On Thu, 29 Feb 2024 at 00:48, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Tomer Maimon (2024-02-25 10:00:35)
> > > > Hi Stephen,
> > > >
> > > > On Thu, 22 Feb 2024 at 07:58, Stephen Boyd <sboyd@kernel.org> wrote:
> > > > >
> > > > > Quoting Tomer Maimon (2024-01-31 10:26:53)
> > > > > > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..eacb579d30af
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/clk/clk-npcm8xx.c
> > > > > > @@ -0,0 +1,509 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +/*
> > > > > > + * Nuvoton NPCM8xx Clock Generator
> > > > > > + * All the clocks are initialized by the bootloader, so this driver allows only
> > > > > [...]
> > > > > > +
> > > > > > +/* external clock definition */
> > > > > > +#define NPCM8XX_CLK_S_REFCLK   "refclk"
> > > > > > +
> > > > > > +/* pll definition */
> > > > > > +#define NPCM8XX_CLK_S_PLL0     "pll0"
> > > > > > +#define NPCM8XX_CLK_S_PLL1     "pll1"
> > > > > > +#define NPCM8XX_CLK_S_PLL2     "pll2"
> > > > > > +#define NPCM8XX_CLK_S_PLL_GFX  "pll_gfx"
> > > > > > +
> > > > > > +/* early divider definition */
> > > > > > +#define NPCM8XX_CLK_S_PLL2_DIV2                "pll2_div2"
> > > > > > +#define NPCM8XX_CLK_S_PLL_GFX_DIV2     "pll_gfx_div2"
> > > > > > +#define NPCM8XX_CLK_S_PLL1_DIV2                "pll1_div2"
> > > > > > +
> > > > > > +/* mux definition */
> > > > > > +#define NPCM8XX_CLK_S_CPU_MUX     "cpu_mux"
> > > > > > +
> > > > > > +/* div definition */
> > > > > > +#define NPCM8XX_CLK_S_TH          "th"
> > > > > > +#define NPCM8XX_CLK_S_AXI         "axi"
> > > > >
> > > > > Please inline all these string #defines to the place they're used.
> > > > The version V21 you mention using define only when the definition is
> > > > used more than once
> > > > https://www.spinics.net/lists/kernel/msg5045826.html
> > > > Should I remove all the string definitions and add the string to the array?
> > >
> > > If it's a clk name for a clk registered in this file it should be
> > > inlined. Is that the case for everything besides refclk? And even refclk
> > > could be inlined so that we don't have to jump to the definition of a
> > > string.
> > I will add the string in the clock arrays and remove all the string definitions.
> > >
> > > > > > +
> > > > > > +static unsigned long npcm8xx_clk_div_get_parent(struct clk_hw *hw,
> > > > > > +                                               unsigned long parent_rate)
> > > > > > +{
> > > > > > +       struct npcm8xx_clk *div = to_npcm8xx_clk(hw);
> > > > > > +       unsigned int val;
> > > > > > +
> > > > > > +       regmap_read(div->clk_regmap, div->offset, &val);
> > > > > > +       val = val >> div->shift;
> > > > > > +       val &= clk_div_mask(div->width);
> > > > > > +
> > > > > > +       return divider_recalc_rate(hw, parent_rate, val, NULL, div->flags,
> > > > > > +                                  div->width);
> > > > > > +}
> > > > > > +
> > > > > > +static const struct clk_ops npcm8xx_clk_div_ops = {
> > > > > > +       .recalc_rate = npcm8xx_clk_div_get_parent,
> > > > > > +};
> > > > > > +
> > > > > > +static int npcm8xx_clk_probe(struct platform_device *pdev)
> > > > > > +{
> > > > > > +       struct device_node *parent_np = of_get_parent(pdev->dev.of_node);
> > > > >
> > > > > The parent of this device is not a syscon.
> > > > Once I have registered the map that handles both reset and the clock
> > > > in general is syscon, this is why we will modify the DTS so the clock
> > > > and the reset will be under syscon father node
> > > >                 sysctrl: system-controller@f0801000 {
> > > >                         compatible = "syscon", "simple-mfd";
> > > >                         reg = <0x0 0xf0801000 0x0 0x1000>;
> > > >
> > > >                         rstc: reset-controller {
> > > >                                 compatible = "nuvoton,npcm845-reset";
> > > >                                 reg = <0x0 0xf0801000 0x0 0xC4>;
> > > >                                 #reset-cells = <2>;
> > > >                                 nuvoton,sysgcr = <&gcr>;
> > > >                         };
> > > >
> > > >                         clk: clock-controller {
> > > >                                 compatible = "nuvoton,npcm845-clk";
> > > >                                 #clock-cells = <1>;
> > > >                                 clocks = <&refclk>;
> > > >                                 clock-names = "refclk";
> > > >                         };
> > > >                 };
> > > > You can see other drivers that using the same method like
> > > > https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/devicetree/bindings/clock/socionext,uniphier-clock.yaml
> > >
> > > You will need a similar file like
> > > Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-perictrl.yaml
> > > then to describe the child nodes.
> > I can do it.
> > >
> > > Socionext may not be the best example to follow. I generally try to
> > > avoid syscon and simply put #reset-cells and #clock-cells in the node
> > If I remove syscon I can't use syscon_node_to_regmap function, What
> > should I use If I remove syscon? auxiliary bus? something else?
> > > for the device. You can use the auxiliary bus to register drivers for
> > > clk and reset and put them into the resepective driver directories.
> > I little bit confused, what is an auxiliary bus to register drivers,
> > can you provide me an example?
> > > Avoid syscon means random drivers can't reach into the device with a
> > > regmap handle and read/write registers that they're not supposed to.
> > Indeed, but the drivers could use the reset and clock memory map only
> > if the module is also a child node.
> >
> > Please let me know what is your preferred way to handle it:
> > 1. stick with syscon and upstream-defined documentation for the rst clk syscon.
> > 2. avoid syscon and use an auxiliary bus, appreciate if you could give
> > me an example of how it should be done.
> > 3. Avoid sycon and handle it differently.
> > >
> > > > >
> > > > > > +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> > > > > > +       struct device *dev = &pdev->dev;
> > > > > > +       struct regmap *clk_regmap;
> > > > > > +       struct clk_hw *hw;
> > > > > > +       unsigned int i;
> > > > > > +
> > > > > > +       npcm8xx_clk_data = devm_kzalloc(dev, struct_size(npcm8xx_clk_data, hws,
> > > > > > +                                                        NPCM8XX_NUM_CLOCKS),
> > > > > > +                                       GFP_KERNEL);
> > > > > > +       if (!npcm8xx_clk_data)
> > > > > > +               return -ENOMEM;
> > > > > > +
> > > > > > +       clk_regmap = syscon_node_to_regmap(parent_np);
> > > > > > +       of_node_put(parent_np);
> > > > >
> > > > > Is there another binding update that is going to move this node to be a
> > > > > child of the syscon?
> > > > >
> > > > >                 gcr: system-controller@f0800000 {
> > > > >                         compatible = "nuvoton,npcm845-gcr", "syscon";
> > > > >                         reg = <0x0 0xf0800000 0x0 0x1000>;
> > > > >                 };
> > > > No, sorry but I'm not going to use the GCR node the handle the clock
> > > > and reset modules, the GCR has different memory space.
> > > > the clock driver will have the following device tree
> > >
> > > What does the reset driver use the CGR node for? The driver looks like
> > > it's using it to control USB phy resets.
> > Yes, the USB PHY reset is handled through the GCR registers.
> > >
> > > >                sysctrl: system-controller@f0801000 {
> > > >                         compatible = "syscon", "simple-mfd";
> > > >                         reg = <0x0 0xf0801000 0x0 0x1000>;
> > > >
> > > >                         rstc: reset-controller {
> > > >                                 compatible = "nuvoton,npcm845-reset";
> > > >                                 reg = <0x0 0xf0801000 0x0 0xC4>;
> > >
> > > This isn't a valid reg property for a child node like this.
> > O.K.
> > >
> > > >                                 #reset-cells = <2>;
> > > >                                 nuvoton,sysgcr = <&gcr>;
> > > >                         };
> > > >
> > > >                         clk: clock-controller {
> > > >                                 compatible = "nuvoton,npcm845-clk";
> > > >                                 #clock-cells = <1>;
> > > >                                 clocks = <&refclk>;
> > > >                                 clock-names = "refclk";
> > > >                         };
> > > >                 };
> >
> > Appreciate your guidance!
> >
> > Thanks,
> >
> > Tomer
