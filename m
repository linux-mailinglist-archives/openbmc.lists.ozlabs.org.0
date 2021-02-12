Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBD31A10F
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 16:05:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DccHs5ZvdzDwtw
	for <lists+openbmc@lfdr.de>; Sat, 13 Feb 2021 02:05:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j0WkHcMO; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DccH35jxmzDwtM
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 02:04:44 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id d7so8622561otq.6
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 07:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xRzerL37rg751TyU6bwXPn/hRqxwdJLt22EE4yM78/4=;
 b=j0WkHcMOOzWY/E3hEIbBqWVhP61NJS+ElQp3uyCDAaBTrsRTvWtVMlar/6dldtCW6w
 za+krt4gwUcQwrJ9CmHgvH4hQzTx2JcDDcpI8alfHRvEQg6Io8BPG2KMLtBgDNx72sVr
 ep1LdF/xlc4gHDCXqpvyKI0AkEPG5NlLJllerkYO8OSFEBPsUQuUtCbyAXGk1ihAOkDg
 D4GgArL+3pGLhJKGqSDD1KDo+FYGnUj3c4qOlfpFQ7X72oUTlv9uNYrFlsW9qoS+n26a
 LzmmWBSZKUdV3Z0RegIvYcPQjCy6z0bokX0XZ2uPSiFZUSvmLIDQaDCqFJPXzuM03lgz
 SsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xRzerL37rg751TyU6bwXPn/hRqxwdJLt22EE4yM78/4=;
 b=ADc+gKwhrpEG5QifZwtny+xnFNlZak/6IcTTqmqGqsdfsla1hBPtCZYLnZrhHUrAtY
 6StMMMzuoVmNCb8ncIrvAC5H7XbejHB/yIh/DxdncC253b4QhUr3ZctOXzjBaG3ryQDj
 7MDEFLiK7Auq6FOHNXinxxQBnw1f3bP/P8ISDSe2owpn3MiQwsy4Z4qAvBkG8FFQ4Vvl
 4ztQoifeJLyrJ3+4Ms+L8jjVXPQfmYwCSofcGnUm0tHIj4lWsSnO0DkSCMbkakbtLw2q
 4+XP8P167LERJJ0zicdA99QMix4/vUojscb0uyWfeGxRoL8EXveqz0h5kDdvWfWk+6Jq
 /nbA==
X-Gm-Message-State: AOAM5318dFzxQ1dT03Xr10NF4h9OBWsDiNTxdahjf4A02mEopJgYBTV0
 j4lv6C9ULpfpmiqAJrPUFm8=
X-Google-Smtp-Source: ABdhPJxf3Qr9yjbuYZKxXoTyvphmL4Ozh4W7q4PN+aSXIhb1tq4VcD2KjSIvAttFzuA8f5/xd2OYIg==
X-Received: by 2002:a9d:6f93:: with SMTP id h19mr2285387otq.236.1613142280425; 
 Fri, 12 Feb 2021 07:04:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 18sm1698700oti.30.2021.02.12.07.04.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Feb 2021 07:04:39 -0800 (PST)
Date: Fri, 12 Feb 2021 07:04:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] hwmon: (npcm750-pwm-fan): replace spin_lock_irqsave by
 spin_lock in hard IRQ
Message-ID: <20210212150438.GA32815@roeck-us.net>
References: <1612696333-50502-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612696333-50502-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, jdelvare@suse.com,
 openbmc@lists.ozlabs.org, thierry.reding@gmail.com, lee.jones@linaro.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Feb 07, 2021 at 07:12:13PM +0800, Tian Tao wrote:
> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Now dropped. Quite obviously you have not even compile tested,
much less runtime tested this patch.

Guenter

> ---
>  drivers/hwmon/npcm750-pwm-fan.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> index 11a2860..6c27af1 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -481,12 +481,11 @@ static inline void npcm7xx_check_cmp(struct npcm7xx_pwm_fan_data *data,
>  static irqreturn_t npcm7xx_fan_isr(int irq, void *dev_id)
>  {
>  	struct npcm7xx_pwm_fan_data *data = dev_id;
> -	unsigned long flags;
>  	int module;
>  	u8 flag;
>  
>  	module = irq - data->fan_irq[0];
> -	spin_lock_irqsave(&data->fan_lock[module], flags);
> +	spin_lock(&data->fan_lock[module]);
>  
>  	flag = ioread8(NPCM7XX_FAN_REG_TICTRL(data->fan_base, module));
>  	if (flag > 0) {
> @@ -496,7 +495,7 @@ static irqreturn_t npcm7xx_fan_isr(int irq, void *dev_id)
>  		return IRQ_HANDLED;
>  	}
>  
> -	spin_unlock_irqrestore(&data->fan_lock[module], flags);
> +	spin_unlock(&data->fan_lock[module]);
>  
>  	return IRQ_NONE;
>  }
