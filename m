Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C2A874DF
	for <lists+openbmc@lfdr.de>; Mon, 14 Apr 2025 01:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZbQyt0B7wz3cDR
	for <lists+openbmc@lfdr.de>; Mon, 14 Apr 2025 09:06:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744585586;
	cv=none; b=AtM977EM4U3bQc5hi6XJwAUEF+lI1/VLlSj5h5Zvt+cry6W9dpERP3iXobncbMjPXax96CHiUtd1C9jFbdJiIENRk0R2GMQ5FrtbWtuPmgQ1m8qzj5LRFx1MuRXtYGhRldSyTp7zQaHKoutc4p44bkPlktOGfCNR+F4nA4tNuX5L+v1FPs55OunsgiOCNp14Q7u1sP1BR3BaUqJAEVDbbf7GNWk8bsLa12K85/UAvstSC9A/FRzqgnEM9GxXRjzNreV9IOWeRxQvc5ZhkhyJi8gAhANXQmH1xhtfPFl5IjT8vBnF2mT+Lj/CxVHV+s/ZEZFjP0Tq5/gNyIOUgoPyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744585586; c=relaxed/relaxed;
	bh=0Js/XbutP2iiyIY3Z2E3nP6isMgr/Xfj/eM3fgohx6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwZBi2wa45c/bcoekhgMuzaGWURJuKErENKeouatiM50u7Oyyf3mbExnu5Dm6+WayvdnI2mm8dDNxwhqKvwGmhDIXEagLcxDqauCGtbLLkRM2j+5D9ZebckMLFbzxARq6L7AZpqJh/oWN1ZxvN9SUAVpKcawWg8k8YofAm3ccz6a/jrjpsLADHAsRWMXjiuvJhbkyTALkQOgsxuN8Zm2id9HXjEcmz+AfALJcH51aojH1JgJf+nqyirW0MZboIsF8OSS8FKkp4njEh3BeQ2Zx0SK9Ek9c130KfJ0/nXnNwpGMJnyugVjGdYcGqC/+Cuj80si5V0ahShGLe4HD/c5Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ic7ONa6t; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ic7ONa6t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZbQyn5bB7z2yRZ
	for <openbmc@lists.ozlabs.org>; Mon, 14 Apr 2025 09:06:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EB9E5C1D25;
	Sun, 13 Apr 2025 23:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DB0C4CEDD;
	Sun, 13 Apr 2025 23:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744585581;
	bh=pBqnKenA44Ex98GT2/2aiRAZUxsM0POq4lWjhVKj3Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ic7ONa6tP4j0nT8/gdLyKgfwEPXuItsccXSDD3UbZ/X2/HjYpQi+qOjIip1MN595P
	 tQRr+Od7JzuaM+Ko3vdO71mZcAfUepMh5cV8WGTZhvSZC8D4Qtw+mQXJavZyOFSlsW
	 uwOGmI0bqj+H2o24rB77iUsezq9uMnD86ML5cyRzZdynH8oegeMBYxsllX1vvvWshE
	 glLrtIFwzPu0JKo3/8Djz34Uu1q8NvmzaXWNlUcfVi4/CVXvsFxWfMK+1nqAO+7Qq5
	 RVvpGxUNk5v9VedIo/98U0yDzRfni7InfwzsyMUrsVlbAvc/73jhkCdYweR35QPVIA
	 PXFSJ8CXgB1+w==
Date: Mon, 14 Apr 2025 01:06:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: mohammed.0.elbadry@gmail.com
Subject: Re: [PATCH v4] i2c: npcm: Add clock toggle recovery
Message-ID: <4wbq7yepeqg6lhu34giqlz7fwamtuv4o5r5slm6ggj5ut7omvd@archqknzat3u>
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
 <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mohammed,

On Fri, Mar 28, 2025 at 07:32:50PM +0000, mohammed.0.elbadry@gmail.com wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> During init of the bus, the module checks that the bus is idle.
> If one of the lines are stuck try to recover them first before failing.
> Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> ---

we are missing the changelog here. You are at v4 and I need to
see the changes between the versions. For now it's OK, please,
next time don't forget to add the changelog.

One more thing, no need to send patches as --in-reply-to your
previous patch.

>  drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2fe68615942e..caf9aa1e6319 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
>  
>  	/* Check HW is OK: SDA and SCL should be high at this point. */
>  	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
> -		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
> -		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
> -			npcm_i2c_get_SCL(&bus->adap));
> -		return -ENXIO;
> +		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,

the space at the beginning of the line should be removed. I will
take care of it if you won't be asked to send a new version.

> +				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
> +		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> +			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
> +				bus->num, npcm_i2c_get_SDA(&bus->adap),
> +				npcm_i2c_get_SCL(&bus->adap));
> +			return -ENXIO;

why don't we return the error coming from
npcm_i2c_recovery_tgclk() instead of forcing it to ENXIO?

Thanks,
Andi

> +		}
>  	}
>  
>  	npcm_i2c_int_enable(bus, true);
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 
