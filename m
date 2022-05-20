Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9241D52EC94
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 14:49:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4RPS4h0Fz3blm
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 22:49:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZicmNgpJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZicmNgpJ; dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4RP06rPDz2yb6
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 22:48:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653050933; x=1684586933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RMCcUvf4lESFVE+KBBnXAEay0T2uWzyIBLfBOA+tar4=;
 b=ZicmNgpJ7My9WCHpQoButTTKK5IXi5aSJnNV/PgipsUtcYHu9eRdC6FH
 y+encMjfeY2oGD7NTa8QUOH9EkSLsdB15X9avKNd7yUzP6eHPvFLpxHIr
 TyvgRJvZcIhcNffYAmZSwfdRKJTf+qZhJR4JkDarWZNne9g4SPkMilZwb
 WK9SsvkfqmIN6txT+s1R8cmyXyRoNkzHZnh4cQSbfwqTkLRpnJz3doSUd
 jvSkpalHd8FbC2xFemUwq82HFX4BzTZRSukHsWKHh+qrDrPHw9lmI9hIe
 Yucy2pCN9pNfieum4/Y88dwMkhiZ9+u+yZRY92GaxURoOB+DCFUhy5+Vr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="333222775"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="333222775"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 05:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="674603101"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 20 May 2022 05:48:44 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ns23g-0004ht-4I;
 Fri, 20 May 2022 12:48:44 +0000
Date: Fri, 20 May 2022 20:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
Message-ID: <202205202038.PeQqCdhg-lkp@intel.com>
References: <20220520024744.25655-6-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520024744.25655-6-milkfafa@gmail.com>
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
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, llvm@lists.linux.dev,
 tali.perry1@gmail.com, Marvin Lin <milkfafa@gmail.com>, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Marvin,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linux/master linus/master v5.18-rc7]
[cannot apply to media-tree/master next-20220519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220520-104901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220520/202205202038.PeQqCdhg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/56e41b3b4b1a54f2096e810eda12259da495c686
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220520-104901
        git checkout 56e41b3b4b1a54f2096e810eda12259da495c686
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/platform/nuvoton/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/platform/nuvoton/npcm-video.c:2048:45: error: expected ';' after top level declarator
   MODULE_DEVICE_TABLE(of, nuvoton_video_match)
                                               ^
                                               ;
   1 error generated.


vim +2048 drivers/media/platform/nuvoton/npcm-video.c

  2047	
> 2048	MODULE_DEVICE_TABLE(of, nuvoton_video_match)
  2049	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
