Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F006A78FEC
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 15:35:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSQpM2l91z3c8D
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 00:34:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743600887;
	cv=none; b=PretHD+aFIwnVl+HQ8HInGGS8T0dGuWvMahlWnhlGbhX6d2KQYrlAWE9KGuJw+9nANNpElPiTEbHut5DJ5oBNOfALoGjfhRGv3j/A3+38QPNfjkRNN6jDPiUH6/B6uh8xuMuz2t3awVXeavU0HIZa6couOGKUJpFNPK3ULefgEQg5gVMjqYaMgvJ/Iyfwg2fcKMiNcKpX72jtUM+RKDDUS18HfGf82C3yelyXljGnAwW16MINmjogDj1iLuCO1hYYJN1MDElJ7hfw9uPtJ47QpPOxoKOgVPro0jKCd1qx4xIaEH6QhPfSQsKMVjf0YGTBWyVbs8dp0whKVFTfQdsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743600887; c=relaxed/relaxed;
	bh=oM4dIlENBzmCrkF/MVmHBr9o/bxamEKafWPRvKH+k5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bM6lj872YAa8n9f+xRUofpcm6uvOUxqKKtVeIXvX+y/D3BD+u2OKM6O+aBLXxPPIK+ZF0vCHMwVQEFZlmt/sz6jXWWrQ6TANguVYg9Xp1Xr14G6Tib9lPb2SP9Y3Jx0d3nmELilDSv4+la9X90o9vLnzEVJOx9ufhNHmGxLhvwW6Tw8eWLl8kolNOQwpuBO5jif1nIGcOhbMrDWASeavuC8/lMVnevXoxDKtU5cmQ1zdjS2MPNQ2PpOIxqIpr84opEsTo+CXTW0KyPd8O7B5DMlD2+VEwuTDG3m8k+WLDykEEyUKpPaS1OXTEyWI1GrYHVlUj1omEjsNEKqAQ3/4/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CttzRZgi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CttzRZgi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSQpG1PwVz2yFQ
	for <openbmc@lists.ozlabs.org>; Thu,  3 Apr 2025 00:34:45 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-736aaeed234so96096b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 02 Apr 2025 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743600883; x=1744205683; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oM4dIlENBzmCrkF/MVmHBr9o/bxamEKafWPRvKH+k5Q=;
        b=CttzRZgiR7d4YL+817EaOyFZbFP4RCV1AfkTWnso9DpAiaOci3OoCwQ4rUjBj7CgIj
         +q7LAvfymes1z+mdYvAlnquUObBZ7+aIXWG2Ytv4SKIdhRevgQIu9I+y4EQQLuvtJYTs
         EX17ziAQt5xQMgOjsOY9qM7bYIwSGGax4ICFfhekldrNif59IHbvVJ4hCUqJ/2gvun8E
         pUbDxMKP3zjVXSpYWkqobNMXfgPSLWkw/7tGot2xffKzv7Dfsg/J/DjsUcKYvLRCqSsE
         bn447QP0hTLw5ny13xTt95gdsdOsAKDD+YNOIRv18nJIC72CNg3ufVs1vnukfF1CRdOC
         2LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600883; x=1744205683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM4dIlENBzmCrkF/MVmHBr9o/bxamEKafWPRvKH+k5Q=;
        b=FHNp9LNNlkOMfOjG6VEBusRGmhBeiBK3Sx4i+1TTgk2BHsWYmL5xkToFwShrwPb8tT
         G70oWneKwmNE7kBwn1KfxqGiE8e+0drYam73Ht6kyrCKs0oLIzHdj+5xGPQc4a+UKeMj
         oen3xWDvKKneyTLOZMSM4jQa4/gZb7RQS1n+tpoNuVbaCni8fK+MTZ/pMDnZOKqbFBUE
         eVU+/72QXK/gqAx+XNdM+Ic3Ei3ewlXiyISp2Uwz0QKU9VBVfhk/XTVia0uvQfypYd2B
         RmDQUWSYVAupvcbL0lTh7CmOeYEkmkU+G9rDztD4qXyRmn0CbhgiseJ7yKU8ixML0ITS
         n7GA==
X-Forwarded-Encrypted: i=1; AJvYcCWQP88KP15n1Ach6raJETh/6T3t+69krwkZFZ9c5aV0LMdqXiDDDbA9A6w6djnEJ4aj7SDKjUV7@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIUTkJEAsM4FX65VA6O60hU4jTMbDPIwFVr4ohWED5KMxtGHvV
	meaTFreqpXTGJfhJ9ktw8uYrH0p36LRnhLHYHUKBfCEgFxV6P5iV
X-Gm-Gg: ASbGncu9Qu0eIAaWxLdsW2RLFYtTsysLtUrV70jumKyj8EXPl0vja6XfznVJIAJbqba
	yKgbBfN3OXdDSJPkj/rXltlWJdWz1B3AxfhZWlocWzFfWfvyplunye2AEq/37rhcTaq2JiRjkwu
	4Cx6pU2u/b6GkpKSthF0zROQR1T4r8nZpRS4lU6s13pvrgpipwdTMkyamNwXbtlSKHyQjwtBrXH
	4wfwyvOrPSxRIWaKVl23+KQYFyRuDW1GrbQapFgGslKdYuTsN06cMSXA2gaKw9yQQ1vM8VEq5nu
	rNkR5/5J/rU/oh9ul/iZLI0poK0aa1ilSbfhDklxhWflDVCkdJJWBYgTRkpKmVUARJ1zpmGZWyn
	OEqUcrdj3w2Cnp/T49A==
