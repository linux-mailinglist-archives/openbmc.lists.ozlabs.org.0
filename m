Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F2C946621
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2024 01:26:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H4vXY2RD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbMRf6K7Dz3fVP
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2024 09:26:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H4vXY2RD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbMR62Lxtz3cK8
	for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2024 09:26:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722641187; x=1754177187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jcbz/gg6+XN0P/pOczsu0ej73zhPm485GKcdKVXxrxw=;
  b=H4vXY2RDWoMFDqj+qIXhFtHTBknsqIjNYV5SNUwiIXmI/SPdniYB2n7Q
   azTOaSf8dEnHDJtFM7aqVwIFG1k/GgYadMwkik6X9v6MX6NaBOl3KUOin
   ece1GeCas8yz1FJIMC43wPF14SH9aZBbe64LWY4XRxkdxPXgaAR+UZcBW
   5sdCCWu89wPAvPQ0ToFkh436d6efPz/gLB+1l2lyGKHlHQQ401IdaeHH/
   A56RdhM9FDcwug1fls9funIyh/kpS7ST4tJDBkTQmgn1ZVJzv5q9XQFmE
   2I8stLnO0lyfC60cG4H7nGvacG1sBslIi0PlcuZJIqzVkTPk0D8BTSyMH
   Q==;
X-CSE-ConnectionGUID: wzJrGG9RTzqv32eDgqF9fg==
X-CSE-MsgGUID: XB0OyyhSSVuwl3vRu4h2GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31302946"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="31302946"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 16:26:08 -0700
X-CSE-ConnectionGUID: RUOZqdf4TWqzhKsdVGEqzQ==
X-CSE-MsgGUID: URWv0Wf2Q9+Bu6lYSUhg7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="86496105"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Aug 2024 16:26:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa1es-000xXP-1m;
	Fri, 02 Aug 2024 23:26:02 +0000
Date: Sat, 3 Aug 2024 07:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chu <stanley.chuys@gmail.com>, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
Message-ID: <202408030639.LBZ5zgGw-lkp@intel.com>
References: <20240801071946.43266-3-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801071946.43266-3-yschu@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, yschu@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, cpchiang1@nuvoton.com, oe-kbuild-all@lists.linux.dev, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stanley,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanley-Chu/dt-bindings-i3c-Add-NPCM845-i3c-controller/20240802-183617
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240801071946.43266-3-yschu%40nuvoton.com
patch subject: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408030639.LBZ5zgGw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030639.LBZ5zgGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030639.LBZ5zgGw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/i3c/master/npcm845-i3c-master.c:655:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     655 |         default:
         |         ^
   drivers/i3c/master/npcm845-i3c-master.c:655:2: note: insert 'break;' to avoid fall-through
     655 |         default:
         |         ^
         |         break; 
>> drivers/i3c/master/npcm845-i3c-master.c:1112:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
    1112 |                         if ((NPCM_I3C_MSTATUS_STATE_IDLE(reg) |
         |                             ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                               ||
    1113 |                              NPCM_I3C_MSTATUS_STATE_SLVREQ(reg)) &&
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/npcm845-i3c-master.c:67:42: note: expanded from macro 'NPCM_I3C_MSTATUS_STATE_IDLE'
      67 | #define   NPCM_I3C_MSTATUS_STATE_IDLE(x) (NPCM_I3C_MSTATUS_STATE(x) == 0)
         |                                          ^
   drivers/i3c/master/npcm845-i3c-master.c:1112:9: note: cast one or both operands to int to silence this warning
   drivers/i3c/master/npcm845-i3c-master.c:67:42: note: expanded from macro 'NPCM_I3C_MSTATUS_STATE_IDLE'
      67 | #define   NPCM_I3C_MSTATUS_STATE_IDLE(x) (NPCM_I3C_MSTATUS_STATE(x) == 0)
         |                                          ^
>> drivers/i3c/master/npcm845-i3c-master.c:2353:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
    2353 |         .remove = npcm_i3c_master_remove,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +2353 drivers/i3c/master/npcm845-i3c-master.c

  2350	
  2351	static struct platform_driver npcm_i3c_master = {
  2352		.probe = npcm_i3c_master_probe,
> 2353		.remove = npcm_i3c_master_remove,
  2354		.driver = {
  2355			.name = "npcm845-i3c-master",
  2356			.of_match_table = npcm_i3c_master_of_match_tbl,
  2357		},
  2358	};
  2359	module_platform_driver(npcm_i3c_master);
  2360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
