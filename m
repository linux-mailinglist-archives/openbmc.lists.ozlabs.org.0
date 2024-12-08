Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A7C9E8862
	for <lists+openbmc@lfdr.de>; Sun,  8 Dec 2024 23:51:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y60Zt4brYz3g0x
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2024 09:50:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.23
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733680119;
	cv=none; b=GfsMxA3kKpC1PrlCBxVmWP8nJ5svKWlRQP9c2dC8RHxJsd+KHgm+Xq0i0IvXTmDyNSbSd/e58avq2ye9ZdPnaxCywzJRBNkS/yyBzkbdYBQeFNXdN2XJgySNkQYJw2GtodbN0SSZEZhyO4uEzA/hm3ZPJ/h09IMJZfpyu2Xopbq4zTeUakpcRKK+SybP/YKcjP78H7zpQPN/ZWHKxzf7Ipy9McaV35AF8AKLm0YVcL/NB0Q8zpuLoeS0AUvBFgeHYw4p0/owrs3F529LQ+tvU03YvOOANQbg3fgHbhJAEKlGK/OPwvbjN26MhrondpOBNOdyRKEo3PMk/XaHtZvlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733680119; c=relaxed/relaxed;
	bh=ebd+Tp1v6fRh+FBN9RhAloqELrQTXUQiB8ZFG5D3eOE=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=A6p7LdhdE5K5BVo/0lgo8lbHLJD4tmtvzkN4jddqIlZqH0OXBKtGM2jwUruZnY1zDjOGfLeZTTiXWM19ZdYpYl4BMD7XxJ6Id1jfHQXmmhejRrJNgRAAMlEoRhNJOG3Q7EAlmaOWz2A54Z3gLXCw7FUtZntnaTh8j1Q3cOQdQqlGx1j0POiPAmXNV+YcBs8uztaCD8kBt08CPzgNaCi1DHTcOPLEh7nf33U2oZraEpy0s+aKsOSZl6QkKkFMVIVSif/XWQhb17w656NJiqxiFCHRB09fa/9IPETX/2aSjhpO5vnZgIk+I+aKj0Zme50/VCvOdUH0eza40sS4bR3vGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=CXmPmJFZ; dkim-atps=neutral; spf=pass (client-ip=80.12.242.23; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=CXmPmJFZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.23; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y5stD4mRjz2xLR
	for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2024 04:48:33 +1100 (AEDT)
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id KLNJtQRwaKnkaKLNJtVg1U; Sun, 08 Dec 2024 18:47:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733680046;
	bh=ebd+Tp1v6fRh+FBN9RhAloqELrQTXUQiB8ZFG5D3eOE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=CXmPmJFZ+FytpmTgOBNgPLzgSVXjOj3xjc3FbZ5tlOD4rw5CBapYfqgEStegp1/F1
	 qiyOCIjK9wWKq8sHSQbBhB8cnZsf3m2KWgGYevrHkRlRjRE73aPn1zM2VzRGUe7BAn
	 ZYZNxGsCXiWCQveLxxT2wljtqCfdWwhgLtpCPs61EYH8J2Dsd9DOIMnd4/wKOJmXbF
	 ynT4Df22slbFxH3XOKxPInqqmRomQeUof9UQQFrTyh4luowyBN10Xub2/Vymhr1m0E
	 Qotob23zGdNh5K4mGn5N1yL04Q0VWYhHe1/qQ0/KhFu+UC6PDFRUU0LyBtoGVlL28/
	 YuwVzR5XKYNgg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 08 Dec 2024 18:47:26 +0100
X-ME-IP: 90.11.132.44
Message-ID: <b5b43427-d0d7-43d5-bf8a-02a966ac25d3@wanadoo.fr>
Date: Sun, 8 Dec 2024 18:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Eason Yang <j2anfernee@gmail.com>
In-Reply-To: <20241203091540.3695650-3-j2anfernee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, Eason Yang <j2anfernee@gmail.com>, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Le 03/12/2024 à 10:15, Eason Yang a écrit :
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
> Signed-off-by: Eason Yang <j2anfernee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

...

> +static const u8 REG_VIN_HIGH_LIMIT_LSB[VIN_MAX] = {
> +	0x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E,
> +	0x50, 0x52, 0x54, 0x56,
> +};
> +static const u8 REG_VIN_LOW_LIMIT_LSB[VIN_MAX] = {
> +	0x41, 0x43, 0x45, 0x47, 0x49, 0x4B, 0x4D, 0x4F,
> +	0x51, 0x53, 0x55, 0x57,
> +};
> +static u8 nct720x_chan_to_index[] = {

const as well here?

> +	0 /* Not used */, 0, 1, 2, 3, 4, 5, 6,
> +	7, 8, 9, 10, 11,
> +};

...

> +static int nct720x_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	int index = nct720x_chan_to_index[chan->address];
> +	u16 volt;
> +	unsigned int value;
> +	int err;
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	guard(mutex)(&chip->access_lock);

The IIO_CHAN_INFO_SCALE case does not seem to need the lock. Would it 
make sense to move it only in the IIO_CHAN_INFO_RAW case?

> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		err = regmap_read(chip->regmap16, REG_VIN[index], &value);
> +		if (err < 0)
> +			return err;
> +		volt = (u16)value;
> +		*val = volt >> 3;
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

...

> +static int nct720x_write_event_config(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan,
> +				      enum iio_event_type type,
> +				      enum iio_event_direction dir,
> +				      bool state)
> +{
> +	int err = 0;

Harmless but useless initialisation.

> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +	int index = nct720x_chan_to_index[chan->address];
> +	unsigned int mask;
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;

...

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

double space after err.

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

double space after err.

> +	if (err < 0)
> +		return err;
> +	data[0] = (u8)value;
> +
> +	err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value);

double space after err.

> +	if (err < 0)
> +		return err;
> +	data[1] = (u8)value;
> +
> +	value = get_unaligned_le16(data);
> +	chip->vin_mask = value;
> +
> +	/* Start monitoring if needed */

...

CJ
