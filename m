Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 819CF63D9EA
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 16:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMkFt2DXHz3bXQ
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 02:51:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BWHb9s24;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BWHb9s24;
	dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMkFK2w3Kz3bTB
	for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2022 02:50:44 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id p18so12558486qkg.2
        for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 07:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=82QCZk50OHhyMDgvhzbOVvcIx76jYb6gR6aOF5F4KSk=;
        b=BWHb9s24KDdkAgujqN5R+CKe7Ztu9OKpL44TDgCg9B6FzSwsAFxaEJjPaoVuGJoqgP
         4FAXXx0/etvMoP3Di1D9Nl1ZExrLiZIWpCmcclJ1ZLk2YU+Gd9XlqEHZ+/5h2967AkGc
         H7h97MA3NEoxuvbb7RlNC9Tgu009b78+RNX6NxOwzQKFSTLJ5JHQnMRtTxkewTgoBss6
         +bB2RyZK4dUUPefJlDy3SHxfXZZHEUNPxNyc66dvpA3Jr79VpMjJVcU8TJ7Z5sCMHrpG
         2t1Yis/Cr+p+9nX+VMAft8PYJ0vYgGPkj1eDg1EuEnks53EoJ2QUSy+Z/TlqV2qZ6gfK
         owdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82QCZk50OHhyMDgvhzbOVvcIx76jYb6gR6aOF5F4KSk=;
        b=LTVf5rxK246Bw2h+AB9ErvotdABcE4EHfNn5FPaBn2jZh3a0sKAs5x1kBXa2zL3qYl
         FhbVxxcqNBdlvq/qnYJGLzYkJI/YpNV1y9eLeR1/DrfUKKnbt3n1sKXRACoPRW37KXQz
         DD+y1O/a7sK0eU2ty149OvFy2Rxx11YqY85reLH2GkfovrGAepKDITusDZXZQTCULelU
         duAFoNo6KOniedGvWsvBAeDw/g0ZWJUJdykMMIVp3bIeERxt7iZjPgC9kjRQT4GRhxY5
         HG4IpuIvYtuaT1Oz11T7/ge9sHq52rz3Aoh21+VIVCDGocuiY+8zB0bSr7IarLrIt1G3
         QnCQ==
X-Gm-Message-State: ANoB5pngj2mtF7djP1iNf4B57S0/lYTJJyxiE2sBsW7gGh7r8Pkw1R0l
	wuO2XoYP8TlBZsC2dkTrR5fWa7jY3d+dTQUwHqc=
X-Google-Smtp-Source: AA0mqf5kOZsnOEHPtDJ2/5QHse4qLyrS2H4vMNPxNFPJWJ4R6NiKajd7ShO0X6Lx+IavRjuWzZt1apcO/9r9gd7j/Wg=
X-Received: by 2002:a37:b404:0:b0:6fa:4a82:1152 with SMTP id
 d4-20020a37b404000000b006fa4a821152mr56822990qkf.504.1669823440294; Wed, 30
 Nov 2022 07:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20221130150857.67113-1-tmaimon77@gmail.com> <20221130150857.67113-3-tmaimon77@gmail.com>
In-Reply-To: <20221130150857.67113-3-tmaimon77@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Nov 2022 17:50:04 +0200
Message-ID: <CAHp75Vf-EKa9rdpmO54h0rgMcN4TLk8GcYfrjb-2Cy-GRVgEKA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
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

On Wed, Nov 30, 2022 at 5:09 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton NPCM BMC sdhci-pltfm controller driver.

...

>  obj-$(CONFIG_MMC_S3C)          += s3cmci.o
>  obj-$(CONFIG_MMC_SDRICOH_CS)   += sdricoh_cs.o
>  obj-$(CONFIG_MMC_TMIO)         += tmio_mmc.o

> +obj-$(CONFIG_MMC_SDHCI_NPCM)   += sdhci-npcm.o

Keep it ordered by module name.

>  obj-$(CONFIG_MMC_TMIO_CORE)    += tmio_mmc_core.o
>  obj-$(CONFIG_MMC_SDHI)         += renesas_sdhi_core.o
>  obj-$(CONFIG_MMC_SDHI_SYS_DMAC)                += renesas_sdhi_sys_dmac.o

...

> +/*
> + * NPCM SDHC MMC host controller driver.
> + *
> + */

Too many lines for seems to be oneliner comment.

...

> +#include <linux/of.h>

I don't see how it's being used.
But it seems the mod_devicetable.h is missing.

...

> +static const struct sdhci_pltfm_data npcm_sdhci_pdata = {
> +       .quirks  = SDHCI_QUIRK_DELAY_AFTER_POWER,
> +       .quirks2 = SDHCI_QUIRK2_STOP_WITH_TC |
> +                  SDHCI_QUIRK2_NO_1_8_V,
> +};

Why? Can't you use the sdhci as a library?

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

> +       pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
> +

Blank line in a wrong position, should be before devm_clk_get().

> +       if (!IS_ERR(pltfm_host->clk))
> +               clk_prepare_enable(pltfm_host->clk);

Why not use a specific helper that gets the clock enabled?

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
> +
> +       return 0;
> +
> +err_sdhci_add:
> +       clk_disable_unprepare(pltfm_host->clk);
> +       sdhci_pltfm_free(pdev);
> +       return ret;
> +}

...

> +

Redundant blank line.

> +module_platform_driver(npcm_sdhci_driver);

-- 
With Best Regards,
Andy Shevchenko
