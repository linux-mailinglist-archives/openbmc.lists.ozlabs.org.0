Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3686E465D35
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 05:00:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4Mg06tK0z3036
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 15:00:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k45XcogS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=k45XcogS; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4MfZ2D6dz2xsM
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 14:59:48 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id j17so26321131qtx.2
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 19:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e03hkTYYhNtntXNdfwJrYiNB0zYNNGyB8YGnsLDz/Wg=;
 b=k45XcogSfN3tvw6GwzbCYrYEnnmdxwLgPheGVT3HvixOrhSM26AAHoPI8Ej1eVhtHh
 ooPwkPFUi9pT0cQSjmBjtMlbv4I5w55OlgwbU2PcUM/b7JhFSh7OaDq57BItHARkNAxk
 2mB3LZpjI3Qb2p39iLTaRyljmCgpslNLAm7c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e03hkTYYhNtntXNdfwJrYiNB0zYNNGyB8YGnsLDz/Wg=;
 b=RP4CcfO9z2Ln5TKledw9PX68ZE4johhoi+BAPFEkexNhYwb/Bn4v7ltTkO2a5cOhPy
 NhlF6R3FrrmANWL4JTOkLzCrOrYmMrew0Z25PuNEXl0kClaNW4t0wKGpwlnNV9p3FmS2
 yhoJ8GB9oTgPB0PuvcXU6U2Fy4JYlsOEss/R7dllZgF5qSrb9PEpDupdw//TpUpxf6XV
 zaWR4GK6xqTi8sXqBI/fJROHLkPjIiRIJg635b9cG0Z5OuaPwj2FjIHdtzh4QPYh/I2k
 5p5EsrL6YHk1mVSRshJYFtqTaYCNTzV/Q1PUPr1dNZpOkhKC5BaxknmxS7ExsMmsytd9
 KX1w==
X-Gm-Message-State: AOAM530diPXzzRujL+ikKQ6WU/ENzGSPkJboZhvIbuCr6I7M4ZVz/yG7
 9RkmEwN3v2unn2qT9BgrdnxARQVBUr25rPTh3IM=
X-Google-Smtp-Source: ABdhPJyN1i3+7cnSAM7hPWvGMsbxvT7aDIoy+Zltot4oHE3SXfjlf0iFtYMHz/t7OzIEMIO1AlvPKMW9laTRr5YBr74=
X-Received: by 2002:a05:622a:38d:: with SMTP id
 j13mr11502721qtx.159.1638417584452; 
 Wed, 01 Dec 2021 19:59:44 -0800 (PST)
MIME-Version: 1.0
References: <20211202022623.182903-1-howard.chiu@quantatw.com>
In-Reply-To: <20211202022623.182903-1-howard.chiu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Dec 2021 03:59:32 +0000
Message-ID: <CACPK8XcWt18nm0+BYomnWkRCRBqhYJ04y4c_P1nTczLpjyVXcA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] Porting tach driver for ast26xx from Aspeed
 linux
To: Howard Chiu <howard10703049@gmail.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>
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

On Thu, 2 Dec 2021 at 02:28, Howard Chiu <howard10703049@gmail.com> wrote:
>
> Aspeed did not commit tach driver to upstream for ast2600 series yet.
> To support ast26xx on OpenBMC, we need this driver and update the g6 device tree as well.
>
> Change-Id: I1714abf4fd08edead789439e5723b183d1b0d175
> Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>

Thanks for the ptach.

Aspeed are working on a driver for the 2600. You can see v14 here:

 https://lore.kernel.org/all/20211130055933.32708-1-billy_tsai@aspeedtech.com/

If you would like this driver to be added we can do so. As long as it
doesn't introduce new userspace ABI, we can carry the work in progress
version. I would ask that you help to update the openbmc version with
any changes Billy makes to the driver between v14 and the version that
gets accepted.

