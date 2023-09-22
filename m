Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B71617AA949
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 08:48:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dGXBwJ8g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsNC54b4sz3cp0
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 16:48:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dGXBwJ8g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsNBR72nlz3cfQ;
	Fri, 22 Sep 2023 16:47:59 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99c1c66876aso215622466b.2;
        Thu, 21 Sep 2023 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695365275; x=1695970075; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+CrpOA3BbVW7YcDdIAr2SSQwmfCSbThy/86zuEQlAE=;
        b=dGXBwJ8g4CFfvhIkQodBkh1rOQd2SheP99jLjyKjd+qgeRbhdRzi2dJ8UfZt1lf0Ik
         hvfRMlAefXc1AOUWVK/n84KYc8442xg8XO3woEIydUCjtZpCZDtDazeabiSdKTsnPhBs
         SWPM8D3OmhTgwaowXMrXxgg29LLj1C5K8zpZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695365275; x=1695970075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+CrpOA3BbVW7YcDdIAr2SSQwmfCSbThy/86zuEQlAE=;
        b=e8dXd4AQYRBTBL/UTXBoZJALklum3xgCfpbXlp/WLjsAPCRuSs1hZC3xbUYK7Pnz9j
         0GooDK1Ra7CtAmPXLbNIKxQWycL5y46tYEeI0rGyDNEmqX9k7x14W6LL9R4b/ZsWNUAj
         FYTu4IYwjOhFsqVB6uDCy+ZcCvjHCExFeuXbcUlo0dBAGyLiFdhAkyoDklh33gZfzwB2
         pfs9ry89WOhDdzPz0Ry8Rsoo1WUsJ0k1Qyg7ksBmJin0N/VZor6AfD+DZ67zMXAReHOP
         FGVxsmwMQaHpf0/9vo5eT+xZxrtSpYR9E1hBaGxUkBsfiPAT5O/zj7WSD64eBNzBILT6
         gnTw==
X-Gm-Message-State: AOJu0YxutPEdI8jllhJN1xfOQ0TMC4R6vD4VYcJzriFpnHPeOcm8nvwl
	HfaPkzG5UiqeKf7J3BzTXGO4WizwrsMpFVk2Yaw=
X-Google-Smtp-Source: AGHT+IFPI2FY8X4q00f7f4Mb2FQ7AJt0Qto84RYqQGnxZEpGoEFadMazeAbjtK9yxAqqptZrOQefbddxMjsmJTR6WV8=
X-Received: by 2002:a17:907:75fc:b0:9ae:50e3:7e40 with SMTP id
 jz28-20020a17090775fc00b009ae50e37e40mr5278297ejc.52.1695365275252; Thu, 21
 Sep 2023 23:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
In-Reply-To: <20230810072155.3726352-1-zhangjian.3032@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Sep 2023 06:47:43 +0000
Message-ID: <CACPK8XfWKLS_4nBC+NCSw=21iQeaHzBXOROmz9T+S0qZHCBKeg@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Fix i2c bus hang in slave read
To: Jian Zhang <zhangjian.3032@bytedance.com>, Tommy Huang <tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, brendan.higgins@linux.dev, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 10 Aug 2023 at 07:22, Jian Zhang <zhangjian.3032@bytedance.com> wrote:
>
> When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> as a slave, a situation arises where the master sends a START signal
> without the accompanying STOP signal. This action results in a
> persistent I2C bus timeout. The core issue stems from the fact that
> the i2c controller remains in a slave read state without a timeout
> mechanism. As a consequence, the bus perpetually experiences timeouts.
>
> This proposed patch addresses this problem by introducing a status
> check during i2c transmit timeouts. In the event that the controller
> is in a slave read state, the i2c controller will be reset to restore
> proper functionality and allow the I2C bus to resume normal operation.
>
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>

Tommy has submitted a similar fix:

 https://lore.kernel.org/linux-i2c/20230906004910.4157305-1-tommy_huang@aspeedtech.com/

His change is very heavy handed; it reinitialises the bus including
re-parsing the device tree (!).

Should we have merged this fix instead? If not, are you able to
confirm that his change fixes your issue?

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index e76befe3f60f..1a95205fc946 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -113,6 +113,7 @@
>                  ASPEED_I2CD_M_RX_CMD |                                        \
>                  ASPEED_I2CD_M_TX_CMD |                                        \
>                  ASPEED_I2CD_M_START_CMD)
> +#define ASPEED_I2CD_SLAVE_CMDS_MASK                    GENMASK(31, 29)
>
>  /* 0x18 : I2CD Slave Device Address Register   */
>  #define ASPEED_I2CD_DEV_ADDR_MASK                      GENMASK(6, 0)
> @@ -706,6 +707,22 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>                      ASPEED_I2CD_BUS_BUSY_STS))
>                         aspeed_i2c_recover_bus(bus);
>
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +               /*
> +                * If master timed out and bus is in slave mode.
> +                * reset the slave mode.
> +                */
> +               if (readl(bus->base + ASPEED_I2C_CMD_REG) & ASPEED_I2CD_SLAVE_CMDS_MASK) {
> +                       spin_lock_irqsave(&bus->lock, flags);
> +                       u32 func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +                       writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +                       writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +                       bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
> +                       spin_unlock_irqrestore(&bus->lock, flags);
> +               }
> +#endif
> +
>                 /*
>                  * If timed out and the state is still pending, drop the pending
>                  * master command.
> --
> 2.30.2
>
