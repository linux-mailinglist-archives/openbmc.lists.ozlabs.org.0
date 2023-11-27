Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 092727FAD71
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 23:26:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pjb9M3dg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfKtT3cYVz3cPk
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 09:26:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pjb9M3dg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfKsq5zNdz30gH;
	Tue, 28 Nov 2023 09:25:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A004A614A7;
	Mon, 27 Nov 2023 22:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870A7C433C8;
	Mon, 27 Nov 2023 22:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701123926;
	bh=GRyFkV0q85dCw/8aaH+ce1mWfZBdwTA+ebfxJuBFea8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pjb9M3dguGR27IGPgk/7/jJ7HJDeS4kcZHWrGtB6092BMnDwGSeo6greCg8V3ZJMw
	 h+Un3fkdNsnqi2kCK1/1wVmliPfj9ayXqqBZ+i0Rb2ymnHNVXCyGeS7FGCc/ipMIA5
	 xpyJJ1iLa9qeTTlGGs2qtZ11lSX2hEctXIaxJblHMQcmw7tT3hU9NGiSisDXJtTQ4q
	 fNKPhB9JRF2v1qDFyuPZr39+7oV4r8dQvnqfhl1NElCvV95Qw/cwdKNY8bmZP0UmEj
	 UonC0osEUR63TOcFdhGbXTC1I+8DWlnG/n/Tn5WKfozXD8vuuRyQk+EB06+umtURVW
	 eaS1NLYatfWfg==
Date: Mon, 27 Nov 2023 23:25:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Cosmo Chou <chou.cosmo@gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in
 SLAVE_READ_PROCESSED
Message-ID: <20231127222522.wjdd6btbug6shd7y@zenone.zhora.eu>
References: <20231120091746.2866232-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120091746.2866232-1-chou.cosmo@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, jae.hyun.yoo@linux.intel.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, cosmo.chou@quantatw.com, joel@jms.id.au, linux@roeck-us.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Cosmo,

On Mon, Nov 20, 2023 at 05:17:46PM +0800, Cosmo Chou wrote:
> commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
> in interrupt handler") moved most interrupt acknowledgments to the
> start of the interrupt handler to avoid race conditions. However,
> slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
> is handled.
> 
> Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
> the problem that the next byte is not sent correctly.
> 
> Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 28e2a5fc4528..c2d74e4b7e50 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -337,6 +337,12 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  		break;
>  	}
>  
> +	/* Ack Tx ack */
> +	if (irq_handled & ASPEED_I2CD_INTR_TX_ACK) {
> +		writel(ASPEED_I2CD_INTR_TX_ACK, bus->base + ASPEED_I2C_INTR_STS_REG);
> +		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +	}
> +
>  	return irq_handled;
>  }
>  #endif /* CONFIG_I2C_SLAVE */
> @@ -602,13 +608,18 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  {
>  	struct aspeed_i2c_bus *bus = dev_id;
> -	u32 irq_received, irq_remaining, irq_handled;
> +	u32 irq_received, irq_remaining, irq_handled, irq_acked;
>  
>  	spin_lock(&bus->lock);
>  	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>  	/* Ack all interrupts except for Rx done */
> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
> -	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +	irq_acked = irq_received & ~ASPEED_I2CD_INTR_RX_DONE;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* shouldn't ack Slave Tx Ack before it's handled */
> +	if (bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED)
> +		irq_acked &= ~ASPEED_I2CD_INTR_TX_ACK;
> +#endif
> +	writel(irq_acked, bus->base + ASPEED_I2C_INTR_STS_REG);

which branch are you? You don't look like being in the latest.
Please update your branch.

Andi

>  	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>  	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>  	irq_remaining = irq_received;
> -- 
> 2.34.1
> 
