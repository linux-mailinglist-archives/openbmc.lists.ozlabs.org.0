Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630746C99F
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 01:54:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7zGD2Nvdz3069
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 11:54:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LRTZy3Us;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LRTZy3Us; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7zFm4CLMz2xDg
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 11:54:19 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so1054919otj.7
 for <openbmc@lists.ozlabs.org>; Tue, 07 Dec 2021 16:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0id8lr27Q06PU0ZpfksKqJP2WnkqgACe0AiGg4Xx0wI=;
 b=LRTZy3Usv/yxMGkkU3vVXe2xdTw6ZK7nWOuKzcOSJLa8scWUdO4JuZJCim9gzjWHkM
 r6HibFj+gmpgUm58EyadhTY8mZTYDHJ3NSqHRuLoQ9DUeeVrWA2Jb+KyvYNH4uaotS7w
 5PZ302DFUabLNjyJPIV11HG2Yec7Z28oRDF46dT9sXbuBF/TbhAL/YAic1vvsjFQYHJN
 rBcToVEU8DLIsFSyTHFScV8Z/P2lkzcPuGPjKyjfXlEv72zAAXtCbMjnoFdLg7Owb2mz
 vSiIfXnqSmhlpBBQsIbJrO/rxuJTx6gj03HBhbRIpjE2mU6M7+aPBzyIFne8AEyhsuC6
 2I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0id8lr27Q06PU0ZpfksKqJP2WnkqgACe0AiGg4Xx0wI=;
 b=QFSjD6N1nVo1B0CDfFG6uN8wlRc8whT9vhyTkyXugLE0eY9E3ZFHzR/02vUbzA9sGn
 VIJz0Gu7gv8KGBNDIz0MDU5oGaECCbGCHz43q6XlMYWQaYHBXkiOw/XIU1B2//11vuQw
 xR54c7rsFN2Z93yqhwIUFseCWKgfPVGVsbd8kBcgZbCNXyQBJBPt0tbN3+X8OZR9OBkk
 o3rR10Znifa+K8lMUdSaBJgFed9BDxeMTiocStZVrPdQJUYmo6113Mu1jVylqd+J7z3V
 97V1ZjFPbAHTbgaHo7kN7DbjjprW0vjVwVhqXOMbfRHAqV5lWXQQ2B+1oyiBQAORUUz7
 CR1A==
X-Gm-Message-State: AOAM533d39Us9c/gKVN6IhnA2+oFe7LExVwpz7TEp6gPuKhEn6aCXMVS
 Fwarud+ZcRbmxEK15sRNBV4=
X-Google-Smtp-Source: ABdhPJzIeHjwc+t1GCi60tbcjBm1n9013QVL3AFYpf9QR72HC2whDKz7VRbOnFINzEG6v2uZB2NN/A==
X-Received: by 2002:a9d:2243:: with SMTP id o61mr38065777ota.126.1638924854916; 
 Tue, 07 Dec 2021 16:54:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q9sm224968oti.32.2021.12.07.16.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 16:54:14 -0800 (PST)
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus) Add Delta AHE-50DC fan control
 module driver
To: Zev Weiss <zev@bewilderbeest.net>
References: <20211207071521.543-1-zev@bewilderbeest.net>
 <20211207071521.543-2-zev@bewilderbeest.net>
 <20211207175015.GA772416@roeck-us.net>
 <Ya+0YDWIRBQFnEDb@hatter.bewilderbeest.net>
 <f30241ad-f3c4-ee78-22f3-405401615b61@roeck-us.net>
 <Ya/X46owU78iVbSO@hatter.bewilderbeest.net>
 <abc2e3bc-3806-dbd3-840c-e19154bc0587@roeck-us.net>
 <Ya//HhC8a1DmQQAx@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5846df4d-3d93-8894-5c1c-bbb415908b27@roeck-us.net>
Date: Tue, 7 Dec 2021 16:54:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya//HhC8a1DmQQAx@hatter.bewilderbeest.net>
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

On 12/7/21 4:41 PM, Zev Weiss wrote:
> On Tue, Dec 07, 2021 at 03:15:18PM PST, Guenter Roeck wrote:
>> On 12/7/21 1:53 PM, Zev Weiss wrote:
>>> On Tue, Dec 07, 2021 at 11:44:01AM PST, Guenter Roeck wrote:
>>>> On 12/7/21 11:22 AM, Zev Weiss wrote:
>>>>> On Tue, Dec 07, 2021 at 09:50:15AM PST, Guenter Roeck wrote:
>>>>>> On Mon, Dec 06, 2021 at 11:15:20PM -0800, Zev Weiss wrote:
>>>>>>> This device is an integrated module of the Delta AHE-50DC Open19 power
>>>>>>> shelf.  For lack of proper documentation, this driver has been developed
>>>>>>> referencing an existing (GPL) driver that was included in a code release
>>>>>>> from LinkedIn [1].  It provides four fan speeds, four temperatures, and
>>>>>>> one voltage reading, as well as a handful of warning and fault
>>>>>>> indicators.
>>>>>>>
>>>>>>> [1] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
>>>>>>>
>>>>>>
>>>>>> Hmm, that reference isn't really accurate anymore. I think it would be
>>>>>> better to just say that the device was found to be PMBus compliant.
>>>>>
>>>>> Sure, will do.
>>>>>
>>>>
>>>> Makes me wonder: How do you know that the referenced driver is for Delta AHE-50DC ?
>>>
>>> We'd been waiting for the source code for the software it ships with for a while, and were finally provided with that repo; everything I've observed from the factory software is consistent with the code in that driver.  A sampling:
>>>
>>
>> I assume you mean "Delta AHE-50DC" when you refer to "it".
>>
> 
> Yes.
> 
>> [ ... ]
>>>> Can you check this with real hardware, by any chance ?
>>>>
>>>
>>> If you mean running that code on it, yes -- here's the userspace utility that invokes that library routine:
>>>
>>>     root@bmc-oob:~# fan-util.sh
>>>     fan1 speed: 7860 RPM
>>>     fan2 speed: 7860 RPM
>>>     fan3 speed: 7620 RPM
>>>     fan4 speed: 7560 RPM
>>>     temperature1: 29.20 C
>>>     temperature2: 27.80 C
>>>     temperature3: 28.50 C
>>>     temperature4: 30.20 C
>>>     vin_undervolt_fault: no
>>>     overtemperature_warning: no
>>>     fan_fault: no
>>>     fan_warning: no
>>>     fan_status: ok
>>>
>>
>> That doesn't really tell me anything in the context of the driver you submitted.
>> Would it be possible to install your driver and provide the output from the
>> "sensors" command ? It should match the information from the proprietary
>> driver/tool.
>>
> 
> Thanks, in doing so I realized I'd neglected to prevent reads from unsupported registers in the read_word_data function, which was leading to the driver producing sysfs files for meaningless sensor limits that the device doesn't actually support.  With that fix (which I'll include in v4):
> 

What a surprise. See drivers/hwmon/pmbus/dps920ab.c; that seems to be
a common theme for devices from Delta. I would suggest to add a similar
comment.

Guenter
