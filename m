Return-Path: <openbmc+bounces-219-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A29ADAD9999
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 04:10:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bK08l1mTPz2xd3;
	Sat, 14 Jun 2025 12:10:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749867014;
	cv=none; b=InyPH3qfhMF0VulvxWWsPx3gPZ+1Ae1aGIxAp+QLLw5TRnMItarzS87LNlCQKmiohgL3f00R27uNiQTWyCQUYy5uTCpT4eOxhXkLTZgxSnd/c+CBSWF2agWrblhIL+i5CE0uueSLWPmIpv+KPuTRiyfTZoZu+r9Amc14JHkxbEqYEwzKZGx2pG24CuX37TnIbS6UNJ/ENqDOKxi8RPnMActrDmwFE+1NjiAsK90J4OzkAdPs4QBF5STKPzssjJQ1SUIw2BaQpMS1J8grvHI8g58gNKJro3E1HKbv6cyfkGeD9Rj+5W28GMVJmcJgz1WB0E3DqLcVN/oMSNTbaxyQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749867014; c=relaxed/relaxed;
	bh=+dscW/dvb3RIpT4gh7qXnsS5297WNQKrqUPPCMPmLA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHynHuKzi+jWZ0ky6jX+235d/NAriLeGtMWHq77zwfGzaa+RMC8u2VAk6Bm7bF/K6mRhWq1BmwwU2Oh9KpUa/YltFih9K3aCuHUW06J06EkYYnF7vaioQk9sNaB8AtCDgEIatDi52EBfdhZdGIDuq56aU34ERiiUxRe0hgAL9aTkaxrC8RnY+6v5yu+Swtw6fWyYgX7FGNvGD/VXAq03OX8tM9OG03OnoqbebA7iD4qFF8hDLxW0HD9MpVrEx5m0dPPPtfpHoRYhlWzxKfQtj4FAe7KOjiQcnIxQ7sdjjGFQJYoGjCSeU7eaaD51YQ651+Wu9hmfeLBjHXikGWuyBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kwtEfrVT; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kwtEfrVT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Sat, 14 Jun 2025 12:10:12 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bK08h0lJLz2xKh;
	Sat, 14 Jun 2025 12:10:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749867012; x=1781403012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T7F5BTPkmIJqijZcvCaJDzeehyOgLhWobs1d8ZTzUB8=;
  b=kwtEfrVThfE8heePGwEWKre1n+fzY/odcH3BibuEVW7kWDumkiRgXP3g
   eh0W3yBAWcW6OSKmTtcxdzv9JOGEkTwgCkMGylJ4SnltpmSYqiDiqkMxm
   2kiS2uGXa1GADFWT0kxo5s6hdxNkYnrDbcpAanKZrEHrUXXQDVKBdy6hr
   UfyC38mv8hxZ1fKoiDpiKwLpNSImw6zmtgnuMEste13GaWK0inLNXurk3
   ObisDD6g2wpmIRagnmG0BgwZO3IVZYuD1gaOURnRj2KVrvNm07CySPg/u
   nTvzGBGT//7c0KeH4sjaWjTE0mmxHtwdS3pQkRTyzfKRIxRLd9h5TH9Jc
   w==;
X-CSE-ConnectionGUID: rCGbPiMlRy2EIDmlY0UkXg==
X-CSE-MsgGUID: /f2Co/+qRZizyJ88anhvrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69668264"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="69668264"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 19:09:02 -0700
X-CSE-ConnectionGUID: dYhVJh5yTR6s0T8b+3tZig==
X-CSE-MsgGUID: NmfKjhUOQ6mo1Nvl5ddlFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="148347803"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2025 19:08:53 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQGJz-000DAM-2X;
	Sat, 14 Jun 2025 02:08:39 +0000
Date: Sat, 14 Jun 2025 10:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org,
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	elbadrym@google.com, romlem@google.com, anhphan@google.com,
	wak@google.com, yuxiaozhang@google.com, BMC-SW@aspeedtech.com
