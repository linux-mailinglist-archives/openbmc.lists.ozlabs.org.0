Return-Path: <openbmc+bounces-167-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E4AD6424
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:02:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjNw3XnYz30T9;
	Thu, 12 Jun 2025 10:01:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749646150;
	cv=none; b=A/LLSZ7xYKgLd57YKMo9tmSwyOrpr0uFoWvotKaV9//3WjN+evyQIXtHWA6j/UM8t58YwAyKOoSXNy4OdGkh94Osf9LtfBuAwWbeSYiMX5FmhWQhPO7T5xq8g6f0DksM28UIxs1uGQMfQDqBR9OyS/rrrIhZV2CmlfR90QRhGyzhtPm/hFyWFgj0HwG59EMsTIWxQKeZ/vMcGpM0S2jRfGz/i+UNObUsGEJVcaiqV7Gus7reUxmBJ6yI4yN75+rlaTAXLtS0qiAEsthRbmStkRvW5qh5JgOAZ4u/4m7b919PKRUdHlBO/fOoVEow8iJn72bUZIiAayQTVtGVPnw9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749646150; c=relaxed/relaxed;
	bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktjar2mvuvPas5do2UQgfMkZB0UXKHBQjcxNCDhxOMqpEZfyVnf4QOJAarF03Jrh2JxtnvpGp7LLRddwN9smZ3klQMKD/zjguAmQaXTg6SK/2ht9fkqF9frynIgH+j4Md4JbBfxbTlD2Of0i4lo8NrrfQr6KsGuyRgZHc3MtMvzdD29Z5H/aMQh0GqiDLHsewDGIjphmMT8gTq721EbOTsyJRQyHSkikYfoUZk3J/NbFfVzyv6dc5utBTgO+LB5/7u7ab2R/Ed3FHxqOicCVaH2jM7MCWXKeln7RhoFMf5ips1yJRzWgmzSKI8yUf/9j+widicMreGo3R3/vGt7okQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canonical.com; dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=BBSImZ1+; dkim-atps=neutral; spf=pass (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=emil.renner.berthing@canonical.com; receiver=lists.ozlabs.org) smtp.mailfrom=canonical.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=BBSImZ1+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=emil.renner.berthing@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHQTJ55G0z2yDH
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 22:49:07 +1000 (AEST)
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8695B446FC
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749646140;
	bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=BBSImZ1+tybxpvjY+IybdNVTkyIe5JEVQQCKpwONXGrZDG70upsHmJ9CklBueXqu2
	 TvqnzJ3sX5nA20tmELLVGJNZvwRJ5oJMWa/URO0WA6X4FEehKYvA4J4hsyXX75Q0WS
	 wTjD+TRmirHpjAJs0MFalXyIM2pzbBqFE1aObKumo3DsSEikVhyTj/sAZX7/CgFEJ2
	 VlxQcf6+8qJgG7DX9HsTfBgWXrqopy+F4sGY7DUDhZq+Ek+qPsGip/mCT5EfrYE5Nu
	 Xuducgdgbv2YWmVmtGdMt0OK7Oizmk3k3lYkUfJFMaabYVNX/bPay7x9fk6fZims0E
	 N/tPOsMLQev4w==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2d9ea524aa6so5906890fac.0
        for <openbmc@lists.ozlabs.org>; Wed, 11 Jun 2025 05:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646139; x=1750250939;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
        b=QZ0yXa2IfUBZ5QrJEtpb6TCsKAH0er37pBucA+umBAOz+31Ps+u+DCdgDVCwRTRch5
         5UHAxYSsNL5xPehfc6S/cgjTfjJi1dhsVfkiuaHr94Jtx8eNCfVrCd0wuamdoe09FwG2
         1ExU/tmNdPHTERHwKWjT3Dv5LDHuQXFDqgebRg+xQkP4L8l2OCr/4mZJtWRF4uhGla2/
         tn/ifoCjbbVY1T7UhZSGzXZxWVmRG9+FUNFO7R9EAOTt/yK3YbhNDb250veZXoYbWatk
         yqyF5Yp0UU2oWTlAQkeejtnMA/b6N5oGyi0xvtMLvkGjuxKJedEUAI/ZjmaxMITcQWWh
         eo7A==
X-Forwarded-Encrypted: i=1; AJvYcCXP8lpUeH7HUKWw0iDXAmw8EOqcg2G1lQusR0BDBOZMD+HGWyIjakgYldkXLelrRNIYHgE3peyV@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJOYstAruSjG3edJxls0SZeZP4XmfnOJVblxJPWYSqWSPLRK5c
	RRBVdu8H0pFQiJyrEtfrbmzN3LbUqTY9HsGMH94EbR+dOebOMAgDwWqD7bdFHg7/VbIIev/DQ9U
	MXh/7oGi2NyZhyOsA0xxuQHtNbfcX1Zqu/MY5eOhXvgNHYQen5qLLCdE/fI6hw/6YfjdfVT/ArS
	CiTC1gdWp+7acPmxycocssKdb43+9cpkr3pT6JrpulTy6JlbzG63o=
X-Gm-Gg: ASbGnct0I4A+b/bz57Cs+O/OaT6tN3CnX4vTVtIpKw3F5PppDQVHwDd/tbzPx1U3VfK
	zGNPF73ZP0kAU23wGAEQRrk5kT7rcjb3oy/0zq3if/RlPRUp+JCFkNGKGgwJl8Nj23jQFZ5iI8D
	8t8w==
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id 586e51a60fabf-2ea96f18fc2mr1940855fac.30.1749646138965;
        Wed, 11 Jun 2025 05:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzhqyM2kCCDhwaEPz02MLETIROTaGu5WeJENkIMCzCu3hfLe4ldyitgFfsfYyGdI6dZNlApiM1ratiR1ypk/k=
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id
 586e51a60fabf-2ea96f18fc2mr1940818fac.30.1749646138634; Wed, 11 Jun 2025
 05:48:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jun 2025 07:48:57 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org> <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
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
Date: Wed, 11 Jun 2025 07:48:57 -0500
X-Gm-Features: AX0GCFuz_RtY5rxDREJdwFYXLGRQkyQfytWb3LifI1_It-SfpAfrMZfWta2TVOY
Message-ID: <CAJM55Z9WzsxWGmQYH05hSisigTRaHuKOn8g3AsLJ9h6Womy2dg@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Krzysztof Kozlowski wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since its Makefile doesn't build anything if
> no Starfive-specific pin control Kconfig options are enabled.  This
> allows compile testing on other architectures with allyesconfig.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -83,7 +83,7 @@ obj-y				+= sophgo/
>  obj-y				+= spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
>  obj-y				+= sprd/
> -obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
> +obj-y				+= starfive/
>  obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
>  obj-y				+= sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
>
> --
> 2.45.2
>

