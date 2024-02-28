Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1F86BAEF
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 23:48:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rQCD9vb1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlTzY1wlLz3cbl
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 09:48:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rQCD9vb1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlTyw10zdz3bnx
	for <openbmc@lists.ozlabs.org>; Thu, 29 Feb 2024 09:48:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4FB1CE2253;
	Wed, 28 Feb 2024 22:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA43CC433F1;
	Wed, 28 Feb 2024 22:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709160481;
	bh=imNeDCybnQTqCSixbtIV0f49WNytkR9qirQh/BflgTg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rQCD9vb1vr8YHCT/cgkG3W7cl4iANHxlC78YiqJYGmoVBGqQiEb+hTHozvMqU6wZU
	 ASxO/ZoEKOmJqEd9cagY1syCwVISUecVoZBAimrvdm76l2hPsYHp89/lFlmiyBp/Sc
	 eHAEd7hznx95l2X+bOVA8UybOZfH3P057IOz1nPtsHctrCp3QUC6ITFbPcq4o0v7Gb
	 /IOGef/PdArRlTZRdlCRt/GfXzIXqwGTDL5RZ0slMm1aNqJzJtwk4VifL4MjgprKDd
	 pbRTcOEl4IbYDzkkDAjCZpAhZmuMCdDnOCFgZ/PN3+xVbPZ8j+dEvVxTjInyMGPST9
	 i7+aa6QfDAI+w==
Message-ID: <8acf846e767884978f3bb98646433551.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAP6Zq1g5gwXvYzO5fnHxG-6__gSCpNBY7VeEPyr4Qtijya6EfQ@mail.gmail.com>
References: <20240131182653.2673554-1-tmaimon77@gmail.com> <20240131182653.2673554-4-tmaimon77@gmail.com> <74e003c6d80611ddd826ac21f48b4b3a.sboyd@kernel.org> <CAP6Zq1g5gwXvYzO5fnHxG-6__gSCpNBY7VeEPyr4Qtijya6EfQ@mail.gmail.com>
Subject: Re: [PATCH v23 3/3] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 28 Feb 2024 14:47:58 -0800
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2024-02-25 10:00:35)
> Hi Stephen,
>=20
> On Thu, 22 Feb 2024 at 07:58, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Tomer Maimon (2024-01-31 10:26:53)
> > > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > > new file mode 100644
> > > index 000000000000..eacb579d30af
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-npcm8xx.c
> > > @@ -0,0 +1,509 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Nuvoton NPCM8xx Clock Generator
> > > + * All the clocks are initialized by the bootloader, so this driver =
allows only
> > [...]
> > > +
> > > +/* external clock definition */
> > > +#define NPCM8XX_CLK_S_REFCLK   "refclk"
> > > +
> > > +/* pll definition */
> > > +#define NPCM8XX_CLK_S_PLL0     "pll0"
> > > +#define NPCM8XX_CLK_S_PLL1     "pll1"
> > > +#define NPCM8XX_CLK_S_PLL2     "pll2"
> > > +#define NPCM8XX_CLK_S_PLL_GFX  "pll_gfx"
> > > +
> > > +/* early divider definition */
> > > +#define NPCM8XX_CLK_S_PLL2_DIV2                "pll2_div2"
> > > +#define NPCM8XX_CLK_S_PLL_GFX_DIV2     "pll_gfx_div2"
> > > +#define NPCM8XX_CLK_S_PLL1_DIV2                "pll1_div2"
> > > +
> > > +/* mux definition */
> > > +#define NPCM8XX_CLK_S_CPU_MUX     "cpu_mux"
> > > +
> > > +/* div definition */
> > > +#define NPCM8XX_CLK_S_TH          "th"
> > > +#define NPCM8XX_CLK_S_AXI         "axi"
> >
> > Please inline all these string #defines to the place they're used.
> The version V21 you mention using define only when the definition is
> used more than once
> https://www.spinics.net/lists/kernel/msg5045826.html
> Should I remove all the string definitions and add the string to the arra=
y?

If it's a clk name for a clk registered in this file it should be
inlined. Is that the case for everything besides refclk? And even refclk
could be inlined so that we don't have to jump to the definition of a
string.

