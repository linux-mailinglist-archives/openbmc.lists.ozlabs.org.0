Return-Path: <openbmc+bounces-178-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DCEAD643D
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP45ntJz30VF;
	Thu, 12 Jun 2025 10:01:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749646201;
	cv=none; b=XMiWxIUe+lUN4Q2492fZsJrId4bW6HOFjg/PZaadiet6v2eYa6ID3GfAVCOEEDqCKyuCPQ+a6WtmZpwefFek2sxaOu1duwvZHX0v+6smtjbWbNQX3cEOH+CSNXD7dGMWokMe1hOcXMo3fvLuiaW+/21VEiUVtCzUO2b6xomH38WCt8Sw2Twm7BDnhyGpYwzGrlbJushh4GUUIXFzv7zCXN3s2PcnZYYfukYRuYnW4TPZ9MQUdeFkpfDoV8iofNXImJYe23/UZQX93aKsBA9JxG+iKJnd7NfBeq1L/2OnhhrfiFWOqc/Xyi6lfyheltrs7nLpFpVsyvm35dohs/jwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749646201; c=relaxed/relaxed;
	bh=4X+42VVoffs25/5iRChCYikoLBRm7IkfNICMQoRWKIk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdvXcg3tKqNY45gy/E+109xTbuUW8XG5kxNi6qUjicNlb34Tvn5zXWMEiWC9uLjfo7YdmR5ltLQjGq6uqHsXqc+8qEmO4XdSot2XiF+DB1lOzRgdA9c15KImgY4+sNskXjcW3Q6pWsRUgQXynwQkkOs/cQGrpRW/rQ/LyZ66WqPjUbDjZStyw1oVZ/QFp2P2A5K/pSwAZsuPWRUeBdnuKnlc+N8HHBSdDZuPHjfUa7XWsWCHuXxWBzcQeHGZ6qm3XA0lKdMlHvIYghUySVK6NdJFm8QDTHyDHGBcLBPOHnqCZKoP9PJAnz/pCK9dcj6G3XBRpSfhlQY2f5TuHvjH6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canonical.com; dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=OHVJkojQ; dkim-atps=neutral; spf=pass (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=emil.renner.berthing@canonical.com; receiver=lists.ozlabs.org) smtp.mailfrom=canonical.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=OHVJkojQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=emil.renner.berthing@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHQVJ6y0Gz2xHT
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 22:50:00 +1000 (AEST)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ECB033F802
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749646183;
	bh=4X+42VVoffs25/5iRChCYikoLBRm7IkfNICMQoRWKIk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=OHVJkojQMJmlHdIS98iH5oe30ZuLNwqO3wt8AO3xd9VBTG6k5Zu8ECDlTV0xgs8WO
	 pTk8W+qTexW7lBCFLFQt6yCIhYRPmIjfwDc3e3taInEgu6Tt4rAH9wMRaJzYzP+pYI
	 IGEtFif6SNzc8gvAKpRprNOZ3XaRYHIkjEpp2g3clvoPNOPZ4xU5lonqXpHyVnd4OT
	 UMFIlPLfw8xUR5L0S0zfZp65dQtXe0LxgrrH6jV8OBNiXZOuQbS3Wk8SPKpB52qiT8
	 uGC1LRi4OCba0QpWyvwv8kGNIinyvqGWCnl2TvHaAEQ1XGQ8O6BLi4RSyANdvJxEb3
	 t7TvUCIqrDzUg==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-60f49d834d1so1159470eaf.1
        for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 05:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646181; x=1750250981;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4X+42VVoffs25/5iRChCYikoLBRm7IkfNICMQoRWKIk=;
        b=IyQ9H8cgLmEwOaHSMg+sp8TtG02jdDffOpL59r+hLgFZmmg16zsR+RDHE3x6qUYI0l
         gP7/ZYuu9EaC90dPCYWB45CqRVYG11d7bE6NyX1t724vcKQub0lm5Ok7jmoMfgOr+Oti
         2SDU4aD4SECTPAsp2NAlv7sl+oc9xcoZQxfC1hbOWaeDfxpfaOGpO868/Hu0r/maL7LK
         3KyvgqvUF0QBADSjb7GLX1uVBeKBqFZykfPOD2cRPVOCe+aQzr3Qs0u8UzH0Wv4Fq7dj
         JVVqjnoO5CaBN5v2bq6CgBAkS4AobfPBoW3kPfPzYFvsXmMOU7YXL3f9RCJrNwuo6tSp
         HJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe32sGsAu6gdIwNiSFUhrDYDrhZAzm5gAQWkH+SHU2w7uotwWvm8+G/Xi32V/IKnJeRzMLp13K@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+c5irGTfmanbyG4YkDnBKcIJLMMxUnob05vlL0Z4gWvqr2iaa
	QhGK0SA4bD8UdveY1thoJ2nKLnebCQaZO+jxa6uWvNphYvONoPhcPo/RylYPoxKUT7fxcn4R99n
	I5YDDkN2NZ8mRMeUwq0WrHeZqoqcs5/T+9XJuMlTLCq8EyDxFKHZqUdg/x5zsgIYlulCvGLb4Qd
	GAOvUwXEhFO5I5HnLbN7TL0W4vEBZzR+utoKU0Oet5jEQqjuB+y2Q=
