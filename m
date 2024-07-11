Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432A292EF1C
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2024 20:48:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fRMCIqQv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKkJ608thz3fSg
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2024 04:48:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fRMCIqQv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKkGL0cbvz3cy9
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2024 04:46:33 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-64e81cd12cdso11778407b3.0
        for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2024 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720723591; x=1721328391; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7AnrZ08vTP6o9S9SQ4qP+LVla/5fbZ409g1w9Y/pgfo=;
        b=fRMCIqQvSUuvZywpEHWjHYkPV07zJxD8C3i2z/0AWHEuXzYCvjTVWShNmA5CUe8l4D
         gYtuxWu4J+A82JfCvBkgA8K93BxqkmxSaokzFiSIOLAZhkBBnp/WQspkFW6VSXWxPqam
         FCQG2TM4XOYqmS8QkBYxOp6VS5MW9SaEhM73sCWToBP8GhN5wzAWXlhPEyd2F2oXx8Ha
         GmmqnHukSVxg61DGrxw/4Ff5BbZ9wG1hol+ynetdOZYpgjweVMPSMp4+zIdzbjvPL8M2
         G/CAdRv0xOqnSESz0R8KeAoOyiE2rRLnFXPHs7U0OsI1OjzTi+BGKAhluC4pIaSovv/m
         P9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720723591; x=1721328391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AnrZ08vTP6o9S9SQ4qP+LVla/5fbZ409g1w9Y/pgfo=;
        b=LB/gSfGCcG72IbI8o9V6yirh3z4Frwi9uP0809DhD9hiYeUfoo6o5SNYvaQrJkgjyx
         ioXntOQjpSCNQaA1UpNsk3XAYJJiGkC3rnOFnYV4gU+Cw/NFfMCTzVbucJH075SEz/6s
         jG+qtTRivPe7YUWrx+VJkkjilqWIx6Yw8nadnEnlNJm+OH8p82DnmqlLsiWYkAz9Kp9S
         ovNpZKJmRhK5ztcMufQTWU5zWC/0/UX5v1PYrk1g7HQsj4vjW/LvzbG6yxDypI7IFrSH
         mAOuOI30rp6nAKYx5Uc1tInj+sRU1y9yfWUXoFf5cagCIo/qTGr1vIOl8v7ppx+o15Zd
         QCSg==
X-Forwarded-Encrypted: i=1; AJvYcCVfwiyWYcYMWoVywlkRa8m3zjaoGJA3AxAETa2BAXX6OSxmERJnUvW3g4Hx67M2ldftVAlewK9yzLodvnnQgi2B2OmFnd0hS4w=
X-Gm-Message-State: AOJu0YwOaHUaommIdlG1PT7EFH7eXRZ/iLpZ0sUuvcdapa/yy17hNgy8
	N+yC60I+L/gMPRjNo4VHlzwddvL2N2z1+wIhA6ZjpBmpA5D6EnZnzvMRdYlm79vqrqs6gAAm//i
	+zEDxp6mRTgMnOKdoKRKkKnKzj/E=
X-Google-Smtp-Source: AGHT+IHyLGQM0uxkb0nc5QlB4xpEbd2pIqu3s2+nZvwNa5poPdc6GJlQIotFJGHAEgTCVpB/d8dZ/M0Dd5AajU7oZKg=
X-Received: by 2002:a05:690c:6385:b0:64b:82d6:75b9 with SMTP id
 00721157ae682-65dfcf9ba67mr4192027b3.7.1720723591129; Thu, 11 Jul 2024
 11:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240702191650.57364-1-tmaimon77@gmail.com> <20240702191650.57364-3-tmaimon77@gmail.com>
 <CADKL2t4F20iFdwxDH0PXCa8-HO_cDhYzu+ObyzwaazWWkKj-tg@mail.gmail.com>
In-Reply-To: <CADKL2t4F20iFdwxDH0PXCa8-HO_cDhYzu+ObyzwaazWWkKj-tg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 11 Jul 2024 21:46:20 +0300
Message-ID: <CAP6Zq1irF7iZkH6kTCfTNRWY0bzoRv5W65QKwXyDCfUU5TrQCA@mail.gmail.com>
Subject: Re: [PATCH v26 2/3] reset: npcm: register npcm8xx clock auxiliary bus device
To: Benjamin Fair <benjaminfair@google.com>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Benjamin,

Highly appreciated!

Thanks a lot

Tomer

