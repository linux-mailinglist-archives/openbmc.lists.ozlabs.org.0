Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4299151B
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2024 09:38:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLHMc5vCMz3c3l
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2024 17:38:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728113898;
	cv=none; b=LdwuOFUAerBCiQUoc9f6w9xTddNfLJ+E5X+Shu+qnHXDAiXuRBcMeE4e632/72xO49iWOBPvFGDEnDqS97y8a3mbETB9t+eokkopG5pUgKU5bplAqeu6t9FpsiT1OAZN4ynZE5totBFasPFrbB2g4TCW/m5bt/tee42byGpPCThHLUd1LeknXbIOB7xtZ3Q3PjW5I7/2cszRIW5pX69Y1OzFEANjaD3ZRPsa0ENWlxjr8lnk7PqfS0+wt3VUVu9mSJKkOEJbZ+Tq09XKIDv2muFT18pBd5sZmfLCSzVpJ6hFwgGtGAAvnQQsy2qsOB8DOV09UCYYtsvRV1d0mR2pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728113898; c=relaxed/relaxed;
	bh=ZkNgLHMw44oNNkQN4d4HJxy8L+gik/cbCPxW6GPkBAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drR5fMpZMfDnpWQymwpMJDsR5RLTHj+cmFqcAbayw7tnaM8PTUCyrZZ5NWRwtfTRWJXavgr31ZirEMz2cDtcaNpKW0EWlrn70XEMRDj8ndQ8y62GyprmNZWSJ+8rhd4MPd161Z+1tkvI4OqIa2W5J9aeQePVAoe4srGwCR73eHvHlRm5ixcYKsNQn0d5ZhHu6gKcKqfrwgD9Fe1LEb2ZnT/sso7LoNKhWOqIYuJ/EVI/oWL+wV+hhsdCe0EImp3zX4IEjHV3Lt0fYOJoD+tLNAQa0imKYboskOddRn8AWqmfiYOYtQoPKBg6pjesfZ5hJQp9HDjkrvSDKWGGrlANdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DA5Uzinm; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DA5Uzinm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Sat, 05 Oct 2024 17:38:17 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLHMY0hVgz2yGD
	for <openbmc@lists.ozlabs.org>; Sat,  5 Oct 2024 17:38:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728113897; x=1759649897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u6WMt7NaLIFTr5THXasDszPWd+K083tVONyzoKZD91Q=;
  b=DA5UzinmsylEsrkoIHCox3Vl53tbmneHK0yHosoPkH0ydPebuUf6jm8J
   mbi91+1MHPIU1OIXpq9JA7ImQgrNGqxQYujFI4LfgP938THilq/Gd4Bx5
   l9aH2LWyavttvJ0k1mIFVGFHXKlcp+NtauFI8kF+r9o2GI5ggAjhVcVzi
   hIWR/I0JHzXSFg+zhw+2apP9ybmc0lmlY8gADN+TGMJ30jjXzZ5H4Foct
   5mVmGusdAX+obHIJ0apXNtKzPPugsf9q0eq+YIvRsnnAAmH4sfQHRyDjL
   bzDmwjK6yAxfnA6DMAcNneP5vX+OWJ8wehiEhb/5EmJUa7PunpR0hRA/n
   Q==;
X-CSE-ConnectionGUID: W4Bi7R8ERbW4GycUKORPDg==
X-CSE-MsgGUID: Co96BAhMSi6aUIG4I1D96Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31218603"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="31218603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 00:37:06 -0700
X-CSE-ConnectionGUID: v7tGEJ1EQsSmbuMbbEYZGg==
X-CSE-MsgGUID: i2WP+xpVR8S+46CU4OAu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79892116"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2024 00:37:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzLX-0002k8-2H;
	Sat, 05 Oct 2024 07:36:59 +0000
Date: Sat, 5 Oct 2024 15:36:16 +0800
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
Message-ID: <202410051547.vOL3qMOc-lkp@intel.com>
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
Cc: oe-kbuild-all@lists.linux.dev
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051547.vOL3qMOc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_setup_buff_tx':
>> drivers/i2c/busses/i2c-ast2600.c:437:41: error: implicit declaration of function 'get_unaligned_le16'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     437 |                                         get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl
>> drivers/i2c/busses/i2c-ast2600.c:441:41: error: implicit declaration of function 'get_unaligned_le24'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     441 |                                         get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl
>> drivers/i2c/busses/i2c-ast2600.c:445:41: error: implicit declaration of function 'get_unaligned_le32'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     445 |                                         get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl


vim +437 drivers/i2c/busses/i2c-ast2600.c

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
