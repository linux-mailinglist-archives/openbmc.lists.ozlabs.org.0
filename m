Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 756DB55A2A7
	for <lists+openbmc@lfdr.de>; Fri, 24 Jun 2022 22:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV81z2jGzz3cf4
	for <lists+openbmc@lfdr.de>; Sat, 25 Jun 2022 06:32:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=meW68OQi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=meW68OQi;
	dkim-atps=neutral
X-Greylist: delayed 323 seconds by postgrey-1.36 at boromir; Sat, 25 Jun 2022 06:32:17 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV81Y47q4z3bsv
	for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2022 06:32:17 +1000 (AEST)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 01C71C2F7B
	for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2022 20:26:54 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6261860004;
	Fri, 24 Jun 2022 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656102398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GBb2EXpk3hJ77jpCHz/NkSTXgF4axgMg1lwQRbq/yzw=;
	b=meW68OQi1LjOHU5XcO8PuF+Bb7GugQmtHccXlBTuKM+vd3I+VIy4ZbzOGjHsPVHtwEiEsy
	hVJMha+8DC4rUTPoHzw1gZS7p1pUF7k1HHShd6b60zs1j28ceSpinysBNXvrL766t17/L3
	6Q1dS+0ABi8mStjRD9YBUlHrY+SmVahUAZVs0kpC6n6dsM8i6/XBW3zsk9f6JXv1Y7Tzoq
	/m/7FQAtiHvubREM447YoIs4md+prkaLI6tPzJRBMNAgThiyyKrKevcYmvri5RhhbReF9z
	j7mypu7kIwBiF+SVQoCcu0j5D03FT8monBT0Nu0zQAdQGbA1lSidhSNeHBtbpw==
Date: Fri, 24 Jun 2022 22:26:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: medadyoung@gmail.com
Subject: Re: [PATCH v3 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
Message-ID: <YrYd+FkiFPz84twJ@mail.local>
References: <20220527084647.30835-1-ctcchien@nuvoton.com>
 <20220527084647.30835-4-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220527084647.30835-4-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, YSCHU@nuvoton.com, tmaimon77@gmail.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, KFTING@nuvoton.com, JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Please run ./scripts/checkpatch.pl --strict on your patch, there are a
bunch of issues.

On 27/05/2022 16:46:47+0800, medadyoung@gmail.com wrote:
> +static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
> +{
> +	int err, flags;
> +
> +	dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
> +
> +	flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
> +	if (flags < 0) {
> +		dev_err(&client->dev,
> +			"Failed to read NCT3018Y_REG_CTRL\n");

You should cut down on the number of error messages, they are usually
not useful as the user doesn't have any specific action after getting
one of them apart from trying the action once again. Also, this will
make your code shorter. dev_dbg is fine.

> +/*
> + * In the routines that deal directly with the nct3018y hardware, we use
> + * rtc_time -- month 0-11, hour 0-23, yr = calendar year-epoch.
> + */
> +static int nct3018y_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned char buf[10];
> +	int err;
> +

You should still return an error if the time is invalid there but without
an error message.

> +	err = i2c_smbus_read_i2c_block_data(client, NCT3018Y_REG_SC, sizeof(buf), buf);
> +	if (err < 0)
> +		return err;
> +
> +	tm->tm_sec = bcd2bin(buf[0] & 0x7F);
> +	tm->tm_min = bcd2bin(buf[2] & 0x7F);
> +	tm->tm_hour = bcd2bin(buf[4] & 0x3F);
> +	tm->tm_wday = buf[6] & 0x07;
> +	tm->tm_mday = bcd2bin(buf[7] & 0x3F);
> +	tm->tm_mon = bcd2bin(buf[8] & 0x1F) - 1;
> +	tm->tm_year = bcd2bin(buf[9]) + 100;
> +
> +	return 0;
> +}
> +
> +static int nct3018y_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned char buf[5];
> +	int err;
> +
> +	err = i2c_smbus_read_i2c_block_data(client, NCT3018Y_REG_SCA,
> +					    sizeof(buf), buf);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to read date\n");
> +		return -EIO;
> +	}
> +
> +	dev_dbg(&client->dev, "%s: raw data is sec=%02x, min=%02x hr=%02x\n",
> +		__func__, buf[0], buf[2], buf[4]);
> +
> +	tm->time.tm_sec = bcd2bin(buf[0] & 0x7F);
> +	tm->time.tm_min = bcd2bin(buf[2] & 0x7F);
> +	tm->time.tm_hour = bcd2bin(buf[4] & 0x3F);
> +
> +	err = nct3018y_get_alarm_mode(client, &tm->enabled, &tm->pending);
> +	if (err < 0)
> +		return err;
> +
> +	dev_dbg(&client->dev, "%s:s=%d m=%d, hr=%d, enabled=%d, pending=%d\n",
> +		__func__, tm->time.tm_sec, tm->time.tm_min,
> +		tm->time.tm_hour, tm->enabled, tm->pending);
> +
> +	return 0;
> +}
> +
> +static int nct3018y_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	unsigned char buf[3];
> +	int err;
> +
> +	dev_dbg(dev, "%s, sec=%d, min=%d hour=%d tm->enabled:%d\n",
> +		__func__, tm->time.tm_sec, tm->time.tm_min, tm->time.tm_hour,
> +		tm->enabled);
> +
> +	buf[0] = bin2bcd(tm->time.tm_sec);
> +	buf[1] = bin2bcd(tm->time.tm_min);
> +	buf[2] = bin2bcd(tm->time.tm_hour);

