Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E4955043F
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 13:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQDRh3YD8z3bwg
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 21:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L9AVPnOx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L9AVPnOx;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQDRC51b6z3bkY;
	Sat, 18 Jun 2022 21:37:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655552248; x=1687088248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=trJevHg9pw/ezRiw4PuJjXBPnKq5vd9v7IT0hWBUmjs=;
  b=L9AVPnOx0GESO4EEwPTBEbl1KVEJayaXNL7eP72GECy3UdNcDrAfbAbm
   1YLomMrMM4HoUMSr+VKA9AF/wj5DCQGGE00foCeMVUYr3e+LbG/FuSJB2
   vjpczt2tQBbylTMvIMbkovNsZ40/5szLfC99LTBLrHOMS2JdPK9nV+HH/
   Y5IQEsq8CT4BB/P+9Yxy2KBYmoA1dKKVs0riNRjkadQX2Abh7hCHqMZLJ
   SoFqkoxTG5TzAUZAtvr7q6EzPk1FGOLFBcjicsKUiDWlfZSRUfPsWMZIg
   RC+c+e/NSs/+zvehCIVkaXzspkyeznb0uC9UKzKTTZSMx0b0Gj1R2EtJE
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="341333075"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="341333075"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 04:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="912969164"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2022 04:37:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2WlP-000QHv-Cp;
	Sat, 18 Jun 2022 11:37:15 +0000
Date: Sat, 18 Jun 2022 19:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>,
	Brendan Higgins <brendanhiggins@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Daniel Latypov <dlatypov@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andra Paraschiv <andraprs@amazon.com>,
	Longpeng <longpeng2@huawei.com>
Subject: Re: [PATCH 1/5] kunit: unify module and builtin suite definitions
Message-ID: <202206181950.qNG3jcE8-lkp@intel.com>
References: <20220618090310.1174932-2-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618090310.1174932-2-davidgow@google.com>
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
Cc: kbuild-all@lists.01.org, David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org, =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi David,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to mcgrof/modules-next joel-aspeed/for-next ulf-hansson-mmc-mirror/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/Rework-KUnit-test-execution-in-modules/20220618-170653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4b35035bcf80ddb47c0112c4fbd84a63a2836a18
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20220618/202206181950.qNG3jcE8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/14ff6ae01a41e301f1409874dd5aa38f73bc96f5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/Rework-KUnit-test-execution-in-modules/20220618-170653
        git checkout 14ff6ae01a41e301f1409874dd5aa38f73bc96f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash lib/kunit/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   lib/kunit/test.c: In function 'kunit_module_init':
>> lib/kunit/test.c:618:28: error: 'struct module' has no member named 'num_kunit_suites'
     618 |         for (i = 0; i < mod->num_kunit_suites; i++)
         |                            ^~
>> lib/kunit/test.c:619:45: error: 'struct module' has no member named 'kunit_suites'
     619 |                 __kunit_test_suites_init(mod->kunit_suites[i]);
         |                                             ^~
   lib/kunit/test.c: In function 'kunit_module_exit':
   lib/kunit/test.c:626:28: error: 'struct module' has no member named 'num_kunit_suites'
     626 |         for (i = 0; i < mod->num_kunit_suites; i++)
         |                            ^~
   lib/kunit/test.c:627:45: error: 'struct module' has no member named 'kunit_suites'
     627 |                 __kunit_test_suites_exit(mod->kunit_suites[i]);
         |                                             ^~


vim +618 lib/kunit/test.c

   612	
   613	#ifdef CONFIG_MODULES
   614	static void kunit_module_init(struct module *mod)
   615	{
   616		unsigned int i;
   617	
 > 618		for (i = 0; i < mod->num_kunit_suites; i++)
 > 619			__kunit_test_suites_init(mod->kunit_suites[i]);
   620	}
   621	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
