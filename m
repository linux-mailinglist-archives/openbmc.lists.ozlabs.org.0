Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23B46930D
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 10:57:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6zPD2Zh5z2yYJ
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 20:57:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ETm3iVEu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ETm3iVEu; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6zNs5Db8z2yN4
 for <openbmc@lists.ozlabs.org>; Mon,  6 Dec 2021 20:56:59 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id p4so10561476qkm.7
 for <openbmc@lists.ozlabs.org>; Mon, 06 Dec 2021 01:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FTxSVifK8Hu/V6iR9p3D6cb2wEn9UmxmhCFJgCWZ3qk=;
 b=ETm3iVEuJUAQkLSM26dW+oKXqMtoI8f4dIyM4T7pVN5CGjskSm4DWh1kPWZ2nNx/ec
 fq9541e0H2hM7ZPNx8zpjz0Z4xs2vP1VrsgKpi0KIC4Z9rrQzNXcbMr1hWbdC9frVaud
 1VanXTSHlwtNAl8qYcpLVR3SfZAppaflrrXIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTxSVifK8Hu/V6iR9p3D6cb2wEn9UmxmhCFJgCWZ3qk=;
 b=RTsOXJH2sAUQUhrlviEPeXu7ErZxuJ+ugraFmGYsZ8MdVxcc4zYZZSG409s5cQB9ER
 fm0t95PJyIKrbQUShtwwy8HlIH8uvectRbBTfvLyuaARFTWXreq2ysmHGLiUWvixAZaS
 mgWwfTEvr50BxUEqJp8naOCxZ33XPCQOnTtPzL8ac7WVcM61O7L+EjdszKI3Ul1u/3uM
 d01u9Wf6nhcU1NqynSLOCZur8xQ2OAy5Y0ZY3UOAIBjRk3vH/NslMfg31EPPtGaxnLYz
 mHo1fAyLbEwk61gIu6+1yCrsBchsogHcEqVq6PHEscbotAey8S+OlzVuSGiMiUESjF6c
 6EjA==
X-Gm-Message-State: AOAM530vSZxxYAHJTIkgh0sx5zGAAScUt96fX6VTZjyHMDh7+Ig91RkJ
 6fVh3t3iS+f67oRW1eUXI7v/RJIvd6SMI6o4tgs=
X-Google-Smtp-Source: ABdhPJwSuwe0QEGFtIhmHtQElik/xfA5hY6favot7MuwfQMPDPyj9PbHZoY2dKUOpt5yNvb+Vag3Jz4A4jhWgThE3qA=
X-Received: by 2002:a05:620a:28c7:: with SMTP id
 l7mr30768675qkp.346.1638784615709; 
 Mon, 06 Dec 2021 01:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20211206094705.282598-1-howard.chiu@quantatw.com>
In-Reply-To: <20211206094705.282598-1-howard.chiu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Dec 2021 09:56:43 +0000
Message-ID: <CACPK8XemXFzdeadN6MofeNiNd8W4Gb0a0JuKqCgzkvjCOK6PsA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] hwmon: (pmbus) Add support for MPS
 Multi-phase mp5023 controller (Pre-release)
To: Howard Chiu <howard10703049@gmail.com>
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

Hi Howard,

On Mon, 6 Dec 2021 at 09:49, Howard Chiu <howard10703049@gmail.com> wrote:
>
> Add support for mp5023 device from Monolithic Power Systems, Inc. (MPS)
> vendor. This is a Hot-Swap Controller
>
> This patch is a pre-release version for OpenBMC because I did not documentate it well yet.

It would be helpful if you linked to the upstream submission, if
you've made one.

This is a very simple patch, and Gunter is a very responsive
maintainer. I strongly encourage you to submit it upstream and then we
can merge that version into the openbmc tree.

>
> Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> Change-Id: Ice992a1681e3800eb2b16d1622ab78eed0b4113f

Please remove your Gerrit Change-Id lines, we do not keep them in the
kernel tree. If you run scripts/checkpatch.pl on your file before
submitting, it will produce a warning about this.

Please run checkpatch against all of your patches before submitting.

FInally, you mention dev-4.7 in your subject. We don't maintain that
tree anymore; I am only merging patches for dev-5.15. Please test your
patches against that kernel version and resubmit.

Cheers,

Joel

> ---
>  drivers/hwmon/pmbus/Kconfig  |  9 +++++
>  drivers/hwmon/pmbus/Makefile |  1 +
>  drivers/hwmon/pmbus/mp5023.c | 66 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 76 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/mp5023.c
>
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
> index 000000000000..2d2048c9765e
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp5023.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for MPS MP5023 Hot-Swap Controller
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
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
> 2.25.1
>
