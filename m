Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA02976B9
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 12:12:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D3P92fn0zDq6l
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 20:12:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="CbIXVfFO"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D3NP0B42zDqVS
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 20:11:28 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id v15so1505366wml.0
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 03:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jrQICpWLHoOKA51TYZF4wdTk0Hlmd2hBlo/FIA7QGZo=;
 b=CbIXVfFOJtxVCS5XepCddU8NQviPa3DQa8nyoEesyWgIjk6D5VIcUZaIsYZ2DAS+Gr
 JA33INSo73e5TAHFo9cfpfia9/DQ2mwhkI7Vnh3ukcrQpW9TlvOxe+pa2+XZs7GGNCNV
 20wDnqOW+pUnZXjnVRxrEPeU1OZY8xPBeLhpA73VnwnfIZMypEMvP4REs5nbPUOeT199
 4YzL6S1BuCCVQtv7kZhi/PZqfdJOoeaAfmDjMSUsf0rh5IUU+iCNnF2DfsmAGg0RMMwT
 ij/hk/IU+MRWcIW8aGXTaFL369V28xSKp7dKMfzXZrY2m9tGqgyfjuVFZIo8Ye/dg5xE
 T6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jrQICpWLHoOKA51TYZF4wdTk0Hlmd2hBlo/FIA7QGZo=;
 b=adLLQnanDroa98xqEc8JB1MLoWRYFtBAGnyhbvsyPbXSoDVikD+9HrbGq/Lae5c0Xk
 EfD/EjNKcozQ11nAcA0m/AfKdXU+XogtfQbbgapDLyfeFL81N+ZknqdmtjD6Zn40lVv4
 Y3ETUKn1jAxuLRpdn8E73V+mx1IODF9LoZyNTf+MRAVWVyaR+2zDwzIhBhhKcFr4+viM
 RUI0YNSwgeMYGG6mOyZrGGcX1len7A1SVGgXb3F2lh2QqkTVAQgAFLkDxjBuLPm0zXSU
 fIWUbTAGVShzo5pFfyZgk1TIy+F6i/bWK4V3g8ueupRXmRt/mRfCDJ93CVHbWHADjFTV
 IhaA==
X-Gm-Message-State: APjAAAUvpxlM2y0wlnjzy3kV0+wO0BCZLr02uHs0yzH27CeWoZ08DxOE
 tp1paemZXrn+iomrxPT+g4yufw==
X-Google-Smtp-Source: APXvYqx0sNB68Mm6o9HSmvk7JqddxmMKASpcf5LTH54kQGLwEPYaUXWQnB2VHdsRg6nGBHNbhcWnhg==
X-Received: by 2002:a1c:a503:: with SMTP id o3mr4898652wme.37.1566382280840;
 Wed, 21 Aug 2019 03:11:20 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9c18:ddf6:f0bb:53f8?
 ([2a01:e34:ed2f:f020:9c18:ddf6:f0bb:53f8])
 by smtp.googlemail.com with ESMTPSA id u129sm3575299wmb.12.2019.08.21.03.11.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 03:11:20 -0700 (PDT)
Subject: Re: [PATCH] [v5] clocksource/drivers/npcm: fix GENMASK and timer
 operation
To: Avi Fishman <avifishman70@gmail.com>, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, tglx@linutronix.de
References: <20190729170354.202374-1-avifishman70@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <744188a1-d11a-7edc-79cd-e3c7dbcf6e86@linaro.org>
Date: Wed, 21 Aug 2019 12:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729170354.202374-1-avifishman70@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 29/07/2019 19:03, Avi Fishman wrote:
> NPCM7XX_Tx_OPER GENMASK bits where wrong,
> Since NPCM7XX_REG_TICR0 register reset value of those bits was 0,
> it did not cause an issue.
> in npcm7xx_timer_oneshot() the original NPCM7XX_REG_TCSR0 register was
> read again after masking it with ~NPCM7XX_Tx_OPER so the masking didn't
> take effect.
> 
> npcm7xx_timer_periodic() was not wrong but it wrote to NPCM7XX_REG_TICR0
> in a middle of read modify write to NPCM7XX_REG_TCSR0 which is
> confusing.
> npcm7xx_timer_oneshot() did wrong calculation
> 
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>

I've applied the patch and massaged the changelog [1].

Let me know if you disagree with it.

Please, in the future take care of adding the Fixes tag.

Thanks

  -- Daniel

[1]
https://git.linaro.org/people/daniel.lezcano/linux.git/commit/?h=clockevents/next&id=a5f6679fc81e42fcbef0184770d8a3b04c0f153e

> ---
>  drivers/clocksource/timer-npcm7xx.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
> index 8a30da7f083b..9780ffd8010e 100644
> --- a/drivers/clocksource/timer-npcm7xx.c
> +++ b/drivers/clocksource/timer-npcm7xx.c
> @@ -32,7 +32,7 @@
>  #define NPCM7XX_Tx_INTEN		BIT(29)
>  #define NPCM7XX_Tx_COUNTEN		BIT(30)
>  #define NPCM7XX_Tx_ONESHOT		0x0
> -#define NPCM7XX_Tx_OPER			GENMASK(27, 3)
> +#define NPCM7XX_Tx_OPER			GENMASK(28, 27)
>  #define NPCM7XX_Tx_MIN_PRESCALE		0x1
>  #define NPCM7XX_Tx_TDR_MASK_BITS	24
>  #define NPCM7XX_Tx_MAX_CNT		0xFFFFFF
> @@ -84,8 +84,6 @@ static int npcm7xx_timer_oneshot(struct clock_event_device *evt)
>  
>  	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
>  	val &= ~NPCM7XX_Tx_OPER;
> -
> -	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
>  	val |= NPCM7XX_START_ONESHOT_Tx;
>  	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
>  
> @@ -97,12 +95,11 @@ static int npcm7xx_timer_periodic(struct clock_event_device *evt)
>  	struct timer_of *to = to_timer_of(evt);
>  	u32 val;
>  
> +	writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
> +
>  	val = readl(timer_of_base(to) + NPCM7XX_REG_TCSR0);
>  	val &= ~NPCM7XX_Tx_OPER;
> -
> -	writel(timer_of_period(to), timer_of_base(to) + NPCM7XX_REG_TICR0);
>  	val |= NPCM7XX_START_PERIODIC_Tx;
> -
>  	writel(val, timer_of_base(to) + NPCM7XX_REG_TCSR0);
>  
>  	return 0;
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

