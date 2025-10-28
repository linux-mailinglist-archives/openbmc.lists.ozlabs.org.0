Return-Path: <openbmc+bounces-827-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAC7C15259
	for <lists+openbmc@lfdr.de>; Tue, 28 Oct 2025 15:23:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwt006Fk2z3chF;
	Wed, 29 Oct 2025 01:23:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761661408;
	cv=none; b=nXhcgGJGagOa1kcmMJkgmvlSVu8lZkMy4sOrK5zf8dnDvDrJ/nR0CF0s93GPbK2FDFKBJR9oCBdotxkKeUXak1pei9iQ7sJlWcWj5P3pbEDox9acb3raK9dX7qMj4e8HIoutPCS4Xyx1YiWoXowdZjk49VJc/znKNYOYaDvO8b5eUvzDFACeYPvnTIAF8iNjCcCHc5XNT3SNgzTno9f9EUqotsXisO5IWJEAr6mH3J/17+LnnlX7Bym+xBR1s4KlfGlGvXq7iq37k69di+6Kpwx7Iou69XDhoMCewC1CNXwYumY8fRraNZ9/TuCkU1dl08LYALnHo86d1Y8qUyTHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761661408; c=relaxed/relaxed;
	bh=rLVBKT2oGchqTwKApmRrbu5Y88FTRxXcdGMqxVea4JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPq9jDVWmpJuOUQNvh+YpyQU/rqziPK57UzbSHyyGTZ9bmw9LbH6tF8Y+rZQeD1YrjOcbfRNmDNsZrPl7E8UwxnxBs8tGEyh1VUpo+5EQ0DlERoWfUZqWb2TOhoNOi2kHyeouoa/EUtcsPQDMil5L4EXxF/waQqVCDxOPcsLs7BBKj5sOmyuivQOjnTAHhEUbZMfxoHAua9N8ZqWOSU7fGl8UQ6aImnoU8FEAEX1dCM9JiEapE4ahD8n7iIrZvfKJLOgWasWnspnT8YVUWYzVDMkeBxLEm7i7a+nUKCT2YF//SIwNrKqMUNqxSYmsXc+QFYO/46bk+TrUJ8fOE6+Vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PsIUYkIK; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PsIUYkIK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwszx5Yghz304x;
	Wed, 29 Oct 2025 01:23:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761661406; x=1793197406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZjKITrPWlUyYajJm3Ljrd+gMFKVlc9juJxipai/H3sg=;
  b=PsIUYkIKLqKF9d3z+hTFsh8m58M9FKh85uVjoQsYZJzYZi7NsdZPNR2V
   PbFxqNZ0Q5Z91Wv/Yi8y1nIUQtEgk2RzX5l2Lo4bEbmW9/5cQbbVquN7O
   MwESt2Wp3d/miHGmDJY7bjDNXwZdT+13C31m9GinWSt8OrGMYdFbb/4jC
   nYcRmsEOd4fE0wAEFDr/lHYkmld2WDZIwEtPZB7rBVFiVwI4ow0CK+XHJ
   YfVYhVEp9EPM5nkePwA0svxWt04Z/MJte4cHjFOfwAAZsVkJ3q+lsj+7N
   C4IipmBvSac06L7dJJ3I7xgSu3wwjysddx1H1l1zIYzhQA3k2KkoYGjTe
   Q==;
X-CSE-ConnectionGUID: 5sRG1F1vQAiHVFMGfdnehA==
X-CSE-MsgGUID: HqWKsMU8SgymlN//eqvt8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62966671"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="62966671"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:23:21 -0700
X-CSE-ConnectionGUID: rJqVb9lsQW6rF8W3nrYn0g==
X-CSE-MsgGUID: 5bWYwMMeSPSqrq/PhxgLNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184987007"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 07:23:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkbR-000JE1-2i;
	Tue, 28 Oct 2025 14:23:13 +0000
Date: Tue, 28 Oct 2025 22:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org,
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jacky_chou@aspeedtech.com
Subject: Re: [PATCH v4 8/9] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <202510282225.yqfv0wel-lkp@intel.com>
References: <20251027095825.181161-9-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20251027095825.181161-9-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.18-rc3 next-20251028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-phy-aspeed-Add-ASPEED-PCIe-PHY/20251027-180856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251027095825.181161-9-jacky_chou%40aspeedtech.com
patch subject: [PATCH v4 8/9] PCI: aspeed: Add ASPEED PCIe RC driver
config: loongarch-randconfig-r113-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282225.yqfv0wel-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282225.yqfv0wel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282225.yqfv0wel-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-aspeed.c:1084:38: sparse: sparse: symbol 'pcie_rc_ast2600' was not declared. Should it be static?
>> drivers/pci/controller/pcie-aspeed.c:1093:38: sparse: sparse: symbol 'pcie_rc_ast2700' was not declared. Should it be static?

vim +/pcie_rc_ast2600 +1084 drivers/pci/controller/pcie-aspeed.c

  1083	
> 1084	const struct aspeed_pcie_rc_platform pcie_rc_ast2600 = {
  1085		.setup = aspeed_ast2600_setup,
  1086		.reg_intx_en = 0xc4,
  1087		.reg_intx_sts = 0xc8,
  1088		.reg_msi_en = 0xe0,
  1089		.reg_msi_sts = 0xe8,
  1090		.msi_address = 0x1e77005c,
  1091	};
  1092	
> 1093	const struct aspeed_pcie_rc_platform pcie_rc_ast2700 = {
  1094		.setup = aspeed_ast2700_setup,
  1095		.reg_intx_en = 0x40,
  1096		.reg_intx_sts = 0x48,
  1097		.reg_msi_en = 0x50,
  1098		.reg_msi_sts = 0x58,
  1099		.msi_address = 0x000000f0,
  1100	};
  1101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

