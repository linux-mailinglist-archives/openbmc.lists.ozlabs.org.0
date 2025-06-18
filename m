Return-Path: <openbmc+bounces-251-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFCADF30A
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 18:53:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMqYg16t1z2yKq;
	Thu, 19 Jun 2025 02:53:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750265591;
	cv=none; b=CfXwqqe517CFmPfKvG7Em0XrMlNPiQDCmsM0dcf6qW9Q0ZB1XXflQ/9f2zK/92jH/VZDnOmxJC6ewPvVQnfVrL5nN7h9gZejDDP7T1cyRn7LSneQ/Y0ADMaF7N2OVOCDKDWjVn5XvAXdvUydb2HqgCzV9ikR6MT8iiDl2k3qRU1CkaNraS2rLfhBH8f+dGMHhdm7mAgFLRYkT5UJIyOfRfrDxZUoP9j8yftvQse9nKrRksCk4OPcOesku0mGh1wwwJkjvYvSJVrKwOntcv+VlVLpIGo6OqYrFxNv1J3FJQM9pSYRg+T/4SZ9mT1VsGqvyOhY9CoOiPLG20MA/uzOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750265591; c=relaxed/relaxed;
	bh=UDfJotcIpWIKY+QmO8fvKHc439D+osARVOJJ3r+0Ufg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=l5eJr0ERHpKXHwixg7lOfxk/K72UAU4jfmUWfY/TR7ruwcpkILB4sfntGPBpYXiH3mVN3HHTbsBgCJuTuVEi1Sp7yPv+hicLFKbNkvkfyXAvPuUPCIENlKdmuDl2Mj0tERzlX9S2/7omvHc+0GuKK2j3YwueV2Xv8AR4bKlPEWtcWpaJpRRnz0T6aBq+e4Y1WywmTj8QBZeRB4FnDvV+7s2tbT9A+r+VD8WVj16NJvd7GucSPrv466jJ8cEC80w85InXrrNlQOPIXWVBdjKG2xUQP7zbVoHZnBZGrEJYHa7WawOPG7VDn6myXnvz65PamrRQCQMlso2PMkbokIOtHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=kcLgfZXM; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=kcLgfZXM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 572 seconds by postgrey-1.37 at boromir; Thu, 19 Jun 2025 02:53:09 AEST
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMqYd0G3Dz2xBb
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 02:53:06 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618164321euoutp0177f052970be6b887ce3dccd5cab659bb~KML7KtYNB2853828538euoutp01U
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 16:43:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618164321euoutp0177f052970be6b887ce3dccd5cab659bb~KML7KtYNB2853828538euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750265001;
	bh=UDfJotcIpWIKY+QmO8fvKHc439D+osARVOJJ3r+0Ufg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=kcLgfZXMu1OXO6rHUKWk2PHT23diE2bNM4j1nIuztL7CaqFYiQ1QkO/Aq5mDaIRcO
	 JeeosfjgQckCFrDTgHoz2/5cdHPLn91Dt39chRhRFJ3m6+uXqJ0MDxmpKYEyMBy9w9
	 JBNPgknEHprdanrVY06pMchfWLL7pJTnS51eMFbk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618164320eucas1p28174732f38fd279fbba72f07887e5da5~KML6PRps61894318943eucas1p2H;
	Wed, 18 Jun 2025 16:43:20 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250618164318eusmtip29415a14e64deb8a38a5078dfd40afd78~KML45IQjO0062800628eusmtip2E;
	Wed, 18 Jun 2025 16:43:18 +0000 (GMT)
Message-ID: <06e7a1dc-e58f-4cff-b962-5eb087dc4c1a@samsung.com>
Date: Wed, 18 Jun 2025 18:43:17 +0200
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
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
	<linus.walleij@linaro.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, Romain
	Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko
	<grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin
	Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250618164320eucas1p28174732f38fd279fbba72f07887e5da5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618164320eucas1p28174732f38fd279fbba72f07887e5da5
X-EPHeader: CA
X-CMS-RootMailID: 20250618164320eucas1p28174732f38fd279fbba72f07887e5da5
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
	<20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
	<CGME20250618164320eucas1p28174732f38fd279fbba72f07887e5da5@eucas1p2.samsung.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10.06.2025 14:33, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++------------------
