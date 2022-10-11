Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919565FB491
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 16:29:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmyp14JRlz3bjp
	for <lists+openbmc@lfdr.de>; Wed, 12 Oct 2022 01:28:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TmwYheI3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TmwYheI3;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmynH5WVRz2yJQ;
	Wed, 12 Oct 2022 01:28:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665498500; x=1697034500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tDN8pO8vkYfi7aIzDYMNy5iW/C9igDir6WIyp4TE2LA=;
  b=TmwYheI3RJ0W9HPHJPLOIyif275ZQOdscrFJ5qDx3W+1htFriQH0LhPb
   MSp4d/4UMuWg6IeR10HR1w/B7JMgBnlsiBXaFGyN6zPjBH2DsEW21UNfJ
   zeYnwcQk7ctDcDlH37vnbE6S+Ni8ahPWbbF2snejrYrSwJk2g5144/zKT
   hKyfNyS57geEAdI794g7kVzRA0u67NkXzVCNfMlOySo3Wtb2HjJ0DWM9t
   YgxsIfmfFArTyPiOLsQgibD8kq5uUBf1CwIHr0iDl3iIYDypu74r7kcNh
   AjsTfLUscaTQyON46KQjGDTcVEsBOjI2LfUYN4otwomHrg8mE3z4knchm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="284245096"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="284245096"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 07:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="628713444"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="628713444"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 11 Oct 2022 07:28:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oiGEq-005LfS-1Y;
	Tue, 11 Oct 2022 17:28:08 +0300
Date: Tue, 11 Oct 2022 17:28:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
 <Y0V57gI75ik4ki3A@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0V57gI75ik4ki3A@sol>
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 10:13:02PM +0800, Kent Gibson wrote:
> On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > > > > -#include <linux/gpio.h>
> > > > >  #include <linux/gpio/driver.h>
> > > > > +#include <linux/gpio.h>
> > > > > +#include <linux/hte.h>
> > > >
> > > > Ok with the hte re-order.
> > > >
> > > > But moving the gpio subsystem header after the gpio/driver is not
> > > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > > to me the way it was.
> > > 
> > > I see, I guess this is vim sort vs shell sort. Strange, they should
> > > follow the locale settings...
> > 
> > I have checked, the shell and vim sort gave the same result as in this patch.
> > 
> 
> The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
> and that still returns the same result.  That matches what I would
> expect to see given the content of the text.
> 
> And for me vim also gives the original order.
> 
> Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?

$ LC_COLLATE=C sort test1.txt
#include <linux/gpio.h>
#include <linux/gpio/driver.h>

$ LC_COLLATE= sort test1.txt
#include <linux/gpio/driver.h>
#include <linux/gpio.h>

I guess this explains the difference. Currently I have en_US.UTF-8.

-- 
With Best Regards,
Andy Shevchenko


