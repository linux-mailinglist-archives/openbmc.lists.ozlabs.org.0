Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3905348D203
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 06:32:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZCkM0PNDz2yfc
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 16:32:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ycnh4Z1d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ycnh4Z1d; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZCjy0Tg3z2xsK
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jan 2022 16:32:20 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id t66so6060422qkb.4
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 21:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xhnv6cDEIDnEyb+5VaPQiLHw0DQrlG2/ydsIQ2G5Ccc=;
 b=Ycnh4Z1ddNEZ4psVUIYs4heQ7UAW3kUqMeuViQs0OLDldFmGRrqlfLsnn9ejvvYmRA
 akSV8hz3huXVS/XjI+k6UGkNR4p98se8vNBYtxthXvcNVhKVCNRJGrJTaFSNlH46zfY8
 nTLvquhvZ79wTclUcl8j0q1k47Tlugi2J3zTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xhnv6cDEIDnEyb+5VaPQiLHw0DQrlG2/ydsIQ2G5Ccc=;
 b=2EJ9CcFPQjfNCC3gzye1OcenVGFWKSDlHcpR7mzY0hU+gkDiLnkX2PsM63a+95BiR/
 GE87eqVEl25eawKT32vBvLbzEe7cjpIChZYg+nC2zirltx/iJJJTRUAYFriZRHdfwxqF
 NRiFjuAj8PKLY0w41HRltNW8HlsUlHbAIAWaO/0H/DXqhRisnBVswt2cuO1+72BAgcvQ
 oH4u6oOmVZ2+HyWDy7qGPXS5Dn7CMpKLNs/I8XuFn7NYUAqhGkOxqlQYWXKv+QpBBDn2
 JSx3q09d7p7Te7yEZm+z80iRH1yFZQHjF2arM+B3fGKSHvVD8DjcX1SvakCABnzML72i
 2PkQ==
X-Gm-Message-State: AOAM530T+j/kuE4iFw9XqE7jPKkf6eeTfvsUgSdZwTQiGBpAflkWXZxx
 aBoRogNQPLnPJb3igBmN0wmteyl5eyXuOfx4ohn7uDh5
X-Google-Smtp-Source: ABdhPJybvUfdX2q7qyDOn3EoEltP4RfccQEeXuPfvGXhIUjPVAYm979+ajNi+U3OcUU99erUTtaxqBr7Cf5hMbIt47g=
X-Received: by 2002:a05:620a:f0b:: with SMTP id
 v11mr2103174qkl.243.1642051936456; 
 Wed, 12 Jan 2022 21:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20220112065350.20680-1-potin.lai@quantatw.com>
In-Reply-To: <20220112065350.20680-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jan 2022 05:32:04 +0000
Message-ID: <CACPK8Xfqu61phgbNRuD075ZXCRknWidBhnAa-3oVSZFa3m4ong@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 v2 1/1] hwmon: (pmbus) Add support for MPS
 Multi-phase mp5023
To: Potin Lai <potin.lai@quantatw.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Howard Chiu <howard.chiu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jan 2022 at 06:54, Potin Lai <potin.lai@quantatw.com> wrote:
>
> From: Howard Chiu <howard.chiu@quantatw.com>
>
> Add support for mp5023 device from Monolithic Power Systems, Inc. (MPS)
> vendor. This is a Hot-Swap Controller.
>
> Link: https://lore.kernel.org/r/HKAPR04MB400349AA406694FB976D78D096709@HKAPR04MB4003.apcprd04.prod.outlook.com
> Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
>
> ---
> Change since v1:
> - update commit message
> - add lore link for reference

Thanks, applied to dev-.5.15.

