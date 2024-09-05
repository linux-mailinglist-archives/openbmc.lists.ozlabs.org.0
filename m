Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD596E519
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 23:29:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0CDd1Rqlz3cFm
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 07:29:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725571773;
	cv=none; b=Ti7TpEmZCVzQsO3OUOIyVQS/3kKfJm2lRWs5QnuETuWXhQJMe/VXkRnM4qmoegloJFNce/A+txyToNxjVisJnxZVD0c0FBT7cfPMeNNsDCf6UWg4r9U4TE0MeYLYf5kcJyCxJQtHmaxAqQWBhR4g/h15+C2QQnWu81KI8BSaTT4vmpK1wztlFiEivWiYRJwhtKQB7BUC6fPqD2zddJcZrOzzq+x7oxQriMH4CJOVZeF8/DmU449YGc3vl1+h/H4V0+0CDFqHdmwfd7GX1irA0On4CjAJGUUrZTZL6G2j47Rpl1ENVz5HvsvMp308cQwSgcWaAPgKsEje9xilreevyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725571773; c=relaxed/relaxed;
	bh=1bwUkNKgfnBzoSh/xNx2hqiV7rfcMuCnF1F+pMPzMaY=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=RfVHBeKq3PZv9qmQJok87IyPkdStD1xD3jvBLM9QsIlC15idXp2mDj+090ZHnh75KEs8hcwDEzRCuz6ailRc0LOJXWFSlG8Z3sbG8CGe/r2dmIQCUrJXXYjmu1nQXdEiemjyDp2bLzt9/2gjxmr1dwUlzaRIcNUdZo0wbqDmKvddMs9TIY0IQSMmPrS8qqVjv+QhXpwIWczzTd+HhOKfovr+feFVXYJCNTCnfYHxqcvyozzqzMrIKuVgx9ZbVZPkv9eL8cwXvMGcCD8YZ8gUqXqrwAMV/wZsAH17pyrtMj76k23dbwlVCunXXXkXwCKaF4xM+sia07rlXDAEyS2Vuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mjqXgjvM; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mjqXgjvM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0CDY3Y8qz2yxP
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 07:29:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00F8FA40D59;
	Thu,  5 Sep 2024 21:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3179C4CEC3;
	Thu,  5 Sep 2024 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725571770;
	bh=OmBgrEF/RkgsDad9jaNJHIgbQrpptrQqnbEiyIW5bb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjqXgjvMKsK8Vt0qCApGNVfGH5yR5D5Bwz07M7QDar/+K6hbxnf7XRTNnLyrm02i1
	 IqwsdcCOwsfLP8X1uuHtGR/GbhrKjaukpHyHGRGXypGSDJddj4z5cAIOiCLPKaWjVn
	 +cKf2t35H+L4skI/Aw4FzITFFMFYYUB22GKP73c4ugbbloMaEX1LF9TUO1dr01f/2B
	 /WR2v9bqVoDTs3VA1K/XBf1x3qD+WB3ww7I/OZdyWgnBlmDpAwvmVu5rsLkDbt2k5n
	 zFVG2dgwxJNuhzMN5AylAjBEOvM3wpP9XvULuyzPhSNAsQ9Ep8rEM6UnI3sKN7ZSll
	 IIQJ9VY9TYYbg==
Date: Thu, 5 Sep 2024 23:29:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 2/7] i2c: npcm: correct the read/write operation
 procedure
Message-ID: <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-3-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-3-kfting@nuvoton.com>
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

Hi Tyronne,

On Fri, Aug 30, 2024 at 11:46:35AM GMT, Tyrone Ting wrote:
> Originally the driver uses the XMIT bit in SMBnST register to decide
> the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> write operation. If it's 0, then a read operation will be executed.
> 
> After checking the datasheet, the XMIT bit is valid when the i2c module
> is acting in a slave role. Use the software status to control the i2c
> transaction flow instead when the i2c module is acting in a master role.
> 
> Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")

Fixes needs to be used if you are fixing a bug (crash,
device malfunction, etc.). If you want to use it, please describe
the bug you are fixing. Otherwise, please, remove it.

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index bbcb4d6668ce..2b76dbfba438 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
>  			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
>  	/* SDA interrupt, after start\restart */
>  	} else {
> -		if (NPCM_I2CST_XMIT & i2cst) {
> -			bus->operation = I2C_WRITE_OPER;
> +		if (bus->operation == I2C_WRITE_OPER)
>  			npcm_i2c_irq_master_handler_write(bus);
> -		} else {
> -			bus->operation = I2C_READ_OPER;
> +		else if (bus->operation == I2C_READ_OPER)
>  			npcm_i2c_irq_master_handler_read(bus);

mmmhhh... you are changing the logic here and you are not
describing the logic change in the commit log.

Without looking at the details, if this is a state machine you
are breaking it.

Can anyone from the ARM/NUVOTON NPCM supporters and reviewers
take a look at this patch?

Thanks,
Andi

> -		}
>  	}
>  }
>  
> -- 
> 2.34.1
> 
