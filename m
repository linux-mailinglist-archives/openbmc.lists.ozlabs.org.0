Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22038645A50
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 14:02:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRy9y60xvz3bbf
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 00:02:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wb7aJUSw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wb7aJUSw;
	dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRy9L40jNz3bVq
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 00:01:57 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id s10so6796052ljg.1
        for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2022 05:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=58n9OnzkX+f+tALJ3x9hXjitd2F/uK0zQDu7nLFK8BM=;
        b=Wb7aJUSwSAqnww08AQep8NInEPaa3G9cUjc8sQqZCF2rSZLiFiCkbPvi90Q2W/JB50
         AkZ0elNUWOZAg6iyS7IFebYNSJCSfUVNBIpyGC09Wu/HfrXcsqaxszfmVUhIfIbdz+tG
         G+oCaum5ZcLDLT9G7P/Z0Agwbw7BLr4LKCvjVbpsts29SYIH+YuFthAG5XZtiKOgPS/P
         ZthMdAxkIZxycgbGnmvGTYQR3cEhqarrfoenHuJepkHLokhiBap+28SWnHwc7p6Shlxp
         nwxvkfNOpUxUFzKkXI8arTvSilK593jhVasK23lsIaSSOhsg/gGZL6ZmBnWC095w8U3Y
         noGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58n9OnzkX+f+tALJ3x9hXjitd2F/uK0zQDu7nLFK8BM=;
        b=YtQzF4BcOMMuoDaC55HWkXmnmSgven8ryOHwwENA0Fq+cLH8Xb9ywu9O+Jd3C5q6dT
         /ouYKFjBHf6VCIuyBBnINtDO+vU0mFAbPiJvWRAmRTFbD4mJ0DrqLFAydWoqv8asQSan
         l66/LuVubPRh6dnw8OQLOMVYIUuXQYrvQZd1bBFduIMzYH+A+njZ6LSLf02cUcIGF1xc
         WW3aO+Sus7wE9rDL/QWQQuT0kQM9mS5mF8vnOekwm4N5DIy9U192BQ3Rbw+hRFzlohHM
         B2qWDT5vXzau7Wvoptqi1iF6VFspLG5RQQLjeycEgIC941lSCxUr0uDkNdmBqyRWXR5b
         vCcg==
X-Gm-Message-State: ANoB5pkh6MiB3baqmT2di7pWBZBtnLtX9AIq6/JFmbOyHQq+6jyRtEEK
	8Zx08ANAC4WCiL/iubajSGrPLtsaU/PCGIFs/XA=
X-Google-Smtp-Source: AA0mqf6Ide4+sp8VWwohGr/fTMvzoa8oN76VSzU4an/ivwpfuzoPSBg3rAh6NB3hKlkh7TXGWyqSO8u/qTTMSXywbfY=
X-Received: by 2002:a05:651c:c85:b0:278:f572:c9ac with SMTP id
 bz5-20020a05651c0c8500b00278f572c9acmr30906647ljb.73.1670418109344; Wed, 07
 Dec 2022 05:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
 <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com>
 <CAP6Zq1gi7-pA9wdO3=V9Uf0+pKPTHwWw66MfbYmOwodoXeRDqA@mail.gmail.com>
 <CAHp75VctiJvvk-6AWfQSU9psHvPeKECaCWPuKL9YQ_-Vt3GBGA@mail.gmail.com>
 <c200557f-c30a-62f9-287a-af804e818cf1@intel.com> <CAHp75VczbNpHPi-TBe81Ad=P=eXJZpAmkj=m4-apGF1e0uh5kg@mail.gmail.com>
 <CAHp75VemBiGUTspEYDe3hwA9pEzjNMQGY6_kUoVMJyCuEWgChw@mail.gmail.com> <c4e2a00c-d09e-95e2-eaf2-1de6b820ac6e@intel.com>
In-Reply-To: <c4e2a00c-d09e-95e2-eaf2-1de6b820ac6e@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 7 Dec 2022 15:01:38 +0200
Message-ID: <CAP6Zq1h9XvH501e_nH9TkUCKPNOuH7dhOM8FrsUM=PYX4gt0qw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, gsomlo@gmail.com, tali.perry1@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy and Adrian,

Thanks for your clarifications

