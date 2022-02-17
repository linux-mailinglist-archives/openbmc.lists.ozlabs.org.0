Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B694BA7D5
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 19:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K02wH6qc7z3cY9
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 05:11:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IZjNG4hP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IZjNG4hP; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K02vw33t3z3cG3
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 05:11:39 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id n6so9852942qvk.13
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 10:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=3t297Rve1SDESxxbDGkaeisi7qQ51HM6w5VO3bA4J1g=;
 b=IZjNG4hPlrHwMT/EWpsO8lqY9zm+3+5Tm9vgRFRSf35NJ+/gd3v1bIWzxNojEW6H4q
 BTnKQZADrGVhJZJWee1TQ5duZxae93aqpLa9aB3AsSjPac7wKu+m9n5ozeJeOB9lYzlg
 iFtQpCLu3vWnXl7t+nVqY1x1sZDI9/z2d1+8e5yU8mHjkeD4eYGazh+KCzlvRb+uAQop
 wGiyQIZ0wP7ubH1SI3Ze95u4KO7QXU11rgOwcNHHdTgikr2c6KxFKlBmF1d27Fik8rJ9
 QCJD7pN/0jOeS1uEYiaXt1S08lXMgTAhyDitEHaR2sX4jKxHolHwPbMlNs1mZLp/YIAq
 5LoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=3t297Rve1SDESxxbDGkaeisi7qQ51HM6w5VO3bA4J1g=;
 b=dw40zJkAz2sjKG+zk/bGN42q2yT/IzDJhIGYibUdGpfQUjjSl4MNVycdn/vuv8cUpv
 4d2TiDV7LxYQzgbYKGx2zCpEBczOkgioAP8h+5ol1qA911blSBo0I42Z4rzRMbiew/Kf
 15m606M5WHXMXyW1PU4X5bROAO2NTX19fmanVWtMS1CYf+ATYQMzwrPxhYH4lCPapmlm
 jbNO2AzMLvwQ77PnVbGlV3bo7jfKrbTKEc2ZoZZlZ46kTbACHjW2Lpp9CP0dTekMJtAA
 H+tkSP2F8KVf8G8TcOxs++DzdjOoCRHVqKFYC9T5eV+MTVDto113JwNesvMcz2E9i54r
 e9mw==
X-Gm-Message-State: AOAM532Am1pGCv07LPixqhL4pkBYD0QwgbyezYGGFORGG6dxTsw8Igqx
 nFJ77FK26zVHkbAm9uwqOmM=
X-Google-Smtp-Source: ABdhPJx+ebTDBhR5QvBJpvCX9RSFtsRiXT+CPPQevdr/8LGjuLuR2P8JmblxuxUzHNHYZJRPw62JIw==
X-Received: by 2002:a05:622a:1444:b0:2d5:b8f9:aa3c with SMTP id
 v4-20020a05622a144400b002d5b8f9aa3cmr3570975qtx.664.1645121496345; 
 Thu, 17 Feb 2022 10:11:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p14sm2462019qtn.93.2022.02.17.10.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 10:11:35 -0800 (PST)
Message-ID: <b22ca322-c8f2-d17c-75ff-54ee26b0041b@roeck-us.net>
Date: Thu, 17 Feb 2022 10:11:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20220217104444.7695-1-zev@bewilderbeest.net>
 <20220217104444.7695-2-zev@bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/4] hwmon: (pmbus) Add get_error_flags support to
 regulator ops
