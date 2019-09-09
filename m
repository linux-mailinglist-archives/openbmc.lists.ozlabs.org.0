Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA1ADB1C
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 16:23:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rr4H03H6zDqNG
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 00:23:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SU7ix/rw"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rr3D4mG5zDqN8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 00:22:29 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id a127so10668372oii.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=URzaf21OfHHgTTQNwVjrEJHwZ9+R3hhHvTDYKMJS82g=;
 b=SU7ix/rwODXdlHLCXgbTpb3vSFBoihgtx57cnkd/RAmd0z3zMfPB2G0XyQoYSoe1vW
 5V1r6sGC6vgxwEqSwvhNaJOdcuk1xhd6NC/XINMqMQOTTJY5JFjH+MFw3N4S1x2NhRpq
 /yGV8k1G0FSTw1my3lMH2WKT53BIrJ2ISAXnQQkncI3VFxV9G7sYt9ItxNpE2wR2mwrI
 RlYiVR8bTXTuG6OSXrys5xL8u4Q876Ta6Awn7DLM9N2RgdmXt8+m8YI6xPF8jlUxSBwd
 Xt2hW9VQx/7o+SIrtIh0x9V/LsNIbt6drZKz2N5C3wVUhhcTLs7VojIbbVxjIzn5blfM
 p6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URzaf21OfHHgTTQNwVjrEJHwZ9+R3hhHvTDYKMJS82g=;
 b=Tol261V0BW9Tk4CZj7xEKn2u/jopWp91KbJ43e3GlnCaIHJYNFEcnWxcLeDuQNTxJ1
 Y1NSTNEFhBDCDmzvKPQSzK45pNiipXR49M79wLR30+voko0/vJAEuPCUVjzKrnZZsP2y
 sfALh86+NIqKUkJesyyMghMcugpSnrtC4jdqJtHVvW8HFANFiDTK7vxShxWdO7abPYHi
 VJmKWVRwfiOkLaw5wiHgaptugNeJDtSHdPua7fI1EyyfrHVkFEuMUzU3IOnQbm+XM/eS
 mjRZOM3gvWR+L1j53K0iiYSpZILPeO83YaqL6ZJtWDeR8uVj+SiwV7NvNHltxz+w28jX
 0W6w==
X-Gm-Message-State: APjAAAXRC9fvIgyYo08MqA9/L/JkZ4EWZytJoJBv44CAD9ov+1QAZyRy
 dGaLekh5DQ9zOoxnooBZ0BlDv+LqzkMQbcv+bBM=
X-Google-Smtp-Source: APXvYqzT/IR4tNkm6QiKkbnGSmhSZOxOClwzJEORKU2M9qn1EkJC55BMYhc1sPdJkvLGVPmY7JzENxpWVMci3Wp6SPI=
X-Received: by 2002:a54:4413:: with SMTP id k19mr11132450oiw.100.1568038945484; 
 Mon, 09 Sep 2019 07:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190828162617.237398-1-tmaimon77@gmail.com>
 <20190828162617.237398-3-tmaimon77@gmail.com>
 <20190829104721.tnjk3bqt3cq6iagr@holly.lan>
In-Reply-To: <20190829104721.tnjk3bqt3cq6iagr@holly.lan>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 9 Sep 2019 17:31:30 +0300
Message-ID: <CAP6Zq1jXUhKjwBHiDKiKcpt_PiJQA61z2SUNg4_LztcnMMJ-Ng@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hwrng: npcm: add NPCM RNG driver
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000056f64d05921f8470"
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

--00000000000056f64d05921f8470
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

appreciate your comments and sorry for the late reply

On Thu, 29 Aug 2019 at 13:47, Daniel Thompson <daniel.thompson@linaro.org>
wrote:

