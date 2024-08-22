Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D56CE95B6E8
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 15:34:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqPLT4C6jz30T3
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 23:34:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724333644;
	cv=none; b=czJJIif9z1PHF1aWuqF6QlaCVHw05r1CcuVJ6jo+fLckJLyOPMCVIeElo1AOt61jv56H4/xShVRwpQy9B93xzJJegyzW5ABLmuBIv/JhUew5s8ywpKRwOdmOsNGzPf0Sz9v+sFlujq3/qkrT58PfaKfs68r9rW2TUq8aZLLpTVm9h41aFKiHBmpdOz5TrVA+ZlbMqzL0No1iPotx7e6G2oey0PUFzPqavadSlMx7EeComg6o4gJKldbxZNQCaUoDnlP7EdlDl/2+12P3a6wVzRWzzn/ZC0UsiGqyA0wAXsA8GCSiew1a44vrlYWvEoTHJ4dwZXUWdFn1wI6Cem8gLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724333644; c=relaxed/relaxed;
	bh=bi1QBbh7hAzIoULG/eq5q7HY53X3VoG8tvBZ+pRxdF4=;
	h=X-Greylist:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization; b=N/SvV0egHEPshCmdXsv3O+cVA0URtTvs8KxLDHSTfUbUEP/AEJTctTpQ2vXzS/pJo8wG/IAJnDVMeduG13shhrEXwAVlpMEM4pm7w3+VtVrOUnVYPqfVBTKO10iR1VjayRo7becSaYG5tYzn9sLlDf9Kw459olXL8AekfDvs2MpytzNB0kaj7REvW4crz5KHE1Zcu2Sqt+dz7iaw900ubvC3I2+p1jRNIh7yh0lGFVhTtk4rc/iwb06bpLIHJwbkAAueqkTWJfcjXnHqacr6lNrfInlOJjGDsdV6JDIyD/8CiodscBdPDIqtuKO8VOdFkTVspQ1so8vgSP+QPvEfGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdID/3bz; dkim-atps=neutral; spf=none (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdID/3bz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 22 Aug 2024 23:34:03 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqPLM22zYz2yZ4;
	Thu, 22 Aug 2024 23:34:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724333644; x=1755869644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ey9GWCaehbSnTHtTO44xwcZKYcD9SIp9LLt318G94E4=;
  b=IdID/3bzY5fvJP/7Haz337VFt3L117tvwS8iQnhm6mHmTlLH5iydbqKG
   6tq2dVt4h/qCMZeVsI81ATK3Dksc9smUNSxcuPZTBllCF0/t7jB7zC+2A
   REB4iG8+Kw51ae5W0qykRzJ/s9EMoVpiTj4ypJMojgKBh9cPZXiU/FKDe
   qoNf7m/jIi3lZdj0PV4G4ivW1d5m13xvMGI4osr/ewYxFhqnvnXq99K2X
   UCiuZK7ojTyf95GAj39azlxMPTB/JCUkhX2fD3cGwd+M4OtIdabfAM/1q
   XFOuoEzV7vvoZqUqnaW//rd00wSgip3Vf7n4zAj+7FhoVZ3+Xe3gt7W1g
   A==;
X-CSE-ConnectionGUID: 9QiHbIqOSEW2VrF/DYHqqg==
X-CSE-MsgGUID: FRvwyE4TRV+Ms6+fqXxUiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34128591"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="34128591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:32:55 -0700
X-CSE-ConnectionGUID: 6EKnKbPLSVqplxDBOPNGlQ==
X-CSE-MsgGUID: ZnLsCKtgSW+HwUkAsDZXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61468279"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:32:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7vh-00000000St9-3oX7;
	Thu, 22 Aug 2024 16:32:45 +0300
Date: Thu, 22 Aug 2024 16:32:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
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

On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:

...

> > > > > +	/* Check 0x14's SDA and SCL status */
> > > > > +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > > > +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> > > > AST2600_I2CC_SCL_LINE_STS)) {
> > > > > +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base
> > +
> > > > AST2600_I2CM_CMD_STS);
> > > > > +		r = wait_for_completion_timeout(&i2c_bus->cmd_complete,
> > > > i2c_bus->adap.timeout);
> > > > > +		if (r == 0) {
> > > > > +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > > > +			ret = -ETIMEDOUT;
> > > > > +		} else {
> > > > > +			if (i2c_bus->cmd_err) {
> > > > > +				dev_dbg(i2c_bus->dev, "recovery error\n");
> > > > > +				ret = -EPROTO;
> > > > > +			}
> > > > > +		}
> > > > > +	}
> > > >
> > > > ret is set but maybe overridden.
> > >
> > > If will modify by following.
> > > 		if (r == 0) {
> > > 			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > 			ret = -ETIMEDOUT;
> > > 		} else if (i2c_bus->cmd_err) {
> > > 			dev_dbg(i2c_bus->dev, "recovery error\n");
> > > 			ret = -EPROTO;
> > > 		}
> > > If no error keep ret = 0;
> > 
> > It doesn't change the behaviour. Still ret can be overridden below...
> 
> Yes, it is expectable, previous is issue recovery command out then the
> following is double confirm the bus status.
> If bus still busy, the function still return recovery fail.
> 
> Or should I modify by following?
> 	/* Check 0x14's SDA and SCL status */
> 	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> 	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
> 		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> 		r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
> 		if (r == 0) {
> 			dev_dbg(i2c_bus->dev, "recovery timed out\n");

> 			ret = -ETIMEDOUT;

This assignment doesn't make sense.

> 		} else if (i2c_bus->cmd_err) {
> 				dev_dbg(i2c_bus->dev, "recovery error\n");
> 				ret = -EPROTO;
> 		}
> 		/* check bus status */
> 		state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> 		if (state & AST2600_I2CC_BUS_BUSY_STS) {
> 			dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> 			ret = -EPROTO;
> 		}
> 	}

