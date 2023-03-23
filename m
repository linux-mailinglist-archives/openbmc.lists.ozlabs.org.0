Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 423756C6814
	for <lists+openbmc@lfdr.de>; Thu, 23 Mar 2023 13:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj4FK0SS9z3f3x
	for <lists+openbmc@lfdr.de>; Thu, 23 Mar 2023 23:21:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mD4LZLSV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mD4LZLSV;
	dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj4Dj6nBVz3cdL
	for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2023 23:20:37 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5445009c26bso391418047b3.8
        for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2023 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679574033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dsiewv1O2k8V1HgYXshp7MCoXkAGG/2ljcLy5V0fCAY=;
        b=mD4LZLSVxLGUwCVQRPyUG/E+HpMJnL0y2QOvXPP7296TXuYBgqjoZFwnQxvfwLeBCt
         nipNWIH5s9pTqZSUc2HrXRr+5vgSriF5mP8Pgjyz7Z9AnPsTQx0t5HrW5GcmlVUk0nxu
         UPsLyOw5yk2zI1vJKb7KZ27uR7303Zd2XCF31W5zt7XpQE0R4vcMCVf6dGgSsplSOyxO
         uzPO0CWwqZ+2+o89pRajm3cJ+i348IPgSezo9uHcJaPw4o8n22tcqOk7g+pbWPIxqPOn
         WSgL7zwTIh8MS77uAU2BSh6YAH80f4aFhD6shByuuW0AVqE++cGc6qvwxhDl/OO/Ixoy
         v6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679574033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsiewv1O2k8V1HgYXshp7MCoXkAGG/2ljcLy5V0fCAY=;
        b=1aoIIEwVCOCzwIeZ4lS0d5KNAN9BMp7kFeMAO4EhzQjbCSEwE5V0IT/iV6bvJK3i7F
         y+nCTFwwht3IjK9cduwlG2R7Zcv11edGYpVqMx1LEKti5sjb5n3eJTu+FecTT1uyonqJ
         QaBOIyeqk6UMaekzokY8N2pn95Cdn3jhsMD7ARR2I1OcUIpdrPJxhSc5TiDsZoXLHHkM
         /+xkUNgoGpfYP7YGF7mC//wKxRQIBOIw8PI2hRIxQLemRjWhEoL9iZxr0RL+dgWuKqQq
         LXGgEnCFVdVdZPInn8M4VIPdGtXtDRz6LdxCMaoCkOSEGo/h7B18YWK5cOagpxKmHvoh
         sT7A==
X-Gm-Message-State: AAQBX9ff8IK7ohRUYnNnV6cvwxn2EAOj8QQ5SW/ReJiff6t0S31xHOn9
	2Pw9ZUrSskA7BNxDQuNBCq7dP0r3NOSC0EEpMT7E+g==
X-Google-Smtp-Source: AKy350a9PgdqZyyRieSlRzFLQRJHBuDE7c080j8qkbym2YY5zeGq+1tmxcWFgg7px0mx8p5mR45XOCSaDat0z6T/8Ms=
X-Received: by 2002:a81:b345:0:b0:53c:6fda:835f with SMTP id
 r66-20020a81b345000000b0053c6fda835fmr1699102ywh.0.1679574033577; Thu, 23 Mar
 2023 05:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
 <f28c7c34-077c-4c7e-afd8-c4180718d403@roeck-us.net>
In-Reply-To: <f28c7c34-077c-4c7e-afd8-c4180718d403@roeck-us.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Mar 2023 13:19:57 +0100
Message-ID: <CAPDyKFo0d9Vz_8p_SEVznT2hzBZqnZsUnrp4T3mtRSnZZBEfFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
To: Tomer Maimon <tmaimon77@gmail.com>, Guenter Roeck <linux@roeck-us.net>
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
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, devicetree@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 17 Mar 2023 at 15:16, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Dec 05, 2022 at 10:53:51AM +0200, Tomer Maimon wrote:
> > Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> I still don't see this driver in the upstream kernel, or in linux-next.

Tomer, Guenter,

Looks like I may have missed picking it up, probably because I thought
the review was still ongoing.

Please re-submit and include the reviewed-by tags, etc.

Kind regards
Uffe

