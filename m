Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08B4BAD9E
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 01:03:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0Bjt5XvYz3cNc
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 11:03:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e6qB4Qwl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=e6qB4Qwl; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0BjQ5d3Bz3bmf
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 11:03:05 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id d3so11537848qvb.5
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 16:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=n+FaIKpbwlcwNwfMXSlvgTrUbGvStZsE6FNKbiYH2II=;
 b=e6qB4Qwle8s97fn/L3dRekDwKoRi4f8zocqWP73baXMdiL0LbaPJcsnKJrOVqj7EZi
 LSy2PI81HbrKg6rO74PCXSGO/8RTbF1CKnpgcLnBa48sHjtCFfuMvT4s/136ecsItZYZ
 wsxoIFLPoYh3I/Yw9n0daFvM7HmcJRFtyiXUipjhbQQL3XR9j7+HWB8dzLWOwKqf20F4
 Kmvu60a6E3SqCALoaH1nqNzz/3urNyTm+opaC4cIr8bVenmPDQidLyjk4apIK7e/TG9l
 +yghPSeVG1EpQrxxBe+/uFBcKDGKI5wCRQJKf6t2nM6+MNbQqU1x2ryJer43me/J0/Ur
 7yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=n+FaIKpbwlcwNwfMXSlvgTrUbGvStZsE6FNKbiYH2II=;
 b=2LWuzcxjjOXS1oFQW2v5qXnZ29ybDJJpH993CICdlp+WavRCmPjEYtUoB9xqfY/qRI
 bA3+u0O4MoMy4gFFdEMPDechTxOpGvy71fwEpGtM5AAE3nsLjbRqTOsQaFVAvwNzap1p
 0OpDPQDt4WjPny0u3h//ZdeY7l8Ptmlk4NU1s6N7Ilnt2BDVtPcmk3zU6Uo9tOmc8jR0
 4QPi/Kg8H/9VHiZxdotpAvab53KSlGXHWPtBKTVXlOdB7jA2KOHUFLumiXMoAyuvet9T
 dwFivnHohwn/8ZTMh5YA9YuCkGo+/phd0YZGwN1Yn5Hk/mBCTEipVDhT3zGG+KYWSdlD
 TXVA==
X-Gm-Message-State: AOAM5331IA+ZEIqCtFfySByB2vDeIau8rk1FlZxeix+GozMqyh4WtGWz
 ovkgPPkWHUKmFN3PGO3bUII=
X-Google-Smtp-Source: ABdhPJzkaZMwaV/ZY9bwi3ZX/yaemYp9OxCMUyVWK3jFujzuG3/PQHlI0ccBg1FcU4Vuxtydg+lQgw==
X-Received: by 2002:ad4:4ea7:0:b0:42c:b235:aa7 with SMTP id
 ed7-20020ad44ea7000000b0042cb2350aa7mr4059340qvb.19.1645142581181; 
 Thu, 17 Feb 2022 16:03:01 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h4sm4526118qkf.66.2022.02.17.16.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 16:03:00 -0800 (PST)
Message-ID: <3bfa7f1f-ef5d-b222-894b-b15a2270996d@roeck-us.net>
Date: Thu, 17 Feb 2022 16:02:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
References: <20220217104444.7695-1-zev@bewilderbeest.net>
 <20220217104444.7695-2-zev@bewilderbeest.net>
 <b22ca322-c8f2-d17c-75ff-54ee26b0041b@roeck-us.net>
 <Yg7cQwA+i5oTYqHJ@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/4] hwmon: (pmbus) Add get_error_flags support to
 regulator ops
