Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4994F54EA82
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 22:05:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPCpn1NP9z3blf
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 06:05:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FzvzAth0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FzvzAth0;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPCpJ30ccz3bYS;
	Fri, 17 Jun 2022 06:05:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655409928; x=1686945928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8nKn3u5HYJV1okOhvCdZ6oJQPkGSyi/IKm0G/s0MXY=;
  b=FzvzAth0Rq7xpvySjoboTAKjHxAY8HN+8z8vnTR6cBdu275p0JZsK7fo
   seN4VOgKMU/UPW0IG8HMSd6E4ZKnU/1P2hYXKbS4goCdm4pDBb3uI/7J2
   hDLs8KbJbRysGDhTEmQOiwFHkD7LOWe93UMK4lrchLUv93lo4+jRu+63k
   hVx/M4oShENFgMUVhA54yRjIvU5urexJpEuwZITXfBZKZxUItn1TJ/cgT
   AaEA4qm6tHD4IR0XvvRHdtno03ZHfrnIGKc9EfIbZfDaWshDc9YAe0xXB
   YOmdU5goCYpu0numu/2xETIsw+9dij1gHQ995MmAAmhi64ARFhR7Rd+bi
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279398620"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="279398620"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 13:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="589791945"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2022 13:05:13 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1vjs-000Oj3-Vy;
	Thu, 16 Jun 2022 20:05:12 +0000
Date: Fri, 17 Jun 2022 04:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v8 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <202206170337.0kCTfR63-lkp@intel.com>
References: <20220615090259.1121405-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615090259.1121405-2-quan@os.amperecomputing.com>
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
Cc: Open Source Submission <patches@amperecomputing.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, Phong Vo <phong@os.amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Quan,

I love your patch! Yet something to improve:

[auto build test ERROR on cminyard-ipmi/for-next]
[also build test ERROR on wsa/i2c/for-next v5.19-rc2 next-20220616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Quan-Nguyen/Add-SSIF-BMC-driver/20220615-170539
base:   https://github.com/cminyard/linux-ipmi for-next
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220617/202206170337.0kCTfR63-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0feb5f0351d090633e7522dbec22de419a04b85f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Quan-Nguyen/Add-SSIF-BMC-driver/20220615-170539
        git checkout 0feb5f0351d090633e7522dbec22de419a04b85f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/ipmi_ssif_bmc.h:13:2: error: unknown type name '__u8'
           __u8    payload[IPMI_SSIF_PAYLOAD_MAX];
           ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
