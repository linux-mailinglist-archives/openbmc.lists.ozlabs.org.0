Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A66521213
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 12:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyDZw0xP3z3bxC
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 20:20:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mEFpeIGJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mEFpeIGJ; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyDZV0jNLz2yjS
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 20:20:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652178034; x=1683714034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nXHxCMDwnYM34gDLMPSIohgzS3+HPWiv+a82UDu22gc=;
 b=mEFpeIGJe0+1RzRNmisCHSs5mh5SmUTgq7HlokvrXgJJBKOLW/gZ6XvT
 Q/KYNmgIJzoV0osCJv3lmBvqxelTXE4JMyMRdrsFca5DGW9d83qQGNohO
 f2Yg5nej5jII0cN8/xR2AV3PnG+toUAmdrQIh2QbPk7m3BFbsXMU/vMeG
 62aJfXZUGnBJA0xJt23+HPv3aY/+Wmlv8hp7Nde0DSbgZShY9ILkn7BiP
 sUpY1nYXt2066EZHv8/SfIv1VfoNNiqLUtUmEdW7E5/6EpadqqNqweFpH
 0FXRCGqhscMTCRvlFDBMW+9AfsqSmYjPISwqpDRVFAkw+qMv4I0BNF8B+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249231913"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="249231913"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:19:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="669819774"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:19:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1noMxc-00EIJZ-VW; Tue, 10 May 2022 13:19:20 +0300
Date: Tue, 10 May 2022 13:19:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v4 8/9] i2c: npcm: Remove own slave addresses 2:10
Message-ID: <Yno8KMycNbJ+VGtc@smile.fi.intel.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-9-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-9-warp5tw@gmail.com>
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
 jsd@semihalf.com, benjaminfair@google.com, krzysztof.kozlowski@canonical.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 linux-kernel@vger.kernel.org, wsa@kernel.org, kfting@nuvoton.com,
 tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 05:16:53PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> NPCM can support up to 10 own slave addresses.
> In practice, only one address is actually being used.
> In order to access addresses 2 and above, need to switch
> register banks. The switch needs spinlock.
> To avoid using spinlock for this useless feature
> removed support of SA >= 2.

> Also fix returned slave event enum.
> 
> Remove some comment since the bank selection is not
> required. The bank selection is not required since
> the supported slave addresses are reduced.

Fancy indentation. Please fix it in all your commit messages where it applies.

...

> +	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10) {
> +		dev_err(bus->dev,
> +			"try to enable more then 2 SA not supported\n");

Make it one line and drop {}.

> +	}

...

> +	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10) {
> +		dev_err(bus->dev,
> +			"get slave: try to use more then 2 slave addresses not supported\n");

As per above be consistent with abbreviations ("SA" here, which makes line
shorter) and follow the above recommendation.

> +	}

-- 
With Best Regards,
Andy Shevchenko


