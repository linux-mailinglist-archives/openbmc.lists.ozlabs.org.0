Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A69465A3
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2024 23:55:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SdQYghmz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbKQ870Rgz3fRv
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2024 07:55:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SdQYghmz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 03 Aug 2024 07:54:58 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbKPZ502Zz3dSk
	for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2024 07:54:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722635699; x=1754171699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RERWMdBecekBtXMyvnP2+fJUfUwH6k4q645hRgNjC2o=;
  b=SdQYghmzJVYBQ/BBNhRh7Q+HafVWzfJy4Ml1ccoXxNIQhnhVyzhxJIbR
   K2y1qMH7Vlp+sT4pr13B7cYFVsmblONhwN4O/5aUAhNssuxXf2abd/NJU
   mV/rQSOCbq4lq8cVGgNRUbyptM0L1H0M34lvCh0am/dgv72uihpU7A8rn
   q1ltUB1p5fN6OZkr2t35XePk3EqW00YrHCZlRgMOdd9O3VY77a7HPHrKL
   bxg5evvLY4XdCQpkTuhxdYsi0qFdtlJ0MCAV+u4pDPRGP8PPM/iPNIvEc
   oDTh4PGzGFwXCBqk2ye1XDO1YNmd3+RpLzqkhu966/4FAGsx00DoMJuet
   g==;
X-CSE-ConnectionGUID: pyl/XXTeRQeeHxu5h57QQQ==
X-CSE-MsgGUID: vUO6ByGMR7KrN0seQPNPEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20485825"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="20485825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 14:53:44 -0700
X-CSE-ConnectionGUID: lYEDvgI9SI+i0B4Xm672GQ==
X-CSE-MsgGUID: GZckaPaMReSP4vRAQQ3New==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="55184276"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Aug 2024 14:53:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa0DS-000xTI-2X;
	Fri, 02 Aug 2024 21:53:38 +0000
Date: Sat, 3 Aug 2024 05:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chu <stanley.chuys@gmail.com>, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
Message-ID: <202408030543.PWRuy07u-lkp@intel.com>
References: <20240801071946.43266-3-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801071946.43266-3-yschu@nuvoton.com>
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, cpchiang1@nuvoton.com, oe-kbuild-all@lists.linux.dev, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stanley,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanley-Chu/dt-bindings-i3c-Add-NPCM845-i3c-controller/20240802-183617
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240801071946.43266-3-yschu%40nuvoton.com
patch subject: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408030543.PWRuy07u-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030543.PWRuy07u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030543.PWRuy07u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/master/npcm845-i3c-master.c: In function 'npcm_i3c_master_bus_init':
>> drivers/i3c/master/npcm845-i3c-master.c:885:48: warning: left shift count >= width of type [-Wshift-count-overflow]
     885 |         info.pid = (NPCM_I3C_VENDORID_VID(reg) << 33) | readl(master->regs + NPCM_I3C_PARTNO);
         |                                                ^~
   drivers/i3c/master/npcm845-i3c-master.c: At top level:
   drivers/i3c/master/npcm845-i3c-master.c:2353:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Wincompatible-pointer-types]
    2353 |         .remove = npcm_i3c_master_remove,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/npcm845-i3c-master.c:2353:19: note: (near initialization for 'npcm_i3c_master.<anonymous>.remove')