On Mon, 5 Dec 2022 at 16:33, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 5/12/22 16:17, Andy Shevchenko wrote:
> > On Mon, Dec 5, 2022 at 4:14 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >>
> >> On Mon, Dec 5, 2022 at 3:41 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
> >>> On 5/12/22 15:25, Andy Shevchenko wrote:
> >>>> On Mon, Dec 5, 2022 at 1:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >>>>> On Mon, 5 Dec 2022 at 12:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >>>>>> On Mon, Dec 5, 2022 at 10:54 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >>
> >> ...
> >>
> >>>>>>> +       pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
> >>>>>>
> >>>>>> You can't mix devm with non-devm in this way.
> >>>>> Can you explain what you mean You can't mix devm with non-devm in this
> >>>>> way, where is the mix?
> >>>>> In version 1 used devm_clk_get, is it problematic?
> >>>>
> >>>> devm_ is problematic in your case.
> >>>> TL;DR: you need to use clk_get_optional() and clk_put().
> >>>
> >>> devm_ calls exactly those, so what is the issue?
> >>
> >> The issue is the error path or removal stage where it may or may be
> >> not problematic. To be on the safe side, the best approach is to make
> >> sure that allocated resources are being deallocated in the reversed
> >> order. That said, the
> >>
> >> 1. call non-devm_func()
> >> 2. call devm_func()
> >>
> >> is wrong strictly speaking.
> >
> > To elaborate more, the
> >
> > 1. call all devm_func()
> > 2. call only non-devm_func()
> >
> > is the correct order.
>
> 1. WRT pltfm_host->clk, that is what is happening
> 2. WRT other resources that is simply not always possible because not every resource is wrapped by devm_
> e.g. mmc_alloc_host() / mmc_free_host()
I little confused about what to decide, should I use only
non-devm_func because mmc_alloc_host() / mmc_free_host() is not
warrped with devm_?
>
> >
> > Hence in this case the driver can be worked around easily (by
> > shuffling the order in ->probe() to call devm_ first), but as I said
> > looking into implementation of the _unregister() I'm pretty sure that
> > clock management should be in sdhci-pltfm, rather than in all callers
> > who won't need the full customization.
> >
> > Hope this helps to understand my point.
> >
> >>>> Your ->remove() callback doesn't free resources in the reversed order
> >>>> which may or, by luck, may not be the case of all possible crashes,
> >>>> UAFs, races, etc during removal stage. All the same for error path in
> >>>> ->probe().
> >>
> >> I also pointed out above what would be the outcome of neglecting this rule.
> >>
> >>>>>>> +       if (IS_ERR(pltfm_host->clk))
> >>>>>>> +               return PTR_ERR(pltfm_host->clk);
> >>>>>>> +
> >>>>>>> +       ret = clk_prepare_enable(pltfm_host->clk);
> >>>>>>> +       if (ret)
> >>>>>>> +               return ret;
> >>>>>>> +
> >>>>>>> +       caps = sdhci_readl(host, SDHCI_CAPABILITIES);
> >>>>>>> +       if (caps & SDHCI_CAN_DO_8BIT)
> >>>>>>> +               host->mmc->caps |= MMC_CAP_8_BIT_DATA;
> >>>>>>> +
> >>>>>>> +       ret = mmc_of_parse(host->mmc);
> >>>>>>> +       if (ret)
> >>>>>>> +               goto err_sdhci_add;
> >>>>>>> +
> >>>>>>> +       ret = sdhci_add_host(host);
> >>>>>>> +       if (ret)
> >>>>>>> +               goto err_sdhci_add;
> >>>>>>
> >>>>>> Why can't you use sdhci_pltfm_register()?
> >>>>> two things are missing in sdhci_pltfm_register
> >>>>> 1. clock.
> >>>>
> >>>> Taking into account the implementation of the corresponding
> >>>> _unregister() I would add the clock handling to the _register() one.
> >>>> Perhaps via a new member of the platform data that supplies the name
> >>>> and index of the clock and hence all clk_get_optional() / clk_put will
> >>>> be moved there.
Do you mean to add it to sdhci_pltfm_register function? if yes I
believe it will take some time to modify sdhci_pltfm_register
I prefer not to use sdhci_pltfm_register.
> >>>>
> >>>>> 2. Adding SDHCI_CAN_DO_8BIT capability according the eMMC capabilities.
> >>>>
> >>>> All the same, why can't platform data be utilised for this?
> >>>>
> >>>>>>> +       return 0;
> >>>>>>> +
> >>>>>>> +err_sdhci_add:
> >>>>>>> +       clk_disable_unprepare(pltfm_host->clk);
> >>>>>>> +       sdhci_pltfm_free(pdev);
> >>>>>>> +       return ret;
> >>>>>>> +}
> >>
> >>
> >> --
> >> With Best Regards,
> >> Andy Shevchenko
> >
> >
> >
>

Best regards,

Tomer
