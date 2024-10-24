Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7809AE203
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 12:04:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ1j71vcjz3c4l
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2024 21:04:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729764248;
	cv=none; b=AM2lMrzlBpWRELM8JPXJ1Bj7gX5kXzyyMZ/rY3xiHpZWmLMIwlTTiudeteLXIigdmqlcmdJDPphypNUiLma+Ko9OJX1IhW1S4BjRB08sxTATqGvApeKtSgC5DqLDNIWwp/eZ4FOLwzdq0JsAsiDyCZtOQSNr/S+k7gRvw0tlH7YEZ7yiyhAygAq9SCj1LyyDeBdf6NhjkJl40QK54sqFgVn3zI8mxSkhqgsJQhLKvODZBJq/1XpLrnRagaAmg5T3Gs7g0tniJDULke3L1zihW58YnoOCtRw0ePZEI8M/hXm+KU+MtRFwxXx/1rgjZNPFCdgAd+jKLUNFqGAUkftX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729764248; c=relaxed/relaxed;
	bh=nFDkW+0IEc7tuCOTVpx+RsOxnpyr5OTDfb7y2Wf47Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idrMTUzgwPXWWVMnYJcHFupZB6AiakMp7H681KQMnTxmduoZe6iQ1JkFj9Tr2V6+jdlHFCoF0kIwAmq3hKeSsCIbOG7hzZ0U3UKdoNA/o5kA5i6ICvBjcj623pRRV7Qk9cxMo0s7Z5M7f73ECdnSr9oucKHTvJeOlDqyz1M7RPR9GwG1wSMKecOBqJE2NorcRTDYFiMbR4ZRxI1JH/LzzHHblMe6NRoi+b4tB91mmcCk5yDG8U4nmtnt9sa4M8qxEyT6QSXsS6d8XLdaPfLKoLwc7FB3vkpMQPpU9b5urLivO5rhOqnp2HeGmmizvcIwzBibLwaMOMQuL5k+XDw63g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cfMH7Pt3; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cfMH7Pt3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ1j35Qg3z2yYk
	for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2024 21:04:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD23CA452F9;
	Thu, 24 Oct 2024 10:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C975C4CEC7;
	Thu, 24 Oct 2024 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729764244;
	bh=DCLSjyVxD4E+9mxp2TmkqInRMBTjZIgH6PevLvpjvDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfMH7Pt3Slfn+IkPJz+EEREtdoLxD4HMjtuOFx/Gm7sM35LGlmr0ywDNu4huJVpIX
	 RSXbv/2Gj3QUZuV28TlHmMcXkCabzFJQvgufTSjZg7Nu8uy3QEtUqCbyafwaO2jtaq
	 aCIYypoI/wWQzULj5o2IIS/ba+Px59gAZOsf8QCoq2bv/c51J2f3+wxxsPd+moVox7
	 WZzVl+ZKQ3R2pP+lgBrR2IGh4PK5Xa6+hHHI7Br7uV2yrH4jB2p0/bBmhhDbCrd9Pd
	 CiiuRrG8rGAmIoCxLyhxOa4U+N9wVsgcUbe5shl/HrqJ3wCOCPKGki42biep3qH/8v
	 Imp7nB2S5Sl4Q==
Date: Thu, 24 Oct 2024 12:03:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-3-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021062732.5592-3-kfting@nuvoton.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

> +	/*
> +	 * Previously, the 7-bit address was stored and being converted to
> +	 * the address of event in the following call to npcm_i2c_master_start_xmit().

Do we care how it was done previously? I think this is not a
useful information as the code readers will se the code the way
it is now, not the way it was done "previously".

(there is a related comment at the end)

> +	 * Since there are cases that the i2c_recover_bus() gets called at the
> +	 * early stage of npcm_i2c_master_xfer(), the address of event is stored
> +	 * and then used in the i2c_recover_bus().

I could rephrase this sentence to something like:

/*
 * Store the address early in a global position to ensure it is
 * accessible for a potential call to i2c_recover_bus().
 */

> +	 */
> +	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);
> +
>  	/*
>  	 * Check the BER (bus error) state, when ber_state is true, it means that the module
>  	 * detects the bus error which is caused by some factor like that the electricity
> @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	 * bus is busy.
>  	 */
>  	if (bus_busy || bus->ber_state) {
> +		/*
> +		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
> +		 * from the bus->dest_addr for the i2c_recover_bus() call later.
> +		 *
> +		 * The i2c_recover_bus() uses the address in a write direction to recover
> +		 * the i2c bus if some error condition occurs.
> +		 */
> +		bus->dest_addr &= ~I2C_M_RD;
> +
>  		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
>  		npcm_i2c_reset(bus);
>  		i2c_recover_bus(adap);
> @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	}
>  
>  	npcm_i2c_init_params(bus);
> -	bus->dest_addr = slave_addr;

We can now get rid of slave_addr. It's just used in
npcm_i2c_master_start_xmit(). Right?

Andi

>  	bus->msgs = msgs;
>  	bus->msgs_num = num;
>  	bus->cmd_err = 0;
> -- 
> 2.34.1
> 
