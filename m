Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3059C34F7
	for <lists+openbmc@lfdr.de>; Sun, 10 Nov 2024 23:04:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xmmsj1Nd3z3cjt
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 09:03:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731163052;
	cv=none; b=a/yLd3YSGScKlJtskg25EMShVAFCBN9Zua7B/W3JZVNnukbwgsmJFKvNxLDZUFwg2SsILYWetAsWheky05wrreJv0OtBEI7xjIpHyDgnHG4qdoVGBlXIIvZV0lq5oICJc0kp9u+GEt4NOorCF6my1OudzUeVwa7yG1wCmzNtzgal9vZa8RN6ZHv1zpYSz3aVMoVN+6CgH0DZlV/RGvoopXJL9vcYBTCVoggV0nJpNFkIQ+uLlsmRLJA0NfOtDQDdMaY7YcsgTCvKTI6SX792Ab2S1+CHiu0mFOOeIWcdIdsRowFfvnv2Ex6+lcF6MPPtiWHkP0Yg1qIXLyFSo/UT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731163052; c=relaxed/relaxed;
	bh=oDerJ9P58hhajZxa8ndzbqHixDBIBwwMK0MthLKwJ+g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2lbFyjCTmgBNTZFveXnqj0X8YEfiMjYpK6GHLBVExCP3zJWdGXrJpKisjNwHrBG7fBV70cMBKVmTjnQm+19yYPTGoFQeSV3wj37scWd0a1hqIKwVOttE3+hmISXKMzdjZDvCR17S0ykc/4EyTpci240Wm1nnQ4qAVmOVoLtpGOawT0vmql7r28+HfJxb3TmxCRvDmtJO++erBsEeiza/Z2hYZBmk+8L/gwof99KmQLwBG6QhCcNcOi1urKqpo0k2CpL4Bsb/N7D+kZyM5xE9WywYz8UQIFLJ2UYxEmK3F4SQ3fODoCz+14BII5Qus/aV+TMlS0llHotEG6HHrA1Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oZJB+rxb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oZJB+rxb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xlz171Vrbz2xQK
	for <openbmc@lists.ozlabs.org>; Sun, 10 Nov 2024 01:37:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D641BA40134;
	Sat,  9 Nov 2024 14:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BD2C4CECE;
	Sat,  9 Nov 2024 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731163047;
	bh=fp3dUZNu5k8TsBe0ONSPMYGbnxHP+1IYGa0+jNP4xik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oZJB+rxbxlgqVQPNQ9ZcAcRtgp5DAEI9jmqK2d4zwRj15avRRMEyfJ55MgFUIEv+7
	 1EB7KXqd2+3QOtdlMJfT/seF4+3s6JBO4ZLlD13ZX1mBsknUbg6iy77Rt54qZYUMZy
	 KfYG0HvzEmD7twXU/beE9JzE0p9mGvNwl43DmXkla0p3qdSe9nvtXqqR98kLXF96Lv
	 vpeaoCo9kU6mwip2PKMM5AppEEvL9XF94cfCa4NfXHJUvQZQ7DFzEqJebcPm9Woe8D
	 CqZ4u10GHJTJZrjukrV9aIEbMWdaZNVWW+ta76W0J61vJ5alx0z8hiUqYorq260hNS
	 rfTFO59GW/gig==
Date: Sat, 9 Nov 2024 14:37:14 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Eason Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Message-ID: <20241109143714.70f68cd8@jic23-huawei>
In-Reply-To: <20241106023916.440767-3-j2anfernee@gmail.com>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
	<20241106023916.440767-3-j2anfernee@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 11 Nov 2024 09:03:25 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed,  6 Nov 2024 10:39:16 +0800
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
You've gotten some good review already so I may well repeat stuff plus
will only take a fairly superficial look at this version.


> diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
> new file mode 100644
> index 000000000000..e589479fd06e
> --- /dev/null
> +++ b/drivers/iio/adc/nct720x.c

