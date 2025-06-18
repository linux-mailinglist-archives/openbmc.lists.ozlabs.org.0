Return-Path: <openbmc+bounces-256-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93905ADF9FF
	for <lists+openbmc@lfdr.de>; Thu, 19 Jun 2025 02:06:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN19L0qHMz30T9;
	Thu, 19 Jun 2025 10:06:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750247994;
	cv=none; b=DYbD0KvYtLm/tXbrAYJnSk3INf6ac4KCD/PHJXgnqWgzR4tV7pTKT/FWUpylYUvmIADfSs6GcJIrc59fQTJVpwXc/5K08H0yaztC4bYYHU494WoFgu328j7fjLlgveZiycDxaT5OvIsHhVoCWPuNr50NC6qi9WONwooVnhjJvEwu4hzSZjv37HhzRQgl0P0TZE97dZ3GZWK4yitfvUItz69BUMOwYElJRs9XKU2ejqhYcxRvZ1HILykPk4fHMQYdnEvm25QG/uIyFPTo2aPTciNUXXxUAvzFYJmZY6VLH9cElT67ufXnRpQc7Nd4FMFtA1TfS0p/P/rdFHKvyUT3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750247994; c=relaxed/relaxed;
	bh=/TQmvTgeWB4YgSToPjAwaMsmcK/mn8xvOCLcOf55+Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmSkXlcKPO5fCQnKa0aJVJNBKGAZxnCZWJTLaXkdSk2Ix+dH/1NVMYIx6N7aF+iPJyvwjp/s2SB4BXfkRp7w33k8wOHFBArursoGXtOuDYz8p+XTxPYmSmdGYmXuGBMueiwNrV1O/junM6Hn/tjtBbGoCw3KGDfTglpaCvrzIc4qsRYbYdX6oWL8OnfBJnggw8CgzU5tWTqUoer8etYK4krOWHoU7IuwwDaSsz37XxAJYP67uKeFtUkPiBMFyds+EOKj4G4nngfj/Wv65dHQEQIGLZjQwEwZa7F6GLqmRzsd9q/LD/TskBQS2Zm3NzALEx+LHJQ1Qt0BjR9exxVljw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a26IjEnR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=klarasmodin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a26IjEnR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=klarasmodin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMj3D59Gvz2xPc
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 21:59:51 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-32b5931037eso29947561fa.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 04:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750247988; x=1750852788; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TQmvTgeWB4YgSToPjAwaMsmcK/mn8xvOCLcOf55+Dk=;
        b=a26IjEnR3Qm/HyYJyujgPvUL8SIxqALO/Gl6ihOHiWlvomrkEVwcxVCoZqm6UGXT/m
         NKGcsK2XAarFN35pS01pv/b1y4OzorLb3FArs0qgIdMnVJxIgbhbXOQSoKgeR+Z5dDTb
         aguQs8xUIY38ILjs726dSpm09PY+mA7jzxDaIk/Y3lxtTttk2t0MDwIxHt6DGKXAqQwj
         EhxULU0jdKeoAEBLdJSsDsbyVLPsZ2IObUPKX6VVojV5JIZ2QV1IZP210rQQiRJA5DP5
         rxVX53cnPqp5rDzq2A7+U7Rn2/PzLMsCdpWpnl0hEPuvzk8dJb10EFazW959eeXjEApi
         sIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247988; x=1750852788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TQmvTgeWB4YgSToPjAwaMsmcK/mn8xvOCLcOf55+Dk=;
        b=GoJkILLbWKFUq2IdkTgjccLKDhcug907pbrfaf1FFiN6THuz1ci8URm0RXYEq+0Ut4
         /DbHBCHVhylzXx/sN8LR+D5l7mhwDz2kcRKk5pfhEXxHZJzW/eJ5f7vS7qPDQAoJmOqw
         IKpoxLeyJjmbYb3jW+gq4+irDwso0GO3iWn853kJgTQ2/1XXdlBe779mtGS/lEj1WfCR
         ZKEazqA/pHIA5fywlZDskJW3V9fpVXsXUocXYngvjMDw6Zd6tg0dAw3PmAMgN6szzBVo
         nylVYtdgGzWBvbfWTQdHvCCzYXm8FlnHUMpLc/4g8NQFGJQtJ/MLS5EsBtxlF1jh7uFO
         3EUg==
X-Forwarded-Encrypted: i=1; AJvYcCU2ObxmYJq9H9hrMOsXaXJKyUYHi/qOkizpvNQZ888gDpO+sJ1EYfPhWEK7j2ikFy0nogGgItNm@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwikINuZ64JKTvzgrohwlfRCAWpKgXdiwlCGsF3p7nplKgozahA
	qiq12zgw5BlrFTfWHGlAIz5YWiKXjSaRGNTkIzQznHFfxH/TtrQGzCAy
