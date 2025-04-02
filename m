Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B9A7858D
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 02:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS58f46y4z3c8x
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 11:19:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743553163;
	cv=none; b=ZCLoFPO1RCOBdroQDq+iV77WI/9Xbc54QpI75662u/gDslX23QjHZqpI0CFSgoNVg6tg247OHYlvZwUgFO+L4Tgyt4rqxVxLl31xMTvzhCfacHp1a3jhOyusjcLnV161fwjx0umQwPlAT7o/mB1hdKC1Qz1v8MhXdhMewc1Te2YXtJCpdBmOMR+g82aNK8qjIR+Uu72o4ucNvYQpTnzDgKqjkGAbeoETBLYccg6cX3qV7R+DIZGrEqZaVTAD6bHaZJPsH4rc8mWopCwsbHUXE3PZnXoC4KLMNtRUf/g8oTNJcd2huBYJh6nq4fKPBHTVkN8YKFIpwWwvu5B59dMLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743553163; c=relaxed/relaxed;
	bh=w0OuXo81szmST2NQBpsdRDPeT/B1BcrZH/KOhIskzf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BA2UQ0h+olUwonCuqfSP8btZTiuGj2w4rgYP5bSpUyQ2OQDbSpQr34mUDcC/7UoXryrlI2bHiIJM38QUA97eo1BaFW2WCcGHJ+CVckCPM/Y6uxauGY6dMOz4T3fVAIEX4yItkicFpMqV1ONu9rnOdlbARGnqyt+orC1LVg8ZkvB3CyY2O749Zac8CY3HlYL9VHlJqI9rz12xOXMdUiJoAz2EEnKwYokEO850xvF2fRV2T23UFbbkNU7K+1iSZsBOMQpTmNuizYFfJp/cirUeKbIDSADooAF0T5ktKnxnVbMi7tnaa5jeRGkevVsmF/bCQVpWvfD8q8qrwjpHsVJy7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YBNSznDh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YBNSznDh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS58P6j8qz2yr8
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 11:19:16 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224341bbc1dso104584735ad.3
        for <openbmc@lists.ozlabs.org>; Tue, 01 Apr 2025 17:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743553155; x=1744157955; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w0OuXo81szmST2NQBpsdRDPeT/B1BcrZH/KOhIskzf8=;
        b=YBNSznDhuVO6spWRrgl7E80tf+Tbhut4RSD2gn+tKRos2vyOoNXr83eIBFrbbDxeaL
         ggDdLLhW1+yPiADz0LershRWk/Z4GXDSs8Zai/QdEuUjdDeYDQExev1X7BR5IKCtVRy+
         sHGv03xWvcHHcHw9Q7Soz9SEa/z8w7EL890njN0lkospc5bWsrff2ThzzeyBz7fRLTWG
         EjUllU7K4/axyrsOEqt1IxjJwPLexzY6eKkuna4D+DkjuxbJC5kYz4/7Y41win5yU7LX
         z7i9FS2Mx+3i6ndQRtm00IWJKBj16zZ8A81jgxSalOknb3MruG9gDjNrWunmpJcHnHUQ
         Fwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743553155; x=1744157955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0OuXo81szmST2NQBpsdRDPeT/B1BcrZH/KOhIskzf8=;
        b=Fwme4sojnIyRfN/gzdLN9m0G8WCYEvvHPZBWNl1lt4Kj9PRaahS64WkIeOrGkgiS2P
         kp2CaneR2NHxYCaf2xNx1RGktbX1QMNDXumMiuCbcCrfhqwGYMAgnElCGYV8kKTziXvh
         AyMKXvak1DNnxtX6rRvmeUNSFUfRK/0lDnpvpdCE4lum/aBo8ojEgF6ib6tDzNqNvxYY
         qtPXW/tYrSxhusi+jtvmv3DTYbD8ClCyVyQUp6a1ULaHi1bx3cgCmEEn/UMKvRjEIRPa
         oCVDpX0s53fDQJijcG9+EF5lpSEB+lCOhSSt31qiDFdtwJycidVA9ZDcsPXX2QxM9wTO
         66XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrZTxElitpvz+QdOd7VV4q0w+dRRUUWLnuCZxlsAoqYy3c8jrkZYa/Rp73hkEbQPxo1vP1kpF9@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygT5hxfJPUBtmaqCckGNEXP/P8FTo/PiFGayI37ZdphpAkhIS3
	ICsry4ENDc4VG6zEmIpdt6GFC7l/aLat8bjiBZ3uFB+wFBfaZCWO
