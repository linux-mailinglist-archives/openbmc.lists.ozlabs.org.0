Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF25211FB
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 12:16:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyDTr0lzVz3bb0
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 20:16:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wax6Y+HV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wax6Y+HV; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyDTR3qfFz301s
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 20:16:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652177771; x=1683713771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mm3Wzebclb3e6JX7+dRypp1DwInebPhxa0hyqQTCYhk=;
 b=Wax6Y+HV8k6B9BbxPSPqjcS4nUBW3syk1DilTyrGttyUTyECSxOeIMVV
 melY63UOX6wZbPj4G6QyyNGnpFJx0IPkGEjzHzWTi/PCF/H68qoNfuaQL
 Oci+9YDql1a29L53PSeNX7tWmwEA81iHwTc3q8U7sd3Anm294d6kk3LvC
 E/7o7IGZUUE+pk7xnoJ8FNEZbTNn8gXS3tzCVZoKszGMJS9PmrMlIdx7P
 odl8J/c9XMnALeHBq13spZfZPWCursn1Oq188sa/wZ7oN9eFP4qxXbGWA
 vlj7tfFl/w4KenEzPe+GaHi9jyYtUY1OK0PzossuKqr+qrtDNJxUb1sZN A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266915183"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="266915183"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:15:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="635878530"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:15:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1noMtO-00EIEX-Bb; Tue, 10 May 2022 13:14:58 +0300
Date: Tue, 10 May 2022 13:14:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v4 7/9] i2c: npcm: Handle spurious interrupts
Message-ID: <Yno7IaBNnR5U2GuF@smile.fi.intel.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-8-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510091654.8498-8-warp5tw@gmail.com>
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

On Tue, May 10, 2022 at 05:16:52PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> On some platforms in rare cases (1 to 100,000 transactions),
> the i2c gets a spurious interrupt which means that we enter an interrupt
> but in the interrupt handler we don't find any status bit that points to
> the reason we got this interrupt.
> 
> This may be a case of a rare HW issue or signal integrity issue that is
> still under investigation.
> 
> In order to overcome this we are doing the following:
> 1. Disable incoming interrupts in master mode only when slave mode is not
>    enabled.
> 2. Clear end of busy (EOB) after every interrupt.
> 3. Clear other status bits (just in case since we found them cleared)
> 4. Return correct status during the interrupt that will finish the
>    transaction.
> 
> On next xmit transaction if the bus is still busy the master will issue a
> recovery process before issuing the new transaction.

...

> +	/* clear status bits for spurious interrupts */

Clear

...

> +	/*
> +	 * if irq is not one of the above, make sure EOB is disabled and all

If

> +	 * status bits are cleared.
> +	 */

...

> +		/* verify no status bits are still set after bus is released */

Verify

...

> +	/* check HW is OK: SDA and SCL should be high at this point. */

Check

...

> +	if ((npcm_i2c_get_SDA(&bus->adap) == 0) ||
> +	    (npcm_i2c_get_SCL(&bus->adap) == 0)) {

This fits one line

> +		dev_err(bus->dev, "I2C%d init fail: lines are low", bus->num);
> +		dev_err(bus->dev, "SDA=%d SCL=%d", npcm_i2c_get_SDA(&bus->adap),
> +			npcm_i2c_get_SCL(&bus->adap));

No '\n' at the end of each?!

> +		return -ENXIO;
> +	}

...

> +	/* clear status bits for spurious interrupts */

Clear

...

> +	/* after any xfer, successful or not, stall and EOB must be disabled */

After

...

Maybe you chose the small letter for one-liner comments, but I see even in the
original code the inconsistent style. Please, add an explanation to the cover
letter and follow it, assuming you add the patch at the end of the series that
makes comment style consistent (for the one-liners, for the multi-line comments
we have a clear understanding about the style).

-- 
With Best Regards,
Andy Shevchenko


