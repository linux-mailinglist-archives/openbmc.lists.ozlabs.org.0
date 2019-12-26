Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E512AD9A
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 18:11:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47kGh422JRzDqG1
	for <lists+openbmc@lfdr.de>; Fri, 27 Dec 2019 04:11:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bp/fx6ZO"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47kGgC0zLSzDqFZ
 for <openbmc@lists.ozlabs.org>; Fri, 27 Dec 2019 04:10:28 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id a33so13107896pgm.5
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 09:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FMhyUSbY+uFKj6x5W1VsuF+7c8qIlSDSygxqdy4+jdQ=;
 b=bp/fx6ZOp/eIkBCHu/Z7ACHGVLQdQO1UplSLQytwaU9vzGWvu/h3oP5B0Yj8Y2UDnw
 4A8VkUptwLXz6r+78hFZyc1LiE77El5I+LfvbS0txe7O6tK1vTivYiAqjfFTX37WUzmn
 TCbFXegsbCzqtd27jwHfTDZHOyShSTA2sygFbKgTUfOVnLFyWJTG3oaKrHtZWwtQSBUO
 D4RH3BNoY9byXHgTGdy/qwtbyoTwCMQI7xgGLLioY7Ft4KunZomOEj5cf/lEN3m93fSB
 kJbPk2rh+SLWGVSFesmq+5RbZzYtd2zuAUVSDFu6ZxUFK2kRlCk0n58++sWiUjIH2Mmd
 qx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FMhyUSbY+uFKj6x5W1VsuF+7c8qIlSDSygxqdy4+jdQ=;
 b=OpzThShuiOvIZGH83PcJ7er0pI4jAlUfa+i9AS3dieLoe5iblg/4fpZbQDf648lpkN
 WG5FWTD10KgwqPuUdKecFMea8aoNsn5eJ6ABPh9AtG2RAJCbIDf3XZtYeqLWJZUqeP9e
 6wsAdbI070KlWJOfQan/pySWgm3brveypVyBfgS1/aZzLSzqwt/0I3VY1nbg2sYSj/nq
 TxVqYRYS434mOjVLHUW+F9773+XLfThyrk62NxU8p+UZ2gPsmgXKojz1bLbPqrioptfv
 9LmXzwb5HkKuta/s+zqEGymysXX/tJfGYVqgzhRZTr4zFxnY5liV75c2mzYDaVCeD3Oa
 751w==
X-Gm-Message-State: APjAAAXDxvsMrFAjdBIC4S2mQdw29azAeSa7Q2Xhvt1t0dS0u4MQNNpM
 mGNgrsRRUM+TKrODaLnTl2g=
X-Google-Smtp-Source: APXvYqzNLc250hRl9xPQH7jHMBKCb0ePxRXw9vSTZj8JVC4xexFQRcX75nwqqQPz0QCoszlA3pDOcA==
X-Received: by 2002:a63:1853:: with SMTP id 19mr48130430pgy.170.1577380224686; 
 Thu, 26 Dec 2019 09:10:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v10sm28186162pgk.24.2019.12.26.09.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Dec 2019 09:10:24 -0800 (PST)
Subject: Re: [PATCH v1 0/1] hwmon: (pmbus) Add Infineon IR38164, Renesas
 RAA228006, and TI SN1701022 driver
To: Andrew Peng <pengms1@lenovo.com>, jdelvare@suse.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjaminfair@google.com
References: <1577350032-127172-1-git-send-email-pengms1@lenovo.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7048fe51-67b9-e13a-1337-9e58cd782126@roeck-us.net>
Date: Thu, 26 Dec 2019 09:10:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577350032-127172-1-git-send-email-pengms1@lenovo.com>
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
Cc: openbmc@lists.ozlabs.org, Yonghui Liu <liuyh21@lenovo.com>,
 Derek Lin <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/26/19 12:47 AM, Andrew Peng wrote:
> Add the pmbus driver for Infineon IR38164 Voltage Regulator driver.
> Add the pmbus driver for Renesas RAA228006 Digital PWM Controller.
> Add the pmbus driver for TI SN1701022 driver.
> 
> Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> Signed-off-by: Derek Lin <dlin23@lenovo.com>
> Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>

Please don't add three drivers with one patch. One patch per driver, please.
Also, don't label the patch "0/1" if there is just one patch.

More comments inline.

