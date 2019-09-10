Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52010AE996
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 13:55:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SNl35lhqzDvr8
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 21:55:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NNfPbbZB"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SNdt0GbdzDsMN
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 21:50:57 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id b2so18053583otq.10
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GYIia8uCIiJUVALiJSYwnd+aMivWPw4F+FI/mAlUETM=;
 b=NNfPbbZByytYdL7hE8lbS6XiZMiiR9JnX22cIt1RuSvsbaVSzTOci0qAFyAe9bSrBa
 W4czLtUOxpq/11XPqiU6agH6LPm4awGloY4hbXk6YbbrHy3xJUOxPm5/ag7owarjVcU7
 ou3GChuI1vSxW3rXSNyJuZiwxKmpZa3HQSOG9LrR9Z5EWcmUv04fO5DfWwHCLVrQZbw+
 VfIZMgB4IsCYVF63n+y5jXcl4zvAdRpicf/Qecvg4RZR7ns0Ap8xdbpFNbRiPoeWotd/
 OjXs/vWM/tG1UM9FqHW0K8cNhUV3mOt5l4FtimsKf2FGu7MozrVy04a4YAJELzhRT5o+
 GMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GYIia8uCIiJUVALiJSYwnd+aMivWPw4F+FI/mAlUETM=;
 b=G6MNXHohpE2Jy1btgryVRDJV/bZRDifoU8uSAQ7TZnL9bB4xLAAdO0PtRz6hgaoj2+
 VXJEMtoJ5PQ+lDQVcnr9OQo0LfwSS6gaKSUjl6wLgQDE0pm8h4oNlJTYjtviIb+F4S0U
 /Va8BuBCxNTue/KARbt/RxioSvIuQ9wt1Uk09L9Z+loTLdAkMr5j+j7yH0BahUEMcgIH
 0Dw0Ijk09z4VFw32mt7AZLizX67MV2mwj23YnfyhiYS1e9G4U3ccaTPXf070Dx4+KnqJ
 8rQysjmo7A9OmHsePE15scK5Tg7dtwU3zc0nah6eymJHS6xm2h4jWb4fTJDtsAMfc6WD
 n8fA==
X-Gm-Message-State: APjAAAW9dXemZ1iGlIlvEZYQsD4eyRkN96FGUI/T1/gIwxDDjToxozN5
 KwT75vgof5faMD71tOIT5GjG2K06wGzzuDChzk2rexCdftY=
X-Google-Smtp-Source: APXvYqxoNHuVQjCCZjp45N9ShgXtNya5jd5d8znLzFcjN5AmTsP0SEGRco8qabJB0Ij6k1Vln49R5gdAvUDLrA6u8U0=
X-Received: by 2002:a05:6830:1d4e:: with SMTP id
 p14mr2322802oth.292.1568116253539; 
 Tue, 10 Sep 2019 04:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190828162617.237398-1-tmaimon77@gmail.com>
 <20190828162617.237398-3-tmaimon77@gmail.com>
 <20190829104721.tnjk3bqt3cq6iagr@holly.lan>
 <CAP6Zq1jXUhKjwBHiDKiKcpt_PiJQA61z2SUNg4_LztcnMMJ-Ng@mail.gmail.com>
 <20190909151033.f3inbbas4duzsmh5@holly.lan>
 <CAP6Zq1jZWap+BYoEZ3Hzni-0fxa1xAw2B8tGYHxuFbP0Lz0wpw@mail.gmail.com>
 <20190910112922.xqho33smx6zsmank@holly.lan>
In-Reply-To: <20190910112922.xqho33smx6zsmank@holly.lan>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 10 Sep 2019 14:59:57 +0300
Message-ID: <CAP6Zq1gPMNP=enwggKHmPCO878Zciojevsdb0pkJauzQqtuwvQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hwrng: npcm: add NPCM RNG driver
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000424307059231845f"
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

--000000000000424307059231845f
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Sep 2019 at 14:29, Daniel Thompson <daniel.thompson@linaro.org>
wrote:

