Return-Path: <openbmc+bounces-823-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A438BC12F01
	for <lists+openbmc@lfdr.de>; Tue, 28 Oct 2025 06:30:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwf8g4G5Cz3fRp;
	Tue, 28 Oct 2025 16:30:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761629411;
	cv=none; b=Pna7vlAcqdpEqlm2KEOG44gcy6UvVr3hFS2hg2Nqeznvh+eeGqwoEHhoZjDZVjUKPdKO4IqYszsx9k2igoy/IUbc0ouo976g8EoZ/k5q10XCGT2xi9ZEoqhHfcgWahUAqNLshg2FAiMC2jLmWrCHnZHhSXwaqjBPH5njpRdJFbJmf8VghJ0/0dk+UeHGxuCKYbygpVxWKYOsIaNVJYIJ74qAjlORb38MBHeBZw7d85YaL6dTrbTE43HdFn1SNw34duCTfd81UwJS/B1ky6qIxMPvfa60wt5nulwFv60Ik/yDI6Mc2oNbjtrKoewYX06o1HgkBKwsO707Auy36xULzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761629411; c=relaxed/relaxed;
	bh=rDyzvSP0v3LjCih/Lpi+ZMEeJHd6RmlQ1f4er062tEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOsIA4jy8eqinlYsBQ15nGBV1Gq0pWCeSpTvOACzSQsGp25+AnO3tj97eYMz/lg7R0tybjXLhs3pBJGzdNTPwDde2jp5OyhueS0L6iB41vQX6S/cVwREJ+dzn5CRTfqaXoTcZQ3qlGytVIwnNgKRTfMbmGwv8yay3DJJNn2JmZABxxVfJjHeyliFXhMWUzHwu77hCgeG/U4NyHdOA9FT1C8VC/+bWfre2ohhoi5ztecW9xcnUG07yuhu4dnCinkL/cKSIbpS0T8tENUrb0EzPqt/XeGLtWv4cF5LMjYJw2oIv+qQWk9CuXhmTsBRijS8SG0YuHm7kaG6WXUYJ/M4AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cWRv9D5w; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cWRv9D5w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 28 Oct 2025 16:30:08 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwf8c4j0Jz3fRl;
	Tue, 28 Oct 2025 16:30:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761629410; x=1793165410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dlWh/zMhp+rDF+uBlV6D16SzoOVp4obnPz8fi8OhNyY=;
  b=cWRv9D5waXIc1UqbypJt79QoHFbSCBKv+SZro7L9tNbwuaUzDS2SXmJY
   OAfIwvXM0frUFUAIhc8sOqpB7k6Gdf0VIf9AJwPpFXyBxRWNmL/iEepfO
   Gik1OJsg6RgzTWBwDXDyyy7sNDUJDj6NSiS5K0WECnYz4UokBSpwBr+Ij
   mt/beYTorbR+Lm2rAZjJt28Jmzruih9UaJqhK6UUs/RGM+j4EXSSYF5V9
   fszQ4cBU1H79enkpxlQ28XsNb3VQ9+G/Kf8qqM4paqBf0UQNuMk9wzH6o
   ktbxknSbbcoUSQwXAkRzY1IHZTGFNjte0Zu0VkL1T/DZmFPYGwXn63smm
   w==;
X-CSE-ConnectionGUID: a+dG4Z8kThGdMqXpgy/Y9g==
X-CSE-MsgGUID: jt0SHnt+Q4GO3gCOhcVxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63870470"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="63870470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 22:28:59 -0700
X-CSE-ConnectionGUID: +AIdehCFTIykviljMNK7Tg==
X-CSE-MsgGUID: i3gkCQTaT0CPXjmigZSDvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="208847212"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2025 22:28:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDcGG-000InF-0P;
	Tue, 28 Oct 2025 05:28:48 +0000
Date: Tue, 28 Oct 2025 13:27:21 +0800
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
Message-ID: <202510281310.tCGvqcsO-lkp@intel.com>
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
[also build test WARNING on pci/for-linus robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-phy-aspeed-Add-ASPEED-PCIe-PHY/20251027-180856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251027095825.181161-9-jacky_chou%40aspeedtech.com
patch subject: [PATCH v4 8/9] PCI: aspeed: Add ASPEED PCIe RC driver
config: loongarch-randconfig-r113-20251028 (https://download.01.org/0day-ci/archive/20251028/202510281310.tCGvqcsO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510281310.tCGvqcsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510281310.tCGvqcsO-lkp@intel.com/

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

