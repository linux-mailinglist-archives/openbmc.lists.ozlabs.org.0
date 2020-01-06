Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B9130D61
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 07:05:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rlND4qd9zDqF5
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 17:05:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="P3eDHsxN"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rlLX6MYRzDqFF
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 17:03:32 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id k6so38578499qki.5
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jan 2020 22:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=rZ70cEkB4Jhdp7ECTeAz8HFAtFpwK+dbnI03ZMUeFUs=;
 b=P3eDHsxNl8DeP56iAIz85MTaPpB2s/BU+Nm1RFq/cJ3mOcwGKvxZ3pT+5XXdNt7dzT
 9uQmx5KgMyTkI0e6aURiA1B+/ODvAZPPexS9rDNqGDbgb+cRyGoZ6XgRCY7pQ3SDZZsw
 GZiTGlecNpUArz/yBfgtnEmIgJ8/eyzjm1rGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=rZ70cEkB4Jhdp7ECTeAz8HFAtFpwK+dbnI03ZMUeFUs=;
 b=qgGQDT73T1mbbceMwvgLNcUVFCe7XSxxJSOG8oB65wSto9APAg367EdDBvLSNhUC4d
 uxDqgimwvpkHV0rWkqVY3Y7A8iGZUNNpwzS6MViwjVng7fOUGqwgaYsaprPh4qxxf+vf
 54FSbrjNJwxCFK6szPbaRyf3HQdjUo1TR2pDFCOvD8N3Hk75sWmN5AMoqVkisWOf6AX2
 M6BIK8Q2u3gjW9uuO+tLzDXac/At10WJ3fQR9v1rUxOwf2N9fNAif9TNXuPtvCeY18TZ
 jDiF0sROA6BrixbSVriIwjj4nOgNmbNZQIU5LthB6LMNUpOEG3Z2NEehJ7fso7Qt/Zzl
 3a3Q==
X-Gm-Message-State: APjAAAUZh17gEc7TA0mqU3maFf3yS1a0HIlhORAOZpusfZu1CG0kPfWt
 VzlAftZw4LgzWWC1YBAiY0rewmcVOJbGqSl5OKA=
X-Received: by 2002:a05:620a:849:: with SMTP id
 u9mt82147270qku.414.1578290608572; 
 Sun, 05 Jan 2020 22:03:28 -0800 (PST)
MIME-Version: 1.0
References: <1577350647-128938-1-git-send-email-pengms1@lenovo.com>
 <4452cf36-25ac-6064-b124-fda71b282fb7@roeck-us.net>
In-Reply-To: <4452cf36-25ac-6064-b124-fda71b282fb7@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jan 2020 06:03:15 +0000
Message-ID: <CACPK8Xd=y8u04XO8bBh+Kb9qGEAQMQubbJAtjy8DQ3wQoyq3ew@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v1 0/1] hwmon: (pmbus) Add Infineon IR38164, 
 Renesas RAA228006, and TI SN1701022 driver
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
Cc: Andrew Peng <pengms1@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Yonghui Liu <liuyh21@lenovo.com>,
 Benjamin Fair <benjaminfair@google.com>, Derek Lin <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 26 Dec 2019 at 17:13, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/26/19 12:57 AM, Andrew Peng wrote:
> > Add the pmbus driver for Infineon IR38164 Voltage Regulator driver.
> > Add the pmbus driver for Renesas RAA228006 Digital PWM Controller.
> > Add the pmbus driver for TI SN1701022 driver.
> >
> > Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> > Signed-off-by: Derek Lin <dlin23@lenovo.com>
> > Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
> > ---
>
> This is annoying, and each time it happens it is more annoying.
> Can you folks please stop sending me patches for non-upstream kernel branches ?

Andrew, when submitting the patch for inclusion in OpenBMC you should
only send it to the openbmc list, and openbmc reviewers. You can use
--suppress-cc to stop git-send-email from picking up other addresses
in the commit log.