> On Tue, Sep 10, 2019 at 01:52:35PM +0300, Tomer Maimon wrote:
> > Hi Daniel,
> >
> > Thanks for your prompt reply,
> >
> >
> >
> > On Mon, 9 Sep 2019 at 18:10, Daniel Thompson <daniel.thompson@linaro.org
> >
> > wrote:
> >
> > > On Mon, Sep 09, 2019 at 05:31:30PM +0300, Tomer Maimon wrote:
> > > > Hi Daniel,
> > > >
> > > > appreciate your comments and sorry for the late reply
> > > >
> > > > On Thu, 29 Aug 2019 at 13:47, Daniel Thompson <
> > > daniel.thompson@linaro.org>
> > > > wrote:
> > > >
> > > > > On Wed, Aug 28, 2019 at 07:26:17PM +0300, Tomer Maimon wrote:
> > > > > > Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
> > > > > >
> > > > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > > > > ---
> > > > > >  drivers/char/hw_random/Kconfig    |  13 ++
> > > > > >  drivers/char/hw_random/Makefile   |   1 +
> > > > > >  drivers/char/hw_random/npcm-rng.c | 207
> > > ++++++++++++++++++++++++++++++
> > > > > >  3 files changed, 221 insertions(+)
> > > > > >  create mode 100644 drivers/char/hw_random/npcm-rng.c
> > > > > >
> > > > > > diff --git a/drivers/char/hw_random/npcm-rng.c
> > > > > b/drivers/char/hw_random/npcm-rng.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..5b4b1b6cb362
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/char/hw_random/npcm-rng.c
> > > > > > @@ -0,0 +1,207 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +// Copyright (c) 2019 Nuvoton Technology corporation.
> > > > > > +
> > > > > > +#include <linux/kernel.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/io.h>
> > > > > > +#include <linux/iopoll.h>
> > > > > > +#include <linux/init.h>
> > > > > > +#include <linux/random.h>
> > > > > > +#include <linux/err.h>
> > > > > > +#include <linux/platform_device.h>
> > > > > > +#include <linux/hw_random.h>
> > > > > > +#include <linux/delay.h>
> > > > > > +#include <linux/of_irq.h>
> > > > > > +#include <linux/pm_runtime.h>
> > > > > > +
> > > > > > +#define NPCM_RNGCS_REG               0x00    /* Control and
> status
> > > > > register */
> > > > > > +#define NPCM_RNGD_REG                0x04    /* Data register */
> > > > > > +#define NPCM_RNGMODE_REG     0x08    /* Mode register */
> > > > > > +
> > > > > > +#define NPCM_RNG_CLK_SET_25MHZ       GENMASK(4, 3) /* 20-25 MHz
> */
> > > > > > +#define NPCM_RNG_DATA_VALID  BIT(1)
> > > > > > +#define NPCM_RNG_ENABLE              BIT(0)
> > > > > > +#define NPCM_RNG_M1ROSEL     BIT(1)
> > > > > > +
> > > > > > +#define NPCM_RNG_TIMEOUT_POLL        20
> > > > >
> > > > > Might be better to define this in real-world units (such as
> > > > > milliseconds) since the timeout is effectively the longest time the
> > > > > hardware can take to generate 4 bytes.
> > > > >
> > > > > > +
> > > > > > +#define to_npcm_rng(p)       container_of(p, struct npcm_rng,
> rng)
> > > > > > +
> > > > > > +struct npcm_rng {
> > > > > > +     void __iomem *base;
> > > > > > +     struct hwrng rng;
> > > > > > +};
> > > > > > +
> > > > > > +static int npcm_rng_init(struct hwrng *rng)
> > > > > > +{
> > > > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > > > +     u32 val;
> > > > > > +
> > > > > > +     val = readl(priv->base + NPCM_RNGCS_REG);
> > > > > > +     val |= NPCM_RNG_ENABLE;
> > > > > > +     writel(val, priv->base + NPCM_RNGCS_REG);
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void npcm_rng_cleanup(struct hwrng *rng)
> > > > > > +{
> > > > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > > > +     u32 val;
> > > > > > +
> > > > > > +     val = readl(priv->base + NPCM_RNGCS_REG);
> > > > > > +     val &= ~NPCM_RNG_ENABLE;
> > > > > > +     writel(val, priv->base + NPCM_RNGCS_REG);
> > > > > > +}
> > > > > > +
> > > > > > +static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)
> > > > > > +{
> > > > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > > > +     int timeout_cnt = 0;
> > > > > > +     int ready;
> > > > > > +
> > > > > > +     ready = readl(priv->base + NPCM_RNGCS_REG) &
> > > NPCM_RNG_DATA_VALID;
> > > > > > +     while ((ready == 0) && (timeout_cnt <
> NPCM_RNG_TIMEOUT_POLL)) {
> > > > > > +             usleep_range(500, 1000);
> > > > > > +             ready = readl(priv->base + NPCM_RNGCS_REG) &
> > > > > > +                     NPCM_RNG_DATA_VALID;
> > > > > > +             timeout_cnt++;
> > > > > > +     }
> > > > > > +
> > > > > > +     return !!ready;
> > > > > > +}
> > > > >
> > > > > This looks like an open-coded version of readl_poll_timeout()...
> better
> > > > > to use the library function.
> > > > >
> > > > > Also the sleep looks a bit long to me. What is the generation rate
> of
> > > > > the peripheral? Most RNG drivers have short intervals between data
> > > > > generation so they use delays rather than sleeps (a.k.a.
> > > > > readl_poll_timeout_atomic() ).
> > > >
> > > > the HWRNG generate byte of random data in a few milliseconds so it is
> > > > better to use the sleep command.
> > >
> > > That's fine, just use readl_poll_timeout() then.
> > >
> > >
> > > > > > +
> > > > > > +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t
> max,
> > > bool
> > > > > wait)
> > > > > > +{
> > > > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > > > +     int retval = 0;
> > > > > > +
> > > > > > +     pm_runtime_get_sync((struct device *)priv->rng.priv);
> > > > > > +
> > > > > > +     while (max >= sizeof(u32)) {
> > > > > > +             if (!npcm_rng_wait_ready(rng, wait))
> > > > > > +                     break;
> > > > >
> > > > > The code as currently written does not honour the wait parameter
> (e.g.
> > > > > it sleeps even when wait is false).
> > > > >
> > > > >
> > > > > > +
> > > > > > +             *(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
> > > > > > +             retval += sizeof(u32);
> > > > > > +             buf += sizeof(u32);
> > > > > > +             max -= sizeof(u32);
> > > > > > +     }
> > > > > > +
> > > > > > +     pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
> > > > > > +     pm_runtime_put_sync_autosuspend((struct device
> > > *)priv->rng.priv);
> > > > > > +
> > > > > > +     return retval || !wait ? retval : -EIO;
> > > > > > +}
> > > > > > +
> > > > > > +static int npcm_rng_probe(struct platform_device *pdev)
> > > > > > +{
> > > > > > +     struct npcm_rng *priv;
> > > > > > +     struct resource *res;
> > > > > > +     u32 quality;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > > > > > +     if (!priv)
> > > > > > +             return -ENOMEM;
> > > > > > +
> > > > > > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > > > +     priv->base = devm_ioremap_resource(&pdev->dev, res);
> > > > > > +     if (IS_ERR(priv->base))
> > > > > > +             return PTR_ERR(priv->base);
> > > > > > +
> > > > > > +     priv->rng.name = pdev->name;
> > > > > > +#ifndef CONFIG_PM
> > > > > > +     priv->rng.init = npcm_rng_init;
> > > > > > +     priv->rng.cleanup = npcm_rng_cleanup;
> > > > > > +#endif
> > > > > > +     priv->rng.read = npcm_rng_read;
> > > > > > +     priv->rng.priv = (unsigned long)&pdev->dev;
> > > > > > +     if (of_property_read_u32(pdev->dev.of_node, "quality",
> > > &quality))
> > > > > > +             priv->rng.quality = 1000;
> > > > > > +     else
> > > > > > +             priv->rng.quality = quality;
> > > > > > +
> > > > > > +     writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
> > > > > > +#ifndef CONFIG_PM
> > > > > > +     writel(NPCM_RNG_CLK_SET_25MHZ, priv->base +
> NPCM_RNGCS_REG);
> > > > > > +#else
> > > > > > +     writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
> > > > > > +            priv->base + NPCM_RNGCS_REG);
> > > > > > +#endif
> > > > >
> > > > > If this initialization was moved to npcm_rng_init() then there
> would be
> > > > > no need for the additional ifdefing. It would also get rid of the
> > > > > (potentially slow) readl calls on the PM wakeup path.
> > > > >
> > > >
> > > > But when the Kernel have PM configuration than the priv->rng.init is
> not
> > > > set and
> > > > *add_early_randomness* function is called. for the
> *add_early_randomness*
> > > > success
> > > > the hwrng need to enabled in the probe.
> > >
> > > Sorry but I don't understand this reply.
> > >
> > > When CONFIG_PM is enabled then the probe function does not currently
> set
> > > NPCM_RNG_ENABLE; instead is relies on npcm_rng_init() being called by
> > >
> >
> > Sorry maybe I miss understood, but when the  CONFIG_PM enabled so the
> > NPCM_RNG_ENABLE sets (the code use ifndef and not ifdef)
> > *#ifndef CONFIG_PM*
> >        writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
> > #else (*CONFIG_PM enabled*)
> >        writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
> >               priv->base + NPCM_RNGCS_REG);
> > #endif
> >
> > And the hwrng needed to be enabled to run *add_early_randomness *function
> > successfully.
> >
> > If the hwrng driver will relay on PM logic to enable the hwrng will be
> > disable when *add_early_randomness *function is called.
> >
> > the PM logic (as part of pm_runtime_get_sync() ).
>
> I ended up reading my mail out of order and replied to the v2 patch.
>
> The question is *why* the driver doesn't resume properly when adding
> early randomness! I think it is because the hwrng_register() is being
> called before PM runtime is enabled.
>
>
probably, but I am not sure it will be right to enable the PM runtime
before  hwrng_register() is called.

