Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47518C3BD
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 00:31:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k38N2vKxzDrP2
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 10:31:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ia8MLTXg; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k37Z0LTTzDrPr
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 10:31:05 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id 37so2098743pgm.11
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 16:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zDUOxleUCZkbCu4VF6xcEU/hC9haWp52XB2hcVocx6Q=;
 b=Ia8MLTXgsZ+RBlUMmrzM4z11Puv+GVEcoMOQoViJxOQyTRRjBt3J3co3k6CpcxE7rg
 SVmEBAb2OhE5EVGeL1NqvF/C7YQDOi3lIV5PnvGEx5iNortqExgtILDkNYPwHAjWeey1
 duVKkbCf5qg9K6cqMnSsH70ATHrsmHUjskyR67mxd/PsAHnap8xH/46YMRqZs7CG/mfZ
 IweSvXuPbzmQ2aYWfYFy/jijvdFgyCNree171bQhLIbY0DEYUGAFHTzphkGsajd0BU62
 DfDZoFVxkt/BK9MVXjx1FneOjcPcRoNha/7jWiEJEPmS3gl7v6LYJvcHaQUZIhQOhum2
 Lw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zDUOxleUCZkbCu4VF6xcEU/hC9haWp52XB2hcVocx6Q=;
 b=ed5AOVV/eijuVjdFC9XSiPF98qu7bBI/tQfSW89+Nebb9hGfNZuCdqnYNqCmuaT2h7
 JWIR+BWlQM2XINtZqEvGpK1VmXk+3mYcEQFasjq8eNGVW9f2THU+q3csqMUFVxw404PL
 ncM4iZDfrvtjq4xfv+W4X3zImE1z0bE5WrrId7OgkP/ErVnVOBaMoWyvYXOfiJaDDKkG
 KfJMExzIyPP+ELigh2B8FpdJkhUMXbnYeIjYOGr7b4lyGnItTAhZ9udT4yZlJlcmUVKI
 QkaL6CSV5+PE49qNMaaDA+DyMRenEjMnvojPhokUAJQ626DF9d42eqrkcVdo4Cr9qzZB
 xVMA==
X-Gm-Message-State: ANhLgQ0O37Ovb/tVEJfVvvvgblkPTW6gVBH5qEffyY8ECnnd2wdK0QsA
 L1V/hrrkmk3RxBGkWT6klRo=
X-Google-Smtp-Source: ADFU+vvllk5pgTFu/ycrDWKysxdKCi+GGFtNAof7GszsWT2pdN9f3sEYLNW4Si35r7tRwzMkoCQoGQ==
X-Received: by 2002:a65:5a4f:: with SMTP id z15mr5193633pgs.103.1584660661756; 
 Thu, 19 Mar 2020 16:31:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g14sm3424827pfb.131.2020.03.19.16.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 16:31:01 -0700 (PDT)
Subject: Re: [PATCH linux hwmon-next v1 1/3] hwmon: (sbtsi) Add basic support
 for SB-TSI sensors
To: Kun Yi <kunyi@google.com>, jdelvare@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <20200319224812.202013-1-kunyi@google.com>
 <20200319224812.202013-2-kunyi@google.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <476e9c68-4532-ec07-8244-5a8aa2fbc599@roeck-us.net>
Date: Thu, 19 Mar 2020 16:30:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319224812.202013-2-kunyi@google.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/19/20 3:48 PM, Kun Yi wrote:
> SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> interface that reports AMD SoC's Ttcl (normalized temperature),
> and resembles a typical 8-pin remote temperature sensor's I2C interface
> to BMC.
> 
> This commit adds basic support using this interface to read CPU
> temperature, and read/write high/low CPU temp thresholds.
> 
> Test status: tested reading temp1_input, and reading/writing
> temp1_max/min.
> 

How do I instantiate this driver on a system with an AMD CPU
(in other words, what is the i2c bus and the i2c address) ?

> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/sbtsi_temp.c | 218 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 229 insertions(+)
>  create mode 100644 drivers/hwmon/sbtsi_temp.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 05a30832c6ba..9585dcd01d1b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1412,6 +1412,16 @@ config SENSORS_RASPBERRYPI_HWMON
>  	  This driver can also be built as a module. If so, the module
>  	  will be called raspberrypi-hwmon.
>  
> +config SENSORS_SBTSI
> +	tristate "Emulated SB-TSI temperature sensor"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for emulated temperature
> +	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called sbtsi_temp.
> +
>  config SENSORS_SHT15
>  	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
>  	depends on GPIOLIB || COMPILE_TEST
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b0b9c8e57176..cd109f003ce4 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -152,6 +152,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>  obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>  obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
> +obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> new file mode 100644
> index 000000000000..f998d944a515
> --- /dev/null
> +++ b/drivers/hwmon/sbtsi_temp.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
> + *                compliant AMD SoC temperature device.
> + *
> + * Copyright (c) 2020, Google Inc.
> + * Copyright (c) 2020, Kun Yi <kunyi@google.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +
> +/*
> + * SB-TSI registers only support SMBus byte data access. "_INT" registers are
> + * the integer part of a temperature value or limit, and "_DEC" registers are
> + * corresponding decimal parts.
> + */
> +#define SBTSI_REG_TEMP_INT		0x01 /* RO */
> +#define SBTSI_REG_STATUS		0x02 /* RO */
> +#define SBTSI_REG_CONFIG		0x03 /* RO */
> +#define SBTSI_REG_TEMP_HIGH_INT		0x07 /* RW */
> +#define SBTSI_REG_TEMP_LOW_INT		0x08 /* RW */
> +#define SBTSI_REG_TEMP_DEC		0x10 /* RW */
> +#define SBTSI_REG_TEMP_HIGH_DEC		0x13 /* RW */
> +#define SBTSI_REG_TEMP_LOW_DEC		0x14 /* RW */
> +#define SBTSI_REG_REV			0xFF /* RO */
> +
> +#define SBTSI_CONFIG_READ_ORDER_SHIFT	5
> +
> +#define SBTSI_TEMP_MIN	(0)
> +#define SBTSI_TEMP_MAX	(255875)
> +#define SBTSI_REV_MAX_VALID_ID	(4)

Unnecessary ( ) around literals.

