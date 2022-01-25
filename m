Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0149B527
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 14:33:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjnqk4rqYz3bXV
	for <lists+openbmc@lfdr.de>; Wed, 26 Jan 2022 00:33:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SoW7RWo/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SoW7RWo/; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjnqF31SCz301v;
 Wed, 26 Jan 2022 00:33:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643117593; x=1674653593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D7hlzJPeHygbU5POvuC9qTcjfzuKUzeZK78Zs9FRQi0=;
 b=SoW7RWo/pgmKg6SjSEjPmXnnEyPr25Q2n5OwucK45RkclUMtGXUGrT2d
 CEeaQzCTSazL8V09R6sRWh8FdjeUwrS8umx03qV6Jy80fjSyn2oaqx1tX
 y9n3X7AVQUWIbM4c51Sve90n4ztgz3BmcFdQRkSYSpFJdPl4wsaJAkkve
 fKSgu12/QOQ6CFv0NUgymebArwZjtkbAtJZBA0mtQ+clJrzg5pcBbtn4j
 E22yQWBALs2mVV4ouqPCl289Kgudqc9rl/fZHPPVRww7dX5VYXVDucncO
 c7Ii3RGUjqxynvXkgOK5Q5hSLwzpUQNNXBdN2XR8vPIzDTdR5tpYfOpjK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246080069"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="246080069"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="627928236"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 25 Jan 2022 05:31:57 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nCLvQ-000Jwk-AH; Tue, 25 Jan 2022 13:31:56 +0000
