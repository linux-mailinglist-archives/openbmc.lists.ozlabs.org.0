Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9A85E9BF
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 22:15:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gvD9pA4A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg8FC0Zpwz2yq4
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 08:15:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gvD9pA4A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg8DY1wXXz2xTm;
	Thu, 22 Feb 2024 08:14:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 82D06CE1056;
	Wed, 21 Feb 2024 21:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB035C433C7;
	Wed, 21 Feb 2024 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708550090;
	bh=+EdDNbEsAKZRG0zuuQG5RTrKozfYoT2Jo7rs3XByyDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvD9pA4AqNbNBkzO7LgRGJtM3iQqVlQPGMqpx3Omqi+g54/KXwHnkereA0ovaKlm4
	 WseGRIOQH/DIChpAJuWH5mKcyQCFhcANqueAgHtTt2Xx1R7tSL9pbLeWLjmLKKlXSF
	 oM9wcJ2vWNtAkW/KRr5V7IcVGmQWdbn7zmjK2coqK5AhMg+S1djDUlGAxaqFonyTc0
	 lqCvXAW3xe3Yf5R8Tq7D3mIoEJN3Mf6C8J7zQC1dClU8VJOqXGQn2xIR6pjfxKw0OP
	 m33qeF22uontgE1lJ8tHHoYW7W3QmXzxQ1J2lyV6gEuVIsjVMxlZoesDIZptNvhg0W
	 goVCLPc8/ET4Q==
Date: Wed, 21 Feb 2024 22:14:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Message-ID: <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, joel@jms.id.au, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

On Fri, Feb 16, 2024 at 08:04:55PM +0800, Tommy Huang wrote:
> When the i2c error condition occurred and master state was not idle,
> the master irq function will goto complete state without any other
> interrupt handling. It would cause dummy irq expected print. Under
> this condition, assign the irq_status into irq_handle.

I'm sorry, but I don't understand much from your log here.

Do you mean that irq_handled in aspeed_i2c_master_irq() is left
with some states that is not supposed to have and then you
end up printing here:

	dev_err(bus->dev,
		"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
		irq_received, irq_handled);

Can you please explain better?

If that's the case, wouldn't it make more sense to check for 
bus->master_state != ASPEED_I2C_MASTER_INACTIVE) earlier?

And, still, If that's the case, I believe you might need the
Fixes tag. It's true that you are not really failing, but you are
not reporting a failure by mistake.

Thanks,
Andi

> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 5511fd46a65e..ce8c4846b7fa 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -445,6 +445,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>  			irq_status);
>  		irq_handled |= (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
>  		if (bus->master_state != ASPEED_I2C_MASTER_INACTIVE) {
> +			irq_handled = irq_status;
>  			bus->cmd_err = ret;
>  			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
>  			goto out_complete;
> -- 
> 2.25.1
> 
