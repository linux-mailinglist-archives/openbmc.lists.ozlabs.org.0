Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A990FC67
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 07:58:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ihk+fKMI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4VCT1frWz3cRR
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 15:58:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ihk+fKMI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4VBt3TmVz30VR
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2024 15:57:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718863064; x=1750399064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zMCFp8zCllWXZJOLn+ox9s+gLl+0FUepfCkgfmEOmGU=;
  b=ihk+fKMI6XnQJ/rsknPd7QrR2PmVSJsJQTzBXUIdHhHo2fNe3w3TU9k8
   3dzt/IbeGwwqOYKZNuVZH8Y+sLc/BUZUDcaf4Z0TQ15DwL304g8A+BsCd
   1wokvzAXTLUVf8c1xp88EWI7TpUIkMXa2Ghp5lQxLjX6QJDfkw2fbI6ox
   BzY8EGj9p4c+AeihS6pDxLU0wPFDYPrXQEPniEMBMOvnLjMYRmScT5N/E
   sw5sAnWIRYKPAELA//2FHRyUpAZCX3NQTV4SNjHPJWfW6oiXShumQl6zW
   NdrXlnczoxd7B2auO/B4UUGnDMQyHfaUdICmOqRxUjb4ma+onO5cifYXN
   w==;
X-CSE-ConnectionGUID: 7ys3nIfhQnC18OOOllfYQw==
X-CSE-MsgGUID: 7RKpjGcnR0aGumBN0gPzhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15585023"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15585023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 22:57:38 -0700
X-CSE-ConnectionGUID: xNu0A6xbT2qdW0R8iq+V0Q==
X-CSE-MsgGUID: Cca+h7QjQquGw6LR94NR2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42792780"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 22:57:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKAnb-0007Mk-34;
	Thu, 20 Jun 2024 05:57:31 +0000
Date: Thu, 20 Jun 2024 13:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com
Subject: Re: [PATCH v25 2/3] reset: npcm: register npcm8xx clock auxiliary
 bus device
Message-ID: <202406201328.SGrN27to-lkp@intel.com>
References: <20240618185819.2155595-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618185819.2155595-3-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master pza/reset/next v6.10-rc4 next-20240619]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-reset-npcm-add-clock-properties/20240619-093532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240618185819.2155595-3-tmaimon77%40gmail.com
patch subject: [PATCH v25 2/3] reset: npcm: register npcm8xx clock auxiliary bus device
config: arm64-randconfig-003-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201328.SGrN27to-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201328.SGrN27to-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201328.SGrN27to-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/reset/reset-npcm.o: in function `npcm_rc_probe':
   reset-npcm.c:(.text+0xce8): undefined reference to `auxiliary_device_init'
>> reset-npcm.c:(.text+0xce8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `auxiliary_device_init'
>> aarch64-linux-ld: reset-npcm.c:(.text+0xd30): undefined reference to `__auxiliary_device_add'
>> reset-npcm.c:(.text+0xd30): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__auxiliary_device_add'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
