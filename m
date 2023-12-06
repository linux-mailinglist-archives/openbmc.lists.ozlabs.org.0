Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15B0806371
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 01:30:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bj5fp4Ls;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlJGY1rn3z3cTc
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 11:30:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bj5fp4Ls;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlJFx3ycyz2yQL
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 11:30:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701822613; x=1733358613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdXpbLSSPrhcTHgM8fSyObWcIrwsztSdnomr2m3TkXA=;
  b=Bj5fp4Lst3Q8TAmCBHp6NhX3Lg0X9mtzDWv8jRGkbCbL9AiXutQty0vM
   eBrIoB1uXlfg8CsmWH7fLGmL3T0zeTNvF8uThIt3hJiXKBka4u0SwlaHB
   B70HmUNQLsw7IPixftXwwgEcrCcfkrgsM/gQdA++dhgzHCZaIrANZrdAT
   4SJHUEXGfJTXtHHOtgPdiLjTC88gJski5MbSEKf6aYO0C8onls87fvQ2O
   FHOMC2C8CvxgS8sn+x8+V7kpYfY+3GdOgaDGul4cCe7SsrdnYEYCTt+F1
   ykeu7D8PgFkDS+35DcD7dAYovplwEBQoNi6zR0NPiZfixjPgiB2+hyz1D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374163901"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="374163901"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771112925"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="771112925"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 16:30:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAfnd-0009x4-1v;
	Wed, 06 Dec 2023 00:30:01 +0000
Date: Wed, 6 Dec 2023 08:29:36 +0800
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
Message-ID: <202312060843.C3pV7P8b-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/net-pcs-xpcs-Drop-sentinel-entry-from-2500basex-ifaces-list/20231205-183808
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231205103559.9605-12-fancer.lancer%40gmail.com
patch subject: [PATCH net-next 11/16] net: pcs: xpcs: Change xpcs_create_mdiodev() suffix to "byaddr"
config: x86_64-randconfig-006-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060843.C3pV7P8b-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060843.C3pV7P8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060843.C3pV7P8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c: In function 'txgbe_mdio_pcs_init':
   drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:150:9: error: implicit declaration of function 'xpcs_create_mdiodev'; did you mean 'xpcs_create_byaddr'? [-Werror=implicit-function-declaration]
     xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
            ^~~~~~~~~~~~~~~~~~~
            xpcs_create_byaddr
>> drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c:150:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     xpcs = xpcs_create_mdiodev(mii_bus, 0, PHY_INTERFACE_MODE_10GBASER);
          ^
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
