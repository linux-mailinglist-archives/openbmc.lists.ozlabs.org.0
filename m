Return-Path: <openbmc+bounces-106-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C926AC87C8
	for <lists+openbmc@lfdr.de>; Fri, 30 May 2025 07:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7s5G5mVJz2y82;
	Fri, 30 May 2025 15:20:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748499991;
	cv=none; b=Ug0OlepE9XpHqSxcOR278spab8UaXlQj2uZjSnJHTzhvF7YCndC1oipsNiROanXHvFQGPmctiCZB1jqC3A2n0s9UPz2Ge1RDxjLWcCNaN/wVZtEQ2ONxjN0HoruWbWPazDGkK5Pgjnx8ekvOqfbnyui/KxJpKEBpWVx7hqTetO9lVjSEYPVXZvdbCpDPqEZTXHuqqNfD+v8eszbuVxELkw8c/umtFE4PAPXWxuR7nKUFAYm0gzphwKl0zRguEcHkKqIyYZ6l0TAT0XKTNbcMrdoYKZGrfXnVgPGcAAGz1kGmuIQxIexb2uuRYMFRa+ztxgf8uXF8MmRmzptDK7U/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748499991; c=relaxed/relaxed;
	bh=+2SWtTNE3E49MOlHnO8uVeg5xT5IQxhtgIcjK83+ABU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=by9yO0lMNnIccdd9oZv0s0Nm5eHXEp1ZpEg4IZP4mloGsrnoFl0P+fl5+YPgyR7s4hMiAinKUBNZdWw1+hY9mrlwHqDL98TGwZhalyoknN+zJo1ohPhjT7CPYd2WnaXTcCfDC4DSBjGLeJrPulF+yHziiniA3r5h7F49vwzVU070Dp4TGY6f6VXGaRfQMvVZjHr7SLmd8upEmi7SjGdxzG22dxlP9TnEwOuXilJ52BUdcF1EQTPvGanAVG0v+xbAOz4aRGU3XTIPdgkiFUhk7QmpAURpCZdry6TVct2sN9eb3F9YT+kbdHfA1cRqdwb1bx57ogU0y2mmIU6ehTO5tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iuHKwm0w; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iuHKwm0w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Gbp3TqJz2yGx
	for <openbmc@lists.ozlabs.org>; Thu, 29 May 2025 16:26:29 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ad55464ba80so4660166b.0
        for <openbmc@lists.ozlabs.org>; Wed, 28 May 2025 23:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748499986; x=1749104786; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+2SWtTNE3E49MOlHnO8uVeg5xT5IQxhtgIcjK83+ABU=;
        b=iuHKwm0wr7rqH0bwHaqj3iQP3Ue/pDca7vZwXs7V/azryovvMfCrjGFytpiKgRMCpF
         QGxuQCiGZFGmWyK+fFaVEpe0WWkYZSPtKwQwUpYeQx9rgn2LOP4VuS+2PMuKm+D+cypW
         pL+xEuOnChfvm5GB6QTPmudLOInPNx59cBL7miR9sz5jK15b4KdY+u6Rw8pLsyt2PwMn
         wza7yYnLPcgHvLNBcFxG6hTwtDEbzEIeUCiLP45CpB6LeEDlTlr6h3V4+nwY0DyVDaec
         qZiru0RzwkrFaRUHmGtNaXC896ZjFx3Am72CXEF9ODWBC4+0VYDYVp4pKvteb9DhHUCe
         HlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748499986; x=1749104786;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2SWtTNE3E49MOlHnO8uVeg5xT5IQxhtgIcjK83+ABU=;
        b=mdE7uMMdftnqhIxQr5J/tiBwopW7dxXy4u5b1FkPwDg9DttUpYPxN4wYereXhy3/kG
         KeY4qwrg1Y5LdKcJQLs6abuXiIQsImjXPlra5irARsfe8nal45IcRrx6rXbPH4NL61Y/
         /VFXUBzTd3E0X/8RCUYckLP+nJycLpQFJjhbUeRNvQUcrSQnjNz+X37vBLe/m+9iaPCj
         7dOn1RAliD7G+N6+AKTQAlsmry0VWV8Om1LcYQ4ww+SHPccNbmYprrsqocIybuUlcP8C
         U/sYsIlyFDlEGIvCmLPwV53TSRj1nxjnq2gwcUWkeWDMiMg3l2BwnNyN084QLWXOQ/pw
         Fp/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9RurYtyRYChRVg8DOQyC6xvHuVev+XdxCquJGZKJ62TyDzTiDaSYKACIQsBseVbhjD/QvA2eg@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw/X3cxCKyVPIU02mQNPkQlo7NwvsSFvYV5vhFsO/Ro9QIecQbw
	mQ+/q1EirI1iJrNNKKX6dF/z260coGUrMCb0Y4Bfai/7nJX2o/Nr5xV5W1NZK2X20CM=
X-Gm-Gg: ASbGnctU0O8mmMX5gIy6oeA5JEMQSlMMePsAs0p8uKJA8FPiChrvDyg+YJAdDO8MT8c
	x64r+Pb6+VYQMvbe7GGR67fz5jfiI4sdIez0mduuohm5sbanH5fTKwYC9mmoS16H+k6FZ+iACPp
	AGJfBB3k1vhd9/w/9OrXSOvvnslfFZo5peElVl6t7+pDqn5qA835f7BDQxH8XgxP3vTDSU9SHKx
	dIN7zZx19MfutitQmIPMA4g44stEU3qv9WR6pznA/RkvzO0fgCjsPnNWALIGw2J0TGhLrgIfXjI
	8q5ybcexDAo2ODqfD+XVBEStmoyh894MrcqwffEutKac8nJt7mNk21kOG6uZ2ulPabiaJ1E=
X-Google-Smtp-Source: AGHT+IGlMDzn+QG/07M9P/X4G1UkWeHWA61AWrk71VubiDANJ+WF35EJENPRBZsOw8VSgdWIr7Porg==
X-Received: by 2002:a17:907:2724:b0:ad8:882e:39a with SMTP id a640c23a62f3a-ad8882e03ddmr319125766b.8.1748499985639;
        Wed, 28 May 2025 23:26:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aaf5sm79818366b.183.2025.05.28.23.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:26:24 -0700 (PDT)
Message-ID: <6bb4f8f7-ef95-4f10-ad94-027fa18dada3@linaro.org>
Date: Thu, 29 May 2025 08:26:21 +0200
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
Subject: Re: [PATCH 02/17] pinctrl: Allow compile testing for K210, TB10X and
 ZYNQ
To: Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 28/05/2025 12:40, Krzysztof Kozlowski wrote:
> Pinctrl drivers for K210, TB10X and ZYNQ do not reference any machine
> headers, thus can be compile tested for increased build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 33db9104df178e5a3148b60c3c6bd153113385d3..77a5d13e899f8c5251987c2c74df1d05dbd59128 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -269,7 +269,7 @@ config PINCTRL_INGENIC
>  
>  config PINCTRL_K210
>  	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
> -	depends on RISCV && SOC_CANAAN_K210 && OF
> +	depends on RISCV && SOC_CANAAN_K210 && OF || COMPILE_TEST
>  	select GENERIC_PINMUX_FUNCTIONS
LKP reported here issue, so there will be v2 of this.


Best regards,
Krzysztof

