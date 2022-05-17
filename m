Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0852966B
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 03:01:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2HrR0wNVz3bsG
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:01:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V37aNeBV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V37aNeBV; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Hr15YrZz30Lk
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 11:01:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652749282; x=1684285282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xOn9kBavuf8KbUOiYe4vSCSwPuD4BpeBR/1EpevB86k=;
 b=V37aNeBVyx5j9uCFOppDMfL6KpL/H5ZQc9bHqZpaIU/xAU5v8Em3MubT
 HEbbdFF2iKTVwLs6j10D7WGnb8eDFDPipvXTX3hX0LPdb0B0Dr/vhHq3D
 Fr2K9YslMQKQcmIwdUeSD08J/I8VjlzOy71HDKkFNQfGcibUOptPXZ6sn
 cdaWC5HXiKOiUCZyqfMFRRBgwfiQwV3cl48jTyNKdBe+O3v+jm2Fhgu0e
 IyOcf4MXM9ld0BJ7VeLLMkoWRWN7hDGhF05luYrX9pCJip0E0bpnvQS97
 1aHweVL27h5KR7NylILCI7tfKfJ/FCi4nsXZUJhm5i58uu2K+G7ZI3tsE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="253063160"
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="253063160"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 18:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,231,1647327600"; d="scan'208";a="660366636"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 16 May 2022 18:00:58 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nqla5-0000SX-VS;
 Tue, 17 May 2022 01:00:57 +0000
Date: Tue, 17 May 2022 09:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Medad CChien <medadyoung@gmail.com>, benjaminfair@google.com,
 yuenn@google.com, venture@google.com, tali.perry1@gmail.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, robh+dt@kernel.org,
 alexandre.belloni@bootlin.com, a.zummo@towertech.it,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, ctcchien@nuvoton.com
Subject: Re: [PATCH v1 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
Message-ID: <202205170805.G7wKugZK-lkp@intel.com>
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
[also build test WARNING on robh/for-next v5.18-rc7 next-20220516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Medad-CChien/ARM-dts-nuvoton-Add-nuvoton-RTC3018Y-node/20220516-232940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220517/202205170805.G7wKugZK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5c51862ee8030cfd9f2e955c10ee580f168663e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Medad-CChien/ARM-dts-nuvoton-Add-nuvoton-RTC3018Y-node/20220516-232940
        git checkout 5c51862ee8030cfd9f2e955c10ee580f168663e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-nct3018y.c: In function 'nct3018y_rtc_read_time':
   drivers/rtc/rtc-nct3018y.c:192:26: warning: unused variable 'nct3018y' [-Wunused-variable]
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
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/clk-provider.h:9,
                    from drivers/rtc/rtc-nct3018y.c:5:
   drivers/rtc/rtc-nct3018y.c: In function 'nct3018y_probe':
>> drivers/rtc/rtc-nct3018y.c:513:39: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat=]
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


vim +513 drivers/rtc/rtc-nct3018y.c

   486	
   487	static int nct3018y_probe(struct i2c_client *client,
   488				  const struct i2c_device_id *id)
   489	{
   490		struct nct3018y *nct3018y;
   491		int err;
   492		unsigned char buf;
   493	
   494		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
   495			dev_err(&client->dev, "%s: ENODEV\n", __func__);
   496			return -ENODEV;
   497		}
   498	
   499		nct3018y = devm_kzalloc(&client->dev, sizeof(struct nct3018y),
   500					GFP_KERNEL);
   501		if (!nct3018y)
   502			return -ENOMEM;
   503	
   504		i2c_set_clientdata(client, nct3018y);
   505		nct3018y->client = client;
   506		device_set_wakeup_capable(&client->dev, 1);
   507	
   508		err = nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1, &buf);
   509		if (err < 0) {
   510			dev_err(&client->dev, "%s: read error\n", __func__);
   511			return err;
   512		} else if (buf & NCT3018Y_BIT_TWO) {
 > 513			dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is :%d\n",
   514				__func__, buf & NCT3018Y_BIT_TWO);
   515		}
   516	
   517		buf = 0 | NCT3018Y_BIT_TWO;
   518		err = nct3018y_write_block_data(client, NCT3018Y_REG_CTRL, 1, &buf);
   519		if (err < 0) {
   520			dev_err(&client->dev, "%s: write fail, so ReadOnly\n", __func__);
   521		} else {
   522			buf = 0;
   523			err = nct3018y_write_block_data(client, NCT3018Y_REG_ST, 1, &buf);
   524			if (err < 0) {
   525				dev_err(&client->dev, "%s: write error\n", __func__);
   526				return err;
   527			}
   528		}
   529	
   530		nct3018y->rtc = devm_rtc_allocate_device(&client->dev);
   531		if (IS_ERR(nct3018y->rtc))
   532			return PTR_ERR(nct3018y->rtc);
   533	
   534		nct3018y->rtc->ops = &nct3018y_rtc_ops;
   535		nct3018y->rtc->uie_unsupported = 1;
   536		nct3018y->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
   537		nct3018y->rtc->range_max = RTC_TIMESTAMP_END_2099;
   538		nct3018y->rtc->set_start_time = true;
   539	
   540		nct3018y->wakeup_host = devm_gpiod_get(&client->dev, "host-wakeup", GPIOD_IN);
   541		if (IS_ERR(nct3018y->wakeup_host)) {
   542			err = PTR_ERR(nct3018y->wakeup_host);
   543			dev_err(&client->dev, "could not get host wakeup gpio: %d", err);
   544			return err;
   545		}
   546		client->irq = gpiod_to_irq(nct3018y->wakeup_host);
   547	
   548		dev_dbg(&client->dev, "%s: client->irq:%d\n", __func__, client->irq);
   549	
   550		if (client->irq > 0) {
   551			err = devm_request_threaded_irq(&client->dev, client->irq,
   552					NULL, nct3018y_irq,
   553					IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
   554					nct3018y_driver.driver.name, client);
   555			if (err) {
   556				dev_err(&client->dev, "unable to request IRQ %d\n", client->irq);
   557				return err;
   558			}
   559		}
   560	
   561		err = rtc_register_device(nct3018y->rtc);
   562		if (err)
   563			return err;
   564	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
