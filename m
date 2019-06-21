Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF84EEDC
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 20:42:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VnbX1Fz7zDqgF
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 04:42:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VnZz6NNbzDqdh
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jun 2019 04:41:29 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2019 11:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,401,1557212400"; d="scan'208";a="312069546"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga004.jf.intel.com with ESMTP; 21 Jun 2019 11:41:27 -0700
Subject: Re: [RFC PATCH dev-5.1 3/6] irqchip/aspeed-i2c-ic: add I2C SRAM
 enabling control
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 C?ric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-4-jae.hyun.yoo@linux.intel.com>
 <c64ab19a31d1495f8e137d5ac58645b2@TWMBX02.aspeed.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2539f657-1966-c00d-dace-fa382bd1b85f@linux.intel.com>
Date: Fri, 21 Jun 2019 11:41:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <c64ab19a31d1495f8e137d5ac58645b2@TWMBX02.aspeed.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/20/2019 5:33 PM, Ryan Chen wrote:
> Hello Jae,
> 	The i2c register setting must after scu reset. - APEED_I2C_SRAM_BUFFER_EN
> 	My recommend aspeed-i2c-ic.c need be probe after scu reset. And all others i2c bus is no needed for scu reset.

Hello Ryan,

This module is registered after the SCU reset.
Thank you for the information.

Regards,
Jae

> 
> Ryan
> 
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+ryan_chen=aspeedtech.com@lists.ozlabs.org] On Behalf Of Jae Hyun Yoo
> Sent: Friday, June 21, 2019 3:49 AM
> To: Brendan Higgins <brendanhiggins@google.com>; Benjamin Herrenschmidt <benh@kernel.crashing.org>; C?ric Le Goater <clg@kaod.org>; Joel Stanley <joel@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>
> Cc: openbmc@lists.ozlabs.org; Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Subject: [RFC PATCH dev-5.1 3/6] irqchip/aspeed-i2c-ic: add I2C SRAM enabling control
> 
> This commit adds I2C SRAM enabling control for AST2500 SoC to support buffer mode and DMA mode transfer. The SRAM is enabled by default in AST2400 SoC.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/irqchip/irq-aspeed-i2c-ic.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
> index f20200af0992..99985b22a9fa 100644
> --- a/drivers/irqchip/irq-aspeed-i2c-ic.c
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -18,6 +18,9 @@
>   #include <linux/of_irq.h>
>   #include <linux/io.h>
>   
> +/* I2C Global Control Register (AST2500) */
> +#define ASPEED_I2C_GLOBAL_CTRL_REG	0xc
> +#define  ASPEED_I2C_SRAM_BUFFER_EN	BIT(0)
>   
>   #define ASPEED_I2C_IC_NUM_BUS 14
>   
> @@ -100,6 +103,11 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
>   	irq_set_chained_handler_and_data(i2c_ic->parent_irq,
>   					 aspeed_i2c_ic_irq_handler, i2c_ic);
>   
> +	/* Enable I2C SRAM buffer in case of AST2500 */
> +	if (of_device_is_compatible(node, "aspeed,ast2500-i2c-ic"))
> +		writel(ASPEED_I2C_SRAM_BUFFER_EN,
> +		       i2c_ic->base + ASPEED_I2C_GLOBAL_CTRL_REG);
> +
>   	pr_info("i2c controller registered, irq %d\n", i2c_ic->parent_irq);
>   
>   	return 0;
> --
> 2.22.0
> 