X-Gm-Gg: ASbGnct5pXzXspqOd2cw21P5MqQkcCpeLN8Kltm383f+omeLGlok75UskbAlUL6tMSd
	hsQq/DuTdKauYbG8kYM9M5j7SJjxQJw2JfYfbLQQhCYt7rfauZYuxF7Hbh9/r9a6hEpqYA+Vz1f
	hVMA==
X-Received: by 2002:a4a:edcb:0:b0:610:dff3:425a with SMTP id 006d021491bc7-610efbc7f51mr1462824eaf.4.1749646180984;
        Wed, 11 Jun 2025 05:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETnV/Jqo8g+X7qbKfoR1SGR2sJ6iPrYi1YRyXoWv3BlLfy+Wd2OtnAbWemjFYU/sz+rJKQnkUu2+FD/3Rbv7Y=
X-Received: by 2002:a4a:edcb:0:b0:610:dff3:425a with SMTP id
 006d021491bc7-610efbc7f51mr1462774eaf.4.1749646180562; Wed, 11 Jun 2025
 05:49:40 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jun 2025 05:49:39 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org> <20250611-pinctrl-const-desc-v2-16-b11c1d650384@linaro.org>
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
Mime-Version: 1.0
Date: Wed, 11 Jun 2025 05:49:39 -0700
X-Gm-Features: AX0GCFt_vM7TwvXsEQ0TdALhpQjaiAX-QFHIHk6qjQ5EwAyWOMAoe6jaIhzlNQA
Message-ID: <CAJM55Z9t5n9MCCFfwzSWqhYojZk0Hg4wEQw5Pm9T1Oyy=EaO8g@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] pinctrl: Constify static 'pinctrl_desc'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/berlin/berlin.c                    | 2 +-
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>  drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>  drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>  drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>  drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
>  drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>  drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>  drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>  11 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
> index c372a2a24be4bb80b1f2475ef8512171c8e1326f..e5a35b803ce66d247c5e5ad78e6677570a1add60 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -283,7 +283,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
>  	return 0;
>  }
>
> -static struct pinctrl_desc berlin_pctrl_desc = {
> +static const struct pinctrl_desc berlin_pctrl_desc = {
>  	.name		= "berlin-pinctrl",
>  	.pctlops	= &berlin_pinctrl_ops,
>  	.pmxops		= &berlin_pinmux_ops,
> diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> index 628b60ccc2b07dc77e36da8919436fa348749e0c..a90beb986f5bb707c54552e1333802943a4b04bc 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> @@ -448,7 +448,7 @@ static const struct pinconf_ops cs42l43_pin_conf_ops = {
>  	.pin_config_group_set	= cs42l43_pin_config_group_set,
>  };
>
> -static struct pinctrl_desc cs42l43_pin_desc = {
> +static const struct pinctrl_desc cs42l43_pin_desc = {
>  	.name		= "cs42l43-pinctrl",
>  	.owner		= THIS_MODULE,
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> index b97b28ebb37a6ec092360f8ea404dd67e6c43eac..ccd2b512e8365b3a5af0bb223329f39119bc7078 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -2852,7 +2852,7 @@ static const struct pinctrl_ops airoha_pctlops = {
>  	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>
> -static struct pinctrl_desc airoha_pinctrl_desc = {
> +static const struct pinctrl_desc airoha_pinctrl_desc = {
>  	.name = KBUILD_MODNAME,
>  	.owner = THIS_MODULE,
>  	.pctlops = &airoha_pctlops,
> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
> index 717f9592b28b51737e67aafc93664b1345511908..af67057128ff1e9e766b958fece9c71518c89081 100644
> --- a/drivers/pinctrl/pinctrl-artpec6.c
> +++ b/drivers/pinctrl/pinctrl-artpec6.c
> @@ -907,7 +907,7 @@ static const struct pinconf_ops artpec6_pconf_ops = {
>  	.pin_config_group_set	= artpec6_pconf_group_set,
>  };
>
> -static struct pinctrl_desc artpec6_desc = {
> +static const struct pinctrl_desc artpec6_desc = {
>  	.name	 = "artpec6-pinctrl",
>  	.owner	 = THIS_MODULE,
>  	.pins	 = artpec6_pins,
> diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
> index b0000fe5b31dfbcd6af6eaf0c01029f00cbd205b..387798fb09be51cabd5cb76e0d90a28b1d363050 100644
> --- a/drivers/pinctrl/pinctrl-bm1880.c
> +++ b/drivers/pinctrl/pinctrl-bm1880.c
> @@ -1298,7 +1298,7 @@ static const struct pinmux_ops bm1880_pinmux_ops = {
>  	.set_mux = bm1880_pinmux_set_mux,
>  };
>
> -static struct pinctrl_desc bm1880_desc = {
> +static const struct pinctrl_desc bm1880_desc = {
>  	.name = "bm1880_pinctrl",
>  	.pins = bm1880_pins,
>  	.npins = ARRAY_SIZE(bm1880_pins),
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index eddb01796a83eb86c8c5bcf6788c999e8bf2926a..66c04120c29deccf53b21cbf8705f1d10c74ace5 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -879,7 +879,7 @@ static const struct pinctrl_ops k210_pinctrl_ops = {
>  	.dt_free_map = pinconf_generic_dt_free_map,
>  };
>
> -static struct pinctrl_desc k210_pinctrl_desc = {
> +static const struct pinctrl_desc k210_pinctrl_desc = {
>  	.name = "k210-pinctrl",
>  	.pins = k210_pins,
>  	.npins = K210_NPINS,
> diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
> index 0f5a7bed2f81b731714e3b65908df23f2ffdfd63..5e0201768323521754e7ecd27e878a81925c18a6 100644
> --- a/drivers/pinctrl/pinctrl-lpc18xx.c
> +++ b/drivers/pinctrl/pinctrl-lpc18xx.c
> @@ -1257,7 +1257,7 @@ static const struct pinctrl_ops lpc18xx_pctl_ops = {
>  	.dt_free_map		= pinctrl_utils_free_map,
>  };
>
> -static struct pinctrl_desc lpc18xx_scu_desc = {
> +static const struct pinctrl_desc lpc18xx_scu_desc = {
>  	.name = "lpc18xx/43xx-scu",
>  	.pins = lpc18xx_pins,
>  	.npins = ARRAY_SIZE(lpc18xx_pins),
> diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-mlxbf3.c
> index ffb5dda364dc81808cfd5a168ce3f1e9f119357d..fcd9d46de89fb3e5215784109ba31b171fd15448 100644
> --- a/drivers/pinctrl/pinctrl-mlxbf3.c
> +++ b/drivers/pinctrl/pinctrl-mlxbf3.c
> @@ -231,7 +231,7 @@ static const struct pinmux_ops mlxbf3_pmx_ops = {
>  	.gpio_request_enable = mlxbf3_gpio_request_enable,
>  };
>
> -static struct pinctrl_desc mlxbf3_pin_desc = {
> +static const struct pinctrl_desc mlxbf3_pin_desc = {
>  	.name = "pinctrl-mlxbf3",
>  	.pins = mlxbf3_pins,
>  	.npins = ARRAY_SIZE(mlxbf3_pins),
> diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
> index 4edb20e619510b2f52c7cde41c2540328ec4e95d..129fa51d13b1e265b8145c87f19fba0e8f14f1aa 100644
> --- a/drivers/pinctrl/pinctrl-tb10x.c
> +++ b/drivers/pinctrl/pinctrl-tb10x.c
> @@ -735,7 +735,7 @@ static const struct pinmux_ops tb10x_pinmux_ops = {
>  	.set_mux = tb10x_pctl_set_mux,
>  };
>
> -static struct pinctrl_desc tb10x_pindesc = {
> +static const struct pinctrl_desc tb10x_pindesc = {
>  	.name = "TB10x",
>  	.pins = tb10x_pins,
>  	.npins = ARRAY_SIZE(tb10x_pins),
> diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
> index caa8a2ca3e681718fe213921deca8d130371b122..dcde86fed10db3e2dfebc19cb841ea7f63e74989 100644
> --- a/drivers/pinctrl/pinctrl-zynq.c
> +++ b/drivers/pinctrl/pinctrl-zynq.c
> @@ -1143,7 +1143,7 @@ static const struct pinconf_ops zynq_pinconf_ops = {
>  	.pin_config_group_set = zynq_pinconf_group_set,
>  };
>
> -static struct pinctrl_desc zynq_desc = {
> +static const struct pinctrl_desc zynq_desc = {
>  	.name = "zynq_pinctrl",
>  	.pins = zynq_pins,
>  	.npins = ARRAY_SIZE(zynq_pins),
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113bfd208fb844ba7d 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops = {
>  	.is_generic = true,
>  };
>
> -static struct pinctrl_desc starfive_desc = {
> +static const struct pinctrl_desc starfive_desc = {
>  	.name = DRIVER_NAME,
>  	.pins = starfive_pins,
>  	.npins = ARRAY_SIZE(starfive_pins),
>
> --
> 2.45.2
>

