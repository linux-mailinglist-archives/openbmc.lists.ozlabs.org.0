Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F52F64706C
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 14:05:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZCP1rRcz3fQ5
	for <lists+openbmc@lfdr.de>; Fri,  9 Dec 2022 00:05:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OwykP3QW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OwykP3QW;
	dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSZ3W2LKPz3g6Y
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 23:59:02 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id h10so1452188ljk.11
        for <openbmc@lists.ozlabs.org>; Thu, 08 Dec 2022 04:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ7np5caI4unEEBvRTaWL2Uygj5hC6MVtGCTSMAC2xE=;
        b=OwykP3QWxZHL7mgwuoBNcNvCPcBbQrgf6edkkSg8iAP6D7MG34XPYD2JI7b2wLIeDd
         gChUZuSv5RSGLBno4s5Vn87JZhr2tKNIXHCcFcoOztrWSds3oUjdDFBSg8ARvbVe1G2O
         GYIrFeWCRGg7bOFtVISK+RMieqTxA6mccGaGdQvg39rKtPKrGruYom3NMZxAOeFakkKd
         2pNWD7naBB/4lOUOI7egs15/1+nP8Es/eytoWEkNsbejPT/JO/FPRaoupnn3Z8BOvNM2
         bH1scsjlx9323enLvf3PXOCpNzBPVSoj/CQfQ8FEA0++3tSkEcu/GVJSUh9sDETEKyfG
         yMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZ7np5caI4unEEBvRTaWL2Uygj5hC6MVtGCTSMAC2xE=;
        b=4XwBkWohoOwMtwbmyIzJuJjy17J4jKT5+V1qoTWBppdTSTb40YwEJvzJxP2gSXvQO6
         lQ6lkJEeAyFhQw7aYCAxjrBTvytpBEDBrRzPYiuQxpwLgDNl7VHOagPN/lJsaESvltef
         KUL1uf22wu513WT8UuCO9dFnAIqfcCEiqasRCbnTtw6WnCmPuw+IMDWFqyASxVtY91TQ
         1kgYd32VsuhgUdwsnbNqrSzt/3lA83eBYCzfOXlw8HPulWA2p6H0dfmueUPkdZpD1GtP
         y48y2+wLFin1qcpiyp4bqGUAhgEHZY70Sl4mstqjkvg7KtrEvfQJgAdy/2aOnXdNpEae
         QV+w==
X-Gm-Message-State: ANoB5ply2cYcehDvJ9wBnszgrJ4vGeZul0nQbuRBsbCMER5bV3/f5hJe
	sD3g9F8Bllf+dvr+G++vCbTgpgpWhDDqMe3d2Ag=
X-Google-Smtp-Source: AA0mqf6zq4d9b0tsEHeCgtmeDquOR37yLN23DVA+KoCW9EuxGMWOnbzCZ2s6ZkDT4oAhoxmH0yQuBynokogi3UKHQrU=
X-Received: by 2002:a2e:7c17:0:b0:27a:17d5:2964 with SMTP id
 x23-20020a2e7c17000000b0027a17d52964mr2520757ljc.488.1670504335717; Thu, 08
 Dec 2022 04:58:55 -0800 (PST)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
 <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com>
 <CAP6Zq1gi7-pA9wdO3=V9Uf0+pKPTHwWw66MfbYmOwodoXeRDqA@mail.gmail.com>
 <CAHp75VctiJvvk-6AWfQSU9psHvPeKECaCWPuKL9YQ_-Vt3GBGA@mail.gmail.com>
 <c200557f-c30a-62f9-287a-af804e818cf1@intel.com> <CAHp75VczbNpHPi-TBe81Ad=P=eXJZpAmkj=m4-apGF1e0uh5kg@mail.gmail.com>
 <CAHp75VemBiGUTspEYDe3hwA9pEzjNMQGY6_kUoVMJyCuEWgChw@mail.gmail.com>
 <c4e2a00c-d09e-95e2-eaf2-1de6b820ac6e@intel.com> <CAP6Zq1h9XvH501e_nH9TkUCKPNOuH7dhOM8FrsUM=PYX4gt0qw@mail.gmail.com>
 <CAHp75Vd5DzkCW0Gpouv+0Or=Yhjp_KdFGP-jXkpHD=UZrG2ajA@mail.gmail.com>
 <cae6475a-a1e9-ae57-6e64-59931f467050@intel.com> <CAHp75VfVRa5m3WeEvMvGCRK7YRBD5BCxOL2DHDzyuQ1cD4J9UA@mail.gmail.com>
In-Reply-To: <CAHp75VfVRa5m3WeEvMvGCRK7YRBD5BCxOL2DHDzyuQ1cD4J9UA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 8 Dec 2022 14:58:44 +0200
Message-ID: <CAP6Zq1hj1YikzsY8bKMayYErQomMEGC6V3_6DUOo67=L4yfQrQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks a lot, Adrian and andy!

Appreciate it

