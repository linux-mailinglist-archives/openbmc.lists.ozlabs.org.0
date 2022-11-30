Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8F063DC36
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 18:39:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMmfg2xpNz3bY0
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 04:39:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J6lajX9t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J6lajX9t;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMmf61Vzcz3bVD
	for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2022 04:38:52 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id s8so28082810lfc.8
        for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 09:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q0gEAiCJn5AZTB/dbyoiOBb5ffbCZ/uTpNxONaIFz18=;
        b=J6lajX9tsiXHJgLqUZmFEdmfv8FS7/kTgRDuyv3WpZ9m356pQUikwQFj6dyzjaXg+3
         eRzomTMaXqyduXqVuOsfGcCXNdASB+ZwCvQ0C8EyVAFfJJ/x4mECaX3/aFdrNdAgp/pP
         qHbqevifRuwME/A120twFedHKLujnU2x8vS1Y1ppNxC7DWageO+sABHjFPEhpAmx66s1
         QirPTa7MI/ThrAvOsLhVB077uchnByY/i+E4H9k06NwgIA99Txn43y34NzN+ArqPNyoW
         C+pCnNbUMioQixEdIYqehipknwx4KKQBdU4jr8ciHeTKy/VIPJbPqQ25ZA1Z2pskbgol
         +aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0gEAiCJn5AZTB/dbyoiOBb5ffbCZ/uTpNxONaIFz18=;
        b=P9/0DVCII6qQpxcVHZiAIGNS+TLPzcoGLIcTf4d+EdADYqlRzEUskJnu5XJOVieXCa
         rIO6oQ1wQqa0N3itxIAAdTFsWElKcrEOZi/XLyBoNl4IA+sIi4fOHbA4QYdgqOcq48HT
         lnveWO7PXqYgE6pTAp/R4UBJUlDdUcX5mYIreA2XdELwiPN50pDhDfZHFuYfO+yt+68L
         rQEytf+vW7wmk+VRUAnNekIdzE2G6abiJepgDyHSaBXkH5hNfFukUrOQhwEWMVAD3hKY
         bYNV/lNsgM2MlesFD546OeKys2fuNqb6//jBKagBsphfFHKy+FLd3PI4Bk7UkadjM5dM
         kERA==
X-Gm-Message-State: ANoB5pkH5hhMBkQQQH/K6T0n66eBJ/438p/iNNkxq55NgYSYZIHzrTjm
	XpZTjz9pS7n++5ZgikOJAx5T/oXCYfjjaM3qUP0=
X-Google-Smtp-Source: AA0mqf5XNPSQLLaBiO+sG8KHhpSX8MC9f7lmnJ8wppxw1A/GfGBYg6y6BYtlmpiC5sF7yKk+w1aUe71oRPcq0S/Ubtw=
X-Received: by 2002:a05:6512:2116:b0:4b4:b904:a310 with SMTP id
 q22-20020a056512211600b004b4b904a310mr20296491lfr.576.1669829922436; Wed, 30
 Nov 2022 09:38:42 -0800 (PST)
MIME-Version: 1.0
References: <20221130150857.67113-1-tmaimon77@gmail.com> <20221130150857.67113-3-tmaimon77@gmail.com>
 <CAHp75Vf-EKa9rdpmO54h0rgMcN4TLk8GcYfrjb-2Cy-GRVgEKA@mail.gmail.com>
In-Reply-To: <CAHp75Vf-EKa9rdpmO54h0rgMcN4TLk8GcYfrjb-2Cy-GRVgEKA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 30 Nov 2022 19:38:30 +0200
Message-ID: <CAP6Zq1iqFmOWCZJa+qg=trw0M3jgJRoqX9CJDHqJovoFt9=24Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi Andy,

Thanks for your comments.

On Wed, 30 Nov 2022 at 17:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Wed, Nov 30, 2022 at 5:09 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
>
> ...
>
> >  obj-$(CONFIG_MMC_S3C)          += s3cmci.o
> >  obj-$(CONFIG_MMC_SDRICOH_CS)   += sdricoh_cs.o
> >  obj-$(CONFIG_MMC_TMIO)         += tmio_mmc.o
>
> > +obj-$(CONFIG_MMC_SDHCI_NPCM)   += sdhci-npcm.o
>
> Keep it ordered by module name.
>
> >  obj-$(CONFIG_MMC_TMIO_CORE)    += tmio_mmc_core.o
> >  obj-$(CONFIG_MMC_SDHI)         += renesas_sdhi_core.o
> >  obj-$(CONFIG_MMC_SDHI_SYS_DMAC)                += renesas_sdhi_sys_dmac.o
>
> ...
>
> > +/*
> > + * NPCM SDHC MMC host controller driver.
> > + *
> > + */
>
> Too many lines for seems to be oneliner comment.
>
> ...
>
> > +#include <linux/of.h>
>
> I don't see how it's being used.
> But it seems the mod_devicetable.h is missing.
>
> ...
>
> > +static const struct sdhci_pltfm_data npcm_sdhci_pdata = {
> > +       .quirks  = SDHCI_QUIRK_DELAY_AFTER_POWER,
> > +       .quirks2 = SDHCI_QUIRK2_STOP_WITH_TC |
> > +                  SDHCI_QUIRK2_NO_1_8_V,
> > +};
>
> Why? Can't you use the sdhci as a library?
Can you explain what you mean by using sdhci as a library?
is it not to use the pltfm_data structure and only to set the quirks
directly through the host?
> ...
>
> > +static int npcm_sdhci_probe(struct platform_device *pdev)
> > +{
> > +       struct sdhci_pltfm_host *pltfm_host;
> > +       struct sdhci_host *host;
> > +       u32 caps;
> > +       int ret;
> > +
> > +       host = sdhci_pltfm_init(pdev, &npcm_sdhci_pdata, 0);
> > +       if (IS_ERR(host))
> > +               return PTR_ERR(host);
> > +
> > +       pltfm_host = sdhci_priv(host);
>
> > +       pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
> > +
>
> Blank line in a wrong position, should be before devm_clk_get().
>
> > +       if (!IS_ERR(pltfm_host->clk))
> > +               clk_prepare_enable(pltfm_host->clk);
>
> Why not use a specific helper that gets the clock enabled?
which specific helper? can you give me more specific details?
>
> > +       caps = sdhci_readl(host, SDHCI_CAPABILITIES);
> > +       if (caps & SDHCI_CAN_DO_8BIT)
> > +               host->mmc->caps |= MMC_CAP_8_BIT_DATA;
> > +
> > +       ret = mmc_of_parse(host->mmc);
> > +       if (ret)
> > +               goto err_sdhci_add;
> > +
> > +       ret = sdhci_add_host(host);
> > +       if (ret)
> > +               goto err_sdhci_add;
> > +
> > +       return 0;
> > +
> > +err_sdhci_add:
> > +       clk_disable_unprepare(pltfm_host->clk);
> > +       sdhci_pltfm_free(pdev);
> > +       return ret;
> > +}
>
> ...
>
> > +
>
> Redundant blank line.
>
> > +module_platform_driver(npcm_sdhci_driver);
>
> --
> With Best Regards,
> Andy Shevchenko

Best regards,

Tomer
