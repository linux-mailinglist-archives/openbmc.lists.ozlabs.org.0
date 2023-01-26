Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6967367C2E5
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 03:41:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2Q2d1ynZz3ch8
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 13:41:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GCraw7pW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GCraw7pW;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2Q1z22bnz3cfj
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 13:41:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2BB2EB818BE;
	Thu, 26 Jan 2023 02:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94ADC4339B;
	Thu, 26 Jan 2023 02:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674700866;
	bh=XPbqSTeptf7tgqTXA+MY73A0B0SBbzewXCpchE//tUo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GCraw7pWDawA5eEM1iWFjD4jw7ezL+NpFe5UCksCsqUZRc+aLjC2G9SdExvNu0XVt
	 x36AsztqNgxjAA5NXWB/P5nDqjpF52osXKlYvgQbLTXK44gYtOQkXNEhHphXQDuwk3
	 eHEWSiJHjxeMW+cPdqEBfokd+6b39z+Zi21Uyr7j0YPfoqBtVbV3Cg5FfHcKJDwDwR
	 dfPDhZBovLbHJRY56bh0x/3nXjmOaSI+574uXNU/JMLjaRSdXEgImfcspIXDWUhYAL
	 ylYHycjHWZmbLsKcJaxRzCseXh7Xi61kh3nXwWVei5lQB5M6cN9X3bOuOuLBPK6ZuN
	 Igaimmy0Xnyww==
Message-ID: <f9bf509f45550996bda8a79ee145f4b1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAP6Zq1iPmy-fvqqAwBuoskR18v0dPVwYm0tEcE5h1g8fOiOQvg@mail.gmail.com>
References: <20221211204324.169991-1-tmaimon77@gmail.com> <20221211204324.169991-2-tmaimon77@gmail.com> <20221216184402.8A426C433D2@smtp.kernel.org> <CAP6Zq1iPmy-fvqqAwBuoskR18v0dPVwYm0tEcE5h1g8fOiOQvg@mail.gmail.com>
Subject: Re: [PATCH v14 1/1] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 25 Jan 2023 18:41:04 -0800
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

Quoting Tomer Maimon (2023-01-17 09:35:33)
> Hi Stephen,
>=20
> Very sorry for the late reply.
>=20
> On Fri, 16 Dec 2022 at 20:44, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Tomer Maimon (2022-12-11 12:43:24)
> > > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > > new file mode 100644
> > > index 000000000000..08ee7bea6f3a
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-npcm8xx.c
> > > @@ -0,0 +1,650 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > [...]
> > > +#define NPCM8XX_CLK_S_RCP        "rcp"
> > > +
> > > +static const u32 pll_mux_table[] =3D { 0, 1, 2, 3 };
> > > +static const struct clk_parent_data pll_mux_parents[] =3D {
> > > +       { .fw_name =3D NPCM8XX_CLK_S_PLL0, .name =3D NPCM8XX_CLK_S_PL=
L0 },
> >
> > As this is a new driver either you should only have .fw_name here. The
> > .name field is a backup to migrate code over to a new binding. When
> > .fw_name is used there should be an associated DT binding update. I
> What do you mean by associated DT binding? does the.fw_name, for
> example, NPCM8XX_CLK_S_PLL0 need to represent in the device tree?

Yes it should match a string in the "clock-names" property for this clk
provider's device node.

> > doubt the usage of .fw_name is correct though, because aren't these clks
> > internal to the controller? The .fw_name field is about describing does=
 the
> yes the PLL clocks are internal.

Ok.

> > parents that are an input to the clk controller node in DT (because the
> > controller is a consumer of these clks that are external to the device).
> >
> > So can you use the .hw field for these internal clks? Check out
> > CLK_HW_INIT_HWS() macro and friends for a possible way to initialize
> > this.
> but still, I have used devm_clk_hw_register_mux_parent_data_table
> function to register the clock mux,
> should I use  devm_clk_hw_register_mux_parent_hws function instead?

Probably, yes.

> Does this modification need to be done in all the mux parent struct?
> could you point me to some example in the Linux kernel how do you
> think that I should represent the mux clock in the NPCM8XX clock
> driver?

I don't know. If the clk is external to the provider, then it should be
in .fw_name or .index and be provided through DT. Otherwise, if the clk
is internal to the clk provider use direct pointers.

> >
> > > +       { .fw_name =3D NPCM8XX_CLK_S_PLL1, .name =3D NPCM8XX_CLK_S_PL=
L1 },
> > > +       { .fw_name =3D NPCM8XX_CLK_S_REFCLK, .name =3D NPCM8XX_CLK_S_=
REFCLK },
> >
> > Maybe this is external? If so, it would be great to have this in the
> > binding as a `clocks` property.
> O.K.
>=20

Is it external? If so, then fw_name would be correct. You can look at
the kernel-doc above clk_core_get(), but I really just need to spend a
few hours and write a proper kernel-doc for this stuff.
