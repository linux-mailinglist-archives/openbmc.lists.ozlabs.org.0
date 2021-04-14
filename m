Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48335F3D0
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 14:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL2376j3Bz3bV9
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 22:34:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AEI82nik;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AEI82nik; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL22s55r8z2ysl;
 Wed, 14 Apr 2021 22:33:55 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso5072109otm.4; 
 Wed, 14 Apr 2021 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w8ii4XDR2ivcw7sl8ciBbpj3uGDjJqqbNONNfrMFDnA=;
 b=AEI82nikl6lmu8NLMM/3ud5LnWdupmwubLCWpU3hRaU4cvIRn71VPPyb+OPTiiEzpb
 TfaN36aVDhcG6jXZMmTOij4Lc19x9aY9KFJ4uWbbYhtNlmFWJSwTFXoHVYoeuSgipIiT
 c3LH6Z0ItrIeUrXa8dwnq56wFYNi6W2rZuurrmvYCuXdaDWJmmMgxFeQceeWwQ6ZYLjh
 /D71vUn9pNcr8kpifMW+k3JQqhLT/Jnj55Iiq/D0G/pGEU3SLoZ1ofPH3oslafsu5P2+
 BLwxcsBumgt9gF+74KymwLMVuOV18hj2Qb5BboApCosxdu+SFM72A+uifBJ7h6n14VYe
 iY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=w8ii4XDR2ivcw7sl8ciBbpj3uGDjJqqbNONNfrMFDnA=;
 b=ag874v/MBkSpLB2KKtLTzhZkWno5UZW+oFEF6U2fwfJlyATRzZ0Gx3fKCg2yPPQUGx
 WY+mCFE/eqwX9lgpWAhRnzO9mJm87uJG+S8lUU35GL+2YhDPxiMssjjKb1sCTo4wFQ+V
 yb0odgup4eRiMvO6WixmgEF5KLIzpMpDEu1hDifLl2/JsqPmj6XOpjnYEhXut7CwabyL
 4mLN6qWOyFzUa7TqPyfpKryuNfRCT/pZyUGKU5QrxwPkRLqR1bSm9USPGzOkH5AhBb4y
 W0ES81xrkFNTS4YFw/YJWObujFwuyz7CiVJ8aVx2YGMFZkbkXlXLJC46Y+pWabyrhOsx
 A33Q==
X-Gm-Message-State: AOAM532Qmweis1HayDIl5qmi39y1x48yxzKE3wjjiMm2y6aNTKVeEEWf
 6rsvj/+oOFDCZBGTeEQTxsU=
X-Google-Smtp-Source: ABdhPJxAjvi08im0lNlExsNP5gMdOYnBIvapXZY3Chrl7yQYkdggU/Qm4bSHcLQkJh5fi4kdcq02nQ==
X-Received: by 2002:a9d:740a:: with SMTP id n10mr32643871otk.27.1618403631847; 
 Wed, 14 Apr 2021 05:33:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r63sm1535233oia.43.2021.04.14.05.33.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Apr 2021 05:33:51 -0700 (PDT)
Date: Wed, 14 Apr 2021 05:33:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Message-ID: <20210414123349.GA18905@roeck-us.net>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
 <20210409031332.21919-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409031332.21919-4-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 10:13:31AM +0700, Quan Nguyen wrote:
> This commit adds support for Ampere SMpro hwmon driver. This driver
> supports accessing various CPU sensors provided by the SMpro co-processor
> including temperature, power, voltages, and current.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---

Change log goes here. You are making it difficult to review your patches.

