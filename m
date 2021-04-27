Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0836CDCA
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 23:23:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVF9Q3PMLz2xMw
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 07:23:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kNu5ne3O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=jacek.anaszewski@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kNu5ne3O; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVF986cRnz2xZB
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 07:22:50 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id x20so65549273lfu.6
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AUeL+kpciRCRbRL+skxOKSfolee9jJRJTBDCrqB/JQ8=;
 b=kNu5ne3OCE542QjeJ3cg7rSV8xhdA8nVFRMuGcHhTTBXNOt+sYm6DvW88e4E/hKnD7
 jGAyEziO0MXIgrUVIxBL87E/+PLAY2QZUhGQKBcsAFB8Rg4BuqRR0QFoobl18tXQG7SV
 R0AcfTDXDmnx8pPjCXk/uJcnXK7Kb+GiEc2EiW0bSTez5ykYbT6CF82k1elnBFnSo0zq
 Ee74RrfPrDeVD7Ee0BTqYxjj+PI3SoWkYZMw/tGAPcZHZZ1rT26fi7VsNdjIvI9Dg8vV
 dQPUA3nKM/D+tP5ilzKUdMqGdENOtNV223j3JWbQ0vFu5HAGDwzXi+KlsxTD6FzhWDzb
 yRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AUeL+kpciRCRbRL+skxOKSfolee9jJRJTBDCrqB/JQ8=;
 b=hmu5rvCuE7ICgu7y8NuoIyvs3MWiplowTxbDn2R8yez+mlulpc5BA8b2rllA2nwsr7
 bGp0V4AiZz2EkhAO33Qp4BDjzkfaYNkuICIacEAIOPc/i2f73nl9B2j7gTOfFdeC9mnW
 JPCkuPelZCRqH8rYksVbiSHTxbBHBjM6yaxaTMHU4Qn/GYyGJ6JEQRg8Av5FBkx4cjxK
 VNE+nVDfOt6ged3ZpcbWPNFfj5yaXEz+0ZMFk68O3gsbbW0l66gXoUJOr0qoVJYkcjHr
 QUWmFIaQnpu6vbps/srGH0Y6EbO6VtK6c+/HQg3vkok7m88EkWip2OTnYKYJZzn1ngz1
 KnVQ==
X-Gm-Message-State: AOAM532tkzoF28USI3eWEOVZwkQriYQ0Gr3JXlXUjAiV4SmXSMCunsvm
 BBeRjsO//3OAQzwQnyy4X8Z+OD7E+tY=
X-Google-Smtp-Source: ABdhPJxE6aTRLWcLw4IZVelAWzoKu3VLVeSjrMgZhIEkXixXLWuJ1psQFsZkUhh/Df8fcvr1jOcaAQ==
X-Received: by 2002:a05:6512:15d:: with SMTP id
 m29mr2922031lfo.515.1619558565737; 
 Tue, 27 Apr 2021 14:22:45 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
 by smtp.gmail.com with ESMTPSA id l11sm216854lfg.279.2021.04.27.14.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 14:22:45 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
To: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-leds@vger.kernel.org
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
 <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
 <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
 <CACPK8XfBu5_2xs_Eu=OtShNFQnAQ+Tc1Q1qM7Qgcaggd-yLumQ@mail.gmail.com>
 <6ACEC474-8CFD-4BA9-B8FF-CCD41007AA67@linux.vnet.ibm.com>
 <CACPK8Xf8iY5LOXgJLvBS0okokG-QNQJ3idPvmcF9eMaRQSBGzQ@mail.gmail.com>
 <4A5014B9-6152-41E0-B928-31C9380185EA@linux.vnet.ibm.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <babf3846-f1fd-d541-6c74-e5f167575105@gmail.com>
Date: Tue, 27 Apr 2021 23:22:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4A5014B9-6152-41E0-B928-31C9380185EA@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vishwanatha,

On 4/26/21 7:59 AM, vishwanatha subbanna wrote:
> Joel,
> 
> With the experiments that I have done, I can not express LEDs with PCA955X_TYPE_LED predominantly because LEDs won’t
> retain states after the BMC reboot. I cooked a patch and tried but it does not work. I did an experiment where
> I put the patch and then did a reboot and saw that the LEDs were [OFF] in the very early stage of probe itself.
> 
>>From a9fe9e956c624c15a455b88cc05262358519a541 Mon Sep 17 00:00:00 2001
> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> Date: Fri, 23 Apr 2021 06:57:56 -0500
> Subject: [PATCH 1/2] leds: pca955x: Add support for default-state
> 
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>   drivers/leds/leds-pca955x.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index bf7ead4..987415b 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -130,6 +130,7 @@ struct pca955x_led {
>   	char			name[32];
>   	u32			type;
>   	const char		*default_trigger;
> +	const char		*default_state;
>   };
>   
>   struct pca955x_platform_data {
> @@ -408,6 +409,8 @@ static int pca955x_gpio_direction_output(struct gpio_chip *gc,
>   		fwnode_property_read_u32(child, "type", &pdata->leds[reg].type);
>   		fwnode_property_read_string(child, "linux,default-trigger",
>   					&pdata->leds[reg].default_trigger);
> +		fwnode_property_read_string(child, "default-state",
> +					&pdata->leds[reg].default_state);
>   	}
>   
>   	pdata->num_leds = chip->bits;
> @@ -520,8 +523,13 @@ static int pca955x_probe(struct i2c_client *client,
>   			if (err)
>   				return err;
>   
> -			/* Turn off LED */
> -			err = pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> +			/* If the default-state is "keep", don't change states */
> +			if (strcmp(pdata->leds[i].default_state, "keep")) {
> +				if (!strcmp(pdata->leds[i].default_state, "on"))
> +					err = pca955x_led_set(&pca955x_led->led_cdev, LED_ON);
> +				else
> +					err = pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> +			}
>   			if (err)
>   				return err;
>   		}
> —
> 1.8.3.1
> 
> 
> For `leds-gpio`, Andrew had put a patch, but I don’t see how that can be mapped to PCA955X. https://github.com/torvalds/linux/commit/f5808ac158f2b16b686a3d3c0879c5d6048aba14
> 
> Jacek,
> 
> Please could you help me here ?.. I need to express LEDs as PCA955X_TYPE_LED and also retain states post BMC reboot.

If in your setup the LED controller loses power on reboot then there
is nothing you can do to retain the state.

-- 
Best regards,
Jacek Anaszewski
