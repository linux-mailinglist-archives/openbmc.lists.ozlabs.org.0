Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55D34DDB4
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 03:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8XK91PW9z30CL
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 12:43:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rB5gt5/z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rB5gt5/z; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8XJs5dlsz2yYn;
 Tue, 30 Mar 2021 12:43:07 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id i3so14945040oik.7;
 Mon, 29 Mar 2021 18:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hcN4e2ZIjSqTaT+HE3O5zc/5f5nqimNJqKvrwB/lfk8=;
 b=rB5gt5/zb+Ms0XAYGnn7/5lnsrPPo3IZ1oJzuW9GcClKTOSj4BaGqPXbwWfs7VvJVt
 bbXzt4WazzDmfcMWX02U+tZBh/gFLnnyHKTiMav+lYmnF0gg80Wct/h3sRo5HQWf7cGr
 q+D2Va98xYIkQeqBcbP8ihZQvzu+etfEv2NtYUfeondb4+UZQ6uC7vHP9uyT7JdSxbvS
 HM6OkjOoZv/a/iWPN5VzFXFF6lnILrTX6scvxS2chonvbypP7o+va9lyWg2/tXPuB6dk
 2N+1ON2kWCoJh8xEoOePWzKGx43aRes5dIw7e0db4vqjavlvlmKvhkrg3oEpJZKjBIy9
 5yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hcN4e2ZIjSqTaT+HE3O5zc/5f5nqimNJqKvrwB/lfk8=;
 b=KRvrjX9xVn8FmjElkg5QCO8855WYXt4ajDKCCD0hm6DYb6JEV9m9dt9A7oFd22sP7d
 yTvHrSOE3DnuWjrxkqAOlDqHo6iHi3id2/rkXB+Dbltl5iMe+KIB7AFSnuQKCF4aNqLd
 Cwq6kd3U38cJse6ivSik3RC5Xo/g6bLanCny9OIdOxNb840S1BRGiGqZqctY8TXAl6Wy
 URgXaoamypKnfWFRZXLd0qDvU8FLn/T76StNeVJnU9i1R2sy/oroyBWH+w0lVwcd2nTb
 11TfwtplnyGEGo5CY/kltVkCMM83dAoPz93iI/+uvcHDz/g2kwEiE6J6DYb/dlKoBpiz
 2YFA==
X-Gm-Message-State: AOAM530R4a19gJj/JLssiwT/8/9TusWSS1M0fhwT5Di2kb+sjugg8DZz
 hWr8zWhsBIYT5YRceTM/yDk=
X-Google-Smtp-Source: ABdhPJyRWPzJbZG1k0ujG8DqyTAdvwA0COENYeFj3vyjFziiJ9C6Zedd9y0v55YAf77EGa1LhM9YfA==
X-Received: by 2002:a54:4703:: with SMTP id k3mr1468266oik.26.1617068583292;
 Mon, 29 Mar 2021 18:43:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n17sm3844075oic.8.2021.03.29.18.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 18:43:02 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
To: Quan Nguyen <quan@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
 <20210329015238.19474-4-quan@os.amperecomputing.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bac92db0-3ef6-1615-0e92-aabd54fd0580@roeck-us.net>
