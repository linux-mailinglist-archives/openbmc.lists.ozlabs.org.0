Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F59046AA
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2024 00:02:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FDntKOMJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzN2f1TlVz3c9r
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2024 08:02:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FDntKOMJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzN236C51z2ykt
	for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2024 08:02:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718143340; x=1749679340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VCkLZ01qOLE/saYjvRrwh7cmZYLpNQtFPwMS6/R0+hs=;
  b=FDntKOMJT3qpdSrfNYMvYB/8BErYAsJrXLB+YBOFAwsgJMuiETMZo/ZI
   Dv3JCPhyG8mMHlLvVirxiLG/ZeOs6IZMfRsEr+aV9yTg+1NnOT277c/Ac
   A9OuxFpg1yl6S/Com359NcW7IyhKAZo1CrRFcwQq9zNLvJN5lMLQyt3dP
   j4oSy4r4tCkLhOR0MGxPpgG/mNnnJmbTxOaWAxdYU+ZSk0ty1X7FXKvMj
   IJCVdQbPliCrMmOmR+iQNysjqZ7IxOeU8+VSAq1p4TZfPtHz/pH8DJDoM
   AegWctFZu3IlvZcfVKS/2mPmQb57tmxhPiKT/g5XJICU7WUDto/+wuhcp
   w==;
X-CSE-ConnectionGUID: tMIOyHPqTz+wJEG2pxDaAw==
X-CSE-MsgGUID: tD/OTU3hTJ69cojaorn0lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18715906"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="18715906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 15:02:13 -0700
X-CSE-ConnectionGUID: GbQSit22SReXVL13gzWa8g==
X-CSE-MsgGUID: AEPqZNkDQPiA2C8YR3rH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="44121748"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2024 15:02:10 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH9Z9-0000wk-20;
	Tue, 11 Jun 2024 22:02:07 +0000
