Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A04C889F
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:32:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jwWz2yXRzDqX3
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:32:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2aRAoqW"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jwW71XK1zDqQd
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 22:32:01 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id i16so17457166oie.4
 for <openbmc@lists.ozlabs.org>; Wed, 02 Oct 2019 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVotqN9G+cJamJFHVs/czAI3wXAJfRmTSRW+L4iuZQo=;
 b=f2aRAoqWQcBs/EviJgBX6df7K1lmZ82sXICEup2yZ+WLexbSIj09qsaW7O5B7Hek/4
 xhu8Gg9jyI+cVF/L6pzBRX6ngHWDGcKTT++jNd+30mVIUcdqr1EYOERqv7t18jP4BiMx
 7fFIB4ib13EWEG/Ip1dmfRTixbcfh8mBMyY45Mzk4LI2nMDR+Y29l6euLRWEOg6xBJtx
 cO2EyWfoz8Tb9F3v4J4ZjzMdLRNpWdClLvbF+RwlhClpKY1/pMUIXOzP7ybZ2ZfY7zVs
 1HYdpzxhUsoWu3zhlGlesvC17APS/j1B6VY6WC7eBaT2VMZGVWnAH83OdAZeJORPavfB
 34yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVotqN9G+cJamJFHVs/czAI3wXAJfRmTSRW+L4iuZQo=;
 b=RSVyMH7ZmF2UEELm8/bqNLK+yKTtABGmvyW7C+9jxZYjyaHiHmkdMmbYwInyAQfC7a
 YVBB6dBFB9QktqbQut3eT0qUuE+H2B+WNbkpF/2/PzjerUaebzJ7Wdq4USLEXKHkwD1R
 bXHs/rR6TTpWPKSXVt8vRgRleDc+6N25HtIL8iyDyf6CdZiy4P9kiwbk1VijuV+1CTqS
 Klqd5Yp5I6bhZPc/YKlW/Ti+UFEmXJeQkMUq9dKrqmXItPtjQcqvOil94DU/Dhz89wpR
 O8ei+CRjbxVy6zVjVWXZObt3aEW1sBcdEk2gSrYLH7ElawABP9Tt9tPsTyqYwCt5ExYc
 fAwA==
X-Gm-Message-State: APjAAAWl3IYkucyEKxEslMvdbierBEQPqT2tRuRs3l1QemO8l/3OBx9r
 cZ53nNn0/MykFOzqxxu9gmWPOz6BUf79/xkB578=
X-Google-Smtp-Source: APXvYqzdUVmyKo/5Q8qgc0xfbScKcfVLCpg2P9SRd2t0EkV3hdf4FFKAigWsGGGQvbm3rQO+8ZWJ/kcqrDrnZZTV5yg=
X-Received: by 2002:aca:b286:: with SMTP id b128mr2714820oif.100.1570019517631; 
 Wed, 02 Oct 2019 05:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190912090149.7521-1-tmaimon77@gmail.com>
 <20190912090149.7521-3-tmaimon77@gmail.com>
 <20190912164638.GB4392@vkoul-mobl>
 <CAP6Zq1i5eSB4=1m1-eOU5MmUv=6_ks34eN2xfLci7qxxS5xqdQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1i5eSB4=1m1-eOU5MmUv=6_ks34eN2xfLci7qxxS5xqdQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 2 Oct 2019 15:41:17 +0300
Message-ID: <CAP6Zq1iJTW9Sc032fW0-dmvWe2x=QPECTOFUaFaPn9TORAyjUw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwrng: npcm: add NPCM RNG driver
To: Vinod Koul <vkoul@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000a397e70593eca734"
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
 linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 mpm@selenic.com, Patrick Venture <venture@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a397e70593eca734
Content-Type: text/plain; charset="UTF-8"

HI all,

Appreciate a lot if one of the maintainers can take a look on HWRNG-NPCM
driver.

Thanks a lot!

Tomer


On Sun, 15 Sep 2019 at 09:26, Tomer Maimon <tmaimon77@gmail.com> wrote:

