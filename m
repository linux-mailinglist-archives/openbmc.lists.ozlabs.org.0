Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A705F642764
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 12:21:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQh1s3bVGz3bZS
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 22:21:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NIuTszuQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NIuTszuQ;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQh1D3fzmz3bVZ
	for <openbmc@lists.ozlabs.org>; Mon,  5 Dec 2022 22:20:30 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id p8so17987140lfu.11
        for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2022 03:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gQZdWCk9TZHtIPbVJXmvMK2JUQWMNX+6lfb/3HP5Mec=;
        b=NIuTszuQPXA0nhI61iLhILZmwzinSYocmIz2ZTkRZvS7NNBpFdB6UHkI70CT+WLHqR
         V2ZgB7frGE9kT/UisM5KAQheA0htbZo4sRf8j8QymOHNBU8qE2qYqyVgR/fuUgoMUHNn
         qcv5JXz4WtgVQc8+5Ew27rx0SG1sceX14AxTk9rppkomD78CI+wAsE80YD/DmOsT3+Ar
         zGNF142b+8Nb/xZvolCO6kWuScBmLwmtcVXcF33+prvtXOUlX1m0u9RFJIkdT4BXx0iB
         c96PgwgR8aEH5v4pXZDjduHt9nFg8Nve4+pjxA8Vp1EwnbQj5CWyaSzJGjdHGb27v/K1
         MHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQZdWCk9TZHtIPbVJXmvMK2JUQWMNX+6lfb/3HP5Mec=;
        b=QSEuFllJaolN+OkO12uFkoiyeF5iI4FHjblpVN6poi9vVqOcGTPX2VSXa+Aakkv91P
         PYILznLWo81yKo2Dar4uzt51K4veC7/Z7jxJBr/zZXq8AmHJw+SXwjs9viDzBuThYScN
         C5eHXc49lWHINPqb6MTh5LKDLc9Wm5McjyCCCTKfLQT6dIyOAtZ6Nh7s4VvcSL2qFg+b
         iA9bPOtqolXaACWN3COwZLmYbwaric0HaRl14K/91mAEgZdZBdOOYvRUqLQqNG7TANzE
         wLJS5bCMWNCW+iX8xzZJsUVZuhlWj1I8XuI4Y5BTAMzuqVwNJV/1tTL4oqlcuyU6fsEl
         6N6w==
X-Gm-Message-State: ANoB5pkYPAfZ0r+vZfrVjk7iN4hjD6mANySmkH4SNdfOnT/e833MF9DG
	mbvOnEirLo/+IdQv3q5ke27ArkwXOdSQESRomDQ=
X-Google-Smtp-Source: AA0mqf4xO4hYS4MNgipiw6LS5E03S+Whk3RNQT/CgUeZISIUHhNzH16pu5m2zRyEXR44992o+bBRV6L2seZoQ/fHU7U=
X-Received: by 2002:ac2:4e14:0:b0:4af:f5a0:8786 with SMTP id
 e20-20020ac24e14000000b004aff5a08786mr25478865lfr.265.1670239221420; Mon, 05
 Dec 2022 03:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
 <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com>
In-Reply-To: <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 5 Dec 2022 13:20:10 +0200
Message-ID: <CAP6Zq1gi7-pA9wdO3=V9Uf0+pKPTHwWw66MfbYmOwodoXeRDqA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
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

On Mon, 5 Dec 2022 at 12:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Mon, Dec 5, 2022 at 10:54 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Add Nuvoton NPCM BMC sdhci-pltfm controller driver.
>
> Thank you for an update, my comments below.
>
> ...
>
> > +config MMC_SDHCI_NPCM
>
> >  config MMC_SDHCI_IPROC
>
> Perhaps after IPROC?
Will be done in the next version.
>
> ...
>
> > @@ -97,6 +97,7 @@ obj-$(CONFIG_MMC_SDHCI_MICROCHIP_PIC32)       += sdhci-pic32.o
> >  obj-$(CONFIG_MMC_SDHCI_BRCMSTB)                += sdhci-brcmstb.o
> >  obj-$(CONFIG_MMC_SDHCI_OMAP)           += sdhci-omap.o
> >  obj-$(CONFIG_MMC_SDHCI_SPRD)           += sdhci-sprd.o
> > +obj-$(CONFIG_MMC_SDHCI_NPCM)           += sdhci-npcm.o
>
> Perhaps after IPROC? (There is a group of platform drivers slightly
> below than here)
Will be done in the next version.
>
> >  obj-$(CONFIG_MMC_CQHCI)                        += cqhci.o
>
> ...
>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/mmc/host.h>
> > +#include <linux/mmc/mmc.h>
> > +#include <linux/module.h>
>
> I guess platform_device.h is missing here.
Build and work without platform_device.h, do I need it for module use?
>
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
> > +       pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
>
> You can't mix devm with non-devm in this way.
Can you explain what you mean You can't mix devm with non-devm in this
way, where is the mix?
In version 1 used devm_clk_get, is it problematic?
>
> > +       if (IS_ERR(pltfm_host->clk))
> > +               return PTR_ERR(pltfm_host->clk);
> > +
> > +       ret = clk_prepare_enable(pltfm_host->clk);
> > +       if (ret)
> > +               return ret;
> > +
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
>
> Why can't you use sdhci_pltfm_register()?
two things are missing in sdhci_pltfm_register
1. clock.
2. Adding SDHCI_CAN_DO_8BIT capability according the eMMC capabilities.
>
> > +       return 0;
> > +
> > +err_sdhci_add:
> > +       clk_disable_unprepare(pltfm_host->clk);
> > +       sdhci_pltfm_free(pdev);
> > +       return ret;
> > +}
>
> Missing ->remove() due to above.
Will check
>
> Have you tried to compile as a module and then remove and insert it
> several times?
will try
>
> --
> With Best Regards,
> Andy Shevchenko

Best regards,

Tomer