Date: Wed, 12 Jun 2024 06:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 3/4] pinctrl: nuvoton: Convert to use struct group_desc
Message-ID: <202406120534.9nmyKZwv-lkp@intel.com>
References: <20240611093127.90210-4-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611093127.90210-4-andy.shevchenko@gmail.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, llvm@lists.linux.dev, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, oe-kbuild-all@lists.linux.dev, Shan-Chun Hung <schung@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next next-20240611]
[cannot apply to linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-nuvoton-Convert-to-use-struct-pingroup-and-PINCTRL_PINGROUP/20240611-173545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240611093127.90210-4-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 3/4] pinctrl: nuvoton: Convert to use struct group_desc
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240612/202406120534.9nmyKZwv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120534.9nmyKZwv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120534.9nmyKZwv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pinctrl/nuvoton/pinctrl-ma35.c:13:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pinctrl/nuvoton/pinctrl-ma35.c:13:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pinctrl/nuvoton/pinctrl-ma35.c:13:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/pinctrl/nuvoton/pinctrl-ma35.c:228:23: error: no member named 'npins' in 'struct group_desc'
     228 |         for (i = 0; i < grp->npins; i++) {
         |                         ~~~  ^
   drivers/pinctrl/nuvoton/pinctrl-ma35.c:287:23: error: no member named 'npins' in 'struct group_desc'
     287 |         for (i = 0; i < grp->npins; i++) {
         |                         ~~~  ^
   6 warnings and 2 errors generated.


vim +228 drivers/pinctrl/nuvoton/pinctrl-ma35.c

ecc5bf86867344 Jacky Huang     2024-05-21  184  
ecc5bf86867344 Jacky Huang     2024-05-21  185  static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
ecc5bf86867344 Jacky Huang     2024-05-21  186  					    struct device_node *np,
ecc5bf86867344 Jacky Huang     2024-05-21  187  					    struct pinctrl_map **map,
ecc5bf86867344 Jacky Huang     2024-05-21  188  					    unsigned int *num_maps)
ecc5bf86867344 Jacky Huang     2024-05-21  189  {
ecc5bf86867344 Jacky Huang     2024-05-21  190  	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
888aa25ee6ce72 Andy Shevchenko 2024-06-11  191  	struct ma35_pin_setting *setting;
ecc5bf86867344 Jacky Huang     2024-05-21  192  	struct pinctrl_map *new_map;
ecc5bf86867344 Jacky Huang     2024-05-21  193  	struct device_node *parent;
888aa25ee6ce72 Andy Shevchenko 2024-06-11  194  	struct group_desc *grp;
ecc5bf86867344 Jacky Huang     2024-05-21  195  	int map_num = 1;
ecc5bf86867344 Jacky Huang     2024-05-21  196  	int i;
ecc5bf86867344 Jacky Huang     2024-05-21  197  
ecc5bf86867344 Jacky Huang     2024-05-21  198  	/*
ecc5bf86867344 Jacky Huang     2024-05-21  199  	 * first find the group of this node and check if we need create
ecc5bf86867344 Jacky Huang     2024-05-21  200  	 * config maps for pins
ecc5bf86867344 Jacky Huang     2024-05-21  201  	 */
ecc5bf86867344 Jacky Huang     2024-05-21  202  	grp = ma35_pinctrl_find_group_by_name(npctl, np->name);
ecc5bf86867344 Jacky Huang     2024-05-21  203  	if (!grp) {
ecc5bf86867344 Jacky Huang     2024-05-21  204  		dev_err(npctl->dev, "unable to find group for node %s\n", np->name);
ecc5bf86867344 Jacky Huang     2024-05-21  205  		return -EINVAL;
ecc5bf86867344 Jacky Huang     2024-05-21  206  	}
ecc5bf86867344 Jacky Huang     2024-05-21  207  
888aa25ee6ce72 Andy Shevchenko 2024-06-11  208  	map_num += grp->grp.npins;
ecc5bf86867344 Jacky Huang     2024-05-21  209  	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map), GFP_KERNEL);
ecc5bf86867344 Jacky Huang     2024-05-21  210  	if (!new_map)
ecc5bf86867344 Jacky Huang     2024-05-21  211  		return -ENOMEM;
ecc5bf86867344 Jacky Huang     2024-05-21  212  
ecc5bf86867344 Jacky Huang     2024-05-21  213  	*map = new_map;
ecc5bf86867344 Jacky Huang     2024-05-21  214  	*num_maps = map_num;
ecc5bf86867344 Jacky Huang     2024-05-21  215  	/* create mux map */
ecc5bf86867344 Jacky Huang     2024-05-21  216  	parent = of_get_parent(np);
ecc5bf86867344 Jacky Huang     2024-05-21  217  	if (!parent)
ecc5bf86867344 Jacky Huang     2024-05-21  218  		return -EINVAL;
ecc5bf86867344 Jacky Huang     2024-05-21  219  
888aa25ee6ce72 Andy Shevchenko 2024-06-11  220  	setting = grp->data;
888aa25ee6ce72 Andy Shevchenko 2024-06-11  221  
ecc5bf86867344 Jacky Huang     2024-05-21  222  	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
ecc5bf86867344 Jacky Huang     2024-05-21  223  	new_map[0].data.mux.function = parent->name;
ecc5bf86867344 Jacky Huang     2024-05-21  224  	new_map[0].data.mux.group = np->name;
ecc5bf86867344 Jacky Huang     2024-05-21  225  	of_node_put(parent);
ecc5bf86867344 Jacky Huang     2024-05-21  226  
ecc5bf86867344 Jacky Huang     2024-05-21  227  	new_map++;
ecc5bf86867344 Jacky Huang     2024-05-21 @228  	for (i = 0; i < grp->npins; i++) {
ecc5bf86867344 Jacky Huang     2024-05-21  229  		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
888aa25ee6ce72 Andy Shevchenko 2024-06-11  230  		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->grp.pins[i]);
888aa25ee6ce72 Andy Shevchenko 2024-06-11  231  		new_map[i].data.configs.configs = setting[i].configs;
888aa25ee6ce72 Andy Shevchenko 2024-06-11  232  		new_map[i].data.configs.num_configs = setting[i].nconfigs;
ecc5bf86867344 Jacky Huang     2024-05-21  233  	}
ecc5bf86867344 Jacky Huang     2024-05-21  234  	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
ecc5bf86867344 Jacky Huang     2024-05-21  235  		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
ecc5bf86867344 Jacky Huang     2024-05-21  236  
ecc5bf86867344 Jacky Huang     2024-05-21  237  	return 0;
ecc5bf86867344 Jacky Huang     2024-05-21  238  }
ecc5bf86867344 Jacky Huang     2024-05-21  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
