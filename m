Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D76426FC
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 11:55:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQgS64qxNz3bfV
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 21:55:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jI05zDjD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jI05zDjD;
	dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQgRV30R0z3bT0
	for <openbmc@lists.ozlabs.org>; Mon,  5 Dec 2022 21:54:45 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id q10so7906787qvt.10
        for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2022 02:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=376Rf5lOnQYpjC3Bdbpg8sAgKZ9HnP55y45osaN1xAw=;
        b=jI05zDjDXz8WOsRO6+EygcraOuxNP/UFpu1yCcb8DaPN4TLISmWw38eb/686phBWJR
         oyhxwEQuPio++YYdi1qe7iGGeuMU6/0HWY3XVmHvPVuC/QFxAE8fpRONQztwP4DqIoxs
         j5/i8mlK6OeNNdNri/MBJN+C5033I0yH8UxDC40SZkXVTr4tlE8q7eOHP4B3W6aV34P4
         Ozqd1RRZG/nJolVgmeO6mBdfA7CuQQa6I0je44z5wf3DfD/03n+6uXpQzn/84yOdMXHx
         /cOjxREPves/Wm93csQAgDRp0R1/YM+VrKycOlu/rnmQd8egCO9pkJxFoHbuE0UZKWuX
         MUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=376Rf5lOnQYpjC3Bdbpg8sAgKZ9HnP55y45osaN1xAw=;
        b=IgqVE3P8brmSihKYQXtZps4WaPK7QOuFQRWXqpUI1O3J8lAKF6U469j3DB61mExsP2
         v2DFqZ5sf6dX+GvSc66DAH+mlcFKB7VnBFyP3EtylDfuy0Mr8tgMuwxgXX6ryRQozohR
         nw8JXrIWZ3S75uGpHwrwokCs92j+Mt2Ysjork3KedhJE46lgnvMp+M++86JJtgOuiOrR
         jb/b7rAWqer1JcWC1XQ/fTDKScZfUB4c/C7SU7i8VWKyPysxXztTnBH1WFjQN2AS7tA5
         tfPeztkXiNzdY4k6Jl5cDgc1RenXB62IY5mUKzDhuchUCNboccK4DydOKcrv00/1+7xp
         0uvw==
X-Gm-Message-State: ANoB5pkrV5u8gkdm1TpsDZxeZEn+YqWBT+un1TzDFk1QcxeFcoslLNh0
	XNArwPUdcq/FrgGhGZurGRLZYMYGnzdNd8J67Uc=
X-Google-Smtp-Source: AA0mqf6qZlIlNCoF0kFZl+6/LSGwg+JDHxFcd3brbj4h6Z3NDyzJ2hUYU0ZHCICJrrf1w/EbGCP7H6au6mM/kzQt+Vs=
X-Received: by 2002:ad4:57aa:0:b0:4c6:f83c:4741 with SMTP id
 g10-20020ad457aa000000b004c6f83c4741mr36107545qvx.11.1670237681973; Mon, 05
 Dec 2022 02:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
In-Reply-To: <20221205085351.27566-3-tmaimon77@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Dec 2022 12:54:05 +0200
Message-ID: <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 5, 2022 at 10:54 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton NPCM BMC sdhci-pltfm controller driver.

Thank you for an update, my comments below.

...

> +config MMC_SDHCI_NPCM

>  config MMC_SDHCI_IPROC

Perhaps after IPROC?

...

> @@ -97,6 +97,7 @@ obj-$(CONFIG_MMC_SDHCI_MICROCHIP_PIC32)       += sdhci-pic32.o
>  obj-$(CONFIG_MMC_SDHCI_BRCMSTB)                += sdhci-brcmstb.o
>  obj-$(CONFIG_MMC_SDHCI_OMAP)           += sdhci-omap.o
>  obj-$(CONFIG_MMC_SDHCI_SPRD)           += sdhci-sprd.o
> +obj-$(CONFIG_MMC_SDHCI_NPCM)           += sdhci-npcm.o

Perhaps after IPROC? (There is a group of platform drivers slightly
below than here)

>  obj-$(CONFIG_MMC_CQHCI)                        += cqhci.o

...

> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/mmc.h>
> +#include <linux/module.h>

I guess platform_device.h is missing here.

...

> +static int npcm_sdhci_probe(struct platform_device *pdev)
> +{
> +       struct sdhci_pltfm_host *pltfm_host;
> +       struct sdhci_host *host;
> +       u32 caps;
> +       int ret;
> +
> +       host = sdhci_pltfm_init(pdev, &npcm_sdhci_pdata, 0);
> +       if (IS_ERR(host))
> +               return PTR_ERR(host);
> +
> +       pltfm_host = sdhci_priv(host);

> +       pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);

You can't mix devm with non-devm in this way.

> +       if (IS_ERR(pltfm_host->clk))
> +               return PTR_ERR(pltfm_host->clk);
> +
> +       ret = clk_prepare_enable(pltfm_host->clk);
> +       if (ret)
> +               return ret;
> +
> +       caps = sdhci_readl(host, SDHCI_CAPABILITIES);
> +       if (caps & SDHCI_CAN_DO_8BIT)
> +               host->mmc->caps |= MMC_CAP_8_BIT_DATA;
> +
> +       ret = mmc_of_parse(host->mmc);
> +       if (ret)
> +               goto err_sdhci_add;
> +
> +       ret = sdhci_add_host(host);
> +       if (ret)
> +               goto err_sdhci_add;

Why can't you use sdhci_pltfm_register()?

> +       return 0;
> +
> +err_sdhci_add:
> +       clk_disable_unprepare(pltfm_host->clk);
> +       sdhci_pltfm_free(pdev);
> +       return ret;
> +}

Missing ->remove() due to above.

Have you tried to compile as a module and then remove and insert it
several times?

-- 
With Best Regards,
Andy Shevchenko
