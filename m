Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F057655054B
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 16:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQHbk699Hz3c8C
	for <lists+openbmc@lfdr.de>; Sun, 19 Jun 2022 00:00:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tgv1UoaL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tgv1UoaL;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQHbB6mSnz3brJ;
	Sat, 18 Jun 2022 23:59:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655560775; x=1687096775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhvgxqN/MU+pbySf6/r74IVdKy4xbfE7RP+iY5t+B5U=;
  b=Tgv1UoaLkEwTCqOwM8Eq7LqR9uYqDa5EBFhUKvU0XMsdLayCsg9NbKXV
   dFG0++2YFVgC0jArB2W/TZZmPMbRDl/+NYZh78DXvpEAs8sKjP1deTkjg
   jkcQHMd1CDtuPYTaUo3/PBX/nk47R9mNs95gXWNXs3KIydaCxCaNRfJlL
   9sJVL12NOhSjgrZ60nFlpklU8Dx+cqISgDptZeSdSst8cVdgO0hDfRgl3
   gopYU/LLYhYkxrdAURaeO4Qq8c8guSMZGRBIYXTIo3FiGQ22hn8QnuQy/
   Mkw4okS/ycByBMRiPRncQw8YHpIfKZpAXAk6Myw9JqOzH/p/nbBOA273j
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279698998"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="279698998"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 06:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="584348783"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jun 2022 06:59:18 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2Yyr-000QLv-Sb;
	Sat, 18 Jun 2022 13:59:17 +0000
Date: Sat, 18 Jun 2022 21:58:28 +0800
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
Subject: Re: [PATCH 2/5] kunit: flatten kunit_suite*** to kunit_suite** in
 .kunit_test_suites
Message-ID: <202206182117.58z5vWxq-lkp@intel.com>
References: <20220618090310.1174932-3-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618090310.1174932-3-davidgow@google.com>
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

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc2 next-20220617]
[cannot apply to mcgrof/modules-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/Rework-KUnit-test-execution-in-modules/20220618-170653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4b35035bcf80ddb47c0112c4fbd84a63a2836a18
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20220618/202206182117.58z5vWxq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c2386c54cc9fd471e5353f375ff71734214ed3c6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/Rework-KUnit-test-execution-in-modules/20220618-170653
        git checkout c2386c54cc9fd471e5353f375ff71734214ed3c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-review/David-Gow/Rework-KUnit-test-execution-in-modules/20220618-170653 HEAD fddb3ea0ed5627098eabc542fdba5a8b4b769066 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/mmc/host/sdhci-of-aspeed.c: In function 'aspeed_sdc_tests_init':
>> drivers/mmc/host/sdhci-of-aspeed.c:612:16: error: too few arguments to function '__kunit_test_suites_init'
     612 |         return __kunit_test_suites_init(aspeed_sdc_test_suites);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/mmc/host/sdhci-of-aspeed-test.c:4,
                    from drivers/mmc/host/sdhci-of-aspeed.c:608:
   include/kunit/test.h:240:5: note: declared here
     240 | int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_suites);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c: In function 'aspeed_sdc_tests_exit':
>> drivers/mmc/host/sdhci-of-aspeed.c:617:9: error: too few arguments to function '__kunit_test_suites_exit'
     617 |         __kunit_test_suites_exit(aspeed_sdc_test_suites);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/mmc/host/sdhci-of-aspeed-test.c:4,
                    from drivers/mmc/host/sdhci-of-aspeed.c:608:
   include/kunit/test.h:242:6: note: declared here
     242 | void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-of-aspeed.c: In function 'aspeed_sdc_tests_init':
   drivers/mmc/host/sdhci-of-aspeed.c:613:1: error: control reaches end of non-void function [-Werror=return-type]
     613 | }
         | ^
   cc1: some warnings being treated as errors


vim +/__kunit_test_suites_init +612 drivers/mmc/host/sdhci-of-aspeed.c

4af307f574260c Andrew Jeffery 2021-01-22  609  
4af307f574260c Andrew Jeffery 2021-01-22  610  static inline int aspeed_sdc_tests_init(void)
4af307f574260c Andrew Jeffery 2021-01-22  611  {
4af307f574260c Andrew Jeffery 2021-01-22 @612  	return __kunit_test_suites_init(aspeed_sdc_test_suites);
4af307f574260c Andrew Jeffery 2021-01-22  613  }
4af307f574260c Andrew Jeffery 2021-01-22  614  
4af307f574260c Andrew Jeffery 2021-01-22  615  static inline void aspeed_sdc_tests_exit(void)
4af307f574260c Andrew Jeffery 2021-01-22  616  {
4af307f574260c Andrew Jeffery 2021-01-22 @617  	__kunit_test_suites_exit(aspeed_sdc_test_suites);
4af307f574260c Andrew Jeffery 2021-01-22  618  }
4af307f574260c Andrew Jeffery 2021-01-22  619  #else
4af307f574260c Andrew Jeffery 2021-01-22  620  static inline int aspeed_sdc_tests_init(void)
4af307f574260c Andrew Jeffery 2021-01-22  621  {
4af307f574260c Andrew Jeffery 2021-01-22  622  	return 0;
4af307f574260c Andrew Jeffery 2021-01-22  623  }
4af307f574260c Andrew Jeffery 2021-01-22  624  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
