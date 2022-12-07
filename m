Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398BC645ADF
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 14:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRyjr0BrXz3bgx
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 00:26:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bIHdWFbw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bIHdWFbw;
	dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRyjH1RZMz2xZp
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 00:26:09 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id k3so3542433qki.13
        for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2022 05:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gasjj2Warc1QIbknNKNkywz6J4OpsWmMf8ktNJGJzxM=;
        b=bIHdWFbwnlgZ9X7ycTDJihFthCsDpZiozQ8aRPo5JuLh15PEb9zZRUQK8qp8nDk0Vz
         JfuW+6fXd6v1zosJUbmBo1DSHPZzrgeQ4NH/RuGTFXM+l6tzYjFEJMqAyK/DnvtK+WRG
         hYaFKDNCwaycPkz7L9zlXE/Dh2jw9yLebTR8VYUV0c2DQ5oY9Q/X4PuouvFypRwhA5Wx
         USwVkgVJOjDKx/mSlCC/Kr/dZi+q8x8bV3j/UfJaDxQ/ivdISebJdeQQlFG1qs5GNxHU
         M33kyTUKZI9LbjBWr9Icf107BKr2qSF8tmIgdHAQyMvy3YmTtB8gmVUXeCoUjH5wwazP
         ivxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gasjj2Warc1QIbknNKNkywz6J4OpsWmMf8ktNJGJzxM=;
        b=yBvnMFiD916YJfgS0Aa1jM/z31QpzJgMM2txTa62+TjPgZI6G8r7sixwRJy5qmENQZ
         m+T7QGnEktkwcEuPUIIH2DpWdvcMwFnYje0jruBP0tm+fsdbvBmgl/habaA7z2UJxpd2
         iYQYmpKkJ3RNr+PslJJH0Y6YbNcNoSjHLBFn3PgzRRnuXmxKfIycpu8fov5dQ44/vD0+
         o5inx48H6grH+7c64be3jWvIpTsWGQUbCoZ8d5VxDI161pOPpjNW717HvJhFlFDJ2s3J
         l3BIZeJUCq+wjWNv5ohblZW2MdpPOcf8ad/TFSiisxVCtnEN6KCoBDPKnAdMSYO81NMf
         d/2w==
X-Gm-Message-State: ANoB5pm0AdTPEPpBA4bQNbvg74IpiA2Yov6Aerm3jnCcU9kqTcEwt5ke
	TQemi4cmiAcXHx/6zYHSyvEQ/sqxx/8efBfnlHQ=
X-Google-Smtp-Source: AA0mqf5RnWnS+hISdVDsA/In+NITv+EGTmDYWDSf+CwqqDeU+RkT3eKO4lbUN9HJ6WbQczEee6OKmp48cqrdxu9QXDs=
X-Received: by 2002:a05:620a:1aa3:b0:6fa:b56f:7ede with SMTP id
 bl35-20020a05620a1aa300b006fab56f7edemr80678604qkb.383.1670419563989; Wed, 07
 Dec 2022 05:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20221205085351.27566-1-tmaimon77@gmail.com> <20221205085351.27566-3-tmaimon77@gmail.com>
 <CAHp75VeAzgCUiH5Z1pVJ-4X29aCK44q907DRQXX75zS4oEhHHg@mail.gmail.com>
 <CAP6Zq1gi7-pA9wdO3=V9Uf0+pKPTHwWw66MfbYmOwodoXeRDqA@mail.gmail.com>
 <CAHp75VctiJvvk-6AWfQSU9psHvPeKECaCWPuKL9YQ_-Vt3GBGA@mail.gmail.com>
 <c200557f-c30a-62f9-287a-af804e818cf1@intel.com> <CAHp75VczbNpHPi-TBe81Ad=P=eXJZpAmkj=m4-apGF1e0uh5kg@mail.gmail.com>
 <CAHp75VemBiGUTspEYDe3hwA9pEzjNMQGY6_kUoVMJyCuEWgChw@mail.gmail.com>
 <c4e2a00c-d09e-95e2-eaf2-1de6b820ac6e@intel.com> <CAP6Zq1h9XvH501e_nH9TkUCKPNOuH7dhOM8FrsUM=PYX4gt0qw@mail.gmail.com>
