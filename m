Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD6750E48B
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 17:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kn8KN1CTKz3bd8
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 01:37:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S/0r/sG+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=S/0r/sG+; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kn8Jx6wnzz3bZg
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 01:37:19 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id e4so17534576oif.2
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2022 08:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e5PTJeJCNYuORw416nhi+yZ3YmrDs9PcHs4fRVUAraQ=;
 b=S/0r/sG+69t8vIc4rRd9ip+BWioIzJzL84iN3IZ+2lK1LfEy1xqRUb1f+Gcbqt2caw
 YUEQhfu7kq+wvTZPUbWoGUT2SPW+ySmK9NbmUC4UZTE1/oW8+IDiEuxIruhJEF/Gddzv
 RdbCFbiC15tXBpkxpHfDz6nVOwzOF6fZsP7wMf3UA/fAy+/CSmgiwaVpubKmwirhQuKx
 sl6YQ9M0JL+0Y950FkChdwK8DJHU9LSg/KyAw64NMV/oXPjLSJ+tm9VBMUsGqs/XNusz
 anBgQjs+QMAbpbH+XBZRZgToxXA8Ja36RzDatYI4xOIgTcoWuH1WZipA9BOBLUslFM0J
 J9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=e5PTJeJCNYuORw416nhi+yZ3YmrDs9PcHs4fRVUAraQ=;
 b=iNRj9gIdCRgXEyGrAzs1dUJ9oonEnKvJ/WX8xyRx3u/Y0ERkk4Gr8jjtcrIRszPvFv
 LG1PeuVsUL4wnJ73G7bBisx2nCCxAwL8JiSrOg/EE+YOhlch+wKVn1WqIKR/70oqXS0d
 ui61rIVbru9T4p5O3XEPKeZrMtH2dwFKiDqUXnfh0TmHFaHBzlgYcplUVAktM+z29nLl
 0yWu+X41G7NQBC0SwekEgrocoZDjkmDds6PCTEajpb/XziHhdACF3ZOAcymAv0cHywsr
 OTLFJqmCyuPj/DLS9wLd310zWXSp2txuV0uzWZ9SkBY6f2SIecG7iDKvD5PWNrgXB9a3
 DhxQ==
X-Gm-Message-State: AOAM532VUeBRBYR+LVoWmOMZX/W+eZqY8sTA+4+m5HzMbxK8D/3ot5fb
 fKq8RwZO+s9tm/RJrzfi0am0T6SCAJI=
X-Google-Smtp-Source: ABdhPJzA8s3dOAXlFx4kKXDnyLGHgEKnJAU358v0B7oQlMKqnHOSFsUtzWCB6DHlN3Bsv+7wgUofNA==
X-Received: by 2002:a05:6808:d48:b0:322:a49f:a7e1 with SMTP id
 w8-20020a0568080d4800b00322a49fa7e1mr12686501oik.181.1650901036118; 
 Mon, 25 Apr 2022 08:37:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056808024500b003222ff73171sm3820741oie.17.2022.04.25.08.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 08:37:15 -0700 (PDT)
Date: Mon, 25 Apr 2022 08:37:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 6/6] hwmon: (nct6775) Add i2c driver
Message-ID: <20220425153714.GA4167482@roeck-us.net>
References: <20220309005047.5107-1-zev@bewilderbeest.net>
 <20220309005047.5107-7-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309005047.5107-7-zev@bewilderbeest.net>
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 08, 2022 at 04:50:47PM -0800, Zev Weiss wrote:
> This driver provides an i2c I/O mechanism for the core nct6775 driver,
> as might be used by a BMC.  Because the Super I/O chip is shared with
> the host CPU in such a scenario (and the host should ultimately be in
> control of it), the i2c driver is strictly read-only to avoid
> interfering with any usage by the host (aside from the bank-select
> register, which seems to be replicated for the i2c interface).
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Tested-by: Renze Nicolai <renze@rnplus.nl>
> ---
>  MAINTAINERS                 |   6 ++
>  drivers/hwmon/Kconfig       |  17 ++++
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/nct6775-i2c.c | 179 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 203 insertions(+)
>  create mode 100644 drivers/hwmon/nct6775-i2c.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f093e40d2b16..02202555ccfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13296,6 +13296,12 @@ F:	drivers/hwmon/nct6775-core.c
>  F:	drivers/hwmon/nct6775-platform.c
>  F:	drivers/hwmon/nct6775.h
>  
> +NCT6775 HARDWARE MONITOR DRIVER - I2C DRIVER
> +M:	Zev Weiss <zev@bewilderbeest.net>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/nct6775-i2c.c
> +
>  NETDEVSIM
>  M:	Jakub Kicinski <kuba@kernel.org>
>  S:	Maintained
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 1c657100c392..fd2d32140066 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1483,6 +1483,23 @@ config SENSORS_NCT6775_PLATFORM
>  	  This driver can also be built as a module. If so, the module
>  	  will be called nct6775-platform.
>  
> +config SENSORS_NCT6775_I2C
> +	tristate "I2C driver for Nuvoton NCT6775F and compatibles"
> +	depends on I2C
> +	select REGMAP_I2C

