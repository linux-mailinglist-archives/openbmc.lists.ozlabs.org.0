Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1A6986790
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 22:22:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDSnx1pfpz3c75
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2024 06:22:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727295746;
	cv=none; b=G/jQCY9f+O94pCivTEDW+Atfb8Trsh10c38qAQiiKhbkpCq9pRGrZHKDtEiwEMQIYy7uknFheSVjB8n6c9aThrP7VV2JVNLilrbV0jNuRy1dx+FRUJaIMr7wSuxnM0yKQyNpd8AkeiNB2bQr6OMhp7GFJxVm7kUz5AsEEAsqcW6i32wZT0codgM/TJQnrefmiDWgYfNWE2pvmcxkF16fpg9A2K4Z/8YhynJtaAgalrVE2DyHs18FNkikS6pAjc0uagTp9UjShJ6oMuY8qLK3RO6T/Fml4HP2YxYyMhH0xQed2g/Ro3nhMyHIA4ffwe/WuCnDBvSh8bzbihUwiWwoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727295746; c=relaxed/relaxed;
	bh=0Yh50c9w+YK/1nnA5mRQZa8xGY8o56oLs4mhBiUZ+Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVN7Q9p2mzSpPZ0BnNFWHaIu6+vA5ltk5bXNsfkaCYCw46qXLxoUc7DvVDrzEssmA9+CQMazLxZGLVR++H8REIaWbi8CB7P55QpBXjYX9XWwfMuRJcBcEyjfJm51a/8J7gNONGiTbm5ufE4Sx69J0OvZ5d3F4LiVzAC7sxIw+jni9yc1KfC2ay85bXs3UFtVPsf3ocLoeeTADBztgeBaELmSUo+0mvaSP5Ma9tA3dghWDIrj5xrllG4ZQR7iFY3rsU18Ds+glmP8WTLQ2pDvSgDsnxSHtjE6YzDogpt7WeonoUx7gxLKI62aGG4frA9QuLNghjQodEuZS+1w4jRcVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rXloNiwu; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rXloNiwu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDSnt1YY7z2yRD
	for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2024 06:22:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD8335C0521;
	Wed, 25 Sep 2024 20:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA632C4CEC3;
	Wed, 25 Sep 2024 20:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727295743;
	bh=IYT0NZPI+6ZXgmuWyku06saAwAd0cl9dv1o2DqjdDBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXloNiwu/ChGh+4tTEN5C53VTxiRNWdO7yYqWBP/J9WPobh8Z8GqaVkRrIljYvgYD
	 gPbeAfYrh6As5fc0ReHD52Zo2AplgEaJsfTw4BLokqaB6OIgdtBnw+rTrHxuT6rezi
	 a3mj9moFzGL3OiC+pl/FFB394e0L0GKHXfgXp9iG1O6dNGrLA350896Xm0EN5sDs7i
	 jtPHk96f8BY+JTD9IqeBlz5Z6y12KSz+hrYqZIW68YAq+qVR0Ft3qRU5UEJd7bwW0n
	 /CLhqpBn+txVzkn/lt25Qh+9QkI3vEfliJ99GGI4+6sRt//7YW3vMxpoSqm1yQVPoi
	 yfvXkOS1K+yCw==
Date: Wed, 25 Sep 2024 22:22:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: warp5tw@gmail.com
Subject: Re: [PATCH v4 2/6] i2c: npcm: use a software flag to indicate a BER
 condition
Message-ID: <5mxsciw6443k5rlpymrs7addvme53f5v3zuj5u7tvlggfeirik@dy2bvyz2lyue>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-3-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-3-kfting@nuvoton.com>
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

patch looks good, but...

On Fri, Sep 20, 2024 at 06:18:16PM GMT, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> If not clearing the BB (bus busy) condition in the BER (bus error)
> interrupt, the driver causes a timeout and hence the i2c core
> doesn't do the i2c transfer retry but returns the driver's return
> value to the upper layer instead.
> 
> Clear the BB condition in the BER interrupt and a software flag is
> used. The driver does an i2c recovery without causing the timeout
> if the flag is set.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2b76dbfba438..2d034503d8bc 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -334,6 +334,7 @@ struct npcm_i2c {
>  	u64 nack_cnt;
>  	u64 timeout_cnt;
>  	u64 tx_complete_cnt;
> +	bool ber_state;

I need some comment here, what is this ber state? You described
it in the commit log, but people won't be browsing much of the
commit log rather than the code itself.

You could perhaps mention the meaning as:

	bool ber_state; /* brief description */

and...

>  };
>  
>  static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
> @@ -1521,6 +1522,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
>  	if (npcm_i2c_is_master(bus)) {
>  		npcm_i2c_master_abort(bus);
>  	} else {
> +		bus->ber_state = true;
>  		npcm_i2c_clear_master_status(bus);
>  
>  		/* Clear BB (BUS BUSY) bit */
> @@ -1699,6 +1701,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
>  		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
>  			bus->num, bus->dest_addr);
>  		npcm_i2c_reset(bus);
> +		bus->ber_state = false;
>  		return 0;
>  	}
>  
> @@ -1763,6 +1766,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
>  		if (bus->rec_succ_cnt < ULLONG_MAX)
>  			bus->rec_succ_cnt++;
>  	}
> +	bus->ber_state = false;
>  	return status;
>  }
>  
> @@ -2158,7 +2162,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  	} while (time_is_after_jiffies(time_left) && bus_busy);
>  
> -	if (bus_busy) {
> +	if (bus_busy || bus->ber_state) {

/*
 * Check the BER (bus error) state, if it's true means that blah
 * blah blah, while when it's false blah blah blah and we should
 * or should not do blah blah blah
 */
if (bus_busy || bus->ber_state) {
	...
}

Thanks,
Andi

>  		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
>  		npcm_i2c_reset(bus);
>  		i2c_recover_bus(adap);
> -- 
> 2.34.1
> 
