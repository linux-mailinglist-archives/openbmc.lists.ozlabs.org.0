Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CC48A8F1
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 08:53:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY2xJ1N97z30Lx
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 18:53:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.44;
 helo=out30-44.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY2wx19MSz2xX8;
 Tue, 11 Jan 2022 18:52:45 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0V1YjgdZ_1641887545; 
Received: from 30.225.139.228(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V1YjgdZ_1641887545) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 11 Jan 2022 15:52:27 +0800
Message-ID: <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com>
Date: Tue, 11 Jan 2022 15:52:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after
 timeout
Content-Language: en-US
To: linux-kernel@vger.kernel.org
References: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

Any comments?

Thanks,

Heyi

在 2022/1/9 下午9:26, Heyi Guo 写道:
> The memory will be freed by the caller if transfer timeout occurs,
> then it would trigger kernel panic if the peer device responds with
> something after timeout and triggers the interrupt handler of aspeed
> i2c driver.
>
> Set the msgs pointer to NULL to avoid invalid memory reference after
> timeout to fix this potential kernel panic.
>
> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>
> -------
>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-i2c@vger.kernel.org
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> ---
>   drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 67e8b97c0c950..3ab0396168680 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>   		spin_lock_irqsave(&bus->lock, flags);
>   		if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>   			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> +		/*
> +		 * All the buffers may be freed after returning to caller, so
> +		 * set msgs to NULL to avoid memory reference after freeing.
> +		 */
> +		bus->msgs = NULL;
>   		spin_unlock_irqrestore(&bus->lock, flags);
>   
>   		return -ETIMEDOUT;
