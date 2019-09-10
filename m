Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C60FAE88F
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 12:44:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SM900pcrzDsN1
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 20:44:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTFxgu0c"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SM890WNszDsGD
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 20:43:34 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id g16so2612058otp.8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 03:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4qpf9RwTSC8g32++XjeIesX488ki0t90aZuHQKdRUQ=;
 b=MTFxgu0c1/YkW/1kHguduXcEC9ZxrE/n1eFy+esVJNAklCOpHwap4QVIepEiLA2Ca7
 cybHO9/sg0Lbf+QesLgSvf32LS3wbbDkxpopYun8K4GMDxtGhktduXNal2dTHukQfax3
 cDxnbx0uLUCXmDrUgPvOa9VYhQ4b5AP3JroaHi3XSOSPLraPanPGFH7hT+gRfB3YWXqE
 O12XzybacgSgHdr/H8RWC2iqdn/4OMiySP27/BrBW2ng9K0s4BMoU1M4KF3Y7SOVewtN
 TtPYPhdHZ+/kvKezbRjyAYC7TeNS6nVhD09IxyaxHKtc+gvri7+hZJhLw/EwrEJnNSm8
 TUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4qpf9RwTSC8g32++XjeIesX488ki0t90aZuHQKdRUQ=;
 b=JqULHnDbLAOVJdGGbdigmhP7kdH+90c73+tRkGJ8KIuTv7qTZStFOLbN5qILtEvYpS
 hR9YAaITeuz18jZZhRxjzTQzv0z1esR9JUJKiT2BiJXLRCnPdMY6tfC7YK7XZ4aIIsaQ
 Q/YuhF7ek9k5m4kxTTd1k/EQ8F25q71ZHPIlxFfuqxOY1xsYyFF+uJpWkJKFKVRQzHlm
 c1PDnhTP/dIvFmQP6i2rJNiZmZRFAnb/gQ1ixEo/zqlqyfIuQdr4vMoEKpx/RM/bkbDQ
 49Q/0eqp/OhNGKc2+nrMfGmEbxfATQJBLJkOYWmseyxtzgygplqQJsP+6atfQYnqzK85
 uK5w==
X-Gm-Message-State: APjAAAVC443LJCWK9Z67bSwjac7Q7oN8gzPs62MAGThM8DYP+uhstOzS
 a9/JCao17Z/7S0EJd8IglX5EOqmrpKM1veB72+w=
X-Google-Smtp-Source: APXvYqwnLFnRYvtEUDmh2PXOpcd9MWvS4Crnitn7BmWapkl3cGTq3zuuRX0ISEln9HG9yOeWro1KufVDaFb2J4hPKZg=
X-Received: by 2002:a05:6830:1d4e:: with SMTP id
 p14mr1981599oth.292.1568112210714; 
 Tue, 10 Sep 2019 03:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190828162617.237398-1-tmaimon77@gmail.com>
 <20190828162617.237398-3-tmaimon77@gmail.com>
 <20190829104721.tnjk3bqt3cq6iagr@holly.lan>
 <CAP6Zq1jXUhKjwBHiDKiKcpt_PiJQA61z2SUNg4_LztcnMMJ-Ng@mail.gmail.com>
 <20190909151033.f3inbbas4duzsmh5@holly.lan>
In-Reply-To: <20190909151033.f3inbbas4duzsmh5@holly.lan>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 10 Sep 2019 13:52:35 +0300
Message-ID: <CAP6Zq1jZWap+BYoEZ3Hzni-0fxa1xAw2B8tGYHxuFbP0Lz0wpw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hwrng: npcm: add NPCM RNG driver
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000049a5e8059230937d"
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

--00000000000049a5e8059230937d
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thanks for your prompt reply,



On Mon, 9 Sep 2019 at 18:10, Daniel Thompson <daniel.thompson@linaro.org>
wrote:

