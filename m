Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A899571B3
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2024 19:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnfKQ4hm8z2yyG
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2024 03:12:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f8k+riKQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnfKK29njz2xYl
	for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2024 03:12:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724087526; x=1755623526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5be6NANqCnSQWVCurB1rO+7usnFCSgQLbnPB2Fvl3Vo=;
  b=f8k+riKQd9B2pO+fs8XsWhVSqMtxZv4dPjNr58xtNSUjgsY55pQDhIGZ
   1GkbFFfWM9IH4LN7zjRIfwQg75AVoF83DB6Tsn0cOcFZ1hYIAB1CQyPbC
   7WHA+3OC4GnCyxHDXK8Q6t8eKTHavLfynQ8qYXjNhUK7D6X/v3z/7Hi8U
   KgWPvjrqyYy/9Zyk7mm1Ff8MupxV4SHFs6SXqSkPnuHt9R8hlG9aYXGiP
   zJnr8/G0IGEap7IDUVXkDPm6QG1Cx0fZc6zIjsfqN/G0D2SqcYSDbYOkG
   /KSjs6lkdekMGulCksBjKk2Sqv9hmbHLLyfeaxgNMSMTQjtVWlCGv56wt
   A==;
X-CSE-ConnectionGUID: tRSmf94FSOOdR/R+ktZ3jQ==
X-CSE-MsgGUID: yYM0/1PISHC3sgJr7CgOxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33733102"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="33733102"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:11:58 -0700
X-CSE-ConnectionGUID: jpoYwQRwRh+GoDazyZ6fKA==
X-CSE-MsgGUID: zhkdrZHCRhCQlnPNMvsjjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="65393019"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Aug 2024 10:11:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg5v5-0009EA-1H;
	Mon, 19 Aug 2024 17:11:51 +0000