I will double check it.

>
> Daniel.
>

Thanks,

Tomer

--000000000000424307059231845f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 10 Sep 2019 at 14:29, Daniel =
Thompson &lt;<a href=3D"mailto:daniel.thompson@linaro.org">daniel.thompson@=
linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, Sep 10, 2019 at 01:52:35PM +0300, Tomer Maimon wrote:<br=
>
&gt; Hi Daniel,<br>
&gt; <br>
&gt; Thanks for your prompt reply,<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, 9 Sep 2019 at 18:10, Daniel Thompson &lt;<a href=3D"mailto:dan=
iel.thompson@linaro.org" target=3D"_blank">daniel.thompson@linaro.org</a>&g=
t;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Mon, Sep 09, 2019 at 05:31:30PM +0300, Tomer Maimon wrote:<br>
&gt; &gt; &gt; Hi Daniel,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; appreciate your comments and sorry for the late reply<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 29 Aug 2019 at 13:47, Daniel Thompson &lt;<br>
&gt; &gt; <a href=3D"mailto:daniel.thompson@linaro.org" target=3D"_blank">d=
aniel.thompson@linaro.org</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Aug 28, 2019 at 07:26:17PM +0300, Tomer Maimon =
wrote:<br>
&gt; &gt; &gt; &gt; &gt; Add Nuvoton NPCM BMC Random Number Generator(RNG) =
driver.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:=
tmaimon77@gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/char/hw_random/Kconfig=C2=A0 =C2=A0 =
|=C2=A0 13 ++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/char/hw_random/Makefile=C2=A0 =C2=A0=
|=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 drivers/char/hw_random/npcm-rng.c | 207<br>
&gt; &gt; ++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 221 insertions(+)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 drivers/char/hw_random/np=
cm-rng.c<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/drivers/char/hw_random/npcm-rng.c<br>
&gt; &gt; &gt; &gt; b/drivers/char/hw_random/npcm-rng.c<br>
&gt; &gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; &gt; index 000000000000..5b4b1b6cb362<br>
&gt; &gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; &gt; +++ b/drivers/char/hw_random/npcm-rng.c<br>
&gt; &gt; &gt; &gt; &gt; @@ -0,0 +1,207 @@<br>
&gt; &gt; &gt; &gt; &gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; &gt; &gt; &gt; &gt; +// Copyright (c) 2019 Nuvoton Technology corporat=
ion.<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/module.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/io.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/iopoll.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/init.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/random.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/err.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/hw_random.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/delay.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/of_irq.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +#include &lt;linux/pm_runtime.h&gt;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +#define NPCM_RNGCS_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00=C2=A0 =C2=A0 /* Control and status<br>
&gt; &gt; &gt; &gt; register */<br>
&gt; &gt; &gt; &gt; &gt; +#define NPCM_RNGD_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04=C2=A0 =C2=A0 /* Data register */<br>
&gt; &gt; &gt; &gt; &gt; +#define NPCM_RNGMODE_REG=C2=A0 =C2=A0 =C2=A00x08=
=C2=A0 =C2=A0 /* Mode register */<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +#define NPCM_RNG_CLK_SET_25MHZ=C2=A0 =C2=A0 =C2=
=A0 =C2=A0GENMASK(4, 3) /* 20-25 MHz */<br>
&gt; &gt; &gt; &gt; &gt; +#define NPCM_RNG_DATA_VALID=C2=A0 BIT(1)<br>
&gt; &gt; &gt; &gt; &gt; +#define NPCM_RNG_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
&gt; &gt; &gt; &gt; &gt; +#define NPCM_RNG_M1ROSEL=C2=A0 =C2=A0 =C2=A0BIT(1=
)<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +#define NPCM_RNG_TIMEOUT_POLL=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 20<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Might be better to define this in real-world units (suc=
h as<br>
&gt; &gt; &gt; &gt; milliseconds) since the timeout is effectively the long=
est time the<br>
&gt; &gt; &gt; &gt; hardware can take to generate 4 bytes.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +#define to_npcm_rng(p)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
container_of(p, struct npcm_rng, rng)<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +struct npcm_rng {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct hwrng rng;<br>
&gt; &gt; &gt; &gt; &gt; +};<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +static int npcm_rng_init(struct hwrng *rng)<br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_=
npcm_rng(rng);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl(priv-&gt;base +=
 NPCM_RNGCS_REG);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0val |=3D NPCM_RNG_ENABLE;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(val, priv-&gt;base + N=
PCM_RNGCS_REG);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +static void npcm_rng_cleanup(struct hwrng *rng)<b=
r>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_=
npcm_rng(rng);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl(priv-&gt;base +=
 NPCM_RNGCS_REG);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0val &amp;=3D ~NPCM_RNG_ENABLE=
