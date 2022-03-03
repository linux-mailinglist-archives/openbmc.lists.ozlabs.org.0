Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4CA4CBFC3
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 15:15:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8Y1M3CNsz3bvP
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 01:15:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rs2I15/4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Rs2I15/4; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8Y0z1XFNz3byZ
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2022 01:15:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646316932; x=1677852932;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5QG9h5lx2anIO5uIyhVHkmCiySJytsOAX/CGcMce8NM=;
 b=Rs2I15/4SDjrHXUQs+XC1HB6qA864oqaRZelXuAf314Jn099QtKrWvGG
 BGoi1UeuCxXNnt0cuyVUtfOeUCGGOiRI+qyirR16Wz2iovS1/nRx47beN
 fx3ieo4vC3AjymIBkvOFxPR6jVY+3xDsrFvKmEcNa/WsnMX8894wD/2hv
 SVbSfHFDMAbM79Eoo4Ddj/+oXetq3zS/PLVDmAMWGaZxNEnZDqvwwvQ+9
 NwYU9AY96mQltA06Gnisibh79v88HtoCix7uSbtd8GGyC7EkCu4fLhx1F
 JyA1Iz9i14XHbeJSNxqzMRrH8Misene87YYtH/mtRkctASFwEMh+eK0sD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253614377"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="253614377"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:14:29 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="511442309"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:14:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nPmD0-00ApIt-Ho; Thu, 03 Mar 2022 16:13:34 +0200
Date: Thu, 3 Mar 2022 16:13:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
Message-ID: <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
 <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 03, 2022 at 02:48:20PM +0200, Tali Perry wrote:
> > On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > > From: Tali Perry <tali.perry1@gmail.com>
> > > >
> > > > In order to better handle spurious interrupts:
> > > > 1. Disable incoming interrupts in master only mode.
> > > > 2. Clear end of busy (EOB) after every interrupt.
> > > > 3. Return correct status during interrupt.
> > >
> > > This is bad commit message, it doesn't explain "why" you are doing these.

...

> BMC users connect a huge tree of i2c devices and muxes.
> This tree suffers from spikes, noise and double clocks.
> All these may cause spurious interrupts to the BMC.
> 
> If the driver gets an IRQ which was not expected and was not handled
> by the IRQ handler,
> there is nothing left to do but to clear the interrupt and move on.

Yes, the problem is what "move on" means in your case.
If you get a spurious interrupts there are possibilities what's wrong:
1) HW bug(s)
2) FW bug(s)
3) Missed IRQ mask in the driver
4) Improper IRQ mask in the driver

The below approach seems incorrect to me.

> If the transaction failed, driver has a recovery function.
> After that, user may retry to send the message.
> 
> Indeed the commit message doesn't explain all this.
> We will fix and add to the next patchset.
> 
> > > > +     /*
> > > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > > +      * status bits are cleared.
> > >
> > > This does not explain why you hide the spurious interrupt.
> > >
> > > > +      */
> > > > +     if (ret == IRQ_NONE) {
> > > > +             npcm_i2c_eob_int(bus, false);
> > > > +             npcm_i2c_clear_master_status(bus);
> > > > +     }
> > > > +
> > > > +     return IRQ_HANDLED;

-- 
With Best Regards,
Andy Shevchenko


