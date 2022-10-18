Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEFF602C7A
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 15:08:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsDh86FFHz3cBq
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 00:08:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eDDbG7to;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eDDbG7to;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsDgT1hbzz2xWx;
	Wed, 19 Oct 2022 00:08:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666098485; x=1697634485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sEQGqXRBwnqb8HWOCi92bXpDgq1DcIK6JeLU6KGQmhU=;
  b=eDDbG7tolZoAiWx8PTf8/qSCXzDARQnRA7T5mjic0C+W/dfmk5unileh
   iUU4AOXzQqjqtYreriIFBrJCpsVMJCx7aJMAXEUFZYsuKqzGoeIUqd46L
   mnV/OvvOfGlMNZBTegjFF7pIt8bABRZSZfNm6d9qzl0sAltbOvayLsbXV
   EErr3/MPDopvJqtqRJsGkwHIX860hskn1KGsM9Ev87wMwMK/CpS5lRAKL
   Dc3kdQsiBFOqQGfW48gDpFZvodFfqXie/3z9k1/dpmpcDpifOpc9jYl9F
   mGjRufRkc71b+oEaLz9jpjYXCHtSN/Z3g0MzvAwO3NTkFYTZrF5C8vJpg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="285819233"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="285819233"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 06:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="659781896"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="659781896"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 18 Oct 2022 06:07:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1okmJu-009NCP-2i;
	Tue, 18 Oct 2022 16:07:46 +0300
Date: Tue, 18 Oct 2022 16:07:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 36/36] pinctrl: Clean up headers
Message-ID: <Y06lIq+2+MPRL45W@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com>
 <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
 <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
 <Y0UyOWALxSFai2w6@smile.fi.intel.com>
 <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Kent Gibson <warthog618@gmail.com>, linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 18, 2022 at 03:04:44PM +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 11, 2022 at 11:07 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 11, 2022 at 10:46:30AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Oct 11, 2022 at 9:31 AM Basavaraj Natikar <bnatikar@amd.com> wrote:

...

> > > I can confirm adding
> > >
> > >     #include <linux/pinctrl/pinconf.h>
> > >
> > > to drivers/pinctrl/renesas/pinctrl-rzn1.c and drivers/pinctrl/pinctrl-single.c
> > > fixes the issues I was seeing with shmobile_defconfig and (out-of-tree)
> > > renesas_defconfig.
> >
> > I will add this, thank you for reporting.
> 
> Same for drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c.

Thanks!

Not only. I have updated all of them (but missed zynq (it is in today's Linux
Next).

-- 
With Best Regards,
Andy Shevchenko