Subject: Re: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Message-ID: <202506140931.MWdyPxX1-lkp@intel.com>
References: <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-phy-Add-document-for-ASPEED-PCIe-PHY/20250613-113331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250613033001.3153637-8-jacky_chou%40aspeedtech.com
patch subject: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250614/202506140931.MWdyPxX1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140931.MWdyPxX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140931.MWdyPxX1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pcie-aspeed.c:481:6: warning: variable 'status' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     481 |         if (bus->number == 0) {
         |             ^~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-aspeed.c:541:9: note: uninitialized use occurs here
     541 |         writel(status, pcie->reg + H2X_CFGE_INT_STS);
         |                ^~~~~~
   drivers/pci/controller/pcie-aspeed.c:481:2: note: remove the 'if' if its condition is always false
     481 |         if (bus->number == 0) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
     482 |                 /* Internal access to bridge */
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     483 |                 writel(TLP_BYTE_EN(0xf) << 16 | (where & ~3), pcie->reg + H2X_CFGI_TLP);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     484 |                 writel(CFGI_TLP_FIRE, pcie->reg + H2X_CFGI_CTRL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     485 |                 *val = readl(pcie->reg + H2X_CFGI_RET_DATA);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     486 |         } else {
         |         ~~~~~~
   drivers/pci/controller/pcie-aspeed.c:474:24: note: initialize the variable 'status' to silence this warning
     474 |         u32 bdf_offset, status;
         |                               ^
         |                                = 0
   drivers/pci/controller/pcie-aspeed.c:573:6: warning: variable 'status' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     573 |         if (bus->number == 0) {
         |             ^~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-aspeed.c:622:9: note: uninitialized use occurs here
     622 |         writel(status, pcie->reg + H2X_CFGE_INT_STS);
         |                ^~~~~~
   drivers/pci/controller/pcie-aspeed.c:573:2: note: remove the 'if' if its condition is always false
     573 |         if (bus->number == 0) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~
     574 |                 /* Internal access to bridge */
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     575 |                 writel(CFGI_WRITE | TLP_BYTE_EN(byte_en) << 16 | (where & ~3),
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     576 |                        pcie->reg + H2X_CFGI_TLP);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~
     577 |                 writel(val, pcie->reg + H2X_CFGI_WR_DATA);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     578 |                 writel(CFGI_TLP_FIRE, pcie->reg + H2X_CFGI_CTRL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     579 |         } else {
         |         ~~~~~~
   drivers/pci/controller/pcie-aspeed.c:552:24: note: initialize the variable 'status' to silence this warning
     552 |         u32 bdf_offset, status, type;
         |                               ^
         |                                = 0
   2 warnings generated.


vim +481 drivers/pci/controller/pcie-aspeed.c

   469	
   470	static int aspeed_ast2700_rd_conf(struct pci_bus *bus, unsigned int devfn,
   471					  int where, int size, u32 *val)
   472	{
   473		struct aspeed_pcie *pcie = bus->sysdata;
   474		u32 bdf_offset, status;
   475		u8 type;
   476		int ret;
   477	
   478		if ((bus->number == 0 && devfn != 0))
   479			return PCIBIOS_DEVICE_NOT_FOUND;
   480	
 > 481		if (bus->number == 0) {
   482			/* Internal access to bridge */
   483			writel(TLP_BYTE_EN(0xf) << 16 | (where & ~3), pcie->reg + H2X_CFGI_TLP);
   484			writel(CFGI_TLP_FIRE, pcie->reg + H2X_CFGI_CTRL);
   485			*val = readl(pcie->reg + H2X_CFGI_RET_DATA);
   486		} else {
   487			if (!aspeed_ast2700_get_link(pcie))
   488				return PCIBIOS_DEVICE_NOT_FOUND;
   489	
   490			bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
   491	
   492			type = (bus->number == 1) ? PCI_HEADER_TYPE_NORMAL : PCI_HEADER_TYPE_BRIDGE;
   493	
   494			writel(CRG_READ_FMTTYPE(type) | CRG_PAYLOAD_SIZE, pcie->reg + H2X_CFGE_TLP_1ST);
   495			writel(AST2700_TX_DESC1_VALUE | (pcie->tx_tag << 8) | TLP_BYTE_EN(0xf),
   496			       pcie->reg + H2X_CFGE_TLP_NEXT);
   497			writel(bdf_offset, pcie->reg + H2X_CFGE_TLP_NEXT);
   498			writel(CFGE_TX_IDLE | CFGE_RX_BUSY, pcie->reg + H2X_CFGE_INT_STS);
   499			writel(CFGE_TLP_FIRE, pcie->reg + H2X_CFGE_CTRL);
   500	
   501			ret = readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
   502						 (status & CFGE_TX_IDLE), 0, 50);
   503			if (ret) {
   504				dev_err(pcie->dev,
   505					"[%X:%02X:%02X.%02X]CR tx timeout sts: 0x%08x\n",
   506					pcie->domain, bus->number, PCI_SLOT(devfn),
   507					PCI_FUNC(devfn), status);
   508				ret = PCIBIOS_SET_FAILED;
   509				*val = ~0;
   510				goto out;
   511			}
   512	
   513			ret = readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
   514						 (status & CFGE_RX_BUSY), 0, 50000);
   515			if (ret) {
   516				dev_err(pcie->dev,
   517					"[%X:%02X:%02X.%02X]CR rx timeoutsts: 0x%08x\n",
   518					pcie->domain, bus->number, PCI_SLOT(devfn),
   519					PCI_FUNC(devfn), status);
   520				ret = PCIBIOS_SET_FAILED;
   521				*val = ~0;
   522				goto out;
   523			}
   524			*val = readl(pcie->reg + H2X_CFGE_RET_DATA);
   525		}
   526	
   527		switch (size) {
   528		case 1:
   529			*val = (*val >> ((where & 3) * 8)) & 0xff;
   530			break;
   531		case 2:
   532			*val = (*val >> ((where & 2) * 8)) & 0xffff;
   533			break;
   534		case 4:
   535		default:
   536			break;
   537		}
   538	
   539		ret = PCIBIOS_SUCCESSFUL;
   540	out:
   541		writel(status, pcie->reg + H2X_CFGE_INT_STS);
   542		pcie->tx_tag = (pcie->tx_tag + 1) % 0xF;
   543		return ret;
   544	}
   545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

