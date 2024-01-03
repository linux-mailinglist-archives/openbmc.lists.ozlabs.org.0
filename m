Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ACD822BED
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 12:15:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ldhTJxDy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4nFR2r5Yz3cQr
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 22:15:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ldhTJxDy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4nDp62xnz30g2
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2024 22:14:50 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5f15a1052b3so25751107b3.1
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jan 2024 03:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704280487; x=1704885287; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GVbmSivqFm16l2ZyQvLc7/P+co6sVaCHTLFtmYuE64U=;
        b=ldhTJxDyaqmJyPtFHtRnv5g157t3MGSVTfT8pucxy1YIxDNHlmbmjtLHYUG4Gqgzaw
         ygyJO4QjKhW9zLcQx5oxY1vYbZqjp0D36ecdYqj9p8hn5oAeC6DvwQbrdP//DQOULpVJ
         q6XtXiLwonS9wkwLwFKwQ3SC7gDnTQzHIefX5uRjSwbo+E5dPOL6Enc/jV5tf5Z0s8yP
         tAiHN8LmEJwgugbvkkJFn5zNXQHBbXJdWPzKUHEMmOpolRWYHw1dP+XVKUnmHEJgnUQa
         eKLt+oAkYjz1/NgjcJKx4AhQmpu3yPrx8205Bpl39iEcaUJYsQXq0StLxNjmTZd/6x97
         2p2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704280487; x=1704885287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVbmSivqFm16l2ZyQvLc7/P+co6sVaCHTLFtmYuE64U=;
        b=uM31Mn/H0Pn8X2VIvUWpeQZlnGvIU2YcSBRRQbM0kzxfP1zV9DllfG6iZxSoyfghNg
         +R0Hg6F9xeZkXnEDyzVUe/snRAsbTEJSu3S7g3ii3UArD2qZ5H++C1v7/qeroemxePTW
         8waSTZkn53P79+hs9+M0nvn9VGslIBmWQpUy3hbvPbQcHGbydQKbhIZkGht41vLthWsH
         O1XWQzs32rkM1SBBWvpjlAOfvcL8YF9c6pzipxRc9NKcBUD7xODHjxx0pzsPvA9Fa7tg
         YIjIVrOj7DAEslKRvnUXuQwhbO6q0UIcl4QEaJNbAeTtkLz82tmK3hS3qC6dzIMI4FMq
         k6bQ==
X-Gm-Message-State: AOJu0YwGo4UsjGl7cLk/C5YCASxvER5KonkNHIlBHEJ6ztS/TfQXXq00
	lDooiZJimUz1JbBCfuCtZvai6VQCw+7QpClm8uk=
X-Google-Smtp-Source: AGHT+IE+uUWbonqqQ1YDN9GzN2DHvb4IXcQ8qjCyQF38y+zzd/JJa+SWQk84/EpX8TMl8fJDznYvsK/8hbAF/j2W9JM=
X-Received: by 2002:a81:9884:0:b0:5f0:8159:2df4 with SMTP id
 p126-20020a819884000000b005f081592df4mr3923785ywg.89.1704280486667; Wed, 03
 Jan 2024 03:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20231218170404.910153-1-tmaimon77@gmail.com> <7c322ab2ab59b434429ce471c148c026.sboyd@kernel.org>
 <CAP6Zq1gYJTRw9=w6cP3KXX2jg3SPk2KBqNrbcs9NoOs2JeUnAg@mail.gmail.com> <5b31aa5cfb1e819b03678d080b630667.sboyd@kernel.org>
In-Reply-To: <5b31aa5cfb1e819b03678d080b630667.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 3 Jan 2024 13:14:35 +0200
Message-ID: <CAP6Zq1hTGWcG+63QV2rUVw92E51_NdoXCQaKTCrWNkJDGiEXwQ@mail.gmail.com>
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

Thanks for your clarifications.

