Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 356EB4DE4DA
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 01:30:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KL1x80Gyzz3bTF
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 11:30:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ktR7snXR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ktR7snXR; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KL1wj5hHXz2xsc
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 11:29:41 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id q11so11100781iod.6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 17:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YeVRM2wCWZxF1N2cUE5jUnah4I7QVZFWjfkQLPvXdAs=;
 b=ktR7snXRi2HJnYP3L4g5kWB66TLo1LfSQnCPJxDR71L2bSdCZkw7RIj7dgxPMocr5o
 VbGzELTkhir9mclnHLlkf68XrD0Jlh8tsYQig4AFpdLwBGfECtYF8xYIPJPkt8HNVobI
 oU0AgwOO1rk6Zqe9Dy32/qB+pLfek9BlO7AxSR71H17ehUEpTCAe5o9kCVKiBMVcA9N/
 RSpGgxm8lGh3BX9zCNQ1azr2s7ogWLcMPlPOhXfeU58rEa+cSl91toW68DKrsAO3IBYX
 fbMn8VsMTNdv/rJpOHxcqKy7KAgdGQpnPme5DUOkOaOpuWyYKWVAGSvTSPBYiQ50Sr/m
 HPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YeVRM2wCWZxF1N2cUE5jUnah4I7QVZFWjfkQLPvXdAs=;
 b=8QBkoJzoCqG/+yVkgqGSoTL/UfWOcS4NItsFHmOarcDlv1S/4r35/xtCFbEI2yQK3f
 Vit3Za7hYdQ1TpNNvvqoMXeLsTspfT9vtkmtNF9s7WIGn0umJnFMlU/8Q56vWcb0YkD+
 lDx6d6vYoOhkMJ+nOuScbR61rWnOB5CzwSFnUNmqmm3ZxfYRpbHbt6K7mNiHd5M2ixER
 5vIwCxw4hlpqhv0eLmxzDRtvByavREwOHjFMhKQ0am2vOqZUg599ckH5/OVNTbHwYTMF
 /idm8OeGLH1Ea0yl9WIHRCF9PZFsoQm1rQTID0zkcfHbrtsxJqxzU/D4qh/ThMtjdKBQ
 BBBA==
X-Gm-Message-State: AOAM531buYWy0Y0QQlqXInsIL5nQBu2EisnsBNGPtwJLUc4HyMHTinPP
 yiCehKi+R7HESbsrnSYQxNMVCUo/Yf8=
X-Google-Smtp-Source: ABdhPJyuuG4bw8qGKwdqkiFbIgucHQjEm+brUmiAHiW5VZR7P75i9ex96gB6XSyBC75cLHTk4PDz8A==
X-Received: by 2002:a02:271d:0:b0:307:ea12:ff8b with SMTP id
 g29-20020a02271d000000b00307ea12ff8bmr6109658jaa.274.1647649776630; 
 Fri, 18 Mar 2022 17:29:36 -0700 (PDT)
Received: from [192.168.4.31] (199-48-94-83.rochmnaa.metronetinc.net.
 [199.48.94.83]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056e02178500b002c80adb2b87sm823157ilu.19.2022.03.18.17.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 17:29:36 -0700 (PDT)
Message-ID: <eff458db-b53e-68b3-2e2b-d7c71444541f@gmail.com>
Date: Fri, 18 Mar 2022 19:29:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] hwmon: (pmbus) Add Vin unit off handling
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20220317232123.2103592-1-bjwyman@gmail.com>
 <20220318053149.GA3333429@roeck-us.net>
From: Brandon Wyman <bjwyman@gmail.com>
In-Reply-To: <20220318053149.GA3333429@roeck-us.net>
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Joel,

Can you merge this, and the dependent patch to the openbmc/linux kernel?

Dependent patch is in v5.17-rc6 or later kernels: 35f165f08950 (""hwmon: 
(pmbus) Clear pmbus fault/warning bits after read").

On 2022-03-18 00:31, Guenter Roeck wrote:

> On Thu, Mar 17, 2022 at 11:21:23PM +0000, Brandon Wyman wrote:
>> If there is an input undervoltage fault, reported in STATUS_INPUT
>> command response, there is quite likely a "Unit Off For Insufficient
>> Input Voltage" condition as well.
>>
>> Add a constant for bit 3 of STATUS_INPUT. Update the Vin limit
>> attributes to include both bits in the mask for clearing faults.
>>
>> If an input undervoltage fault occurs, causing a unit off for
>> insufficient input voltage, but the unit is off bit is not cleared, the
>> STATUS_WORD will not be updated to clear the input fault condition.
>> Including the unit is off bit (bit 3) allows for the input fault
>> condition to completely clear.
>>
>> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> Applied.
>
> Thanks,
> Guenter
>
>> ---
>>   drivers/hwmon/pmbus/pmbus.h      | 1 +
>>   drivers/hwmon/pmbus/pmbus_core.c | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>> index e0aa8aa46d8c..ef3a8ecde4df 100644
>> --- a/drivers/hwmon/pmbus/pmbus.h
>> +++ b/drivers/hwmon/pmbus/pmbus.h
>> @@ -319,6 +319,7 @@ enum pmbus_fan_mode { percent = 0, rpm };
>>   /*
>>    * STATUS_VOUT, STATUS_INPUT
>>    */
>> +#define PB_VOLTAGE_VIN_OFF		BIT(3)
>>   #define PB_VOLTAGE_UV_FAULT		BIT(4)
>>   #define PB_VOLTAGE_UV_WARNING		BIT(5)
>>   #define PB_VOLTAGE_OV_WARNING		BIT(6)
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index ac2fbee1ba9c..a0d899dc81f0 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -1373,7 +1373,7 @@ static const struct pmbus_limit_attr vin_limit_attrs[] = {
>>   		.reg = PMBUS_VIN_UV_FAULT_LIMIT,
>>   		.attr = "lcrit",
>>   		.alarm = "lcrit_alarm",
>> -		.sbit = PB_VOLTAGE_UV_FAULT,
>> +		.sbit = (PB_VOLTAGE_UV_FAULT | PB_VOLTAGE_VIN_OFF),
>>   	}, {
>>   		.reg = PMBUS_VIN_OV_WARN_LIMIT,
>>   		.attr = "max",
