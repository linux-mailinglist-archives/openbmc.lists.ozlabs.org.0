Return-Path: <openbmc+bounces-1213-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E3D28FDF
	for <lists+openbmc@lfdr.de>; Thu, 15 Jan 2026 23:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsctH3Sylz2yFW;
	Fri, 16 Jan 2026 09:22:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768515751;
	cv=none; b=O5NI66bhj/XqwYPSdjgY7WpdRHvmUiTdoT5+qpF2XpYWUfoDB2WY6XeyZuU8jcT5oJv29ZpjaRokgbdmZGkyz07HubgdZbx2UncvC6vaOFxUR7hTHVlyHXLvSdpN0EV7+jU+xQyQ4Q1Yt4ZKKhCNqdgIHdIokppEnbMyzUPIEm9Y8933iv7BtpM5aszycCRl1yzJNdyCkI5vSxpGvubektgwJX20RoQODvBH/fCH2LSFRuLbgc9tNn/HWBMjbfAcnAoJdazKG2ZkOyeYCsmUwikHbQhM5osVntheRz6fJy77XAoGzTm2ihlrh1cLWGQMgYU64U2aqdNBKCv/Wv5fLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768515751; c=relaxed/relaxed;
	bh=VyNaz6TnzQq6pqdp5vEpIcVyRU/KbKD0UdQlSGfMrWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma+NecLeuOLcYFqymoWogvwwhNeCVvqL6OrhaPHs/jQ6MQcs7+/v0Rs+F+TJkmg0C0K6FllcE1J07fMK/6b+7EnbXSBCmJj0N8ObXHrSSrrGkIgne+RDu55IfwTVgJaRz/1LLM6xPm1MtIABgeURBjwiii+lZxmKTRyAUOLWBneTuAiipweUPwHWFyA+9pe4IKQ9Cmo/duJTuJBL1jOn17tPbR1sPitC5duUwIEMEoXi42HAl83iYtdc/KBGqXJ29Zw/VSX/OFbVQgdqd1CzZyyk8AwgKjmIUl3tGBGbA3BNDYEIyi4qWLO3fPxJFQGmMXMIzrqIZA2Sqbd/ohE0pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWx6QKa6; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWx6QKa6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsctD0yhxz2xnj
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jan 2026 09:22:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768515748; x=1800051748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GlSRthmmIe146YTP1TyKrEKATP5VoHXNP14ZSFLxRDI=;
  b=VWx6QKa6hiu55fV1if4OFuRjkFqdEsascoRmoopJZUXfIKO1g976QRwo
   IKvcHnVLvykyt0ksyp48ILyU2uWrzCimFtNR0PFDZBuA0mvQOK5xKrPok
   1kWv6pQJgmRzY5QB6o+Tdyw7N5701ckyXOe2dbToo6UdVoVzHH0YaDMmJ
   WXNy3Ro6zYfhcSGbWDyENSfuvbbc2g1/2tXw8vPw4k6bz9BqjOXxhCdAh
   xqgBGj/Bmmz4uOZfaoNznb2RYNjTTKdCHwuzng4LcXVx+Ma6buE+wj5RJ
   tp0jXg20bLlXZw03ivifobBTPKjqoIemHa5NPhTOXhSSp1JX4dKqP/eRy
   Q==;
X-CSE-ConnectionGUID: tSqw81eKQJOI/ft/dXmS5w==
X-CSE-MsgGUID: iaAo1r+WRBm/lR+CPKdTBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73683714"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="73683714"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 14:22:21 -0800
X-CSE-ConnectionGUID: JKJfZTyAT8SvyZZ64I1AXg==
X-CSE-MsgGUID: S39XQe80ROehLb43Zu6oZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="228127414"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2026 14:22:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgVjM-00000000K3s-0tal;
	Thu, 15 Jan 2026 22:22:16 +0000
Date: Fri, 16 Jan 2026 06:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Tzu-Hao Wei <twei@axiado.com>, SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	Tzu-Hao Wei <twei@axiado.com>
Subject: Re: [PATCH 2/4] phy: axiado: add Axiado eMMC PHY driver
Message-ID: <202601160610.y8FbB5x1-lkp@intel.com>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-2-dd43459dbfea@axiado.com>
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
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-2-dd43459dbfea@axiado.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Tzu-Hao,

kernel test robot noticed the following build errors:

