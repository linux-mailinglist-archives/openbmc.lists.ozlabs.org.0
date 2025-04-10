Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB2A848DC
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:56:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYPZS1GDLz3cXP
	for <lists+openbmc@lfdr.de>; Fri, 11 Apr 2025 01:56:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744300603;
	cv=none; b=NOl9GZDz0xh6fX5p4LgwEHT6wAYnPMb4gQahBuAQ+pCwgjwoj3lXIB2WEjtDxc+iQd/fb5Rt7eqJI1SSQMmVnFsexrwn11uulowDNTbZFVjlgdUxjwlpDnDyiSKgEn+dDPKeTIeVe3sFgvKHLaXybrzzTw0grnLQ2x626PYC4MFZBBhEwa/hi9By05ZWyE5UxDenKxOQXD7Jto5snFqdQyCNaVpGNVddocFBLzt6CBeBet3US/ptmvxmJ+H8JskGSd+k8UT6NHgOVSCPMsi4auXD5WSrFE8uYNkrWZRXbFDP0aXw6I+L6TlJEHz7cyIQv/JJX0jVm+tXOQz/BUeeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744300603; c=relaxed/relaxed;
	bh=qSWKT5mUZ3JQ0NV2wReCpUV4eGDfH/9FlyleljT+7YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCDOa9xB5lGqn/aFiCRyNPZIT7A2HMJ9KYIdLgEyJ933h74yy9c5xrrKT7jhI6jyekC3BIEyFW/UlJvdcy872GAw98x1776d5j7A7XLnmavhO3qUuFhyVmfSQx9KexPtwdzzGZU6vBiRR1en9HzIMoNHD2cqTg8YR9Jan3TwfHLY2RPnKN/G6EZn5TlozFc4rOH9TyRu4rwGryZ0B3okri0IPQUKQrF/3nvfU0V0H4h9GmN7aIXqDwhoI9dPlLGdkmUlp9QxiVZ3vCDdSU1YiUQR7t5KuSA2XctoyFnKTaJtjQy59CfKjRykBwLNuWy/6T5KqZ/mMZy9jz2S/bRhsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ARm4Cmfd; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ARm4Cmfd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYPZK3cbgz3bqD
	for <openbmc@lists.ozlabs.org>; Fri, 11 Apr 2025 01:56:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744300602; x=1775836602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQXYAVIwetUyVwvHQAZ8MBfV2JpMeqQiDyjEkLidttY=;
  b=ARm4CmfdOxVbg1GIkSKEC7976MhihGT8cWU4RTnfivAJxXiNWc7vcRvN
   7z9PAr3dAim+Xx0nHeHxaGSx9P52qfOzGzu4bCzqkFqGEbQKn9AULWGEH
   3Cmty6i8K5/PiKm3P9mgKbpgD6qn+TOZyCutQqFeHxCHUZRVCkVe0558Y
   wDWdaicsNJqyVAwCWJNEc0mKNZ3zv6e7nDIInaVMwC58XDpOgYE8mORNm
   BzznMNHD0eDzlQyOLbzkvTqWczvzkphyoXFg9js34pLgR2BKQgeGOyuXs
   5xJ/8WbhwgCWPzy7pG5j050ANnDSkglpt8Waf7/p8spo/4N4YXNqgp9s+
   w==;
X-CSE-ConnectionGUID: ISFJsl0dRLSNpOZ6VhOzog==
X-CSE-MsgGUID: 2pFY34/FQ42srfE/sNDX2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56010830"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="56010830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:56:36 -0700
X-CSE-ConnectionGUID: cYuTcStpSoexM0h44TRRmg==
X-CSE-MsgGUID: GXm97F4OR8+Hd6GdEbBnOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133671636"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2025 08:56:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2uGT-000AFT-27;
	Thu, 10 Apr 2025 15:56:29 +0000
Date: Thu, 10 Apr 2025 23:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH 3/3] hwrng: npcm - Add a local variable for struct device
 pointer
Message-ID: <202504102028.H0evWtkl-lkp@intel.com>
References: <20250410070623.3676647-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410070623.3676647-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Sean Wang <sean.wang@mediatek.com>, Herbert Xu <herbert@gondor.apana.org.au>, Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, llvm@lists.linux.dev, Tomer Maimon <tmaimon77@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Tali Perry <tali.perry1@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, oe-kbuild-all@lists.linux.dev, Olivia Mackall <olivia@selenic.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master linus/master v6.15-rc1 next-20250410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/hwrng-atmel-Add-a-local-variable-for-struct-device-pointer/20250410-151223
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250410070623.3676647-4-sakari.ailus%40linux.intel.com
patch subject: [PATCH 3/3] hwrng: npcm - Add a local variable for struct device pointer
config: arm-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250410/202504102028.H0evWtkl-lkp@intel.com/config)
compiler: clang version 19.1.1 (https://github.com/llvm/llvm-project d401987fe349a87c53fe25829215b080b70c0c1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504102028.H0evWtkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504102028.H0evWtkl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/hw_random/npcm-rng.c:57:54: error: expected ';' at end of declaration
      57 |         struct device *dev = (struct device *)priv->rng.priv
         |                                                             ^
         |                                                             ;
   1 error generated.


vim +57 drivers/char/hw_random/npcm-rng.c

    53	
    54	static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
    55	{
    56		struct npcm_rng *priv = to_npcm_rng(rng);
  > 57		struct device *dev = (struct device *)priv->rng.priv
    58		int retval = 0;
    59		int ready;
    60	
    61		pm_runtime_get_sync(dev);
    62	
    63		while (max) {
    64			if (wait) {
    65				if (readb_poll_timeout(priv->base + NPCM_RNGCS_REG,
    66						       ready,
    67						       ready & NPCM_RNG_DATA_VALID,
    68						       NPCM_RNG_POLL_USEC,
    69						       NPCM_RNG_TIMEOUT_USEC))
    70					break;
    71			} else {
    72				if ((readb(priv->base + NPCM_RNGCS_REG) &
    73				    NPCM_RNG_DATA_VALID) == 0)
    74					break;
    75			}
    76	
    77			*(u8 *)buf = readb(priv->base + NPCM_RNGD_REG);
    78			retval++;
    79			buf++;
    80			max--;
    81		}
    82	
    83		pm_runtime_mark_last_busy(dev);
    84		pm_runtime_put_sync_autosuspend(dev);
    85	
    86		return retval || !wait ? retval : -EIO;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
