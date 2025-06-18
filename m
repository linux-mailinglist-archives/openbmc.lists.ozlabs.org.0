Return-Path: <openbmc+bounces-254-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA6ADF3CB
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 19:30:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMrNH6yTtz2yFJ;
	Thu, 19 Jun 2025 03:30:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750267807;
	cv=none; b=ECFeTOQJVh6ucbx4GpKjVx5oDSqUsZOOOVFzAtpi+3jFOCB8P6a2kGSC7zouWzv5BKd7DRXsn7UP999fbKo++Qv3jdUwxSf1hXULMeYo3EYWIXyMc5h2hezMDUY2KKs8GQpyoOt8Cnwgyr2X3nigvSomGl2lbbuMxP7EieeDEksOz0Dl4/mFbEqHxK7RURj8UDCJhrSBNoHsM7Iuxeo5ROjUEaix8vLvJt1SlUCXOxv0z2Yjx/SAvG4q/yVMHwHM6w+9ecSJKWqAJLG94gQlH5jfHT1cAVl+zQTuIr3JST75ITfg7G89LKpze9aVQlh0q0ZaOXH4EUfk6qVBNtmzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750267807; c=relaxed/relaxed;
	bh=K97FTbMt5JoIwDvHOKNiKQwGHF/yxquenFxIqJsaQGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=bWeQMmIW7RaI/bxP6QhIgly7jHQUPyVHMWGrugOIRYJ44Fr0UO3nJarbBjvZnSikick6XLXQqa8YqH/nSR46WcWWYLcLnd+9n1SykJ65kRo2bD5x93dHNi/AEGTHUbu7hyHnD3Y3PO3zwO/gBs/F8DQ2nOOZHGSN0i3lp8s9jR/t2qMPnFvT0MEhVPc2ytsbez0HlSU3UhOvdsjSZEjQ+WIaOGx305TNEnTNfBkmssWVTWZlwjLiUAHmasrOjVmlNj3BW6CWUeZPnagKNacccezPTWQPiY1cRQAWkv4cwOAfdd3Cog45PHeXG7TvcmXQIaDEuDblTb4rH10/KuHxDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Z1Ho4Wbo; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Z1Ho4Wbo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrND3pHtz2xS2
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 03:30:02 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618172953euoutp01eabf51490330334d0c915f9ae85d3fb9~KM0jlUoHi0518405184euoutp01_
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 17:29:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618172953euoutp01eabf51490330334d0c915f9ae85d3fb9~KM0jlUoHi0518405184euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750267793;
	bh=K97FTbMt5JoIwDvHOKNiKQwGHF/yxquenFxIqJsaQGA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Z1Ho4WboWTzD6ZKXkHwmx6aqguEFBqCE8rmMzauc4t7wvDVMxgWxgDywg2Lcx+02U
	 WEaAKOBULRs8ErBhtDM9n9EOQaHsa/n/+3paOFFzk9utbBdLi7jBcm5eqPWkkOUC0J
	 hvD4X4zn6Pabypumk5w/5Ln0eBhdu3LE4icUIXvk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a~KM0jT4eL62797627976eucas1p1S;
	Wed, 18 Jun 2025 17:29:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250618172951eusmtip2483250b17c457f30b81134e00802b6af~KM0iD8APO2341123411eusmtip2j;
	Wed, 18 Jun 2025 17:29:51 +0000 (GMT)
Message-ID: <3771a2ba-84a4-4cd5-a9ad-913130f19c27@samsung.com>
Date: Wed, 18 Jun 2025 19:29:50 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
To: Bartosz Golaszewski <brgl@bgdev.pl>, Klara Modin
	<klarasmodin@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon
	<tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture
	<venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair
	<benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a
X-EPHeader: CA
X-CMS-RootMailID: 20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
	<20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
	<CGME20250618172953eucas1p17c764efad555d61bb2ae720a39fba98a@eucas1p1.samsung.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18.06.2025 15:02, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We've converted this driver to using the new GPIO line value setters but
> missed the instances where the legacy callback is accessed directly using
> the function pointer. This will lead to a NULL-pointer dereference as
> this pointer is no longer populated. The issue needs fixing locally as
> well as in the already converted previously users of gpio-mmio.
>
> Fixes: b908d35d0003 ("gpio: mmio: use new GPIO line value setter callbacks")
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/all/2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

This fixes the NULL pointer dereference issue observed on RaspberryPi5 
and BananaPiF3 boards with today's linux-next.

> ---
>   drivers/gpio/gpio-74xx-mmio.c | 2 +-
>   drivers/gpio/gpio-en7523.c    | 2 +-
>   drivers/gpio/gpio-mmio.c      | 6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> index c7ac5a9ffb1fd1cc9439e3320d54574bf0cebbf6..3ba21add3a1c669171578ceaf9cc1728c060d401 100644
> --- a/drivers/gpio/gpio-74xx-mmio.c
> +++ b/drivers/gpio/gpio-74xx-mmio.c
> @@ -100,7 +100,7 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>   	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
>   
>   	if (priv->flags & MMIO_74XX_DIR_OUT) {
> -		gc->set(gc, gpio, val);
> +		gc->set_rv(gc, gpio, val);
>   		return 0;
>   	}
>   
> diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
> index 69834db2c1cf26be379c0deca38dda889202f706..c08069d0d1045e9df4a76cad4600bf25d4e3a7c5 100644
> --- a/drivers/gpio/gpio-en7523.c
> +++ b/drivers/gpio/gpio-en7523.c
> @@ -50,7 +50,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
>   	iowrite32(dir, ctrl->dir[gpio / 16]);
>   
>   	if (out)
> -		gc->set(gc, gpio, val);
> +		gc->set_rv(gc, gpio, val);
>   
>   	iowrite32(output, ctrl->output);
>   
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb238efe944d494054b1e009f16eee7f..57622f45d33e0695f97c7e0fa40e64f9fd5df1e0 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
>   static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
>   				int val)
>   {
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>   
>   	return bgpio_dir_return(gc, gpio, true);
>   }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
>   				   int val)
>   {
>   	bgpio_dir_out(gc, gpio, val);
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>   	return bgpio_dir_return(gc, gpio, true);
>   }
>   
>   static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
>   				   int val)
>   {
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>   	bgpio_dir_out(gc, gpio, val);
>   	return bgpio_dir_return(gc, gpio, true);
>   }
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


