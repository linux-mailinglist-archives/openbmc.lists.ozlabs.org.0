Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB97FD321
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 10:48:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lL0W9F5o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgDyn0wYCz30fF
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 20:48:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lL0W9F5o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgDyB6mzXz300q
	for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2023 20:47:29 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d21b9a5808so9945857b3.2
        for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2023 01:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701251244; x=1701856044; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8qPZDWdHAVcZMmK+WGuyolxgHPOaDer+ydi9AIrYvTQ=;
        b=lL0W9F5oPVO1MtjZ3Y//FnFsLghnLF6DquWpq5i7lkLbpY+H8VFwhD9x0wi6GVta0c
         fkpN+gjU/F5Tfk5E+sPLYPMKoLfDLkn2O49klXsmtPeaoqX64bwud13lKJSrBCptO3jC
         aJ3hnaTTr1YWAibwg78mu66j8I7UPc+lzBc3H2LiVusCJWLETYF05i0cmoEMgzga0AyW
         2AeEqglD4Sa70NisiogMR0mZRBWPcrMyOauA1MtvZMAv33nhHvQCJX3IaOuiaEQlUars
         5nitAL7RmFBLBmjdN4IoQkg4PdYyt/eyYOwM5xAEfTAuPPm3/Qpw0Ql9pkokjRAbvtjR
         6jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701251244; x=1701856044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qPZDWdHAVcZMmK+WGuyolxgHPOaDer+ydi9AIrYvTQ=;
        b=cgEiGHlrNwOF3AWdmKsQEzp5/dhCftYGs4qkSAsJC5Mv9GXoptZemScQCSoQQU/vDY
         bBKcVPpoXL7WTUOCSwlBXAQXkkMLhFnhPh2Od4GclDsbz3XNa8tZ2/4dcoJObgzpp0qT
         Bd7J4QotVrnnYoLy/GU3681fOTV8s19emzfIkpjgdMBAzyfqcJz6FdbQm8oU4HOURPrX
         EEtGdhLPySgZblPh/jZMCzDMgl4pHbhBNJkJUfAgT9J1iR4SuGMeS3X1naSza77C90Vs
         z9Q46Lvck0fTTKGIZzJW1AHGl1/TtndccMgySNfzwcpdgNMARF+94x9PlO5ko98cCbQe
         sLxA==
X-Gm-Message-State: AOJu0YyjsFVTM8Vgd3kFjXn+UePb7KWM+Vepc/eZHTSrEG/2yvRh7Rny
	fsM5crpAh+rMc5o0enAHd/+LQ65gHLmOJq/eXhk=
X-Google-Smtp-Source: AGHT+IHo3hOA6n+50usE2zETLAZfmRy84YOaqNPgxqWdzxdFZ6HxjtqIsiK8LuAqCaDWMDM32YJyquYVVs8cvI/HS8M=
X-Received: by 2002:a0d:cf44:0:b0:5c7:47f:59e8 with SMTP id
 r65-20020a0dcf44000000b005c7047f59e8mr22095699ywd.42.1701251244173; Wed, 29
 Nov 2023 01:47:24 -0800 (PST)
MIME-Version: 1.0
References: <20230928224051.160851-1-tmaimon77@gmail.com> <7d529b2b9a16f238f533f1c03b4261b2.sboyd@kernel.org>
In-Reply-To: <7d529b2b9a16f238f533f1c03b4261b2.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 29 Nov 2023 11:47:12 +0200
Message-ID: <CAP6Zq1ie_meX9Kuz3C8KBkYWxjLBDtimk3PS9=zYOhrGxFikBg@mail.gmail.com>
Subject: Re: [PATCH v20] clk: npcm8xx: add clock controller
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

Thanks for your comments and sorry for the late reply.

