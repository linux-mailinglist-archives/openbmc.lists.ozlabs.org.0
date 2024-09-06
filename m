Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDD96F348
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 13:41:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Z7H11tdz3cLL
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 21:41:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725622871;
	cv=none; b=eV6UuWBQqZ3c6ABZTjt7I+iZRIoqA/xnpv/VTSSI/Qg+upQLaXGYFjkIOZnryYshyB1UFxNngLNZNU/7DrPwLG4AnBUxtt4FlIdYHhQwuE7ChnVbwpRgPEzP3BezABym2waarVjFHVp8kFTlPJ4kz63p/vT03GS1WrQ4O2cROiPL87d4Ni/76dcpyn/AED7LxZhP7z4T6eGSMO4Tt0ZvNHz5Lg3+F0Nx3/84Y+8Vtkb67JZMmnxkdK2BSiiA8GrsgrJDcWf47HDCAoNmu2xqnrPlvEiev+Rk+LwsDErTiLlODa6Ilb6jaTy5psqWJcgicXo/WRC6gEQmt+Ohtw9KmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725622871; c=relaxed/relaxed;
	bh=ZuBialpnznpp0hGkx7QHMhhGB2qgu5oU9Q5F1shcDEc=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=AqU6n3tA1FIbKKmdzRTkp32pajHStN8fKCa7koO5q+rvLf2X8Cuk3H0hvqSuTtqWpvGx/fwrIbHm5qHQudHVA5PKa4cLaYUGBUK4+x0gOQlSKdqsuSPJQXjrk7mEiSxPWXUmOKhj9xuVlz7+FQWLfuXR/lr59QlTvvB4KSpxRD13SjS6n5oRVDQ7OBlzlTK932r+OCXyGizPcnImBEOVKxWYK6kwdXOY5PKhI43XdwARHcTx8ZNF03sK+VPHjGlcIRX/07MkCavxjzs5ZnhYWW1L8ItA8xTKJ4p3K6k3EANJZzi3r2oRWXXbDC+jDHWWxh3g4AazkxzN7Q1YUyLviw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=El0hFk1F; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=El0hFk1F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0Z7842rlz304C
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 21:41:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725622869; x=1757158869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YGHl4O8g0y5wAhBvvDSoCsRTbOvTVD97w2B1eAugi6k=;
  b=El0hFk1FSpeibnpXbAIJmruYVlshknrInuIHSiJwLfzr9qvDuzsSPiDg
   AtwRo5vE8X9xjrGy0C0khGen0XdXasFO6xgf4B6+NK5D9NPJBxlkoB6sy
   A5SBIzKSrhiYESuT3hywF8zQpRcYW5k8tskjQ8MTvYXorCBx7cx9gkMHp
   zqIMZp3pC3OQhkITAiW+MfgTpJBtPuwcx0xGE0O1oUGJCjWKTxi7sD6x5
   5D6meylCOOCAWcf2yoQSmLfP/E0LL9FFBv+TgK9wqZW13QqeOdTUBlBIF
   MfIdlW82I7r+R9+ICx6rGKWjeQw4hdk/pc3CFS2tXa5G/5OqlGXBReUV8
   w==;
X-CSE-ConnectionGUID: 2aSaScrDSpWGHlCaGp1/8w==
X-CSE-MsgGUID: ak690FqxQNmooS79Lc/1kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35730379"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="35730379"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:41:03 -0700
X-CSE-ConnectionGUID: WQK9yInwQwaYZ/2sETdENg==
X-CSE-MsgGUID: +kM31qQnQxSVCYmefBQkbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="103406212"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:40:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smXKg-00000005lsd-1cyA;
	Fri, 06 Sep 2024 14:40:54 +0300
Date: Fri, 6 Sep 2024 14:40:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <ZtrqRc5XYmYBtonw@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
 <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, tmaimon77@gmail.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Tyrone Ting <warp5tw@gmail.com>, rand.sec96@gmail.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 05, 2024 at 11:36:45PM +0200, Andi Shyti wrote:
> On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> > The original design supports 10 slave addresses although only 2
> > addresses are required for current implementation.
> > 
> > Restore the npcm_i2caddr array length to fix the smatch warning.
> > 
> > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> 
> your email used in From: is different that your e-mail used the
> SoB. Is this done in purpose? If so I will keep it as it is, no
> problem for me, otherwise I can fix it while applying it.

IIRC Linux Next has the respective check and it will become your problem :-)

-- 
With Best Regards,
Andy Shevchenko


