Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB659A50F2D
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:54:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SWn3q0tz3fRY
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741170904;
	cv=none; b=kwJs8MISG28uBk0PxcE3RVKPgeGrdYxMzvDu5pCCnj+sUoyFb3rkmj0VpkPKBW3FmbtWSLGkEDGj09e26DoQLEEe1NdfhlC9lm403aMkhWWL5qNEkJJNgiDb+pJT4TuaYiJHcw9JM1uEOvQvPCYC46h7cKvjoJ1n8wz4ro2J2GWD9vf/1gDdEznxF29Zudcd3njaXaOsIDT/Vp/5UUKe2CCgI2zD3w6snPfUzYKwKzKvzZlaYXZJb1zi3706jBYEx0cnIbn5kRlZYfFxTPZvgw9mEU6/H9SaiZcY0hGITE8uP4bYXoQkUCEYrJ4+wTXHrRUiA2WmGO8KOFPHakzWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741170904; c=relaxed/relaxed;
	bh=zbIgnxo33TJwl2XpIuiDYO43qXbswWCH8QpY4+o4tns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpS50WgaTscOCZPJTqKwk4bQJnfEriSP6SZ//UsGd0xrN6GZ+GT7guzVNdX29YyU2DJwdECNSCoUvnLOBDws1q7pd6g6EMmuhyhP232csL33QJOFHtzBluFYHVyBCAoTw0pxFAmu6hkGMbv07eZgul/CQJGHNo8/vOAQqnl4aauryG2/Qz+jRmvzgXUlVPBMO7a5lkwzDSHr+GNn4A8zkHCFJMsnHV4luy1qGbxRcACQTyL3PqBUytYmwebikCV1/VLESa+7A74WrttkViqIBgD7LZwWjv5yvyZLteYtSCwnsdzfAFh5SVvwhWTYHXwXr7uNPyHprwuzYsgT++og2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=softfail (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 05 Mar 2025 21:35:02 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z787p2C2Mz30XR;
	Wed,  5 Mar 2025 21:35:02 +1100 (AEDT)
X-CSE-ConnectionGUID: ++ps7kicTHGCWI+rNmw7ww==
X-CSE-MsgGUID: K7EgXrosR3+qvlwT+R5BYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44936608"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="44936608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:33:56 -0800
X-CSE-ConnectionGUID: Pmo02+QiRyuCyBTsLyBQKA==
X-CSE-MsgGUID: +3/qaz49Qz6WtsiJJYV/Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123579370"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:33:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tpm4L-0000000HNsf-1gjT;
	Wed, 05 Mar 2025 12:33:41 +0200
Date: Wed, 5 Mar 2025 12:33:41 +0200
From: Andy Shevchenko <andy@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Subject: Re: [PATCH v4 2/2] drivers: watchdog: Add support for panic notifier
 callback
Message-ID: <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-3-george.cherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-3-george.cherian@marvell.com>
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

On Wed, Mar 05, 2025 at 10:10:25AM +0000, George Cherian wrote:
> Watchdog is not turned off in kernel panic situation.
> In certain systems this might prevent the successful loading
> of kdump kernel. The kdump kernel might hit a watchdog reset
> while it is booting.
> 
> To avoid such scenarios add a panic notifier call back function
> which can stop the watchdog. This provision can be enabled by
> passing watchdog.stop_on_panic=1 via kernel command-line parameter.

...

First of all, do we really need a new module parameter for that? Why can't it
be done automatically if kdump is expected?

> +static bool stop_on_panic;
> +module_param(stop_on_panic, bool, 0444);
> +MODULE_PARM_DESC(stop_on_panic, "Stop watchdogs on panic (0=keep watching, 1=stop)");

+ blank line.

Also I do not see the documentation update. Where is it lost?

>  /*

-- 
With Best Regards,
Andy Shevchenko


