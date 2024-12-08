Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC919E8860
	for <lists+openbmc@lfdr.de>; Sun,  8 Dec 2024 23:51:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y60Zq0xhkz3bPM
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2024 09:50:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733678574;
	cv=none; b=DHZtHQ9o110W7z2bQt6lOYJwjZjrVAuqj/RrMH/BfICqohFj8d1kB3Df7h8/wxryyloXlJPWajym2mIia56BEK3gssiHZ2mZpwc/odDg0t1XulBJi7F60tp/6sGj5ChCH0+pJiw8Zc2QNY+ysSi5b7QIEdb7Mm9lnbiwSvbuQOEYFG+XJaClf+ZqjesNnAu0+ROOi5jQDZdrQmrU7X26fL0vj50767le/jUZQGetm/U8nUCL44WFgNWSXTaxFNvyeFsYJxtLBOG5920uB38zqJfxI+iDq3LubAUGy353Ug0U/ciHVWKnJCgavjOOnIMJbeoF0m5j6cBpXDOFY1chWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733678574; c=relaxed/relaxed;
	bh=DTUinkQnkma5/In+hVqnBkphmqwoooFtx+S3Nyfgtc4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVKiQZOpiewI607zGThz8mDQU14nILjKOE0aohYnWlFsKE1kOQ/65oxTYz529kOMupTjBo5yW9FzQ5iBjzK9P1PoLcmcd5ZfdaYt0TMUbzOnkfU96IMwbMEP4g3vDHXVvQMTb8D2VJ7wxriCGM4v55l9tBdyNITG1B2du6bpRitV1GFTera1tdX1hn+i/sf+Ez4Vm70m+H2D0uwfzpVytwgt0zTs2OWM0VMIDO6fGyxY/imb7AXfjWbA1ypZmI7wj0fUOAHpH2eBHbXWrGXavIXiliqHGa76sPsvk+09Cb/xvrva+zcD23pLD3T1Qfz2TMmPdiFPeNRkEs6Qi4Bc9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jYt4e97a; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jYt4e97a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y5sJX21dWz2xKh
	for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2024 04:22:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C85E4A40C74;
	Sun,  8 Dec 2024 17:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8476C4CED2;
	Sun,  8 Dec 2024 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733678569;
	bh=CnFzzpu/t2T7ISYlDidZoBSSn6jeFN2Utrep7B+tRzo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jYt4e97aZhp8uhaJI0bJ4bqU//5L97mLWWacgXBbkWexcLA3XQoIfIFTakx9/XxsN
	 76e3M3KLDGhDV9MMwHpY/ACOI8kT7G6Hi8KiK5AZd1WTfq6MxDU7gPKvpVRXzH0V6W
	 B8t5xTEB/FELMvAcsXb96x1uiYsn74PnG0ytRAF1PlnqVmA4qMLSV76ddnaftflcu/
	 JFlDonzNdSXBdJymUMUzHXhZZNKE+OLcvyju2j3TJPWl+p3Lnl/DIe4bO88keCG+F1
	 SrLYS1BdKlsaCwFzfv9Y+hRZc5sxBePyFgVAgSXZRDrkyYsMk0nrAXAsWr8KHW4HBc
	 VpShZ6Gqq+iKw==
Date: Sun, 8 Dec 2024 17:22:36 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Eason Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Message-ID: <20241208172236.18441e64@jic23-huawei>
In-Reply-To: <20241203091540.3695650-3-j2anfernee@gmail.com>
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
	<20241203091540.3695650-3-j2anfernee@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 09 Dec 2024 09:50:29 +1100
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue,  3 Dec 2024 17:15:40 +0800
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

Given you have some good reviews already I only took a very quick glance
through.  A few things inline

Jonathan

> diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
> new file mode 100644
> index 000000000000..b28b5f4d7d70
> --- /dev/null
> +++ b/drivers/iio/adc/nct720x.c

