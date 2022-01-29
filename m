Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 898944A2FE3
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 14:50:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmG1j2n0fz3cBK
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 00:50:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IhI3PyBl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IhI3PyBl; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmG1F73sHz3bTQ
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 00:50:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643464226; x=1675000226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qmU2oBNdDVA7ZCo3g+qvehePoifnt3O+PR6U0hOTzqg=;
 b=IhI3PyBlcavojfPe0vKfb5iEHys3JQhGK9sUS+uCokfaQmjxImm9mIY0
 0aQfXepdh/4Fzi1jFHSlsILTQ3FE96q4O2drviLRSavfERMqiv4n1vEHI
 VAnLN7OT18h2pVvvVYVYiEtqheSgTaGLQVxt5XyDRcVSp/9bJl59FmwKR
 qmrHuNKUh9sBcZhlRiHiDuPBgb6BfdujoX2MIqeAd8/zoN79N3+kgwf3q
 eE16/B9RYOsOyEfiGid5Dz323SBhH4IueT6Xx1RADF+awy/8RzUrx03tB
 0fO+d9E+0aabQ4E61lwSFRzuPsaU6oXKrlLg1aTDPJJFxaLWm5gxlI3eH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="227938502"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="227938502"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 05:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="564482966"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 29 Jan 2022 05:49:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDo6K-000PGi-0A; Sat, 29 Jan 2022 13:49:12 +0000
Date: Sat, 29 Jan 2022 21:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/9] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <202201292134.kcXZbWy4-lkp@intel.com>
References: <20220129115228.2257310-6-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129115228.2257310-6-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi "Jonathan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on robh/for-next linus/master v5.17-rc1 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jonathan-Neusch-fer/Nuvoton-WPCM450-pinctrl-and-GPIO-driver/20220129-195955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20220129/202201292134.kcXZbWy4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3fd91ea1bad905592e89c8f987f6bd3740329b80
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jonathan-Neusch-fer/Nuvoton-WPCM450-pinctrl-and-GPIO-driver/20220129-195955
        git checkout 3fd91ea1bad905592e89c8f987f6bd3740329b80
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=s390 SHELL=/bin/bash drivers/pinctrl/nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:555,
                    from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:68,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from arch/s390/include/asm/cmpxchg.h:11,
                    from arch/s390/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:5:
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function 'npcm7xx_get_groups_count':
>> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:28: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
    1564 |         dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups));
         |                            ^~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:9: note: in expansion of macro 'dev_dbg'
    1564 |         dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups));
         |         ^~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:42: note: format string is defined here
    1564 |         dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups));
         |                                         ~^
         |                                          |
         |                                          int
         |                                         %ld


vim +1564 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

3b588e43ee5c7a Tomer Maimon 2018-08-08  1559  
3b588e43ee5c7a Tomer Maimon 2018-08-08  1560  static int npcm7xx_get_groups_count(struct pinctrl_dev *pctldev)
3b588e43ee5c7a Tomer Maimon 2018-08-08  1561  {
3b588e43ee5c7a Tomer Maimon 2018-08-08  1562  	struct npcm7xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);
3b588e43ee5c7a Tomer Maimon 2018-08-08  1563  
3b588e43ee5c7a Tomer Maimon 2018-08-08 @1564  	dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups));
3b588e43ee5c7a Tomer Maimon 2018-08-08  1565  	return ARRAY_SIZE(npcm7xx_groups);
3b588e43ee5c7a Tomer Maimon 2018-08-08  1566  }
3b588e43ee5c7a Tomer Maimon 2018-08-08  1567  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
