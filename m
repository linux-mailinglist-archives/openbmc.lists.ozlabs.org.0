Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB13672F1A
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 03:41:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny6MD57ybz3fCg
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 13:41:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aQA9Ge1G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aQA9Ge1G;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny6KZ6zq5z3c83;
	Thu, 19 Jan 2023 13:39:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674095987; x=1705631987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Hdifom+vjmj8bVA7OGmDBcPanpOSGWzyc6nuzaLKLM=;
  b=aQA9Ge1GIMRT822vS90L7t94NYzAzHJhKEwAKsPvPBeesIMiaQt7qwKY
   wscbJZJzef+2PVIWz9mXk5kGAhriTou5SM2BDoSI8PnCVwC1RovMZVlmj
   1ZTfDfSNyj7K+FPZt1Dx/vlHO6hDRD18j0yRrk8D/O8lE0Zp42BihF4Tj
   +eWf0nXxxin08hCSZTpe9EmGI9xW4oo25hdLEuTvKepoO5CYBlkoYltAh
   QTqxPBfPQf99RfXHsK/A+LlI18v9f0us0NFzLOn7U9FKE5U6sy80y4Os5
   I3KkaPT9kjqXa18Ry2lcJRehjQJStORh0N7rFryFoWZuJIUQY335rrkKw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327247912"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="327247912"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 18:39:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609907686"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609907686"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 18:39:32 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIKpq-0000yk-0Z;
	Thu, 19 Jan 2023 02:39:26 +0000
Date: Thu, 19 Jan 2023 10:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: Convert OMAP OHCI/EHCI bindings
 to schema
Message-ID: <202301191008.G3IXJXb5-lkp@intel.com>
References: <20230110-dt-usb-v2-3-926bc1260e51@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110-dt-usb-v2-3-926bc1260e51@kernel.org>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 1b929c02afd37871d5afb9d498426f83432e71c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/dt-bindings-usb-Remove-obsolete-brcm-bcm3384-usb-txt/20230119-030120
base:   1b929c02afd37871d5afb9d498426f83432e71c2
patch link:    https://lore.kernel.org/r/20230110-dt-usb-v2-3-926bc1260e51%40kernel.org
patch subject: [PATCH v2 3/5] dt-bindings: usb: Convert OMAP OHCI/EHCI bindings to schema
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/e7220b26de1a7fcd192feec481c1a90f7bf5c949
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Herring/dt-bindings-usb-Remove-obsolete-brcm-bcm3384-usb-txt/20230119-030120
        git checkout e7220b26de1a7fcd192feec481c1a90f7bf5c949
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/omap-usb-host.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/ehci-generic.yaml
>> Warning: Documentation/devicetree/bindings/mfd/omap-usb-host.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/ohci-generic.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
