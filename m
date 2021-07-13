Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F703C6CFA
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 11:11:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPFJ617Jtz308Q
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 19:11:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DaNwZfuJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DaNwZfuJ; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPFHm1WDvz2yft;
 Tue, 13 Jul 2021 19:11:29 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id
 f12-20020a056830204cb029048bcf4c6bd9so21814083otp.8; 
 Tue, 13 Jul 2021 02:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N8tVkCLIOHC8tQlM3lOUmxEAnRAXk6f8wcRyPngBfC0=;
 b=DaNwZfuJzvql2YKziqG8YfpN4KPtiVMPqYzBCf11ALP9JTqB83GqsWfpaC+nlvQxbm
 TIdbsdcoG/Sk++nwf8HCAL7fATfkc9FGJQAon/WuvQJKpA5dlpCmCIMM/Uau09Q6VE8C
 zGATYXnBEQEEqBuISbspXz6QWstmB+3vyfGE4KvbSRHN1emNToWdLhymEawxPCpTmlzv
 A5i278jmONI5ICGx9iFhGo1UPOqLrHbVfNZ7gGHmZov7HlvVOoJtdX0SBcnXS/+3dtRD
 CPT5S0Jwg7lYLnjqCzaa2tzSsXXamGjlzVxZa9EAq21uEDS9zsMlX3YDWUZoXJZEsgHB
 6CuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N8tVkCLIOHC8tQlM3lOUmxEAnRAXk6f8wcRyPngBfC0=;
 b=geTZz6ZsfFhNa2MQsWwi+7m3XYgfXP4rwlUHVb1gYBYZ4mnO1X3PraGSGRqMM/n6sh
 XgXG3FPEXSir1g1QH/7re25TtVctlAcDTfwc/0Ms2+aC34suw3Pc54K9XAE28JHjw0fe
 k9aCjCFmjw6eAAX7lrd/7v/E1JN+PCtCRZzG9mb+RvzqHX5q5OcuDdWcPWGau/lA9Vw3
 NvFaF3+fZrLhaUsVIr5uiXHhHqlkTrfEGjbUkxYgotanDjSUF4I/q2395ARdpZfmM0+v
 PDfp3nkIUbBmYeOGGELvV6apP1OK+B1/Ev3yO3oOu9M1VD+Pxq1Frnhqx5ZeB+HEC1BL
 E0Jw==
X-Gm-Message-State: AOAM531L63P5X0XBVWaUL/bGt9lzK5QRw/YMdutY/4lkRcsbWyYvS8Ru
 ziDEbxO+PiHWkEKEev2WliU=
X-Google-Smtp-Source: ABdhPJyEmJ54iiMXDtCHbs5J4YChfUo2Bfa8JGRGajy7bwU6lXC2GsoItE6uqAeoa722QK5xCu2pag==
X-Received: by 2002:a05:6830:1495:: with SMTP id
 s21mr2721116otq.86.1626167484975; 
 Tue, 13 Jul 2021 02:11:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n20sm3680323otj.11.2021.07.13.02.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 02:11:24 -0700 (PDT)
To: Quan Nguyen <quan@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
 <20210713060031.31568-3-quan@os.amperecomputing.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 2/4] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD
 driver
Message-ID: <4e251a34-5c0f-da9d-e471-517c1d581fa4@roeck-us.net>
Date: Tue, 13 Jul 2021 02:11:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713060031.31568-3-quan@os.amperecomputing.com>
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/12/21 11:00 PM, Quan Nguyen wrote:
> Adds Multi-function devices driver for SMpro co-processor found on the
> Mt.Jade hardware reference platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Maybe that has been discussed, but is there anything else besides
hardware monitoring connected to this i2c interface, and are there
more child drivers coming ? I don't find the BMC Interface Specification
mentioned in the documentation patch, but the hardware specification
seems to suggest that the i2c bus is dedicated for hardware monitoring.
If there is no other child driver, an mfd driver would not make sense.

Thanks,
Guenter

> ---
> Changes in v5:
>    + Dropped the use of simple-mfd-i2c driver [Quan]
>    + Introduced drivers/mfd/smpro-mfd.c driver to instantiate
>    sub-devices. This is to avoid DT nodes without resource issue [Quan]
>    + Revised commit message [Quan]
> 
> Changes in v4:
>    + Add "depends on I2C" to fix build issue found by kernel test
>    robot [Guenter]
> 
> Changes in v3:
>    + None
> 
> Changes in v2:
>    + Used 'struct of_device_id's .data attribute [Lee Jones]
> 
>   drivers/mfd/Kconfig     | 12 +++++++
>   drivers/mfd/Makefile    |  1 +
>   drivers/mfd/smpro-mfd.c | 74 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 87 insertions(+)
>   create mode 100644 drivers/mfd/smpro-mfd.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6a3fd2d75f96..25e502cca32f 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -77,6 +77,18 @@ config MFD_AS3711
>   	help
>   	  Support for the AS3711 PMIC from AMS
>   
> +config MFD_SMPRO
> +	tristate "Ampere Computing MFD SMpro core driver"
> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to enable SMpro driver support for Ampere's Altra
> +	  processor family.
> +
> +	  Ampere's Altra SMpro exposes an I2C regmap interface that can
> +	  be accessed by child devices.
> +
>   config MFD_AS3722
>   	tristate "ams AS3722 Power Management IC"
>   	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 8116c19d5fd4..046fd36de85a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -268,6 +268,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
>   
>   obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
>   obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
> +obj-$(CONFIG_MFD_SMPRO)		+= smpro-mfd.o
>   obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
>   
>   obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
> diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
> new file mode 100644
> index 000000000000..b0cd3c248507
> --- /dev/null
> +++ b/drivers/mfd/smpro-mfd.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Ampere Altra Family SMPro MFD - I2C
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + *
> + * Author: Quan Nguyen <quan@os.amperecomputing..com>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/mfd/core.h>
> +#include <linux/regmap.h>
> +
> +/* Identification Registers */
> +#define MANUFACTURER_ID_REG     0x02
> +#define AMPERE_MANUFACTURER_ID  0xCD3A
> +
> +static const struct regmap_config simple_word_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +};
> +
> +static const struct mfd_cell smpro_devs[] = {
> +	MFD_CELL_NAME("smpro-hwmon"),
> +};
> +
> +static int smpro_mfd_probe(struct i2c_client *i2c)
> +{
> +	const struct regmap_config *config;
> +	struct regmap *regmap;
> +	unsigned int val;
> +	int ret;
> +
> +	config = device_get_match_data(&i2c->dev);
> +	if (!config)
> +		config = &simple_word_regmap_config;
> +
> +	regmap = devm_regmap_init_i2c(i2c, config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/* Check for valid ID */
> +	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != AMPERE_MANUFACTURER_ID)
> +		return -ENODEV;
> +
> +	return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> +				    smpro_devs, ARRAY_SIZE(smpro_devs), NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id smpro_mfd_of_match[] = {
> +	{ .compatible = "ampere,smpro", .data = &simple_word_regmap_config },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, smpro_mfd_of_match);
> +
> +static struct i2c_driver smpro_mfd_driver = {
> +	.probe_new = smpro_mfd_probe,
> +	.driver = {
> +		.name = "smpro-mfd-i2c",
> +		.of_match_table = smpro_mfd_of_match,
> +	},
> +};
> +module_i2c_driver(smpro_mfd_driver);
> +
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("SMPRO MFD - I2C driver");
> +MODULE_LICENSE("GPL v2");
> 

