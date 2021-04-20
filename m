Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 562E33656E6
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 12:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPgWB2QYcz2yyj
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 20:52:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eVdwF/+H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eVdwF/+H; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPgVx20R6z2xZT
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 20:52:22 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id
 101-20020a9d0d6e0000b02902816815ff62so29480141oti.9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ar1NLP1PJ/JjP7pqq8Gu408Ftb6GKKkJF8IQieN/XQ0=;
 b=eVdwF/+HgUoSK24gJnYJbT5+1XBFzzITbvdlC4ShKsCmqdWQj8tNAkxlkDZKVFtb/O
 Y7t2XfCpyo0Y/wQnSBN6q81zQPCI1/mfVxChL+C2QvEaBdD/hgBMSeVsvP0a1YoOqD2z
 XXAPF7whMeEYjNCBAWYPSGo/AOmUlkOMJw+azawjWm2XCmL+h6WUKte7LYz1cPLcrMIL
 DYkJBdX4pgye/rbgn+R13DAIzUsLp6DoqUcHlscJYAgJsi0AwUAngUfsoigzrJOCGTPt
 sGfgu4lc8QUx2UZ4DupplhhEY7RoglW5lqXyLMWjnZNTj2oGtKuKdqpwSIdQr3HkADM5
 tXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ar1NLP1PJ/JjP7pqq8Gu408Ftb6GKKkJF8IQieN/XQ0=;
 b=J6LuE/pSFeJe/RHOzj+pHu5asZmobreqnWy0kSJQvFsCqZDPbKum6XsyfthktSQT4W
 w8oosF+AznFv8SA5n5S7arpkkoXg8uxdEhSe8IQhTCc+W5kt1KcEvm8iXq7icMSvHqNm
 jYTGDnJ/zvmFWp++08Me/b4sQ8GR5XyuGvXiVirH64Ezm1sfXwztA4LkC9n4z42Oas4V
 91p8eWTEPig1fpFXU0OJaswmd9LlopKA7BLTjZB64iSzRZZKv/w2DWetIXahiudga+YE
 RqGApY7hMRUBKZC8Dq+2CPcHcS/5jHrQSnyb6ttwwFbACt+kuvgEbEi08xm4JDGaVa+L
 /wHA==
X-Gm-Message-State: AOAM532mge/DKEA0ftTuZymh+PHq1l6xY34yWQCZjKgntnl8yMSG3bua
 cMVIAVucFOfzxzsTggFbf0ldzFn1qq0=
X-Google-Smtp-Source: ABdhPJz3XejbPUl+cy6OhXPqaz6SJ8sIqtfbHmIcZ9FAXPtMPCnDwSjp0FIXny3ibV/tpKUp7Gjc4g==
X-Received: by 2002:a05:6830:1d98:: with SMTP id
 y24mr9647565oti.164.1618915939038; 
 Tue, 20 Apr 2021 03:52:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i9sm2202197oog.17.2021.04.20.03.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:52:18 -0700 (PDT)
Subject: Re: Enabling pmbus power control
To: Zev Weiss <zev@bewilderbeest.net>
References: <20210330112254.GB4976@sirena.org.uk>
 <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
 <20210330174221.GJ4976@sirena.org.uk>
 <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
 <20210330180200.GK4976@sirena.org.uk> <20210330193810.GA235990@roeck-us.net>
 <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
 <20210420033648.GA227111@roeck-us.net>
 <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
 <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
 <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <fe111c8a-9588-dbfb-624a-29bb3a5efe13@roeck-us.net>
