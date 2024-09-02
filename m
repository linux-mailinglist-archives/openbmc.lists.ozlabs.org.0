Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AF39686E5
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 14:00:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy6ky2gDjz3cDV
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 22:00:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725278406;
	cv=none; b=YFy9KHQqetR+47xnP26nA+AL9TJIuE+r6BtVyUz7z/t8nQ7XvpMYcpgjiztOjTxogDSMcYnOclgE2DVCfCTz3zVYEZMFejO0fjC7yeWj3XoZl27j2eLQgz+f/UuLN9LWoIauVerna+k8FGK+OeT3mdVeJZPOrIwZzT2zMtCEEOxHUQyObpxGMlNRny/PTocKrslHQwFkGs2sglMY/FPsWe0mm5rGlvvxyneJREcCiLFtl+S47nD9HPoMA/Nd/pwPbebDSuUqKMif5H+3DXhXg2siWH+igNk4er2AN6HMNVqXOs/qpQakLoSkta2ruJ76TSyyoydLT7Vgb6EzncAXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725278406; c=relaxed/relaxed;
	bh=kSoBVc4tKvGkmvCrjydyHYLIbTEvLClDKVwDwJsYwhs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=fS4YFU+hGnP5fzVI+imwWTYERo3C9n8QAr2yQpYaBR34w3Em4aRdsCfyofxgdCWAKrl88daYDnPvxJTO9OmRgncZ7l+O6DVs9U0KhzmWmWO+uhq9A0NneTKwGr0whlm43tSxTooa60fW8veTQ76BXmyYGKT5t9tILY9NeweOHcCeRiJ53i7JkBKRybhgr1v4CgqKg4QM6cXeDCvQIEFfP3jHY+7fVUjeFVUC9pqJQtbDUIvISYUxA3gQLE714BwQH+Uj2+h32p3RjDj/kcoCHWzh9atjnqgnOHUQe6lO7AlfAPBbAS7eoocVGJwjDFJL5BtQiYs2xRRwwGu0FOlCHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m04E5lzz; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m04E5lzz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy6ks5XYSz2xjH
	for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2024 22:00:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725278407; x=1756814407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=s5PNXJylVeTaejUqfvcmHm17nL+lhZdgF7rPHmXu+Dc=;
  b=m04E5lzz6Kf1hH5brdVtFNetH+J9cpWupV2BQgXC+Sq2b1JAQChfK6x0
   7asmdm02vdeOBud8ByN0LUozNcK4Ab3ZQb6UJ+EcvPNYyKoRPUnyA4qq7
   BMTilmo0RlTgB1Ko0A4a57qlxrOCLZ9m+3UUCe8jBD44vwV/qYU8xz0fy
   mCabkjd5h4eGS984Eb7TEBhe1ngVtIRquaucxaJT6ugvKV0Z0TOeGiCT6
   PfQWTkJnymEMM7Ew40Ck3ydCMC3aAefoX2LML4V7tKx4xkeaHa07Ib80I
   3iLk5jw+9n7Qal5tCp7+nQhm+5Oxcb/AgCe+naGTIlDWnU7U/IFGJ4Kgn
   A==;
X-CSE-ConnectionGUID: AqfCCoAZR9u5VSJ22IBeaw==
X-CSE-MsgGUID: tzx5tjzhRDmaHrzEeN10jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="27643889"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="27643889"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:53:42 -0700
X-CSE-ConnectionGUID: bBchEQG1RTKmqrN4miqtxA==
X-CSE-MsgGUID: bamhgSFwRwK8MR+qtAi4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65308475"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:53:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sl5cj-00000004LfJ-1Jbb;
	Mon, 02 Sep 2024 14:53:33 +0300
Date: Mon, 2 Sep 2024 14:53:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <ZtWnPTSu1RKmIlhK@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
 <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
 <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHb3i=vWNmokQYyOZJOVeaJaT6XAroct2gZiJYPVQf6rHzR5LA@mail.gmail.com>
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

On Sun, Sep 01, 2024 at 06:53:38PM +0300, Tali Perry wrote:
> On Fri, Aug 30, 2024 at 10:19 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Fri, Aug 30, 2024 at 11:46:39AM +0800, Tyrone Ting wrote:
> > > Modify i2c frequency from table parameters
> > > for NPCM i2c modules.
> > >
> > > Supported frequencies are:
> > >
> > > 1. 100KHz
> > > 2. 400KHz
> > > 3. 1MHz
> >
> > There is no explanations "why". What's wrong with the calculations done in the
> > current code?
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
> Hi Andy,
> 
> The original equations were tested on a variety of chips and base clocks.
> Since we added devices that use higher frequencies of the module we
> saw that there is a mismatch between the equation and the actual
> results on the bus itself, measured on scope.
> So instead of using the equations we did an optimization per module
> frequency, verified on a device.
> Most of the work was focused on the rise time of the SCL and SDA,
> which depends on external load of the bus and PU.
> We needed to make sure that in all valid range of load the rise time
> is compliant of the SMB spec timing requirements.
> 
> This patch include the final values after extensive testing both at
> Nuvoton as well as at customer sites.

But:
1) why is it better than do calculations?
2) can it be problematic on theoretically different PCB design in the future?

P.S. If there is a good explanations to these and more, elaborate this in the
commit message.

-- 
With Best Regards,
Andy Shevchenko


