Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FA4479042
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 16:46:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFtdM1jnNz3cHP
	for <lists+openbmc@lfdr.de>; Sat, 18 Dec 2021 02:46:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QLaCR2AU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QLaCR2AU; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFtcv2tV0z3c9G
 for <openbmc@lists.ozlabs.org>; Sat, 18 Dec 2021 02:46:21 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso3416983otf.0
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p0QftDbLVEjaifUdOY6G8MAYqVEgDGe4owAz0ggdUhI=;
 b=QLaCR2AU8uG3Q7LBIu/+mrOR8fortXlZZV6BOvctjPqfvl4FcWB5AxNw47AnJN+Cyj
 7K1R4i8d0HrWZGm+J2bRdE4xRyepTbGgjU7kJ4WoTrrxSTctHatkK3CwilMpKsBQ2jN1
 gnhIEY28lt157qYWFnJ0DDXlKtdjbfSB3hz0MHxEv6u16MRPT1182jpodmdYhebFtRWN
 kxcWtRxeyYhf8H99Sg5rALrm+7os6PElmsepSXLnaFyqpRwIDxruKwwR7wXnU+lBA6n7
 Y6B579Jy2j9YQqnm1g9dzT69WycSanZHw0HBWPqgft0Qz7em8PlB5OjFDH8BMcqH1NmG
 smzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=p0QftDbLVEjaifUdOY6G8MAYqVEgDGe4owAz0ggdUhI=;
 b=MoLbYH6No8qo8e3GmTlkf3H62zXcWuJX4rKDxyzqpGqnNIlaJF6NeVv+K3q9EIA6IB
 Hm1/CHusNXkARekLaNwUs6uGhqor0YZx4U6hbBgqsQMeJVH5STwR4UlHpiE3vOso6jx5
 rCGyA7uTKrdsvL4L5r24ME1zJ6OscklkhxGvor4vNbxUsfSU5Qawh6bVAbpKTEuHgZXn
 FJ4LYtOp2HZ7yAHL/Bdt6nxAKja74cWP2K7HzpMv1Ja9EhSW/eBQwfnpzD8s3ut/w+La
 trZyI478eyJBszQB5fGRzWson74UOrxidaFSXDy0dz+UeFVUQ6fDw4V+HdsGrB8zY/ZL
 BvcA==
X-Gm-Message-State: AOAM532gS7MRomhiKRNQ/0QYFWysHKBMYqUY7GryqRaefji8jG8XKTT6
 Wc44kxluZduoDoyoBEBys44=
X-Google-Smtp-Source: ABdhPJyCVA5rp0RWFZSVd0Lq5iy+S8fFH+olrP6BEllaSupNzkBVLpZM6MFiSywNeH57KWFFHb0jRQ==
X-Received: by 2002:a05:6830:1e13:: with SMTP id
 s19mr2569561otr.358.1639755977016; 
 Fri, 17 Dec 2021 07:46:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l9sm1591270oom.4.2021.12.17.07.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:46:16 -0800 (PST)
Date: Fri, 17 Dec 2021 07:46:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v4 1/2] hwmon: (pmbus) Add Delta AHE-50DC fan control
 module driver
Message-ID: <20211217154615.GA2913871@roeck-us.net>
References: <20211208213703.2577-1-zev@bewilderbeest.net>
 <20211208213703.2577-2-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208213703.2577-2-zev@bewilderbeest.net>
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
 openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 08, 2021 at 01:37:02PM -0800, Zev Weiss wrote:
> This device is an integrated module of the Delta AHE-50DC Open19 power
> shelf.  I haven't been able to procure any proper documentation for
> it, but it seems to be a (somewhat minimally) PMBus-compliant device.
> It provides four fan speeds, four temperatures (three standard and one
> manufacturer-specific via a virtual second page), and a vin reading.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Applied.

Thanks,
Guenter