This driver doesn't really use regmap, much less regmap_i2c.
The core driver should select REGMAP.

Guenter

> +	select SENSORS_NCT6775
> +	help
> +	  If you say yes here you get support for the hardware monitoring
> +	  functionality of the Nuvoton NCT6106D, NCT6775F, NCT6776F, NCT6779D,
> +	  NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D, and compatible
> +	  Super-I/O chips via their I2C interface.
> +
> +	  If you're not building a kernel for a BMC, this is probably
> +	  not the driver you want (see CONFIG_SENSORS_NCT6775_PLATFORM).
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nct6775-i2c.
> +
>  config SENSORS_NCT7802
>  	tristate "Nuvoton NCT7802Y"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 2453c087cf1d..e1da423d46d5 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
>  obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
>  obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775-core.o
>  obj-$(CONFIG_SENSORS_NCT6775_PLATFORM) += nct6775-platform.o
> +obj-$(CONFIG_SENSORS_NCT6775_I2C) += nct6775-i2c.o
>  obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
>  obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
>  obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
> diff --git a/drivers/hwmon/nct6775-i2c.c b/drivers/hwmon/nct6775-i2c.c
> new file mode 100644
> index 000000000000..e36cf814c8e9
> --- /dev/null
> +++ b/drivers/hwmon/nct6775-i2c.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * nct6775-i2c - I2C driver for the hardware monitoring functionality of
> + *	         Nuvoton NCT677x Super-I/O chips
> + *
> + * Copyright (C) 2022 Zev Weiss <zev@bewilderbeest.net>
> + *
> + * This driver interacts with the chip via it's "back door" i2c interface, as
> + * is often exposed to a BMC.  Because the host may still be operating the
> + * chip via the ("front door") LPC interface, this driver cannot assume that
> + * it actually has full control of the chip, and in particular must avoid
> + * making any changes that could confuse the host's LPC usage of it.  It thus
> + * operates in a strictly read-only fashion, with the only exception being the
> + * bank-select register (which seems, thankfully, to be replicated for the i2c
> + * interface so it doesn't affect the LPC interface).
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/err.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include "nct6775.h"
> +
> +static int nct6775_i2c_read(void *ctx, unsigned int reg, unsigned int *val)
> +{
> +	int ret;
> +	u32 tmp;
> +	u8 bank = reg >> 8;
> +	struct nct6775_data *data = ctx;
> +	struct i2c_client *client = data->driver_data;
> +
> +	if (bank != data->bank) {
> +		ret = i2c_smbus_write_byte_data(client, NCT6775_REG_BANK, bank);
> +		if (ret)
> +			return ret;
> +		data->bank = bank;
> +	}
> +
> +	ret = i2c_smbus_read_byte_data(client, reg & 0xff);
> +	if (ret < 0)
> +		return ret;
> +	tmp = ret;
> +
> +	if (nct6775_reg_is_word_sized(data, reg)) {
> +		ret = i2c_smbus_read_byte_data(client, (reg & 0xff) + 1);
> +		if (ret < 0)
> +			return ret;
> +		tmp = (tmp << 8) | ret;
> +	}
> +
> +	*val = tmp;
> +	return 0;
> +}
> +
> +/*
> + * The write operation is a dummy so as not to disturb anything being done
> + * with the chip via LPC.
> + */
> +static int nct6775_i2c_write(void *ctx, unsigned int reg, unsigned int value)
> +{
> +	struct nct6775_data *data = ctx;
> +	struct i2c_client *client = data->driver_data;
> +
> +	dev_dbg(&client->dev, "skipping attempted write: %02x -> %03x\n", value, reg);
> +
> +	/*
> +	 * This is a lie, but writing anything but the bank-select register is
> +	 * something this driver shouldn't be doing.
> +	 */
> +	return 0;
> +}
> +
> +static const struct of_device_id __maybe_unused nct6775_i2c_of_match[] = {
> +	{ .compatible = "nuvoton,nct6106", .data = (void *)nct6106, },
> +	{ .compatible = "nuvoton,nct6116", .data = (void *)nct6116, },
> +	{ .compatible = "nuvoton,nct6775", .data = (void *)nct6775, },
> +	{ .compatible = "nuvoton,nct6776", .data = (void *)nct6776, },
> +	{ .compatible = "nuvoton,nct6779", .data = (void *)nct6779, },
> +	{ .compatible = "nuvoton,nct6791", .data = (void *)nct6791, },
> +	{ .compatible = "nuvoton,nct6792", .data = (void *)nct6792, },
> +	{ .compatible = "nuvoton,nct6793", .data = (void *)nct6793, },
> +	{ .compatible = "nuvoton,nct6795", .data = (void *)nct6795, },
> +	{ .compatible = "nuvoton,nct6796", .data = (void *)nct6796, },
> +	{ .compatible = "nuvoton,nct6797", .data = (void *)nct6797, },
> +	{ .compatible = "nuvoton,nct6798", .data = (void *)nct6798, },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, nct6775_i2c_of_match);
> +
> +static const struct i2c_device_id nct6775_i2c_id[] = {
> +	{ "nct6106", nct6106 },
> +	{ "nct6116", nct6116 },
> +	{ "nct6775", nct6775 },
> +	{ "nct6776", nct6776 },
> +	{ "nct6779", nct6779 },
> +	{ "nct6791", nct6791 },
> +	{ "nct6792", nct6792 },
> +	{ "nct6793", nct6793 },
> +	{ "nct6795", nct6795 },
> +	{ "nct6796", nct6796 },
> +	{ "nct6797", nct6797 },
> +	{ "nct6798", nct6798 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, nct6775_i2c_id);
> +
> +static int nct6775_i2c_probe_init(struct nct6775_data *data)
> +{
> +	/*
> +	 * The i2c interface doesn't provide access to the control registers
> +	 * needed to determine the presence of other fans, but fans 1 and 2
> +	 * are (in principle) always there.
> +	 *
> +	 * In practice this is perhaps a little silly, because the system
> +	 * using this driver is mostly likely a BMC, and hence probably has
> +	 * totally separate fan tachs & pwms of its own that are actually
> +	 * controlling/monitoring the fans -- these are thus unlikely to be
> +	 * doing anything actually useful.
> +	 */
> +	data->has_fan = 0x03;
> +	data->has_fan_min = 0x03;
> +	data->has_pwm = 0x03;
> +	return 0;
> +}
> +
> +static const struct regmap_config nct6775_i2c_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 16,
> +	.reg_read = nct6775_i2c_read,
> +	.reg_write = nct6775_i2c_write,
> +};
> +
> +static int nct6775_i2c_probe(struct i2c_client *client)
> +{
> +	struct nct6775_data *data;
> +	const struct of_device_id *of_id;
> +	const struct i2c_device_id *i2c_id;
> +	struct device *dev = &client->dev;
> +
> +	of_id = of_match_device(nct6775_i2c_of_match, dev);
> +	i2c_id = i2c_match_id(nct6775_i2c_id, client);
> +
> +	if (of_id && (unsigned long)of_id->data != i2c_id->driver_data)
> +		dev_notice(dev, "Device mismatch: %s in device tree, %s detected\n",
> +			   of_id->name, i2c_id->name);
> +
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->kind = i2c_id->driver_data;
> +
> +	data->read_only = true;
> +	data->driver_data = client;
> +	data->driver_init = nct6775_i2c_probe_init;
> +
> +	return nct6775_probe(dev, data, &nct6775_i2c_regmap_config);
> +}
> +
> +static struct i2c_driver nct6775_i2c_driver = {
> +	.class = I2C_CLASS_HWMON,
> +	.driver = {
> +		.name = "nct6775-i2c",
> +		.of_match_table = of_match_ptr(nct6775_i2c_of_match),
> +	},
> +	.probe_new = nct6775_i2c_probe,
> +	.id_table = nct6775_i2c_id,
> +};
> +
> +module_i2c_driver(nct6775_i2c_driver);
> +
> +MODULE_AUTHOR("Zev Weiss <zev@bewilderbeest.net>");
> +MODULE_DESCRIPTION("I2C driver for NCT6775F and compatible chips");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(HWMON_NCT6775);
