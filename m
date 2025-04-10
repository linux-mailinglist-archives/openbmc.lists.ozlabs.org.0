Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02314A83FD5
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 12:02:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYFhw4zYJz3cVl
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 20:01:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744279309;
	cv=none; b=OKMvI+83Rk2AOXboOBBVtiL9tlpGXwovhN+1PDkB3yK+1Om63c4oCL9p05r/P1W09g1kPnOq09EX4CaZ2me/hi6jXucmyl2Yv3xkq04K+skMqJBr1iOG3ANnpICp8ZCl7R530H4BMOQtep57d2/Y+yTnbO5PC+uvE2GiGUQ0FcbMzwLlRnHp2yoS1VtUweIE6C/6/JikaaQTDiE5QWbzGMqi0botk1n0qLyhZhcFCKHEHQnBvwTzdyscBWgdFiCMTRYfOivzuRKbPDwPeEaVBJDbJdXa0J/vTBxqKzLmEnuhqOpGN0Klk/hEEFz9wMqGUqFMKu9a2aqxuborMWCKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744279309; c=relaxed/relaxed;
	bh=3Uo5er/uYGpDnrC4qdUdTQ+M350k6gcqOXroe0mMArE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzbaJKP3+5Kl5W84BPtSs8BpSGUuwskvHtBwLrdj0lr9yCNZ7JSEyzDUUfBmNgH6cE7lSZOQMXljF2/rhaIRNEQ5xT4xDHsEVT03QH3lgEXrLK+GfmKtQWd2TPVYLQgapZYUenS+RgUkTXhDdg+K7wMtxZWmUetpdPTBez8omCoK8F7hlwbb/2Vy+ZX2igeXoexLPNlqojc8ZPihvBi1QNkgHidJBVDwyJ5u25wWejMagR6OrcJgtOi52Mudxyyy6mjZ4MSNmY08Fq1HjFZ0c+g/2iI6rWasdUk21O+yNd4tK8ebD3MVYMnBajO+T4/Se7rwxFKoyjT8RTGU+D8zIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h89CiUIl; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h89CiUIl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 10 Apr 2025 20:01:46 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYFhp2W7Xz3bmJ
	for <openbmc@lists.ozlabs.org>; Thu, 10 Apr 2025 20:01:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744279306; x=1775815306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ONUHM5dAa9V9tNPfQhvJhcJq9TbPfVh38gul5GwseA0=;
  b=h89CiUIlV7Cg+a9XL3JbbAPmmkFPMf0fsGgdWW5I/HJuFV5ESZCqVrgZ
   nUVzbrqZsf4/cAVlOZi1hi0RLqFEfQtbhF1ZhIswzmzC2FJPsX/KDdML+
   4FtFnH47vDlakUiP343Y2X/btyiz90aFZS9g1cbtAy+uDmj7IOhXy/bY0
   Z9SgOJwXKiHdAenkS+OavC2v66GPb45JBBV8SECoDQiJXNzBByfbiubZk
   DJWIP7/HlnXbSTb81HGT6TgFW4UbRBLWZQO7sE42AA4UyS4m+CzIjdl5e
   YW7Zn8esFIQUSbTn6ugrNGpD0MqIx9Klv0HDNWmu7Bs1fhUXcgGPlftjq
   A==;
X-CSE-ConnectionGUID: in0CzmhsQw2a8lpJyoJugg==
X-CSE-MsgGUID: mag699UGQwKuPFsLSH9Fog==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57159396"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57159396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 03:00:37 -0700
X-CSE-ConnectionGUID: 05lbWpcNR3KWflc7G4CuNA==
X-CSE-MsgGUID: YLZYCk0KSbOI90zQomq2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133980819"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2025 03:00:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2ohz-0009tz-0B;
	Thu, 10 Apr 2025 10:00:31 +0000
Date: Thu, 10 Apr 2025 17:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH 3/3] hwrng: npcm - Add a local variable for struct device
 pointer