> ---
> v1: initial version
> 
>   drivers/hwmon/pmbus/Kconfig     |  25 ++++++++
>   drivers/hwmon/pmbus/Makefile    |   3 +
>   drivers/hwmon/pmbus/ir38164.c   |  72 +++++++++++++++++++++++
>   drivers/hwmon/pmbus/raa228006.c | 127 ++++++++++++++++++++++++++++++++++++++++
>   drivers/hwmon/pmbus/sn1701022.c |  80 +++++++++++++++++++++++++

Documentation missing for each of those.

>   5 files changed, 307 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/ir38164.c
>   create mode 100644 drivers/hwmon/pmbus/raa228006.c
>   create mode 100644 drivers/hwmon/pmbus/sn1701022.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index b658848..d51e67d 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -64,6 +64,15 @@ config SENSORS_IR38064
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ir38064.
>   
> +config SENSORS_IR38164
> +	tristate "Infineon IR38164"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  IR38164.
> +
Please more information.

> +	  This driver can also be built as a module. If so, the module will
> +	  be called ir38164.
> +
>   config SENSORS_IRPS5401
>   	tristate "Infineon IRPS5401"
>   	help
> @@ -221,4 +230,20 @@ config SENSORS_ZL6100
>   	  This driver can also be built as a module. If so, the module will
>   	  be called zl6100.
>   
> +config SENSORS_RAA228006
> +	tristate "RAA228006 and compatibles"
> +	help
> +	  If you say yes here you get hardware monitoring support for RAA228006.
> +
Please more information. What is that ?

> +	  This driver can also be built as a module. If so, the module will
> +	  be called RAA228006.
> +
> +config SENSORS_SN1701022
> +	tristate "SN1701022"
> +	help
> +	  If you say yes here you get hardware monitoring support for SN1701022.
> +
Please more information.

> +	  This driver can also be built as a module. If so, the module will
> +	  be called sn1701022.
> +
>   endif # PMBUS
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index c950ea9..21d259f 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>   obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>   obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
>   obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
> +obj-$(CONFIG_SENSORS_IR38164)	+= ir38164.o
>   obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
>   obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
>   obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
> @@ -25,3 +26,5 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>   obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>   obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>   obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> +obj-$(CONFIG_SENSORS_RAA228006)	+= raa228006.o
> +obj-$(CONFIG_SENSORS_SN1701022)	+= sn1701022.o
> diff --git a/drivers/hwmon/pmbus/ir38164.c b/drivers/hwmon/pmbus/ir38164.c
> new file mode 100644
> index 0000000..db89473
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ir38164.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Infineon ir38164
> + *
No one but you knows what that is. Please provide a little more information.
Same for other drivers.

> + * Copyright (C) 2019-present Lenovo
> + *

Is "-present" legal ? I see you and Facebook are using it, but for me
it doesn't really make sense. If you want to use it, please provide
a link describing the legal rationale and implications.

> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin Street, Fifth Floor,
> + * Boston, MA  02110-1301, USA.

Please no such boilerplate. This is what SPDX is for.

Same comments for the other drivers.

> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info ir38164_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +	    | PMBUS_HAVE_POUT,
> +};
> +
> +static int ir38164_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	return pmbus_do_probe(client, id, &ir38164_info);
> +}
> +
> +static const struct i2c_device_id ir38164_id[] = {
> +	{"ir38164", 0},
> +	{}
> +};
> +
I don't immediately see why this driver is necessary. It should
be sufficient to add ir38164 to pmbus.c. If that doesn't work,
please explain.

> +MODULE_DEVICE_TABLE(i2c, ir38164_id);
> +
> +/* This is the driver that will be inserted */

This is a pretty pointless comment. I would suggest to remove it.
Yes, I know, you'll find it throughout the kernel. That doesn't make it better.

> +static struct i2c_driver ir38164_driver = {
> +	.driver = {
> +		   .name = "ir38164",
> +		   },
> +	.probe = ir38164_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = ir38164_id,
> +};
> +
> +module_i2c_driver(ir38164_driver);
> +
> +MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon ir38164");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/pmbus/raa228006.c b/drivers/hwmon/pmbus/raa228006.c
> new file mode 100644
> index 0000000..9aed481
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/raa228006.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for raa228006
> + *

Here the missing information is really bad. There is almost nothing
on the web describing what "raa228006" actually is. I am not inclined
to accept this patch without further information.