> +
> +/* List of supported devices */
> +enum nct720x_chips {
> +	nct7201, nct7202
This should be replaced by chip specific information structures.
That ends up a lot more extensible than using an enum and fixing up
what happens in all code paths on a per enum value basis.

> +};
> +
> +struct nct720x_chip_info {
> +	struct i2c_client	*client;
> +	enum nct720x_chips	type;
> +	struct mutex		access_lock;	/* for multi-byte read and write operations */
> +	int vin_max;				/* number of VIN channels */
> +	u32 vin_mask;
> +	bool use_read_byte_vin;
> +};

> +#define NCT720X_VOLTAGE_CHANNEL(chan, addr)				\
> +	{								\
> +		.type = IIO_VOLTAGE,					\
> +		.indexed = 1,						\
> +		.channel = chan,					\
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),	\
> +		.address = addr,					\
> +		.event_spec = nct720x_events,				\
> +		.num_event_specs = ARRAY_SIZE(nct720x_events),		\
> +	}
> +
> +#define NCT720X_VOLTAGE_CHANNEL_DIFF(chan1, chan2, addr)		\
> +	{								\
> +		.type = IIO_VOLTAGE,					\
> +		.indexed = 1,						\
> +		.channel = (chan1),					\
> +		.channel2 = (chan2),					\
> +		.differential = 1,					\
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED),	\
See below - should be _RAW and _SCALE not _PROCESSED.
> +		.address = addr,					\
> +		.event_spec = nct720x_events,				\
> +		.num_event_specs = ARRAY_SIZE(nct720x_events),		\
> +	}
> +
> +static const struct iio_chan_spec nct720x_channels[] = {
> +	NCT720X_VOLTAGE_CHANNEL(1, 1),
> +	NCT720X_VOLTAGE_CHANNEL(2, 2),
> +	NCT720X_VOLTAGE_CHANNEL(3, 3),
> +	NCT720X_VOLTAGE_CHANNEL(4, 4),
> +	NCT720X_VOLTAGE_CHANNEL(5, 5),
> +	NCT720X_VOLTAGE_CHANNEL(6, 6),
> +	NCT720X_VOLTAGE_CHANNEL(7, 7),
> +	NCT720X_VOLTAGE_CHANNEL(8, 8),
> +	NCT720X_VOLTAGE_CHANNEL(9, 9),
> +	NCT720X_VOLTAGE_CHANNEL(10, 10),
> +	NCT720X_VOLTAGE_CHANNEL(11, 11),
> +	NCT720X_VOLTAGE_CHANNEL(12, 12),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(9, 10, 9),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(11, 12, 11),
> +};
> +
> +/* Read 1-byte register. Returns unsigned byte data or -ERRNO on error. */
> +static int nct720x_read_reg(struct nct720x_chip_info *chip, u8 reg)
> +{
> +	struct i2c_client *client = chip->client;
> +
> +	return i2c_smbus_read_byte_data(client, reg);
> +}
> +
> +/* Read 1-byte register. Returns unsigned word data or -ERRNO on error. */
> +static int nct720x_read_word_swapped_reg(struct nct720x_chip_info *chip, u8 reg)
> +{
> +	struct i2c_client *client = chip->client;
> +
> +	return i2c_smbus_read_word_swapped(client, reg);

Don't provide these wrappers as they don't add anything useful.
Make the calls directly inline.

> +}
> +
> +/*
> + * Read 2-byte register. Returns register in big-endian format or
> + * -ERRNO on error.
> + */
> +static int nct720x_read_reg16(struct nct720x_chip_info *chip, u8 reg)
> +{
> +	struct i2c_client *client = chip->client;
> +	int ret, low;
> +
> +	mutex_lock(&chip->access_lock);
guard() 

> +	ret = i2c_smbus_read_byte_data(client, reg);
> +	if (ret >= 0) {
> +		low = ret;
> +		ret = i2c_smbus_read_byte_data(client, reg + 1);
> +		if (ret >= 0)
> +			ret = low | (ret << 8);
		if (ret < 0)
			return ret;

			reg = get_unaligned_le16()
on an appropriate u8 data[2]; ideally filled by a bulk regmap read.


> +	}
> +
> +	mutex_unlock(&chip->access_lock);
> +	return ret;
> +}
> +
> +/* Write 1-byte register. Returns 0 or -ERRNO on error. */
> +static int nct720x_write_reg(struct nct720x_chip_info *chip, u8 reg, u8 val)
> +{
> +	struct i2c_client *client = chip->client;
> +	int err;
> +
> +	err = i2c_smbus_write_byte_data(client, reg, val);
> +	/* wait for write command to be finished */
If this is needed, provide a datasheet reference. It is very ususual to
see a significant delay needed. 
> +	mdelay(10);
> +
> +	return err;
> +}
> +
> +static int nct720x_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	int index = nct720x_chan_to_index[chan->address];
> +	int v1, v2, volt, err;
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_PROCESSED:
> +		mutex_lock(&chip->access_lock);
> +		if (chip->use_read_byte_vin) {

Ah.  So resolution doesn't change, you are controlling the i2c acceses?

That should come from the i2c controller capabilities, not DT for this
device.



> +			/*
> +			 * MNTVIN Low Byte together with MNTVIN High Byte
> +			 * forms the 13-bit count value. If MNTVIN High
> +			 * Byte readout is read successively, the
> +			 * NCT7201/NCT7202 will latch the MNTVIN Low Byte
> +			 * for next read.
> +			 */
> +			v1 = nct720x_read_reg(chip, REG_VIN[index]);
> +			if (v1 < 0) {
> +				err = v1;
> +				goto abort;
> +			}
> +
> +			v2 = nct720x_read_reg(chip, REG_VOLT_LOW_BYTE);
> +			if (v2 < 0) {
> +				err = v2;
> +				goto abort;
> +			}
> +			volt = (v1 << 8) | v2;	/* Convert back to 16-bit value */
> +		} else {
> +			/* NCT7201/NCT7202 also supports read word-size data */
> +			volt = nct720x_read_word_swapped_reg(chip, REG_VIN[index]);
> +		}
> +
> +		/* Voltage(V) = 13bitCountValue * 0.0004995 */
Present this as _RAW and provide _SCALE to userspace to be able to do this
maths.  Very unusual for an ADC driver to provided processed channels. Normally
only occurs it there is something non linear going on.


