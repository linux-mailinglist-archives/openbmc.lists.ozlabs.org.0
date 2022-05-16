Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A165294B9
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:10:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FNB5bWXz3byb
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 09:10:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IIwz+Bon;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IIwz+Bon; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2FMl3QYDz2yHp
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 09:10:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652742611; x=1684278611;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=t9s//g5eW49okIknpm3TXfprezkECY9aRbZEJNV1PS0=;
 b=IIwz+BonUc5lDXHI6Y7oNAVg6Raph/UCtgNvzrkRGPnQHQbZbpfL4aUy
 Fk3JDqCqi2/nLDgMoDQByAsGAdQa2rBcnNSju+rkx2FQmffATRxhR/VkY
 /kEiHugvTNHRlQquyT4iTNYcNNXcsdysaVKYKjfpOVPbedmY/tk2NtXjZ
 2XCkkIjn23JRbWOzbHrb5KFPvlcNCsri1SR1XKwkPSSsijljnY5OB+pn2
 7yeoFwQSW8w75DtpwiMGMH9rh9/3mKFjwYlw1cJsfsEHGT3mPUL8SJYuY
 4FRJ6+xMcoUDJPLMVtKBxKeDUyhy5JtvgTI1rMb9czeUhTlA1k2WRYHxk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271117492"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="271117492"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 16:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="816621816"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 16 May 2022 16:08:53 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nqjpc-0000PB-Ni;
 Mon, 16 May 2022 23:08:52 +0000
Date: Tue, 17 May 2022 07:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Medad CChien <medadyoung@gmail.com>, benjaminfair@google.com,
 yuenn@google.com, venture@google.com, tali.perry1@gmail.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, robh+dt@kernel.org,
 alexandre.belloni@bootlin.com, a.zummo@towertech.it,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, ctcchien@nuvoton.com
Subject: Re: [PATCH v1 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
Message-ID: <202205170654.jQqRSbra-lkp@intel.com>
References: <20220516152751.27716-3-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516152751.27716-3-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Medad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on robh/for-next v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Medad-CChien/ARM-dts-nuvoton-Add-nuvoton-RTC3018Y-node/20220516-232940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220517/202205170654.jQqRSbra-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5c51862ee8030cfd9f2e955c10ee580f168663e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Medad-CChien/ARM-dts-nuvoton-Add-nuvoton-RTC3018Y-node/20220516-232940
        git checkout 5c51862ee8030cfd9f2e955c10ee580f168663e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-nct3018y.c: In function 'nct3018y_rtc_read_time':
>> drivers/rtc/rtc-nct3018y.c:192:26: warning: unused variable 'nct3018y' [-Wunused-variable]
     192 |         struct nct3018y *nct3018y = i2c_get_clientdata(client);
         |                          ^~~~~~~~
   drivers/rtc/rtc-nct3018y.c: In function 'nct3018y_rtc_set_time':
   drivers/rtc/rtc-nct3018y.c:227:26: warning: unused variable 'nct3018y' [-Wunused-variable]
     227 |         struct nct3018y *nct3018y = i2c_get_clientdata(client);
         |                          ^~~~~~~~
   drivers/rtc/rtc-nct3018y.c: In function 'nct3018y_rtc_set_alarm':
   drivers/rtc/rtc-nct3018y.c:292:26: warning: unused variable 'nct3018y' [-Wunused-variable]
     292 |         struct nct3018y *nct3018y = i2c_get_clientdata(client);
         |                          ^~~~~~~~
   drivers/rtc/rtc-nct3018y.c: In function 'nct3018y_irq_enable':
   drivers/rtc/rtc-nct3018y.c:322:26: warning: unused variable 'nct3018y' [-Wunused-variable]
     322 |         struct nct3018y *nct3018y = i2c_get_clientdata(client);
         |                          ^~~~~~~~
   In file included from include/linux/printk.h:555,
                    from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/clk-provider.h:9,
                    from drivers/rtc/rtc-nct3018y.c:5:
   drivers/rtc/rtc-nct3018y.c: In function 'nct3018y_probe':
   drivers/rtc/rtc-nct3018y.c:513:39: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat=]
     513 |                 dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is :%d\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/rtc/rtc-nct3018y.c:513:17: note: in expansion of macro 'dev_dbg'
     513 |                 dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is :%d\n",
         |                 ^~~~~~~
   drivers/rtc/rtc-nct3018y.c:513:66: note: format string is defined here
     513 |                 dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is :%d\n",
         |                                                                 ~^
         |                                                                  |
         |                                                                  int
         |                                                                 %ld
   drivers/rtc/rtc-nct3018y.c:535:22: error: 'struct rtc_device' has no member named 'uie_unsupported'
     535 |         nct3018y->rtc->uie_unsupported = 1;
         |                      ^~
   drivers/rtc/rtc-nct3018y.c:561:15: error: implicit declaration of function 'rtc_register_device'; did you mean 'i2c_unregister_device'? [-Werror=implicit-function-declaration]
     561 |         err = rtc_register_device(nct3018y->rtc);
         |               ^~~~~~~~~~~~~~~~~~~
         |               i2c_unregister_device
   cc1: some warnings being treated as errors


vim +/nct3018y +192 drivers/rtc/rtc-nct3018y.c

   184	
   185	/*
   186	 * In the routines that deal directly with the nct3018y hardware, we use
   187	 * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
   188	 */
   189	static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
   190	{
   191		struct i2c_client *client = to_i2c_client(dev);
 > 192		struct nct3018y *nct3018y = i2c_get_clientdata(client);
   193		unsigned char buf[10];
   194		int err;
   195	
   196		err = nct3018y_read_block_data(client, NCT3018Y_REG_ST, 1, buf);
   197		if (err)
   198			return err;
   199	
   200		if (!buf[0]) {
   201			dev_err(&client->dev, " voltage <=1.7, date/time is not reliable.\n");
   202			return -EINVAL;
   203		}
   204	
   205		err = nct3018y_read_block_data(client, NCT3018Y_REG_SC, 10, buf);
   206		if (err)
   207			return err;
   208	
   209		tm->tm_sec = bcd2bin(buf[0] & 0x7F);
   210		tm->tm_min = bcd2bin(buf[2] & 0x7F);
   211		tm->tm_hour = bcd2bin(buf[4] & 0x3F); /* rtc hr 0-24 */
   212		tm->tm_wday = buf[6] & 0x07;
   213		tm->tm_mday = bcd2bin(buf[7] & 0x3F);
   214		tm->tm_mon = bcd2bin(buf[8] & 0x1F) - 1 ; /* rtc mn 1-12 */
   215		tm->tm_year = bcd2bin(buf[9]) + 100;
   216	
   217		dev_dbg(&client->dev, "%s:s=%d, m=%d, hr=%d, md=%d, m=%d, yr=%d, wd=%d\n",
   218			__func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm_mday, tm->tm_mon,
   219			tm->tm_year, tm->tm_wday);
   220	
   221		return 0;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
