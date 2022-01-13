Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C995048DF5D
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 22:04:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZcP25np5z30L4
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 08:04:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J2PzXCY6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J2PzXCY6; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZcNW3sbRz2xBL;
 Fri, 14 Jan 2022 08:03:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642107819; x=1673643819;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ftmbq4MhF254TtN2OkjaCBszJRBYw/W1sHTyP+uFt1U=;
 b=J2PzXCY6gKDsAFTi5iOgh1uPuvwslrKMlYba+6bW+TRTZGA8VDJhKFH+
 M99B7YoSpaqHGduUZy+BtKCy+Da9/2E3MjAx5ls6x074j8+OB28U6LSr3
 VZOgbSVWuzTMrwy6B7Bn/YkhnajBA+XINgonaTs+QLcBUIBi4kTTs15Wq
 ZzMI49r54SAkgrCEpNq09nnaumywK/WE3wMTuSTTHdfWs7k6o1c8ge32b
 AcaTTQ7St9xnd5sd6/dPtt4F9MGk+d4G3+IEyzSOtKj0FV+Enxqh82koa
 mV1rvHTEMtxscG44y//5/PhZw/62eWuO2LdZZsxSLDaORhzx+JIi3Ep3N g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="224801975"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="224801975"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 13:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="614099063"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2022 13:02:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n87EQ-0007dZ-IH; Thu, 13 Jan 2022 21:02:02 +0000
Date: Fri, 14 Jan 2022 05:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 05/13] peci: Add peci-aspeed controller driver
Message-ID: <202201140455.rWgkX1hh-lkp@intel.com>
References: <20220112230247.982212-6-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112230247.982212-6-iwona.winiarska@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 kbuild-all@lists.01.org, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Iwona,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linux/master linus/master v5.16 next-20220113]
[cannot apply to joel-aspeed/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Iwona-Winiarska/Introduce-PECI-subsystem/20220113-071131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: ia64-randconfig-r033-20220113 (https://download.01.org/0day-ci/archive/20220114/202201140455.rWgkX1hh-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9b4f2401a427cff2efc191f507d73ec8ae1ad872
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Iwona-Winiarska/Introduce-PECI-subsystem/20220113-071131
        git checkout 9b4f2401a427cff2efc191f507d73ec8ae1ad872
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_clk_hw_register" [drivers/peci/controller/peci-aspeed.ko] undefined!
>> ERROR: modpost: "__clk_get_name" [drivers/peci/controller/peci-aspeed.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
