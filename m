Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AED45ADB5D
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 16:43:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RrWS30Z5zDqQy
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 00:43:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y3ZM+K84"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RrVM6FZKzDqR7
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 00:42:35 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id b2so12647674otq.10
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0IgJx0m2LPE4TvIiMdwyK8mVREZU49upu5Ir3smmVAY=;
 b=Y3ZM+K841YHmU3rv0YayRu9bn8UaogFgoRAOAUTZdJfI/RIPiicgSd3VveshX66L43
 66Byi0Ggs2yXaLkNC3gr//VBH2oxJx3nsUweSD+v+AEUUiDodKKCzHQN8BL1uyDTbDLO
 A0rMRhxVqMWUQ3E81xlst3anETwhWZofWGa79CLoZRrxJeF5hognjRs9qbJLzZyUoUAg
 mOvLuZXAnPd3zdOmDaNB6ne1oN2qpu7INFI/jBosUdYyzzddvgNhyqkhJKOiy6jv2q9E
 Hfb8JEpeIx+5i1F3kHh5VMmh1jejmtuc/8NnikSeDgUQ/NjAD1Jp3Dy8gjowkH6gPQtG
 vKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0IgJx0m2LPE4TvIiMdwyK8mVREZU49upu5Ir3smmVAY=;
 b=T9wRkcGrGmhgamBqwdZlFPYWJR5ptNCZFwRq9QZnZLVvHzofyDSIYkCgTJ4TAWYTVU
 nPpO5Yo/5gLPN5bQakFAZGUmn1Rput9p8XXnoYbRLMCEELOjd9hr4drV1t94KhOGWfMK
 hIo7MOWI4ZfXTRe3SjGWh2T4DqbJM75b/1tFyzlkOQN+jf6XRfIimsuahXNxWKRU70d8
 8/ND2WUAIMLlXCKZwME/ifMyveo57FWoWWcJgtIRsF9/wFxWQ+42cEwXtr0qTfzvLoHb
 BIg2GyoQ4NVc9dBfGwPj+Y/iy4v4LREWtQPwouWfrY/2hZEuH2Qk7rW1jUWfrTh/0lUN
 b/5Q==
X-Gm-Message-State: APjAAAURVmHWQy9x+6py3UAJEIo6bebeDlzlicm1iOtV9gJPEUC0CMh8
 qhnhZet7k0TmjsmYLVLvLGQfJ86aMtNtcQv+YGw=
X-Google-Smtp-Source: APXvYqzA9ffpKP99OcyfaKbSpIBSGcpxL/t9AhplniSFC1rEG1422yeh7iICjAMdKUCiwUVGJ4h2OZrF0tuIr63IQHI=
X-Received: by 2002:a05:6830:100e:: with SMTP id
 a14mr2767853otp.238.1568040151985; 
 Mon, 09 Sep 2019 07:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190828162617.237398-1-tmaimon77@gmail.com>
 <20190828162617.237398-3-tmaimon77@gmail.com>
 <OF311056DF.80F736D6-ON00258466.007A807F-00258466.007D2F93@notes.na.collabserv.com>
In-Reply-To: <OF311056DF.80F736D6-ON00258466.007A807F-00258466.007D2F93@notes.na.collabserv.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 9 Sep 2019 17:51:36 +0300
Message-ID: <CAP6Zq1ghxxGSdwg3A=Er3s8sMi80rk27_pgG2BVEjSW+yRrV3g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] hwrng: npcm: add NPCM RNG driver
To: Milton Miller II <miltonm@us.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000040b44a05921fcc16"
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

--00000000000040b44a05921fcc16
Content-Type: text/plain; charset="UTF-8"

Hi Milton,

appreciate your comments and sorry for the late reply

On Sat, 31 Aug 2019 at 01:47, Milton Miller II <miltonm@us.ibm.com> wrote:

