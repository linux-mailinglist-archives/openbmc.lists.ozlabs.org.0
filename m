Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9364D5B91
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 07:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFG8B0KHJz30DT
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 17:23:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fOXPZc7U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fOXPZc7U; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFG7d6l5rz2xb1;
 Fri, 11 Mar 2022 17:22:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646979759; x=1678515759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6emc1AFaB06kmmYCtXfN6YMM1b/mUxC5G7/GppPZ660=;
 b=fOXPZc7U1AyrN0nuY8scl3wyQX5f3TDAleJNe8MZVyN4G6TXP3pIYrWK
 /EpqlCBswVrP3Zj9ZKPl1pABs8SG5HedXX7viN1NcrjfUrlqVhpqdUPEY
 jm/VsRF+GuuAi935LL/X4IfAmSoKEZcvuTxDNQa4Qrv0k0NXr3P7X7TOA
 hyxXQmgbgGGumWBtye5Qw4McHT7Moq2iC3e0d/xw37+Ss485yQ0VuS2e8
 gWt0bzgLYp0hiGtbvPgzxvKabYz4mQz9g24kKsTJE/2A6JwT2lT9fiQ8B
 TvVVXKOSuFeDB/GcR3I5sE0kH9iHUqmuQJN+5iRc30Y2oYUwY8cP2a/lM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255245320"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="255245320"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 22:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="688975479"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2022 22:21:24 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSYeS-0005vr-24; Fri, 11 Mar 2022 06:21:24 +0000
Date: Fri, 11 Mar 2022 14:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa-dev@sang-engineering.com>,
 openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v6 1/4] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <202203111440.hG9yioyl-lkp@intel.com>
References: <20220310114119.13736-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310114119.13736-2-quan@os.amperecomputing.com>
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>, kbuild-all@lists.01.org,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Quan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on wsa/i2c/for-next cminyard-ipmi/for-next v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Quan-Nguyen/Add-SSIF-BMC-driver/20220310-194342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git 3dd9a926ec2308e49445f22abef149fc64e9332e
config: mips-randconfig-s031-20220310 (https://download.01.org/0day-ci/archive/20220311/202203111440.hG9yioyl-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/a977225b8997c2fdb51eddeee79de36075d3ce4d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Quan-Nguyen/Add-SSIF-BMC-driver/20220310-194342
        git checkout a977225b8997c2fdb51eddeee79de36075d3ce4d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefined
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefined
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefined
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefined
   builtin:0:0: sparse: this was the original definition
>> drivers/char/ipmi/ssif_bmc.c:181:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/char/ipmi/ssif_bmc.c:181:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/char/ipmi/ssif_bmc.c:181:27: sparse:     got unsigned int ( * )( ... )

vim +181 drivers/char/ipmi/ssif_bmc.c

   171	
   172	/*
   173	 * System calls to device interface for user apps
   174	 */
   175	static const struct file_operations ssif_bmc_fops = {
   176		.owner		= THIS_MODULE,
   177		.open		= ssif_bmc_open,
   178		.read		= ssif_bmc_read,
   179		.write		= ssif_bmc_write,
   180		.release	= ssif_bmc_release,
 > 181		.poll		= ssif_bmc_poll,
   182	};
   183	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
