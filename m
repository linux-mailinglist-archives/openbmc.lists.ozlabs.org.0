Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64031A4123B
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:20:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KZh0gSFz3vc6
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740239824;
	cv=none; b=f6nzWH2IVLLR8J3QyGnXdI+bS0Q6oTft8qucbyPY7OZlq3JrRx0hEIld5vIndbc95RSfjXKxNjqtoWWVDXVNS87O8y/hK/cdZZM/qHHA20jl8fWebJDZxA+PA+0M9YhekwljdYFMM6rbLaJgllmB61vum/tb2GJXJw14GO6vk7GWQqYiPlSa1NhrK/LuCN7NshFVfyjwjojm/3jCdML7ohrp8pH/W3n+r5FFIyd5VidSr6J/l1l0T+iTNb5rQc8jleyJtzCd8zrmcRbKYBF7KUa86ikv2OVFnefskDl+L1yVszCK+vbC2vEcNh5Hh/h2GbY8fVBUTYNXZUQuh0dMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740239824; c=relaxed/relaxed;
	bh=Onf1JCCwQDLDXSpCccnvdL2XzBq85F1Rht6DlDyYC0E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l3q8QWX55T6UA31pmiR2l1yCcLu7neudBCU5NQetp/S5eBXtY4dyhVHvc9PT7mF2vqBLTplKOPvra8eBFkc5JW79QWbY17Q+fAbg19pjAV4RUI2HCq8/qyigXBF7O+6MS0YX2uyyr1OILa0TtH3rQzExRAy4aTJQGDWh0AucRi8dfslCGDudXdJnT/FYeuGrcB+UYtpAHueUeimMzbqPmla3xFxtYair0LAL3G6rC0sSZSjv7ltXEvL+upg2yH3/3HUrNYE37+pccn4n6k7B+AEhk4K4203qPw4CIGbtCcJg7RH/0jC4BdvcSvyNeJz1ut02au/1m4CNTgu5Ps5FPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfE3D0ul; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NfE3D0ul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0WpR6ZScz2ytQ
	for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 02:57:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79CAF61132;
	Sat, 22 Feb 2025 15:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658E4C4CEE4;
	Sat, 22 Feb 2025 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740239820;
	bh=X9W99eyKCCVl+jjs+X+HEG5aWdDTZJ6O9eeXlGZgHIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NfE3D0ullPSwME2gEhJw0c44jhYZs5BBr7UUwuqFk2V40WucOM3O482iEfGDtes49
	 a0C6QJFbP92YzLZYDav2t65AW34dqIT0nCD/48QXQXdbBnCLiyIl/OCUsx4Txsx231
	 rWPSvr9wSpFjmK9fE0gFS6cXEY0D8vzIGPBX6FmVBGyaHVfwN7Mh4J5p9Xbtk6BRWl
	 cJtxvxTBE6fdwX/+WTy4Fgg1jU3zCEZulclQ+Zr0Fzh6ihG95XM0hFEv9xuzNr7ug3
	 DInfASsVVhOYEoMxt3NVuaxGWpi+ghgE2BRBbKXfYxYUeCf5m6SBvjjGBHZFBDqLF/
	 qga1Nx127Iltw==
Date: Sat, 22 Feb 2025 15:56:46 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Eason Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
Message-ID: <20250222155646.7fa6375a@jic23-huawei>
In-Reply-To: <20250221090918.1487689-3-j2anfernee@gmail.com>
References: <20250221090918.1487689-1-j2anfernee@gmail.com>
	<20250221090918.1487689-3-j2anfernee@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_XBL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, joao.goncalves@toradex.com, andriy.shevchenko@linux.intel.com, gstols@baylibre.com, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 21 Feb 2025 17:09:18 +0800
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
Hi Eason

A few comments from me. May well overlap in some places with other feedback.

Jonathan

> diff --git a/drivers/iio/adc/nct7201.c b/drivers/iio/adc/nct7201.c
> new file mode 100644
> index 000000000000..c5d1540bcc00
> --- /dev/null
> +++ b/drivers/iio/adc/nct7201.c
> @@ -0,0 +1,487 @@

> +
> +#define NCT7201_VOLTAGE_CHANNEL(chan, addr)				\
> +	{								\
> +		.type = IIO_VOLTAGE,					\
> +		.indexed = 1,						\
> +		.channel = chan,					\
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> +		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
> +		.address = addr,					\
> +		.event_spec = nct7201_events,				\
> +		.num_event_specs = ARRAY_SIZE(nct7201_events),		\
> +	}
> +
> +static const struct iio_chan_spec nct7201_channels[] = {
> +	NCT7201_VOLTAGE_CHANNEL(1, 0),
> +	NCT7201_VOLTAGE_CHANNEL(2, 1),
> +	NCT7201_VOLTAGE_CHANNEL(3, 2),
> +	NCT7201_VOLTAGE_CHANNEL(4, 3),
> +	NCT7201_VOLTAGE_CHANNEL(5, 4),
> +	NCT7201_VOLTAGE_CHANNEL(6, 5),
> +	NCT7201_VOLTAGE_CHANNEL(7, 6),
> +	NCT7201_VOLTAGE_CHANNEL(8, 7),
> +};
> +
> +static const struct iio_chan_spec nct7202_channels[] = {
> +	NCT7201_VOLTAGE_CHANNEL(1, 0),
> +	NCT7201_VOLTAGE_CHANNEL(2, 1),
> +	NCT7201_VOLTAGE_CHANNEL(3, 2),
> +	NCT7201_VOLTAGE_CHANNEL(4, 3),
> +	NCT7201_VOLTAGE_CHANNEL(5, 4),
> +	NCT7201_VOLTAGE_CHANNEL(6, 5),
> +	NCT7201_VOLTAGE_CHANNEL(7, 6),
> +	NCT7201_VOLTAGE_CHANNEL(8, 7),
> +	NCT7201_VOLTAGE_CHANNEL(9, 8),
> +	NCT7201_VOLTAGE_CHANNEL(10, 9),
> +	NCT7201_VOLTAGE_CHANNEL(11, 10),
> +	NCT7201_VOLTAGE_CHANNEL(12, 11),
We normally number channels from 0 which would simplify this but I don't really
mind if you want to keep the offset of 1.  Maybe just have one macro
parameter though and do the +1 in the macro.
> +};

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
> +	} else {
> +		err = regmap_read(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
> +				  &value);
> +		if (err < 0)
> +			return err;
> +		volt = value;
No real point in assigning to volt here, 
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
> +	else
> +		regmap_write(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
> +			     FIELD_PREP(NCT7201_REG_VIN_MASK, val));
Check for error returns.
> +
> +	return 0;
> +}
> +
> +static int nct7201_read_event_config(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir)
> +{
> +	struct nct7201_chip_info *chip = iio_priv(indio_dev);
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	return !!(chip->vin_mask & BIT(chan->address));
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
> +	if (chip->num_vin_channels <= 8)
> +		regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1, chip->vin_mask);
> +	else
> +		regmap_bulk_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
> +				  &chip->vin_mask, sizeof(chip->vin_mask));

Check errors on these writes.

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

Check for errors on all accesses to the device.  It can get
fiddly in paths where you are already handling an error but
that's not the case here.

> +
> +	/*
> +	 * After about 25 msecs, the device should be ready and then
> +	 * the Power Up bit will be set to 1. If not, wait for it.

Wrap to 80 chars.

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
> +	chip->vin_mask = value;

Local variable doesn't seem to add any benefits so just assign vin_mask directly.

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

Where it doesn't lead to really long lines, align all parameters to just
after the opening bracket.


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