X-Google-Smtp-Source: AGHT+IEIhvroKxYlDv/3ZMvAZuAXQz4vMLWwCVmGJDXd8YcRbaeyhMlDmhOD1GHhqpSudUbhmqouCQ==
X-Received: by 2002:a05:6a20:9f99:b0:1f5:80a3:b003 with SMTP id adf61e73a8af0-2009f7ee203mr25401787637.37.1743600882757;
        Wed, 02 Apr 2025 06:34:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971069b62sm10871531b3a.112.2025.04.02.06.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 06:34:42 -0700 (PDT)
Message-ID: <ae38b526-520f-45ae-b9d3-7628058d56d8@roeck-us.net>
Date: Wed, 2 Apr 2025 06:34:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: max34451: Workaround for lost page
To: William Kennington <william@wkennington.com>
References: <20250401220850.3189582-1-william@wkennington.com>
 <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
 <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
 <84d37c25-197b-44b4-b181-f71f5e8b81d8@roeck-us.net>
 <CAD_4BXhUVRpNjORSHYiwhxXAGbAv5=4SYekWZhK+r9Wi=n5+Lw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAD_4BXhUVRpNjORSHYiwhxXAGbAv5=4SYekWZhK+r9Wi=n5+Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/2/25 01:33, William Kennington wrote:
> On Tue, Apr 1, 2025 at 5:19 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 4/1/25 15:55, William Kennington wrote:
>>> On Tue, Apr 1, 2025 at 3:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 4/1/25 15:08, William A. Kennington III wrote:
>>>>> When requesting new pages from the max34451 we sometimes see that the
>>>>> firmware doesn't update the page on the max34451 side fast enough. This
>>>>> results in the kernel receiving data for a different page than what it
>>>>> expects.
>>>>>
>>>>> To remedy this, the manufacturer recommends we wait 50-100us until
>>>>> the firmware should be ready with the new page.
>>>>>
>>>>> Signed-off-by: William A. Kennington III <william@wkennington.com>
>>>>> ---
>>>>>     drivers/hwmon/pmbus/max34440.c | 7 +++++++
>>>>>     1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
>>>>> index c9dda33831ff..ac3a26f7cff3 100644
>>>>> --- a/drivers/hwmon/pmbus/max34440.c
>>>>> +++ b/drivers/hwmon/pmbus/max34440.c
>>>>> @@ -12,6 +12,7 @@
>>>>>     #include <linux/init.h>
>>>>>     #include <linux/err.h>
>>>>>     #include <linux/i2c.h>
>>>>> +#include <linux/delay.h>
>>>>>     #include "pmbus.h"
>>>>>
>>>>>     enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
>>>>> @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>>>>>                 if (rv < 0)
>>>>>                         return rv;
>>>>>
>>>>> +             /* Firmware is sometimes not ready if we try and read the
>>>>
>>>> This is not the networking subsystem. Standard multi-line comments, please.
>>>
>>> Okay, let me fix that.
>>>
>>>>
>>>>> +              * data from the page immediately after setting. Maxim
>>>>> +              * recommends 50-100us delay.
>>>>> +              */
>>>>> +             fsleep(50);
>>>>
>>>> I would suggest to wait 100uS to be safe. The function is only called during probe,
>>>> so that should be ok.
>>>
>>> Yeah, I don't think they did strenuous measurement of these values on
>>> their end. We have been using this patch for 4-5 years now with
>>> seemingly good robustness on the 50us value. I just pulled up an old
>>> email from the vendor that gives this context.
>>>
>>>>
>>>> Is this a generic problem with this chip when changing pages ?
>>>
>>> I believe that is the case, but this patch is pretty old at this
>>> point. Is there somewhere to add in quirks for such chips that would
>>> allow us to build in such a delay?
>>>
>>
>> So far we only have delays for all accesses and for write operations.
>> See access_delay and write_delay in struct pmbus_data. If the problem
>> only affects page changes, we might have to add page_change_delay or
>> something similar. Alternatively, maybe we could just set write_delay.
>> If the chip has trouble with page changes, it might well be that it has
>> trouble with write operations in general.
>>
> 
> So I did some digging and asked the original contributors to the
> patch. It would appear that it's specifically an issue with this IC
> around page switches and not any arbitrary write command. There is an
> issue where it does not correctly respond to the second command issued
> after a PAGE switch occurs, if the commands come in too quickly. They
> believe it's an issue with max34451 (and other derivative ICs) not
> correctly clock stretching while the PAGE command is processed.
> 
> Let me know what approach you would prefer to take here. It seems like
> it would be most optimal to have a quirk specifically to delay
> commands after a PAGE.
> 

I think we should add page_change_delay to struct pmbus_data, plus its handling
in the pmbus core.

Thanks,
Guenter

