Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E8770F34
	for <lists+openbmc@lfdr.de>; Sat,  5 Aug 2023 12:10:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nXu7JJHL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHyyg71ZPz3cRh
	for <lists+openbmc@lfdr.de>; Sat,  5 Aug 2023 20:10:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nXu7JJHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHyxv6jpDz304l;
	Sat,  5 Aug 2023 20:10:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 277E860C41;
	Sat,  5 Aug 2023 10:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E34C433C8;
	Sat,  5 Aug 2023 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691230206;
	bh=RZD/okUT8P7W5bz60THY3oriTvZX3Irx0g2o/7jpNgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXu7JJHLU9Jooam3uyoQ6e0wCkbz7xIrGiNIEzv+H/djdFeKyXyWdoZ+cS3ex/nwx
	 Hf9os47q9i4O8rPUaHQEgCCnGE2sIREgy0TXaQFDlx0XI6OsZZ3twxM2UKb2vu8lk9
	 VjGfrOnun6jBInNaow/vZ6xwduNClFon1dJhbxDxobyoV0jJhVMfWkTshDyLIiZXx8
	 2JpDieuy6NeBfihyEuejwO1jTP//MyoaxMPoQ32cQNoIQeXAk9HZXylYzNVrd8TKZc
	 kH3hOayvpvoIsew6gxod6r315LuWEQMQ0jQq40j4QCIftMqMIxr0mjwDZBTOR7cW9P
	 a8t3p6xKC7M+g==
Date: Sat, 5 Aug 2023 12:10:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Lixue Liang <lianglixuehao@126.com>
Subject: Re: [PATCH] i2c: aspeed: Avoid accessing freed buffers during i2c
 transfers.
Message-ID: <20230805101004.dknxj7nqrt2aes5n@intel.intel>
References: <20230728122416.17782-1-lianglixuehao@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728122416.17782-1-lianglixuehao@126.com>
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
Cc: Lixue Liang <lianglixue@greatwall.com.cn>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, joel@jms.id.au, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lixue,

On Fri, Jul 28, 2023 at 12:24:16PM +0000, Lixue Liang wrote:
> From: Lixue Liang <lianglixue@greatwall.com.cn>
> 
> After waiting for the transmission timeout, the I2C controller will
> continue to transmit data when the bus is idle. Clearing bus->msg will
> avoid kernel panic when accessing the freed msg->buf in
> aspeed_i2c_master_irq.

actually in aspeed_i2c_master_irq() you are already checking for
!bus->msgs.

What kind of panic are you referring to?

Andi

> Signed-off-by: Lixue Liang <lianglixue@greatwall.com.cn>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 2e5acfeb76c8..c83057497e26 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -713,6 +713,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>  		spin_lock_irqsave(&bus->lock, flags);
>  		if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>  			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> +
> +		bus->msgs = NULL;
>  		spin_unlock_irqrestore(&bus->lock, flags);
>  
>  		return -ETIMEDOUT;
> -- 
> 2.27.0
> 
