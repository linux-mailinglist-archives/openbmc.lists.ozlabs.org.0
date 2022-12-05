Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7B642957
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 14:27:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQkqK2PWVz3bWl
	for <lists+openbmc@lfdr.de>; Tue,  6 Dec 2022 00:27:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qC4qOoUi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qC4qOoUi;
	dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQkph4xWFz30R1
	for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2022 00:26:34 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id h24so11310415qta.9
        for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2022 05:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fqO7gETqNiqkQHJ70u+gRoEEZZbEF0uchp8/3StvR/w=;
        b=qC4qOoUiygaHcIcrhaQHV710EKKfWWefLKnQ3oKru+iD1vRQ7OAPRvSKvSYJjLTVEx
         GB6THHRMOgPyolYORzCLGm1kOMUfPLP2w7pTn59xzaoFM3WfNFpsrUsF8K8eOxlQUyFi
         k4mqiqqWZTLNiDQbj426UMKLz7jVgRlSivyo6kyG5KbM08UiKPN863qcBfbg+Tb3paQv
         H7iX82FtdhXY/nHWCwT+cythGxdJDtkkOf888FJmUFEeZ4njbfJvhti18TaGd7g9zZh+
         Qu6uSWYi5wpwzm9prkw9yAKqBWMgpGOWbmXVbGPHMJciqA5RzTEFcApOrzFPS0ZD82nf
         J50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqO7gETqNiqkQHJ70u+gRoEEZZbEF0uchp8/3StvR/w=;
        b=ApuUEWpF1OzTE530OLTCfQSXyZej27OtYC6lEfYzbxu3LdNvOpZnUK4+VwFioO8SnI
         HeXLfcqAszYRdxJt8Uku0uYz0bb79QFT0vhQfdxZKAx9j0XZvVBn4cnhaYh6gXU784+0
         DvkKynXjJRFpCWFTiOcEM5oR5KDT6NpTH9KpYAFuD+nXm0naLl9+U3P8CiyPDwruJM+6
         4WNExbAZQLzFemvBP2hwRFfvtJfnMQY1YAh3ueEljmLyd9JIG65PdcfgOeO3lMgJM2cE
         X2ooaMGrVWeq4mbqpl9HU+sqzGY3ZRcAikvSmUwQ7biLMlU9d54Uis1aLilrHz1unkNL
         +oQg==
X-Gm-Message-State: ANoB5pn7FQ3FHhRvmq/NuktupHs+W36HYnTzYMGTsSecR7A+9gQwkloZ
	V/Hgys0rVP5d78WY6aa1CbgHJLsrUN7+WUC+87E=
X-Google-Smtp-Source: AA0mqf4dvL/+Sat88nAYdYD7lP5p89SnGizPGaaXtTpRp9ieg6LHpcABFhjTocjv4QvpR07o/YZlNOMmACR1oMaJBY4=
X-Received: by 2002:ac8:5501:0:b0:3a5:cb82:109b with SMTP id
 j1-20020ac85501000000b003a5cb82109bmr76982863qtq.61.1670246790901; Mon, 05
 Dec 2022 05:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
 <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com> <CAP6Zq1gi7-pA9wdO3=V9Uf0+pKPTHwWw66MfbYmOwodoXeRDqA@mail.gmail.com>
In-Reply-To: <CAP6Zq1gi7-pA9wdO3=V9Uf0+pKPTHwWw66MfbYmOwodoXeRDqA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Dec 2022 15:25:55 +0200
Message-ID: <CAHp75VctiJvvk-6AWfQSU9psHvPeKECaCWPuKL9YQ_-Vt3GBGA@mail.gmail.com>
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

On Mon, Dec 5, 2022 at 1:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> On Mon, 5 Dec 2022 at 12:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Dec 5, 2022 at 10:54 AM Tomer Maimon <tmaimon77@gmail.com> wrote:

...

> > > +#include <linux/clk.h>
> > > +#include <linux/err.h>
> > > +#include <linux/io.h>
> > > +#include <linux/mmc/host.h>
> > > +#include <linux/mmc/mmc.h>
> > > +#include <linux/module.h>
> >
> > I guess platform_device.h is missing here.
> Build and work without platform_device.h, do I need it for module use?

The rule of thumb is to include headers we are the direct user of. I
believe you have a data type and API that are defined in that header.

...

> > > +static int npcm_sdhci_probe(struct platform_device *pdev)
> > > +{
> > > +       struct sdhci_pltfm_host *pltfm_host;
> > > +       struct sdhci_host *host;
> > > +       u32 caps;
> > > +       int ret;
> > > +
> > > +       host = sdhci_pltfm_init(pdev, &npcm_sdhci_pdata, 0);
> > > +       if (IS_ERR(host))
> > > +               return PTR_ERR(host);
> > > +
> > > +       pltfm_host = sdhci_priv(host);
> >
> > > +       pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
> >
> > You can't mix devm with non-devm in this way.
> Can you explain what you mean You can't mix devm with non-devm in this
> way, where is the mix?
> In version 1 used devm_clk_get, is it problematic?

devm_ is problematic in your case.
TL;DR: you need to use clk_get_optional() and clk_put().

Your ->remove() callback doesn't free resources in the reversed order
which may or, by luck, may not be the case of all possible crashes,
UAFs, races, etc during removal stage. All the same for error path in
->probe().

> > > +       if (IS_ERR(pltfm_host->clk))
> > > +               return PTR_ERR(pltfm_host->clk);
> > > +
> > > +       ret = clk_prepare_enable(pltfm_host->clk);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       caps = sdhci_readl(host, SDHCI_CAPABILITIES);
> > > +       if (caps & SDHCI_CAN_DO_8BIT)
> > > +               host->mmc->caps |= MMC_CAP_8_BIT_DATA;
> > > +
> > > +       ret = mmc_of_parse(host->mmc);
> > > +       if (ret)
> > > +               goto err_sdhci_add;
> > > +
> > > +       ret = sdhci_add_host(host);
> > > +       if (ret)
> > > +               goto err_sdhci_add;
> >
> > Why can't you use sdhci_pltfm_register()?
> two things are missing in sdhci_pltfm_register
> 1. clock.

Taking into account the implementation of the corresponding
_unregister() I would add the clock handling to the _register() one.
Perhaps via a new member of the platform data that supplies the name
and index of the clock and hence all clk_get_optional() / clk_put will
be moved there.

> 2. Adding SDHCI_CAN_DO_8BIT capability according the eMMC capabilities.

All the same, why can't platform data be utilised for this?

> > > +       return 0;
> > > +
> > > +err_sdhci_add:
> > > +       clk_disable_unprepare(pltfm_host->clk);
> > > +       sdhci_pltfm_free(pdev);
> > > +       return ret;
> > > +}

-- 
With Best Regards,
Andy Shevchenko
