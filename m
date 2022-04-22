Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3B650BFDD
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:38:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNTH1PDmz3bdY
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:38:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TVybQ9BG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TVybQ9BG; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNNb6DzMz3bcl
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:34:23 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id w194so9937160oiw.11
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hUAGJI7MZIzFGBlWW57hloz6jpEOZG9rptUBKkWEgMk=;
 b=TVybQ9BGLyIfiMbQ8yLpEWT3buhFfnziUIlE3M+S7kswwHnSHyCXOYVWdTYkMoa2Hp
 TjLBIFbXJ1L3liznezkxkj4G/lXpyCLk0M1OtcYMhd5FnA/1d4yn2/fBOpfrKsy5GGso
 pjsxDdCIweB59jQDBnAJRPDmEfjt83ZQ72c182ocNXUK9jFOukuzxg1evZl5xBqcIBGJ
 b2D9npXg69VFXjCXW1xQTsiAxIFqoH7PgLqGKIkWqv9whdskSrioK/1hgKwu8Ep36xZl
 p5rUU6Zy44txzPKM2APsYISxbKYIwC8DmJtnav/QxRUAvlW/vmScJRtBYiESVTgBal0z
 +/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=hUAGJI7MZIzFGBlWW57hloz6jpEOZG9rptUBKkWEgMk=;
 b=AKLnqdXDlr/YsvOqHDSkLue3Gm3RV6Zv5/Kn0OLcRzDCxiVV09miNorZOEBq5cfstx
 19GegLVUHgM4IbLD5IzFkX6a09K4gD7tOFZwSaLMoxaR5FuBT/9KHHQkFb/UJbAZVybo
 zXulqSU8DdbsFpQLPEDcE8eD6NKHQ3Dmg7YzM36Qmr7VFROodnHCk1oREkutH6chGna/
 RiypUAQwrai65il6do3pQVefRuK6csx6T6ppI8FE6Z0+U+oG4jIoRghObzkitzLsDjVe
 L17nP70Iz9x4jI7s40+4zU6tVGKvaa4Pa8CV1LSeDe6irKguy9eymOxpkM271VeNiWk7
 uzlw==
X-Gm-Message-State: AOAM530PAPYr+kPnwllf6ZaQJK8gGIezLQE2uUUgll+KOIXRRp0L3jjL
 ifR7W8vQ3Jmpv6FRSM+Vuf0=
X-Google-Smtp-Source: ABdhPJxXTOlR3CyOaSls0W1PFuow9H3jq2A9kiQEbWk0nPfmXNkGykl0l6n5RNsWtUtRazUUrdDGNA==
X-Received: by 2002:aca:5c44:0:b0:322:ed86:2c08 with SMTP id
 q65-20020aca5c44000000b00322ed862c08mr2831409oib.17.1650652459466; 
 Fri, 22 Apr 2022 11:34:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a056870d41000b000e1a3a897basm953335oag.26.2022.04.22.11.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 11:34:18 -0700 (PDT)
Date: Fri, 22 Apr 2022 11:34:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 3/7] watchdog: npcm: Enable clock if provided
Message-ID: <20220422183417.GB2637654@roeck-us.net>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
 <20220422183012.444674-4-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422183012.444674-4-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 08:30:08PM +0200, Jonathan Neuschäfer wrote:
> On the Nuvoton WPCM450 SoC, with its upcoming clock driver, peripheral
> clocks are individually gated and ungated. Therefore, the watchdog
> driver must be able to ungate the watchdog clock.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  drivers/watchdog/npcm_wdt.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 28a24caa2627c..6d27f0e16188e 100644
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
> @@ -180,6 +181,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct npcm_wdt *wdt;
> +	struct clk *clk;
>  	int irq;
>  	int ret;
> 
> @@ -191,6 +193,13 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->reg))
>  		return PTR_ERR(wdt->reg);
> 
> +	clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	if (clk)
> +		clk_prepare_enable(clk);
> +

This needs a matching clk_disable_unprepare().

Guenter
