Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D369987F5
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2024 15:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPW9H6V9Kz3cNq
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 00:40:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728567632;
	cv=none; b=BFFmLBYP7uzc/eELvXMUr9uP0Yhc/4J+3g0LRnKskG3/7KOuXar+WbcW4Abn+5str+ssOmhgOlwPLOHuJK3Q8Btv0pwGILSQjNVyqGOO5knvNHa7s78ARg1BEHfsb2a1hS1trVPZYsIxh62s3X5AWe0IOPWAB6GIT9/RM1v91R3OW0zqQ4fmsWo2aaBQeyf158FabO1SmMICEfUrT3UHkZ6sCiHEo/0mSF78q4WDDGpvYB9Vb3PqBOwRp1nWJdSFxfYznl1M59D9LdrFkjIJ9Ke5F3YDeumAr0tEeqEtIDf1zmKxonqTBlyyhJ3AOX4wdc4kdtZm4aM80MMniIkHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728567632; c=relaxed/relaxed;
	bh=yURt0B4WjxE0mMEo4JtzJb1U8wpbNcr0VdmeKOsgGtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+Pd7RcTymb2hleMZsfa7WOrPNMV5BDD6gQE55CnOvD/jMvjLOswgoDTJK25Na8usCcCb+YiSJl1zHPowG+HB1CKUA2uRxVH4BUn7Jprwt0boA4s1xku4VC23JUottP0aVuOdnP2+7PTJvlVusKteBcqwGfI6e/8dz4vpO4jnvyOA7Yr43s7UaurbUxJgk2Ge3B1aCKxAAsQEuS9ap6avN7C2V+el7UFGIfhupBRvqyZtF/H4zoZdKu+FEcimf6EIxxlXSSEalk0FywndFNgVWSdXVZ52TgI6gEKwkJJtGSeT6IfcQqrViVBXW5QtjFcPRh5CUs+pDIdu2ryP58qtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AjIPpctq; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AjIPpctq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPW983Npyz2ywR;
	Fri, 11 Oct 2024 00:40:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728567629; x=1760103629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sfahgSvO20tuszyXcjplQnhiPIH1X5txk1P6D/qzB7E=;
  b=AjIPpctqn/q+hbuYEbfK7svWDYzsVFtLCTIMtvQa+SwNr7NYolo+X8JZ
   GnvsBnGV0qgSQrgfk8Y81U+VvhAoPQkJ/alZRxlC9nDbauiMcj0GrfPO6
   +rOIyoITNNXy1WEFjRJTalx2eYchtaHsMNPk3YfPxggT0rgxqChvpqyr6
   KhfKk+nP/ekhbVQchgJB5ldgAiM5VWYk/9EnmJlSLd5wklL1qN7MsGQ2p
   FL5ciCKBW/0VdafJOOpD532v7qkfQS+cMK0QNljcNlTsJbIdbJFksodwe
   uveBxJ460Fuq7nuEWXGSQVDEDQpQaDtTLxH4wuhpgQ7tR32Fv9N9VfyZA
   Q==;
X-CSE-ConnectionGUID: a8JqgenpS2+9ZE8yPyrxNQ==
X-CSE-MsgGUID: tXqbFc1oR6SaxAwL+CGiOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="50461097"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="50461097"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:40:23 -0700
X-CSE-ConnectionGUID: 6qJ+jMC/SH249H8sQKl5+A==
X-CSE-MsgGUID: wQZfN4DVSJqib9HV7c/yeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76504990"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 06:40:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sytOp-00000001Y6Z-3aj9;
	Thu, 10 Oct 2024 16:40:15 +0300
Date: Thu, 10 Oct 2024 16:40:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <ZwfZP0LeqKobdbgK@smile.fi.intel.com>
References: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>
 <202410051547.vOL3qMOc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410051547.vOL3qMOc-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, joel@jms.id.au, p.zabel@pengutronix.de, oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Oct 05, 2024 at 03:36:16PM +0800, kernel test robot wrote:
> Hi Ryan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on v6.11]
> [cannot apply to andi-shyti/i2c/i2c-host v6.12-rc1 linus/master next-20241004]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20241002-150410
> base:   v6.11
> patch link:    https://lore.kernel.org/r/20241002070213.1165263-3-ryan_chen%40aspeedtech.com
> patch subject: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410051547.vOL3qMOc-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_setup_buff_tx':
> >> drivers/i2c/busses/i2c-ast2600.c:437:41: error: implicit declaration of function 'get_unaligned_le16'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
>      437 |                                         get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
>          |                                         ^~~~~~~~~~~~~~~~~~
>          |                                         get_unalign_ctl
> >> drivers/i2c/busses/i2c-ast2600.c:441:41: error: implicit declaration of function 'get_unaligned_le24'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
>      441 |                                         get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
>          |                                         ^~~~~~~~~~~~~~~~~~
>          |                                         get_unalign_ctl
> >> drivers/i2c/busses/i2c-ast2600.c:445:41: error: implicit declaration of function 'get_unaligned_le32'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
>      445 |                                         get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
>          |                                         ^~~~~~~~~~~~~~~~~~
>          |                                         get_unalign_ctl

You need to add

#include <asm/unaligned.h>

_after_ other #include <linux/*.h> in the code.

-- 
With Best Regards,
Andy Shevchenko


