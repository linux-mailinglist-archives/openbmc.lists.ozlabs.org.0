Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5420C1901D5
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 00:26:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mVrh2RzlzDqvH
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 10:26:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=kunyi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mVp529FW; dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mVqx0NwWzDqnT
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 10:25:57 +1100 (AEDT)
Received: by mail-il1-x143.google.com with SMTP id a6so2663076ilr.4
 for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2020 16:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gh9vjwCy/n7eN7gQ+3EfFjdljWF4MHbtJSXf4X51/Mk=;
 b=mVp529FWKOATrbMF+7HQazoFSV8DrfiOgLLZ0GudwNuIOMxu9wgCidZRX5ytupBlHi
 +iWTvVEpRSvM9sf5KCy+ejgcg2Pb4aMQTSZQkxTHxDwUyTv9WNSzEfBFeJjqcSYzCZB2
 je85hcrUs/sDqq5hlWoThf1h1iZ3PZ3IfICqwP3xoiWC5X8tClIDZUuQIm1Huwri9+cP
 E72f0OMtUH1mfr+8jv/71CxYOH+SjyUhjtuU+jD6W1U0VSwDvHCZYJ1hDGb0mMO7nKDr
 D4bOiHyQsR1nLoHdez5KCtxDQCuqOswD7Te8VRb5EVOM7+ybc3iPmFMYu0d7+GY++PFu
 RwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gh9vjwCy/n7eN7gQ+3EfFjdljWF4MHbtJSXf4X51/Mk=;
 b=mQB5Rjql7XtKz7iJH4Ypv2RlF2eE1wpbakMl8kSoxe3O6F0QDaEuJ8ndr4EeHCrwef
 e046oPbH0y2kMlEm4/Soy/zhsfrndq7CkkMonZq2gvSvfBL7P5rccgbYLA96uNdtWBxk
 UMPdfn0yVAPKwvRkzM6n6dFvTph/suoOiuillN9ewZvnmVG965pWVGU6vXvPLY/4wP0A
 DFC6tocb6zIMQrhYn/YXn3ubbgM9ak+RBZ1QkWww8FOrZpNqA4/mN5wFxa1P8+5GsWBg
 /2ZOL9vzIF3d1LUHlxVvYHKjucN1Lhwzv7tKmOvv5Yv1mdTmGuWsRy2BP+W/f9AUFsK5
 NObg==
X-Gm-Message-State: ANhLgQ0omXbBr58RpNTrYMdlD4nmbUVNjOlLVKKutBuvepWD+20XOepx
 1YeUkSAYYfEFvtkX5Zks5CclTKBQsyWd9dfR6sipfA==
X-Google-Smtp-Source: ADFU+vuQF643mx42yg7Dif4Eg+OfFoR9j+RQNKH7PXwlKtXjgJRDp4CaT3IdnzCGtFb3ilzj6VJmt9vb0aSbtEx2g7M=
X-Received: by 2002:a92:5ccd:: with SMTP id d74mr22330140ilg.59.1585005953548; 
 Mon, 23 Mar 2020 16:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200319224812.202013-1-kunyi@google.com>
 <20200319224812.202013-2-kunyi@google.com>
 <476e9c68-4532-ec07-8244-5a8aa2fbc599@roeck-us.net>
In-Reply-To: <476e9c68-4532-ec07-8244-5a8aa2fbc599@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Mon, 23 Mar 2020 16:25:25 -0700
Message-ID: <CAGMNF6V90KtzMXCvVk-BjRRqfR4Znfy-yPs-Ww4H_KFWuY1-vA@mail.gmail.com>
Subject: Re: [PATCH linux hwmon-next v1 1/3] hwmon: (sbtsi) Add basic support
 for SB-TSI sensors
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the review comments!

