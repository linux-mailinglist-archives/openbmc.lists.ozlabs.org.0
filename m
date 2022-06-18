Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A5550596
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 16:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQJjY5Hpxz3c7h
	for <lists+openbmc@lfdr.de>; Sun, 19 Jun 2022 00:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WC6z7vOL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WC6z7vOL;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQJj60DX7z3bmM;
	Sun, 19 Jun 2022 00:49:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655563786; x=1687099786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w5tzZ7RrqHkJr3FpjfrwlqfOP6Ec32jd0b8PId2bAqg=;
  b=WC6z7vOLyqTWDKRuhL3aJTY4gQcM1TlbBOlQPPPYNIa2KjguI6L8jFlV
   PX4OdTCbfqoScJiHqVjGaMHLodTuolsQ3Q3jJrE/4iuCtryJo7cXFMWj3
   RGdM5hXJFzPepO0xOqhSYhW++Q5eTy4CkvySBDXtEtuXl/PTIwF9IcY1/
   nWUbrKZ9cYmmEgiEEDEIttE5T2Wx/55oAqU/qSI0SNHqiQaLxspfyTXvq
   Ryj6/uhMOIliLikzNj6672F58xU+E2RqJOxlbfmyWtKyCUi0RzH9QyYVv
   nOAnEVlqZLmwUDqPWaKkFC6a7qgcg5/b/vV2A8SfHR4Fv/YTV2UoZ58br
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="305091158"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="305091158"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2022 07:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="688737041"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2022 07:49:20 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2ZlG-000QNA-KA;
	Sat, 18 Jun 2022 14:49:18 +0000
Date: Sat, 18 Jun 2022 22:49:16 +0800
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
Message-ID: <202206182258.EahbTrAv-lkp@intel.com>
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
[cannot apply to mcgrof/modules-next joel-aspeed/for-next ulf-hansson-mmc-mirror/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/Rework-KUnit-test-execution-in-modules/20220618-170653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4b35035bcf80ddb47c0112c4fbd84a63a2836a18
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20220618/202206182258.EahbTrAv-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c2386c54cc9fd471e5353f375ff71734214ed3c6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/Rework-KUnit-test-execution-in-modules/20220618-170653
        git checkout c2386c54cc9fd471e5353f375ff71734214ed3c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-review/David-Gow/Rework-KUnit-test-execution-in-modules/20220618-170653 HEAD fddb3ea0ed5627098eabc542fdba5a8b4b769066 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/thunderbolt/test.c: In function 'tb_test_init':
>> drivers/thunderbolt/test.c:2824:16: error: too few arguments to function '__kunit_test_suites_init'
    2824 |         return __kunit_test_suites_init(tb_test_suites);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/thunderbolt/test.c:9:
   include/kunit/test.h:240:5: note: declared here
     240 | int __kunit_test_suites_init(struct kunit_suite * const * const suites, int num_suites);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/test.c: In function 'tb_test_exit':
>> drivers/thunderbolt/test.c:2829:16: error: too few arguments to function '__kunit_test_suites_exit'
    2829 |         return __kunit_test_suites_exit(tb_test_suites);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/thunderbolt/test.c:9:
   include/kunit/test.h:242:6: note: declared here
     242 | void __kunit_test_suites_exit(struct kunit_suite **suites, int num_suites);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/test.c:2829:16: error: 'return' with a value, in function returning void [-Werror=return-type]
    2829 |         return __kunit_test_suites_exit(tb_test_suites);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/test.c:2827:6: note: declared here
    2827 | void tb_test_exit(void)
         |      ^~~~~~~~~~~~
   drivers/thunderbolt/test.c: In function 'tb_test_init':
   drivers/thunderbolt/test.c:2825:1: error: control reaches end of non-void function [-Werror=return-type]
    2825 | }
         | ^
   cc1: some warnings being treated as errors


vim +/__kunit_test_suites_init +2824 drivers/thunderbolt/test.c

2c6ea4e2cefe2e Mika Westerberg 2020-08-24  2821  
2c6ea4e2cefe2e Mika Westerberg 2020-08-24  2822  int tb_test_init(void)
2c6ea4e2cefe2e Mika Westerberg 2020-08-24  2823  {
2c6ea4e2cefe2e Mika Westerberg 2020-08-24 @2824  	return __kunit_test_suites_init(tb_test_suites);
2c6ea4e2cefe2e Mika Westerberg 2020-08-24  2825  }
2c6ea4e2cefe2e Mika Westerberg 2020-08-24  2826  
2c6ea4e2cefe2e Mika Westerberg 2020-08-24  2827  void tb_test_exit(void)
2c6ea4e2cefe2e Mika Westerberg 2020-08-24  2828  {
2c6ea4e2cefe2e Mika Westerberg 2020-08-24 @2829  	return __kunit_test_suites_exit(tb_test_suites);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
