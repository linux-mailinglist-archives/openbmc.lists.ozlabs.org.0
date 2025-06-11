Return-Path: <openbmc+bounces-183-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D336AD6448
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:05:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP84GW4z3brM;
	Thu, 12 Jun 2025 10:01:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749680535;
	cv=none; b=GErS6x8GQ3f6vkhL4kPvmnar6ULdLq5qCk7TMt2J9OZXseUcCIpxcqANwTxZIhmjmwKY6hCAf7NZXYrzI+z7SrSKkersrvTvqk2njbPnvW8qI8f07WHw3GETlt9PsyqsOXnOp3IIbpSPABuKoNHeG+JvpGiOretNvMKLsIeZy88xrxXJeIcPWwzy/0+fnPOVxjXSZyuWSj8+3Es3rPA6ciLO9CclFg4cgb++q+a+A+y3FqI2j9AWQYQuh1MKh/Xxtc/vjgOhsqPZL2qBg8b4KHWW0FY+ZmN7ZkvGCAXTbzAIF0UomASBE4jwBb1PX3qQ0kmQcmw49V7dFy0rx/wSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749680535; c=relaxed/relaxed;
	bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSaagAcMHqF7nIowwdbSlhY63br3GGJaESW6q1mnRHZ2BL98q8K5sX124Cq1RCvJU1x69b04IfzgMrsc+YsV/vKsb7/sgSt9X8+1oQx3E+56My3ZXk6wG/Nek6mEuCLkifNeFUQgjTXxOeNh8NnrTIPkhTjc3sJiHKq+zcuKjoum/oVKNL/KVyiE/mD+bVPVMSLuI6LAxMoZE4zWHdtoe4XXo2PeDJXHAq+5ZYTYGVSqmpt8RMN6kog1s4lKBGytJ3VB8GUYtlQoKW+lllguslnbihfkCifLaqEVTCqkCCJLwxoDmht6fl0u68yLjLlInwwosXeA/y5O4PodTc20Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=thingy.jp; dkim=pass (1024-bit key; unprotected) header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=HqJasczq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=daniel@0x0f.com; receiver=lists.ozlabs.org) smtp.mailfrom=0x0f.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=thingy.jp header.i=@thingy.jp header.a=rsa-sha256 header.s=google header.b=HqJasczq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=0x0f.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=daniel@0x0f.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHgBY4wxQz2xGw
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jun 2025 08:22:12 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3139027b825so304825a91.0
        for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1749680530; x=1750285330; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=HqJasczqT6ELwAoRHLYY5SeO5J472Vm1IvV3PDHkWDwFX3BBWaRokmZfirk6QEQ5/E
         x9SgesN3oWi48+7Y8t6IwiuapBzpK1boYVNKC+bKt/s6p5baJ6Sv6Xh66FdEYzcIm49H
         a7b0jJ4KTMgCGCmsl+sFXKM/nZLjfxYjTgObc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749680530; x=1750285330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hECvCp2144ISjYFuCPwHbO2eSKNwdlu+MMKqmQG6JC0=;
        b=aT6MFG9LgAzKBGbdzYOD+hHafSs1W7OVcPOkwJSSzs+jSNPIXRc+NIDzm+5DJgS+ui
         TX3zTbHHE0svkbcuwVpQDI8P6fToDv2qeJz30vxSU4ueE7gmZlfv4B/Y0t6ZsOFgWSkR
         yg4eN2f+nbasOchjyhGcHQI42o3fl3EDIRcQMvOq4AcoC1TwRU0PI1SrLgNOah06v1jY
         ioQKqAUkMOsPUt/WO/9T+YK6zW5IMDGwi1DGpVf8wcnQttD5Wo4uCxipIwY85OsL3aDY
         vhBDYJnZO4Mo413JvwUjk/91lM3zhcTgySREFrXCe973muFWuvbBhcJFA5by+kY24eBN
         EDdA==
X-Forwarded-Encrypted: i=1; AJvYcCVS1lcsvzkddIchl/reDtguCeosHB2SXqnDk/9kFdLEBXhWQU0FzMFZ0eMZeffo2OxxNrn06vGa@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxMrjcEoAn4wxQTRXDi7Fsdg4TI0ka67Bv1V3Q/pnQLJt4uweD
	fqsouEgtAjtMsghaw2+VqCFMG9Kdz1MW+TE/AKKa2nu8Wy6LbgJ8A5HL5hoCTvTCeapmEB/AsYm
	+d5owWg8iqblKTo7y5fx0UMpi5jVEsF0YE36yfcvRdA==
X-Gm-Gg: ASbGncuyKY8pshOzky1Adl83bvvkI34oitVRrcVqbFOPWx/qLajE8MVPX0MNOvLKAd+
	BRM1+QD5OFvM0Dnk0JXg29oTEgr5VGQaWqkc5kPW3BdGkWsIcD2tiDXmx+rczEAXfQH3XkMZVQW
	YjwkRSIW6VaWbCvRDPUrzLvyQ37oY1CJ73e0QK6iIYUVXL8ADWoNrFY+mwplZ9FUIOMwmbuHslZ
	fpr
X-Google-Smtp-Source: AGHT+IE8FknUC40PscBGYY7OPNelZLLkTFE7qxHwumbpWqTQtgyRPt7nCSuQoA+6xvyngwoaYT3v2ByQ5TtYzKrW9d8=
X-Received: by 2002:a17:90b:2892:b0:312:26d9:d5b6 with SMTP id
 98e67ed59e1d1-313bfba12a1mr1389789a91.3.1749680529907; Wed, 11 Jun 2025
 15:22:09 -0700 (PDT)
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
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 12 Jun 2025 07:21:56 +0900
X-Gm-Features: AX0GCFuAPMzR2tj8IuIF1_MflSdk31p_mu_qD7qQzgmBFTWEvU6XX8YEN4mo1dI
Message-ID: <CAFr9PXmeYETV5FSAnEacFCo7LiS3cYBpPqraexLC7=MTzshfNg@mail.gmail.com>
Subject: Re: [PATCH 07/12] gpio: msc313: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bartosz,

On Tue, 10 Jun 2025 at 21:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-msc313.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -486,7 +486,7 @@ struct msc313_gpio {
>         u8 *saved;
>  };
>
> -static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>         struct msc313_gpio *gpio = gpiochip_get_data(chip);
>         u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
> @@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
>                 gpioreg &= ~MSC313_GPIO_OUT;
>
>         writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
> +
> +       return 0;
>  }
>
>  static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
>         gpiochip->direction_input = msc313_gpio_direction_input;
>         gpiochip->direction_output = msc313_gpio_direction_output;
>         gpiochip->get = msc313_gpio_get;
> -       gpiochip->set = msc313_gpio_set;
> +       gpiochip->set_rv = msc313_gpio_set;
>         gpiochip->base = -1;
>         gpiochip->ngpio = gpio->gpio_data->num;
>         gpiochip->names = gpio->gpio_data->names;
>
> --
> 2.48.1
>

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel

