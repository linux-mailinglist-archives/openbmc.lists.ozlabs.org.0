Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143A570AEB2
	for <lists+openbmc@lfdr.de>; Sun, 21 May 2023 17:52:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPQ7q6HpXz3c9Y
	for <lists+openbmc@lfdr.de>; Mon, 22 May 2023 01:52:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RXcAlAd3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RXcAlAd3;
	dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPQ7D6S06z3bkb
	for <openbmc@lists.ozlabs.org>; Mon, 22 May 2023 01:51:51 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af177f12a5so42669441fa.2
        for <openbmc@lists.ozlabs.org>; Sun, 21 May 2023 08:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684684303; x=1687276303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pH3nQjsrCHG2TEDAKhl31UrwoK3q+tYKSVtPhhbX+gk=;
        b=RXcAlAd3jAO5nHXwihNAto5sNJVGe93FSGzBYot9c7g3Nsc2X6A2hYvNglAcr9QCT3
         jR78ugq+rpFSvliJeCrRoDZ1ug03MxR8GvrtIi/FnAt2RMOuNl/lJw6pEzM00kcB7Yfl
         JoMcGJD+HaMpy1dU1EiBWUcUHSPJrd0YDjR8zsV1i1YJfE83+oK/HeucBBVVJjparFjw
         glOgt+YbB58QqfniTVbz9Ew5ebTXePpfdzKLO/MipZ0Lza700LNuR198A4sJYT2SOM8U
         sbDIr/1ZBPZ4bBDFvJTBJN8e364y3goRBoz3Gh+hsaps7jE9pSd5rLOE2xU5jJ8x1e9j
         o1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684684303; x=1687276303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pH3nQjsrCHG2TEDAKhl31UrwoK3q+tYKSVtPhhbX+gk=;
        b=iNNf7edcm6RSI2qwoHfLyNlVnO78aAcHAwA46CJHStknW2DRn8KDO55YJqffkEwI33
         IYosZ64uy5FCkS6RQKlELviH/7NBQsyUmVSGYRgy6G0qKETu1RPUvtkY7Ch5oXxbkcuQ
         3DWg4HuJv6zHSjDLNDKyHbSeUSqHeZaKuGRGf92ZdhM65zSxfZeYWPIH0QXd65cxLO7L
         vFHD6cLl6iEaUUTMOe8cYe3jPzRSDtl+f0AMqijmraSfkXonDFSfwIwbVyUuMexguBV5
         Qs/YueuPNBsPQHSjOsXUoNvndibAJhekgcgvBklsQ4TSV4oDXb7Z7lmKj6i3FYnWMId3
         H+/g==
X-Gm-Message-State: AC+VfDyVH02Qen1iP6O7Yxncf6ig2Sy+TVeGftDmAQ6AmugxnJLdO37H
	CdvXBz363127jedK8jxH0Ytl04HV07qtZWaT7co=
X-Google-Smtp-Source: ACHHUZ471hzqlzDIkTUzLeRUfQR6YpdE4zP6axlFe76wx/QP44e+hX/JvrdM2r8xSGg0tFKuQauYbamMLKaPNoqAoj0=
X-Received: by 2002:a2e:8713:0:b0:2a8:a6a5:e26e with SMTP id
 m19-20020a2e8713000000b002a8a6a5e26emr3101926lji.20.1684684303375; Sun, 21
 May 2023 08:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230309194402.119562-1-tmaimon77@gmail.com> <20230309194402.119562-2-tmaimon77@gmail.com>
 <495fcc93ab28ff8949569ededee954c1.sboyd@kernel.org> <CAP6Zq1hOHJWQSmGoVDz5bSjwdhNyQmaZVOEE8_dX6S4HCFQ2Jg@mail.gmail.com>
 <099514a84f97c694d2382812b03aad1e.sboyd@kernel.org>
In-Reply-To: <099514a84f97c694d2382812b03aad1e.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 21 May 2023 18:51:32 +0300
Message-ID: <CAP6Zq1gSuaHruFaBgdBevsWDrQ4U6eTV+YN3ebFH6r2YbEbh+g@mail.gmail.com>
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

Hi Stephen,

Sorry for the late reply and thanks a lot for your clarifications.

I have sent today V16 with some changes according to your comments.