> Hi Vinod,
>
> Thanks for your notification.
>
> NPCM Hardware RNG is true RNG.
>
> Tomer
>
> On Thu, 12 Sep 2019 at 19:47, Vinod Koul <vkoul@kernel.org> wrote:
>
>> On 12-09-19, 12:01, Tomer Maimon wrote:
>> > Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
>>
>> Is this a true RNG or a psedo RNG, in case of latter it should be added
>> in drivers/crypto/. See crypto_register_rng()
>>
>> >
>> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> > ---
>> >  drivers/char/hw_random/Kconfig    |  13 +++
>> >  drivers/char/hw_random/Makefile   |   1 +
>> >  drivers/char/hw_random/npcm-rng.c | 186 ++++++++++++++++++++++++++++++
>> >  3 files changed, 200 insertions(+)
>> >  create mode 100644 drivers/char/hw_random/npcm-rng.c
>> >
>> > diff --git a/drivers/char/hw_random/Kconfig
>> b/drivers/char/hw_random/Kconfig
>> > index 59f25286befe..87a1c30e7958 100644
>> > --- a/drivers/char/hw_random/Kconfig
>> > +++ b/drivers/char/hw_random/Kconfig
>> > @@ -440,6 +440,19 @@ config HW_RANDOM_OPTEE
>> >
>> >         If unsure, say Y.
>> >
>> > +config HW_RANDOM_NPCM
>> > +     tristate "NPCM Random Number Generator support"
>> > +     depends on ARCH_NPCM || COMPILE_TEST
>> > +     default HW_RANDOM
>> > +     help
>> > +       This driver provides support for the Random Number
>> > +       Generator hardware available in Nuvoton NPCM SoCs.
>> > +
>> > +       To compile this driver as a module, choose M here: the
>> > +       module will be called npcm-rng.
>> > +
>> > +       If unsure, say Y.
>> > +
>> >  endif # HW_RANDOM
>> >
>> >  config UML_RANDOM
>> > diff --git a/drivers/char/hw_random/Makefile
>> b/drivers/char/hw_random/Makefile
>> > index 7c9ef4a7667f..17b6d4e6d591 100644
>> > --- a/drivers/char/hw_random/Makefile
>> > +++ b/drivers/char/hw_random/Makefile
>> > @@ -39,3 +39,4 @@ obj-$(CONFIG_HW_RANDOM_MTK) += mtk-rng.o
>> >  obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
>> >  obj-$(CONFIG_HW_RANDOM_KEYSTONE) += ks-sa-rng.o
>> >  obj-$(CONFIG_HW_RANDOM_OPTEE) += optee-rng.o
>> > +obj-$(CONFIG_HW_RANDOM_NPCM) += npcm-rng.o
>> > diff --git a/drivers/char/hw_random/npcm-rng.c
>> b/drivers/char/hw_random/npcm-rng.c
>> > new file mode 100644
>> > index 000000000000..b7c8c7e13a49
>> > --- /dev/null
>> > +++ b/drivers/char/hw_random/npcm-rng.c
>> > @@ -0,0 +1,186 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +// Copyright (c) 2019 Nuvoton Technology corporation.
>> > +
>> > +#include <linux/kernel.h>
>> > +#include <linux/module.h>
>> > +#include <linux/io.h>
>> > +#include <linux/iopoll.h>
>> > +#include <linux/init.h>
>> > +#include <linux/random.h>
>> > +#include <linux/err.h>
>> > +#include <linux/platform_device.h>
>> > +#include <linux/hw_random.h>
>> > +#include <linux/delay.h>
>> > +#include <linux/of_irq.h>
>> > +#include <linux/pm_runtime.h>
>> > +
>> > +#define NPCM_RNGCS_REG               0x00    /* Control and status
>> register */
>> > +#define NPCM_RNGD_REG                0x04    /* Data register */
>> > +#define NPCM_RNGMODE_REG     0x08    /* Mode register */
>> > +
>> > +#define NPCM_RNG_CLK_SET_25MHZ       GENMASK(4, 3) /* 20-25 MHz */
>> > +#define NPCM_RNG_DATA_VALID  BIT(1)
>> > +#define NPCM_RNG_ENABLE              BIT(0)
>> > +#define NPCM_RNG_M1ROSEL     BIT(1)
>> > +
>> > +#define NPCM_RNG_TIMEOUT_USEC        20000
>> > +#define NPCM_RNG_POLL_USEC   1000
>> > +
>> > +#define to_npcm_rng(p)       container_of(p, struct npcm_rng, rng)
>> > +
>> > +struct npcm_rng {
>> > +     void __iomem *base;
>> > +     struct hwrng rng;
>> > +};
>> > +
>> > +static int npcm_rng_init(struct hwrng *rng)
>> > +{
>> > +     struct npcm_rng *priv = to_npcm_rng(rng);
>> > +
>> > +     writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
>> > +            priv->base + NPCM_RNGCS_REG);
>> > +
>> > +     return 0;
>> > +}
>> > +
>> > +static void npcm_rng_cleanup(struct hwrng *rng)
>> > +{
>> > +     struct npcm_rng *priv = to_npcm_rng(rng);
>> > +
>> > +     writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
>> > +}
>> > +
>> > +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max,
>> bool wait)
>> > +{
>> > +     struct npcm_rng *priv = to_npcm_rng(rng);
>> > +     int retval = 0;
>> > +     int ready;
>> > +
>> > +     pm_runtime_get_sync((struct device *)priv->rng.priv);
>> > +
>> > +     while (max >= sizeof(u32)) {
>> > +             if (wait) {
>> > +                     if (readl_poll_timeout(priv->base +
>> NPCM_RNGCS_REG,
>> > +                                            ready,
>> > +                                            ready &
>> NPCM_RNG_DATA_VALID,
>> > +                                            NPCM_RNG_POLL_USEC,
>> > +                                            NPCM_RNG_TIMEOUT_USEC))
>> > +                             break;
>> > +             } else {
>> > +                     if ((readl(priv->base + NPCM_RNGCS_REG) &
>> > +                         NPCM_RNG_DATA_VALID) == 0)
>> > +                             break;
>> > +             }
>> > +
>> > +             *(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
>> > +             retval += sizeof(u32);
>> > +             buf += sizeof(u32);
>> > +             max -= sizeof(u32);
>> > +     }
>> > +
>> > +     pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
>> > +     pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
>> > +
>> > +     return retval || !wait ? retval : -EIO;
>> > +}
>> > +
>> > +static int npcm_rng_probe(struct platform_device *pdev)
>> > +{
>> > +     struct npcm_rng *priv;
>> > +     struct resource *res;
>> > +     int ret;
>> > +
>> > +     priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> > +     if (!priv)
>> > +             return -ENOMEM;
>> > +
>> > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> > +     priv->base = devm_ioremap_resource(&pdev->dev, res);
>> > +     if (IS_ERR(priv->base))
>> > +             return PTR_ERR(priv->base);
>> > +
>> > +     dev_set_drvdata(&pdev->dev, priv);
>> > +     pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
>> > +     pm_runtime_use_autosuspend(&pdev->dev);
>> > +     pm_runtime_enable(&pdev->dev);
>> > +
>> > +#ifndef CONFIG_PM
>> > +     priv->rng.init = npcm_rng_init;
>> > +     priv->rng.cleanup = npcm_rng_cleanup;
>> > +#endif
>> > +     priv->rng.name = pdev->name;
>> > +     priv->rng.read = npcm_rng_read;
>> > +     priv->rng.priv = (unsigned long)&pdev->dev;
>> > +     priv->rng.quality = 1000;
>> > +
>> > +     writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
>> > +
>> > +     ret = devm_hwrng_register(&pdev->dev, &priv->rng);
>> > +     if (ret) {
>> > +             dev_err(&pdev->dev, "Failed to register rng device: %d\n",
>> > +                     ret);
>> > +             pm_runtime_disable(&pdev->dev);
>> > +             pm_runtime_set_suspended(&pdev->dev);
>> > +             return ret;
>> > +     }
>> > +
>> > +     return 0;
>> > +}
>> > +
>> > +static int npcm_rng_remove(struct platform_device *pdev)
>> > +{
>> > +     struct npcm_rng *priv = platform_get_drvdata(pdev);
>> > +
>> > +     devm_hwrng_unregister(&pdev->dev, &priv->rng);
>> > +     pm_runtime_disable(&pdev->dev);
>> > +     pm_runtime_set_suspended(&pdev->dev);
>> > +
>> > +     return 0;
>> > +}
>> > +
>> > +#ifdef CONFIG_PM
>> > +static int npcm_rng_runtime_suspend(struct device *dev)
>> > +{
>> > +     struct npcm_rng *priv = dev_get_drvdata(dev);
>> > +
>> > +     npcm_rng_cleanup(&priv->rng);
>> > +
>> > +     return 0;
>> > +}
>> > +
>> > +static int npcm_rng_runtime_resume(struct device *dev)
>> > +{
>> > +     struct npcm_rng *priv = dev_get_drvdata(dev);
>> > +
>> > +     return npcm_rng_init(&priv->rng);
>> > +}
>> > +#endif
>> > +
>> > +static const struct dev_pm_ops npcm_rng_pm_ops = {
>> > +     SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,
>> > +                        npcm_rng_runtime_resume, NULL)
>> > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> > +                             pm_runtime_force_resume)
>> > +};
>> > +
>> > +static const struct of_device_id rng_dt_id[] = {
>> > +     { .compatible = "nuvoton,npcm750-rng",  },
>> > +     {},
>> > +};
>> > +MODULE_DEVICE_TABLE(of, rng_dt_id);
>> > +
>> > +static struct platform_driver npcm_rng_driver = {
>> > +     .driver = {
>> > +             .name           = "npcm-rng",
>> > +             .pm             = &npcm_rng_pm_ops,
>> > +             .of_match_table = of_match_ptr(rng_dt_id),
>> > +     },
>> > +     .probe          = npcm_rng_probe,
>> > +     .remove         = npcm_rng_remove,
>> > +};
>> > +
>> > +module_platform_driver(npcm_rng_driver);
>> > +
>> > +MODULE_DESCRIPTION("Nuvoton NPCM Random Number Generator Driver");
>> > +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
>> > +MODULE_LICENSE("GPL v2");
>> > --
>> > 2.18.0
>>
>> --
>> ~Vinod
>>
>

