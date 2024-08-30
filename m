Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0983966971
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 21:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwSds0rwbz3bcB
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2024 05:20:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725045597;
	cv=none; b=DAO6L4OXY6qG/aOfe4rzWftUBEEPTKPPuWM/1YOE56cfP8InK7B4zalDu5uTsXRKhyqcyCoLo5Q7yT4xJGZJWCoc9jN0h9N6xChJWRoBgQQNNGayoSJ7ovt4ZLALpGosIBFF1bsMzUmANb1XVJDKxv8jYlnkImvH5Bz+f5lC2pajrf5eTT/vPx0On64O5GNP1E1AavO8ouvPAcZOd7f4uV/QI7pyELK2ka9bNM4KvcIAXtK6c5RPR75SXw6vUVYPZ0aKNKQPfSaFCz0fGD4YCQVl05tWB2G4xTm2AkjzoBpd+2adjLW21LuPvKqwFnNCG/9v86O22lUsUT963QNWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725045597; c=relaxed/relaxed;
	bh=yTgD6bMVJ4elaWriRNWHFxwSVex4e4XtgtdQCNsH2nI=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization; b=WFphkDcwONEHLFDbjyLwAvH8n7B8zQzIIwKGIILRL+pkvacKcVbdBSLmVCvquSuXVbfpfxHI895yOwHEGX4lh+jd/kIL+bUvP03pt40wtE5izkREtu9QJpdPGTqgWaG0zuGuRKVa6AisSpBlJhDkX/q/YFu5Lr+HgTt6NwjOdnc93PrXEV2UO0EYdlmoTD28YoU2W+B0TIv9vjy0qpjvdE7qpeunOlVvn3dLdXikHeDJDBhqTH78PpSzPxGvUGMFyH2dbF6NC8trDKIpJdNrAN6yu3lbEUQ/nFQzTE2mZfwqSXmtbPAY8ZV0Wcuxw8cUxPAuLZuiwKaM6ulkGiselw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIlZ1AJF; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIlZ1AJF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwSdl1Z8xz2xjL
	for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2024 05:19:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725045595; x=1756581595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RPj8glNq/XNfJ0RgM0JMhvIq250MlyxYDrEKUuZhelw=;
  b=kIlZ1AJFZX4uUFlq5FoTMVKUNlBx37C3qUUY1mXv3Pu64QpZQYqOyv1r
   A0b+kAyZbWS3UChfh7tIKRfVTM/wYoMWLv2d+m2vsriqMtwXLi3PCz7mk
   th6gtdmFvXvzr0yEgXqwM595oXSTJ+yybQwcBh7fFGkfVPWWt59t72SPt
   PoFbw7fZHgFb53QZmvrEX+k2ZiGBtmScXoSsD2JAHGfUl35ydhy2n8zVu
   6/ccWxvk0K3VWiapJcWOhlQiYrInVWwy7sTout0XSgRO7w+cb0mZqA8+c
   0M7a/14k84kxXg3EgZjk5sSRP1ctSrzhnDD+dKn8RNDt38ADBFnjYN0B9
   A==;
X-CSE-ConnectionGUID: /LhqGKE+Rgeia8pNImRsrQ==
X-CSE-MsgGUID: wbDLn+hbSDiaLg11+oGZRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23218433"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23218433"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:19:52 -0700
X-CSE-ConnectionGUID: CsMyUCFFRPKtSiSFs3jdCA==
X-CSE-MsgGUID: C54OLbo3QACXAIrJKi+hzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63794787"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:19:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sk79d-00000003SRU-3XVq;
	Fri, 30 Aug 2024 22:19:29 +0300
Date: Fri, 30 Aug 2024 22:19:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-7-kfting@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 30, 2024 at 11:46:39AM +0800, Tyrone Ting wrote:
> Modify i2c frequency from table parameters
> for NPCM i2c modules.
> 
> Supported frequencies are:
> 
> 1. 100KHz
> 2. 400KHz
> 3. 1MHz

There is no explanations "why". What's wrong with the calculations done in the
current code?

-- 
With Best Regards,
Andy Shevchenko


