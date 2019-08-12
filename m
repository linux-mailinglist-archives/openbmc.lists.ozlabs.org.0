Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CBC895FF
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 06:21:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466N3222F3zDqbC
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 14:21:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u4KkGzqg"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466N2L0VrRzDqSc
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 14:21:13 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id z14so11602115pga.5
 for <openbmc@lists.ozlabs.org>; Sun, 11 Aug 2019 21:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MGGPJYjfcAXoU9KMrbm+5PMCWpWcswKrF1ukpWqsIYE=;
 b=u4KkGzqgKb0nNg8xjvi0oU6MFbS5QHCWZ0vJKtG1Ja946XB5klU+SuoZkX8wKVuP7m
 GUuAZ75ViqyQcSdBusu3ncOvAUWuULSCJdlsKkrGjPHy91XizGW+YF8mR9MXKdAoHwC9
 1TOUskihaZ1DlnqUsJr1flz7NiSGnFURt2/XdBuFtVnVKv4epTADVfltpJ8EWHzj2lgr
 2OZjNZChqbrssl8/nECwYe7Olov4T1Eo3GOQTEkoymJVp/54o07LVdiXlfkUaJdEFKJu
 b+t6JyKUwiye9UBa3HyICPBx8lD9BBspe2Qs+5W7hgBL4ncyaP0R0eOFa5t5w2Dvv0SN
 1QHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGGPJYjfcAXoU9KMrbm+5PMCWpWcswKrF1ukpWqsIYE=;
 b=jddEmKbnGe0iykQfCdkwGRmtKLkf33KXwHa3R+QeuFoA5/HHYZ8+cwgEC1ITkOKRkv
 HEcV470+Ak4UyuAHDJK+2gn1yVPLB7T8J64r30q6gr9wRa5bdVKvRwU8xlLYy4JvEmkx
 FiZmEmhqVZ29H0OZT3db3Rd1GvrLHe+aVAhw6774FBiWKDGic2+X6HSuVxtE3DGxCvFM
 CsP1X/iMidhcrB8fxfx2mDm0e8LY1C4c9/w0whewV7awFzWlXGb8QfIJMwRv4m1o/vX6
 DmSXzC5VhHO0lgG9f3pQ5uWWTA2OOVvq7WuUwC8FIMsdQ9ZOT7k40EOlP9fCKua3lC8U
 9E0g==
X-Gm-Message-State: APjAAAUfLKubNd1zv61Xozwxcu0xp4WV2A2npEVjC/AzLvzaLoI+kJyR
 j2/nwDAskJOOK7nmLlvu9AomeBze
X-Google-Smtp-Source: APXvYqwGjwFtX4Z+7Z/BndwC+wlxK3IjTEoPgMuAchrNORXlqYSixFVvUHECfOgU3hCV4PXo94Wxjg==
X-Received: by 2002:a63:6947:: with SMTP id e68mr28941970pgc.60.1565583669754; 
 Sun, 11 Aug 2019 21:21:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v22sm101649916pgk.69.2019.08.11.21.21.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2019 21:21:08 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] hwmon: pmbus: Add Inspur Power System power supply
 driver
To: John Wang <wangzqbj@inspur.com>, jdelvare@suse.com, corbet@lwn.net,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, miltonm@us.ibm.com, mine260309@gmail.com,
 duanzhijia01@inspur.com, joel@jms.id.au, openbmc@lists.ozlabs.org
