Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9D7A64494
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 09:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGS7n2hrhz3br2
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 19:00:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742198417;
	cv=none; b=cjUw8Oyqtsxj8LTRz1G7m+VtT41GZsNu3dli1MfHILymG+LC9jyjE4ngSoPjjxbLIQxDgFp4o3bWNgNjbFirE6SO0QELC/J2zsnMyDfDYAFvOqlG1nI3L0NUoHdscv0xaXn76fEzlw0xJLIWeHkZzPq1dAoZhWPS6pm1r0bkH0MPgOL4INZih5KvYhkhCJIys1IM6LswoYSJyMSv1u5byNe7IohsPSkT+gsBCbxlQU42IuuuisP0z3HJi2y51PKupwQ+ddOa/CDyztHS6IErj2wjI6yK1iol2SfWKjLdo2RsYT008hUsqOSEYHWGrDsff5UxBvj1rRZz8jPXBVhosg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742198417; c=relaxed/relaxed;
	bh=vaiyWbIz6Oj82hUDQViuJJ3GQPXALCUTLWwNLfrR6gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCi+HR9AHFFUlPYFZJFkr8oW0jhOSp/06uNWWok8Fu4OsJyioL/mKmbWh1+jfj1Ohc76GfgljVlTVZTRdpKIdaUueOqUhOORDuCdU6CdIx5gfs0ItambvvaEq3Rz5fv76EwFEckaXCVF5aaGIVD/5T72h1wsB4Lcwi0sbmqCcnEnYKwOfyV1eYD5o/rR204lU/a4/QnRfYHFJtL3AUR2FYWO8a67m6rYmoDH+tYFzCYS/Cn9wqEEZtpjnL9Gga94RkV+RxqeK/EJox+1YLm5QKN0xuXldd54M5VWEP42+qsjLOnqkXkUfbSJGsbA6IOfVKHyxjOYkBKDdQ02Ehh5gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c68CuVFu; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c68CuVFu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGS7f6LBPz2ydl
	for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 19:00:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742198416; x=1773734416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WcJorY7PCd1uLYcrL2Xac0peBqgqcHLr4/yCJRQ9DGw=;
  b=c68CuVFu6y71DOg8wYZ4dFAzGglRcwDplFSrbZGn62e/I6vg8tQOOLdR
   9GOogfhRLqDhepC+Hn1fCErzogpZTOqsQJ/KRTodpd/zYtoL1OysDRE71
   a1y5fd9tUFxOfTnR5EOYQxcexMk+2S0Pxe6lfHN8bwJL3g7EzDGbuzdu0
   UBNrO1r65wjiMBrtYC5cv6jk8QkFqCA5Vkar7aqqYfnL7aKR9qNTJYeJO
   rFw0RG3beJvSDyTA6KNHS0Tiw/PO80aWJJx7MnQ7Cw1BftFUWU5T0D4KK
   XuJonSLOkI60q/Qp3/uyNDytXNXbqCEA8IJMA1h8nK1OV98iKS7NVtJ+G
   w==;
X-CSE-ConnectionGUID: JV5CVZEGQtO+9MNejVwsQw==
X-CSE-MsgGUID: VgkeIFW/TqWmOOrJ/0fj0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43383616"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43383616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 01:00:12 -0700
X-CSE-ConnectionGUID: aE6cL5gsQ3avEEOtd25fgg==
X-CSE-MsgGUID: U1U/tNhnTbWmIps9Wc5uMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121674712"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 01:00:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tu5OG-00000003FIn-2NTM;
	Mon, 17 Mar 2025 10:00:04 +0200
Date: Mon, 17 Mar 2025 10:00:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <Z9fWhGDrUbAmGRl0@smile.fi.intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com>
 <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
 <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, joel@jms.id.au, p.zabel@pengutronix.de, oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 17, 2025 at 08:48:03AM +0100, Krzysztof Kozlowski wrote:
> On 28/02/2025 13:38, Andy Shevchenko wrote:
> > On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
> >> Hi Ryan,
> >>
> >> kernel test robot noticed the following build warnings:
> >>
> >> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> >> [also build test WARNING on linus/master v6.14-rc4 next-20250227]
> >> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> >> patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
> >> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
> >> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
> >> compiler: mips-linux-gcc (GCC) 14.2.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> > 
> > My gosh, this is valid report. But it looks like a preexisted issue.
> > Can somebody fix this, please?
> 
> 
> That was three weeks ago and still no responses from Aspeed or
> contributors from here.
> 
> I think this tells a lot about aspeedtech.com patchsets on the list.

Yeah...

-- 
With Best Regards,
Andy Shevchenko