--000000000000a397e70593eca734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">HI all,<div><br></div><div>Appreciate a lot if one of the =
maintainers can take a look on HWRNG-NPCM driver.</div><div><br></div><div>=
Thanks a lot!</div><div><br></div><div>Tomer</div><div><br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 15=
 Sep 2019 at 09:26, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr">Hi Vinod,<div><br></div><div>Thanks fo=
r your notification.</div><div><br></div><div>NPCM Hardware RNG is true RNG=
.</div><div><br></div><div>Tomer</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Sep 2019 at 19:47, Vinod K=
oul &lt;<a href=3D"mailto:vkoul@kernel.org" target=3D"_blank">vkoul@kernel.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 12-09-19, 12:01, Tomer Maimon wrote:<br>
&gt; Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.<br>
<br>
Is this a true RNG or a psedo RNG, in case of latter it should be added<br>
in drivers/crypto/. See crypto_register_rng()<br>
<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/char/hw_random/Kconfig=C2=A0 =C2=A0 |=C2=A0 13 +++<br>
&gt;=C2=A0 drivers/char/hw_random/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
&gt;=C2=A0 drivers/char/hw_random/npcm-rng.c | 186 ++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 3 files changed, 200 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/char/hw_random/npcm-rng.c<br>
&gt; <br>
&gt; diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/K=
config<br>
&gt; index 59f25286befe..87a1c30e7958 100644<br>
&gt; --- a/drivers/char/hw_random/Kconfig<br>
&gt; +++ b/drivers/char/hw_random/Kconfig<br>
&gt; @@ -440,6 +440,19 @@ config HW_RANDOM_OPTEE<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If unsure, say Y.<br>
&gt;=C2=A0 <br>
&gt; +config HW_RANDOM_NPCM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;NPCM Random Number Generator suppo=
rt&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_NPCM || COMPILE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default HW_RANDOM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This driver provides support for the Rando=
m Number<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Generator hardware available in Nuvoton NP=
CM SoCs.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0To compile this driver as a module, choose=
 M here: the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0module will be called npcm-rng.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0If unsure, say Y.<br>
