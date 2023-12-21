Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE881B84D
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 14:44:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dvF3TkeQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sws922V0Zz3cVN
	for <lists+openbmc@lfdr.de>; Fri, 22 Dec 2023 00:44:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dvF3TkeQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sws8S04brz30hG
	for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2023 00:43:34 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5c85e8fdd2dso8719037b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 05:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703166211; x=1703771011; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rfYk2PbsAR6XkUVnp+faUk+Wc6BaNwbjiQpy58miDmQ=;
        b=dvF3TkeQXOTV710sXac34d8R849QOCDV8+3WibZh/1u/9Y56XlHWbxxXr8hdKFhNIq
         R12mjUqEI2F9to8xvbQjsdsd4/7797CX/uhEVwrNuAqWW+lXDG8i+qobrBwRWTOBQR4r
         gFiIzrQPfgd4dXirZkKHtZtD9F99fO2b6yIC4sCYS0fDj1WZ1d+kVKiKAIhR5/hSdYoS
         TfHzhFBQu5oDY8kKSTeOZtv04MYHYpSTlY0QG89W9uIECEeV6t9VZx5BiGhjaLNuCRuq
         QE2bVb28tzDTCAloKWJUgEMo8bWqGKLtoSPS3EwObdIk+IQ6Fu1kfyXHU0RPkbRXcpSW
         wUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166211; x=1703771011;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfYk2PbsAR6XkUVnp+faUk+Wc6BaNwbjiQpy58miDmQ=;
        b=L9qm+er1Szor4g9Mi2VxwGwqkV5tOV6qR+BDSQmXhjyRajYCOkE/i4YB20BbJKV9g4
         SoN8+VYN4hzf9KHFhr5E3Fm0B++NHe6cFU4LHqQpMWR6qOj/c5u5eQ73Q8aPY6YIFBMm
         NEQE47IXn4Pu9P2CnhW7CWWZi0OVoAaK4Rn8eFCF3PPMVrcFVbLmZ45d2HsuU/yjgTnB
         Tie1OtxiMg8Q3+IJVl5xT8AAI6Ciby/WA5L011C7XZ5R/Ipiu1Dk8Dvat8MfbCzPTqgB
         u5vuGjGTeU7KujjUkxZZHrDGHgNey1sVij6k+eihVrpwB/GpbL5HjT9eXtv8fMOue/vn
         A1Ww==
X-Gm-Message-State: AOJu0YxzAJL6MGafaKu/xnYZH7igi6ImAM9JffEoOxs/cwB5D7VD7GYV
	4C9vtE4DtMx0vxw6gaR8ASG+vqxTjK8UFK0XMHA=
X-Google-Smtp-Source: AGHT+IEisUylWKTPxMtPd7GzMVMg817akVIJdXa3vlzhqH53i4gueNhmmidqStzwVmMFp0eYtYRq7NVu0exvWaK+xDg=
X-Received: by 2002:a05:690c:2b8d:b0:5e9:d166:2438 with SMTP id
 en13-20020a05690c2b8d00b005e9d1662438mr122149ywb.86.1703166211485; Thu, 21
 Dec 2023 05:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20231218170404.910153-1-tmaimon77@gmail.com> <7c322ab2ab59b434429ce471c148c026.sboyd@kernel.org>
In-Reply-To: <7c322ab2ab59b434429ce471c148c026.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 21 Dec 2023 15:43:20 +0200
Message-ID: <CAP6Zq1gYJTRw9=w6cP3KXX2jg3SPk2KBqNrbcs9NoOs2JeUnAg@mail.gmail.com>
Subject: Re: [PATCH RESEND v21] clk: npcm8xx: add clock controller
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

Thanks for your comments