> On Wed, Aug 28, 2019 at 07:26:17PM +0300, Tomer Maimon wrote:
> > Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/char/hw_random/Kconfig    |  13 ++
> >  drivers/char/hw_random/Makefile   |   1 +
> >  drivers/char/hw_random/npcm-rng.c | 207 ++++++++++++++++++++++++++++++
> >  3 files changed, 221 insertions(+)
> >  create mode 100644 drivers/char/hw_random/npcm-rng.c
> >
> > diff --git a/drivers/char/hw_random/npcm-rng.c
> b/drivers/char/hw_random/npcm-rng.c
> > new file mode 100644
> > index 000000000000..5b4b1b6cb362
> > --- /dev/null
> > +++ b/drivers/char/hw_random/npcm-rng.c
> > @@ -0,0 +1,207 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2019 Nuvoton Technology corporation.
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/init.h>
> > +#include <linux/random.h>
> > +#include <linux/err.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/hw_random.h>
> > +#include <linux/delay.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/pm_runtime.h>
> > +
> > +#define NPCM_RNGCS_REG               0x00    /* Control and status
> register */
> > +#define NPCM_RNGD_REG                0x04    /* Data register */
> > +#define NPCM_RNGMODE_REG     0x08    /* Mode register */
> > +
> > +#define NPCM_RNG_CLK_SET_25MHZ       GENMASK(4, 3) /* 20-25 MHz */
> > +#define NPCM_RNG_DATA_VALID  BIT(1)
> > +#define NPCM_RNG_ENABLE              BIT(0)
> > +#define NPCM_RNG_M1ROSEL     BIT(1)
> > +
> > +#define NPCM_RNG_TIMEOUT_POLL        20
>
> Might be better to define this in real-world units (such as
> milliseconds) since the timeout is effectively the longest time the
> hardware can take to generate 4 bytes.
>
> > +
> > +#define to_npcm_rng(p)       container_of(p, struct npcm_rng, rng)
> > +
> > +struct npcm_rng {
> > +     void __iomem *base;
> > +     struct hwrng rng;
> > +};
> > +
> > +static int npcm_rng_init(struct hwrng *rng)
> > +{
> > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > +     u32 val;
> > +
> > +     val = readl(priv->base + NPCM_RNGCS_REG);
> > +     val |= NPCM_RNG_ENABLE;
> > +     writel(val, priv->base + NPCM_RNGCS_REG);
> > +
> > +     return 0;
> > +}
> > +
> > +static void npcm_rng_cleanup(struct hwrng *rng)
> > +{
> > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > +     u32 val;
> > +
> > +     val = readl(priv->base + NPCM_RNGCS_REG);
> > +     val &= ~NPCM_RNG_ENABLE;
> > +     writel(val, priv->base + NPCM_RNGCS_REG);
> > +}
> > +
> > +static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)
> > +{
> > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > +     int timeout_cnt = 0;
> > +     int ready;
> > +
> > +     ready = readl(priv->base + NPCM_RNGCS_REG) & NPCM_RNG_DATA_VALID;
> > +     while ((ready == 0) && (timeout_cnt < NPCM_RNG_TIMEOUT_POLL)) {
> > +             usleep_range(500, 1000);
> > +             ready = readl(priv->base + NPCM_RNGCS_REG) &
> > +                     NPCM_RNG_DATA_VALID;
> > +             timeout_cnt++;
> > +     }
> > +
> > +     return !!ready;
> > +}
>
> This looks like an open-coded version of readl_poll_timeout()... better
> to use the library function.
>
> Also the sleep looks a bit long to me. What is the generation rate of
> the peripheral? Most RNG drivers have short intervals between data
> generation so they use delays rather than sleeps (a.k.a.
> readl_poll_timeout_atomic() ).
>
> the HWRNG generate byte of random data in a few milliseconds so it is
better to use the sleep command.

