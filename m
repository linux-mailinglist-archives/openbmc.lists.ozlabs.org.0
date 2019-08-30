Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 522FBA4CFD
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:01:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBcJ434TzDqHh
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:01:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::e43; helo=mail-vs1-xe43.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="HSSx1i5M"; 
 dkim-atps=neutral
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KXhm4829zDqpR
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 18:29:44 +1000 (AEST)
Received: by mail-vs1-xe43.google.com with SMTP id r17so1370884vso.1
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 01:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uBe6XaZnp1DnbEiSR3tbPdbSTWUBiMGkZ5MQKY+Y/KY=;
 b=HSSx1i5MvIQIppnHZp5fqcZbrHRsEuE5YKsm/+pYHehWrBMRK+Fd6yYLM9RPceYWJd
 2KN6Ql6owRNffruGbdNcZSAqSso17tFIIcpLbRp0zC8kl60dO1JXkxCOZvRcyu1dIufG
 1hvgSKaVKD1JOa1eugdmJFPrx3JHFGraiG6Yc+aNazmxxyKhIeW0A1MPoue8sWBjkHg1
 2U/LjQQvHxtbyHKyKIvRHUSrnvL/0y4viuiAdHl86m6N5FXBwrgxRMsJfPfOTkX2P/xF
 bddVRikttGaleYOjqpQag/5g5JIML0+a/1FaVIA8U+xTCk8rUGlWv6r2EV2vQ8hSxIyC
 SbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uBe6XaZnp1DnbEiSR3tbPdbSTWUBiMGkZ5MQKY+Y/KY=;
 b=LfrAXb8+9pTOl1yF9GkuglzZx780JnJTgGHMEOwaruHC/pcZ8hKqUYy0Q8TyzxQFVy
 bvMiXcYCVhnYhCFI8RHHvQxtWLrug0CxkhB94lipEEFVkBaHRcS9uNxELP1kDg2WWLoH
 DFKzkHEHotOcbTEgYz/+k+GG2dcLytISnyi31O+ndbFcjiz7gTCQFcgs4fAFovrrC0/V
 u6Mw3B2J/DoDowk++4GwBiixTp4CYgYYdpBd3jhScj4Qf4jxaTWCs0LBmFJajCNYd2y5
 kCyYWLRp6u1FPmbgFzczyzohyxJSBK5qJqqyCpNbMSBoYbadrfz7wPVyq5QjvQlCFaPU
 awRw==
X-Gm-Message-State: APjAAAViSk/UPzbwlHa0zwoC9YKX5ybLsEye41N8VRcNvhdTfbj40YSa
 R06RRE0+ATKcitUdGYildcYPakiyoEygKpNETNBOHQUe
X-Google-Smtp-Source: APXvYqwT1/od4MWptrO2+eo5tENQaNYQ7XxIzCOrNHxyh49sPnVWPm0JNv85t1DAPIYt12rpwJzChBk7AwrIozo1u18=
X-Received: by 2002:a67:e287:: with SMTP id g7mr7906924vsf.200.1567153781210; 
 Fri, 30 Aug 2019 01:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190830074644.10936-1-andrew@aj.id.au>
 <20190830074644.10936-2-andrew@aj.id.au>
 <CAPDyKFrKXfB1F2dh63KrkCiKGbmbBWaAM16vJqtQncnF4YctQw@mail.gmail.com>
 <6feca359-34ce-445e-87bf-62fa063d785f@www.fastmail.com>
In-Reply-To: <6feca359-34ce-445e-87bf-62fa063d785f@www.fastmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 30 Aug 2019 10:29:04 +0200
Message-ID: <CAPDyKFpiftO194L2pf-_Yxu_BbizP6ss46YUZNO9ZxceeeWw4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sdhci-of-aspeed: Uphold clocks-on post-condition
 of set_clock()
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:51 +1000
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, openbmc@lists.ozlabs.org,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 at 10:07, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 30 Aug 2019, at 17:31, Ulf Hansson wrote:
> > On Fri, 30 Aug 2019 at 09:46, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > The early-exit didn't seem to matter on the AST2500, but on the AST2600
> > > the SD clock genuinely may not be running on entry to
> > > aspeed_sdhci_set_clock(). Remove the early exit to ensure we always run
> > > sdhci_enable_clk().
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  drivers/mmc/host/sdhci-of-aspeed.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> > > index d5acb5afc50f..a9175ca85696 100644
> > > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > > @@ -55,9 +55,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
> > >         int div;
> > >         u16 clk;
> > >
> > > -       if (clock == host->clock)
> > > -               return;
> > > -
> > >         sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
> > >
> > >         if (clock == 0)
> > > --
> > > 2.20.1
> > >
> >
> > Further down in aspeed_sdhci_set_clock() you should probably also
> > remove the assignment of host->clock = clock, as that is already
> > managed by sdhci_set_ios().
>
> Ah, I'll fix that in a v2 once I have your thoughts on patch 2/2.

I leave this one to Adrian to comment on, as he knows this better than me.

[...]

Kind regards
Uffe
