Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0018096296E
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 15:56:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv5YC0kPYz30Tm
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 23:56:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724853367;
	cv=none; b=jAUOIJ2QhIhbnomNCS2drlu3K2q/lYdKolliMdQEiMo9YdOj3saqLT0GAkNEw4kXcwU/rthYzSGf80TdVrG5FH84F5vG7ueYfEiHMqz4bqkjwBUxKIsfXEcdcmjl5RlAbd9S6obZxu0/iojDmsaR6mUXxhzwB3W8ystUOk0QxpT+HJvq3/l8P2YZmAdGsbYake+JujF43Ooj0svn4hbw8lI2dtscZ7Y3fBzPA9Q5l/VYB3EGdwdEyMjAlGW5fRVu3VzCWHbvP4dkFTgBO9FfWamyZg3minqqDTjccGIJA6janDEmgvu95UFwxzMrg3lixtLapsQuMdR7/AoEmDLBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724853367; c=relaxed/relaxed;
	bh=n+Xcd1aQmMXHIqrIOpw5Igr0OUJGUdufbIbWAk0nJe0=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization; b=V/jFo84eHxhKiqocTJ/w5IM8gACJCHKD9PNd8mTLdf/p8eXdUqUKCY0w6cNC0cRC++SHQPJU+7hQw2j8gZVkQQMZO9eNbxE2tsCMmv3drq6tz7c8i6f1O5CUwleDmcCBtN8DpalunleOIUIajpqmlqg8oHB3xzgc9/u87lJtYG5omLJD8RAdVTD9DDzg8r36d6w5XBuxYrJl0lf2kY6fMQ9smyDf1HyInyjU3fxT83/P14p9wuG8eddxbUdli9KnpG/+7FTn5NQl3VggNy+KugehivJH+rsV0DoYOw5nX5Sgpe8TSc2AGjZti9L9YQsGb/5GjdiDXHNXj4ybTPz7mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WTDgAFAD; dkim-atps=neutral; spf=none (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WTDgAFAD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv5Y04wQ8z2yVv;
	Wed, 28 Aug 2024 23:56:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724853365; x=1756389365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0VzRvvBmgVfm22p7yRHWjS2uaHYDwDvXSohq3OgN8+4=;
  b=WTDgAFAD4QAuB02LMGhWNehQji14QyKhcgzzxQcZRUuOZ5Z1ekM2ZB50
   xhtCu5AOLAnWYwSutCDNZKPLYwjaPfohXVwA8nKIelChbk1GFhzUEOoYC
   7s4PdNQLlX783aDIxFzYfmKb+paEG/wbMooeINyZFrq7GTAAQM1AESLBg
   dH9pIhqhinZ9fkWIO8xptOP9ebwYAWmVs17q0opOZZPCuQZlf065Sb9LN
   d1f6q4aGttqwTN/hedTx2L2xL+1bv6SOphpmqjZYvLEGjEEqt/fTs5R5q
   gB+hbAtRsByg6yZxUfHCttUSgYVrISe1IDV//nrapLKH0UVW9gwBw116l
   w==;
X-CSE-ConnectionGUID: NkjmJFrVSq+NpaMStPTbmQ==
X-CSE-MsgGUID: iAuRTvPJQmOYhWs4sJoD3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34043162"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="34043162"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 06:55:59 -0700
X-CSE-ConnectionGUID: 7KbLavxjTum9E1alb/+xbQ==
X-CSE-MsgGUID: JxeN9lHhRK+ocKrrC6ERxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67899095"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 06:55:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjJ9M-00000002fDD-1iIN;
	Wed, 28 Aug 2024 16:55:52 +0300
Date: Wed, 28 Aug 2024 16:55:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <Zs8saJYtCp6bO-3k@smile.fi.intel.com>
References: <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
 <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsiWp5ENQ0BeBjMn@smile.fi.intel.com>
 <OS8PR06MB7541A23130F469357B7FE5F4F28B2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsxbDK25mJ0sjcQy@smile.fi.intel.com>
 <OS8PR06MB75416ED990B2A32F98266A1DF2952@OS8PR06MB7541.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB75416ED990B2A32F98266A1DF2952@OS8PR06MB7541.apcprd06.prod.outlook.com>
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

On Wed, Aug 28, 2024 at 02:34:43AM +0000, Ryan Chen wrote:
> > On Mon, Aug 26, 2024 at 07:50:24AM +0000, Ryan Chen wrote:
> > > > On Fri, Aug 23, 2024 at 06:23:54AM +0000, Ryan Chen wrote:
> > > > > > On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > > > > > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > > > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > > > > > > > > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > > > > > > > > > +		i2c_bus->buf_base =
> > > > > > > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > > > > > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > > > > > > > +		else
> > > > > > > > > > > +			i2c_bus->mode = BYTE_MODE;
> > > > > > > > > >
> > > > > > > > > > What's wrong with positive conditional? And is it even
> > > > > > > > > > possible to have NULL here?
> > > > > > > > > >
> > > > > > > > > Yes, if dtsi fill not following yaml example have reg 1,
> > > > > > > > > that will failure at buffer
> > > > > > > > mode.
> > > > > > > > > And I can swith to byte mode.
> > > > > > > > >
> > > > > > > > > reg = <0x80 0x80>, <0xc00 0x20>;
> > > > > > > >
> > > > > > > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > > > > > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> > > > > > > I will update to following.
> > > > > > > 		if (IS_ERR(i2c_bus->buf_base))
> > > > > > > 			i2c_bus->mode = BYTE_MODE;
> > > > > > > 		else
> > > > > > > 			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > > >
> > > > > > > > 2) Why _NULL?
> > > > > > > 	If dtsi file is claim only 1 reg offset. reg = <0x80 0x80>;
> > > > > > > that will goto byte
> > > > > > mode.
> > > > > > > 	reg = <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > > > > > > 	due to 2nd is buffer register offset.
> > > > > >
> > > > > > I have asked why IS_ERR_OR_NULL() and not IS_ERR().
> > > > > >
> > > > > OH, I will doing by this.
> > > > > 		if (IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > >
> > > > The question about _NULL remains unanswered...
> > > Sorry, I may not catch your point.
> > > So, Do you mean I should passive coding by following?
> > 
> > No. I already mentioned that in one of the previous mails.
> > Why do you use IS_ERR_OR_NULL() and not IS_ERR()?
> > 
> > You should understand your code better than me :-)
> Understood, I will change to 

OK!

> 	if (IS_ERR(i2c_bus->buf_base))
> 		i2c_bus->mode = BYTE_MODE;
> 	else
> 		i2c_bus->buf_size = resource_size(res) / 2;
> 
> > > If (i2c_bus->buf_base > 0)
> > > 	i2c_bus->buf_size = resource_size(res) / 2; else
> > >     i2c_bus->mode = BYTE_MODE;
> > >
> > > > > 			i2c_bus->mode = BYTE_MODE;
> > > > > 		else
> > > > > 			i2c_bus->buf_size = resource_size(res) / 2;

-- 
With Best Regards,
Andy Shevchenko


