Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4DB95EE97
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 12:38:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsnFn0h2Jz30fd
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 20:38:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724668696;
	cv=none; b=f78+yTP/km+/dXwkzopV+ftNGV20OJs1WBShoGlm5t6YNmYP68olSIwcq5xm7sqoneL6Q7Yhuk89CKMXZt33+rgOi+rSTiLYjkOBeyBj3Nqh0DgdfsMaXJxRx7MzrD5VHe+b5TarzmvUBvedY10C2IVAI76/Wj4/3WGQs5CHe4XpsYf6yEQLsXWmoZgWbHs338UYSMVn6LUHn9OHNtuA/197uh89yYivF2uMkliDW2BLBdRxKIbMidUL0oMH9SxF8ncsBJ2pyl6e/x84CSIIMe0GEmsmXajZEueKc3piq8HXOqcEhBT+/M0C6JwxgqLLqbu/Ae/kKUBCCEQ0JDUbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724668696; c=relaxed/relaxed;
	bh=FVapjOKoN3a5GK3aVYQnkZ/OLhMrSxPcgVx2GlEcCwo=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization; b=ii60l6+kCRNQwUAEnb5O2HqxgLtNLAcJO+qRjVVrPmd8FTrKqcAe75B6zyFwMLmAxtskRfT3WwQE/yP2a7oLdIK0Qj/MVCh9jLBqSGGSQ+GjFbBXzKcYOeBO/WAfLbTP7Gx+SwAFq/JpflguQxGy09O3UtdBtaBXCBx22RtFOHww3R8gTmxTVdii6Q05NwFlqKUEckIiDndmx+L1IN3lrhak479zQSMrYPWVm10aH8ozojSMM6Dkw5++Fr+r05dJsX6Xp0Sv0QqG3RLCJceUuBlxPFJK3xKS8FWKKYg0FMzE7mxbHWiLadIg1Eta38fYAKem7TOypfqPnAsUGqGWvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBntFxIg; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBntFxIg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsnFg1cyXz2yFQ;
	Mon, 26 Aug 2024 20:38:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724668696; x=1756204696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERmA+CQJNVBk28DwXjuku6KyoJl+p00nopizk4PpeYE=;
  b=PBntFxIg4kMPmC+Z9+JQFPsQzSm1JZf0cT/ddDCgSI/qebnzU+z2c0nO
   u8DzhKnMrQNxcHEAgoeM7pFKG2FsuZsNXlfYBXoVjUvKc2xvUQQHSyHl/
   OnHP1IsN/+xmhOxqfnLEPA4CZxDYWn7BKhnTyuxt3BeZOdrovLoFITFy0
   aerX//LH1bMVs/H3q4dHFJ7MyGkaTqQaLoCve5S1zUFnvzKFLjyZbYXav
   h08H2+auHsla6sDECi/82fUiSzrWPqUZskEWvLT3TCt9m7+V7xtF249iZ
   mM4g22cm4iEV4x7CB7Oe1ahv/UgvMZWLRLWs2N3TUZsZDNdXc4wrIvjpu
   w==;
X-CSE-ConnectionGUID: y24u5ljdSkq9QNCOHVq2+w==
X-CSE-MsgGUID: R9XqYq1ASYu/m0cGuU/qgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22670095"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="22670095"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:38:11 -0700
X-CSE-ConnectionGUID: xDE6/mNfTlStamQ231jlHw==
X-CSE-MsgGUID: qETryUhjTlmdnzut8dKMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="66643611"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:38:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1siX6q-00000001pog-41CB;
	Mon, 26 Aug 2024 13:38:04 +0300
Date: Mon, 26 Aug 2024 13:38:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <ZsxbDK25mJ0sjcQy@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
 <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
 <OS8PR06MB7541A23130F469357B7FE5F4F28B2@OS8PR06MB7541.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB7541A23130F469357B7FE5F4F28B2@OS8PR06MB7541.apcprd06.prod.outlook.com>
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2024 at 07:50:24AM +0000, Ryan Chen wrote:
> > On Fri, Aug 23, 2024 at 06:23:54AM +0000, Ryan Chen wrote:
> > > > On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > > > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > > > > > > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > > > > > > > +		i2c_bus->buf_base =
> > > > > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > > > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > > > > > +		else
> > > > > > > > > +			i2c_bus->mode = BYTE_MODE;
> > > > > > > >
> > > > > > > > What's wrong with positive conditional? And is it even
> > > > > > > > possible to have NULL here?
> > > > > > > >
> > > > > > > Yes, if dtsi fill not following yaml example have reg 1, that
> > > > > > > will failure at buffer
> > > > > > mode.
> > > > > > > And I can swith to byte mode.
> > > > > > >
> > > > > > > reg = <0x80 0x80>, <0xc00 0x20>;
> > > > > >
> > > > > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > > > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> > > > > I will update to following.
> > > > > 		if (IS_ERR(i2c_bus->buf_base))
> > > > > 			i2c_bus->mode = BYTE_MODE;
> > > > > 		else
> > > > > 			i2c_bus->buf_size = resource_size(res) / 2;
> > > > >
> > > > > > 2) Why _NULL?
> > > > > 	If dtsi file is claim only 1 reg offset. reg = <0x80 0x80>; that
> > > > > will goto byte
> > > > mode.
> > > > > 	reg = <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > > > > 	due to 2nd is buffer register offset.
> > > >
> > > > I have asked why IS_ERR_OR_NULL() and not IS_ERR().
> > > >
> > > OH, I will doing by this.
> > > 		if (IS_ERR_OR_NULL(i2c_bus->buf_base))
> > 
> > The question about _NULL remains unanswered...
> Sorry, I may not catch your point.
> So, Do you mean I should passive coding by following?

No. I already mentioned that in one of the previous mails.
Why do you use IS_ERR_OR_NULL() and not IS_ERR()?

You should understand your code better than me :-)

> If (i2c_bus->buf_base > 0)
> 	i2c_bus->buf_size = resource_size(res) / 2;
> else
>     i2c_bus->mode = BYTE_MODE;
> 
> > > 			i2c_bus->mode = BYTE_MODE;
> > > 		else
> > > 			i2c_bus->buf_size = resource_size(res) / 2;

-- 
With Best Regards,
Andy Shevchenko


