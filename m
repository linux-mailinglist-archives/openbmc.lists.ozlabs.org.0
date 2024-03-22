Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD9B887095
	for <lists+openbmc@lfdr.de>; Fri, 22 Mar 2024 17:12:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nUJCXoZG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1S5H0kCfz3vjC
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 03:12:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nUJCXoZG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 23 Mar 2024 03:11:00 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1S444t8Dz3vt4
	for <openbmc@lists.ozlabs.org>; Sat, 23 Mar 2024 03:10:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711123861; x=1742659861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuGiQISoVKHBaZbLIVHnraYHHoAO1WEtkqCEo2+zeaY=;
  b=nUJCXoZGeLtPy76JP6QuMF3It9AjXHWFaogokkAQvvPYar+f8MF2qV2X
   3W8uVuVxJuPh/qKZSbrx8u6VSA6IvE+P1tGapAg5PIwWWoIeZ9QSI81lN
   Ya5t3XpQTBPOU87t4YcL8QJv/bRUKgjC6qNxoImWQm21D+0Df5ADq7IxV
   LFmXtuDLR2ojVaRptuMJyZxw0AOMh46RMfyn40/QrC8eDdYiEm6S0Tdji
   4pmaJGGCoeDzuqjasV9NVung0hhv0hkDsXjyb4ZM78ljEC0wo57MA6N+r
   dPFl1w58r54F/b41iK203TxWvBUjzySP0uGSB1/04t1Jnxu5cXlCBbWYw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23634250"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="23634250"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 09:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914747988"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="914747988"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 09:09:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rnhSi-0000000FCTj-1lkG;
	Fri, 22 Mar 2024 18:09:44 +0200
Date: Fri, 22 Mar 2024 18:09:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
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
Cc: chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org, virtualization@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 02:25:57PM +0100, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.

...

>  static const struct i2c_algorithm at91_twi_algorithm = {
> -	.master_xfer	= at91_twi_xfer,
> +	.xfer	= at91_twi_xfer,

Seems you made this by a script, can you check the indentations afterwards?

>  	.functionality	= at91_twi_func,
>  };

-- 
With Best Regards,
Andy Shevchenko


