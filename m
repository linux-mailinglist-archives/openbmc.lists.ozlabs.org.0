Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDE314D1A9
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 21:02:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487DtB29zdzDqTd
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 07:02:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=rjv5RFPq; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487DsD2zGjzDqSk
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 07:01:51 +1100 (AEDT)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B276F2067C;
 Wed, 29 Jan 2020 20:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580328109;
 bh=eUqnYUa8xJcvz8vjf0xZN38k+FZQvoRAsBz21Xm6sZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rjv5RFPqGSLFBb+bMIdmwauMlY6BQgrgduh+b+BbCWLmSNE5sAYkGdk3gjtU5l0cm
 yM1Mevx+pg8NIM1pZfvo4qhbpqD3PvHGA8bqty+FHme7kVyyJLyOe0Au3HwLzHqd3c
 2zZHeagcFw2DxanCXC2NByH9ip34n2nnY56U3X64=
Date: Wed, 29 Jan 2020 20:01:43 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: modify NPCM reset support
Message-ID: <20200129200143.08bf4a91@archlinux>
In-Reply-To: <20200119110032.124745-2-tmaimon77@gmail.com>
References: <20200119110032.124745-1-tmaimon77@gmail.com>
 <20200119110032.124745-2-tmaimon77@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 benjaminfair@google.com, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 19 Jan 2020 13:00:32 +0200
Tomer Maimon <tmaimon77@gmail.com> wrote:

> Modify NPCM ADC reset support from
> direct register access to reset controller support.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Hmm.  This presumably breaks all old DT. 

If that's not a problem please say why.

Jonathan

> ---
>  drivers/iio/adc/npcm_adc.c | 30 +++++++++---------------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> index a6170a37ebe8..83bad2d5575d 100644
> --- a/drivers/iio/adc/npcm_adc.c
> +++ b/drivers/iio/adc/npcm_adc.c
> @@ -14,6 +14,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
>  #include <linux/uaccess.h>
> +#include <linux/reset.h>
>  
>  struct npcm_adc {
>  	bool int_status;
> @@ -23,13 +24,9 @@ struct npcm_adc {
>  	struct clk *adc_clk;
>  	wait_queue_head_t wq;
>  	struct regulator *vref;
> -	struct regmap *rst_regmap;
> +	struct reset_control *reset;
>  };
>  
> -/* NPCM7xx reset module */
> -#define NPCM7XX_IPSRST1_OFFSET		0x020
> -#define NPCM7XX_IPSRST1_ADC_RST		BIT(27)
> -
>  /* ADC registers */
>  #define NPCM_ADCCON	 0x00
>  #define NPCM_ADCDATA	 0x04
> @@ -106,13 +103,11 @@ static int npcm_adc_read(struct npcm_adc *info, int *val, u8 channel)
>  					       msecs_to_jiffies(10));
>  	if (ret == 0) {
>  		regtemp = ioread32(info->regs + NPCM_ADCCON);
> -		if ((regtemp & NPCM_ADCCON_ADC_CONV) && info->rst_regmap) {
> +		if (regtemp & NPCM_ADCCON_ADC_CONV) {
>  			/* if conversion failed - reset ADC module */
> -			regmap_write(info->rst_regmap, NPCM7XX_IPSRST1_OFFSET,
> -				     NPCM7XX_IPSRST1_ADC_RST);
> +			reset_control_assert(info->reset);
>  			msleep(100);
> -			regmap_write(info->rst_regmap, NPCM7XX_IPSRST1_OFFSET,
> -				     0x0);
> +			reset_control_deassert(info->reset);
>  			msleep(100);
>  
>  			/* Enable ADC and start conversion module */
> @@ -186,7 +181,6 @@ static int npcm_adc_probe(struct platform_device *pdev)
>  	struct npcm_adc *info;
>  	struct iio_dev *indio_dev;
>  	struct device *dev = &pdev->dev;
> -	struct device_node *np = pdev->dev.of_node;
>  
>  	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
>  	if (!indio_dev)
> @@ -199,6 +193,10 @@ static int npcm_adc_probe(struct platform_device *pdev)
>  	if (IS_ERR(info->regs))
>  		return PTR_ERR(info->regs);
>  
> +	info->reset = devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(info->reset))
> +		return PTR_ERR(info->reset);
> +
>  	info->adc_clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(info->adc_clk)) {
>  		dev_warn(&pdev->dev, "ADC clock failed: can't read clk\n");
> @@ -211,16 +209,6 @@ static int npcm_adc_probe(struct platform_device *pdev)
>  	div = div >> NPCM_ADCCON_DIV_SHIFT;
>  	info->adc_sample_hz = clk_get_rate(info->adc_clk) / ((div + 1) * 2);
>  
> -	if (of_device_is_compatible(np, "nuvoton,npcm750-adc")) {
> -		info->rst_regmap = syscon_regmap_lookup_by_compatible
> -			("nuvoton,npcm750-rst");
> -		if (IS_ERR(info->rst_regmap)) {
> -			dev_err(&pdev->dev, "Failed to find nuvoton,npcm750-rst\n");
> -			ret = PTR_ERR(info->rst_regmap);
> -			goto err_disable_clk;
> -		}
> -	}
> -
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0) {
>  		ret = -EINVAL;

