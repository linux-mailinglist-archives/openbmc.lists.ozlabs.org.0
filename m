Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C3398679E
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 22:24:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDSrM0KxYz3c85
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2024 06:24:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727295871;
	cv=none; b=mn37CxfWetyqvTSvc/3Q5vVp43E7rlxQ8w+0bmh3n6FPzPNxmMyAzx+PEPu8mVdpXcluP8+sRWw3HuwRTzoWr/Pyq1fD9vwJ5xHq1DZReQZg1Lh/846yPgZbyr++YHaCpmoYBXoGPKpELWy/8kXhLkuvTs5yeLJ1N91IFvRKlf3eRUQqKwDlWH68MztKyeLvHswZowlVg50wOPSDerpQ/Kn374DyHRkcTzfkqP0zcJyCTBDYFhIFda909UZoIUNYdmVk2QFYycg5DhiSSr3kmibBTqMcdK4GfJpAjMo+KErh3ZXPbbxXX3AK4f1bA0fV1O8lDIrimkMVjfKpPLDgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727295871; c=relaxed/relaxed;
	bh=+HYvSzIhlBnIdBTU8Eak7vJdRZ4I+8nYy0H0l2kS+t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwPsKRqsTrgDHjLJqBKEV0e7aPJHqdKlS8oqNFW8JdxVcMplBXn41t0MaKAZQbeAwGrFeqDfGdsN9yrEFYt8OSFyBbJCRi5tnKWUXn1NIJtXS85bBvJ032BoY3+pMSGEfjSx9qLSXPJsjR+Ux2otIITn0UzxHAiYWXijor1BAQOD7it5tRKvnLwAJA3G1kzxr2BB2V/DLeTylpGNFX4E/paq8mnVRGFFRMwKGzt9zQKV+fdRerSuxJEAMKtePrygvrknZ2kPix6gk+vSOQQ4ykMXXqsX5z1HI3JO73gHRw/8E4QgHcZ/OHdSBuTubv9OoW1jemuabiI/zPB8prlp1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DhbC+J/t; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DhbC+J/t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDSrH2fc1z2xjH
	for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2024 06:24:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C2D25C1115;
	Wed, 25 Sep 2024 20:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6697AC4CEC3;
	Wed, 25 Sep 2024 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727295869;
	bh=eF5LP5/MDlE2ovTR7G62APQbt2APjNBnDJBCBg8A4RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhbC+J/tEPihqzxq/2I1xXH96g/4GU1fX+Wc8BDhEwggy1LKBQSBcmDXk8aRyf4PD
	 4SSSxA0wBwQrfy1yD4hz5/3jA8klY48Bt0lKBrBcy/stwoyl+3H+PRuX0er6r51xwg
	 lyT9QAfkSL3Zy77PWWh7cbQF9RL4ZxGuF/bX5U9YljPLjoUeLcZYYf4HObd6JDd6FY
	 ZpJvGAxwPGAmOqeDGTZqX4qWiw81ZhQk+fPNxLmDX3n06l2TXs2DpGlibkwFGFZpMz
	 4mevOTO8dSZU3FlAA5vJzesU5l9UswSbRrHoOcQj/t2jMMvJY30L6DUJEh25SXoQRt
	 O1WjNPHH98HfA==
Date: Wed, 25 Sep 2024 22:24:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: warp5tw@gmail.com
Subject: Re: [PATCH v4 3/6] i2c: npcm: Modify timeout evaluation mechanism
Message-ID: <z4g5alkk3cug7v5bsmrmzspgvo4hhu2ebtykht72ewwhsqxqgq@kg2tlpvz3ctp>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-4-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-4-kfting@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

...

> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2d034503d8bc..68f3d47323ab 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2132,19 +2132,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  		}
>  	}
>  
> -	/*
> -	 * Adaptive TimeOut: estimated time in usec + 100% margin:
> -	 * 2: double the timeout for clock stretching case
> -	 * 9: bits per transaction (including the ack/nack)
> -	 */
> -	timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
> -	timeout = max_t(unsigned long, bus->adap.timeout, usecs_to_jiffies(timeout_usec));
>  	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>  		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>  		return -EINVAL;
>  	}
>  
> -	time_left = jiffies + timeout + 1;
> +	time_left = jiffies + bus->adap.timeout / bus->adap.retries + 1;
>  	do {
>  		/*
>  		 * we must clear slave address immediately when the bus is not
> @@ -2183,6 +2176,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
>  				       write_data, read_data, read_PEC,
>  				       read_block)) {
> +		/*
> +		 * Adaptive TimeOut: estimated time in usec + 100% margin:
> +		 * 2: double the timeout for clock stretching case
> +		 * 9: bits per transaction (including the ack/nack)
> +		 */
> +		timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
> +		timeout = max_t(unsigned long, bus->adap.timeout / bus->adap.retries,
> +				usecs_to_jiffies(timeout_usec));
>  		time_left = wait_for_completion_timeout(&bus->cmd_complete,
>  							timeout);
>  
> @@ -2308,7 +2309,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
>  	adap = &bus->adap;
>  	adap->owner = THIS_MODULE;
>  	adap->retries = 3;
> -	adap->timeout = msecs_to_jiffies(35);
> +	adap->timeout = 2 * HZ;

Same here, I need some good description of why timeout is set to
2 seconds. If the datasheet says 35ms, I do not exclude that
someone in the future will send a patch saying "we don't need to
wait 2 seconds, wait 35ms as per datasheet".

Thanks,
Andi

>  	adap->algo = &npcm_i2c_algo;
>  	adap->quirks = &npcm_i2c_quirks;
>  	adap->algo_data = bus;
> -- 
> 2.34.1
> 
