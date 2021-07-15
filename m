Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF99F3CA4B2
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 19:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQhcK3yzsz302g
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 03:45:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bUcXYo7t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bUcXYo7t; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQhbx6x3Zz2xvL;
 Fri, 16 Jul 2021 03:45:33 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 v32-20020a0568300920b02904b90fde9029so7015243ott.7; 
 Thu, 15 Jul 2021 10:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5pm/vGNm6HR/ZlGn8wzSicJm3udUgAH8l7zQoarCAB8=;
 b=bUcXYo7tzmzj5Ee3JOX/IQiavcAaLEq9u43vNNSKcCNfqXwU15IMZmqlkaF00s0td+
 UqqqKZPmIMvKdB4MdigknqsAA/kjA3i7YxmgCdShScP5MJNNStUKfTL5NywH9sucnt/t
 jCTHgjiBrf000Et5QM/vSEQbDcHx90fduRZsDLGxQtVyHAPzHmgq1nKo2dG4aVdtTaFL
 LVcfGKAe7oVVK7uQfV4xMFNBaltjApHv1SxektNaicuD8eh88KP6LsGSKZuL9JUBxbeF
 /5bMCOKH2CHzK2fBIIggAhRuJKRNTnlY4pX2tdy2GD+bqW8ucf65XB7p1T0mC0EnwBFW
 hr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=5pm/vGNm6HR/ZlGn8wzSicJm3udUgAH8l7zQoarCAB8=;
 b=i1OeHnsaowK7PEn+b7vdWHGHFQNamBpQcGU5eB67+SQnQ2MPDiQG8Qz1cheZTnZSNK
 vBmhKKv36KUzvJNTGR9ZIS7ymnTHTK2YWrmKcxg8WbHNaO3qcfEGwSTS0X2bXnOlQGzd
 eZy/7SeoR3jinQ3f/+NErZ6yp8BqExot+6gjkpIaJ2ad27qbJBQCUB8Zk2Ldk2T4uthr
 oEpuK7Ro2UkoIGCaaBRmLTxbiEW2kDOfO0RNHhA3MNcYUBeTvvPEKC5h8lrEbQ/6gsAd
 sfyYHMIBnl+C6/oVMxv1rlvkj1BaYYp2zIF0x74LTqpe66PoVeeuLme3oFfKShG5k3Yx
 ZV/g==
X-Gm-Message-State: AOAM532T5SaqaVYad3H1cYqz2KTBqO0T2ed33j5b7UZpAEdnbQVuzhFH
 ZosFmLZfjNX5kSTJPuuHTjE=
X-Google-Smtp-Source: ABdhPJx0++C8x38QHQqEE7cl6WMOUcfqAFmNISIuB2UFRxXP0talRuDtF6z4/YEqx8NxrzsSKVoPfg==
X-Received: by 2002:a9d:2d83:: with SMTP id g3mr4734299otb.228.1626371130020; 
 Thu, 15 Jul 2021 10:45:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v203sm1383141oib.37.2021.07.15.10.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 10:45:29 -0700 (PDT)
Date: Thu, 15 Jul 2021 10:45:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 11/14] hwmon: peci: Add cputemp driver
Message-ID: <20210715174527.GA3012477@roeck-us.net>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-12-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712220447.957418-12-iwona.winiarska@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 13, 2021 at 12:04:44AM +0200, Iwona Winiarska wrote:
> Add peci-cputemp driver for Digital Thermal Sensor (DTS) thermal
> readings of the processor package and processor cores that are
> accessible via the PECI interface.
> 
> The main use case for the driver (and PECI interface) is out-of-band
> management, where we're able to obtain the DTS readings from an external
> entity connected with PECI, e.g. BMC on server platforms.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Note: Due to lack of revision information, this review does not take
any previous discussions into account, and it may miss critical information.
For a final review I'll have to compare the code against earlier versions
to determine if there are any relevant changes and if all comments
have been addressed. This may take some time.