>   1 file changed, 33 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494054b1e009f16eee7f 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
>   	return 0;
>   }
>   
> -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
> +	return 0;
>   }
>   
> -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	unsigned long mask = bgpio_line2mask(gc, gpio);
>   	unsigned long flags;
> @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   	gc->write_reg(gc->reg_dat, gc->bgpio_data);
>   
>   	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>   }
>   
> -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> -				 int val)
> +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> +				int val)
>   {
>   	unsigned long mask = bgpio_line2mask(gc, gpio);
>   
> @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
>   		gc->write_reg(gc->reg_set, mask);
>   	else
>   		gc->write_reg(gc->reg_clr, mask);
> +
> +	return 0;
>   }
>   
> -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   {
>   	unsigned long mask = bgpio_line2mask(gc, gpio);
>   	unsigned long flags;
> @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>   	gc->write_reg(gc->reg_set, gc->bgpio_data);
>   
>   	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>   }
>   
>   static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
>   	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>   }
>   
> -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>   			       unsigned long *bits)
>   {
>   	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> +
> +	return 0;
>   }
>   
> -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> -				   unsigned long *bits)
> +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> +				  unsigned long *bits)
>   {
>   	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> +
> +	return 0;
>   }
>   
> -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> -					  unsigned long *mask,
> -					  unsigned long *bits)
> +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> +					 unsigned long *mask,
> +					 unsigned long *bits)
>   {
>   	unsigned long set_mask, clear_mask;
>   
> @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
>   		gc->write_reg(gc->reg_set, set_mask);
>   	if (clear_mask)
>   		gc->write_reg(gc->reg_clr, clear_mask);
> +
> +	return 0;
>   }
>   
>   static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
> @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
>   	if (set && clr) {
>   		gc->reg_set = set;
>   		gc->reg_clr = clr;
> -		gc->set = bgpio_set_with_clear;
> -		gc->set_multiple = bgpio_set_multiple_with_clear;
> +		gc->set_rv = bgpio_set_with_clear;
> +		gc->set_multiple_rv = bgpio_set_multiple_with_clear;
>   	} else if (set && !clr) {
>   		gc->reg_set = set;
> -		gc->set = bgpio_set_set;
> -		gc->set_multiple = bgpio_set_multiple_set;
> +		gc->set_rv = bgpio_set_set;
> +		gc->set_multiple_rv = bgpio_set_multiple_set;
>   	} else if (flags & BGPIOF_NO_OUTPUT) {
> -		gc->set = bgpio_set_none;
> -		gc->set_multiple = NULL;
> +		gc->set_rv = bgpio_set_none;
> +		gc->set_multiple_rv = NULL;
>   	} else {
> -		gc->set = bgpio_set;
> -		gc->set_multiple = bgpio_set_multiple;
> +		gc->set_rv = bgpio_set;
> +		gc->set_multiple_rv = bgpio_set_multiple;
>   	}
>   
>   	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
>   	}
>   
>   	gc->bgpio_data = gc->read_reg(gc->reg_dat);
> -	if (gc->set == bgpio_set_set &&
> +	if (gc->set_rv == bgpio_set_set &&
>   			!(flags & BGPIOF_UNREADABLE_REG_SET))
>   		gc->bgpio_data = gc->read_reg(gc->reg_set);
>   


A few more changes are needed to avoid NULL pointer dereference 
(observed on RasbperrryPi5), because this driver calls ->set method 
internally:

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 9169eccadb23..57622f45d33e 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, 
unsigned int gpio,
  static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
                                 int val)
  {
-       gc->set(gc, gpio, val);
+       gc->set_rv(gc, gpio, val);

         return bgpio_dir_return(gc, gpio, true);
  }
@@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct 
gpio_chip *gc, unsigned int gpio,
                                    int val)
  {
         bgpio_dir_out(gc, gpio, val);
-       gc->set(gc, gpio, val);
+       gc->set_rv(gc, gpio, val);
         return bgpio_dir_return(gc, gpio, true);
  }

  static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int 
gpio,
                                    int val)
  {
-       gc->set(gc, gpio, val);
+       gc->set_rv(gc, gpio, val);
         bgpio_dir_out(gc, gpio, val);
         return bgpio_dir_return(gc, gpio, true);
  }

Do You want a formal patch with the above changes, or will You just 
amend them to the updated patch?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


