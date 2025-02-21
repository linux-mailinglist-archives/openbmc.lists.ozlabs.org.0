Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C53A41237
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:19:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KZG63jBz3fxk
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740155442;
	cv=none; b=SRnorTJ3xCfU7d/m45VIT/Pze9FUO7w5qkZRyp+qS3uPqJpb7FXocrUU21+yMnDKX+YJHqNmOWiVn2n8V9obfYYn8668aRH0OWXUJpazEYEscWvNOBZg5QoXxN4EEZJYPEB/MOCQ2vkdNTrIyvSadwSwqWudTxkdIBLusEmOxd2yx8iqBe3BX75YplDHEAO83LmUxwKSIUe/5nGPW2ThFJF/3ircltky0lV5Ma2nGJZt40SjiaM+EMu6HgwX0dDLVI+iCFtAcdfw0j6u+Q25fITCI1spAEgHsrlvmp9NsZtg7LggQzlFVBs5BIg3XH2MHItvrs2K2N3egctz71mcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740155442; c=relaxed/relaxed;
	bh=yraMqB3V0rz+4If7jNzjsoA2YWqNW4WDNQQZ/DTpC8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eff4TJMaESG8+wXamLJRVxfWYL1XvIsNreEIL+39Sws4VzkUMdXInHhLB6Yz4NWKDmXgIROnSBXr8J7g1jr7LNIdOpF9eermkzVk/rBSnA6UuySJhYAKVEOxMvfqQpRMZDPdNmCWs8H7ZCrxrcmYcbaxh+0jO9dzrsESv0O5c2B6GwW/iV857d/4koYE7s5/2X2wZMS1XBjeW2wV0vMa+vKX45ORXCBe3up0KyzZb8jp65oypJWUPwruKi8i3X94tpdFLZUnIjBNig/QN1Icz1gSC9rr9YGrQQBxZoVsd7ULlZPcYyRcD8R7edIh+uK+KGU3tFhlvF0NAeTNMtFufA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nGdhpNCO; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nGdhpNCO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yzwbh6MCqz2xgv
	for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2025 03:30:39 +1100 (AEDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2addd5053c0so1331201fac.1
        for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 08:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740155434; x=1740760234; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yraMqB3V0rz+4If7jNzjsoA2YWqNW4WDNQQZ/DTpC8Q=;
        b=nGdhpNCOBrlIW56lWvwbtFj1uWG644Nb7Bu6I+ofw1A0b4pYs/pGvF4s5I4DkcdhFe
         ZJGlclnZnVRHM9r+uEeNwERd0QUYCKlZqXp3T4Zb9aQ3huugAjFBWklU+xYQ/MK69nKN
         UdPoFM1JyU4ziuTqwx55gxycJMGUfa3/p89R8a2wx7HfjsNJjaIZggaXFGll6gEboO2H
         a/ZOOCe0o284BIo/iUPgceXozGM4X4TePTV/OiHw0UDCcyJRUnFesU7O0xcEFJmlYeBb
         en93ipD0ICMZF2HbTPh0+A7bCmYj2mStaWxe/ob1wLZLWOr0t/ZT1UPaGz8273ypnWW4
         IFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155434; x=1740760234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yraMqB3V0rz+4If7jNzjsoA2YWqNW4WDNQQZ/DTpC8Q=;
        b=euk2mNceLIu8ANGQFrgZ+Tk8gQDoVLkJgyCz9z6IfwEPif+Cvg7Dw/s80Vhb1kLvGc
         th1ww+oJkWK/k0i2UdX0NA996oFFJmtX7Y3Eq9QiZuJ4g6rQ3cojBv4IqFXhQZ8glI1q
         i5iToLJM4k4fcZeyQrGMx2t0j5iT0GQYrPy23y1hzpBKPr5w8+jXZ4p6K7XmqEw/K7O7
         FIjPiWH8UADc/ghEQvJ+hGvJaJ6HXnFcOHKjpeFWM7Uj31JWw6g0O0nPqF4rkxEXu93X
         yfhxeKHIaP+nXSHTAWV50LHTVHuESn1q4nuVdyZDxMs+b8tdplUO3xEumJArhmtDKk22
         YlFg==
X-Gm-Message-State: AOJu0Yz43OD2Bm1mcqKeQGdNTLFf5cZEhz6KG57UTWF1Tas53NTcCac9
	vSKa3kRIWfDZSYMz8uhEE0tAyKbUYjmaqkaWS0TVo2zFc/XMaIBrhB9t4PT6ANI=
X-Gm-Gg: ASbGncv0CcrMBYLcfdTWQUCjE2UWBMXCNz4DuWx+aXAYVlV0RKthRz5KN8h6KqVb5GE
	bvg4GxPjQROQtQZvVdZI1W5L3/fly0KChsWaDbfLWumlIOymltCjJ/q1u9TYSxfI2nqlef40C8q
	62LK0OiOd5JwUnCSKxWz9IjUSvcNKKz6eP8UIMdkqJJgBYkIrC/MTLvR9x5D6SwDEUyBaHt72vl
	qygOH7WdQTHg2yTyOkChby1dkajRgp6aapkTTMdGqzYeQFEoydPE3XfHZe9otmuUUOvbguGCR/5
	Cwz+ecW37kqOhDovKqLoDdH9qx2SnGm/utByfMG11bEEZ/VHwa18kIpWbw4c7l8=
X-Google-Smtp-Source: AGHT+IF5/l844C8i/roqudIe6U4obFMxplsc/QWd3Tj6rY2veQmSYaFOHBJtViXOAZab5e5Vr5lyfw==
X-Received: by 2002:a05:6871:a910:b0:2bc:8c4a:aac2 with SMTP id 586e51a60fabf-2bd50f30260mr2983960fac.27.1740155434450;
        Fri, 21 Feb 2025 08:30:34 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72737f96190sm1526218a34.11.2025.02.21.08.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 08:30:33 -0800 (PST)
Message-ID: <2edc6e72-245b-4a55-bb5e-6a6ed3abcf27@baylibre.com>
Date: Fri, 21 Feb 2025 10:30:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
To: Eason Yang <j2anfernee@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jic23@kernel.org,
 lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, javier.carrasco.cruz@gmail.com,
 andriy.shevchenko@linux.intel.com, gstols@baylibre.com,
 olivier.moysan@foss.st.com, mitrutzceclan@gmail.com, tgamblin@baylibre.com,
 matteomartelli3@gmail.com, marcelo.schmitt@analog.com,
 alisadariana@gmail.com, joao.goncalves@toradex.com,
 thomas.bonnefille@bootlin.com, ramona.nechita@analog.com,
 herve.codina@bootlin.com, chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
 yhyang2@nuvoton.com
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
 <20250221090918.1487689-3-j2anfernee@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250221090918.1487689-3-j2anfernee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/21/25 3:09 AM, Eason Yang wrote:
> Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
> 
> NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and up to
> 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins for
> independent alarm signals, and the all threshold values could be set for
> system protection without any timing delay. It also supports reset input
> RSTIN# to recover system from a fault condition.
> 
> Currently, only single-edge mode conversion and threshold events support.
> 
> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> ---
>  MAINTAINERS               |   1 +
>  drivers/iio/adc/Kconfig   |  11 +
>  drivers/iio/adc/Makefile  |   1 +
>  drivers/iio/adc/nct7201.c | 487 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 500 insertions(+)
>  create mode 100644 drivers/iio/adc/nct7201.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fdc4aa5c7eff..389cbbdae1a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2838,6 +2838,7 @@ F:	arch/arm/mach-npcm/
>  F:	arch/arm64/boot/dts/nuvoton/
>  F:	drivers/*/*/*npcm*
>  F:	drivers/*/*npcm*
> +F:	drivers/iio/adc/nct7201.c

Same comment as DT bindings, this is ARM/NUVOTON NPCM ARCHITECTURE.
We need a new section for this chip since it is stand-alone.

>  F:	drivers/rtc/rtc-nct3018y.c
>  F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
>  F:	include/dt-bindings/clock/nuvoton,npcm845-clk.h

...

> diff --git a/drivers/iio/adc/nct7201.c b/drivers/iio/adc/nct7201.c
> new file mode 100644
> index 000000000000..c5d1540bcc00
> --- /dev/null
> +++ b/drivers/iio/adc/nct7201.c
> @@ -0,0 +1,487 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
> + *
> + * Copyright (c) 2024-2025 Nuvoton Technology corporation.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>

Are we really using something from the init header?

> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +
> +#include <linux/iio/events.h>
> +#include <linux/iio/iio.h>
> +

...

> +static int nct7201_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	u16 volt;
> +	unsigned int value;
> +	int err;
> +	struct nct7201_chip_info *chip = iio_priv(indio_dev);
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	guard(mutex)(&chip->access_lock);

The regmap should already have an intneral lock, so this mutex seems
reduandnt in it's current usage.

> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		err = regmap_read(chip->regmap16, NCT7201_REG_VIN(chan->address), &value);
> +		if (err < 0)
> +			return err;
> +		volt = value;
> +		*val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		/* From the datasheet, we have to multiply by 0.0004995 */
> +		*val = 0;
> +		*val2 = 499500;
> +		return IIO_VAL_INT_PLUS_NANO;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int nct7201_read_event_value(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir,
> +				    enum iio_event_info info,
> +				    int *val, int *val2)
> +{
> +	struct nct7201_chip_info *chip = iio_priv(indio_dev);
> +	u16 volt;
> +	unsigned int value;
> +	int err;
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (info != IIO_EV_INFO_VALUE)
> +		return -EINVAL;
> +
> +	if (dir == IIO_EV_DIR_FALLING) {
> +		err = regmap_read(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address),
> +				  &value);
> +		if (err < 0)
> +			return err;
> +		volt = value;

Assigning to volt seems reduant. We can just pass value to
FIELD_GET() below.

> +	} else {
> +		err = regmap_read(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
> +				  &value);
> +		if (err < 0)
> +			return err;
> +		volt = value;
> +	}
> +
> +	*val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
> +
> +	return IIO_VAL_INT;
> +}
> +
> +static int nct7201_write_event_value(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     enum iio_event_info info,
> +				     int val, int val2)
> +{
> +	struct nct7201_chip_info *chip = iio_priv(indio_dev);
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (info != IIO_EV_INFO_VALUE)
> +		return -EOPNOTSUPP;
> +
> +	if (dir == IIO_EV_DIR_FALLING)
> +		regmap_write(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address),
> +			     FIELD_PREP(NCT7201_REG_VIN_MASK, val));

