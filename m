Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2332BA50F28
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:53:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SWh3DHDz3g55
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741170703;
	cv=none; b=QvQd2VXSvqKFsAp488Fb5vMntKkPjxjCSQy7hqR2d0I/hbtuU0/X5H3NM2Wjz10k+dgU5xlgrmMlGi9UnWXjl0XiNI3LRJx2aFpd/icMDXIopB0HnHevLCMZ2a708/VM/udOC5tkIEIKFAQ6WfQOIoSknmxT1Cv+OEIm95N1GrwmSQp/8uoG7mCBP52lJc8LpwA/DVq7Oqvn/AMyNDCqqV0TGbaTIjhFE0wTO0C4zDFPy1GoPwfMO+VSHjHLuhV0ZSwgpymhPvGAY6drfJstq3eBST+bVdCWWUPj2ZfUUEofzVfLo6XgGAStJOOn2N5Q/wFTQjYEjE4vmjPIgNjwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741170703; c=relaxed/relaxed;
	bh=1QcG68X2dThxXn08oi0mv/sMSvoU2vw3JRxKH+1IpVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyX7hxgQ2c4rYRqAAJzpRjCWDy15Q3BC3ITbbvApSNGiSJes1zGX/2gDA8ucEXtfnS5E4v0ie5boWWdJMMfVfwAcLScmp2ek9K5OPr7U6CuSfuPAHidWLkS8C4lGOjI5/d7YBw19iURxhUVLR/6wLdKW3JBd0nkdYIN+qM/PuA63mWjojfaW2bacyFctLI9iHmVnv3JJh90BrbpmpM8ndtjxq0Cv/SLoAa8arrJ6H9QwIA4njE1r/WtWvQJVairp75aLHRAGfZuH2AUH8nn4DtPdhoQjqUSygUQw3eXT615nwyp6klb3yzIzaTzY/MMZ8+psN11JscC5ck0lJBbIqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=softfail (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z783x6pSsz30XR;
	Wed,  5 Mar 2025 21:31:41 +1100 (AEDT)
X-CSE-ConnectionGUID: Ef8UzhJZS6SQSqLMYME2Lg==
X-CSE-MsgGUID: GRTxDFPMT9SztimAcp/a+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64567011"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="64567011"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:30:36 -0800
X-CSE-ConnectionGUID: WDkYJmSHT0OrYH3RzlgbQw==
X-CSE-MsgGUID: ttOP2cH/SDKXIxbe3IsO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122783306"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:30:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tpm18-0000000HNpF-00A7;
	Wed, 05 Mar 2025 12:30:22 +0200
Date: Wed, 5 Mar 2025 12:30:21 +0200
From: Andy Shevchenko <andy@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Message-ID: <Z8gnvXQ9OMXoq9Fz@smile.fi.intel.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: imx@lists.linux.dev, mwalle@kernel.org, tmaimon77@gmail.com, hayashi.kunihiko@socionext.com, alexander.usyskin@intel.com, tali.perry1@gmail.com, paul@crapouillou.net, daniel@thingy.jp, patches@opensource.cirrus.com, christophe.leroy@csgroup.eu, festevam@gmail.com, kabel@kernel.org, chrome-platform@lists.linux.dev, maddy@linux.ibm.com, benjaminfair@google.com, lma@chromium.org, mpe@ellerman.id.au, openbmc@lists.ozlabs.org, krzk@kernel.org, evanbenn@chromium.org, linux-mips@vger.kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, mazziesaccount@gmail.com, s.hauer@pengutronix.de, naveen@kernel.org, npiggin@gmail.com, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, wim@linux-watchdog.org, bleung@chromium.org, linux-arm-kernel@lists.infradead.org, support.opensource@diasemi.com, andreas.werner@men.de, avifishman70@gmail.com, thomas.richard@bootlin.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de, venture@google.com, jwerner@chromium.org, romain.perier@gmail.com, shawnguo@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 05, 2025 at 10:10:24AM +0000, George Cherian wrote:
> A new option flag is added to watchdog_info. This helps the watchdog
> core to check whether stop functions would sleep or not.
> The option flags of individual drivers are also updated accordingly.

...

>  	.options =	WDIOF_SETTIMEOUT |
>  			WDIOF_MAGICCLOSE |
> -			WDIOF_KEEPALIVEPING,
> +			WDIOF_KEEPALIVEPING |
> +			WDIOF_STOP_MAYSLEEP,

You may heavily reduce this change if you squeeze the new option just before
the last one. Currently it's a lot of unneeded churn that makes review a bit
harder (each needs to be carefully checked for the correctness).

-- 
With Best Regards,
Andy Shevchenko