On Sat, 7 Oct 2023 at 02:50, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2023-09-28 15:40:51)
> > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > new file mode 100644
> > index 000000000000..e575a8676ca3
> > --- /dev/null
> > +++ b/drivers/clk/clk-npcm8xx.c
> > @@ -0,0 +1,547 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> [...]
> > +
> > +/* configurable dividers: */
> > +static const struct npcm8xx_clk_div_data npcm8xx_divs[] = {
> > +       { NPCM8XX_CLKDIV1, 28, 3, NPCM8XX_CLK_S_ADC,
> > +       { .name = NPCM8XX_CLK_S_PRE_ADC, .index = -1 },
> > +       CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_ADC },
>
> Please format this some other way. I assume one line means one clk, but
> here it is actually three lines. Perhaps something like this?
Ready in V21
>
> > +       {
> > +             NPCM8XX_CLKDIV1, 28, 3, NPCM8XX_CLK_S_ADC,
> > +             { .name = NPCM8XX_CLK_S_PRE_ADC, .index = -1 },
> > +             CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0, NPCM8XX_CLK_ADC
> > +       },
>
> Please stop using the .name member of struct clk_parent_data. That
> member is only there to support drivers that are migrating from a
> binding that didn't specify the parents of clks that are outside of the
> clk controller with the clocks property in their DT node. I see that the
> dts exists upstream, but luckily we don't have a driver merged, so we're
> free to change the binding to specify clks external to the node. The
> .fw_name member will match a 'clock-names' element for the registering
> driver's node. The .index member will match the index in the 'clocks'
> property. Neither of those properties exist in the nuvoton,npcm845-clk
> DT binding, so neither of those members shall be present. This means
> that either the binding needs to be updated, or the clk_parent_data
> structure should be replaced with clk_hw pointers to describe parents.
> I'm going to guess that there aren't any external clk parents, so to
> keep things simple this driver should change to use direct clk_hw
> pointers to describe topology.
Ready in V21
>
> > +       { NPCM8XX_CLKDIV1, 26, 2, NPCM8XX_CLK_S_AHB, { .hw = &hw_pre_clk },
> > +       CLK_DIVIDER_READ_ONLY, CLK_IS_CRITICAL, NPCM8XX_CLK_AHB },
> > +       { NPCM8XX_CLKDIV1, 21, 5, NPCM8XX_CLK_S_PRE_ADC,
> > +       { .hw = &npcm8xx_muxes[6].hw }, CLK_DIVIDER_READ_ONLY, 0, -1 },
> > +       { NPCM8XX_CLKDIV1, 16, 5, NPCM8XX_CLK_S_UART,
> > +       { .hw = &npcm8xx_muxes[3].hw }, 0, 0, NPCM8XX_CLK_UART },
> > +       { NPCM8XX_CLKDIV1, 11, 5, NPCM8XX_CLK_S_MMC,
> > +       { .hw = &npcm8xx_muxes[2].hw }, CLK_DIVIDER_READ_ONLY, 0,
> > +       NPCM8XX_CLK_MMC },
> > +       { NPCM8XX_CLKDIV1, 6, 5, NPCM8XX_CLK_S_SPI3,
> > +       { .fw_name = NPCM8XX_CLK_S_AHB, .name = NPCM8XX_CLK_S_AHB }, 0, 0,
> > +       NPCM8XX_CLK_SPI3 },
> > +       { NPCM8XX_CLKDIV1, 2, 4, NPCM8XX_CLK_S_PCI,
> > +       { .hw = &npcm8xx_muxes[7].hw }, CLK_DIVIDER_READ_ONLY, 0,
> > +       NPCM8XX_CLK_PCI },
>
> BTW, I looked at the dts file upstream (nuvoton-common-npcm8xx.dtsi).
> The reset and clock controller start at the same address, which can only
> mean that they're actually the same device. The two nodes should be
unfortunately, It is two services (reset and clock) that are handled
in the same memory space.
> combined into one node and one driver should match that compatible so
> that one IO mapping is made for the entire clock and reset contoller
> register space. If you want, that driver can make two auxiliary device
> drivers for the reset and clk parts of the io space and then those two
> drivers can reside in drivers/reset and drivers/clk. I don't know where
> the driver goes that matches the compatible node though, probably in
> drivers/soc. This allows us to properly model the logical components
> that make up the device in hardware (clks and resets) while also
> allowing any device specific things for that entire register space to
> live in the soc driver. For example, if some power domain needs to be
> enabled to access that register space it would be attached to the soc
> driver.
Sorry I didn't understand, do you mean to have one driver that handles
the clock and the reset modules and will sis under driver/soc
or one driver that handles the reset and clock IO space?

What about using regmap to handle the clock and the reset? for this,
the NPCM clock driver will use a unique clock setting like it is done
in Tegra clk.
https://elixir.bootlin.com/linux/v6.7-rc2/source/drivers/clk/tegra/clk-divider.c
instead of using clk_divide and clk_mux default services.

Thanks,

Tomer
