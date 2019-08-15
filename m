Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E72298F4E0
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 21:41:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468cK66SjpzDqJc
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 05:41:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vXmEa2DY"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468cJQ2VpWzDr9L
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 05:41:08 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 129so1838559pfa.4
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 12:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=6D7B/ZT63OMrfAjYjjMuqz09mz7kuFuUTksfhFip4xY=;
 b=vXmEa2DYFFFgNFO96/91n84pZ+T5mWtq4NixZhP5DR14B7UzWynz7U/Kbg5UeypYlD
 PdHv4TPX64eLwyJn+EQpr0RjhUKedS9wj8WhhYyiCs3UREOtL8x+B6tychE8lDp+jKGv
 /yyf3NsrsjqGOmEWxMteakIHYZFKIIAIeLUH3ejWqtcbQJcYPlJm0o2EEY8MHRbAy6Qx
 au+TIrb7duPXc1vV9Pb7/9f0QUrdKIu4LfY7uRBdaKVgf98EGZcOolziqCvPRwHKLa43
 EZzURHglVsFDQB5BQR4Rmtc5CrjgLSJ1Tk3hGexADMaOWlFFOT0dsHjcMXnj+EA9I+7t
 QuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=6D7B/ZT63OMrfAjYjjMuqz09mz7kuFuUTksfhFip4xY=;
 b=gw4vSprvsC6F89cBjOT+akwCZ71girw4dJYLIQz0rMK+1q3BAYgo6Z2uxBXnwwnUFb
 ljTrWSk7J3U+f7EaH3rRsIsAXYHIbE+k6flsWn9awE7fysvDrc7oLVcIpXRodVvtgqxE
 BbL4ck0iH9UGred5R3sEBoayDE9LTdLK1D/B27sTJnuQzSyd4NjIrfz1GqQnrhGyieCn
 sL5Mpl35SdQ64EDVaImirZzjVPfb8h7qhMWR8OD+HXEJrbgWVKfqA2k9cTSzRSac83FX
 qWAZhmOqOkSDyV/zqbNmkV58qISt/W2YZqKZr7cOBEmL+7QYa0GNN3QSQ/VvVC4Oc0Fj
 9WdA==
X-Gm-Message-State: APjAAAVZrwZRDZ2PzEaR1KWLgrsPek5yIwJUqXxM+4oMZd+xgDYecoIt
 oICyMenMmhUYgNsWk0LMnhk=
X-Google-Smtp-Source: APXvYqyfFd25MwgsZC3klvzm7+UlWfmNmgTBmzSuLyH+EE81+5ZMC8vFRf8LTlqQOLZzcxFTkjXhcA==
X-Received: by 2002:a63:3ec7:: with SMTP id l190mr4867511pga.334.1565898064695; 
 Thu, 15 Aug 2019 12:41:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q69sm2627050pjb.0.2019.08.15.12.41.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 12:41:03 -0700 (PDT)
Date: Thu, 15 Aug 2019 12:41:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v4 2/2] hwmon: pmbus: Add Inspur Power System power
 supply driver
Message-ID: <20190815194102.GA11916@roeck-us.net>
References: <20190813083412.8668-1-wangzqbj@inspur.com>
 <70B3A211-2F43-4712-9B92-D407AA3C3934@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70B3A211-2F43-4712-9B92-D407AA3C3934@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "duanzhijia01@inspur.com" <duanzhijia01@inspur.com>,
 John Wang <wangzqbj@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 06:43:52PM +0000, Vijay Khemka wrote:
