Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 232CA515282
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 19:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqfvx0Ffxz3bfb
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 03:42:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BFVgjtTH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BFVgjtTH; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqfvW5N9Vz2xRm
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 03:42:30 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 k25-20020a056830169900b00605f215e55dso2241467otr.13
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 10:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9z0oLEhMUo0s36vvIh02UNk7tir7g6nfy3uYHA227Nk=;
 b=BFVgjtTHDF38sq9/Xc3eyU+f5mbUCTUHCGLzkBEp4pgpiOZYELdIjgA2DA68sFhr89
 XhdrPwINbYmzlVQXplgDQddxEPCW1P+YV2W3c4eqkNIAiPmh3q2YPplseotDaMggWQ+8
 QYBYqqIIYhV0RD/XaoIT5059YH+ZaVnzE8OEAMnymG8TGZZkF/k4oKb1jqvPK2br0F34
 AvQkE7aC6RVa9m7DDP2509iIaYTzZhrhxmPV0OY+BRWSGKy3FUl8TIMV0NtR5f97QLOK
 A8JHelq4uHiBlVzfaw/nDtmgUjXBCE8ucibVmVLEgk0ki2kJhwQglWmwm9PLRo0YPJXg
 jIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9z0oLEhMUo0s36vvIh02UNk7tir7g6nfy3uYHA227Nk=;
 b=UVB2d1i2XWU+v2GuLXxS+0CiIfu13sbutYOzGD1+J9qJz6R0WCh9B5PnBLjplE/cR6
 al1F311SnklUoeVabM7qat08Gip1UWH3KFmb2v+cYzcEFQ/yYZYfR+m95AOP9Y+cQ89s
 5BeBN5utohZ7uF15GGiA4vwzYnwqYCVMB/M8kxUXvZFxBPAWKIVoBHxcPQqwPm2NsRzu
 tWj+QfcNVPVPAJj+68216PfBDHtwAhjQ3dWYCeGHpJTgq0YYE/5f/9GTSw6hQUu//F24
 coyK9jO4PSKe5bdewIQNf5fW4y3RoGERy1X7kWXsfwY8Mmk3sxcb7rFf5pTp9cE/QLjD
 IQLw==
X-Gm-Message-State: AOAM5317Y23UnYr6BdAPBv/BhfUCGwkVQ/fdT/zAzMQ0hsDBxwl25wLE
 /dtn8/VoDeHsLZTg5xZJIAY=
X-Google-Smtp-Source: ABdhPJz5e2UfdinEgtc+ze6y3kQhFU9T8UDmBrBsmd/4YwtVPRLBwHmqIvvcLUpZfYNdPNZqQAJJkA==
X-Received: by 2002:a9d:491c:0:b0:605:c207:1f6b with SMTP id
 e28-20020a9d491c000000b00605c2071f6bmr186432otf.41.1651254147619; 
 Fri, 29 Apr 2022 10:42:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a9d53c8000000b00605f347a4fdsm844322oth.79.2022.04.29.10.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 10:42:27 -0700 (PDT)
Message-ID: <aec36ea2-b007-f24a-5709-27b6e87e5177@roeck-us.net>
Date: Fri, 29 Apr 2022 10:42:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/7] watchdog: npcm: Enable clock if provided
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220429172030.398011-1-j.neuschaefer@gmx.net>
 <20220429172030.398011-4-j.neuschaefer@gmx.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220429172030.398011-4-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/29/22 10:20, Jonathan Neuschäfer wrote:
> On the Nuvoton WPCM450 SoC, with its upcoming clock driver, peripheral
> clocks are individually gated and ungated. Therefore, the watchdog
> driver must be able to ungate the watchdog clock.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> v2:
> - Add clk_disable_unprepare call, suggested by Guenter Roeck
> 
> v1:
> - https://lore.kernel.org/lkml/20220422183012.444674-4-j.neuschaefer@gmx.net/
> ---
>   drivers/watchdog/npcm_wdt.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 28a24caa2627c..ee08d9805f966 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -3,6 +3,7 @@
>   // Copyright (c) 2018 IBM Corp.
> 
>   #include <linux/bitops.h>
> +#include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
> @@ -43,6 +44,7 @@
>   struct npcm_wdt {
>   	struct watchdog_device  wdd;
>   	void __iomem		*reg;
> +	struct clk		*clk;
>   };
> 
>   static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
> @@ -66,6 +68,9 @@ static int npcm_wdt_start(struct watchdog_device *wdd)
>   	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
>   	u32 val;
> 
> +	if (wdt->clk)
> +		clk_prepare_enable(wdt->clk);
> +
>   	if (wdd->timeout < 2)
>   		val = 0x800;
>   	else if (wdd->timeout < 3)
> @@ -100,6 +105,9 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)
> 
>   	writel(0, wdt->reg);
> 
> +	if (wdt->clk)
> +		clk_disable_unprepare(wdt->clk);
> +
>   	return 0;
>   }
> 
> @@ -191,6 +199,10 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>   	if (IS_ERR(wdt->reg))
>   		return PTR_ERR(wdt->reg);
> 
> +	wdt->clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(wdt->clk))
> +		return PTR_ERR(wdt->clk);
> +
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
>   		return irq;
> --
> 2.35.1
> 