> On August 28th around 11:28AM in some timezone, Tomer Maimon wrote
>
> >Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
> >
> >Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >---
> > drivers/char/hw_random/Kconfig    |  13 ++
> > drivers/char/hw_random/Makefile   |   1 +
> > drivers/char/hw_random/npcm-rng.c | 207
> >++++++++++++++++++++++++++++++
> > 3 files changed, 221 insertions(+)
> > create mode 100644 drivers/char/hw_random/npcm-rng.c
> >
> >diff --git a/drivers/char/hw_random/Kconfig
> >b/drivers/char/hw_random/Kconfig
> >index 59f25286befe..87a1c30e7958 100644
> >--- a/drivers/char/hw_random/Kconfig
> >+++ b/drivers/char/hw_random/Kconfig
> >@@ -440,6 +440,19 @@ config HW_RANDOM_OPTEE
> >
> >         If unsure, say Y.
> >
> >+config HW_RANDOM_NPCM
> >+      tristate "NPCM Random Number Generator support"
> >+      depends on ARCH_NPCM || COMPILE_TEST
> >+      default HW_RANDOM
> >+      help
> >+        This driver provides support for the Random Number
> >+        Generator hardware available in Nuvoton NPCM SoCs.
> >+
> >+        To compile this driver as a module, choose M here: the
> >+        module will be called npcm-rng.
> >+
> >+        If unsure, say Y.
> >+
> > endif # HW_RANDOM
> >
> > config UML_RANDOM
> >diff --git a/drivers/char/hw_random/Makefile
> >b/drivers/char/hw_random/Makefile
> >index 7c9ef4a7667f..17b6d4e6d591 100644
> >--- a/drivers/char/hw_random/Makefile
> >+++ b/drivers/char/hw_random/Makefile
> >@@ -39,3 +39,4 @@ obj-$(CONFIG_HW_RANDOM_MTK)  += mtk-rng.o
> > obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
> > obj-$(CONFIG_HW_RANDOM_KEYSTONE) += ks-sa-rng.o
> > obj-$(CONFIG_HW_RANDOM_OPTEE) += optee-rng.o
> >+obj-$(CONFIG_HW_RANDOM_NPCM) += npcm-rng.o
> >diff --git a/drivers/char/hw_random/npcm-rng.c
> >b/drivers/char/hw_random/npcm-rng.c
> >new file mode 100644
> >index 000000000000..5b4b1b6cb362
> >--- /dev/null
> >+++ b/drivers/char/hw_random/npcm-rng.c
> >@@ -0,0 +1,207 @@
> >+// SPDX-License-Identifier: GPL-2.0
> >+// Copyright (c) 2019 Nuvoton Technology corporation.
> >+
> >+#include <linux/kernel.h>
> >+#include <linux/module.h>
> >+#include <linux/io.h>
> >+#include <linux/iopoll.h>
> >+#include <linux/init.h>
> >+#include <linux/random.h>
> >+#include <linux/err.h>
> >+#include <linux/platform_device.h>
> >+#include <linux/hw_random.h>
> >+#include <linux/delay.h>
> >+#include <linux/of_irq.h>
> >+#include <linux/pm_runtime.h>
> >+
> >+#define NPCM_RNGCS_REG                0x00    /* Control and status
> register */
> >+#define NPCM_RNGD_REG         0x04    /* Data register */
> >+#define NPCM_RNGMODE_REG      0x08    /* Mode register */
> >+
> >+#define NPCM_RNG_CLK_SET_25MHZ        GENMASK(4, 3) /* 20-25 MHz */
> >+#define NPCM_RNG_DATA_VALID   BIT(1)
> >+#define NPCM_RNG_ENABLE               BIT(0)
> >+#define NPCM_RNG_M1ROSEL      BIT(1)
> >+
> >+#define NPCM_RNG_TIMEOUT_POLL 20
> >+
> >+#define to_npcm_rng(p)        container_of(p, struct npcm_rng, rng)
> >+
> >+struct npcm_rng {
> >+      void __iomem *base;
> >+      struct hwrng rng;
> >+};
> >+
> >+static int npcm_rng_init(struct hwrng *rng)
> >+{
> >+      struct npcm_rng *priv = to_npcm_rng(rng);
> >+      u32 val;
> >+
> >+      val = readl(priv->base + NPCM_RNGCS_REG);
> >+      val |= NPCM_RNG_ENABLE;
> >+      writel(val, priv->base + NPCM_RNGCS_REG);
> >+
> >+      return 0;
> >+}
> >+
> >+static void npcm_rng_cleanup(struct hwrng *rng)
> >+{
> >+      struct npcm_rng *priv = to_npcm_rng(rng);
> >+      u32 val;
> >+
> >+      val = readl(priv->base + NPCM_RNGCS_REG);
> >+      val &= ~NPCM_RNG_ENABLE;
> >+      writel(val, priv->base + NPCM_RNGCS_REG);
> >+}
> >+
> >+static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)
> >+{
> >+      struct npcm_rng *priv = to_npcm_rng(rng);
> >+      int timeout_cnt = 0;
> >+      int ready;
> >+
> >+      ready = readl(priv->base + NPCM_RNGCS_REG) & NPCM_RNG_DATA_VALID;
>
> You should honor the wait paramter here.
>
> >+      while ((ready == 0) && (timeout_cnt < NPCM_RNG_TIMEOUT_POLL)) {
> >+              usleep_range(500, 1000);
> >+              ready = readl(priv->base + NPCM_RNGCS_REG) &
> >+                      NPCM_RNG_DATA_VALID;
> >+              timeout_cnt++;
> >+      }
> >+
> >+      return !!ready;
> >+}
> >+
> >+static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max,
> >bool wait)
> >+{
> >+      struct npcm_rng *priv = to_npcm_rng(rng);
> >+      int retval = 0;
> >+
> >+      pm_runtime_get_sync((struct device *)priv->rng.priv);
> >+
> >+      while (max >= sizeof(u32)) {
> >+              if (!npcm_rng_wait_ready(rng, wait))
> >+                      break;
> >+
> >+              *(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
> >+              retval += sizeof(u32);
> >+              buf += sizeof(u32);
> >+              max -= sizeof(u32);
> >+      }
> >+
> >+      pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
> >+      pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
> >+
> >+      return retval || !wait ? retval : -EIO;
>
> So you are doing pm get/put around each rng data sample.

Do you mean every read? from the core it minimum 32 bytes.
only when *add_early_randomness* function is called the read is 16 bytes.

>
>
Have you characterized the time to enable to the time to get a sample
> and compared to the pm runtime sync parameters?
>
Enabling the hwrng module take much less than generating the random data,
especially when the read is minimum 16 bytes


> Do you get any data if you set non-blocking wait above?
>
yes, if the user need only one byte. but if he will need more than a byte
it will fail.
Do you think I should remove this option because the core read minimum of
16 bytes?

>
>
> >+}
> >+
> >+static int npcm_rng_probe(struct platform_device *pdev)
> >+{
> >+      struct npcm_rng *priv;
> >+      struct resource *res;
> >+      u32 quality;
> >+      int ret;
> >+
> >+      priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >+      if (!priv)
> >+              return -ENOMEM;
> >+
> >+      res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >+      priv->base = devm_ioremap_resource(&pdev->dev, res);
> >+      if (IS_ERR(priv->base))
> >+              return PTR_ERR(priv->base);
> >+
> >+      priv->rng.name = pdev->name;
> >+#ifndef CONFIG_PM
> >+      priv->rng.init = npcm_rng_init;
> >+      priv->rng.cleanup = npcm_rng_cleanup;
>
> so npcm_rng_init and npcm_rng_cleanup are unused if !CONFIG_PM.  No
> warnings?
>
No

>
> >+#endif
> >+      priv->rng.read = npcm_rng_read;
> >+      priv->rng.priv = (unsigned long)&pdev->dev;
> >+      if (of_property_read_u32(pdev->dev.of_node, "quality", &quality))
> >+              priv->rng.quality = 1000;
> >+      else
> >+              priv->rng.quality = quality;
> >+
> >+      writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
> >+#ifndef CONFIG_PM
> >+      writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
> >+#else
> >+      writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
> >+             priv->base + NPCM_RNGCS_REG);
> >+#endif
>
> I am assuming these are safe to always set and the clock will
> bein range?
>
Yes

>
> Did you test without CONFIG_PM ? Looks like the ifndev should be
> ifdef otherwise the enable will never be set.
>
Yes, I have test it.
The hwrng should be enabled when the PM configuration is set before the
*add_early_randomness* function is called in the hwrng core.

>
> Can you use a local variable for this value that is chosen by
> the config instead of ifdef'ing the code?
>
>
>
> >+
> >+      ret = devm_hwrng_register(&pdev->dev, &priv->rng);
> >+      if (ret) {
> >+              dev_err(&pdev->dev, "Failed to register rng device: %d\n",
> >+                      ret);
> >+              return ret;
> >+      }
> >+
> >+      dev_set_drvdata(&pdev->dev, priv);
> >+      pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> >+      pm_runtime_use_autosuspend(&pdev->dev);
> >+      pm_runtime_enable(&pdev->dev);
> >+
> >+      dev_info(&pdev->dev, "Random Number Generator Probed\n");
> >+
> >+      return 0;
> >+}
> >+
> >+static int npcm_rng_remove(struct platform_device *pdev)
> >+{
> >+      struct npcm_rng *priv = platform_get_drvdata(pdev);
> >+
> >+      hwrng_unregister(&priv->rng);
> >+      pm_runtime_disable(&pdev->dev);
> >+      pm_runtime_set_suspended(&pdev->dev);
> >+
> >+      return 0;
> >+}
> >+
> >+#ifdef CONFIG_PM
> >+static int npcm_rng_runtime_suspend(struct device *dev)
> >+{
> >+      struct npcm_rng *priv = dev_get_drvdata(dev);
> >+
> >+      npcm_rng_cleanup(&priv->rng);
> >+
> >+      return 0;
> >+}
> >+
> >+static int npcm_rng_runtime_resume(struct device *dev)
> >+{
> >+      struct npcm_rng *priv = dev_get_drvdata(dev);
> >+
> >+      return npcm_rng_init(&priv->rng);
> >+}
> >+#endif
> >+
> >+static const struct dev_pm_ops npcm_rng_pm_ops = {
> >+      SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,
> >+                         npcm_rng_runtime_resume, NULL)
> >+      SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> >+                              pm_runtime_force_resume)
> >+};
> >+
> >+static const struct of_device_id rng_dt_id[] = {
> >+      { .compatible = "nuvoton,npcm750-rng",  },
> >+      {},
> >+};
> >+MODULE_DEVICE_TABLE(of, rng_dt_id);
> >+
> >+static struct platform_driver npcm_rng_driver = {
> >+      .driver = {
> >+              .name           = "npcm-rng",
> >+              .pm             = &npcm_rng_pm_ops,
> >+              .owner          = THIS_MODULE,
> >+              .of_match_table = of_match_ptr(rng_dt_id),
> >+      },
> >+      .probe          = npcm_rng_probe,
> >+      .remove         = npcm_rng_remove,
> >+};
> >+
> >+module_platform_driver(npcm_rng_driver);
> >+
> >+MODULE_DESCRIPTION("Nuvoton NPCM Random Number Generator Driver");
> >+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> >+MODULE_LICENSE("GPL v2");
> >--
> >2.18.0
> >
> >
>
>
Thanks a lot,

