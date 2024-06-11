Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EAE9047CC
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2024 01:51:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=heMuMofA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzQSQ4q5xz3fp3
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2024 09:51:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=heMuMofA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzQRs4pZkz3cV5
	for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2024 09:51:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718149882; x=1749685882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5HF9pCAb1MxL3/sRkayKVqQ8cZbn1NxPJY35SVtgI4=;
  b=heMuMofAZLngtpDUkJHTM3n28LVwAiivwIAV0NjeSleu9jg25lP0pk+M
   Kc1WvZFJZp52bfFaoGtg0gk3uVK35u3BWRKPH+wJgTGsNM0qguktAEsaT
   BNCsLK3DQ3YFv8fp7cOSsRLpXJuhfjwfrygNQSMjYfCUbDWLDbS3/akjF
   7KvuGk+LNKFg/2Zx4RUoQU3xbNK/ZetBuJn/U8qsrUgrv1o+fQ+Ru+AOs
   xuVz+hU+aoeIVk0oDgtEjw7ksUjjICJeshFH8Cdn8Um16t8reo4vTdnn6
   4LQ2jNd4OndTsQER76dSmGb5V1ose3y8l6PxGNe5o4wmGcgmu8MSAunCx
   A==;
X-CSE-ConnectionGUID: PX9gGctyRl6HyMm7lwOLUA==
X-CSE-MsgGUID: uK2o64r5SkyVBCS5T+OfbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26300189"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="26300189"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 16:51:16 -0700
X-CSE-ConnectionGUID: t3vXGlLRTp6SS2YhtonFYQ==
X-CSE-MsgGUID: y6oi2X4YTtKRLW6afWeRQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39714356"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2024 16:51:13 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHBGg-00010I-1u;
	Tue, 11 Jun 2024 23:51:10 +0000