;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(val, priv-&gt;base + N=
PCM_RNGCS_REG);<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +static bool npcm_rng_wait_ready(struct hwrng *rng=
, bool wait)<br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_=
npcm_rng(rng);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int timeout_cnt =3D 0;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ready;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ready =3D readl(priv-&gt;base=
 + NPCM_RNGCS_REG) &amp;<br>
&gt; &gt; NPCM_RNG_DATA_VALID;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0while ((ready =3D=3D 0) &amp;=
&amp; (timeout_cnt &lt; NPCM_RNG_TIMEOUT_POLL)) {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u=
sleep_range(500, 1000);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eady =3D readl(priv-&gt;base + NPCM_RNGCS_REG) &amp;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_RNG_DATA_VALID;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t=
imeout_cnt++;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return !!ready;<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This looks like an open-coded version of readl_poll_tim=
eout()... better<br>
&gt; &gt; &gt; &gt; to use the library function.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Also the sleep looks a bit long to me. What is the gene=
ration rate of<br>
&gt; &gt; &gt; &gt; the peripheral? Most RNG drivers have short intervals b=
etween data<br>
&gt; &gt; &gt; &gt; generation so they use delays rather than sleeps (a.k.a=
.<br>
&gt; &gt; &gt; &gt; readl_poll_timeout_atomic() ).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; the HWRNG generate byte of random data in a few milliseconds=
 so it is<br>
&gt; &gt; &gt; better to use the sleep command.<br>
&gt; &gt;<br>
&gt; &gt; That&#39;s fine, just use readl_poll_timeout() then.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +static int npcm_rng_read(struct hwrng *rng, void =
*buf, size_t max,<br>
&gt; &gt; bool<br>
&gt; &gt; &gt; &gt; wait)<br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_=
npcm_rng(rng);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int retval =3D 0;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync((struct d=
evice *)priv-&gt;rng.priv);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0while (max &gt;=3D sizeof(u32=
)) {<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f (!npcm_rng_wait_ready(rng, wait))<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The code as currently written does not honour the wait =
parameter (e.g.<br>
&gt; &gt; &gt; &gt; it sleeps even when wait is false).<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=
(u32 *)buf =3D readl(priv-&gt;base + NPCM_RNGD_REG);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
etval +=3D sizeof(u32);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=
uf +=3D sizeof(u32);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m=
ax -=3D sizeof(u32);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy((st=
ruct device *)priv-&gt;rng.priv);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_put_sync_autosuspe=
nd((struct device<br>
&gt; &gt; *)priv-&gt;rng.priv);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return retval || !wait ? retv=
al : -EIO;<br>
&gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +static int npcm_rng_probe(struct platform_device =
*pdev)<br>
&gt; &gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 quality;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;pd=
ev-&gt;dev, sizeof(*priv), GFP_KERNEL);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!priv)<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn -ENOMEM;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource=
(pdev, IORESOURCE_MEM, 0);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;base =3D devm_iorema=
p_resource(&amp;pdev-&gt;dev, res);<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;base))<br=
>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn PTR_ERR(priv-&gt;base);<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;<a href=3D"http://rn=
g.name" rel=3D"noreferrer" target=3D"_blank">rng.name</a> =3D pdev-&gt;name=
;<br>
&gt; &gt; &gt; &gt; &gt; +#ifndef CONFIG_PM<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.init =3D npcm_rn=
g_init;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.cleanup =3D npcm=
_rng_cleanup;<br>
&gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.read =3D npcm_rn=
g_read;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.priv =3D (unsign=
ed long)&amp;pdev-&gt;dev;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(pdev=
-&gt;dev.of_node, &quot;quality&quot;,<br>
&gt; &gt; &amp;quality))<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p=
riv-&gt;rng.quality =3D 1000;<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p=
riv-&gt;rng.quality =3D quality;<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_M1ROSEL, priv=
-&gt;base + NPCM_RNGMODE_REG);<br>
&gt; &gt; &gt; &gt; &gt; +#ifndef CONFIG_PM<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_CLK_SET_25MHZ=
, priv-&gt;base + NPCM_RNGCS_REG);<br>
&gt; &gt; &gt; &gt; &gt; +#else<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_CLK_SET_25MHZ=
 | NPCM_RNG_ENABLE,<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&g=
