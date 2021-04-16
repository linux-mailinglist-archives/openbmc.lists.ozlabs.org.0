Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BB36173F
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 03:54:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLzly1qhWz3bTp
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 11:54:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UgBBUVAq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2f;
 helo=mail-yb1-xb2f.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UgBBUVAq; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLzlh4Ds6z2xb6;
 Fri, 16 Apr 2021 11:54:06 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id z1so28347645ybf.6;
 Thu, 15 Apr 2021 18:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=t56dQKxoANCG3Oiet8IMk4GlydjPpRzi7nr7AlrlLvk=;
 b=UgBBUVAqc4CENsYCf/ojNPO1ZPTgTsAk4TJbHpjpwOyQbm4CcFUR9iKKjwd7f3trYm
 RUh5XXD4mVL/aMvqLe1V0jnQb71SvkZ2dEQ9y2CSLo+05E1Rw+gYzyhsJNkdcjqGs4r0
 b9zsV1ksmtXp3iMK1dJnfkEvi+xTT9+SsKzNGhxp72doiKRYtmw1wr4Nw3YiUfm3s3eb
 thhJ4kcRh7J/eBakmlhv2iVxYj3PW0T8vzYVhnaFCMaDHGmqOt0YdSsvTBUNcUSTWGEf
 HCkNzWy/Ajhobav9GR62kswu4UNlPLIQ7sJYzp1+LtMcFRDrBmLwUhwzynFzTxsYnJ9c
 nxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=t56dQKxoANCG3Oiet8IMk4GlydjPpRzi7nr7AlrlLvk=;
 b=FANbvXILkcRVYlkrOYTU3edOCFhmBm+AUW9eERsqXhZWMtYYbBxmLwnVFcgjMql4Ft
 STulxxe7c9FBj4nnC8Y04HM3pN4l6emUUJx1x2FdW6XMV5zLBzjAyjHuD46hfKxiRxqX
 9mXbJU4/0lQOA4LLY6CABWi8VirK2xb8LTRhvrbE9wb5ZGyUbCLyAdqlD4wBvLRfY5ia
 r3HZr6QHhCooHrs8YY2euH5E55XIGiP2ZYEQAkxUyl4zJaTuvEMcI/RM3Qr6UWg5ZO8l
 LLUMoKP9NBH/IPUp/heAi6c/J4fGD3RPzstM1KN4217um4Ha/d0Ceu8wTcYg4YQdtEVy
 rUzQ==
X-Gm-Message-State: AOAM5321Ar1V2pmrzGvIGX31z0ylsuExWyn+gXxQj3UUZz0xgKokU6Bu
 nrdjbG+a1cEYgM88r2BsGV/TD3uzs7s=
X-Google-Smtp-Source: ABdhPJxVohYKe/p+xqyc6ZQQ7pdzt88IO0cmHzq0/doj37HzgGpfByJRr0/mpXjMFZYKPe+KRgJmWA==
X-Received: by 2002:a4a:4304:: with SMTP id k4mr1585462ooj.42.1618537673101;
 Thu, 15 Apr 2021 18:47:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e44sm1067754ote.21.2021.04.15.18.47.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Apr 2021 18:47:52 -0700 (PDT)
Date: Thu, 15 Apr 2021 18:47:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH] watchdog: aspeed: fix integer overflow in set_timeout
 handler
Message-ID: <20210416014750.GA53153@roeck-us.net>
References: <20210416001208.16788-1-rentao.bupt@gmail.com>
 <469ac948-d65b-471f-102f-726466c19c5c@roeck-us.net>
 <20210416010444.GA17388@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416010444.GA17388@taoren-ubuntu-R90MNF91>
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

On Thu, Apr 15, 2021 at 06:04:45PM -0700, Tao Ren wrote:
> On Thu, Apr 15, 2021 at 05:50:32PM -0700, Guenter Roeck wrote:
> > On 4/15/21 5:12 PM, rentao.bupt@gmail.com wrote:
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > > 
> > > Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
> > > handler to avoid potential integer overflow when the supplied timeout is
> > > greater than aspeed's maximum allowed timeout (4294 seconds).
> > > 
> > > Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> > > Reported-by: Amithash Prasad <amithash@fb.com>
> > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > > ---
> > >  drivers/watchdog/aspeed_wdt.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> > > index 7e00960651fa..9f77272dc906 100644
> > > --- a/drivers/watchdog/aspeed_wdt.c
> > > +++ b/drivers/watchdog/aspeed_wdt.c
> > > @@ -145,9 +145,8 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
> > >  	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
> > >  	u32 actual;
> > >  
> > > -	wdd->timeout = timeout;
> > > -
> > > -	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> > > +	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
> > > +	wdd->timeout = actual;
> > >  
> > >  	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
> > >  	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> > > 
> > 
> > If the provided timeout is larger than the supported hardware timeout,
> > the watchdog core will ping the hardware on behalf of userspace.
> > The above code would defeat that mechanism for no good reason.
> > 
> > NACK.
> > 
> > Guenter
> 
> Thanks Guenter for Joel for the quick review!
> 
> The integer overflow happens at (actual * WDT_RATE_1MHZ). For example,
> if a user tries to set timeout to 4295 seconds, then the hardware would
> be programmed to timeout after about 32 milliseconds. I would say this
> behavior is not expected?

The fix would be

-	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
+	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);

without modifying
	wdd->timeout = timeout;

The real problem here is that "wdd->max_hw_heartbeat_ms * 1000"
is simply wrong. The overflow is a side effect of the wrong
calculation, and concentrating on it disguises the real problem.

Guenter
