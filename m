Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C171297154C
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 12:28:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2NMP44X1z3cFq
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 20:28:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725877677;
	cv=none; b=CicSl9Xl6beeP/QC1xElrbb/Vyl2PlYCM45hqq4UsWu9J+x/E82V5SERmr2HGV/054SyUm8+dI9J3n2QjjZxwMd4nsWpXCK4wWimJY7z060ao+jqNiTtJBHkumTH91E1zKH1gxbqpNZ4BsSusjSNfDL/gZH1U+ADluyWShuCUDiwBWY6P8F+SRsnj3BE7QMbWFkHWEGGopg2hgyRvEptOT4pzgjqrPVhOppOVUWRd+q22gE31XPC43D95Z7TmJbva4MmDeNUL6Hh2OdABuzOC0uGLeOgZL080NoN6A1rZZoc13f5sc3n3jReOQHpgcmRCtlY1oLQTWI7wHGGzWc6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725877677; c=relaxed/relaxed;
	bh=rCO9HgAQOMTbFLJi2qB8MUBi1XDjEeEVwBMPvc6Tvzg=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=OJ86e21De748bqcgWfURDi0dzGTG8MpaTU/ODlrS2pelFYxTvFWDNTiek0ukE8bU/5Mx26y3aTv8tJPOnIYPi0B6d0MMEWnUzpDyS2M3PRhRBQ4A5EuhVAxy24dI7MQ4O9vU6gjps968fOfjRaX1R9uR2nEilrp9qzCUrhLMkd3QktQdpNtQgpWyugDiCxcViRy0AqDA2uik5sJc1sn6OLCI8+UCfUkuRbKRo+M5uOusTnY8Gdk08GQ05mDLqq/CMXQDxj2RBpWGpbX2226l1RW+lJoqQ/vHTU3dWyAD1nODl2tyX7MC6gqnFFd0rannBrW+GHv1XIxU4aY92wdVIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XIaTXTnR; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XIaTXTnR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2NMH3dl1z2xFm
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 20:27:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725877675; x=1757413675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+SmCyytRSiB0PCoR7QlPPleWDhB0nCXCjJCCXHARODQ=;
  b=XIaTXTnRZLM9x4LAqHik2Upzz9/Bw4yi0MNvY3tPN8yJKJlRx4Wp8g+5
   uCGYo6qEEYyvOCGvDuqD6ll5rzKTkTM8hRQq/t947wesdoDPWzb+3Q9Io
   fjau++NuKluj8fsHH9bS9uZ8PkrFzKABzT6nz+HhN11ByXazjd4N2EV41
   A/vwUvuXl/XZy4AQ5HOlXpYyZxWPZn/AxAd0F2uScZsuX4lc6rXOoo+Gl
   FWQ455c3BKtDnJKOG9+vh5zUxsgnmRcgixoR3u4kpeQ/1H48fn9AWE8VF
   2p+6vjoCHnlfCaQyIh6h5jHrNznvCeFp/oxIk/1zsCDd6KznKIc/etsbN
   Q==;
X-CSE-ConnectionGUID: f76zvf+yRjKk9XrWvSmaTg==
X-CSE-MsgGUID: BQk1BXc5SwCFIK5j6kuokg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24437423"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24437423"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 03:27:51 -0700
X-CSE-ConnectionGUID: fviXEXhHSWqLf8LoB33Jlg==
X-CSE-MsgGUID: A+VKBPxTRF+elyruo2PwAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="97337654"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 03:27:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snbcW-00000006khl-0dob;
	Mon, 09 Sep 2024 13:27:44 +0300
Date: Mon, 9 Sep 2024 13:27:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <Zt7Nn9uJSeHFUZZF@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
 <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
 <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
 <ZtWnPTSu1RKmIlhK@smile.fi.intel.com>
 <CAHb3i=uN5jtczEjHhzwL9E9c6d9rU-QZckhU79KzPuY5n81CyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHb3i=uN5jtczEjHhzwL9E9c6d9rU-QZckhU79KzPuY5n81CyA@mail.gmail.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, linux-kernel@vger.kernel.org, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Tyrone Ting <warp5tw@gmail.com>, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Sep 08, 2024 at 11:54:50AM +0300, Tali Perry wrote:
> On Mon, Sep 2, 2024 at 3:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Sep 01, 2024 at 06:53:38PM +0300, Tali Perry wrote:
> > > On Fri, Aug 30, 2024 at 10:19 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > The original equations were tested on a variety of chips and base clocks.
> > > Since we added devices that use higher frequencies of the module we
> > > saw that there is a mismatch between the equation and the actual
> > > results on the bus itself, measured on scope.
> > > So instead of using the equations we did an optimization per module
> > > frequency, verified on a device.
> > > Most of the work was focused on the rise time of the SCL and SDA,
> > > which depends on external load of the bus and PU.
> > > We needed to make sure that in all valid range of load the rise time
> > > is compliant of the SMB spec timing requirements.
> > >
> > > This patch include the final values after extensive testing both at
> > > Nuvoton as well as at customer sites.
> >
> > But:
> > 1) why is it better than do calculations?
> > 2) can it be problematic on theoretically different PCB design in the future?
> >
> > P.S. If there is a good explanations to these and more, elaborate this in the
> > commit message.
> 
> Thanks for your comments,
> 
> 1) The equations were not accurate to begin with.
>   They are an approximation of the ideal value.
>   The ideal value is calculated per frequency of the core module.

This is crucial detail.

> 2) As you wrote , different PCB designs, or specifically to this case
> : the number and type of targets on the bus,
>    impact the required values for the timing registers.
>    Users can recalculate the numbers for each bus ( out of 24) and get
> an even better optimization,
>    but our users chose not to.
>   Instead - we manually picked values per frequency that match the
> entire valid range of targets (from 1 to max number).
>   Then we check against the AMR described in SMB spec and make sure
> that none of the values is exceeding.
>   this process was led by the chip architect and included a lot of testing.
> 
> Do we need to add this entire description to the commit message? It
> sounds a bit too detailed to me.

Yes, please.

-- 
With Best Regards,
Andy Shevchenko