X-Gm-Gg: ASbGncs84abqH6DTqwbPrOYKmPC3mMzI8KCsA5sxcV5X5CsglPBz2vNnSPCWodX7J0N
	faq3tzhdbVh2d77ZVbewJToWo6ZXUOg+oDAUGfBATMdjxqgUO891V7FI2gFB2KyLZJvMqMytW9/
	7l80mPyymd08UlZ/UfrwIwbFNNn1gKpHAiRQUoC5c705GhgiPPOmTXpIblQlWQUWSbJvBCpYm52
	JDm2ZQHd1pl/gRZfc73gm7+/9ST/z++G0qpkOSUwLL/HSuoAaq56xWia3+HBheMXrUBrzSv+lPt
	1mNDH50xPTYdFtMGMB8SgYpRYgQZGeTi9Sepo6aTbjDy2tDSmiKlsEs1yITlSdZP3Eb3WqsfdQS
	SOA==
X-Google-Smtp-Source: AGHT+IEEuLAvgr2OL57VbH9FchKBqYmVVAHa3AT4JbHjg5k/1SYfHWucA3kEC25R23C9uvFFL7j1Sg==
X-Received: by 2002:a2e:b8c4:0:b0:32b:2f36:4d92 with SMTP id 38308e7fff4ca-32b4a413262mr52990161fa.12.1750247987973;
        Wed, 18 Jun 2025 04:59:47 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-32b7dafc837sm1702891fa.47.2025.06.18.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:59:47 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:59:46 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter
 callbacks
Message-ID: <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 2025-06-10 14:33:11 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494054b1e009f16eee7f 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
>  	return 0;
>  }
>  
> -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
> +	return 0;
>  }
>  
> -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  	unsigned long flags;
> @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  	gc->write_reg(gc->reg_dat, gc->bgpio_data);
>  
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> -				 int val)
> +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> +				int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  
> @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
>  		gc->write_reg(gc->reg_set, mask);
>  	else
>  		gc->write_reg(gc->reg_clr, mask);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  	unsigned long flags;
> @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  	gc->write_reg(gc->reg_set, gc->bgpio_data);
>  
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>  }
>  
>  static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>  
> -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  			       unsigned long *bits)
>  {
>  	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> -				   unsigned long *bits)
> +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> +				  unsigned long *bits)
>  {
>  	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> -					  unsigned long *mask,
> -					  unsigned long *bits)
> +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> +					 unsigned long *mask,
> +					 unsigned long *bits)
>  {
>  	unsigned long set_mask, clear_mask;
>  
> @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
>  		gc->write_reg(gc->reg_set, set_mask);
>  	if (clear_mask)
>  		gc->write_reg(gc->reg_clr, clear_mask);
> +
> +	return 0;
>  }
>  
>  static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
> @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
>  	if (set && clr) {
>  		gc->reg_set = set;
>  		gc->reg_clr = clr;
> -		gc->set = bgpio_set_with_clear;
> -		gc->set_multiple = bgpio_set_multiple_with_clear;
> +		gc->set_rv = bgpio_set_with_clear;
> +		gc->set_multiple_rv = bgpio_set_multiple_with_clear;
>  	} else if (set && !clr) {
>  		gc->reg_set = set;
> -		gc->set = bgpio_set_set;
> -		gc->set_multiple = bgpio_set_multiple_set;
> +		gc->set_rv = bgpio_set_set;
> +		gc->set_multiple_rv = bgpio_set_multiple_set;
>  	} else if (flags & BGPIOF_NO_OUTPUT) {
> -		gc->set = bgpio_set_none;
> -		gc->set_multiple = NULL;
> +		gc->set_rv = bgpio_set_none;
> +		gc->set_multiple_rv = NULL;
>  	} else {
> -		gc->set = bgpio_set;
> -		gc->set_multiple = bgpio_set_multiple;
> +		gc->set_rv = bgpio_set;
> +		gc->set_multiple_rv = bgpio_set_multiple;
>  	}
>  
>  	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
>  	}
>  
>  	gc->bgpio_data = gc->read_reg(gc->reg_dat);
> -	if (gc->set == bgpio_set_set &&
> +	if (gc->set_rv == bgpio_set_set &&
>  			!(flags & BGPIOF_UNREADABLE_REG_SET))
>  		gc->bgpio_data = gc->read_reg(gc->reg_set);
>  
> 
> -- 
> 2.48.1
> 

Isn't this missing to convert gc->set() to gc-set_rv() in several
places?

Without the attached diff I get a null pointer reference on e.g. the
spacemit k1 driver.

Regards,
Klara Modin

--

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 9169eccadb23..57622f45d33e 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 
 	return bgpio_dir_return(gc, gpio, true);
 }
@@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
 	bgpio_dir_out(gc, gpio, val);
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }

