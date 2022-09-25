Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063345E9493
	for <lists+openbmc@lfdr.de>; Sun, 25 Sep 2022 19:01:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbBxM5W4gz2yP8
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 03:01:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bf8hrf7c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bf8hrf7c;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbBwt1rK3z2xh0
	for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2022 03:01:00 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id l65so4577589pfl.8
        for <openbmc@lists.ozlabs.org>; Sun, 25 Sep 2022 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=mQCpHD3b/oNCevN1QdhnwOd9ghkLwiR4HAI/Op4UuAA=;
        b=bf8hrf7c6j8YQs+sOdKjxNXSefn9xJG6UauB5PFVUdvSCMOO06soFxo6uSM5d7CdTu
         Lq8zhjPSjKXyQq/x4t+UHwoeEZJP3A2o2wAP+1EwbE8PLnmcJ4/Uq0SHXE4kJN1LgZlh
         KyusDiO+XksJkRFbDE1UtOHZ3THL9uS9I5h3pVP1TQzDoQ3oWYOV8uWe2wQ4DLhzO6xM
         BTngVtZnw+6VKOH3hVXK/w5hifpw43RzmpqAiWxK5qJo07ryAthcV5UNgb9BTdV4L32l
         gVB4YacWjbp3ZFKmy6/NDzbWf+7wMrwl+EfXYp2z5+DdT23dnJdvEhkiWRvN5Mimgnz3
         AFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mQCpHD3b/oNCevN1QdhnwOd9ghkLwiR4HAI/Op4UuAA=;
        b=YiVrILANYJcpmcHjPswCvRmlGyuXIRsM+ugPu6oAlmrEUsilQYGbGps15I0qUFXiAc
         TFpK8fSHqp33Aiy0WE/Amx3qVxeoui7FNo595yLH3sMZFqjQOZM0XPl0MzVZM5CDjmS1
         mpGCQc1S6F8oObLqmCW/1daPizLdXpZJy5Lzx2mFxGEOkVpLDq71IrT9WbnXCrxFRFMj
         bAdsONkhDJRQuTDyOgHUIVtc9WvS4lTNlS/f+9DIdsUsrXEs6Z0jFzy/BpjCEd9DRuxL
         Nt+AKJ7lBNiiPGVzFvYPZlGxcysD5Sf/Q9lqKUGfDXlBnmGAaD1UNH0NfIDtNqlBODfr
         SCgA==
X-Gm-Message-State: ACrzQf2Y5NhjDWP7TU8TVxQlJ/gy6kKJkiRE7JPJNaFRKGPx2oIgbLB+
	5nrDlz964+0PAqXQ41c9Ssk=
X-Google-Smtp-Source: AMsMyM6jgUS4ubKgESzfz+N9IM1J19XaOtd5m/aHe9WxopcH66fZ8/ZlVBJuzJsUTY/l33Io5pHCoQ==
X-Received: by 2002:a63:86c8:0:b0:43b:63ae:dc8a with SMTP id x191-20020a6386c8000000b0043b63aedc8amr16647335pgd.578.1664125256819;
        Sun, 25 Sep 2022 10:00:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2-20020a631e02000000b0042b5b036da4sm8998400pge.68.2022.09.25.10.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 10:00:55 -0700 (PDT)
Date: Sun, 25 Sep 2022 10:00:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v4 2/6] watchdog: npcm: Enable clock if provided
Message-ID: <20220925170053.GA1761191@roeck-us.net>
References: <20220610072141.347795-1-j.neuschaefer@gmx.net>
 <20220610072141.347795-3-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610072141.347795-3-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 09:21:37AM +0200, Jonathan Neuschäfer wrote:
> On the Nuvoton WPCM450 SoC, with its upcoming clock driver, peripheral
> clocks are individually gated and ungated. Therefore, the watchdog
> driver must be able to ungate the watchdog clock.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> v4:
> - Don't disable clock in npcm_wdt_restart function
> 
> v3:
> - https://lore.kernel.org/lkml/20220508194333.2170161-4-j.neuschaefer@gmx.net/
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
>  drivers/watchdog/npcm_wdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> --
> 2.35.1
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 28a24caa2627c..a5dd1c2301374 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -3,6 +3,7 @@
>  // Copyright (c) 2018 IBM Corp.
> 
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
> @@ -43,6 +44,7 @@
>  struct npcm_wdt {
>  	struct watchdog_device  wdd;
>  	void __iomem		*reg;
> +	struct clk		*clk;
>  };
> 
>  static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
> @@ -66,6 +68,9 @@ static int npcm_wdt_start(struct watchdog_device *wdd)
>  	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
>  	u32 val;
> 
> +	if (wdt->clk)
> +		clk_prepare_enable(wdt->clk);
> +
>  	if (wdd->timeout < 2)
>  		val = 0x800;
>  	else if (wdd->timeout < 3)
> @@ -100,6 +105,9 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)
> 
>  	writel(0, wdt->reg);
> 
> +	if (wdt->clk)
> +		clk_disable_unprepare(wdt->clk);
> +
>  	return 0;
>  }
> 
> @@ -147,6 +155,10 @@ static int npcm_wdt_restart(struct watchdog_device *wdd,
>  {
>  	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
> 
> +	/* For reset, we start the WDT clock and leave it running. */
> +	if (wdt->clk)
> +		clk_prepare_enable(wdt->clk);
> +
>  	writel(NPCM_WTR | NPCM_WTRE | NPCM_WTE, wdt->reg);
>  	udelay(1000);
> 
> @@ -191,6 +203,10 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->reg))
>  		return PTR_ERR(wdt->reg);
> 
> +	wdt->clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(wdt->clk))
> +		return PTR_ERR(wdt->clk);
> +
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
>  		return irq;
