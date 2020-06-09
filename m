Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A01F4185
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 18:57:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hGVy4KJ1zDqbg
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 02:56:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F/UkbE7q; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hGV23hV6zDqSy;
 Wed, 10 Jun 2020 02:56:09 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id s23so9008684pfh.7;
 Tue, 09 Jun 2020 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DwFIFEm33WK8zpwzow16/Dg35tWTHR0C4Exi34I/iFY=;
 b=F/UkbE7qW4IMLv2/8XuJRxV1kmf/y5Az56RFgPF8MowFaMblCedjZxAw9Ynd4fWCV3
 IC2eV8c1ZQzlh0CBLiEydzQ88GlcPrcM1EqYWlmZJ9vKxQ5qPxxhD3HcLV4gNA04DLb0
 R0b6QM37IsKw+Mrg/PE+RWasA83xcbcl4uDAmfpem1RrV+RDT176MjvO5iwWTnqpDnWs
 iex2rTvq0vRqZ1suIo1aWMQKZBqX9ZR8dHBBmKon+Qb/U42MYc+3z/tClxfdr6zFW3E6
 +2fbMEjQQZHNkdFqaNwoH3t65bEnjKq7bV+fLTgnpQlTzwSXLHj0X7G9ucn+ylUnF6wS
 /j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DwFIFEm33WK8zpwzow16/Dg35tWTHR0C4Exi34I/iFY=;
 b=Q6dZ2IhWfB4x/HMYS/ljzCJ8cET4XVUw00yqEDbnSf4RkoP5MSGKPf3M2ZkTemJ5Q4
 ELKMkYdLdbKLl5NvvIn72qwF69y8/QFrrHZyf94p8k/6+yyKakctMJ+/qu69BbjlWrUo
 agU+cj/idmh6x6tAEFg+Br5ouXa/X0VX5uP8cc4UaETgd/FytgQfTtQ7ULbr9KqrCHWt
 sRMR2P6bYwSIbiIJTUVSgGy+uDkfWiYdZDxKCbIBj4vyDJauAwRG0YcD1TwPg2ZRg9Ns
 O3A2n4MSgQYIEh/PExFecN3wRVmtrp2hlIwCDn/rdDMQ9axTjqUwr3HAtssLKyYoYOQJ
 qx7A==
X-Gm-Message-State: AOAM533zCT1bAyWu99eq/2pZf7eAY2n9s5Ljfx4S2TcpxMUfcPnQB6RB
 1hfQPC8eUusMLGKrLQEEac4=
X-Google-Smtp-Source: ABdhPJxVQm4eFrZE7Qrz3WB1BDMIayo66wwNvvv7MiXlxnuKh0CeWomXK5imIP0+NofJzXqV0ug4Zg==
X-Received: by 2002:a63:3ec4:: with SMTP id
 l187mr25180522pga.358.1591721767457; 
 Tue, 09 Jun 2020 09:56:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 mp15sm2973756pjb.45.2020.06.09.09.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 09:56:06 -0700 (PDT)
Subject: Re: [PATCH v3] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
To: Manikandan <manikandan.hcl.ers.epl@gmail.com>
References: <20200608104349.GA10918@cnn>
 <23597b7b-de89-2911-092e-f3e1ad4884f5@roeck-us.net>
 <20200609152628.GB8833@cnn>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <258764db-0155-5f33-b33d-74b33ef687af@roeck-us.net>
Date: Tue, 9 Jun 2020 09:56:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200609152628.GB8833@cnn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 manikandan.e@hcl.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, patrickw3@fb.com, saipsdasari@fb.com,
 vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/9/20 8:26 AM, Manikandan wrote:
> On Mon, Jun 08, 2020 at 06:49:45AM -0700, Guenter Roeck wrote:
>> On 6/8/20 3:43 AM, Manikandan Elumalai wrote:
>>> The adm1278 temp attribute need it for openbmc platform .
>>> This feature not enabled by default, so PMON_CONFIG needs to enable it.
>>>
>>> v3:
>>> ----
>>> fix invalid signed-off.
>>> removed checkpath warnings.
>>> write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.
>>>
>>> v2:
>>> ----
>>> add Signed-off-by.
>>> removed ADM1278_TEMP1_EN check.
>>>
>>> Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
>>> ---
>>>  drivers/hwmon/pmbus/adm1275.c | 10 ++++------
>>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
>>> index 5caa37fb..4782e31 100644
>>> --- a/drivers/hwmon/pmbus/adm1275.c
>>> +++ b/drivers/hwmon/pmbus/adm1275.c
>>> @@ -666,11 +666,12 @@ static int adm1275_probe(struct i2c_client *client,
>>>  		tindex = 3;
>>>  
>>>  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
>>> -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
>>> +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>>> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>>>  
>>> -		/* Enable VOUT if not enabled (it is disabled by default) */
>>> +		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
>>>  		if (!(config & ADM1278_VOUT_EN)) {
>>
>> This if statement needs to be
>> 		if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
>>
>           Hi Guenter,
> 
>              The below warning shown by checkpatch after changes,
> 
>                   WARNING: line over 80 characters
>                    #38: FILE: drivers/hwmon/pmbus/adm1275.c:672:
>                    + if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN) {
>  
>                    total: 0 errors, 1 warnings, 24 lines checked
> 
>               I didn't see any if() condition made as two line in the driver . Is this acceptable warning ?
> 

The warning is (or should be) gone in the latest upstream kernel -
the line length limit is now 100 bytes. Just ignore that warning,
or rebase your patch to the latest upstream kernel.

Guenter

>          Thanks
>          Mani.E
>>> -			config |= ADM1278_VOUT_EN;
>>> +			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
>>>  			ret = i2c_smbus_write_byte_data(client,
>>>  							ADM1275_PMON_CONFIG,
>>>  							config);
>>> @@ -681,9 +682,6 @@ static int adm1275_probe(struct i2c_client *client,
>>>  			}
>>>  		}
>>>  
>>> -		if (config & ADM1278_TEMP1_EN)
>>> -			info->func[0] |=
>>> -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>>>  		if (config & ADM1278_VIN_EN)
>>>  			info->func[0] |= PMBUS_HAVE_VIN;
>>>  		break;
>>>
>>

