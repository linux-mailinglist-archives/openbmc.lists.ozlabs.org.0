Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D46A6BDC
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2019 16:50:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N8xz1ZP5zDqd0
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 00:50:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::e42; helo=mail-vs1-xe42.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="KHMycYhG"; 
 dkim-atps=neutral
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N8wn4QfvzDqS1
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 00:49:12 +1000 (AEST)
Received: by mail-vs1-xe42.google.com with SMTP id 62so11462859vsl.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2019 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQLkGwKQ606SBhDXYVZ/wIEqALYPfmqGkU+b2OoxSog=;
 b=KHMycYhG2Y7WHnw+EuBG4+CdLshJqNlVA/OT7aQHdigAAwCUgOApY5f6VL8hxznVHt
 JWNHYAo+S/rFPORr1CpNVbINUk7JIin6Cs1Eka7rCL2nl1w8qq1M62XggCgUaMnURSGi
 33Oxu+V3NVbtK/KbO0KIxVVKWLIUBG/xGRC3O2XMyB5CHGA2T0QKNWsoBVGadGaRruof
 zbTrQEfkXyKf/QmAgHwUZzOXzdt8Q40N3Kqe+pKJCALXF9OTCRj3gDDfT5/MendnZxVy
 Blc7JYR/GDFBtqv0NhshUYQInCUje++lKyDQQ5ZUTusnBi8U/Wal9R+YCiFUZ8FMUpDz
 3w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQLkGwKQ606SBhDXYVZ/wIEqALYPfmqGkU+b2OoxSog=;
 b=UBq8qj8Ey6K+rV3Jy51/MLAhCEn+ANn1poukqHZCO7d3PSC4a5cJ9OmW49olkIQcg4
 dM2Ne7vem1O0JS8HOHPOgbb6nVfXUUOAqxYR1QZcWyeAWfeUAFReQdNZZoUrLyuacden
 82pcLd4X8jv8HuqOiRNfMXCneSMZ4a3XDQJoWcPKgXNdoJxA388gtSqDHqOdw2/+mVKF
 lmxL6MygiCatIl45OsDfahiZnjWZg1izYzh2DNo1pT7yx1NA5jxhOPaJ2NP2dE/uJSyM
 2tTNrbBpt/rw6u80X7WzrnfhG/IHyfUv292YyYASkRMGlfhgf/FB0NCg+ExJL2Uw5dq9
 XkNQ==
X-Gm-Message-State: APjAAAXaleIwTWgzEjzL0GvvxOrwgboz28cL/3szTalks52NbnbsnmoH
 v2q9UF0KefpTFDw64XMuGueyA1ivki0sSMRkQqMMnw==
X-Google-Smtp-Source: APXvYqyd0pWvJiNrUztCCQ87hmga1RG1L9BG5LyLAKxB8i0L1jom1pOqkHDVUIvJHWJhzw9BQ4YovByAtRfexvKB21U=
X-Received: by 2002:a67:fe4e:: with SMTP id m14mr19402036vsr.34.1567522148468; 
 Tue, 03 Sep 2019 07:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190902035842.2747-1-andrew@aj.id.au>
 <20190902035842.2747-2-andrew@aj.id.au>
 <CACPK8XfYgEUfaK6rtr+FdEq-Vau6d4wE2Rvfp6Q4G2-kjVLT0g@mail.gmail.com>
 <83570e25-b20a-4a17-85ea-15a9a53289bf@www.fastmail.com>
In-Reply-To: <83570e25-b20a-4a17-85ea-15a9a53289bf@www.fastmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Sep 2019 16:48:32 +0200
Message-ID: <CAPDyKFpWJu3RH4TWoO_wcJq0LDrM_fAUfsCC==e8O_6A8dLhiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mmc: sdhci-of-aspeed: Fix link failure for SPARC
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kbuild test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2 Sep 2019 at 07:26, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 2 Sep 2019, at 13:42, Joel Stanley wrote:
> > On Mon, 2 Sep 2019 at 03:58, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > Resolves the following build error reported by the 0-day bot:
> > >
> > >     ERROR: "of_platform_device_create" [drivers/mmc/host/sdhci-of-aspeed.ko] undefined!
> > >
> > > SPARC does not set CONFIG_OF_ADDRESS so the symbol is missing. Guard the
> > > callsite to maintain build coverage for the rest of the driver.
> > >
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  drivers/mmc/host/sdhci-of-aspeed.c | 38 ++++++++++++++++++++----------
> > >  1 file changed, 25 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> > > index d5acb5afc50f..96ca494752c5 100644
> > > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > > @@ -224,10 +224,30 @@ static struct platform_driver aspeed_sdhci_driver = {
> > >         .remove         = aspeed_sdhci_remove,
> > >  };
> > >
> > > -static int aspeed_sdc_probe(struct platform_device *pdev)
> > > -
> > > +static int aspeed_sdc_create_sdhcis(struct platform_device *pdev)
> > >  {
> > > +#if defined(CONFIG_OF_ADDRESS)
> >
> > This is going to be untested code forever, as no one will be running
> > on a chip with this hardware present but OF_ADDRESS disabled.
> >
> > How about we make the driver depend on OF_ADDRESS instead?
>
> Testing is split into two pieces here: compile-time and run-time.
> Clearly the run-time behaviour is going to be broken on configurations
> without CONFIG_OF_ADDRESS (SPARC as mentioned), but I don't think
> that means we shouldn't allow it to be compiled in that case
> (e.g. CONFIG_COMPILE_TEST performs a similar role).
>
> With respect to compile-time it's possible to compile either path as
> demonstrated by the build failure report.
>
> Having said that there's no reason we  couldn't do what you suggest,
> just it wasn't the existing solution pattern for the problem (there are
> several other drivers that suffered the same bug that were fixed in the
> style of this patch). Either way works, it's all somewhat academic.
> Your suggestion is more obvious in terms of correctness, but this
> patch is basically just code motion (the only addition is the `#if`/
> `#endif` lines over what was already there if we disregard the
> function declaration/invocation). I'll change it if there are further
> complaints and a reason to do a v3.

I am in favor of Joel's suggestion as I don't really like having
ifdefs bloating around in the driver (unless very good reasons).
Please re-spin a v3.

Another option is to implement stub function and to deal with error
codes, but that sounds more like a long term thingy, if even
applicable here.

Kind regards
Uffe
