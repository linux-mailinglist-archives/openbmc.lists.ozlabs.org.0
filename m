Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21B6D868C
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 21:09:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsDhn4gBrz3f8R
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 05:09:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nG7fYdve;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nG7fYdve;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsDhC2t9Qz3chZ
	for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2023 05:09:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4442463965;
	Wed,  5 Apr 2023 19:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A187BC433D2;
	Wed,  5 Apr 2023 19:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680721751;
	bh=veS5PP6wsJDCVk4tZWNSoKTVnJNfOSHkHbVmPeuAOv8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nG7fYdveHgxqZSjemxhtaTnjPeNNHfVk9qBCzEwzlcHGko/Ea2rdTmFyPS2DBbUVD
	 ewZOdz6eKJE4PFkFDZ+rycKtaEZBAi3Nh3b13JJhS7DfLel5ToHTZj2w3kYm8eZhYN
	 JeoHY0Qgk0gNcL8mGIshljfIjGrEe9EfUtoEH8W6XzusQrblg9ktBwViV8C7fyX4af
	 kv9/uiD6D9Svq8e7ghnymJ2Zq9jhBifMsh5dPaiZSsTCH0/avsGKh0sZqqWM7ke3Sn
	 ufBbVKu53840bbRXqOxgsy69s/pXHBEjgO9xjj/oQZKw4LkI7SQ6e2E50ZLhJjUOFj
	 fHUH++Idn00wQ==
Message-ID: <099514a84f97c694d2382812b03aad1e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAP6Zq1hOHJWQSmGoVDz5bSjwdhNyQmaZVOEE8_dX6S4HCFQ2Jg@mail.gmail.com>
References: <20230309194402.119562-1-tmaimon77@gmail.com> <20230309194402.119562-2-tmaimon77@gmail.com> <495fcc93ab28ff8949569ededee954c1.sboyd@kernel.org> <CAP6Zq1hOHJWQSmGoVDz5bSjwdhNyQmaZVOEE8_dX6S4HCFQ2Jg@mail.gmail.com>
Subject: Re: [PATCH v15 1/1] clk: npcm8xx: add clock controller
From: Stephen Boyd <sboyd@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 05 Apr 2023 12:09:09 -0700
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

Quoting Tomer Maimon (2023-03-31 11:07:19)
> On Mon, 20 Mar 2023 at 21:50, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Tomer Maimon (2023-03-09 11:44:02)
> > > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > > new file mode 100644
> > > index 000000000000..67058f121251
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-npcm8xx.c
> > > +       { NPCM8XX_CLK_S_PLL0, { .name =3D NPCM8XX_CLK_S_REFCLK }, NPC=
M8XX_PLLCON0, 0 },
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
> > > +       { .fw_name =3D NPCM8XX_CLK_S_PLL0, .name =3D NPCM8XX_CLK_S_PL=
L0 },
> >
> > You should only have .fw_name or .index when introducing new drivers.
> > The .name field is for existing drivers that want to migrate to
> > clk_parent_data.
> I thought using .name was done when the clock defines in the DT, like
> the ref clock.
> If the other clocks are not defined both .fw_name and .name the clocks
> are not registered properly.

Are you saying that having .name fixes it?

> >
> > > +       { .fw_name =3D NPCM8XX_CLK_S_PLL1, .name =3D NPCM8XX_CLK_S_PL=
L1 },
> > > +       { .name =3D NPCM8XX_CLK_S_REFCLK },
> >
> > Note, this line says to use '.index =3D 0', and .name will be ignored.
> > Maybe just use the index for everything? That makes it simpler and
> > potentially faster because we don't have to do string comparisons
> > anywhere.
> Should the clk_parent_data mux use only .index? if yes how should the
> clock tree have a connection between the parent's clock and the mux
> for example:
> for example, how should the driver connect between
> NPCM8XX_CLK_S_PLL1_DIV2 and the index number in the clk_parent_data?

It's not required, but it makes things simpler to only use .index or
direct clk_hw pointers (.hw). I'm working on a clk documentation
overhaul series right now, about 4 years later than I should have done
it. It will cover this.

The .index field corresponds to the cell index in your devicetree
'clocks' property of the clk provider (the node with #clock-cells
property). If the clk is internal, just use a .hw member and point to it
directly. Don't consume your own clks in DT. If NPCM8XX_CLK_S_PLL1_DIV2
is a clk provided/registered by this device then it should be pointed to
directly with the clk_hw pointer. If NPCM8XX_CLK_S_PLL1_DIV2 is an
external clk that is consumed via the 'clocks' property in DT, then it
should be specified as a parent via the .index member.

> > > +
> > > +static int npcm8xx_clk_probe(struct platform_device *pdev)
> > > +{
> > > +       struct clk_hw_onecell_data *npcm8xx_clk_data;
> > > +       struct device *dev =3D &pdev->dev;
> > > +       void __iomem *clk_base;
> > > +       struct resource *res;
> > > +       struct clk_hw *hw;
> > > +       unsigned int i;
> > > +       int err;
> > > +
> > > +       npcm8xx_clk_data =3D devm_kzalloc(dev, struct_size(npcm8xx_cl=
k_data, hws,
> > > +                                                        NPCM8XX_NUM_=
CLOCKS),
> > > +                                       GFP_KERNEL);
> > > +       if (!npcm8xx_clk_data)
> > > +               return -ENOMEM;
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       clk_base =3D devm_ioremap(dev, res->start, resource_size(res)=
);
> >
> > Can you use devm_platform_ioremap_resource() instead?
> We should use devm_ioremap since the clock register is used for the
> reset driver as well.

Are the clk and reset drivers sharing the register range? If so, please
use auxiliary bus to register the reset driver, and map the register
region once in the driver that registers the auxiliary device. Pass the
iomem pointer to the auxiliary device.