Date: Wed, 12 Jun 2024 07:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 3/4] pinctrl: nuvoton: Convert to use struct group_desc
Message-ID: <202406120754.BLemVAqf-lkp@intel.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, oe-kbuild-all@lists.linux.dev, Shan-Chun Hung <schung@nuvoton.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240612/202406120754.BLemVAqf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120754.BLemVAqf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120754.BLemVAqf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/nuvoton/pinctrl-ma35.c: In function 'ma35_pinctrl_dt_node_to_map_func':
>> drivers/pinctrl/nuvoton/pinctrl-ma35.c:228:28: error: 'struct group_desc' has no member named 'npins'
     228 |         for (i = 0; i < grp->npins; i++) {
         |                            ^~
   drivers/pinctrl/nuvoton/pinctrl-ma35.c: In function 'ma35_pinmux_set_mux':
   drivers/pinctrl/nuvoton/pinctrl-ma35.c:287:28: error: 'struct group_desc' has no member named 'npins'
     287 |         for (i = 0; i < grp->npins; i++) {
         |                            ^~


vim +228 drivers/pinctrl/nuvoton/pinctrl-ma35.c

ecc5bf868673446 Jacky Huang     2024-05-21  184  
ecc5bf868673446 Jacky Huang     2024-05-21  185  static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
ecc5bf868673446 Jacky Huang     2024-05-21  186  					    struct device_node *np,
ecc5bf868673446 Jacky Huang     2024-05-21  187  					    struct pinctrl_map **map,
ecc5bf868673446 Jacky Huang     2024-05-21  188  					    unsigned int *num_maps)
ecc5bf868673446 Jacky Huang     2024-05-21  189  {
ecc5bf868673446 Jacky Huang     2024-05-21  190  	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
888aa25ee6ce72d Andy Shevchenko 2024-06-11  191  	struct ma35_pin_setting *setting;
ecc5bf868673446 Jacky Huang     2024-05-21  192  	struct pinctrl_map *new_map;
ecc5bf868673446 Jacky Huang     2024-05-21  193  	struct device_node *parent;
888aa25ee6ce72d Andy Shevchenko 2024-06-11  194  	struct group_desc *grp;
ecc5bf868673446 Jacky Huang     2024-05-21  195  	int map_num = 1;
ecc5bf868673446 Jacky Huang     2024-05-21  196  	int i;
ecc5bf868673446 Jacky Huang     2024-05-21  197  
ecc5bf868673446 Jacky Huang     2024-05-21  198  	/*
ecc5bf868673446 Jacky Huang     2024-05-21  199  	 * first find the group of this node and check if we need create
ecc5bf868673446 Jacky Huang     2024-05-21  200  	 * config maps for pins
ecc5bf868673446 Jacky Huang     2024-05-21  201  	 */
ecc5bf868673446 Jacky Huang     2024-05-21  202  	grp = ma35_pinctrl_find_group_by_name(npctl, np->name);
ecc5bf868673446 Jacky Huang     2024-05-21  203  	if (!grp) {
ecc5bf868673446 Jacky Huang     2024-05-21  204  		dev_err(npctl->dev, "unable to find group for node %s\n", np->name);
ecc5bf868673446 Jacky Huang     2024-05-21  205  		return -EINVAL;
ecc5bf868673446 Jacky Huang     2024-05-21  206  	}
ecc5bf868673446 Jacky Huang     2024-05-21  207  
888aa25ee6ce72d Andy Shevchenko 2024-06-11  208  	map_num += grp->grp.npins;
ecc5bf868673446 Jacky Huang     2024-05-21  209  	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map), GFP_KERNEL);
ecc5bf868673446 Jacky Huang     2024-05-21  210  	if (!new_map)
ecc5bf868673446 Jacky Huang     2024-05-21  211  		return -ENOMEM;
ecc5bf868673446 Jacky Huang     2024-05-21  212  
ecc5bf868673446 Jacky Huang     2024-05-21  213  	*map = new_map;
ecc5bf868673446 Jacky Huang     2024-05-21  214  	*num_maps = map_num;
ecc5bf868673446 Jacky Huang     2024-05-21  215  	/* create mux map */
ecc5bf868673446 Jacky Huang     2024-05-21  216  	parent = of_get_parent(np);
ecc5bf868673446 Jacky Huang     2024-05-21  217  	if (!parent)
ecc5bf868673446 Jacky Huang     2024-05-21  218  		return -EINVAL;
ecc5bf868673446 Jacky Huang     2024-05-21  219  
888aa25ee6ce72d Andy Shevchenko 2024-06-11  220  	setting = grp->data;
888aa25ee6ce72d Andy Shevchenko 2024-06-11  221  
ecc5bf868673446 Jacky Huang     2024-05-21  222  	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
ecc5bf868673446 Jacky Huang     2024-05-21  223  	new_map[0].data.mux.function = parent->name;
ecc5bf868673446 Jacky Huang     2024-05-21  224  	new_map[0].data.mux.group = np->name;
ecc5bf868673446 Jacky Huang     2024-05-21  225  	of_node_put(parent);
ecc5bf868673446 Jacky Huang     2024-05-21  226  
ecc5bf868673446 Jacky Huang     2024-05-21  227  	new_map++;
ecc5bf868673446 Jacky Huang     2024-05-21 @228  	for (i = 0; i < grp->npins; i++) {
ecc5bf868673446 Jacky Huang     2024-05-21  229  		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
888aa25ee6ce72d Andy Shevchenko 2024-06-11  230  		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->grp.pins[i]);
888aa25ee6ce72d Andy Shevchenko 2024-06-11  231  		new_map[i].data.configs.configs = setting[i].configs;
888aa25ee6ce72d Andy Shevchenko 2024-06-11  232  		new_map[i].data.configs.num_configs = setting[i].nconfigs;
ecc5bf868673446 Jacky Huang     2024-05-21  233  	}
ecc5bf868673446 Jacky Huang     2024-05-21  234  	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
ecc5bf868673446 Jacky Huang     2024-05-21  235  		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
ecc5bf868673446 Jacky Huang     2024-05-21  236  
ecc5bf868673446 Jacky Huang     2024-05-21  237  	return 0;
ecc5bf868673446 Jacky Huang     2024-05-21  238  }
ecc5bf868673446 Jacky Huang     2024-05-21  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
