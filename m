Return-Path: <openbmc+bounces-257-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F14ADFA00
	for <lists+openbmc@lfdr.de>; Thu, 19 Jun 2025 02:06:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN19L5QG2z30Vq;
	Thu, 19 Jun 2025 10:06:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750269234;
	cv=none; b=H+sEusPM/GUHwe5tzdMA90+THp6MoKuBV7GskwiuAQ1GtrMLWVYGsshYtOLxYAzDzAYXzpr5QuBiO9X+koeqhyPtvDFIcRGxWHO0CU2dnUMrVWXWufIm/LM71+gK47DrlmeTalCzqY2BWJcv1u0DX1122dyPIJO4J9XXHNnDdTqdZaZxoF35Eaw1StjcFdGBtMIXNneudoIt2dyHKkfsTael9TzxnaMFhcgc94Ox4tr88XYfTZ3n3ay33TXLLUJNOpTB6JNEsnuysV5AHGbO9n9MW3nepbu7YeUh67BiYMLjkpN8w+JzflVZR0N8mWK6y17twf+hiUzbVcEFtxRQug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750269234; c=relaxed/relaxed;
	bh=p84+wxDg4u34Lm55oq6WOvopLTPICI6s2ti0ZOixglA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgZpO5ZIRTPkZNQ9cORrANKCB7aKbq+zz7QbArL9m28HPK3wi+9Qu3JFy/enZEcP71uH/NeeIPNwRGa6vjfff/Wxl2EAb5uP8y2bJmi7eaV2xjvXVEaeaDG/wnVXPOMipIK/6M0TZCIjFELGr24TcVohJOpZHh6DC+sfmR7nDtNL9SXqkwNTDkRFL5wvry++2WZDJcSJ91kQcm20c7jwjZPeYLsQ9Xu9nBkNC1ZtB4JwanyWpFhRMuC1QeUj6QvjNL1V4+wCsFsKj8bP3Yq1zwKqh4OfTOBgRd+89kvsvNJn5v/aiWHORAqozgh6gy+2cPUrAMaL6xMH8PoKVqqQew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HoJCdx2J; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=klarasmodin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HoJCdx2J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=klarasmodin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMrvj0cMVz3bmC
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 03:53:52 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55220699ba8so9018709e87.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750269227; x=1750874027; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p84+wxDg4u34Lm55oq6WOvopLTPICI6s2ti0ZOixglA=;
        b=HoJCdx2JCJ2FgcrxblCMjqdDlJlVG2SewB/7XhSZYz9iG4MfK95ld8HMLpzixCbtKQ
         Yvvkn7H0id3qmTjvhAajTEnGZnZRZvb51BCuJo34/sENt6k0XrFsll9GYN9LBrhkyFXj
         F2mN7sXBzPRL4HWt5MWvW9zs1wRXktYlF2lFcHdjHz6y3JRSzI3f1kNC8kE9KI7/xZ3m
         rmseD3OeRAgSiagF58hkH3jWoo0EGmHluXtRLJpKQZmgY99kZrKloeyEhmXYMoeHWbrw
         MknEW5GFlFu/9hGirLVbUqZU/aG2aMcpBpeFuVBRghIsTTyzGnnA1QKdXU7Kd39hDudG
         JLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750269227; x=1750874027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p84+wxDg4u34Lm55oq6WOvopLTPICI6s2ti0ZOixglA=;
        b=eSSgQ8v37Qz1GWtGLgIIFMMGGPYVa6G1mc+Uhh51bVuGYB5yZNaFsXU4nkMp6ivDkk
         Z4vdK93/nItQKS/7kJDSKp2+XrD1svh534BxTGqe1UjbYLhXLsUCzfn73cdQbUml51wm
         1eUW3grtUuzFGxBWX1mXGuNtCw+IES5VUzoJQLTkKyN/RQ+OuQ7pE8Gzo6/lGCm2SgMY
         zykX3MShNUmN0oYEJK7Rri8iJS0xFKweAMDNSaBb4hfJK5IsJk6mPKWhWF1T8FRfevod
         jWLrLjs8Tv5fBk1OUrW40RdB/8O9MEjzav9x8ev6qnGstjHxfo7iEADzO4PrKiwm1XSm
         eZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUudszKGMOHIiTCHxqU39Btym8UKBhsRZag+wgHY35XZQlaZzus81bLpphDErhYDSNDzv/H1rAt@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDSfFyW9ooKIRdfyk0AHXV5z5X4EI689gLtdaH9v5gvVm1jXpf
	ymSTyk5pgaruUtX0xcGEIk/WZTF+rj/zFO4kVU4E07SfQNOnPFlhR/zu
