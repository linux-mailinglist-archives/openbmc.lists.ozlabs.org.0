Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9591A01C6B
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:14:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRClw3yW7z3w0l
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:13:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735392951;
	cv=none; b=IjUq8TZmJAXV3GlXG48FCWQL7NKwjpF7JqgQbEMiPYlPlGOUkS5ltWLsKsO3WFHnYOoVsGsYEK4HhJnl+7lCxFoaj9pJyKe0mr5JBraBeG5rMP8nuJgVoGOPAnhOcthnnMELNnXtKwqL2UUepgWnnKZwKFXsJ9LgfFK5oKByRKP5eCCKjg5Xsl9u819db85zyZGoQSpcRtgpKjcOBI8HmKOnYmeVKgP1fI4qLugTKNPGefDt1cOV1CDxt3QgevjOrFOBnL2scass+SSlKq7TUGPqEg8NRWuS6MeoFA24UFd3i15FbAWo4jjMENQnH/shvQZEGaAD9YpiJVRJK/2bAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735392951; c=relaxed/relaxed;
	bh=U7PgI3hu8xqLM9VfD8xjWUyiRfMhrMhMTd1owKQ3MNg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DhTb0QbD7iZoDbyqzxB8LZ76lVbs7XgHlRJ9DQg6xsPJWbppiIiRrUHGhbAxC3L2MEAHPkN23G6V2aNpAjqwBli4WbvBdba3PXy0PFo5sjxyYCMgff6ThfLcaFSqYRNTkqbaOGM3FcmIOsdD5+KeDyjTaD/iRBjwA4lGUX3R/oFMOJ4irTx4JCttDownF/3/wlxZP0ZTVnF3AbETpkZlVZmG5ppolOiJTlS7a4HlLC+AhEAMLfmd1acwNimtQhrPeRI1sCFGmDev9BfNvcxu4pXuyTgvHzHUWmz+Fk74ktr9vPnvphWCnbaYgWka6SID1NGdv0VP7Gidq54OvkYkrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOUmiNPI; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UOUmiNPI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YL3KK6g8Cz2xKd
	for <openbmc@lists.ozlabs.org>; Sun, 29 Dec 2024 00:35:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCEA3A40308;
	Sat, 28 Dec 2024 13:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CEDC4CECD;
	Sat, 28 Dec 2024 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735392946;
	bh=pkh80hy3KgcNMaEFQuksOhp6OcKpv13Fv/7BoeTtOS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UOUmiNPI0nCG632CkqW1Tawi6jnXRaO5iIj+1Pe7XMcnnKWcR+KNa5QR/kFisEWSt
	 2ytD2+Tb6TXyB6YpyZKO5fiKKHZdlJSb8QYS/DFwKmDEPAqu65Ap0OxJngLZZENiVi
	 PVe6PnnjS+bo6QIQEWBJRicfSzaAJbQoS0yJLF70kGpIZ/CUb7yn8+lne4yuHsg+HY
	 QtKu0lfotXiwvahqQQqeoSCSLeB6lP4LnH7uhhaUcMN4ZgsM3GwbcUnpX1eb06UBSD
	 /gPK+zX8qQ5AYHji/GLGLJlB3UztEZZ41KelditkFCtYk4y/g8wWkH/akXh7+v2dTw
	 RL9VKw7h9F5JA==
Date: Sat, 28 Dec 2024 13:35:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Eason Yang <j2anfernee@gmail.com>, marcelo.schmitt@analog.com,
 olivier.moysan@foss.st.com
Subject: Re: [PATCH v3 2/2] iio: adc: add Nuvoton NCT7201 ADC driver
Message-ID: <20241228133531.5e98357e@jic23-huawei>
In-Reply-To: <20241226055313.2841977-3-j2anfernee@gmail.com>
References: <20241226055313.2841977-1-j2anfernee@gmail.com>
	<20241226055313.2841977-3-j2anfernee@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, matteomartelli3@gmail.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 26 Dec 2024 13:53:13 +0800
Eason Yang <j2anfernee@gmail.com> wrote:

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
Hi Eason,

Various minor comments in addition to what Andy has
posted already.

Jonathan

> diff --git a/drivers/iio/adc/nct7201.c b/drivers/iio/adc/nct7201.c
> new file mode 100644
> index 000000000000..9ad4d2919461
> --- /dev/null
> +++ b/drivers/iio/adc/nct7201.c
> @@ -0,0 +1,449 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
> + *
> + * Copyright (c) 2024 Nuvoton Inc.
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
> +#define NCT7201_VIN_MAX					12	/* Counted from 1 */
> +#define NCT7201_IN_SCALING				4995
> +#define NCT7201_IN_SCALING_FACTOR			10000
> +
> +#define NCT7201_REG_INTERRUPT_STATUS_1			0x0C
> +#define NCT7201_REG_INTERRUPT_STATUS_2			0x0D
> +#define NCT7201_REG_VOLT_LOW_BYTE			0x0F
> +#define NCT7201_REG_CONFIGURATION			0x10
> +#define  NCT7201_BIT_CONFIGURATION_START		BIT(0)
> +#define  NCT7201_BIT_CONFIGURATION_ALERT_MSK		BIT(1)
> +#define  NCT7201_BIT_CONFIGURATION_CONV_RATE		BIT(2)
> +#define  NCT7201_BIT_CONFIGURATION_RESET		BIT(7)
> +
> +#define NCT7201_REG_ADVANCED_CONFIGURATION		0x11
> +#define  NCT7201_BIT_ADVANCED_CONF_MOD_ALERT		BIT(0)
> +#define  NCT7201_BIT_ADVANCED_CONF_MOD_STS		BIT(1)
> +#define  NCT7201_BIT_ADVANCED_CONF_FAULT_QUEUE		BIT(2)
> +#define  NCT7201_BIT_ADVANCED_CONF_EN_DEEP_SHUTDOWN	BIT(4)
> +#define  NCT7201_BIT_ADVANCED_CONF_EN_SMB_TIMEOUT	BIT(5)
> +#define  NCT7201_BIT_ADVANCED_CONF_MOD_RSTIN		BIT(7)
> +
> +#define NCT7201_REG_CHANNEL_INPUT_MODE			0x12
> +#define NCT7201_REG_CHANNEL_ENABLE_1			0x13
> +#define  NCT7201_REG_CHANNEL_ENABLE_1_MASK		GENMASK(7, 0)
> +#define NCT7201_REG_CHANNEL_ENABLE_2			0x14
> +#define  NCT7201_REG_CHANNEL_ENABLE_2_MASK		GENMASK(3, 0)

As below. I'd treat these two registers as one larger register.

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
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		err = regmap_read(chip->regmap16, NCT7201_REG_VIN(chan->address), &value);
> +		if (err < 0)
> +			return err;
> +		volt = value;
> +		*val = volt >> 3;

As below, likely a FIELD_GET() is appropriate here.

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
> +		err = regmap_read(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address), &value);
> +		if (err < 0)
> +			return err;
> +		volt = value;
> +	} else {
> +		err = regmap_read(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address), &value);
> +		if (err < 0)
> +			return err;
> +		volt = value;
> +	}
> +
> +	*val = volt >> 3;
As Andy pointed out, likely a FIELD_GET() makes sense here.

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
> +	long v1, v2;
> +
> +	v1 = val >> 5;
> +	v2 = FIELD_PREP(NCT7201_REG_VIN_LIMIT_LSB_MASK, val) << 3;
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (info == IIO_EV_INFO_VALUE) {
I'd flip this to
	if (info != IIO_EV_INFO_VALUE)
		return -EOPNOTSUPP;

	guard().

> +		guard(mutex)(&chip->access_lock);
> +		if (dir == IIO_EV_DIR_FALLING) {
> +			regmap_write(chip->regmap, NCT7201_REG_VIN_LOW_LIMIT(chan->address), v1);
> +			regmap_write(chip->regmap, NCT7201_REG_VIN_LOW_LIMIT_LSB(chan->address), v2);

Check for errors.

> +		} else {
> +			regmap_write(chip->regmap, NCT7201_REG_VIN_HIGH_LIMIT(chan->address), v1);
> +			regmap_write(chip->regmap, NCT7201_REG_VIN_HIGH_LIMIT_LSB(chan->address), v2);
> +		}
> +	}
> +
> +	return 0;
> +}

