Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A3C78EF90
	for <lists+openbmc@lfdr.de>; Thu, 31 Aug 2023 16:26:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSL+K/1H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc3Q90bsxz3by8
	for <lists+openbmc@lfdr.de>; Fri,  1 Sep 2023 00:26:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QSL+K/1H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc3PP393hz2ykV;
	Fri,  1 Sep 2023 00:26:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693491978; x=1725027978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7paPh2mF9Wy7OEwJY1d2GalGy2y7dQanY+hUyqVQRaU=;
  b=QSL+K/1HCqcFFmk7aRz8sDfVdwAb5Fd6F6TLBInXaPkQaomghdPPdDON
   sk5mBtwsJsXxA4Y1u3Au1k1Vfk0IX8J0JrJKagtSWMFwnzAH0XuY3HZmk
   R3C/snX0DlmMwyjnQ/LRWn6uMqJp/7X8XLtJxmMf6WZEtxgWxDb93nMx0
   g/EHk9fol1ZARVcecYCFy+5Wh+uP8GLqTfv3K5Lv+pYMOWuTvSlwFxnMl
   YWEgcb6GgJ+IYJ3ETgDzmE49qj2EVuWIj5ZURyPsIcfcVn00zXQHYNP4O
   NZ4sOS/CjiEh6zBGv+lU4hulxLjXc5trfztMwycsDbP3njxkxkyHzemRG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="360978695"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="360978695"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689370098"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="689370098"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:18:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qbiV9-005PI8-0Q;
	Thu, 31 Aug 2023 17:18:27 +0300
Date: Thu, 31 Aug 2023 17:18:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <ZPChMrsKrOQppY1F@smile.fi.intel.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <ZLENe5B3gi/oNTQp@smile.fi.intel.com>
 <SEZPR06MB5269A43F801EF04F39461174F2E5A@SEZPR06MB5269.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR06MB5269A43F801EF04F39461174F2E5A@SEZPR06MB5269.apcprd06.prod.outlook.com>
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

On Thu, Aug 31, 2023 at 06:04:30AM +0000, Ryan Chen wrote:
> > On Fri, Jul 14, 2023 at 03:45:22PM +0800, Ryan Chen wrote:

Stop overquoting! Remove the context you are not answering to.

...

> > > +				if (--i % 4 != 3)
> > > +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
> > > +				writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> > > +				       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> > 
> > Wrong memory accessors. You should use something from asm/byteorder.h
> > which includes linux/byteorder/generic.h.
> > 
> 
> Are you preferring add comment to explain more by following?
> 				/*
> 				 * The controller's buffer register supports dword writes only.
> 				 * Therefore, write dwords to the buffer register in a 4-byte aligned,
> 				 * and write the remaining unaligned data at the end.
> 				 */

This does not explain endianess bug (or feature) it has.
You are using CPU side byteorder for the aligned data.
This is not okay, on top of the code looking ugly and
prone to errors. Note, that somebody may refer to your
code, once accepted, in educational purposes, but since
the code is not good written, it makes a false positive
impression that this is the right thing to do in the similar
case elsewhere.

Please, fix this.

> 				for (i = 0; i < xfer_len; i++) {
> 					wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
> 					/* accumulating 4 bytes of data, write as a Dword to the buffer register */
> 					if (i % 4 == 3)
> 						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);
> 				}
> 				/* less than 4 bytes of remaining data, write the remaining part as a Dword */
> 				if (--i % 4 != 3)
> 					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));
> 				writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> 				       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> 
> Or more columns (use get_unaligned_le32(wbuf); ) by following.
> 
> 	for (i = 0; i < xfer_len; i++) {
> 		wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
> 		if (i % 4 == 3) {
> 			wbuf_dword = get_unaligned_le32(wbuf);
> 			writel(wbuf_dword, i2c_bus->buf_base + i - 3);
> 		}
> 	}
> 
> 	if (--i % 4 != 3) {
> 		wbuf_dword = get_unaligned_le32(wbuf);
> 		writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
> 	}

-- 
With Best Regards,
Andy Shevchenko


