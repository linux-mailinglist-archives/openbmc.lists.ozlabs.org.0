Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36E520B43
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 04:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky29q3xkdz3bs3
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 12:31:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ad5rH4ZC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2b;
 helo=mail-oa1-x2b.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ad5rH4ZC; dkim-atps=neutral
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky29Q5NkTz2yHp
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 12:31:38 +1000 (AEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d39f741ba0so16778757fac.13
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 19:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WQ4ekUdvIEeuhghpikQ1JPVbw9/3bfIzB4anGXihbmA=;
 b=Ad5rH4ZCG1dSL6ZgrZmr4V5ghKezH1r/diKrjXYbe2YHw76OlU0K4LcnOsRp97woni
 y+Cl15CKjwB1DMvdRVqa8S3gu6ognXfTrPx1Mf9Bf/NWH9s/XhyONYRbDO6RdIgrjalw
 PWSiTj4Wu4vSv6OomeYhjQRcoxgKlmA3lb+b5YsyunvhqX9ixBlI7aCiTWW7aMVhcYIl
 XOa9J5Z98aP6VtU6jvGVFFaIo04iNV5rsw8scaYTyA9NtNQoYNhpCrcQoGYXJOg/d0TA
 zs63UmrzybGb0rrZRmOB9rtd49FO8AEsYgGuniLQ9ofCbCXeUYf9O+HKM/fG0C0egTFh
 iaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WQ4ekUdvIEeuhghpikQ1JPVbw9/3bfIzB4anGXihbmA=;
 b=Gh27cTuWK39BPe1e7uWlG2NiL1vZmKNjKbcyejlbqVfoRj5+1NsoOYxdXcMobNjMiZ
 c9ITX+YKat/X1aw90LKMMXkxp2+h4ugy1M25fxvTQLL9Gmsk+F3QgJKCv5El0sorpZho
 ABONkhsKfCMoIbpIkUWgyFqhJXSrX0Ngqo3k+PVcKwsVAChZk352ILMUzvoQhKtGLV8g
 Zkht3CBwsAYmsQBTYSIvIx6ADoX8AKvcwucXAMjNq4mMZrTtW0RrACICYdNqota3/mpq
 qti2I0+WHZejnzETarkW4uCRGxU4dh/LgRzaxNVUbMpkiitkXDdXHuvineDZdahxavsb
 NofA==
X-Gm-Message-State: AOAM530qpdkCKfR99ZGy2yePXIxwcOrJXcLRFsncygoz5IP5dPxm0PpV
 WBKa1ptF2iONb5G2B+/M3NI=
X-Google-Smtp-Source: ABdhPJzCPsT/AkGUXnABu+k3dZsWeDaF9p1l07PTyX4dGljF669fkFfK7sPIb7GyrRglVmor+VG5KQ==
X-Received: by 2002:a05:6870:e40b:b0:ed:a6ac:4ae8 with SMTP id
 n11-20020a056870e40b00b000eda6ac4ae8mr8698314oag.71.1652149895444; 
 Mon, 09 May 2022 19:31:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a056870211600b000e686d13876sm4973331oae.16.2022.05.09.19.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 19:31:34 -0700 (PDT)
Message-ID: <6c22fe1c-03d9-3a7e-26e8-463b989a02b7@roeck-us.net>
Date: Mon, 9 May 2022 19:31:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/7] watchdog: npcm: Enable clock if provided
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
 <20220508194333.2170161-4-j.neuschaefer@gmx.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220508194333.2170161-4-j.neuschaefer@gmx.net>
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

On 5/8/22 12:43, Jonathan Neuschäfer wrote:
> On the Nuvoton WPCM450 SoC, with its upcoming clock driver, peripheral
> clocks are individually gated and ungated. Therefore, the watchdog
> driver must be able to ungate the watchdog clock.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> v3:
> - Add enable/disable calls to npcm_wdt_restart handler
> - Not applied due to the above change:  Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> v2:
> - https://lore.kernel.org/lkml/20220429172030.398011-4-j.neuschaefer@gmx.net/
> - Add clk_disable_unprepare call, suggested by Guenter Roeck
> 
> v1:
> - https://lore.kernel.org/lkml/20220422183012.444674-4-j.neuschaefer@gmx.net/
> ---
>   drivers/watchdog/npcm_wdt.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 28a24caa2627c..a1240a906ef2a 100644
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
> @@ -147,9 +155,15 @@ static int npcm_wdt_restart(struct watchdog_device *wdd,
>   {
>   	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
> 
> +	if (wdt->clk)
> +		clk_prepare_enable(wdt->clk);
> +
>   	writel(NPCM_WTR | NPCM_WTRE | NPCM_WTE, wdt->reg);
>   	udelay(1000);
> 
> +	if (wdt->clk)
> +		clk_disable_unprepare(wdt->clk);
> +

I am trying to understand why you stop the clock here.
If the watchdog didn't reset the system by now, for whatever reason,
you explicitly don't want it to reset the system ? If so, please add
a comment describing the reason for stopping the clock here.

Thanks,
Guenter

>   	return 0;
>   }
> 
> @@ -191,6 +205,10 @@ static int npcm_wdt_probe(struct platform_device *pdev)
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

