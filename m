Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAD298EF5C
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 14:39:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKB886T73z3c7b
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 22:39:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727959173;
	cv=none; b=mEtewm+e1bKdwhJyyNnOIPa33gc0osz/ZM/aDe4lOQMxxf+U6kdTKbjzUw738RZ16tg7JYYKmar2X08U8T3MJn0HM5GfXAQm1mEKfaYbG4jM7O4QG7Et4lSVdK4hARBwmxLdJEW5AKrX62MN6DMV5hBDpdULpjTFO7HIynu0sHLm+pTbPEZ3hn5l+Y4Mep7aWL5Dq1NUA5wrBpMpS6OXfXewk7Pe8nzbOf6i+IrGCMFq7aLQTEasCLvwT5K3sYt3nZ+HRgULLJZZM/OKVf+ZQnDEW1p+kfRsyFlOoxUapJioRKIX+jqQb3JbjFeClcxP32IG66WVVOtrBEwvRadOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727959173; c=relaxed/relaxed;
	bh=bqoVeqJgqT0M1flxfT93zxVXlDysL5pQlp7hNngjZ0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T62YqaaTf/924nkgIicQnUVoXlEjrzsr8dTLutm9+17ma/NAcLnlxesC99cFTH76np1+ncab/i90YAOjeRKVCxrGsG6l4pTBmLeEyL4BdV7MTqvpDgrQV6/NqSUMCX2gy4/iGhiBaHfOYWPgXEPUycUNp6iwFHoC3cP6V+zZJes57SJmqikna+iHDoBe4zzVItkreJ0rNObPbUPyjZ5NPIppXxks7ODJVLhNSgaROWn9/dO40ZpMZss+WKmTX3EpClKCrGk7cBC69Sx5Xjoa1sTVt/N4CMIUqTSERaIjuElACwA7gVoVnV8FfFJBFZwlu4dGPO2bYvhw8h93IwrwmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iSKhYUoB; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iSKhYUoB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKB814Nklz2yR3;
	Thu,  3 Oct 2024 22:39:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727959170; x=1759495170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJqZlWZyRRWoe9bZ1pTGj+NsxagcVSsJs5dIspW8QMY=;
  b=iSKhYUoBLVw9mB80jX53I/XjRaetvMDbPP3WT7j5+5RdUoexaG3sH4jw
   GGL3bjQCWQnV0gWANCPG+2KiQvdZbB6fiBKrhJvEZU6ZB4wvA5gPutOQw
   MAJDvKwv08GNaHpgxhH2BIEWAlqwgJnO9YhOqo84fN8mJNuAHf35kevLC
   /1Y0SXcYmHRK65XYCmwp/T8eoYXP1gLf7lNkbJUGEmti0a96KB3HKJmmb
   Pzp7dr9fQmIqUQDzBCC6FEbrFwqaU7XJfWtfuk/TafU+w73LeSo7Unob6
   8zffxnmLK9es/W3JAPbYsXUcPYLw7kceXXI/IuOX0NjBQ7lR6jnwtjS/i
   w==;
X-CSE-ConnectionGUID: o0b/XQ4xTFqwIStH3HbzsA==
X-CSE-MsgGUID: bdQA9fGIQvKPXcEzMSj8kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="14766781"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="14766781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:39:25 -0700
X-CSE-ConnectionGUID: VZ4FQ9ZJTiukwSGcRxIw8w==
X-CSE-MsgGUID: Q+m6TP+eSkKye7Bb4NxYAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74188410"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 05:39:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1swL70-0000000G8x5-0KUx;
	Thu, 03 Oct 2024 15:39:18 +0300
Date: Thu, 3 Oct 2024 15:39:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Message-ID: <Zv6QdUuiUFvXjcd4@smile.fi.intel.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
 <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
 <dun5dterlkikft4p2yuuebb2e4nyzed7xeofmeivzldeardhmf@kzv3iokk6cxn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dun5dterlkikft4p2yuuebb2e4nyzed7xeofmeivzldeardhmf@kzv3iokk6cxn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 03, 2024 at 02:20:54PM +0200, Andi Shyti wrote:
> On Thu, Oct 03, 2024 at 01:15:50PM GMT, Andy Shevchenko wrote:
> > On Thu, Oct 03, 2024 at 03:41:57AM +0000, Ryan Chen wrote:
> > > > On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:

...

> > > > Is it possible to switch to new terminology wherever it's possible?
> > > > I.e. master --> controller, slave --> target. See, for example, f872d28500bd
> > > > ("i2c: uniphier-f: reword according to newest specification").
> > > > 
> > > Just for cover latter? Or I should modify for each patches commit message?
> > > Or entire i2c driver statement need switch to target?
> > 
> > I believe everywhere, where it applies: driver code, comments, documentation,
> > commit messages...
> 
> If the datasheet refers to a register, state, or any other
> hardware property as master/slave, we should retain the
> master/slave terminology. Otherwise, we should follow the i2c and
> smbus specifications and use controller/target.

Indeed, makes sense. Thank you, Andi, for the corrections!

-- 
With Best Regards,
Andy Shevchenko


