Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF50599B40
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 13:45:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Kgl6sD2z3cfF
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 21:45:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LBXZTKao;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LBXZTKao;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8KgD5XmLz3cMq;
	Fri, 19 Aug 2022 21:44:55 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id a22so4107592pfg.3;
        Fri, 19 Aug 2022 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=UCWqtLC1yYug912P/xJZXTJO6IcyX8bpF1RM7XJlaA4=;
        b=LBXZTKaoBUH+ULwwdTRqW7STUr819eXN+/NMdPNxP+5tEbdZ6FxlaikH6UCkpr72XN
         dXX0LxEt5egGP1IXKhQc84rS+ZgQHD+ve58/pw7tsfdQwf0BAozP+jWQjvfG8QvE8oDK
         +wkS0I1D4u//cpAXd06OVcrRleAS0TXi2042Fgmmx5oF71mncxDjNy/8Ff7oSzrDvrx5
         liSSJQAn80C4GdCiNuBYVVzjSpIf5af5RoueihAyt/AHUJbBltK7D5HEKBIBBMCb5mwk
         RjKZE/7nNP/3xb9sQ+vz778brQVkboSN5YVQAd12n40WZMxnvOSvIdqq6FHzsyLvM3hh
         2duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=UCWqtLC1yYug912P/xJZXTJO6IcyX8bpF1RM7XJlaA4=;
        b=j8eaBzRjR9Ittse+n0SnJCE4TeatIUiYHGYmPuT9ARUHAnV3ePesWOX+b5NHmJd4Rq
         b6I43gCmvM+SXg9xAMzUvhy/ETB0nzZhH6CQVP55Cy+J4wP/AFDXAXw3JTiCcgJmNB7e
         +rhDajQFs+T7p/9PgySfsGXIKkyk90kp6hcB95UoamgCgr9kmtORwBK84hApQpVMlMFX
         JaXClsxpFFUPhHZmjcEe0Sg9rWLgxXJvWtKmh8EgFr5fb4yMDrH8bLmSjXnLPJH38lOh
         IKpZ8yCqqwdMYxGHX6s/2TtgzXStI/4jklS+2figkmKGfU6pk2HteFy0oFSUYU2t1/KC
         n3lw==
X-Gm-Message-State: ACgBeo13SbSOvVJbxMxVhpmpm1GgWeT+zCFpqCgkvUnw9xoKjqKyEcCm
	3Ps1ujbixo6B2zfwgxvzdPw=
X-Google-Smtp-Source: AA6agR7CbiVFbWALuy4dvNt5DjW422IoGaxOs/+ufjJr9mtOmCjJQ90/G+ZsrjghuJAhrL0WMIqN0A==
X-Received: by 2002:a65:6d1a:0:b0:3fb:2109:7b87 with SMTP id bf26-20020a656d1a000000b003fb21097b87mr5869447pgb.127.1660909491496;
        Fri, 19 Aug 2022 04:44:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q62-20020a17090a1b4400b001f4cc17b451sm5030849pjq.5.2022.08.19.04.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 04:44:50 -0700 (PDT)
Date: Fri, 19 Aug 2022 04:44:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH] watchdog: aspeed_wdt: Reorder output signal register
 configuration
Message-ID: <20220819114449.GF3106213@roeck-us.net>
References: <20220819094905.1962513-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819094905.1962513-1-chin-ting_kuo@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, wim@linux-watchdog.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 19, 2022 at 05:49:05PM +0800, Chin-Ting Kuo wrote:
> If the output driving type is push-pull mode, the output
> polarity should be selected in advance. Otherwise, an unexpected
> value will be output at the moment of changing to push-pull mode.
> Thus, output polarity, WDT18[31], must be configured before
> changing driving type, WDT18[30].
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/aspeed_wdt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 436571b6fc79..a03e4ff812a2 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -325,18 +325,18 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>  
>  		reg &= config->ext_pulse_width_mask;
> -		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> -			reg |= WDT_PUSH_PULL_MAGIC;
> +		if (of_property_read_bool(np, "aspeed,ext-active-high"))
> +			reg |= WDT_ACTIVE_HIGH_MAGIC;
>  		else
> -			reg |= WDT_OPEN_DRAIN_MAGIC;
> +			reg |= WDT_ACTIVE_LOW_MAGIC;
>  
>  		writel(reg, wdt->base + WDT_RESET_WIDTH);
>  
>  		reg &= config->ext_pulse_width_mask;
> -		if (of_property_read_bool(np, "aspeed,ext-active-high"))
> -			reg |= WDT_ACTIVE_HIGH_MAGIC;
> +		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> +			reg |= WDT_PUSH_PULL_MAGIC;
>  		else
> -			reg |= WDT_ACTIVE_LOW_MAGIC;
> +			reg |= WDT_OPEN_DRAIN_MAGIC;
>  
>  		writel(reg, wdt->base + WDT_RESET_WIDTH);
>  	}
> -- 
> 2.25.1
> 
