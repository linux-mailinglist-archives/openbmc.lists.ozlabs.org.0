Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A360525DDD
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 11:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L02w50Gjmz3c7f
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LvCxg4kp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LvCxg4kp; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L02vg2ZFTz3bpB
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 19:11:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652433103; x=1683969103;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nuXU/g3coGmPHjkK9kbksU4msj3bxR1yewtKO4WIDNs=;
 b=LvCxg4kpg5j+w8zcPmr68+o0JEG0y+Xx87pd3Ycn8Mck4ThBvacI+Vco
 97jOqPcLziquKomiJW3+LieURrXqrNXO/p1T2sfuuwAAkWlFUlLyfE1VR
 M7qaX05s2j307C2Qk0kwlydvSZTzZqv3crC0jnrHzqH5oYPcCXRGGJTgH
 OFjI5JopzqdOCAT0vtT04OTi03nyO2R4oTryv5o7wBx3HQeHCOMBUiwTe
 ECL77CWDrkfYCtRWp92xXtHjPzXHIxtYFb4kxeaWbuyYh8KHPf0M8dvk7
 S31GJQDOaZAk7F5ffuU9zsdzMMUMMBNhJc3ZMoP0SseHSCXTCnEDm1zim w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="257805448"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="257805448"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 02:10:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="543183693"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 13 May 2022 02:10:28 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npRJb-000LZW-Ep;
 Fri, 13 May 2022 09:10:27 +0000
Date: Fri, 13 May 2022 17:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
Message-ID: <202205131733.OM8Kr2te-lkp@intel.com>
References: <20220513033450.7038-6-kflin@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513033450.7038-6-kflin@nuvoton.com>
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
Cc: kwliu@nuvoton.com, kbuild-all@lists.01.org, tmaimon77@gmail.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com,
 kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Marvin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linux/master linus/master v5.18-rc6]
[cannot apply to media-tree/master next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220513-113806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220513/202205131733.OM8Kr2te-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7fa1f7750e7317479ce2c2c043b44fa19c46b1a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220513-113806
        git checkout 7fa1f7750e7317479ce2c2c043b44fa19c46b1a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/media/platform/nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/nuvoton/npcm-video.c: In function 'nuvoton_video_buf_queue':
>> drivers/media/platform/nuvoton/npcm-video.c:1776:13: warning: variable 'empty' set but not used [-Wunused-but-set-variable]
    1776 |         int empty;
         |             ^~~~~


vim +/empty +1776 drivers/media/platform/nuvoton/npcm-video.c

  1773	
  1774	static void nuvoton_video_buf_queue(struct vb2_buffer *vb)
  1775	{
> 1776		int empty;
  1777		struct nuvoton_video *video = vb2_get_drv_priv(vb->vb2_queue);
  1778		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
  1779		struct nuvoton_video_buffer *nvb = to_nuvoton_video_buffer(vbuf);
  1780		unsigned long flags;
  1781	
  1782		dev_dbg(video->dev, "%s\n", __func__);
  1783	
  1784		spin_lock_irqsave(&video->lock, flags);
  1785		empty = list_empty(&video->buffers);
  1786		list_add_tail(&nvb->link, &video->buffers);
  1787		spin_unlock_irqrestore(&video->lock, flags);
  1788	}
  1789	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