No error checking? Could just return here directly.

> +	else
> +		regmap_write(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
> +			     FIELD_PREP(NCT7201_REG_VIN_MASK, val));
> +
> +	return 0;
> +}
> +

...

> +static int nct7201_write_event_config(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan,
> +				      enum iio_event_type type,
> +				      enum iio_event_direction dir,
> +				      bool state)
> +{
> +	struct nct7201_chip_info *chip = iio_priv(indio_dev);
> +	unsigned int mask;
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	mask = BIT(chan->address);
> +
> +	if (!state && (chip->vin_mask & mask))
> +		chip->vin_mask &= ~mask;
> +	else if (state && !(chip->vin_mask & mask))
> +		chip->vin_mask |= mask;

This would be easier to read as:

	if (state)
		chip->vin_mask |= mask;
	else
		chip->vin_mask &= ~mask;

> +
> +	if (chip->num_vin_channels <= 8)
> +		regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1, chip->vin_mask);

No error checking?

> +	else
> +		regmap_bulk_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
> +				  &chip->vin_mask, sizeof(chip->vin_mask));
> +
> +	return 0;
> +}
> +

...

> +static int nct7201_init_chip(struct nct7201_chip_info *chip)
> +{
> +	u8 data[2];
> +	unsigned int value;
> +	int err;
> +
> +	regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION,
> +		     NCT7201_BIT_CONFIGURATION_RESET);

