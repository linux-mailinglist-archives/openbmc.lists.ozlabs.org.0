Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD559012EA
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2024 19:04:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFXmwB93;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VxPZ94zZTz3cTF
	for <lists+openbmc@lfdr.de>; Sun,  9 Jun 2024 03:04:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFXmwB93;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VxPYX3r8Rz2ypm;
	Sun,  9 Jun 2024 03:04:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717866257; x=1749402257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z6hcz0F9fMtfnwiX+iUxiM8f8ZduXCkVg0g5hvHDMMo=;
  b=BFXmwB93OHiCe86iGNJl2w5HN94dH/DniVIT8uNv2J7dCDGNNMAX0i4l
   nCvKvukzbWfWXIdhqvWV1aGL8RTet2lVkDoC45/UZ6gEb7Iw1htb73RsQ
   4J73Nh5O0ZHzeKqC/3G2iA/O+vtzN7lFSA8vI6S+nW9EJFS5SwdL9bgdL
   hcQl5cqgucoNIRwLrsl64r2/qeeWdLmn9uFZn7jwJ8tCVjv3yTZIB4DMt
   kllo0GiQpipXYq1pLa7Xg1JmPECwUOhLR4POPeR9NXoUm0KfAjStl3QE5
   bbjzaTGsMTvQL13H0/xWxaMRUJba3UKVng/bwSl3r5CRsDl/R1x3EoA57
   g==;
X-CSE-ConnectionGUID: VkgtPpFgQXeVJ1YEWQd/pw==
X-CSE-MsgGUID: /7p5iBAOQZWxy4wGiO7huA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="18434305"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="18434305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 10:04:12 -0700
X-CSE-ConnectionGUID: sW2ik39mR3KX67iTdnaFag==
X-CSE-MsgGUID: 9HMY1i4sQTWyuPB9hzziWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; 
   d="scan'208";a="38630148"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2024 10:04:08 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFzU6-0000G4-0n;
	Sat, 08 Jun 2024 17:04:06 +0000
Date: Sun, 9 Jun 2024 01:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tommy Huang <tommy_huang@aspeedtech.com>, brendan.higgins@linux.dev,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	andrew@codeconstruct.com.au, wsa@kernel.org
Subject: Re: [PATCH v2] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Message-ID: <202406090027.3FWHQLNi-lkp@intel.com>
References: <20240608043653.4086647-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608043653.4086647-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-i2c@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.10-rc2 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tommy-Huang/i2c-aspeed-Update-the-stop-sw-state-when-the-bus-recovery-occurs/20240608-124429
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240608043653.4086647-1-tommy_huang%40aspeedtech.com
patch subject: [PATCH v2] i2c: aspeed: Update the stop sw state when the bus recovery occurs
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240609/202406090027.3FWHQLNi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090027.3FWHQLNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090027.3FWHQLNi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-aspeed.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/i2c/busses/i2c-aspeed.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/i2c/busses/i2c-aspeed.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from drivers/i2c/busses/i2c-aspeed.c:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-aspeed.c:28:39: warning: declaration of 'struct aspeed_i2c_bus' will not be visible outside of this function [-Wvisibility]
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |                                       ^
>> drivers/i2c/busses/i2c-aspeed.c:192:22: error: incompatible pointer types passing 'struct aspeed_i2c_bus *' to parameter of type 'struct aspeed_i2c_bus *' [-Werror,-Wincompatible-pointer-types]
     192 |                 aspeed_i2c_do_stop(bus);
         |                                    ^~~
   drivers/i2c/busses/i2c-aspeed.c:28:55: note: passing argument to parameter 'bus' here
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |                                                       ^
>> drivers/i2c/busses/i2c-aspeed.c:396:13: error: conflicting types for 'aspeed_i2c_do_stop'
     396 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
         |             ^
   drivers/i2c/busses/i2c-aspeed.c:28:13: note: previous declaration is here
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |             ^
   drivers/i2c/busses/i2c-aspeed.c:409:22: error: incompatible pointer types passing 'struct aspeed_i2c_bus *' to parameter of type 'struct aspeed_i2c_bus *' [-Werror,-Wincompatible-pointer-types]
     409 |                 aspeed_i2c_do_stop(bus);
         |                                    ^~~
   drivers/i2c/busses/i2c-aspeed.c:28:55: note: passing argument to parameter 'bus' here
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |                                                       ^
   drivers/i2c/busses/i2c-aspeed.c:469:23: error: incompatible pointer types passing 'struct aspeed_i2c_bus *' to parameter of type 'struct aspeed_i2c_bus *' [-Werror,-Wincompatible-pointer-types]
     469 |                         aspeed_i2c_do_stop(bus);
         |                                            ^~~
   drivers/i2c/busses/i2c-aspeed.c:28:55: note: passing argument to parameter 'bus' here
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |                                                       ^
   drivers/i2c/busses/i2c-aspeed.c:507:23: error: incompatible pointer types passing 'struct aspeed_i2c_bus *' to parameter of type 'struct aspeed_i2c_bus *' [-Werror,-Wincompatible-pointer-types]
     507 |                         aspeed_i2c_do_stop(bus);
         |                                            ^~~
   drivers/i2c/busses/i2c-aspeed.c:28:55: note: passing argument to parameter 'bus' here
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |                                                       ^
   drivers/i2c/busses/i2c-aspeed.c:512:23: error: incompatible pointer types passing 'struct aspeed_i2c_bus *' to parameter of type 'struct aspeed_i2c_bus *' [-Werror,-Wincompatible-pointer-types]
     512 |                         aspeed_i2c_do_stop(bus);
         |                                            ^~~
   drivers/i2c/busses/i2c-aspeed.c:28:55: note: passing argument to parameter 'bus' here
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |                                                       ^
   drivers/i2c/busses/i2c-aspeed.c:562:24: error: incompatible pointer types passing 'struct aspeed_i2c_bus *' to parameter of type 'struct aspeed_i2c_bus *' [-Werror,-Wincompatible-pointer-types]
     562 |                                 aspeed_i2c_do_stop(bus);
         |                                                    ^~~
   drivers/i2c/busses/i2c-aspeed.c:28:55: note: passing argument to parameter 'bus' here
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |                                                       ^
   drivers/i2c/busses/i2c-aspeed.c:608:21: error: incompatible pointer types passing 'struct aspeed_i2c_bus *' to parameter of type 'struct aspeed_i2c_bus *' [-Werror,-Wincompatible-pointer-types]
     608 |         aspeed_i2c_do_stop(bus);
         |                            ^~~
   drivers/i2c/busses/i2c-aspeed.c:28:55: note: passing argument to parameter 'bus' here
      28 | static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
         |                                                       ^
   8 warnings and 8 errors generated.