Tomer

--00000000000040b44a05921fcc16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Milton,<div><br></div><div>appreciate =
your comments and sorry for the late reply</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 31 Aug 2019 at 01:4=
7, Milton Miller II &lt;<a href=3D"mailto:miltonm@us.ibm.com">miltonm@us.ib=
m.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On August 28th around 11:28AM in some timezone, Tomer Maimon wrote<br>
<br>
&gt;Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.<br>
&gt;<br>
&gt;Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" =
target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt;---<br>
&gt; drivers/char/hw_random/Kconfig=C2=A0 =C2=A0 |=C2=A0 13 ++<br>
&gt; drivers/char/hw_random/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; drivers/char/hw_random/npcm-rng.c | 207<br>
&gt;++++++++++++++++++++++++++++++<br>
&gt; 3 files changed, 221 insertions(+)<br>
&gt; create mode 100644 drivers/char/hw_random/npcm-rng.c<br>
&gt;<br>
&gt;diff --git a/drivers/char/hw_random/Kconfig<br>
&gt;b/drivers/char/hw_random/Kconfig<br>
&gt;index 59f25286befe..87a1c30e7958 100644<br>
&gt;--- a/drivers/char/hw_random/Kconfig<br>
&gt;+++ b/drivers/char/hw_random/Kconfig<br>
&gt;@@ -440,6 +440,19 @@ config HW_RANDOM_OPTEE<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If unsure, say Y.<br>
&gt; <br>
&gt;+config HW_RANDOM_NPCM<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 tristate &quot;NPCM Random Number Generator suppo=
rt&quot;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 depends on ARCH_NPCM || COMPILE_TEST<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 default HW_RANDOM<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 help<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 This driver provides support for the Rando=
m Number<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Generator hardware available in Nuvoton NP=
CM SoCs.<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 To compile this driver as a module, choose=
 M here: the<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 module will be called npcm-rng.<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 If unsure, say Y.<br>
