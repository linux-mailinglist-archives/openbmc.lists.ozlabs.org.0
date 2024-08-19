Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A13956EBC
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2024 17:29:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wnc2T0Qm0z2yxj
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2024 01:29:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hqdcVuMq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wnc2M3xNqz2xHr
	for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2024 01:28:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724081340; x=1755617340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+/UT1olTGSkvbiVyjjw4uFqCudbOKfjOI1VeyWZTAw=;
  b=hqdcVuMqP/ba40o9UEcqXhtCB8mNb4BD7L7KAVQUHWSv/u+j0i827fLP
   cOWiOPp2gQ+Cb++v1xGhGRdrsE6jIPIRJh46xRz3QKSYJKRDb3IrtZuaI
   xo+SW1BqnH95OCQgaNva6gb3OJ9IBAAIXzX72NKtt8hkBhVqBRKEGdatg
   BH12rZ9pl5jciH9GJezu81ahW0cXRcuoPLUATOT/qp5TG7+CoHDMaAkEh
   dZbP3Q1tmguyclOXuth6H3BI16ShxWN13VxUm+x5dAIB2zkRU/cA8u9kH
   W8MgqRrTkLvisL/R6hEwVtBEqMSmAvu2vGlLKU4meaHlTWQbSCc2uQZOu
   A==;
X-CSE-ConnectionGUID: 7QvO89p0R0aKRoCYsT0sMQ==
X-CSE-MsgGUID: yC62rBbGQcCJIJAZ+TSv8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22220514"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22220514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 08:28:53 -0700
X-CSE-ConnectionGUID: PW1DYPY+RiyaSVjJm8L5vg==
X-CSE-MsgGUID: +BYVAJ/nRKmj1g1pxVmTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="97880937"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2024 08:28:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg4JK-00097m-1F;
	Mon, 19 Aug 2024 15:28:46 +0000
Date: Mon, 19 Aug 2024 23:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, brendan.higgins@linux.dev,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <202408192327.nZeNynmO-lkp@intel.com>
References: <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
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

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc4 next-20240819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20240819-173106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240819092850.1590758-3-ryan_chen%40aspeedtech.com
patch subject: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240819/202408192327.nZeNynmO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408192327.nZeNynmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408192327.nZeNynmO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_setup_buff_tx':
>> drivers/i2c/busses/i2c-ast2600.c:442:46: error: implicit declaration of function 'get_unaligned_le32' [-Wimplicit-function-declaration]
     442 |                                 wbuf_dword = get_unaligned_le32(wbuf);
         |                                              ^~~~~~~~~~~~~~~~~~


vim +/get_unaligned_le32 +442 drivers/i2c/busses/i2c-ast2600.c

   411	
   412	static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
   413	{
   414		struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
   415		u32 wbuf_dword;
   416		int xfer_len;
   417		u8 wbuf[4];
   418		int i;
   419	
   420		cmd |= AST2600_I2CM_PKT_EN;
   421		xfer_len = msg->len - i2c_bus->master_xfer_cnt;
   422		if (xfer_len > i2c_bus->buf_size) {
   423			xfer_len = i2c_bus->buf_size;
   424		} else {
   425			if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
   426				cmd |= AST2600_I2CM_STOP_CMD;
   427		}
   428	
   429		if (cmd & AST2600_I2CM_START_CMD)
   430			cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
   431	
   432		if (xfer_len) {
   433			cmd |= AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
   434			/*
   435			 * The controller's buffer register supports dword writes only.
   436			 * Therefore, write dwords to the buffer register in a 4-byte aligned,
   437			 * and write the remaining unaligned data at the end.
   438			 */
   439			for (i = 0; i < xfer_len; i++) {
   440				wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
   441				if ((i % 4) == 3 || i == xfer_len - 1) {
 > 442					wbuf_dword = get_unaligned_le32(wbuf);
   443					writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
   444				}
   445			}
   446	
   447			writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
   448			       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
   449		}
   450	
   451		writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   452	
   453		return 0;
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
