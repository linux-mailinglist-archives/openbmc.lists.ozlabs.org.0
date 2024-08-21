Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18282959AD0
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2024 13:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpl9j1WL7z30Tq
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2024 21:54:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lSfKbVv+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wpl9W3NtJz2yft;
	Wed, 21 Aug 2024 21:54:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724241248; x=1755777248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sjdPydC3mw3cQ0ag9TWeR/G//kheaveQbBW+JwadEik=;
  b=lSfKbVv+e77Z/5tUu7OC3LJPV02zRFXzy7IJThZUZfCaoHtHbXJP1epm
   v24kCvuUETXertGPbe43IPrP/k34Dr8Kx3isvJozTMbaWSJKLnrwUf/pQ
   Vii9zukfJxK/BsCNaI21AEVEqOWU4lMiQz+UzY1WbOc+L0sTNhu81j0h0
   9uFNSaCIlhoQNY4Tw/vyPWYw1j66Vx370+fcEqzCFvO10keBrpJyeiCBn
   bMu3Rxw0/fDpUPMXELMuWuesJWEoppLtbt6EoDikc2WqYMZZw8oLQHi+v
   fitrqnilsTXHROJ45SkqBEaUToDrjjJSZ3d/gIEIe+S3qLI6MQG5XR+qu
   w==;
X-CSE-ConnectionGUID: wMqbGiIaTi6IE9Z7IeBqxA==
X-CSE-MsgGUID: nIip1LtiRyuZZTv1l6Ygxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22757631"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22757631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 04:54:03 -0700
X-CSE-ConnectionGUID: za5Q+RdERouf6WLiIWTu2w==
X-CSE-MsgGUID: UG05ftq5TpqZ4AU0mZJdtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61047373"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 04:53:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sgjuW-000000003L9-03HD;
	Wed, 21 Aug 2024 14:53:56 +0300
Date: Wed, 21 Aug 2024 14:53:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
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

On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > +	/* Check 0x14's SDA and SCL status */
> > > +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> > AST2600_I2CC_SCL_LINE_STS)) {
> > > +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base +
> > AST2600_I2CM_CMD_STS);
> > > +		r = wait_for_completion_timeout(&i2c_bus->cmd_complete,
> > i2c_bus->adap.timeout);
> > > +		if (r == 0) {
> > > +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > +			ret = -ETIMEDOUT;
> > > +		} else {
> > > +			if (i2c_bus->cmd_err) {
> > > +				dev_dbg(i2c_bus->dev, "recovery error\n");
> > > +				ret = -EPROTO;
> > > +			}
> > > +		}
> > > +	}
> > 
> > ret is set but maybe overridden.
> 
> If will modify by following.
> 		if (r == 0) {
> 			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> 			ret = -ETIMEDOUT;
> 		} else if (i2c_bus->cmd_err) {
> 			dev_dbg(i2c_bus->dev, "recovery error\n");
> 			ret = -EPROTO;
> 		}
> If no error keep ret = 0;

It doesn't change the behaviour. Still ret can be overridden below...

> > > +	/* Recovery done */
> > 
> > Even if it fails above?
> 
> This will keep check the bus status, if bus busy, will give ret = -EPROTO;
> 
> > > +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> > > +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> > > +		ret = -EPROTO;

...here.

> > > +	}
> > > +
> > > +	/* restore original master/slave setting */
> > > +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > > +	return ret;

...


> > > +		i2c_bus->master_dma_addr =
> > > +			dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf,
> > > +				       msg->len, DMA_TO_DEVICE);
> > 
> > > +		if (dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr))
> > {
> > > +			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg,
> > false);
> > > +			i2c_bus->master_safe_buf = NULL;
> > 
> > > +			return -ENOMEM;
> > 
> > Why is the dma_mapping_error() returned error code shadowed?
> 
> Sorry, please point me why you are think it is shadowed?
> As I know dma_mapping_error() will return 0 or -ENOMEM. So I check if it is !=0.
> Than return -ENOMEM. 

First of all, it is a bad style to rely on the implementation details where
it's not crucial. Second, today it may return only ENOMEM, tomorrow it can
return a different code or codes. And in general, one should not shadow an
error code without justification.

> > > +		}

...

> > > +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);
> > 
> > Why do you need this table before _probe()? Isn't the only user is below?
> 
> It is for next generation table list. Do you suggest remove it?

My question was regarding to the location of this table in the code, that's it,
no other implications.

...

> > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > +		i2c_bus->buf_base =
> > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > +		else
> > > +			i2c_bus->mode = BYTE_MODE;
> > 
> > What's wrong with positive conditional? And is it even possible to have NULL
> > here?
> > 
> Yes, if dtsi fill not following yaml example have reg 1, that will failure at buffer mode.
> And I can swith to byte mode. 
> 
> reg = <0x80 0x80>, <0xc00 0x20>;

I was asking about if (!IS_ERR_OR_NULL(...)) line:
1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
2) Why _NULL?

> > > +	}

...

> > > +	strscpy(i2c_bus->adap.name, pdev->name, sizeof(i2c_bus->adap.name));
> > 
> > Use 2-argument strscpy().
> Do you mean strscpy(i2c_bus->adap.name, pdev->name); is acceptable?

Yes. And not only acceptable but robust for the copying to the [string] arrays.

...

> > > +	i2c_bus->alert_enable = device_property_read_bool(dev, "smbus-alert");
> > > +	if (i2c_bus->alert_enable) {
> > > +		i2c_bus->ara = i2c_new_smbus_alert_device(&i2c_bus->adap,
> > &i2c_bus->alert_data);
> > > +		if (!i2c_bus->ara)
> > > +			dev_warn(dev, "Failed to register ARA client\n");
> > > +
> > > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER
> > | AST2600_I2CM_SMBUS_ALT,
> > > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > > +	} else {
> > > +		i2c_bus->alert_enable = false;
> > > +		/* Set interrupt generation of I2C master controller */
> > > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> > > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > > +	}
> > 
> > I2C core calls i2c_setup_smbus_alert() when registering the adapter. Why do
> > you need to have something special here?
> The ast2600 i2c support smbus alert, and according my reference.
> If enable alert, that will need i2c_new_smbus_alert_device for alert handler.
> When interrupt coming driver can use this hander to up use i2c_handle_smbus_alert
> And update layer will handle alert.
> Does I mis-understand. If yes, I will remove this in next.

Have you seen i2c_new_smbus_alert_device() ?

-- 
With Best Regards,
Andy Shevchenko


