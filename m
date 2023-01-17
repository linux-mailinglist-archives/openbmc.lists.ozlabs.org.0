Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2CA66E511
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 18:36:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxGK65fFFz3cdS
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 04:36:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MyCE+2jZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MyCE+2jZ;
	dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxGJV1rTdz2x9L
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 04:35:52 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id bn6so33892401ljb.13
        for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2023 09:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eqwxXzbfJuwcyGV/f2tlqmYfB0CiqMfLfLaQcdfnmUc=;
        b=MyCE+2jZcl1rM9cMmvHpoG06LRLV/svFtYCoO7JmE82low/a5o3Cem3f5q1BtoQX8v
         sFW+sal/QrDLsHz8gQ64WHxjZovKa7Y/mfCCSAp65ek67BRv+ygF8vlRveB89Uz0jfTk
         LYTsDuhBYjsRPL1z3Pt4OfNEl3YtsdA2xBqLhb2bEVpoPtGLewff/XmAGKcFVI/tikRj
         IsWx5dmwQ/f2mJqw2EeSOEfdaSq8IxD8b7h08djbGInpi6XK/7dbEorU9q6EBr/gopcT
         UeTUv1QV3st+GxOzcbh3UIuwT9dn3nmnwwiQkntfEUCGw7TAVLidEsZFinZk7ivPGmgd
         SIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqwxXzbfJuwcyGV/f2tlqmYfB0CiqMfLfLaQcdfnmUc=;
        b=7xTb472smSa/63JNg88yXVGAO8BKdYaipXbYM86RqpFXBlxjESpG/zLTAHcnZrhAji
         huLM1SelYKXpBgash0m0uYPfh7jA5p5SvHfXZJNnpKeVEzTuOFFobsvCcmxSfLsLKytm
         cbyNYRo1EW2/NR71kJbQv55bMh8h2X2grFV6sKgaE4K27WXKAPzEAQxbedIZk7V8Tr5I
         DSe5auBtvMUPEYxN1lxDVnUxWz7FJBm1JJnc7rtGMMkiXVHrUM4/LT8VqEyJdk0MMt47
         btBdEFih05CEUDjKEqPE3oHlvLGQAtii4442aS7h3BmZTaSlavNk3N/120wrDSYyXeXB
         /E/A==
X-Gm-Message-State: AFqh2kphHetS5hQU8eoYhfhMfxTeok6/j4Lvmixn/jAiyHymIrXM4UNY
	Zz+KWXgHBcakiioqs4OOM4redjU/mcid7tWBBW8=
X-Google-Smtp-Source: AMrXdXtTvhPNqCVQYqglQf+ISfVQE7hLx5JKwaKAIPT/rLf6I8GI1A9GLS3VUlQLvSF000OVBErwGm6Ra1X22JJ+XZU=
X-Received: by 2002:a2e:9c83:0:b0:287:4e8e:2139 with SMTP id
 x3-20020a2e9c83000000b002874e8e2139mr427811lji.73.1673976944884; Tue, 17 Jan
 2023 09:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20221211204324.169991-1-tmaimon77@gmail.com> <20221211204324.169991-2-tmaimon77@gmail.com>
 <20221216184402.8A426C433D2@smtp.kernel.org>
In-Reply-To: <20221216184402.8A426C433D2@smtp.kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 17 Jan 2023 19:35:33 +0200
Message-ID: <CAP6Zq1iPmy-fvqqAwBuoskR18v0dPVwYm0tEcE5h1g8fOiOQvg@mail.gmail.com>
Subject: Re: [PATCH v14 1/1] clk: npcm8xx: add clock controller
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

Very sorry for the late reply.

On Fri, 16 Dec 2022 at 20:44, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2022-12-11 12:43:24)
> > diff --git a/drivers/clk/clk-npcm8xx.c b/drivers/clk/clk-npcm8xx.c
> > new file mode 100644
> > index 000000000000..08ee7bea6f3a
> > --- /dev/null
> > +++ b/drivers/clk/clk-npcm8xx.c
> > @@ -0,0 +1,650 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> [...]
> > +#define NPCM8XX_CLK_S_RCP        "rcp"
> > +
> > +static const u32 pll_mux_table[] = { 0, 1, 2, 3 };
> > +static const struct clk_parent_data pll_mux_parents[] = {
> > +       { .fw_name = NPCM8XX_CLK_S_PLL0, .name = NPCM8XX_CLK_S_PLL0 },
>
> As this is a new driver either you should only have .fw_name here. The
> .name field is a backup to migrate code over to a new binding. When
> .fw_name is used there should be an associated DT binding update. I
What do you mean by associated DT binding? does the.fw_name, for
example, NPCM8XX_CLK_S_PLL0 need to represent in the device tree?
> doubt the usage of .fw_name is correct though, because aren't these clks
> internal to the controller? The .fw_name field is about describing does the
yes the PLL clocks are internal.
> parents that are an input to the clk controller node in DT (because the
> controller is a consumer of these clks that are external to the device).
>
> So can you use the .hw field for these internal clks? Check out
> CLK_HW_INIT_HWS() macro and friends for a possible way to initialize
> this.
but still, I have used devm_clk_hw_register_mux_parent_data_table
function to register the clock mux,
should I use  devm_clk_hw_register_mux_parent_hws function instead?
Does this modification need to be done in all the mux parent struct?
could you point me to some example in the Linux kernel how do you
think that I should represent the mux clock in the NPCM8XX clock
driver?
>
> > +       { .fw_name = NPCM8XX_CLK_S_PLL1, .name = NPCM8XX_CLK_S_PLL1 },
> > +       { .fw_name = NPCM8XX_CLK_S_REFCLK, .name = NPCM8XX_CLK_S_REFCLK },
>
> Maybe this is external? If so, it would be great to have this in the
> binding as a `clocks` property.
O.K.

Thanks,

Tomer
