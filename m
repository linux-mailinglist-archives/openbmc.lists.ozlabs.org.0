Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D35B88B5EC
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 01:18:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ql2z3Q9V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3Vl634fvz3dSL
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 11:18:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ql2z3Q9V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3VkX1Dgjz2xdp;
	Tue, 26 Mar 2024 11:17:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 698D9CE1DCA;
	Tue, 26 Mar 2024 00:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED6CC43390;
	Tue, 26 Mar 2024 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711412271;
	bh=DzwoMxfvZ+a0x0ZrAQfdTRiDFr9eaI4ZTx/k5Lkg1jI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ql2z3Q9Va2O3ZD24FUv4udV3A0FUrLQBpuYl2RtDYysFDl6ejEWXKAh049CVM34EE
	 QWsGi9dOs+LROWXQ8Utpmux0W21ur1gFoBnHN1MiuIvMHW+2wdgx0HM8xWpSha+pV6
	 1o1HMXmPFjckLzr70g204mpNiITuMr9ORo6dXpd8FDAkKewNQnp+dUE9rmT3On8Ffr
	 8qY/aGdf9NPNXvYa/JD2syROd9MAcEAlTnNu0aEYLLFR8P0WtUJBjIqCSO1CKo1+SR
	 ZSD8zY7h5H8Zbdvk5Y1HMwbWZpnicdR3wyK9vc5ig38OLHoK8tfqyJheM3t0pMZCOj
	 xEebc/CmHcIAw==
Date: Tue, 26 Mar 2024 01:17:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 05/64] i2c: aspeed: reword according to newest
 specification
Message-ID: <vb4hempklviz6w4gd3eimprplybm4ckefwz2gyy7cp2uww2anv@b4egbq4u4rrg>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:58PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..4e6ea4a5cab9 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -159,7 +159,7 @@ struct aspeed_i2c_bus {
>  	bool				send_stop;
>  	int				cmd_err;
>  	/* Protected only by i2c_lock_bus */
> -	int				master_xfer_result;
> +	int				xfer_result;
>  	/* Multi-master */
>  	bool				multi_master;
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -608,9 +608,9 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  out_complete:
>  	bus->msgs = NULL;
>  	if (bus->cmd_err)
> -		bus->master_xfer_result = bus->cmd_err;
> +		bus->xfer_result = bus->cmd_err;
>  	else
> -		bus->master_xfer_result = bus->msgs_index + 1;
> +		bus->xfer_result = bus->msgs_index + 1;
>  	complete(&bus->cmd_complete);
>  out_no_complete:
>  	return irq_handled;
> @@ -679,7 +679,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>  }
>  
> -static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
> +static int aspeed_i2c_xfer(struct i2c_adapter *adap,
>  				  struct i2c_msg *msgs, int num)

here the alignment goes a bi off.

>  {
>  	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
> @@ -738,7 +738,7 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>  		return -ETIMEDOUT;
>  	}
>  
> -	return bus->master_xfer_result;
> +	return bus->xfer_result;
>  }
>  
>  static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
> @@ -748,7 +748,7 @@ static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
>  
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  /* precondition: bus.lock has been acquired. */
> -static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
> +static void __aspeed_i2c_reg_target(struct aspeed_i2c_bus *bus, u16 slave_addr)

We  have the word master/slave forgotten here and there, but as
we are here, /slave_addr/target_addr/

>  {
>  	u32 addr_reg_val, func_ctrl_reg_val;
>  
> @@ -770,7 +770,7 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
>  	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
>  }
>  
> -static int aspeed_i2c_reg_slave(struct i2c_client *client)
> +static int aspeed_i2c_reg_target(struct i2c_client *client)
>  {
>  	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
>  	unsigned long flags;
> @@ -781,7 +781,7 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>  
> -	__aspeed_i2c_reg_slave(bus, client->addr);
> +	__aspeed_i2c_reg_target(bus, client->addr);
>  
>  	bus->slave = client;
>  	spin_unlock_irqrestore(&bus->lock, flags);
> @@ -789,7 +789,7 @@ static int aspeed_i2c_reg_slave(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int aspeed_i2c_unreg_slave(struct i2c_client *client)
> +static int aspeed_i2c_unreg_target(struct i2c_client *client)
>  {
>  	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
>  	u32 func_ctrl_reg_val;
> @@ -814,11 +814,11 @@ static int aspeed_i2c_unreg_slave(struct i2c_client *client)
>  #endif /* CONFIG_I2C_SLAVE */
>  
>  static const struct i2c_algorithm aspeed_i2c_algo = {
> -	.master_xfer	= aspeed_i2c_master_xfer,
> +	.xfer	= aspeed_i2c_xfer,

here the alignment goes a bit off.

Andi
