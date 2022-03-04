Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD14CDC3D
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 19:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9GNj1PTtz30QS
	for <lists+openbmc@lfdr.de>; Sat,  5 Mar 2022 05:20:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192;
 helo=3.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9GNR6Hrwz2xD4
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2022 05:19:49 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.13])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 27BC021D82;
 Fri,  4 Mar 2022 17:29:55 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 18:29:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003dca78e45-1625-4c5e-844d-e2536b520827,
 454269BBD7D092EADEDBDC9145CF0558877B405D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <67004879-96ab-33b5-f389-bbe0005d78ef@kaod.org>
Date: Fri, 4 Mar 2022 18:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [SPAM] [PATCH 1/1] mtd: spi-nor: aspeed: set the decoding size to
 at least 2MB for AST2600
Content-Language: en-US
To: Potin Lai <potin.lai@quantatw.com>, Joel Stanley <joel@jms.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>, Patrick Williams
 <patrick@stwcx.xyz>
References: <20220304170757.16924-1-potin.lai@quantatw.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220304170757.16924-1-potin.lai@quantatw.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: eeb82499-923e-455e-8036-1605182829bf
X-Ovh-Tracer-Id: 5517753972104792995
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekfeeiudekhfeujeetffevtdfhhfekheehhfdtjeekfeehieefjedvgfffgfeifeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Potin,

On 3/4/22 18:07, Potin Lai wrote:
> In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
> address offset is set to the acctual offset - 1MB. If the flash only has
> 1MB, the end address will has same value as start address, which will
> causing unexpected errors.

Yes. That's probably true.
  
> This patch set the decoding size to at least 2MB to avoid decoding errors.
>
> Tested:
> root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"

Could you send all the "aspeed-smc" logs please ? I would like to
reproduce on QEMU. You can use these machine options :

   fmc-model=<string>     - Change the FMC Flash model
   spi-model=<string>     - Change the SPI Flash model

to change the default flash device models and see how the driver reacts.
Add -trace aspeed_smc_flash_set_segment to see how the QEMU model is
configured.

> [   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST2600 Decoding)
> [   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200000 ] 2MB
> root@bletchley:~# devmem 0x1e631030
> 0x00100000

I thought devmem was banned :)

We could expose the main FMC/SPI registers under sysfs or debugfs.
The segment registers and the timing registers would be nice to
have. I can revive some experimental patch I did a few years ago.

If you have some time, could you please try the new driver based
on spi-mem ?

v3 is pushed here :

   https://github.com/legoater/linux/commits/openbmc-5.15

The patch looks correct but we also want to fix the new driver and
I have reworked the window setting part. It should be less fragile.
aspeed_spi_chip_adjust_window() still needs to handle HW quirks
though.

Thanks,

C.

> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>   drivers/mtd/spi-nor/controllers/aspeed-smc.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> index 416ea247f843..6db35732c0fb 100644
> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> @@ -781,6 +781,17 @@ static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
>   			 chip->cs, size >> 20);
>   	}
>   
> +	/*
> +	 * The decoding size of AST2600 SPI controller should set at
> +	 * least 2MB.
> +	 */
> +	if (controller->info == &spi_2600_info && size < SZ_2M) {
> +		size = SZ_2M;
> +		dev_info(chip->nor.dev,
> +			 "CE%d window resized to %dMB (AST2600 Decoding)",
> +			 chip->cs, size >> 20);
> +	}
> +
>   	ahb_base_phy = controller->ahb_base_phy;
>   
>   	/*