Date: Tue, 20 Aug 2024 01:10:52 +0800
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
Message-ID: <202408200236.8yWq6lLk-lkp@intel.com>
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240820/202408200236.8yWq6lLk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200236.8yWq6lLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200236.8yWq6lLk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-ast2600.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/i2c/busses/i2c-ast2600.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/i2c/busses/i2c-ast2600.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/i2c/busses/i2c-ast2600.c:11:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-ast2600.c:295:20: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     295 |                 else if ((i > 0) || (i < 5))
         |                          ~~~~~~~~^~~~~~~~~~
   drivers/i2c/busses/i2c-ast2600.c:292:18: warning: variable 'baseclk_idx' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
     292 |         for (int i = 0; i < 16; i++) {
         |                         ^~~~~~
   drivers/i2c/busses/i2c-ast2600.c:307:20: note: uninitialized use occurs here
     307 |         baseclk_idx = min(baseclk_idx, 15);
         |                           ^~~~~~~~~~~
   include/linux/minmax.h:129:38: note: expanded from macro 'min'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                            ^
   include/linux/minmax.h:105:25: note: expanded from macro '__careful_cmp'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                ^
   include/linux/minmax.h:99:20: note: expanded from macro '__careful_cmp_once'
      99 |         __auto_type ux = (x); __auto_type uy = (y);     \
         |                           ^
   drivers/i2c/busses/i2c-ast2600.c:292:18: note: remove the condition if it is always true
     292 |         for (int i = 0; i < 16; i++) {
         |                         ^~~~~~
   drivers/i2c/busses/i2c-ast2600.c:283:17: note: initialize the variable 'baseclk_idx' to silence this warning
     283 |         int baseclk_idx;
         |                        ^
         |                         = 0
>> drivers/i2c/busses/i2c-ast2600.c:442:18: error: call to undeclared function 'get_unaligned_le32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     442 |                                 wbuf_dword = get_unaligned_le32(wbuf);
         |                                              ^
   9 warnings and 1 error generated.


vim +/get_unaligned_le32 +442 drivers/i2c/busses/i2c-ast2600.c

   279	
   280	static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
   281	{
   282		unsigned long base_clk[16];
   283		int baseclk_idx;
   284		u32 clk_div_reg;
   285		u32 scl_low;
   286		u32 scl_high;
   287		int divisor;
   288		u32 data;
   289	
   290		regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, &clk_div_reg);
   291	
   292		for (int i = 0; i < 16; i++) {
   293			if (i == 0)
   294				base_clk[i] = i2c_bus->apb_clk;
 > 295			else if ((i > 0) || (i < 5))
   296				base_clk[i] = (i2c_bus->apb_clk * 2) /
   297					(((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
   298			else
   299				base_clk[i] = base_clk[4] / (1 << (i - 5));
   300	
   301			if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <= 32) {
   302				baseclk_idx = i;
   303				divisor = DIV_ROUND_UP(base_clk[i], i2c_bus->timing_info.bus_freq_hz);
   304				break;
   305			}
   306		}
   307		baseclk_idx = min(baseclk_idx, 15);
   308		divisor = min(divisor, 32);
   309		scl_low = min(divisor * 9 / 16 - 1, 15);
   310		scl_high = (divisor - scl_low - 2) & GENMASK(3, 0);
   311		data = (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | baseclk_idx;
   312		if (i2c_bus->timeout) {
   313			data |= AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
   314			data |= AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
   315		}
   316	
   317		return data;
   318	}
   319	
   320	static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
   321	{
   322		u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   323		int ret = 0;
   324		u32 ctrl;
   325		int r;
   326	
   327		dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr, state);
   328	
   329		ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   330	
   331		/* Disable master/slave mode */
   332		writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
   333		       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   334	
   335		/* Enable master mode only */
   336		writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) | AST2600_I2CC_MASTER_EN,
   337		       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   338	
   339		reinit_completion(&i2c_bus->cmd_complete);
   340		i2c_bus->cmd_err = 0;
   341	
   342		/* Check 0x14's SDA and SCL status */
   343		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   344		if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
   345			writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   346			r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
   347			if (r == 0) {
   348				dev_dbg(i2c_bus->dev, "recovery timed out\n");
   349				ret = -ETIMEDOUT;
   350			} else {
   351				if (i2c_bus->cmd_err) {
   352					dev_dbg(i2c_bus->dev, "recovery error\n");
   353					ret = -EPROTO;
   354				}
   355			}
   356		}
   357	
   358		/* Recovery done */
   359		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
   360		if (state & AST2600_I2CC_BUS_BUSY_STS) {
   361			dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
   362			ret = -EPROTO;
   363		}
   364	
   365		/* restore original master/slave setting */
   366		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
   367		return ret;
   368	}
   369	
   370	static int ast2600_i2c_setup_dma_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
   371	{
   372		struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
   373		int xfer_len;
   374	
   375		cmd |= AST2600_I2CM_PKT_EN;
   376		xfer_len = msg->len - i2c_bus->master_xfer_cnt;
   377		if (xfer_len > AST2600_I2C_DMA_SIZE) {
   378			xfer_len = AST2600_I2C_DMA_SIZE;
   379		} else {
   380			if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
   381				cmd |= AST2600_I2CM_STOP_CMD;
   382		}
   383	
   384		if (cmd & AST2600_I2CM_START_CMD) {
   385			cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
   386			i2c_bus->master_safe_buf = i2c_get_dma_safe_msg_buf(msg, 1);
   387			if (!i2c_bus->master_safe_buf)
   388				return -ENOMEM;
   389			i2c_bus->master_dma_addr =
   390				dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf,
   391					       msg->len, DMA_TO_DEVICE);
   392			if (dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr)) {
   393				i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg, false);
   394				i2c_bus->master_safe_buf = NULL;
   395				return -ENOMEM;
   396			}
   397		}
   398	
   399		if (xfer_len) {
   400			cmd |= AST2600_I2CM_TX_DMA_EN | AST2600_I2CM_TX_CMD;
   401			writel(AST2600_I2CM_SET_TX_DMA_LEN(xfer_len - 1),
   402			       i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
   403			writel(i2c_bus->master_dma_addr + i2c_bus->master_xfer_cnt,
   404			       i2c_bus->reg_base + AST2600_I2CM_TX_DMA);
   405		}
   406	
   407		writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   408	
   409		return 0;
   410	}
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
