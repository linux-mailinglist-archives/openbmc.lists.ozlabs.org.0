Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3769049E7
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2024 06:14:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjV6ZZhz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzXGy2ys3z3cT8
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2024 14:14:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjV6ZZhz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzXGQ5CCkz3cXB
	for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2024 14:13:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718165615; x=1749701615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e/rBT6UImx0hUN8k3KauxlxXxMRLEJaOaHDhUOQvQMg=;
  b=mjV6ZZhzufyK5O2fylOf7ubL4eOc2o4rlnch0XqY+js98efMjuOiZzsZ
   p3vUXB4SMK+J9zRV5Caa7O9ufd45+ofnHDUCL08btpfMWl5j/+QKKrPKs
   9ybNYqK6aAJkwAdowhFq9ERx1E5mxSWd+slsiG12xaeZh+JyMHzSlFOIG
   QXdhIbpeOM8cbd/LZ3payARbt/Rrkmdy26xXF3gg5GQwiT4HDKcQNUH0/
   S+QVUCWSwhnq16WCXGg0esdM6Sv9ZfTWr9oZ1d3HzkclGG8FXa1VXWICF
   SWHRHkgGNwqEbxLL6jvbZfRw3bgW0lVA1aqP4ztQe+R8M6XH+2BNygse4
   g==;
X-CSE-ConnectionGUID: 83tFzmFdSdyHHLBxwFvxeQ==
X-CSE-MsgGUID: LH+iIjJuTVitF63Z1ahh0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15036637"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="15036637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 21:13:30 -0700
X-CSE-ConnectionGUID: F7fXhmU1SI65vdY9zc4Dnw==
X-CSE-MsgGUID: 4lwvIdvLSm6UdbsbxXSi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="39513592"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2024 21:13:26 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHFMR-0001Bk-36;
	Wed, 12 Jun 2024 04:13:23 +0000
Date: Wed, 12 Jun 2024 12:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 4/4] pinctrl: nuvoton: Reduce use of OF-specific APIs
Message-ID: <202406121152.f2DLL871-lkp@intel.com>
References: <20240611093127.90210-5-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611093127.90210-5-andy.shevchenko@gmail.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, oe-kbuild-all@lists.linux.dev, Shan-Chun Hung <schung@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next next-20240611]
[cannot apply to linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-nuvoton-Convert-to-use-struct-pingroup-and-PINCTRL_PINGROUP/20240611-173545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240611093127.90210-5-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 4/4] pinctrl: nuvoton: Reduce use of OF-specific APIs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240612/202406121152.f2DLL871-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121152.f2DLL871-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121152.f2DLL871-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function 'npcm7xx_gpio_of':
>> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1833:25: warning: unused variable 'res' [-Wunused-variable]
    1833 |         struct resource res;
         |                         ^~~


vim +/res +1833 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

