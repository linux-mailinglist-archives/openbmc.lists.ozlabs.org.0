Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8C81914B
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 21:26:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Okv559/k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svp9k5xtdz30gm
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 07:26:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Okv559/k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Svp970fyQz305T
	for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 07:25:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703017531; x=1734553531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q/3HjixKss5fvVmEUClEL2EJFxrnmh9GCua2vOP2nJg=;
  b=Okv559/k57e9hMji7MjjHLgBuD1jkR8U85GBlzPHoKkYPXd1j+3Hg1uu
   BfD/zMnHz3dM6c3UFft0it5FLZRR3RjO9ug8nF4qpRj9djFeZwVZEDJ3X
   E9VE1+YTJBUkIOqeeOmrKvVZUBtZimqcBm/FRUmTg9UuHqSMibOMCIsG0
   hCE6TRRi5KmG/l6YKgqyZwNHfpn0Bnlh60oMwen077DpWuQKej7+i8Jok
   tzMYZyrcsK9N5NlX/TLG46fs/bPGScNDuGLB+fpqrUkxOFbo+rJGZcqN2
   EcovgtNQcDl7kHqZKPBQ9+BcpJk2ZhkEaJiyf1Q5/qyxZqlWE3oh84QFZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2537669"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="2537669"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 12:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="919730521"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="919730521"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2023 12:25:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFgeU-0005v0-07;
	Tue, 19 Dec 2023 20:25:18 +0000
Date: Wed, 20 Dec 2023 04:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: baneric926@gmail.com, jdelvare@suse.com, linux@roeck-us.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Message-ID: <202312200427.FGvpu8DB-lkp@intel.com>
References: <20231219080021.2048889-2-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219080021.2048889-2-kcfeng0@nuvoton.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, oe-kbuild-all@lists.linux.dev, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc6 next-20231219]
[cannot apply to groeck-staging/hwmon-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/baneric926-gmail-com/dt-bindings-hwmon-Add-NCT7363Y-documentation/20231219-160534
base:   linus/master
patch link:    https://lore.kernel.org/r/20231219080021.2048889-2-kcfeng0%40nuvoton.com
patch subject: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
reproduce: (https://download.01.org/0day-ci/archive/20231220/202312200427.FGvpu8DB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312200427.FGvpu8DB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
