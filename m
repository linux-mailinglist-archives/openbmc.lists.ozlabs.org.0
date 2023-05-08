Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C56FB03D
	for <lists+openbmc@lfdr.de>; Mon,  8 May 2023 14:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFLST3dJCz3cdt
	for <lists+openbmc@lfdr.de>; Mon,  8 May 2023 22:38:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dc6j0gNJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dc6j0gNJ;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFLRs3X0Rz3cBK;
	Mon,  8 May 2023 22:38:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683549497; x=1715085497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TGcBs2WMT86YIl2FW8BGGb2rDomhZlvsCn9sqxbnMAI=;
  b=Dc6j0gNJTIwYhvCh3Sd5IMUk4HqvY8FE6ZWpCnHQayfDiE5Sd0ZfCitH
   OOk5Vt6mlvKsjhb3wOe1Ptxv4YNENmmj/fvXycTdWvky6VhqK3kYhOXX1
   Gx/n6JgAqea+yY4shDxbSRmCQ8kfUDwjGfm1++9J5EEc08JV+r08WL5/s
   rRvzIYqvlM3yaJjgJm+zuThunfZJKL+Il0FopFP1rc3uF/aREicj4ziWn
   +qNbVRU7HkbbTD5/0Zt0G5eEaUkNjEdYCKBOca0s5NjPLhoTlx0TbBodj
   3OJFJrjTmfqQ0ecnzmBHFZkkN/NuExyC98suylRC2jictvxQMrBMJr9de
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="377724350"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="377724350"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822653340"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="822653340"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 08 May 2023 05:38:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pw07t-00ArL0-0V;
	Mon, 08 May 2023 15:38:01 +0300
Date: Mon, 8 May 2023 15:38:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v11 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <ZFjtKNtR3zveNIvY@smile.fi.intel.com>
References: <20230430041712.3247998-1-ryan_chen@aspeedtech.com>
 <20230430041712.3247998-3-ryan_chen@aspeedtech.com>
 <ZFFzRL/+73Ftix4Q@smile.fi.intel.com>
 <SEZPR06MB526906C3DAFFE0A8FA924AA7F2709@SEZPR06MB5269.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB526906C3DAFFE0A8FA924AA7F2709@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On Sun, May 07, 2023 at 02:21:10AM +0000, Ryan Chen wrote:
> > On Sun, Apr 30, 2023 at 12:17:12PM +0800, Ryan Chen wrote:

...

> > > +#define AST2600_GLOBAL_INIT				\
> > > +			(AST2600_I2CG_CTRL_NEW_REG |	\
> > > +			AST2600_I2CG_CTRL_NEW_CLK_DIV)
> > 
> > Make just a one TAB and put the last two lines on the single one.
> 
> Update by following. 
> 
> #define AST2600_GLOBAL_INIT		\
> 	(AST2600_I2CG_CTRL_NEW_REG |	\
> 	 AST2600_I2CG_CTRL_NEW_CLK_DIV)

As I mentioned the last two can occupy a single line.

...

> > > +	/* send start */
> > > +	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
> > > +		i2c_bus->msgs_index, msg->flags & I2C_M_RD ? "read" : "write",
> > 
> > str_read_write() ?
> Sorry do you mean there have a function call str_read_write?
> Can you point me where it is for refer?

string_helpers.h.

> > > +		msg->len, msg->len > 1 ? "s" : "",
> > > +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);

...

> > > +				if (--i % 4 != 3)
> > > +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
> > 
> > The above code is ugly. Can you think about it and write in a better way?
> Sorry, that is because the register only support for 4 byte align write.
> That the reason I need put for byte write to 4 byte align write.

Yes, that's fine. The problem is in _how_ the driver does it. We have a lot of
helpers in the kernel to access unaligned data.

...

> > > +	return ast2600_i2c_master_irq(i2c_bus) ? IRQ_HANDLED : IRQ_NONE;
> > 
> > IRQ_RETVAL() ?
> Sorry, most return is handled or not handled.
> Do you mean replace it just " return IRQ_RETVAL(ret);"

Have you had a chance to look in the implementation of IRQ_RETVAL() ?
I believe if you do, you will find the answer to your question.

...

> > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > +		if (res && resource_size(res) >= 2) {
> > > +			i2c_bus->buf_base = devm_ioremap_resource(dev, res);
> > > +
> > > +			if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > +				i2c_bus->buf_size = resource_size(res) / 2;
> > > +		} else {
> > > +			i2c_bus->mode = BYTE_MODE;
> > > +		}
> > > +	}
> > 
> > Can be done without additional checks and with a simple call to
> > devm_platform_ioremap_resource(). No?
> > 
> Sorry, I can't catch your point, can you guide me more about it?

	if (BUFF_MODE) {
		void __iomem buf_base;

		buf_base = devm_platform_ioremap_and_get_resource(pdev, 1, &res);
		if (IS_ERR(buf_base))
			mode = BYTE_MODE;
		else {
			->buf_base = buf_base;
			->buf_size = ...
		}
	}

...

> > > +	ret = of_property_read_u32(dev->of_node, "clock-frequency",
> > &i2c_bus->bus_frequency);
> > > +	if (ret < 0) {
> > > +		dev_warn(dev, "Could not read clock-frequency property\n");
> > > +		i2c_bus->bus_frequency = 100000;
> > > +	}
> > 
> > There are macro for standard speeds. Moreover, there is a function to parse
> > properties, no need to open code.
> > 
> Will update
> ret = of_property_read_u32(dev->of_node, "clock-frequency", &bus_freq);
> if (ret < 0) {
>     dev_warn(dev, "Could not read clock-frequency property\n");
>     i2c_bus->bus_frequency = I2C_SPEED_STANDARD;
> } else {
>     i2c_bus->bus_frequency = bus_freq;
> }

No, just use the I2C core API to fill this property in the specific i2c_timings
structure.

-- 
With Best Regards,
Andy Shevchenko


