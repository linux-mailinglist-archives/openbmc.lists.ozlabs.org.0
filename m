Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961988106F2
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 01:49:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=enJ73SOk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqcLM0QcHz3c4C
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 11:48:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=enJ73SOk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqcKn2P1Xz2xm6
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 11:48:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702428510; x=1733964510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QZwgJx1UZkImcvYR1/1lBCiVrQ6yZ06VKsgvip+6rxU=;
  b=enJ73SOkGQxb2pCqgzNOGMsMIUAsOwo2bbRfr50cWHBqru95hgD3KdrB
   mNuqyUfvk+of6XBwdEcm51KgDp2fXOAEwMXdwTvAoQruVMRV9Ej3aihSp
   eJTRbm/AJeKx9MqjJmkJHJYhNT33fAvGeLgfsEwlHpGYCskKHRwhUEQFf
   7svyk1s8eTpM09QnoCeRol2zGUEl7fFzEINXlG5JW7WtSfLLZgzEEphgo
   uXJo/YMfjsNshGvFKLLDIQBakAAfHLTvyikjPiHiqakAWFx0o5yQbBbqh
   DZJ/zJJlsVmDtu6esR8raDlFVooxYh6kAJ2XeTAF4qQI8nzL71H27yG/J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1974335"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1974335"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 16:48:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="946987130"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="946987130"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2023 16:48:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDDQ6-000JvK-0Q;
	Wed, 13 Dec 2023 00:48:14 +0000
Date: Wed, 13 Dec 2023 08:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, arnd@arndb.de,
	pmenzel@molgen.mpg.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	j.neuschaefer@gmx.net
Subject: Re: [PATCH v2 3/3] soc: nuvoton: add NPCM BPC driver
Message-ID: <202312130836.kt5QMxGM-lkp@intel.com>
References: <20231212100703.3374555-4-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212100703.3374555-4-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on robh/for-next linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-soc-nuvoton-Add-NPCM-BPC/20231212-181115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20231212100703.3374555-4-tmaimon77%40gmail.com
patch subject: [PATCH v2 3/3] soc: nuvoton: add NPCM BPC driver
config: arm64-randconfig-r112-20231213 (https://download.01.org/0day-ci/archive/20231213/202312130836.kt5QMxGM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130836.kt5QMxGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130836.kt5QMxGM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/nuvoton/npcm-bpc.c:105:22: sparse: sparse: invalid assignment: |=
>> drivers/soc/nuvoton/npcm-bpc.c:105:22: sparse:    left side has type restricted __poll_t
>> drivers/soc/nuvoton/npcm-bpc.c:105:22: sparse:    right side has type int
   drivers/soc/nuvoton/npcm-bpc.c:108:22: sparse: sparse: invalid assignment: |=
   drivers/soc/nuvoton/npcm-bpc.c:108:22: sparse:    left side has type restricted __poll_t
   drivers/soc/nuvoton/npcm-bpc.c:108:22: sparse:    right side has type int

vim +105 drivers/soc/nuvoton/npcm-bpc.c

    97	
    98	static __poll_t npcm_bpc_poll(struct file *file, struct poll_table_struct *pt)
    99	{
   100		struct npcm_bpc_channel *chan = npcm_file_to_ch(file);
   101		__poll_t mask = 0;
   102	
   103		poll_wait(file, &chan->wq, pt);
   104		if (!kfifo_is_empty(&chan->fifo))
 > 105			mask |= POLLIN;
   106	
   107		if (chan->host_reset) {
   108			mask |= POLLHUP;
   109			chan->host_reset = false;
   110		}
   111	
   112		return mask;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
