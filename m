Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 511AFAE91F
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 13:30:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SN9l42wczDsxF
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 21:30:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="dXbNB/04"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SN9670JwzDqkT
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 21:29:28 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id l11so19436271wrx.5
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 04:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0GF5M/Z2kwzroH5gkbeDVOgMn2NsaXM05m+OrHSEuCs=;
 b=dXbNB/047jTSQr0PWNuw4HHchJDoL9QVKE4SzJOfcd/2dkDcfO2I6cmT5ioFlh705T
 SkueVrhEAx2PY7702X8M7/BLSG2OjBDoLNNyyq2HlDOwzFB+SGXLnhIiFh77IOJWyJmz
 m9dZOk+EckrHOMo8E6SK7wlshR/Wgm71GJAf51akQPwmkEs70BRJiAS18PeSbCFcBSve
 0qX2CaXAWt5MXgDyNFhdLcPO/LEsqyf3BaQC8Urp74uXYcmQwnlnXqtT8SRuQC5ipFqr
 WdkSJYYZWFM1zhKEhSt4FCk1XOFDwjWJf/TaI8sl7Zy7hDZwU/Q+H3miLneJCPtlc5NS
 eSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0GF5M/Z2kwzroH5gkbeDVOgMn2NsaXM05m+OrHSEuCs=;
 b=YRMu207Hgu/70zLAoqrIzSVHZiBaPodtjz7T/VGIUUvxvQgBKyx7KvpKl2fDoDzEju
 7oxAP3NZNnl4CWQ+4ABRSlFHfr69OW48OjWrqLuw0rOIErEB0vJgMEZmAhSDyH0HCH8d
 g9I20Il+BmNzZqbC2I7Nntv1UvkYKqrX6E6V2IC3SjdKitAmPJnFw1HRuP9eZnEZ/FNn
 qRnZP8JmrZnI26xmXdgu/KD53rdErLVjRDt6WwAPac7K6v7ak5F4SNWSfY1RI2xDeD0b
 Fmpy6nkKKJkdNNnHuBDN6JpeklhLP0EfkOAeSYSkRw9Y2110wQFY24zrt+cNbhNxxZuv
 4xMA==
X-Gm-Message-State: APjAAAUJV9NWqwFncLaCutqnqcm4fpoEwOl2S/BqKIhMYDVB7Ms4dV/v
 I2BKMAl7PR2Hmi0TUlUzJUyKZg==
X-Google-Smtp-Source: APXvYqxkM6ktiWCEM1gqn7xdCAq1H8SUHv1ONtgQMHWQlXL7zOYWsChPTUEBmgu+6sfEVtGq5LV5sQ==
X-Received: by 2002:adf:f812:: with SMTP id s18mr27406526wrp.32.1568114964889; 
 Tue, 10 Sep 2019 04:29:24 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q14sm37141616wrc.77.2019.09.10.04.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 04:29:24 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:29:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 2/2] hwrng: npcm: add NPCM RNG driver
Message-ID: <20190910112922.xqho33smx6zsmank@holly.lan>
References: <20190828162617.237398-1-tmaimon77@gmail.com>
 <20190828162617.237398-3-tmaimon77@gmail.com>
 <20190829104721.tnjk3bqt3cq6iagr@holly.lan>
 <CAP6Zq1jXUhKjwBHiDKiKcpt_PiJQA61z2SUNg4_LztcnMMJ-Ng@mail.gmail.com>
 <20190909151033.f3inbbas4duzsmh5@holly.lan>
 <CAP6Zq1jZWap+BYoEZ3Hzni-0fxa1xAw2B8tGYHxuFbP0Lz0wpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1jZWap+BYoEZ3Hzni-0fxa1xAw2B8tGYHxuFbP0Lz0wpw@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Mark Rutland <mark.rutland@arm.com>, sumit.garg@linaro.org,
 linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
 Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, vkoul@kernel.org,
 Rob Herring <robh+dt@kernel.org>, mpm@selenic.com,
 Patrick Venture <venture@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 jens.wiklander@linaro.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2019 at 01:52:35PM +0300, Tomer Maimon wrote:
> Hi Daniel,
> 
> Thanks for your prompt reply,
> 
> 
> 
> On Mon, 9 Sep 2019 at 18:10, Daniel Thompson <daniel.thompson@linaro.org>
> wrote:
> 
> > On Mon, Sep 09, 2019 at 05:31:30PM +0300, Tomer Maimon wrote:
> > > Hi Daniel,
> > >
> > > appreciate your comments and sorry for the late reply
> > >
> > > On Thu, 29 Aug 2019 at 13:47, Daniel Thompson <
> > daniel.thompson@linaro.org>
> > > wrote:
> > >
> > > > On Wed, Aug 28, 2019 at 07:26:17PM +0300, Tomer Maimon wrote:
> > > > > Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
> > > > >
> > > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > > > ---
> > > > >  drivers/char/hw_random/Kconfig    |  13 ++
> > > > >  drivers/char/hw_random/Makefile   |   1 +
> > > > >  drivers/char/hw_random/npcm-rng.c | 207
> > ++++++++++++++++++++++++++++++
> > > > >  3 files changed, 221 insertions(+)
> > > > >  create mode 100644 drivers/char/hw_random/npcm-rng.c
> > > > >
> > > > > diff --git a/drivers/char/hw_random/npcm-rng.c
> > > > b/drivers/char/hw_random/npcm-rng.c
> > > > > new file mode 100644
> > > > > index 000000000000..5b4b1b6cb362
> > > > > --- /dev/null
> > > > > +++ b/drivers/char/hw_random/npcm-rng.c
> > > > > @@ -0,0 +1,207 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +// Copyright (c) 2019 Nuvoton Technology corporation.
> > > > > +
> > > > > +#include <linux/kernel.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/io.h>
> > > > > +#include <linux/iopoll.h>
> > > > > +#include <linux/init.h>
> > > > > +#include <linux/random.h>
> > > > > +#include <linux/err.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +#include <linux/hw_random.h>
> > > > > +#include <linux/delay.h>
> > > > > +#include <linux/of_irq.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > > +
> > > > > +#define NPCM_RNGCS_REG               0x00    /* Control and status
> > > > register */
> > > > > +#define NPCM_RNGD_REG                0x04    /* Data register */
> > > > > +#define NPCM_RNGMODE_REG     0x08    /* Mode register */
> > > > > +
> > > > > +#define NPCM_RNG_CLK_SET_25MHZ       GENMASK(4, 3) /* 20-25 MHz */
> > > > > +#define NPCM_RNG_DATA_VALID  BIT(1)
> > > > > +#define NPCM_RNG_ENABLE              BIT(0)
> > > > > +#define NPCM_RNG_M1ROSEL     BIT(1)
> > > > > +
> > > > > +#define NPCM_RNG_TIMEOUT_POLL        20
> > > >
> > > > Might be better to define this in real-world units (such as
> > > > milliseconds) since the timeout is effectively the longest time the
> > > > hardware can take to generate 4 bytes.
> > > >
> > > > > +
> > > > > +#define to_npcm_rng(p)       container_of(p, struct npcm_rng, rng)
> > > > > +
> > > > > +struct npcm_rng {
> > > > > +     void __iomem *base;
> > > > > +     struct hwrng rng;
> > > > > +};
> > > > > +
> > > > > +static int npcm_rng_init(struct hwrng *rng)
> > > > > +{
> > > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > > +     u32 val;
> > > > > +
> > > > > +     val = readl(priv->base + NPCM_RNGCS_REG);
> > > > > +     val |= NPCM_RNG_ENABLE;
> > > > > +     writel(val, priv->base + NPCM_RNGCS_REG);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static void npcm_rng_cleanup(struct hwrng *rng)
> > > > > +{
> > > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > > +     u32 val;
> > > > > +
> > > > > +     val = readl(priv->base + NPCM_RNGCS_REG);
> > > > > +     val &= ~NPCM_RNG_ENABLE;
> > > > > +     writel(val, priv->base + NPCM_RNGCS_REG);
> > > > > +}
> > > > > +
> > > > > +static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)
> > > > > +{
> > > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > > +     int timeout_cnt = 0;
> > > > > +     int ready;
> > > > > +
> > > > > +     ready = readl(priv->base + NPCM_RNGCS_REG) &
> > NPCM_RNG_DATA_VALID;
> > > > > +     while ((ready == 0) && (timeout_cnt < NPCM_RNG_TIMEOUT_POLL)) {
> > > > > +             usleep_range(500, 1000);
> > > > > +             ready = readl(priv->base + NPCM_RNGCS_REG) &
> > > > > +                     NPCM_RNG_DATA_VALID;
> > > > > +             timeout_cnt++;
> > > > > +     }
> > > > > +
> > > > > +     return !!ready;
> > > > > +}
> > > >
> > > > This looks like an open-coded version of readl_poll_timeout()... better
> > > > to use the library function.
> > > >
> > > > Also the sleep looks a bit long to me. What is the generation rate of
> > > > the peripheral? Most RNG drivers have short intervals between data
> > > > generation so they use delays rather than sleeps (a.k.a.
> > > > readl_poll_timeout_atomic() ).
> > >
> > > the HWRNG generate byte of random data in a few milliseconds so it is
> > > better to use the sleep command.
> >
> > That's fine, just use readl_poll_timeout() then.
> >
> >
> > > > > +
> > > > > +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max,
> > bool
> > > > wait)
> > > > > +{
> > > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > > +     int retval = 0;
> > > > > +
> > > > > +     pm_runtime_get_sync((struct device *)priv->rng.priv);
> > > > > +
> > > > > +     while (max >= sizeof(u32)) {
> > > > > +             if (!npcm_rng_wait_ready(rng, wait))
> > > > > +                     break;
> > > >
> > > > The code as currently written does not honour the wait parameter (e.g.
> > > > it sleeps even when wait is false).
> > > >
> > > >
> > > > > +
> > > > > +             *(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
> > > > > +             retval += sizeof(u32);
> > > > > +             buf += sizeof(u32);
> > > > > +             max -= sizeof(u32);
> > > > > +     }
> > > > > +
> > > > > +     pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
> > > > > +     pm_runtime_put_sync_autosuspend((struct device
> > *)priv->rng.priv);
> > > > > +
> > > > > +     return retval || !wait ? retval : -EIO;
> > > > > +}
> > > > > +
> > > > > +static int npcm_rng_probe(struct platform_device *pdev)
> > > > > +{
> > > > > +     struct npcm_rng *priv;
> > > > > +     struct resource *res;
> > > > > +     u32 quality;
> > > > > +     int ret;
> > > > > +
> > > > > +     priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > > > > +     if (!priv)
> > > > > +             return -ENOMEM;
> > > > > +
> > > > > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > > +     priv->base = devm_ioremap_resource(&pdev->dev, res);
> > > > > +     if (IS_ERR(priv->base))
> > > > > +             return PTR_ERR(priv->base);
> > > > > +
> > > > > +     priv->rng.name = pdev->name;
> > > > > +#ifndef CONFIG_PM
> > > > > +     priv->rng.init = npcm_rng_init;
> > > > > +     priv->rng.cleanup = npcm_rng_cleanup;
> > > > > +#endif
> > > > > +     priv->rng.read = npcm_rng_read;
> > > > > +     priv->rng.priv = (unsigned long)&pdev->dev;
> > > > > +     if (of_property_read_u32(pdev->dev.of_node, "quality",
> > &quality))
> > > > > +             priv->rng.quality = 1000;
> > > > > +     else
> > > > > +             priv->rng.quality = quality;
> > > > > +
> > > > > +     writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
> > > > > +#ifndef CONFIG_PM
> > > > > +     writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
> > > > > +#else
> > > > > +     writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
> > > > > +            priv->base + NPCM_RNGCS_REG);
> > > > > +#endif
> > > >
> > > > If this initialization was moved to npcm_rng_init() then there would be
> > > > no need for the additional ifdefing. It would also get rid of the
> > > > (potentially slow) readl calls on the PM wakeup path.
> > > >
> > >
> > > But when the Kernel have PM configuration than the priv->rng.init is not
> > > set and
> > > *add_early_randomness* function is called. for the *add_early_randomness*
> > > success
> > > the hwrng need to enabled in the probe.
> >
> > Sorry but I don't understand this reply.
> >
> > When CONFIG_PM is enabled then the probe function does not currently set
> > NPCM_RNG_ENABLE; instead is relies on npcm_rng_init() being called by
> >
> 
> Sorry maybe I miss understood, but when the  CONFIG_PM enabled so the
> NPCM_RNG_ENABLE sets (the code use ifndef and not ifdef)
> *#ifndef CONFIG_PM*
>        writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
> #else (*CONFIG_PM enabled*)
>        writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
>               priv->base + NPCM_RNGCS_REG);
> #endif
> 
> And the hwrng needed to be enabled to run *add_early_randomness *function
> successfully.
> 
> If the hwrng driver will relay on PM logic to enable the hwrng will be
> disable when *add_early_randomness *function is called.
> 
> the PM logic (as part of pm_runtime_get_sync() ).

I ended up reading my mail out of order and replied to the v2 patch.

The question is *why* the driver doesn't resume properly when adding
early randomness! I think it is because the hwrng_register() is being
called before PM runtime is enabled.


Daniel.