I don't think buf is useful in this function
> +
> +	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_SCA, buf[0]);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write NCT3018Y_REG_SCA\n");
> +		return err;
> +	}
> +
> +	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_MNA, buf[1]);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write NCT3018Y_REG_MNA\n");
> +		return err;
> +	}
> +
> +	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_HRA, buf[2]);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write NCT3018Y_REG_HRA\n");
> +		return err;
> +	}
> +
> +	return nct3018y_set_alarm_mode(client, tm->enabled);
> +}
> +


> +static struct clk *nct3018y_clkout_register_clk(struct nct3018y *nct3018y)
> +{
> +	struct i2c_client *client = nct3018y->client;
> +	struct device_node *node = client->dev.of_node;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +	int flags, err;
> +
> +	/* disable the clkout output */
> +	flags = 0;
> +	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CLKO, flags);

BTW, this introduces a glitch in the clock output if the clock is
actually used. Maybe you could just rely on the CCF core to disable this
clock when there are no users.

> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write oscillator status register\n");
> +		return ERR_PTR(err);
> +	}
> +
> +	init.name = "nct3018y-clkout";
> +	init.ops = &nct3018y_clkout_ops;
> +	init.flags = 0;
> +	init.parent_names = NULL;
> +	init.num_parents = 0;
> +	nct3018y->clkout_hw.init = &init;
> +
> +	/* optional override of the clockname */
> +	of_property_read_string(node, "clock-output-names", &init.name);
> +
> +	/* register the clock */
> +	clk = devm_clk_register(&client->dev, &nct3018y->clkout_hw);
> +
> +	if (!IS_ERR(clk))
> +		of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +
> +	return clk;
> +}
> +#endif
> +
> +static const struct rtc_class_ops nct3018y_rtc_ops = {
> +	.read_time	= nct3018y_rtc_read_time,
> +	.set_time	= nct3018y_rtc_set_time,
> +	.read_alarm	= nct3018y_rtc_read_alarm,
> +	.set_alarm	= nct3018y_rtc_set_alarm,
> +	.alarm_irq_enable = nct3018y_irq_enable,
> +	.ioctl		= nct3018y_ioctl,
> +};
> +
> +static int nct3018y_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	struct nct3018y *nct3018y;
> +	int err, flags;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {

Don't you rather need I2C_FUNC_SMBUS_BYTE and I2C_FUNC_SMBUS_BLOCK_DATA?

> +		dev_err(&client->dev, "%s: ENODEV\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	nct3018y = devm_kzalloc(&client->dev, sizeof(struct nct3018y),
> +				GFP_KERNEL);
> +	if (!nct3018y)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, nct3018y);
> +	nct3018y->client = client;
> +	device_set_wakeup_capable(&client->dev, 1);
> +
> +	flags = i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
> +	if (flags < 0) {
> +		dev_err(&client->dev, "%s: read error\n", __func__);
> +		return flags;
> +	} else if (flags & NCT3018Y_BIT_TWO)
> +		dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
> +
> +
> +	flags = NCT3018Y_BIT_TWO;
> +	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
> +		return err;
> +	}
> +
> +	flags = 0;
> +	err = i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
> +	if (err < 0) {
> +		dev_err(&client->dev, "%s: write error\n", __func__);
> +		return err;
> +	}
> +
> +
> +	nct3018y->rtc = devm_rtc_allocate_device(&client->dev);
> +	if (IS_ERR(nct3018y->rtc))
> +		return PTR_ERR(nct3018y->rtc);
> +
> +	nct3018y->rtc->ops = &nct3018y_rtc_ops;
> +	nct3018y->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
> +	nct3018y->rtc->range_max = RTC_TIMESTAMP_END_2099;
> +
> +	if (client->irq > 0) {
> +		err = devm_request_threaded_irq(&client->dev, client->irq,
> +				NULL, nct3018y_irq,
> +				IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
> +				"nct3018y", client);
> +		if (err) {
> +			dev_err(&client->dev, "unable to request IRQ %d\n", client->irq);
> +			return err;
> +		}
> +	}

You need to clear RTC_FEATURE_UPDATE_INTERRUPT and RTC_FEATURE_ALARM
from nct3018y->rtc->features when client->irq <= 0

> +
> +	return devm_rtc_register_device(nct3018y->rtc);
> +

> +#ifdef CONFIG_COMMON_CLK
> +	/* register clk in common clk framework */
> +	nct3018y_clkout_register_clk(nct3018y);
> +#endif
> +

This code is not reachable anymore

> +	return 0;
> +}
> +
> +static const struct i2c_device_id nct3018y_id[] = {
> +	{ "nct3018y", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, nct3018y_id);
> +
> +
> +static const struct of_device_id nct3018y_of_match[] = {
> +	{ .compatible = "nuvoton,nct3018y" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, nct3018y_of_match);
> +
> +static struct i2c_driver nct3018y_driver = {
> +	.driver		= {
> +		.name	= "rtc-nct3018y",
> +		.of_match_table = of_match_ptr(nct3018y_of_match),
> +	},
> +	.probe		= nct3018y_probe,
> +	.id_table	= nct3018y_id,
> +};
> +
> +module_i2c_driver(nct3018y_driver);
> +
> +MODULE_AUTHOR("Medad CChien <ctcchien@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton NCT3018Y RTC driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
