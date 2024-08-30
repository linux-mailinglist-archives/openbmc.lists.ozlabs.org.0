Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 624999653F8
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 02:22:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvzNl1xBJz3bTQ
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 10:21:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724977315;
	cv=none; b=Pns8rL0s7crD9/E/yuHyQg9kR6Bw7NbVas8g4him9EVsvnJX8MktXzTN4XjvlDqMRx6+/t+NSPqYjC+prBVj8Jq/0vOyetlx9D6kh5PdMh7M9IyfQZMwxMHJYCFy4DwzOrOwL7Xp4xAkY9aUqzDvjnCnq1qnHkGjtNMWiRQy4sY+bJVkJudjzNz589X7GkPZSMbRSeI3EQdzlw3Dvrpiy9SzYA/8mKMJs+d/w656EYLBZl08sStKXkRwR5XO4WcsUFcJWCoBasUo9Rx/Tf0SedAjo2vs6F8gfVfBHkFE7SwjEZH2RnIyoya0r19GvDZXEviUsNRwjzeOegKL8NeBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724977315; c=relaxed/relaxed;
	bh=CoXsL3XMFJ9Hns9Kwy7qG+mrv8vJjFK1ZvXOI8G9Gj8=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RRmvPlLLHIn1318z/ZGJAaHbtgjqiztNWWsnlo1l6rmlHv7jIuIVS2hSC4QnjFOPraXV4J+MSTI3geNVD52Xa/O8BYTeHE/zl3n8OJbR4LJi6H3PHEqO+xe1Vo9sj0VFBbnBU/Ewh9wocZBdqTw2gW43+O/vlNNFjNzGQkJXByVPeCFLPcODez1bYB7Fc57vsy6dqycVo5ct9hFa+Me4S3rGRdHkXHUVcCpWNgwnsolz8WxYtbO4/AnBYhalAb/CNxIC3vOFSAEErfBTGXxQLRPAUIN2nu6qroyamySYmDRVqtn8ufkXFZ1nLY0HK2uh+x29iuRFkc8ZRZpdludOTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TJUNgubO; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TJUNgubO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvzNd229Tz2yvk;
	Fri, 30 Aug 2024 10:21:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724977315; x=1756513315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w+yKiDpRWvKzQEAGuCGuIqf/9HVfNpoSKRtblk0n09A=;
  b=TJUNgubOd5f/DdanvCbgjo8bcCARirMmuEgvXjeFCNPzTVeT0H6olJeb
   ar9x3KRpzqh+xbzJHsYIpNeal026NP12h30fNPKoj94JtktUJni+Om/rC
   0wcPGOAv33lkWd9ucbOM5R9ZxvEb67UiphPV44OVHrWhI6LnedFY6pgKQ
   FKxOmDIA2EvWE9CTUoYr00KAf/icK/VxNdQw+ugxGz6LSN4VGYvl4SQDk
   HUKn7DHw2Kj2PxwdFoGSeKKdm/p3NZ1MzglWAVKunCJ5TeTyt6zS0t801
   rRBTd77gY6vyNU33BwciVzBIHa7kmSByO0aI3zPO39AimFRRw2oWOr1mZ
   g==;
X-CSE-ConnectionGUID: uBmDDY6YRdyXkpTlFytMdw==
X-CSE-MsgGUID: lkQTvWa1R3qzs7P5ZIQ1Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23407084"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="23407084"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 17:21:46 -0700
X-CSE-ConnectionGUID: JuAvQF4QREifpbm53DR3bQ==
X-CSE-MsgGUID: 3gWQbgCWSwGNsijAXnO5OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="94559556"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Aug 2024 17:21:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjpOW-0000pS-0E;
	Fri, 30 Aug 2024 00:21:40 +0000
Date: Fri, 30 Aug 2024 08:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, robh@kernel.org,
	conor+dt@kernel.org, eajames@linux.ibm.com, mchehab@kernel.org,
	joel@jms.id.au, andrew@aj.id.au, hverkuil@xs4all.nl,
	pmenzel@molgen.mpg.de, krzk+dt@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema
Message-ID: <202408300813.2RN73Kn4-lkp@intel.com>
References: <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 47ac09b91befbb6a235ab620c32af719f8208399]

url:    https://github.com/intel-lab-lkp/linux/commits/Jammy-Huang/dt-bindings-media-convert-aspeed-video-txt-to-dt-schema/20240829-144721
base:   47ac09b91befbb6a235ab620c32af719f8208399
patch link:    https://lore.kernel.org/r/20240829064508.3706672-2-jammy_huang%40aspeedtech.com
patch subject: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to dt-schema
reproduce: (https://download.01.org/0day-ci/archive/20240830/202408300813.2RN73Kn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408300813.2RN73Kn4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/aspeed-video.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
