Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 089BBDCA7F
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 18:12:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vrfP5mlqzDrPR
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 03:12:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vrc20lSwzDrT3
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 03:10:41 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 09:10:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; d="scan'208";a="199750134"
Received: from unknown (HELO [10.7.153.143]) ([10.7.153.143])
 by orsmga003.jf.intel.com with ESMTP; 18 Oct 2019 09:10:37 -0700
Subject: Re: [PATCH linux dev-5.3] i2c: aspeed: Prevent state corruption for
 IRQ with no status
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20191018154602.22265-1-eajames@linux.ibm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <2cb74003-07e5-528c-2c29-a79f35e33419@linux.intel.com>
Date: Fri, 18 Oct 2019 09:10:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018154602.22265-1-eajames@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/18/2019 8:46 AM, Eddie James wrote:
> On the AST2600, interrupts have been observed with no interrupt status
> bits set. This can break the driver state machine, so these interrupts
> should be detected and the handler should return IRQ_NONE.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Thanks Eddie!

> ---
>   drivers/i2c/busses/i2c-aspeed.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index c2a6e5a27314..e19f24c0acb2 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -603,6 +603,17 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>   
>   	spin_lock(&bus->lock);
>   	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +
> +	/*
> +	 * On the AST2600, interrupts have been observed with no interrupt
> +	 * status bits set. In this case, the handler should return IRQ_NONE
> +	 * immediately to prevent driver state machine corruption.
> +	 */
> +	if (!irq_received) {
> +		spin_unlock(&bus->lock);
> +		return IRQ_NONE;
> +	}
> +
>   	/* Ack all interrupts except for Rx done */
>   	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>   	       bus->base + ASPEED_I2C_INTR_STS_REG);
> 
