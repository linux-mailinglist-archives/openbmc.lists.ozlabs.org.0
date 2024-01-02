Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6FC8225BA
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 00:53:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9FlvBXR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4V6f3gNmz30fn
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 10:53:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9FlvBXR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4V5z2r7kz2xQD
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2024 10:52:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A3D70CE11E6;
	Tue,  2 Jan 2024 23:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFA2C433C7;
	Tue,  2 Jan 2024 23:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704239571;
	bh=aMUucof7o/d+HREBHnwOWXuLTNaVgcKg/e9NSobYjc0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=s9FlvBXRBmxgDsdA0I5KljOHjVGwL2syONICCieK5H8nk79I3wCKLuscfRqAODpqT
	 0GBeTrN6+0J0WQaXQUf56JxV7/QsJe1+m9BsccHcVe5IFjAEaFLJ4Wf3i8S+eskRgM
	 GWwmGgo48t7KI3T+Lp2iwB9FdI9beublm9k148+K55RAPDdR7C4a/Rb8Sk7wjUg5yj
	 WG6glYFs14yrndwFNXIwHeEbovoN7NAYdEOyj0i/FWMorxQHbN4VI8pbMTBBjNK9F0
	 qjA1n/O2ecM1m835EStX5loo9dZsFqu6MOkUuqvHcloQWpieVhUHrIMK96YnB33dcH
	 bzf350QOE1ASw==
Message-ID: <5b31aa5cfb1e819b03678d080b630667.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAP6Zq1gYJTRw9=w6cP3KXX2jg3SPk2KBqNrbcs9NoOs2JeUnAg@mail.gmail.com>
References: <20231218170404.910153-1-tmaimon77@gmail.com> <7c322ab2ab59b434429ce471c148c026.sboyd@kernel.org> <CAP6Zq1gYJTRw9=w6cP3KXX2jg3SPk2KBqNrbcs9NoOs2JeUnAg@mail.gmail.com>
Subject: Re: [PATCH RESEND v21] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 02 Jan 2024 15:52:49 -0800
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Quoting Tomer Maimon (2023-12-21 05:43:20)
> Hi Stephen,
>=20
> Thanks for your comments
>=20
> On Thu, 21 Dec 2023 at 00:09, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Tomer Maimon (2023-12-18 09:04:04)
> > > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > > new file mode 100644
> > > index 000000000000..e6c5111cc255
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-npcm8xx.c
> > > @@ -0,0 +1,552 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Nuvoton NPCM8xx Clock Generator
> > > + * All the clocks are initialized by the bootloader, so this driver =
allows only
> > > + * reading of current settings directly from the hardware.
> > > + *
> > > + * Copyright (C) 2020 Nuvoton Technologies
> > > + * Author: Tomer Maimon <tomer.maimon@nuvoton.com>
> > > + */
> > > +
> > > +#define pr_fmt(fmt) "npcm8xx_clk: " fmt
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/err.h>
> > > +#include <linux/io.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/regmap.h>
> > [...]
> > > +#define NPCM8XX_CLK_S_CLKOUT      "clkout"
> > > +#define NPCM8XX_CLK_S_PRE_ADC     "pre adc"
> > > +#define NPCM8XX_CLK_S_UART        "uart"
> > > +#define NPCM8XX_CLK_S_UART2       "uart2"
> > > +#define NPCM8XX_CLK_S_TIMER       "timer"
> > > +#define NPCM8XX_CLK_S_MMC         "mmc"
> > > +#define NPCM8XX_CLK_S_SDHC        "sdhc"
> > > +#define NPCM8XX_CLK_S_ADC         "adc"
> > > +#define NPCM8XX_CLK_S_GFX         "gfx0_gfx1_mem"
> > > +#define NPCM8XX_CLK_S_USBIF       "serial_usbif"
> > > +#define NPCM8XX_CLK_S_USB_HOST    "usb_host"
> > > +#define NPCM8XX_CLK_S_USB_BRIDGE  "usb_bridge"
> > > +#define NPCM8XX_CLK_S_PCI         "pci"
> > > +#define NPCM8XX_CLK_S_TH          "th"
> > > +#define NPCM8XX_CLK_S_ATB         "atb"
> > > +#define NPCM8XX_CLK_S_PRE_CLK     "pre_clk"
> > > +#define NPCM8XX_CLK_S_RG         "rg"
> > > +#define NPCM8XX_CLK_S_RCP        "rcp"
> > > +
> > > +static struct clk_hw hw_pll1_div2, hw_pll2_div2, hw_gfx_div2, hw_pre=
_clk;
> > > +static struct npcm8xx_clk_pll_data npcm8xx_pll_clks[] =3D {
> > > +       { NPCM8XX_CLK_S_PLL0, { .name =3D NPCM8XX_CLK_S_REFCLK }, NPC=
M8XX_PLLCON0, 0 },
> >
> > This is a new driver, so please stop using .name in clk_parent_data
> > structures.
> A few versions ago you suggested defining the reference clock in the
> device tree,Can I use .fw_name since the reference clock in the device
> tree
>=20
>         refclk: refclk-25mhz {
>                 compatible =3D "fixed-clock";
>                 clock-output-names =3D "refclk";

Please don't use clock-output-names property.

>                 clock-frequency =3D <25000000>;
>                 #clock-cells =3D <0>;
>         };

Use of this binding is fine assuming the reference clk is a real thing
that exists outside the SoC. Is it?

>=20
>         clk: clock-controller@f0801000 {
>                  compatible =3D "nuvoton,npcm845-clk";
>                  nuvoton,sysclk =3D <&rst>;
>                  #clock-cells =3D <1>;
>                  clocks =3D <&refclk>;

This is index =3D 0

>                  clock-names =3D "refclk";
>          };
>=20
> I will make sure to add refclk-25mhz to NPCM8xx device tree.
> >
> > > +       { NPCM8XX_CLK_S_PLL1, { .name =3D NPCM8XX_CLK_S_REFCLK }, NPC=
M8XX_PLLCON1, 0 },
> > > +       { NPCM8XX_CLK_S_PLL2, { .name =3D NPCM8XX_CLK_S_REFCLK }, NPC=
M8XX_PLLCON2, 0 },
> > > +       { NPCM8XX_CLK_S_PLL_GFX, { .name =3D NPCM8XX_CLK_S_REFCLK }, =
NPCM8XX_PLLCONG, 0 },
> > > +};
> > > +
> > > +static const u32 cpuck_mux_table[] =3D { 0, 1, 2, 7 };
> > > +static const struct clk_parent_data cpuck_mux_parents[] =3D {
> > > +       { .hw =3D &npcm8xx_pll_clks[0].hw },
> > > +       { .hw =3D &npcm8xx_pll_clks[1].hw },
> > > +       { .index =3D 0 },
> >
> > This requires a binding update. As of today, there isn't a 'clocks'
> > property for the nuvoton,npcm845-clk binding.
> Can I use fw_name =3D NPCM8XX_CLK_S_REFCLK instead of  .index =3D 0 in
> that way, I will not need to modify nuvoton,npcm845-clk binding.

Why don't you want to modify the binding? If you add a clocks property
like in the example above you will have to modify the binding.