In-Reply-To: <Yg7cQwA+i5oTYqHJ@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/17/22 15:37, Zev Weiss wrote:
> On Thu, Feb 17, 2022 at 10:11:32AM PST, Guenter Roeck wrote:
>> On 2/17/22 02:44, Zev Weiss wrote:
>>> The various PMBus status bits don't all map perfectly to the more
>>> limited set of REGULATOR_ERROR_* flags, but there's a reasonable
>>> number where they correspond well enough.
>>>
>>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>> ---
>>>  drivers/hwmon/pmbus/pmbus_core.c | 97 ++++++++++++++++++++++++++++++++
>>>  1 file changed, 97 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>>> index 776ee2237be2..a274e8e524a5 100644
>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>> @@ -2417,10 +2417,107 @@ static int pmbus_regulator_disable(struct regulator_dev *rdev)
>>>      return _pmbus_regulator_on_off(rdev, 0);
>>>  }
>>> +/* A PMBus status flag and the corresponding REGULATOR_ERROR_* flag */
>>> +struct pmbus_regulator_status_assoc {
>>> +    int pflag, rflag;
>>> +};
>>> +
>>> +/* PMBus->regulator bit mappings for a PMBus status register */
>>> +struct pmbus_regulator_status_category {
>>> +    int func;
>>> +    int reg;
>>> +    const struct pmbus_regulator_status_assoc *bits; /* zero-terminated */
>>> +};
>>> +
>>> +static const struct pmbus_regulator_status_category pmbus_regulator_flag_map[] = {
>>> +    {
>>> +        .func = PMBUS_HAVE_STATUS_VOUT,
>>> +        .reg = PMBUS_STATUS_VOUT,
>>> +        .bits = (const struct pmbus_regulator_status_assoc[]) {
>>> +            { PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
>>> +            { PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
>>> +            { PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
>>> +            { PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT },
>>> +            { },
>>> +        },
>>> +    }, {
>>> +        .func = PMBUS_HAVE_STATUS_IOUT,
>>> +        .reg = PMBUS_STATUS_IOUT,
>>> +        .bits = (const struct pmbus_regulator_status_assoc[]) {
>>> +            { PB_IOUT_OC_WARNING,    REGULATOR_ERROR_OVER_CURRENT_WARN },
>>> +            { PB_IOUT_OC_FAULT,      REGULATOR_ERROR_OVER_CURRENT },
>>> +            { PB_IOUT_OC_LV_FAULT,   REGULATOR_ERROR_OVER_CURRENT },
>>> +            { },
>>> +        },
>>> +    }, {
>>> +        .func = PMBUS_HAVE_STATUS_TEMP,
>>> +        .reg = PMBUS_STATUS_TEMPERATURE,
>>> +        .bits = (const struct pmbus_regulator_status_assoc[]) {
>>> +            { PB_TEMP_OT_WARNING,    REGULATOR_ERROR_OVER_TEMP_WARN },
>>> +            { PB_TEMP_OT_FAULT,      REGULATOR_ERROR_OVER_TEMP },
>>> +            { },
>>> +        },
>>> +    },
>>> +};
>>> +
>>> +static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags)
>>> +{
>>> +    int i, status, statusreg;
>>> +    const struct pmbus_regulator_status_category *cat;
>>> +    const struct pmbus_regulator_status_assoc *bit;
>>> +    struct device *dev = rdev_get_dev(rdev);
>>> +    struct i2c_client *client = to_i2c_client(dev->parent);
>>> +    struct pmbus_data *data = i2c_get_clientdata(client);
>>> +    u8 page = rdev_get_id(rdev);
>>> +    int func = data->info->func[page];
>>> +
>>> +    *flags = 0;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(pmbus_regulator_flag_map); i++) {
>>> +        cat = &pmbus_regulator_flag_map[i];
>>> +        if (!(func & cat->func))
>>> +            continue;
>>> +
>>> +        status = pmbus_read_byte_data(client, page, cat->reg);
>>> +        if (status < 0)
>>> +            return status;
>>> +
>>> +        for (bit = cat->bits; bit->pflag; bit++) {
>>> +            if (status & bit->pflag)
>>> +                *flags |= bit->rflag;
>>> +        }
>>> +    }
>>> +
>>> +    /*
>>> +     * Map what bits of STATUS_{WORD,BYTE} we can to REGULATOR_ERROR_*
>>> +     * bits.  Some of the other bits are tempting (especially for cases
>>> +     * where we don't have the relevant PMBUS_HAVE_STATUS_*
>>> +     * functionality), but there's an unfortunate ambiguity in that
>>> +     * they're defined as indicating a fault *or* a warning, so we can't
>>> +     * easily determine whether to report REGULATOR_ERROR_<foo> or
>>> +     * REGULATOR_ERROR_<foo>_WARN.
>>> +     */
>>> +    statusreg = data->has_status_word ? PMBUS_STATUS_WORD : PMBUS_STATUS_BYTE;
>>> +    status = pmbus_get_status(client, page, statusreg);
>>> +
>>
>> pmbus_get_status() calls data->read_status if PMBUS_STATUS_WORD is provided
>> as parameter, and data->read_status is set to pmbus_read_status_byte()
>> if reading the word status is not supported. Given that, why not just call
>> pmbus_get_status(client, page, PMBUS_STATUS_WORD) ?
> 
> Good point, I'll change it to do that instead.  (And send v2 separately from the power-efuse driver patches.)
> 
>>
>>> +    if (status < 0)
>>> +        return status;
>>> +
>>> +    if (pmbus_regulator_is_enabled(rdev) && (status & PB_STATUS_OFF))
>>> +        *flags |= REGULATOR_ERROR_FAIL;
>>> +    if (status & PB_STATUS_IOUT_OC)
>>> +        *flags |= REGULATOR_ERROR_OVER_CURRENT;
>>
>> If the current status register is supported, this effectively means that
>> an overcurrent warning is always reported as both REGULATOR_ERROR_OVER_CURRENT
>> and REGULATOR_ERROR_OVER_CURRENT_WARN. Is that intentional ?
>>
> 
> No, but I don't think (by my reading of the spec) that's what would happen?
> 
> I'm looking at table 16 ("STATUS_WORD Message Contents") in section 17.2 ("STATUS_WORD") of Part II of revision 1.3.1 of the PMBus spec, which says that bit 4 of the low byte (PB_STATUS_IOUT_OC) indicates an output overcurrent fault, not a warning (in contrast to most of the other bits, which may indicate either).
> 
>>
>>> +    if (status & PB_STATUS_VOUT_OV)
>>> +        *flags |= REGULATOR_ERROR_REGULATION_OUT;
>>
>> Same for voltage.
> 
> Likewise, PB_STATUS_VOUT_OV is specified as indicating a fault, not a warning.
> 

Ok, that makes sense.

>> On the other side, temperature limit violations are not
>> reported at all unless the temperature status register exists.
>> That seems to be a bit inconsistent to me.
>>
> 
> Right -- that's because PB_STATUS_TEMPERATURE is one of the "fault or warning" bits (unlike VOUT_OV and IOUT_OC), and hence it's an ambiguous case as described in the comment before the pmbus_get_status() call.
> 
> It's certainly not ideal, but it seemed like the best approach I could see given the semantics of the available flags -- I'm open to other possibilities though if there's something else that would work better.
> 

My approach would be to report a warning if no temperature warning/fault
is set from PMBUS_STATUS_TEMPERATURE but PB_STATUS_TEMPERATURE is set
in the status register.

Something like

	if (!(*flags & (REGULATOR_ERROR_OVER_TEMP | REGULATOR_ERROR_OVER_TEMP_WARN))
	    && (status & PB_STATUS_TEMPERATURE))
		*flags |= REGULATOR_ERROR_OVER_TEMP_WARN;

While not perfect, it would be better than reporting nothing.

Guenter
