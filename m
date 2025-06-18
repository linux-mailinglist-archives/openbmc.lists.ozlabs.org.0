Return-Path: <openbmc+bounces-255-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6006ADF9C0
	for <lists+openbmc@lfdr.de>; Thu, 19 Jun 2025 01:25:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN0G50yPPz30T9;
	Thu, 19 Jun 2025 09:25:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750289117;
	cv=none; b=FW/sx6rBsR6PBtcHUHzBKyes6ZHmawVtQd35o66dRe9N70z1lu1dzCiQ64Zmx6ujW7+M09GJDNnA+Mjb2VoXpwq3CH8MEc+iP19oL59aoECbIJBLJ+oIP01JB55s1g+9I83Fl/QPKZhqoMqkDsTvTAm80wxvXnHOgCV6BUASZk3J4YdI8FvO3wrztgvyjjqtywOjmaBomW+iUUSl46MdCkw5UHZo5XMwjw+uX7jhskhHaTuxiLm8YsEtXkj7pRKoxFxQWLcM8jGZnOVJntpfBPbXR/CYnjWE75ObgG9C8qIZEXyK7Li3PnsVFERRmtZvxS/7IcONC6533Zk4ZT//xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750289117; c=relaxed/relaxed;
	bh=GhFeZnoQ2V9lodOI5Au4oU4mRV0Gp+UopakMmZW6ARw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=QPHnkqV/5ZIU8o9AGzER5C2Tc1RcnV2s7Wu9qngb0GKOsemZxgNmk+lRgl2zdaA9BajetxWWvtvTdh7z+pgkHD70DR1/+sGegBq2HoNOY9QHVgLwsnWgsNTwamq4YqI0WZ5JmmY4yI2xq4Q/pQJ2plQ1yMH80oGoPzojOa4a6KChJMQN00+/PeP3OGFMq+sLr3BP2VuruP8ElyqUEZQQvzayd2RRCD0TaI3u/nGovW6mYQZo1fza3ffyqlW6dO619W/FzthImTNoY0uOPcD1R/R0a0iWDDD5Xbht/K0RxxmuZOtjMmt8o+T4c4ayyFjirji49sRyMs4K825w2QTSuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 322 seconds by postgrey-1.37 at boromir; Thu, 19 Jun 2025 09:25:11 AEST
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bN0Fz3lPTz2xQ6;
	Thu, 19 Jun 2025 09:25:11 +1000 (AEST)