Let me know how you want to proceed.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi    |  22 ++
>  drivers/hwmon/Kconfig               |   8 +
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/tach-aspeed-ast2600.c | 388 ++++++++++++++++++++++++++++
>  4 files changed, 419 insertions(+)
>  create mode 100644 drivers/hwmon/tach-aspeed-ast2600.c
>
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 5106a424f1ce..ec249f450552 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -304,6 +304,28 @@ apb {
>                         #size-cells = <1>;
>                         ranges;
>
> +                       pwm_tach: pwm_tach@1e610000 {
> +                               compatible = "aspeed,ast2600-pwm-tach", "simple-mfd", "syscon";
> +                               reg = <0x1e610000 0x100>;
> +                               clocks = <&syscon ASPEED_CLK_AHB>;
> +                               resets = <&syscon ASPEED_RESET_PWM>;
> +
> +                               pwm: pwm {
> +                                       compatible = "aspeed,ast2600-pwm";
> +                                       #pwm-cells = <3>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       status = "disabled";
> +                               };
> +
> +                               tach: tach {
> +                                       compatible = "aspeed,ast2600-tach";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       status = "disabled";
> +                               };
> +                       };
> +
>                         syscon: syscon@1e6e2000 {
>                                 compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
>                                 reg = <0x1e6e2000 0x1000>;
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 64bd3dfba2c4..0eb307cb67fc 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -397,6 +397,14 @@ config SENSORS_ASPEED
>           This driver can also be built as a module. If so, the module
>           will be called aspeed_pwm_tacho.
>
> +config SENSORS_TACH_ASPEED_AST2600
> +       tristate "ASPEED ast2600 Tachometer support"
> +       help
> +         This driver provides support for Aspeed ast2600 Tachometer.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called tach-aspeed-ast2600.
> +
>  config SENSORS_ATXP1
>         tristate "Attansic ATXP1 VID controller"
>         depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index baee6a8d4dd1..ce66874c8ce2 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_ARM_SCMI)        += scmi-hwmon.o
>  obj-$(CONFIG_SENSORS_ARM_SCPI) += scpi-hwmon.o
>  obj-$(CONFIG_SENSORS_AS370)    += as370-hwmon.o
>  obj-$(CONFIG_SENSORS_ASC7621)  += asc7621.o
> +obj-$(CONFIG_SENSORS_TACH_ASPEED_AST2600) += tach-aspeed-ast2600.o
>  obj-$(CONFIG_SENSORS_ASPEED)   += aspeed-pwm-tacho.o
>  obj-$(CONFIG_SENSORS_ATXP1)    += atxp1.o
>  obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
> diff --git a/drivers/hwmon/tach-aspeed-ast2600.c b/drivers/hwmon/tach-aspeed-ast2600.c
> new file mode 100644
> index 000000000000..0b2551fc1711
> --- /dev/null
> +++ b/drivers/hwmon/tach-aspeed-ast2600.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) ASPEED Technology Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or later as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/errno.h>
> +#include <linux/delay.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/sysfs.h>
> +#include <linux/reset.h>
> +#include <linux/regmap.h>
> +/* TACH Control Register */
> +#define ASPEED_TACHO_CTRL_CH(ch) ((ch * 0x10) + 0x08)
> +#define TACHO_IER BIT(31) //enable tacho interrupt
> +#define TACHO_INVERS_LIMIT BIT(30) //inverse tacho limit comparison
> +#define TACHO_LOOPBACK BIT(29) //tacho loopback
> +#define TACHO_ENABLE BIT(28) //{enable tacho}
> +#define TACHO_DEBOUNCE_MASK (0x3 << 26) //{tacho de-bounce}
> +#define TACHO_DEBOUNCE_BIT (26) //{tacho de-bounce}
> +#define TECHIO_EDGE_MASK (0x3 << 24) //tacho edge}
> +#define TECHIO_EDGE_BIT (24) //tacho edge}
> +#define TACHO_CLK_DIV_T_MASK (0xf << 20)
> +#define TACHO_CLK_DIV_BIT (20)
> +#define TACHO_THRESHOLD_MASK (0xfffff) //tacho threshold bit
> +/* [27:26] */
> +#define DEBOUNCE_3_CLK 0x00 /* 10b */
> +#define DEBOUNCE_2_CLK 0x01 /* 10b */
> +#define DEBOUNCE_1_CLK 0x02 /* 10b */
> +#define DEBOUNCE_0_CLK 0x03 /* 10b */
> +/* [25:24] */
> +#define F2F_EDGES 0x00 /* 10b */
> +#define R2R_EDGES 0x01 /* 10b */
> +#define BOTH_EDGES 0x02 /* 10b */
> +/* [23:20] */
> +/* Cover rpm range 5~5859375 */
> +#define DEFAULT_TACHO_DIV 5
> +
> +/* TACH Status Register */
> +#define ASPEED_TACHO_STS_CH(x) ((x * 0x10) + 0x0C)
> +
> +/*PWM_TACHO_STS */
> +#define TACHO_ISR BIT(31) //interrupt status and clear
> +#define PWM_OUT BIT(25) //{pwm_out}
> +#define PWM_OEN BIT(24) //{pwm_oeN}
> +#define TACHO_DEB_INPUT BIT(23) //tacho deB input
> +#define TACHO_RAW_INPUT BIT(22) //tacho raw input}
> +#define TACHO_VALUE_UPDATE BIT(21) //tacho value updated since the last read
> +#define TACHO_FULL_MEASUREMENT BIT(20) //{tacho full measurement}
> +#define TACHO_VALUE_MASK 0xfffff //tacho value bit [19:0]}
> +/**********************************************************
> + * Software setting
> + *********************************************************/
> +#define DEFAULT_FAN_MIN_RPM 1000
> +#define DEFAULT_FAN_PULSE_PR 2
> +/*
> + * Add this value to avoid CPU consuming a lot of resources in waiting rpm
> + * updating. Assume the max rpm of fan is 60000, the period of updating tach
> + * value will equal to (1000000 * 2 * 60) / (2 * max_rpm) = 1000.
> + */
> +#define RPM_POLLING_PERIOD_US 1000
> +
> +struct aspeed_tacho_channel_params {
> +       int limited_inverse;
> +       u16 threshold;
> +       u8 tacho_edge;
> +       u8 tacho_debounce;
> +       u8 pulse_pr;
> +       u32 min_rpm;
> +       u32 divide;
> +       u32 sample_period; /* unit is us */
> +};
> +
> +struct aspeed_tach_data {
> +       struct regmap *regmap;
> +       unsigned long clk_freq;
> +       struct reset_control *reset;
> +       bool tach_present[16];
> +       struct aspeed_tacho_channel_params *tacho_channel;
> +       /* for hwmon */
> +       const struct attribute_group *groups[2];
> +};
> +
> +static u32 aspeed_get_fan_tach_sample_period(struct aspeed_tach_data *priv,
> +                                            u8 fan_tach_ch)
> +{
> +       u32 tach_period_us;
> +       u8 pulse_pr = priv->tacho_channel[fan_tach_ch].pulse_pr;
> +       u32 min_rpm = priv->tacho_channel[fan_tach_ch].min_rpm;
> +       /*
> +        * min(Tach input clock) = (PulsePR * minRPM) / 60
> +        * max(Tach input period) = 60 / (PulsePR * minRPM)
> +        * Tach sample period > 2 * max(Tach input period) = (2*60) / (PulsePR * minRPM)
> +        */
> +       tach_period_us = (1000000 * 2 * 60) / (pulse_pr * min_rpm);
> +       /* Add the margin (about 1.2) of tach sample period to avoid sample miss */
> +       tach_period_us = (tach_period_us * 1200) >> 10;
> +       pr_debug("tach%d sample period = %dus", fan_tach_ch, tach_period_us);
> +       return tach_period_us;
> +}
> +
> +static void aspeed_set_fan_tach_ch_enable(struct aspeed_tach_data *priv,
> +                                         u8 fan_tach_ch, bool enable,
> +                                         u32 tacho_div)
> +{
> +       u32 reg_value = 0;
> +
> +       if (enable) {
> +               /* divide = 2^(tacho_div*2) */
> +               priv->tacho_channel[fan_tach_ch].divide = 1 << (tacho_div << 1);
> +
> +               reg_value = TACHO_ENABLE |
> +                           (priv->tacho_channel[fan_tach_ch].tacho_edge
> +                            << TECHIO_EDGE_BIT) |
> +                           (tacho_div << TACHO_CLK_DIV_BIT) |
> +                           (priv->tacho_channel[fan_tach_ch].tacho_debounce
> +                            << TACHO_DEBOUNCE_BIT);
> +
> +               if (priv->tacho_channel[fan_tach_ch].limited_inverse)
> +                       reg_value |= TACHO_INVERS_LIMIT;
> +
> +               if (priv->tacho_channel[fan_tach_ch].threshold)
> +                       reg_value |=
> +                               (TACHO_IER |
> +                                priv->tacho_channel[fan_tach_ch].threshold);
> +
> +               regmap_write(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_ch),
> +                            reg_value);
> +
> +               priv->tacho_channel[fan_tach_ch].sample_period =
> +                       aspeed_get_fan_tach_sample_period(priv, fan_tach_ch);
> +       } else
> +               regmap_update_bits(priv->regmap,
> +                                  ASPEED_TACHO_CTRL_CH(fan_tach_ch),
> +                                  TACHO_ENABLE, 0);
> +}
> +
> +static int aspeed_get_fan_tach_ch_rpm(struct aspeed_tach_data *priv,
> +                                     u8 fan_tach_ch)
> +{
> +       u32 raw_data, tach_div, clk_source, usec, val;
> +       u64 rpm;
> +       int ret;
> +
> +       usec = priv->tacho_channel[fan_tach_ch].sample_period;
> +       /* Restart the Tach channel to guarantee the value is fresh */
> +       regmap_update_bits(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_ch),
> +                            TACHO_ENABLE, 0);
> +       regmap_update_bits(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_ch),
> +                            TACHO_ENABLE, TACHO_ENABLE);
> +       ret = regmap_read_poll_timeout(
> +               priv->regmap, ASPEED_TACHO_STS_CH(fan_tach_ch), val,
> +               (val & TACHO_FULL_MEASUREMENT) && (val & TACHO_VALUE_UPDATE),
> +               RPM_POLLING_PERIOD_US, usec);
> +
> +       if (ret) {
> +               /* return 0 if we didn't get an answer because of timeout*/
> +               if (ret == -ETIMEDOUT)
> +                       return 0;
> +               else
> +                       return ret;
> +       }
> +
> +       raw_data = val & TACHO_VALUE_MASK;
> +       /*
> +        * We need the mode to determine if the raw_data is double (from
> +        * counting both edges).
> +        */
> +       if (priv->tacho_channel[fan_tach_ch].tacho_edge == BOTH_EDGES)
> +               raw_data <<= 1;
> +
> +       tach_div = raw_data * (priv->tacho_channel[fan_tach_ch].divide) *
> +                  (priv->tacho_channel[fan_tach_ch].pulse_pr);
> +
> +       pr_debug("clk %ld, raw_data %d , tach_div %d\n", priv->clk_freq, raw_data, tach_div);
> +
> +       clk_source = priv->clk_freq;
> +
> +       if (tach_div == 0)
> +               return -EDOM;
> +
> +       rpm = (u64)clk_source * 60;
> +       do_div(rpm, tach_div);
> +
> +       return rpm;
> +}
> +
> +static ssize_t show_rpm(struct device *dev, struct device_attribute *attr,
> +                       char *buf)
> +{
> +       struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
> +       int index = sensor_attr->index;
> +       int rpm;
> +       struct aspeed_tach_data *priv = dev_get_drvdata(dev);
> +
> +       rpm = aspeed_get_fan_tach_ch_rpm(priv, index);
> +       if (rpm < 0)
> +               return rpm;
> +
> +       return sprintf(buf, "%d\n", rpm);
> +}
> +
> +static umode_t fan_dev_is_visible(struct kobject *kobj, struct attribute *a,
> +                                 int index)
> +{
> +       struct device *dev = container_of(kobj, struct device, kobj);
> +       struct aspeed_tach_data *priv = dev_get_drvdata(dev);
> +
> +       if (!priv->tach_present[index])
> +               return 0;
> +       return a->mode;
> +}
> +
> +static SENSOR_DEVICE_ATTR(fan1_input, 0444, show_rpm, NULL, 0);
> +static SENSOR_DEVICE_ATTR(fan2_input, 0444, show_rpm, NULL, 1);
> +static SENSOR_DEVICE_ATTR(fan3_input, 0444, show_rpm, NULL, 2);
> +static SENSOR_DEVICE_ATTR(fan4_input, 0444, show_rpm, NULL, 3);
> +static SENSOR_DEVICE_ATTR(fan5_input, 0444, show_rpm, NULL, 4);
> +static SENSOR_DEVICE_ATTR(fan6_input, 0444, show_rpm, NULL, 5);
> +static SENSOR_DEVICE_ATTR(fan7_input, 0444, show_rpm, NULL, 6);
> +static SENSOR_DEVICE_ATTR(fan8_input, 0444, show_rpm, NULL, 7);
> +static SENSOR_DEVICE_ATTR(fan9_input, 0444, show_rpm, NULL, 8);
> +static SENSOR_DEVICE_ATTR(fan10_input, 0444, show_rpm, NULL, 9);
> +static SENSOR_DEVICE_ATTR(fan11_input, 0444, show_rpm, NULL, 10);
> +static SENSOR_DEVICE_ATTR(fan12_input, 0444, show_rpm, NULL, 11);
> +static SENSOR_DEVICE_ATTR(fan13_input, 0444, show_rpm, NULL, 12);
> +static SENSOR_DEVICE_ATTR(fan14_input, 0444, show_rpm, NULL, 13);
> +static SENSOR_DEVICE_ATTR(fan15_input, 0444, show_rpm, NULL, 14);
> +static SENSOR_DEVICE_ATTR(fan16_input, 0444, show_rpm, NULL, 15);
> +static struct attribute *fan_dev_attrs[] = {
> +       &sensor_dev_attr_fan1_input.dev_attr.attr,
> +       &sensor_dev_attr_fan2_input.dev_attr.attr,
> +       &sensor_dev_attr_fan3_input.dev_attr.attr,
> +       &sensor_dev_attr_fan4_input.dev_attr.attr,
> +       &sensor_dev_attr_fan5_input.dev_attr.attr,
> +       &sensor_dev_attr_fan6_input.dev_attr.attr,
> +       &sensor_dev_attr_fan7_input.dev_attr.attr,
> +       &sensor_dev_attr_fan8_input.dev_attr.attr,
> +       &sensor_dev_attr_fan9_input.dev_attr.attr,
> +       &sensor_dev_attr_fan10_input.dev_attr.attr,
> +       &sensor_dev_attr_fan11_input.dev_attr.attr,
> +       &sensor_dev_attr_fan12_input.dev_attr.attr,
> +       &sensor_dev_attr_fan13_input.dev_attr.attr,
> +       &sensor_dev_attr_fan14_input.dev_attr.attr,
> +       &sensor_dev_attr_fan15_input.dev_attr.attr,
> +       &sensor_dev_attr_fan16_input.dev_attr.attr,
> +       NULL
> +};
> +
> +static const struct attribute_group fan_dev_group = {
> +       .attrs = fan_dev_attrs,
> +       .is_visible = fan_dev_is_visible,
> +};
> +
> +static void aspeed_create_fan_tach_channel(struct aspeed_tach_data *priv,
> +                                          u32 tach_ch, int count,
> +                                          u32 fan_pulse_pr, u32 fan_min_rpm,
> +                                          u32 tacho_div)
> +{
> +       priv->tach_present[tach_ch] = true;
> +       priv->tacho_channel[tach_ch].pulse_pr = fan_pulse_pr;
> +       priv->tacho_channel[tach_ch].min_rpm = fan_min_rpm;
> +       priv->tacho_channel[tach_ch].limited_inverse = 0;
> +       priv->tacho_channel[tach_ch].threshold = 0;
> +       priv->tacho_channel[tach_ch].tacho_edge = F2F_EDGES;
> +       priv->tacho_channel[tach_ch].tacho_debounce = DEBOUNCE_3_CLK;
> +       aspeed_set_fan_tach_ch_enable(priv, tach_ch, true, tacho_div);
> +}
> +
> +static int aspeed_tach_create_fan(struct device *dev, struct device_node *child,
> +                                 struct aspeed_tach_data *priv)
> +{
> +       u32 fan_pulse_pr, fan_min_rpm;
> +       u32 tacho_div;
> +       u32 tach_channel;
> +       int ret, count;
> +
> +       ret = of_property_read_u32(child, "reg", &tach_channel);
> +       if (ret)
> +               return ret;
> +
> +       ret = of_property_read_u32(child, "aspeed,pulse-pr", &fan_pulse_pr);
> +       if (ret)
> +               fan_pulse_pr = DEFAULT_FAN_PULSE_PR;
> +
> +       ret = of_property_read_u32(child, "aspeed,min-rpm", &fan_min_rpm);
> +       if (ret)
> +               fan_min_rpm = DEFAULT_FAN_MIN_RPM;
> +
> +       ret = of_property_read_u32(child, "aspeed,tach-div", &tacho_div);
> +       if (ret)
> +               tacho_div = DEFAULT_TACHO_DIV;
> +
> +       aspeed_create_fan_tach_channel(priv, tach_channel, count, fan_pulse_pr,
> +                                      fan_min_rpm, tacho_div);
> +
> +       return 0;
> +}
> +
> +static int aspeed_tach_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np, *child;
> +       struct aspeed_tach_data *priv;
> +       struct device *hwmon;
> +       struct clk *clk;
> +       int ret;
> +
> +       np = dev->parent->of_node;
> +       dev_info(dev, "tach probe start\n");
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->tacho_channel = devm_kzalloc(
> +               dev, 16 * sizeof(*priv->tacho_channel), GFP_KERNEL);
> +
> +       priv->regmap = syscon_node_to_regmap(np);
> +       if (IS_ERR(priv->regmap)) {
> +               dev_err(dev, "Couldn't get regmap\n");
> +               return -ENODEV;
> +       }
> +
> +       clk = of_clk_get(np, 0);
> +       if (IS_ERR(clk))
> +               return -ENODEV;
> +       priv->clk_freq = clk_get_rate(clk);
> +
> +       priv->reset = of_reset_control_get_shared(np, NULL);
> +       if (IS_ERR(priv->reset)) {
> +               dev_err(&pdev->dev, "can't get aspeed_pwm_tacho reset\n");
> +               return PTR_ERR(priv->reset);
> +       }
> +
> +       //scu init
> +       reset_control_deassert(priv->reset);
> +
> +       for_each_child_of_node(dev->of_node, child) {
> +               ret = aspeed_tach_create_fan(dev, child, priv);
> +               if (ret) {
> +                       of_node_put(child);
> +                       return ret;
> +               }
> +       }
> +
> +       priv->groups[0] = &fan_dev_group;
> +       priv->groups[1] = NULL;
> +       dev_info(dev, "tach probe done\n");
> +       hwmon = devm_hwmon_device_register_with_groups(dev, "aspeed_tach", priv,
> +                                                      priv->groups);
> +
> +       return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static const struct of_device_id of_stach_match_table[] = {
> +       {
> +               .compatible = "aspeed,ast2600-tach",
> +       },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, of_stach_match_table);
> +
> +static struct platform_driver aspeed_tach_driver = {
> +       .probe          = aspeed_tach_probe,
> +       .driver         = {
> +               .name   = "aspeed_tach",
> +               .of_match_table = of_stach_match_table,
> +       },
> +};
> +
> +module_platform_driver(aspeed_tach_driver);
> +
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> +MODULE_DESCRIPTION("ASPEED Fan tach device driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
