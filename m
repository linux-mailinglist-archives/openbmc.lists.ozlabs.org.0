Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D754E2A92
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 15:26:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMcPY17tgz30Ph
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 01:26:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VewZZqI9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VewZZqI9; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMcP50nKpz2yxV
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 01:26:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647872777; x=1679408777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZRgMOrMKRu4QklsqExf2gmjTp684KRU6lmpsY+ibWYM=;
 b=VewZZqI9aZsE+PPuovDrEV11VR2+sPXYFjgg/J1vEL2ueFKaVXaIE1MS
 LEqKcHX2IpDgEacfu4ye62tpA3guWdT93Nn40kUMks9Zxn94uwc/4qPmm
 DtsA+IxzexO5QwSIWVnmci+JYmX2hPWW3rVqp1VtqSZWrTuSB2DHMzUrw
 y1/4q+ogw3XzdQWrGxgq7GHCLtzoIzKIQSoNgmI9ZhywH83QaA8jaFofv
 6iQjqgqlwyxdj2j4Dfavp6ZEQQFpIjWYRn8rxXWQFDKPZ2BLL0BnJ3NXZ
 LY2Q41AlEUtnijsGa+EWJhz9N2/uCYKpwZQQ0Nftc1wE5nJ1ND+y0yFGh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257281840"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="257281840"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 07:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="824465825"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 21 Mar 2022 07:25:01 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWIxu-000HtG-Qp; Mon, 21 Mar 2022 14:24:58 +0000
Date: Mon, 21 Mar 2022 22:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thu Nguyen <thu@os.amperecomputing.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v7 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <202203212244.dJ8wLdCt-lkp@intel.com>
References: <20220321081355.6802-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321081355.6802-4-quan@os.amperecomputing.com>
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
Cc: Open Source Submission <patches@amperecomputing.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Phong Vo <phong@os.amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Quan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on groeck-staging/hwmon-next lee-mfd/for-mfd-next v5.17 next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Quan-Nguyen/Add-Ampere-s-Altra-SMPro-MFD-and-its-child-drivers/20220321-161811
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git 37fd83916da2e4cae03d350015c82a67b1b334c4
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220321/202203212244.dJ8wLdCt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3e85c45303bab9bd02a4761bc7e182fb001ac625
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Quan-Nguyen/Add-Ampere-s-Altra-SMPro-MFD-and-its-child-drivers/20220321-161811
        git checkout 3e85c45303bab9bd02a4761bc7e182fb001ac625
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hwmon/ drivers/misc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/misc/smpro-errmon.c:276:6: warning: variable 'data_hi' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (addr2 != 0xff) {
               ^~~~~~~~~~~~~
   drivers/misc/smpro-errmon.c:303:28: note: uninitialized use occurs here
                            ret_hi & 0xff, ret_lo, data_hi, data_lo);
                                                   ^~~~~~~
   drivers/misc/smpro-errmon.c:276:2: note: remove the 'if' if its condition is always true
           if (addr2 != 0xff) {
           ^~~~~~~~~~~~~~~~~~~
   drivers/misc/smpro-errmon.c:265:47: note: initialize the variable 'data_hi' to silence this warning
           unsigned int ret_hi, ret_lo, data_lo, data_hi;
                                                        ^
                                                         = 0
>> drivers/misc/smpro-errmon.c:276:6: warning: variable 'data_lo' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (addr2 != 0xff) {
               ^~~~~~~~~~~~~
   drivers/misc/smpro-errmon.c:303:37: note: uninitialized use occurs here
                            ret_hi & 0xff, ret_lo, data_hi, data_lo);
                                                            ^~~~~~~
   drivers/misc/smpro-errmon.c:276:2: note: remove the 'if' if its condition is always true
           if (addr2 != 0xff) {
           ^~~~~~~~~~~~~~~~~~~
   drivers/misc/smpro-errmon.c:265:38: note: initialize the variable 'data_lo' to silence this warning
           unsigned int ret_hi, ret_lo, data_lo, data_hi;
                                               ^
                                                = 0
   2 warnings generated.


vim +276 drivers/misc/smpro-errmon.c

   261	
   262	static s32 smpro_internal_err_get_info(struct regmap *regmap, u8 addr, u8 addr1,
   263					       u8 addr2, u8 addr3, u8 subtype, char *buf)
   264	{
   265		unsigned int ret_hi, ret_lo, data_lo, data_hi;
   266		int ret;
   267	
   268		ret = regmap_read(regmap, addr, &ret_lo);
   269		if (ret)
   270			return ret;
   271	
   272		ret = regmap_read(regmap, addr1, &ret_hi);
   273		if (ret)
   274			return ret;
   275	
 > 276		if (addr2 != 0xff) {
   277			ret = regmap_read(regmap, addr2, &data_lo);
   278			if (ret)
   279				return ret;
   280			ret = regmap_read(regmap, addr3, &data_hi);
   281			if (ret)
   282				return ret;
   283		}
   284		/*
   285		 * Output format:
   286		 * <errType> <image> <dir> <Location> <errorCode> <data>
   287		 * Where:
   288		 *   + errType: SCP Error Type (3 bits)
   289		 *      1: Warning
   290		 *      2: Error
   291		 *      4: Error with data
   292		 *   + image: SCP Image Code (8 bits)
   293		 *   + dir: Direction (1 bit)
   294		 *      0: Enter
   295		 *      1: Exit
   296		 *   + location: SCP Module Location Code (8 bits)
   297		 *   + errorCode: SCP Error Code (16 bits)
   298		 *   + data : Extensive data (32 bits)
   299		 *      All bits are 0 when errType is warning or error.
   300		 */
   301		return scnprintf(buf, MAX_MSG_LEN, "%01x %02x %01x %02x %04x %04x%04x\n",
   302				 subtype, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
   303				 ret_hi & 0xff, ret_lo, data_hi, data_lo);
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