&gt;+<br>
&gt; endif # HW_RANDOM<br>
&gt; <br>
&gt; config UML_RANDOM<br>
&gt;diff --git a/drivers/char/hw_random/Makefile<br>
&gt;b/drivers/char/hw_random/Makefile<br>
&gt;index 7c9ef4a7667f..17b6d4e6d591 100644<br>
&gt;--- a/drivers/char/hw_random/Makefile<br>
&gt;+++ b/drivers/char/hw_random/Makefile<br>
&gt;@@ -39,3 +39,4 @@ obj-$(CONFIG_HW_RANDOM_MTK)=C2=A0 +=3D mtk-rng.o<br>
&gt; obj-$(CONFIG_HW_RANDOM_S390) +=3D s390-trng.o<br>
&gt; obj-$(CONFIG_HW_RANDOM_KEYSTONE) +=3D ks-sa-rng.o<br>
&gt; obj-$(CONFIG_HW_RANDOM_OPTEE) +=3D optee-rng.o<br>
&gt;+obj-$(CONFIG_HW_RANDOM_NPCM) +=3D npcm-rng.o<br>
&gt;diff --git a/drivers/char/hw_random/npcm-rng.c<br>
&gt;b/drivers/char/hw_random/npcm-rng.c<br>
&gt;new file mode 100644<br>
&gt;index 000000000000..5b4b1b6cb362<br>
&gt;--- /dev/null<br>
&gt;+++ b/drivers/char/hw_random/npcm-rng.c<br>
&gt;@@ -0,0 +1,207 @@<br>
&gt;+// SPDX-License-Identifier: GPL-2.0<br>
&gt;+// Copyright (c) 2019 Nuvoton Technology corporation.<br>
&gt;+<br>
&gt;+#include &lt;linux/kernel.h&gt;<br>
&gt;+#include &lt;linux/module.h&gt;<br>
&gt;+#include &lt;linux/io.h&gt;<br>
&gt;+#include &lt;linux/iopoll.h&gt;<br>
&gt;+#include &lt;linux/init.h&gt;<br>
&gt;+#include &lt;linux/random.h&gt;<br>
&gt;+#include &lt;linux/err.h&gt;<br>
&gt;+#include &lt;linux/platform_device.h&gt;<br>
&gt;+#include &lt;linux/hw_random.h&gt;<br>
&gt;+#include &lt;linux/delay.h&gt;<br>
&gt;+#include &lt;linux/of_irq.h&gt;<br>
&gt;+#include &lt;linux/pm_runtime.h&gt;<br>
&gt;+<br>
&gt;+#define NPCM_RNGCS_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x00=C2=A0 =C2=A0 /* Control and status register */<br>
&gt;+#define NPCM_RNGD_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x04=C2=A0 =C2=
=A0 /* Data register */<br>
&gt;+#define NPCM_RNGMODE_REG=C2=A0 =C2=A0 =C2=A0 0x08=C2=A0 =C2=A0 /* Mode=
 register */<br>
