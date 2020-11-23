Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7202C0A5A
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 14:21:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfnpr3d5nzDqHg
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 00:21:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=roeck-us.net (client-ip=69.89.20.226;
 helo=gproxy10-pub.mail.unifiedlayer.com; envelope-from=linux@roeck-us.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256
 header.s=default header.b=5k3CokD0; dkim-atps=neutral
Received: from gproxy10-pub.mail.unifiedlayer.com
 (gproxy10-pub.mail.unifiedlayer.com [69.89.20.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfnly5KJ2zDqG1
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 00:18:37 +1100 (AEDT)
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
 by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id 05569140639
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 06:18:34 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152]) by cmsmtp with ESMTP
 id hBjlko6EpdCH5hBjlktZoe; Mon, 23 Nov 2020 06:18:33 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=c96Fvy1l c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=FOH2dFAWAAAA:8 a=eJIs5Ax8GuWUTwcQiUoA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=QEXdDO2ut3YA:10:nop_charset_2 a=i3VuKzQdj-NEYjvDI-p3:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EqjbpuYCB63XFCsnvvldJSGoPeW8YbemiiuetxwkKkA=; b=5k3CokD0kMJF6D270Xcp2Wh+SN
 Ka7rZrgtt645XOyb/2HCVHo+CLm9bQDbvk9we46odDa7goLPUOoAYzxOWKlqQrgpuVOJQ3vvLyxN3
 IAOZvon6B2w6Xn7wHufyLOGFtZhxWNiU0KF8idzvUwWNdlTcPQz+kHi5ee05Dy7ZpvrIxbzJeHQ9p
 425uYlrR8Db+zME7Uw2CSgGk3gMtyewwrggbQj8LvJKAkEjKcOoCplSWMrBs/lzfkQ5nTL+WsLgVb
 EuHga+PZBZgE099R4AQkx6enWhxlAuZhOKV8a8L3JhZuzBPwcKPI/RT658N4k34dgDHHZHU5k5r5Y
 W8DujQ9A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:50882 helo=localhost)
 by bh-25.webhostbox.net with esmtpa (Exim 4.93)
 (envelope-from <linux@roeck-us.net>)
 id 1khBjk-0012M1-Ps; Mon, 23 Nov 2020 13:18:32 +0000
Date: Mon, 23 Nov 2020 05:18:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH v4 1/2] hwmon: (max127) Add Maxim MAX127 hardware
 monitoring driver
Message-ID: <20201123131832.GB136636@roeck-us.net>
References: <20201123074532.3730-1-rentao.bupt@gmail.com>
 <20201123074532.3730-2-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123074532.3730-2-rentao.bupt@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1khBjk-0012M1-Ps
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost)
 [108.223.40.66]:50882
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
 linux-doc@vger.kernel.org, taoren@fb.com, openbmc@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 mikechoi@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Nov 22, 2020 at 11:45:31PM -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add hardware monitoring driver for the Maxim MAX127 chip.