On Wed, 3 Jan 2024 at 01:52, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2023-12-21 05:43:20)
> > Hi Stephen,
> >
> > Thanks for your comments
> >
> > On Thu, 21 Dec 2023 at 00:09, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Tomer Maimon (2023-12-18 09:04:04)
> > > > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > > > new file mode 100644
> > > > index 000000000000..e6c5111cc255
> > > > --- /dev/null
> > > > +++ b/drivers/clk/clk-npcm8xx.c
> > > > @@ -0,0 +1,552 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Nuvoton NPCM8xx Clock Generator
> > > > + * All the clocks are initialized by the bootloader, so this driver allows only
> > > > + * reading of current settings directly from the hardware.
> > > > + *
> > > > + * Copyright (C) 2020 Nuvoton Technologies
> > > > + * Author: Tomer Maimon <tomer.maimon@nuvoton.com>
> > > > + */
> > > > +
> > > > +#define pr_fmt(fmt) "npcm8xx_clk: " fmt
> > > > +
> > > > +#include <linux/bitfield.h>
> > > > +#include <linux/clk-provider.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/regmap.h>
> > > [...]
> > > > +#define NPCM8XX_CLK_S_CLKOUT      "clkout"
> > > > +#define NPCM8XX_CLK_S_PRE_ADC     "pre adc"
> > > > +#define NPCM8XX_CLK_S_UART        "uart"
> > > > +#define NPCM8XX_CLK_S_UART2       "uart2"
> > > > +#define NPCM8XX_CLK_S_TIMER       "timer"
> > > > +#define NPCM8XX_CLK_S_MMC         "mmc"
> > > > +#define NPCM8XX_CLK_S_SDHC        "sdhc"
> > > > +#define NPCM8XX_CLK_S_ADC         "adc"
> > > > +#define NPCM8XX_CLK_S_GFX         "gfx0_gfx1_mem"
> > > > +#define NPCM8XX_CLK_S_USBIF       "serial_usbif"
> > > > +#define NPCM8XX_CLK_S_USB_HOST    "usb_host"
> > > > +#define NPCM8XX_CLK_S_USB_BRIDGE  "usb_bridge"
> > > > +#define NPCM8XX_CLK_S_PCI         "pci"
> > > > +#define NPCM8XX_CLK_S_TH          "th"
> > > > +#define NPCM8XX_CLK_S_ATB         "atb"
> > > > +#define NPCM8XX_CLK_S_PRE_CLK     "pre_clk"
> > > > +#define NPCM8XX_CLK_S_RG         "rg"
> > > > +#define NPCM8XX_CLK_S_RCP        "rcp"
> > > > +
> > > > +static struct clk_hw hw_pll1_div2, hw_pll2_div2, hw_gfx_div2, hw_pre_clk;
> > > > +static struct npcm8xx_clk_pll_data npcm8xx_pll_clks[] = {
> > > > +       { NPCM8XX_CLK_S_PLL0, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON0, 0 },
> > >
> > > This is a new driver, so please stop using .name in clk_parent_data
> > > structures.
> > A few versions ago you suggested defining the reference clock in the
> > device tree,Can I use .fw_name since the reference clock in the device
> > tree
> >
> >         refclk: refclk-25mhz {
> >                 compatible = "fixed-clock";
> >                 clock-output-names = "refclk";
>
> Please don't use clock-output-names property.
Will remove
>
> >                 clock-frequency = <25000000>;
> >                 #clock-cells = <0>;
> >         };
>
> Use of this binding is fine assuming the reference clk is a real thing
> that exists outside the SoC. Is it?
Yes it is.
>
> >
> >         clk: clock-controller@f0801000 {
> >                  compatible = "nuvoton,npcm845-clk";
> >                  nuvoton,sysclk = <&rst>;
> >                  #clock-cells = <1>;
> >                  clocks = <&refclk>;
>
> This is index = 0
O.K.
>
> >                  clock-names = "refclk";
> >          };
> >
> > I will make sure to add refclk-25mhz to NPCM8xx device tree.
> > >
> > > > +       { NPCM8XX_CLK_S_PLL1, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON1, 0 },
> > > > +       { NPCM8XX_CLK_S_PLL2, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCON2, 0 },
> > > > +       { NPCM8XX_CLK_S_PLL_GFX, { .name = NPCM8XX_CLK_S_REFCLK }, NPCM8XX_PLLCONG, 0 },
> > > > +};
> > > > +
> > > > +static const u32 cpuck_mux_table[] = { 0, 1, 2, 7 };
> > > > +static const struct clk_parent_data cpuck_mux_parents[] = {
> > > > +       { .hw = &npcm8xx_pll_clks[0].hw },
> > > > +       { .hw = &npcm8xx_pll_clks[1].hw },
> > > > +       { .index = 0 },
> > >
> > > This requires a binding update. As of today, there isn't a 'clocks'
> > > property for the nuvoton,npcm845-clk binding.
> > Can I use fw_name = NPCM8XX_CLK_S_REFCLK instead of  .index = 0 in
> > that way, I will not need to modify nuvoton,npcm845-clk binding.
>
> Why don't you want to modify the binding? If you add a clocks property
> like in the example above you will have to modify the binding.
Will add clocks property to nuvoton,npcm845-clk binding.

Thanks,

Tomer
