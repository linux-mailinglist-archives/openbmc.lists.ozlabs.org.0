Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE795FF0E4
	for <lists+openbmc@lfdr.de>; Fri, 14 Oct 2022 17:12:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mpqcl3V6Zz3c75
	for <lists+openbmc@lfdr.de>; Sat, 15 Oct 2022 02:12:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HRBVYVrk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HRBVYVrk;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mpqc234l6z2xJF;
	Sat, 15 Oct 2022 02:11:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665760306; x=1697296306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/njfTWM92urhDh1tc8kt06mInCQV3hTHb5sdf7xqk0=;
  b=HRBVYVrkrm0rn2UhGmXkzbXLF4CBsoLX9akIcSSgTpsSXCtP/r8FwKc/
   e+XaUrG9Mfdg/pbcUdL4CHdv7Utu0dDfTb5fTHXNNXUYi/djYAjhsQocH
   0Y+x3t/oNZtoT1ofTsowxM21QP4Cm6hf9T2tH7hSCGreITfDYakUNH4dj
   uRr9xfdWpr+u64PB5uuqizDYOr6dxKGmlr8THmjbCM8wfd9hS0NCB3SXF
   iJomFiHVS1QBmplWT13EqPOnzYbkZ7cgXV6kDITKQ4aeobx27De1bxvic
   DYAPNC3aMFPIZdr/g9qVJL8B/VuoC1D9NsK3FgB1SpQdEiVdVBEFtKJQ5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="391703297"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="391703297"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2022 08:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="660758830"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="660758830"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2022 08:11:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ojMLW-006yCQ-0e;
	Fri, 14 Oct 2022 18:11:34 +0300
Date: Fri, 14 Oct 2022 18:11:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
Message-ID: <Y0l8JTQQvLzRejk1@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
 <CAHp75VdDjyUAZBTaoPOe5oA3f_5xRznAooq08=Eff4F1AZyVOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdDjyUAZBTaoPOe5oA3f_5xRznAooq08=Eff4F1AZyVOQ@mail.gmail.com>
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
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 01:04:10PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 11:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> > On 10/10/2022 1:14 PM, Andy Shevchenko wrote:
> > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > than logical. This series is basically out of two parts:
> > > - add missed headers to the pin control drivers / users
> > > - clean up the headers of pin control subsystem
> > >
> > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > of the pin control.
> > >
> > > Please, review and comment.
> >
> > Did you really need to split this on a per-driver basis as opposed to
> > just a treewide drivers/pinctrl, drivers/media and drivers/gpiolib patch
> > set?
> >
> > 36 patches seems needlessly high when 4 patches could have achieve the
> > same outcome.
> 
> I can combine them if maintainers ask for that, nevertheless for Intel
> pin control and GPIO drivers, which I care more about, I would like to
> leave as separate changes (easy to see in history what was done).

I can now tell why I don't like to combine. While doing a revert (it's not
related to GPIO nor to pin control), it appears that I reverted extra bits
as merge conflict resolution. This is per se is not an issue, but when
I tried to find and reapply that missed piece I can't, because the patch
is combined and Git simply ignores to have
`git cherry-pick _something in the past_` done.

But again, up to maintainers.

-- 
With Best Regards,
Andy Shevchenko


