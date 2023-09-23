Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09A7AC5AD
	for <lists+openbmc@lfdr.de>; Sun, 24 Sep 2023 00:19:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YFwcsODx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RtNp622Pzz3cGc
	for <lists+openbmc@lfdr.de>; Sun, 24 Sep 2023 08:18:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YFwcsODx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RtNnW1qVqz300q
	for <openbmc@lists.ozlabs.org>; Sun, 24 Sep 2023 08:18:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695507503; x=1727043503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UuDxwhfPF7O8T115b2FKrlhmBbJyLggQ2u1hq9AMO8g=;
  b=YFwcsODxKC71kmdAMw2OhWPooKuFHdYFpMSzrXatm2dsTBG3dw676RzQ
   OzEw3RQdY+Kgz5Da6lyhbepJ68po3xeDwNuRNBdhPttFV20OAOKAvwQrb
   bxZTJUN0N7eWpLt8IRpJn3wM1c2LmBk+qNRgvrOQ93Z/6iGIGEfmIZVfm
   u0miOZaKy+YcmxSnlov5dIFZ01to2V45fqgeoe+o06JcltkvPd+0t+1Hm
   gp/8DqgcEDQ3FxRUfZ9ZhrbWzqo4Jflspkb597ohm6xIRVb4yeMhpZsCE
   xhuhmaKJekfQz4xxZNWPNoXFJeeIVdbYJ4OHNvNdtTNcBF6yWJIHK/h+R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="366122679"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="366122679"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 15:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="871643176"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="871643176"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 23 Sep 2023 15:18:07 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkAwu-0002uy-2f;
	Sat, 23 Sep 2023 22:18:04 +0000
Date: Sun, 24 Sep 2023 06:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v9 3/3] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Message-ID: <202309240553.3BXO3Rd6-lkp@intel.com>
References: <20230923143438.1895461-4-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923143438.1895461-4-j.neuschaefer@gmx.net>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Jacky Huang <ychuang3@nuvoton.com>, Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next pza/reset/next linus/master v6.6-rc2 next-20230921]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Neusch-fer/dt-bindings-clock-Add-Nuvoton-WPCM450-clock-reset-controller/20230923-223751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230923143438.1895461-4-j.neuschaefer%40gmx.net
patch subject: [PATCH v9 3/3] clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller driver
config: loongarch-randconfig-002-20230924 (https://download.01.org/0day-ci/archive/20230924/202309240553.3BXO3Rd6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240553.3BXO3Rd6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240553.3BXO3Rd6-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/clk/nuvoton/clk-wpcm450.o: in function `.L40':
>> clk-wpcm450.c:(.init.text+0x508): undefined reference to `reset_simple_ops'
>> loongarch64-linux-ld: clk-wpcm450.c:(.init.text+0x50c): undefined reference to `reset_simple_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