On Wed, 5 Apr 2023 at 22:09, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2023-03-31 11:07:19)
> > On Mon, 20 Mar 2023 at 21:50, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Tomer Maimon (2023-03-09 11:44:02)
> > > > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > > > new file mode 100644
> > > > index 000000000000..67058f121251
> > > > --- /dev/null
> > > > +++ b/drivers/clk/clk-npcm8xx.c
> > > > +       { NPCM8XX_CLK_S_PLL0, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON0, 0 },
> > > > +       { NPCM8XX_CLK_S_PLL1, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON1, 0 },
> > > > +       { NPCM8XX_CLK_S_PLL2, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON2, 0 },
> > > > +       { NPCM8XX_CLK_S_PLL_GFX, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCONG, 0 },
> > > > +};
> > > > +
> > > > +static const u32 cpuck_mux_table[] = { 0, 1, 2, 7 };
> > > > +static const struct clk_parent_data cpuck_mux_parents[] = {
> > > > +       { .fw_name = NPCM8XX_CLK_S_PLL0, .name = NPCM8XX_CLK_S_PLL0 },
> > >
> > > You should only have .fw_name or .index when introducing new drivers.
> > > The .name field is for existing drivers that want to migrate to
> > > clk_parent_data.
> > I thought using .name was done when the clock defines in the DT, like
> > the ref clock.
> > If the other clocks are not defined both .fw_name and .name the clocks
> > are not registered properly.
>
> Are you saying that having .name fixes it?
>
> > >
> > > > +       { .fw_name = NPCM8XX_CLK_S_PLL1, .name = NPCM8XX_CLK_S_PLL1 },
> > > > +       { .name = NPCM8XX_CLK_S_REFCLK },
> > >
> > > Note, this line says to use '.index = 0', and .name will be ignored.
> > > Maybe just use the index for everything? That makes it simpler and
> > > potentially faster because we don't have to do string comparisons
> > > anywhere.
> > Should the clk_parent_data mux use only .index? if yes how should the
> > clock tree have a connection between the parent's clock and the mux
> > for example:
> > for example, how should the driver connect between
> > NPCM8XX_CLK_S_PLL1_DIV2 and the index number in the clk_parent_data?
>
> It's not required, but it makes things simpler to only use .index or
> direct clk_hw pointers (.hw). I'm working on a clk documentation
> overhaul series right now, about 4 years later than I should have done
> it. It will cover this.
>
> The .index field corresponds to the cell index in your devicetree
> 'clocks' property of the clk provider (the node with #clock-cells
> property). If the clk is internal, just use a .hw member and point to it
> directly. Don't consume your own clks in DT. If NPCM8XX_CLK_S_PLL1_DIV2
> is a clk provided/registered by this device then it should be pointed to
> directly with the clk_hw pointer. If NPCM8XX_CLK_S_PLL1_DIV2 is an
> external clk that is consumed via the 'clocks' property in DT, then it
> should be specified as a parent via the .index member.
>
> > > > +
> > > > +static int npcm8xx_clk_probe(struct platform_device *pdev)
> > > > +{
> > > > +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> > > > +       struct device *dev = &pdev->dev;
> > > > +       void __iomem *clk_base;
> > > > +       struct resource *res;
> > > > +       struct clk_hw *hw;
> > > > +       unsigned int i;
> > > > +       int err;
> > > > +
> > > > +       npcm8xx_clk_data = devm_kzalloc(dev, struct_size(npcm8xx_clk_data, hws,
> > > > +                                                        NPCM8XX_NUM_CLOCKS),
> > > > +                                       GFP_KERNEL);
> > > > +       if (!npcm8xx_clk_data)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +       clk_base = devm_ioremap(dev, res->start, resource_size(res));
> > >
> > > Can you use devm_platform_ioremap_resource() instead?
> > We should use devm_ioremap since the clock register is used for the
> > reset driver as well.
>
We using the same ioremap sequence in npcm7xx clock driver since the
clock and reset share the same register region.
res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
clk_base = devm_ioremap(dev, res->start, resource_size(res));
https://elixir.bootlin.com/linux/v6.4-rc1/source/drivers/clk/clk-npcm7xx.c#L413
Why we cannot use it in the NPCM8XX clock driver?

> Are the clk and reset drivers sharing the register range? If so, please
> use auxiliary bus to register the reset driver, and map the register
> region once in the driver that registers the auxiliary device. Pass the
> iomem pointer to the auxiliary device.

Sorry, but I didn't understand what you mean by using the auxiliary
bus to register the reset driver do you have an example of how it
should be done?

Thanks,

Tomer