> > > +
> > > +static unsigned long npcm8xx_clk_div_get_parent(struct clk_hw *hw,
> > > +                                               unsigned long parent_=
rate)
> > > +{
> > > +       struct npcm8xx_clk *div =3D to_npcm8xx_clk(hw);
> > > +       unsigned int val;
> > > +
> > > +       regmap_read(div->clk_regmap, div->offset, &val);
> > > +       val =3D val >> div->shift;
> > > +       val &=3D clk_div_mask(div->width);
> > > +
> > > +       return divider_recalc_rate(hw, parent_rate, val, NULL, div->f=
lags,
> > > +                                  div->width);
> > > +}
> > > +
> > > +static const struct clk_ops npcm8xx_clk_div_ops =3D {
> > > +       .recalc_rate =3D npcm8xx_clk_div_get_parent,
> > > +};
> > > +
> > > +static int npcm8xx_clk_probe(struct platform_device *pdev)
> > > +{
> > > +       struct device_node *parent_np =3D of_get_parent(pdev->dev.of_=
node);
> >
> > The parent of this device is not a syscon.
> Once I have registered the map that handles both reset and the clock
> in general is syscon, this is why we will modify the DTS so the clock
> and the reset will be under syscon father node
>                 sysctrl: system-controller@f0801000 {
>                         compatible =3D "syscon", "simple-mfd";
>                         reg =3D <0x0 0xf0801000 0x0 0x1000>;
>=20
>                         rstc: reset-controller {
>                                 compatible =3D "nuvoton,npcm845-reset";
>                                 reg =3D <0x0 0xf0801000 0x0 0xC4>;
>                                 #reset-cells =3D <2>;
>                                 nuvoton,sysgcr =3D <&gcr>;
>                         };
>=20
>                         clk: clock-controller {
>                                 compatible =3D "nuvoton,npcm845-clk";
>                                 #clock-cells =3D <1>;
>                                 clocks =3D <&refclk>;
>                                 clock-names =3D "refclk";
>                         };
>                 };
> You can see other drivers that using the same method like
> https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/devicetree=
/bindings/clock/socionext,uniphier-clock.yaml

You will need a similar file like
Documentation/devicetree/bindings/soc/socionext/socionext,uniphier-perictrl=
.yaml
then to describe the child nodes.

Socionext may not be the best example to follow. I generally try to
avoid syscon and simply put #reset-cells and #clock-cells in the node
for the device. You can use the auxiliary bus to register drivers for
clk and reset and put them into the resepective driver directories.
Avoid syscon means random drivers can't reach into the device with a
regmap handle and read/write registers that they're not supposed to.

> >
> > > +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct regmap *clk_regmap;
> > > +       struct clk_hw *hw;
> > > +       unsigned int i;
> > > +
> > > +       npcm8xx_clk_data =3D devm_kzalloc(dev, struct_size(npcm8xx_cl=
k_data, hws,
> > > +                                                        NPCM8XX_NUM_=
CLOCKS),
> > > +                                       GFP_KERNEL);
> > > +       if (!npcm8xx_clk_data)
> > > +               return -ENOMEM;
> > > +
> > > +       clk_regmap =3D syscon_node_to_regmap(parent_np);
> > > +       of_node_put(parent_np);
> >
> > Is there another binding update that is going to move this node to be a
> > child of the syscon?
> >
> >                 gcr: system-controller@f0800000 {
> >                         compatible =3D "nuvoton,npcm845-gcr", "syscon";
> >                         reg =3D <0x0 0xf0800000 0x0 0x1000>;
> >                 };
> No, sorry but I'm not going to use the GCR node the handle the clock
> and reset modules, the GCR has different memory space.
> the clock driver will have the following device tree

What does the reset driver use the CGR node for? The driver looks like
it's using it to control USB phy resets.

>                sysctrl: system-controller@f0801000 {
>                         compatible =3D "syscon", "simple-mfd";
>                         reg =3D <0x0 0xf0801000 0x0 0x1000>;
>=20
>                         rstc: reset-controller {
>                                 compatible =3D "nuvoton,npcm845-reset";
>                                 reg =3D <0x0 0xf0801000 0x0 0xC4>;

This isn't a valid reg property for a child node like this.

>                                 #reset-cells =3D <2>;
>                                 nuvoton,sysgcr =3D <&gcr>;
>                         };
>=20
>                         clk: clock-controller {
>                                 compatible =3D "nuvoton,npcm845-clk";
>                                 #clock-cells =3D <1>;
>                                 clocks =3D <&refclk>;
>                                 clock-names =3D "refclk";
>                         };
>                 };
