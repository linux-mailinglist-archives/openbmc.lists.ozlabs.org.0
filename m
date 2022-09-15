Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 666045B9666
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 10:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSr6Z2c3gz3blw
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 18:32:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QY6OH70P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QY6OH70P;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSr632xHzz30Dp;
	Thu, 15 Sep 2022 18:31:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663230715; x=1694766715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4QDYhv01XhBj9H19T7cifgoQYgyC7r+UJfLax276tBI=;
  b=QY6OH70PfumjhGRz1ck/KOQ9WiaBmOZ97RIfWGEJgbZM5J48u2nlS5Bk
   uRDUKVSyXcrLD2BIRCSoNqALnesgZWdAOhYsmjInQSbqzWnbDiD2xW6+s
   KSb7dplzQbyzZuLk3JRQgVpMj2dLy68WGqBcYdyMMWatjBfGTKkGiAdM0
   JFjhkCKbJLwftL5Cto98yABKw2HoWIzmPT15Jk9santH5l21NbuD7zY20
   oLwS2lIFePisXP7ATaJpaPzQQ4JCpa2zwaq9avGDL4ViyZABdieQ4Pxa+
   sc57Y1+yr74ca3NKLnR/Q361S+cs8TrDqtyfS5KxPazkkU9nKuB5kfIqc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278381476"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="278381476"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 01:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="650396990"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Sep 2022 01:31:44 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYkHf-0000Dj-1p;
	Thu, 15 Sep 2022 08:31:43 +0000
Date: Thu, 15 Sep 2022 16:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3] ARM: dts: aspeed: yosemit V2: Enable OCP debug card
Message-ID: <202209151642.BiM4LmOZ-lkp@intel.com>
References: <20220914095207.GA24690@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914095207.GA24690@hcl-ThinkPad-T495>
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
Cc: kbuild-all@lists.01.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Karthikeyan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on arm/for-next]
[also build test ERROR on arm64/for-next/core clk/clk-next rockchip/for-next shawnguo/for-next soc/for-next xilinx-xlnx/master linus/master v6.0-rc5 next-20220914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikeyan-Pasupathi/ARM-dts-aspeed-yosemit-V2-Enable-OCP-debug-card/20220914-175427
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220915/202209151642.BiM4LmOZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f4ff107abc0f057d0a55ced8a8db831db6f7d59e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Karthikeyan-Pasupathi/ARM-dts-aspeed-yosemit-V2-Enable-OCP-debug-card/20220914-175427
        git checkout f4ff107abc0f057d0a55ced8a8db831db6f7d59e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:222.9-10 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