Cheers,

Joel


>
> Thanks,
> Guenter
>
> > v1: initial version
> >
> >   drivers/hwmon/pmbus/Kconfig     |  25 ++++++++
> >   drivers/hwmon/pmbus/Makefile    |   3 +
> >   drivers/hwmon/pmbus/ir38164.c   |  72 +++++++++++++++++++++++
> >   drivers/hwmon/pmbus/raa228006.c | 127 ++++++++++++++++++++++++++++++++++++++++
> >   drivers/hwmon/pmbus/sn1701022.c |  80 +++++++++++++++++++++++++
> >   5 files changed, 307 insertions(+)
> >   create mode 100644 drivers/hwmon/pmbus/ir38164.c
> >   create mode 100644 drivers/hwmon/pmbus/raa228006.c
> >   create mode 100644 drivers/hwmon/pmbus/sn1701022.c
> >
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index 6106263..2312b58 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -73,6 +73,15 @@ config SENSORS_IR38064
> >         This driver can also be built as a module. If so, the module will
> >         be called ir38064.
> >
> > +config SENSORS_IR38164
> > +     tristate "Infineon IR38164"
> > +     help
> > +       If you say yes here you get hardware monitoring support for Infineon
> > +       IR38164.
> > +
> > +       This driver can also be built as a module. If so, the module will
> > +       be called ir38164.
> > +
> >   config SENSORS_IRPS5401
> >       tristate "Infineon IRPS5401"
> >       help
> > @@ -230,4 +239,20 @@ config SENSORS_ZL6100
> >         This driver can also be built as a module. If so, the module will
> >         be called zl6100.
> >
> > +config SENSORS_RAA228006
> > +     tristate "RAA228006 and compatibles"
> > +     help
> > +       If you say yes here you get hardware monitoring support for RAA228006.
> > +
> > +       This driver can also be built as a module. If so, the module will
> > +       be called RAA228006.
> > +
> > +config SENSORS_SN1701022
> > +     tristate "SN1701022"
> > +     help
> > +       If you say yes here you get hardware monitoring support for SN1701022.
> > +
> > +       This driver can also be built as a module. If so, the module will
> > +       be called sn1701022.
> > +
> >   endif # PMBUS
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> > index 03bacfc..ba3aed5 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_SENSORS_IBM_CFFPS)     += ibm-cffps.o
> >   obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
> >   obj-$(CONFIG_SENSORS_IR35221)       += ir35221.o
> >   obj-$(CONFIG_SENSORS_IR38064)       += ir38064.o
> > +obj-$(CONFIG_SENSORS_IR38164)        += ir38164.o
> >   obj-$(CONFIG_SENSORS_IRPS5401)      += irps5401.o
> >   obj-$(CONFIG_SENSORS_ISL68137)      += isl68137.o
> >   obj-$(CONFIG_SENSORS_LM25066)       += lm25066.o
> > @@ -26,3 +27,5 @@ obj-$(CONFIG_SENSORS_TPS53679)      += tps53679.o
> >   obj-$(CONFIG_SENSORS_UCD9000)       += ucd9000.o
> >   obj-$(CONFIG_SENSORS_UCD9200)       += ucd9200.o
> >   obj-$(CONFIG_SENSORS_ZL6100)        += zl6100.o
> > +obj-$(CONFIG_SENSORS_RAA228006)      += raa228006.o
> > +obj-$(CONFIG_SENSORS_SN1701022)      += sn1701022.o
> > diff --git a/drivers/hwmon/pmbus/ir38164.c b/drivers/hwmon/pmbus/ir38164.c
> > new file mode 100644
> > index 0000000..db89473
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/ir38164.c
> > @@ -0,0 +1,72 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Hardware monitoring driver for Infineon ir38164
> > + *
> > + * Copyright (C) 2019-present Lenovo
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write to the Free Software
> > + * Foundation, Inc., 51 Franklin Street, Fifth Floor,
> > + * Boston, MA  02110-1301, USA.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include "pmbus.h"
> > +
> > +static struct pmbus_driver_info ir38164_info = {
> > +     .pages = 1,
> > +     .format[PSC_VOLTAGE_IN] = linear,
> > +     .format[PSC_VOLTAGE_OUT] = linear,
> > +     .format[PSC_CURRENT_OUT] = linear,
> > +     .format[PSC_POWER] = linear,
> > +     .format[PSC_TEMPERATURE] = linear,
> > +
> > +     .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> > +         | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +         | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> > +         | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> > +         | PMBUS_HAVE_POUT,
> > +};
> > +
> > +static int ir38164_probe(struct i2c_client *client,
> > +                      const struct i2c_device_id *id)
> > +{
> > +     return pmbus_do_probe(client, id, &ir38164_info);
> > +}
> > +
> > +static const struct i2c_device_id ir38164_id[] = {
> > +     {"ir38164", 0},
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, ir38164_id);
> > +
> > +/* This is the driver that will be inserted */
> > +static struct i2c_driver ir38164_driver = {
> > +     .driver = {
> > +                .name = "ir38164",
> > +                },
> > +     .probe = ir38164_probe,
> > +     .remove = pmbus_do_remove,
> > +     .id_table = ir38164_id,
> > +};
> > +
> > +module_i2c_driver(ir38164_driver);
> > +
> > +MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
> > +MODULE_DESCRIPTION("PMBus driver for Infineon ir38164");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/hwmon/pmbus/raa228006.c b/drivers/hwmon/pmbus/raa228006.c
> > new file mode 100644
> > index 0000000..9aed481
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/raa228006.c
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Hardware monitoring driver for raa228006
> > + *
> > + * Copyright (C) 2019-present Lenovo
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write to the Free Software
> > + * Foundation, Inc., 51 Franklin Street, Fifth Floor,
> > + * Boston, MA  02110-1301, USA.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include "pmbus.h"
> > +
> > +static int raa228006_probe(struct i2c_client *client,
> > +                      const struct i2c_device_id *id)
> > +{
> > +     struct pmbus_driver_info *info;
> > +     u8 buf[I2C_SMBUS_BLOCK_MAX];
> > +     int ret;
> > +
> > +     if (!i2c_check_functionality(client->adapter,
> > +                                  I2C_FUNC_SMBUS_READ_BYTE_DATA
> > +                             | I2C_FUNC_SMBUS_READ_WORD_DATA
> > +                             | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> > +             return -ENODEV;
> > +
> > +     /* By default this device doesn't boot to page 0, so set page 0
> > +      * to access all pmbus registers.
> > +      */
> > +
> > +     i2c_smbus_write_byte_data(client, 0, 0);
> > +
> > +     /* Read Manufacturer id */
> > +     ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> > +     if (ret < 0) {
> > +             dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
> > +             return ret;
> > +     }
> > +
> > +     info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
> > +                         GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     info->format[PSC_VOLTAGE_IN] = direct;
> > +     info->format[PSC_VOLTAGE_OUT] = direct;
> > +     info->format[PSC_CURRENT_IN] = direct;
> > +     info->format[PSC_CURRENT_OUT] = direct;
> > +     info->format[PSC_POWER] = direct;
> > +     info->format[PSC_TEMPERATURE] = direct;
> > +     info->vrm_version = vr13;
> > +
> > +     info->m[PSC_VOLTAGE_IN] = 1,
> > +     info->b[PSC_VOLTAGE_IN] = 0,
> > +     info->R[PSC_VOLTAGE_IN] = 3,
> > +
> > +     info->m[PSC_VOLTAGE_OUT] = 1,
> > +     info->b[PSC_VOLTAGE_OUT] = 0,
> > +     info->R[PSC_VOLTAGE_OUT] = 0,
> > +
> > +     info->m[PSC_CURRENT_IN] = 1,
> > +     info->b[PSC_CURRENT_IN] = 0,
> > +     info->R[PSC_CURRENT_IN] = 1,
> > +
> > +     info->m[PSC_CURRENT_OUT] = 1,
> > +     info->b[PSC_CURRENT_OUT] = 0,
> > +     info->R[PSC_CURRENT_OUT] = 2,
> > +
> > +     info->m[PSC_POWER] = 1,
> > +     info->b[PSC_POWER] = 0,
> > +     info->R[PSC_POWER] = 3,
> > +
> > +     info->m[PSC_TEMPERATURE] = 1,
> > +     info->b[PSC_TEMPERATURE] = 0,
> > +     info->R[PSC_TEMPERATURE] = 3,
> > +
> > +     info->func[0] = PMBUS_HAVE_VIN
> > +             | PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN
> > +             | PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN
> > +             | PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP
> > +             | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3
> > +             | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
> > +             | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP;
> > +
> > +     info->pages = id->driver_data;
> > +
> > +     return pmbus_do_probe(client, id, info);
> > +}
> > +
> > +static const struct i2c_device_id raa228006_id[] = {
> > +     {"raa228006", 1},
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, raa228006_id);
> > +
> > +/* This is the driver that will be inserted */
> > +static struct i2c_driver raa228006_driver = {
> > +     .driver = {
> > +                .name = "raa228006",
> > +                },
> > +     .probe = raa228006_probe,
> > +     .remove = pmbus_do_remove,
> > +     .id_table = raa228006_id,
> > +};
> > +
> > +module_i2c_driver(raa228006_driver);
> > +
> > +MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
> > +MODULE_DESCRIPTION("PMBus driver for raa228006");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/hwmon/pmbus/sn1701022.c b/drivers/hwmon/pmbus/sn1701022.c
> > new file mode 100644
> > index 0000000..0ba45ac
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/sn1701022.c
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Hardware monitoring driver for sn1701022
> > + *
> > + * Copyright (C) 2019-present Lenovo
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write to the Free Software
> > + * Foundation, Inc., 51 Franklin Street, Fifth Floor,
> > + * Boston, MA  02110-1301, USA.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include "pmbus.h"
> > +
> > +static struct pmbus_driver_info sn1701022_info = {
> > +     .pages = 2,
> > +     .format[PSC_VOLTAGE_IN] = linear,
> > +     .format[PSC_VOLTAGE_OUT] = vid,
> > +     .vrm_version = vr12,
> > +     .format[PSC_CURRENT_OUT] = linear,
> > +     .format[PSC_CURRENT_IN] = linear,
> > +     .format[PSC_POWER] = linear,
> > +     .format[PSC_TEMPERATURE] = linear,
> > +
> > +     .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> > +         | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +         | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> > +         | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> > +         | PMBUS_HAVE_POUT,
> > +
> > +     .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> > +         | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +         | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> > +         | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> > +         | PMBUS_HAVE_POUT,
> > +};
> > +
> > +static int sn1701022_probe(struct i2c_client *client,
> > +                      const struct i2c_device_id *id)
> > +{
> > +     return pmbus_do_probe(client, id, &sn1701022_info);
> > +}
> > +
> > +static const struct i2c_device_id sn1701022_id[] = {
> > +     {"sn1701022", 0},
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, sn1701022_id);
> > +
> > +/* This is the driver that will be inserted */
> > +static struct i2c_driver sn1701022_driver = {
> > +     .driver = {
> > +                .name = "sn1701022",
> > +                },
> > +     .probe = sn1701022_probe,
> > +     .remove = pmbus_do_remove,
> > +     .id_table = sn1701022_id,
> > +};
> > +
> > +module_i2c_driver(sn1701022_driver);
> > +
> > +MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
> > +MODULE_DESCRIPTION("PMBus driver for  sn1701022");
> > +MODULE_LICENSE("GPL");
> >
>