> On Mon, Sep 09, 2019 at 05:31:30PM +0300, Tomer Maimon wrote:
> > Hi Daniel,
> >
> > appreciate your comments and sorry for the late reply
> >
> > On Thu, 29 Aug 2019 at 13:47, Daniel Thompson <
> daniel.thompson@linaro.org>
> > wrote:
> >
> > > On Wed, Aug 28, 2019 at 07:26:17PM +0300, Tomer Maimon wrote:
> > > > Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
> > > >
> > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > > ---
> > > >  drivers/char/hw_random/Kconfig    |  13 ++
> > > >  drivers/char/hw_random/Makefile   |   1 +
> > > >  drivers/char/hw_random/npcm-rng.c | 207
> ++++++++++++++++++++++++++++++
> > > >  3 files changed, 221 insertions(+)
> > > >  create mode 100644 drivers/char/hw_random/npcm-rng.c
> > > >
> > > > diff --git a/drivers/char/hw_random/npcm-rng.c
> > > b/drivers/char/hw_random/npcm-rng.c
> > > > new file mode 100644
> > > > index 000000000000..5b4b1b6cb362
> > > > --- /dev/null
> > > > +++ b/drivers/char/hw_random/npcm-rng.c
> > > > @@ -0,0 +1,207 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +// Copyright (c) 2019 Nuvoton Technology corporation.
> > > > +
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/io.h>
> > > > +#include <linux/iopoll.h>
> > > > +#include <linux/init.h>
> > > > +#include <linux/random.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/hw_random.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/of_irq.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +
> > > > +#define NPCM_RNGCS_REG               0x00    /* Control and status
> > > register */
> > > > +#define NPCM_RNGD_REG                0x04    /* Data register */
> > > > +#define NPCM_RNGMODE_REG     0x08    /* Mode register */
> > > > +
> > > > +#define NPCM_RNG_CLK_SET_25MHZ       GENMASK(4, 3) /* 20-25 MHz */
> > > > +#define NPCM_RNG_DATA_VALID  BIT(1)
> > > > +#define NPCM_RNG_ENABLE              BIT(0)
> > > > +#define NPCM_RNG_M1ROSEL     BIT(1)
> > > > +
> > > > +#define NPCM_RNG_TIMEOUT_POLL        20
> > >
> > > Might be better to define this in real-world units (such as
> > > milliseconds) since the timeout is effectively the longest time the
> > > hardware can take to generate 4 bytes.
> > >
> > > > +
> > > > +#define to_npcm_rng(p)       container_of(p, struct npcm_rng, rng)
> > > > +
> > > > +struct npcm_rng {
> > > > +     void __iomem *base;
> > > > +     struct hwrng rng;
> > > > +};
> > > > +
> > > > +static int npcm_rng_init(struct hwrng *rng)
> > > > +{
> > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > +     u32 val;
> > > > +
> > > > +     val = readl(priv->base + NPCM_RNGCS_REG);
> > > > +     val |= NPCM_RNG_ENABLE;
> > > > +     writel(val, priv->base + NPCM_RNGCS_REG);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void npcm_rng_cleanup(struct hwrng *rng)
> > > > +{
> > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > +     u32 val;
> > > > +
> > > > +     val = readl(priv->base + NPCM_RNGCS_REG);
> > > > +     val &= ~NPCM_RNG_ENABLE;
> > > > +     writel(val, priv->base + NPCM_RNGCS_REG);
> > > > +}
> > > > +
> > > > +static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)
> > > > +{
> > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > +     int timeout_cnt = 0;
> > > > +     int ready;
> > > > +
> > > > +     ready = readl(priv->base + NPCM_RNGCS_REG) &
> NPCM_RNG_DATA_VALID;
> > > > +     while ((ready == 0) && (timeout_cnt < NPCM_RNG_TIMEOUT_POLL)) {
> > > > +             usleep_range(500, 1000);
> > > > +             ready = readl(priv->base + NPCM_RNGCS_REG) &
> > > > +                     NPCM_RNG_DATA_VALID;
> > > > +             timeout_cnt++;
> > > > +     }
> > > > +
> > > > +     return !!ready;
> > > > +}
> > >
> > > This looks like an open-coded version of readl_poll_timeout()... better
> > > to use the library function.
> > >
> > > Also the sleep looks a bit long to me. What is the generation rate of
> > > the peripheral? Most RNG drivers have short intervals between data
> > > generation so they use delays rather than sleeps (a.k.a.
> > > readl_poll_timeout_atomic() ).
> >
> > the HWRNG generate byte of random data in a few milliseconds so it is
> > better to use the sleep command.
>
> That's fine, just use readl_poll_timeout() then.
>
>
> > > > +
> > > > +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max,
> bool
> > > wait)
> > > > +{
> > > > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > > > +     int retval = 0;
> > > > +
> > > > +     pm_runtime_get_sync((struct device *)priv->rng.priv);
> > > > +
> > > > +     while (max >= sizeof(u32)) {
> > > > +             if (!npcm_rng_wait_ready(rng, wait))
> > > > +                     break;
> > >
> > > The code as currently written does not honour the wait parameter (e.g.
> > > it sleeps even when wait is false).
> > >
> > >
> > > > +
> > > > +             *(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
> > > > +             retval += sizeof(u32);
> > > > +             buf += sizeof(u32);
> > > > +             max -= sizeof(u32);
> > > > +     }
> > > > +
> > > > +     pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
> > > > +     pm_runtime_put_sync_autosuspend((struct device
> *)priv->rng.priv);
> > > > +
> > > > +     return retval || !wait ? retval : -EIO;
> > > > +}
> > > > +
> > > > +static int npcm_rng_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct npcm_rng *priv;
> > > > +     struct resource *res;
> > > > +     u32 quality;
> > > > +     int ret;
> > > > +
> > > > +     priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > > > +     if (!priv)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +     priv->base = devm_ioremap_resource(&pdev->dev, res);
> > > > +     if (IS_ERR(priv->base))
> > > > +             return PTR_ERR(priv->base);
> > > > +
> > > > +     priv->rng.name = pdev->name;
> > > > +#ifndef CONFIG_PM
> > > > +     priv->rng.init = npcm_rng_init;
> > > > +     priv->rng.cleanup = npcm_rng_cleanup;
> > > > +#endif
> > > > +     priv->rng.read = npcm_rng_read;
> > > > +     priv->rng.priv = (unsigned long)&pdev->dev;
> > > > +     if (of_property_read_u32(pdev->dev.of_node, "quality",
> &quality))
> > > > +             priv->rng.quality = 1000;
> > > > +     else
> > > > +             priv->rng.quality = quality;
> > > > +
> > > > +     writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
> > > > +#ifndef CONFIG_PM
> > > > +     writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
> > > > +#else
> > > > +     writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
> > > > +            priv->base + NPCM_RNGCS_REG);
> > > > +#endif
> > >
> > > If this initialization was moved to npcm_rng_init() then there would be
> > > no need for the additional ifdefing. It would also get rid of the
> > > (potentially slow) readl calls on the PM wakeup path.
> > >
> >
> > But when the Kernel have PM configuration than the priv->rng.init is not
> > set and
> > *add_early_randomness* function is called. for the *add_early_randomness*
> > success
> > the hwrng need to enabled in the probe.
>
> Sorry but I don't understand this reply.
>
> When CONFIG_PM is enabled then the probe function does not currently set
> NPCM_RNG_ENABLE; instead is relies on npcm_rng_init() being called by
>