t;base + NPCM_RNGCS_REG);<br>
&gt; &gt; &gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; If this initialization was moved to npcm_rng_init() the=
n there would be<br>
&gt; &gt; &gt; &gt; no need for the additional ifdefing. It would also get =
rid of the<br>
&gt; &gt; &gt; &gt; (potentially slow) readl calls on the PM wakeup path.<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; But when the Kernel have PM configuration than the priv-&gt;=
rng.init is not<br>
&gt; &gt; &gt; set and<br>
&gt; &gt; &gt; *add_early_randomness* function is called. for the *add_earl=
y_randomness*<br>
&gt; &gt; &gt; success<br>
&gt; &gt; &gt; the hwrng need to enabled in the probe.<br>
&gt; &gt;<br>
&gt; &gt; Sorry but I don&#39;t understand this reply.<br>
&gt; &gt;<br>
&gt; &gt; When CONFIG_PM is enabled then the probe function does not curren=
tly set<br>
&gt; &gt; NPCM_RNG_ENABLE; instead is relies on npcm_rng_init() being calle=
d by<br>
&gt; &gt;<br>
&gt; <br>
&gt; Sorry maybe I miss understood, but when the=C2=A0 CONFIG_PM enabled so=
 the<br>
&gt; NPCM_RNG_ENABLE sets (the code use ifndef and not ifdef)<br>
&gt; *#ifndef CONFIG_PM*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(NPCM_RNG_CLK_SET_25MHZ, priv-&gt;bas=
e + NPCM_RNGCS_REG);<br>
&gt; #else (*CONFIG_PM enabled*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_EN=
ABLE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;base + =
NPCM_RNGCS_REG);<br>
&gt; #endif<br>
&gt; <br>
&gt; And the hwrng needed to be enabled to run *add_early_randomness *funct=
ion<br>
&gt; successfully.<br>
&gt; <br>
&gt; If the hwrng driver will relay on PM logic to enable the hwrng will be=
<br>
&gt; disable when *add_early_randomness *function is called.<br>
&gt; <br>
&gt; the PM logic (as part of pm_runtime_get_sync() ).<br>
<br>
I ended up reading my mail out of order and replied to the v2 patch.<br>
<br>
The question is *why* the driver doesn&#39;t resume properly when adding<br=
>
early randomness! I think it is because the hwrng_register() is being<br>
called before PM runtime is enabled.<br>
<br></blockquote><div><br></div><div>probably, but I am not sure it will be=
 right to enable the PM runtime before=C2=A0 hwrng_register() is called.</d=
iv><div><br></div><div>I will double check it.</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Daniel.<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><di=
v>Tomer=C2=A0</div></div></div>

--000000000000424307059231845f--