&gt;+<br>
&gt;+#define NPCM_RNG_CLK_SET_25MHZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMASK(4, 3=
) /* 20-25 MHz */<br>
&gt;+#define NPCM_RNG_DATA_VALID=C2=A0 =C2=A0BIT(1)<br>
&gt;+#define NPCM_RNG_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(0)<br>
&gt;+#define NPCM_RNG_M1ROSEL=C2=A0 =C2=A0 =C2=A0 BIT(1)<br>
&gt;+<br>
&gt;+#define NPCM_RNG_TIMEOUT_POLL 20<br>
&gt;+<br>
&gt;+#define to_npcm_rng(p)=C2=A0 =C2=A0 =C2=A0 =C2=A0 container_of(p, stru=
ct npcm_rng, rng)<br>
&gt;+<br>
&gt;+struct npcm_rng {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 void __iomem *base;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct hwrng rng;<br>
&gt;+};<br>
&gt;+<br>
&gt;+static int npcm_rng_init(struct hwrng *rng)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 u32 val;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 val =3D readl(priv-&gt;base + NPCM_RNGCS_REG);<br=
>
&gt;+=C2=A0 =C2=A0 =C2=A0 val |=3D NPCM_RNG_ENABLE;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 writel(val, priv-&gt;base + NPCM_RNGCS_REG);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;+}<br>
&gt;+<br>
&gt;+static void npcm_rng_cleanup(struct hwrng *rng)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 u32 val;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 val =3D readl(priv-&gt;base + NPCM_RNGCS_REG);<br=
>
&gt;+=C2=A0 =C2=A0 =C2=A0 val &amp;=3D ~NPCM_RNG_ENABLE;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 writel(val, priv-&gt;base + NPCM_RNGCS_REG);<br>
&gt;+}<br>
&gt;+<br>
&gt;+static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 int timeout_cnt =3D 0;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 int ready;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ready =3D readl(priv-&gt;base + NPCM_RNGCS_REG) &=
amp; NPCM_RNG_DATA_VALID;<br>
<br>
You should honor the wait paramter here.<br>
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 while ((ready =3D=3D 0) &amp;&amp; (timeout_cnt &=
lt; NPCM_RNG_TIMEOUT_POLL)) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usleep_range(500, 100=
0);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ready =3D readl(priv-=
&gt;base + NPCM_RNGCS_REG) &amp;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 NPCM_RNG_DATA_VALID;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout_cnt++;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 return !!ready;<br>
&gt;+}<br>
&gt;+<br>
&gt;+static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max,<br>
&gt;bool wait)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct npcm_rng *priv =3D to_npcm_rng(rng);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 int retval =3D 0;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pm_runtime_get_sync((struct device *)priv-&gt;rng=
.priv);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 while (max &gt;=3D sizeof(u32)) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!npcm_rng_wait_re=
ady(rng, wait))<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(u32 *)buf =3D readl=
(priv-&gt;base + NPCM_RNGD_REG);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval +=3D sizeof(u3=
2);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D sizeof(u32);=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max -=3D sizeof(u32);=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pm_runtime_mark_last_busy((struct device *)priv-&=
gt;rng.priv);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pm_runtime_put_sync_autosuspend((struct device *)=
priv-&gt;rng.priv);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 return retval || !wait ? retval : -EIO;<br>
<br>
So you are doing pm get/put around each rng data sample.</blockquote><div>D=
o you mean every read? from the core it minimum 32 bytes.</div><div>only wh=
en=C2=A0<span style=3D"font-family:arial,sans-serif;color:rgb(0,0,0)"><b>ad=
d_early_randomness</b></span><span style=3D"font-family:arial,sans-serif;co=
lor:rgb(0,0,0)"><b>=C2=A0</b>function is called the read is 16 bytes.</span=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br></blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
Have you characterized the time to enable to the time to get a sample<br>
and compared to the pm runtime sync parameters?=C2=A0<br></blockquote><div>=
Enabling the hwrng module take much less than generating the random data, e=
specially when the read is minimum 16 bytes</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Do you get any data if you set non-blocking wait above?<br></blockquote><di=
v>yes, if the user need only one byte. but if he will need more than a byte=
 it will fail.=C2=A0</div><div>Do you think I should remove this option bec=