> 
> 
> ﻿On 8/13/19, 1:36 AM, "openbmc on behalf of John Wang" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of wangzqbj@inspur.com> wrote:
> 
>     Add the driver to monitor Inspur Power System power supplies
>     with hwmon over pmbus.
>     
>     This driver adds sysfs attributes for additional power supply data,
>     including vendor, model, part_number, serial number,
>     firmware revision, hardware revision, and psu mode(active/standby).
>     
>     Signed-off-by: John Wang <wangzqbj@inspur.com>
>     ---
>     v4:
>         - Remove the additional tabs in the Makefile
>         - Rebased on 5.3-rc4, not 5.2
>     v3:
>         - Sort kconfig/makefile entries alphabetically
>         - Remove unnecessary initialization
>         - Use ATTRIBUTE_GROUPS instead of expanding directly
>         - Use memscan to avoid reimplementation
>     v2:
>         - Fix typos in commit message
>         - Invert Christmas tree
>         - Configure device with sysfs attrs, not debugfs entries
>         - Fix errno in fw_version_read, ENODATA to EPROTO
>         - Change the print format of fw-version
>         - Use sysfs_streq instead of strcmp("xxx" "\n", "xxx")
>         - Document sysfs attributes
>     ---
>      Documentation/hwmon/inspur-ipsps1.rst |  79 +++++++++
>      drivers/hwmon/pmbus/Kconfig           |   9 +
>      drivers/hwmon/pmbus/Makefile          |   1 +
>      drivers/hwmon/pmbus/inspur-ipsps.c    | 226 ++++++++++++++++++++++++++
>      4 files changed, 315 insertions(+)
>      create mode 100644 Documentation/hwmon/inspur-ipsps1.rst
>      create mode 100644 drivers/hwmon/pmbus/inspur-ipsps.c
>     
>     diff --git a/Documentation/hwmon/inspur-ipsps1.rst b/Documentation/hwmon/inspur-ipsps1.rst
>     new file mode 100644
>     index 000000000000..aa19f0ccc8b0
>     --- /dev/null
>     +++ b/Documentation/hwmon/inspur-ipsps1.rst
>     @@ -0,0 +1,79 @@
>     +Kernel driver inspur-ipsps1
>     +=======================
>     +
>     +Supported chips:
>     +
>     +  * Inspur Power System power supply unit
>     +
>     +Author: John Wang <wangzqbj@inspur.com>
>     +
>     +Description
>     +-----------
>     +
>     +This driver supports Inspur Power System power supplies. This driver
>     +is a client to the core PMBus driver.
>     +
>     +Usage Notes
>     +-----------
>     +
>     +This driver does not auto-detect devices. You will have to instantiate the
>     +devices explicitly. Please see Documentation/i2c/instantiating-devices for
>     +details.
>     +
>     +Sysfs entries
>     +-------------
>     +
>     +The following attributes are supported:
>     +
>     +======================= ======================================================
>     +curr1_input             Measured input current
>     +curr1_label             "iin"
>     +curr1_max               Maximum current
>     +curr1_max_alarm         Current high alarm
>     +curr2_input		Measured output current in mA.
>     +curr2_label		"iout1"
>     +curr2_crit              Critical maximum current
>     +curr2_crit_alarm        Current critical high alarm
>     +curr2_max               Maximum current
>     +curr2_max_alarm         Current high alarm
>     +
> Please align above details.
>     +fan1_alarm		Fan 1 warning.
>     +fan1_fault		Fan 1 fault.
>     +fan1_input		Fan 1 speed in RPM.
>     +
>     +in1_alarm		Input voltage under-voltage alarm.
>     +in1_input		Measured input voltage in mV.
>     +in1_label		"vin"
>     +in2_input		Measured output voltage in mV.
>     +in2_label		"vout1"
>     +in2_lcrit               Critical minimum output voltage
>     +in2_lcrit_alarm         Output voltage critical low alarm
>     +in2_max                 Maximum output voltage
>     +in2_max_alarm           Output voltage high alarm
>     +in2_min                 Minimum output voltage
>     +in2_min_alarm           Output voltage low alarm
>     +
>     +power1_alarm		Input fault or alarm.
>     +power1_input		Measured input power in uW.
>     +power1_label		"pin"
>     +power1_max              Input power limit
>     +power2_max_alarm	Output power high alarm
>     +power2_max              Output power limit
>     +power2_input		Measured output power in uW.
>     +power2_label		"pout"
>     +
> Same alignment issue in description.
>     +temp[1-3]_input		Measured temperature
>     +temp[1-2]_max		Maximum temperature
>     +temp[1-3]_max_alarm	Temperature high alarm
>     +
>     +vendor                  Manufacturer name
>     +model                   Product model
>     +part_number             Product part number
>     +serial_number           Product serial number
>     +fw_version              Firmware version
>     +hw_version              Hardware version
>     +mode                    Work mode. Can be set to active or
>     +                        standby, when set to standby, PSU will
>     +                        automatically switch between standby
>     +                        and redundancy mode.
>     +======================= ======================================================
>     diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>     index b6588483fae1..d62d69bb7e49 100644
>     --- a/drivers/hwmon/pmbus/Kconfig
>     +++ b/drivers/hwmon/pmbus/Kconfig
>     @@ -46,6 +46,15 @@ config SENSORS_IBM_CFFPS
>      	  This driver can also be built as a module. If so, the module will
>      	  be called ibm-cffps.
>      
>     +config SENSORS_INSPUR_IPSPS
>     +	tristate "INSPUR Power System Power Supply"
>     +	help
>     +	  If you say yes here you get hardware monitoring support for the INSPUR
>     +	  Power System power supply.
>     +
>     +	  This driver can also be built as a module. If so, the module will
>     +	  be called inspur-ipsps.
>     +
>      config SENSORS_IR35221
>      	tristate "Infineon IR35221"
>      	help
>     diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
>     index c950ea9a5d00..03bacfcfd660 100644
>     --- a/drivers/hwmon/pmbus/Makefile
>     +++ b/drivers/hwmon/pmbus/Makefile
>     @@ -7,6 +7,7 @@ obj-$(CONFIG_PMBUS)		+= pmbus_core.o
>      obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
>      obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>      obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>     +obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
>      obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
>      obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
>      obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
>     diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
>     new file mode 100644
>     index 000000000000..fa981b881a60
>     --- /dev/null
>     +++ b/drivers/hwmon/pmbus/inspur-ipsps.c
>     @@ -0,0 +1,226 @@
>     +// SPDX-License-Identifier: GPL-2.0-or-later
>     +/*
>     + * Copyright 2019 Inspur Corp.
>     + */
>     +
>     +#include <linux/debugfs.h>
>     +#include <linux/device.h>
>     +#include <linux/fs.h>
>     +#include <linux/i2c.h>
>     +#include <linux/module.h>
>     +#include <linux/pmbus.h>
>     +#include <linux/hwmon-sysfs.h>
>     +
>     +#include "pmbus.h"
>     +
>     +#define IPSPS_REG_VENDOR_ID	0x99
>     +#define IPSPS_REG_MODEL		0x9A
>     +#define IPSPS_REG_FW_VERSION	0x9B
>     +#define IPSPS_REG_PN		0x9C
>     +#define IPSPS_REG_SN		0x9E
>     +#define IPSPS_REG_HW_VERSION	0xB0
>     +#define IPSPS_REG_MODE		0xFC
>     +
>     +#define MODE_ACTIVE		0x55
>     +#define MODE_STANDBY		0x0E
>     +#define MODE_REDUNDANCY		0x00
>     +
>     +#define MODE_ACTIVE_STRING		"active"
>     +#define MODE_STANDBY_STRING		"standby"
>     +#define MODE_REDUNDANCY_STRING		"redundancy"
>     +
>     +enum ipsps_index {
>     +	vendor,
>     +	model,
>     +	fw_version,
>     +	part_number,
>     +	serial_number,
>     +	hw_version,
>     +	mode,
>     +	num_regs,
>     +};
>     +
>     +static const u8 ipsps_regs[num_regs] = {
>     +	[vendor] = IPSPS_REG_VENDOR_ID,
>     +	[model] = IPSPS_REG_MODEL,
>     +	[fw_version] = IPSPS_REG_FW_VERSION,
>     +	[part_number] = IPSPS_REG_PN,
>     +	[serial_number] = IPSPS_REG_SN,
>     +	[hw_version] = IPSPS_REG_HW_VERSION,
>     +	[mode] = IPSPS_REG_MODE,
>     +};
>     +
>     +static ssize_t ipsps_string_show(struct device *dev,
>     +				 struct device_attribute *devattr,
>     +				 char *buf)
>     +{
>     +	u8 reg;
>     +	int rc;
>     +	char *p;
>     +	char data[I2C_SMBUS_BLOCK_MAX + 1];
>     +	struct i2c_client *client = to_i2c_client(dev->parent);
>     +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>     +
>     +	reg = ipsps_regs[attr->index];
>     +	rc = i2c_smbus_read_block_data(client, reg, data);
>     +	if (rc < 0)
>     +		return rc;
>     +
>     +	/* filled with printable characters, ending with # */
>     +	p = memscan(data, '#', rc);
>     +	*p = '\0';
>     +
>     +	return snprintf(buf, PAGE_SIZE, "%s\n", data);
>     +}
>     +
>     +static ssize_t ipsps_fw_version_show(struct device *dev,
>     +				     struct device_attribute *devattr,
>     +				     char *buf)
>     +{
>     +	u8 reg;
>     +	int rc;
>     +	u8 data[I2C_SMBUS_BLOCK_MAX] = { 0 };
>     +	struct i2c_client *client = to_i2c_client(dev->parent);
>     +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>     +
>     +	reg = ipsps_regs[attr->index];
>     +	rc = i2c_smbus_read_block_data(client, reg, data);
>     +	if (rc < 0)
>     +		return rc;
>     +
>     +	if (rc != 6)
>     +		return -EPROTO;
>     +
>     +	return snprintf(buf, PAGE_SIZE, "%u.%02u%u-%u.%02u\n",
>     +			data[1], data[2]/* < 100 */, data[3]/*< 10*/,
>     +			data[4], data[5]/* < 100 */);
>     +}
>     +
>     +static ssize_t ipsps_mode_show(struct device *dev,
>     +			       struct device_attribute *devattr, char *buf)
>     +{
>     +	u8 reg;
>     +	int rc;
>     +	struct i2c_client *client = to_i2c_client(dev->parent);
>     +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>     +
>     +	reg = ipsps_regs[attr->index];
>     +	rc = i2c_smbus_read_byte_data(client, reg);
>     +	if (rc < 0)
>     +		return rc;
>     +
>     +	switch (rc) {
>     +	case MODE_ACTIVE:
>     +		return snprintf(buf, PAGE_SIZE, "[%s] %s %s\n",
>     +				MODE_ACTIVE_STRING,
>     +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
>     +	case MODE_STANDBY:
>     +		return snprintf(buf, PAGE_SIZE, "%s [%s] %s\n",
>     +				MODE_ACTIVE_STRING,
>     +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
>     +	case MODE_REDUNDANCY:
>     +		return snprintf(buf, PAGE_SIZE, "%s %s [%s]\n",
>     +				MODE_ACTIVE_STRING,
>     +				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
>     +	default:
>     +		return snprintf(buf, PAGE_SIZE, "unspecified\n");
>     +	}
>     +}
>     +
>     +static ssize_t ipsps_mode_store(struct device *dev,
>     +				struct device_attribute *devattr,
>     +				const char *buf, size_t count)
>     +{
>     +	u8 reg;
>     +	int rc;
>     +	struct i2c_client *client = to_i2c_client(dev->parent);
>     +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>     +
>     +	reg = ipsps_regs[attr->index];
>     +	if (sysfs_streq(MODE_STANDBY_STRING, buf)) {
>     +		rc = i2c_smbus_write_byte_data(client, reg,
>     +					       MODE_STANDBY);
>     +		if (rc < 0)
>     +			return rc;
>     +		return count;
>     +	} else if (sysfs_streq(MODE_ACTIVE_STRING, buf)) {
>     +		rc = i2c_smbus_write_byte_data(client, reg,
>     +					       MODE_ACTIVE);
>     +		if (rc < 0)
>     +			return rc;
>     +		return count;
>     +	}
>     +
>     +	return -EINVAL;
>     +}
>     +
>     +static SENSOR_DEVICE_ATTR_RO(vendor, ipsps_string, vendor);
>     +static SENSOR_DEVICE_ATTR_RO(model, ipsps_string, model);
>     +static SENSOR_DEVICE_ATTR_RO(part_number, ipsps_string, part_number);
>     +static SENSOR_DEVICE_ATTR_RO(serial_number, ipsps_string, serial_number);
>     +static SENSOR_DEVICE_ATTR_RO(hw_version, ipsps_string, hw_version);
>     +static SENSOR_DEVICE_ATTR_RO(fw_version, ipsps_fw_version, fw_version);
>     +static SENSOR_DEVICE_ATTR_RW(mode, ipsps_mode, mode);
>     +
>     +static struct attribute *ipsps_attrs[] = {
>     +	&sensor_dev_attr_vendor.dev_attr.attr,
>     +	&sensor_dev_attr_model.dev_attr.attr,
>     +	&sensor_dev_attr_part_number.dev_attr.attr,
>     +	&sensor_dev_attr_serial_number.dev_attr.attr,
>     +	&sensor_dev_attr_hw_version.dev_attr.attr,
>     +	&sensor_dev_attr_fw_version.dev_attr.attr,
>     +	&sensor_dev_attr_mode.dev_attr.attr,
>     +	NULL,
>     +};
>     +
>     +ATTRIBUTE_GROUPS(ipsps);
>     +
>     +static struct pmbus_driver_info ipsps_info = {
>     +	.pages = 1,
>     +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
>     +		PMBUS_HAVE_IIN | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN |
>     +		PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
>     +		PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
>     +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
>     +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> This can be dynamic read by chip identify function

PMBUS_SKIP_STATUS_CHECK weakens auto-detetcion to some degree,
and auto-detection takes time since it needs to poll all registers
to determine if they exist. I don't mind if you insist, but I don't
immediately see the benefits.

>     +	.groups = ipsps_groups,
>     +};
>     +
>     +static struct pmbus_platform_data ipsps_pdata = {
>     +	.flags = PMBUS_SKIP_STATUS_CHECK,
>     +};
>     +
>     +static int ipsps_probe(struct i2c_client *client,
>     +		       const struct i2c_device_id *id)
>     +{
>     +	client->dev.platform_data = &ipsps_pdata;
> Allocate memory for this platform data inside tis function rather than having global variable.

Does that have any value other than consuming more memory
if there are multiple instances of the driver ?

>     +	return pmbus_do_probe(client, id, &ipsps_info);
>     +}
>     +
>     +static const struct i2c_device_id ipsps_id[] = {
>     +	{ "inspur_ipsps1", 0 },
>     +	{}
>     +};
>     +MODULE_DEVICE_TABLE(i2c, ipsps_id);
>     +
>     +static const struct of_device_id ipsps_of_match[] = {
>     +	{ .compatible = "inspur,ipsps1" },
>     +	{}
>     +};
>     +MODULE_DEVICE_TABLE(of, ipsps_of_match);
>     +
>     +static struct i2c_driver ipsps_driver = {
>     +	.driver = {
>     +		.name = "inspur-ipsps",
>     +		.of_match_table = ipsps_of_match,
>     +	},
>     +	.probe = ipsps_probe,
>     +	.remove = pmbus_do_remove,
>     +	.id_table = ipsps_id,
>     +};
>     +
>     +module_i2c_driver(ipsps_driver);
>     +
>     +MODULE_AUTHOR("John Wang");
>     +MODULE_DESCRIPTION("PMBus driver for Inspur Power System power supplies");
>     +MODULE_LICENSE("GPL");
>     -- 
>     2.17.1
>     
>     
> 
