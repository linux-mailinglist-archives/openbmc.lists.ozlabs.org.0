Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 606977DBD05
	for <lists+openbmc@lfdr.de>; Mon, 30 Oct 2023 16:57:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LKfkG4H4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJyb82529z3c5Y
	for <lists+openbmc@lfdr.de>; Tue, 31 Oct 2023 02:57:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LKfkG4H4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJyZZ6fMVz3bsP
	for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 02:57:10 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a8ada42c2aso43377297b3.3
        for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2023 08:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698681427; x=1699286227; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KqEcy/FTVRmCJO3mUkkOypdWB4g67w6pVbljP7u/u5I=;
        b=LKfkG4H4+YucIdrrCU/nR760/2C04oIYPM/TRaiymg+KRvzgfslfDRT0pwUyzASCLL
         vvyjTthhcB8gimT+qHeXwRfQrMAVKpUInFXrmM0FRSm16QlQC180OC5XNz9pIBu5gEk1
         WsDjhzmp24gMquMNa/y6ZhD+l+LLL2/6b6u2yK0brjqEWauZ/1Y6RMgBQBcI7r6lVub+
         9hkrzXkWoOUoygnYxDtLCTykyhPNdO9FumD3dYm4lJq+Q0u9Qx5PxDLde2lbP5CNT4Z1
         FcCCTOH383DsrqVafVBFy1CJx5XCDfVfinIOh1S/qLMKCnylRMBJUHEz2+HfYGB1x7jD
         E/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698681427; x=1699286227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqEcy/FTVRmCJO3mUkkOypdWB4g67w6pVbljP7u/u5I=;
        b=ecyiSmMnmShQ8k5nTpr9mHpqvLZi4035OyiFCEh53b3tJNhrxA6udXkzoppyyvs82n
         Pf5cl5mvgvGCEda+TAQkya8wGKXc/A/99TOxbdIXzb9ZQxlfcQf2nRcAJcix0sN0S3+T
         11v1Yxk1iB1UqVa8r3tkQRAyDNUm1ZUwXgSFF33WnhMldHBjEHzB5tCKFjLhPs8jgUq3
         9pyDTBRDPNyJiFPLDSRBxj2TS+c7xX1/FHCkL9UZ6LIkaQ3FatpfK3wYKIQFkIyn7veG
         62mkr7YnvWcQ5zyVSX8oB3zkvhFnmJYT+cRuYZotqLj8wuAtci35esl4N2Cc6FNo9rYj
         XP3g==
X-Gm-Message-State: AOJu0Yz2up30Knu9K59PIZAn96pjze9sGwmM2bRYy/xwmc1gAIrTp3WN
	aJaRHpKe8YM4tXOYNyxo1lA=
X-Google-Smtp-Source: AGHT+IE18mGvNltF9lPxIh0N14wvvI4rgbcA8hodrL95HNfCOEiENG8Zx5cNXYPF5TplfgOoHdtVtA==
X-Received: by 2002:a81:5756:0:b0:5a7:a817:be43 with SMTP id l83-20020a815756000000b005a7a817be43mr10483325ywb.6.1698681427282;
        Mon, 30 Oct 2023 08:57:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c190-20020a814ec7000000b005a7bbd713ddsm4423113ywb.108.2023.10.30.08.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 08:57:06 -0700 (PDT)
Message-ID: <e3de2c1f-3a05-4ffc-a50e-0b5522cf7740@roeck-us.net>
Date: Mon, 30 Oct 2023 08:57:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] hwmon: npcm750-pwm-fan: Add NPCM8xx support
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>, jdelvare@suse.com,
 avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
 andrew@codeconstruct.com.au, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, j.neuschaefer@gmx.net
References: <20231030150119.342791-1-tmaimon77@gmail.com>
 <20231030150119.342791-2-tmaimon77@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231030150119.342791-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/30/23 08:01, Tomer Maimon wrote:
> Adding Pulse Width Modulation (PWM) and fan tacho NPCM8xx support to
> NPCM PWM and fan tacho driver.
> NPCM8xx uses a different number of PWM devices.
> 
> As part of adding NPCM8XX support:
> - Add NPCM8xx specific compatible string.
> - Add data to handle architecture-specific PWM and fan tacho parameters.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>   drivers/hwmon/npcm750-pwm-fan.c | 34 +++++++++++++++++++++++++++++----
>   1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> index 10ed3f4335d4..765b08fa0396 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -46,9 +46,9 @@
>   #define NPCM7XX_PWM_CTRL_CH3_EN_BIT		BIT(16)
>   
>   /* Define the maximum PWM channel number */
> -#define NPCM7XX_PWM_MAX_CHN_NUM			8
> +#define NPCM7XX_PWM_MAX_CHN_NUM			12
>   #define NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE	4
> -#define NPCM7XX_PWM_MAX_MODULES                 2
> +#define NPCM7XX_PWM_MAX_MODULES                 3
>   
>   /* Define the Counter Register, value = 100 for match 100% */
>   #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM		255
> @@ -171,6 +171,10 @@
>   #define FAN_PREPARE_TO_GET_FIRST_CAPTURE	0x01
>   #define FAN_ENOUGH_SAMPLE			0x02
>   
> +struct npcm_hwmon_info {
> +	u32 pwm_max_channel;
> +};
> +
>   struct npcm7xx_fan_dev {
>   	u8 fan_st_flg;
>   	u8 fan_pls_per_rev;
> @@ -204,6 +208,7 @@ struct npcm7xx_pwm_fan_data {
>   	struct timer_list fan_timer;
>   	struct npcm7xx_fan_dev fan_dev[NPCM7XX_FAN_MAX_CHN_NUM];
>   	struct npcm7xx_cooling_device *cdev[NPCM7XX_PWM_MAX_CHN_NUM];
> +	const struct npcm_hwmon_info *info;
>   	u8 fan_select;
>   };
>   
> @@ -619,9 +624,13 @@ static umode_t npcm7xx_is_visible(const void *data,
>   				  enum hwmon_sensor_types type,
>   				  u32 attr, int channel)
>   {
> +	const struct npcm7xx_pwm_fan_data *hwmon_data = data;
> +
>   	switch (type) {
>   	case hwmon_pwm:
> -		return npcm7xx_pwm_is_visible(data, attr, channel);
> +		if (channel < hwmon_data->info->pwm_max_channel)
> +			return npcm7xx_pwm_is_visible(data, attr, channel);

I would have expected this check to be handled in npcm7xx_pwm_is_visible().

Guenter

