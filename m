Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C99754A2FFE
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 15:11:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmGTs3qJ2z3bcC
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 01:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FoJk1244;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FoJk1244; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmGTS3KqYz30LP
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 01:11:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643465484; x=1675001484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VFcCHcnZzHGge7LC66GRjpuVC7vd/ne1/nu/vMIi1JY=;
 b=FoJk1244ovRgwuR+4FfqUAiB9K5tQISB7Uh1zsT7nRKXolTf7VkJ1WFw
 rxegY1lZD6FGuaDOibeeJHGIXYf7+u3dZWdTen3WR58IvTeEDawOOdO0w
 elCASPM5/qMcE9O5g0BP3r9BrDgiP1vlPQDQiBXdcEz1liXeDdsIra+Ko
 NxMQ6t74pMpK1mAP3Q7CmLGxl91BH6a8NHMc9w6+YMLnuCdu8++vEHwnu
 Rmbwg7RnS69rlrnw6QLZ2LKT+borqvN0HqzM3mrrkyhviKGj7rGVW3Uaf
 1R/iA4mGMUU3gfIx/k14QSxKQsbq0d43HlUdax/jX5KwxMadSry2MyoWG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="247493911"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="247493911"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 06:10:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="675344441"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2022 06:10:13 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDoQe-000PHv-Tv; Sat, 29 Jan 2022 14:10:12 +0000
Date: Sat, 29 Jan 2022 22:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/9] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <202201292234.NpSNe4TD-lkp@intel.com>
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
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20220129/202201292234.NpSNe4TD-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/3fd91ea1bad905592e89c8f987f6bd3740329b80
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jonathan-Neusch-fer/Nuvoton-WPCM450-pinctrl-and-GPIO-driver/20220129-195955
        git checkout 3fd91ea1bad905592e89c8f987f6bd3740329b80
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash drivers/pinctrl/nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:908: warning: "DS" redefined
     908 | #define DS(lo, hi) (((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
         | 
   In file included from arch/x86/um/shared/sysdep/ptrace.h:44,
                    from arch/um/include/asm/ptrace-generic.h:11,
                    from arch/x86/um/asm/ptrace.h:9,
                    from arch/um/include/asm/processor-generic.h:13,
                    from arch/x86/um/asm/processor.h:41,
                    from include/linux/rcupdate.h:30,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:5:
   arch/x86/um/shared/sysdep/ptrace_64.h:38: note: this is the location of the previous definition
      38 | #define DS (HOST_DS * sizeof(long))
         | 
   In file included from include/linux/printk.h:555,
                    from include/asm-generic/bug.h:22,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/um/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:5:
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function 'npcm7xx_get_groups_count':
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:21: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
    1564 |  dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups));
         |                     ^~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: in definition of macro '__dynamic_func_call'
     134 |   func(&id, ##__VA_ARGS__);  \
         |               ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:2: note: in expansion of macro '_dynamic_func_call'
     166 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: in expansion of macro 'dynamic_dev_dbg'
     155 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:23: note: in expansion of macro 'dev_fmt'
     155 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                       ^~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:2: note: in expansion of macro 'dev_dbg'
    1564 |  dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups));
         |  ^~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:35: note: format string is defined here
    1564 |  dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups));
         |                                  ~^
         |                                   |
         |                                   int
         |                                  %ld


vim +/DS +908 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

3b588e43ee5c7ad Tomer Maimon 2018-08-08  907  
3b588e43ee5c7ad Tomer Maimon 2018-08-08 @908  #define DS(lo, hi)	(((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
3b588e43ee5c7ad Tomer Maimon 2018-08-08  909  			 ((hi) << DRIVE_STRENGTH_HI_SHIFT))
3b588e43ee5c7ad Tomer Maimon 2018-08-08  910  #define DSLO(x)		(((x) >> DRIVE_STRENGTH_LO_SHIFT) & 0xF)
3b588e43ee5c7ad Tomer Maimon 2018-08-08  911  #define DSHI(x)		(((x) >> DRIVE_STRENGTH_HI_SHIFT) & 0xF)
3b588e43ee5c7ad Tomer Maimon 2018-08-08  912  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
