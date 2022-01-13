Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A042948D339
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 08:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZGvw3Wm7z2yZW
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 18:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mrX1ngAf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mrX1ngAf; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZGvS1vhrz2x9X;
 Thu, 13 Jan 2022 18:55:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642060548; x=1673596548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tBSjCUr5LQ/WmW8KrgBUGf3PU+8WqY/65bcLq1A2bvk=;
 b=mrX1ngAfxtRr6BaLYFJwl6PHEfy07CzmYNJPWZwci688GR6hJYH76ZSZ
 wrKiamDo3/o5dAqRb0HEllGcr8JrFjW93nXNbuNW9W6adr2ZHJnfw1Nxa
 BNYXCuEp10bVc66yPnpZNEyP8G9FVGkeOfkt6lHhi56L3ne1/yRYMi2DF
 BL2qor/JV6DhycY7u0F+t0hxR/4t5fkPnCwQvBarE8loitivdDajpSDtp
 +AKdifH3sDOR3K3QbV38G8kk5fLd5BNyN6tzA/vf9nVfMfYy+uJ/Je1JL
 D+LMS74YwGlfzrTt8J2wDv5TY02SVFcXRA3dyNFs222L3a3X5rovbYYS2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="224644307"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="224644307"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 23:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="623769451"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 12 Jan 2022 23:54:36 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7uwN-0006yg-Jf; Thu, 13 Jan 2022 07:54:35 +0000
Date: Thu, 13 Jan 2022 15:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 08/13] peci: Add support for PECI device drivers
Message-ID: <202201131534.HcDrC30f-lkp@intel.com>
References: <20220112230247.982212-9-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112230247.982212-9-iwona.winiarska@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 kbuild-all@lists.01.org, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, llvm@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Iwona,

I love your patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linux/master linus/master v5.16 next-20220112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Iwona-Winiarska/Introduce-PECI-subsystem/20220113-071131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: hexagon-randconfig-r033-20220113 (https://download.01.org/0day-ci/archive/20220113/202201131534.HcDrC30f-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0c9888d465568adc8526df1407c9a75be5ce6cd4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Iwona-Winiarska/Introduce-PECI-subsystem/20220113-071131
        git checkout 0c9888d465568adc8526df1407c9a75be5ce6cd4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/peci/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/peci/request.c:111:23: warning: address of array 'req->rx.buf' will always evaluate to 'true' [-Wpointer-bool-conversion]
           if (WARN_ON(!req->rx.buf))
                       ~~~~~~~~~^~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   1 warning generated.


vim +111 drivers/peci/request.c

   101	
   102	static int peci_request_xfer_retry(struct peci_request *req)
   103	{
   104		long wait_interval = PECI_RETRY_INTERVAL_MIN;
   105		struct peci_device *device = req->device;
   106		struct peci_controller *controller = to_peci_controller(device->dev.parent);
   107		unsigned long start = jiffies;
   108		int ret;
   109	
   110		/* Don't try to use it for ping */
 > 111		if (WARN_ON(!req->rx.buf))
   112			return 0;
   113	
   114		do {
   115			ret = peci_request_xfer(req);
   116			if (ret) {
   117				dev_dbg(&controller->dev, "xfer error: %d\n", ret);
   118				return ret;
   119			}
   120	
   121			if (peci_request_status(req) != -EAGAIN)
   122				return 0;
   123	
   124			/* Set the retry bit to indicate a retry attempt */
   125			req->tx.buf[1] |= PECI_RETRY_BIT;
   126	
   127			if (schedule_timeout_interruptible(wait_interval))
   128				return -ERESTARTSYS;
   129	
   130			wait_interval = min_t(long, wait_interval * 2, PECI_RETRY_INTERVAL_MAX);
   131		} while (time_before(jiffies, start + PECI_RETRY_TIMEOUT));
   132	
   133		dev_dbg(&controller->dev, "request timed out\n");
   134	
   135		return -ETIMEDOUT;
   136	}
   137	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
