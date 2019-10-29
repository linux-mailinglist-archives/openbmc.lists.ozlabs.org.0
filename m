Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEECE888C
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 13:45:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472WWh0FKKzF35Q
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 23:45:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FdDJWSub"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472WTQ6xSCzF34C
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:42:59 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id v19so9511880pfm.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fOrbkU46JgKCpUazmCZLUeWttzqgH1e4jswzSy8IXQk=;
 b=FdDJWSubMcfZ5eXxXY7SdUcs4KiO6gI9qejKGYJlBVUSNvOkMpqmJjwI8IS48SkPWb
 XR4rWodABPRw8gkfkd0G34EXrmCaXmiH09jVLPnK22896Qj1PrY5d55cTCeIulINr3d1
 vE6Ubx/AmZ7iHYvO6iIHNBGhRBFHZohdSsCxiLl+M3urCV15FT1pziONA7JH1I+frR3s
 UfF2lp6Dp3vV0eo3HHVh7VQ+xPq5Uc5XoJx3tdub58VsWxBmVkre8+lq4CxTxFMmDRIi
 Tqbq2FNdv7D6zRGDkdcl4FSW2j81kcuQF6MZFZH6OCA3KzgPkV8GkjF3GBqEAjME/wxZ
 usOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=fOrbkU46JgKCpUazmCZLUeWttzqgH1e4jswzSy8IXQk=;
 b=MW+qeUoVLML2tQK10nqPeJIfjo6bMS/643TLLKR0A7dnvq4OnUq8INpbvSnOIua8Cr
 7ASBW2DIV8T1ep0MwD5aX/pjBxbUuI98S5UB7pDTpBMXbHS6enJ4lelOWBF+zA9m9Dsg
 dZDto1JnQLC6QoxuU2zdX2RxchGcwOstKZsWPMsrQAbFw2I/XZHtHEcZPsC+d6ZaFkcT
 zgabIv9TPEg+eaaumyj9AHNiHRlBsgQ/dh0Irh3RiV8xdDvaBD6MrHrA5/F28jy0oyro
 QIsQ2GN35W4kjMktsg6wFVylLcAuOs2mttAX3aDX+BJBd0ZbXUvApRWKAhXr038JeuPD
 NuBg==
X-Gm-Message-State: APjAAAUyqNof8h8/ku5h+8pOcI8svYJXAAhtClMQoUDGFEmpxj6lEkQg
 iZZegBdBOU5xtCSoxWyp+cs=
X-Google-Smtp-Source: APXvYqxdKrpJbgiqxQmwUMlhqcA77zarOIKgxEysN+oYiECsIpHChZdRZkg3/AocXszl3438nmc+jw==
X-Received: by 2002:aa7:83c2:: with SMTP id j2mr27670525pfn.225.1572352976762; 
 Tue, 29 Oct 2019 05:42:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q13sm3879740pjq.0.2019.10.29.05.42.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Oct 2019 05:42:56 -0700 (PDT)
Date: Tue, 29 Oct 2019 05:42:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH 1/3] hwmon: (pmbus) add BEL PFE1100 power supply driver
Message-ID: <20191029124255.GA23349@roeck-us.net>
References: <20191028234904.12441-1-rentao.bupt@gmail.com>
 <20191028234904.12441-2-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028234904.12441-2-rentao.bupt@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-doc@vger.kernel.org, taoren@fb.com, openbmc@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 28, 2019 at 04:49:02PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add the driver to support BEL PFE1100 which is 1100 Wat AC to DC power
> supply. The chip has only 1 page.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Please combine with the next patch.

> ---
>  drivers/hwmon/pmbus/Kconfig   |  9 +++++
>  drivers/hwmon/pmbus/Makefile  |  1 +
>  drivers/hwmon/pmbus/bel-pfe.c | 68 +++++++++++++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/bel-pfe.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index d62d69bb7e49..59859979571d 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -36,6 +36,15 @@ config SENSORS_ADM1275
>  	  This driver can also be built as a module. If so, the module will
>  	  be called adm1275.
>  
> +config SENSORS_BEL_PFE
> +	tristate "Bel PFE Compatible Power Supplies"
> +	help
> +	  If you say yes here you get hardware monitoring support for BEL
> +	  PFE1100 and PFE3000 Power Supplies.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called bel-pfe.
> +
>  config SENSORS_IBM_CFFPS
>  	tristate "IBM Common Form Factor Power Supply"
>  	depends on LEDS_CLASS
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 03bacfcfd660..3f8c1014938b 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -6,6 +6,7 @@
>  obj-$(CONFIG_PMBUS)		+= pmbus_core.o
>  obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
>  obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
> +obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
>  obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
>  obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
>  obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
> diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
> new file mode 100644
> index 000000000000..117f9af21bf3
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/bel-pfe.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for BEL PFE family power supplies.
> + *
> + * Copyright (c) 2019 Facebook Inc.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>

Alphabetic include file order, please.

> +#include "pmbus.h"
> +
> +enum chips {pfe1100};
> +
> +static struct pmbus_driver_info pfe_driver_info[] = {
> +	[pfe1100] = {
> +		.pages = 1,
> +		.format[PSC_VOLTAGE_IN] = linear,
> +		.format[PSC_VOLTAGE_OUT] = linear,
> +		.format[PSC_CURRENT_IN] = linear,
> +		.format[PSC_CURRENT_OUT] = linear,
> +		.format[PSC_POWER] = linear,
> +		.format[PSC_TEMPERATURE] = linear,
> +		.format[PSC_FAN] = linear,
> +
> +		.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +			   PMBUS_HAVE_POUT |
> +			   PMBUS_HAVE_VIN | PMBUS_HAVE_IIN |
> +			   PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> +			   PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
> +			   PMBUS_HAVE_STATUS_TEMP |
> +			   PMBUS_HAVE_FAN12,
> +	},
> +};
> +
> +static int pfe_pmbus_probe(struct i2c_client *client,
> +			   const struct i2c_device_id *id)
> +{
> +	int model;
> +
> +	model = (int)id->driver_data;
> +	return pmbus_do_probe(client, id, &pfe_driver_info[model]);
> +}
> +
> +static const struct i2c_device_id pfe_device_id[] = {
> +	{"pfe1100", pfe1100},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, pfe_device_id);
> +
> +static struct i2c_driver pfe_pmbus_driver = {
> +	.driver = {
> +		   .name = "bel-pfe",
> +	},
> +	.probe = pfe_pmbus_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = pfe_device_id,
> +};
> +
> +module_i2c_driver(pfe_pmbus_driver);
> +
> +MODULE_AUTHOR("Tao Ren <rentao.bupt@gmail.com>");
> +MODULE_DESCRIPTION("PMBus driver for BEL PFE Family Power Supplies");
> +MODULE_LICENSE("GPL");