> +		volt = (volt >> 3) * NCT720X_IN_SCALING;
> +		*val = volt / 10000;
> +		mutex_unlock(&chip->access_lock);
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}
> +abort:
> +	mutex_unlock(&chip->access_lock);
> +	return err;
> +}
> +
> +static int nct720x_read_event_value(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir,
> +				    enum iio_event_info info,
> +				    int *val, int *val2)
> +{
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +	int v1, v2, err;
> +	int volt = 0;
> +	int index = nct720x_chan_to_index[chan->address];
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (info == IIO_EV_INFO_VALUE) {
As below - flip logic.

> +		if (dir == IIO_EV_DIR_FALLING) {
> +			if (chip->use_read_byte_vin) {
> +				/*
> +				 * Low limit VIN Low Byte together with Low limit VIN High Byte
> +				   forms the 13-bit count value
> +				 */
> +				mutex_lock(&chip->access_lock);
> +				v1 = nct720x_read_reg(chip, REG_VIN_LOW_LIMIT[index]);
> +				if (v1 < 0) {
> +					err = v1;
> +					goto abort;
> +				}
> +
> +				v2 = nct720x_read_reg(chip, REG_VIN_LOW_LIMIT_LSB[index]);
> +				if (v2 < 0) {
> +					err = v2;
> +					goto abort;
> +				}
> +				mutex_unlock(&chip->access_lock);
> +				volt = (v1 << 8) | v2;	/* Convert back to 16-bit value */

rather see this as a get_unaligned_le16 on an array of u8.
In some cases that ends up quite a bit cheaper and it also documents what is going on.

> +			} else {
> +				/* NCT7201/NCT7202 also supports read word-size data */
> +				volt = nct720x_read_word_swapped_reg(chip,
> +					REG_VIN_LOW_LIMIT[index]);
> +			}
> +		} else {
> +			if (chip->use_read_byte_vin) {
> +				/*
> +				 * High limit VIN Low Byte together with high limit VIN High Byte
> +				 * forms the 13-bit count value
> +				 */
> +				mutex_lock(&chip->access_lock);
> +				v1 = nct720x_read_reg(chip, REG_VIN_HIGH_LIMIT[index]);
> +				if (v1 < 0) {
> +					err = v1;
> +					goto abort;
> +				}
> +
> +				v2 = nct720x_read_reg(chip, REG_VIN_HIGH_LIMIT_LSB[index]);
> +				if (v2 < 0) {
> +					err = v2;
> +					goto abort;
> +				}
> +				mutex_unlock(&chip->access_lock);
> +				volt = (v1 << 8) | v2;	/* Convert back to 16-bit value */
> +			} else {
> +				/* NCT7201/NCT7202 also supports read word-size data */
> +				volt = nct720x_read_word_swapped_reg(chip,
> +					REG_VIN_HIGH_LIMIT[index]);
> +			}
> +		}
> +	}
> +	/* Voltage(V) = 13bitCountValue * 0.0004995 */
> +	volt = (volt >> 3) * NCT720X_IN_SCALING;
> +	*val = volt / 10000;
> +
> +	return IIO_VAL_INT;
> +abort:
> +	mutex_unlock(&chip->access_lock);
guard() in appropriate places.
Again, the lock and unlock should ideally be in same scope.

> +	return err;
> +}
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
> +	volt = (val * 10000) / NCT720X_IN_SCALING;
> +	v1 = volt >> 5;
> +	v2 = (volt & 0x1f) << 3;
Some explanatory comments for this would be good.

> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (info == IIO_EV_INFO_VALUE) {
Flip logic.
	if (info != IIO_EV_INFO_VALUE)
		return -EINVAL;

	if (dir == IIO_EVE_DIR_FALLING) etc

> +		if (dir == IIO_EV_DIR_FALLING) {
> +			mutex_lock(&chip->access_lock);
This is badly nested.  Mutex lock and unlock should be in same scope.
So I'd pull mutex_lock() out of this if stack and use guard(mutex) instead.
That way you can just return on error.

> +			err = nct720x_write_reg(chip, REG_VIN_LOW_LIMIT[index], v1);
> +			if (err < 0) {
> +				pr_err("Failed to write REG_VIN%d_LOW_LIMIT\n", index + 1);
> +				goto abort;
> +			}
> +
> +			err = nct720x_write_reg(chip, REG_VIN_LOW_LIMIT_LSB[index], v2);
> +			if (err < 0) {
> +				pr_err("Failed to write REG_VIN%d_LOW_LIMIT_LSB\n", index + 1);
> +				goto abort;
> +			}
> +		} else {
> +			mutex_lock(&chip->access_lock);
> +			err = nct720x_write_reg(chip, REG_VIN_HIGH_LIMIT[index], v1);
> +			if (err < 0) {
> +				pr_err("Failed to write REG_VIN%d_HIGH_LIMIT\n", index + 1);
> +				goto abort;
> +			}
> +
> +			err = nct720x_write_reg(chip, REG_VIN_HIGH_LIMIT_LSB[index], v2);
> +			if (err < 0) {
> +				pr_err("Failed to write REG_VIN%d_HIGH_LIMIT_LSB\n", index + 1);
> +				goto abort;
> +			}
> +		}
> +	}
> +abort:
> +	mutex_unlock(&chip->access_lock);
> +	return err;
> +}

