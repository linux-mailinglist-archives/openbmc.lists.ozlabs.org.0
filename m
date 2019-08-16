Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8733C8F93D
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 04:51:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468nrv5WZ8zDrCX
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 12:51:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.146; helo=unicom146.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468nrJ3wsbzDrBs
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 12:50:45 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id HKO06432
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 10:50:32 +0800
Received: from mail-lj1-f180.google.com (10.100.1.52) by
 Jtjnmail201618.home.langchao.com (10.100.2.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 16 Aug 2019 10:50:30 +0800
Received: by mail-lj1-f180.google.com with SMTP id z17so4015327ljz.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 19:50:30 -0700 (PDT)
X-Gm-Message-State: APjAAAUp9bVEaDA1ILqm+CvESIZCDW0Law0em6DyeW1fBqp2V7I96e6O
 UYxtmDzWJTzJ7i7CbUVGmFMEXY6PEKw+Ep4J2Qw=
X-Google-Smtp-Source: APXvYqxSWiJDERvVoTAtH91sQYbsKKk4QEHGOBfMSbn2rJjFA6cLsQCjQvrGUzDr7si8huakU4rVdMPQIp7MY3kFllg=
X-Received: by 2002:a05:651c:1023:: with SMTP id
 w3mr3999143ljm.94.1565923454177; 
 Thu, 15 Aug 2019 19:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190813083412.8668-1-wangzqbj@inspur.com>
 <70B3A211-2F43-4712-9B92-D407AA3C3934@fb.com>
 <20190815194102.GA11916@roeck-us.net>
In-Reply-To: <20190815194102.GA11916@roeck-us.net>
From: John Wang <wangzqbj@inspur.com>
Date: Fri, 16 Aug 2019 10:44:01 +0800
X-Gmail-Original-Message-ID: <CAHkHK08ZkZDoVQ0qfLPcO=_=-OAmx+N5BGHRgZkoxLUNQzTp5g@mail.gmail.com>
Message-ID: <CAHkHK08ZkZDoVQ0qfLPcO=_=-OAmx+N5BGHRgZkoxLUNQzTp5g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: pmbus: Add Inspur Power System power supply
 driver
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201605.home.langchao.com (10.100.2.5) To
 Jtjnmail201618.home.langchao.com (10.100.2.18)
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
 "jdelvare@suse.com" <jdelvare@suse.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "duanzhijia01@inspur.com" <duanzhijia01@inspur.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 3:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Aug 15, 2019 at 06:43:52PM +0000, Vijay Khemka wrote:
> >
> >
> > =EF=BB=BFOn 8/13/19, 1:36 AM, "openbmc on behalf of John Wang" <openbmc=
-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of wangzqbj@inspur=
.com> wrote:
> >
> >     Add the driver to monitor Inspur Power System power supplies
> >     with hwmon over pmbus.
> >
> >     This driver adds sysfs attributes for additional power supply data,
> >     including vendor, model, part_number, serial number,
> >     firmware revision, hardware revision, and psu mode(active/standby).
> >
> >     Signed-off-by: John Wang <wangzqbj@inspur.com>
> >     ---
> >     v4:
> >         - Remove the additional tabs in the Makefile
> >         - Rebased on 5.3-rc4, not 5.2
> >     v3:
> >         - Sort kconfig/makefile entries alphabetically
> >         - Remove unnecessary initialization
> >         - Use ATTRIBUTE_GROUPS instead of expanding directly
> >         - Use memscan to avoid reimplementation
> >     v2:
> >         - Fix typos in commit message
> >         - Invert Christmas tree
> >         - Configure device with sysfs attrs, not debugfs entries
> >         - Fix errno in fw_version_read, ENODATA to EPROTO
> >         - Change the print format of fw-version
> >         - Use sysfs_streq instead of strcmp("xxx" "\n", "xxx")
> >         - Document sysfs attributes
> >     ---
> >      Documentation/hwmon/inspur-ipsps1.rst |  79 +++++++++
> >      drivers/hwmon/pmbus/Kconfig           |   9 +
> >      drivers/hwmon/pmbus/Makefile          |   1 +
> >      drivers/hwmon/pmbus/inspur-ipsps.c    | 226 ++++++++++++++++++++++=
++++
> >      4 files changed, 315 insertions(+)
> >      create mode 100644 Documentation/hwmon/inspur-ipsps1.rst
> >      create mode 100644 drivers/hwmon/pmbus/inspur-ipsps.c
> >
> >     diff --git a/Documentation/hwmon/inspur-ipsps1.rst b/Documentation/=
hwmon/inspur-ipsps1.rst
> >     new file mode 100644
> >     index 000000000000..aa19f0ccc8b0
> >     --- /dev/null
> >     +++ b/Documentation/hwmon/inspur-ipsps1.rst
> >     @@ -0,0 +1,79 @@
> >     +Kernel driver inspur-ipsps1
> >     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >     +
> >     +Supported chips:
> >     +
> >     +  * Inspur Power System power supply unit
> >     +
> >     +Author: John Wang <wangzqbj@inspur.com>
> >     +
> >     +Description
> >     +-----------
> >     +
> >     +This driver supports Inspur Power System power supplies. This driv=
er
> >     +is a client to the core PMBus driver.
> >     +
> >     +Usage Notes
> >     +-----------
> >     +
> >     +This driver does not auto-detect devices. You will have to instant=
iate the
> >     +devices explicitly. Please see Documentation/i2c/instantiating-dev=
ices for
> >     +details.
> >     +
> >     +Sysfs entries
> >     +-------------
> >     +
> >     +The following attributes are supported:
> >     +
> >     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >     +curr1_input             Measured input current
> >     +curr1_label             "iin"
> >     +curr1_max               Maximum current
> >     +curr1_max_alarm         Current high alarm
> >     +curr2_input              Measured output current in mA.
> >     +curr2_label              "iout1"
> >     +curr2_crit              Critical maximum current
> >     +curr2_crit_alarm        Current critical high alarm
> >     +curr2_max               Maximum current
> >     +curr2_max_alarm         Current high alarm
> >     +
> > Please align above details.

Sorry for the mix of table and space

> >     +fan1_alarm               Fan 1 warning.
> >     +fan1_fault               Fan 1 fault.
> >     +fan1_input               Fan 1 speed in RPM.
> >     +
> >     +in1_alarm                Input voltage under-voltage alarm.
> >     +in1_input                Measured input voltage in mV.
> >     +in1_label                "vin"
> >     +in2_input                Measured output voltage in mV.
> >     +in2_label                "vout1"
> >     +in2_lcrit               Critical minimum output voltage
> >     +in2_lcrit_alarm         Output voltage critical low alarm
> >     +in2_max                 Maximum output voltage
> >     +in2_max_alarm           Output voltage high alarm
> >     +in2_min                 Minimum output voltage
> >     +in2_min_alarm           Output voltage low alarm
> >     +
> >     +power1_alarm             Input fault or alarm.
> >     +power1_input             Measured input power in uW.
> >     +power1_label             "pin"
> >     +power1_max              Input power limit
> >     +power2_max_alarm Output power high alarm
> >     +power2_max              Output power limit
> >     +power2_input             Measured output power in uW.
> >     +power2_label             "pout"
> >     +
> > Same alignment issue in description.

will fix.

> >     +temp[1-3]_input          Measured temperature
> >     +temp[1-2]_max            Maximum temperature
> >     +temp[1-3]_max_alarm      Temperature high alarm
> >     +
> >     +vendor                  Manufacturer name
> >     +model                   Product model
> >     +part_number             Product part number
> >     +serial_number           Product serial number
> >     +fw_version              Firmware version
> >     +hw_version              Hardware version
> >     +mode                    Work mode. Can be set to active or
> >     +                        standby, when set to standby, PSU will
> >     +                        automatically switch between standby
> >     +                        and redundancy mode.
> >     +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >     diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kcon=
fig
> >     index b6588483fae1..d62d69bb7e49 100644
> >     --- a/drivers/hwmon/pmbus/Kconfig
> >     +++ b/drivers/hwmon/pmbus/Kconfig
> >     @@ -46,6 +46,15 @@ config SENSORS_IBM_CFFPS
> >         This driver can also be built as a module. If so, the module wi=
ll
> >         be called ibm-cffps.
> >
> >     +config SENSORS_INSPUR_IPSPS
> >     + tristate "INSPUR Power System Power Supply"
> >     + help
> >     +   If you say yes here you get hardware monitoring support for the=
 INSPUR
> >     +   Power System power supply.
> >     +
> >     +   This driver can also be built as a module. If so, the module wi=
ll
> >     +   be called inspur-ipsps.
> >     +
> >      config SENSORS_IR35221
> >       tristate "Infineon IR35221"
> >       help
> >     diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Mak=
efile
> >     index c950ea9a5d00..03bacfcfd660 100644
> >     --- a/drivers/hwmon/pmbus/Makefile
> >     +++ b/drivers/hwmon/pmbus/Makefile
> >     @@ -7,6 +7,7 @@ obj-$(CONFIG_PMBUS)               +=3D pmbus_core.o
> >      obj-$(CONFIG_SENSORS_PMBUS)      +=3D pmbus.o
> >      obj-$(CONFIG_SENSORS_ADM1275)    +=3D adm1275.o
> >      obj-$(CONFIG_SENSORS_IBM_CFFPS)  +=3D ibm-cffps.o
> >     +obj-$(CONFIG_SENSORS_INSPUR_IPSPS) +=3D inspur-ipsps.o
> >      obj-$(CONFIG_SENSORS_IR35221)    +=3D ir35221.o
> >      obj-$(CONFIG_SENSORS_IR38064)    +=3D ir38064.o
> >      obj-$(CONFIG_SENSORS_IRPS5401)   +=3D irps5401.o
> >     diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmb=
us/inspur-ipsps.c
> >     new file mode 100644
> >     index 000000000000..fa981b881a60
> >     --- /dev/null
> >     +++ b/drivers/hwmon/pmbus/inspur-ipsps.c
> >     @@ -0,0 +1,226 @@
> >     +// SPDX-License-Identifier: GPL-2.0-or-later
> >     +/*
> >     + * Copyright 2019 Inspur Corp.
> >     + */
> >     +
> >     +#include <linux/debugfs.h>
> >     +#include <linux/device.h>
> >     +#include <linux/fs.h>
> >     +#include <linux/i2c.h>
> >     +#include <linux/module.h>
> >     +#include <linux/pmbus.h>
> >     +#include <linux/hwmon-sysfs.h>
> >     +
> >     +#include "pmbus.h"
> >     +
> >     +#define IPSPS_REG_VENDOR_ID      0x99
> >     +#define IPSPS_REG_MODEL          0x9A
> >     +#define IPSPS_REG_FW_VERSION     0x9B
> >     +#define IPSPS_REG_PN             0x9C
> >     +#define IPSPS_REG_SN             0x9E
> >     +#define IPSPS_REG_HW_VERSION     0xB0
> >     +#define IPSPS_REG_MODE           0xFC
> >     +
> >     +#define MODE_ACTIVE              0x55
> >     +#define MODE_STANDBY             0x0E
> >     +#define MODE_REDUNDANCY          0x00
> >     +
> >     +#define MODE_ACTIVE_STRING               "active"
> >     +#define MODE_STANDBY_STRING              "standby"
> >     +#define MODE_REDUNDANCY_STRING           "redundancy"
> >     +
> >     +enum ipsps_index {
> >     + vendor,
> >     + model,
> >     + fw_version,
> >     + part_number,
> >     + serial_number,
> >     + hw_version,
> >     + mode,
> >     + num_regs,
> >     +};
> >     +
> >     +static const u8 ipsps_regs[num_regs] =3D {
> >     + [vendor] =3D IPSPS_REG_VENDOR_ID,
> >     + [model] =3D IPSPS_REG_MODEL,
> >     + [fw_version] =3D IPSPS_REG_FW_VERSION,
> >     + [part_number] =3D IPSPS_REG_PN,
> >     + [serial_number] =3D IPSPS_REG_SN,
> >     + [hw_version] =3D IPSPS_REG_HW_VERSION,
> >     + [mode] =3D IPSPS_REG_MODE,
> >     +};
> >     +
> >     +static ssize_t ipsps_string_show(struct device *dev,
> >     +                          struct device_attribute *devattr,
> >     +                          char *buf)
> >     +{
> >     + u8 reg;
> >     + int rc;
> >     + char *p;
> >     + char data[I2C_SMBUS_BLOCK_MAX + 1];
> >     + struct i2c_client *client =3D to_i2c_client(dev->parent);
> >     + struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devat=
tr);
> >     +
> >     + reg =3D ipsps_regs[attr->index];
> >     + rc =3D i2c_smbus_read_block_data(client, reg, data);
> >     + if (rc < 0)
> >     +         return rc;
> >     +
> >     + /* filled with printable characters, ending with # */
> >     + p =3D memscan(data, '#', rc);
> >     + *p =3D '\0';
> >     +
> >     + return snprintf(buf, PAGE_SIZE, "%s\n", data);
> >     +}
> >     +
> >     +static ssize_t ipsps_fw_version_show(struct device *dev,
> >     +                              struct device_attribute *devattr,
> >     +                              char *buf)
> >     +{
> >     + u8 reg;
> >     + int rc;
> >     + u8 data[I2C_SMBUS_BLOCK_MAX] =3D { 0 };
> >     + struct i2c_client *client =3D to_i2c_client(dev->parent);
> >     + struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devat=
tr);
> >     +
> >     + reg =3D ipsps_regs[attr->index];
> >     + rc =3D i2c_smbus_read_block_data(client, reg, data);
> >     + if (rc < 0)
> >     +         return rc;
> >     +
> >     + if (rc !=3D 6)
> >     +         return -EPROTO;
> >     +
> >     + return snprintf(buf, PAGE_SIZE, "%u.%02u%u-%u.%02u\n",
> >     +                 data[1], data[2]/* < 100 */, data[3]/*< 10*/,
> >     +                 data[4], data[5]/* < 100 */);
> >     +}
> >     +
> >     +static ssize_t ipsps_mode_show(struct device *dev,
> >     +                        struct device_attribute *devattr, char *bu=
f)
> >     +{
> >     + u8 reg;
> >     + int rc;
> >     + struct i2c_client *client =3D to_i2c_client(dev->parent);
> >     + struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devat=
tr);
> >     +
> >     + reg =3D ipsps_regs[attr->index];
> >     + rc =3D i2c_smbus_read_byte_data(client, reg);
> >     + if (rc < 0)
> >     +         return rc;
> >     +
> >     + switch (rc) {
> >     + case MODE_ACTIVE:
> >     +         return snprintf(buf, PAGE_SIZE, "[%s] %s %s\n",
> >     +                         MODE_ACTIVE_STRING,
> >     +                         MODE_STANDBY_STRING, MODE_REDUNDANCY_STRI=
NG);
> >     + case MODE_STANDBY:
> >     +         return snprintf(buf, PAGE_SIZE, "%s [%s] %s\n",
> >     +                         MODE_ACTIVE_STRING,
> >     +                         MODE_STANDBY_STRING, MODE_REDUNDANCY_STRI=
NG);
> >     + case MODE_REDUNDANCY:
> >     +         return snprintf(buf, PAGE_SIZE, "%s %s [%s]\n",
> >     +                         MODE_ACTIVE_STRING,
> >     +                         MODE_STANDBY_STRING, MODE_REDUNDANCY_STRI=
NG);
> >     + default:
> >     +         return snprintf(buf, PAGE_SIZE, "unspecified\n");
> >     + }
> >     +}
> >     +
> >     +static ssize_t ipsps_mode_store(struct device *dev,
> >     +                         struct device_attribute *devattr,
> >     +                         const char *buf, size_t count)
> >     +{
> >     + u8 reg;
> >     + int rc;
> >     + struct i2c_client *client =3D to_i2c_client(dev->parent);
> >     + struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devat=
tr);
> >     +
> >     + reg =3D ipsps_regs[attr->index];
> >     + if (sysfs_streq(MODE_STANDBY_STRING, buf)) {
> >     +         rc =3D i2c_smbus_write_byte_data(client, reg,
> >     +                                        MODE_STANDBY);
> >     +         if (rc < 0)
> >     +                 return rc;
> >     +         return count;
> >     + } else if (sysfs_streq(MODE_ACTIVE_STRING, buf)) {
> >     +         rc =3D i2c_smbus_write_byte_data(client, reg,
> >     +                                        MODE_ACTIVE);
> >     +         if (rc < 0)
> >     +                 return rc;
> >     +         return count;
> >     + }
> >     +
> >     + return -EINVAL;
> >     +}
> >     +
> >     +static SENSOR_DEVICE_ATTR_RO(vendor, ipsps_string, vendor);
> >     +static SENSOR_DEVICE_ATTR_RO(model, ipsps_string, model);
> >     +static SENSOR_DEVICE_ATTR_RO(part_number, ipsps_string, part_numbe=
r);
> >     +static SENSOR_DEVICE_ATTR_RO(serial_number, ipsps_string, serial_n=
umber);
> >     +static SENSOR_DEVICE_ATTR_RO(hw_version, ipsps_string, hw_version)=
;
> >     +static SENSOR_DEVICE_ATTR_RO(fw_version, ipsps_fw_version, fw_vers=
ion);
> >     +static SENSOR_DEVICE_ATTR_RW(mode, ipsps_mode, mode);
> >     +
> >     +static struct attribute *ipsps_attrs[] =3D {
> >     + &sensor_dev_attr_vendor.dev_attr.attr,
> >     + &sensor_dev_attr_model.dev_attr.attr,
> >     + &sensor_dev_attr_part_number.dev_attr.attr,
> >     + &sensor_dev_attr_serial_number.dev_attr.attr,
> >     + &sensor_dev_attr_hw_version.dev_attr.attr,
> >     + &sensor_dev_attr_fw_version.dev_attr.attr,
> >     + &sensor_dev_attr_mode.dev_attr.attr,
> >     + NULL,
> >     +};
> >     +
> >     +ATTRIBUTE_GROUPS(ipsps);
> >     +
> >     +static struct pmbus_driver_info ipsps_info =3D {
> >     + .pages =3D 1,
> >     + .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> >     +         PMBUS_HAVE_IIN | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN |
> >     +         PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
> >     +         PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
> >     +         PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
> >     +         PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
> > This can be dynamic read by chip identify function
>
> PMBUS_SKIP_STATUS_CHECK weakens auto-detetcion to some degree,
> and auto-detection takes time since it needs to poll all registers
> to determine if they exist. I don't mind if you insist, but I don't
> immediately see the benefits.

ipsps does not specify that the vendor must support the status_cml
register( some vendor do not support),
so PMBUS_SKIP_STATUS_CHECK is used here.

>
> >     + .groups =3D ipsps_groups,
> >     +};
> >     +
> >     +static struct pmbus_platform_data ipsps_pdata =3D {
> >     + .flags =3D PMBUS_SKIP_STATUS_CHECK,
> >     +};
> >     +
> >     +static int ipsps_probe(struct i2c_client *client,
> >     +                const struct i2c_device_id *id)
> >     +{
> >     + client->dev.platform_data =3D &ipsps_pdata;
> > Allocate memory for this platform data inside tis function rather than =
having global variable.
>
> Does that have any value other than consuming more memory
> if there are multiple instances of the driver ?
>
> >     + return pmbus_do_probe(client, id, &ipsps_info);
> >     +}
> >     +
> >     +static const struct i2c_device_id ipsps_id[] =3D {
> >     + { "inspur_ipsps1", 0 },
> >     + {}
> >     +};
> >     +MODULE_DEVICE_TABLE(i2c, ipsps_id);
> >     +
> >     +static const struct of_device_id ipsps_of_match[] =3D {
> >     + { .compatible =3D "inspur,ipsps1" },
> >     + {}
> >     +};
> >     +MODULE_DEVICE_TABLE(of, ipsps_of_match);
> >     +
> >     +static struct i2c_driver ipsps_driver =3D {
> >     + .driver =3D {
> >     +         .name =3D "inspur-ipsps",
> >     +         .of_match_table =3D ipsps_of_match,
> >     + },
> >     + .probe =3D ipsps_probe,
> >     + .remove =3D pmbus_do_remove,
> >     + .id_table =3D ipsps_id,
> >     +};
> >     +
> >     +module_i2c_driver(ipsps_driver);
> >     +
> >     +MODULE_AUTHOR("John Wang");
> >     +MODULE_DESCRIPTION("PMBus driver for Inspur Power System power sup=
plies");
> >     +MODULE_LICENSE("GPL");
> >     --
> >     2.17.1
> >
> >
> >