On Thu, Mar 19, 2020 at 4:31 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 3/19/20 3:48 PM, Kun Yi wrote:
> > SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> > interface that reports AMD SoC's Ttcl (normalized temperature),
> > and resembles a typical 8-pin remote temperature sensor's I2C interface
> > to BMC.
> >
> > This commit adds basic support using this interface to read CPU
> > temperature, and read/write high/low CPU temp thresholds.
> >
> > Test status: tested reading temp1_input, and reading/writing
> > temp1_max/min.
> >
>
> How do I instantiate this driver on a system with an AMD CPU
> (in other words, what is the i2c bus and the i2c address) ?

The i2c bus number would be the bus connected from BMC to the AMD CPU.
The i2c address is specified in the spec:
Section 6.3.1: The SB-TSI address is normally 98h for socket 0 and 90h
for socket 1, but it could vary based on hardware address select pins.

I will add this information to v2 commit message and the Documentation.

>
> > Signed-off-by: Kun Yi <kunyi@google.com>
> > ---
> >  drivers/hwmon/Kconfig      |  10 ++
> >  drivers/hwmon/Makefile     |   1 +
> >  drivers/hwmon/sbtsi_temp.c | 218 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 229 insertions(+)
> >  create mode 100644 drivers/hwmon/sbtsi_temp.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 05a30832c6ba..9585dcd01d1b 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1412,6 +1412,16 @@ config SENSORS_RASPBERRYPI_HWMON
> >         This driver can also be built as a module. If so, the module
> >         will be called raspberrypi-hwmon.
> >
> > +config SENSORS_SBTSI
> > +     tristate "Emulated SB-TSI temperature sensor"
> > +     depends on I2C
> > +     help
> > +       If you say yes here you get support for emulated temperature
> > +       sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
> > +
> > +       This driver can also be built as a module. If so, the module will
> > +       be called sbtsi_temp.
> > +
> >  config SENSORS_SHT15
> >       tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
> >       depends on GPIOLIB || COMPILE_TEST
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index b0b9c8e57176..cd109f003ce4 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -152,6 +152,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
> >  obj-$(CONFIG_SENSORS_PWM_FAN)        += pwm-fan.o
> >  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)      += raspberrypi-hwmon.o
> >  obj-$(CONFIG_SENSORS_S3C)    += s3c-hwmon.o
> > +obj-$(CONFIG_SENSORS_SBTSI)  += sbtsi_temp.o
> >  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
> >  obj-$(CONFIG_SENSORS_SCH5627)        += sch5627.o
> >  obj-$(CONFIG_SENSORS_SCH5636)        += sch5636.o
> > diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> > new file mode 100644
> > index 000000000000..f998d944a515
> > --- /dev/null
> > +++ b/drivers/hwmon/sbtsi_temp.c
> > @@ -0,0 +1,218 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
> > + *                compliant AMD SoC temperature device.
> > + *
> > + * Copyright (c) 2020, Google Inc.
> > + * Copyright (c) 2020, Kun Yi <kunyi@google.com>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +
> > +/*
> > + * SB-TSI registers only support SMBus byte data access. "_INT" registers are
> > + * the integer part of a temperature value or limit, and "_DEC" registers are
> > + * corresponding decimal parts.
> > + */
> > +#define SBTSI_REG_TEMP_INT           0x01 /* RO */
> > +#define SBTSI_REG_STATUS             0x02 /* RO */
> > +#define SBTSI_REG_CONFIG             0x03 /* RO */
> > +#define SBTSI_REG_TEMP_HIGH_INT              0x07 /* RW */
> > +#define SBTSI_REG_TEMP_LOW_INT               0x08 /* RW */
> > +#define SBTSI_REG_TEMP_DEC           0x10 /* RW */
> > +#define SBTSI_REG_TEMP_HIGH_DEC              0x13 /* RW */
> > +#define SBTSI_REG_TEMP_LOW_DEC               0x14 /* RW */
> > +#define SBTSI_REG_REV                        0xFF /* RO */
> > +
> > +#define SBTSI_CONFIG_READ_ORDER_SHIFT        5
> > +
> > +#define SBTSI_TEMP_MIN       (0)
> > +#define SBTSI_TEMP_MAX       (255875)
> > +#define SBTSI_REV_MAX_VALID_ID       (4)
>
> Unnecessary ( ) around literals.

