Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A28D466E
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2024 09:49:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vqdgh2dGNz3cZJ
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2024 17:49:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqdgG1BwGz3cXZ;
	Thu, 30 May 2024 17:49:11 +1000 (AEST)
Received: from [141.14.13.3] (g258.RadioFreeInternet.molgen.mpg.de [141.14.13.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E42EE61E5FE01;
	Thu, 30 May 2024 09:47:45 +0200 (CEST)
Message-ID: <2774cb4c-4eea-4bf5-8b2b-438adf18448d@molgen.mpg.de>
Date: Thu, 30 May 2024 09:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
To: Tommy Huang <tommy_huang@aspeedtech.com>
References: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: BMC-SW@aspeedtech.com, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Tommy,


Thank you for your patch.

Am 30.05.24 um 09:06 schrieb Tommy Huang:
> When the i2c bus recovey occurs, driver will send i2c stop command

recove*r*y

> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will

What is the user visible problem?

> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.

How can this be tested?

> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 

The blank line can be removed.

> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>   drivers/i2c/busses/i2c-aspeed.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..32f8b0c1c174 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -169,6 +169,7 @@ struct aspeed_i2c_bus {
>   };
>   
>   static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
>   
>   static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>   {
> @@ -187,7 +188,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>   			command);
>   
>   		reinit_completion(&bus->cmd_complete);
> -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		aspeed_i2c_do_stop(bus);
>   		spin_unlock_irqrestore(&bus->lock, flags);
>   
>   		time_left = wait_for_completion_timeout(


Kind regards,

Paul