X-Gm-Gg: ASbGncvcL/Cx94bEdZEJkTlMG9Ai7+me2pbkXfe31EAlbrFjlPwlZ63OxklLoPsO98X
	GjyMiaUn2fU66C4Pwq4L8KlJSDj7nyCJ8ZE98VsiPr94IxnOoBirRn/Fqlun9wqdb9BXDKpTmBa
	lDQA4uwcoxM5BW9RxjurfyZxpxSxw9qNFGwBRo4XL5/zq8W5QWvU+hx6VItLr+WzKFIHrOEUdaK
	Ii6Za6cXlunGOeSQOW58ftH5I1ytZt8b5YDdd3oOYU5iCEpyLqrAUjwlMBa0jVuIxX4SGOo+z+a
	exd7EgFkUEphP+IK3Gp4eyikAOW8H6S2RZFc0Ou56hQnFUqcGQo7BviV3VOLLSi4pDl3K3hdk1C
	77A==
X-Google-Smtp-Source: AGHT+IEw2MUxlg+9z0zOxwI2HIbA//xXYjnaeyhIQ0EYOe7raQRMF7DADSBZ+e1Qc+mzPINdbbw/jg==
X-Received: by 2002:a05:6512:1193:b0:553:a272:4d18 with SMTP id 2adb3069b0e04-553b6ee2b8cmr5915844e87.20.1750269227022;
        Wed, 18 Jun 2025 10:53:47 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-553ac11ff75sm2315299e87.26.2025.06.18.10.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:53:46 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:53:46 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
Message-ID: <twqaezumdhalpivd46xkevzbfkwouwfrpr7wbw7yjeqcxberzv@sp36opkfttne>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
 <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
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
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-06-18 15:02:07 +0200, Bartosz Golaszewski wrote:
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
> ---
>  drivers/gpio/gpio-74xx-mmio.c | 2 +-
>  drivers/gpio/gpio-en7523.c    | 2 +-
>  drivers/gpio/gpio-mmio.c      | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
> index c7ac5a9ffb1fd1cc9439e3320d54574bf0cebbf6..3ba21add3a1c669171578ceaf9cc1728c060d401 100644
> --- a/drivers/gpio/gpio-74xx-mmio.c
> +++ b/drivers/gpio/gpio-74xx-mmio.c
> @@ -100,7 +100,7 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
>  
>  	if (priv->flags & MMIO_74XX_DIR_OUT) {
> -		gc->set(gc, gpio, val);
> +		gc->set_rv(gc, gpio, val);
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
> index 69834db2c1cf26be379c0deca38dda889202f706..c08069d0d1045e9df4a76cad4600bf25d4e3a7c5 100644
> --- a/drivers/gpio/gpio-en7523.c
> +++ b/drivers/gpio/gpio-en7523.c
> @@ -50,7 +50,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
>  	iowrite32(dir, ctrl->dir[gpio / 16]);
>  
>  	if (out)
> -		gc->set(gc, gpio, val);
> +		gc->set_rv(gc, gpio, val);
>  
>  	iowrite32(output, ctrl->output);
>  
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 9169eccadb238efe944d494054b1e009f16eee7f..57622f45d33e0695f97c7e0fa40e64f9fd5df1e0 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
>  static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
>  				int val)
>  {
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>  
>  	return bgpio_dir_return(gc, gpio, true);
>  }
> @@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
>  				   int val)
>  {
>  	bgpio_dir_out(gc, gpio, val);
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>  	return bgpio_dir_return(gc, gpio, true);
>  }
>  
>  static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
>  				   int val)
>  {
> -	gc->set(gc, gpio, val);
> +	gc->set_rv(gc, gpio, val);
>  	bgpio_dir_out(gc, gpio, val);
>  	return bgpio_dir_return(gc, gpio, true);
>  }
> 
> -- 
> 2.48.1
> 

This also fixes the null pointer dereference for me on the Banana Pi
BPI-F3 from my report.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>

