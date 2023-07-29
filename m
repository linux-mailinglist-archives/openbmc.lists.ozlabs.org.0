Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD776805A
	for <lists+openbmc@lfdr.de>; Sat, 29 Jul 2023 17:25:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DXIuVi0l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCpGT5rYJz3cRH
	for <lists+openbmc@lfdr.de>; Sun, 30 Jul 2023 01:25:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DXIuVi0l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCpFs54pCz2yhS
	for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2023 01:24:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AD1460C5A;
	Sat, 29 Jul 2023 15:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99A4C433C8;
	Sat, 29 Jul 2023 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690644269;
	bh=hKEFqZwbeqN1jWVTICiTdix0xi9S3l3WhmAf3G/bhw8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DXIuVi0lnqRhkPrO7HEhjVV7w4vUZJUJc2bfqFd/hImxHTjYPoqL6ZhRDsO0FVgI8
	 9iaMs3y/WORFZZxKljp0adeX46AXj5yvUIScZr6pJywg4SOMkCJFozW3LUFZZmeAlw
	 JPxr2UKrs9GsBiOYM3mAB7UcD3zNzMMP9XkW3Vp35NJp5B2A2TcghasOKJI0Pd4aD3
	 mX7OvMPijg+eDcH4VpLEpNvtq+9s6cnhAUDpMXuSHNeH6gFTEZZu0cIek3Ndm8siii
	 GnupThh7jVwcm9/dcW5OonHR2sTsjuQYFClLjf1xWwL+ed1uuSCKHVdsZ1R4zeiPVA
	 14zpMiOH4Vgxg==
Date: Sat, 29 Jul 2023 16:24:30 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] iio: adc: fix the return value handle for
 platform_get_irq()
Message-ID: <20230729162430.4f858e08@jic23-huawei>
In-Reply-To: <20230727131607.2897937-1-ruanjinjie@huawei.com>
References: <20230727131607.2897937-1-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
Cc: lars@metafoo.de, tmaimon77@gmail.com, sbranden@broadcom.com, linux-rockchip@lists.infradead.org, avifishman70@gmail.com, rjui@broadcom.com, openbmc@lists.ozlabs.org, linux-iio@vger.kernel.org, vz@mleia.com, nuno.sa@analog.com, bcm-kernel-feedback-list@broadcom.com, venture@google.com, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jul 2023 21:16:07 +0800
Ruan Jinjie <ruanjinjie@huawei.com> wrote:

> There is no possible for platform_get_irq() to return 0
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
Applied.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 4 ++--
>  drivers/iio/adc/lpc32xx_adc.c   | 4 ++--
>  drivers/iio/adc/npcm_adc.c      | 4 ++--
>  drivers/iio/adc/spear_adc.c     | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 44e1e53ada72..0d6885413a7e 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -540,8 +540,8 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	}
>  
>  	adc_priv->irqno = platform_get_irq(pdev, 0);
> -	if (adc_priv->irqno <= 0)
> -		return -ENODEV;
> +	if (adc_priv->irqno < 0)
> +		return adc_priv->irqno;
>  
>  	ret = regmap_update_bits(adc_priv->regmap, IPROC_REGCTL2,
>  				IPROC_ADC_AUXIN_SCAN_ENA, 0);
> diff --git a/drivers/iio/adc/lpc32xx_adc.c b/drivers/iio/adc/lpc32xx_adc.c
> index 732c924a976d..e34ed7dacd89 100644
> --- a/drivers/iio/adc/lpc32xx_adc.c
> +++ b/drivers/iio/adc/lpc32xx_adc.c
> @@ -176,8 +176,8 @@ static int lpc32xx_adc_probe(struct platform_device *pdev)
>  	}
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0)
> -		return -ENXIO;
> +	if (irq < 0)
> +		return irq;
>  
>  	retval = devm_request_irq(&pdev->dev, irq, lpc32xx_adc_isr, 0,
>  				  LPC32XXAD_NAME, st);
> diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> index ba4cd8f49f66..3d9207c160eb 100644
> --- a/drivers/iio/adc/npcm_adc.c
> +++ b/drivers/iio/adc/npcm_adc.c
> @@ -244,8 +244,8 @@ static int npcm_adc_probe(struct platform_device *pdev)
>  	info->adc_sample_hz = clk_get_rate(info->adc_clk) / ((div + 1) * 2);
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0) {
> -		ret = -EINVAL;
> +	if (irq < 0) {
> +		ret = irq;
>  		goto err_disable_clk;
>  	}
>  
> diff --git a/drivers/iio/adc/spear_adc.c b/drivers/iio/adc/spear_adc.c
> index d93e580b3dc5..ad54ef798109 100644
> --- a/drivers/iio/adc/spear_adc.c
> +++ b/drivers/iio/adc/spear_adc.c
> @@ -310,8 +310,8 @@ static int spear_adc_probe(struct platform_device *pdev)
>  	}
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0) {
> -		ret = -EINVAL;
> +	if (irq < 0) {
> +		ret = irq;
>  		goto errout2;
>  	}
>  

