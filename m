Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A80B88062A9
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 00:04:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YvvpDr/p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlGMF1yzsz3cV1
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 10:04:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YvvpDr/p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlGLg1HMGz2xQL
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 10:04:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701817451; x=1733353451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+bwbwFyENG7yFV0azLeO6IAGA9bVpvHuBPiiW8IsjQ=;
  b=YvvpDr/ps2CgdZ5CyU5qMfrXqn9ljUOsho0b4y2xqqJCDvMtuUZBmDdU
   3emMxZ4aBWq3pirFi9KNqgxYJliUhZ8BonU8Mq0GmojnCmwjAjEHAgwmC
   hMpO9xlrij28U4Fsh88MbzOuEatah2rUsfItgzq2kjLkh/9O72txYshiN
   lsm6MgTUM5nVeci8KNHGimfmi5YWQ4vF57+7thkuQJ+5ZwFLVo+oc9u0O
   0lWzGnler1TIdH/pl6Ma+Z6h4QwOg+9s232Du/DQS5KbnEv2ic8z3/gq2
   wivIFBzHlB5BhDDbWfTpJ8VXFg4RLmYwg9fKZ2LjFqdFUxPaMaq/96bot
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393705744"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="393705744"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="19127791"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 15:03:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAeSI-0009q0-2B;
	Tue, 05 Dec 2023 23:03:54 +0000
Date: Wed, 6 Dec 2023 07:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH net-next 11/16] net: pcs: xpcs: Change
 xpcs_create_mdiodev() suffix to "byaddr"
Message-ID: <202312060634.Cblfigt2-lkp@intel.com>
References: <20231205103559.9605-12-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205103559.9605-12-fancer.lancer@gmail.com>
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Serge,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/net-pcs-xpcs-Drop-sentinel-entry-from-2500basex-ifaces-list/20231205-183808
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231205103559.9605-12-fancer.lancer%40gmail.com
patch subject: [PATCH net-next 11/16] net: pcs: xpcs: Change xpcs_create_mdiodev() suffix to "byaddr"
config: arc-randconfig-001-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060634.Cblfigt2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060634.Cblfigt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060634.Cblfigt2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c: In function 'txgbe_mdio_pcs_init':
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:150:16: error: implicit declaration of function 'xpcs_create_mdiodev'; did you mean 'xpcs_create_byaddr'? [-Werror=implicit-function-declaration]
     150 |         xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
         |                ^~~~~~~~~~~~~~~~~~~
         |                xpcs_create_byaddr
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:150:14: warning: assignment to 'struct dw_xpcs *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     150 |         xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
         |              ^
   cc1: some warnings being treated as errors


vim +150 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c

854cace61387b6 Jiawen Wu      2023-06-06  121  
854cace61387b6 Jiawen Wu      2023-06-06  122  static int txgbe_mdio_pcs_init(struct txgbe *txgbe)
854cace61387b6 Jiawen Wu      2023-06-06  123  {
854cace61387b6 Jiawen Wu      2023-06-06  124  	struct mii_bus *mii_bus;
854cace61387b6 Jiawen Wu      2023-06-06  125  	struct dw_xpcs *xpcs;
854cace61387b6 Jiawen Wu      2023-06-06  126  	struct pci_dev *pdev;
854cace61387b6 Jiawen Wu      2023-06-06  127  	struct wx *wx;
854cace61387b6 Jiawen Wu      2023-06-06  128  	int ret = 0;
854cace61387b6 Jiawen Wu      2023-06-06  129  
854cace61387b6 Jiawen Wu      2023-06-06  130  	wx = txgbe->wx;
854cace61387b6 Jiawen Wu      2023-06-06  131  	pdev = wx->pdev;
854cace61387b6 Jiawen Wu      2023-06-06  132  
854cace61387b6 Jiawen Wu      2023-06-06  133  	mii_bus = devm_mdiobus_alloc(&pdev->dev);
854cace61387b6 Jiawen Wu      2023-06-06  134  	if (!mii_bus)
854cace61387b6 Jiawen Wu      2023-06-06  135  		return -ENOMEM;
854cace61387b6 Jiawen Wu      2023-06-06  136  
854cace61387b6 Jiawen Wu      2023-06-06  137  	mii_bus->name = "txgbe_pcs_mdio_bus";
854cace61387b6 Jiawen Wu      2023-06-06  138  	mii_bus->read_c45 = &txgbe_pcs_read;
854cace61387b6 Jiawen Wu      2023-06-06  139  	mii_bus->write_c45 = &txgbe_pcs_write;
854cace61387b6 Jiawen Wu      2023-06-06  140  	mii_bus->parent = &pdev->dev;
854cace61387b6 Jiawen Wu      2023-06-06  141  	mii_bus->phy_mask = ~0;
854cace61387b6 Jiawen Wu      2023-06-06  142  	mii_bus->priv = wx;
854cace61387b6 Jiawen Wu      2023-06-06  143  	snprintf(mii_bus->id, MII_BUS_ID_SIZE, "txgbe_pcs-%x",
d8c21ef7b2b147 Xiongfeng Wang 2023-08-08  144  		 pci_dev_id(pdev));
854cace61387b6 Jiawen Wu      2023-06-06  145  
854cace61387b6 Jiawen Wu      2023-06-06  146  	ret = devm_mdiobus_register(&pdev->dev, mii_bus);
854cace61387b6 Jiawen Wu      2023-06-06  147  	if (ret)
854cace61387b6 Jiawen Wu      2023-06-06  148  		return ret;
854cace61387b6 Jiawen Wu      2023-06-06  149  
854cace61387b6 Jiawen Wu      2023-06-06 @150  	xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
854cace61387b6 Jiawen Wu      2023-06-06  151  	if (IS_ERR(xpcs))
854cace61387b6 Jiawen Wu      2023-06-06  152  		return PTR_ERR(xpcs);
854cace61387b6 Jiawen Wu      2023-06-06  153  
854cace61387b6 Jiawen Wu      2023-06-06  154  	txgbe->xpcs = xpcs;
854cace61387b6 Jiawen Wu      2023-06-06  155  
854cace61387b6 Jiawen Wu      2023-06-06  156  	return 0;
854cace61387b6 Jiawen Wu      2023-06-06  157  }
854cace61387b6 Jiawen Wu      2023-06-06  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
