Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 933BA9A5C16
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 09:09:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX5yl5Bc7z3c3s
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 18:09:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729494557;
	cv=none; b=ZRbNhhwivMw3tJI1oKL2iO+WHo+uNCxdxf/6BtEzh5guVvCij6mnOw67RIrZL/4pC1bEbRPmHykS0EFAiA8FNA9mP5U8NnhVHvoNlOCKiXoMclF/Y2p3QYN8E0l0x+6rr0WEnduWeCjz3UZWAQ9R6RVkcGWh1HZMyQzGQfBz8/eOStorN4vDt38uk1SFJkcQSwGzFIa5jh8j50CBph1tqNVmeSENeylFuYI04KdQm76PiNEV0MMzNwlZCG7aRXrUh+ssNYIDRLgJiw/TKfBSl3CXXnmXfnqwoXBhoZBYMdzsj/aIQsFdmroqea4X1dvfX9sPyGmgIYgRqhurzKtOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729494557; c=relaxed/relaxed;
	bh=FWN37IOsnSyqzVeNfqfDtalLBvAaQtzuphzF5x+YUzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgOZ0pRTjk53IyycwkHpZOHVcq8YCb1V4gyWRRpDKIf0zeLh0EtMTMHpcb+tQiE2bJKlDqXmmnANhcxB0xMO9MpmPvIOfS0kdrk+OZ7CjAyjklkWBHU63S+5kgQ0WPid0s+cG5n2rgkoN9dCPdxt++YKGHIVyfsw1alOQjD0pagaDueODda7eLAxcDeesBwdBgc3exh/Hv4Ark3AXPiyyd1ukolzcZvKChCqft9s57qXCXubSUS4uaIqDXgVAJ38xebVrznlUu5X+s90+iqbVabx532SG8FDTWhqU0oy5JP2BYp4bp5BK9NDuEB3PR5I1HFQjYr0Z1/+/FaY9r7ZBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 438 seconds by postgrey-1.37 at boromir; Mon, 21 Oct 2024 18:09:15 AEDT
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX5yg4nYRz2xBb
	for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2024 18:09:15 +1100 (AEDT)
Received: from [192.168.0.224] (ip5f5ae835.dynamic.kabel-deutschland.de [95.90.232.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 92D0261E5FE05;
	Mon, 21 Oct 2024 09:01:15 +0200 (CEST)
Message-ID: <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de>
Date: Mon, 21 Oct 2024 09:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Tyrone Ting <warp5tw@gmail.com>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-3-kfting@nuvoton.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20241021062732.5592-3-kfting@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Tyrone,


Thank you for your patch.

Am 21.10.24 um 08:27 schrieb Tyrone Ting:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Store the client address earlier since it might get called in
> the i2c_recover_bus() logic flow at the early stage of
> npcm_i2c_master_xfer().

Thank you for the description. For the summary/title it’d be great, if 
you were more specific. For example:

i2c: npcm: Assign client address earlier for `i2c_recover_bus()`

It’d be great if you noted the commit, your patch fixes, so it’s clear 
since when the problem has been present.

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Tali Perry <tali.perry1@gmail.com>
> ---
>   drivers/i2c/busses/i2c-npcm7xx.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index c96a25d37c14..a9a9b21f1f0b 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2155,6 +2155,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   
>   	} while (time_is_after_jiffies(time_left) && bus_busy);
>   
> +	/*
> +	 * Previously, the 7-bit address was stored and being converted to
> +	 * the address of event in the following call to npcm_i2c_master_start_xmit().
> +	 *
> +	 * Since there are cases that the i2c_recover_bus() gets called at the
> +	 * early stage of npcm_i2c_master_xfer(), the address of event is stored
> +	 * and then used in the i2c_recover_bus().
> +	 */
> +	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);
> +
>   	/*
>   	 * Check the BER (bus error) state, when ber_state is true, it means that the module
>   	 * detects the bus error which is caused by some factor like that the electricity
> @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	 * bus is busy.
>   	 */
>   	if (bus_busy || bus->ber_state) {
> +		/*
> +		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
> +		 * from the bus->dest_addr for the i2c_recover_bus() call later.
> +		 *
> +		 * The i2c_recover_bus() uses the address in a write direction to recover
> +		 * the i2c bus if some error condition occurs.
> +		 */
> +		bus->dest_addr &= ~I2C_M_RD;
> +
>   		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
>   		npcm_i2c_reset(bus);
>   		i2c_recover_bus(adap);
> @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	}
>   
>   	npcm_i2c_init_params(bus);
> -	bus->dest_addr = slave_addr;
>   	bus->msgs = msgs;
>   	bus->msgs_num = num;
>   	bus->cmd_err = 0;


Kind regards,

Paul
