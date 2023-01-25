Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2226367B6B7
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 17:19:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P28Dq6svQz3cf5
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 03:19:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fx79Yiu3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fx79Yiu3;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P28DB5jJ9z3c6C
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 03:19:05 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id h17so2241954ljq.4
        for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2023 08:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VWTwmjgTRG2EECSYQmhAYPRybSGpNQjjUuI6hEqENqQ=;
        b=fx79Yiu3p2VXSMIcnE7/zAtFUxCLQDsSiyj52gsKmsSDYNjSzuO4hPDMCxgq28t05i
         mh+tX7/+ncTaf2xBg9P9U6WuEyl3q1g2et/x2160Z/dI9KMElTdFj6t0cOz3t51M8VFl
         5QeVyLwBk9BKztwZzSLq/3Vxhz98Vs4D3T3u0f7fe/VYf6X0fi2+G7xtsqDKCblkxpZl
         TfcgDwHkqyM98dq5Gzt9aLzQp0Vzkcku4dlAq58MqSfkv1tl+ChM/bk7ssoQiLE1+18+
         WlhvCV2fjS44+JitD9d1InSaypTg5JxlrHMx5tBIVqThjhLy5jkDKOmSnLyc4b90KeVg
         t1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWTwmjgTRG2EECSYQmhAYPRybSGpNQjjUuI6hEqENqQ=;
        b=lEaUMv75z96bul0XJfV3JUT4+iQH8QDWsc6SIdSUZ/biI4PGVE2v+LbjlNeA8kUu+W
         iUe9mSRmOoUSV9oFmLlatRKLUyFbANX/uLZ5zyy5+cCnz56TzJbZ6uND3YxiGnvWSalr
         6cMv7P5t2wBMEdu8X6xud7oqc5uhoTa9b7AvtsfPUufCCgKHZon+eKnrPD94434AdGU6
         kn8ViSwUGbo9a3sfSm6rLxDSZtWy/QDOIIDOhxx7hiLRUi2zuph1TfoKKisJnYIxXaHf
         ydZzHy9u0xIVgt1k/2hKg+ZYvmqP0wx4lNGFelu6/1tvp0y15SuaH2n2F2kBjeXXRGsG
         Qtjg==
X-Gm-Message-State: AFqh2koI89l9qMRwhWS4Ef7yG3cGPwfYugb+HLi2gHezmGys706u04Fz
	QazLHt9tnpemA/Jm+YY7KIpPPlBZfqF/190yr2w=
X-Google-Smtp-Source: AMrXdXt+i/C8qLbsPe1lcHCbto7pEcuq4AoalDKFW9EXEReHLxE56apK7IJ7DuB55V7+a9FU6onq+yWAq9F1fTPa7cw=
X-Received: by 2002:a2e:9210:0:b0:28b:cb2b:d11c with SMTP id
 k16-20020a2e9210000000b0028bcb2bd11cmr1873538ljg.73.1674663538274; Wed, 25
 Jan 2023 08:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20221211204324.169991-1-tmaimon77@gmail.com> <20221211204324.169991-2-tmaimon77@gmail.com>
 <20221216184402.8A426C433D2@smtp.kernel.org> <CAP6Zq1iPmy-fvqqAwBuoskR18v0dPVwYm0tEcE5h1g8fOiOQvg@mail.gmail.com>
In-Reply-To: <CAP6Zq1iPmy-fvqqAwBuoskR18v0dPVwYm0tEcE5h1g8fOiOQvg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 25 Jan 2023 18:18:47 +0200
Message-ID: <CAP6Zq1iAMcahqZJz1WTYokXoxJWROk3YK5br3OG1gry2uMrq7A@mail.gmail.com>
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

Kind reminder regarding the NPCM clock questions

Thanks,

Tomer

On Tue, 17 Jan 2023 at 19:35, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Stephen,
>
> Very sorry for the late reply.
>
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
> > > +static const u32 pll_mux_table[] = { 0, 1, 2, 3 };
> > > +static const struct clk_parent_data pll_mux_parents[] = {
> > > +       { .fw_name = NPCM8XX_CLK_S_PLL0, .name = NPCM8XX_CLK_S_PLL0 },
> >
> > As this is a new driver either you should only have .fw_name here. The
> > .name field is a backup to migrate code over to a new binding. When
> > .fw_name is used there should be an associated DT binding update. I
> What do you mean by associated DT binding? does the.fw_name, for
> example, NPCM8XX_CLK_S_PLL0 need to represent in the device tree?
> > doubt the usage of .fw_name is correct though, because aren't these clks
> > internal to the controller? The .fw_name field is about describing does the
> yes the PLL clocks are internal.
> > parents that are an input to the clk controller node in DT (because the
> > controller is a consumer of these clks that are external to the device).
> >
> > So can you use the .hw field for these internal clks? Check out
> > CLK_HW_INIT_HWS() macro and friends for a possible way to initialize
> > this.
> but still, I have used devm_clk_hw_register_mux_parent_data_table
> function to register the clock mux,
> should I use  devm_clk_hw_register_mux_parent_hws function instead?
> Does this modification need to be done in all the mux parent struct?
> could you point me to some example in the Linux kernel how do you
> think that I should represent the mux clock in the NPCM8XX clock
> driver?
> >
> > > +       { .fw_name = NPCM8XX_CLK_S_PLL1, .name = NPCM8XX_CLK_S_PLL1 },
> > > +       { .fw_name = NPCM8XX_CLK_S_REFCLK, .name = NPCM8XX_CLK_S_REFCLK },
> >
> > Maybe this is external? If so, it would be great to have this in the
> > binding as a `clocks` property.
> O.K.
>
> Thanks,
>
> Tomer
