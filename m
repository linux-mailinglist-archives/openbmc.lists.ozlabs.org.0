Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4606989A
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 17:51:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nSgD5NQ1zDqWb
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 01:51:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ucGBCVwe"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nScn68clzDqMr
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 01:48:57 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id z3so34906154iog.0
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 08:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2ekqYXyWScZdGL4/IuVQy9DAJhZ8DCtVpPL9rbaqvU=;
 b=ucGBCVwecdtUME+/YMeojNAwXZakBMGomin0nC9x95dHz5KQWKy9gXTcoyw8E6fg3b
 CWkR/aAVtbNnslyfoP0cLRICgvftKEgRUSA36BDa3LFP9HVAd//Xrgld9bpJcFNsbqPk
 n1FBLBPhZqmQ7aSSbFNgpB0B1yrGC4JGBtUIk42U8jJqFKlOz2q4dH0qsLE3q8hlf5JB
 v07NBeI1jXhnIaKe30/HtIUoOfpk90slS+/MzpK7YNTNhxwp7Rs6wPc+RHI9JCL3WSc+
 RwndnjrIIr63JSK30QtIONNkeICalsol8ZDl1UxeAcNAd/nMqS/8uAUdKAsO2I2HiljZ
 hi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2ekqYXyWScZdGL4/IuVQy9DAJhZ8DCtVpPL9rbaqvU=;
 b=m9u+Tuuj12TiCtApZ3OLvCOdSJpAM5rQFubgBwy4R8+kSNnNInEdTL/13j8JekPvue
 lsm7QRhg5t4BeKZwqp/rJV8PghboTVjycUj01SLRtbvYxxJWXEJpq3lh2RTI7cgkbvwF
 BKQgh/8VkccrgJS6IBc+k7UL7qaiexbEyartwXZCRxrl1lEzcrr5E3IOqXtsGmxpQXqZ
 PyW/xjxA9GFX7n4CTrn1F3n9EVfSzTdxFSDIa7ry2tWn97uSXj0xXOnqNNZU/MJ8EMRb
 BKfPhT5wnrUEECJE+RyAp4lNOlmhsTUWd+LyTLKw2pNEyEk9cNEnr0IrnqXA2g5yYrMk
 kbGQ==
X-Gm-Message-State: APjAAAWrm2ArJWNemWKTPohzpqkY0Hm7c8U9ZQxlrQg6WEC96EUb7xsG
 8jXAz1UvUqk4Gc+Y62+nmym02UpwR+H5Fp5woU+q
X-Google-Smtp-Source: APXvYqwRwyiP1lrPEyznFken0LaG2OqD8WsDYAhciMSRlzbZcHf2ce5cX3NvhLV+/DYi5sYuazpvzpL43Hn2E3LAQF8=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr25034142iod.220.1563205732236; 
 Mon, 15 Jul 2019 08:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAKKbWA6S7KotAFtLO=ow=XYnLL2Ny5Mz2kcgM1cs+j=5mHQNmw@mail.gmail.com>
 <CAKKbWA5nwsa5kcZ8GCuC3WKJptb6RtZ65izFphd=KaALqeg+BA@mail.gmail.com>
 <f758b14c5d8343de778f9a6ccdcb29c43778d3f2.camel@perches.com>
In-Reply-To: <f758b14c5d8343de778f9a6ccdcb29c43778d3f2.camel@perches.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 15 Jul 2019 18:48:05 +0300
Message-ID: <CAKKbWA7-EyYHQA_yLz5OJRpZSq4Nh-RMwn_zd0C_LKKzc5wErw@mail.gmail.com>
Subject: Re: [PATCH] [v2] clocksource/drivers/npcm: fix GENMASK and timer
 operation
To: Joe Perches <joe@perches.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2019 at 6:25 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2019-07-15 at 18:19 +0300, Avi Fishman wrote:
> > clocksource/drivers/npcm: fix GENMASK and timer operation
> >
> > NPCM7XX_Tx_OPER GENMASK() changed from (27, 3) to (28, 27)
> >
> > in npcm7xx_timer_oneshot() the original NPCM7XX_REG_TCSR0 register was
> > read again after masking it with ~NPCM7XX_Tx_OPER so the masking didn't
> > take effect.
> >
> > npcm7xx_timer_periodic() was not wrong but it wrote to NPCM7XX_REG_TICR0
> > in a middle of read modify write to NPCM7XX_REG_TCSR0 which is
> > confusing.
>
> You might mention how the original use of GENMASK(3, 27)
> was defective or correct without effect.

Done, see v3 of this patch.

>
> > Signed-off-by: Avi Fishman <avifishman70@gmail.com>
> > ---
> >  drivers/clocksource/timer-npcm7xx.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clocksource/timer-npcm7xx.c
> > b/drivers/clocksource/timer-npcm7xx.c
> > index 8a30da7f083b..9780ffd8010e 100644
> > --- a/drivers/clocksource/timer-npcm7xx.c
> > +++ b/drivers/clocksource/timer-npcm7xx.c
> > @@ -32,7 +32,7 @@
> >  #define NPCM7XX_Tx_INTEN               BIT(29)
> >  #define NPCM7XX_Tx_COUNTEN             BIT(30)
> >  #define NPCM7XX_Tx_ONESHOT             0x0
> > -#define NPCM7XX_Tx_OPER                        GENMASK(27, 3)
> > +#define NPCM7XX_Tx_OPER                        GENMASK(28, 27)
> >  #define NPCM7XX_Tx_MIN_PRESCALE                0x1
> >  #define NPCM7XX_Tx_TDR_MASK_BITS       24
> >  #define NPCM7XX_Tx_MAX_CNT             0xFFFFFF
> > @@ -84,8 +84,6 @@ static int npcm7xx_timer_oneshot(struct
> > clock_event_device *evt)
> >
> >         val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >         val &= ~NPCM7XX_Tx_OPER;
> > -
> > -       val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >         val |= NPCM7XX_START_ONESHOT_Tx;
> >         writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >
> > @@ -97,12 +95,11 @@ static int npcm7xx_timer_periodic(struct
> > clock_event_device *evt)
> >         struct timer_of *to = to_timer_of(evt);
> >         u32 val;
> >
> > +       writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
> > +
> >         val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >         val &= ~NPCM7XX_Tx_OPER;
> > -
> > -       writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
> >         val |= NPCM7XX_START_PERIODIC_Tx;
> > -
> >         writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
> >
> >         return 0;
> >
>


-- 
Regards,
Avi