Date: Tue, 25 Jan 2022 21:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 05/13] peci: Add peci-aspeed controller driver
Message-ID: <202201252130.U4qxBhmg-lkp@intel.com>
References: <20220125011104.2480133-6-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125011104.2480133-6-iwona.winiarska@intel.com>
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
[also build test ERROR on linux/master linus/master v5.17-rc1 next-20220125]
[cannot apply to joel-aspeed/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Iwona-Winiarska/Introduce-PECI-subsystem/20220125-115946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220125/202201252130.U4qxBhmg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/35075a61a26913806122a9b500915dc66ad678bd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Iwona-Winiarska/Introduce-PECI-subsystem/20220125-115946
        git checkout 35075a61a26913806122a9b500915dc66ad678bd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=sh SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/clk.c:856:6: error: redefinition of 'clk_unprepare'
     856 | void clk_unprepare(struct clk *clk)
         |      ^~~~~~~~~~~~~
   In file included from drivers/clk/clk.c:9:
   include/linux/clk.h:303:20: note: previous definition of 'clk_unprepare' with type 'void(struct clk *)'
     303 | static inline void clk_unprepare(struct clk *clk)
         |                    ^~~~~~~~~~~~~
>> drivers/clk/clk.c:937:5: error: redefinition of 'clk_prepare'
     937 | int clk_prepare(struct clk *clk)
         |     ^~~~~~~~~~~
   In file included from drivers/clk/clk.c:9:
   include/linux/clk.h:271:19: note: previous definition of 'clk_prepare' with type 'int(struct clk *)'
     271 | static inline int clk_prepare(struct clk *clk)
         |                   ^~~~~~~~~~~
>> drivers/clk/clk.c:1183:6: error: redefinition of 'clk_is_enabled_when_prepared'
    1183 | bool clk_is_enabled_when_prepared(struct clk *clk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/clk.c:9:
   include/linux/clk.h:284:20: note: previous definition of 'clk_is_enabled_when_prepared' with type 'bool(struct clk *)' {aka '_Bool(struct clk *)'}
     284 | static inline bool clk_is_enabled_when_prepared(struct clk *clk)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK
   Depends on !HAVE_LEGACY_CLK
   Selected by
   - PECI_ASPEED && PECI && (ARCH_ASPEED || COMPILE_TEST && OF && HAS_IOMEM


vim +/clk_unprepare +856 drivers/clk/clk.c

a6adc30ba7bef8 Dong Aisheng     2016-06-30  844  
4dff95dc9477a3 Stephen Boyd     2015-04-30  845  /**
4dff95dc9477a3 Stephen Boyd     2015-04-30  846   * clk_unprepare - undo preparation of a clock source
4dff95dc9477a3 Stephen Boyd     2015-04-30  847   * @clk: the clk being unprepared
4dff95dc9477a3 Stephen Boyd     2015-04-30  848   *
4dff95dc9477a3 Stephen Boyd     2015-04-30  849   * clk_unprepare may sleep, which differentiates it from clk_disable.  In a
4dff95dc9477a3 Stephen Boyd     2015-04-30  850   * simple case, clk_unprepare can be used instead of clk_disable to gate a clk
4dff95dc9477a3 Stephen Boyd     2015-04-30  851   * if the operation may sleep.  One example is a clk which is accessed over
4dff95dc9477a3 Stephen Boyd     2015-04-30  852   * I2c.  In the complex case a clk gate operation may require a fast and a slow
4dff95dc9477a3 Stephen Boyd     2015-04-30  853   * part.  It is this reason that clk_unprepare and clk_disable are not mutually
4dff95dc9477a3 Stephen Boyd     2015-04-30  854   * exclusive.  In fact clk_disable must be called before clk_unprepare.
4dff95dc9477a3 Stephen Boyd     2015-04-30  855   */
4dff95dc9477a3 Stephen Boyd     2015-04-30 @856  void clk_unprepare(struct clk *clk)
b2476490ef1113 Mike Turquette   2012-03-15  857  {
4dff95dc9477a3 Stephen Boyd     2015-04-30  858  	if (IS_ERR_OR_NULL(clk))
4dff95dc9477a3 Stephen Boyd     2015-04-30  859  		return;
b2476490ef1113 Mike Turquette   2012-03-15  860  
a6adc30ba7bef8 Dong Aisheng     2016-06-30  861  	clk_core_unprepare_lock(clk->core);
1e435256d625c2 Olof Johansson   2013-04-27  862  }
4dff95dc9477a3 Stephen Boyd     2015-04-30  863  EXPORT_SYMBOL_GPL(clk_unprepare);
1e435256d625c2 Olof Johansson   2013-04-27  864  
4dff95dc9477a3 Stephen Boyd     2015-04-30  865  static int clk_core_prepare(struct clk_core *core)
4dff95dc9477a3 Stephen Boyd     2015-04-30  866  {
4dff95dc9477a3 Stephen Boyd     2015-04-30  867  	int ret = 0;
b2476490ef1113 Mike Turquette   2012-03-15  868  
a63347251907d7 Stephen Boyd     2015-05-06  869  	lockdep_assert_held(&prepare_lock);
a63347251907d7 Stephen Boyd     2015-05-06  870  
4dff95dc9477a3 Stephen Boyd     2015-04-30  871  	if (!core)
4dff95dc9477a3 Stephen Boyd     2015-04-30  872  		return 0;
b2476490ef1113 Mike Turquette   2012-03-15  873  
4dff95dc9477a3 Stephen Boyd     2015-04-30  874  	if (core->prepare_count == 0) {
9a34b45397e5a3 Marek Szyprowski 2017-08-21  875  		ret = clk_pm_runtime_get(core);
4dff95dc9477a3 Stephen Boyd     2015-04-30  876  		if (ret)
4dff95dc9477a3 Stephen Boyd     2015-04-30  877  			return ret;
b2476490ef1113 Mike Turquette   2012-03-15  878  
9a34b45397e5a3 Marek Szyprowski 2017-08-21  879  		ret = clk_core_prepare(core->parent);
9a34b45397e5a3 Marek Szyprowski 2017-08-21  880  		if (ret)
9a34b45397e5a3 Marek Szyprowski 2017-08-21  881  			goto runtime_put;
9a34b45397e5a3 Marek Szyprowski 2017-08-21  882  
4dff95dc9477a3 Stephen Boyd     2015-04-30  883  		trace_clk_prepare(core);
1c155b3dfe0835 Ulf Hansson      2013-03-12  884  
4dff95dc9477a3 Stephen Boyd     2015-04-30  885  		if (core->ops->prepare)
4dff95dc9477a3 Stephen Boyd     2015-04-30  886  			ret = core->ops->prepare(core->hw);
1c155b3dfe0835 Ulf Hansson      2013-03-12  887  
4dff95dc9477a3 Stephen Boyd     2015-04-30  888  		trace_clk_prepare_complete(core);
b2476490ef1113 Mike Turquette   2012-03-15  889  
9a34b45397e5a3 Marek Szyprowski 2017-08-21  890  		if (ret)
9a34b45397e5a3 Marek Szyprowski 2017-08-21  891  			goto unprepare;
b2476490ef1113 Mike Turquette   2012-03-15  892  	}
b2476490ef1113 Mike Turquette   2012-03-15  893  
4dff95dc9477a3 Stephen Boyd     2015-04-30  894  	core->prepare_count++;
b2476490ef1113 Mike Turquette   2012-03-15  895  
9461f7b33d11cb Jerome Brunet    2018-06-19  896  	/*
9461f7b33d11cb Jerome Brunet    2018-06-19  897  	 * CLK_SET_RATE_GATE is a special case of clock protection
9461f7b33d11cb Jerome Brunet    2018-06-19  898  	 * Instead of a consumer claiming exclusive rate control, it is
9461f7b33d11cb Jerome Brunet    2018-06-19  899  	 * actually the provider which prevents any consumer from making any
9461f7b33d11cb Jerome Brunet    2018-06-19  900  	 * operation which could result in a rate change or rate glitch while
9461f7b33d11cb Jerome Brunet    2018-06-19  901  	 * the clock is prepared.
9461f7b33d11cb Jerome Brunet    2018-06-19  902  	 */
9461f7b33d11cb Jerome Brunet    2018-06-19  903  	if (core->flags & CLK_SET_RATE_GATE)
9461f7b33d11cb Jerome Brunet    2018-06-19  904  		clk_core_rate_protect(core);
9461f7b33d11cb Jerome Brunet    2018-06-19  905  
4dff95dc9477a3 Stephen Boyd     2015-04-30  906  	return 0;
9a34b45397e5a3 Marek Szyprowski 2017-08-21  907  unprepare:
9a34b45397e5a3 Marek Szyprowski 2017-08-21  908  	clk_core_unprepare(core->parent);
9a34b45397e5a3 Marek Szyprowski 2017-08-21  909  runtime_put:
9a34b45397e5a3 Marek Szyprowski 2017-08-21  910  	clk_pm_runtime_put(core);
9a34b45397e5a3 Marek Szyprowski 2017-08-21  911  	return ret;
b2476490ef1113 Mike Turquette   2012-03-15  912  }
b2476490ef1113 Mike Turquette   2012-03-15  913  
a6adc30ba7bef8 Dong Aisheng     2016-06-30  914  static int clk_core_prepare_lock(struct clk_core *core)
a6adc30ba7bef8 Dong Aisheng     2016-06-30  915  {
a6adc30ba7bef8 Dong Aisheng     2016-06-30  916  	int ret;
a6adc30ba7bef8 Dong Aisheng     2016-06-30  917  
a6adc30ba7bef8 Dong Aisheng     2016-06-30  918  	clk_prepare_lock();
a6adc30ba7bef8 Dong Aisheng     2016-06-30  919  	ret = clk_core_prepare(core);
a6adc30ba7bef8 Dong Aisheng     2016-06-30  920  	clk_prepare_unlock();
a6adc30ba7bef8 Dong Aisheng     2016-06-30  921  
a6adc30ba7bef8 Dong Aisheng     2016-06-30  922  	return ret;
a6adc30ba7bef8 Dong Aisheng     2016-06-30  923  }
a6adc30ba7bef8 Dong Aisheng     2016-06-30  924  
4dff95dc9477a3 Stephen Boyd     2015-04-30  925  /**
4dff95dc9477a3 Stephen Boyd     2015-04-30  926   * clk_prepare - prepare a clock source
4dff95dc9477a3 Stephen Boyd     2015-04-30  927   * @clk: the clk being prepared
4dff95dc9477a3 Stephen Boyd     2015-04-30  928   *
4dff95dc9477a3 Stephen Boyd     2015-04-30  929   * clk_prepare may sleep, which differentiates it from clk_enable.  In a simple
4dff95dc9477a3 Stephen Boyd     2015-04-30  930   * case, clk_prepare can be used instead of clk_enable to ungate a clk if the
4dff95dc9477a3 Stephen Boyd     2015-04-30  931   * operation may sleep.  One example is a clk which is accessed over I2c.  In
4dff95dc9477a3 Stephen Boyd     2015-04-30  932   * the complex case a clk ungate operation may require a fast and a slow part.
4dff95dc9477a3 Stephen Boyd     2015-04-30  933   * It is this reason that clk_prepare and clk_enable are not mutually
4dff95dc9477a3 Stephen Boyd     2015-04-30  934   * exclusive.  In fact clk_prepare must be called before clk_enable.
4dff95dc9477a3 Stephen Boyd     2015-04-30  935   * Returns 0 on success, -EERROR otherwise.
4dff95dc9477a3 Stephen Boyd     2015-04-30  936   */
4dff95dc9477a3 Stephen Boyd     2015-04-30 @937  int clk_prepare(struct clk *clk)
b2476490ef1113 Mike Turquette   2012-03-15  938  {
035a61c314eb3d Tomeu Vizoso     2015-01-23  939  	if (!clk)
4dff95dc9477a3 Stephen Boyd     2015-04-30  940  		return 0;
035a61c314eb3d Tomeu Vizoso     2015-01-23  941  
a6adc30ba7bef8 Dong Aisheng     2016-06-30  942  	return clk_core_prepare_lock(clk->core);
7ef3dcc8145263 James Hogan      2013-07-29  943  }
4dff95dc9477a3 Stephen Boyd     2015-04-30  944  EXPORT_SYMBOL_GPL(clk_prepare);
035a61c314eb3d Tomeu Vizoso     2015-01-23  945  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
