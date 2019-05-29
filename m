Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763A2E655
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 22:38:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DjGY3cbmzDqMM
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 06:38:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.72.44; helo=9.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4629 seconds by postgrey-1.36 at bilbo;
 Thu, 30 May 2019 06:38:03 AEST
Received: from 9.mo173.mail-out.ovh.net (9.mo173.mail-out.ovh.net
 [46.105.72.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DjG35ctyzDqCh
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 06:37:59 +1000 (AEST)
Received: from player691.ha.ovh.net (unknown [10.108.42.239])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 1E14310B4CD
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 21:20:44 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 92F036681DE9;
 Wed, 29 May 2019 19:20:40 +0000 (UTC)
Subject: Re: [PATCH qemu] aspeed: Add support for the swift-bmc board
To: Adriana Kobylak <anoo@linux.ibm.com>, joel@jms.id.au,
 openbmc@lists.ozlabs.org
References: <1559156960-61184-1-git-send-email-anoo@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2208594f-3020-bfa9-81eb-0c14dc333ca8@kaod.org>
Date: Wed, 29 May 2019 21:20:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1559156960-61184-1-git-send-email-anoo@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15820019591561907080
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddvjedgudeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/05/2019 21:09, Adriana Kobylak wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
> 
> The Swift board is an OpenPOWER system hosting POWER processors.
> Add support for their BMC including the I2C devices as found on HW.
> 
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

This looks good ! 

Could you please run ./scripts/checkpatch.pl on your patch and send 
to mainline ? You will need to copy a few people and mailing lists.
Run ./scripts/get_maintainer.pl to know who. 

When done, you can add :

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 465e65f..db68bbf 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -70,6 +70,9 @@ struct AspeedBoardState {
>          SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
>          SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
>  
> +/* TODO: Swift hardware value: ? (use romulus definition for now) */
> +#define SWIFT_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> +
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>  
> @@ -290,6 +293,35 @@ static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338", 0x32);
>  }
>  
> +static void swift_bmc_i2c_init(AspeedBoardState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552", 0x60);
> +
> +    /* The swift board expects a TMP275 but a TMP105 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105", 0x48);
> +    /* The swift board expects a pca9551 but a pca9552 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "pca9552", 0x60);
> +
> +    /* The swift board expects an Epson RX8900 I2C RTC but a ds1338 is
> +     * good enough */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "ds1338", 0x32);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552", 0x60);
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp423", 0x4c);
> +    /* The swift board expects a pca9539 but a pca9552 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "pca9552", 0x74);
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "tmp423", 0x4c);
> +    /* The swift board expects a pca9539 but a pca9552 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "pca9552", 0x74);
> +
> +    /* The swift board expects a TMP275 but a TMP105 is compatible */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105", 0x48);
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105", 0x4a);
> +}
> +
>  static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> @@ -400,6 +432,15 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .num_cs    = 2,
>          .i2c_init  = romulus_bmc_i2c_init,
>      }, {
> +        .name      = MACHINE_TYPE_NAME("swift-bmc"),
> +        .desc      = "OpenPOWER Swift BMC (ARM1176)",
> +        .soc_name  = "ast2500-a1",
> +        .hw_strap1 = SWIFT_BMC_HW_STRAP1,
> +        .fmc_model = "mx66l1g45g",
> +        .spi_model = "mx66l1g45g",
> +        .num_cs    = 2,
> +        .i2c_init  = swift_bmc_i2c_init,
> +    }, {
>          .name      = MACHINE_TYPE_NAME("witherspoon-bmc"),
>          .desc      = "OpenPOWER Witherspoon BMC (ARM1176)",
>          .soc_name  = "ast2500-a1",
> 