> +
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
> +
> +	guard(mutex)(&chip->access_lock);
> +	regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
> +		     chip->vin_mask & NCT7201_REG_CHANNEL_ENABLE_1_MASK);
> +	if (chip->num_vin_channels == 12)
> +		regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_2,
> +			     chip->vin_mask & NCT7201_REG_CHANNEL_ENABLE_2_MASK);

This feels odd.  Don't you need to shift that vin_mask to get rid of channels
that are enabled via ENABLE_1?

> +
> +	return 0;
> +}

> +static int nct7201_init_chip(struct nct7201_chip_info *chip)
> +{
> +	u8 data[2];
> +	unsigned int value;
> +	int err;
> +
> +	regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION,
> +		     NCT7201_BIT_CONFIGURATION_RESET);

Add a comment on why you don't check return value (or do check it if appropriate).

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
> +		return dev_err_probe(&chip->client->dev, -EIO, "failed to power up after reset\n");
> +
> +	/* Enable Channel */
> +	guard(mutex)(&chip->access_lock);
> +	regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
> +		     NCT7201_REG_CHANNEL_ENABLE_1_MASK);

Check return value.  This is over an I2C bus, not the most reliable of
transports!

Consider doing this differently and using a bulk write for the larger
case.

	if (chip->num_vin_channels <= 8)
		ret = regmap_write();
	else
		ret = regmap_bulk_write();

However as you read ENABLE_2 unconditionally below, can you instead just
always use a bulk write here?

> +	if (chip->num_vin_channels == 12)
> +		regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_2,
> +			     NCT7201_REG_CHANNEL_ENABLE_2_MASK);
> +
> +	err = regmap_read(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1, &value);
> +	if (err < 0)
> +		return err;
> +	data[0] = value;
> +
> +	err = regmap_read(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_2, &value);
> +	if (err < 0)
> +		return err;
> +	data[1] = value;

Why does reading these back make sense?  Is there a reason the write
above might not work if the I2C transfer is Acked?

If this is part of discovery protocol for how many channels are there, then
add comments.

> +
> +	value = get_unaligned_le16(data);
> +	chip->vin_mask = value;
> +
> +	/* Start monitoring if needed */
> +	err = regmap_read(chip->regmap, NCT7201_REG_CONFIGURATION, &value);
> +	if (err < 0) {
> +		dev_err_probe(&chip->client->dev, -EIO, "Failed to read REG_CONFIGURATION\n");
> +		return value;

Why return value if an error occurred?
		retuen dev_err_probe();

> +	}
> +
> +	value |= NCT7201_BIT_CONFIGURATION_START;
> +	regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION, value);

regmap_set_bits()

> +
> +	return 0;
> +}
> +
> +static const struct regmap_config nct7201_regmap8_config = {
> +	.name = "vin-data-read-byte",
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +};
> +
> +static const struct regmap_config nct7201_regmap16_config = {
> +	.name = "vin-data-read-word",
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.max_register = 0xff,
> +};
> +
> +static int nct7201_probe(struct i2c_client *client)
> +{
> +	const struct nct7201_adc_model_data *model_data;
> +	struct nct7201_chip_info *chip;
> +	struct iio_dev *indio_dev;
> +	int ret;
> +
> +	model_data = i2c_get_match_data(client);
> +	if (!model_data)
> +		return -EINVAL;
> +
> +	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +	chip = iio_priv(indio_dev);
> +
> +	chip->regmap = devm_regmap_init_i2c(client, &nct7201_regmap8_config);
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
> +			"Failed to init regmap\n");
> +
> +	chip->regmap16 = devm_regmap_init_i2c(client, &nct7201_regmap16_config);
> +	if (IS_ERR(chip->regmap16))
> +		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap16),
> +			"Failed to init regmap16\n");
> +
> +	chip->num_vin_channels = model_data->num_vin_channels;
> +
> +	ret = devm_mutex_init(&client->dev, &chip->access_lock);
> +	if (ret)
> +		return ret;
> +
> +	chip->client = client;
> +
> +	ret = nct7201_init_chip(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	indio_dev->name = model_data->model_name;
> +	indio_dev->channels = model_data->channels;
> +	indio_dev->num_channels = model_data->num_channels;
> +	if (client->irq)
> +		indio_dev->info = &nct7201_info;
> +	else
> +		indio_dev->info = &nct7201_info_no_irq;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	return devm_iio_device_register(&client->dev, indio_dev);
> +}
