Return-Path: <openbmc+bounces-342-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA36B0679D
	for <lists+openbmc@lfdr.de>; Tue, 15 Jul 2025 22:14:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhVlp3CFLz2xlK;
	Wed, 16 Jul 2025 06:14:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752610486;
	cv=none; b=jjTg73/gbEjV3MDFVt0p8DY0tjjOqqEcRVMU+kdlAKDMO6ZuDO5OWsCKpJ588tLWVbwo2OjuQdloWPy0Etck9e19DkauhBtM4AlXfAxeQwdWGypNNCz+dIEsEWv7yUf4726IYvMcV4yQN4dmtfHk52s+A726La2fUqaLlXJ8KZB4CcidrWtT6hKWeuH1sUAsJuoHl1p2tDk/zWGyoN6MSGP6oiPTLrDAKMfZFMIorsYcSFIYc927uNxeGjYAOxNrS53+KV8SLevPSt0PQ9d86YesvE/9rX78RRiZrl0N8KKNEmDlE7b4hbQnRTJaGUjsfNxfoal9Iu/bhXOY2VkTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752610486; c=relaxed/relaxed;
	bh=Sq2CjF7l+besw1ZeKs/NEZSe/PtB82XT3dJtEgbj7pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH5cCX5gs0xw5W/KLDr/WwmcNYGMIFLVATy/Wtm8NZaLVqwVOc9Lby+fLm1qKjnHionEX5RH9V5bybOeKNE862rceqSahdIytmhDlXDTKw3s2SUFSN2I2Q6LpHkJasOCoJcfEvw/Zj8k8+m+CQP9+nZSIrq9m+woYHr/44zUHatE8+nWaBsD/UDcAGEZ40J6TNFMNTESjBEn+lL7ydkqZlhh3APGYfEoOZPQAHLNCAm2VsN0zeMjMtCEgRLoSyfn6mg0a0Efg5xrn2Vz/c9t4zGwoYhWaMVycuYgt8tYHOIX/7xoOeAjc325rOtDN11RHv1R7LwnK6yKFmZhEAwIsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OJDa4TKl; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OJDa4TKl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhVll47KDz2xd6;
	Wed, 16 Jul 2025 06:14:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752610484; x=1784146484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eS6Mpdyp46gQ6nUgwPSL7+/IQm0H6qYJBJumRgSICho=;
  b=OJDa4TKlNW3cpCmcSlwtkWA8zj9usRwubyngMgPGKlLth668S6tIMaZi
   rQ2JJ9wU/PKC4yqY0CFheIpswzQE/825XpcOtZuu0CtS+hpFlszZmjvrT
   G2LHot0kIguTfNMvRDb/Skr8TZsn6IQxEfaq2BmI+1liWjC0MSLKiHZbw
   7G5iNN3f4txxUx+B5qQUcmCOaOouassuOb4k7CKxZ270lBkiVxliQRO1B
   0WXRICzz0PgR6Mc9J0cA/R2tAwN2ujHGY9gvbCkMFw/9QkN6LdT+L3J3u
   BTmz97SRot1jq6kLqMqpGugfNgd3mymUCcWpREBbLg8uWvq2OJHZzQKOh
   Q==;
X-CSE-ConnectionGUID: PhTeyS8FTRSN58n49J4UEA==
X-CSE-MsgGUID: RTI7VdqASk661zULo8lC4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="42473897"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="42473897"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 13:14:39 -0700
X-CSE-ConnectionGUID: swZoM0+0REi7GGWqObo93g==
X-CSE-MsgGUID: nZzgw5MpQzKGR4ifrqa3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="161631582"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2025 13:14:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubm2p-000BVn-1r;
	Tue, 15 Jul 2025 20:14:31 +0000
Date: Wed, 16 Jul 2025 04:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, p.zabel@pengutronix.de,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
Message-ID: <202507160314.e3odwyX7-lkp@intel.com>
References: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
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
patch link:    https://lore.kernel.org/r/20250715034320.2553837-9-jacky_chou%40aspeedtech.com
patch subject: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
config: i386-buildonly-randconfig-004-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160314.e3odwyX7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160314.e3odwyX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.e3odwyX7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/pci.h:21:
>> usr/include/linux/pci_regs.h:1234:39: warning: // comments are not allowed in this language [-Wcomment]
    1234 | #define PCI_TLP_FMT_3DW_NO_DATA         0x0  // 3DW header, no data
         |                                              ^
   1 warning generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/pci_regs.h:1234:39: warning: // comments are not allowed in this language [-Wcomment]
    1234 | #define PCI_TLP_FMT_3DW_NO_DATA         0x0  // 3DW header, no data
         |                                              ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

