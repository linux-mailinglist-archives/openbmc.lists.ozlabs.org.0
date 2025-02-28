Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7FA49984
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2025 13:38:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z476g0rypz3cgk
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2025 23:38:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740746312;
	cv=none; b=nU+gYDGshq3J+29ozjIRp+27pG44BmVxvRrybe77+8jGXqZr6nGQ5zXhcs7OJfVUzfRI2Z+loC64iVn0fxldtJFJUoeejTdJwXkQGqUwyNN5K35/Sw8G1I95GWpreRMsimpU6icVFDSlx695MOG4E97loBYb3XTd3nFHW1GlFvICsXfdSvgZx3RFRrraa3CZo/x9BfsRZ5PrbMpY7xEUmkxQqGKu3Leoc5udWsOruKsGAr2JNtJN5l9kwGWdfb/EnNkRa6uaPoSc00d/yy16yOzE8SEZb5eyhCdGvRCUJ1ys72SABHJzqktkztzt6AMd6622mQ4DmP9AHblAHZpslw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740746312; c=relaxed/relaxed;
	bh=PFjBbY+XC1UAMgYfJ6fw2q+12gCt9wbXY8XezCsmN6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcFZ+Z+ennO8m9G3JRy+eT52wdZNnagIDQnDlO36YjrWS9MHDEDlt6g6s4x0x4wIWhPtC9YPgFX0SRTvSU/mYOUbjo10umk8m5fz46JktldGh0i4rA0t1Sv61ORHq7LxpzdmFHhvcI6QpUUWYn12d11N7ZlvBAEfS9epyeJsx8FRX4FnXbkvKXlhOHb3Z4KmoBIOaVCKaSAJjEVHPufy3ZXJ6Adyax9jW27OSgfFuTl5mMclJcWXRD9ZV4gNTvcLOPGYN0GjlH+Vw+os8H56XB+AgvgqIxp4PIJbcnzxRpEmYz/v1eSjqrn/eMQvhQFvqMgMY+uNtyI56Q0BqO5K6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pqku/oTz; dkim-atps=neutral; spf=none (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pqku/oTz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z476Y0BY6z3bsQ
	for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2025 23:38:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740746309; x=1772282309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYX7RMZyCDlc3/89q5oGVMuk0VSFqLZ9SexG0yL3SwM=;
  b=Pqku/oTzbsb0ATRIdjwdPNeExs0Dt8yxea5J3EslVhbK2SgczqH9a13V
   D/FkQ5X+D1QrOdVKDgWxEGLsKNWFOX07OkD/5ZohpWN16qmX5haA/TqSx
   lO03uSkMIPJUZQ3EoK8OxwO5f3hSGhrTKML45lz6ntElW0v7W3BChiQiz
   AXbCxSWLoSApd6Rzp32eahSPQb9BT4cxspX6rE1vmacuA4qgagoBpo3i3
   ieQdM/HFwOl0pmOvjpmIfPVgY3xRcsbqT1DUcku12fv0hNFJTHACbWWhk
   wRDcL4Hi8HUDJb30+DVBGlzi6qjsfvaIskG0CFABWQ3A19keLqrs4/6NF
   A==;
X-CSE-ConnectionGUID: XrfsbVdyTp6yDqenJFer0Q==
X-CSE-MsgGUID: JjQNXiEgQLOjweKf7g4q7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="44487572"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="44487572"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:38:25 -0800
X-CSE-ConnectionGUID: XFK1U7eRRnWQ4oGOGKwDHg==
X-CSE-MsgGUID: 9fz0KIp6TWq3kGY8ZRIIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117312902"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:38:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnzdB-0000000Fwgv-3Dnc;
	Fri, 28 Feb 2025 14:38:17 +0200
Date: Fri, 28 Feb 2025 14:38:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502280902.U0gLDhve-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
Cc: robh@kernel.org, conor+dt@kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, p.zabel@pengutronix.de, oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> [also build test WARNING on linus/master v6.14-rc4 next-20250227]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

My gosh, this is valid report. But it looks like a preexisted issue.
Can somebody fix this, please?

-- 
With Best Regards,
Andy Shevchenko


