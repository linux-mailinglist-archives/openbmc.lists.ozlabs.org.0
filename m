Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 645544CBB6F
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 11:32:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8S3h3Ts8z3c1d
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 21:32:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bDrwnLO1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bDrwnLO1; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8S3F2XQYz3bYY
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 21:32:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646303530; x=1677839530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wDq06r9kddhLaN6b+ChI1ivL51pnJ9aOuIAEFgqn6mo=;
 b=bDrwnLO1s6ymNp4pwy/oCGBbGdzd7vTeCoALNZYbtmox2T0aMvk5WQzX
 nwRBiGLxe4IFsFBZgA0q8bLhZn5M/kjkfR3g1R0VdNlq4/Q/GceXwECqJ
 YtXlCf3Xe87xyfyeFgceUCbhHrbnYjL5JwiLpt4RW2/RTYs+x6OmbphfG
 Uv+7Tt0wv81nH+b0DRM+yIEtH8Ybk33EZqeoh+67VBZYwvzC0POK2JdNk
 od1FDGntnYAwix0LQ0MvEs9KgRqNmH/TgxmXT4S9LZ+mwR4pWw9/Ug9jB
 cC+1awDcl8IsL2h6jbpYmAwLmjfhijUKrgXOR8H6ccBcUrib9mB8nMe3+ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253370223"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="253370223"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:31:04 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="545817308"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:30:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nPiio-00AjxS-JE; Thu, 03 Mar 2022 12:30:10 +0200
Date: Thu, 3 Mar 2022 12:30:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v3 03/11] i2c: npcm: Fix client address calculation
Message-ID: <YiCYshb354S9T5ev@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-4-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303083141.8742-4-warp5tw@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, yangyicong@hisilicon.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 03, 2022 at 04:31:33PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Fix i2c client address by left-shifting 1 bit before
> applying it to the data register.

...

> -	bus->dest_addr = slave_addr;
> +	bus->dest_addr = slave_addr << 1;

1. Why this is not using i2c_8bit_addr_from_msg() helper?
2. This is duplication of what npcm_i2c_master_start_xmit() does.

Taking 2 into account, what is this exactly fixing?
Sounds like a red herring.

-- 
With Best Regards,
Andy Shevchenko