> +
> +struct sbtsi_data {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct mutex lock;
> +};
> +
> +/*
> + * From SB-TSI spec: CPU temperature readings and limit registers encode the
> + * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
> + * register encodes the base-2 of the integer portion, and the upper 3 bits of
> + * the "low byte" encode in base-2 the decimal portion.
> + *
> + * e.g. INT=0x19, DEC=0x20 represents 25.125 degrees Celsius
> + *
> + * Therefore temperature in millidegree Celsius =
> + *   (INT + DEC / 256) * 1000 = (INT * 8 + DEC / 32) * 125
> + */
> +static inline int SBTSI_REGS_TO_TEMP(s32 integer, s32 decimal)
> +{
> +	return (((u32)integer << 3) + ((u32)decimal >> 5)) * 125;

Why pass s32 as parameter just to typecast to u32 ? The values
are known to be between 0 and 255, and thus will never be negative,
even with s32, so this is really unnecessary.

> +}
> +
> +/*
> + * Inversely, given temperature in millidegree Celsius
> + *   INT = (TEMP / 125) / 8
> + *   DEC = ((TEMP / 125) % 8) * 32
> + * Caller have to make sure temp doesn't exceed 255875, the max valid value.
> + */
> +static inline void SBTSI_TEMP_TO_REGS(u32 temp, u8 *integer, u8 *decimal)
> +{
> +	temp /= 125;
> +	*integer = temp >> 3;
> +	*decimal = (temp & 0x7) << 5;
> +}
> +
> +static ssize_t sbtsi_show_temp(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct sbtsi_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	s32 err, temp_int, temp_dec;
> +	u8 read_order;
> +
> +	/*
> +	 * ReadOrder bit specifies the reading order of integer and decimal
> +	 * part of CPU temp for atomic reads. If bit == 0, reading integer part
> +	 * triggers latching of the decimal part, so integer part should be read
> +	 * first. If bit == 1, read order should be reversed.
> +	 */
> +	err = i2c_smbus_read_byte_data(client, SBTSI_REG_CONFIG);
> +	if (err < 0)
> +		return err;
> +
> +	read_order = (u8)err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT);
> +
> +	if (read_order == 0) {
> +		temp_int = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_INT);
> +		temp_dec = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_DEC);
> +	} else {
> +		temp_dec = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_DEC);
> +		temp_int = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_INT);
> +	}
> +
> +	if (temp_int < 0)
> +		return temp_int;
> +	if (temp_dec < 0)
> +		return temp_dec;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n",
> +			 SBTSI_REGS_TO_TEMP(temp_int, temp_dec));
> +}
> +
> +#define sbtsi_show_temp_limit(name, REG) \
> +static ssize_t sbtsi_show_##name(struct device *dev, \
> +				 struct device_attribute *attr, char *buf) \
> +{ \
> +	struct sbtsi_data *data = dev_get_drvdata(dev); \
> +	struct i2c_client *client = data->client; \
> +	s32 temp_int, temp_dec; \
> +\
> +	temp_int = i2c_smbus_read_byte_data(client, REG##_INT); \
> +	temp_dec = i2c_smbus_read_byte_data(client, REG##_DEC); \
> +\
> +	if (temp_int < 0) \
> +		return temp_int; \
> +	if (temp_dec < 0) \
> +		return temp_dec; \
> +\
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", \
> +			 SBTSI_REGS_TO_TEMP(temp_int, temp_dec)); \
> +}
> +
> +sbtsi_show_temp_limit(temp1_min, SBTSI_REG_TEMP_LOW);
> +sbtsi_show_temp_limit(temp1_max, SBTSI_REG_TEMP_HIGH);
> +
> +#define sbtsi_set_temp_limit(name, REG) \
> +static ssize_t sbtsi_set_##name(struct device *dev, \
> +				struct device_attribute *attr, \
> +				const char *buf, size_t count) \
> +{ \
> +	struct sbtsi_data *data = dev_get_drvdata(dev); \
> +	struct i2c_client *client = data->client; \
> +	long val; \
> +	u8 temp_int, temp_dec; \
> +	int err = kstrtol(buf, 10, &val); \
> +	if (err) \
> +		return err; \
> +\
> +	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX); \
> +	mutex_lock(&data->lock); \
> +	SBTSI_TEMP_TO_REGS(val, &temp_int, &temp_dec); \
> +	i2c_smbus_write_byte_data(client, REG##_INT, temp_int); \
> +	i2c_smbus_write_byte_data(client, REG##_DEC, temp_dec); \
> +	mutex_unlock(&data->lock); \
> +\
> +	return count; \
> +}
> +
> +sbtsi_set_temp_limit(temp1_min, SBTSI_REG_TEMP_LOW);
> +sbtsi_set_temp_limit(temp1_max, SBTSI_REG_TEMP_HIGH);
> +
> +static SENSOR_DEVICE_ATTR(temp1_input, 0444, sbtsi_show_temp, NULL, 0);
> +static SENSOR_DEVICE_ATTR(temp1_min, 0644, sbtsi_show_temp1_min,
> +			  sbtsi_set_temp1_min, 1);
> +static SENSOR_DEVICE_ATTR(temp1_max, 0644, sbtsi_show_temp1_max,
> +			  sbtsi_set_temp1_max, 2);
> +
> +static struct attribute *sbtsi_attrs[] = {
> +	&sensor_dev_attr_temp1_input.dev_attr.attr,
> +	&sensor_dev_attr_temp1_min.dev_attr.attr,
> +	&sensor_dev_attr_temp1_max.dev_attr.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(sbtsi);
> +
> +static int sbtsi_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct sbtsi_data *data;
> +
> +	data = devm_kzalloc(dev, sizeof(struct sbtsi_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->lock);
> +
> +	hwmon_dev =
> +		devm_hwmon_device_register_with_groups(dev, client->name, data,
> +						       sbtsi_groups);

Please rewrite to use the devm_hwmon_device_register_with_info() API.

> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	dev_info(dev, "sensor '%s'\n", client->name);

Is that really valuable / necessary ?

> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id sbtsi_id[] = {
> +	{"sbtsi", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, sbtsi_id);
> +
> +static struct i2c_driver sbtsi_driver = {
> +	.class = I2C_CLASS_HWMON,
> +	.driver = {
> +		.name = "sbtsi",
> +	},
> +	.probe = sbtsi_probe,
> +	.id_table = sbtsi_id,
> +};
> +
> +module_i2c_driver(sbtsi_driver);
> +
> +MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
> +MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
> +MODULE_LICENSE("GPL");
> 

