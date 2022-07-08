Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F5A56C195
	for <lists+openbmc@lfdr.de>; Sat,  9 Jul 2022 00:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lfp275zC2z3c2n
	for <lists+openbmc@lfdr.de>; Sat,  9 Jul 2022 08:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E6s+5db3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E6s+5db3;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lfp1k4KMCz3blw
	for <openbmc@lists.ozlabs.org>; Sat,  9 Jul 2022 08:32:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657319547; x=1688855547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pYUR5n3zSWGMe79Vz7YJD1vt8XQmHwETPJxWhHm8Fzs=;
  b=E6s+5db3kRy9yuiJhYgTqCRO+qQz9TXTAk6rVKa019/hr93SKy2fw5Vr
   PsqQSyNjchD799wMdCBmWZcWMEeuPuq2usGFf6vDO0pwMkh96eSl2b6VT
   Yz1T3+OHC7tTBENG3iNQN1EeVQ7kX/8IcWs2xjLpcs9rw2ls6DUkoYlBQ
   zYYU6PnhWP6i4n5EFzLEnQPrQhj60s6Ovkhb1a6f75wQONlCtytwEowbd
   7ovGVhC47BVRWFm91MB8Kdw3diUsdhxGs3MinDW88aZqv4e2zgBGoOpJK
   3Uk/N+SFyptzs3W/xXumgMDkPsfRa0i7J2Ij9nG6jP6x1f6dNPITK5IAP
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="283131874"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="283131874"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 15:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="770919860"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Jul 2022 15:32:11 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9wWA-000O0k-Oy;
	Fri, 08 Jul 2022 22:32:10 +0000
Date: Sat, 9 Jul 2022 06:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mia Lin <mimi05633@gmail.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, a.zummo@towertech.it,
	alexandre.belloni@bootlin.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, ctcchien@nuvoton.com,
	KWLIU@nuvoton.com, YSCHU@nuvoton.com, KFTING@nuvoton.com,
	JJLIU0@nuvoton.com, mylin1@nuvoton.com
Subject: Re: [PATCH v4 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
Message-ID: <202207090650.qVcM1Juo-lkp@intel.com>
References: <20220707073054.3954-4-mimi05633@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707073054.3954-4-mimi05633@gmail.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mia,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next linus/master v5.19-rc5 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mia-Lin/RTC-nuvoton-Add-nuvoton-real-time-clock-driver/20220707-153317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220709/202207090650.qVcM1Juo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/028783fef7713ddc9f2d14a39f09741370f42e3c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mia-Lin/RTC-nuvoton-Add-nuvoton-real-time-clock-driver/20220707-153317
        git checkout 028783fef7713ddc9f2d14a39f09741370f42e3c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-nct3018y.c:553:23: error: unterminated argument list invoking macro "MODULE_AUTHOR"
     553 | MODULE_LICENSE("GPL");
         |                       ^
>> drivers/rtc/rtc-nct3018y.c:551:1: error: expected '=', ',', ';', 'asm' or '__attribute__' at end of input
     551 | MODULE_AUTHOR(("Mia Lin <mimi05633@gmail.com>");
         | ^~~~~~~~~~~~~


vim +/MODULE_AUTHOR +553 drivers/rtc/rtc-nct3018y.c

   549	
   550	MODULE_AUTHOR("Medad CChien <ctcchien@nuvoton.com>");
 > 551	MODULE_AUTHOR(("Mia Lin <mimi05633@gmail.com>");
   552	MODULE_DESCRIPTION("Nuvoton NCT3018Y RTC driver");
 > 553	MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