&gt; +<br>
&gt;=C2=A0 endif # HW_RANDOM<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config UML_RANDOM<br>
&gt; diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/=
Makefile<br>
&gt; index 7c9ef4a7667f..17b6d4e6d591 100644<br>
&gt; --- a/drivers/char/hw_random/Makefile<br>
&gt; +++ b/drivers/char/hw_random/Makefile<br>
&gt; @@ -39,3 +39,4 @@ obj-$(CONFIG_HW_RANDOM_MTK) +=3D mtk-rng.o<br>
&gt;=C2=A0 obj-$(CONFIG_HW_RANDOM_S390) +=3D s390-trng.o<br>
&gt;=C2=A0 obj-$(CONFIG_HW_RANDOM_KEYSTONE) +=3D ks-sa-rng.o<br>
&gt;=C2=A0 obj-$(CONFIG_HW_RANDOM_OPTEE) +=3D optee-rng.o<br>
&gt; +obj-$(CONFIG_HW_RANDOM_NPCM) +=3D npcm-rng.o<br>
&gt; diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_rando=
m/npcm-rng.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..b7c8c7e13a49<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/char/hw_random/npcm-rng.c<br>
&gt; @@ -0,0 +1,186 @@<br>
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
&gt; +#define NPCM_RNG_TIMEOUT_USEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 20000<br>
&gt; +#define NPCM_RNG_POLL_USEC=C2=A0 =C2=A01000<br>
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
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;base + NPCM_RNGCS_=
REG);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm_rng_cleanup(struct hwrng *rng)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_CLK_SET_25MHZ, priv-&gt;base + NP=
CM_RNGCS_REG);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bo=
ol wait)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ready;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync((struct device *)priv-&gt;rng=
.priv);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (max &gt;=3D sizeof(u32)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (wait) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (readl_poll_timeout(priv-&gt;base + NPCM_RNGCS_REG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ready,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ready &amp; NPCM_RNG_DATA_VALID,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NPCM_RNG_POLL_USEC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NPCM_RNG_TIMEOUT_USEC))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if ((readl(priv-&gt;base + NPCM_RNGCS_REG) &amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NPCM_RNG_DATA_VALID) =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0dev_set_drvdata(&amp;pdev-&gt;dev, priv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_set_autosuspend_delay(&amp;pdev-&gt;de=
v, 100);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_use_autosuspend(&amp;pdev-&gt;dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_enable(&amp;pdev-&gt;dev);<br>
&gt; +<br>
&gt; +#ifndef CONFIG_PM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.init =3D npcm_rng_init;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.cleanup =3D npcm_rng_cleanup;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;<a href=3D"http://rng.name" rel=3D"noref=
errer" target=3D"_blank">rng.name</a> =3D pdev-&gt;name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.read =3D npcm_rng_read;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.priv =3D (unsigned long)&amp;pdev-&g=
t;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;rng.quality =3D 1000;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_RNG_M1ROSEL, priv-&gt;base + NPCM_RNG=
MODE_REG);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D devm_hwrng_register(&amp;pdev-&gt;dev, &a=
mp;priv-&gt;rng);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;Failed to register rng device: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(&a=
mp;pdev-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_set_suspen=
ded(&amp;pdev-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rng_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rng *priv =3D platform_get_drvdata(pd=
ev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0devm_hwrng_unregister(&amp;pdev-&gt;dev, &amp;pri=
v-&gt;rng);<br>
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
<br>
-- <br>
~Vinod<br>
</blockquote></div>
</blockquote></div>

--000000000000a397e70593eca734--