> ---
>  MAINTAINERS                             |   6 ++
>  drivers/hwmon/pmbus/Kconfig             |  10 +++
>  drivers/hwmon/pmbus/Makefile            |   1 +
>  drivers/hwmon/pmbus/delta-ahe50dc-fan.c | 114 ++++++++++++++++++++++++
>  4 files changed, 131 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/delta-ahe50dc-fan.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0ac052200ecb..8bb7ba52d2f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5425,6 +5425,12 @@ W:	https://linuxtv.org
>  T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/platform/sti/delta
>  
> +DELTA AHE-50DC FAN CONTROL MODULE DRIVER
> +M:	Zev Weiss <zev@bewilderbeest.net>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/pmbus/delta-ahe50dc-fan.c
> +
>  DELTA DPS920AB PSU DRIVER
>  M:	Robert Marko <robert.marko@sartura.hr>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index ffb609cee3a4..0b1157b883aa 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -66,6 +66,16 @@ config SENSORS_BPA_RS600
>  	  This driver can also be built as a module. If so, the module will
>  	  be called bpa-rs600.
>  
> +config SENSORS_DELTA_AHE50DC_FAN
> +	tristate "Delta AHE-50DC fan control module"
> +	help
> +	  If you say yes here you get hardware monitoring support for
> +	  the integrated fan control module of the Delta AHE-50DC
> +	  Open19 power shelf.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called delta-ahe50dc-fan.
> +
>  config SENSORS_FSP_3Y
>  	tristate "FSP/3Y-Power power supplies"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 0ed4d596a948..a56b2897288d 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
>  obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
>  obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
>  obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
> +obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
>  obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
>  obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>  obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
> diff --git a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
> new file mode 100644
> index 000000000000..40dffd9c4cbf
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Delta AHE-50DC power shelf fan control module driver
> + *
> + * Copyright 2021 Zev Weiss <zev@bewilderbeest.net>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pmbus.h>
> +
> +#include "pmbus.h"
> +
> +#define AHE50DC_PMBUS_READ_TEMP4 0xd0
> +
> +static int ahe50dc_fan_read_word_data(struct i2c_client *client, int page, int phase, int reg)
> +{
> +	/* temp1 in (virtual) page 1 is remapped to mfr-specific temp4 */
> +	if (page == 1) {
> +		if (reg == PMBUS_READ_TEMPERATURE_1)
> +			return i2c_smbus_read_word_data(client, AHE50DC_PMBUS_READ_TEMP4);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/*
> +	 * There's a fairly limited set of commands this device actually
> +	 * supports, so here we block attempts to read anything else (which
> +	 * return 0xffff and would cause confusion elsewhere).
> +	 */
> +	switch (reg) {
> +	case PMBUS_STATUS_WORD:
> +	case PMBUS_FAN_COMMAND_1:
> +	case PMBUS_FAN_COMMAND_2:
> +	case PMBUS_FAN_COMMAND_3:
> +	case PMBUS_FAN_COMMAND_4:
> +	case PMBUS_STATUS_FAN_12:
> +	case PMBUS_STATUS_FAN_34:
> +	case PMBUS_READ_VIN:
> +	case PMBUS_READ_TEMPERATURE_1:
> +	case PMBUS_READ_TEMPERATURE_2:
> +	case PMBUS_READ_TEMPERATURE_3:
> +	case PMBUS_READ_FAN_SPEED_1:
> +	case PMBUS_READ_FAN_SPEED_2:
> +	case PMBUS_READ_FAN_SPEED_3:
> +	case PMBUS_READ_FAN_SPEED_4:
> +		return -ENODATA;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static struct pmbus_driver_info ahe50dc_fan_info = {
> +	.pages = 2,
> +	.format[PSC_FAN] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.m[PSC_FAN] = 1,
> +	.b[PSC_FAN] = 0,
> +	.R[PSC_FAN] = 0,
> +	.m[PSC_TEMPERATURE] = 1,
> +	.b[PSC_TEMPERATURE] = 0,
> +	.R[PSC_TEMPERATURE] = 1,
> +	.m[PSC_VOLTAGE_IN] = 1,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 3,
> +	.func[0] = PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
> +		PMBUS_HAVE_VIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_FAN34 |
> +		PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_STATUS_FAN34 | PMBUS_PAGE_VIRTUAL,
> +	.func[1] = PMBUS_HAVE_TEMP | PMBUS_PAGE_VIRTUAL,
> +	.read_word_data = ahe50dc_fan_read_word_data,
> +};
> +
> +/*
> + * CAPABILITY returns 0xff, which appears to be this device's way indicating
> + * it doesn't support something (and if we enable I2C_CLIENT_PEC on seeing bit
> + * 7 being set it generates bad PECs, so let's not go there).
> + */
> +static struct pmbus_platform_data ahe50dc_fan_data = {
> +	.flags = PMBUS_NO_CAPABILITY,
> +};
> +
> +static int ahe50dc_fan_probe(struct i2c_client *client)
> +{
> +	client->dev.platform_data = &ahe50dc_fan_data;
> +	return pmbus_do_probe(client, &ahe50dc_fan_info);
> +}
> +
> +static const struct i2c_device_id ahe50dc_fan_id[] = {
> +	{ "ahe50dc_fan" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ahe50dc_fan_id);
> +
> +static const struct of_device_id __maybe_unused ahe50dc_fan_of_match[] = {
> +	{ .compatible = "delta,ahe50dc-fan" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ahe50dc_fan_of_match);
> +
> +static struct i2c_driver ahe50dc_fan_driver = {
> +	.driver = {
> +		   .name = "ahe50dc_fan",
> +		   .of_match_table = of_match_ptr(ahe50dc_fan_of_match),
> +	},
> +	.probe_new = ahe50dc_fan_probe,
> +	.id_table = ahe50dc_fan_id,
> +};
> +module_i2c_driver(ahe50dc_fan_driver);
> +
> +MODULE_AUTHOR("Zev Weiss <zev@bewilderbeest.net>");
> +MODULE_DESCRIPTION("Driver for Delta AHE-50DC power shelf fan control module");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);