> 
> MAX127 min/max range handling code is inspired by the max197 driver.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  Changes in v4:
>    - delete unnecessary "#include" lines.
>    - simplify i2c_transfer() error handling.
>    - add mutex to protect ctrl_byte in write_min|max() functions.
>  Changes in v3:
>    - no code change. xdp maintainers were removed from to/cc list.
>  Changes in v2:
>    - replace devm_hwmon_device_register_with_groups() with
>      devm_hwmon_device_register_with_info() API.
>    - divide min/max read and write methods to separate functions.
>    - fix raw-to-vin conversion logic.
>    - refine ctrl_byte handling so mutex is not needed to protect the
>      byte.
>    - improve i2c_transfer() error handling.
>    - a few other improvements (comments, variable naming, and etc.).
> 
>  drivers/hwmon/Kconfig  |   9 ++
>  drivers/hwmon/Makefile |   1 +
>  drivers/hwmon/max127.c | 346 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 356 insertions(+)
>  create mode 100644 drivers/hwmon/max127.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 9d600e0c5584..716df51edc87 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -950,6 +950,15 @@ config SENSORS_MAX1111
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max1111.
>  
> +config SENSORS_MAX127
> +	tristate "Maxim MAX127 12-bit 8-channel Data Acquisition System"
> +	depends on I2C
> +	help
> +	  Say y here to support Maxim's MAX127 DAS chips.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called max127.
> +
>  config SENSORS_MAX16065
>  	tristate "Maxim MAX16065 System Manager and compatibles"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 1083bbfac779..01ca5d3fbad4 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -127,6 +127,7 @@ obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
>  obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
>  obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
>  obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
> +obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
>  obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
>  obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
>  obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
> diff --git a/drivers/hwmon/max127.c b/drivers/hwmon/max127.c
> new file mode 100644
> index 000000000000..1c54146b6086
> --- /dev/null
> +++ b/drivers/hwmon/max127.c
> @@ -0,0 +1,346 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for MAX127.
> + *
> + * Copyright (c) 2020 Facebook Inc.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +
> +/*
> + * MAX127 Control Byte. Refer to MAX127 datasheet, Table 1 "Control-Byte
> + * Format" for details.
> + */
> +#define MAX127_CTRL_START	BIT(7)
> +#define MAX127_CTRL_SEL_SHIFT	4
> +#define MAX127_CTRL_RNG		BIT(3)
> +#define MAX127_CTRL_BIP		BIT(2)
> +#define MAX127_CTRL_PD1		BIT(1)
> +#define MAX127_CTRL_PD0		BIT(0)
> +
> +#define MAX127_NUM_CHANNELS	8
> +#define MAX127_SET_CHANNEL(ch)	(((ch) & 7) << MAX127_CTRL_SEL_SHIFT)
> +
> +/*
> + * MAX127 channel input ranges. Refer to MAX127 datasheet, Table 3 "Range
> + * and Polarity Selection" for details.
> + */
> +#define MAX127_FULL_RANGE	10000	/* 10V */
> +#define MAX127_HALF_RANGE	5000	/* 5V */
> +
> +/*
> + * MAX127 returns 2 bytes at read:
> + *   - the first byte contains data[11:4].
> + *   - the second byte contains data[3:0] (MSB) and 4 dummy 0s (LSB).
> + * Refer to MAX127 datasheet, "Read a Conversion (Read Cycle)" section
> + * for details.
> + */
> +#define MAX127_DATA_LEN		2
> +#define MAX127_DATA_SHIFT	4
> +
> +#define MAX127_SIGN_BIT		BIT(11)
> +
> +struct max127_data {
> +	struct mutex lock;
> +	struct i2c_client *client;
> +	u8 ctrl_byte[MAX127_NUM_CHANNELS];
> +};
> +
> +static int max127_select_channel(struct i2c_client *client, u8 ctrl_byte)
> +{
> +	int status;
> +	struct i2c_msg msg = {
> +		.addr = client->addr,
> +		.flags = 0,
> +		.len = sizeof(ctrl_byte),
> +		.buf = &ctrl_byte,
> +	};
> +
> +	status = i2c_transfer(client->adapter, &msg, 1);
> +
> +	return (status == 1) ? 0 : -EIO;

This isn't what I said and asked for. It drops the unnecessary else,
but now it overwrites an error value.

Guenter

> +}
> +
> +static int max127_read_channel(struct i2c_client *client, long *val)
> +{
> +	int status;
> +	u8 i2c_data[MAX127_DATA_LEN];
> +	struct i2c_msg msg = {
> +		.addr = client->addr,
> +		.flags = I2C_M_RD,
> +		.len = sizeof(i2c_data),
> +		.buf = i2c_data,
> +	};
> +
> +	status = i2c_transfer(client->adapter, &msg, 1);
> +	if (status != 1)
> +		return -EIO;

This isn't what I asked for.

Guenter

> +
> +	*val = (i2c_data[1] >> MAX127_DATA_SHIFT) |
> +		((u16)i2c_data[0] << MAX127_DATA_SHIFT);
> +	return 0;
> +}
> +
> +static long max127_process_raw(u8 ctrl_byte, long raw)
> +{
> +	long scale, weight;
> +
> +	/*
> +	 * MAX127's data coding is binary in unipolar mode with 1 LSB =
> +	 * (Full-Scale/4096) and two’s complement binary in bipolar mode
> +	 * with 1 LSB = [(2 x |FS|)/4096].
> +	 * Refer to MAX127 datasheet, "Transfer Function" section for
> +	 * details.
> +	 */
> +	scale = (ctrl_byte & MAX127_CTRL_RNG) ? MAX127_FULL_RANGE :
> +						MAX127_HALF_RANGE;
> +	if (ctrl_byte & MAX127_CTRL_BIP) {
> +		weight = (raw & MAX127_SIGN_BIT);
> +		raw &= ~MAX127_SIGN_BIT;
> +		raw -= weight;
> +		raw *= 2;
> +	}
> +
> +	return raw * scale / 4096;
> +}
> +
> +static int max127_read_input(struct max127_data *data, int channel, long *val)
> +{
> +	long raw;
> +	int status;
> +	struct i2c_client *client = data->client;
> +	u8 ctrl_byte = data->ctrl_byte[channel];
> +
> +	mutex_lock(&data->lock);
> +
> +	status = max127_select_channel(client, ctrl_byte);
> +	if (status)
> +		goto exit;
> +
> +	status = max127_read_channel(client, &raw);
> +	if (status)
> +		goto exit;
> +
> +	*val = max127_process_raw(ctrl_byte, raw);
> +
> +exit:
> +	mutex_unlock(&data->lock);
> +	return status;
> +}
> +
> +static int max127_read_min(struct max127_data *data, int channel, long *val)
> +{
> +	u8 rng_bip = (data->ctrl_byte[channel] >> 2) & 3;
> +	static const int min_input_map[4] = {
> +		0,			/* RNG=0, BIP=0 */
> +		-MAX127_HALF_RANGE,	/* RNG=0, BIP=1 */
> +		0,			/* RNG=1, BIP=0 */
> +		-MAX127_FULL_RANGE,	/* RNG=1, BIP=1 */
> +	};
> +
> +	*val = min_input_map[rng_bip];
> +	return 0;
> +}
> +
> +static int max127_read_max(struct max127_data *data, int channel, long *val)
> +{
> +	u8 rng_bip = (data->ctrl_byte[channel] >> 2) & 3;
> +	static const int max_input_map[4] = {
> +		MAX127_HALF_RANGE,	/* RNG=0, BIP=0 */
> +		MAX127_HALF_RANGE,	/* RNG=0, BIP=1 */
> +		MAX127_FULL_RANGE,	/* RNG=1, BIP=0 */
> +		MAX127_FULL_RANGE,	/* RNG=1, BIP=1 */
> +	};
> +
> +	*val = max_input_map[rng_bip];
> +	return 0;
> +}
> +
> +static int max127_write_min(struct max127_data *data, int channel, long val)
> +{
> +	u8 ctrl;
> +
> +	mutex_lock(&data->lock);
> +
> +	ctrl = data->ctrl_byte[channel];
> +	if (val <= -MAX127_FULL_RANGE) {
> +		ctrl |= (MAX127_CTRL_RNG | MAX127_CTRL_BIP);
> +	} else if (val < 0) {
> +		ctrl |= MAX127_CTRL_BIP;
> +		ctrl &= ~MAX127_CTRL_RNG;
> +	} else {
> +		ctrl &= ~MAX127_CTRL_BIP;
> +	}
> +	data->ctrl_byte[channel] = ctrl;
> +
> +	mutex_unlock(&data->lock);
> +
> +	return 0;
> +}
> +
> +static int max127_write_max(struct max127_data *data, int channel, long val)
> +{
> +	mutex_lock(&data->lock);
> +
> +	if (val >= MAX127_FULL_RANGE)
> +		data->ctrl_byte[channel] |= MAX127_CTRL_RNG;
> +	else
> +		data->ctrl_byte[channel] &= ~MAX127_CTRL_RNG;
> +
> +	mutex_unlock(&data->lock);
> +
> +	return 0;
> +}
> +
> +static umode_t max127_is_visible(const void *_data,
> +				 enum hwmon_sensor_types type,
> +				 u32 attr, int channel)
> +{
> +	if (type == hwmon_in) {
> +		switch (attr) {
> +		case hwmon_in_input:
> +			return 0444;
> +
> +		case hwmon_in_min:
> +		case hwmon_in_max:
> +			return 0644;
> +
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int max127_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	int status;
> +	struct max127_data *data = dev_get_drvdata(dev);
> +
> +	if (type != hwmon_in)
> +		return -EOPNOTSUPP;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		status = max127_read_input(data, channel, val);
> +		break;
> +
> +	case hwmon_in_min:
> +		status = max127_read_min(data, channel, val);
> +		break;
> +
> +	case hwmon_in_max:
> +		status = max127_read_max(data, channel, val);
> +		break;
> +
> +	default:
> +		status = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return status;
> +}
> +
> +static int max127_write(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long val)
> +{
> +	int status;
> +	struct max127_data *data = dev_get_drvdata(dev);
> +
> +	if (type != hwmon_in)
> +		return -EOPNOTSUPP;
> +
> +	switch (attr) {
> +	case hwmon_in_min:
> +		status = max127_write_min(data, channel, val);
> +		break;
> +
> +	case hwmon_in_max:
> +		status = max127_write_max(data, channel, val);
> +		break;
> +
> +	default:
> +		status = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return status;
> +}
> +
> +static const struct hwmon_ops max127_hwmon_ops = {
> +	.is_visible = max127_is_visible,
> +	.read = max127_read,
> +	.write = max127_write,
> +};
> +
> +static const struct hwmon_channel_info *max127_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
> +	NULL,
> +};
> +
> +static const struct hwmon_chip_info max127_chip_info = {
> +	.ops = &max127_hwmon_ops,
> +	.info = max127_info,
> +};
> +
> +static int max127_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	int i;
> +	struct device *hwmon_dev;
> +	struct max127_data *data;
> +	struct device *dev = &client->dev;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->lock);
> +	for (i = 0; i < ARRAY_SIZE(data->ctrl_byte); i++)
> +		data->ctrl_byte[i] = (MAX127_CTRL_START |
> +				      MAX127_SET_CHANNEL(i));
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data,
> +							 &max127_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id max127_id[] = {
> +	{ "max127", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max127_id);
> +
> +static struct i2c_driver max127_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name	= "max127",
> +	},
> +	.probe		= max127_probe,
> +	.id_table	= max127_id,
> +};
> +
> +module_i2c_driver(max127_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Mike Choi <mikechoi@fb.com>");
> +MODULE_AUTHOR("Tao Ren <rentao.bupt@gmail.com>");
> +MODULE_DESCRIPTION("MAX127 Hardware Monitoring driver");
> -- 
> 2.17.1
> 