> ---
>  MAINTAINERS                  |   7 +
>  drivers/hwmon/Kconfig        |   2 +
>  drivers/hwmon/Makefile       |   1 +
>  drivers/hwmon/peci/Kconfig   |  18 ++
>  drivers/hwmon/peci/Makefile  |   5 +
>  drivers/hwmon/peci/common.h  |  46 ++++
>  drivers/hwmon/peci/cputemp.c | 503 +++++++++++++++++++++++++++++++++++
>  7 files changed, 582 insertions(+)
>  create mode 100644 drivers/hwmon/peci/Kconfig
>  create mode 100644 drivers/hwmon/peci/Makefile
>  create mode 100644 drivers/hwmon/peci/common.h
>  create mode 100644 drivers/hwmon/peci/cputemp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f47b5f634293..35ba9e3646bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14504,6 +14504,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/peaq-wmi.c
>  
> +PECI HARDWARE MONITORING DRIVERS
> +M:	Iwona Winiarska <iwona.winiarska@intel.com>
> +R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	drivers/hwmon/peci/
> +
>  PECI SUBSYSTEM
>  M:	Iwona Winiarska <iwona.winiarska@intel.com>
>  R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e3675377bc5d..61c0e3404415 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1507,6 +1507,8 @@ config SENSORS_PCF8591
>  	  These devices are hard to detect and rarely found on mainstream
>  	  hardware. If unsure, say N.
>  
> +source "drivers/hwmon/peci/Kconfig"
> +
>  source "drivers/hwmon/pmbus/Kconfig"
>  
>  config SENSORS_PWM_FAN
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d712c61c1f5e..f52331f212ed 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -202,6 +202,7 @@ obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
>  obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
>  
>  obj-$(CONFIG_SENSORS_OCC)	+= occ/
> +obj-$(CONFIG_SENSORS_PECI)	+= peci/
>  obj-$(CONFIG_PMBUS)		+= pmbus/
>  
>  ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
> new file mode 100644
> index 000000000000..e10eed68d70a
> --- /dev/null
> +++ b/drivers/hwmon/peci/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SENSORS_PECI_CPUTEMP
> +	tristate "PECI CPU temperature monitoring client"
> +	depends on PECI
> +	select SENSORS_PECI
> +	select PECI_CPU
> +	help
> +	  If you say yes here you get support for the generic Intel PECI
> +	  cputemp driver which provides Digital Thermal Sensor (DTS) thermal
> +	  readings of the CPU package and CPU cores that are accessible via
> +	  the processor PECI interface.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called peci-cputemp.
> +
> +config SENSORS_PECI
> +	tristate
> diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
> new file mode 100644
> index 000000000000..e8a0ada5ab1f
> --- /dev/null
> +++ b/drivers/hwmon/peci/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +peci-cputemp-y := cputemp.o
> +
> +obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+= peci-cputemp.o
> diff --git a/drivers/hwmon/peci/common.h b/drivers/hwmon/peci/common.h
> new file mode 100644
> index 000000000000..54580c100d06
> --- /dev/null
> +++ b/drivers/hwmon/peci/common.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2021 Intel Corporation */
> +
> +#include <linux/types.h>
> +
> +#ifndef __PECI_HWMON_COMMON_H
> +#define __PECI_HWMON_COMMON_H
> +
> +#define UPDATE_INTERVAL_DEFAULT		HZ
> +
> +/**
> + * struct peci_sensor_data - PECI sensor information
> + * @valid: flag to indicate the sensor value is valid
> + * @value: sensor value in milli units
> + * @last_updated: time of the last update in jiffies
> + */
> +struct peci_sensor_data {
> +	unsigned int valid;

Please use bool.

> +	s32 value;
> +	unsigned long last_updated;
> +};
> +
> +/**
> + * peci_sensor_need_update() - check whether sensor update is needed or not
> + * @sensor: pointer to sensor data struct
> + *
> + * Return: true if update is needed, false if not.
> + */
> +
> +static inline bool peci_sensor_need_update(struct peci_sensor_data *sensor)
> +{
> +	return !sensor->valid ||
> +	       time_after(jiffies, sensor->last_updated + UPDATE_INTERVAL_DEFAULT);


Since there is no other update interval, _DEFAULT does not have any value.
Please drop. Also, please select a prefix such as PECI_.

> +}
> +
> +/**
> + * peci_sensor_mark_updated() - mark the sensor is updated
> + * @sensor: pointer to sensor data struct
> + */
> +static inline void peci_sensor_mark_updated(struct peci_sensor_data *sensor)
> +{
> +	sensor->valid = 1;

		= true;

> +	sensor->last_updated = jiffies;
> +}
> +
> +#endif /* __PECI_HWMON_COMMON_H */
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> new file mode 100644
> index 000000000000..56a526471687
> --- /dev/null
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -0,0 +1,503 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2018-2021 Intel Corporation
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/peci.h>
> +#include <linux/peci-cpu.h>
> +#include <linux/units.h>
> +#include <linux/x86/intel-family.h>
> +
> +#include "common.h"
> +
> +#define CORE_NUMS_MAX		64
> +
> +#define DEFAULT_CHANNEL_NUMS	5
> +#define CORETEMP_CHANNEL_NUMS	CORE_NUMS_MAX
> +#define CPUTEMP_CHANNEL_NUMS	(DEFAULT_CHANNEL_NUMS + CORETEMP_CHANNEL_NUMS)
> +
> +#define TEMP_TARGET_FAN_TEMP_MASK	GENMASK(15, 8)
> +#define TEMP_TARGET_REF_TEMP_MASK	GENMASK(23, 16)
> +#define TEMP_TARGET_TJ_OFFSET_MASK	GENMASK(29, 24)
> +
> +#define DTS_MARGIN_MASK		GENMASK(15, 0)
> +#define PCS_MODULE_TEMP_MASK	GENMASK(15, 0)
> +
> +#define DTS_FIXED_POINT_FRACTION	64
> +
> +struct resolved_cores_reg {
> +	u8 bus;
> +	u8 dev;
> +	u8 func;
> +	u8 offset;
> +};
> +
> +struct cpu_info {
> +	struct resolved_cores_reg *reg;
> +	u8 min_peci_revision;
> +};
> +
> +struct peci_cputemp {
> +	struct peci_device *peci_dev;
> +	struct device *dev;
> +	const char *name;
> +	const struct cpu_info *gen_info;
> +	struct {
> +		struct peci_sensor_data die;
> +		struct peci_sensor_data dts;
> +		struct peci_sensor_data tcontrol;
> +		struct peci_sensor_data tthrottle;
> +		struct peci_sensor_data tjmax;
> +		struct peci_sensor_data core[CORETEMP_CHANNEL_NUMS];
> +	} temp;
> +	const char **coretemp_label;
> +	DECLARE_BITMAP(core_mask, CORE_NUMS_MAX);
> +};
> +
> +enum cputemp_channels {
> +	channel_die,
> +	channel_dts,
> +	channel_tcontrol,
> +	channel_tthrottle,
> +	channel_tjmax,
> +	channel_core,
> +};
> +
> +static const char *cputemp_label[DEFAULT_CHANNEL_NUMS] = {
> +	"Die",
> +	"DTS",
> +	"Tcontrol",
> +	"Tthrottle",
> +	"Tjmax",
> +};
> +
> +static int get_temp_targets(struct peci_cputemp *priv)
> +{
> +	s32 tthrottle_offset, tcontrol_margin;
> +	u32 pcs;
> +	int ret;
> +
> +	/*
> +	 * Just use only the tcontrol marker to determine if target values need
> +	 * update.
> +	 */
> +	if (!peci_sensor_need_update(&priv->temp.tcontrol))
> +		return 0;
> +
True for the entire code: Please explain how this avoids race conditions
without locking between the condition check here and the call to
peci_sensor_mark_updated() below. The explanation needs to be added
as comment into the code for later reference.

> +	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_TEMP_TARGET, 0, &pcs);
> +	if (ret)
> +		return ret;
> +
> +	priv->temp.tjmax.value = FIELD_GET(TEMP_TARGET_REF_TEMP_MASK, pcs) * MILLIDEGREE_PER_DEGREE;
> +
> +	tcontrol_margin = FIELD_GET(TEMP_TARGET_FAN_TEMP_MASK, pcs);
> +	tcontrol_margin = sign_extend32(tcontrol_margin, 7) * MILLIDEGREE_PER_DEGREE;
> +	priv->temp.tcontrol.value = priv->temp.tjmax.value - tcontrol_margin;
> +
> +	tthrottle_offset = FIELD_GET(TEMP_TARGET_TJ_OFFSET_MASK, pcs) * MILLIDEGREE_PER_DEGREE;
> +	priv->temp.tthrottle.value = priv->temp.tjmax.value - tthrottle_offset;
> +
> +	peci_sensor_mark_updated(&priv->temp.tcontrol);
> +
> +	return 0;
> +}
> +
> +/*
> + * Processors return a value of DTS reading in S10.6 fixed point format
> + * (sign, 10 bits signed integer value, 6 bits fractional).
> + * Error codes:
> + *   0x8000: General sensor error
> + *   0x8001: Reserved
> + *   0x8002: Underflow on reading value
> + *   0x8003-0x81ff: Reserved
> + */
> +static bool dts_valid(s32 val)
> +{
> +	return val < 0x8000 || val > 0x81ff;
> +}
> +
> +static s32 dts_to_millidegree(s32 val)
> +{
> +	return sign_extend32(val, 15) * MILLIDEGREE_PER_DEGREE / DTS_FIXED_POINT_FRACTION;
> +}
> +
> +static int get_die_temp(struct peci_cputemp *priv)
> +{
> +	s16 temp;
> +	int ret;
> +
> +	if (!peci_sensor_need_update(&priv->temp.die))
> +		return 0;
> +
> +	ret = peci_temp_read(priv->peci_dev, &temp);
> +	if (ret)
> +		return ret;
> +
> +	if (!dts_valid(temp))
> +		return -EIO;
> +
> +	/* Note that the tjmax should be available before calling it */
> +	priv->temp.die.value = priv->temp.tjmax.value + dts_to_millidegree(temp);
> +
> +	peci_sensor_mark_updated(&priv->temp.die);
> +
> +	return 0;
> +}
> +
> +static int get_dts(struct peci_cputemp *priv)
> +{
> +	s32 dts_margin;
> +	u32 pcs;
> +	int ret;
> +
> +	if (!peci_sensor_need_update(&priv->temp.dts))
> +		return 0;
> +
> +	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_THERMAL_MARGIN, 0, &pcs);
> +	if (ret)
> +		return ret;
> +
> +	dts_margin = FIELD_GET(DTS_MARGIN_MASK, pcs);
> +	if (!dts_valid(dts_margin))
> +		return -EIO;
> +
> +	/* Note that the tcontrol should be available before calling it */
> +	priv->temp.dts.value = priv->temp.tcontrol.value - dts_to_millidegree(dts_margin);
> +
> +	peci_sensor_mark_updated(&priv->temp.dts);
> +
> +	return 0;
> +}
> +
> +static int get_core_temp(struct peci_cputemp *priv, int core_index)
> +{
> +	s32 core_dts_margin;
> +	u32 pcs;
> +	int ret;
> +
> +	if (!peci_sensor_need_update(&priv->temp.core[core_index]))
> +		return 0;
> +
> +	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_MODULE_TEMP, core_index, &pcs);
> +	if (ret)
> +		return ret;
> +
> +	core_dts_margin = FIELD_GET(PCS_MODULE_TEMP_MASK, pcs);
> +	if (!dts_valid(core_dts_margin))
> +		return -EIO;
> +
> +	/* Note that the tjmax should be available before calling it */
> +	priv->temp.core[core_index].value =
> +		priv->temp.tjmax.value + dts_to_millidegree(core_dts_margin);
> +
> +	peci_sensor_mark_updated(&priv->temp.core[core_index]);
> +
> +	return 0;
> +}
> +
> +static int cputemp_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	struct peci_cputemp *priv = dev_get_drvdata(dev);
> +
> +	if (attr != hwmon_temp_label)
> +		return -EOPNOTSUPP;
> +
> +	*str = channel < channel_core ?
> +		cputemp_label[channel] : priv->coretemp_label[channel - channel_core];
> +
> +	return 0;
> +}
> +
> +static int cputemp_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	struct peci_cputemp *priv = dev_get_drvdata(dev);
> +	int ret, core_index;
> +
> +	ret = get_temp_targets(priv);
> +	if (ret)
> +		return ret;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		switch (channel) {
> +		case channel_die:
> +			ret = get_die_temp(priv);
> +			if (ret)
> +				return ret;
> +
> +			*val = priv->temp.die.value;
> +			break;
> +		case channel_dts:
> +			ret = get_dts(priv);
> +			if (ret)
> +				return ret;
> +
> +			*val = priv->temp.dts.value;
> +			break;
> +		case channel_tcontrol:
> +			*val = priv->temp.tcontrol.value;
> +			break;
> +		case channel_tthrottle:
> +			*val = priv->temp.tthrottle.value;
> +			break;
> +		case channel_tjmax:
> +			*val = priv->temp.tjmax.value;
> +			break;
> +		default:
> +			core_index = channel - channel_core;
> +			ret = get_core_temp(priv, core_index);
> +			if (ret)
> +				return ret;
> +
> +			*val = priv->temp.core[core_index].value;
> +			break;
> +		}
> +		break;
> +	case hwmon_temp_max:
> +		*val = priv->temp.tcontrol.value;
> +		break;
> +	case hwmon_temp_crit:
> +		*val = priv->temp.tjmax.value;
> +		break;
> +	case hwmon_temp_crit_hyst:
> +		*val = priv->temp.tjmax.value - priv->temp.tcontrol.value;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t cputemp_is_visible(const void *data, enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	const struct peci_cputemp *priv = data;
> +
> +	if (channel > CPUTEMP_CHANNEL_NUMS)
> +		return 0;
> +
> +	if (channel < channel_core)
> +		return 0444;
> +
> +	if (test_bit(channel - channel_core, priv->core_mask))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static int init_core_mask(struct peci_cputemp *priv)
> +{
> +	struct peci_device *peci_dev = priv->peci_dev;
> +	struct resolved_cores_reg *reg = priv->gen_info->reg;
> +	u64 core_mask;
> +	u32 data;
> +	int ret;
> +
> +	/* Get the RESOLVED_CORES register value */
> +	switch (peci_dev->info.model) {
> +	case INTEL_FAM6_ICELAKE_X:
> +	case INTEL_FAM6_ICELAKE_D:
> +		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
> +					     reg->func, reg->offset + 4, &data);
> +		if (ret)
> +			return ret;
> +
> +		core_mask = (u64)data << 32;
> +
> +		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
> +					     reg->func, reg->offset, &data);
> +		if (ret)
> +			return ret;
> +
> +		core_mask |= data;
> +
> +		break;
> +	default:
> +		ret = peci_pci_local_read(peci_dev, reg->bus, reg->dev,
> +					  reg->func, reg->offset, &data);
> +		if (ret)
> +			return ret;
> +
> +		core_mask = data;
> +
> +		break;
> +	}
> +
> +	if (!core_mask)
> +		return -EIO;
> +
> +	bitmap_from_u64(priv->core_mask, core_mask);
> +
> +	return 0;
> +}
> +
> +static int create_temp_label(struct peci_cputemp *priv)
> +{
> +	unsigned long core_max = find_last_bit(priv->core_mask, CORE_NUMS_MAX);
> +	int i;
> +
> +	priv->coretemp_label = devm_kzalloc(priv->dev, core_max * sizeof(char *), GFP_KERNEL);
> +	if (!priv->coretemp_label)
> +		return -ENOMEM;
> +
> +	for_each_set_bit(i, priv->core_mask, CORE_NUMS_MAX) {
> +		priv->coretemp_label[i] = devm_kasprintf(priv->dev, GFP_KERNEL, "Core %d", i);
> +		if (!priv->coretemp_label[i])
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void check_resolved_cores(struct peci_cputemp *priv)
> +{
> +	int ret;
> +
> +	ret = init_core_mask(priv);
> +	if (ret)
> +		return;
> +
> +	ret = create_temp_label(priv);
> +	if (ret)
> +		bitmap_zero(priv->core_mask, CORE_NUMS_MAX);

This needs a comment explaining why it is ok to ignore the above errors.

I understand it is because the non-core data will still be available.
Yet, it still needs to be explained so others don't need to examine
the code to figure out the reason.

> +}
> +
> +static const struct hwmon_ops peci_cputemp_ops = {
> +	.is_visible = cputemp_is_visible,
> +	.read_string = cputemp_read_string,
> +	.read = cputemp_read,
> +};
> +
> +static const u32 peci_cputemp_temp_channel_config[] = {
> +	/* Die temperature */
> +	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST,
> +	/* DTS margin */
> +	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST,
> +	/* Tcontrol temperature */
> +	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_CRIT,
> +	/* Tthrottle temperature */
> +	HWMON_T_LABEL | HWMON_T_INPUT,
> +	/* Tjmax temperature */
> +	HWMON_T_LABEL | HWMON_T_INPUT,
> +	/* Core temperature - for all core channels */
> +	[channel_core ... CPUTEMP_CHANNEL_NUMS - 1] = HWMON_T_LABEL | HWMON_T_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info peci_cputemp_temp_channel = {
> +	.type = hwmon_temp,
> +	.config = peci_cputemp_temp_channel_config,
> +};
> +
> +static const struct hwmon_channel_info *peci_cputemp_info[] = {
> +	&peci_cputemp_temp_channel,
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info peci_cputemp_chip_info = {
> +	.ops = &peci_cputemp_ops,
> +	.info = peci_cputemp_info,
> +};
> +
> +static int peci_cputemp_probe(struct auxiliary_device *adev,
> +			      const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct peci_device *peci_dev = to_peci_device(dev->parent);
> +	struct peci_cputemp *priv;
> +	struct device *hwmon_dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->name = devm_kasprintf(dev, GFP_KERNEL, "peci_cputemp.cpu%d",
> +				    peci_dev->info.socket_id);
> +	if (!priv->name)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, priv);

What is this used for ?

> +	priv->dev = dev;
> +	priv->peci_dev = peci_dev;
> +	priv->gen_info = (const struct cpu_info *)id->driver_data;
> +
> +	check_resolved_cores(priv);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(priv->dev, priv->name,
> +							 priv, &peci_cputemp_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct resolved_cores_reg resolved_cores_reg_hsx = {
> +	.bus = 1,
> +	.dev = 30,
> +	.func = 3,
> +	.offset = 0xb4,
> +};
> +
> +static struct resolved_cores_reg resolved_cores_reg_icx = {
> +	.bus = 14,
> +	.dev = 30,
> +	.func = 3,
> +	.offset = 0xd0,
> +};

Please explain those magic numbers.

> +
> +static const struct cpu_info cpu_hsx = {
> +	.reg		= &resolved_cores_reg_hsx,
> +	.min_peci_revision = 0x30,
> +};
> +
> +static const struct cpu_info cpu_icx = {
> +	.reg		= &resolved_cores_reg_icx,
> +	.min_peci_revision = 0x40,
> +};
> +
> +static const struct auxiliary_device_id peci_cputemp_ids[] = {
> +	{
> +		.name = "peci_cpu.cputemp.hsx",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.bdx",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.bdxd",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.skx",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.icx",
> +		.driver_data = (kernel_ulong_t)&cpu_icx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.icxd",
> +		.driver_data = (kernel_ulong_t)&cpu_icx,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
> +
> +static struct auxiliary_driver peci_cputemp_driver = {
> +	.probe		= peci_cputemp_probe,
> +	.id_table	= peci_cputemp_ids,
> +};
> +
> +module_auxiliary_driver(peci_cputemp_driver);
> +
> +MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
> +MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
> +MODULE_DESCRIPTION("PECI cputemp driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PECI_CPU);
