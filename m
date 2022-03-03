Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D264CBB92
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 11:39:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8SD50gjPz3c1w
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 21:39:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U1ELLz7f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U1ELLz7f; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8SC22cG3z3bx8
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 21:38:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646303935; x=1677839935;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hLseLd0tY6z76yWC4tPRUyQCqqYU1QPw+fPC2+urnM4=;
 b=U1ELLz7fFIrhOtrI4RAttpPIJlf/NFSlBZ/e/vvylNdtT0746Ak8gsHV
 xPwcVCc7SZ+MFALgM3OL3Th4B+Cbt2f3Fy/JkAWZazReWpOV0C0ttjp5B
 eOINvrrmP+kq5tZ54yAYURGrRF5nHPwd/mGReDak3cuccM8aZuC/4UPhu
 CkC3j5p8xzT8x+kMWpYAX1wcA6U9jE1s4dNuq9F8oTk8EJsnP+TYVkYVZ
 LsSWRmo28WH5SUqDIkaH3QfrPNXmkg2HiSRO12TOgwo8uvpaYhPx2QaAr
 0DQOrjzqv7vIXA0Tf49U9jm61jpaMdgLj7qWJg1ru5zMr2C0B1TfxVRH2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="340071816"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="340071816"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:37:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="576445523"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:37:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nPipO-00Ak4g-5d; Thu, 03 Mar 2022 12:36:58 +0200
Date: Thu, 3 Mar 2022 12:36:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
Message-ID: <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303083141.8742-10-warp5tw@gmail.com>
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

On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> In order to better handle spurious interrupts:
> 1. Disable incoming interrupts in master only mode.
> 2. Clear end of busy (EOB) after every interrupt.
> 3. Return correct status during interrupt.

This is bad commit message, it doesn't explain "why" you are doing these.

...

> +	/*
> +	 * if irq is not one of the above, make sure EOB is disabled and all
> +	 * status bits are cleared.

This does not explain why you hide the spurious interrupt.

> +	 */
> +	if (ret == IRQ_NONE) {
> +		npcm_i2c_eob_int(bus, false);
> +		npcm_i2c_clear_master_status(bus);
> +	}
> +
> +	return IRQ_HANDLED;

-- 
With Best Regards,
Andy Shevchenko


