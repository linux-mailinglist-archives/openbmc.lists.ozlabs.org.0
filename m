Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30092EE91
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2024 20:13:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=p80Yijmv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKjXg3Tntz3ccL
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2024 04:13:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=p80Yijmv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=benjaminfair@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKjX64v0xz3cRs
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2024 04:13:25 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6510c0c8e29so11537007b3.0
        for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2024 11:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720721600; x=1721326400; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nyJ6P+FkdwGhVRPUnMvVBafw0z1eayMg2GyL0TyLrvU=;
        b=p80YijmvBKbR42Lo+z3iYKZZfnKExmLaSEdBm7IIKVeF5G1/40u4nsOAtkk/NHBp9R
         wwnzMBdFiv3CmN/VUit0phTLW615Hs+n2ZU3QLIxFjuKGWTuciZMkJghKvnseN9VJ/F0
         LvR+T+5Il1T6NzzdjdyXQ8+pEysisI2VUz+WzUC57NWxtSFm6Ld1FUjHZD7buKFrhmUL
         WvvjK/lLl/Okby8Q6uN1p2KACAGuF9Z+e2MEpwk+KuK/tTDtVHys8UeHHx7kbp+rAw+P
         ZFe8mHRpSXue0rVkIHACB4h2UgqXLQjrRA15Vdqkf1iVo1y71VL29v0oV/HWgB4bt2p+
         tNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720721600; x=1721326400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyJ6P+FkdwGhVRPUnMvVBafw0z1eayMg2GyL0TyLrvU=;
        b=ODCoJRDalzDgcVUSuPD9pZ7Ak5sZxnmOXAr95HlpHLqAlWsPyY0f6Fo2i9tIQpmfMh
         I7CVgMTzUSScpEXlyztk4pzYE66p8yKLIkVJdWivTG9Bs3jGuuEwyQkSK8PJBW5yzKaj
         W0gSbdp3dsDmIqGcv7hnN4r21Au/vTemyBr+B9tWmjvoBwtC23jD/7U4m49i3jqj6mbL
         mELJXM3zyBNVoux3mIsNzRvhGB3oJ7lhy8BG1ULYkrYckjpYND2wh973rN3WvPFSf2el
         z0iJ2nO9QUYDFDhR08uoTYdDdmxP0VQgVzJHgjaKCcnTswn9wkih0qe5d3tm7tg1XDSi
         Ddng==
X-Forwarded-Encrypted: i=1; AJvYcCXnauP++jiyVhBbK3ZjFkNF2rHeNNyzijpV3XV36TE2AWeLcncIi8cAL3Nkl+2uxslmENYJV/o01wyS6ZjqUqJ/XoQZabMKZlk=
X-Gm-Message-State: AOJu0YzBt2aI6UUNZLE3JpR5LIaJ3ZSwGfbfpSXsIlm6vYViVqo1MOtP
	akQUdBRpYW5Sskq+muDtoksyUlg0vFU9SbjwwPAXLolOG+GihFKMRde6ynBnjTgSz2ZkKRQom1c
	HAnb6h1auKEjArreh83nPo7QaRowERYlZxNSo
X-Google-Smtp-Source: AGHT+IEEQU5biwkInlxNgBrM2IpMWrKKZsCPM/P2i2VC7zYaPlXK0eCVtc6vDTBA+rUofvGyIoZFTCjIctuVqbLEHM4=
X-Received: by 2002:a05:690c:6112:b0:631:ffc1:4397 with SMTP id
 00721157ae682-658ef34a2e9mr120082367b3.29.1720721599990; Thu, 11 Jul 2024
 11:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240702191650.57364-1-tmaimon77@gmail.com> <20240702191650.57364-3-tmaimon77@gmail.com>
In-Reply-To: <20240702191650.57364-3-tmaimon77@gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 11 Jul 2024 11:12:42 -0700
Message-ID: <CADKL2t4F20iFdwxDH0PXCa8-HO_cDhYzu+ObyzwaazWWkKj-tg@mail.gmail.com>
Subject: Re: [PATCH v26 2/3] reset: npcm: register npcm8xx clock auxiliary bus device
To: Tomer Maimon <tmaimon77@gmail.com>
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

On Tue, 2 Jul 2024 at 12:17, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add NPCM8xx clock controller auxiliary bus device registration.
>
> The NPCM8xx clock controller is registered as an aux device because the
> reset and the clock controller share the same register region.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

I booted a kernel with this driver and verified that basic
functionality works fine.

Tested-by: Benjamin Fair <benjaminfair@google.com>

