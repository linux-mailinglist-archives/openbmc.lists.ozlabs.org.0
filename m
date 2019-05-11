Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA61C055
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 03:24:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4530MP0sJvzDqJN
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 11:24:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=edubezval@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MI8w5cGx"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 451c2Q21RDzDqM0;
 Sun, 12 May 2019 05:04:26 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id a5so4363181pls.12;
 Sat, 11 May 2019 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mGaRnqVCoyCZOIBZ9izPfSHfOocCoIwti//LG4qze0c=;
 b=MI8w5cGx0btx5xiSYFrJJoCJwkyQlKKgVznkYSIQQyeEo51cg4O3QncAEZ2yQ7qAEk
 ClKCFyKB1BtyCtfMJwqORCb+mHsBhx7bTBh5eO8Jp3JnAfuRr3yXyhzH2FdDTyChiPFY
 PE2ibBHBRZGKjU7qWeRcDtASrk8YyzIvVIvPuVYmqf0YuDwlA0xS+6nOJ8q+ejqY5zDc
 9ia25Yc+pKfzsShQKYxWWvitFtb498YlRPX0Hh1mT2kH4erY8pugknQ/Uh8aTUBOkGHQ
 HKxxl0UPHcS5VYEdyxZmQD10jgPJWiCP2rgMNouweQ6cXUE/bgDzk0G/U3cbc4n20Xgp
 savA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mGaRnqVCoyCZOIBZ9izPfSHfOocCoIwti//LG4qze0c=;
 b=T7cnzgC5hFWZzqVbZPVe4k6FBzX9mLomA3QISBccnD62yND/z1cQlNCXd9W+xxZMee
 0cFdOVjFH3QN7rsL2KeXVzDJSUOZyPaUKzQdrPcAb8NV2cVCqMoUw+34L3ZUBrf9OHum
 DuT7RmtxkWIowZ7HE3yax9atcis2iK4uddUiyq55wfmwGleck8YVdblV5pcLZpaXDC/h
 sgJ3kS1d9xI6TGnv21G/kqCyn5Z23YkkM3aze2x+EKSGAbW0JrGTJboI+KV3GZvJlzlU
 l7Y/WAGtPnNlLbO/itkMJ9egTOzaNw7qGc7tPpvHBYHnbC47XWywvjHsqhCa0TFtm3D4
 W1vg==
X-Gm-Message-State: APjAAAXdnjZ97ywa0gvMvvZFQnjalGEBDAVeGZszBYztANJ29J5H/n3/
 TzGiYkOZxShb3aYbQHDuBls=
X-Google-Smtp-Source: APXvYqyt/eaU9d15W8IfOa5xOEidfRGbLhiHRr2EdYIRq+a25FXzjyRxhMHBQ2aiAInKd+bzRgMYIg==
X-Received: by 2002:a17:902:20e2:: with SMTP id
 v31mr21870303plg.138.1557601462677; 
 Sat, 11 May 2019 12:04:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:4a55:a659:7256:81ff:febd:926d])
 by smtp.gmail.com with ESMTPSA id u38sm9494634pgn.73.2019.05.11.12.04.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 May 2019 12:04:22 -0700 (PDT)
Date: Sat, 11 May 2019 12:04:18 -0700
From: Eduardo Valentin <edubezval@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/6] thermal: Introduce
 devm_thermal_of_cooling_device_register
Message-ID: <20190511190415.GA22816@localhost.localdomain>
References: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
 <1555617500-10862-2-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1555617500-10862-2-git-send-email-linux@roeck-us.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Tue, 14 May 2019 11:23:06 +1000
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

Hello Guenter,