Date: Tue, 20 Apr 2021 03:52:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/20/21 12:06 AM, Zev Weiss wrote:
> On Tue, Apr 20, 2021 at 01:00:25AM CDT, Guenter Roeck wrote:
>> On 4/19/21 10:50 PM, Zev Weiss wrote:
>> [ ... ]
>>
>>> I had a glance at the enclosure driver; it looks pretty geared toward SES-like things (drivers/scsi/ses.c being its only usage I can see in the kernel at the moment) and while it could perhaps be pressed into working for this it seems like it would probably drag in a fair amount of boilerplate and result in a somewhat gratuitously confusing driver arrangement (calling the things involved in the cases we're looking at "enclosures" seems like a bit of a stretch).
>>>
>>> As an alternative, would something like the patch below be more along the lines of what you're suggesting?  And if so, would it make sense to generalize it into something like 'pmbus-switch.c' and add a PMBUS_HAVE_POWERSWITCH functionality bit or similar in the pmbus code instead of hardcoding it for only LM25066 support?
>>>
>>>
>>
>> No. Don't access pmbus functions from outside drivers/hwmon/pmbus.
>>
>> I used to be opposed to function export restrictions (aka export namespaces),
>> but you are making a good case that we need to introduce them for pmbus
>> functions.
>>
>> Guenter
> 
> Okay -- I figured that was likely to be frowned upon, but the alternative seemed to be effectively duplicating non-trivial chunks of the pmbus code.  However, upon realizing that the LM25066 doesn't actually require any of the paging work the generic pmbus code provides, I suppose it can actually be done with a simple smbus read & write.  Does this version look better?
> 

It is just getting worse and worse. You are re-implementing regulator
support for the lm25066. The correct solution would be to implement
regulator support in the lm25066 and use it from the secondary driver
(which should be chip independent).

Guenter

> 
> Zev
> 
> 
> From 1662e1c59c498ad6b208e6ab450bd467d71def34 Mon Sep 17 00:00:00 2001
> From: Zev Weiss <zev@bewilderbeest.net>
> Date: Wed, 31 Mar 2021 01:58:35 -0500
> Subject: [PATCH] misc: add lm25066-switch driver
> 
> This driver allows an lm25066 to be switched on and off from userspace
> via sysfs.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/misc/Kconfig          |   7 ++
>  drivers/misc/Makefile         |   1 +
>  drivers/misc/lm25066-switch.c | 126 ++++++++++++++++++++++++++++++++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 drivers/misc/lm25066-switch.c
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index f532c59bb59b..384b6022ec15 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -445,6 +445,13 @@ config HISI_HIKEY_USB
>        switching between the dual-role USB-C port and the USB-A host ports
>        using only one USB controller.
>  
> +config LM25066_SWITCH
> +    tristate "LM25066 power switch support"
> +    depends on OF && SENSORS_LM25066
> +    help
> +      This driver augments LM25066 hwmon support with power switch
> +      functionality controllable from userspace via sysfs.
> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 99b6f15a3c70..c948510d0cc9 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -56,3 +56,4 @@ obj-$(CONFIG_HABANA_AI)        += habanalabs/
>  obj-$(CONFIG_UACCE)        += uacce/
>  obj-$(CONFIG_XILINX_SDFEC)    += xilinx_sdfec.o
>  obj-$(CONFIG_HISI_HIKEY_USB)    += hisi_hikey_usb.o
> +obj-$(CONFIG_LM25066_SWITCH)    += lm25066-switch.o
> diff --git a/drivers/misc/lm25066-switch.c b/drivers/misc/lm25066-switch.c
> new file mode 100644
> index 000000000000..9adc67c320f9
> --- /dev/null
> +++ b/drivers/misc/lm25066-switch.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This module provides a thin wrapper around the lm25066 hwmon driver that
> + * additionally exposes a userspace-controllable on/off power switch via
> + * sysfs.
> + *
> + * Author: Zev Weiss <zweiss@equinix.com>
> + *
> + * Copyright (C) 2021 Equinix Services, Inc.
> + */
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/i2c.h>
> +#include <linux/platform_device.h>
> +
> +/*
> + * The relevant PMBus command and data values for controlling the LM25066
> + * power state.  Because it's not a paged device we skip the usual paging
> + * business other PMBus devices might require.
> + */
> +#define CMD_OPERATION 0x01
> +#define OPERATION_ON 0x80
> +#define OPERATION_OFF 0x00
> +
> +static ssize_t switch_show_state(struct device *dev, struct device_attribute *attr,
> +                                 char *buf)
> +{
> +    struct i2c_client *pmic = dev_get_drvdata(dev);
> +    ssize_t ret = i2c_smbus_read_byte_data(pmic, CMD_OPERATION);
> +    if (ret < 0)
> +        return ret;
> +
> +    return sysfs_emit(buf, "%s\n", (ret & OPERATION_ON) ? "on" : "off");
> +}
> +
> +static ssize_t switch_set_state(struct device *dev, struct device_attribute *attr,
> +                                const char *buf, size_t count)
> +{
> +    int status;
> +    u8 value;
> +    struct i2c_client *pmic = dev_get_drvdata(dev);
> +    if (sysfs_streq(buf, "on"))
> +        value = OPERATION_ON;
> +    else if (sysfs_streq(buf, "off"))
> +        value = OPERATION_OFF;
> +    else
> +        return -EINVAL;
> +    status = i2c_smbus_write_byte_data(pmic, CMD_OPERATION, value);
> +    return status ? : count;
> +}
> +
> +static DEVICE_ATTR(state, 0644, switch_show_state, switch_set_state);
> +
> +static struct attribute *attributes[] = {
> +    &dev_attr_state.attr,
> +    NULL,
> +};
> +
> +static const struct attribute_group attr_group = {
> +    .attrs = attributes,
> +};
> +
> +static int lm25066_switch_probe(struct platform_device *pdev)
> +{
> +    int status;
> +    struct device_node *np = pdev->dev.of_node;
> +    struct device_node *pmic_np;
> +    struct i2c_client *pmic;
> +
> +    pmic_np = of_parse_phandle(np, "pmic", 0);
> +    if (!pmic_np) {
> +        dev_err(&pdev->dev, "Cannot parse lm25066-switch pmic\n");
> +        return -ENODEV;
> +    }
> +
> +    if (!of_device_is_compatible(pmic_np, "lm25066")) {
> +        dev_err(&pdev->dev, "lm25066-switch pmic not lm25066 compatible");
> +        status = -ENODEV;
> +        goto out;
> +    }
> +
> +    pmic = of_find_i2c_device_by_node(pmic_np);
> +    if (!pmic) {
> +        status = -EPROBE_DEFER;
> +        goto out;
> +    }
> +
> +    platform_set_drvdata(pdev, pmic);
> +
> +    status = sysfs_create_group(&pdev->dev.kobj, &attr_group);
> +
> +out:
> +    of_node_put(pmic_np);
> +    return status;
> +}
> +
> +static int lm25066_switch_remove(struct platform_device *pdev)
> +{
> +    struct i2c_client *pmic = platform_get_drvdata(pdev);
> +
> +    sysfs_remove_group(&pdev->dev.kobj, &attr_group);
> +    put_device(&pmic->dev);
> +
> +    return 0;
> +}
> +
> +static const struct of_device_id lm25066_switch_table[] = {
> +    { .compatible = "lm25066-switch" },
> +    { },
> +};
> +
> +static struct platform_driver lm25066_switch_driver = {
> +    .driver = {
> +        .name = "lm25066-switch",
> +        .of_match_table = lm25066_switch_table,
> +    },
> +    .probe = lm25066_switch_probe,
> +    .remove = lm25066_switch_remove,
> +};
> +
> +module_platform_driver(lm25066_switch_driver);
> +
> +MODULE_AUTHOR("Zev Weiss <zweiss@equinix.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("LM25066 power-switch driver");

