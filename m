Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B29573AE7
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 18:12:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjjLk5nkZz3c6H
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 02:12:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z4h44caK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z4h44caK;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjjLH4MgTz3c2d
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 02:11:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A7EBDB820D5;
	Wed, 13 Jul 2022 16:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30801C34114;
	Wed, 13 Jul 2022 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657728705;
	bh=xKgCGVq47wtNXtj8TX6Re2zKYRejln4t9WqBUbpnVhE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z4h44caKqvqkIvqs6HwQUOqADIwkLjFK//iczkKgVOJrp/Eas6LK4iyLCD4Ov5k2G
	 BqGD/3kXLf7rE5BaYi3JLXh9b15l1aCsvyyYQWwtQs33kMSVTTS0h9oSvqYhvZ/qVu
	 aMGgz2kWO5W/9QNWb0NnctlyYTVmDKuy/GhcbdEa8V9qdJftMCwIrWDzU/XRrB6IzY
	 dhN/9wTMVkywR+n7Uw5rZTYBi3ARAaMUMS3PqKhsYDGzwW+8dif2F8cbWziuzDhiVV
	 cHoPYWSwX9w7M+Xi7Cw+/yZrFzmCvosbIpXPPsZ/IHXCAyKej9PpFDNCNLEvTatqaL
	 Knll34e5QIt2Q==
Date: Wed, 13 Jul 2022 17:21:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v3 2/2] iio: adc: npcm: Add NPCM8XX support
Message-ID: <20220713172132.0bc5002d@jic23-huawei>
In-Reply-To: <20220713132640.215916-3-tmaimon77@gmail.com>
References: <20220713132640.215916-1-tmaimon77@gmail.com>
	<20220713132640.215916-3-tmaimon77@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, linux-iio@vger.kernel.org, tali.perry1@gmail.com, zhengbin13@huawei.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jul 2022 16:26:40 +0300
Tomer Maimon <tmaimon77@gmail.com> wrote:

> Adding ADC NPCM8XX support to NPCM ADC driver.
> ADC NPCM8XX uses a different resolution and voltage reference.
> 
> As part of adding NPCM8XX support:
> - Add NPCM8XX specific compatible string.
> - Add data to handle architecture-specific ADC parameters.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
missing 

#include <linux/property.h> 

So in current IIO togreg tree this doesn't build.  I could fix it up
but given we are very late in cycle and I'd like to give this a little
more time on list for Andy to take another look if he wishes, chances
are this won't make it in until early next cycle.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/npcm_adc.c | 35 ++++++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> index f7bc0bb7f112..4c7ebcd57b88 100644
> --- a/drivers/iio/adc/npcm_adc.c
> +++ b/drivers/iio/adc/npcm_adc.c
> @@ -16,6 +16,12 @@
>  #include <linux/uaccess.h>
>  #include <linux/reset.h>
>  
> +struct npcm_adc_info {
> +	u32 data_mask;
> +	u32 internal_vref;
> +	u32 res_bits;
> +};
> +
>  struct npcm_adc {
>  	bool int_status;
>  	u32 adc_sample_hz;
> @@ -34,6 +40,7 @@ struct npcm_adc {
>  	 * has finished.
>  	 */
>  	struct mutex lock;
> +	const struct npcm_adc_info *data;
>  };
>  
>  /* ADC registers */
> @@ -52,13 +59,21 @@ struct npcm_adc {
>  #define NPCM_ADCCON_CH(x)		((x) << 24)
>  #define NPCM_ADCCON_DIV_SHIFT		1
>  #define NPCM_ADCCON_DIV_MASK		GENMASK(8, 1)
> -#define NPCM_ADC_DATA_MASK(x)		((x) & GENMASK(9, 0))
>  
>  #define NPCM_ADC_ENABLE		(NPCM_ADCCON_ADC_EN | NPCM_ADCCON_ADC_INT_EN)
>  
>  /* ADC General Definition */
> -#define NPCM_RESOLUTION_BITS		10
> -#define NPCM_INT_VREF_MV		2000
> +static const struct npcm_adc_info npxm7xx_adc_info = {
> +	.data_mask = GENMASK(9, 0),
> +	.internal_vref = 2048,
> +	.res_bits = 10,
> +};
> +
> +static const struct npcm_adc_info npxm8xx_adc_info = {
> +	.data_mask = GENMASK(11, 0),
> +	.internal_vref = 1229,
> +	.res_bits = 12,
> +};
>  
>  #define NPCM_ADC_CHAN(ch) {					\
>  	.type = IIO_VOLTAGE,					\
> @@ -129,7 +144,8 @@ static int npcm_adc_read(struct npcm_adc *info, int *val, u8 channel)
>  	if (ret < 0)
>  		return ret;
>  
> -	*val = NPCM_ADC_DATA_MASK(ioread32(info->regs + NPCM_ADCDATA));
> +	*val = ioread32(info->regs + NPCM_ADCDATA);
> +	*val &= info->data->data_mask;
>  
>  	return 0;
>  }
> @@ -157,9 +173,9 @@ static int npcm_adc_read_raw(struct iio_dev *indio_dev,
>  			vref_uv = regulator_get_voltage(info->vref);
>  			*val = vref_uv / 1000;
>  		} else {
> -			*val = NPCM_INT_VREF_MV;
> +			*val = info->data->internal_vref;
>  		}
> -		*val2 = NPCM_RESOLUTION_BITS;
> +		*val2 = info->data->res_bits;
>  		return IIO_VAL_FRACTIONAL_LOG2;
>  	case IIO_CHAN_INFO_SAMP_FREQ:
>  		*val = info->adc_sample_hz;
> @@ -176,7 +192,8 @@ static const struct iio_info npcm_adc_iio_info = {
>  };
>  
>  static const struct of_device_id npcm_adc_match[] = {
> -	{ .compatible = "nuvoton,npcm750-adc", },
> +	{ .compatible = "nuvoton,npcm750-adc", .data = &npxm7xx_adc_info},
> +	{ .compatible = "nuvoton,npcm845-adc", .data = &npxm8xx_adc_info},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, npcm_adc_match);
> @@ -196,6 +213,10 @@ static int npcm_adc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	info = iio_priv(indio_dev);
>  
> +	info->data = device_get_match_data(dev);
> +	if (!info->data)
> +		return -EINVAL;
> +
>  	mutex_init(&info->lock);
>  
>  	info->dev = &pdev->dev;

