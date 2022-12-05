Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C66642A31
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 15:18:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQlz34vbWz3bXt
	for <lists+openbmc@lfdr.de>; Tue,  6 Dec 2022 01:18:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZHzIejlV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZHzIejlV;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQlyW0Wykz3bT0
	for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2022 01:18:26 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id x28so10346037qtv.13
        for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2022 06:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fDqf1wSMUKDLZsKxEzPDkS9hYvTku/z6Qoj5KCP6Qg=;
        b=ZHzIejlViGeY54HhY5Bx8HBEbu+yYY0qBUmZVOO0dCKIIZh/QofswS5ldWI4HAUyTQ
         zbxLu1RseU/06klPi/Ai7D5Zfs5gM7nYyEhx4clHyyfmDDVjMud70TeXMARy8M56OTQw
         aeG9PmCZ/y4EYMh545azDVC2h/eTg4cyOKdWzFdpIZnlzV6IwohIZawrn6aZAcrSJaWu
         uY41p7nlJO9FIkctBhevUliWExxUHoAvtlUUkJ4D5g19Sx3EQX3qrvQsI5ohDKMhpFJr
         beyTOrdie4le47fhAL8n27OosaXKaTfP6MKjtHbiDWdBFj4AejEsg3yY9jCMguq8FUYI
         FEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fDqf1wSMUKDLZsKxEzPDkS9hYvTku/z6Qoj5KCP6Qg=;
        b=0X+VQhCaduHwyH2uXxHijJKf8ZAVyOS+dvu4t12vbxBult+jTRNCYWluUXofO9gdmS
         WQjfz/Vy8KEHrsprOfuxEhotwjf9jcAd3cYhIa81jvs4XRQ6xflg00fUsEFzGjxg2+U6
         fXEH7j2fhkpuRr2IevSt2lcO9NWZGFEzTrUaAJVqUCfT28QGkt9clTnyFk5feFfFNfMV
         D7HL+x/1HV+cI1PY8hApSuFp60mQ9LIfYWb5Nw7mG/KI6W4klXh945/CKEdiBbM6JkDB
         Jp3r1eX537fAATOMK6MtrM64Y6fnCV9UFy0NgdxQd4Eyf9erkRrynY38bAkjvhcd2hPQ
         jUIQ==
X-Gm-Message-State: ANoB5plUwmfafztC/OB0yzkHZCgGJmGwGErd/wo0luSzW3KM8gdJDqFD
	hW12fahWpNru7SJP5FP3sL5NVmhgnWWlJrCkZSw=
X-Google-Smtp-Source: AA0mqf59ZojC+8guP4DOWysVR9Oon2vtcBP3NEkk9JfdPWQSphe/niF2Ax2JjO/G+vnghJZG91azo+9rNdbLa59usKc=
X-Received: by 2002:ac8:5501:0:b0:3a5:cb82:109b with SMTP id
 j1-20020ac85501000000b003a5cb82109bmr77193629qtq.61.1670249903499; Mon, 05
 Dec 2022 06:18:23 -0800 (PST)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
 <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com>
 <CAP6Zq1gi7-pA9wdO3=V9Uf0+pKPTHwWw66MfbYmOwodoXeRDqA@mail.gmail.com>
 <CAHp75VctiJvvk-6AWfQSU9psHvPeKECaCWPuKL9YQ_-Vt3GBGA@mail.gmail.com>
 <c200557f-c30a-62f9-287a-af804e818cf1@intel.com> <CAHp75VczbNpHPi-TBe81Ad=P=eXJZpAmkj=m4-apGF1e0uh5kg@mail.gmail.com>
In-Reply-To: <CAHp75VczbNpHPi-TBe81Ad=P=eXJZpAmkj=m4-apGF1e0uh5kg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Dec 2022 16:17:47 +0200
Message-ID: <CAHp75VemBiGUTspEYDe3hwA9pEzjNMQGY6_kUoVMJyCuEWgChw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, Tomer Maimon <tmaimon77@gmail.com>, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 5, 2022 at 4:14 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Dec 5, 2022 at 3:41 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
> > On 5/12/22 15:25, Andy Shevchenko wrote:
> > > On Mon, Dec 5, 2022 at 1:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >> On Mon, 5 Dec 2022 at 12:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >>> On Mon, Dec 5, 2022 at 10:54 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> ...
>
> > >>>> +       pltfm_host->clk = devm_clk_get_optional(&pdev->dev, NULL);
> > >>>
> > >>> You can't mix devm with non-devm in this way.
> > >> Can you explain what you mean You can't mix devm with non-devm in this
> > >> way, where is the mix?
> > >> In version 1 used devm_clk_get, is it problematic?
> > >
> > > devm_ is problematic in your case.
> > > TL;DR: you need to use clk_get_optional() and clk_put().
> >
> > devm_ calls exactly those, so what is the issue?
>
> The issue is the error path or removal stage where it may or may be
> not problematic. To be on the safe side, the best approach is to make
> sure that allocated resources are being deallocated in the reversed
> order. That said, the
>
> 1. call non-devm_func()
> 2. call devm_func()
>
> is wrong strictly speaking.

To elaborate more, the

1. call all devm_func()
2. call only non-devm_func()

is the correct order.

Hence in this case the driver can be worked around easily (by
shuffling the order in ->probe() to call devm_ first), but as I said
looking into implementation of the _unregister() I'm pretty sure that
clock management should be in sdhci-pltfm, rather than in all callers
who won't need the full customization.

Hope this helps to understand my point.

> > > Your ->remove() callback doesn't free resources in the reversed order
> > > which may or, by luck, may not be the case of all possible crashes,
> > > UAFs, races, etc during removal stage. All the same for error path in
> > > ->probe().
>
> I also pointed out above what would be the outcome of neglecting this rule.
>
> > >>>> +       if (IS_ERR(pltfm_host->clk))
> > >>>> +               return PTR_ERR(pltfm_host->clk);
> > >>>> +
> > >>>> +       ret = clk_prepare_enable(pltfm_host->clk);
> > >>>> +       if (ret)
> > >>>> +               return ret;
> > >>>> +
> > >>>> +       caps = sdhci_readl(host, SDHCI_CAPABILITIES);
> > >>>> +       if (caps & SDHCI_CAN_DO_8BIT)
> > >>>> +               host->mmc->caps |= MMC_CAP_8_BIT_DATA;
> > >>>> +
> > >>>> +       ret = mmc_of_parse(host->mmc);
> > >>>> +       if (ret)
> > >>>> +               goto err_sdhci_add;
> > >>>> +
> > >>>> +       ret = sdhci_add_host(host);
> > >>>> +       if (ret)
> > >>>> +               goto err_sdhci_add;
> > >>>
> > >>> Why can't you use sdhci_pltfm_register()?
> > >> two things are missing in sdhci_pltfm_register
> > >> 1. clock.
> > >
> > > Taking into account the implementation of the corresponding
> > > _unregister() I would add the clock handling to the _register() one.
> > > Perhaps via a new member of the platform data that supplies the name
> > > and index of the clock and hence all clk_get_optional() / clk_put will
> > > be moved there.
> > >
> > >> 2. Adding SDHCI_CAN_DO_8BIT capability according the eMMC capabilities.
> > >
> > > All the same, why can't platform data be utilised for this?
> > >
> > >>>> +       return 0;
> > >>>> +
> > >>>> +err_sdhci_add:
> > >>>> +       clk_disable_unprepare(pltfm_host->clk);
> > >>>> +       sdhci_pltfm_free(pdev);
> > >>>> +       return ret;
> > >>>> +}
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