Check error return?

> +
> +	/*
> +	 * After about 25 msecs, the device should be ready and then
> +	 * the Power Up bit will be set to 1. If not, wait for it.
> +	 */
> +	mdelay(25);
> +	err = regmap_read(chip->regmap, NCT7201_REG_BUSY_STATUS, &value);
> +	if (err < 0)
> +		return err;
> +	if (!(value & NCT7201_BIT_PWR_UP))
> +		return dev_err_probe(&chip->client->dev, -EIO,
> +				     "Failed to power up after reset\n");
> +
> +	/* Enable Channel */
> +	if (chip->num_vin_channels <= 8) {
> +		data[0] = NCT7201_REG_CHANNEL_ENABLE_1_MASK;
> +		err = regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1, data[0]);
> +		if (err < 0)
> +			return dev_err_probe(&chip->client->dev, -EIO,
> +					     "Failed to write NCT7201_REG_CHANNEL_ENABLE_1\n");
> +	} else {
> +		data[0] = NCT7201_REG_CHANNEL_ENABLE_1_MASK;
> +		data[1] = NCT7201_REG_CHANNEL_ENABLE_2_MASK;
> +		err = regmap_bulk_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
> +					data, ARRAY_SIZE(data));
> +		if (err < 0)
> +			return dev_err_probe(&chip->client->dev, -EIO,
> +					    "Failed to write NCT7201_REG_CHANNEL_ENABLE_1 and NCT7201_REG_CHANNEL_ENABLE_2\n");
> +	}
> +
> +	value = get_unaligned_le16(data);

Does it matter that data[1] may be uninitialized and contain random value here?

> +	chip->vin_mask = value;

Don't really need the intermediate value assignment here.

> +
> +	/* Start monitoring if needed */
> +	err = regmap_read(chip->regmap, NCT7201_REG_CONFIGURATION, &value);
> +	if (err < 0)
> +		return dev_err_probe(&chip->client->dev, -EIO,
> +				     "Failed to read NCT7201_REG_CONFIGURATION\n");
> +
> +	regmap_set_bits(chip->regmap, NCT7201_REG_CONFIGURATION, NCT7201_BIT_CONFIGURATION_START);
> +
> +	return 0;
> +}
> +

