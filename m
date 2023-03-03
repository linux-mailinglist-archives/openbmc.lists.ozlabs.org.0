Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB66A9CE9
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 18:13:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSvgS50MDz3cgv
	for <lists+openbmc@lfdr.de>; Sat,  4 Mar 2023 04:13:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cOvuREDd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cOvuREDd;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSvfp6QBmz3cB1
	for <openbmc@lists.ozlabs.org>; Sat,  4 Mar 2023 04:12:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677863555; x=1709399555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7gT1uRRS/s2rb1jiK2Tpq+ml2NdiLvR0qfU6wXGpI3Q=;
  b=cOvuREDdty3hHPHwRWeBQKd8hvdFyAClftcV/4KOqb8okcD+pk3AivFH
   tWlDYAo44c3F7DwzAgQ+N94yLDKeMs/LDKO3BDh2r8T2Mk0HiPwsXxjH2
   R4k/xPm61qf6RHakhB8v0m8p00noE13Mjp8ukIKxCOBrTirsP4pzaxSTv
   QLJvcbpgwY/fystr+F+Be0bkKb7hADtpL1iC2RvEOzV3LRDlJxxx9KusC
   eKg5LHhbYvin804t+TJu00OJilrTdqL3pqjtnd/tfP2kurW/6mFUviLwj
   mLISfDQglFUEs/on+Q6ewi24macRudwLV17QwG64XzCs7PAFkp8l71kbB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="315497296"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="315497296"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 09:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="668731759"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="668731759"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 09:12:20 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY8x9-0001ZQ-1k;
	Fri, 03 Mar 2023 17:12:19 +0000
Date: Sat, 4 Mar 2023 01:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Wang <tomato1220@gmail.com>, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 1/7] ARM: dts: nuvoton: Add Quanta GIS BMC Device Tree
Message-ID: <202303040046.YS2c6Prp-lkp@intel.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, tmaimon77@gmail.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi David,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on soc/for-next arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next xilinx-xlnx/master linus/master v6.2 next-20230303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Wang/ARM-dts-nuvoton-Add-Quanta-GSZ-BMC-Device-Tree/20230303-143845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230303063435.803097-1-davidwang%40quantatw.com
patch subject: [PATCH 1/7] ARM: dts: nuvoton: Add Quanta GIS BMC Device Tree
config: arm-randconfig-r046-20230302 (https://download.01.org/0day-ci/archive/20230304/202303040046.YS2c6Prp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/35df7d319f11bec38f67ec9b341d8b9c4d51c028
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Wang/ARM-dts-nuvoton-Add-Quanta-GSZ-BMC-Device-Tree/20230303-143845
        git checkout 35df7d319f11bec38f67ec9b341d8b9c4d51c028
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040046.YS2c6Prp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:204.1-6 Label or path emc0 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:212.1-4 Label or path mc not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:220.1-7 Label or path ohci1 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:224.1-5 Label or path aes not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:228.1-5 Label or path sha not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:232.1-6 Label or path udc5 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:236.1-6 Label or path udc6 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:240.1-6 Label or path udc7 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:244.1-6 Label or path udc8 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:248.1-6 Label or path udc9 not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:252.1-9 Label or path pcimbox not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:369.1-5 Label or path otp not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:387.1-10 Label or path lpc_host not found
>> Error: arch/arm/boot/dts/nuvoton-npcm730-gis.dts:1059.1-7 Label or path peci0 not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
