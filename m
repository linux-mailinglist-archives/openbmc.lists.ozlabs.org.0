Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B0B4D6AE9
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 00:27:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFhtF627yz30HZ
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 10:27:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eyKtezes;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eyKtezes; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFhsp4fqxz2xgb
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2022 10:27:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647041230; x=1678577230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FhLI30JK+BcSkM8Wok3yK+8l0ZbaHT6oDrtnpTgbszc=;
 b=eyKtezes59Xmi3majWJLk7GsgGlTGQ8S2XC5JoiLnGbi7iOyd87PQLg7
 kGpSdRSsbNkxUHg9/hb+qBDQYe6l20ffuXWan0GbwgBKsrrRcfamN8Vbp
 i4wqFejBCjuOshQp1e1dMTfBL0DDuPsdqBVZH3/oXEOPZ2DviIzUY2nKR
 WQH8rxckX6beTWQZD8MIkedgpqvUGayLGsnLvuQhLbVIBymm0BFa3BvKj
 c0lmHFxSk/cBLXRkByE2gHEYJUGJ82SMdNYS0Jdk3ah5qlHIInyNV607v
 dCZB02+bJuUtfdXSu46VQdkeeBiYtcvbt6SPqUYKZ/y9zJ5j9lcHq4cxm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="255861622"
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; d="scan'208";a="255861622"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 15:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; d="scan'208";a="579448467"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 11 Mar 2022 15:25:56 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSodv-0007FQ-CD; Fri, 11 Mar 2022 23:25:55 +0000
Date: Sat, 12 Mar 2022 07:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Medad CChien <medadyoung@gmail.com>, rric@kernel.org,
 james.morse@arm.com, tony.luck@intel.com, mchehab@kernel.org,
 bp@alien8.de, robh+dt@kernel.org, benjaminfair@google.com,
 yuenn@google.com, venture@google.com, KWLIU@nuvoton.com,
 YSCHU@nuvoton.com, JJLIU0@nuvoton.com, KFTING@nuvoton.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 ctcchien@nuvoton.com
Subject: Re: [PATCH v3 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Message-ID: <202203120713.ExrZZZo2-lkp@intel.com>
References: <20220311014245.4612-4-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311014245.4612-4-ctcchien@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Medad,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on ras/edac-for-next]
[also build test ERROR on robh/for-next v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Medad-CChien/EDAC-nuvoton-Add-nuvoton-NPCM-memory-controller-driver/20220311-094500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20220312/202203120713.ExrZZZo2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6cb0bb6039e1ce83a8d67c6d571abd2a45e82b10
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Medad-CChien/EDAC-nuvoton-Add-nuvoton-NPCM-memory-controller-driver/20220311-094500
        git checkout 6cb0bb6039e1ce83a8d67c6d571abd2a45e82b10
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/kernel/ arch/arm/mach-imx/ arch/arm/mach-omap2/ arch/arm/mach-socfpga/ arch/arm/mach-tegra/ drivers/edac/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/edac/npcm_edac.c: In function 'forced_ecc_error_store':
   drivers/edac/npcm_edac.c:370:13: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Wparentheses]
     370 |         if (!readl(priv->reg + npcm_chip->ecc_ctl_en_reg) & npcm_chip->ecc_ctl_ecc_enable_mask)
>> drivers/edac/npcm_edac.c:386:92: error: macro "edac_printk" requires 4 arguments, but only 2 given
     386 |                                 edac_printk(KERN_INFO, "bit_no for checkcode must be 0~7\n");
         |                                                                                            ^
   In file included from drivers/edac/edac_module.h:14,
                    from drivers/edac/npcm_edac.c:15:
   drivers/edac/edac_mc.h:48: note: macro "edac_printk" defined here
      48 | #define edac_printk(level, prefix, fmt, arg...) \
         | 
