Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F582D8860
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 17:45:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CtYRw0nkHzDqcX
	for <lists+openbmc@lfdr.de>; Sun, 13 Dec 2020 03:45:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HEUdfUqd; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CtYR533FTzDqcV
 for <openbmc@lists.ozlabs.org>; Sun, 13 Dec 2020 03:44:48 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id o11so11344660ote.4
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 08:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EeyWaaX7RaAeCqpa7o4/zDZt2SSccBzU1v5h8IB6W5o=;
 b=HEUdfUqdydbETpeZxTzGUALNRH3jCFKbmXY/+3gLw89/U7sOg5NI3DqY/dAsjxU68p
 APrnO6GoYqhgxP7fsYk4ZJ9eQO4gsXwaO33Oa/NgYSVSFN2H7xh3zHm0kUREH9H+/PxH
 uw7nOZNc30mNj7mB332PMR8bf9YfPCytU8i6yqfp56Eu/kBv7gBhAOB1ZxaJR3nCxJLC
 7THds3wU6UYj8BuwjcyrapDWrwXM2D82qsgWJmVqll2dDgfcr++DllmXZcJsyhQuzB65
 EcgL1cT6a0Wfu6FJ3TbISIMhJAuFBTBZNkBN2hQzRkLfn3h075yHGu3UtxlNVXEVfQfX
 cYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=EeyWaaX7RaAeCqpa7o4/zDZt2SSccBzU1v5h8IB6W5o=;
 b=LlH7MkDJFIXV0EDIe2b0SkvP/bTBH4hAv4cg3E9rq7DD6iuI6gPbRUM2sRJy2UeTEs
 TY3SvJdXcuAbTQIAZJePShBF2kHK6u4XurDcLfQTnRt85pk4ZjuCpZ2JROpJN08mYE/7
 Smu4NbVeV86V/rnQ3OON8tTYL/tnFap6FXbwt80cq1rJODl9i1Uo1SPiUGjWmnJWLNpL
 MAJxHbB12SBzCS4aSMBIkDV7TsfTGCbq9OYiALT3iMFJhSM3K0rTiX4CFLtPvvA28ls7
 BrNkKpPzW8w5Aot2n4T89xHdhHlwy1APgFJ6ND05Ig+Qyyw1hWHGZTx1NsPk2iDXkAYG
 f0QA==
X-Gm-Message-State: AOAM533vGtMgp4/6UiYJYvBGe1OfpU3Fyoff4YUlWWcbT56qkPWwqbOQ
 ThKNUyPsVj3nSwBU6bWs7GA=
X-Google-Smtp-Source: ABdhPJw4y1wis5au6q+ezkP84nlSwIcqaaI4nuEEp2NoIYnuQ42FF+zpknofyu4wQwWmPiViqSb62w==
X-Received: by 2002:a9d:6f91:: with SMTP id h17mr14204381otq.104.1607791484758; 
 Sat, 12 Dec 2020 08:44:44 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f25sm32691oou.39.2020.12.12.08.44.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 12 Dec 2020 08:44:44 -0800 (PST)
Date: Sat, 12 Dec 2020 08:44:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH linux hwmon-next v5 1/3] hwmon: (sbtsi) Add basic support
 for SB-TSI sensors