Sorry maybe I miss understood, but when the  CONFIG_PM enabled so the
NPCM_RNG_ENABLE sets (the code use ifndef and not ifdef)
*#ifndef CONFIG_PM*
       writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
#else (*CONFIG_PM enabled*)
       writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
              priv->base + NPCM_RNGCS_REG);
#endif

And the hwrng needed to be enabled to run *add_early_randomness *function
successfully.

If the hwrng driver will relay on PM logic to enable the hwrng will be
disable when *add_early_randomness *function is called.

the PM logic (as part of pm_runtime_get_sync() ).
>
> Given the code *already* relies on npcm_rng_init() being called by the
> PM logic why does it matter if additional init is put there?
>
>
> Daniel.
>

Thanks,

Tomer

--00000000000049a5e8059230937d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Dani=
el,<div><br></div><div>Thanks for your prompt reply,</div><div><br></div><d=
iv><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, 9 Sep 2019 at 18:10, Daniel Thompson &lt;<a href=3D"ma=
ilto:daniel.thompson@linaro.org">daniel.thompson@linaro.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Sep 09, =
2019 at 05:31:30PM +0300, Tomer Maimon wrote:<br>
&gt; Hi Daniel,<br>
&gt; <br>
&gt; appreciate your comments and sorry for the late reply<br>
&gt; <br>
&gt; On Thu, 29 Aug 2019 at 13:47, Daniel Thompson &lt;<a href=3D"mailto:da=
niel.thompson@linaro.org" target=3D"_blank">daniel.thompson@linaro.org</a>&=
gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Aug 28, 2019 at 07:26:17PM +0300, Tomer Maimon wrote:<br>
&gt; &gt; &gt; Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@=
gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 drivers/char/hw_random/Kconfig=C2=A0 =C2=A0 |=C2=A0 13=
 ++<br>