In-Reply-To: <20220217104444.7695-2-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/17/22 02:44, Zev Weiss wrote:
> The various PMBus status bits don't all map perfectly to the more
> limited set of REGULATOR_ERROR_* flags, but there's a reasonable
> number where they correspond well enough.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 97 ++++++++++++++++++++++++++++++++
>   1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 776ee2237be2..a274e8e524a5 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2417,10 +2417,107 @@ static int pmbus_regulator_disable(struct regulator_dev *rdev)
>   	return _pmbus_regulator_on_off(rdev, 0);
>   }
>   
> +/* A PMBus status flag and the corresponding REGULATOR_ERROR_* flag */
> +struct pmbus_regulator_status_assoc {
> +	int pflag, rflag;
> +};
> +
> +/* PMBus->regulator bit mappings for a PMBus status register */
> +struct pmbus_regulator_status_category {
> +	int func;
> +	int reg;
> +	const struct pmbus_regulator_status_assoc *bits; /* zero-terminated */
> +};
> +
> +static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] = {
> +	{
> +		.func = PMBUS_HAVE_STATUS_VOUT,
> +		.reg = PMBUS_STATUS_VOUT,
> +		.bits = (const struct pmbus_regulator_status_assoc[]) {
> +			{ PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
> +			{ PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
> +			{ PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
> +			{ PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT },
> +			{ },
> +		},
> +	}, {
> +		.func = PMBUS_HAVE_STATUS_IOUT,
> +		.reg = PMBUS_STATUS_IOUT,
> +		.bits = (const struct pmbus_regulator_status_assoc[]) {
> +			{ PB_IOUT_OC_WARNING,    REGULATOR_ERROR_OVER_CURRENT_WARN },
> +			{ PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
> +			{ PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
> +			{ },
> +		},
> +	}, {
> +		.func = PMBUS_HAVE_STATUS_TEMP,
> +		.reg = PMBUS_STATUS_TEMPERATURE,
> +		.bits = (const struct pmbus_regulator_status_assoc[]) {
> +			{ PB_TEMP_OT_WARNING,    REGULATOR_ERROR_OVER_TEMP_WARN },
> +			{ PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP },
> +			{ },
> +		},
> +	},
> +};
> +
> +static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
> +{
> +	int i, status, statusreg;
> +	const struct pmbus_regulator_status_category *cat;
> +	const struct pmbus_regulator_status_assoc *bit;
> +	struct device *dev = rdev_get_dev(rdev);
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +	u8 page = rdev_get_id(rdev);
> +	int func = data->info->func[page];
> +
> +	*flags = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(pmbus_regulator_flag_map); i++) {
> +		cat = &pmbus_regulator_flag_map[i];
> +		if (!(func & cat->func))
> +			continue;
> +
> +		status = pmbus_read_byte_data(client, page, cat->reg);
> +		if (status < 0)
> +			return status;
> +
> +		for (bit = cat->bits; bit->pflag; bit++) {
> +			if (status & bit->pflag)
> +				*flags |= bit->rflag;
> +		}
> +	}
> +
> +	/*
> +	 * Map what bits of STATUS_{WORD,BYTE} we can to REGULATOR_ERROR_*
> +	 * bits.  Some of the other bits are tempting (especially for cases
> +	 * where we don't have the relevant PMBUS_HAVE_STATUS_*
> +	 * functionality), but there's an unfortunate ambiguity in that
> +	 * they're defined as indicating a fault *or* a warning, so we can't
> +	 * easily determine whether to report REGULATOR_ERROR_<foo> or
> +	 * REGULATOR_ERROR_<foo>_WARN.
> +	 */
> +	statusreg = data->has_status_word ? PMBUS_STATUS_WORD : PMBUS_STATUS_BYTE;
> +	status = pmbus_get_status(client, page, statusreg);
> +

pmbus_get_status() calls data->read_status if PMBUS_STATUS_WORD is provided
as parameter, and data->read_status is set to pmbus_read_status_byte()
if reading the word status is not supported. Given that, why not just call
pmbus_get_status(client, page, PMBUS_STATUS_WORD) ?

> +	if (status < 0)
> +		return status;
> +
> +	if (pmbus_regulator_is_enabled(rdev) && (status & PB_STATUS_OFF))
> +		*flags |= REGULATOR_ERROR_FAIL;
> +	if (status & PB_STATUS_IOUT_OC)
> +		*flags |= REGULATOR_ERROR_OVER_CURRENT;

If the current status register is supported, this effectively means that
an overcurrent warning is always reported as both REGULATOR_ERROR_OVER_CURRENT
and REGULATOR_ERROR_OVER_CURRENT_WARN. Is that intentional ?


> +	if (status & PB_STATUS_VOUT_OV)
> +		*flags |= REGULATOR_ERROR_REGULATION_OUT;

Same for voltage. On the other side, temperature limit violations are not
reported at all unless the temperature status register exists.
That seems to be a bit inconsistent to me.

> +
> +	return 0;
> +}
> +
>   const struct regulator_ops pmbus_regulator_ops = {
>   	.enable = pmbus_regulator_enable,
>   	.disable = pmbus_regulator_disable,
>   	.is_enabled = pmbus_regulator_is_enabled,
> +	.get_error_flags = pmbus_regulator_get_error_flags,
>   };
>   EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
>   