X-Gm-Gg: ASbGnctrh6l6yA/BMxJIaPEqE2I6hLDndE4iv+puXzQhYe68Bs5LOrIIRxIgZCCIi1x
	JgG6qZC35x5pY1Yo+wIY/ottAqrH4AKd1QseGD6NfqKqkvaR3tmQhhmwcAP2rStAqoReOsjikTO
	ieaqaAQ+C/y2W43Twuy0+ijj7t0oMj16Ca5Z8wrF021s7tF6Iw52enn6Lgw6nPcfK1E+x1a3C1P
	gkXGMfFn627yEUunf9eal6IyOSQ0F+F7NySrZKcb3w4uw1+Ogsz7NSXitlrmsJtmnMdiN7TuouV
	5v6zV54fyHE4ndvN4kJ1eBXf2FMq4Sp0wgTeonix2NyTKZBJJx2o2XY1eeYeKi3WEA+3D6no3f8
	GHT9StbhNWuP5a8axaA==
X-Google-Smtp-Source: AGHT+IHH6ZUYp4yQWN2YMFakZmCz4t5heWPmMTPxGuco+vUEUX8dD8PdstOQqlQBr86QeW72DQcVrw==
X-Received: by 2002:a17:902:ecd1:b0:223:35cb:e421 with SMTP id d9443c01a7336-2296c86c830mr5478745ad.49.1743553154601;
        Tue, 01 Apr 2025 17:19:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2230dsm9604317b3a.40.2025.04.01.17.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 17:19:14 -0700 (PDT)
Message-ID: <84d37c25-197b-44b4-b181-f71f5e8b81d8@roeck-us.net>
Date: Tue, 1 Apr 2025 17:19:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: max34451: Workaround for lost page
To: William Kennington <william@wkennington.com>
References: <20250401220850.3189582-1-william@wkennington.com>
 <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
 <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
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

On 4/1/25 15:55, William Kennington wrote:
> On Tue, Apr 1, 2025 at 3:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 4/1/25 15:08, William A. Kennington III wrote:
>>> When requesting new pages from the max34451 we sometimes see that the
>>> firmware doesn't update the page on the max34451 side fast enough. This
>>> results in the kernel receiving data for a different page than what it
>>> expects.
>>>
>>> To remedy this, the manufacturer recommends we wait 50-100us until
>>> the firmware should be ready with the new page.
>>>
>>> Signed-off-by: William A. Kennington III <william@wkennington.com>
>>> ---
>>>    drivers/hwmon/pmbus/max34440.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
>>> index c9dda33831ff..ac3a26f7cff3 100644
>>> --- a/drivers/hwmon/pmbus/max34440.c
>>> +++ b/drivers/hwmon/pmbus/max34440.c
>>> @@ -12,6 +12,7 @@
>>>    #include <linux/init.h>
>>>    #include <linux/err.h>
>>>    #include <linux/i2c.h>
>>> +#include <linux/delay.h>
>>>    #include "pmbus.h"
>>>
>>>    enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
>>> @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>>>                if (rv < 0)
>>>                        return rv;
>>>
>>> +             /* Firmware is sometimes not ready if we try and read the
>>
>> This is not the networking subsystem. Standard multi-line comments, please.
> 
> Okay, let me fix that.
> 
>>
>>> +              * data from the page immediately after setting. Maxim
>>> +              * recommends 50-100us delay.
>>> +              */
>>> +             fsleep(50);
>>
>> I would suggest to wait 100uS to be safe. The function is only called during probe,
>> so that should be ok.
> 
> Yeah, I don't think they did strenuous measurement of these values on
> their end. We have been using this patch for 4-5 years now with
> seemingly good robustness on the 50us value. I just pulled up an old
> email from the vendor that gives this context.
> 
>>
>> Is this a generic problem with this chip when changing pages ?
> 
> I believe that is the case, but this patch is pretty old at this
> point. Is there somewhere to add in quirks for such chips that would
> allow us to build in such a delay?
> 

So far we only have delays for all accesses and for write operations.
See access_delay and write_delay in struct pmbus_data. If the problem
only affects page changes, we might have to add page_change_delay or
something similar. Alternatively, maybe we could just set write_delay.
If the chip has trouble with page changes, it might well be that it has
trouble with write operations in general.

Thanks,
Guenter