>  drivers/hwmon/Kconfig       |   8 +
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/smpro-hwmon.c | 491 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 500 insertions(+)
>  create mode 100644 drivers/hwmon/smpro-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 0ddc974b102e..ba4b5a911baf 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -67,6 +67,14 @@ config SENSORS_ABITUGURU3
>  	  This driver can also be built as a module. If so, the module
>  	  will be called abituguru3.
>  
> +config SENSORS_SMPRO
> +	tristate "Ampere's Altra SMpro hardware monitoring driver"
> +	depends on MFD_SMPRO
> +	help
> +	  If you say yes here you get support for the thermal, voltage,
> +	  current and power sensors of Ampere's Altra processor family SoC
> +	  with SMpro co-processor.
> +
>  config SENSORS_AD7314
>  	tristate "Analog Devices AD7314 and compatibles"
>  	depends on SPI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 59e78bc212cf..b25391f9c651 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -174,6 +174,7 @@ obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
>  obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
>  obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
>  obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
> +obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
>  obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>  obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
>  obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
> diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
> new file mode 100644
> index 000000000000..a3389fcbad82
> --- /dev/null
> +++ b/drivers/hwmon/smpro-hwmon.c
> @@ -0,0 +1,491 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Ampere Computing SoC's SMPro Hardware Monitoring Driver
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + */
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +/* Identification Registers */
> +#define MANUFACTURER_ID_REG	0x02
> +#define AMPERE_MANUFACTURER_ID	0xCD3A
> +
> +/* Logical Power Sensor Registers */
> +#define SOC_TEMP		0x00
> +#define SOC_VRD_TEMP		0x01
> +#define DIMM_VRD_TEMP		0x02
> +#define CORE_VRD_TEMP		0x03
> +#define CH0_DIMM_TEMP		0x04
> +#define CH1_DIMM_TEMP		0x05
> +#define CH2_DIMM_TEMP		0x06
> +#define CH3_DIMM_TEMP		0x07
> +#define CH4_DIMM_TEMP		0x08
> +#define CH5_DIMM_TEMP		0x09
> +#define CH6_DIMM_TEMP		0x0A
> +#define CH7_DIMM_TEMP		0x0B
> +#define RCA_VRD_TEMP		0x0C
> +
> +#define CORE_VRD_PWR		0x10
> +#define SOC_PWR			0x11
> +#define DIMM_VRD1_PWR		0x12
> +#define DIMM_VRD2_PWR		0x13
> +#define CORE_VRD_PWR_MW		0x16
> +#define SOC_PWR_MW		0x17
> +#define DIMM_VRD1_PWR_MW	0x18
> +#define DIMM_VRD2_PWR_MW	0x19
> +#define RCA_VRD_PWR		0x1A
> +#define RCA_VRD_PWR_MW		0x1B
> +
> +#define MEM_HOT_THRESHOLD	0x22
> +#define SOC_VR_HOT_THRESHOLD	0x23
> +#define CORE_VRD_VOLT		0x24
> +#define SOC_VRD_VOLT		0x25
> +#define DIMM_VRD1_VOLT		0x26
> +#define DIMM_VRD2_VOLT		0x27
> +#define RCA_VRD_VOLT		0x28
> +
> +#define CORE_VRD_CURR		0x29
> +#define SOC_VRD_CURR		0x2A
> +#define DIMM_VRD1_CURR		0x2B
> +#define DIMM_VRD2_CURR		0x2C
> +#define RCA_VRD_CURR		0x2D
> +
> +struct smpro_hwmon {
> +	struct regmap *regmap;
> +	u32 offset;
> +};
> +
> +struct smpro_sensor {
> +	const u8 reg;
> +	const u8 reg_ext;
> +	const char *label;
> +};
> +
> +static const struct smpro_sensor temperature[] = {
> +	{
> +		.reg = SOC_TEMP,
> +		.label = "temp1 SoC"
> +	},
> +	{
> +		.reg = SOC_VRD_TEMP,
> +		.reg_ext = SOC_VR_HOT_THRESHOLD,
> +		.label = "temp2 SoC VRD"
> +	},
> +	{
> +		.reg = DIMM_VRD_TEMP,
> +		.label = "temp3 DIMM VRD"
> +	},
> +	{
> +		.reg = CORE_VRD_TEMP,
> +		.label = "temp4 CORE VRD"
> +	},
> +	{
> +		.reg = CH0_DIMM_TEMP,
> +		.reg_ext = MEM_HOT_THRESHOLD,
> +		.label = "temp5 CH0 DIMM"
> +	},
> +	{
> +		.reg = CH1_DIMM_TEMP,
> +		.reg_ext = MEM_HOT_THRESHOLD,
> +		.label = "temp6 CH1 DIMM"
> +	},
> +	{
> +		.reg = CH2_DIMM_TEMP,
> +		.reg_ext = MEM_HOT_THRESHOLD,
> +		.label = "temp7 CH2 DIMM"
> +	},
> +	{
> +		.reg = CH3_DIMM_TEMP,
> +		.reg_ext = MEM_HOT_THRESHOLD,
> +		.label = "temp8 CH3 DIMM"
> +	},
> +	{
> +		.reg = CH4_DIMM_TEMP,
> +		.reg_ext = MEM_HOT_THRESHOLD,
> +		.label = "temp9 CH4 DIMM"
> +	},
> +	{
> +		.reg = CH5_DIMM_TEMP,
> +		.reg_ext = MEM_HOT_THRESHOLD,
> +		.label = "temp10 CH5 DIMM"
> +	},
> +	{
> +		.reg = CH6_DIMM_TEMP,
> +		.reg_ext = MEM_HOT_THRESHOLD,
> +		.label = "temp11 CH6 DIMM"
> +	},
> +	{
> +		.reg = CH7_DIMM_TEMP,
> +		.reg_ext = MEM_HOT_THRESHOLD,
> +		.label = "temp12 CH7 DIMM"
> +	},
> +	{
> +		.reg = RCA_VRD_TEMP,
> +		.label = "temp13 RCA VRD"
> +	},
> +};
> +
> +static const struct smpro_sensor voltage[] = {
> +	{
> +		.reg = CORE_VRD_VOLT,
> +		.label = "vout0 CORE VRD"
> +	},
> +	{
> +		.reg = SOC_VRD_VOLT,
> +		.label = "vout1 SoC VRD"
> +	},
> +	{
> +		.reg = DIMM_VRD1_VOLT,
> +		.label = "vout2 DIMM VRD1"
> +	},
> +	{
> +		.reg = DIMM_VRD2_VOLT,
> +		.label = "vout3 DIMM VRD2"
> +	},
> +	{
> +		.reg = RCA_VRD_VOLT,
> +		.label = "vout4 RCA VRD"
> +	},
> +};
> +
> +static const struct smpro_sensor curr_sensor[] = {
> +	{
> +		.reg = CORE_VRD_CURR,
> +		.label = "iout1 CORE VRD"
> +	},
> +	{
> +		.reg = SOC_VRD_CURR,
> +		.label = "iout2 SoC VRD"
> +	},
> +	{
> +		.reg = DIMM_VRD1_CURR,
> +		.label = "iout3 DIMM VRD1"
> +	},
> +	{
> +		.reg = DIMM_VRD2_CURR,
> +		.label = "iout4 DIMM VRD2"
> +	},
> +	{
> +		.reg = RCA_VRD_CURR,
> +		.label = "iout5 RCA VRD"
> +	},
> +};
> +
> +static const struct smpro_sensor power[] = {
> +	{
> +		.reg = CORE_VRD_PWR,
> +		.reg_ext = CORE_VRD_PWR_MW,
> +		.label = "power1 CORE VRD"
> +	},
> +	{
> +		.reg = SOC_PWR,
> +		.reg_ext = SOC_PWR_MW,
> +		.label = "power2 SoC"
> +	},
> +	{
> +		.reg = DIMM_VRD1_PWR,
> +		.reg_ext = DIMM_VRD1_PWR_MW,
> +		.label = "power3 DIMM VRD1"
> +	},
> +	{
> +		.reg = DIMM_VRD2_PWR,
> +		.reg_ext = DIMM_VRD2_PWR_MW,
> +		.label = "power4 DIMM VRD2"
> +	},
> +	{
> +		.reg = RCA_VRD_PWR,
> +		.reg_ext = RCA_VRD_PWR_MW,
> +		.label = "power5 RCA VRD"
> +	},
> +};
> +
> +static int smpro_read_temp(struct device *dev, u32 attr, int channel, long *val)
> +{
> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		ret = regmap_read(hwmon->regmap, hwmon->offset + temperature[channel].reg, &value);
> +		if (ret)
> +			return ret;
> +		break;
> +	case hwmon_temp_crit:
> +		ret = regmap_read(hwmon->regmap,
> +				  hwmon->offset + temperature[channel].reg_ext, &value);
> +		if (ret)
> +			return ret;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	*val = sign_extend32(value, 8) * 1000;
> +	return 0;
> +}
> +
> +static int smpro_read_in(struct device *dev, u32 attr, int channel, long *val)
> +{
> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		ret = regmap_read(hwmon->regmap, hwmon->offset + voltage[channel].reg, &value);
> +		if (ret < 0)
> +			return ret;
> +		/* 15-bit value in 1mV */
> +		*val = value & 0x7fff;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int smpro_read_curr(struct device *dev, u32 attr, int channel, long *val)
> +{
> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_curr_input:
> +		ret = regmap_read(hwmon->regmap, hwmon->offset + curr_sensor[channel].reg, &value);
> +		if (ret < 0)
> +			return ret;
> +		/* Scale reported by the hardware is 1mA */
> +		*val = value & 0x7fff;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int smpro_read_power(struct device *dev, u32 attr, int channel, long *val_pwr)
> +{
> +	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
> +	unsigned int val = 0, val_mw = 0;
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_power_input:
> +		ret = regmap_read(hwmon->regmap, hwmon->offset + power[channel].reg, &val);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(hwmon->regmap, hwmon->offset + power[channel].reg_ext, &val_mw);
> +		if (ret)
> +			return ret;
> +
> +		*val_pwr = val * 1000000 + val_mw * 1000;
> +		return 0;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int smpro_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		return smpro_read_temp(dev, attr, channel, val);
> +	case hwmon_in:
> +		return smpro_read_in(dev, attr, channel, val);
> +	case hwmon_power:
> +		return smpro_read_power(dev, attr, channel, val);
> +	case hwmon_curr:
> +		return smpro_read_curr(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int smpro_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			*str = temperature[channel].label;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_label:
> +			*str = voltage[channel].label;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_label:
> +			*str = curr_sensor[channel].label;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_label:
> +			*str = power[channel].label;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static umode_t smpro_is_visible(const void *data, enum hwmon_sensor_types type,
> +				u32 attr, int channel)
> +{
> +	const struct smpro_hwmon *hwmon = data;
> +	unsigned int value;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_label:
> +		case hwmon_temp_crit:
> +			ret = regmap_read(hwmon->regmap,
> +					  hwmon->offset + temperature[channel].reg, &value);
> +			if (ret || value == 0xFFFF)
> +				return 0;
> +		break;
> +		}
> +	default:
> +		break;
> +	}
> +
> +	return 0444;
> +}
> +
> +static const struct hwmon_channel_info *smpro_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT | HWMON_P_LABEL,
> +			   HWMON_P_INPUT | HWMON_P_LABEL,
> +			   HWMON_P_INPUT | HWMON_P_LABEL,
> +			   HWMON_P_INPUT | HWMON_P_LABEL,
> +			   HWMON_P_INPUT | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops smpro_hwmon_ops = {
> +	.is_visible = smpro_is_visible,
> +	.read = smpro_read,
> +	.read_string = smpro_read_string,
> +};
> +
> +static const struct hwmon_chip_info smpro_chip_info = {
> +	.ops = &smpro_hwmon_ops,
> +	.info = smpro_info,
> +};
> +
> +static int smpro_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct smpro_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +	unsigned int val;
> +	int ret;
> +
> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!hwmon->regmap)
> +		return -ENODEV;
> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &hwmon->offset);
> +	if (ret)
> +		return -EINVAL;
> +
> +	/* Check for valid ID */
> +	ret = regmap_read(hwmon->regmap, MANUFACTURER_ID_REG, &val);
> +	if (ret)
> +		return -EPROBE_DEFER;

