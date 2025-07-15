Return-Path: <openbmc+bounces-343-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBEBB0694A
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 00:30:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhYm75CzCz2xRt;
	Wed, 16 Jul 2025 08:30:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752618615;
	cv=none; b=KdadWGiT7ox2M2v4PTyuW4tg2U2Tzo1G9WfI52kxQq6Ee7jPmGK4+cWfZSEnd8t+mNB9cUTY8HtyCzQmJjQQHPn+bJkEvQOhq0yLB5GN2+tKZ6m24GEcOJyFh4qa6J+nFsdjbJJmN2Uyo12ghQRpkRnfmlfFRKradSSwllKrUjE6qxNyj/lKTLlMYkHAsjj5G0A07mYWfmK/v7K8QkURdwitlDlPoNpE+l4fioDoo5HQVNQRjijqAg1GEXZS36z5I7sSy2rzxs+eubLLMDGZpgjsQIhTDnO7gD+3HxJLvuDs670wy+QK3FikcGNe9/0bJ77VnSg3wv03fCMO2idooA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752618615; c=relaxed/relaxed;
	bh=P4z0UilpwOeP3VuXbpZflhcYtGlNIMIy++fBOMiI2QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnQoRrfz+fYdWp95JJVeQlp6AcY0v7xR5J9snXXQ/1Icc09s5l6aobjmy1oAk5gGd0RZZLBhcd9FUHoliLfPcTWe/Bk++etVsNmmgDBTEcT4WUy5ikUaLUg7fxIFzLlZhrQgjGwLkLCupTuQ3x0XPfuSMICWOiSuoPc7TP3O4ol9mUWkxbbwuQe8jBpoZy0G2LA0Cee7vwpdAMOvcy2ektsqE0QvBmQ6pfDLwOH2iWpDSCNEee0rtoCRcj4RieREFsd+6ySNjCPu0EBvHj4fU8+8PerKfp3lPj/LsqMH0hlBSAR4HO1+5txSdQxdmQAiEkkS/dkH/t7+pcT5hb3Xyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HbXyRZy+; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HbXyRZy+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 16 Jul 2025 08:30:12 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhYm41Sqdz2xQ5;
	Wed, 16 Jul 2025 08:30:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752618613; x=1784154613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G7+Ffs9WIWMcBynLHK1Sql++GiExP0QoYD+fUsrCxEU=;
  b=HbXyRZy+SN4HwIAnxoGH2oJOGGEIYtxj8cZSLdHkIRYWucMvifRes/Xg
   h0DTAvqOEceXYN26XD02U0q4Alg17/OxKG1iNYal/ILDoNfbwR8RktLtw
   OIHapuZtKGP8BkTyTbqZs3U2HePjreiebP+aXXE0SNgXlgO6sCgy60WCh
   u/ivKAJpUY4yzWOfihycdjN3oh5nwRl/zehegiNsO3cSYrH2oKA9yNEqV
   b+kDHwpj3Ko7Mvsk9pKaD+L4LgeyZscIHCNT0ahqkry5tgjOBiB8Hega0
   vAgwduAYtEFMMgDHGX0Nx93j5P1ZsZgMPsEZqJkzLbRiqxRud0ptf9/Es
   A==;
X-CSE-ConnectionGUID: hyzZf5YnSdOG+EiT/VXHaQ==
X-CSE-MsgGUID: GJqDDvHGTYi4IiAJVrvVkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54562885"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="54562885"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 15:28:53 -0700
X-CSE-ConnectionGUID: 43scBKa2Q+GlwkjRdyCeQg==
X-CSE-MsgGUID: nj7Vi7qCQFKk7YaTE34tRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="181023525"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jul 2025 15:28:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubo8k-000Bbf-0v;
	Tue, 15 Jul 2025 22:28:46 +0000
Date: Wed, 16 Jul 2025 06:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <202507160642.yzIrPY1i-lkp@intel.com>
References: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.16-rc6 next-20250715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Chou/dt-bindings-soc-aspeed-Add-ASPEED-PCIe-Config-support/20250715-114814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250715034320.2553837-10-jacky_chou%40aspeedtech.com
patch subject: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250716/202507160642.yzIrPY1i-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160642.yzIrPY1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160642.yzIrPY1i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/controller/pcie-aspeed.c:179 struct member 'pciephy' not described in 'aspeed_pcie_port'
   Warning: drivers/pci/controller/pcie-aspeed.c:179 Excess struct member 'phy' description in 'aspeed_pcie_port'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