References: <20190812025309.15702-1-wangzqbj@inspur.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6cf699d9-6efb-f701-d5ab-6f624e515ab8@roeck-us.net>
Date: Sun, 11 Aug 2019 21:21:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812025309.15702-1-wangzqbj@inspur.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/11/19 7:53 PM, John Wang wrote:
> Add the driver to monitor Inspur Power System power supplies
> with hwmon over pmbus.
> 
> This driver adds sysfs attributes for additional power supply data,
> including vendor, model, part_number, serial number,
> firmware revision, hardware revision, and psu mode(active/standby).
> 
> Signed-off-by: John Wang <wangzqbj@inspur.com>
> ---
> v3:
>      - Sort kconfig/makefile entries alphabetically
>      - Remove unnecessary initialization
>      - Use ATTRIBUTE_GROUPS instead of expanding directly
>      - Use memscan to avoid reimplementation
> v2:
>      - Fix typos in commit message
>      - Invert Christmas tree
>      - Configure device with sysfs attrs, not debugfs entries
>      - Fix errno in fw_version_read, ENODATA to EPROTO
>      - Change the print format of fw-version
>      - Use sysfs_streq instead of strcmp("xxx" "\n", "xxx")
>      - Document sysfs attributes
> ---
>   Documentation/hwmon/inspur-ipsps1.rst |  79 +++++++++
>   drivers/hwmon/pmbus/Kconfig           |   9 +
>   drivers/hwmon/pmbus/Makefile          |  41 ++---
>   drivers/hwmon/pmbus/inspur-ipsps.c    | 226 ++++++++++++++++++++++++++
>   4 files changed, 335 insertions(+), 20 deletions(-)
>   create mode 100644 Documentation/hwmon/inspur-ipsps1.rst
>   create mode 100644 drivers/hwmon/pmbus/inspur-ipsps.c
> 
> diff --git a/Documentation/hwmon/inspur-ipsps1.rst b/Documentation/hwmon/inspur-ipsps1.rst
> new file mode 100644
> index 000000000000..aa19f0ccc8b0
> --- /dev/null
> +++ b/Documentation/hwmon/inspur-ipsps1.rst
> @@ -0,0 +1,79 @@
> +Kernel driver inspur-ipsps1
> +=======================
> +
> +Supported chips:
> +
> +  * Inspur Power System power supply unit
> +
> +Author: John Wang <wangzqbj@inspur.com>
> +
> +Description
> +-----------
> +
> +This driver supports Inspur Power System power supplies. This driver
> +is a client to the core PMBus driver.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices for
> +details.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported:
> +
> +======================= ======================================================
> +curr1_input             Measured input current
> +curr1_label             "iin"
> +curr1_max               Maximum current
> +curr1_max_alarm         Current high alarm
> +curr2_input		Measured output current in mA.
> +curr2_label		"iout1"
> +curr2_crit              Critical maximum current
> +curr2_crit_alarm        Current critical high alarm
> +curr2_max               Maximum current
> +curr2_max_alarm         Current high alarm
> +
> +fan1_alarm		Fan 1 warning.
> +fan1_fault		Fan 1 fault.
> +fan1_input		Fan 1 speed in RPM.
> +
> +in1_alarm		Input voltage under-voltage alarm.
> +in1_input		Measured input voltage in mV.
> +in1_label		"vin"
> +in2_input		Measured output voltage in mV.
> +in2_label		"vout1"
> +in2_lcrit               Critical minimum output voltage
> +in2_lcrit_alarm         Output voltage critical low alarm
> +in2_max                 Maximum output voltage
> +in2_max_alarm           Output voltage high alarm
> +in2_min                 Minimum output voltage
> +in2_min_alarm           Output voltage low alarm
> +
> +power1_alarm		Input fault or alarm.
> +power1_input		Measured input power in uW.
> +power1_label		"pin"
> +power1_max              Input power limit
> +power2_max_alarm	Output power high alarm
> +power2_max              Output power limit
> +power2_input		Measured output power in uW.
> +power2_label		"pout"
> +
> +temp[1-3]_input		Measured temperature
> +temp[1-2]_max		Maximum temperature
> +temp[1-3]_max_alarm	Temperature high alarm
> +
> +vendor                  Manufacturer name
> +model                   Product model
> +part_number             Product part number
> +serial_number           Product serial number
> +fw_version              Firmware version
> +hw_version              Hardware version
> +mode                    Work mode. Can be set to active or
> +                        standby, when set to standby, PSU will
> +                        automatically switch between standby
> +                        and redundancy mode.
> +======================= ======================================================
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 30751eb9550a..2370fce6e816 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -46,6 +46,15 @@ config SENSORS_IBM_CFFPS
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ibm-cffps.
>   
> +config SENSORS_INSPUR_IPSPS
> +	tristate "INSPUR Power System Power Supply"
> +	help
> +	  If you say yes here you get hardware monitoring support for the INSPUR
> +	  Power System power supply.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called inspur-ipsps.
> +
>   config SENSORS_IR35221
>   	tristate "Infineon IR35221"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 2219b9300316..c4f82f65f2ad 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -3,23 +3,24 @@
>   # Makefile for PMBus chip drivers.
>   #
>   
> -obj-$(CONFIG_PMBUS)		+= pmbus_core.o
> -obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
> -obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
> -obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
> -obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
> -obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
> -obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
> -obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
> -obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
> -obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
> -obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
> -obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
> -obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
> -obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
> -obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> -obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
> -obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> -obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
> -obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
> -obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> +obj-$(CONFIG_PMBUS)			+= pmbus_core.o
> +obj-$(CONFIG_SENSORS_PMBUS)		+= pmbus.o
> +obj-$(CONFIG_SENSORS_ADM1275)		+= adm1275.o
> +obj-$(CONFIG_SENSORS_IBM_CFFPS)		+= ibm-cffps.o
> +obj-$(CONFIG_SENSORS_INSPUR_IPSPS)	+= inspur-ipsps.o
> +obj-$(CONFIG_SENSORS_IR35221)		+= ir35221.o
> +obj-$(CONFIG_SENSORS_IR38064)		+= ir38064.o
> +obj-$(CONFIG_SENSORS_ISL68137)		+= isl68137.o
> +obj-$(CONFIG_SENSORS_LM25066)		+= lm25066.o
> +obj-$(CONFIG_SENSORS_LTC2978)		+= ltc2978.o
> +obj-$(CONFIG_SENSORS_LTC3815)		+= ltc3815.o
> +obj-$(CONFIG_SENSORS_MAX16064)		+= max16064.o
> +obj-$(CONFIG_SENSORS_MAX20751)		+= max20751.o
> +obj-$(CONFIG_SENSORS_MAX31785)		+= max31785.o
> +obj-$(CONFIG_SENSORS_MAX34440)		+= max34440.o
> +obj-$(CONFIG_SENSORS_MAX8688)		+= max8688.o
> +obj-$(CONFIG_SENSORS_TPS40422)		+= tps40422.o
> +obj-$(CONFIG_SENSORS_TPS53679)		+= tps53679.o
> +obj-$(CONFIG_SENSORS_UCD9000)		+= ucd9000.o
> +obj-$(CONFIG_SENSORS_UCD9200)		+= ucd9200.o
> +obj-$(CONFIG_SENSORS_ZL6100)		+= zl6100.o

