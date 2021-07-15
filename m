Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C119D3CA4D1
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 19:56:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQhrb4wK2z309k
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 03:56:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Fe/dsQ4y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fe/dsQ4y; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQhr948W8z2yMW;
 Fri, 16 Jul 2021 03:56:08 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id t143so7617760oie.8;
 Thu, 15 Jul 2021 10:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3j+IshXduJ+JiACR/o7YJgbWltf/wpMz0/KQVcDII9c=;
 b=Fe/dsQ4y1KV2aCXZ8Gh/DDT/RyQHxdwKFm9j3MZQLEiFvedzVWOT8Hh2ZqPaDdsqLd
 GWENYu2s8bNDR4WVdNHfj1tRagomAUQ3UJsTbAtxWL1e+l3r4zvd1/HS0rwM4VHVHoWo
 6tORaLexFZMr0f7lJOkHmVKBUxKO2ptSeVahWYw5B3Is3ZGrJFtideZfrrjgfAiAwr3O
 s9vSYI0ShMO9y2YvtRNniO0xN27JwBHToQo/8Xa88RyHqlLKBpCXgMG/hBhGFQ4MrXcH
 XHpnfSj3XfCIXWTsiS9ZJA8RVW6ZHKGxGWZLDtIvyQJyhLhChESOUq5Bz/rDFCpA2scy
 3Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3j+IshXduJ+JiACR/o7YJgbWltf/wpMz0/KQVcDII9c=;
 b=oslwgo8DXMT1DDi/uYE0QiOixKYRQZHrxS2bgnTTqIvTdqMlQu/2+5VZu/ogXxLDvZ
 BicxoivgyGIKq7T2yN/TuqwmVsMN8MEkQmHmKvcMPPZx1d+EKTeWBzCKaUlBUtMIPdKw
 rqcmQ+TPpYcg59qUELOP8rrMAnq9y1SMIC84vcBsTrq5LOsajnhFu6Jp9tTyBZyvr3sF
 9bbrZ9/EWAPLimX+a92OeC2gIcR99ABp5pZzOyYsUwCJrYE+PYA04cts23vVOxCbT/nb
 Jfc8CX79QYNnV9wVgmcKnY3RZTHt4pnAO3gGp5BD7AULkjW8Fwcc/dRrvnT3ZNbAPfIU
 PqXA==
X-Gm-Message-State: AOAM531KM71oI5+mqUHarOr0AOYkbIZ2lffmqBqhPC71l4x1HnSy0Na/
 0Emzr9fFACVrvZzzpuv+Wqk=
X-Google-Smtp-Source: ABdhPJwTyZxl2+nD0ls5T1aCQ6bJ8GOSf5F8TXU2IRQDZAqjkV2mlwh0Ira3i7Wx6usQhCNLCDQ+Lg==
X-Received: by 2002:aca:1308:: with SMTP id e8mr9116793oii.168.1626371764690; 
 Thu, 15 Jul 2021 10:56:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w4sm1362683oiv.50.2021.07.15.10.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 10:56:04 -0700 (PDT)
Date: Thu, 15 Jul 2021 10:56:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH 12/14] hwmon: peci: Add dimmtemp driver
Message-ID: <20210715175602.GA3043224@roeck-us.net>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-13-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712220447.957418-13-iwona.winiarska@intel.com>
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