ause the core read minimum of 16 bytes?</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
<br>
&gt;+}<br>
&gt;+<br>
&gt;+static int npcm_rng_probe(struct platform_device *pdev)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct npcm_rng *priv;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 u32 quality;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 priv =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*=
priv), GFP_KERNEL);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 if (!priv)<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 priv-&gt;base =3D devm_ioremap_resource(&amp;pdev=
-&gt;dev, res);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 if (IS_ERR(priv-&gt;base))<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(priv-&=
gt;base);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 priv-&gt;<a href=3D"http://rng.name" rel=3D"noref=
errer" target=3D"_blank">rng.name</a> =3D pdev-&gt;name;<br>
&gt;+#ifndef CONFIG_PM<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 priv-&gt;rng.init =3D npcm_rng_init;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 priv-&gt;rng.cleanup =3D npcm_rng_cleanup;<br>
<br>
so npcm_rng_init and npcm_rng_cleanup are unused if !CONFIG_PM.=C2=A0 No wa=
rnings?<br></blockquote><div>No=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
&gt;+#endif<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 priv-&gt;rng.read =3D npcm_rng_read;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 priv-&gt;rng.priv =3D (unsigned long)&amp;pdev-&g=
t;dev;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 if (of_property_read_u32(pdev-&gt;dev.of_node, &q=
uot;quality&quot;, &amp;quality))<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;rng.quality =
=3D 1000;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv-&gt;rng.quality =
=3D quality;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 writel(NPCM_RNG_M1ROSEL, priv-&gt;base + NPCM_RNG=
MODE_REG);<br>
&gt;+#ifndef CONFIG_PM<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 writel(NPCM_RNG_CLK_SET_25MHZ, priv-&gt;base + NP=
CM_RNGCS_REG);<br>
&gt;+#else<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,<=
br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;base + NPCM_R=
NGCS_REG);<br>
&gt;+#endif<br>
<br>
I am assuming these are safe to always set and the clock will<br>
bein range?<br></blockquote><div>Yes=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Did you test without CONFIG_PM ? Looks like the ifndev should be<br>
ifdef otherwise the enable will never be set.<br></blockquote><div>Yes, I h=
ave test it.</div><div>The hwrng should be enabled when the PM configuratio=
n is set before the=C2=A0</div><div><span style=3D"font-family:arial,sans-s=
erif;color:rgb(0,0,0)"><b>add_early_randomness</b></span><span style=3D"fon=
t-family:arial,sans-serif;color:rgb(0,0,0)"><b>=C2=A0</b>function is called=
 in the hwrng core.</span></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Can you use a local variable for this value that is chosen by<br>