>
> > +
> > +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool
> wait)
> > +{
> > +     struct npcm_rng *priv = to_npcm_rng(rng);
> > +     int retval = 0;
> > +
> > +     pm_runtime_get_sync((struct device *)priv->rng.priv);
> > +
> > +     while (max >= sizeof(u32)) {
> > +             if (!npcm_rng_wait_ready(rng, wait))
> > +                     break;
>
> The code as currently written does not honour the wait parameter (e.g.
> it sleeps even when wait is false).
>
>
> > +
> > +             *(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
> > +             retval += sizeof(u32);
> > +             buf += sizeof(u32);
> > +             max -= sizeof(u32);
> > +     }
> > +
> > +     pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
> > +     pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
> > +
> > +     return retval || !wait ? retval : -EIO;
> > +}
> > +
> > +static int npcm_rng_probe(struct platform_device *pdev)
> > +{
> > +     struct npcm_rng *priv;
> > +     struct resource *res;
> > +     u32 quality;
> > +     int ret;
> > +
> > +     priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     priv->base = devm_ioremap_resource(&pdev->dev, res);
> > +     if (IS_ERR(priv->base))
> > +             return PTR_ERR(priv->base);
> > +
> > +     priv->rng.name = pdev->name;
> > +#ifndef CONFIG_PM
> > +     priv->rng.init = npcm_rng_init;
> > +     priv->rng.cleanup = npcm_rng_cleanup;
> > +#endif
> > +     priv->rng.read = npcm_rng_read;
> > +     priv->rng.priv = (unsigned long)&pdev->dev;
> > +     if (of_property_read_u32(pdev->dev.of_node, "quality", &quality))
> > +             priv->rng.quality = 1000;
> > +     else
> > +             priv->rng.quality = quality;
> > +
> > +     writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
> > +#ifndef CONFIG_PM
> > +     writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
> > +#else
> > +     writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
> > +            priv->base + NPCM_RNGCS_REG);
> > +#endif
>
> If this initialization was moved to npcm_rng_init() then there would be
> no need for the additional ifdefing. It would also get rid of the
> (potentially slow) readl calls on the PM wakeup path.
>

But when the Kernel have PM configuration than the priv->rng.init is not
set and
*add_early_randomness* function is called. for the *add_early_randomness*
success
the hwrng need to enabled in the probe.

I will remove the ifdef and add local variable instead (as Milton Miller
suggested)


> > +
> > +     ret = devm_hwrng_register(&pdev->dev, &priv->rng);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "Failed to register rng device: %d\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     dev_set_drvdata(&pdev->dev, priv);
> > +     pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> > +     pm_runtime_use_autosuspend(&pdev->dev);
> > +     pm_runtime_enable(&pdev->dev);
> > +
> > +     dev_info(&pdev->dev, "Random Number Generator Probed\n");
>
> Does the user need to know this every time we boot? There are lots of
> debug tools we can bring to bear if they are worried the device
> isn't probing.
>
>
> Daniel.
>
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_rng_remove(struct platform_device *pdev)
> > +{
> > +     struct npcm_rng *priv = platform_get_drvdata(pdev);
> > +
> > +     hwrng_unregister(&priv->rng);
> > +     pm_runtime_disable(&pdev->dev);
> > +     pm_runtime_set_suspended(&pdev->dev);
> > +
> > +     return 0;
> > +}
> > +
> > +#ifdef CONFIG_PM
> > +static int npcm_rng_runtime_suspend(struct device *dev)
> > +{
> > +     struct npcm_rng *priv = dev_get_drvdata(dev);
> > +
> > +     npcm_rng_cleanup(&priv->rng);
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_rng_runtime_resume(struct device *dev)
> > +{
> > +     struct npcm_rng *priv = dev_get_drvdata(dev);
> > +
> > +     return npcm_rng_init(&priv->rng);
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops npcm_rng_pm_ops = {
> > +     SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,
> > +                        npcm_rng_runtime_resume, NULL)
> > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +                             pm_runtime_force_resume)
> > +};
> > +
> > +static const struct of_device_id rng_dt_id[] = {
> > +     { .compatible = "nuvoton,npcm750-rng",  },
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, rng_dt_id);
> > +
> > +static struct platform_driver npcm_rng_driver = {
> > +     .driver = {
> > +             .name           = "npcm-rng",
> > +             .pm             = &npcm_rng_pm_ops,
> > +             .owner          = THIS_MODULE,
> > +             .of_match_table = of_match_ptr(rng_dt_id),
> > +     },
> > +     .probe          = npcm_rng_probe,
> > +     .remove         = npcm_rng_remove,
> > +};
> > +
> > +module_platform_driver(npcm_rng_driver);
> > +
> > +MODULE_DESCRIPTION("Nuvoton NPCM Random Number Generator Driver");
> > +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.18.0
> >
>

Thanks a lot,

Tomer

--00000000000056f64d05921f8470
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,<div><br></div><div>appreciate =
your comments and sorry for the late reply</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 29 Aug 2019 at 13:4=
7, Daniel Thompson &lt;<a href=3D"mailto:daniel.thompson@linaro.org">daniel=
.thompson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Wed, Aug 28, 2019 at 07:26:17PM +0300, Tomer Maimon =
wrote:<br>
&gt; Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/char/hw_random/Kconfig=C2=A0 =C2=A0 |=C2=A0 13 ++<br>
&gt;=C2=A0 drivers/char/hw_random/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
&gt;=C2=A0 drivers/char/hw_random/npcm-rng.c | 207 ++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 3 files changed, 221 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/char/hw_random/npcm-rng.c<br>
&gt; <br>
&gt; diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_rando=
m/npcm-rng.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..5b4b1b6cb362<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/char/hw_random/npcm-rng.c<br>
&gt; @@ -0,0 +1,207 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +// Copyright (c) 2019 Nuvoton Technology corporation.<br>
&gt; +<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/iopoll.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/random.h&gt;<br>
&gt; +#include &lt;linux/err.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/hw_random.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/of_irq.h&gt;<br>
&gt; +#include &lt;linux/pm_runtime.h&gt;<br>
&gt; +<br>
&gt; +#define NPCM_RNGCS_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x00=C2=A0 =C2=A0 /* Control and status register */<br>
&gt; +#define NPCM_RNGD_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x04=C2=A0 =C2=A0 /* Data register */<br>
&gt; +#define NPCM_RNGMODE_REG=C2=A0 =C2=A0 =C2=A00x08=C2=A0 =C2=A0 /* Mode=
 register */<br>
&gt; +<br>
&gt; +#define NPCM_RNG_CLK_SET_25MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(4, 3=
) /* 20-25 MHz */<br>
&gt; +#define NPCM_RNG_DATA_VALID=C2=A0 BIT(1)<br>
&gt; +#define NPCM_RNG_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BIT(0)<br>
&gt; +#define NPCM_RNG_M1ROSEL=C2=A0 =C2=A0 =C2=A0BIT(1)<br>
&gt; +<br>
&gt; +#define NPCM_RNG_TIMEOUT_POLL=C2=A0 =C2=A0 =C2=A0 =C2=A0 20<br>
<br>
Might be better to define this in real-world units (such as<br>
milliseconds) since the timeout is effectively the longest time the<br>
hardware can take to generate 4 bytes.<br>
<br>
&gt; +<br>
&gt; +#define to_npcm_rng(p)=C2=A0 =C2=A0 =C2=A0 =C2=A0container_of(p, stru=
ct npcm_rng, rng)<br>
&gt; +<br>
&gt; +struct npcm_rng {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct hwrng rng;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int npcm_rng_init(struct hwrng *rng)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl(priv-&gt;base + NPCM_RNGCS_REG);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0val |=3D NPCM_RNG_ENABLE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(val, priv-&gt;base + NPCM_RNGCS_REG);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm_rng_cleanup(struct hwrng *rng)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D readl(priv-&gt;base + NPCM_RNGCS_REG);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0val &amp;=3D ~NPCM_RNG_ENABLE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(val, priv-&gt;base + NPCM_RNGCS_REG);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int timeout_cnt =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ready;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ready =3D readl(priv-&gt;base + NPCM_RNGCS_REG) &=
amp; NPCM_RNG_DATA_VALID;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while ((ready =3D=3D 0) &amp;&amp; (timeout_cnt &=
lt; NPCM_RNG_TIMEOUT_POLL)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(500, 100=
0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ready =3D readl(priv-=
&gt;base + NPCM_RNGCS_REG) &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0NPCM_RNG_DATA_VALID;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout_cnt++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return !!ready;<br>
&gt; +}<br>
<br>
This looks like an open-coded version of readl_poll_timeout()... better<br>
to use the library function.<br>
<br>
Also the sleep looks a bit long to me. What is the generation rate of<br>
the peripheral? Most RNG drivers have short intervals between data<br>
generation so they use delays rather than sleeps (a.k.a.<br>
readl_poll_timeout_atomic() ).<br>
<br></blockquote><div>the HWRNG generate byte of random data in a few milli=
seconds so it is better to use the sleep command.=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bo=
ol wait)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync((struct device *)priv-&gt;rng=
.priv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (max &gt;=3D sizeof(u32)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!npcm_rng_wait_re=
ady(rng, wait))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
<br>
The code as currently written does not honour the wait parameter (e.g.<br>
it sleeps even when wait is false).<br>
<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(u32 *)buf =3D readl=
(priv-&gt;base + NPCM_RNGD_REG);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval +=3D sizeof(u3=
2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf +=3D sizeof(u32);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max -=3D sizeof(u32);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_mark_last_busy((struct device *)priv-&=
gt;rng.priv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_put_sync_autosuspend((struct device *)=
priv-&gt;rng.priv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return retval || !wait ? retval : -EIO;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rng_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 quality;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*=
priv), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!priv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;base =3D devm_ioremap_resource(&amp;pdev=
-&gt;dev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(priv-&gt;base))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(priv-&=
gt;base);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;<a href=3D"http://rng.name" rel=3D"noref=
errer" target=3D"_blank">rng.name</a> =3D pdev-&gt;name;<br>
&gt; +#ifndef CONFIG_PM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.init =3D npcm_rng_init;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.cleanup =3D npcm_rng_cleanup;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.read =3D npcm_rng_read;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.priv =3D (unsigned long)&amp;pdev-&g=
t;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(pdev-&gt;dev.of_node, &q=
uot;quality&quot;, &amp;quality))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;rng.quality =
=3D 1000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;rng.quality =
=3D quality;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_M1ROSEL, priv-&gt;base + NPCM_RNG=
MODE_REG);<br>
&gt; +#ifndef CONFIG_PM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_CLK_SET_25MHZ, priv-&gt;base + NP=
CM_RNGCS_REG);<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;base + NPCM_RNGCS_=
REG);<br>
&gt; +#endif<br>
<br>
If this initialization was moved to npcm_rng_init() then there would be<br>
no need for the additional ifdefing. It would also get rid of the<br>
(potentially slow) readl calls on the PM wakeup path.<br></blockquote><div>=
=C2=A0</div><div>But when the Kernel have PM configuration than the priv-&g=
t;rng.init is not set and=C2=A0</div><div><font face=3D"arial, sans-serif">=
<span style=3D"color:rgb(0,0,0)"><b>add_early_randomness</b></span><span st=
yle=3D"color:rgb(0,0,0)"><b>=C2=A0</b>function is called. for the=C2=A0</sp=
an><span style=3D"color:rgb(0,0,0)"><b>add_early_randomness</b></span><span=
 style=3D"color:rgb(0,0,0)"><b>=C2=A0</b>success</span></font></div><div><s=
