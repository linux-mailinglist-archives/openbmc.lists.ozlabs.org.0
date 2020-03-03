Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6796E1784DC
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 22:26:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48X96f2VbGzDqW5
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 08:26:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kn9+nUVf; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48X95q6sNJzDqSw
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 08:25:17 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id d9so2146441pgu.3
 for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2020 13:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pogs7tPo/L/NBSyyRxPvOrbszi59KiJaOrJoFUbt2WY=;
 b=Kn9+nUVfu3l+nTvfNq/uPFWNk9LhmCulmVcbQTiFCrzt87NWiJeEfwUlfj+wvg/pjb
 8vJWrV3V+QUc+z3cQ3rblXKBOnBh4cxRyH66THpI0TC/g+Yi9viEOfGKoZfvGRbjsTjb
 lSdn3NmShU2JTxYtekvZsreSYc4PxJETF0GwCh8nx85+DxwfC+3n+LZiR2Kf/nNOPHMy
 MgiM4+8WUBmXUpScefLvyeHOvU6Axf6+/U7aNd9PELE7dBj4GzXSYsRbsjkMCs7/ej5c
 Joga0FcKcl2GvMdm5uPoIztFnrnEtK5Jyrzb0zi7aASy+l0JUcZTktxDhE06nV7Xu1UD
 EKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pogs7tPo/L/NBSyyRxPvOrbszi59KiJaOrJoFUbt2WY=;
 b=Z8JP/jV4wqBogA3tLRGeTulB/xDNRRYSsT6EdLqmsxeEEyhnf2PhnYoOoKoOHWhDZm
 D80GRuR1l25/ciIGcI+hu5yaNm9mh7FzRL7G6XP/qwSb+b8rsEJukjnCiOkIAETN4JuE
 +ovFSZK3/CsQy/e6wqnfYQCR4UyG6+ilrZ2FxKyXEsXKhLOeMs69pvo26izI+iIHp9cA
 /4Jnh5Pe8zVuUcmcAPoSH0IhyF6mPkG0DJ+VLcU0fvCBqO3UfF6tUvR6Y7mhmKsYKG9x
 YzchdPUOobaidM2RQ8XbDuc1gkvStT2vcudAN6SiPeUjco5PzHmU4H3Cer96q1HUT9J/
 AYwA==
X-Gm-Message-State: ANhLgQ0SFfwd6cI24j3GiM/J8s0r6iVaR0s8S69Ii+XCEwVY2lMx2mHq
 yr7JEUN4LgR4RaWnOf3Hr6Y=
X-Google-Smtp-Source: ADFU+vtkWCpXDJsbFyREWnVzsCvO7puF/A5Fgv1NB2cWK73a/Md3BJQYPqwAqrxzo+2D4FVURkMW8g==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr5814744pfn.89.1583270714393;
 Tue, 03 Mar 2020 13:25:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h16sm131571pje.43.2020.03.03.13.25.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Mar 2020 13:25:13 -0800 (PST)
Date: Tue, 3 Mar 2020 13:25:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 3/3] watchdog: npcm: remove whitespaces
Message-ID: <20200303212512.GA20448@roeck-us.net>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
 <20200303100114.87786-4-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303100114.87786-4-tmaimon77@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjaminfair@google.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 03, 2020 at 12:01:14PM +0200, Tomer Maimon wrote:
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Turns out this problem does not actually exist in the upstream driver
(as of v5.6-rc4). You might want to align your code with the upstream
kernel.

Guenter

> ---
>  drivers/watchdog/npcm_wdt.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 84a728af6664..bd38bf1ee6a1 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -123,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)
>  	return 0;
>  }
>  
> -
>  static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
>  				unsigned int timeout)
>  {
>  	if (timeout < 2)
>  		wdd->timeout = 1;
>  	else if (timeout < 3)
> -	      wdd->timeout = 2;
> +		wdd->timeout = 2;
>  	else if (timeout < 6)
> -	      wdd->timeout = 5;
> +		wdd->timeout = 5;
>  	else if (timeout < 11)
> -	      wdd->timeout = 10;
> +		wdd->timeout = 10;
>  	else if (timeout < 22)
> -	      wdd->timeout = 21;
> +		wdd->timeout = 21;
>  	else if (timeout < 44)
> -	      wdd->timeout = 43;
> +		wdd->timeout = 43;
>  	else if (timeout < 87)
> -	      wdd->timeout = 86;
> +		wdd->timeout = 86;
>  	else if (timeout < 173)
> -	      wdd->timeout = 172;
> +		wdd->timeout = 172;
>  	else if (timeout < 688)
> -	      wdd->timeout = 687;
> +		wdd->timeout = 687;
>  	else
> -	      wdd->timeout = 2750;
> +		wdd->timeout = 2750;
>  
>  	if (watchdog_active(wdd))
>  		npcm_wdt_start(wdd);
