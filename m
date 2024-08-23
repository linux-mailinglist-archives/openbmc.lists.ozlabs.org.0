Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778495CEC0
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 16:04:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr1zM2F7Rz30gG
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2024 00:04:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724421878;
	cv=none; b=Q5cPdrPld2Vk3zULCc/Efd2eSuI09b0fNRJOix5MNlGL7/MRCxLw4uWLZUpkIU0kVb6jDJc2UxHeBl6ktfObonxGSU+oqMGBZDHOR9CBN9S8BXoFD0ZDHPM4WoV21XwKak3klsMGuUCqMvgGwB+viyIsBA24U2EP7qwEIxMjcHaDe70Spqwjz4B2Q/dOVjNTNT9+qnPRioYsRIILZ6wq7cZ+Y/8tMPSyQRNt5aZg4YHtuKK+jdYZd9Xu7CJpPWNn96p8LBgJgdhq8MmQZSkPpIIyrkghd30Za2+W6ByOu8IAv3ySg67NvYq46LUgUgFbCuDv5tOoPYvbEMoWsfipbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724421878; c=relaxed/relaxed;
	bh=LMqUEed/sXqW/W8xHRqkME37+Jf/EyyC1Z0y4foryX0=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization; b=CQFJSoCx+WHMvxDZevfMDA7wojDleGW0TgWd7F0mfACDtBhGYf8OyfmFUXOFwt70KhKKdAVEqxchMeb7mbRogOORg/+MMPm0NItmxHdXplJ2xl/Sm1zRE9nNDa8HUom86ZwdmWQGGkZCo4+gpqkvET9wrg+r/zwNyPXuaDKVXjQeM9Gki2MEVHi0Gzc4hwvpx55z7j30onVyjUWyPtnsNKQDe1Uk76FMjEAVnpKVzdUcP/XRMz2lAHjZ12ddR0R9lX0rL1F/+L3o/0E4Uqk5gXZo5S/YzFTVaijMG54M4+9wE7+FQpts93itsn/JcLumCGgTx6z37wFi5JVLl6RCMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IZgH/eBw; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IZgH/eBw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr1z80MxRz2ygY;
	Sat, 24 Aug 2024 00:04:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421876; x=1755957876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RarjRljA012H8GjcXE0795+YxS0vJ/uKSKtUTKIt+3k=;
  b=IZgH/eBwLNPigyJF/STffyJKueCbMLwPqqkImafrfdsD/I5F7w2oDdZo
   IoxbXmp9kMhWOO/FOYimkXtymcC0iAadF2JgmKvBfcTpt5n1ai9kPm99c
   gjn6cSH74afK2wbhJkC0O8dFpkbwv934XU/SZi2L9S5pZ28pic07DBiup
   nV02LYBFzav4cJG0MyVSVvi+0xKIpd+1Wbyz6yDJ2nTTYQL1gEVqW44Ze
   14lCPHUE9X5C/P/39PAhlRCN6MayOmN0ahOlvmQGIDX6H0WTZnpnBCtKg
   KSJU1AVPCzlc85hARNAkm6oTkInZ8iEaWJTD54xdKLTzysEWMsrt19uvh
   g==;
X-CSE-ConnectionGUID: EQL1VrAPTD6E++0plPh/xw==
X-CSE-MsgGUID: aTNWHhcnQH6p7b34vpQabg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23016214"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23016214"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:03:59 -0700
X-CSE-ConnectionGUID: 5SVtqCkpR1OhiuzSknEhTQ==
X-CSE-MsgGUID: o2GSPqwpSdKx8bDzLi+utw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66126708"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:03:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUsq-00000000oWR-0s0k;
	Fri, 23 Aug 2024 17:03:20 +0300
Date: Fri, 23 Aug 2024 17:03:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
 <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
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

On Fri, Aug 23, 2024 at 06:23:54AM +0000, Ryan Chen wrote:
> > On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > > > > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > > > > > +		i2c_bus->buf_base =
> > > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > > > +		else
> > > > > > > +			i2c_bus->mode = BYTE_MODE;
> > > > > >
> > > > > > What's wrong with positive conditional? And is it even possible
> > > > > > to have NULL here?
> > > > > >
> > > > > Yes, if dtsi fill not following yaml example have reg 1, that will
> > > > > failure at buffer
> > > > mode.
> > > > > And I can swith to byte mode.
> > > > >
> > > > > reg = <0x80 0x80>, <0xc00 0x20>;
> > > >
> > > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> > > I will update to following.
> > > 		if (IS_ERR(i2c_bus->buf_base))
> > > 			i2c_bus->mode = BYTE_MODE;
> > > 		else
> > > 			i2c_bus->buf_size = resource_size(res) / 2;
> > >
> > > > 2) Why _NULL?
> > > 	If dtsi file is claim only 1 reg offset. reg = <0x80 0x80>; that will goto byte
> > mode.
> > > 	reg = <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > > 	due to 2nd is buffer register offset.
> > 
> > I have asked why IS_ERR_OR_NULL() and not IS_ERR().
> > 
> OH, I will doing by this.
> 		if (IS_ERR_OR_NULL(i2c_bus->buf_base))

The question about _NULL remains unanswered...

> 			i2c_bus->mode = BYTE_MODE;
> 		else
> 			i2c_bus->buf_size = resource_size(res) / 2;

-- 
With Best Regards,
Andy Shevchenko