pan style=3D"color:rgb(0,0,0)"><font face=3D"arial, sans-serif">the hwrng n=
eed to enabled in the probe.</font></span></div><div><br></div><div><span s=
tyle=3D"color:rgb(0,0,0)"><font face=3D"arial, sans-serif">I will remove th=
e ifdef and add local=C2=A0</font></span>variable=C2=A0<span style=3D"color=
:rgb(0,0,0)"><font face=3D"arial, sans-serif">instead (as Milton Miller sug=
gested)</font></span></div><h3 class=3D"gmail-iw" style=3D"overflow:hidden;=
white-space:nowrap;font-size:0.75rem;font-weight:inherit;margin:inherit;tex=
t-overflow:ellipsis;font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-ser=
if;letter-spacing:0.3px;color:rgb(95,99,104);line-height:20px"><br></h3><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D devm_hwrng_register(&amp;pdev-&gt;dev, &a=
mp;priv-&gt;rng);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;Failed to register rng device: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_set_drvdata(&amp;pdev-&gt;dev, priv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_set_autosuspend_delay(&amp;pdev-&gt;de=
v, 100);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_use_autosuspend(&amp;pdev-&gt;dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_enable(&amp;pdev-&gt;dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(&amp;pdev-&gt;dev, &quot;Random Number G=
enerator Probed\n&quot;);<br>
<br>
Does the user need to know this every time we boot? There are lots of<br>
debug tools we can bring to bear if they are worried the device<br>
isn&#39;t probing.<br>
<br>
<br>
Daniel.<br>
<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rng_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D platform_get_drvdata(pd=
ev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hwrng_unregister(&amp;priv-&gt;rng);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_disable(&amp;pdev-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_set_suspended(&amp;pdev-&gt;dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#ifdef CONFIG_PM<br>
&gt; +static int npcm_rng_runtime_suspend(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D dev_get_drvdata(dev);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0npcm_rng_cleanup(&amp;priv-&gt;rng);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rng_runtime_resume(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D dev_get_drvdata(dev);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return npcm_rng_init(&amp;priv-&gt;rng);<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +static const struct dev_pm_ops npcm_rng_pm_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 npcm_rng_runtime_resume, NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_force_resume)<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct of_device_id rng_dt_id[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,npcm750-rng&quot;=
,=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, rng_dt_id);<br>
&gt; +<br>
&gt; +static struct platform_driver npcm_rng_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;npcm-rng&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;npcm_rng_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D o=
f_match_ptr(rng_dt_id),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D npcm=
_rng_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm=
_rng_remove,<br>
&gt; +};<br>
&gt; +<br>
&gt; +module_platform_driver(npcm_rng_driver);<br>
&gt; +<br>
&gt; +MODULE_DESCRIPTION(&quot;Nuvoton NPCM Random Number Generator Driver&=
quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Tomer Maimon &lt;<a href=3D"mailto:tomer.maimon@n=
uvoton.com" target=3D"_blank">tomer.maimon@nuvoton.com</a>&gt;&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; -- <br>
&gt; 2.18.0<br>
&gt; <br></blockquote><div><br></div><div>Thanks a lot,</div><div><br></div=
><div>Tomer=C2=A0</div></div></div>

--00000000000056f64d05921f8470--
