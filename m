Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD9B6BEAE3
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 15:17:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdR61230zz3f3w
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 01:17:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WNJy2ZnB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WNJy2ZnB;
	dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdR5N3VzPz3cd2
	for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2023 01:16:39 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id a13so2805350ilr.9
        for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679062596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ckr4N9Sg6yKbc6efTCWtcAHsD7HxkVk0i05mjYu31s=;
        b=WNJy2ZnBkM8Tkwd+KJi7m787VnBx0swkocx+gbV662DuU/V4GLdrU9OZnb8ykE9cia
         P6oSqNRA7TabRBdENL0v0ncOdiUwVj9nL2v/paZBi227Z1J8qmzcmqfGSeUzSRwnU+5b
         XNchW5m717XFXc/SzHNiWbfjC00B1BpdZ4N4CODgvMjLbCYzcxCbBhRfW4xbj+5Bmcf1
         Ugv3LC8U//tpgnxEMRM0RoGCpQ4sEb2gsLcqLroCL8r1C5SOAY+pdjcxeyQn8Gc4kjkT
         hSEGYJxWlqYJu+F7VSZ7BIFpic0+1HDJKTkf3xBF7aw3iZRE9Abfuh8sb8IxB6vrdw9b
         sOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679062596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ckr4N9Sg6yKbc6efTCWtcAHsD7HxkVk0i05mjYu31s=;
        b=Nz3/K9qb9v2+5rN04qcSTt9erKSi+blAG1GD8lBBua0zraW7+uCfTsisPMbyqixYO+
         yTy6jJf/ZJQ09s7pf834G/9hgLHcsjDh8Q1Eurbjra4wxGdYkneWfXB+JHXYRnMq2uqr
         Og5wj2V2atxqct9n9PGvRI7ubx8BX40S6II/akzqZhcvMOX+NRZ3GtEiMzSl3knMP1uN
         +aV8HbJmg4JUZd6W/BsqhwI40bBqPLKbb7GCDkZ2NcOPAeKDcYVP6gQ/AXcPW9ikjzCl
         +lYcFS33j/HdoAjPFpOEBeR2jbGv6zYUXi5OvLf8N6PJIIREMUeq2mnXIboBEJfkY6yc
         VkhQ==
X-Gm-Message-State: AO0yUKUCxTbXqhJyw//whP0QQ16ilDfjFVOdeubHASYGcoFLDBensMD0
	FIFzH6VcFEV6+3wLLIep8zQ=
X-Google-Smtp-Source: AK7set9SLmJwK/CZFRPZV2uNhmXoOUlXDKKRGv8Vge8H2EEO6FUoFm4c2gVXXbQYUQGPsz8OALi7UA==
X-Received: by 2002:a92:6a0c:0:b0:317:9c8b:c0a7 with SMTP id f12-20020a926a0c000000b003179c8bc0a7mr9056018ilc.11.1679062596257;
        Fri, 17 Mar 2023 07:16:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s29-20020a02b15d000000b004061ba59f18sm706712jah.120.2023.03.17.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 07:16:35 -0700 (PDT)
Date: Fri, 17 Mar 2023 07:16:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
Message-ID: <f28c7c34-077c-4c7e-afd8-c4180718d403@roeck-us.net>
References: <20221205085351.27566-1-tmaimon77@gmail.com>
 <20221205085351.27566-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205085351.27566-3-tmaimon77@gmail.com>
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
Cc: andy.shevchenko@gmail.com, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, devicetree@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 05, 2022 at 10:53:51AM +0200, Tomer Maimon wrote:
> Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

I still don't see this driver in the upstream kernel, or in linux-next.

Couple of comments:

- devm ordering does not really matter here. The devm resource
  is the clock, it does not depend on local data, and it will be
  released last, so that is ok.
- sdhci_pltfm_unregister() calls clk_disable_unprepare(),
  so there is no enabled clock floating around on driver removal.
  Unfortunately, that also means that the more convenient
  devm_clk_get_optional_enabled() can not be used.

Real problem inline below.

Guenter

