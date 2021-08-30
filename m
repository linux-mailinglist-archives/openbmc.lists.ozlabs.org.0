Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F03FBE40
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 23:28:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gz3MX0Z5Pz2yLb
	for <lists+openbmc@lfdr.de>; Tue, 31 Aug 2021 07:28:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gAKEtxRU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gAKEtxRU; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gz3M84WT9z2xqx
 for <openbmc@lists.ozlabs.org>; Tue, 31 Aug 2021 07:27:48 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso20206414ots.5
 for <openbmc@lists.ozlabs.org>; Mon, 30 Aug 2021 14:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T6rOSktaGUzhxY0lut5nuLyqLxN9lcu2nym2eVvhLi0=;
 b=gAKEtxRUhFHRun4q84Gl+ELrsIYKSOYl4ACu6W5vDC5HwhrAGQaf0Myu8BLfGD0yzH
 bQ6W4cir+6Vg1OjGRyiOwIEBJbpHtmkGbj5uzt31TpMO6LN658abl/KZVgzs9hfC2sfQ
 BSpazCuu/pryRUBx9wv+oVy/gqI9Mc7p2gM0xeX1zaaEMrXvaeFb7xq5FkFWmRsHyl/J
 rURQMqpoDX9PHIqeZPH5NmU4Fbxi9LwlIWIqTe/AY9ZEdXpA0oKIhQDuCkpvmCizlLF/
 Xqj28174v5alPg7WHY1avyn68OEtTiYWs8NGK0umElB3Ga7WMSZQXErSUro3Xfxg/wZ2
 04pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T6rOSktaGUzhxY0lut5nuLyqLxN9lcu2nym2eVvhLi0=;
 b=K1tfXS8I9E+BtvpEOrPhc5RL22I+6KJ74ioRFGDiVIxDMbsCajiQwFgpYHNhfM9jid
 n0b8IHaYqtvwaCpYA83Bi/+MvZ1N1olwdpCYSRJbypQE9KiT5wsXwi5DGZv15eIHZHSl
 8JIhN+c3R28YFvUfFDZY3WeJn8qxLxd/V6zP4vacsnFbzEuY0HMccFmT+rCXuolgtQxW
 Mf8SVLu7MbMVbtiSZCCDFYVkywzXHSejGx3uSFi3m+NofVB1sTs2FcNz3wiqbu8Z78od
 4KYxLr7tT8EkvOP1VH9R7+dY5BgOMOHN75BrEGWWoIHN9XOUdjzOvSKiS5FM3LJCFgA+
 +k1A==
X-Gm-Message-State: AOAM530ojnSmF/3PTzcyH3BNLCCxpn9RcXl0RgZtZsC0FgM+vndWHvjs
 XYFG3kykHnB98KvpAw1h2cs=
X-Google-Smtp-Source: ABdhPJwouwHN3AuNACLppRIQkrQrt6jltkPlQJPqmFt33SyskfjwqwVBTzsDEFmiIHTIGnEvfrSBvg==
X-Received: by 2002:a05:6830:314b:: with SMTP id
 c11mr21469050ots.169.1630358865244; 
 Mon, 30 Aug 2021 14:27:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v24sm2117102oov.18.2021.08.30.14.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:27:44 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
To: Brandon Wyman <bjwyman@gmail.com>, Eddie James <eajames@linux.ibm.com>
References: <20210827230433.3596370-1-bjwyman@gmail.com>
 <20210828155250.GA820265@roeck-us.net>
 <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
 <cac545d4-3840-898c-4950-8262fea9e2ab@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <51149737-4ec6-032b-607e-9aaa48951efc@roeck-us.net>
Date: Mon, 30 Aug 2021 14:27:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cac545d4-3840-898c-4950-8262fea9e2ab@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/30/21 2:07 PM, Brandon Wyman wrote:
> 
> On 2021-08-30 08:50, Eddie James wrote:
>> On Sat, 2021-08-28 at 08:52 -0700, Guenter Roeck wrote:
>>> On Fri, Aug 27, 2021 at 11:04:33PM +0000, Brandon Wyman wrote:
>>>> The bytes for max_power_out from the ibm-cffps devices do not need
>>>> to be
>>>> swapped.
>>>>
>>>> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
>>> Eddie, can you confirm this ?
>> This can't be true for all the power supplies supported by this driver,
>> no. I think we need to check the version first. Brandon, I tested this
>> on witherspoon (which is psu version 1) and get 3148 watts. If it's not
>> swapped, that would be 19468 watts...
>>
>> Thanks,
>> Eddie
> I had tested this on a variety of systems with a variety of different power supplies, but I did *NOT* test this on the Witherspoon power supplies.
> 
> This apparently requires a bit more thought to figure out how to handle the other types and also not get Witherspoon wrong.
> 

Is the specification for those power supplies available in public ?

Thanks,
Guenter

> Thanks for checking Eddie.
> 
>>> Thanks,
>>> Guenter
>>>
>>>> ---
>>>>   drivers/hwmon/pmbus/ibm-cffps.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c
>>>> b/drivers/hwmon/pmbus/ibm-cffps.c
>>>> index df712ce4b164..29b77f192c9e 100644
>>>> --- a/drivers/hwmon/pmbus/ibm-cffps.c
>>>> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
>>>> @@ -171,7 +171,7 @@ static ssize_t ibm_cffps_debugfs_read(struct
>>>> file *file, char __user *buf,
>>>>           cmd = CFFPS_SN_CMD;
>>>>           break;
>>>>       case CFFPS_DEBUGFS_MAX_POWER_OUT:
>>>> -        rc = i2c_smbus_read_word_swapped(psu->client,
>>>> +        rc = i2c_smbus_read_word_data(psu->client,
>>>>                            CFFPS_MAX_POWER_OUT_CM
>>>> D);
>>>>           if (rc < 0)
>>>>               return rc;
>>>> -- 
>>>> 2.25.1
>>>>

