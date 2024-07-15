Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65242931B01
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 21:28:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cr00aHGK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNC0z2J83z3d9s
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 05:28:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cr00aHGK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNBzd4K7Sz3cZ1
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 05:27:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721071646; x=1752607646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=scvD8E1Th0WQEDOblbw8afBg6ubsAWbPK3/2sSh0+fU=;
  b=Cr00aHGKlljy+NxXIxty1Ll7yEnIBLbrkE8yNYsWY9ZrGf42dn7knXwW
   IMHSqS2D90gDq5eFgE/S2mQo/8cy9g/DdYR0QacYYOTuu3P1pjMpzpXq3
   mKG5qJvmroVuy2JVbzpR6eEZrXsObvnrcEwXCjqMG9dSedx8Wxw6EsArE
   /oMsQCpYtF/Qlf2aEYPUFdVXOxZ/3fV+JxTaJvwdjiPPIK8Dv5LFOXYap
   3Rzn7WKtLHBCFvWEa7Y0/3iZB8U1eVpWRlR+8tqs+v5z0q0uIU5YUfs3p
   UjlWt3a8jlLWkiPo0IWp3USBGEumtF/tsff9IIVWvmRO684fqVpwmkZnq
   Q==;
X-CSE-ConnectionGUID: 7V4wEwyBQjutdAcbWp7FOQ==
X-CSE-MsgGUID: ZiavoUBeS+m0Zp6ydrjbSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18342896"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18342896"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 12:27:19 -0700
X-CSE-ConnectionGUID: 2Tdnb+rbRk+Wk2mkoCoccg==
X-CSE-MsgGUID: 1KBBHSXLTp670BMn/kdLJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="72960660"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jul 2024 12:27:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTRLt-000eWK-35;
	Mon, 15 Jul 2024 19:27:13 +0000
Date: Tue, 16 Jul 2024 03:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v12 4/6] clk: wpcm450: Add Nuvoton WPCM450
 clock/reset controller driver
Message-ID: <202407160235.JYThNv91-lkp@intel.com>
References: <20240708-wpcm-clk-v12-4-1afac539c37d@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-wpcm-clk-v12-4-1afac539c37d@gmx.net>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Neusch-fer/dt-bindings-clock-Add-Nuvoton-WPCM450-clock-reset-controller/20240708-073926
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/20240708-wpcm-clk-v12-4-1afac539c37d%40gmx.net
patch subject: [PATCH RESEND v12 4/6] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
config: arm-randconfig-r064-20240715 (https://download.01.org/0day-ci/archive/20240716/202407160235.JYThNv91-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407160235.JYThNv91-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/nuvoton/clk-wpcm450.c:55:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +55 drivers/clk/nuvoton/clk-wpcm450.c

    36	
    37	static unsigned long wpcm450_clk_pll_recalc_rate(struct clk_hw *hw,
    38							 unsigned long parent_rate)
    39	{
    40		struct wpcm450_clk_pll *pll = to_wpcm450_clk_pll(hw);
    41		unsigned long fbdv, indv, otdv;
    42		u64 rate;
    43		u32 pllcon;
    44	
    45		if (parent_rate == 0)
    46			return 0;
    47	
    48		pllcon = readl_relaxed(pll->pllcon);
    49	
    50		indv = FIELD_GET(PLLCON_INDV, pllcon) + 1;
    51		fbdv = FIELD_GET(PLLCON_FBDV, pllcon) + 1;
    52		otdv = FIELD_GET(PLLCON_OTDV, pllcon) + 1;
    53	
    54		rate = (u64)parent_rate * fbdv;
  > 55		do_div(rate, indv * otdv);
    56	
    57		return rate;
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