> ---
>  drivers/mmc/host/Kconfig      |  8 ++++
>  drivers/mmc/host/Makefile     |  1 +
>  drivers/mmc/host/sdhci-npcm.c | 84 +++++++++++++++++++++++++++++++++++
>  3 files changed, 93 insertions(+)
>  create mode 100644 drivers/mmc/host/sdhci-npcm.c
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index fb1062a6394c..82ab6fc25dca 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -415,6 +415,14 @@ config MMC_SDHCI_MILBEAUT
>  
>  	  If unsure, say N.
>  
> +config MMC_SDHCI_NPCM
> +	tristate "Secure Digital Host Controller Interface support for NPCM"
> +	depends on ARCH_NPCM || COMPILE_TEST
> +	depends on MMC_SDHCI_PLTFM
> +	help
> +	  This provides support for the SD/eMMC controller found in
> +	  NPCM BMC family SoCs.
> +
>  config MMC_SDHCI_IPROC
>  	tristate "SDHCI support for the BCM2835 & iProc SD/MMC Controller"
>  	depends on ARCH_BCM2835 || ARCH_BCM_IPROC || ARCH_BRCMSTB || COMPILE_TEST
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 4e4ceb32c4b4..a101f87a5f19 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -97,6 +97,7 @@ obj-$(CONFIG_MMC_SDHCI_MICROCHIP_PIC32)	+= sdhci-pic32.o
>  obj-$(CONFIG_MMC_SDHCI_BRCMSTB)		+= sdhci-brcmstb.o
>  obj-$(CONFIG_MMC_SDHCI_OMAP)		+= sdhci-omap.o
>  obj-$(CONFIG_MMC_SDHCI_SPRD)		+= sdhci-sprd.o
> +obj-$(CONFIG_MMC_SDHCI_NPCM)		+= sdhci-npcm.o
>  obj-$(CONFIG_MMC_CQHCI)			+= cqhci.o
>  cqhci-y					+= cqhci-core.o
>  cqhci-$(CONFIG_MMC_CRYPTO)		+= cqhci-crypto.o
> diff --git a/drivers/mmc/host/sdhci-npcm.c b/drivers/mmc/host/sdhci-npcm.c
> new file mode 100644
> index 000000000000..beace15b6c00
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-npcm.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * NPCM SDHC MMC host controller driver.
> + *
> + * Copyright (c) 2020 Nuvoton Technology corporation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/mmc.h>
> +#include <linux/module.h>
> +
> +#include "sdhci-pltfm.h"
> +
> +static const struct sdhci_pltfm_data npcm_sdhci_pdata = {
> +	.quirks  = SDHCI_QUIRK_DELAY_AFTER_POWER,
> +	.quirks2 = SDHCI_QUIRK2_STOP_WITH_TC |
> +		   SDHCI_QUIRK2_NO_1_8_V,
> +};
> +
> +static int npcm_sdhci_probe(struct platform_device *pdev)
> +{
> +	struct sdhci_pltfm_host *pltfm_host;
> +	struct sdhci_host *host;
> +	u32 caps;
> +	int ret;
> +
> +	host = sdhci_pltfm_init(pdev, &npcm_sdhci_pdata, 0);
> +	if (IS_ERR(host))
> +		return PTR_ERR(host);
> +
> +	pltfm_host = sdhci_priv(host);
> +
> +	pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(pltfm_host->clk))
> +		return PTR_ERR(pltfm_host->clk);
> +
> +	ret = clk_prepare_enable(pltfm_host->clk);
> +	if (ret)
> +		return ret;
> +

The two functions above should not return but goto the call
to sdhci_pltfm_free() to avoid a memory leak on error.

> +	caps = sdhci_readl(host, SDHCI_CAPABILITIES);
> +	if (caps & SDHCI_CAN_DO_8BIT)
> +		host->mmc->caps |= MMC_CAP_8_BIT_DATA;
> +
> +	ret = mmc_of_parse(host->mmc);
> +	if (ret)
> +		goto err_sdhci_add;
> +
> +	ret = sdhci_add_host(host);
> +	if (ret)
> +		goto err_sdhci_add;
> +
> +	return 0;
> +
> +err_sdhci_add:
> +	clk_disable_unprepare(pltfm_host->clk);
> +	sdhci_pltfm_free(pdev);
> +	return ret;
> +}
> +
> +static const struct of_device_id npcm_sdhci_of_match[] = {
> +	{ .compatible = "nuvoton,npcm750-sdhci" },
> +	{ .compatible = "nuvoton,npcm845-sdhci" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, npcm_sdhci_of_match);
> +
> +static struct platform_driver npcm_sdhci_driver = {
> +	.driver = {
> +		.name	= "npcm-sdhci",
> +		.of_match_table = npcm_sdhci_of_match,
> +		.pm	= &sdhci_pltfm_pmops,
> +	},
> +	.probe		= npcm_sdhci_probe,
> +	.remove		= sdhci_pltfm_unregister,
> +};
> +module_platform_driver(npcm_sdhci_driver);
> +
> +MODULE_DESCRIPTION("NPCM Secure Digital Host Controller Interface driver");
> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.33.0
> 