This is unacceptable. regmap_read() could return various errors.
An error here might mean that the chip is simply not there, or that
there is some other problem with, say, the i2c controller driver.
The function might, for all we know, even return -ENOMEM.

If this is supposed to mean that the chip is not yet ready, some other
and more specific solution will be needed. -EPROBE_DEFER means that
some other driver needs to be loaded first, not "chip is not ready,
try again later".

Thanks,
Guenter

> +
> +	if (val != AMPERE_MANUFACTURER_ID)
> +		return -ENODEV;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "smpro_hwmon",
> +							 hwmon, &smpro_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id smpro_hwmon_of_match[] = {
> +	{ .compatible = "ampere,ac01-hwmon" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, smpro_hwmon_of_match);
> +
> +static struct platform_driver smpro_hwmon_driver = {
> +	.probe		= smpro_hwmon_probe,
> +	.driver = {
> +		.name	= "smpro-hwmon",
> +		.of_match_table = smpro_hwmon_of_match,
> +	},
> +};
> +
> +module_platform_driver(smpro_hwmon_driver);
> +
> +MODULE_AUTHOR("Thu Nguyen <thu@os.amperecomputing.com>");
> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> +MODULE_DESCRIPTION("Ampere Altra SMPro hwmon driver");
> +MODULE_LICENSE("GPL v2");