vim +885 drivers/i3c/master/npcm845-i3c-master.c

   770	
   771	static int npcm_i3c_master_bus_init(struct i3c_master_controller *m)
   772	{
   773		struct npcm_i3c_master *master = to_npcm_i3c_master(m);
   774		struct i3c_bus *bus = i3c_master_get_bus(m);
   775		struct i3c_device_info info = {};
   776		unsigned long fclk_rate, fclk_period_ns;
   777		unsigned long i3c_scl_rate, i2c_scl_rate;
   778		unsigned int pp_high_period_ns, od_low_period_ns, i2c_period_ns;
   779		unsigned int scl_period_ns;
   780		u32 ppbaud, pplow, odhpp, odbaud, i2cbaud, reg;
   781		int ret;
   782	
   783		/* Timings derivation */
   784		fclk_rate = clk_get_rate(master->fclk);
   785		if (!fclk_rate)
   786			return -EINVAL;
   787	
   788		fclk_period_ns = DIV_ROUND_UP(1000000000, fclk_rate);
   789	
   790		/*
   791		 * Configure for Push-Pull mode.
   792		 */
   793		if (master->scl_timing.i3c_pp_hi >= I3C_SCL_PP_PERIOD_NS_MIN &&
   794		    master->scl_timing.i3c_pp_lo >= master->scl_timing.i3c_pp_hi) {
   795			ppbaud = DIV_ROUND_UP(master->scl_timing.i3c_pp_hi, fclk_period_ns) - 1;
   796			if (ppbaud > NPCM_I3C_MAX_PPBAUD)
   797				ppbaud = NPCM_I3C_MAX_PPBAUD;
   798			pplow = DIV_ROUND_UP(master->scl_timing.i3c_pp_lo, fclk_period_ns)
   799				- (ppbaud + 1);
   800			if (pplow > NPCM_I3C_MAX_PPLOW)
   801				pplow = NPCM_I3C_MAX_PPLOW;
   802			bus->scl_rate.i3c = 1000000000 / (((ppbaud + 1) * 2 + pplow) * fclk_period_ns);
   803		} else {
   804			scl_period_ns = DIV_ROUND_UP(1000000000, bus->scl_rate.i3c);
   805			if (bus->scl_rate.i3c == 10000000) {
   806				/* Workaround for npcm8xx: 40/60 ns */
   807				ppbaud = DIV_ROUND_UP(40, fclk_period_ns) - 1;
   808				pplow = DIV_ROUND_UP(20, fclk_period_ns);
   809			} else {
   810				/* 50% duty-cycle */
   811				ppbaud = DIV_ROUND_UP((scl_period_ns / 2), fclk_period_ns) - 1;
   812				pplow = 0;
   813			}
   814			if (ppbaud > NPCM_I3C_MAX_PPBAUD)
   815				ppbaud = NPCM_I3C_MAX_PPBAUD;
   816		}
   817		pp_high_period_ns = (ppbaud + 1) * fclk_period_ns;
   818	
   819		/*
   820		 * Configure for Open-Drain mode.
   821		 */
   822		if (master->scl_timing.i3c_od_hi >= pp_high_period_ns &&
   823		    master->scl_timing.i3c_od_lo >= I3C_SCL_OD_LOW_PERIOD_NS_MIN) {
   824			if (master->scl_timing.i3c_od_hi == pp_high_period_ns)
   825				odhpp = 1;
   826			else
   827				odhpp = 0;
   828			odbaud = DIV_ROUND_UP(master->scl_timing.i3c_od_lo, pp_high_period_ns) - 1;
   829		} else {
   830			/* Set default OD timing: 1MHz/1000ns with 50% duty cycle */
   831			odhpp = 0;
   832			odbaud = DIV_ROUND_UP(500, pp_high_period_ns) - 1;
   833		}
   834		if (odbaud > NPCM_I3C_MAX_ODBAUD)
   835			odbaud = NPCM_I3C_MAX_ODBAUD;
   836		od_low_period_ns = (odbaud + 1) * pp_high_period_ns;
   837	
   838		/* Configure for I2C mode */
   839		i2c_period_ns = DIV_ROUND_UP(1000000000, bus->scl_rate.i2c);
   840		if (i2c_period_ns < od_low_period_ns * 2)
   841			i2c_period_ns = od_low_period_ns * 2;
   842		i2cbaud = DIV_ROUND_UP(i2c_period_ns, od_low_period_ns) - 2;
   843		if (i2cbaud > NPCM_I3C_MAX_I2CBAUD)
   844			i2cbaud = NPCM_I3C_MAX_I2CBAUD;
   845	
   846		i3c_scl_rate = 1000000000 / (((ppbaud + 1) * 2 + pplow) * fclk_period_ns);
   847		i2c_scl_rate = 1000000000 / ((i2cbaud + 2) * od_low_period_ns);
   848	
   849		reg = NPCM_I3C_MCONFIG_MASTER_EN |
   850		      NPCM_I3C_MCONFIG_DISTO(0) |
   851		      NPCM_I3C_MCONFIG_HKEEP(3) |
   852		      NPCM_I3C_MCONFIG_ODSTOP(1) |
   853		      NPCM_I3C_MCONFIG_PPBAUD(ppbaud) |
   854		      NPCM_I3C_MCONFIG_PPLOW(pplow) |
   855		      NPCM_I3C_MCONFIG_ODBAUD(odbaud) |
   856		      NPCM_I3C_MCONFIG_ODHPP(odhpp) |
   857		      NPCM_I3C_MCONFIG_SKEW(0) |
   858		      NPCM_I3C_MCONFIG_I2CBAUD(i2cbaud);
   859		writel(reg, master->regs + NPCM_I3C_MCONFIG);
   860	
   861		dev_dbg(master->dev, "dts: i3c rate=%lu, i2c rate=%lu\n",
   862			bus->scl_rate.i3c, bus->scl_rate.i2c);
   863		dev_info(master->dev, "fclk=%lu, period_ns=%lu\n", fclk_rate, fclk_period_ns);
   864		dev_info(master->dev, "i3c scl_rate=%lu\n", i3c_scl_rate);
   865		dev_info(master->dev, "i2c scl_rate=%lu\n", i2c_scl_rate);
   866		dev_info(master->dev, "pp_high=%u, pp_low=%lu\n", pp_high_period_ns,
   867				(ppbaud + 1 + pplow) * fclk_period_ns);
   868		dev_info(master->dev, "pp_sda_rd_skew=%d, pp_sda_wr_skew=%d\n",
   869				master->scl_timing.i3c_pp_sda_rd_skew,
   870				master->scl_timing.i3c_pp_sda_wr_skew);
   871		dev_info(master->dev, "od_high=%d, od_low=%d\n",
   872				odhpp ? pp_high_period_ns : od_low_period_ns, od_low_period_ns);
   873		dev_dbg(master->dev, "i2c_high=%u, i2c_low=%u\n", ((i2cbaud >> 1) + 1) * od_low_period_ns,
   874				((i2cbaud >> 1) + 1 + (i2cbaud % 2)) * od_low_period_ns);
   875		dev_dbg(master->dev, "ppbaud=%d, pplow=%d, odbaud=%d, i2cbaud=%d\n",
   876			ppbaud, pplow, odbaud, i2cbaud);
   877		dev_info(master->dev, "mconfig=0x%x\n", readl(master->regs + NPCM_I3C_MCONFIG));
   878		/* Master core's registration */
   879		ret = i3c_master_get_free_addr(m, 0);
   880		if (ret < 0)
   881			return ret;
   882	
   883		info.dyn_addr = ret;
   884		reg = readl(master->regs + NPCM_I3C_VENDORID);
 > 885		info.pid = (NPCM_I3C_VENDORID_VID(reg) << 33) | readl(master->regs + NPCM_I3C_PARTNO);
   886	
   887		writel(NPCM_MDYNADDR_VALID | NPCM_MDYNADDR_ADDR(info.dyn_addr),
   888		       master->regs + NPCM_I3C_MDYNADDR);
   889	
   890		ret = i3c_master_set_info(&master->base, &info);
   891	
   892		return ret;
   893	}
   894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