On Tue, Jul 13, 2021 at 12:04:45AM +0200, Iwona Winiarska wrote:
> Add peci-dimmtemp driver for Digital Thermal Sensor (DTS) thermal
> readings of DIMMs that are accessible via the processor PECI interface.
> 
> The main use case for the driver (and PECI interface) is out-of-band
> management, where we're able to obtain the DTS readings from an external
> entity connected with PECI, e.g. BMC on server platforms.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/hwmon/peci/Kconfig    |  13 +
>  drivers/hwmon/peci/Makefile   |   2 +
>  drivers/hwmon/peci/dimmtemp.c | 508 ++++++++++++++++++++++++++++++++++
>  3 files changed, 523 insertions(+)
>  create mode 100644 drivers/hwmon/peci/dimmtemp.c
> 
> diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
> index e10eed68d70a..f2d57efa508b 100644
> --- a/drivers/hwmon/peci/Kconfig
> +++ b/drivers/hwmon/peci/Kconfig
> @@ -14,5 +14,18 @@ config SENSORS_PECI_CPUTEMP
>  	  This driver can also be built as a module. If so, the module
>  	  will be called peci-cputemp.
>  
> +config SENSORS_PECI_DIMMTEMP
> +	tristate "PECI DIMM temperature monitoring client"
> +	depends on PECI
> +	select SENSORS_PECI
> +	select PECI_CPU
> +	help
> +	  If you say yes here you get support for the generic Intel PECI hwmon
> +	  driver which provides Digital Thermal Sensor (DTS) thermal readings of
> +	  DIMM components that are accessible via the processor PECI interface.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called peci-dimmtemp.
> +
>  config SENSORS_PECI
>  	tristate
> diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
> index e8a0ada5ab1f..191cfa0227f3 100644
> --- a/drivers/hwmon/peci/Makefile
> +++ b/drivers/hwmon/peci/Makefile
> @@ -1,5 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  peci-cputemp-y := cputemp.o
> +peci-dimmtemp-y := dimmtemp.o
>  
>  obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+= peci-cputemp.o
> +obj-$(CONFIG_SENSORS_PECI_DIMMTEMP)	+= peci-dimmtemp.o
> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
> new file mode 100644
> index 000000000000..2fcb8607137a
> --- /dev/null
> +++ b/drivers/hwmon/peci/dimmtemp.c
> @@ -0,0 +1,508 @@
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
> +#include <linux/workqueue.h>
> +#include <linux/x86/intel-family.h>
> +
> +#include "common.h"
> +
> +#define DIMM_MASK_CHECK_DELAY_JIFFIES	msecs_to_jiffies(5000)
> +#define DIMM_MASK_CHECK_RETRY_MAX	60 /* 60 x 5 secs = 5 minutes */
> +
> +/* Max number of channel ranks and DIMM index per channel */
> +#define CHAN_RANK_MAX_ON_HSX	8
> +#define DIMM_IDX_MAX_ON_HSX	3
> +#define CHAN_RANK_MAX_ON_BDX	4
> +#define DIMM_IDX_MAX_ON_BDX	3
> +#define CHAN_RANK_MAX_ON_BDXD	2
> +#define DIMM_IDX_MAX_ON_BDXD	2
> +#define CHAN_RANK_MAX_ON_SKX	6
> +#define DIMM_IDX_MAX_ON_SKX	2
> +#define CHAN_RANK_MAX_ON_ICX	8
> +#define DIMM_IDX_MAX_ON_ICX	2
> +#define CHAN_RANK_MAX_ON_ICXD	4
> +#define DIMM_IDX_MAX_ON_ICXD	2
> +
> +#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
> +#define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
> +#define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
> +
> +#define CPU_SEG_MASK		GENMASK(23, 16)
> +#define GET_CPU_SEG(x)		(((x) & CPU_SEG_MASK) >> 16)
> +#define CPU_BUS_MASK		GENMASK(7, 0)
> +#define GET_CPU_BUS(x)		((x) & CPU_BUS_MASK)
> +
> +#define DIMM_TEMP_MAX		GENMASK(15, 8)
> +#define DIMM_TEMP_CRIT		GENMASK(23, 16)
> +#define GET_TEMP_MAX(x)		(((x) & DIMM_TEMP_MAX) >> 8)
> +#define GET_TEMP_CRIT(x)	(((x) & DIMM_TEMP_CRIT) >> 16)
> +
> +struct dimm_info {
> +	int chan_rank_max;
> +	int dimm_idx_max;
> +	u8 min_peci_revision;
> +};
> +
> +struct peci_dimmtemp {
> +	struct peci_device *peci_dev;
> +	struct device *dev;
> +	const char *name;
> +	const struct dimm_info *gen_info;
> +	struct delayed_work detect_work;
> +	struct peci_sensor_data temp[DIMM_NUMS_MAX];
> +	long temp_max[DIMM_NUMS_MAX];
> +	long temp_crit[DIMM_NUMS_MAX];
> +	int retry_count;
> +	char **dimmtemp_label;
> +	DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
> +};
> +
> +static u8 __dimm_temp(u32 reg, int dimm_order)
> +{
> +	return (reg >> (dimm_order * 8)) & 0xff;
> +}
> +
> +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
> +{
> +	int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
> +	int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
> +	struct peci_device *peci_dev = priv->peci_dev;
> +	u8 cpu_seg, cpu_bus, dev, func;
> +	u64 offset;
> +	u32 data;
> +	u16 reg;
> +	int ret;
> +
> +	if (!peci_sensor_need_update(&priv->temp[dimm_no]))
> +		return 0;
> +
> +	ret = peci_pcs_read(peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank, &data);
> +	if (ret)
> +		return ret;
> +

Similar to the cpu driver, the lack of mutex protection needs to be explained.

> +	priv->temp[dimm_no].value = __dimm_temp(data, dimm_order) * MILLIDEGREE_PER_DEGREE;
> +
> +	switch (peci_dev->info.model) {
> +	case INTEL_FAM6_ICELAKE_X:
> +	case INTEL_FAM6_ICELAKE_D:
> +		ret = peci_ep_pci_local_read(peci_dev, 0, 13, 0, 2, 0xd4, &data);
> +		if (ret || !(data & BIT(31)))
> +			break; /* Use default or previous value */
> +
> +		ret = peci_ep_pci_local_read(peci_dev, 0, 13, 0, 2, 0xd0, &data);
> +		if (ret)
> +			break; /* Use default or previous value */
> +
> +		cpu_seg = GET_CPU_SEG(data);
> +		cpu_bus = GET_CPU_BUS(data);
> +
> +		/*
> +		 * Device 26, Offset 224e0: IMC 0 channel 0 -> rank 0
> +		 * Device 26, Offset 264e0: IMC 0 channel 1 -> rank 1
> +		 * Device 27, Offset 224e0: IMC 1 channel 0 -> rank 2
> +		 * Device 27, Offset 264e0: IMC 1 channel 1 -> rank 3
> +		 * Device 28, Offset 224e0: IMC 2 channel 0 -> rank 4
> +		 * Device 28, Offset 264e0: IMC 2 channel 1 -> rank 5
> +		 * Device 29, Offset 224e0: IMC 3 channel 0 -> rank 6
> +		 * Device 29, Offset 264e0: IMC 3 channel 1 -> rank 7
> +		 */
> +		dev = 0x1a + chan_rank / 2;
> +		offset = 0x224e0 + dimm_order * 4;
> +		if (chan_rank % 2)
> +			offset += 0x4000;
> +
> +		ret = peci_mmio_read(peci_dev, 0, cpu_seg, cpu_bus, dev, 0, offset, &data);
> +		if (ret)
> +			return ret;
> +
> +		priv->temp_max[dimm_no] = GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE;
> +		priv->temp_crit[dimm_no] = GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGREE;
> +
> +		break;
> +	case INTEL_FAM6_SKYLAKE_X:
> +		/*
> +		 * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> +		 * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> +		 * Device 11, Function 2: IMC 0 channel 2 -> rank 2
> +		 * Device 12, Function 2: IMC 1 channel 0 -> rank 3
> +		 * Device 12, Function 6: IMC 1 channel 1 -> rank 4
> +		 * Device 13, Function 2: IMC 1 channel 2 -> rank 5
> +		 */
> +		dev = 10 + chan_rank / 3 * 2 + (chan_rank % 3 == 2 ? 1 : 0);
> +		func = chan_rank % 3 == 1 ? 6 : 2;
> +		reg = 0x120 + dimm_order * 4;
> +
> +		ret = peci_pci_local_read(peci_dev, 2, dev, func, reg, &data);
> +		if (ret)
> +			return ret;
> +
> +		priv->temp_max[dimm_no] = GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE;
> +		priv->temp_crit[dimm_no] = GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGREE;
> +
> +		break;
> +	case INTEL_FAM6_BROADWELL_D:
> +		/*
> +		 * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> +		 * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> +		 * Device 12, Function 2: IMC 1 channel 0 -> rank 2
> +		 * Device 12, Function 6: IMC 1 channel 1 -> rank 3
> +		 */
> +		dev = 10 + chan_rank / 2 * 2;
> +		func = (chan_rank % 2) ? 6 : 2;
> +		reg = 0x120 + dimm_order * 4;
> +
> +		ret = peci_pci_local_read(peci_dev, 2, dev, func, reg, &data);
> +		if (ret)
> +			return ret;
> +
> +		priv->temp_max[dimm_no] = GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE;
> +		priv->temp_crit[dimm_no] = GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGREE;
> +
> +		break;
> +	case INTEL_FAM6_HASWELL_X:
> +	case INTEL_FAM6_BROADWELL_X:
> +		/*
> +		 * Device 20, Function 0: IMC 0 channel 0 -> rank 0
> +		 * Device 20, Function 1: IMC 0 channel 1 -> rank 1
> +		 * Device 21, Function 0: IMC 0 channel 2 -> rank 2
> +		 * Device 21, Function 1: IMC 0 channel 3 -> rank 3
> +		 * Device 23, Function 0: IMC 1 channel 0 -> rank 4
> +		 * Device 23, Function 1: IMC 1 channel 1 -> rank 5
> +		 * Device 24, Function 0: IMC 1 channel 2 -> rank 6
> +		 * Device 24, Function 1: IMC 1 channel 3 -> rank 7
> +		 */
> +		dev = 20 + chan_rank / 2 + chan_rank / 4;
> +		func = chan_rank % 2;
> +		reg = 0x120 + dimm_order * 4;
> +
> +		ret = peci_pci_local_read(peci_dev, 1, dev, func, reg, &data);
> +		if (ret)
> +			return ret;
> +
> +		priv->temp_max[dimm_no] = GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE;
> +		priv->temp_crit[dimm_no] = GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGREE;
> +
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	peci_sensor_mark_updated(&priv->temp[dimm_no]);
> +
> +	return 0;
> +}
> +
> +static int dimmtemp_read_string(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel, const char **str)
> +{
> +	struct peci_dimmtemp *priv = dev_get_drvdata(dev);
> +
> +	if (attr != hwmon_temp_label)
> +		return -EOPNOTSUPP;
> +
> +	*str = (const char *)priv->dimmtemp_label[channel];
> +
> +	return 0;
> +}
> +
> +static int dimmtemp_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct peci_dimmtemp *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = get_dimm_temp(priv, channel);
> +	if (ret)
> +		return ret;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		*val = priv->temp[channel].value;
> +		break;
> +	case hwmon_temp_max:
> +		*val = priv->temp_max[channel];
> +		break;
> +	case hwmon_temp_crit:
> +		*val = priv->temp_crit[channel];
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	const struct peci_dimmtemp *priv = data;
> +
> +	if (test_bit(channel, priv->dimm_mask))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops peci_dimmtemp_ops = {
> +	.is_visible = dimmtemp_is_visible,
> +	.read_string = dimmtemp_read_string,
> +	.read = dimmtemp_read,
> +};
> +
> +static int check_populated_dimms(struct peci_dimmtemp *priv)
> +{
> +	int chan_rank_max = priv->gen_info->chan_rank_max;
> +	int dimm_idx_max = priv->gen_info->dimm_idx_max;
> +	int chan_rank, dimm_idx, ret;
> +	u64 dimm_mask = 0;
> +	u32 pcs;
> +
> +	for (chan_rank = 0; chan_rank < chan_rank_max; chan_rank++) {
> +		ret = peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank, &pcs);
> +		if (ret) {
> +			/*
> +			 * Overall, we expect either success or -EINVAL in
> +			 * order to determine whether DIMM is populated or not.
> +			 * For anything else - we fall back to defering the
> +			 * detection to be performed at a later point in time.
> +			 */
> +			if (ret == -EINVAL)
> +				continue;
> +			else

else after continue is unnecessary.

> +				return -EAGAIN;
> +		}
> +
> +		for (dimm_idx = 0; dimm_idx < dimm_idx_max; dimm_idx++)
> +			if (__dimm_temp(pcs, dimm_idx))
> +				dimm_mask |= BIT(chan_rank * dimm_idx_max + dimm_idx);
> +	}
> +	/*
> +	 * It's possible that memory training is not done yet. In this case we
> +	 * defer the detection to be performed at a later point in time.
> +	 */
> +	if (!dimm_mask)
> +		return -EAGAIN;
> +
> +	dev_dbg(priv->dev, "Scanned populated DIMMs: %#llx\n", dimm_mask);
> +
> +	bitmap_from_u64(priv->dimm_mask, dimm_mask);
> +
> +	return 0;
> +}
> +
> +static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
> +{
> +	int rank = chan / priv->gen_info->dimm_idx_max;
> +	int idx = chan % priv->gen_info->dimm_idx_max;
> +
> +	priv->dimmtemp_label[chan] = devm_kasprintf(priv->dev, GFP_KERNEL,
> +						    "DIMM %c%d", 'A' + rank,
> +						    idx + 1);
> +	if (!priv->dimmtemp_label[chan])
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static const u32 peci_dimmtemp_temp_channel_config[] = {
> +	[0 ... DIMM_NUMS_MAX - 1] = HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info peci_dimmtemp_temp_channel = {
> +	.type = hwmon_temp,
> +	.config = peci_dimmtemp_temp_channel_config,
> +};
> +
> +static const struct hwmon_channel_info *peci_dimmtemp_temp_info[] = {
> +	&peci_dimmtemp_temp_channel,
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info peci_dimmtemp_chip_info = {
> +	.ops = &peci_dimmtemp_ops,
> +	.info = peci_dimmtemp_temp_info,
> +};
> +
> +static int create_dimm_temp_info(struct peci_dimmtemp *priv)
> +{
> +	int ret, i, channels;
> +	struct device *dev;
> +
> +	ret = check_populated_dimms(priv);
> +	if (ret == -EAGAIN) {

The only error returned by check_populated_dimms() is -EAGAIN. Checking for
specifically this error here suggests that there may be other (ignored)
errors. The reader has to examine check_populated_dimms() to find out
that -EAGAIN is indeed the only possible error. To avoid confusion, please
only check for ret here.

> +		if (priv->retry_count < DIMM_MASK_CHECK_RETRY_MAX) {
> +			schedule_delayed_work(&priv->detect_work,
> +					      DIMM_MASK_CHECK_DELAY_JIFFIES);
> +			priv->retry_count++;
> +			dev_dbg(priv->dev, "Deferred populating DIMM temp info\n");
> +			return ret;
> +		}
> +
> +		dev_info(priv->dev, "Timeout populating DIMM temp info\n");

If this returns an error, the message needs to be dev_err().

> +		return -ETIMEDOUT;
> +	}
> +
> +	channels = priv->gen_info->chan_rank_max * priv->gen_info->dimm_idx_max;
> +
> +	priv->dimmtemp_label = devm_kzalloc(priv->dev, channels * sizeof(char *), GFP_KERNEL);
> +	if (!priv->dimmtemp_label)
> +		return -ENOMEM;
> +
> +	for_each_set_bit(i, priv->dimm_mask, DIMM_NUMS_MAX) {
> +		ret = create_dimm_temp_label(priv, i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	dev = devm_hwmon_device_register_with_info(priv->dev, priv->name, priv,
> +						   &peci_dimmtemp_chip_info, NULL);
> +	if (IS_ERR(dev)) {
> +		dev_err(priv->dev, "Failed to register hwmon device\n");
> +		return PTR_ERR(dev);
> +	}
> +
> +	dev_dbg(priv->dev, "%s: sensor '%s'\n", dev_name(dev), priv->name);
> +
> +	return 0;
> +}
> +
> +static void create_dimm_temp_info_delayed(struct work_struct *work)
> +{
> +	struct peci_dimmtemp *priv = container_of(to_delayed_work(work),
> +						  struct peci_dimmtemp,
> +						  detect_work);
> +	int ret;
> +
> +	ret = create_dimm_temp_info(priv);
> +	if (ret && ret != -EAGAIN)
> +		dev_dbg(priv->dev, "Failed to populate DIMM temp info\n");
> +}
> +
> +static int peci_dimmtemp_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct peci_device *peci_dev = to_peci_device(dev->parent);
> +	struct peci_dimmtemp *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->name = devm_kasprintf(dev, GFP_KERNEL, "peci_dimmtemp.cpu%d",
> +				    peci_dev->info.socket_id);
> +	if (!priv->name)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, priv);
> +	priv->dev = dev;
> +	priv->peci_dev = peci_dev;
> +	priv->gen_info = (const struct dimm_info *)id->driver_data;
> +
> +	INIT_DELAYED_WORK(&priv->detect_work, create_dimm_temp_info_delayed);
> +
> +	ret = create_dimm_temp_info(priv);
> +	if (ret && ret != -EAGAIN) {
> +		dev_dbg(dev, "Failed to populate DIMM temp info\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void peci_dimmtemp_remove(struct auxiliary_device *adev)
> +{
> +	struct peci_dimmtemp *priv = dev_get_drvdata(&adev->dev);
> +
> +	cancel_delayed_work_sync(&priv->detect_work);
> +}
> +
> +static const struct dimm_info dimm_hsx = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_HSX,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_HSX,
> +	.min_peci_revision = 0x30,
> +};
> +
> +static const struct dimm_info dimm_bdx = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_BDX,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_BDX,
> +	.min_peci_revision = 0x30,
> +};
> +
> +static const struct dimm_info dimm_bdxd = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_BDXD,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_BDXD,
> +	.min_peci_revision = 0x30,
> +};
> +
> +static const struct dimm_info dimm_skx = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_SKX,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_SKX,
> +	.min_peci_revision = 0x30,
> +};
> +
> +static const struct dimm_info dimm_icx = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_ICX,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_ICX,
> +	.min_peci_revision = 0x40,
> +};
> +
> +static const struct dimm_info dimm_icxd = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_ICXD,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_ICXD,
> +	.min_peci_revision = 0x40,
> +};
> +
> +static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
> +	{
> +		.name = "peci_cpu.dimmtemp.hsx",
> +		.driver_data = (kernel_ulong_t)&dimm_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.bdx",
> +		.driver_data = (kernel_ulong_t)&dimm_bdx,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.bdxd",
> +		.driver_data = (kernel_ulong_t)&dimm_bdxd,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.skx",
> +		.driver_data = (kernel_ulong_t)&dimm_skx,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.icx",
> +		.driver_data = (kernel_ulong_t)&dimm_icx,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.icxd",
> +		.driver_data = (kernel_ulong_t)&dimm_icxd,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
> +
> +static struct auxiliary_driver peci_dimmtemp_driver = {
> +	.probe		= peci_dimmtemp_probe,
> +	.remove		= peci_dimmtemp_remove,
> +	.id_table	= peci_dimmtemp_ids,
> +};
> +
> +module_auxiliary_driver(peci_dimmtemp_driver);
> +
> +MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
> +MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
> +MODULE_DESCRIPTION("PECI dimmtemp driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PECI_CPU);
