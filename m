Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C13DD975051
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2024 12:57:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3cws4syjz3cHx
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2024 20:57:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726052266;
	cv=none; b=aVinnCEEcxTvNFQtBCXMm0s9uEo1p27dKDk1df7KBgvHQcd+UDnTnsQ36p3/eyPG/FMa5nbY+Kz65pe0bv/dJVFHcpr2EIbz9J3BZmNsYs52IB24xCEpwffNMHlw8E3ZRhkmLYj6Mh6xnkUnB+5CUGyvDSBF3dMbEKby5fsq5rfqcS+cVXtREmWOZ3wUTLuIMZam0cgFYVd31OBr5yoFohMLvqrPDjyDZprJ+fczlyihjqDBmDVAuj74OIuyGdyxR//U5qN9sz3AgqlJaJDWlpcqLjDKkeJwBaD0TyGsbit1Oc+Dx3RaqARg1WFzlHMc7ahI/TQm5Bdr8sNtMXya5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726052266; c=relaxed/relaxed;
	bh=QprU0wwe+oeAtw2pEvVwFrDiPH9jFMBKugiIBkKH/00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4VT1qf47OFztUmyoosR6Gys474rPwFdADtfHmk5QnF+vuEn12BLn9CNTgmJpqKM5cKdFiakTNYgEu1BfYHdzU9e2l5MuNUpEqbgVrRzY4HXpbHIqkjheyqdgfEChWj6GKJBkfGUsyMQxmhL77f78vrMQDpHLzyesl9Eu0GP4x79w8a789ggBQMSn5KgZluB6iYBYmYPXpXw5Cf9wlJ3pPAKXSisNkAzQRdz3ZKiI0VDRd8FfHUFSV4nJPlAKNZakdkhoRnDWR/CbqUqEYUwpwrOYe4rmyvxSkzYJNGSHUYHoFmNe6UYQkNmet5cVHdfUhC4rZRGqUeLWGMxG3K+YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PmNE7nNr; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PmNE7nNr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3cwn4kRXz2y8n;
	Wed, 11 Sep 2024 20:57:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AFA55C0524;
	Wed, 11 Sep 2024 10:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBF7C4CEC5;
	Wed, 11 Sep 2024 10:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726052263;
	bh=KNrTDepDPuGxtTmBbgCKo0Gtxg+JrP7T4JGklJVrrOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmNE7nNrQZr1i8uI6cLz5m+pKTG2pNQh1ygtOLlaWJxKqBhz0ii0bv6RLnD1uC/FP
	 gqE3zUJUWqpwn1Mf1L6w8Gk3pfd5kzNdxyF7XudoPiIhlWrJ1jNlJvRBKgTLPd1c0H
	 TCuSiXDuhePum7noQxWMzK/FPzR1jfFy44q45bxsRM+MUl5t+tBlxk+RUXV7uuwUgL
	 p1Gfm+MtA9ihcuDxSVQsZC6R+F/2puuN5sPxPnLKEkwdqv7ewxUg8+SRLUvgVaEvaQ
	 /FAoaA6yHtoH+OOOC/gn6CQ0VVFLlxcn+ax/Sj1TSLv7tjxSJCrbq+d90swYMrT37s
	 efMijMQK3C/3A==
Date: Wed, 11 Sep 2024 12:57:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH v3] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Message-ID: <yoqhvha64bir33hcq6tlcehkusxu2b45w3ut4pzmvrot6bl63a@y3xn2xdespcu>
References: <20240911093951.1674824-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911093951.1674824-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Sep 11, 2024 at 05:39:51PM GMT, Tommy Huang wrote:
> When the i2c bus recovery occurs, driver will send i2c stop command
> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will
> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.
> 
> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 

the blank line in between tags (Fixes and the rest) needs to be
removed.

No worries, I will take care of it before merging.

Meantime, Brendan, Benjamin, Joel, any comment on this change?

Thanks,
Andi

> Cc: <stable@vger.kernel.org> # v4.13+
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..2a03a221e2dd 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -170,6 +170,13 @@ struct aspeed_i2c_bus {
>  
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
>  
> +/* precondition: bus.lock has been acquired. */
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
> +{
> +	bus->master_state = ASPEED_I2C_MASTER_STOP;
> +	writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +}
> +
>  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  {
>  	unsigned long time_left, flags;
> @@ -187,7 +194,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  			command);
>  
>  		reinit_completion(&bus->cmd_complete);
> -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		aspeed_i2c_do_stop(bus);
>  		spin_unlock_irqrestore(&bus->lock, flags);
>  
>  		time_left = wait_for_completion_timeout(
> @@ -390,13 +397,6 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
>  	writel(command, bus->base + ASPEED_I2C_CMD_REG);
>  }
>  
> -/* precondition: bus.lock has been acquired. */
> -static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus)
> -{
> -	bus->master_state = ASPEED_I2C_MASTER_STOP;
> -	writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> -}
> -
>  /* precondition: bus.lock has been acquired. */
>  static void aspeed_i2c_next_msg_or_stop(struct aspeed_i2c_bus *bus)
>  {
> -- 
> 2.25.1
> 