On Thu, 11 Jul 2024 at 21:13, Benjamin Fair <benjaminfair@google.com> wrote:
>
> On Tue, 2 Jul 2024 at 12:17, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Add NPCM8xx clock controller auxiliary bus device registration.
> >
> > The NPCM8xx clock controller is registered as an aux device because the
> > reset and the clock controller share the same register region.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> I booted a kernel with this driver and verified that basic
> functionality works fine.
>
> Tested-by: Benjamin Fair <benjaminfair@google.com>
>
> > ---
> >  drivers/reset/Kconfig               |  1 +
> >  drivers/reset/reset-npcm.c          | 74 ++++++++++++++++++++++++++++-
> >  include/soc/nuvoton/clock-npcm8xx.h | 16 +++++++
> >  3 files changed, 90 insertions(+), 1 deletion(-)
> >  create mode 100644 include/soc/nuvoton/clock-npcm8xx.h
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 7112f5932609..31ec8795c105 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -148,6 +148,7 @@ config RESET_MESON_AUDIO_ARB
> >  config RESET_NPCM
> >         bool "NPCM BMC Reset Driver" if COMPILE_TEST
> >         default ARCH_NPCM
> > +       select AUXILIARY_BUS
> >         help
> >           This enables the reset controller driver for Nuvoton NPCM
> >           BMC SoCs.
> > diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> > index 8935ef95a2d1..aa68b947226a 100644
> > --- a/drivers/reset/reset-npcm.c
> > +++ b/drivers/reset/reset-npcm.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  // Copyright (c) 2019 Nuvoton Technology corporation.
> >
> > +#include <linux/auxiliary_bus.h>
> >  #include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> > @@ -10,11 +11,14 @@
> >  #include <linux/property.h>
> >  #include <linux/reboot.h>
> >  #include <linux/reset-controller.h>
> > +#include <linux/slab.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/regmap.h>
> >  #include <linux/of_address.h>
> >
> > +#include <soc/nuvoton/clock-npcm8xx.h>
> > +
> >  /* NPCM7xx GCR registers */
> >  #define NPCM_MDLR_OFFSET       0x7C
> >  #define NPCM7XX_MDLR_USBD0     BIT(9)
> > @@ -89,6 +93,7 @@ struct npcm_rc_data {
> >         const struct npcm_reset_info *info;
> >         struct regmap *gcr_regmap;
> >         u32 sw_reset_number;
> > +       struct device *dev;
> >         void __iomem *base;
> >         spinlock_t lock;
> >  };
> > @@ -372,6 +377,67 @@ static const struct reset_control_ops npcm_rc_ops = {
> >         .status         = npcm_rc_status,
> >  };
> >
> > +static void npcm_clock_unregister_adev(void *_adev)
> > +{
> > +       struct auxiliary_device *adev = _adev;
> > +
> > +       auxiliary_device_delete(adev);
> > +       auxiliary_device_uninit(adev);
> > +}
> > +
> > +static void npcm_clock_adev_release(struct device *dev)
> > +{
> > +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > +       struct npcm_clock_adev *rdev = to_npcm_clock_adev(adev);
> > +
> > +       kfree(rdev);
> > +}
> > +
> > +static struct auxiliary_device *npcm_clock_adev_alloc(struct npcm_rc_data *rst_data, char *clk_name)
> > +{
> > +       struct npcm_clock_adev *rdev;
> > +       struct auxiliary_device *adev;
> > +       int ret;
> > +
> > +       rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
> > +       if (!rdev)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       rdev->base = rst_data->base;
> > +
> > +       adev = &rdev->adev;
> > +       adev->name = clk_name;
> > +       adev->dev.parent = rst_data->dev;
> > +       adev->dev.release = npcm_clock_adev_release;
> > +       adev->id = 555u;
> > +
> > +       ret = auxiliary_device_init(adev);
> > +       if (ret) {
> > +               kfree(rdev);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       return adev;
> > +}
> > +
> > +static int npcm8xx_clock_controller_register(struct npcm_rc_data *rst_data, char *clk_name)
> > +{
> > +       struct auxiliary_device *adev;
> > +       int ret;
> > +
> > +       adev = npcm_clock_adev_alloc(rst_data, clk_name);
> > +       if (IS_ERR(adev))
> > +               return PTR_ERR(adev);
> > +
> > +       ret = auxiliary_device_add(adev);
> > +       if (ret) {
> > +               auxiliary_device_uninit(adev);
> > +               return ret;
> > +       }
> > +
> > +       return devm_add_action_or_reset(rst_data->dev, npcm_clock_unregister_adev, adev);
> > +}
> > +
> >  static int npcm_rc_probe(struct platform_device *pdev)
> >  {
> >         struct npcm_rc_data *rc;
> > @@ -392,6 +458,7 @@ static int npcm_rc_probe(struct platform_device *pdev)
> >         rc->rcdev.of_node = pdev->dev.of_node;
> >         rc->rcdev.of_reset_n_cells = 2;
> >         rc->rcdev.of_xlate = npcm_reset_xlate;
> > +       rc->dev = &pdev->dev;
> >
> >         ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);
> >         if (ret) {
> > @@ -413,7 +480,12 @@ static int npcm_rc_probe(struct platform_device *pdev)
> >                 }
> >         }
> >
> > -       return ret;
> > +       switch (rc->info->bmc_id) {
> > +       case BMC_NPCM8XX:
> > +               return npcm8xx_clock_controller_register(rc, "clk-npcm8xx");
> > +       default:
> > +               return ret;
> > +       }
> >  }
> >
> >  static struct platform_driver npcm_rc_driver = {
> > diff --git a/include/soc/nuvoton/clock-npcm8xx.h b/include/soc/nuvoton/clock-npcm8xx.h
> > new file mode 100644
> > index 000000000000..139130e98c51
> > --- /dev/null
> > +++ b/include/soc/nuvoton/clock-npcm8xx.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __SOC_NPCM8XX_CLOCK_H
> > +#define __SOC_NPCM8XX_CLOCK_H
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/container_of.h>
> > +
> > +struct npcm_clock_adev {
> > +       void __iomem *base;
> > +       struct auxiliary_device adev;
> > +};
> > +
> > +#define to_npcm_clock_adev(_adev) \
> > +       container_of((_adev), struct npcm_clock_adev, adev)
> > +
> > +#endif
> > --
> > 2.34.1
> >