In-Reply-To: <CAP6Zq1h9XvH501e_nH9TkUCKPNOuH7dhOM8FrsUM=PYX4gt0qw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 Dec 2022 15:25:27 +0200
Message-ID: <CAHp75Vd5DzkCW0Gpouv+0Or=Yhjp_KdFGP-jXkpHD=UZrG2ajA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 7, 2022 at 3:01 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> On Mon, 5 Dec 2022 at 16:33, Adrian Hunter <adrian.hunter@intel.com> wrote:
> > On 5/12/22 16:17, Andy Shevchenko wrote:
> > > On Mon, Dec 5, 2022 at 4:14 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > >> On Mon, Dec 5, 2022 at 3:41 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
> > >>> On 5/12/22 15:25, Andy Shevchenko wrote:
> > >>>> On Mon, Dec 5, 2022 at 1:20 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

...

> > >>>> devm_ is problematic in your case.
> > >>>> TL;DR: you need to use clk_get_optional() and clk_put().
> > >>>
> > >>> devm_ calls exactly those, so what is the issue?
> > >>
> > >> The issue is the error path or removal stage where it may or may be
> > >> not problematic. To be on the safe side, the best approach is to make
> > >> sure that allocated resources are being deallocated in the reversed
> > >> order. That said, the
> > >>
> > >> 1. call non-devm_func()
> > >> 2. call devm_func()
> > >>
> > >> is wrong strictly speaking.
> > >
> > > To elaborate more, the
> > >
> > > 1. call all devm_func()
> > > 2. call only non-devm_func()
> > >
> > > is the correct order.
> >
> > 1. WRT pltfm_host->clk, that is what is happening
> > 2. WRT other resources that is simply not always possible because not every resource is wrapped by devm_
> > e.g. mmc_alloc_host() / mmc_free_host()
> I little confused about what to decide, should I use only
> non-devm_func because mmc_alloc_host() / mmc_free_host() is not
> warrped with devm_?

It is up to you how to proceed. I pointed out the problem with your
code which may or may not be fatal.

If you want to solve it, there are several approaches:
1) get rid of devm_ completely;
2) properly shuffle the ordering in ->probe(), so all devm_ calls are
followed by non-devm_;
3) wrap non-devm_ cals to become managed (see
devm_add_action_or_reset() approach);
4) fix SDHCI / MMC layer by providing necessary devm_ calls and/or fix
sdhci_pltfm_register() to handle the clock.

Personally, the list order is from the least, what I prefer, to the
most (i.o.w. I would like to see rather 4) than 1) to be implemented).

> > > Hence in this case the driver can be worked around easily (by
> > > shuffling the order in ->probe() to call devm_ first), but as I said
> > > looking into implementation of the _unregister() I'm pretty sure that
> > > clock management should be in sdhci-pltfm, rather than in all callers
> > > who won't need the full customization.
> > >
> > > Hope this helps to understand my point.
> > >
> > >>>> Your ->remove() callback doesn't free resources in the reversed order
> > >>>> which may or, by luck, may not be the case of all possible crashes,
> > >>>> UAFs, races, etc during removal stage. All the same for error path in
> > >>>> ->probe().
> > >>
> > >> I also pointed out above what would be the outcome of neglecting this rule.

...

> > >>>>>> Why can't you use sdhci_pltfm_register()?
> > >>>>> two things are missing in sdhci_pltfm_register
> > >>>>> 1. clock.
> > >>>>
> > >>>> Taking into account the implementation of the corresponding
> > >>>> _unregister() I would add the clock handling to the _register() one.
> > >>>> Perhaps via a new member of the platform data that supplies the name
> > >>>> and index of the clock and hence all clk_get_optional() / clk_put will
> > >>>> be moved there.
> Do you mean to add it to sdhci_pltfm_register function? if yes I
> believe it will take some time to modify sdhci_pltfm_register
> I prefer not to use sdhci_pltfm_register.

In the Linux kernel we are trying hard to avoid code duplication. Why
do you need it to be open coded? (Yes, I heard you, but somebody
should fix the issues with that funcion at some point, right?)

> > >>>>> 2. Adding SDHCI_CAN_DO_8BIT capability according the eMMC capabilities.
> > >>>>
> > >>>> All the same, why can't platform data be utilised for this?

-- 
With Best Regards,
Andy Shevchenko
