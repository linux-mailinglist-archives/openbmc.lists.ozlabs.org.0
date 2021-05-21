Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F06838BC02
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 03:52:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmV3S3pzYz3070
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 11:52:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MGywRptR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MGywRptR; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmV391kyGz2xgL;
 Fri, 21 May 2021 11:52:04 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 b13-20020a17090a8c8db029015cd97baea9so6274690pjo.0; 
 Thu, 20 May 2021 18:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TeR6dx8Rqr3ByExvzXzaPr3AoEZSg27P4QPA34TUl50=;
 b=MGywRptRl4M03Loj0uWb0Q68foEF2W7FLLb6e2Y3yaSpAS41cQJOIlc+Yodwrt14+B
 o5A8zY9VfTUFffOgbb7ZCroEftruHMd3VvG0Xksws27jXojgM5CKt9ZQ5MknLgvgetlm
 Qozs9MN+rdGEoiOix5e5xIOU3ppyzW4RuIi+A7iMMzjkpBE9NtZLzOaIAVmamQr4RsCW
 ft1FDBQy++SQwvzxEx/ipWcZ+SL7sMpanfO1ViUsK6G98HM469/Z48/lA6lPpBAdNbQw
 bFaHu86UWSMGHMRuqp5UMqyqmk9RU9qLDXzaT4bnkhcZHGFh/CR3h1Z0NlgRXQu4zGzX
 CrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TeR6dx8Rqr3ByExvzXzaPr3AoEZSg27P4QPA34TUl50=;
 b=bi5Af0CQScgVvJW4J8BmgxpYxLMLU14vHT5EPDaszBaXjrw0obs3BI0l1c0GDcdOt5
 /CQ3IGVbdzkE8r8QOiuYjCn1qHZJZ2NW69a3ABoYaDBE9xBZIFnTred/g/JhEzPKwxz+
 uXpsEhy8uOiMJQ+yrwmH3zQ0sfIKRj8apfTWmrU7HZ4mdSVT/pVEhtwBshpM9hoJoEGL
 WlUUMyUH/Yz5ZNLFpPkUxQ+ktJhIbqIchPCw1c6zJR2wb4j49qPJ+5ud/WXCDYjaxGuE
 sPG1PxVhdj5N1cczgASSBsrmGp/Dmjl0GO0VAmtr3S3K69sA/FPuV0DqwKl96OkU/bu6
 FZWQ==
X-Gm-Message-State: AOAM5313967DwC7ZkbkHdlJqg0U5qXITHLDEWKTPJniyIck25F/P/Vs5
 XVQAR736QLVHFLS0ZwvSreY=
X-Google-Smtp-Source: ABdhPJyIynOYYSDS+EbUq2ewNtwe4ZXjkjDPNl8WBvxs05rpGvv+SWNeotnMz6g0roHINjQ+ss8nrg==
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr8354235pjg.218.1621561921013; 
 Thu, 20 May 2021 18:52:01 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id u6sm2538958pjy.51.2021.05.20.18.51.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 May 2021 18:52:00 -0700 (PDT)
Date: Thu, 20 May 2021 18:51:53 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Message-ID: <20210521015153.GA19153@taoren-ubuntu-R90MNF91>
References: <20210417034249.5978-1-rentao.bupt@gmail.com>
 <20210417042048.GA109800@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417042048.GA109800@roeck-us.net>
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

Hi Wim,

Not sure if I looked at the wrong repository/branch, and looks like the
patch is not included. Do you have any further suggestions? Or should I
send out v2 in case it's missed?


Thanks,

Tao

On Fri, Apr 16, 2021 at 09:20:48PM -0700, Guenter Roeck wrote:
> On Fri, Apr 16, 2021 at 08:42:49PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Fix hardware timeout calculation in aspeed_wdt_set_timeout function to
> > ensure the reload value does not exceed the hardware limit.
> > 
> > Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
> > Reported-by: Amithash Prasad <amithash@fb.com>
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> > ---
> >  drivers/watchdog/aspeed_wdt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> > index 7e00960651fa..507fd815d767 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -147,7 +147,7 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
> >  
> >  	wdd->timeout = timeout;
> >  
> > -	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
> > +	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
> >  
> >  	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
> >  	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
> > -- 
> > 2.17.1
> > 