> ---
>  drivers/reset/Kconfig               |  1 +
>  drivers/reset/reset-npcm.c          | 74 ++++++++++++++++++++++++++++-
>  include/soc/nuvoton/clock-npcm8xx.h | 16 +++++++
>  3 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 include/soc/nuvoton/clock-npcm8xx.h
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 7112f5932609..31ec8795c105 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -148,6 +148,7 @@ config RESET_MESON_AUDIO_ARB
>  config RESET_NPCM
>         bool "NPCM BMC Reset Driver" if COMPILE_TEST
>         default ARCH_NPCM
> +       select AUXILIARY_BUS
>         help
>           This enables the reset controller driver for Nuvoton NPCM
>           BMC SoCs.
> diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> index 8935ef95a2d1..aa68b947226a 100644
> --- a/drivers/reset/reset-npcm.c
> +++ b/drivers/reset/reset-npcm.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2019 Nuvoton Technology corporation.
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> @@ -10,11 +11,14 @@
>  #include <linux/property.h>
>  #include <linux/reboot.h>
>  #include <linux/reset-controller.h>
> +#include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/of_address.h>
>
> +#include <soc/nuvoton/clock-npcm8xx.h>
> +
>  /* NPCM7xx GCR registers */
>  #define NPCM_MDLR_OFFSET       0x7C
>  #define NPCM7XX_MDLR_USBD0     BIT(9)
> @@ -89,6 +93,7 @@ struct npcm_rc_data {
>         const struct npcm_reset_info *info;
>         struct regmap *gcr_regmap;
>         u32 sw_reset_number;
> +       struct device *dev;
>         void __iomem *base;
>         spinlock_t lock;
>  };
> @@ -372,6 +377,67 @@ static const struct reset_control_ops npcm_rc_ops = {
>         .status         = npcm_rc_status,
>  };
>
> +static void npcm_clock_unregister_adev(void *_adev)
> +{
> +       struct auxiliary_device *adev = _adev;
> +
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +
> +static void npcm_clock_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +       struct npcm_clock_adev *rdev = to_npcm_clock_adev(adev);
> +
> +       kfree(rdev);
> +}
> +
> +static struct auxiliary_device *npcm_clock_adev_alloc(struct npcm_rc_data *rst_data, char *clk_name)
> +{
> +       struct npcm_clock_adev *rdev;
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
> +       if (!rdev)
> +               return ERR_PTR(-ENOMEM);
> +
> +       rdev->base = rst_data->base;
> +
> +       adev = &rdev->adev;
> +       adev->name = clk_name;
> +       adev->dev.parent = rst_data->dev;
> +       adev->dev.release = npcm_clock_adev_release;
> +       adev->id = 555u;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               kfree(rdev);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return adev;
> +}
> +
> +static int npcm8xx_clock_controller_register(struct npcm_rc_data *rst_data, char *clk_name)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = npcm_clock_adev_alloc(rst_data, clk_name);
> +       if (IS_ERR(adev))
> +               return PTR_ERR(adev);
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(rst_data->dev, npcm_clock_unregister_adev, adev);
> +}
> +
>  static int npcm_rc_probe(struct platform_device *pdev)
>  {
>         struct npcm_rc_data *rc;
> @@ -392,6 +458,7 @@ static int npcm_rc_probe(struct platform_device *pdev)
>         rc->rcdev.of_node = pdev->dev.of_node;
>         rc->rcdev.of_reset_n_cells = 2;
>         rc->rcdev.of_xlate = npcm_reset_xlate;
> +       rc->dev = &pdev->dev;
>
>         ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);
>         if (ret) {
> @@ -413,7 +480,12 @@ static int npcm_rc_probe(struct platform_device *pdev)
>                 }
>         }
>
> -       return ret;
> +       switch (rc->info->bmc_id) {
> +       case BMC_NPCM8XX:
> +               return npcm8xx_clock_controller_register(rc, "clk-npcm8xx");
> +       default:
> +               return ret;
> +       }
>  }
>
>  static struct platform_driver npcm_rc_driver = {
> diff --git a/include/soc/nuvoton/clock-npcm8xx.h b/include/soc/nuvoton/clock-npcm8xx.h
> new file mode 100644
> index 000000000000..139130e98c51
> --- /dev/null
> +++ b/include/soc/nuvoton/clock-npcm8xx.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __SOC_NPCM8XX_CLOCK_H
> +#define __SOC_NPCM8XX_CLOCK_H
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +
> +struct npcm_clock_adev {
> +       void __iomem *base;
> +       struct auxiliary_device adev;
> +};
> +
> +#define to_npcm_clock_adev(_adev) \
> +       container_of((_adev), struct npcm_clock_adev, adev)
> +
> +#endif
> --
> 2.34.1
>
