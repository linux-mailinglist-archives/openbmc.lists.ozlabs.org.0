Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6AF7D2087
	for <lists+openbmc@lfdr.de>; Sun, 22 Oct 2023 02:17:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VH8AI3JJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SCf5w6hYVz3cN7
	for <lists+openbmc@lfdr.de>; Sun, 22 Oct 2023 11:17:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VH8AI3JJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SCf59645Yz2yVv;
	Sun, 22 Oct 2023 11:16:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697933806; x=1729469806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1PiMnn0i3KT3YYOJNg9IYf4n+r48HTbs7kDucILde3I=;
  b=VH8AI3JJ2ICIBOc2ZeV46dHwlhGAc9C9pCGZAvsVhDTPcNtriA8mQXEt
   FNyd7mQJch7koK2VYE2AIqLWXx7qKZ+x9S/5k09gzZzbMBdokKl8faQgz
   n11aG0GBhDlqO7UL+SCR3lBPuJOXzbf33kKEh2gHwdwE4WCOq+Cq23LSl
   9pM6VoGmGU7Daw4pKTfWPAxG77DR8Zfw6wkL+SM6n6A0rxth2R/IBl0cK
   asgEUjE9wpyMuIc6D4VWkoWKhXdb74LJTpym0q6Ep1gaTntceJFTwRef5
   v8AmuZeyetuR4Je2nOdpFvCoaNsNgr8mwhRLLNd0w/H+5A5pzcD1+aqXl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="385554733"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="385554733"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 17:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="761389573"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="761389573"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Oct 2023 17:16:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quM8s-0005Py-24;
	Sun, 22 Oct 2023 00:16:30 +0000
Date: Sun, 22 Oct 2023 08:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH v5 1/3] ipmi: Move KCS headers to common include folder
Message-ID: <202310220806.BmOW2atE-lkp@intel.com>
References: <20231010122321.823-2-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010122321.823-2-aladyshev22@gmail.com>
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com, edumazet@google.com, jk@codeconstruct.com.au, matt@codeconstruct.com.au, benjaminfair@google.com, openbmc@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, pabeni@redhat.com, minyard@acm.org, aladyshev22@gmail.com, oe-kbuild-all@lists.linux.dev, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com, linux-kernel@vger.kernel.org, avifishman70@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Konstantin,

kernel test robot noticed the following build errors:

[auto build test ERROR on cminyard-ipmi/for-next]
[also build test ERROR on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Aladyshev/ipmi-Move-KCS-headers-to-common-include-folder/20231010-202425
base:   https://github.com/cminyard/linux-ipmi for-next
patch link:    https://lore.kernel.org/r/20231010122321.823-2-aladyshev22%40gmail.com
patch subject: [PATCH v5 1/3] ipmi: Move KCS headers to common include folder
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231022/202310220806.BmOW2atE-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220806.BmOW2atE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220806.BmOW2atE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kcs_bmc_client.h:8,
                    from drivers/char/ipmi/kcs_bmc_cdev_ipmi.c:11:
>> include/linux/kcs_bmc.h:42:9: error: unknown type name 'spinlock_t'
      42 |         spinlock_t lock;
         |         ^~~~~~~~~~


vim +/spinlock_t +42 include/linux/kcs_bmc.h

faae6e391eda73 drivers/char/ipmi/kcs_bmc.h Andrew Jeffery 2021-06-08  31  
d4e7ac68f771ad drivers/char/ipmi/kcs_bmc.h Andrew Jeffery 2021-06-08  32  struct kcs_bmc_device {
d4e7ac68f771ad drivers/char/ipmi/kcs_bmc.h Andrew Jeffery 2021-06-08  33  	struct list_head entry;
20d60f61c58e8c drivers/char/ipmi/kcs_bmc.h Haiyue Wang    2018-02-02  34  
d4e7ac68f771ad drivers/char/ipmi/kcs_bmc.h Andrew Jeffery 2021-06-08  35  	struct device *dev;
20d60f61c58e8c drivers/char/ipmi/kcs_bmc.h Haiyue Wang    2018-02-02  36  	u32 channel;
20d60f61c58e8c drivers/char/ipmi/kcs_bmc.h Haiyue Wang    2018-02-02  37  
20d60f61c58e8c drivers/char/ipmi/kcs_bmc.h Haiyue Wang    2018-02-02  38  	struct kcs_ioreg ioreg;
20d60f61c58e8c drivers/char/ipmi/kcs_bmc.h Haiyue Wang    2018-02-02  39  
d4e7ac68f771ad drivers/char/ipmi/kcs_bmc.h Andrew Jeffery 2021-06-08  40  	const struct kcs_bmc_device_ops *ops;
20d60f61c58e8c drivers/char/ipmi/kcs_bmc.h Haiyue Wang    2018-02-02  41  
d4e7ac68f771ad drivers/char/ipmi/kcs_bmc.h Andrew Jeffery 2021-06-08 @42  	spinlock_t lock;
d4e7ac68f771ad drivers/char/ipmi/kcs_bmc.h Andrew Jeffery 2021-06-08  43  	struct kcs_bmc_client *client;
20d60f61c58e8c drivers/char/ipmi/kcs_bmc.h Haiyue Wang    2018-02-02  44  };
d4e7ac68f771ad drivers/char/ipmi/kcs_bmc.h Andrew Jeffery 2021-06-08  45  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
