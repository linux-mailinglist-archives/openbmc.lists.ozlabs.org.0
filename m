Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D63C732E
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 17:28:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPPg0105pz30HW
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 01:28:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Suu3dkaA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Suu3dkaA; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPPff0Bmtz2yj0;
 Wed, 14 Jul 2021 01:28:25 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id w194so5660798oie.5;
 Tue, 13 Jul 2021 08:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TxwcAPSn60tW7JB/iXZqgc9ZY9KO7n7lZVH+omYXMjo=;
 b=Suu3dkaAPeLV3aoKIV00r3HCZbE6vpyrpmO3LMe3oY2xXd3qxGtZzFHUglOY6zctAo
 ZFlPkWIdBQ7U/f5kFLAwQuNamxi89mRliOCN2PJkDXDg++SI/tLGS4A0yLXqaBmmDF9m
 foBwggtrKKtUlius7LPbWetuGUVd5N3uxMlypX0JIpTIzVSk62ncy0YfxSNdCghuSatl
 6/D+qfNdRsTQueTKFMx5vlwSSxOyFGDvGA5eZV6ZVONG60iTZ0WUSi73edsJqQT9r2IC
 3UZ6Mr2YKmjKu/paWeVr2wd//gUo2g5+lBFYtqE4mWaQZQm8y6OnJHjKFuiQzgUnYZZE
 RYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TxwcAPSn60tW7JB/iXZqgc9ZY9KO7n7lZVH+omYXMjo=;
 b=SO+Wv3vdxmqhMt10nH/jqJ23B440ggE6Vh1zzgsWlZe1W4c1ToiUeJ1a9YnRgRvkPO
 GcS/3CKq4vHnwFanGNBoZbphJLfWGuQixcycuCWLd5tnyO3KmVQo1DT63NaxfZxJW42c
 x4lOnEtRYmMuS38qDCMV1Amkp9EyhQgrE3dDtHF0lmPuL0Xqu/F3p3xGtr+cRX/J2QyV
 DAgzIQ5+PL0Djc+R9WWQR7BKXH/VMOUPsCV0LKj45pXDJTvAvSpDAahGG1atHXYv6Twl
 T0TN6D8nl9hIh7iFetPk+Gncy/ZxDmahfyL7snHq5iyVOFHm1q8Eyo7y6OQuLJA091EO
 Vtew==
X-Gm-Message-State: AOAM530tikspW9z+s3qy5f3OSKCmlYVq8ggG271pk8+31F3z+L4Rnjaa
 3GOQlBNOeA2Mk1tN/Bnde70=
X-Google-Smtp-Source: ABdhPJy0m/hUfgfzaDXgopiCH6q3OLHEFcFJPuCrAtfGzmh6A66q0BslrWHZrssQTIW1eJMAccDzhg==
X-Received: by 2002:aca:3dc4:: with SMTP id k187mr3674130oia.147.1626190100664; 
 Tue, 13 Jul 2021 08:28:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l17sm558469ota.20.2021.07.13.08.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 08:28:20 -0700 (PDT)
