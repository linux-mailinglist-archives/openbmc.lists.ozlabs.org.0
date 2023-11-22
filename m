Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359607F3BA6
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 03:13:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hxnuo2KE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZlCk0p0jz3cm7
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 13:13:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hxnuo2KE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZlC42vn1z30hn
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 13:13:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700619184; x=1732155184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vGgCVJZAzwFeJ/BnDdyLhuK1uu1PtrJEymLox/XM/rA=;
  b=Hxnuo2KE4PKtuI+Uo7NOVrUKV+8oVXwGwsJW6L6M7XeYCyScZ1nldsch
   OOFtjQ/teXmY26cfxFmi1hw0IaCfS+Yfpp70V4zTvJxwlmeuOrj7xi9ci
   h5l1H8Gu6ZMBEQjQ0+trL7BsLSBdMHY8FXnFTXwAHcmQONu9RhAiAUsJz
   LSCFA3+W+Dw1UtQ+LKeGtfWUc6uGJXHvymmzpn0PS6qCbsERfjIRc6ZGt
   Heij3Jozc0GrsigGv0zf2EsWNOcOyBSVHWZ4rnRaWRz/264dkXbnlsfQB
   xyRzMIWktz3B2XjdjD8cFoGOWW5j8v9f4YvPN08LAdpKc4bBtIazRJPn7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="423054757"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="423054757"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 18:12:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="940275900"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="940275900"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Nov 2023 18:12:50 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5cj6-0008XB-1W;
	Wed, 22 Nov 2023 02:12:39 +0000
Date: Wed, 22 Nov 2023 10:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, davem@davemloft.net,
	edumazet@google.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com,
	peppe.cavallaro@st.com, joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com, avifishman70@gmail.com,
	tali.perry1@gmail.com, joel@jms.id.au, andrew@codeconstruct.com.au,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	j.neuschaefer@gmx.net
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
Message-ID: <202311221011.bsAmeQ6v-lkp@intel.com>
References: <20231121151733.2015384-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121151733.2015384-3-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-net-Add-support-NPCM-dwmac/20231121-231908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231121151733.2015384-3-tmaimon77%40gmail.com
patch subject: [PATCH v1 2/2] net: stmmac: Add NPCM support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231122/202311221011.bsAmeQ6v-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221011.bsAmeQ6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221011.bsAmeQ6v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c:53:6: warning: no previous prototype for function 'npcm_dwmac_pcs_init' [-Wmissing-prototypes]
   void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
        ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
   ^
   static 
   1 warning generated.


vim +/npcm_dwmac_pcs_init +53 drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c

    52	
  > 53	void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
    54				 struct plat_stmmacenet_data *plat_dat)
    55	{
    56		u16 val;
    57	
    58		iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
    59		val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
    60		val |= PCS_RST;
    61		iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
    62	
    63		while (val & PCS_RST)
    64			val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
    65	
    66		val &= ~(PCS_AN_ENABLE);
    67		iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