> +
> +static int nct720x_write_event_value(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     enum iio_event_info info,
> +				     int val, int val2)
> +{
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +	int index, err = 0;
> +	long v1, v2, volt;
> +
> +	index = nct720x_chan_to_index[chan->address];
> +	volt = (val * NCT720X_IN_SCALING_FACTOR) / NCT720X_IN_SCALING;
> +	v1 = volt >> 5;
> +	v2 = (volt & REG_VIN_LIMIT_LSB_MASK) << 3;
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (info == IIO_EV_INFO_VALUE) {
> +		if (dir == IIO_EV_DIR_FALLING) {
> +			guard(mutex)(&chip->access_lock);

Might as well move this up one level as it is called in both legs.

> +			err = regmap_write(chip->regmap, REG_VIN_LOW_LIMIT[index], v1);
> +			if (err < 0)
> +				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_LOW_LIMIT\n",
> +					index + 1);
> +
> +			err = regmap_write(chip->regmap, REG_VIN_LOW_LIMIT_LSB[index], v2);
> +			if (err < 0)
> +				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_LOW_LIMIT_LSB\n",
> +					index + 1);
> +
> +		} else {
> +			guard(mutex)(&chip->access_lock);
> +			err = regmap_write(chip->regmap, REG_VIN_HIGH_LIMIT[index], v1);
> +			if (err < 0)
> +				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_HIGH_LIMIT\n",
> +					index + 1);
> +
> +			err = regmap_write(chip->regmap, REG_VIN_HIGH_LIMIT_LSB[index], v2);
> +			if (err < 0)
> +				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_HIGH_LIMIT_LSB\n",
> +					index + 1);
> +		}
> +	}
> +	return err;
> +}

> +
> +static const struct iio_info nct720x_info = {
> +	.read_raw = nct720x_read_raw,
> +	.read_event_config = nct720x_read_event_config,
> +	.write_event_config = nct720x_write_event_config,
> +	.read_event_value = nct720x_read_event_value,
> +	.write_event_value = nct720x_write_event_value,

Given you are supporting with and without interrupts, should probably pick between
versions of this that have the event config part and one that doesn't.

> +};
> +
> +static const struct nct720x_adc_model_data nct7201_model_data = {
> +	.model_name = "nct7201",
> +	.channels = nct7201_channels,
> +	.num_channels = ARRAY_SIZE(nct7201_channels),
> +	.vin_max = 8,
> +};
> +
> +static const struct nct720x_adc_model_data nct7202_model_data = {
> +	.model_name = "nct7202",
> +	.channels = nct7202_channels,
> +	.num_channels = ARRAY_SIZE(nct7202_channels),
> +	.vin_max = 12,
> +};
> +
> +static int nct720x_init_chip(struct nct720x_chip_info *chip)
> +{
> +	u8 data[2];
> +	unsigned int value;
> +	int err;
> +
> +	err = regmap_write(chip->regmap, REG_CONFIGURATION, BIT_CONFIGURATION_RESET);
> +	if (err) {
> +		dev_err(&chip->client->dev, "Failed to write REG_CONFIGURATION\n");
> +		return err;
> +	}
> +
> +	/*
> +	 * After about 25 msecs, the device should be ready and then
> +	 * the Power Up bit will be set to 1. If not, wait for it.
> +	 */
> +	mdelay(25);
> +	err  = regmap_read(chip->regmap, REG_BUSY_STATUS, &value);
> +	if (err < 0)
> +		return err;
> +	if (!(value & BIT_PWR_UP))
> +		return err;
> +
> +	/* Enable Channel */
> +	err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_1, REG_CHANNEL_ENABLE_1_MASK);
> +	if (err) {
> +		dev_err(&chip->client->dev, "Failed to write REG_CHANNEL_ENABLE_1\n");
> +		return err;
> +	}
> +
> +	if (chip->vin_max == 12) {
> +		err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_2, REG_CHANNEL_ENABLE_2_MASK);
> +		if (err) {
> +			dev_err(&chip->client->dev, "Failed to write REG_CHANNEL_ENABLE_2\n");
> +			return err;
> +		}
> +	}
> +
> +	guard(mutex)(&chip->access_lock);
> +	err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_1, &value);
> +	if (err < 0)
> +		return err;
> +	data[0] = (u8)value;
> +
> +	err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value);
> +	if (err < 0)
> +		return err;

Here I think you can use a bulk read as the registers are next to each other.

> +	data[1] = (u8)value;
> +
> +	value = get_unaligned_le16(data);
> +	chip->vin_mask = value;
> +
> +	/* Start monitoring if needed */
> +	err = regmap_read(chip->regmap, REG_CONFIGURATION, &value);
> +	if (err < 0) {
> +		dev_err(&chip->client->dev, "Failed to read REG_CONFIGURATION\n");
> +		return value;
> +	}
> +
> +	value |= BIT_CONFIGURATION_START;
> +	err = regmap_write(chip->regmap, REG_CONFIGURATION, value);
> +	if (err < 0) {
> +		dev_err(&chip->client->dev, "Failed to write REG_CONFIGURATION\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
