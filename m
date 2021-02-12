Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91665319924
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 05:31:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcLD66pHGzDwl4
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 15:31:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2a;
 helo=mail-oo1-xc2a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i4f4fMqc; dkim-atps=neutral
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcLC54tC8zDwwW
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 15:30:21 +1100 (AEDT)
Received: by mail-oo1-xc2a.google.com with SMTP id h38so1805695ooi.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 20:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aOeCDqDzBA3dsZYfJecar357cM/2/of0V8qDCALwWfY=;
 b=i4f4fMqcZZXCsUdY9/WeSgZIgObL9iEP6Bvy0U7zXUmBUNtk8UWtFI0rF1fxusFDtp
 kjN9lvIQ1AkzCPHWpnbpOXpFO83pq4182mSK+uEVXR8pkdLyN/XJMc043TPXDC5yejii
 OvnhGe0TaHiWDZeJ8x7ZGEAbJ5HzWYxYIQXTCgTYaWAcdg7M6g+FUmwx7GmphOOeuSs/
 LH6IhGDoPD0PXCSRRd9qvkX4wOUoVq2U14IZQdMXnnHeP0muEomAyuiLCM53MlpoPltX
 QMDFtL46QVeFsxVQWSUDGPyMQs+XT4c/VxG59SNIoHbFVAyz1l++eYseWyyLT+2wpXVe
 vE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=aOeCDqDzBA3dsZYfJecar357cM/2/of0V8qDCALwWfY=;
 b=ZNpUbZ8HISbdkVN+NSn2VRIVGKQA1GYrAvvD5YDiA8f/+7mmWWVr32ewgySHyp0fp/
 +s9OiWaTSBDLSXjBrildiS9qUDEhv3EzqAbck1r6GffEbqgOprA0wzSg4+5/4NBaaf7i
 r/MteiPvLtW1jsxwaIy278SjMqZAybr82+OXZr7lJH6VyZN/Iw9ek0d2eUOLKb40+jVP
 6NyC9ifKPxZNrXiJYOHD/FUH887ZkJ5d/ys8ROLEfiL+lXFc56E0dxWWNZquQkkQouhz
 2rQh66+0HPBeR6kU0HYom/7F8wTvB53foJWMG/VR+UV1G1y+f9CiTXF7HrQVK8vC4Sq1
 y3oA==
X-Gm-Message-State: AOAM533IZaaIEVc8a+5uN1ZPTCR2JD4GRzYuzDlRVyDrC8R/6ixd2GHx
 j5TLdTTH3GaMdXyuqxlU614=
X-Google-Smtp-Source: ABdhPJzxdhJXCakra3xPLLVyujacVXook4u1jf93dBk65e5glZOkHxhDKOK61G5iCM81gs4+m4teoQ==
X-Received: by 2002:a4a:4958:: with SMTP id z85mr775192ooa.38.1613104218273;
 Thu, 11 Feb 2021 20:30:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 88sm1449171otx.15.2021.02.11.20.30.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Feb 2021 20:30:17 -0800 (PST)
Date: Thu, 11 Feb 2021 20:30:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] hwmon: (npcm750-pwm-fan): replace spin_lock_irqsave by
 spin_lock in hard IRQ
Message-ID: <20210212043016.GA104680@roeck-us.net>
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

Applied.

Thanks,
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