Received: from [192.168.0.5] (ip5f5af305.dynamic.kabel-deutschland.de [95.90.243.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id EB61D60288261;
	Thu, 19 Jun 2025 01:18:33 +0200 (CEST)
Message-ID: <63e740bf-cd0c-4671-9254-6846048b0366@molgen.mpg.de>
Date: Thu, 19 Jun 2025 01:18:33 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: aspeed: change debug level in irq handler
To: Jian Zhang <zhangjian.3032@bytedance.com>
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Jian,


Thank you for the patch.

Am 18.06.25 um 12:21 schrieb Jian Zhang:
> In interrupt context, using dev_err() can potentially cause latency
> or affect system responsiveness due to printing to console.
> 
> In our scenario, under certain conditions, i2c1 repeatedly printed
> "irq handled != irq. expected ..." around 20 times within 1 second.

Any idea, why you hit this error at all?

> Each dev_err() log introduced approximately 10ms of blocking time,
> which delayed the handling of other interrupts — for example, i2c2.
> 
> At the time, i2c2 was performing a PMBus firmware upgrade. The
> target device on i2c2 was time-sensitive, and the upgrade protocol
> was non-retryable. As a result, the delay caused by frequent error
> logging led to a timeout and ultimately a failed firmware upgrade.
> 
> Frequent error printing in interrupt context can be dangerous,
> as it introduces latency and interferes with time-critical tasks.
> This patch changes the log level from dev_err() to dev_dbg() to
> reduce potential impact.

Thank you for the patch and the problem description. Hiding an error 
condition behind debug level is also not good, as administrators might 
miss hardware issues. I do not have a solution. Is there something 
similar to WARN_ONCE? Maybe the level should be a warning instead of 
error, because the system is often able to cope with this?

The code is from 2017, so should be well tested actually, shouldn’t it?

> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> ---
>   drivers/i2c/busses/i2c-aspeed.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 1550d3d552ae..38e23c826f39 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -317,7 +317,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   	switch (bus->slave_state) {
>   	case ASPEED_I2C_SLAVE_READ_REQUESTED:
>   		if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
> -			dev_err(bus->dev, "Unexpected ACK on read request.\n");
> +			dev_dbg(bus->dev, "Unexpected ACK on read request.\n");
>   		bus->slave_state = ASPEED_I2C_SLAVE_READ_PROCESSED;
>   		i2c_slave_event(slave, I2C_SLAVE_READ_REQUESTED, &value);
>   		writel(value, bus->base + ASPEED_I2C_BYTE_BUF_REG);
> @@ -325,7 +325,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		break;
>   	case ASPEED_I2C_SLAVE_READ_PROCESSED:
>   		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> -			dev_err(bus->dev,
> +			dev_dbg(bus->dev,
>   				"Expected ACK after processed read.\n");
>   			break;
>   		}
> @@ -354,7 +354,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		/* Slave was just started. Waiting for the next event. */;
>   		break;
>   	default:
> -		dev_err(bus->dev, "unknown slave_state: %d\n",
> +		dev_dbg(bus->dev, "unknown slave_state: %d\n",
>   			bus->slave_state);
>   		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
>   		break;
> @@ -459,7 +459,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   
>   	/* We are in an invalid state; reset bus to a known state. */
>   	if (!bus->msgs) {
> -		dev_err(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
> +		dev_dbg(bus->dev, "bus in unknown state. irq_status: 0x%x\n",
>   			irq_status);
>   		bus->cmd_err = -EIO;
>   		if (bus->master_state != ASPEED_I2C_MASTER_STOP &&
> @@ -523,7 +523,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>   			goto error_and_stop;
>   		} else if (unlikely(!(irq_status & ASPEED_I2CD_INTR_TX_ACK))) {
> -			dev_err(bus->dev, "slave failed to ACK TX\n");
> +			dev_dbg(bus->dev, "slave failed to ACK TX\n");
>   			goto error_and_stop;
>   		}
>   		irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
> @@ -546,7 +546,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		fallthrough;
>   	case ASPEED_I2C_MASTER_RX:
>   		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_RX_DONE))) {
> -			dev_err(bus->dev, "master failed to RX\n");
> +			dev_dbg(bus->dev, "master failed to RX\n");
>   			goto error_and_stop;
>   		}
>   		irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
> @@ -577,7 +577,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		goto out_no_complete;
>   	case ASPEED_I2C_MASTER_STOP:
>   		if (unlikely(!(irq_status & ASPEED_I2CD_INTR_NORMAL_STOP))) {
> -			dev_err(bus->dev,
> +			dev_dbg(bus->dev,
>   				"master failed to STOP. irq_status:0x%x\n",
>   				irq_status);
>   			bus->cmd_err = -EIO;
> @@ -589,7 +589,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>   		bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
>   		goto out_complete;
>   	case ASPEED_I2C_MASTER_INACTIVE:
> -		dev_err(bus->dev,
> +		dev_dbg(bus->dev,
>   			"master received interrupt 0x%08x, but is inactive\n",
>   			irq_status);
>   		bus->cmd_err = -EIO;
> @@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>   
>   	irq_remaining &= ~irq_handled;
>   	if (irq_remaining)
> -		dev_err(bus->dev,
> +		dev_dbg(bus->dev,
>   			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>   			irq_received, irq_handled);
>   


Kind regards,

Paul

