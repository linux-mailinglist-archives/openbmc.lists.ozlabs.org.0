Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4085793283
	for <lists+openbmc@lfdr.de>; Wed,  6 Sep 2023 01:25:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u6NcJsYZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgM7R6K9Qz3c2t
	for <lists+openbmc@lfdr.de>; Wed,  6 Sep 2023 09:25:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u6NcJsYZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 338 seconds by postgrey-1.37 at boromir; Wed, 06 Sep 2023 09:25:02 AEST
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgM6k2Gtqz2xm3;
	Wed,  6 Sep 2023 09:25:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6B5AECE11D9;
	Tue,  5 Sep 2023 23:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1757BC433C8;
	Tue,  5 Sep 2023 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693955959;
	bh=tkLbpV5CYYO3vwi6utL6T6ePfooLRu8OIzUvsyy5lUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6NcJsYZn2RyIAvQigeFmahcfloKDTk7xZoLkOrk1UmsjkW6yHUSfdAEiGeOa8BQO
	 usPjt9dvhzbV5AnjFq/p1CyiZdZl8vzXfS+ZLM0HDi3zdsDNAmbzFp7xz0Kg7f1fEx
	 TRD9p/tvbbyIw8kmHYcEDCX/JhDDVkjbvoH4jn34Y3U/TKpOCNq4PoDbOO6329Yf4G
	 N4yDzef4zY/eg4Tr4jpkG90tHwY4AoK03DZBhFcgYPDTpJiO9+x7ui1RcyVvRHjV3h
	 /9R+PI2dI6qobu60856oGC1ytxE4XZ0EkqdrS4zBtGrkDgQxdwBXEDeL1dfgtWm4lB
	 qtBXT/gKuedFg==
Date: Wed, 6 Sep 2023 01:19:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH] i2c: aspeed: Reset the i2c controller when timeout occurs
Message-ID: <20230905231915.rv2ysvxa3bshekjq@zenone.zhora.eu>
References: <20230904012505.340455-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904012505.340455-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, jae.hyun.yoo@linux.intel.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, brendan.higgins@linux.dev, joel@jms.id.au, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

Thanks for fixing what I asked, I'm going to review here:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

But still there are 3 things I will ask you for your next
patches:

  1. Please add a version to the patch, this is patch version 2,
     so that the title should be "[PATCH v2] i2c...."

     You can have that with git-format-patch:

        git format-patch -v 2 ....

On Mon, Sep 04, 2023 at 09:25:05AM +0800, Tommy Huang wrote:
> Reset the i2c controller when an i2c transfer timeout occurs.
> The remaining interrupts and device should be reset to avoid
> unpredictable controller behavior.
> 
> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.1+
> 
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>

  2. Don't leave blank lines between tags. But I think Wolfram
     can fix this before pushing.

> ---

  3. After the '---' it comes the freedom of speach section where
     you can write anything. Please add the changelog, something
     like:

       v1 -> v2
        - Fixed comment...
	- Fixed commit log...
	- etc.

     This is important for reviewers in order to understand what
     has changed from patch v1 to patch v2.

Please, before your next patch, read first the
Documentation/process/submitting-patches.rst document.

Thanks,
Andi

>  drivers/i2c/busses/i2c-aspeed.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 2e5acfeb76c8..5a416b39b818 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -698,13 +698,16 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>  
>  	if (time_left == 0) {
>  		/*
> -		 * If timed out and bus is still busy in a multi master
> -		 * environment, attempt recovery at here.
> +		 * In a multi-master setup, if a timeout occurs, attempt
> +		 * recovery. But if the bus is idle, we still need to reset the
> +		 * i2c controller to clear the remaining interrupts.
>  		 */
>  		if (bus->multi_master &&
>  		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
>  		     ASPEED_I2CD_BUS_BUSY_STS))
>  			aspeed_i2c_recover_bus(bus);
> +		else
> +			aspeed_i2c_reset(bus);
>  
>  		/*
>  		 * If timed out and the state is still pending, drop the pending
> -- 
> 2.25.1
> 
