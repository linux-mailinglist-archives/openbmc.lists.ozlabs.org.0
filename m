Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942145270BF
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 12:44:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0hvy3v7Lz3cCB
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 20:44:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSY4svhb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CSY4svhb; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0hvY2Dxcz3bgR
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 20:43:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652525033; x=1684061033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=owL2E8dN4WOVXiXSAA2t80U2WaZOkvUVbpuMiP4wVM8=;
 b=CSY4svhbyeqH+km3JNy3uSL3RsFtOvT9eWl6ZQZzP43iN3WCc3wAIe43
 RPIwuMXiJhY/c4MlIuhK2oir8BNcgWPaH/3qh/uFqOFx0O7iCG7Xu1mcG
 G2HBiQXcvC328W4a5s9wSH6n2Bm9exGRppH9aw9RzP8e6AA+Vj6MWgotF
 YMLno4AtWm6zZdrbTLBW7hm/dQvNCRugwjzeGY4BgXOukMwpWZvM3MSuO
 q8HD/VhZxlunU2TDacT2y6LwWP4NcesAg16yCSPJwcXse+oJoi2I3gmIZ
 pCeBm1TtyvffuVMyFogKe6/sZH37IjgPzNg275Iau3ZwItibXsZY7wl60 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="270173114"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; d="scan'208";a="270173114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2022 03:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; d="scan'208";a="595648948"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 14 May 2022 03:42:36 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nppEJ-0000Vx-Ds;
 Sat, 14 May 2022 10:42:35 +0000
Date: Sat, 14 May 2022 18:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marvin Lin <milkfafa@gmail.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drivers: media: platform: Add NPCM Video
 Capture/Encode Engine driver
Message-ID: <202205141815.QVBWWaqM-lkp@intel.com>
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
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, llvm@lists.linux.dev,
 tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Marvin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linux/master linus/master v5.18-rc6]
[cannot apply to media-tree/master next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220513-113806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220514/202205141815.QVBWWaqM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7fa1f7750e7317479ce2c2c043b44fa19c46b1a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marvin-Lin/Support-Nuvoton-NPCM-Video-Capture-Encode-Engine/20220513-113806
        git checkout 7fa1f7750e7317479ce2c2c043b44fa19c46b1a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/platform/nuvoton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nuvoton/npcm-video.c:1776:6: warning: variable 'empty' set but not used [-Wunused-but-set-variable]
           int empty;
               ^
   1 warning generated.


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