> +
> +static int nct720x_write_event_config(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan,
> +				      enum iio_event_type type,
> +				      enum iio_event_direction dir,
> +				      int state)
> +{
> +	int err = 0;
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +	int index = nct720x_chan_to_index[chan->address];
> +	unsigned int mask;
> +
> +	mask = BIT(index);
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (!state && (chip->vin_mask & mask))
> +		chip->vin_mask &= ~mask;
> +	else if (state && !(chip->vin_mask & mask))
> +		chip->vin_mask |= mask;
> +
> +	mutex_lock(&chip->access_lock);
guard(mutex)(&chip->access_lock);

> +
> +	err = nct720x_write_reg(chip, REG_CHANNEL_ENABLE_1, chip->vin_mask & 0xff);
> +	if (err < 0) {
> +		pr_err("Failed to write REG_CHANNEL_ENABLE_1\n");
> +		goto abort;
		dev_err()
		return err;

> +	}
> +
> +	if (chip->type == nct7202) {

Gain, base this on a chip_info flag.

> +		err = nct720x_write_reg(chip, REG_CHANNEL_ENABLE_2, chip->vin_mask >> 8);
> +		if (err < 0) {
> +			pr_err("Failed to write REG_CHANNEL_ENABLE_2\n");
> +			goto abort;
Same as above.
> +		}
> +	}
> +abort:
> +	mutex_unlock(&chip->access_lock);
> +	return err;
> +}
> +
> +static int nct720x_detect(struct i2c_client *client,
> +			  struct i2c_board_info *info)
> +{
> +	struct i2c_adapter *adapter = client->adapter;
> +
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA))
> +		return -ENODEV;
> +
> +	/* Determine the chip type. */
> +	if (i2c_smbus_read_byte_data(client, REG_VENDOR_ID) != NUVOTON_ID ||
> +	    i2c_smbus_read_byte_data(client, REG_CHIP_ID) != NCT720X_ID ||
> +	    i2c_smbus_read_byte_data(client, REG_DEVICE_ID) != NCT720X_DEVICE_ID)
> +		return -ENODEV;
> +
> +	strscpy(info->type, "nct720x", I2C_NAME_SIZE);
as below. It's unusual to find a detect in an IIO driver because the firmware
normally tells us what is there.
> +
> +	return 0;
> +}
> +
> +static const struct iio_info nct720x_info = {
> +	.read_raw = &nct720x_read_raw,
> +	.read_event_config = &nct720x_read_event_config,
> +	.write_event_config = &nct720x_write_event_config,
> +	.read_event_value = &nct720x_read_event_value,
> +	.write_event_value = &nct720x_write_event_value,
> +};
> +
> +static const struct i2c_device_id nct720x_id[];
> +
> +static int nct720x_init_chip(struct nct720x_chip_info *chip)
> +{
> +	int value = 0;
> +	int err = 0;
> +
> +	/* Initial reset */
Maybe ignore datasheet naming and call that CONFIGURATION_INIT CONFIGURATION_RESET
at which point he comment is unneeded.

> +	err = nct720x_write_reg(chip, REG_CONFIGURATION, CONFIGURATION_INIT);
> +	if (err) {
> +		pr_err("Failed to write REG_CONFIGURATION\n");
> +		return err;
> +	}
> +
> +	/* Enable Channel */
> +	err = nct720x_write_reg(chip, REG_CHANNEL_ENABLE_1, 0xff);
What does 0xFF represent?  I guess all channels.  If so maybe need
to build with GENMASK so it is obvious this is enabling 8 channels.

> +	if (err) {
> +		pr_err("Failed to write REG_CHANNEL_ENABLE_1\n");
> +		return err;
> +	}
> +
> +	if (chip->type == nct7202) {

Make this 'data' in the chip_info structure.  Probably a flat to say
there is a REG_CHANNEL_ENABLE_2.  That chip->type wants to go away infavour
of chip->chip_info.X flags.


> +		err = nct720x_write_reg(chip, REG_CHANNEL_ENABLE_2, 0xf);
> +		if (err) {
> +			pr_err("Failed to write REG_CHANNEL_ENABLE_2\n");
> +			return err;
> +		}
> +	}
> +
> +	value = nct720x_read_reg16(chip, REG_CHANNEL_ENABLE_1);
> +	if (value < 0)
> +		return value;
> +	chip->vin_mask = value;
> +
> +	/* Start monitoring if needed */
> +	value = nct720x_read_reg(chip, REG_CONFIGURATION);

Using regmap would let you simple do a single bit write in one call
Definitely look at whether there is anything stopping  you using that
helpful infrastructure.

> +	if (value < 0) {
> +		pr_err("Failed to read REG_CONFIGURATION\n");
> +		return value;
> +	}
> +
> +	value |= CONFIGURATION_START;
> +	err = nct720x_write_reg(chip, REG_CONFIGURATION, value);
> +	if (err < 0) {
> +		pr_err("Failed to write REG_CONFIGURATION\n");

dev_err() if not called only from probe, return dev_err_probe() if only called
from probe()


> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nct720x_probe(struct i2c_client *client)
> +{
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +	struct nct720x_chip_info *chip;
> +	struct iio_dev *indio_dev;
> +	int ret;
> +	u32 tmp;
> +
> +	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +	chip = iio_priv(indio_dev);
> +
> +	if (client->dev.of_node)
> +		chip->type = (enum nct720x_chips)device_get_match_data(&client->dev);
> +	else
> +		chip->type = i2c_match_id(nct720x_id, client)->driver_data;

i2c_get_match_data() but careful with zeros... It is much better to use that with
an actual pointer.


> +
> +	chip->vin_max = (chip->type == nct7201) ? NCT7201_VIN_MAX : NCT7202_VIN_MAX;
> +
> +	ret = of_property_read_u32(client->dev.of_node, "read-vin-data-size", &tmp);
As in dt binding. If we keep this (I'm doubtful that it makes sense) define a default
so that the property doesn't need to be provided.  16 would be the most obvious choice.
Then just don't check the error value when reading the property. That is.
	
	tmp = 16;
	of_property_read_u32();


	
> +	if (ret < 0) {
> +		pr_err("read-vin-data-size property not found\n");
> +		return ret;
> +	}
> +
> +	if (tmp == 8) {
> +		chip->use_read_byte_vin = true;
> +	} else if (tmp == 16) {
> +		chip->use_read_byte_vin = false;
> +	} else {
> +		pr_err("invalid read-vin-data-size (%d)\n", tmp);
> +		return -EINVAL;
> +	}
> +
> +	mutex_init(&chip->access_lock);
For new code prefer
	ret = devm_mutex_init()
	if (ret)
		return ret;

It only helps in weird debug cases but also costs us very little to support those.
> +
> +	/* this is only used for device removal purposes */
> +	i2c_set_clientdata(client, indio_dev);
Won't be needed after the change below.

> +
> +	chip->client = client;
> +
> +	ret = nct720x_init_chip(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	indio_dev->name = id->name;
Put the name in the chip_info structure.  id->name is a complex thing
when other firmwares come into play, so better to just hard code the strings
somewhere so we always know what we are getting.

> +	indio_dev->channels = nct720x_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(nct720x_channels);
> +	indio_dev->info = &nct720x_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	iio_device_register(indio_dev);
	return devm_iio_device_register();

Then you can drop the remove callback.

> +
> +	return 0;
> +}
> +
> +static void nct720x_remove(struct i2c_client *client)

Don't use wildcards even within the driver. Just name everything
after one supported part.
nct7202_remove() etc.


> +{
> +	struct iio_dev *indio_dev = i2c_get_clientdata(client);
> +
> +	iio_device_unregister(indio_dev);
> +}
> +
> +static const unsigned short nct720x_address_list[] = {
> +	0x1d, 0x1e, 0x35, 0x36, I2C_CLIENT_END
> +};
> +
> +static const struct i2c_device_id nct720x_id[] = {
> +	{ "nct7201", nct7201 },
> +	{ "nct7202", nct7202 },
> +	{}
	{ }

I'm trying to slowly standardise on this formatting in IIO
so keen not to introduce more cases.  It's an arbitrary choice
but I went with the space.

> +};
> +MODULE_DEVICE_TABLE(i2c, nct720x_id);
> +
> +static const struct of_device_id nct720x_of_match[] = {
> +	{
> +		.compatible = "nuvoton,nct7201",
> +		.data = (void *)nct7201
> +	},
> +	{
> +		.compatible = "nuvoton,nct7202",
> +		.data = (void *)nct7202
Use a pointer to a chip_info structure with all the chip specific
stuff encoded as data.  That is both more extensible and removes some
ambiguities around whether zero is an error or not.

> +	},
> +	{ },
No trailing comma
> +};
> +
> +MODULE_DEVICE_TABLE(of, nct720x_of_match);
> +
> +static struct i2c_driver nct720x_driver = {
> +	.driver = {
> +		.name	= "nct720x",
> +		.of_match_table = nct720x_of_match,
> +	},
> +	.probe = nct720x_probe,
> +	.remove = nct720x_remove,
> +	.id_table = nct720x_id,
> +	.detect = nct720x_detect,

Do you need detect?  That's kind of ancient infrastructure that I thought
no one used any more (same for the address list).

> +	.address_list = nct720x_address_list,
> +};
> +
> +module_i2c_driver(nct720x_driver);
> +
> +MODULE_AUTHOR("Eason Yang <YHYANG2@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton NCT720x voltage monitor driver");
> +MODULE_LICENSE("GPL");

