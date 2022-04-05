Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D404F249B
	for <lists+openbmc@lfdr.de>; Tue,  5 Apr 2022 09:23:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXfHv12hPz3f9h
	for <lists+openbmc@lfdr.de>; Tue,  5 Apr 2022 17:23:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kd9tf7bJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kd9tf7bJ; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXf6P2hM3z3bwr
 for <openbmc@lists.ozlabs.org>; Tue,  5 Apr 2022 17:14:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649142893; x=1680678893;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gVevFzET9ycXC2k6vi+6fMLZJPIT3zjfXlIjZtaxpYQ=;
 b=kd9tf7bJx5EeGrtiEDNgHLtg8kzppM8h+Y+FJeG9bY9oO2wyfBGjH0c0
 J3VywHLOaQfu/WXBZ9/F6VLS1q1qRn1Kw4Yf3X2hflNA2qvGrG8FoweBQ
 aqpJ0O5SlAVS8PLJhdzkGozNWtZYMt6GVXZrUX3RIrK55ZnkELt1Wqiln
 00q8Wbw5qC8iM+EVPC4N48eNszRb27or0ZYLGJhVb7UuNhabVMGAMT/8V
 MI3PJv8BXH0+doOdKuRpYCkxR69MQ8WqtmKhB1JJPkQ99d9g6Iczq1R63
 H8BEyTibYrKLM/0lWDPYspQSRP0cd006hiAG7hypqNm4ozDV6NrMvEygm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="248198081"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="248198081"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 00:13:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="641500699"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 00:13:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nbdNH-00DBjy-VC; Tue, 05 Apr 2022 10:13:11 +0300
Date: Tue, 5 Apr 2022 10:13:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
Message-ID: <YkvsB27Oj0kSmJRG@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
 <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
 <YiDNDsPWKyaIUlQR@smile.fi.intel.com>
 <CAKKbWA5FyCKTjEUw8rqtkoL7aw6f7Fa_QzcAkgaRnnUMTe0SKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKKbWA5FyCKTjEUw8rqtkoL7aw6f7Fa_QzcAkgaRnnUMTe0SKg@mail.gmail.com>
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
 Tali Perry <tali.perry1@gmail.com>, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com, bence98@sch.bme.hu,
 Arnd Bergmann <arnd@arndb.de>, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, yangyicong@hisilicon.com,
 semen.protsenko@linaro.org, jie.deng@intel.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 04, 2022 at 08:03:44PM +0300, Avi Fishman wrote:
> On Thu, Mar 3, 2022 at 4:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 03, 2022 at 02:48:20PM +0200, Tali Perry wrote:
> > > > On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > > > > From: Tali Perry <tali.perry1@gmail.com>
> > > > > >
> > > > > > In order to better handle spurious interrupts:
> > > > > > 1. Disable incoming interrupts in master only mode.
> > > > > > 2. Clear end of busy (EOB) after every interrupt.
> > > > > > 3. Return correct status during interrupt.
> > > > >
> > > > > This is bad commit message, it doesn't explain "why" you are doing these.
> >
> > ...
> >
> > > BMC users connect a huge tree of i2c devices and muxes.
> > > This tree suffers from spikes, noise and double clocks.
> > > All these may cause spurious interrupts to the BMC.

(1)

> > > If the driver gets an IRQ which was not expected and was not handled
> > > by the IRQ handler,
> > > there is nothing left to do but to clear the interrupt and move on.
> >
> > Yes, the problem is what "move on" means in your case.
> > If you get a spurious interrupts there are possibilities what's wrong:
> > 1) HW bug(s)
> > 2) FW bug(s)
> > 3) Missed IRQ mask in the driver
> > 4) Improper IRQ mask in the driver
> >
> > The below approach seems incorrect to me.
> 
> Andy, What about this explanation:
> On rare cases the i2c gets a spurious interrupt which means that we
> enter an interrupt but in
> the interrupt handler we don't find any status bit that points to the
> reason we got this interrupt.
> This may be a rare case of HW issue that is still under investigation.
> In order to overcome this we are doing the following:
> 1. Disable incoming interrupts in master mode only when slave mode is
> not enabled.
> 2. Clear end of busy (EOB) after every interrupt.
> 3. Clear other status bits (just in case since we found them cleared)
> 4. Return correct status during the interrupt that will finish the transaction.
> On next xmit transaction if the bus is still busy the master will
> issue a recovery process before issuing the new transaction.

This sounds better, thanks.

One thing to clarify, the (1) states that the HW "issue" is known and becomes a
PCB level one, i.e. noisy environment that has not been properly shielded.
So, if it is known, please put the reason in the commit message.

Also would be good to see numbers of "rare". Is it 0.1%?

> > > If the transaction failed, driver has a recovery function.
> > > After that, user may retry to send the message.
> > >
> > > Indeed the commit message doesn't explain all this.
> > > We will fix and add to the next patchset.
> > >
> > > > > > +     /*
> > > > > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > > > > +      * status bits are cleared.
> > > > >
> > > > > This does not explain why you hide the spurious interrupt.
> > > > >
> > > > > > +      */

-- 
With Best Regards,
Andy Shevchenko


