Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960182CBD4
	for <lists+openbmc@lfdr.de>; Sat, 13 Jan 2024 11:29:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f/jwvzoG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBvlp2Q6tz3c01
	for <lists+openbmc@lfdr.de>; Sat, 13 Jan 2024 21:29:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f/jwvzoG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBvlC5bXRz3bYR
	for <openbmc@lists.ozlabs.org>; Sat, 13 Jan 2024 21:28:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705141735; x=1736677735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NcXtWDYE1l26Z+EO8wj7DrnFq2sZpKD4cbxy9EEC3xA=;
  b=f/jwvzoGwXvmOwuQQe252YO6h1MGQK/mhsXLF9eT7M7ZZVbwCjvoEbvK
   U3BeLrX65bc5J10gyZlzNQXag2O4pXFS8Ak2MdyB2Z1h7u67uxerqqmoL
   OqBF/eVL31DFlnm5SVk/0wNMYRaIS+50ruvmkwoRSW598xldI7tqvH4cT
   IkXmMpplISsvL210Ar9Jlj0mWvfuvge3bget7WULTB8210gDr82ZNS2ne
   aRCBwj1n+YgaQ9bzdY+b976aKjao1YsM4mJtqbLO1nvRL9FABrqnOcFrt
   b4oDj6I/urqyA3j9myMlPQigMIblanW2ewU/0SkAzfW7jYOW7YSFIlg3q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="399047118"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="399047118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 02:28:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="25272553"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2024 02:28:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rObFp-000ALu-25;
	Sat, 13 Jan 2024 10:28:41 +0000
Date: Sat, 13 Jan 2024 18:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 2/2] ARM64: dts: nuvoton: Add initial yosemitev4
 device tree
Message-ID: <202401131809.AEhtmGWi-lkp@intel.com>
References: <20240112013654.1424451-3-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112013654.1424451-3-Delphine_CC_Chiu@wiwynn.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, llvm@lists.linux.dev, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Delphine,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/dt-bindings-arm-nuvoton-add-Facebook-Yosemite-4-board/20240112-094033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240112013654.1424451-3-Delphine_CC_Chiu%40wiwynn.com
patch subject: [PATCH v1 2/2] ARM64: dts: nuvoton: Add initial yosemitev4 device tree
config: arm64-randconfig-003-20240112 (https://download.01.org/0day-ci/archive/20240113/202401131809.AEhtmGWi-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131809.AEhtmGWi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131809.AEhtmGWi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-yosemite4.dts:6:10: fatal error: 'nuvoton-npcm845-pincfg-evb.dtsi' file not found
       6 | #include "nuvoton-npcm845-pincfg-evb.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +6 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-yosemite4.dts

     3	
     4	/dts-v1/;
     5	#include "nuvoton-npcm845.dtsi"
   > 6	#include "nuvoton-npcm845-pincfg-evb.dtsi"
     7	#include <dt-bindings/i2c/i2c.h>
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
