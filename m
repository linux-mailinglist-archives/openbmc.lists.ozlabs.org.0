Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B3D9915A3
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2024 12:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLLYq46VRz3c3x
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2024 20:02:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728122540;
	cv=none; b=oV7PY90qI/WlXWDBVA5LevzosSURZqhgTI2/XIF/1vhy+V/LAC9dyr2meZHawr9eGwueW6D+gmpbnc1wz15OzK2saP37rPyetIWK6+b6vnuT0Bdfe0Ost2VWrd1ERB8y+JsuA36ASSVB0OFoN+lHl9PbtxpmOltxQRRWZ4AnmdGJtafAGVs7z+4V4RhFMh12zpaY6hwO6UZh8xrjK/xWLMBHzoYnBUsukbeVQVRtLUgr6Mvnb7/FxKwiTgLDfQbHPHvd+jz3hpjnaT4EyfR9iWGjwwcUvmysDh3PXRwmbgGsrFZszZtovAlLuFSjXOwrRpD+/VpcqfgLUKDUY4id+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728122540; c=relaxed/relaxed;
	bh=8+uCBuz8TgxlE76ehikGDkBzb24ZPACcaJkYOutgSLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD6K7ugSO5qgwcghc00p/n2lrmZT4HRMscRdc5EdcrzseowzvRBC/Su2HZ+WoJ3FqL19FeMk+hKX2gZiaNHU4wEo6SMCwhFVYr2dSDnIvvu7r+YYl/6DxkR2fUP3OgTloYJtQgYctEbq7J8cxu0z0TKLx1aDBD2ZL+kooWqjHwICd1187Zq8hUG3iEqUfhmLvq4yePBavntvTnwzq8mT/GrxRSWLI7ACp8fUlgFFPKmLGyK8Bg43EawpY7spcWzOSDZAV+JnKbq7DupCcDV9wRrbKvp+6ylWlwWoZgVf/+IuCK90UR9rVCwirXhmO2GUtdKvIGuqE0XZf3wysVVS8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ktXqArpv; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ktXqArpv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 05 Oct 2024 20:02:19 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLLYl3B4cz2yVD
	for <openbmc@lists.ozlabs.org>; Sat,  5 Oct 2024 20:02:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728122540; x=1759658540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AS66JIPtXx2sZQ/smwiZJMTI3t0JMMag9/KeDzC1/38=;
  b=ktXqArpvpMd1U7uGt3UK0FlSJSnvfPgEFaDE0jAMKmmD4UThOCQFbRMv
   RrqLJrsIBYdZFbbDGBYTKbRGZeu2nJmuYrAdergYovCuWOyRJMxSDaAZ1
   ihwXqpZwTUH7Dos14M/SY9/mQO4+x8wPjKxunyvWmFVgXzAAFxIBR4IG6
   adOBMHmVGdu7t6tLrZw4AiHL4GpLGE3cXRNi1MD5AKz3tmULbdo+tNWW8
   dv8MCrzWQE4kEaxp4pDuBegasWBxpjdk3Wzemlwde3fPgNfu4PQstGWCK
   UvNSDQk6YFPyg/AR6xOmB1OoU/HGi5mpqowON+qn3H6CPE8SlAyytFroz
   Q==;
X-CSE-ConnectionGUID: bRRYtfNrQQS8HGMsp9vgJw==
X-CSE-MsgGUID: ZVrCXLOOS8G1PFxoQEYSSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27426136"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27426136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 03:01:10 -0700
X-CSE-ConnectionGUID: qc9AevAoQe6hbVVwa7kNtw==
X-CSE-MsgGUID: gqkgz86BSNeOu8NTBwAbZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="105707403"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2024 03:01:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx1ax-0002ps-0H;
	Sat, 05 Oct 2024 10:01:03 +0000
Date: Sat, 5 Oct 2024 18:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, brendan.higgins@linux.dev,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <202410051759.bRIS387l-lkp@intel.com>
References: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.11]
[cannot apply to andi-shyti/i2c/i2c-host v6.12-rc1 linus/master next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20241002-150410
base:   v6.11
patch link:    https://lore.kernel.org/r/20241002070213.1165263-3-ryan_chen%40aspeedtech.com
patch subject: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410051759.bRIS387l-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051759.bRIS387l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051759.bRIS387l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-ast2600.c:437:6: error: call to undeclared function 'get_unaligned_le16'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     437 |                                         get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^
>> drivers/i2c/busses/i2c-ast2600.c:441:6: error: call to undeclared function 'get_unaligned_le24'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     441 |                                         get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^
>> drivers/i2c/busses/i2c-ast2600.c:445:6: error: call to undeclared function 'get_unaligned_le32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     445 |                                         get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^
   3 errors generated.


vim +/get_unaligned_le16 +437 drivers/i2c/busses/i2c-ast2600.c

   405	
   406	static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
   407	{
   408		struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
   409		u32 wbuf_dword;
   410		int xfer_len;
   411		int i;
   412	
   413		cmd |= AST2600_I2CM_PKT_EN;
   414		xfer_len = msg->len - i2c_bus->master_xfer_cnt;
   415		if (xfer_len > i2c_bus->buf_size)
   416			xfer_len = i2c_bus->buf_size;
   417		else if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
   418			cmd |= AST2600_I2CM_STOP_CMD;
   419	
   420		if (cmd & AST2600_I2CM_START_CMD)
   421			cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
   422	
   423		if (xfer_len) {
   424			cmd |= AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
   425			/*
   426			 * The controller's buffer register supports dword writes only.
   427			 * Therefore, write dwords to the buffer register in a 4-byte aligned,
   428			 * and write the remaining unaligned data at the end.
   429			 */
   430			for (i = 0; i < xfer_len; i += 4) {
   431				switch (min(xfer_len - i, 4) % 4) {
   432				case 1:
   433					wbuf_dword = msg->buf[i2c_bus->master_xfer_cnt + i];
   434					break;
   435				case 2:
   436					wbuf_dword =
 > 437						get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   438					break;
   439				case 3:
   440					wbuf_dword =
 > 441						get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   442					break;
   443				default:
   444					wbuf_dword =
 > 445						get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   446					break;
   447				}
   448				writel(wbuf_dword, i2c_bus->buf_base + i);
   449			}
   450			writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
   451			       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
   452		}
   453	
   454		writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   455	
   456		return 0;
   457	}
   458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