Subject: Re: [PATCH v5 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
To: Quan Nguyen <quan@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
 <20210713060031.31568-4-quan@os.amperecomputing.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7c16c294-ad96-8b68-df35-1201cc627d3d@roeck-us.net>
Date: Tue, 13 Jul 2021 08:28:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713060031.31568-4-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 7/12/21 11:00 PM, Quan Nguyen wrote:
> This commit adds support for Ampere SMpro hwmon driver. This driver
> supports accessing various CPU sensors provided by the SMpro co-processor
> including temperature, power, voltages, and current.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v5:
>    + Drop ManufacturerID checking when probe as it was checked during
>    smpro-mfd probing [Quan]
>    + Drop the use of register offset [Quan]
>    + Removed the use of compatible string as it is instantiated by
>    smpro-mfd driver [Quan]
>    + Thanks Guenter for the Reviewed-by in last version, but it was
>    not added because there's some changes in this version. Really
>    appreciate if you could help again, thank you.
> 
> Changes in v4:
>    + Returned regmap_read() error code [Guenter]
> 
> Changes in v3:
>    + Handled negative temperature value [Guenter]
>    + Returned -ENODEV if Manufacturer ID is wrong [Guenter]
>    + Refactored smpro_read_string() and smpro_temp_read() [Guenter]
>    + Removed smpro_write() function [Guenter]
>    + Added minor refactor changes [Quan]
> 
> Changes in v2:
>    + Removed "virtual" sensors [Guenter]
>    + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
>    + Corrected return error code when host is turn off [Guenter]
>    + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
>    + Removed license info as SPDX-License-Identifier existed [Guenter]
>    + Added is_visible() support [Guenter]
>    + Used HWMON_CHANNEL_INFO() macro and LABEL attributes [Guenter]
>    + Made is_valid_id() return boolean [Guenter]
>    + Returned -EPROBE_DEFER when smpro reg inaccessible [Guenter]
>    + Removed unnecessary error message when dev register fail [Guenter]
>    + Removed Socket TDP sensor [Quan]
>    + Included sensor type and channel in labels [Quan]
>    + Refactorized code to fix checkpatch.pl --strict complaint [Quan]
> 
>   drivers/hwmon/Kconfig       |   8 +
>   drivers/hwmon/Makefile      |   1 +
>   drivers/hwmon/smpro-hwmon.c | 463 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 472 insertions(+)
>   create mode 100644 drivers/hwmon/smpro-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e3675377bc5d..903c5ef79a5a 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -67,6 +67,14 @@ config SENSORS_ABITUGURU3
>   	  This driver can also be built as a module. If so, the module
>   	  will be called abituguru3.
>   
> +config SENSORS_SMPRO
> +	tristate "Ampere's Altra SMpro hardware monitoring driver"
> +	depends on MFD_SMPRO
> +	help
> +	  If you say yes here you get support for the thermal, voltage,
> +	  current and power sensors of Ampere's Altra processor family SoC
> +	  with SMpro co-processor.
> +
>   config SENSORS_AD7314
>   	tristate "Analog Devices AD7314 and compatibles"
>   	depends on SPI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d712c61c1f5e..9de5cd9911b0 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -175,6 +175,7 @@ obj-$(CONFIG_SENSORS_SHT4x)	+= sht4x.o
>   obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
>   obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
>   obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
> +obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
>   obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>   obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
>   obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
> diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
> new file mode 100644
> index 000000000000..b01ceea33ddd
> --- /dev/null
> +++ b/drivers/hwmon/smpro-hwmon.c
> @@ -0,0 +1,463 @@
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
> +/* Logical Power Sensor Registers */
> +#define SOC_TEMP		0x10
> +#define SOC_VRD_TEMP		0x11
> +#define DIMM_VRD_TEMP		0x12
> +#define CORE_VRD_TEMP		0x13
> +#define CH0_DIMM_TEMP		0x14
> +#define CH1_DIMM_TEMP		0x15
> +#define CH2_DIMM_TEMP		0x16
> +#define CH3_DIMM_TEMP		0x17
> +#define CH4_DIMM_TEMP		0x18
> +#define CH5_DIMM_TEMP		0x19
> +#define CH6_DIMM_TEMP		0x1A
> +#define CH7_DIMM_TEMP		0x1B
> +#define RCA_VRD_TEMP		0x1C
> +
> +#define CORE_VRD_PWR		0x20
> +#define SOC_PWR			0x21
> +#define DIMM_VRD1_PWR		0x22
> +#define DIMM_VRD2_PWR		0x23
> +#define CORE_VRD_PWR_MW		0x26
> +#define SOC_PWR_MW		0x27
> +#define DIMM_VRD1_PWR_MW	0x28
> +#define DIMM_VRD2_PWR_MW	0x29
> +#define RCA_VRD_PWR		0x2A
> +#define RCA_VRD_PWR_MW		0x2B
> +
> +#define MEM_HOT_THRESHOLD	0x32
> +#define SOC_VR_HOT_THRESHOLD	0x33
> +#define CORE_VRD_VOLT		0x34
> +#define SOC_VRD_VOLT		0x35
> +#define DIMM_VRD1_VOLT		0x36
> +#define DIMM_VRD2_VOLT		0x37
> +#define RCA_VRD_VOLT		0x38
> +
> +#define CORE_VRD_CURR		0x39
> +#define SOC_VRD_CURR		0x3A
> +#define DIMM_VRD1_CURR		0x3B
> +#define DIMM_VRD2_CURR		0x3C
> +#define RCA_VRD_CURR		0x3D
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
> +		ret = regmap_read(hwmon->regmap, temperature[channel].reg, &value);
> +		if (ret)
> +			return ret;
> +		break;
> +	case hwmon_temp_crit:
> +		ret = regmap_read(hwmon->regmap, temperature[channel].reg_ext, &value);
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
> +		ret = regmap_read(hwmon->regmap, voltage[channel].reg, &value);
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
> +
> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!hwmon->regmap)
> +		return -ENODEV;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "smpro_hwmon",
> +							 hwmon, &smpro_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver smpro_hwmon_driver = {
> +	.probe		= smpro_hwmon_probe,
> +	.driver = {
> +		.name	= "smpro-hwmon",
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

