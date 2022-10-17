Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 902F7600EFE
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 14:19:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrbdN2kTsz3cds
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 23:19:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MmUYf+hJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MmUYf+hJ;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mrbcj0nVbz3c6D;
	Mon, 17 Oct 2022 23:18:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666009109; x=1697545109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RmYFEN28phqSp8mG6aCLWFWEADNDyPYb/TiMHr0QPNc=;
  b=MmUYf+hJk9h3PVURw/QobnSQjibOC0oL5Tqo007jreRh8+mOpXuwD7jv
   ow+MrMJrBDYanQt1JFYMg+sxnkPJbu6859RlZnbIHaZtv0mj3AelYxjQ+
   QXskL/eE5RRkJMEdssJd3rqGaDKm+23XjBRNaqeUE3FPQEU1w/pcVV1O4
   V6x/DJUZLvSaeU7ZG3/BaAT0m6ZL3FDYZaYXl129STQ8423r/yy0fPcf7
   Hrx2QPgODG3cMXcsZWkEBHqrSNXTD1i18RKXl8VCpJzWMY6lxg+9tp4FF
   /fggQEKIAxPiAp7JDgZa5kmbb234+0fqgYmgc65t7b4Sdl4c9Z4anli0P
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="332320297"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="332320297"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 05:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="623207818"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; 
   d="scan'208";a="623207818"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 17 Oct 2022 05:18:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1okP4U-008mkH-2E;
	Mon, 17 Oct 2022 15:18:18 +0300
Date: Mon, 17 Oct 2022 15:18:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
Message-ID: <Y01ICtqd8uy/4/Mb@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
 <Y00f5exY2fM6IwZ+@smile.fi.intel.com>
 <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYmSOGtFz8W_RRkDqMXRRBOSB9jqSn65Sah90bf3Gm59g@mail.gmail.com>
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

On Mon, Oct 17, 2022 at 11:58:03AM +0200, Linus Walleij wrote:
> On Mon, Oct 17, 2022 at 11:27 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 17, 2022 at 11:02:09AM +0200, Linus Walleij wrote:
> > > On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > > > than logical. This series is basically out of two parts:
> > > > - add missed headers to the pin control drivers / users
> > > > - clean up the headers of pin control subsystem
> > > >
> > > > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > > > pin control subsystems, so all new drivers will utilize cleaned up headers
> > > > of the pin control.
> > >
> > > Aha I see you want to send a pull request so I backed out the applied patches
> > > from the series for now.
> >
> > Can I consider all that you answered to as Rb tag?
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

> I haven't reviewed in detail but I fully trust you to do the right thing
> and fix any fallout so will happily pull this.

The plan is to push this to Linux Next for a couple of days and then I'll send
PR to you and Bart.

-- 
With Best Regards,
Andy Shevchenko


