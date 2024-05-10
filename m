Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E957C8C234E
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2024 13:27:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=guME20oc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbRSM3syyz3cYs
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2024 21:27:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=guME20oc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbRQy5Sntz3cXn
	for <openbmc@lists.ozlabs.org>; Fri, 10 May 2024 21:26:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715340379; x=1746876379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X8Q8fkJcctofAMJGn3mjJGBdHGpHACK6lBQIiokJ8Hc=;
  b=guME20oc4nhNpbPR1BPPZteeEjfUm2eERvFsxm2A+dZ0XK3npcWR43iL
   sQdMYhvU+nYJ14uCGGg249c1cOPAuzWPxvyXUOjfhPO6n/RfDyEtiBpaz
   n1e0ylwOb2bZXtwh0IRpX2cBiYIuPN/JBDwzzUS/Ocr9bP0mxnWiS0qui
   8lBAV/15wWGYt7alXM1ZclYXg+0/LTRk19mCl8EJCwc2IyBAQPNH2CbBx
   GE8x4OfQu0f5N9+gbR08E4WnQRQa6zh4WmTp/HVXtg7C1nVP90tZ7msov
   KY9Se+nf9ucsAidxmJ49a+zaU6MDFXOzyHMUoiCk1TyPv8vzmatkJZ8N0
   Q==;
X-CSE-ConnectionGUID: +qya1mD5Qlu8MkU8NrQSCQ==
X-CSE-MsgGUID: Qg9dq+DXTZm5ivhFlwxvkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11442918"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11442918"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 04:26:08 -0700
X-CSE-ConnectionGUID: 7lw1taQOQbGuQrWQRq9ZYg==
X-CSE-MsgGUID: CLH43sCVSzqVL1gLyg/3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="34235748"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 May 2024 04:26:04 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5OO1-00063V-0t;
	Fri, 10 May 2024 11:26:01 +0000
Date: Fri, 10 May 2024 19:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com
Subject: Re: [PATCH v24 2/4] reset: npcm: register npcm8xx clock auxiliary
 bus device
Message-ID: <202405101846.avdHTXi3-lkp@intel.com>
References: <20240509192411.2432066-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509192411.2432066-3-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on pza/reset/next linus/master v6.9-rc7 next-20240510]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-reset-npcm-add-clock-properties/20240510-072622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240509192411.2432066-3-tmaimon77%40gmail.com
patch subject: [PATCH v24 2/4] reset: npcm: register npcm8xx clock auxiliary bus device
config: i386-buildonly-randconfig-002-20240510 (https://download.01.org/0day-ci/archive/20240510/202405101846.avdHTXi3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101846.avdHTXi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101846.avdHTXi3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/reset/reset-npcm.c: In function 'npcm_clock_adev_release':
   drivers/reset/reset-npcm.c:391:2: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
     kfree(rdev);
     ^~~~~
     vfree
   drivers/reset/reset-npcm.c: In function 'npcm_clock_adev_alloc':
   drivers/reset/reset-npcm.c:400:9: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
     rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
            ^~~~~~~
            vzalloc
>> drivers/reset/reset-npcm.c:400:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
          ^
   cc1: some warnings being treated as errors


vim +400 drivers/reset/reset-npcm.c

   385	
   386	static void npcm_clock_adev_release(struct device *dev)
   387	{
   388		struct auxiliary_device *adev = to_auxiliary_dev(dev);
   389		struct npcm_clock_adev *rdev = to_npcm_clock_adev(adev);
   390	
 > 391		kfree(rdev);
   392	}
   393	
   394	static struct auxiliary_device *npcm_clock_adev_alloc(struct npcm_rc_data *rst_data, char *clk_name)
   395	{
   396		struct npcm_clock_adev *rdev;
   397		struct auxiliary_device *adev;
   398		int ret;
   399	
 > 400		rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
   401		if (!rdev)
   402			return ERR_PTR(-ENOMEM);
   403	
   404		rdev->base = rst_data->base;
   405	
   406		adev = &rdev->adev;
   407		adev->name = clk_name;
   408		adev->dev.parent = rst_data->dev;
   409		adev->dev.release = npcm_clock_adev_release;
   410		adev->id = 555u;
   411	
   412		ret = auxiliary_device_init(adev);
   413		if (ret) {
   414			kfree(adev);
   415			return ERR_PTR(ret);
   416		}
   417	
   418		return adev;
   419	}
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