the config instead of ifdef&#39;ing the code?<br>
<br>
<br>
<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ret =3D devm_hwrng_register(&amp;pdev-&gt;dev, &a=
mp;priv-&gt;rng);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&gt=
;dev, &quot;Failed to register rng device: %d\n&quot;,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ret);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 dev_set_drvdata(&amp;pdev-&gt;dev, priv);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pm_runtime_set_autosuspend_delay(&amp;pdev-&gt;de=
v, 100);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pm_runtime_use_autosuspend(&amp;pdev-&gt;dev);<br=
>
&gt;+=C2=A0 =C2=A0 =C2=A0 pm_runtime_enable(&amp;pdev-&gt;dev);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 dev_info(&amp;pdev-&gt;dev, &quot;Random Number G=
enerator Probed\n&quot;);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;+}<br>
&gt;+<br>
&gt;+static int npcm_rng_remove(struct platform_device *pdev)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct npcm_rng *priv =3D platform_get_drvdata(pd=
ev);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 hwrng_unregister(&amp;priv-&gt;rng);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&amp;pdev-&gt;dev);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pm_runtime_set_suspended(&amp;pdev-&gt;dev);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;+}<br>
&gt;+<br>
&gt;+#ifdef CONFIG_PM<br>
&gt;+static int npcm_rng_runtime_suspend(struct device *dev)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct npcm_rng *priv =3D dev_get_drvdata(dev);<b=
r>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 npcm_rng_cleanup(&amp;priv-&gt;rng);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;+}<br>
&gt;+<br>
&gt;+static int npcm_rng_runtime_resume(struct device *dev)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 struct npcm_rng *priv =3D dev_get_drvdata(dev);<b=
r>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 return npcm_rng_init(&amp;priv-&gt;rng);<br>
&gt;+}<br>
&gt;+#endif<br>
&gt;+<br>
&gt;+static const struct dev_pm_ops npcm_rng_pm_ops =3D {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0npcm_rng_runtime_resume, NULL)<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pm_runtime_force_resume)<br>
&gt;+};<br>
&gt;+<br>
&gt;+static const struct of_device_id rng_dt_id[] =3D {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;nuvoton,npcm750-rng&quot;=
,=C2=A0 },<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 {},<br>
&gt;+};<br>
&gt;+MODULE_DEVICE_TABLE(of, rng_dt_id);<br>
&gt;+<br>
&gt;+static struct platform_driver npcm_rng_driver =3D {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 .driver =3D {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;npcm-rng&quot;,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;npcm_rng_pm_ops,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D THIS_MODULE,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D o=
f_match_ptr(rng_dt_id),<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 .probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D npcm=
_rng_probe,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 .remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm=
_rng_remove,<br>
&gt;+};<br>
&gt;+<br>
&gt;+module_platform_driver(npcm_rng_driver);<br>
&gt;+<br>
&gt;+MODULE_DESCRIPTION(&quot;Nuvoton NPCM Random Number Generator Driver&q=
uot;);<br>
&gt;+MODULE_AUTHOR(&quot;Tomer Maimon &lt;<a href=3D"mailto:tomer.maimon@nu=
voton.com" target=3D"_blank">tomer.maimon@nuvoton.com</a>&gt;&quot;);<br>
&gt;+MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt;-- <br>
&gt;2.18.0<br>
&gt;<br>
&gt;<br>
<br></blockquote><div><br></div><div>Thanks a lot,</div><div><br></div><div=
>Tomer=C2=A0</div></div></div>

--00000000000040b44a05921fcc16--
