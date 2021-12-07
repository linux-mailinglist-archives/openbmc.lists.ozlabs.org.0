Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C946C816
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 00:15:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7x465mLrz2ywg
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 10:15:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ID+7HiS1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ID+7HiS1; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7x3d6TBSz2yN4
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 10:15:23 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso852159ots.6
 for <openbmc@lists.ozlabs.org>; Tue, 07 Dec 2021 15:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bES/GU9/Gr59OqsaNMJp8pnGLgUSxAf2mbHy46Olebc=;
 b=ID+7HiS1TynVfygEwQgIrK0URpV4ca5jzknz9N6/M30yLi/lux9++xlsf7Wo4C+/3s
 itDNXNSGjbfXTcvgYsODK/qQ7+OdstuYtlRm666wAq6LCYSEGoPSWJbD5TeQ+moZpFPD
 kZChBQ7t5AKNQQLVgxWoRh80EKm36fc1I3waNA3GePej1eTBZUraeIeZVEFuNdYUjxNK
 e5iJ9Mtg15n8y/iStJrZVC6ffkhc59r/57sUuYShLMB063MVeLrxgrtOrFoXvD0Tp2Wc
 eq+5E9Mt28eNovq08ZnIjoqEoc4vPrtQzJy88F7lOY+J/t/ODiyhunVWPiik2mc0vFDU
 trcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bES/GU9/Gr59OqsaNMJp8pnGLgUSxAf2mbHy46Olebc=;
 b=pDc4WWvQFPYg1WEM+OXOWAx/p1TIuHhRtzo1pxumRNPzbpSidW7PFCgxmgUdHj8dni
 GqDyAtR6X6rUXss0qKK3tu0wJnrgbGyR8FnYbnUA1XgD7/yCmFH/pmkL6WKIeMVc4+zV
 kFUdWapVolxKr8iC8OT0KFnGYgamTL8MNA0Rax7D3cb+dQVoXui0jaT5xG5UBjruihGj
 3otGBBaUht7K9NsqDl3mKDML5eLfRtuDC7xrjcGhTUyW033BVZxZ0MZ9j+7JZhtb8UsR
 gvGU6cOXGC3uofaBH9lKF3dudCjyvbb7SBIiUKa6+d747h5VtcLPDjQKEmf62okBXq2y
 +MPg==
X-Gm-Message-State: AOAM530ThjCjXWaN+hn77EuM8VevkPx5hIiIYdKmkrAa97Osz51VHB4x
 EI0bpLhX0yUFxhU1xUoIlNuOsuv1yDk=
X-Google-Smtp-Source: ABdhPJzJ4yb6o16nmblWRj2GOq9gCTslgvafxiZXLRoTUQV4dR37/lYV18MRhYrFIKsJt7hyV8BLCw==
X-Received: by 2002:a9d:1b0:: with SMTP id e45mr36620695ote.23.1638918920222; 
 Tue, 07 Dec 2021 15:15:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f12sm179471ote.75.2021.12.07.15.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 15:15:19 -0800 (PST)
To: Zev Weiss <zev@bewilderbeest.net>
References: <20211207071521.543-1-zev@bewilderbeest.net>
 <20211207071521.543-2-zev@bewilderbeest.net>
 <20211207175015.GA772416@roeck-us.net>
 <Ya+0YDWIRBQFnEDb@hatter.bewilderbeest.net>
 <f30241ad-f3c4-ee78-22f3-405401615b61@roeck-us.net>
 <Ya/X46owU78iVbSO@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/2] hwmon: (pmbus) Add Delta AHE-50DC fan control
 module driver
Message-ID: <abc2e3bc-3806-dbd3-840c-e19154bc0587@roeck-us.net>
Date: Tue, 7 Dec 2021 15:15:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya/X46owU78iVbSO@hatter.bewilderbeest.net>
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

On 12/7/21 1:53 PM, Zev Weiss wrote:
> On Tue, Dec 07, 2021 at 11:44:01AM PST, Guenter Roeck wrote:
>> On 12/7/21 11:22 AM, Zev Weiss wrote:
>>> On Tue, Dec 07, 2021 at 09:50:15AM PST, Guenter Roeck wrote:
>>>> On Mon, Dec 06, 2021 at 11:15:20PM -0800, Zev Weiss wrote:
>>>>> This device is an integrated module of the Delta AHE-50DC Open19 power
>>>>> shelf.  For lack of proper documentation, this driver has been developed
>>>>> referencing an existing (GPL) driver that was included in a code release
>>>>> from LinkedIn [1].  It provides four fan speeds, four temperatures, and
>>>>> one voltage reading, as well as a handful of warning and fault
>>>>> indicators.
>>>>>
>>>>> [1] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
>>>>>
>>>>
>>>> Hmm, that reference isn't really accurate anymore. I think it would be
>>>> better to just say that the device was found to be PMBus compliant.
>>>
>>> Sure, will do.
>>>
>>
>> Makes me wonder: How do you know that the referenced driver is for Delta AHE-50DC ?
> 
> We'd been waiting for the source code for the software it ships with for a while, and were finally provided with that repo; everything I've observed from the factory software is consistent with the code in that driver.  A sampling:
> 

I assume you mean "Delta AHE-50DC" when you refer to "it".

[ ... ]
>> Can you check this with real hardware, by any chance ?
>>
> 
> If you mean running that code on it, yes -- here's the userspace utility that invokes that library routine:
> 
>      root@bmc-oob:~# fan-util.sh
>      fan1 speed: 7860 RPM
>      fan2 speed: 7860 RPM
>      fan3 speed: 7620 RPM
>      fan4 speed: 7560 RPM
>      temperature1: 29.20 C
>      temperature2: 27.80 C
>      temperature3: 28.50 C
>      temperature4: 30.20 C
>      vin_undervolt_fault: no
>      overtemperature_warning: no
>      fan_fault: no
>      fan_warning: no
>      fan_status: ok
> 

That doesn't really tell me anything in the context of the driver you submitted.
Would it be possible to install your driver and provide the output from the
"sensors" command ? It should match the information from the proprietary
driver/tool.

Thanks,
Guenter