On Thu, 21 Dec 2023 at 00:09, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2023-12-18 09:04:04)
> > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > new file mode 100644
> > index 000000000000..e6c5111cc255
> > --- /dev/null
> > +++ b/drivers/clk/clk-npcm8xx.c
> > @@ -0,0 +1,552 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NPCM8xx Clock Generator
> > + * All the clocks are initialized by the bootloader, so this driver allows only
> > + * reading of current settings directly from the hardware.
> > + *
> > + * Copyright (C) 2020 Nuvoton Technologies
> > + * Author: Tomer Maimon <tomer.maimon@nuvoton.com>
> > + */
> > +
> > +#define pr_fmt(fmt) "npcm8xx_clk: " fmt
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/regmap.h>
> [...]
> > +#define NPCM8XX_CLK_S_CLKOUT      "clkout"
> > +#define NPCM8XX_CLK_S_PRE_ADC     "pre adc"
> > +#define NPCM8XX_CLK_S_UART        "uart"
> > +#define NPCM8XX_CLK_S_UART2       "uart2"
> > +#define NPCM8XX_CLK_S_TIMER       "timer"
> > +#define NPCM8XX_CLK_S_MMC         "mmc"
> > +#define NPCM8XX_CLK_S_SDHC        "sdhc"
> > +#define NPCM8XX_CLK_S_ADC         "adc"
> > +#define NPCM8XX_CLK_S_GFX         "gfx0_gfx1_mem"
> > +#define NPCM8XX_CLK_S_USBIF       "serial_usbif"
> > +#define NPCM8XX_CLK_S_USB_HOST    "usb_host"
> > +#define NPCM8XX_CLK_S_USB_BRIDGE  "usb_bridge"
> > +#define NPCM8XX_CLK_S_PCI         "pci"
> > +#define NPCM8XX_CLK_S_TH          "th"
> > +#define NPCM8XX_CLK_S_ATB         "atb"
> > +#define NPCM8XX_CLK_S_PRE_CLK     "pre_clk"
> > +#define NPCM8XX_CLK_S_RG         "rg"
> > +#define NPCM8XX_CLK_S_RCP        "rcp"
> > +
> > +static struct clk_hw hw_pll1_div2, hw_pll2_div2, hw_gfx_div2, hw_pre_clk;
> > +static struct npcm8xx_clk_pll_data npcm8xx_pll_clks[] = {
> > +       { NPCM8XX_CLK_S_PLL0, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON0, 0 },
>
> This is a new driver, so please stop using .name in clk_parent_data
> structures.
A few versions ago you suggested defining the reference clock in the
device tree,Can I use .fw_name since the reference clock in the device
tree

        refclk: refclk-25mhz {
                compatible = "fixed-clock";
                clock-output-names = "refclk";
                clock-frequency = <25000000>;
                #clock-cells = <0>;
        };

        clk: clock-controller@f0801000 {
                 compatible = "nuvoton,npcm845-clk";
                 nuvoton,sysclk = <&rst>;
                 #clock-cells = <1>;
                 clocks = <&refclk>;
                 clock-names = "refclk";
         };

I will make sure to add refclk-25mhz to NPCM8xx device tree.
>
> > +       { NPCM8XX_CLK_S_PLL1, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON1, 0 },
> > +       { NPCM8XX_CLK_S_PLL2, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON2, 0 },
> > +       { NPCM8XX_CLK_S_PLL_GFX, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCONG, 0 },
> > +};
> > +
> > +static const u32 cpuck_mux_table[] = { 0, 1, 2, 7 };
> > +static const struct clk_parent_data cpuck_mux_parents[] = {
> > +       { .hw = &npcm8xx_pll_clks[0].hw },
> > +       { .hw = &npcm8xx_pll_clks[1].hw },
> > +       { .index = 0 },
>
> This requires a binding update. As of today, there isn't a 'clocks'
> property for the nuvoton,npcm845-clk binding.
Can I use fw_name = NPCM8XX_CLK_S_REFCLK instead of  .index = 0 in
that way, I will not need to modify nuvoton,npcm845-clk binding.
>
> > +       { .hw = &npcm8xx_pll_clks[2].hw }
> > +};
> > +
> > +static const u32 pixcksel_mux_table[] = { 0, 2 };
> > +static const struct clk_parent_data pixcksel_mux_parents[] = {
> > +       { .hw = &npcm8xx_pll_clks[3].hw },
> > +       { .index = 0 }
> > +};
> > +
> [...]
> > +
> > +/* configurable dividers: */
> > +static struct npcm8xx_clk_div_data npcm8xx_divs[] = {
> > +       { NPCM8XX_CLKDIV1, 28, 3, NPCM8XX_CLK_S_ADC, &npcm8xx_pre_divs[0].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_ADC },
> > +       { NPCM8XX_CLKDIV1, 16, 5, NPCM8XX_CLK_S_UART, &npcm8xx_muxes[3].hw, 0, 0, NPCM8XX_CLK_UART },
> > +       { NPCM8XX_CLKDIV1, 11, 5, NPCM8XX_CLK_S_MMC, &npcm8xx_muxes[2].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_MMC },
> > +       { NPCM8XX_CLKDIV1, 6, 5, NPCM8XX_CLK_S_SPI3, &npcm8xx_pre_divs[1].hw, 0, 0, NPCM8XX_CLK_SPI3 },
> > +       { NPCM8XX_CLKDIV1, 2, 4, NPCM8XX_CLK_S_PCI, &npcm8xx_muxes[7].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_PCI },
> > +
> > +       { NPCM8XX_CLKDIV2, 30, 2, NPCM8XX_CLK_S_APB4, &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB4 },
> > +       { NPCM8XX_CLKDIV2, 28, 2, NPCM8XX_CLK_S_APB3, &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB3 },
> > +       { NPCM8XX_CLKDIV2, 26, 2, NPCM8XX_CLK_S_APB2, &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB2 },
> > +       { NPCM8XX_CLKDIV2, 24, 2, NPCM8XX_CLK_S_APB1, &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB1 },
> > +       { NPCM8XX_CLKDIV2, 22, 2, NPCM8XX_CLK_S_APB5, &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_APB5 },
> > +       { NPCM8XX_CLKDIV2, 16, 5, NPCM8XX_CLK_S_CLKOUT, &npcm8xx_muxes[8].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_CLKOUT },
> > +       { NPCM8XX_CLKDIV2, 13, 3, NPCM8XX_CLK_S_GFX, &npcm8xx_muxes[7].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_GFX },
> > +       { NPCM8XX_CLKDIV2, 8, 5, NPCM8XX_CLK_S_USB_BRIDGE, &npcm8xx_muxes[4].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU },
>
> Just put the string where there are any macros that are used once
> please.
O.K.
>
> > +       { NPCM8XX_CLKDIV2, 4, 4, NPCM8XX_CLK_S_USB_HOST, &npcm8xx_muxes[4].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SU48 },
> > +       { NPCM8XX_CLKDIV2, 0, 4, NPCM8XX_CLK_S_SDHC, &npcm8xx_muxes[2].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SDHC },
> > +
> > +       { NPCM8XX_CLKDIV3, 16, 8, NPCM8XX_CLK_S_SPI1, &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI1 },
> > +       { NPCM8XX_CLKDIV3, 11, 5, NPCM8XX_CLK_S_UART2, &npcm8xx_muxes[3].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_UART2 },
> > +       { NPCM8XX_CLKDIV3, 6, 5, NPCM8XX_CLK_S_SPI0, &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPI0 },
> > +       { NPCM8XX_CLKDIV3, 1, 5, NPCM8XX_CLK_S_SPIX, &npcm8xx_pre_divs[1].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_SPIX },
> > +
> > +       { NPCM8XX_CLKDIV4, 28, 4, NPCM8XX_CLK_S_RG, &npcm8xx_muxes[11].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RG },
> > +       { NPCM8XX_CLKDIV4, 12, 4, NPCM8XX_CLK_S_RCP, &npcm8xx_muxes[12].hw, CLK_DIVIDER_READ_ONLY, 0, NPCM8XX_CLK_RCP },
> > +
> > +       { NPCM8XX_THRTL_CNT, 0, 2, NPCM8XX_CLK_S_TH, &npcm8xx_muxes[0].hw, CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_TH },
> > +};
> > +
> [...]
> > +
> > +static int npcm8xx_clk_probe(struct platform_device *pdev)
> > +{
> > +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> > +       struct device_node *np = pdev->dev.of_node;
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
> > +       clk_regmap = syscon_regmap_lookup_by_phandle(np, "nuvoton,sysclk");
>
> I don't see this as part of the binding either. Please update the
> binding.
O.K.
>
> > +       if (IS_ERR(clk_regmap)) {
> > +               dev_err(&pdev->dev, "Failed to find nuvoton,sysclk\n");
> > +               return PTR_ERR(clk_regmap);
> > +       }
> > +
> > +       npcm8xx_clk_data->num = NPCM8XX_NUM_CLOCKS;
> > +
> > +       for (i = 0; i < NPCM8XX_NUM_CLOCKS; i++)
> > +               npcm8xx_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> > +
> > +       /* Register plls */

Best regards,

Tomer
