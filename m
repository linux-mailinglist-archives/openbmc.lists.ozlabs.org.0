Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB605BFA38
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 11:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXXcn61dPz3bgh
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 19:07:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ob/lyM1g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ob/lyM1g;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXXcH4cccz2ywm;
	Wed, 21 Sep 2022 19:07:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663751248; x=1695287248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdELA0CMy41Pc/8gwIulPOG1jrdcSRSWpH4OOmPRZm0=;
  b=Ob/lyM1gnl93nwdEyKZxbG3SpqgqZOLbLyyT0+h21wP7lPTZk5QV1T/u
   /pqAvPjHJ7t5OWCrGkSckAdGeKgXRLsT7BVjE7zgze9jhOC7Ryxko05/1
   BhqnVwpefcyjFjjhYYyRNthQOCtMEJwLtCorOE2mJc1odgbNW2ZzSbXqU
   IYUwFtZrdE8DFd3G2v7AIgafGQY2tOyI+3dpcbhCs3ff1CjHW853ENTWv
   dgTEL8FrTHc7clLvoVGK4qzIW98FUZYTwtMqTs2W1ok04qSmTJ3Gz8Ps0
   zg6QfquRBpZ5T0GbFEnq2xjC+Kh5l/ivmoaS7Ap/0E5qzqydpSb/UnQPB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282993864"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="282993864"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 02:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="619269056"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Sep 2022 02:07:13 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oavhI-0003RV-2g;
	Wed, 21 Sep 2022 09:07:12 +0000
Date: Wed, 21 Sep 2022 17:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
	mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
	stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com, ribalda@chromium.org
Subject: Re: [PATCH v9 3/4] media: aspeed: Support aspeed mode to reduce
 compressed data
Message-ID: <202209211617.SJ0Uagdf-lkp@intel.com>
References: <20220921025112.13150-4-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921025112.13150-4-jammy_huang@aspeedtech.com>
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
Cc: kbuild-all@lists.01.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on next-20220920]
[cannot apply to linus/master v6.0-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jammy-Huang/add-aspeed-jpeg-support-for-aspeed-video/20220921-105350
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20220921/202209211617.SJ0Uagdf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/99c2bf6f1dccc310cb9b2d9916292766f00ffb4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jammy-Huang/add-aspeed-jpeg-support-for-aspeed-video/20220921-105350
        git checkout 99c2bf6f1dccc310cb9b2d9916292766f00ffb4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/aspeed-video.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[2]: *** [scripts/Makefile.headersinst:63: usr/include/linux/aspeed-video.h] Error 1
   make[2]: Target '__headers' not remade because of errors.
   make[1]: *** [Makefile:1293: headers] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