&gt; &gt; &gt;=C2=A0 drivers/char/hw_random/Makefile=C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
&gt; &gt; &gt;=C2=A0 drivers/char/hw_random/npcm-rng.c | 207 ++++++++++++++=
++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 3 files changed, 221 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/char/hw_random/npcm-rng.c<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/drivers/char/hw_random/npcm-rng.c<br>
&gt; &gt; b/drivers/char/hw_random/npcm-rng.c<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 000000000000..5b4b1b6cb362<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/drivers/char/hw_random/npcm-rng.c<br>
&gt; &gt; &gt; @@ -0,0 +1,207 @@<br>
&gt; &gt; &gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; &gt; &gt; +// Copyright (c) 2019 Nuvoton Technology corporation.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/module.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/io.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/iopoll.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/init.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/random.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/err.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/hw_random.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/delay.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/of_irq.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/pm_runtime.h&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define NPCM_RNGCS_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x00=C2=A0 =C2=A0 /* Control and status<br>
&gt; &gt; register */<br>
&gt; &gt; &gt; +#define NPCM_RNGD_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x04=C2=A0 =C2=A0 /* Data register */<br>
&gt; &gt; &gt; +#define NPCM_RNGMODE_REG=C2=A0 =C2=A0 =C2=A00x08=C2=A0 =C2=
=A0 /* Mode register */<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define NPCM_RNG_CLK_SET_25MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0GE=
NMASK(4, 3) /* 20-25 MHz */<br>
&gt; &gt; &gt; +#define NPCM_RNG_DATA_VALID=C2=A0 BIT(1)<br>
&gt; &gt; &gt; +#define NPCM_RNG_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT(0)<br>
&gt; &gt; &gt; +#define NPCM_RNG_M1ROSEL=C2=A0 =C2=A0 =C2=A0BIT(1)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define NPCM_RNG_TIMEOUT_POLL=C2=A0 =C2=A0 =C2=A0 =C2=A0 20=
<br>
&gt; &gt;<br>
&gt; &gt; Might be better to define this in real-world units (such as<br>
&gt; &gt; milliseconds) since the timeout is effectively the longest time t=
he<br>
&gt; &gt; hardware can take to generate 4 bytes.<br>
&gt; &gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define to_npcm_rng(p)=C2=A0 =C2=A0 =C2=A0 =C2=A0container_=
of(p, struct npcm_rng, rng)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +struct npcm_rng {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct hwrng rng;<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int npcm_rng_init(struct hwrng *rng)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(r=
ng);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl(priv-&gt;base + NPCM_RNGC=
S_REG);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0val |=3D NPCM_RNG_ENABLE;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(val, priv-&gt;base + NPCM_RNGCS_=
REG);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static void npcm_rng_cleanup(struct hwrng *rng)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(r=
ng);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl(priv-&gt;base + NPCM_RNGC=
S_REG);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0val &amp;=3D ~NPCM_RNG_ENABLE;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(val, priv-&gt;base + NPCM_RNGCS_=
REG);<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static bool npcm_rng_wait_ready(struct hwrng *rng, bool wai=
t)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(r=
ng);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int timeout_cnt =3D 0;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ready;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ready =3D readl(priv-&gt;base + NPCM_RN=
GCS_REG) &amp; NPCM_RNG_DATA_VALID;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0while ((ready =3D=3D 0) &amp;&amp; (tim=
eout_cnt &lt; NPCM_RNG_TIMEOUT_POLL)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_rang=
e(500, 1000);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ready =3D r=
eadl(priv-&gt;base + NPCM_RNGCS_REG) &amp;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0NPCM_RNG_DATA_VALID;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout_cnt=
++;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return !!ready;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt;<br>
&gt; &gt; This looks like an open-coded version of readl_poll_timeout()... =
better<br>
&gt; &gt; to use the library function.<br>
&gt; &gt;<br>
&gt; &gt; Also the sleep looks a bit long to me. What is the generation rat=
e of<br>
&gt; &gt; the peripheral? Most RNG drivers have short intervals between dat=
a<br>
&gt; &gt; generation so they use delays rather than sleeps (a.k.a.<br>
&gt; &gt; readl_poll_timeout_atomic() ).<br>
&gt;<br>
&gt; the HWRNG generate byte of random data in a few milliseconds so it is<=
br>
&gt; better to use the sleep command.<br>
<br>
That&#39;s fine, just use readl_poll_timeout() then.<br>
<br>
<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int npcm_rng_read(struct hwrng *rng, void *buf, size=
_t max, bool<br>
&gt; &gt; wait)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(r=
ng);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int retval =3D 0;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync((struct device *)pr=
iv-&gt;rng.priv);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0while (max &gt;=3D sizeof(u32)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!npcm_r=
ng_wait_ready(rng, wait))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt;<br>
&gt; &gt; The code as currently written does not honour the wait parameter =
(e.g.<br>
&gt; &gt; it sleeps even when wait is false).<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(u32 *)buf=
 =3D readl(priv-&gt;base + NPCM_RNGD_REG);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval +=3D=
 sizeof(u32);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf +=3D si=
zeof(u32);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max -=3D si=
zeof(u32);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy((struct devic=
e *)priv-&gt;rng.priv);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_put_sync_autosuspend((struct=
 device *)priv-&gt;rng.priv);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return retval || !wait ? retval : -EIO;=
<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int npcm_rng_probe(struct platform_device *pdev)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0u32 quality;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;pdev-&gt;dev=
, sizeof(*priv), GFP_KERNEL);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!priv)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENO=
MEM;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IOR=
ESOURCE_MEM, 0);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;base =3D devm_ioremap_resource=
(&amp;pdev-&gt;dev, res);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;base))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_=
ERR(priv-&gt;base);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;<a href=3D"http://rng.name" re=
l=3D"noreferrer" target=3D"_blank">rng.name</a> =3D pdev-&gt;name;<br>
&gt; &gt; &gt; +#ifndef CONFIG_PM<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.init =3D npcm_rng_init;<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.cleanup =3D npcm_rng_clean=
up;<br>
&gt; &gt; &gt; +#endif<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.read =3D npcm_rng_read;<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.priv =3D (unsigned long)&a=
mp;pdev-&gt;dev;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(pdev-&gt;dev.o=
f_node, &quot;quality&quot;, &amp;quality))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;rn=
g.quality =3D 1000;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;rn=
g.quality =3D quality;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_M1ROSEL, priv-&gt;base =
+ NPCM_RNGMODE_REG);<br>
&gt; &gt; &gt; +#ifndef CONFIG_PM<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_CLK_SET_25MHZ, priv-&gt=
;base + NPCM_RNGCS_REG);<br>
&gt; &gt; &gt; +#else<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RN=
G_ENABLE,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;base + N=
PCM_RNGCS_REG);<br>
&gt; &gt; &gt; +#endif<br>
&gt; &gt;<br>
&gt; &gt; If this initialization was moved to npcm_rng_init() then there wo=
uld be<br>
&gt; &gt; no need for the additional ifdefing. It would also get rid of the=
<br>
&gt; &gt; (potentially slow) readl calls on the PM wakeup path.<br>
&gt; &gt;<br>
&gt; <br>
&gt; But when the Kernel have PM configuration than the priv-&gt;rng.init i=
s not<br>
&gt; set and<br>
&gt; *add_early_randomness* function is called. for the *add_early_randomne=
ss*<br>
&gt; success<br>
&gt; the hwrng need to enabled in the probe.<br>
<br>
Sorry but I don&#39;t understand this reply.<br>
<br>
When CONFIG_PM is enabled then the probe function does not currently set<br=
>
NPCM_RNG_ENABLE; instead is relies on npcm_rng_init() being called by<br></=
blockquote><div>=C2=A0</div><div>Sorry maybe I miss understood, but when th=
e=C2=A0 CONFIG_PM enabled so the NPCM_RNG_ENABLE sets (the code use ifndef =
and not ifdef)</div><div><b>#ifndef CONFIG_PM</b><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0writel(NPCM_RNG_CLK_SET_25MHZ, priv-&gt;base + NPCM_RNGCS_REG);<br>#e=
lse (<b>CONFIG_PM enabled</b>)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(NPCM_RN=
G_CLK_SET_25MHZ | NPCM_RNG_ENABLE,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 priv-&gt;base + NPCM_RNGCS_REG);<br>#endif=C2=A0<br></div><di=
v><br></div><div>And the hwrng needed to be enabled to run=C2=A0<b>add_earl=
y_randomness </b>function successfully.</div><div><br></div><div>If the hwr=
ng driver will relay on PM logic to enable the hwrng will be disable when=
=C2=A0<b>add_early_randomness </b>function is called.=C2=A0</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
the PM logic (as part of pm_runtime_get_sync() ).<br>
<br>
Given the code *already* relies on npcm_rng_init() being called by the<br>
PM logic why does it matter if additional init is put there?<br>
<br>
<br>
Daniel.<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><di=
v>Tomer=C2=A0</div></div></div></div></div>

--00000000000049a5e8059230937d--