> > > > > +	/* Recovery done */
> > > >
> > > > Even if it fails above?
> > >
> > > This will keep check the bus status, if bus busy, will give ret =
> > > -EPROTO;
> > >
> > > > > +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > > > > +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> > > > > +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> > > > > +		ret = -EPROTO;
> > 
> > ...here.

See above.

> > > > > +	}
> > > > > +
> > > > > +	/* restore original master/slave setting */
> > > > > +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > > > > +	return ret;

...

> > > > > +		i2c_bus->master_dma_addr =
> > > > > +			dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf,
> > > > > +				       msg->len, DMA_TO_DEVICE);
> > > >
> > > > > +		if (dma_mapping_error(i2c_bus->dev,
> > i2c_bus->master_dma_addr))
> > > > {
> > > > > +			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf,
> > msg,
> > > > false);
> > > > > +			i2c_bus->master_safe_buf = NULL;
> > > >
> > > > > +			return -ENOMEM;
> > > >
> > > > Why is the dma_mapping_error() returned error code shadowed?
> > >
> > > Sorry, please point me why you are think it is shadowed?
> > > As I know dma_mapping_error() will return 0 or -ENOMEM. So I check if it
> > is !=0.
> > > Than return -ENOMEM.
> > 
> > First of all, it is a bad style to rely on the implementation details where it's not
> > crucial. Second, today it may return only ENOMEM, tomorrow it can return a
> > different code or codes. And in general, one should not shadow an error code
> > without justification.
> > 
> Understood, The following is better, am I right? (if yest, those will update in driver)

Yes.

> 		Int ret;
> 		.....
> 		ret = dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr)
> 		if (ret) {
> 			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg, false);
> 			i2c_bus->master_safe_buf = NULL;
> 			return ret;
> 		}
> 
> > > > > +		}

...

> > > > > +	if (i2c_bus->mode == BUFF_MODE) {
> > > > > +		i2c_bus->buf_base =
> > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > +			i2c_bus->buf_size = resource_size(res) / 2;
> > > > > +		else
> > > > > +			i2c_bus->mode = BYTE_MODE;
> > > >
> > > > What's wrong with positive conditional? And is it even possible to
> > > > have NULL here?
> > > >
> > > Yes, if dtsi fill not following yaml example have reg 1, that will failure at buffer
> > mode.
> > > And I can swith to byte mode.
> > >
> > > reg = <0x80 0x80>, <0xc00 0x20>;
> > 
> > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> I will update to following.
> 		if (IS_ERR(i2c_bus->buf_base))
> 			i2c_bus->mode = BYTE_MODE;
> 		else
> 			i2c_bus->buf_size = resource_size(res) / 2;
> 
> > 2) Why _NULL?
> 	If dtsi file is claim only 1 reg offset. reg = <0x80 0x80>; that will goto byte mode.
> 	reg = <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> 	due to 2nd is buffer register offset.

I have asked why IS_ERR_OR_NULL() and not IS_ERR().

> > > > > +	}

-- 
With Best Regards,
Andy Shevchenko