> + * Copyright (C) 2019-present Lenovo
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin Street, Fifth Floor,
> + * Boston, MA  02110-1301, USA.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +static int raa228006_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct pmbus_driver_info *info;
> +	u8 buf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_BYTE_DATA
> +				| I2C_FUNC_SMBUS_READ_WORD_DATA
> +				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> +		return -ENODEV;
> +
> +	/* By default this device doesn't boot to page 0, so set page 0
> +	 * to access all pmbus registers.
> +	 */

Is that true or is it cut-and-paste ?

> +
> +	i2c_smbus_write_byte_data(client, 0, 0);
> +
> +	/* Read Manufacturer id */
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
> +		return ret;
> +	}
> +
What is the point of reading the manufacturer ID and not doing anything
with it ?

> +	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->format[PSC_VOLTAGE_IN] = direct;
> +	info->format[PSC_VOLTAGE_OUT] = direct;
> +	info->format[PSC_CURRENT_IN] = direct;
> +	info->format[PSC_CURRENT_OUT] = direct;
> +	info->format[PSC_POWER] = direct;
> +	info->format[PSC_TEMPERATURE] = direct;
> +	info->vrm_version = vr13;
> +
> +	info->m[PSC_VOLTAGE_IN] = 1,
> +	info->b[PSC_VOLTAGE_IN] = 0,
> +	info->R[PSC_VOLTAGE_IN] = 3,
> +
> +	info->m[PSC_VOLTAGE_OUT] = 1,
> +	info->b[PSC_VOLTAGE_OUT] = 0,
> +	info->R[PSC_VOLTAGE_OUT] = 0,
> +
> +	info->m[PSC_CURRENT_IN] = 1,
> +	info->b[PSC_CURRENT_IN] = 0,
> +	info->R[PSC_CURRENT_IN] = 1,
> +
> +	info->m[PSC_CURRENT_OUT] = 1,
> +	info->b[PSC_CURRENT_OUT] = 0,
> +	info->R[PSC_CURRENT_OUT] = 2,
> +
> +	info->m[PSC_POWER] = 1,
> +	info->b[PSC_POWER] = 0,
> +	info->R[PSC_POWER] = 3,
> +
> +	info->m[PSC_TEMPERATURE] = 1,
> +	info->b[PSC_TEMPERATURE] = 0,
> +	info->R[PSC_TEMPERATURE] = 3,
> +
> +	info->func[0] = PMBUS_HAVE_VIN
> +		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN
> +		| PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN
> +		| PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP
> +		| PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3
> +		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
> +		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP;
> +
> +	info->pages = id->driver_data;
> +

There is nothing else but a single page. Why that complexity and not
just use astatic allocation ? More cut-and-paste ?

> +	return pmbus_do_probe(client, id, info);
> +}
> +
> +static const struct i2c_device_id raa228006_id[] = {
> +	{"raa228006", 1},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, raa228006_id);
> +
> +/* This is the driver that will be inserted */
> +static struct i2c_driver raa228006_driver = {
> +	.driver = {
> +		   .name = "raa228006",
> +		   },
> +	.probe = raa228006_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = raa228006_id,
> +};
> +
> +module_i2c_driver(raa228006_driver);
> +
> +MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
> +MODULE_DESCRIPTION("PMBus driver for raa228006");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/pmbus/sn1701022.c b/drivers/hwmon/pmbus/sn1701022.c
> new file mode 100644
> index 0000000..0ba45ac
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/sn1701022.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for sn1701022
> + *

Same here.

> + * Copyright (C) 2019-present Lenovo
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 51 Franklin Street, Fifth Floor,
> + * Boston, MA  02110-1301, USA.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info sn1701022_info = {
> +	.pages = 2,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = vid,
> +	.vrm_version = vr12,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +	    | PMBUS_HAVE_POUT,
> +
> +	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
> +	    | PMBUS_HAVE_POUT,
> +};
> +
> +static int sn1701022_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	return pmbus_do_probe(client, id, &sn1701022_info);
> +}
> +
> +static const struct i2c_device_id sn1701022_id[] = {
> +	{"sn1701022", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, sn1701022_id);
> +
> +/* This is the driver that will be inserted */
> +static struct i2c_driver sn1701022_driver = {
> +	.driver = {
> +		   .name = "sn1701022",
> +		   },
> +	.probe = sn1701022_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = sn1701022_id,
> +};
> +
> +module_i2c_driver(sn1701022_driver);
> +
> +MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
> +MODULE_DESCRIPTION("PMBus driver for  sn1701022");
> +MODULE_LICENSE("GPL");
> 