Message-ID: <202504101705.PeW9QC3m-lkp@intel.com>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, Sean Wang <sean.wang@mediatek.com>, Tomer Maimon <tmaimon77@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Tali Perry <tali.perry1@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, oe-kbuild-all@lists.linux.dev, Olivia Mackall <olivia@selenic.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
config: csky-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101705.PeW9QC3m-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101705.PeW9QC3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101705.PeW9QC3m-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/hw_random/npcm-rng.c: In function 'npcm_rng_read':
>> drivers/char/hw_random/npcm-rng.c:58:9: error: expected ',' or ';' before 'int'
      58 |         int retval = 0;
         |         ^~~
>> drivers/char/hw_random/npcm-rng.c:78:17: error: 'retval' undeclared (first use in this function)
      78 |                 retval++;
         |                 ^~~~~~
   drivers/char/hw_random/npcm-rng.c:78:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/hw_random/npcm-rng.c:87:1: warning: control reaches end of non-void function [-Wreturn-type]
      87 | }
         | ^


vim +58 drivers/char/hw_random/npcm-rng.c

c98429297d8b25a Tomer Maimon 2019-09-12  53  
c98429297d8b25a Tomer Maimon 2019-09-12  54  static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
c98429297d8b25a Tomer Maimon 2019-09-12  55  {
c98429297d8b25a Tomer Maimon 2019-09-12  56  	struct npcm_rng *priv = to_npcm_rng(rng);
11fd03b27c8824f Sakari Ailus 2025-04-10  57  	struct device *dev = (struct device *)priv->rng.priv
c98429297d8b25a Tomer Maimon 2019-09-12 @58  	int retval = 0;
c98429297d8b25a Tomer Maimon 2019-09-12  59  	int ready;
c98429297d8b25a Tomer Maimon 2019-09-12  60  
11fd03b27c8824f Sakari Ailus 2025-04-10  61  	pm_runtime_get_sync(dev);
c98429297d8b25a Tomer Maimon 2019-09-12  62  
c2fb644638ae45c Tomer Maimon 2020-09-24  63  	while (max) {
c98429297d8b25a Tomer Maimon 2019-09-12  64  		if (wait) {
c2fb644638ae45c Tomer Maimon 2020-09-24  65  			if (readb_poll_timeout(priv->base + NPCM_RNGCS_REG,
c98429297d8b25a Tomer Maimon 2019-09-12  66  					       ready,
c98429297d8b25a Tomer Maimon 2019-09-12  67  					       ready & NPCM_RNG_DATA_VALID,
c98429297d8b25a Tomer Maimon 2019-09-12  68  					       NPCM_RNG_POLL_USEC,
c98429297d8b25a Tomer Maimon 2019-09-12  69  					       NPCM_RNG_TIMEOUT_USEC))
c98429297d8b25a Tomer Maimon 2019-09-12  70  				break;
c98429297d8b25a Tomer Maimon 2019-09-12  71  		} else {
c2fb644638ae45c Tomer Maimon 2020-09-24  72  			if ((readb(priv->base + NPCM_RNGCS_REG) &
c98429297d8b25a Tomer Maimon 2019-09-12  73  			    NPCM_RNG_DATA_VALID) == 0)
c98429297d8b25a Tomer Maimon 2019-09-12  74  				break;
c98429297d8b25a Tomer Maimon 2019-09-12  75  		}
c98429297d8b25a Tomer Maimon 2019-09-12  76  
c2fb644638ae45c Tomer Maimon 2020-09-24  77  		*(u8 *)buf = readb(priv->base + NPCM_RNGD_REG);
c2fb644638ae45c Tomer Maimon 2020-09-24 @78  		retval++;
c2fb644638ae45c Tomer Maimon 2020-09-24  79  		buf++;
c2fb644638ae45c Tomer Maimon 2020-09-24  80  		max--;
c98429297d8b25a Tomer Maimon 2019-09-12  81  	}
c98429297d8b25a Tomer Maimon 2019-09-12  82  
11fd03b27c8824f Sakari Ailus 2025-04-10  83  	pm_runtime_mark_last_busy(dev);
11fd03b27c8824f Sakari Ailus 2025-04-10  84  	pm_runtime_put_sync_autosuspend(dev);
c98429297d8b25a Tomer Maimon 2019-09-12  85  
c98429297d8b25a Tomer Maimon 2019-09-12  86  	return retval || !wait ? retval : -EIO;
c98429297d8b25a Tomer Maimon 2019-09-12 @87  }
c98429297d8b25a Tomer Maimon 2019-09-12  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