[auto build test ERROR on f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzu-Hao-Wei/dt-bindings-phy-axiado-ax3000-emmc-phy-add-Axiado-eMMC-PHY/20260109-174938
base:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
patch link:    https://lore.kernel.org/r/20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-2-dd43459dbfea%40axiado.com
patch subject: [PATCH 2/4] phy: axiado: add Axiado eMMC PHY driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601160610.y8FbB5x1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160610.y8FbB5x1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160610.y8FbB5x1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/m68k/include/asm/bitops.h:569,
                    from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/processor.h:11,
                    from include/linux/sched.h:13,
                    from include/linux/delay.h:13,
                    from drivers/phy/axiado/phy-axiado-emmc.c:11:
   drivers/phy/axiado/phy-axiado-emmc.c: In function 'axiado_emmc_phy_power_on':
>> drivers/phy/axiado/phy-axiado-emmc.c:69:34: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      69 | #define OTAP_SEL(x)             (FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
         |                                  ^~~~~~~~~~
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   drivers/phy/axiado/phy-axiado-emmc.c:147:9: note: in expansion of macro 'writel'
     147 |         writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
         |         ^~~~~~
   drivers/phy/axiado/phy-axiado-emmc.c:147:22: note: in expansion of macro 'OTAP_SEL'
     147 |         writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
         |                      ^~~~~~~~


vim +/FIELD_PREP +69 drivers/phy/axiado/phy-axiado-emmc.c

  > 11	#include <linux/delay.h>
    12	#include <linux/io.h>
    13	#include <linux/iopoll.h>
    14	#include <linux/module.h>
    15	#include <linux/of.h>
    16	#include <linux/phy/phy.h>
    17	#include <linux/platform_device.h>
    18	
    19	/* Arasan eMMC 5.1 - PHY configuration registers */
    20	#define CAP_REG_IN_S1_LSB		0x00
    21	#define CAP_REG_IN_S1_MSB		0x04
    22	#define PHY_CTRL_1			0x38
    23	#define PHY_CTRL_2			0x3C
    24	#define PHY_CTRL_3			0x40
    25	#define STATUS				0x50
    26	
    27	#define DLL_ENBL	BIT(26)
    28	#define RTRIM_EN	BIT(21)
    29	#define PDB_ENBL	BIT(23)
    30	#define RETB_ENBL	BIT(1)
    31	
    32	#define REN_STRB	BIT(27)
    33	#define REN_CMD		BIT(12)
    34	#define REN_DAT0	BIT(13)
    35	#define REN_DAT1	BIT(14)
    36	#define REN_DAT2	BIT(15)
    37	#define REN_DAT3	BIT(16)
    38	#define REN_DAT4	BIT(17)
    39	#define REN_DAT5	BIT(18)
    40	#define REN_DAT6	BIT(19)
    41	#define REN_DAT7	BIT(20)
    42	#define REN_CMD_EN	(REN_CMD | REN_DAT0 | REN_DAT1 | REN_DAT2 | \
    43			REN_DAT3 | REN_DAT4 | REN_DAT5 | REN_DAT6 | REN_DAT7)
    44	
    45	/* Pull-UP Enable on CMD Line */
    46	#define PU_CMD		BIT(3)
    47	#define PU_DAT0		BIT(4)
    48	#define PU_DAT1		BIT(5)
    49	#define PU_DAT2		BIT(6)
    50	#define PU_DAT3		BIT(7)
    51	#define PU_DAT4		BIT(8)
    52	#define PU_DAT5		BIT(9)
    53	#define PU_DAT6		BIT(10)
    54	#define PU_DAT7		BIT(11)
    55	#define PU_CMD_EN (PU_CMD | PU_DAT0 | PU_DAT1 | PU_DAT2 | PU_DAT3 | \
    56			PU_DAT4 | PU_DAT5 | PU_DAT6 | PU_DAT7)
    57	
    58	/* Selection value for the optimum delay from 1-32 output tap lines */
    59	#define OTAP_DLY	0x02
    60	/* DLL charge pump current trim default [1000] */
    61	#define DLL_TRM_ICP	0x08
    62	/* Select the frequency range of DLL Operation */
    63	#define FRQ_SEL	0x01
    64	
    65	#define OTAP_SEL_MASK		GENMASK(10, 7)
    66	#define DLL_TRM_MASK		GENMASK(25, 22)
    67	#define DLL_FRQSEL_MASK		GENMASK(27, 25)
    68	
  > 69	#define OTAP_SEL(x)		(FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
    70	#define DLL_TRM(x)		(FIELD_PREP(DLL_TRM_MASK, x) | DLL_ENBL)
    71	#define DLL_FRQSEL(x)	FIELD_PREP(DLL_FRQSEL_MASK, x)
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

