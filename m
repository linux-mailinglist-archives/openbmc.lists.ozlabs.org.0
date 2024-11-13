Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1939C6E77
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 12:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpMJs1Sjkz3bgy
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 22:59:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731499161;
	cv=none; b=izJzMIFT6U8OGkcSge0ngdWrzIkVy7gIeP4CU/ip9hrq6+LIGHmHOKZuX860kUZXbOByac7ah+fvwBjwW7d7pYs2lL0oJW4pQgdJlqYmvli09U+On/Rymww3zQHCl2Ox7cFQ317sHkNDx+5wN7acfzobt4IIFt9j3FLD6fgE6z93UfzfarEGPrV80EBVawW6UEEO6IJAQ2dwTrjUX1tqw8sS660Bp/GX7edxCNYDZXU9zEysMEMtbDEsgcXAYOKZRZXCm8YCRr/CgraTKmDL90Yz3gf5DCMk/Ebd7iU3PI5sUA3YJ/M4n1S3FMFlUe857HYzm9KkSLpb7s9Ag8eyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731499161; c=relaxed/relaxed;
	bh=jxIKeVOKKznOiEAzo4EieHm79MDFj0Uu1MUXw8ICZPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmmQV1XGEaUBbuy/JJOg7F4al+szIekhv4et0IYOcoisoUaawRST+dkbgrev20KAtEXTi4Rz7w6Pz9nPuQgrhsBM+9uBF/nbTi/OBJ3E6EjYIcq5tSFpSzfYoYAmD6x9uHPSX3e6rmocURKzb0BDqvbE4/LpkagUzqXH1l3mz0z6WM9+gjzmFbBZzqETlMqgfs8/391b6F2PtVAOdDoSYVJ4bw0ot2HnHYY8uAJgqPYdyfHXPyHY4yF0W1OnAsce3oDSkxgK701y7hDd0gjBm5PooQAP8nj5Wu9VCXa+0xe9mbGXzVo95AbpCl65jVfcm3ssksXugwuzq8o1VwiHKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hcAKbHsn; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hcAKbHsn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpMJl1QCrz2yR9
	for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2024 22:59:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731499159; x=1763035159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S2yXI+RpE/4Z6IIWIoXWreQT7e9SUd1QZeV3E85aBM8=;
  b=hcAKbHsn36vd2uie2CI1ZGMir44EIdiGQhhtP1WAk7tNuQbRf8nqRh4F
   d/o+muVUszAJy4eitVfTB02AxBtIoTfcOZwYsZS8QYicuNItJmD1AJd3y
   bKVcqwIZIOvjazCC2tQ4bEpqAG/LPx7Eo8fD9SNdWbS7uwzCe72bCG657
   eVoQcwmGOuKW8YCnm5DnUOq+g3AiQmB/VXxb13zXDYR66M/Ba1ph2VGyz
   N6c5ZGoRxgnKxQwGIwg5iHPBhFLQsLajNh4i/4qRGtyxAwYzok1bweXgy
   zT8+4HNN7puPtl0q9MJ7ke2vhDee6pJqp5yYSaSz0G7SAkNtkFDePleMk
   g==;
X-CSE-ConnectionGUID: efgrTwwuQv6l4VCBq3/gbQ==
X-CSE-MsgGUID: m4zbHR7OSHqXcdEfK/JQKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35314458"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="35314458"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 03:59:11 -0800
X-CSE-ConnectionGUID: mbuIIPKWTsC2Zo2OOWA+8Q==
X-CSE-MsgGUID: Drm0ljxqRt6tHanbqPmqGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87842391"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Nov 2024 03:59:05 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBC1X-0000Kv-0X;
	Wed, 13 Nov 2024 11:59:03 +0000
Date: Wed, 13 Nov 2024 19:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for
 MA35 family
Message-ID: <202411131946.ozq1D0f2-lkp@intel.com>
References: <20241113051857.12732-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113051857.12732-4-a0987203069@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, oe-kbuild-all@lists.linux.dev, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-MA35-family-GMAC/20241113-132300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241113051857.12732-4-a0987203069%40gmail.com
patch subject: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for MA35 family
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241113/202411131946.ozq1D0f2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131946.ozq1D0f2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131946.ozq1D0f2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c:20: warning: expecting prototype for dwmac(). Prototype was for PATHDLY_DEC() instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +20 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

    19	
  > 20	#define PATHDLY_DEC         134
    21	#define TXDLY_OFST          16
    22	#define TXDLY_MSK           GENMASK(19, 16)
    23	#define RXDLY_OFST          20
    24	#define RXDLY_MSK           GENMASK(23, 20)
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