Date: Mon, 29 Mar 2021 18:43:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210329015238.19474-4-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/28/21 6:52 PM, Quan Nguyen wrote:
> This commit adds support for Ampere SMpro hwmon driver. This driver
> supports accessing various CPU sensors provided by the SMpro co-processor
> including temperature, power, voltages, and current.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  drivers/hwmon/Kconfig       |   8 +
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/smpro-hwmon.c | 494 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 503 insertions(+)
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
> index 000000000000..4277736ebc6e
> --- /dev/null
> +++ b/drivers/hwmon/smpro-hwmon.c
> @@ -0,0 +1,494 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Ampere Computing SoC's SMPro Hardware Monitoring Driver
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + */
> +#include <linux/bitfield.h>
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
> +#define MANUFACTURER_ID_REG		0x02
> +#define AMPERE_MANUFACTURER_ID		0xCD3A
> +
> +/* Logical Power Sensor Registers */
> +#define SOC_TEMP_REG			0x10
> +#define SOC_VRD_TEMP_REG		0x11
> +#define DIMM_VRD_TEMP_REG		0x12
> +#define CORE_VRD_TEMP_REG		0x13
> +#define CH0_DIMM_TEMP_REG		0x14
> +#define CH1_DIMM_TEMP_REG		0x15
> +#define CH2_DIMM_TEMP_REG		0x16
> +#define CH3_DIMM_TEMP_REG		0x17
> +#define CH4_DIMM_TEMP_REG		0x18
> +#define CH5_DIMM_TEMP_REG		0x19
> +#define CH6_DIMM_TEMP_REG		0x1A
> +#define CH7_DIMM_TEMP_REG		0x1B
> +#define RCA_VRD_TEMP_REG		0x1C
> +
> +#define CORE_VRD_PWR_REG		0x20
> +#define SOC_PWR_REG			0x21
> +#define DIMM_VRD1_PWR_REG		0x22
> +#define DIMM_VRD2_PWR_REG		0x23
> +#define CORE_VRD_PWR_MW_REG		0x26
> +#define SOC_PWR_MW_REG			0x27
> +#define DIMM_VRD1_PWR_MW_REG		0x28
> +#define DIMM_VRD2_PWR_MW_REG		0x29
> +#define RCA_VRD_PWR_REG			0x2A
> +#define RCA_VRD_PWR_MW_REG		0x2B
> +
> +#define MEM_HOT_THRESHOLD_REG		0x32
> +#define SOC_VR_HOT_THRESHOLD_REG	0x33
> +#define CORE_VRD_VOLT_REG		0x34
> +#define SOC_VRD_VOLT_REG		0x35
> +#define DIMM_VRD1_VOLT_REG		0x36
> +#define DIMM_VRD2_VOLT_REG		0x37
> +#define RCA_VRD_VOLT_REG		0x38
> +
> +#define CORE_VRD_CURR_REG		0x39
> +#define SOC_VRD_CURR_REG		0x3A
> +#define DIMM_VRD1_CURR_REG		0x3B
> +#define DIMM_VRD2_CURR_REG		0x3C
> +#define RCA_VRD_CURR_REG		0x3D
> +
> +struct smpro_hwmon {
> +	struct regmap *regmap;
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
> +		.reg = SOC_TEMP_REG,
> +		.label = "temp1 SoC"
> +	},
> +	{
> +		.reg = SOC_VRD_TEMP_REG,
> +		.label = "temp2 SoC VRD"
> +	},
> +	{
> +		.reg = DIMM_VRD_TEMP_REG,
> +		.label = "temp3 DIMM VRD"
> +	},
> +	{
> +		.reg = CORE_VRD_TEMP_REG,
> +		.label = "temp4 CORE VRD"
> +	},
> +	{
> +		.reg = CH0_DIMM_TEMP_REG,
> +		.label = "temp5 CH0 DIMM"
> +	},
> +	{
> +		.reg = CH1_DIMM_TEMP_REG,
> +		.label = "temp6 CH1 DIMM"
> +	},
> +	{
> +		.reg = CH2_DIMM_TEMP_REG,
> +		.label = "temp7 CH2 DIMM"
> +	},
> +	{
> +		.reg = CH3_DIMM_TEMP_REG,
> +		.label = "temp8 CH3 DIMM"
> +	},
> +	{
> +		.reg = CH4_DIMM_TEMP_REG,
> +		.label = "temp9 CH4 DIMM"
> +	},
> +	{
> +		.reg = CH5_DIMM_TEMP_REG,
> +		.label = "temp10 CH5 DIMM"
> +	},
> +	{
> +		.reg = CH6_DIMM_TEMP_REG,
> +		.label = "temp11 CH6 DIMM"
> +	},
> +	{
> +		.reg = CH7_DIMM_TEMP_REG,
> +		.label = "temp12 CH7 DIMM"
> +	},
> +	{
> +		.reg = RCA_VRD_TEMP_REG,
> +		.label = "temp13 RCA VRD"
> +	},
> +};
> +
> +static const struct smpro_sensor voltage[] = {
> +	{
> +		.reg = CORE_VRD_VOLT_REG,
> +		.label = "vout0 CORE VRD"
> +	},
> +	{
> +		.reg = SOC_VRD_VOLT_REG,
> +		.label = "vout1 SoC VRD"
> +	},
> +	{
> +		.reg = DIMM_VRD1_VOLT_REG,
> +		.label = "vout2 DIMM VRD1"
> +	},
> +	{
> +		.reg = DIMM_VRD2_VOLT_REG,
> +		.label = "vout3 DIMM VRD2"
> +	},
> +	{
> +		.reg = RCA_VRD_VOLT_REG,
> +		.label = "vout4 RCA VRD"
> +	},
> +};
> +
> +static const struct smpro_sensor curr_sensor[] = {
> +	{
> +		.reg = CORE_VRD_CURR_REG,
> +		.label = "iout1 CORE VRD"
> +	},
> +	{
> +		.reg = SOC_VRD_CURR_REG,
> +		.label = "iout2 SoC VRD"
> +	},
> +	{
> +		.reg = DIMM_VRD1_CURR_REG,
> +		.label = "iout3 DIMM VRD1"
> +	},
> +	{
> +		.reg = DIMM_VRD2_CURR_REG,
> +		.label = "iout4 DIMM VRD2"
> +	},
> +	{
> +		.reg = RCA_VRD_CURR_REG,
> +		.label = "iout5 RCA VRD"
> +	},
> +};
> +
> +static const struct smpro_sensor power[] = {
> +	{
> +		.reg = CORE_VRD_PWR_REG,
> +		.reg_ext = CORE_VRD_PWR_MW_REG,
> +		.label = "power1 CORE VRD"
> +	},
> +	{
> +		.reg = SOC_PWR_REG,
> +		.reg_ext = SOC_PWR_MW_REG,
> +		.label = "power2 SoC"
> +	},
> +	{
> +		.reg = DIMM_VRD1_PWR_REG,
> +		.reg_ext = DIMM_VRD1_PWR_MW_REG,
> +		.label = "power3 DIMM VRD1"
> +	},
> +	{
> +		.reg = DIMM_VRD2_PWR_REG,
> +		.reg_ext = DIMM_VRD2_PWR_MW_REG,
> +		.label = "power4 DIMM VRD2"
> +	},
> +	{
> +		.reg = RCA_VRD_PWR_REG,
> +		.reg_ext = RCA_VRD_PWR_MW_REG,
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
> +		ret = regmap_read(hwmon->regmap,
> +				  temperature[channel].reg, &value);
> +		if (ret)
> +			return ret;
> +		*val = (value & 0x1ff) * 1000;
> +		break;
> +	case hwmon_temp_crit:
> +		if (temperature[channel].reg == SOC_VRD_TEMP_REG) {
> +			ret = regmap_read(hwmon->regmap, SOC_VR_HOT_THRESHOLD_REG, &value);
> +			if (ret)
> +				return ret;
> +			*val = (value & 0x1ff) * 1000;
> +		} else {
> +			/* Report same MEM HOT threshold across DIMM channels */
> +			ret = regmap_read(hwmon->regmap, MEM_HOT_THRESHOLD_REG, &value);
> +			if (ret)
> +				return ret;
> +			*val = (value & 0x1ff) * 1000;
> +		}

To avoid code duplication:

		reg = temperature[channel].reg == SOC_VRD_TEMP_REG ? SOC_VR_HOT_THRESHOLD_REG : MEM_HOT_THRESHOLD_REG;
		ret = regmap_read(hwmon->regmap, reg, &value);
		if (ret)
			return ret;

But then why don't you just use reg_ext to store SOC_VR_HOT_THRESHOLD_REG
or MEM_HOT_THRESHOLD_REG ? It is already available, after all, and with it
the code could be simplified to

		ret = regmap_read(hwmon->regmap, temperature[channel].reg_ext, &value);
		if (ret)
			return ret;

I don't have a datasheet, but I do wonder what is in bit 9..15. Any idea ?
Main question is if there is a sign bit, as theoretic as it may be.

> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
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
> +		ret = regmap_read(hwmon->regmap, voltage[channel].reg, &value);
> +		if (ret < 0)
> +			return ret;
> +		/* Scale reported by the hardware is 1mV */
> +		*val = value & 0x7fff;

What is in bit 15 ?

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
> +		ret = regmap_read(hwmon->regmap, curr_sensor[channel].reg, &value);
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
> +		ret = regmap_read(hwmon->regmap, power[channel].reg, &val);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(hwmon->regmap, power[channel].reg_ext, &val_mw);
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
> +static int smpro_write(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long val)
> +{
> +	return -EOPNOTSUPP;
> +}

There are no writeable attributes, thus the write function is not needed.

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
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_label:
> +			*str = voltage[channel].label;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_label:
> +			*str = curr_sensor[channel].label;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_label:
> +			*str = power[channel].label;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return -EOPNOTSUPP;

If you are returning -ENOPSUPP by default, might as well replace
all the same returns above with break;

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
> +			ret = regmap_read(hwmon->regmap, temperature[channel].reg, &value);
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
> +	.write = smpro_write,
> +	.read_string = smpro_read_string,
> +};
> +
> +static const struct hwmon_chip_info smpro_chip_info = {
> +	.ops = &smpro_hwmon_ops,
> +	.info = smpro_info,
> +};
> +
> +static bool is_valid_id(struct regmap *regmap)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
> +
> +	return  (ret || (val != AMPERE_MANUFACTURER_ID)) ? false : true;

I am quite concerned about this: The calling code will translate it to
-EPROBE_DEFER even if the manufacturer ID is wrong. It should return
-ENODEV in that case. There should be a better means to determine if the
controller is not available at all, or not yet.

> +}
> +
> +static int smpro_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct smpro_hwmon *hwmon;
> +	struct device *hwmon_dev;
> +
> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!hwmon->regmap)
> +		return -ENODEV;
> +
> +	/* Check for valid ID */
> +	if (!is_valid_id(hwmon->regmap))
> +		return -EPROBE_DEFER;
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
> 