Will fix in v2.

>
> > +
> > +struct sbtsi_data {
> > +     struct device *dev;
> > +     struct i2c_client *client;
> > +     struct mutex lock;
> > +};
> > +
> > +/*
> > + * From SB-TSI spec: CPU temperature readings and limit registers encode the
> > + * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
> > + * register encodes the base-2 of the integer portion, and the upper 3 bits of
> > + * the "low byte" encode in base-2 the decimal portion.
> > + *
> > + * e.g. INT=0x19, DEC=0x20 represents 25.125 degrees Celsius
> > + *
> > + * Therefore temperature in millidegree Celsius =
> > + *   (INT + DEC / 256) * 1000 = (INT * 8 + DEC / 32) * 125
> > + */
> > +static inline int SBTSI_REGS_TO_TEMP(s32 integer, s32 decimal)
> > +{
> > +     return (((u32)integer << 3) + ((u32)decimal >> 5)) * 125;
>
> Why pass s32 as parameter just to typecast to u32 ? The values
> are known to be between 0 and 255, and thus will never be negative,
> even with s32, so this is really unnecessary.

That's a good point, will fix in v2.

> > +}
> > +
> > +/*
> > + * Inversely, given temperature in millidegree Celsius
> > + *   INT = (TEMP / 125) / 8
> > + *   DEC = ((TEMP / 125) % 8) * 32
> > + * Caller have to make sure temp doesn't exceed 255875, the max valid value.
> > + */
> > +static inline void SBTSI_TEMP_TO_REGS(u32 temp, u8 *integer, u8 *decimal)
> > +{
> > +     temp /= 125;
> > +     *integer = temp >> 3;
> > +     *decimal = (temp & 0x7) << 5;
> > +}
> > +
> > +static ssize_t sbtsi_show_temp(struct device *dev,
> > +                            struct device_attribute *attr, char *buf)
> > +{
> > +     struct sbtsi_data *data = dev_get_drvdata(dev);
> > +     struct i2c_client *client = data->client;
> > +     s32 err, temp_int, temp_dec;
> > +     u8 read_order;
> > +
> > +     /*
> > +      * ReadOrder bit specifies the reading order of integer and decimal
> > +      * part of CPU temp for atomic reads. If bit == 0, reading integer part
> > +      * triggers latching of the decimal part, so integer part should be read
> > +      * first. If bit == 1, read order should be reversed.
> > +      */
> > +     err = i2c_smbus_read_byte_data(client, SBTSI_REG_CONFIG);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     read_order = (u8)err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT);
> > +
> > +     if (read_order == 0) {
> > +             temp_int = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_INT);
> > +             temp_dec = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_DEC);
> > +     } else {
> > +             temp_dec = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_DEC);
> > +             temp_int = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_INT);
> > +     }
> > +
> > +     if (temp_int < 0)
> > +             return temp_int;
> > +     if (temp_dec < 0)
> > +             return temp_dec;
> > +
> > +     return scnprintf(buf, PAGE_SIZE, "%d\n",
> > +                      SBTSI_REGS_TO_TEMP(temp_int, temp_dec));
> > +}
> > +
> > +#define sbtsi_show_temp_limit(name, REG) \
> > +static ssize_t sbtsi_show_##name(struct device *dev, \
> > +                              struct device_attribute *attr, char *buf) \
> > +{ \
> > +     struct sbtsi_data *data = dev_get_drvdata(dev); \
> > +     struct i2c_client *client = data->client; \
> > +     s32 temp_int, temp_dec; \
> > +\
> > +     temp_int = i2c_smbus_read_byte_data(client, REG##_INT); \
> > +     temp_dec = i2c_smbus_read_byte_data(client, REG##_DEC); \
> > +\
> > +     if (temp_int < 0) \
> > +             return temp_int; \
> > +     if (temp_dec < 0) \
> > +             return temp_dec; \
> > +\
> > +     return scnprintf(buf, PAGE_SIZE, "%d\n", \
> > +                      SBTSI_REGS_TO_TEMP(temp_int, temp_dec)); \
> > +}
> > +
> > +sbtsi_show_temp_limit(temp1_min, SBTSI_REG_TEMP_LOW);
> > +sbtsi_show_temp_limit(temp1_max, SBTSI_REG_TEMP_HIGH);
> > +
> > +#define sbtsi_set_temp_limit(name, REG) \
> > +static ssize_t sbtsi_set_##name(struct device *dev, \
> > +                             struct device_attribute *attr, \
> > +                             const char *buf, size_t count) \
> > +{ \
> > +     struct sbtsi_data *data = dev_get_drvdata(dev); \
> > +     struct i2c_client *client = data->client; \
> > +     long val; \
> > +     u8 temp_int, temp_dec; \
> > +     int err = kstrtol(buf, 10, &val); \
> > +     if (err) \
> > +             return err; \
> > +\
> > +     val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX); \
> > +     mutex_lock(&data->lock); \
> > +     SBTSI_TEMP_TO_REGS(val, &temp_int, &temp_dec); \
> > +     i2c_smbus_write_byte_data(client, REG##_INT, temp_int); \
> > +     i2c_smbus_write_byte_data(client, REG##_DEC, temp_dec); \
> > +     mutex_unlock(&data->lock); \
> > +\
> > +     return count; \
> > +}
> > +
> > +sbtsi_set_temp_limit(temp1_min, SBTSI_REG_TEMP_LOW);
> > +sbtsi_set_temp_limit(temp1_max, SBTSI_REG_TEMP_HIGH);
> > +
> > +static SENSOR_DEVICE_ATTR(temp1_input, 0444, sbtsi_show_temp, NULL, 0);
> > +static SENSOR_DEVICE_ATTR(temp1_min, 0644, sbtsi_show_temp1_min,
> > +                       sbtsi_set_temp1_min, 1);
> > +static SENSOR_DEVICE_ATTR(temp1_max, 0644, sbtsi_show_temp1_max,
> > +                       sbtsi_set_temp1_max, 2);
> > +
> > +static struct attribute *sbtsi_attrs[] = {
> > +     &sensor_dev_attr_temp1_input.dev_attr.attr,
> > +     &sensor_dev_attr_temp1_min.dev_attr.attr,
> > +     &sensor_dev_attr_temp1_max.dev_attr.attr,
> > +     NULL,
> > +};
> > +ATTRIBUTE_GROUPS(sbtsi);
> > +
> > +static int sbtsi_probe(struct i2c_client *client,
> > +                    const struct i2c_device_id *id)
> > +{
> > +     struct device *dev = &client->dev;
> > +     struct device *hwmon_dev;
> > +     struct sbtsi_data *data;
> > +
> > +     data = devm_kzalloc(dev, sizeof(struct sbtsi_data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->client = client;
> > +     mutex_init(&data->lock);
> > +
> > +     hwmon_dev =
> > +             devm_hwmon_device_register_with_groups(dev, client->name, data,
> > +                                                    sbtsi_groups);
>
> Please rewrite to use the devm_hwmon_device_register_with_info() API.

Done in v2.

>
> > +     if (IS_ERR(hwmon_dev))
> > +             return PTR_ERR(hwmon_dev);
> > +
> > +     dev_info(dev, "sensor '%s'\n", client->name);
>
> Is that really valuable / necessary ?

Removed in v2.

>
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct i2c_device_id sbtsi_id[] = {
> > +     {"sbtsi", 0},
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, sbtsi_id);
> > +
> > +static struct i2c_driver sbtsi_driver = {
> > +     .class = I2C_CLASS_HWMON,
> > +     .driver = {
> > +             .name = "sbtsi",
> > +     },
> > +     .probe = sbtsi_probe,
> > +     .id_table = sbtsi_id,
> > +};
> > +
> > +module_i2c_driver(sbtsi_driver);
> > +
> > +MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
> > +MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
> > +MODULE_LICENSE("GPL");
> >
>


--
Regards,
Kun
