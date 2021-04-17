Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625E362D77
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 06:21:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMfys40LVz3c00
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 14:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=piQInaLB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=piQInaLB; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMfyZ2pNWz30Cs;
 Sat, 17 Apr 2021 14:20:53 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id b3so15198359oie.5;
 Fri, 16 Apr 2021 21:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Yf4cGa1gDUioK7Tp5qZNGmRyNKmLAms5q26b5QKwv4I=;
 b=piQInaLBoIAceOzFkrF0BoCeDSvSZtOAd8AiEd43+fyfVbehfg9SI7YxxzSHizd1xk
 76N94AEBwmsNbyaM0xNh7YAmEMg6EBFyU3J9+3p5gxmSXeo8eiMdOrMj/xb88dPk4Oy4
 fInFcdW9LXm29s0pPouGUFfihn0wmDNyptLw3JMhglRHeukM/2WtNI/yowPcNbkc5coE
 kSOTsXPHDhq9aBPe06d4kiCIyRVkqR/e6aiWCJaLBOQG3rFP7hJVB07fW/tsYdtbOc0J
 mshqqYuvvk5FCkcw8uzD68QKqCRbUvTIgsCDDdzVfyfEjjSF5brz7IqljNzUSYRKiOP9
 jDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yf4cGa1gDUioK7Tp5qZNGmRyNKmLAms5q26b5QKwv4I=;
 b=KmmZeLnKZnB5sMQ9ZyDuAPtLFo/iBedPsQEyTh1y8Wd9Ec4Y9BpFefmql5LZpxiMwD
 k9pGPWLYmV1DQ/mDAb8i5BIUqGGI/30m1XwiDL/7knAp4NlGvMezPwinM8QLcUfB52ma
 Kc5+sVzjnT179tO6T1M4+nv++mTzNOPTjY8emkXnPNZXaoOPm+U54v8UuRORIG1DxEhN
 qJo443WyTKMh96QwOnvuSR9C6jGamDdXxo2/Ek7B4FK768o/eeKTjIx2Rvc8XRoAKWMC
 zkor64uNEOKKPhEDZJYLHL7dlIOs2YdkKuvUvZhd/DCHYF6TM+nd1KeI/9HrluU+V3WT
 gokQ==
X-Gm-Message-State: AOAM5318z9w22YnUeYD9kGTgfOEOCCmeAmDk+mALiot6tt+USnaV85Vk
 2lLZdKjEavuJOoA0NtC1XzQ=
X-Google-Smtp-Source: ABdhPJxAT7odgGlh+hNxttap8x0zum9s/e3YiZYiZCZNA4kSTGiSQQY4Cn2fQzPSS4tsk9DfBcifFQ==
X-Received: by 2002:aca:a990:: with SMTP id s138mr9144164oie.80.1618633250989; 
 Fri, 16 Apr 2021 21:20:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h184sm1866764oia.1.2021.04.16.21.20.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Apr 2021 21:20:50 -0700 (PDT)
Date: Fri, 16 Apr 2021 21:20:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Message-ID: <20210417042048.GA109800@roeck-us.net>
References: <20210417034249.5978-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417034249.5978-1-rentao.bupt@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Amithash Prasad <amithash@fb.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 08:42:49PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Fix hardware timeout calculation in aspeed_wdt_set_timeout function to
> ensure the reload value does not exceed the hardware limit.
> 
> Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> Reported-by: Amithash Prasad <amithash@fb.com>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/aspeed_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 7e00960651fa..507fd815d767 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -147,7 +147,7 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
>  
>  	wdd->timeout = timeout;
>  
> -	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> +	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
>  
>  	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
>  	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> -- 
> 2.17.1
> 