> ---
>  Documentation/hwmon/mp5023.rst | 84 ++++++++++++++++++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig    |  9 ++++
>  drivers/hwmon/pmbus/Makefile   |  1 +
>  drivers/hwmon/pmbus/mp5023.c   | 66 ++++++++++++++++++++++++++
>  4 files changed, 160 insertions(+)
>  create mode 100644 Documentation/hwmon/mp5023.rst
>  create mode 100644 drivers/hwmon/pmbus/mp5023.c
>
> diff --git a/Documentation/hwmon/mp5023.rst b/Documentation/hwmon/mp5023.rst
> new file mode 100644
> index 000000000000..af5ab1345a91
> --- /dev/null
> +++ b/Documentation/hwmon/mp5023.rst
> @@ -0,0 +1,84 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp5023
> +====================
> +
> +Supported chips:
> +
> +  * MPS MP5023
> +
> +    Prefix: 'mp5023'
> +
> +  * Datasheet
> +
> +    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5023.html
> +
> +Author:
> +
> +       Howard Chiu <howard.chiu@quantatw.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MP5023 Hot-Swap Controller.
> +
> +Device complaint with:
> +
> +- PMBus rev 1.3 interface.
> +
> +Device supports direct format for reading input voltage, output voltage,
> +output current, input power and temperature.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_alarm**
> +
> +**curr1_max**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +**power1_alarm**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index ffb609cee3a4..b56bd8542864 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -276,6 +276,15 @@ config SENSORS_MP2975
>           This driver can also be built as a module. If so, the module will
>           be called mp2975.
>
> +config SENSORS_MP5023
> +       tristate "MPS MP5023"
> +       help
> +         If you say yes here you get hardware monitoring support for MPS
> +         MP5023.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called mp5023.
> +
>  config SENSORS_PIM4328
>         tristate "Flex PIM4328 and compatibles"
>         help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 0ed4d596a948..61cdc24b1309 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_SENSORS_MAX34440)        += max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)  += max8688.o
>  obj-$(CONFIG_SENSORS_MP2888)   += mp2888.o
>  obj-$(CONFIG_SENSORS_MP2975)   += mp2975.o
> +obj-$(CONFIG_SENSORS_MP5023)   += mp5023.o
>  obj-$(CONFIG_SENSORS_PM6764TR) += pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)  += pxe1610.o
>  obj-$(CONFIG_SENSORS_Q54SJ108A2)       += q54sj108a2.o
> diff --git a/drivers/hwmon/pmbus/mp5023.c b/drivers/hwmon/pmbus/mp5023.c
> new file mode 100644
> index 000000000000..14d3934aa099
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp5023.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for MPS MP5023 Hot-Swap Controller
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info mp5023_info = {
> +       .pages = 1,
> +
> +       .format[PSC_VOLTAGE_IN] = direct,
> +       .format[PSC_VOLTAGE_OUT] = direct,
> +       .format[PSC_CURRENT_OUT] = direct,
> +       .format[PSC_POWER] = direct,
> +       .format[PSC_TEMPERATURE] = direct,
> +
> +       .m[PSC_VOLTAGE_IN] = 32,
> +       .b[PSC_VOLTAGE_IN] = 0,
> +       .R[PSC_VOLTAGE_IN] = 0,
> +       .m[PSC_VOLTAGE_OUT] = 32,
> +       .b[PSC_VOLTAGE_OUT] = 0,
> +       .R[PSC_VOLTAGE_OUT] = 0,
> +       .m[PSC_CURRENT_OUT] = 16,
> +       .b[PSC_CURRENT_OUT] = 0,
> +       .R[PSC_CURRENT_OUT] = 0,
> +       .m[PSC_POWER] = 1,
> +       .b[PSC_POWER] = 0,
> +       .R[PSC_POWER] = 0,
> +       .m[PSC_TEMPERATURE] = 2,
> +       .b[PSC_TEMPERATURE] = 0,
> +       .R[PSC_TEMPERATURE] = 0,
> +
> +       .func[0] =
> +               PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> +               PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
> +               PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static int mp5023_probe(struct i2c_client *client)
> +{
> +       return pmbus_do_probe(client, &mp5023_info);
> +}
> +
> +static const struct of_device_id __maybe_unused mp5023_of_match[] = {
> +       { .compatible = "mps,mp5023", },
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, mp5023_of_match);
> +
> +static struct i2c_driver mp5023_driver = {
> +       .driver = {
> +                  .name = "mp5023",
> +                  .of_match_table = of_match_ptr(mp5023_of_match),
> +       },
> +       .probe_new = mp5023_probe,
> +};
> +
> +module_i2c_driver(mp5023_driver);
> +
> +MODULE_AUTHOR("Howard Chiu <howard.chiu@quantatw.com>");
> +MODULE_DESCRIPTION("PMBus driver for MPS MP5023 HSC");
> +MODULE_LICENSE("GPL");
> --
> 2.17.1
>