>> drivers/edac/npcm_edac.c:386:33: error: 'edac_printk' undeclared (first use in this function); did you mean '_dev_printk'?
     386 |                                 edac_printk(KERN_INFO, "bit_no for checkcode must be 0~7\n");
         |                                 ^~~~~~~~~~~
         |                                 _dev_printk
   drivers/edac/npcm_edac.c:386:33: note: each undeclared identifier is reported only once for each function it appears in
   drivers/edac/npcm_edac.c:395:88: error: macro "edac_printk" requires 4 arguments, but only 2 given
     395 |                                 edac_printk(KERN_INFO, "bit_no for data must be 0~63\n");
         |                                                                                        ^
   In file included from drivers/edac/edac_module.h:14,
                    from drivers/edac/npcm_edac.c:15:
   drivers/edac/edac_mc.h:48: note: macro "edac_printk" defined here
      48 | #define edac_printk(level, prefix, fmt, arg...) \
         | 
   drivers/edac/npcm_edac.c: In function 'npcm_edac_mc_probe':
   drivers/edac/npcm_edac.c:583:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     583 |         u32 ecc_en = readl(reg + npcm_chip->ecc_ctl_en_reg);
         |         ^~~


vim +/edac_printk +386 drivers/edac/npcm_edac.c

   352	
   353	static ssize_t forced_ecc_error_store(struct device *dev,
   354					      struct device_attribute *mattr,
   355					      const char *data, size_t count)
   356	{
   357		struct mem_ctl_info *mci = to_mci(dev);
   358		struct priv_data *priv = mci->pvt_info;
   359		const struct npcm_edac_platform_data *npcm_chip = priv->npcm_chip;
   360		int	args_cnt;
   361		int	ret;
   362		char	**args;
   363		u32	regval;
   364		u8	bit_no;
   365	
   366		/* Split string buffer into separate parameters */
   367		args = argv_split(GFP_KERNEL, data, &args_cnt);
   368	
   369		/* Check ecc enabled */
   370		if (!readl(priv->reg + npcm_chip->ecc_ctl_en_reg) & npcm_chip->ecc_ctl_ecc_enable_mask)
   371			return count;
   372	
   373		/* Check no write operation pending to controller*/
   374		while (readl(priv->reg + npcm_chip->ddr_ctl_controller_busy_reg) &
   375				CTL_CONTROLLER_BUSY_FLAG) {
   376			usleep_range(1000, 10000);
   377		}
   378	
   379		/* Write appropriate syndrome to xor_check_bit*/
   380		if (!strcmp(args[0], "CE") && args_cnt == 3) {
   381			ret = kstrtou8(args[2], 0, &bit_no);
   382			if (ret)
   383				return ret;
   384			if (!strcmp(args[1], "checkcode")) {
   385				if (bit_no > 7) {
 > 386					edac_printk(KERN_INFO, "bit_no for checkcode must be 0~7\n");
   387					return count;
   388				}
   389				regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   390				regval = (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK)) |
   391					(check_synd[bit_no] << XOR_CHECK_BIT_SPLIT_WIDTH);
   392				writel(regval, priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   393			} else if (!strcmp(args[1], "data")) {
   394				if (bit_no > 63) {
   395					edac_printk(KERN_INFO, "bit_no for data must be 0~63\n");
   396					return count;
   397				}
   398				regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   399				regval = (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK)) |
   400						 (data_synd[bit_no] << XOR_CHECK_BIT_SPLIT_WIDTH);
   401				writel(regval, priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   402			}
   403			/* Enable the ECC writeback_en for corrected error */
   404			regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   405			writel((regval | NPCM_ECC_CTL_AUTO_WRITEBACK_EN),
   406			       priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   407		} else if (!strcmp(args[0], "UE")) {
   408			regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   409			regval = (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK)) |
   410					 (ECC_DOUBLE_MULTI_ERR_SYND << XOR_CHECK_BIT_SPLIT_WIDTH);
   411			writel(regval, priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   412		}
   413	
   414		/* Assert fwc */
   415		writel((NPCM_ECC_CTL_FORCE_WC | readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg)),
   416		       priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   417	
   418		return count;
   419	}
   420	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
