Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28457793E
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 03:25:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmPQm3FwJz3c1G
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:25:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R3740FuT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R3740FuT;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmPQK2hNHz30D0
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 11:24:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658107481; x=1689643481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2EKYGRxFwOowb+2/VvkXh77NNCMzCGVW6f9edVohmqU=;
  b=R3740FuTj8uj7LOTwAP0j2NgTsOUDD8j/CALqPtblfuYMwUaUEw62uMN
   WeLLAxVFZ/WmCaK8BSe8tVeSVGEUYQqIZ0kaAGb3jMCt7CU+iFob9Qc4+
   OuKwZMeiK84m8H6g6OygTnUgR0IVipdxCW67B3l6tDOt4PKQxiWdwgPJe
   AF1pLfVT/0svoqpOo+m4yiULiooWJyN/w7lg9zNVX4HMGYx1AJnouv0lZ
   QiLkzzfB4ogS5u+kY3iSJEOaDp2MEdc7WuCjZoZa04Fy8wwFEbOYdNXa5
   DGua8lGffT2PoFKjdbGmnkO+tMSYztvGh6a0BXgCphdSMAF9GzUytsWTf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="287252415"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="287252415"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 18:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="843105175"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2022 18:24:25 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDFUm-0003rU-Q9;
	Mon, 18 Jul 2022 01:24:24 +0000
Date: Mon, 18 Jul 2022 09:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
	tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, linus.walleij@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	j.neuschaefer@gmx.net, zhengbin13@huawei.com
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO
 driver
Message-ID: <202207180959.yy7mZtRy-lkp@intel.com>
References: <20220714122322.63663-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714122322.63663-3-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linus/master v5.19-rc7 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/pinctrl-nuvoton-add-pinmux-and-GPIO-driver-for-NPCM8XX/20220714-202424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220718/202207180959.yy7mZtRy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0a5f158322b21ab2b71cc606adc2ee7573d8be0d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomer-Maimon/pinctrl-nuvoton-add-pinmux-and-GPIO-driver-for-NPCM8XX/20220714-202424
        git checkout 0a5f158322b21ab2b71cc606adc2ee7573d8be0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/i2c/ drivers/net/pcs/ drivers/pinctrl/nuvoton/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:481:18: warning: unused variable 'smb14b_pins' [-Wunused-const-variable]
   static const int smb14b_pins[] = { 32, 187 };
                    ^
   1 warning generated.


vim +/smb14b_pins +481 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c

   439	
   440	static const int smb0_pins[]  = { 115, 114 };
   441	static const int smb0b_pins[] = { 195, 194 };
   442	static const int smb0c_pins[] = { 202, 196 };
   443	static const int smb0d_pins[] = { 198, 199 };
   444	static const int smb0den_pins[] = { 197 };
   445	static const int smb1_pins[]  = { 117, 116 };
   446	static const int smb1b_pins[] = { 126, 127 };
   447	static const int smb1c_pins[] = { 124, 125 };
   448	static const int smb1d_pins[] = { 4, 5 };
   449	static const int smb2_pins[]  = { 119, 118 };
   450	static const int smb2b_pins[] = { 122, 123 };
   451	static const int smb2c_pins[] = { 120, 121 };
   452	static const int smb2d_pins[] = { 6, 7 };
   453	static const int smb3_pins[]  = { 30, 31 };
   454	static const int smb3b_pins[] = { 39, 40 };
   455	static const int smb3c_pins[] = { 37, 38 };
   456	static const int smb3d_pins[] = { 59, 60 };
   457	static const int smb4_pins[]  = { 28, 29 };
   458	static const int smb4b_pins[] = { 18, 19 };
   459	static const int smb4c_pins[] = { 20, 21 };
   460	static const int smb4d_pins[] = { 22, 23 };
   461	static const int smb4den_pins[] = { 17 };
   462	static const int smb5_pins[]  = { 26, 27 };
   463	static const int smb5b_pins[] = { 13, 12 };
   464	static const int smb5c_pins[] = { 15, 14 };
   465	static const int smb5d_pins[] = { 94, 93 };
   466	static const int smb6_pins[]  = { 172, 171 };
   467	static const int smb6b_pins[] = { 2, 3 };
   468	static const int smb6c_pins[]  = { 0, 1 };
   469	static const int smb6d_pins[]  = { 10, 11 };
   470	static const int smb7_pins[]  = { 174, 173 };
   471	static const int smb7b_pins[]  = { 16, 141 };
   472	static const int smb7c_pins[]  = { 24, 25 };
   473	static const int smb7d_pins[]  = { 142, 143 };
   474	static const int smb8_pins[]  = { 129, 128 };
   475	static const int smb9_pins[]  = { 131, 130 };
   476	static const int smb10_pins[] = { 133, 132 };
   477	static const int smb11_pins[] = { 135, 134 };
   478	static const int smb12_pins[] = { 221, 220 };
   479	static const int smb13_pins[] = { 223, 222 };
   480	static const int smb14_pins[] = { 22, 23 };
 > 481	static const int smb14b_pins[] = { 32, 187 };
   482	static const int smb15_pins[] = { 20, 21 };
   483	static const int smb15b_pins[] = { 192, 191 };
   484	static const int smb16_pins[] = { 10, 11 };
   485	static const int smb16b_pins[] = { 218, 219 };
   486	static const int smb17_pins[] = { 3, 2 };
   487	static const int smb18_pins[] = { 0, 1 };
   488	static const int smb19_pins[] = { 60, 59 };
   489	static const int smb20_pins[] = { 234, 235 };
   490	static const int smb21_pins[] = { 169, 170 };
   491	static const int smb22_pins[] = { 40, 39 };
   492	static const int smb23_pins[] = { 38, 37 };
   493	static const int smb23b_pins[] = { 134, 134 };
   494	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
