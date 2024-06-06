Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6598FDC21
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 03:27:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K/jWDVwm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvmsY4YZGz3cW7
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 11:27:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K/jWDVwm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvms25Dmcz30f8;
	Thu,  6 Jun 2024 11:27:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15D4C614A4;
	Thu,  6 Jun 2024 01:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6354C2BD11;
	Thu,  6 Jun 2024 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717637219;
	bh=hXn+odQqb9ycP7ylEs86A0/+bXD9RU1Tq6JA4ws0mxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/jWDVwmXLfu9EKZyPkMPbGlChXCRH9hOYb7kYUBcg8t2ylmiG78N6sjy11HCBDSq
	 CcizWLwQOlXpplGIMUiIhrfuOL/YNuQ+u+RQZnjsIGvucMXlJtG3N2js1GByT/4Ngv
	 QZPnGTk0Xqbsi4FpHLXbe00o6yxeJKJjsGIb4X09hYL6AvQ+ZnPeUpF7uYcygfOGhM
	 5J4hm3ugv4YRnF8doOCgjP3lS34+HNwW2vYavpfzN9LZKNCARwEROxfQYrGCqdxPOc
	 1qXLtE8vHtc68RZH2Mx+7XEtcqI3+y4b6buhEaoHsZeacHh4231DMi3K3ojLP2JaRB
	 G9z651baDhqWQ==
Date: Thu, 6 Jun 2024 02:26:55 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
Message-ID: <kts7ib2rxq4g26ayumcyaohs37zl43qo66gok3vae3reyabobe@nbbborkf2eow>
References: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

On Thu, May 30, 2024 at 03:06:56PM +0800, Tommy Huang wrote:
> When the i2c bus recovey occurs, driver will send i2c stop command
> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will
> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.
> 
> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>

Can you please add:

Cc: <stable@vger.kernel.org> # v4.13+

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..32f8b0c1c174 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -169,6 +169,7 @@ struct aspeed_i2c_bus {
>  };
>  
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);

Can you please move aspeed_i2c_do_stop() on top? Doesn't make
much sense to add the prototype here as there is no dependencies.

It's different the case of aspeed_i2c_reset() because it needs
aspeed_i2c_init().

>  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  {
> @@ -187,7 +188,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  			command);
>  
>  		reinit_completion(&bus->cmd_complete);
> -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		aspeed_i2c_do_stop(bus);

The patch is good, though!

Thanks,
Andi
