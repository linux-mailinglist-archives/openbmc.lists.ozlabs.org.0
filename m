Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BC77B9CD8
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 13:57:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TYVkM8ey;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1VRC3Gtzz3vl6
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 22:57:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TYVkM8ey;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1VQW0Hj9z3dK7;
	Thu,  5 Oct 2023 22:56:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696506995; x=1728042995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tXYScCQloVsf+4gJdEXKIeLEpV9gui3O8J54Ug/L2KY=;
  b=TYVkM8eyFdshy4dYGD9G6tYR2ApH5jILwfOpJ7B2mhQCxiscKqyNEP/2
   bezugY5u1XdlUOqJS9ts/291TZcQUHJrEYI2dJQQ9PttLbvewXal3tRjJ
   xFbptbYTBlvn6HJVT9vpbA5D0ftuwbqjBWRODMMYGMaDa+MkN0KG08gKo
   aHroYdyskHnS2bQmgCrvkjfYqxxHiZEe2NCRQTU+ZJ/YxQxbdoGVizB81
   Ie31OVmYIXdAXlvY0347vVbxzTsCHDucGHF1JTPaGw8M2dU5FACYBBX47
   aZAQuMx3K8KUQ+b5gTwaQ0+3TStygXdnCY+vDHFDOhbGgIqqD9nW3+Vrj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368546544"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="368546544"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 04:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701629587"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="701629587"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 04:56:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qoMxl-000000030t3-0Z6W;
	Thu, 05 Oct 2023 14:56:17 +0300
Date: Thu, 5 Oct 2023 14:56:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <ZR6kYMOB67+WJonG@smile.fi.intel.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
 <SEZPR06MB5269831E049E2267661F181FF2E8A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <ZPcXJ4adUNMv4LDr@smile.fi.intel.com>
 <SEZPR06MB52699EC5463397F4BFF244DBF2CAA@SEZPR06MB5269.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB52699EC5463397F4BFF244DBF2CAA@SEZPR06MB5269.apcprd06.prod.outlook.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Brendan Higgins <brendan.higgins@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Jean Delvare <jdelvare@suse.de>, Andi Shyti <andi.shyti@kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, "=linux-kernel@vger.kernel.org" <=linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, William Zhang <william.zhang@broadcom.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Andrew Jeffery <andrew@aj.id.au>, Wolfram Sang <wsa@kernel.org>, Tyrone Ting <kfting@nuvoton.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 05, 2023 at 06:21:35AM +0000, Ryan Chen wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Tuesday, September 5, 2023 7:55 PM
> > On Tue, Sep 05, 2023 at 06:52:37AM +0000, Ryan Chen wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Friday, July 14, 2023 4:55 PM
> > > > On Fri, Jul 14, 2023 at 03:45:22PM +0800, Ryan Chen wrote:

...

> > > 			divisor = DIV_ROUND_UP(base_clk[3],
> > i2c_bus->timing_info.bus_freq_hz);
> > > 			for_each_set_bit(divisor, &divisor, 32) {
> > 
> > This is wrong.
> > 
> > > 				if ((divisor + 1) <= 32)
> > > 					break;
> > 
> > > 				divisor >>= 1;
> > 
> > And this.
> > 
> > > 				baseclk_idx++;
> > 
> > > 			}
> > 
> > for_each_set_bit() should use two different variables.
> 
> Will update by following.
> 
> for_each_set_bit(bit, &divisor, 32) {
>     divisor >>= 1;
>     baseclk_idx++;
> }

It's unclear what you are trying to achieve here as the code is not equivalent
to the above.

> > > 		} else {
> > > 			baseclk_idx = i + 1;
> > > 			divisor = DIV_ROUND_UP(base_clk[i],
> > i2c_bus->timing_info.bus_freq_hz);
> > > 		}
> > > 	}

...

> > > 	divisor = min_t(unsigned long, divisor, 32);
> > 
> > Can't you use min()? min_t is a beast with some subtle corner cases.
> > 
> Will update to 
> divisor = min(divisor, (unsigned long)32);

No, the idea behind min() is that _both_ arguments are of the same type,
the proposed above is wrong.

-- 
With Best Regards,
Andy Shevchenko


