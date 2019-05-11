Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4F81A965
	for <lists+openbmc@lfdr.de>; Sat, 11 May 2019 22:23:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 451dnH1KJFzDqMp
	for <lists+openbmc@lfdr.de>; Sun, 12 May 2019 06:23:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aM7dbPPs"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 451dmN1w9YzDqK6;
 Sun, 12 May 2019 06:22:27 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id t187so4666245pgb.13;
 Sat, 11 May 2019 13:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rLgXhVsDP/RzKSE+JdEI3qNT7K7MffBqtup5zZ8tHdc=;
 b=aM7dbPPsnspFks6phirtx9698Y0IsGto7C9UDT80WCowD101CpiPlyueVSOOSS4CfY
 rdUXmIGf4U5p2oHyI40ORwkVJPk6jMXUTME3sGn3ON5ZQ+XFLYiVN+Eu/fi6/9uZvkj5
 zRXR0e0BIzU6PM4HHEoI9hzRCtbvzL2zjiChylaRXSgxQw0UUV9NEL0sT1Ni0VDzhobJ
 BDqJEqRykfDS+779cLnXsMw+PlrBrlnoS7Ky8uYGGxYLiZNAtOfz2pMnhxNYIcuuAilI
 PQ+w3eqQj1Ju11J8TzECeV+wFqWMtZNpKrJ5OyEZHqZkmn3Zg70vXcdBYXtIItkdSiHv
 kJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rLgXhVsDP/RzKSE+JdEI3qNT7K7MffBqtup5zZ8tHdc=;
 b=ehB1VsFFnKksNLsCdugAD7zrVjYIJ3zZACbm8FgG2OuXwc8CfhdcXjwsWbAvf3n4rf
 UBmvcqkIf5meyCWqFi+okwnAnUkVwLjzwJIxEqskB0FBf+7gravniCPs403/7YlqLZck
 hAMB2G548pNVuejplM2keAl1YfzuCPRAFo0HFOWIrJYzgj/mPJUQViUhl5ANN2NRUtFl
 N5TWpqougwAqIUJZWDaIXPohDv2MVeXgXMAVbkdtk+io6jKAN7X/6peYY0Y8iW3vUoY2
 6PoQh5SPfCY4sGTAeshF3Yv6d3x+Dyuxflfd5FHXvUtMoHlOGgK6QhxLjXBeReG6C5rE
 vU1A==
X-Gm-Message-State: APjAAAW2wgfJS0P0gZ+czyJQgtYIVONfiSlZVkVogMGnTeNv7AlMqgCT
 AWgkRnpSFFbgF5q6dGOfd8c=
X-Google-Smtp-Source: APXvYqw7yzV+NDnCGKPsyV6bDr4MyF9Eb869MU13gsl+ZlVdT1mderC/okBMSyIxf8Ec3QlKhM5xhQ==
X-Received: by 2002:a65:6658:: with SMTP id z24mr22907719pgv.323.1557606144344; 
 Sat, 11 May 2019 13:22:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c23sm22145201pfp.0.2019.05.11.13.22.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 May 2019 13:22:22 -0700 (PDT)
Subject: Re: [PATCH 1/6] thermal: Introduce
 devm_thermal_of_cooling_device_register
To: Eduardo Valentin <edubezval@gmail.com>
References: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
 <1555617500-10862-2-git-send-email-linux@roeck-us.net>
 <20190511190415.GA22816@localhost.localdomain>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4be54a9c-ccc9-5489-6938-c66229d361b3@roeck-us.net>
Date: Sat, 11 May 2019 13:22:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190511190415.GA22816@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Kamil Debski <kamil@wypas.org>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eduardo,

