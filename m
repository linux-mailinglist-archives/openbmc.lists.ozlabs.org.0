Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFEB3616D6
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 02:36:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLy2G0lSLz30GD
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 10:36:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mVMp7KJ/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mVMp7KJ/; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLy1z478mz2yhd;
 Fri, 16 Apr 2021 10:36:22 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id h15so2860422qvu.4;
 Thu, 15 Apr 2021 17:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eLTCOMBoG9G5S0rXZgVkqicXPZkU4FpglORZGdEuM7k=;
 b=mVMp7KJ/dQ9aRRQKge8lo8tx7/WB11OnQJJ0EROpsbIrQ1fl21AspBNhSxGRNZesOz
 buZOd/sbSIniCAoeR6+vwTT99bzq8lq/6pGO0u83vpRBw+D1KcRT+BMR5JYMy3z04uoE
 C3X6LTONu7HGmhAclPAH5CikO1GdxAK9OD5OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eLTCOMBoG9G5S0rXZgVkqicXPZkU4FpglORZGdEuM7k=;
 b=DeBmzQ6uw20d2Hn9P8GSHvdp9HIpKyo6krpu8XITXQ+GjAdajAjP7UeFoVOSa52MH+
 sdq47D13ksCH6QBp42RyG4BEgVLrae8m1SCeZKF9o/VaHQdqoFHc54npSpg2vTZFiKax
 W+DBpIxrtpinXrNLUcdZOme7mcQ7FNXIfX2251hOxhoyEX4Q3NkEGHPpnmWiE9TgmymF
 j7fPVM+tGzvoviigD51MPofwtn5L235rWWL9O6Cx/VsbuZHU/heSil5/uNl7cG2zVv7n
 jDwIr21gkDRXQOWK0k7iEvAQvUY0aLTDDFWq9s7KVSK2gvnuJV0ZRq+6ZPjQQXsXUsSY
 ILEw==
X-Gm-Message-State: AOAM532IOf2XH6vnFKSVsHMDmYIyFMRBSax+bbWSvdDdy8K/16X1wUBC
 j8Fjg4P3UvT8+hg7pwWUpybqLknYZ2dwKoYCCY8=
X-Google-Smtp-Source: ABdhPJw+9SWz1t5hHnAz8Jpi6OzWFA1+137rOgUx5zzy/u1FOhsGRDFr4WNFWX2GN7lqDEgw0s2aTA49+1EzROcdsZ4=
X-Received: by 2002:a0c:e950:: with SMTP id n16mr5882756qvo.43.1618533378768; 
 Thu, 15 Apr 2021 17:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210416001208.16788-1-rentao.bupt@gmail.com>
In-Reply-To: <20210416001208.16788-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Apr 2021 00:36:06 +0000
Message-ID: <CACPK8Xdmm-LL+xvbG6bBe0Yd9ZQbPuvwBKhszhjvbOc3pPoH3w@mail.gmail.com>
Subject: Re: [PATCH] watchdog: aspeed: fix integer overflow in set_timeout
 handler
To: Tao Ren <rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Amithash Prasad <amithash@fb.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 16 Apr 2021 at 00:12, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
> handler to avoid potential integer overflow when the supplied timeout is
> greater than aspeed's maximum allowed timeout (4294 seconds).
>
> Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> Reported-by: Amithash Prasad <amithash@fb.com>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 7e00960651fa..9f77272dc906 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -145,9 +145,8 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
>         struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
>         u32 actual;
>
> -       wdd->timeout = timeout;
> -
> -       actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> +       actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);

The unit of timeout is seconds. You're comparing to ms/1000, which are
microseconds. I think the existing test is correct?

As far as integer overflow is concerned, max_hw_heartbeat_ms is an
unsigned int. We set it to 4294967, which *1000 = 0xfffffed8. This
should be fine.

> +       wdd->timeout = actual;

This might be the correct thing to do though. I'll defer to the
watchdog maintainers for their input.

Cheers,

Joel

>
>         writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
>         writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> --
> 2.17.1
>
