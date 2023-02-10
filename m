Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD7691C1C
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 11:01:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCq4v2P56z3f5k
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 21:01:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iFfzWPjR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iFfzWPjR;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCq4G6Fd5z3cdk;
	Fri, 10 Feb 2023 21:00:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676023247; x=1707559247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=skyO+n4E72IHbnF1r9khsegze0IsfBWcm+0BlzjaYsw=;
  b=iFfzWPjRVoWdCDM92z9p+cqoYRj4h5H7iXNTpCgBnyarAFdQIM3aFkPF
   lddjXBMAlgePvH2SqTmMAFmhWnorGZXPjammNUmxjTBwvJoK6EpqGnKHZ
   jqCqvS6nn6hzUvY5wnkU1Q1JeTQegILaJJGm3V6pavFrwLv1K/BjtRu1a
   aCvP3bnSG3YS6TH9tKvYIRB92tWI9SDueuK5RWROxjdvIrSno0oW7JsYD
   6CAzqiOS+B0szaXFgXYCF32/jxdcJ/HV7eCNHlPCU/OdxI4kjwZFRr/E0
   iR74C0cscuNmtFgB6tzv31DW95GvPABe4aadx1PKrDlAjLksROHfFOh8L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="314028001"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="314028001"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 02:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="661355216"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="661355216"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Feb 2023 02:00:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQQCm-0005jh-0Q;
	Fri, 10 Feb 2023 10:00:32 +0000
Date: Fri, 10 Feb 2023 18:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>, gregkh@linuxfoundation.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au, andrew@aj.id.au, jirislaby@kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/4] soc: aspeed: Add UART DMA support
Message-ID: <202302101749.ctd9pkv1-lkp@intel.com>
References: <20230210072643.2772-3-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210072643.2772-3-chiawei_wang@aspeedtech.com>
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

Hi Chia-Wei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus robh/for-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.2-rc7 next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-Wei-Wang/dt-bindings-aspeed-Add-UART-controller/20230210-152832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230210072643.2772-3-chiawei_wang%40aspeedtech.com
patch subject: [PATCH 2/4] soc: aspeed: Add UART DMA support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230210/202302101749.ctd9pkv1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b1e3a89584657d9b0398f3f46b09dc4229835fa3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chia-Wei-Wang/dt-bindings-aspeed-Add-UART-controller/20230210-152832
        git checkout b1e3a89584657d9b0398f3f46b09dc4229835fa3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/soc/aspeed/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101749.ctd9pkv1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/aspeed/aspeed-udma.c: In function 'aspeed_udma_request_chan':
>> drivers/soc/aspeed/aspeed-udma.c:194:13: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
     194 |         int retval = 0;
         |             ^~~~~~


vim +/retval +194 drivers/soc/aspeed/aspeed-udma.c

   189	
   190	static int aspeed_udma_request_chan(u32 ch_no, dma_addr_t addr,
   191			struct circ_buf *rb, u32 rb_sz,
   192			aspeed_udma_cb_t cb, void *id, bool dis_tmout, bool is_tx)
   193	{
 > 194		int retval = 0;
   195		int rbsz_code;
   196	
   197		u32 reg;
   198		unsigned long flags;
   199		struct aspeed_udma_chan *ch;
   200	
   201		if (ch_no > UDMA_MAX_CHANNEL) {
   202			retval = -EINVAL;
   203			goto out;
   204		}
   205	
   206		if (IS_ERR_OR_NULL(rb) || IS_ERR_OR_NULL(rb->buf)) {
   207			retval = -EINVAL;
   208			goto out;
   209		}
   210	
   211		rbsz_code = aspeed_udma_get_bufsz_code(rb_sz);
   212		if (rbsz_code < 0) {
   213			retval = -EINVAL;
   214			goto out;
   215		}
   216	
   217		spin_lock_irqsave(&udma->lock, flags);
   218	
   219		if (is_tx) {
   220			reg = readl(udma->regs + UDMA_TX_DMA_INT_EN);
   221			if (reg & (0x1 << ch_no)) {
   222				retval = -EBUSY;
   223				goto unlock_n_out;
   224			}
   225	
   226			reg |= (0x1 << ch_no);
   227			writel(reg, udma->regs + UDMA_TX_DMA_INT_EN);
   228	
   229			reg = readl(udma->regs + UDMA_CHX_TX_CTRL(ch_no));
   230			reg |= (dis_tmout) ? UDMA_TX_CTRL_TMOUT_DISABLE : 0;
   231			reg |= (rbsz_code << UDMA_TX_CTRL_BUFSZ_SHIFT) & UDMA_TX_CTRL_BUFSZ_MASK;
   232			writel(reg, udma->regs + UDMA_CHX_TX_CTRL(ch_no));
   233	
   234			writel(addr, udma->regs + UDMA_CHX_TX_BUF_BASE(ch_no));
   235		} else {
   236			reg = readl(udma->regs + UDMA_RX_DMA_INT_EN);
   237			if (reg & (0x1 << ch_no)) {
   238				retval = -EBUSY;
   239				goto unlock_n_out;
   240			}
   241	
   242			reg |= (0x1 << ch_no);
   243			writel(reg, udma->regs + UDMA_RX_DMA_INT_EN);
   244	
   245			reg = readl(udma->regs + UDMA_CHX_RX_CTRL(ch_no));
   246			reg |= (dis_tmout) ? UDMA_RX_CTRL_TMOUT_DISABLE : 0;
   247			reg |= (rbsz_code << UDMA_RX_CTRL_BUFSZ_SHIFT) & UDMA_RX_CTRL_BUFSZ_MASK;
   248			writel(reg, udma->regs + UDMA_CHX_RX_CTRL(ch_no));
   249	
   250			writel(addr, udma->regs + UDMA_CHX_RX_BUF_BASE(ch_no));
   251		}
   252	
   253		ch = (is_tx) ? &udma->tx_chs[ch_no] : &udma->rx_chs[ch_no];
   254		ch->rb = rb;
   255		ch->rb_sz = rb_sz;
   256		ch->cb = cb;
   257		ch->cb_arg = id;
   258		ch->dma_addr = addr;
   259		ch->dis_tmout = dis_tmout;
   260	
   261	unlock_n_out:
   262		spin_unlock_irqrestore(&udma->lock, flags);
   263	out:
   264		return 0;
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
