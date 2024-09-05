Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994B96E503
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 23:24:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0C6H4KKdz3cFM
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 07:24:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725571444;
	cv=none; b=OsFSWhLULfTz6hcvLq9GgHQqDN0aZoiIzZ6oLrxQ5SadZweT+lOtDJjtQtU8c0efgf1V4nVWnDqTrsrLoq+su50jiao3I1ehueGJjxFtEO7fZP9PyqdZzkzyYhN84iAW0/v5qsYaxNzQEV2/h+9/F8n77Yt3EbXdKN7GeiU/19KPuwARiWDVyD2kLC+JAqB3Sk1f/H2AcE4sh1cTD6a7jwUfII0LHfkI8j2iyAOXB8MfrX1vDPtRrNz8V3RYyccsbXmk7J2upI5W/v7TdzZfwhYniVEoHAxtufjjfP9hPCof0qK7FmWaA/PjZwTZF0qaME9XeQcZm5He+Ot1ZRjKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725571444; c=relaxed/relaxed;
	bh=zC1D/y44BrImKY4P7qE8StM+oCGhlhr7yN+yFUsOiMA=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=d3EjzlS6LN04+QmJvlaOjam/6cHxmMCLs61+f0SCyUiE1k3pdeW9X4fcHMn83NJaOFcfVmDznCKacY5f7Gn6COxabryiEApENBcBC0w/taTZ819GqNf6Myglmk82mAqKoa2yYKLgqBK7U3UQISbFHhDjCI4xcz0uDFtAhnb2Byr+buXO78r8in7+ZnVEMOfn0T4Ntn2jG9x3yZAFWJdW1uvgPogGuaVz2RDWZeKjqTsFPLiC8XWtO+wfQedVy5kmHjFsf7Tk40fGpK0HQeMKM4CXAcwqsRiREADZEto/59Lh5BRkkWdK/M+fpqfR7ErLwQn7Bl62ab7ulz5DQ/rQmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vB3qGyo3; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vB3qGyo3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0C6C5v0Vz2yVV
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 07:24:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4AB80A404BA;
	Thu,  5 Sep 2024 21:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726F7C4CEC3;
	Thu,  5 Sep 2024 21:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725571440;
	bh=b3ULdFogwoeI0XvlpVirzfRUhuJ43tY9H/6dFn25c6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vB3qGyo35LrR5C41h10LIV33t3xyDtceS/qKSEAHhWj1WDAH7+lAjcSvT7wJOdMTZ
	 gu0VqPYo7BEEGeq4qjd0vvVuRFUoX0TUgUn35MI5LjJfQAUncHYCYOcoCxQ997V8WX
	 49sn5PdSFqnZEUbGWquG7epp6wRZnXrkpIgX11wPAtxJ8ooJf6wJ5LEOYHI2iOnzWD
	 mJnMvjhgbTduP1YutUQ6oGYsni/GJtxOam6Plc3ohf8fA3WcI5nxun01OxDUG1Drz6
	 37tfxXxFLK9YIhv28cmAFJCr0AWmdnINNxQPR8RFu0CbemhsLB1UHN0nXSHX57JnrG
	 SSI1MwV9twtJw==
Date: Thu, 5 Sep 2024 23:23:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <o4vds7grtpvgn34afke5vbkb5ymqqglvudi2hdb4oekz52ujs6@ymuhslhr5oh7>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830034640.7049-2-kfting@nuvoton.com>
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

On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> The original design supports 10 slave addresses although only 2

please remember that the "slave" term has been replaced by the
"target" term. I will change it when applying the patch.

> addresses are required for current implementation.
> 
> Restore the npcm_i2caddr array length to fix the smatch warning.
> 
> Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")

I don't think the Fixes tag is necessary here. This change is
primarily addressing a static analyzer warning. While some cases
come close to a buffer overflow, it couldn’t have occurred in
practice since we don't actually have the devices listed in
npcm_i2caddr[].

> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2fe68615942e..bbcb4d6668ce 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -136,11 +136,13 @@ enum i2c_addr {
>   * Since the addr regs are sprinkled all over the address space,
>   * use this array to get the address or each register.
>   */
> -#define I2C_NUM_OWN_ADDR 2
> +#define I2C_NUM_OWN_ADDR 10
>  #define I2C_NUM_OWN_ADDR_SUPPORTED 2
>  
>  static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
> -	NPCM_I2CADDR1, NPCM_I2CADDR2,
> +	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
> +	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
> +	NPCM_I2CADDR9, NPCM_I2CADDR10,

Looks a bit hacky, but serves the purpose.

The core issue in "npcm_i2c_slave_enable()" is the lack of an
upper boundary check, which could potentially lead to a buffer
overflow. In practice, we rely on the assumption that these
addresses don’t exist in the real world.

An easier fix could have been:

@@ -629,7 +629,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus, enum i2c_addr addr_type,
        if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10)
                dev_err(bus->dev, "try to enable more than 2 SA not supported\n");

-       if (addr_type >= I2C_ARP_ADDR)
+       if (addr_type > I2C_SLAVE_ADDR2)
                return -EFAULT;

        /* Set and enable the address */

But yours is a bit more robust, so that I'm going to take this
patch.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

>  };
>  #endif
>  
> -- 
> 2.34.1
> 