On 5/11/19 12:04 PM, Eduardo Valentin wrote:
> Hello Guenter,
> 
> On Thu, Apr 18, 2019 at 12:58:15PM -0700, Guenter Roeck wrote:
>> thermal_of_cooling_device_register() and thermal_cooling_device_register()
>> are typically called from driver probe functions, and
>> thermal_cooling_device_unregister() is called from remove functions. This
>> makes both a perfect candidate for device managed functions.
>>
>> Introduce devm_thermal_of_cooling_device_register(). This function can
>> also be used to replace thermal_cooling_device_register() by passing a NULL
>> pointer as device node. The new function requires both struct device *
>> and struct device_node * as parameters since the struct device_node *
>> parameter is not always identical to dev->of_node.
>>
>> Don't introduce a device managed remove function since it is not needed
>> at this point.
> 
> I don't have any objection on adding this API. Only a minor thing below:
> 
> 
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/thermal/thermal_core.c | 49 ++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/thermal.h        |  5 +++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
>> index 6590bb5cb688..e0b530603db6 100644
>> --- a/drivers/thermal/thermal_core.c
>> +++ b/drivers/thermal/thermal_core.c
>> @@ -1046,6 +1046,55 @@ thermal_of_cooling_device_register(struct device_node *np,
>>   }
>>   EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
>>   
>> +static void thermal_cooling_device_release(struct device *dev, void *res)
>> +{
>> +	thermal_cooling_device_unregister(
>> +				*(struct thermal_cooling_device **)res);
>> +}
>> +
>> +/**
>> + * devm_thermal_of_cooling_device_register() - register an OF thermal cooling
>> + *					       device
>> + * @dev:	a valid struct device pointer of a sensor device.
>> + * @np:		a pointer to a device tree node.
>> + * @type:	the thermal cooling device type.
>> + * @devdata:	device private data.
>> + * @ops:	standard thermal cooling devices callbacks.
>> + *
>> + * This function will register a cooling device with device tree node reference.
>> + * This interface function adds a new thermal cooling device (fan/processor/...)
>> + * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
>> + * to all the thermal zone devices registered at the same time.
>> + *
>> + * Return: a pointer to the created struct thermal_cooling_device or an
>> + * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
>> + */
>> +struct thermal_cooling_device *
>> +devm_thermal_of_cooling_device_register(struct device *dev,
>> +				struct device_node *np,
>> +				char *type, void *devdata,
>> +				const struct thermal_cooling_device_ops *ops)
>> +{
>> +	struct thermal_cooling_device **ptr, *tcd;
>> +
>> +	ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
>> +			   GFP_KERNEL);
>> +	if (!ptr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	tcd = __thermal_cooling_device_register(np, type, devdata, ops);
>> +	if (IS_ERR(tcd)) {
>> +		devres_free(ptr);
>> +		return tcd;
>> +	}
>> +
>> +	*ptr = tcd;
>> +	devres_add(dev, ptr);
>> +
>> +	return tcd;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
>> +
>>   static void __unbind(struct thermal_zone_device *tz, int mask,
>>   		     struct thermal_cooling_device *cdev)
>>   {
>> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
>> index 5f4705f46c2f..43cf4fdd71d4 100644
>> --- a/include/linux/thermal.h
>> +++ b/include/linux/thermal.h
>> @@ -447,6 +447,11 @@ struct thermal_cooling_device *thermal_cooling_device_register(char *, void *,
>>   struct thermal_cooling_device *
>>   thermal_of_cooling_device_register(struct device_node *np, char *, void *,
>>   				   const struct thermal_cooling_device_ops *);
>> +struct thermal_cooling_device *
>> +devm_thermal_of_cooling_device_register(struct device *dev,
>> +				struct device_node *np,
>> +				char *type, void *devdata,
>> +				const struct thermal_cooling_device_ops *ops);
> 
> We need to stub this in case thermal is not selected.
> 

Yes. Sorry, that completely slipped my mind.

>>   void thermal_cooling_device_unregister(struct thermal_cooling_device *);
>>   struct thermal_zone_device *thermal_zone_get_zone_by_name(const char *name);
>>   int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp);
> 
> Something like:
> 
> 
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index 43cf4fd..9b1b365 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -508,6 +508,14 @@ static inline struct thermal_cooling_device *
>   thermal_of_cooling_device_register(struct device_node *np,
>          char *type, void *devdata, const struct thermal_cooling_device_ops *ops)
>   { return ERR_PTR(-ENODEV); }
> +struct thermal_cooling_device *
> +devm_thermal_of_cooling_device_register(struct device *dev,
> +                               struct device_node *np,
> +                               char *type, void *devdata,
> +                               const struct thermal_cooling_device_ops *ops)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
>   static inline void thermal_cooling_device_unregister(
>          struct thermal_cooling_device *cdev)
>   { }
> ~
> 
> 
> If you want I can amend this to your patch and apply it.
> 
Please do.

> Also, do you prefer me to collect only this patch and you would collect hwmon changes,
> or are you ok if I collect all the series?
> 

Please go ahead and collect the entire series.

Thanks,
Guenter