Message-ID: <20201212163628.GA28946@roeck-us.net>
References: <20201211215427.3281681-1-kunyi@google.com>
 <20201211215427.3281681-2-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211215427.3281681-2-kunyi@google.com>
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
Cc: mark.rutland@arm.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, supreeth.venkatesh@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 11, 2020 at 01:54:25PM -0800, Kun Yi wrote:
> SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> interface that reports AMD SoC's Ttcl (normalized temperature),
> and resembles a typical 8-pin remote temperature sensor's I2C interface
> to BMC.
> 
> This commit adds basic support using this interface to read CPU
> temperature, and read/write high/low CPU temp thresholds.
> 
> To instantiate this driver on an AMD CPU with SB-TSI
> support, the i2c bus number would be the bus connected from the board
> management controller (BMC) to the CPU. The i2c address is specified in
> Section 6.3.1 of the spec [1]: The SB-TSI address is normally 98h for
> socket 0 and 90h for socket 1, but it could vary based on hardware address
> select pins.
> 
> [1]: https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
> 
> Test status: tested reading temp1_input, and reading/writing
> temp1_max/min.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/sbtsi_temp.c | 250 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 261 insertions(+)
>  create mode 100644 drivers/hwmon/sbtsi_temp.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3c059fc23cd6..3d6a809700ae 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1522,6 +1522,16 @@ config SENSORS_SL28CPLD
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called sl28cpld-hwmon.
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
> index 01ca5d3fbad4..ee8c037919da 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -160,6 +160,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>  obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>  obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
> +obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> new file mode 100644
> index 000000000000..e35357c48b8e
> --- /dev/null
> +++ b/drivers/hwmon/sbtsi_temp.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
> + *                compliant AMD SoC temperature device.
> + *
> + * Copyright (c) 2020, Google Inc.
> + * Copyright (c) 2020, Kun Yi <kunyi@google.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
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
> +
> +#define SBTSI_CONFIG_READ_ORDER_SHIFT	5
> +
> +#define SBTSI_TEMP_MIN	0
> +#define SBTSI_TEMP_MAX	255875
> +
> +/* Each client has this additional data */
> +struct sbtsi_data {
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
> +static inline int sbtsi_reg_to_mc(s32 integer, s32 decimal)
> +{
> +	return ((integer << 3) + (decimal >> 5)) * 125;
> +}
> +
> +/*
> + * Inversely, given temperature in millidegree Celsius
> + *   INT = (TEMP / 125) / 8
> + *   DEC = ((TEMP / 125) % 8) * 32
> + * Caller have to make sure temp doesn't exceed 255875, the max valid value.
> + */
> +static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
> +{
> +	temp /= 125;
> +	*integer = temp >> 3;
> +	*decimal = (temp & 0x7) << 5;
> +}
> +
> +static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	struct sbtsi_data *data = dev_get_drvdata(dev);
> +	s32 temp_int, temp_dec;
> +	int err;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		/*
> +		 * ReadOrder bit specifies the reading order of integer and
> +		 * decimal part of CPU temp for atomic reads. If bit == 0,
> +		 * reading integer part triggers latching of the decimal part,
> +		 * so integer part should be read first. If bit == 1, read
> +		 * order should be reversed.
> +		 */
> +		err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
> +		if (err < 0)
> +			return err;
> +
> +		mutex_lock(&data->lock);
> +		if (err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT)) {
> +			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
> +			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
> +		} else {
> +			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
> +			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
> +		}
> +		mutex_unlock(&data->lock);
> +		break;
> +	case hwmon_temp_max:
> +		mutex_lock(&data->lock);
> +		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_INT);
> +		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_DEC);
> +		mutex_unlock(&data->lock);
> +		break;
> +	case hwmon_temp_min:
> +		mutex_lock(&data->lock);
> +		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_INT);
> +		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_DEC);
> +		mutex_unlock(&data->lock);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +
> +	if (temp_int < 0)
> +		return temp_int;
> +	if (temp_dec < 0)
> +		return temp_dec;
> +
> +	*val = sbtsi_reg_to_mc(temp_int, temp_dec);
> +
> +	return 0;
> +}
> +
> +static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long val)
> +{
> +	struct sbtsi_data *data = dev_get_drvdata(dev);
> +	int reg_int, reg_dec, err;
> +	u8 temp_int, temp_dec;
> +
> +	switch (attr) {
> +	case hwmon_temp_max:
> +		reg_int = SBTSI_REG_TEMP_HIGH_INT;
> +		reg_dec = SBTSI_REG_TEMP_HIGH_DEC;
> +		break;
> +	case hwmon_temp_min:
> +		reg_int = SBTSI_REG_TEMP_LOW_INT;
> +		reg_dec = SBTSI_REG_TEMP_LOW_DEC;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
> +	sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
> +
> +	mutex_lock(&data->lock);
> +	err = i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
> +	if (err)
> +		goto exit;
> +
> +	err = i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
> +exit:
> +	mutex_unlock(&data->lock);
> +	return err;
> +}
> +
> +static umode_t sbtsi_is_visible(const void *data,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			return 0444;
> +		case hwmon_temp_min:
> +			return 0644;
> +		case hwmon_temp_max:
> +			return 0644;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *sbtsi_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX),
> +	NULL
> +};
> +
> +static const struct hwmon_ops sbtsi_hwmon_ops = {
> +	.is_visible = sbtsi_is_visible,
> +	.read = sbtsi_read,
> +	.write = sbtsi_write,
> +};
> +
> +static const struct hwmon_chip_info sbtsi_chip_info = {
> +	.ops = &sbtsi_hwmon_ops,
> +	.info = sbtsi_info,
> +};
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
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data, &sbtsi_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id sbtsi_id[] = {
> +	{"sbtsi", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, sbtsi_id);
> +
> +static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
> +	{
> +		.compatible = "amd,sbtsi",
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sbtsi_of_match);
> +
> +static struct i2c_driver sbtsi_driver = {
> +	.class = I2C_CLASS_HWMON,
> +	.driver = {
> +		.name = "sbtsi",
> +		.of_match_table = of_match_ptr(sbtsi_of_match),
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
