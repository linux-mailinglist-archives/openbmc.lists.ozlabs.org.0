Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A1B4DC0C3
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 09:14:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK0LB4BkFz30CT
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 19:14:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W3oS46Q1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W3oS46Q1; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK0Kl3SVKz2xDD
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 19:14:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647504859; x=1679040859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XfM++llsVg7AzR19XcfpPkISpAk7yp2WcnUrhhsvXJ0=;
 b=W3oS46Q10E9pIHlhbp+Mn7LiaRFH8OPrninUyiLLfy58uysiIDgsaJ+a
 wzjAMOVv70xCeiBjXu8NxJYAsWemv4rUZKohVUgnV9JrL72j8WJ431N9Z
 lS83+UdWnn5RaMvsy2aOYISfWlpf1p3nDLFziL9r4ZYB5FQMzaDuEGGge
 lAZ/S5a8qxFhiGq9lAdkcth4uGWjSuyCBUNqTasJ77Anl+wLaNoeLlyyG
 XzVp8GzaAtsI1smah9tLTxfxPWdceGDw4oDmFHMcmxUiYFln/yEqfMSW4
 R5z30N3/8nrFLRwc5fN0nKfDJw1AthkomAXxG+6mImo/+K63F+x6p5pR1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237419227"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237419227"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 01:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="498748509"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2022 01:13:05 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUlFo-000DU7-HL; Thu, 17 Mar 2022 08:13:04 +0000
Date: Thu, 17 Mar 2022 16:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: Medad CChien <medadyoung@gmail.com>, rric@kernel.org,
 james.morse@arm.com, tony.luck@intel.com, mchehab@kernel.org,
 bp@alien8.de, robh+dt@kernel.org, benjaminfair@google.com,
 yuenn@google.com, venture@google.com, KWLIU@nuvoton.com,
 YSCHU@nuvoton.com, JJLIU0@nuvoton.com, KFTING@nuvoton.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 ctcchien@nuvoton.com
Subject: Re: [PATCH v5 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Message-ID: <202203171641.zYjMuQjO-lkp@intel.com>
References: <20220317015854.18864-4-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317015854.18864-4-ctcchien@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 openbmc@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Medad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on robh/for-next v5.17-rc8 next-20220316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Medad-CChien/EDAC-nuvoton-Add-nuvoton-NPCM-memory-controller-driver/20220317-100014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
config: riscv-randconfig-r033-20220317 (https://download.01.org/0day-ci/archive/20220317/202203171641.zYjMuQjO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/94dbdfede018043818636c4c749ba374a45eaba1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Medad-CChien/EDAC-nuvoton-Add-nuvoton-NPCM-memory-controller-driver/20220317-100014
        git checkout 94dbdfede018043818636c4c749ba374a45eaba1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/edac/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/edac/npcm_edac.c:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/edac/npcm_edac.c:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/edac/npcm_edac.c:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/edac/npcm_edac.c:370:6: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
           if (!readl(priv->reg + npcm_chip->ecc_ctl_en_reg) & npcm_chip->ecc_ctl_ecc_enable_mask)
               ^                                             ~
   drivers/edac/npcm_edac.c:370:6: note: add parentheses after the '!' to evaluate the bitwise operator first
           if (!readl(priv->reg + npcm_chip->ecc_ctl_en_reg) & npcm_chip->ecc_ctl_ecc_enable_mask)
               ^
                (                                                                                )
   drivers/edac/npcm_edac.c:370:6: note: add parentheses around left hand side expression to silence this warning
           if (!readl(priv->reg + npcm_chip->ecc_ctl_en_reg) & npcm_chip->ecc_ctl_ecc_enable_mask)
               ^
               (                                            )
>> drivers/edac/npcm_edac.c:579:6: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           u32 ecc_en = readl(reg + npcm_chip->ecc_ctl_en_reg);
               ^
   9 warnings generated.


vim +370 drivers/edac/npcm_edac.c

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
 > 370		if (!readl(priv->reg + npcm_chip->ecc_ctl_en_reg) & npcm_chip->ecc_ctl_ecc_enable_mask)
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
   386					edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME, "bit_no for checkcode must be 0~7\n");
   387					return count;
   388				}
   389				regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   390				regval = (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK)) |
   391					(check_synd[bit_no] << XOR_CHECK_BIT_SPLIT_WIDTH);
   392				writel(regval, priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
   393			} else if (!strcmp(args[1], "data")) {
   394				if (bit_no > 63) {
   395					edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME, "bit_no for data must be 0~63\n");
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
