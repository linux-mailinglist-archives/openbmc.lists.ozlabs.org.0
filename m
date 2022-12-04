Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4077641C9C
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 12:22:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQ45V3KbGz3bNy
	for <lists+openbmc@lfdr.de>; Sun,  4 Dec 2022 22:22:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bsm+SYLu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bsm+SYLu;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQ44s3bb8z3bNn
	for <openbmc@lists.ozlabs.org>; Sun,  4 Dec 2022 22:21:31 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id z24so10447019ljn.4
        for <openbmc@lists.ozlabs.org>; Sun, 04 Dec 2022 03:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VzxN0a65z/xh5y8UY35P3CfCctAsgTN/CeWWUe2WBcw=;
        b=bsm+SYLuNeRO6BAjvQlQ4TIaG6/6NdYqNvbB4RlSEyP0DFkYE2vlz8IlOuj+K/gvYW
         8nG8WvZHhqw7z7ZotV5L/+dCsZs99lHTXgKo8kFCyK0zvFnt+ihW1AWCHtRYRXfPSjZM
         s//Q+24IZCCfnrIfQei1k3zBSdKCUMgYMzoTpwYGx+YB2l+78dazsuZF7StEWi70mxFs
         i8DAiUKjkU2qmgfZ5kMskeEiJPM11BGporGg0EhsDjSI7iKL7Pr87afP1n2kEhQIVVZY
         VfDXstD+WIZ2umIqFYrml1u+Clb0dTwf1UaZql8EYZpPU6VUPOjmHLK2dIbYaug0tD5e
         3VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzxN0a65z/xh5y8UY35P3CfCctAsgTN/CeWWUe2WBcw=;
        b=EdkCM7PRU3ynzQ9rY4mq8nMdSXE5s0/HHD8UIeA40i37wTKXeST9J3lqr7c8jXiNuR
         QSGLeB0tlNVDv5Sd1Qm9+7DC2jctilDkrc1pVmGwZLz7ZXBnnxHhHhTNFsVBsmls1gQN
         ste/pHNQMSbfXU7Ejz6OXWDpMBPycm3cNG7mwyHGT5RLvTUozwQBqw2C8xc3VICwBHpI
         PXuiYetgE3/UOsDOdQ/axdBeUaanRz9bS8lXJZEJDnE+mxuhHCsZK6W8e/18Gl3NICZZ
         fVLef3V4uMbIkWZpw0mJXt+eO2iBv91VYkeJ3j38nTdiPgiLeQYyPzc9Z49NTqWrHa8f
         j2+g==
X-Gm-Message-State: ANoB5pltdiOw7WK6d9Xh0Mibiw+IJr9FW16kvN6P6rdcGjCVENNZEAP2
	lwv8S/JlOTdZWnnVsO/w8xJmzEFVwPScp69KRlg=
X-Google-Smtp-Source: AA0mqf6jF2SAt0IChwJcmP7BdZ2L/cinR4COc/NkJx0tLOuvLCXAKC31M+i+Q8bXLIABUTeys7fcBpVwhgKvfNAZw5w=
X-Received: by 2002:a05:651c:b10:b0:26f:c081:9aee with SMTP id
 b16-20020a05651c0b1000b0026fc0819aeemr18412001ljr.219.1670152885927; Sun, 04
 Dec 2022 03:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20221130150857.67113-1-tmaimon77@gmail.com> <20221130150857.67113-3-tmaimon77@gmail.com>
 <0b5df859-a662-a677-aaa0-cbf68c029ab9@intel.com>
In-Reply-To: <0b5df859-a662-a677-aaa0-cbf68c029ab9@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 4 Dec 2022 13:21:14 +0200
Message-ID: <CAP6Zq1iokM2chLjGiRmFxe3w2vUUKQ0acd6V9z=7AmDZMSViQw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
To: Adrian Hunter <adrian.hunter@intel.com>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, andy.shevchenko@gmail.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Adrian,

Thanks for your comments.

Your comments will be addressed next version.

On Thu, 1 Dec 2022 at 18:28, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 30/11/22 17:08, Tomer Maimon wrote:
> > Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/mmc/host/Kconfig      |  8 ++++
> >  drivers/mmc/host/Makefile     |  1 +
> >  drivers/mmc/host/sdhci-npcm.c | 81 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 90 insertions(+)
> >  create mode 100644 drivers/mmc/host/sdhci-npcm.c
> >
> > diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> > index fb1062a6394c..4b2d9ce4308c 100644
> > --- a/drivers/mmc/host/Kconfig
> > +++ b/drivers/mmc/host/Kconfig
> > @@ -709,6 +709,14 @@ config MMC_TMIO
> >         This provides support for the SD/MMC cell found in TC6393XB,
> >         T7L66XB and also HTC ASIC3
> >
> > +config MMC_SDHCI_NPCM
> > +     tristate "Secure Digital Host Controller Interface support for NPCM"
> > +     depends on ARCH_NPCM || COMPILE_TEST
> > +     depends on MMC_SDHCI_PLTFM
> > +     help
> > +       This provides support for the SD/eMMC controller found in
> > +       NPCM BMC family SoCs.
> > +
> >  config MMC_SDHI
> >       tristate "Renesas SDHI SD/SDIO controller support"
> >       depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
> > diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> > index 4e4ceb32c4b4..801086613d7f 100644
> > --- a/drivers/mmc/host/Makefile
> > +++ b/drivers/mmc/host/Makefile
> > @@ -37,6 +37,7 @@ obj-$(CONFIG_MMC_SPI)               += of_mmc_spi.o
> >  obj-$(CONFIG_MMC_S3C)        += s3cmci.o
> >  obj-$(CONFIG_MMC_SDRICOH_CS) += sdricoh_cs.o
> >  obj-$(CONFIG_MMC_TMIO)               += tmio_mmc.o
> > +obj-$(CONFIG_MMC_SDHCI_NPCM) += sdhci-npcm.o
> >  obj-$(CONFIG_MMC_TMIO_CORE)  += tmio_mmc_core.o
> >  obj-$(CONFIG_MMC_SDHI)               += renesas_sdhi_core.o
> >  obj-$(CONFIG_MMC_SDHI_SYS_DMAC)              += renesas_sdhi_sys_dmac.o
> > diff --git a/drivers/mmc/host/sdhci-npcm.c b/drivers/mmc/host/sdhci-npcm.c
> > new file mode 100644
> > index 000000000000..298c5f3e7c2b
> > --- /dev/null
> > +++ b/drivers/mmc/host/sdhci-npcm.c
> > @@ -0,0 +1,81 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * NPCM SDHC MMC host controller driver.
> > + *
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/mmc/host.h>
> > +#include <linux/mmc/mmc.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
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
> > +     pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
>
> For an optional clock, something like:
>
>         pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
>         if (IS_ERR(pltfm_host->clk))
>                 return PTR_ERR(pltfm_host->clk);
>
> will handle -EPROBE_DEFER
>
> > +
> > +     if (!IS_ERR(pltfm_host->clk))
> > +             clk_prepare_enable(pltfm_host->clk);
> > +
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
> > +
> > +module_platform_driver(npcm_sdhci_driver);
> > +
> > +MODULE_DESCRIPTION("NPCM Secure Digital Host Controller Interface driver");
> > +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> > +MODULE_LICENSE("GPL v2");
>
> WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
> #133: FILE: drivers/mmc/host/sdhci-npcm.c:81:
> +MODULE_LICENSE("GPL v2");
>
>

Best regards,

Tomer