>
> Couple of comments:
>
> - devm ordering does not really matter here. The devm resource
>   is the clock, it does not depend on local data, and it will be
>   released last, so that is ok.
> - sdhci_pltfm_unregister() calls clk_disable_unprepare(),
>   so there is no enabled clock floating around on driver removal.
>   Unfortunately, that also means that the more convenient
>   devm_clk_get_optional_enabled() can not be used.
>
> Real problem inline below.
>
> Guenter
>
> > ---
> >  drivers/mmc/host/Kconfig      |  8 ++++
> >  drivers/mmc/host/Makefile     |  1 +
> >  drivers/mmc/host/sdhci-npcm.c | 84 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 93 insertions(+)
> >  create mode 100644 drivers/mmc/host/sdhci-npcm.c
> >
> > diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> > index fb1062a6394c..82ab6fc25dca 100644
> > --- a/drivers/mmc/host/Kconfig
> > +++ b/drivers/mmc/host/Kconfig
> > @@ -415,6 +415,14 @@ config MMC_SDHCI_MILBEAUT
> >
> >         If unsure, say N.
> >
> > +config MMC_SDHCI_NPCM
> > +     tristate "Secure Digital Host Controller Interface support for NPCM"
> > +     depends on ARCH_NPCM || COMPILE_TEST
> > +     depends on MMC_SDHCI_PLTFM
> > +     help
> > +       This provides support for the SD/eMMC controller found in
> > +       NPCM BMC family SoCs.
> > +
> >  config MMC_SDHCI_IPROC
> >       tristate "SDHCI support for the BCM2835 & iProc SD/MMC Controller"
> >       depends on ARCH_BCM2835 || ARCH_BCM_IPROC || ARCH_BRCMSTB || COMPILE_TEST
> > diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> > index 4e4ceb32c4b4..a101f87a5f19 100644
> > --- a/drivers/mmc/host/Makefile
> > +++ b/drivers/mmc/host/Makefile
> > @@ -97,6 +97,7 @@ obj-$(CONFIG_MMC_SDHCI_MICROCHIP_PIC32)     += sdhci-pic32.o
> >  obj-$(CONFIG_MMC_SDHCI_BRCMSTB)              += sdhci-brcmstb.o
> >  obj-$(CONFIG_MMC_SDHCI_OMAP)         += sdhci-omap.o
> >  obj-$(CONFIG_MMC_SDHCI_SPRD)         += sdhci-sprd.o
> > +obj-$(CONFIG_MMC_SDHCI_NPCM)         += sdhci-npcm.o
> >  obj-$(CONFIG_MMC_CQHCI)                      += cqhci.o
> >  cqhci-y                                      += cqhci-core.o
> >  cqhci-$(CONFIG_MMC_CRYPTO)           += cqhci-crypto.o
> > diff --git a/drivers/mmc/host/sdhci-npcm.c b/drivers/mmc/host/sdhci-npcm.c
> > new file mode 100644
> > index 000000000000..beace15b6c00
> > --- /dev/null
> > +++ b/drivers/mmc/host/sdhci-npcm.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * NPCM SDHC MMC host controller driver.
> > + *
> > + * Copyright (c) 2020 Nuvoton Technology corporation.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/mmc/host.h>
> > +#include <linux/mmc/mmc.h>
> > +#include <linux/module.h>
> > +
> > +#include "sdhci-pltfm.h"
> > +
> > +static const struct sdhci_pltfm_data npcm_sdhci_pdata = {
> > +     .quirks  = SDHCI_QUIRK_DELAY_AFTER_POWER,
> > +     .quirks2 = SDHCI_QUIRK2_STOP_WITH_TC |
> > +                SDHCI_QUIRK2_NO_1_8_V,
> > +};
> > +
> > +static int npcm_sdhci_probe(struct platform_device *pdev)
> > +{
> > +     struct sdhci_pltfm_host *pltfm_host;
> > +     struct sdhci_host *host;
> > +     u32 caps;
> > +     int ret;
> > +
> > +     host = sdhci_pltfm_init(pdev, &npcm_sdhci_pdata, 0);
> > +     if (IS_ERR(host))
> > +             return PTR_ERR(host);
> > +
> > +     pltfm_host = sdhci_priv(host);
> > +
> > +     pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
> > +     if (IS_ERR(pltfm_host->clk))
> > +             return PTR_ERR(pltfm_host->clk);
> > +
> > +     ret = clk_prepare_enable(pltfm_host->clk);
> > +     if (ret)
> > +             return ret;
> > +
>
> The two functions above should not return but goto the call
> to sdhci_pltfm_free() to avoid a memory leak on error.
>
> > +     caps = sdhci_readl(host, SDHCI_CAPABILITIES);
> > +     if (caps & SDHCI_CAN_DO_8BIT)
> > +             host->mmc->caps |= MMC_CAP_8_BIT_DATA;
> > +
> > +     ret = mmc_of_parse(host->mmc);
> > +     if (ret)
> > +             goto err_sdhci_add;
> > +
> > +     ret = sdhci_add_host(host);
> > +     if (ret)
> > +             goto err_sdhci_add;
> > +
> > +     return 0;
> > +
> > +err_sdhci_add:
> > +     clk_disable_unprepare(pltfm_host->clk);
> > +     sdhci_pltfm_free(pdev);
> > +     return ret;
> > +}
> > +
> > +static const struct of_device_id npcm_sdhci_of_match[] = {
> > +     { .compatible = "nuvoton,npcm750-sdhci" },
> > +     { .compatible = "nuvoton,npcm845-sdhci" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, npcm_sdhci_of_match);
> > +
> > +static struct platform_driver npcm_sdhci_driver = {
> > +     .driver = {
> > +             .name   = "npcm-sdhci",
> > +             .of_match_table = npcm_sdhci_of_match,
> > +             .pm     = &sdhci_pltfm_pmops,
> > +     },
> > +     .probe          = npcm_sdhci_probe,
> > +     .remove         = sdhci_pltfm_unregister,
> > +};
> > +module_platform_driver(npcm_sdhci_driver);
> > +
> > +MODULE_DESCRIPTION("NPCM Secure Digital Host Controller Interface driver");
> > +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.33.0
> >
