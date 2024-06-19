Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2190E34F
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2024 08:21:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XmWTOP1P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3tmn3rNRz3cTv
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2024 16:21:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XmWTOP1P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3tmC0Xnnz3bYR
	for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2024 16:20:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718778060; x=1750314060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XFD15cCIqpCDpe/sTFNoNkjJnF9APKmPNvjg+90uazc=;
  b=XmWTOP1PPg0u1duVvEmclsG6LPapaS0tJLhg/zPjZxv0k3yQDFY0rtqy
   zU/LTAi0R6vlP+82Z9fc6zXYlAmdXBGlTFRXzdj1YM6sCj8z5giKNRhuw
   jttN2I5wl0TIOfuAlhNN7O+HFBZzVuFtjVwO89GCwlnCH/FpP95iYgk9a
   HC7K45Yinr4BwQ8pAyKcgLHd3dtkMLlPQI4NQgP5hydjfwANlqO+RBfTJ
   5bY+vwtum+BHwEqEGEwNMduObb6dMPCMFnCGE9uUwNOKpoqcRqHSrB01x
   gVsMygZ+jcZPVKS67GeZDMlzbEHjCVTlZnxNyEA+Lcwd2u42CdSTZ9MNx
   w==;
X-CSE-ConnectionGUID: VjVR7Fe4SYGtcYFSW1w4vA==
X-CSE-MsgGUID: 0jrO4WK4SeaYmmXfKzvf5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15841501"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="15841501"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 23:20:54 -0700
X-CSE-ConnectionGUID: vhrBS1pSRFaDc2hrE5DTxA==
X-CSE-MsgGUID: 4xWa3a2QTESJ40qFT14cAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46751499"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jun 2024 23:20:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJogZ-0006ML-28;
	Wed, 19 Jun 2024 06:20:47 +0000
Date: Wed, 19 Jun 2024 14:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com
Subject: Re: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
Message-ID: <202406191439.3NcnExKM-lkp@intel.com>
References: <20240618185819.2155595-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618185819.2155595-2-tmaimon77@gmail.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master pza/reset/next v6.10-rc4 next-20240618]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-reset-npcm-add-clock-properties/20240619-093532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240618185819.2155595-2-tmaimon77%40gmail.com
patch subject: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
config: arm64-randconfig-051-20240619 (https://download.01.org/0day-ci/archive/20240619/202406191439.3NcnExKM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191439.3NcnExKM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191439.3NcnExKM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:63.7-177.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "f0000000"
   arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:50.35-55.5: Warning (unique_unit_address_if_enabled): /ahb/reset-controller@f0801000: duplicate unit-address (also used in node /ahb/clock-controller@f0801000)
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /: memory@0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: system-controller@f0800000: compatible: ['nuvoton,npcm845-gcr', 'syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: interrupt-controller@dfff9000: 'ppi-partitions' does not match any of the regexes: '^v2m@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: ahb: apb:ranges: [[0, 0, 4026531840, 3145728], [4293918720, 0, 4293918720, 90112]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: timer@8000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/nuvoton,npcm7xx-timer.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@801c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@801c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@901c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@901c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