3b588e43ee5c7a Tomer Maimon        2018-08-08  1829  
3b588e43ee5c7a Tomer Maimon        2018-08-08  1830  static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
3b588e43ee5c7a Tomer Maimon        2018-08-08  1831  {
3b588e43ee5c7a Tomer Maimon        2018-08-08  1832  	int ret = -ENXIO;
3b588e43ee5c7a Tomer Maimon        2018-08-08 @1833  	struct resource res;
0173ce55e50800 Andy Shevchenko     2022-04-01  1834  	struct device *dev = pctrl->dev;
0173ce55e50800 Andy Shevchenko     2022-04-01  1835  	struct fwnode_reference_args args;
0173ce55e50800 Andy Shevchenko     2022-04-01  1836  	struct fwnode_handle *child;
0173ce55e50800 Andy Shevchenko     2022-04-01  1837  	int id = 0;
0173ce55e50800 Andy Shevchenko     2022-04-01  1838  
0173ce55e50800 Andy Shevchenko     2022-04-01  1839  	for_each_gpiochip_node(dev, child) {
7123707f39ae24 Andy Shevchenko     2024-06-11  1840  		pctrl->gpio_bank[id].base = fwnode_iomap(child, 0);
ad64639417161e Jiasheng Jiang      2023-06-07  1841  		if (!pctrl->gpio_bank[id].base)
ad64639417161e Jiasheng Jiang      2023-06-07  1842  			return -EINVAL;
3b588e43ee5c7a Tomer Maimon        2018-08-08  1843  
0173ce55e50800 Andy Shevchenko     2022-04-01  1844  		ret = bgpio_init(&pctrl->gpio_bank[id].gc, dev, 4,
0173ce55e50800 Andy Shevchenko     2022-04-01  1845  				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
0173ce55e50800 Andy Shevchenko     2022-04-01  1846  				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DOUT,
3b588e43ee5c7a Tomer Maimon        2018-08-08  1847  				 NULL,
3b588e43ee5c7a Tomer Maimon        2018-08-08  1848  				 NULL,
0173ce55e50800 Andy Shevchenko     2022-04-01  1849  				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_IEM,
3b588e43ee5c7a Tomer Maimon        2018-08-08  1850  				 BGPIOF_READ_OUTPUT_REG_SET);
3b588e43ee5c7a Tomer Maimon        2018-08-08  1851  		if (ret) {
0173ce55e50800 Andy Shevchenko     2022-04-01  1852  			dev_err(dev, "bgpio_init() failed\n");
3b588e43ee5c7a Tomer Maimon        2018-08-08  1853  			return ret;
3b588e43ee5c7a Tomer Maimon        2018-08-08  1854  		}
3b588e43ee5c7a Tomer Maimon        2018-08-08  1855  
0173ce55e50800 Andy Shevchenko     2022-04-01  1856  		ret = fwnode_property_get_reference_args(child, "gpio-ranges", NULL, 3, 0, &args);
3b588e43ee5c7a Tomer Maimon        2018-08-08  1857  		if (ret < 0) {
0173ce55e50800 Andy Shevchenko     2022-04-01  1858  			dev_err(dev, "gpio-ranges fail for GPIO bank %u\n", id);
3b588e43ee5c7a Tomer Maimon        2018-08-08  1859  			return ret;
3b588e43ee5c7a Tomer Maimon        2018-08-08  1860  		}
3b588e43ee5c7a Tomer Maimon        2018-08-08  1861  
7123707f39ae24 Andy Shevchenko     2024-06-11  1862  		ret = fwnode_irq_get(child, 0);
e804944dcc7799 Krzysztof Kozlowski 2022-04-23  1863  		if (!ret) {
0173ce55e50800 Andy Shevchenko     2022-04-01  1864  			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
e804944dcc7799 Krzysztof Kozlowski 2022-04-23  1865  			return -EINVAL;
0173ce55e50800 Andy Shevchenko     2022-04-01  1866  		}
0173ce55e50800 Andy Shevchenko     2022-04-01  1867  		pctrl->gpio_bank[id].irq = ret;
0173ce55e50800 Andy Shevchenko     2022-04-01  1868  		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
0173ce55e50800 Andy Shevchenko     2022-04-01  1869  		pctrl->gpio_bank[id].pinctrl_id = args.args[0];
0173ce55e50800 Andy Shevchenko     2022-04-01  1870  		pctrl->gpio_bank[id].gc.base = args.args[1];
0173ce55e50800 Andy Shevchenko     2022-04-01  1871  		pctrl->gpio_bank[id].gc.ngpio = args.args[2];
3b588e43ee5c7a Tomer Maimon        2018-08-08  1872  		pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
0173ce55e50800 Andy Shevchenko     2022-04-01  1873  		pctrl->gpio_bank[id].gc.parent = dev;
0173ce55e50800 Andy Shevchenko     2022-04-01  1874  		pctrl->gpio_bank[id].gc.fwnode = child;
0173ce55e50800 Andy Shevchenko     2022-04-01  1875  		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
4be1eaf322f07b Nicholas Mc Guire   2018-11-23  1876  		if (pctrl->gpio_bank[id].gc.label == NULL)
4be1eaf322f07b Nicholas Mc Guire   2018-11-23  1877  			return -ENOMEM;
4be1eaf322f07b Nicholas Mc Guire   2018-11-23  1878  
3b588e43ee5c7a Tomer Maimon        2018-08-08  1879  		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
0173ce55e50800 Andy Shevchenko     2022-04-01  1880  		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
0173ce55e50800 Andy Shevchenko     2022-04-01  1881  		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
0173ce55e50800 Andy Shevchenko     2022-04-01  1882  		pctrl->gpio_bank[id].direction_output = pctrl->gpio_bank[id].gc.direction_output;
0173ce55e50800 Andy Shevchenko     2022-04-01  1883  		pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
0173ce55e50800 Andy Shevchenko     2022-04-01  1884  		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
3b588e43ee5c7a Tomer Maimon        2018-08-08  1885  		pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
de38bdbe011b31 Bartosz Golaszewski 2023-10-13  1886  		pctrl->gpio_bank[id].gc.free = pinctrl_gpio_free;
3b588e43ee5c7a Tomer Maimon        2018-08-08  1887  		id++;
3b588e43ee5c7a Tomer Maimon        2018-08-08  1888  	}
3b588e43ee5c7a Tomer Maimon        2018-08-08  1889  
3b588e43ee5c7a Tomer Maimon        2018-08-08  1890  	pctrl->bank_num = id;
3b588e43ee5c7a Tomer Maimon        2018-08-08  1891  	return ret;
3b588e43ee5c7a Tomer Maimon        2018-08-08  1892  }
3b588e43ee5c7a Tomer Maimon        2018-08-08  1893  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
