Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F84234BD
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 02:04:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPF7d17w4z2yV5
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 11:04:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Z1tmXIJ1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=Z1tmXIJ1; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HPF791NXMz2yKK;
 Wed,  6 Oct 2021 11:04:20 +1100 (AEDT)
Received: by linux.microsoft.com (Postfix, from userid 1046)
 id D8A1C20B861E; Tue,  5 Oct 2021 17:03:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D8A1C20B861E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1633478627;
 bh=Lba9wJEZ48njfaVv79S/RD8k06p4EsANJ/0HCRU1yKM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z1tmXIJ1YElDF76BCq50LrBsRxfIyeMYNGIXdZvUB1ikVsM92HjWmTlGOc3YsEXoL
 7Tj043DIAAMst2f3czz/PcRI8/AwSiIU5oIOSd2+ZW8vHm2Igf5ILftBNUKFUGKF/M
 iJ70OmGEujqxsd0Pi/QyxnQF06Ro/tIuJVGAyeuU=
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
To: zev@bewilderbeest.net
Subject: Re: [PATCH 3/6] mtd: spi-nor: aspeed: Refactor
 registration/unregistration
Date: Tue,  5 Oct 2021 17:03:14 -0700
Message-Id: <1633478594-16793-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20210929115409.21254-4-zev@bewilderbeest.net>
References: <20210929115409.21254-4-zev@bewilderbeest.net>
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
Cc: vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, tudor.ambarus@microchip.com,
 andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, richard@nod.at, michael@walle.cc,
 linux-mtd@lists.infradead.org, Dhananjay Phadke <dphadke@linux.microsoft.com>,
 miquel.raynal@bootlin.com, jk@codeconstruct.com.au, p.yadav@ti.com,
 linux-arm-kernel@lists.infradead.org, clg@kaod.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 29 Sep 2021, Zev Weiss wrote:

> We now have separate functions for registering and unregistering
> individual flash chips, instead of the entire controller.  This is a
> preparatory step for allowing userspace to request that a specific
> chip be attached or detached at runtime.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
> drivers/mtd/spi-nor/controllers/aspeed-smc.c | 73 ++++++++++++--------
> 1 file changed, 45 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> index 7225870e8b18..3c153104a905 100644
> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> @@ -107,9 +107,10 @@ struct aspeed_smc_controller {
> 	const struct aspeed_smc_info *info;	/* type info of controller */
> 	void __iomem *regs;			/* controller registers */
> 	void __iomem *ahb_base;			/* per-chip windows resource */
> +	struct resource *ahb_res;		/* resource for AHB address space */
> 	u32 ahb_window_size;			/* full mapping window size */
>
> -	struct aspeed_smc_chip *chips[];	/* pointers to attached chips */
> +	struct aspeed_smc_chip *chips[];	/* pointers to connected chips */
> };
>
> /*
> @@ -399,15 +400,24 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
> 	return len;
> }
>
> +static int aspeed_smc_unregister_chip(struct aspeed_smc_chip *chip)
> +{
> +	return mtd_device_unregister(&chip->nor.mtd);
> +}
> +
> static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
> {
> 	struct aspeed_smc_chip *chip;
> -	int n;
> +	int n, ret;
>
> 	for (n = 0; n < controller->info->nce; n++) {
> 		chip = controller->chips[n];
> -		if (chip)
> -			mtd_device_unregister(&chip->nor.mtd);
> +		if (chip) {
> +			ret = aspeed_smc_unregister_chip(chip);
> +			if (ret)
> +				dev_warn(controller->dev, "failed to unregister CS%d: %d\n",
> +				         n, ret);
> +		}
> 	}
>
> 	return 0;
> @@ -756,14 +766,39 @@ static const struct spi_nor_controller_ops aspeed_smc_controller_ops = {
> 	.write = aspeed_smc_write_user,
> };
>
> -static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
> -				  struct device_node *np, struct resource *r)
> +static int aspeed_smc_register_chip(struct aspeed_smc_chip *chip)
> {
> -	const struct spi_nor_hwcaps hwcaps = {
> +	static const struct spi_nor_hwcaps hwcaps = {
> 		.mask = SNOR_HWCAPS_READ |
> 			SNOR_HWCAPS_READ_FAST |
> 			SNOR_HWCAPS_PP,
> 	};
> +	int ret;
> +
> +	ret = aspeed_smc_chip_setup_init(chip, chip->controller->ahb_res);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * TODO: Add support for Dual and Quad SPI protocols attach when board
> +	 * support is present as determined by of property.
> +	 */
> +	ret = spi_nor_scan(&chip->nor, NULL, &hwcaps);
> +	if (ret)
> +		goto out;
> +
> +	ret = aspeed_smc_chip_setup_finish(chip);
> +	if (ret)
> +		goto out;
> +
> +	ret = mtd_device_register(&chip->nor.mtd, NULL, 0);
> +out:
> +	return ret;
> +}

I was looking into this driver probe walking sub-nodes.

It looks like all controller drivers are doing / have to do similar work -

(1) Parse common dt bindings documented in Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
(2) Run spi_nor_scan() with tweaked/reduced capabilities.
(3) mtd_register_device().

It would be good to absorb this workflow in mtd/spi-nor core and add 'reserved' as common
dt property to avoid (2) and (3) from probe.


Regards,
Dhananjay

