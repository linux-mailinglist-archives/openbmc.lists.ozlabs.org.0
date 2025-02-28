Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04325A48DFB
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2025 02:30:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3rH502Cfz3cbX
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2025 12:29:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740706189;
	cv=none; b=QchJ3MgA+G73dl2APRHRVVrmeAlNfgrxCDILsugptj7A00guNJfa+YZXV7wqlM3/94EhENt4HnFHw+UEnYwe2priF85e03W960HstYEYtraf2BfQMI8SJiLXzG9cbNF3PlKZB4iqV3Cp4Es1rTHOrzkYFxutbPXuLDhwxjaZys80UJ9i63f5mQhHCsNo/w6rC8aGFNYIq+Stpq6GHqSU/3bBfp8FfNg5JC3pGDxSZLcOoJS5L9yJ4FSrQcTCAatPfMyq1kCooFmeoyjodQTs80+s/Wa18IEFrK8oWN7ZpqmwUv5CVZQCOGAJXaeeq2ZJLxuJB+0RoFi4QkXR2hRa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740706189; c=relaxed/relaxed;
	bh=6RoHJsMyZhDsVatyt4MKbmEUoQtHz9C5xwaEcpfT8NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B574PoLAlzXDSDitXcgzjySFNEuTnC2+GYAdbsrFEGcTB1oTp6WuDJb7LrVvCjeUGX2q3/yQeMTHGxlDIW1Oq9Ku/VZ/NIWTq0oSByDGKceYR35muXkJi7gjjxeY9Um+skY4o16y7/0LYIcC8/8DjshDwdXg0JlvrEE3PLa7mJoSAmHPtjdF9XtYRYM0c+JuPmGYy+W0f0IA/afwdGF1EkNz3QFqXT1+B05xkblTp+Jn0QnxsOtRtWOm5FiBTOgN0rXUAesFHFcXJ/WJUzcpdN1cB7RBKmdvyLMo9jwbvXuztfKUQCm7VyB94bqMO/7cZ+mUc9JoDQuwpXea3S4aqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LOUqepIP; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LOUqepIP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3rGy1RQrz2ymg;
	Fri, 28 Feb 2025 12:29:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740706187; x=1772242187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Kaw4aySzXzJh8b//ALxlZ2RwWuBVvZuS4cYdwjBK+4=;
  b=LOUqepIPuJgVrM9Ax8zWf51GGL3qfxvDKd0Ygx7CGmyO4+FLEjOJfQ5B
   qJYvF+TD253Na9Hw5ZvGqXhugwR0n06PO23IQPi+/Lw6fM0+DEwn2HZN1
   TE3IcmiyC4B2MH8zPWy7qbI0yExFyvFSYTvcERoPnwCbmE7B1o5o8xz1l
   BGIHq6A/AzhfIKMODstr9R9hC8LybXqdc1j7fJGsWeRcrZzyG6BEccwNg
   47ZVYgT7OrGJ/3pAPTjXuywuDhRIMl0DKQocvUszCQqSKo4id8Ymbjfh5
   U7AOhOPb49F6Qa/1oVTtxPwDo4xljy4AjJAvjKp4cBP8FlGRpT895brEE
   A==;
X-CSE-ConnectionGUID: nps5WG7pTiybFiHaXoLSqw==
X-CSE-MsgGUID: 7CJral5uRQ+HlAzxkzx+sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45275647"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="45275647"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 17:29:41 -0800
X-CSE-ConnectionGUID: tQ2gpyfRQ9adco+P481y1g==
X-CSE-MsgGUID: EFDf9J9jSi+DvFy8QwsOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="148014413"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Feb 2025 17:29:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnpBh-000EH4-0H;
	Fri, 28 Feb 2025 01:29:25 +0000
Date: Fri, 28 Feb 2025 09:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org,
	joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <202502280902.U0gLDhve-lkp@intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_recover_bus':
>> drivers/i2c/busses/i2c-ast2600.c:345:32: warning: unsigned conversion from 'int' to 'u8' {aka 'unsigned char'} changes value from '-145' to '111' [-Woverflow]
     345 |                         return -ETIMEDOUT;
         |                                ^


vim +345 drivers/i2c/busses/i2c-ast2600.c

   315	
   316	static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
   317	{
   318		u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   319		int ret = 0;
   320		u32 ctrl;
   321		int r;
   322	
   323		dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr, state);
   324	
   325		ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   326	
   327		/* Disable controller */
   328		writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
   329		       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   330	
   331		writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) | AST2600_I2CC_MASTER_EN,
   332		       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   333	
   334		reinit_completion(&i2c_bus->cmd_complete);
   335		i2c_bus->cmd_err = 0;
   336	
   337		/* Check 0x14's SDA and SCL status */
   338		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   339		if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
   340			writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   341			r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
   342			if (r == 0) {
   343				dev_dbg(i2c_bus->dev, "recovery timed out\n");
   344				writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
 > 345				return -ETIMEDOUT;
   346			} else if (i2c_bus->cmd_err) {
   347				dev_dbg(i2c_bus->dev, "recovery error\n");
   348				ret = -EPROTO;
   349			}
   350		}
   351	
   352		/* Recovery done */
   353		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   354		if (state & AST2600_I2CC_BUS_BUSY_STS) {
   355			dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
   356			ret = -EPROTO;
   357		}
   358	
   359		/* restore original controller setting */
   360		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