On Thu, Apr 18, 2019 at 12:58:15PM -0700, Guenter Roeck wrote:
> thermal_of_cooling_device_register() and thermal_cooling_device_register()
> are typically called from driver probe functions, and
> thermal_cooling_device_unregister() is called from remove functions. This
> makes both a perfect candidate for device managed functions.
> 
> Introduce devm_thermal_of_cooling_device_register(). This function can
> also be used to replace thermal_cooling_device_register() by passing a NULL
> pointer as device node. The new function requires both struct device *
> and struct device_node * as parameters since the struct device_node *
> parameter is not always identical to dev->of_node.
> 
> Don't introduce a device managed remove function since it is not needed
> at this point.

I don't have any objection on adding this API. Only a minor thing below:


> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/thermal/thermal_core.c | 49 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/thermal.h        |  5 +++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 6590bb5cb688..e0b530603db6 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1046,6 +1046,55 @@ thermal_of_cooling_device_register(struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
>  
> +static void thermal_cooling_device_release(struct device *dev, void *res)
> +{
> +	thermal_cooling_device_unregister(
> +				*(struct thermal_cooling_device **)res);
> +}
> +
> +/**
> + * devm_thermal_of_cooling_device_register() - register an OF thermal cooling
> + *					       device
> + * @dev:	a valid struct device pointer of a sensor device.
> + * @np:		a pointer to a device tree node.
> + * @type:	the thermal cooling device type.
> + * @devdata:	device private data.
> + * @ops:	standard thermal cooling devices callbacks.
> + *
> + * This function will register a cooling device with device tree node reference.
> + * This interface function adds a new thermal cooling device (fan/processor/...)
> + * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
> + * to all the thermal zone devices registered at the same time.
> + *
> + * Return: a pointer to the created struct thermal_cooling_device or an
> + * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
> + */
> +struct thermal_cooling_device *
> +devm_thermal_of_cooling_device_register(struct device *dev,
> +				struct device_node *np,
> +				char *type, void *devdata,
> +				const struct thermal_cooling_device_ops *ops)
> +{
> +	struct thermal_cooling_device **ptr, *tcd;
> +
> +	ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
> +			   GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tcd = __thermal_cooling_device_register(np, type, devdata, ops);
> +	if (IS_ERR(tcd)) {
> +		devres_free(ptr);
> +		return tcd;
> +	}
> +
> +	*ptr = tcd;
> +	devres_add(dev, ptr);
> +
> +	return tcd;
> +}
> +EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
> +
>  static void __unbind(struct thermal_zone_device *tz, int mask,
>  		     struct thermal_cooling_device *cdev)
>  {
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index 5f4705f46c2f..43cf4fdd71d4 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -447,6 +447,11 @@ struct thermal_cooling_device *thermal_cooling_device_register(char *, void *,
>  struct thermal_cooling_device *
>  thermal_of_cooling_device_register(struct device_node *np, char *, void *,
>  				   const struct thermal_cooling_device_ops *);
> +struct thermal_cooling_device *
> +devm_thermal_of_cooling_device_register(struct device *dev,
> +				struct device_node *np,
> +				char *type, void *devdata,
> +				const struct thermal_cooling_device_ops *ops);

We need to stub this in case thermal is not selected.

>  void thermal_cooling_device_unregister(struct thermal_cooling_device *);
>  struct thermal_zone_device *thermal_zone_get_zone_by_name(const char *name);
>  int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp);

Something like:


diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 43cf4fd..9b1b365 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -508,6 +508,14 @@ static inline struct thermal_cooling_device *
 thermal_of_cooling_device_register(struct device_node *np,
        char *type, void *devdata, const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
+struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev,
+                               struct device_node *np,
+                               char *type, void *devdata,
+                               const struct thermal_cooling_device_ops *ops)
+{
+       return ERR_PTR(-ENODEV);
+}
 static inline void thermal_cooling_device_unregister(
        struct thermal_cooling_device *cdev)
 { }
~


If you want I can amend this to your patch and apply it.

Also, do you prefer me to collect only this patch and you would collect hwmon changes,
or are you ok if I collect all the series?