Are you serious ? I am not going to accept this.

Guenter

> diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
> new file mode 100644
> index 000000000000..fa981b881a60
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/inspur-ipsps.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2019 Inspur Corp.
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/fs.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pmbus.h>
> +#include <linux/hwmon-sysfs.h>
> +
> +#include "pmbus.h"
> +
> +#define IPSPS_REG_VENDOR_ID	0x99
> +#define IPSPS_REG_MODEL		0x9A
> +#define IPSPS_REG_FW_VERSION	0x9B
> +#define IPSPS_REG_PN		0x9C
> +#define IPSPS_REG_SN		0x9E
> +#define IPSPS_REG_HW_VERSION	0xB0
> +#define IPSPS_REG_MODE		0xFC
> +
> +#define MODE_ACTIVE		0x55
> +#define MODE_STANDBY		0x0E
> +#define MODE_REDUNDANCY		0x00
> +
> +#define MODE_ACTIVE_STRING		"active"
> +#define MODE_STANDBY_STRING		"standby"
> +#define MODE_REDUNDANCY_STRING		"redundancy"
> +
> +enum ipsps_index {
> +	vendor,
> +	model,
> +	fw_version,
> +	part_number,
> +	serial_number,
> +	hw_version,
> +	mode,
> +	num_regs,
> +};
> +
> +static const u8 ipsps_regs[num_regs] = {
> +	[vendor] = IPSPS_REG_VENDOR_ID,
> +	[model] = IPSPS_REG_MODEL,
> +	[fw_version] = IPSPS_REG_FW_VERSION,
> +	[part_number] = IPSPS_REG_PN,
> +	[serial_number] = IPSPS_REG_SN,
> +	[hw_version] = IPSPS_REG_HW_VERSION,
> +	[mode] = IPSPS_REG_MODE,
> +};
> +
> +static ssize_t ipsps_string_show(struct device *dev,
> +				 struct device_attribute *devattr,
> +				 char *buf)
> +{
> +	u8 reg;
> +	int rc;
> +	char *p;
> +	char data[I2C_SMBUS_BLOCK_MAX + 1];
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +
> +	reg = ipsps_regs[attr->index];
> +	rc = i2c_smbus_read_block_data(client, reg, data);
> +	if (rc < 0)
> +		return rc;
> +
> +	/* filled with printable characters, ending with # */
> +	p = memscan(data, '#', rc);
> +	*p = '\0';
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", data);
> +}
> +
> +static ssize_t ipsps_fw_version_show(struct device *dev,
> +				     struct device_attribute *devattr,
> +				     char *buf)
> +{
> +	u8 reg;
> +	int rc;
> +	u8 data[I2C_SMBUS_BLOCK_MAX] = { 0 };
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +
> +	reg = ipsps_regs[attr->index];
> +	rc = i2c_smbus_read_block_data(client, reg, data);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (rc != 6)
> +		return -EPROTO;
> +
> +	return snprintf(buf, PAGE_SIZE, "%u.%02u%u-%u.%02u\n",
> +			data[1], data[2]/* < 100 */, data[3]/*< 10*/,
> +			data[4], data[5]/* < 100 */);
> +}
> +
> +static ssize_t ipsps_mode_show(struct device *dev,
> +			       struct device_attribute *devattr, char *buf)
> +{
> +	u8 reg;
> +	int rc;
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +
> +	reg = ipsps_regs[attr->index];
> +	rc = i2c_smbus_read_byte_data(client, reg);
> +	if (rc < 0)
> +		return rc;
> +
> +	switch (rc) {
> +	case MODE_ACTIVE:
> +		return snprintf(buf, PAGE_SIZE, "[%s] %s %s\n",
> +				MODE_ACTIVE_STRING,
> +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
> +	case MODE_STANDBY:
> +		return snprintf(buf, PAGE_SIZE, "%s [%s] %s\n",
> +				MODE_ACTIVE_STRING,
> +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
> +	case MODE_REDUNDANCY:
> +		return snprintf(buf, PAGE_SIZE, "%s %s [%s]\n",
> +				MODE_ACTIVE_STRING,
> +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
> +	default:
> +		return snprintf(buf, PAGE_SIZE, "unspecified\n");
> +	}
> +}
> +
> +static ssize_t ipsps_mode_store(struct device *dev,
> +				struct device_attribute *devattr,
> +				const char *buf, size_t count)
> +{
> +	u8 reg;
> +	int rc;
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +
> +	reg = ipsps_regs[attr->index];
> +	if (sysfs_streq(MODE_STANDBY_STRING, buf)) {
> +		rc = i2c_smbus_write_byte_data(client, reg,
> +					       MODE_STANDBY);
> +		if (rc < 0)
> +			return rc;
> +		return count;
> +	} else if (sysfs_streq(MODE_ACTIVE_STRING, buf)) {
> +		rc = i2c_smbus_write_byte_data(client, reg,
> +					       MODE_ACTIVE);
> +		if (rc < 0)
> +			return rc;
> +		return count;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static SENSOR_DEVICE_ATTR_RO(vendor, ipsps_string, vendor);
> +static SENSOR_DEVICE_ATTR_RO(model, ipsps_string, model);
> +static SENSOR_DEVICE_ATTR_RO(part_number, ipsps_string, part_number);
> +static SENSOR_DEVICE_ATTR_RO(serial_number, ipsps_string, serial_number);
> +static SENSOR_DEVICE_ATTR_RO(hw_version, ipsps_string, hw_version);
> +static SENSOR_DEVICE_ATTR_RO(fw_version, ipsps_fw_version, fw_version);
> +static SENSOR_DEVICE_ATTR_RW(mode, ipsps_mode, mode);
> +
> +static struct attribute *ipsps_attrs[] = {
> +	&sensor_dev_attr_vendor.dev_attr.attr,
> +	&sensor_dev_attr_model.dev_attr.attr,
> +	&sensor_dev_attr_part_number.dev_attr.attr,
> +	&sensor_dev_attr_serial_number.dev_attr.attr,
> +	&sensor_dev_attr_hw_version.dev_attr.attr,
> +	&sensor_dev_attr_fw_version.dev_attr.attr,
> +	&sensor_dev_attr_mode.dev_attr.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(ipsps);
> +
> +static struct pmbus_driver_info ipsps_info = {
> +	.pages = 1,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +		PMBUS_HAVE_IIN | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN |
> +		PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
> +		PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> +	.groups = ipsps_groups,
> +};
> +
> +static struct pmbus_platform_data ipsps_pdata = {
> +	.flags = PMBUS_SKIP_STATUS_CHECK,
> +};
> +
> +static int ipsps_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *id)
> +{
> +	client->dev.platform_data = &ipsps_pdata;
> +	return pmbus_do_probe(client, id, &ipsps_info);
> +}
> +
> +static const struct i2c_device_id ipsps_id[] = {
> +	{ "inspur_ipsps1", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, ipsps_id);
> +
> +static const struct of_device_id ipsps_of_match[] = {
> +	{ .compatible = "inspur,ipsps1" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ipsps_of_match);
> +
> +static struct i2c_driver ipsps_driver = {
> +	.driver = {
> +		.name = "inspur-ipsps",
> +		.of_match_table = ipsps_of_match,
> +	},
> +	.probe = ipsps_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = ipsps_id,
> +};
> +
> +module_i2c_driver(ipsps_driver);
> +
> +MODULE_AUTHOR("John Wang");
> +MODULE_DESCRIPTION("PMBus driver for Inspur Power System power supplies");
> +MODULE_LICENSE("GPL");
> 

