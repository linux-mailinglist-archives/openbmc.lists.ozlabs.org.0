Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0861E5137E3
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 17:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpzcq6MHyz3bxS
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 01:12:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpzcb0Zztz2xnX
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 01:12:12 +1000 (AEST)
Received: from [192.168.0.7] (ip5f5aeb1b.dynamic.kabel-deutschland.de
 [95.90.235.27])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 27D6E61EA1923;
 Thu, 28 Apr 2022 17:12:05 +0200 (CEST)
Message-ID: <2483e26b-cfe6-b694-7da6-0eb09d5b1bd9@molgen.mpg.de>
Date: Thu, 28 Apr 2022 17:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH linux dev-5.15] leds: pca955x: Set blink duty cycle to
 fifty percent
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>
References: <20220427184513.21192-1-eajames@linux.ibm.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220427184513.21192-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Eddie,


Am 27.04.22 um 20:45 schrieb Eddie James:
> In order to blink at the specified rate, the blinking LEDs
> need to maintain a 50% duty cycle. Therefore, don't use PWM0
> for any attempted brightness change, and set PWM0 when
> enabling blinking.

Is that specified in some datasheet?

Nit: I’d write 50 % in the commit message summary.


Kind regards,

Paul


> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>   drivers/leds/leds-pca955x.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 2570f92b6754..da93f04e4d10 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -289,17 +289,12 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
>   
>   	switch (pca955x_ledstate(ls, pca955x_led->led_num % 4)) {
>   	case PCA955X_LS_LED_ON:
> +	case PCA955X_LS_BLINK0:
>   		ret = LED_FULL;
>   		break;
>   	case PCA955X_LS_LED_OFF:
>   		ret = LED_OFF;
>   		break;
> -	case PCA955X_LS_BLINK0:
> -		ret = pca955x_read_pwm(pca955x, 0, &pwm);
> -		if (ret)
> -			return ret;
> -		ret = 256 - pwm;
> -		break;
>   	case PCA955X_LS_BLINK1:
>   		ret = pca955x_read_pwm(pca955x, 1, &pwm);
>   		if (ret)
> @@ -332,7 +327,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>   			clear_bit(pca955x_led->led_num, &pca955x->active_blink);
>   			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
>   		} else {
> -			ret = pca955x_write_pwm(pca955x, 0, 256 - value);
> +			/* No variable brightness for blinking LEDs */
>   			goto out;
>   		}
>   	} else {
> @@ -432,6 +427,14 @@ static int pca955x_led_blink(struct led_classdev *led_cdev,
>   			ret = pca955x_write_ls(pca955x, reg, ls);
>   			if (ret)
>   				goto out;
> +
> +			/*
> +			 * Force 50% duty cycle to maintain the specified
> +			 * blink rate.
> +			 */
> +			ret = pca955x_write_pwm(pca955x, 0, 128);
> +			if (ret)
> +				goto out;
>   		}
>   
>   		if (pca955x->blink_period != p) {