On Wed, 7 Dec 2022 at 18:49, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Wed, Dec 7, 2022 at 3:49 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
> > On 7/12/22 15:25, Andy Shevchenko wrote:
> > > On Wed, Dec 7, 2022 at 3:01 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> > >> On Mon, 5 Dec 2022 at 16:33, Adrian Hunter <adrian.hunter@intel.com> wrote:
> > >>> On 5/12/22 16:17, Andy Shevchenko wrote:
> > >>>> On Mon, Dec 5, 2022 at 4:14 PM Andy Shevchenko
> > >>>> <andy.shevchenko@gmail.com> wrote:
> > >>>>> On Mon, Dec 5, 2022 at 3:41 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
> > >>>>>> On 5/12/22 15:25, Andy Shevchenko wrote:
> > >>>>>>> On Mon, Dec 5, 2022 at 1:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> ...
>
> > >>>>>>> devm_ is problematic in your case.
> > >>>>>>> TL;DR: you need to use clk_get_optional() and clk_put().
> > >>>>>>
> > >>>>>> devm_ calls exactly those, so what is the issue?
> > >>>>>
> > >>>>> The issue is the error path or removal stage where it may or may be
> > >>>>> not problematic. To be on the safe side, the best approach is to make
> > >>>>> sure that allocated resources are being deallocated in the reversed
> > >>>>> order. That said, the
> > >>>>>
> > >>>>> 1. call non-devm_func()
> > >>>>> 2. call devm_func()
> > >>>>>
> > >>>>> is wrong strictly speaking.
> > >>>>
> > >>>> To elaborate more, the
> > >>>>
> > >>>> 1. call all devm_func()
> > >>>> 2. call only non-devm_func()
> > >>>>
> > >>>> is the correct order.
> > >>>
> > >>> 1. WRT pltfm_host->clk, that is what is happening
> > >>> 2. WRT other resources that is simply not always possible because not every resource is wrapped by devm_
> > >>> e.g. mmc_alloc_host() / mmc_free_host()
> > >> I little confused about what to decide, should I use only
> > >> non-devm_func because mmc_alloc_host() / mmc_free_host() is not
> > >> warrped with devm_?
> > >
> > > It is up to you how to proceed. I pointed out the problem with your
> > > code which may or may not be fatal.
> > >
> > > If you want to solve it, there are several approaches:
> > > 1) get rid of devm_ completely;
> > > 2) properly shuffle the ordering in ->probe(), so all devm_ calls are
> > > followed by non-devm_;
> > > 3) wrap non-devm_ cals to become managed (see
> > > devm_add_action_or_reset() approach);
> > > 4) fix SDHCI / MMC layer by providing necessary devm_ calls and/or fix
> > > sdhci_pltfm_register() to handle the clock.
> >
> > I can take care of sdhci_pltfm when I next have some time.
> > Otherwise it looks OK to me, so I am acking it.
>
> Thank you!
>
> > > Personally, the list order is from the least, what I prefer, to the
> > > most (i.o.w. I would like to see rather 4) than 1) to be implemented).
> > >
> > >>>> Hence in this case the driver can be worked around easily (by
> > >>>> shuffling the order in ->probe() to call devm_ first), but as I said
> > >>>> looking into implementation of the _unregister() I'm pretty sure that
> > >>>> clock management should be in sdhci-pltfm, rather than in all callers
> > >>>> who won't need the full customization.
> > >>>>
> > >>>> Hope this helps to understand my point.
> > >>>>
> > >>>>>>> Your ->remove() callback doesn't free resources in the reversed order
> > >>>>>>> which may or, by luck, may not be the case of all possible crashes,
> > >>>>>>> UAFs, races, etc during removal stage. All the same for error path in
> > >>>>>>> ->probe().
> > >>>>>
> > >>>>> I also pointed out above what would be the outcome of neglecting this rule.
>
> ...
>
> > >>>>>>>>> Why can't you use sdhci_pltfm_register()?
> > >>>>>>>> two things are missing in sdhci_pltfm_register
> > >>>>>>>> 1. clock.
> > >>>>>>>
> > >>>>>>> Taking into account the implementation of the corresponding
> > >>>>>>> _unregister() I would add the clock handling to the _register() one.
> > >>>>>>> Perhaps via a new member of the platform data that supplies the name
> > >>>>>>> and index of the clock and hence all clk_get_optional() / clk_put will
> > >>>>>>> be moved there.
> > >> Do you mean to add it to sdhci_pltfm_register function? if yes I
> > >> believe it will take some time to modify sdhci_pltfm_register
> > >> I prefer not to use sdhci_pltfm_register.
> > >
> > > In the Linux kernel we are trying hard to avoid code duplication. Why
> > > do you need it to be open coded? (Yes, I heard you, but somebody
> > > should fix the issues with that funcion at some point, right?)
> > >
> > >>>>>>>> 2. Adding SDHCI_CAN_DO_8BIT capability according the eMMC capabilities.
> > >>>>>>>
> > >>>>>>> All the same, why can't platform data be utilised for this?
>
> --
> With Best Regards,
> Andy Shevchenko
