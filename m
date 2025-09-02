Return-Path: <openbmc+bounces-558-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340EB3FC45
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 12:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGMM75ffTz2xQ5;
	Tue,  2 Sep 2025 20:25:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756808723;
	cv=none; b=YtsyMgadFXFz/d09iKwYdxPnendk70UXs+xOPU3oZIOveiRK6k7F1RddvSJTXP9Ce3yA3ZXrSW4kA+9dlRICjMLjBbz9lrcG/WMfQtDrEGu7YG8clphyhV5kPOXVXnX3uy3wJ8IdIN6ruk490X9mI04NbHxM+UQhWL4dbERpuNPaEcPGCw7J1IvkGvgg2s0yuWOdjLpuUgtnxuPdegvB/55FF5BdyBIwb2Ud524zxC37IgLhprc9WgWCAK1yyMi2UJD8CKi2UmlJpy01p357E7ehpD9E81MpRirqFNmyAu1qtmcEBlQlAFnKVT1Zqk2OckD+5ewshHSAu1MySsnJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756808723; c=relaxed/relaxed;
	bh=QXvHvuIpbygo+XU6oPOlwA7ILTmDuLEiz6X58UM8bJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN90/DGxXuwEJ82pwJ5oaA2I/XuMLiSvA9ia6K1g2w2lXBfYb9TyBdmkatFtgYN7fhCdwcqWEEywO1oo6oOaCf5vDSQ1QQ9e5U56pmA1yxhFi5BNhseqG5QlWvV8WI15Kp0MtNShJyHOPVGxfFxFnKDOMzsIteDB43IGoIfo11hyq6EvwnPcnXUEu2hWxHROkLoiIFqiV+uS9n3KxFD/B/0B8IjgaN8czCjsRRlKy3FgOnOgR+Oc8DByM2kpQh3e3/FzXoV2VjzIo9gWv8RaBAcss1Lt/fh82eRlVQ3jTNwhgTG7t6QJsv8/mTE8jSs18OD/a0WQeUU9/WonwoH1eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eLG5c2Xi; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eLG5c2Xi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 02 Sep 2025 20:25:21 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGMM51vZRz2xQ0;
	Tue,  2 Sep 2025 20:25:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756808722; x=1788344722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v5NDjFO8lUrsXYBoNk20x/0jTMsSJewfLyzSWN2NvCQ=;
  b=eLG5c2XiOItou4coPTStWRY36rvccGTvRwxawAqJEvJwup516TVywF4X
   pAWW+TsdzunhIShrEi/RbcwV14fcZGTMeAN+NPnVSCnM8wnVADLYo/Ff0
   pE1b1Rj0hFRHJlLhHPOK/k4QsTCiLBlqyhjER39dqZHoxVXkX87ICyFBO
   ylHA2hISrbPH3xzd44V16FCSIOT9kSCuoG0y8qS+iS/ZFsHh6bgdPqsB2
   Ag2JX2peWnPWrzSEO37szMXzV+OFnBAZ/2AXM6HzpsxHK/BprIHU1fA6G
   noMgGnO9rp6lEdfdm7aWL8fUDZbpM/rf/UryY2Hu6rtVlCZ+mZMvUF9Tz
   w==;
X-CSE-ConnectionGUID: etJAyd4dR8OrduV1SDeLlQ==
X-CSE-MsgGUID: 3Nue6E1SQqK/vEpnKMFeRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="62719603"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62719603"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:24:12 -0700
X-CSE-ConnectionGUID: I6HlhqjdSHGTNm9QxC555Q==
X-CSE-MsgGUID: qaZkQZ/4QvmaUvY93+nUTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176556266"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2025 03:24:06 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utOBI-0001pP-0p;
	Tue, 02 Sep 2025 10:24:04 +0000
Date: Tue, 2 Sep 2025 18:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jacky_chou@aspeedtech.com
Subject: Re: [PATCH v3 07/10] PHY: aspeed: Add ASPEED PCIe PHY driver
Message-ID: <202509021806.1NtrcLpF-lkp@intel.com>
References: <20250901055922.1553550-8-jacky_chou@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901055922.1553550-8-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jacky,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/for-linus]
[also build test ERROR on robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.17-rc4 next-20250902]
[cannot apply to pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-soc-aspeed-Add-ASPEED-PCIe-Config/20250901-140231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20250901055922.1553550-8-jacky_chou%40aspeedtech.com
patch subject: [PATCH v3 07/10] PHY: aspeed: Add ASPEED PCIe PHY driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250902/202509021806.1NtrcLpF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021806.1NtrcLpF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021806.1NtrcLpF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/aspeed/phy-aspeed-pcie.c:14:
>> drivers/phy/aspeed/phy-aspeed-pcie.c:195:25: error: 'aspeed_pcie_of_match_table' undeclared here (not in a function); did you mean 'aspeed_pcie_phy_of_match_table'?
     195 | MODULE_DEVICE_TABLE(of, aspeed_pcie_of_match_table);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:250:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     250 | static typeof(name) __mod_device_table__##type##__##name                \
         |               ^~~~
>> include/linux/module.h:250:21: error: '__mod_device_table__of__aspeed_pcie_of_match_table' aliased to undefined symbol 'aspeed_pcie_of_match_table'
     250 | static typeof(name) __mod_device_table__##type##__##name                \
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/phy/aspeed/phy-aspeed-pcie.c:195:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     195 | MODULE_DEVICE_TABLE(of, aspeed_pcie_of_match_table);
         | ^~~~~~~~~~~~~~~~~~~
--
   In file included from phy-aspeed-pcie.c:14:
   phy-aspeed-pcie.c:195:25: error: 'aspeed_pcie_of_match_table' undeclared here (not in a function); did you mean 'aspeed_pcie_phy_of_match_table'?
     195 | MODULE_DEVICE_TABLE(of, aspeed_pcie_of_match_table);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:250:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     250 | static typeof(name) __mod_device_table__##type##__##name                \
         |               ^~~~
>> include/linux/module.h:250:21: error: '__mod_device_table__of__aspeed_pcie_of_match_table' aliased to undefined symbol 'aspeed_pcie_of_match_table'
     250 | static typeof(name) __mod_device_table__##type##__##name                \
         |                     ^~~~~~~~~~~~~~~~~~~~
   phy-aspeed-pcie.c:195:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     195 | MODULE_DEVICE_TABLE(of, aspeed_pcie_of_match_table);
         | ^~~~~~~~~~~~~~~~~~~


vim +195 drivers/phy/aspeed/phy-aspeed-pcie.c

   183	
   184	static const struct of_device_id aspeed_pcie_phy_of_match_table[] = {
   185		{
   186			.compatible = "aspeed,ast2600-pcie-phy",
   187			.data = &pcie_phy_ast2600,
   188		},
   189		{
   190			.compatible = "aspeed,ast2700-pcie-phy",
   191			.data = &pcie_phy_ast2700,
   192		},
   193		{ },
   194	};
 > 195	MODULE_DEVICE_TABLE(of, aspeed_pcie_of_match_table);
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