vim +192 drivers/i2c/busses/i2c-aspeed.c

    27	
  > 28	static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
    29	
    30	/* I2C Register */
    31	#define ASPEED_I2C_FUN_CTRL_REG				0x00
    32	#define ASPEED_I2C_AC_TIMING_REG1			0x04
    33	#define ASPEED_I2C_AC_TIMING_REG2			0x08
    34	#define ASPEED_I2C_INTR_CTRL_REG			0x0c
    35	#define ASPEED_I2C_INTR_STS_REG				0x10
    36	#define ASPEED_I2C_CMD_REG				0x14
    37	#define ASPEED_I2C_DEV_ADDR_REG				0x18
    38	#define ASPEED_I2C_BYTE_BUF_REG				0x20
    39	
    40	/* Global Register Definition */
    41	/* 0x00 : I2C Interrupt Status Register  */
    42	/* 0x08 : I2C Interrupt Target Assignment  */
    43	
    44	/* Device Register Definition */
    45	/* 0x00 : I2CD Function Control Register  */
    46	#define ASPEED_I2CD_MULTI_MASTER_DIS			BIT(15)
    47	#define ASPEED_I2CD_SDA_DRIVE_1T_EN			BIT(8)
    48	#define ASPEED_I2CD_M_SDA_DRIVE_1T_EN			BIT(7)
    49	#define ASPEED_I2CD_M_HIGH_SPEED_EN			BIT(6)
    50	#define ASPEED_I2CD_SLAVE_EN				BIT(1)
    51	#define ASPEED_I2CD_MASTER_EN				BIT(0)
    52	
    53	/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
    54	#define ASPEED_I2CD_TIME_TBUF_MASK			GENMASK(31, 28)
    55	#define ASPEED_I2CD_TIME_THDSTA_MASK			GENMASK(27, 24)
    56	#define ASPEED_I2CD_TIME_TACST_MASK			GENMASK(23, 20)
    57	#define ASPEED_I2CD_TIME_SCL_HIGH_SHIFT			16
    58	#define ASPEED_I2CD_TIME_SCL_HIGH_MASK			GENMASK(19, 16)
    59	#define ASPEED_I2CD_TIME_SCL_LOW_SHIFT			12
    60	#define ASPEED_I2CD_TIME_SCL_LOW_MASK			GENMASK(15, 12)
    61	#define ASPEED_I2CD_TIME_BASE_DIVISOR_MASK		GENMASK(3, 0)
    62	#define ASPEED_I2CD_TIME_SCL_REG_MAX			GENMASK(3, 0)
    63	/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
    64	#define ASPEED_NO_TIMEOUT_CTRL				0
    65	
    66	/* 0x0c : I2CD Interrupt Control Register &
    67	 * 0x10 : I2CD Interrupt Status Register
    68	 *
    69	 * These share bit definitions, so use the same values for the enable &
    70	 * status bits.
    71	 */
    72	#define ASPEED_I2CD_INTR_RECV_MASK			0xf000ffff
    73	#define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT			BIT(14)
    74	#define ASPEED_I2CD_INTR_BUS_RECOVER_DONE		BIT(13)
    75	#define ASPEED_I2CD_INTR_SLAVE_MATCH			BIT(7)
    76	#define ASPEED_I2CD_INTR_SCL_TIMEOUT			BIT(6)
    77	#define ASPEED_I2CD_INTR_ABNORMAL			BIT(5)
    78	#define ASPEED_I2CD_INTR_NORMAL_STOP			BIT(4)
    79	#define ASPEED_I2CD_INTR_ARBIT_LOSS			BIT(3)
    80	#define ASPEED_I2CD_INTR_RX_DONE			BIT(2)
    81	#define ASPEED_I2CD_INTR_TX_NAK				BIT(1)
    82	#define ASPEED_I2CD_INTR_TX_ACK				BIT(0)
    83	#define ASPEED_I2CD_INTR_MASTER_ERRORS					       \
    84			(ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			       \
    85			 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
    86			 ASPEED_I2CD_INTR_ABNORMAL |				       \
    87			 ASPEED_I2CD_INTR_ARBIT_LOSS)
    88	#define ASPEED_I2CD_INTR_ALL						       \
    89			(ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			       \
    90			 ASPEED_I2CD_INTR_BUS_RECOVER_DONE |			       \
    91			 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
    92			 ASPEED_I2CD_INTR_ABNORMAL |				       \
    93			 ASPEED_I2CD_INTR_NORMAL_STOP |				       \
    94			 ASPEED_I2CD_INTR_ARBIT_LOSS |				       \
    95			 ASPEED_I2CD_INTR_RX_DONE |				       \
    96			 ASPEED_I2CD_INTR_TX_NAK |				       \
    97			 ASPEED_I2CD_INTR_TX_ACK)
    98	
    99	/* 0x14 : I2CD Command/Status Register   */
   100	#define ASPEED_I2CD_SCL_LINE_STS			BIT(18)
   101	#define ASPEED_I2CD_SDA_LINE_STS			BIT(17)
   102	#define ASPEED_I2CD_BUS_BUSY_STS			BIT(16)
   103	#define ASPEED_I2CD_BUS_RECOVER_CMD			BIT(11)
   104	
   105	/* Command Bit */
   106	#define ASPEED_I2CD_M_STOP_CMD				BIT(5)
   107	#define ASPEED_I2CD_M_S_RX_CMD_LAST			BIT(4)
   108	#define ASPEED_I2CD_M_RX_CMD				BIT(3)
   109	#define ASPEED_I2CD_S_TX_CMD				BIT(2)
   110	#define ASPEED_I2CD_M_TX_CMD				BIT(1)
   111	#define ASPEED_I2CD_M_START_CMD				BIT(0)
   112	#define ASPEED_I2CD_MASTER_CMDS_MASK					       \
   113			(ASPEED_I2CD_M_STOP_CMD |				       \
   114			 ASPEED_I2CD_M_S_RX_CMD_LAST |				       \
   115			 ASPEED_I2CD_M_RX_CMD |					       \
   116			 ASPEED_I2CD_M_TX_CMD |					       \
   117			 ASPEED_I2CD_M_START_CMD)
   118	
   119	/* 0x18 : I2CD Slave Device Address Register   */
   120	#define ASPEED_I2CD_DEV_ADDR_MASK			GENMASK(6, 0)
   121	
   122	enum aspeed_i2c_master_state {
   123		ASPEED_I2C_MASTER_INACTIVE,
   124		ASPEED_I2C_MASTER_PENDING,
   125		ASPEED_I2C_MASTER_START,
   126		ASPEED_I2C_MASTER_TX_FIRST,
   127		ASPEED_I2C_MASTER_TX,
   128		ASPEED_I2C_MASTER_RX_FIRST,
   129		ASPEED_I2C_MASTER_RX,
   130		ASPEED_I2C_MASTER_STOP,
   131	};
   132	
   133	enum aspeed_i2c_slave_state {
   134		ASPEED_I2C_SLAVE_INACTIVE,
   135		ASPEED_I2C_SLAVE_START,
   136		ASPEED_I2C_SLAVE_READ_REQUESTED,
   137		ASPEED_I2C_SLAVE_READ_PROCESSED,
   138		ASPEED_I2C_SLAVE_WRITE_REQUESTED,
   139		ASPEED_I2C_SLAVE_WRITE_RECEIVED,
   140		ASPEED_I2C_SLAVE_STOP,
   141	};
   142	
   143	struct aspeed_i2c_bus {
   144		struct i2c_adapter		adap;
   145		struct device			*dev;
   146		void __iomem			*base;
   147		struct reset_control		*rst;
   148		/* Synchronizes I/O mem access to base. */
   149		spinlock_t			lock;
   150		struct completion		cmd_complete;
   151		u32				(*get_clk_reg_val)(struct device *dev,
   152								   u32 divisor);
   153		unsigned long			parent_clk_frequency;
   154		u32				bus_frequency;
   155		/* Transaction state. */
   156		enum aspeed_i2c_master_state	master_state;
   157		struct i2c_msg			*msgs;
   158		size_t				buf_index;
   159		size_t				msgs_index;
   160		size_t				msgs_count;
   161		bool				send_stop;
   162		int				cmd_err;
   163		/* Protected only by i2c_lock_bus */
   164		int				master_xfer_result;
   165		/* Multi-master */
   166		bool				multi_master;
   167	#if IS_ENABLED(CONFIG_I2C_SLAVE)
   168		struct i2c_client		*slave;
   169		enum aspeed_i2c_slave_state	slave_state;
   170	#endif /* CONFIG_I2C_SLAVE */
   171	};
   172	
   173	static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
   174	
   175	static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
   176	{
   177		unsigned long time_left, flags;
   178		int ret = 0;
   179		u32 command;
   180	
   181		spin_lock_irqsave(&bus->lock, flags);
   182		command = readl(bus->base + ASPEED_I2C_CMD_REG);
   183	
   184		if (command & ASPEED_I2CD_SDA_LINE_STS) {
   185			/* Bus is idle: no recovery needed. */
   186			if (command & ASPEED_I2CD_SCL_LINE_STS)
   187				goto out;
   188			dev_dbg(bus->dev, "SCL hung (state %x), attempting recovery\n",
   189				command);
   190	
   191			reinit_completion(&bus->cmd_complete);
 > 192			aspeed_i2c_do_stop(bus);
   193			spin_unlock_irqrestore(&bus->lock, flags);
   194	
   195			time_left = wait_for_completion_timeout(
   196					&bus->cmd_complete, bus->adap.timeout);
   197	
   198			spin_lock_irqsave(&bus->lock, flags);
   199			if (time_left == 0)
   200				goto reset_out;
   201			else if (bus->cmd_err)
   202				goto reset_out;
   203			/* Recovery failed. */
   204			else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
   205				   ASPEED_I2CD_SCL_LINE_STS))
   206				goto reset_out;
   207		/* Bus error. */
   208		} else {
   209			dev_dbg(bus->dev, "SDA hung (state %x), attempting recovery\n",
   210				command);
   211	
   212			reinit_completion(&bus->cmd_complete);
   213			/* Writes 1 to 8 SCL clock cycles until SDA is released. */
   214			writel(ASPEED_I2CD_BUS_RECOVER_CMD,
   215			       bus->base + ASPEED_I2C_CMD_REG);
   216			spin_unlock_irqrestore(&bus->lock, flags);
   217	
   218			time_left = wait_for_completion_timeout(
   219					&bus->cmd_complete, bus->adap.timeout);
   220	
   221			spin_lock_irqsave(&bus->lock, flags);
   222			if (time_left == 0)
   223				goto reset_out;
   224			else if (bus->cmd_err)
   225				goto reset_out;
   226			/* Recovery failed. */
   227			else if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
   228				   ASPEED_I2CD_SDA_LINE_STS))
   229				goto reset_out;
   230		}
   231	
   232	out:
   233		spin_unlock_irqrestore(&bus->lock, flags);
   234	
   235		return ret;
   236	
   237	reset_out:
   238		spin_unlock_irqrestore(&bus->lock, flags);
   239	
   240		return aspeed_i2c_reset(bus);
   241	}
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
