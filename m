Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D64E887176
	for <lists+openbmc@lfdr.de>; Fri, 22 Mar 2024 18:01:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eBgS22G9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1T9l10c1z3vqb
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 04:00:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eBgS22G9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1T976yJfz3vjg;
	Sat, 23 Mar 2024 04:00:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711126828; x=1742662828;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=eijYIPLIRnSAkyrL//Qucwww06P+qCR4wOCt19HryXE=;
  b=eBgS22G9h9Pz1J0MlzjH+y1gldAGZEjZlZ9UYwWyQC14PaEjt8yeGEj9
   PO90OfwzZW+i56Bb2P720wW/z7oJOTmUlOq44B5qhaN+dqgBi3VsZA7QG
   uKDaJuhhrR5PwtROp52dGNe0stEKQbICBhTOBwxhIbnOBWJHpKlasF00U
   yBkJQwWYkyiFG3eJMc7gDwsHI0l/D+zPMoT7Yq8DM+qdZEeP9v9lJCyJL
   fG7b0H0C1L37CdHou+skBXrpnWK6krEeEdScqGndwz9pg5MCoPMdg0ZbA
   nhVMbXHuIH0tMqx1uybiQUBoJ4K2ej5Alm4nbgkHJ/UmI66XPVQikX6Iq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17619590"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="17619590"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 10:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914749126"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="914749126"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 10:00:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rniFb-0000000FDED-2Q86;
	Fri, 22 Mar 2024 19:00:15 +0200
Date: Fri, 22 Mar 2024 19:00:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf25H-LlAFmfuyYT@smile.fi.intel.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
 <Zf22dmwBpN7Ctk3v@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zf22dmwBpN7Ctk3v@shikoro>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 05:48:54PM +0100, Wolfram Sang wrote:
> 
> > >  static const struct i2c_algorithm at91_twi_algorithm = {
> > > -	.master_xfer	= at91_twi_xfer,
> > > +	.xfer	= at91_twi_xfer,
> > 
> > Seems you made this by a script, can you check the indentations afterwards?
> 
> Yes, I noticed as well. But other (not converted) drivers have issues
> there as well, so this will be a seperate patch.

The problem is that you add to a technical debt. We don't want that.
If you have not introduced a new indentation issue, it obviously is
not needed to be fixed in a separate patch. So, please consider this.

-- 
With Best Regards,
Andy Shevchenko


