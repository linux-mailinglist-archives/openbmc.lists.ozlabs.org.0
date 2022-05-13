Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87508525FAF
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 12:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L04js2Dypz3c9P
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 20:33:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yvv+j9Am;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Yvv+j9Am; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L04jQ4ty6z3bpT
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 20:32:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652437978; x=1683973978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ficTo4G11TLusKxmT+h3TM35Qpeg9CrvwxCZMgmXqDI=;
 b=Yvv+j9AmYx/9qt7SdYFpjxHCAFQ3udV67IsMIOoQH6nuHx238oIaKf7r
 T90hdt1GAwfh+7N4UQLxhWYwM05lDM9bXWzLZhO3W53ZYdNBTcr4qqCFW
 OTN/1iX7I9QaF9m2paePPHF7WadIxU4nGFNfkfFPjFzv5BOsr9W+luaNO
 Uw6CEZdgLvVxvcFX7tI/t0R9NLMeoVyXII9+Xn5Egi0/4sfPzyZpaRLSb
 4cVLS2qznALbw3gXHTNZOe//WYYTK5LeFBKfbnSL2Dhu2Sbdt/lXPehPv
 Dvwt/5jy8swCV8jXHnzY9A12LT+ct9GiWz6hgaoAz3/umcTr+5N4FMPz4 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="269945119"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="269945119"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 03:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="595161151"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 13 May 2022 03:31:31 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npSa2-000Ld6-EH;
 Fri, 13 May 2022 10:31:30 +0000
Date: Fri, 13 May 2022 18:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
Message-ID: <202205131804.AMALhZXJ-lkp@intel.com>
References: <20220513033450.7038-6-kflin@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513033450.7038-6-kflin@nuvoton.com>
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
Cc: kwliu@nuvoton.com, kbuild-all@lists.01.org, tmaimon77@gmail.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com,
 kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Marvin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linux/master linus/master v5.18-rc6]
[cannot apply to media-tree/master next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220513-113806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220513/202205131804.AMALhZXJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7fa1f7750e7317479ce2c2c043b44fa19c46b1a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220513-113806
        git checkout 7fa1f7750e7317479ce2c2c043b44fa19c46b1a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/media/platform/nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/platform/nuvoton/npcm-video.c: In function 'nuvoton_video_buf_queue':
   drivers/media/platform/nuvoton/npcm-video.c:1776:13: warning: variable 'empty' set but not used [-Wunused-but-set-variable]
    1776 |         int empty;
         |             ^~~~~
   drivers/media/platform/nuvoton/npcm-video.c: At top level:
>> drivers/media/platform/nuvoton/npcm-video.c:2060:1: error: expected ',' or ';' before 'static'
    2060 | static struct platform_driver nuvoton_video_driver = {
         | ^~~~~~
   In file included from drivers/media/platform/nuvoton/npcm-video.c:24:
   drivers/media/platform/nuvoton/npcm-video.c: In function 'nuvoton_video_driver_init':
>> drivers/media/platform/nuvoton/npcm-video.c:2069:24: error: 'nuvoton_video_driver' undeclared (first use in this function); did you mean 'nuvoton_video_probe'?
    2069 | module_platform_driver(nuvoton_video_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:222:36: note: in definition of macro 'platform_driver_register'
     222 |         __platform_driver_register(drv, THIS_MODULE)
         |                                    ^~~
   include/linux/platform_device.h:252:9: note: in expansion of macro 'module_driver'
     252 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/nuvoton/npcm-video.c:2069:1: note: in expansion of macro 'module_platform_driver'
    2069 | module_platform_driver(nuvoton_video_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nuvoton/npcm-video.c:2069:24: note: each undeclared identifier is reported only once for each function it appears in
    2069 | module_platform_driver(nuvoton_video_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:222:36: note: in definition of macro 'platform_driver_register'
     222 |         __platform_driver_register(drv, THIS_MODULE)
         |                                    ^~~
   include/linux/platform_device.h:252:9: note: in expansion of macro 'module_driver'
     252 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/nuvoton/npcm-video.c:2069:1: note: in expansion of macro 'module_platform_driver'
    2069 | module_platform_driver(nuvoton_video_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:32,
                    from drivers/media/platform/nuvoton/npcm-video.c:14:
   drivers/media/platform/nuvoton/npcm-video.c: In function 'nuvoton_video_driver_exit':
>> drivers/media/platform/nuvoton/npcm-video.c:2069:24: error: 'nuvoton_video_driver' undeclared (first use in this function); did you mean 'nuvoton_video_probe'?
    2069 | module_platform_driver(nuvoton_video_driver);
         |                        ^~~~~~~~~~~~~~~~~~~~
   include/linux/device/driver.h:267:24: note: in definition of macro 'module_driver'
     267 |         __unregister(&(__driver) , ##__VA_ARGS__); \
         |                        ^~~~~~~~
   drivers/media/platform/nuvoton/npcm-video.c:2069:1: note: in expansion of macro 'module_platform_driver'
    2069 | module_platform_driver(nuvoton_video_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nuvoton/npcm-video.c: In function 'nuvoton_video_driver_init':
   include/linux/device/driver.h:263:1: error: control reaches end of non-void function [-Werror=return-type]
     263 | } \
         | ^
   include/linux/platform_device.h:252:9: note: in expansion of macro 'module_driver'
     252 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/media/platform/nuvoton/npcm-video.c:2069:1: note: in expansion of macro 'module_platform_driver'
    2069 | module_platform_driver(nuvoton_video_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   At top level:
   drivers/media/platform/nuvoton/npcm-video.c:2030:12: warning: 'nuvoton_video_remove' defined but not used [-Wunused-function]
    2030 | static int nuvoton_video_remove(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nuvoton/npcm-video.c:1954:12: warning: 'nuvoton_video_probe' defined but not used [-Wunused-function]
    1954 | static int nuvoton_video_probe(struct platform_device *pdev)
         |            ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2060 drivers/media/platform/nuvoton/npcm-video.c

  2059	
> 2060	static struct platform_driver nuvoton_video_driver = {
  2061		.driver = {
  2062			.name = DEVICE_NAME,
  2063			.of_match_table = nuvoton_video_match,
  2064		},
  2065		.probe = nuvoton_video_probe,
  2066		.remove = nuvoton_video_remove,
  2067	};
  2068	
> 2069	module_platform_driver(nuvoton_video_driver);
  2070	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
