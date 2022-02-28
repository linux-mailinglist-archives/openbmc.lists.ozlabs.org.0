Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2C54C7073
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 16:16:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6kVm4Tnfz3bT6
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 02:16:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n5OSBhcu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29;
 helo=mail-oo1-xc29.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n5OSBhcu; dkim-atps=neutral
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6kVL3NYVz2yV7
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 02:16:09 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id
 n5-20020a4a9545000000b0031d45a442feso11518784ooi.3
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 07:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=GXTP6WRaYgXcjvYzSElyj285X0K6M37vtW5QgfC8A08=;
 b=n5OSBhcuUJpDIK00HLJQdrhKgpinMQfw9ndbqNSrlPr/FF5I+FhRy7idkGL4F4U2jp
 YiB32put77mHt0HmqFspvvTDWEJtx2BvxE7YWG7yB1AwtwWznsB0TiSez0eXFCGQwPoT
 gmkjlZAaM8GY6cByvZ+xAR9T0S9nKMDU6BXwaDIby//LAgEF4+b0/sLB9z25IyRCpqbs
 mNOlzoPHMaoUSI2YYFCJVIJ6ENTw11q+oOLQh5omGSoVofubyUZFMqyiI5ztwkCtDAAi
 Vq8t3YCyWNtr1ZNPES/DXq1FVXAEVz/rQRpEFYz+dLcJTCQPzwVQPLxKvm5wmLs81pbZ
 5tvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=GXTP6WRaYgXcjvYzSElyj285X0K6M37vtW5QgfC8A08=;
 b=4rDzGzff+OKvB6H2nxjgv/7oUXr0tQGQNhN6uRQagy9ixbEQbgU8TXIyB6VqfpqiBI
 tRUU0mAenOW/YxjgDFhEpCyQQB5+dLXEORfBzXDyiLZOPcGTXZf2IjYs8Rq8nVK/OShE
 AVMjnf+mlSWYoohQmheMEMw4JBnqB6wCDxgUjKEFwVbrwYE6ljGJE1SXUTftEuG5bRj+
 Ksm07tCS/VH/TpAbevcs+87ThrUeZGUPRwX+N/JDT3SYCSGYhM2oeR3GpF401olfe3ZX
 lhr5L6XxmclS+oqzM6SIhKTRZ+4kuCyRgyINtyG9RFIfOewYm+Az02XkFvOYObFnbzQ8
 Ketg==
X-Gm-Message-State: AOAM5319c7lycsdht+1Y3VNK7dHjkAq+5TAxdhQJ7b4yhA07YLqcsDhj
 OM4oPdVae3R+oB03F8d4dyK4AvPg4t4=
X-Google-Smtp-Source: ABdhPJymkIo3X9fEwZ10x1T9p+r03XqFNxRjtydoOvAx+l0L+a4gfHrr5Bv2TG77OociyT6PgACJ0w==
X-Received: by 2002:a05:6870:1704:b0:d7:11b7:5ec with SMTP id
 h4-20020a056870170400b000d711b705ecmr4368841oae.151.1646061367103; 
 Mon, 28 Feb 2022 07:16:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 be40-20020a05680821a800b002d06df28063sm6598421oib.5.2022.02.28.07.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 07:16:06 -0800 (PST)
Message-ID: <314f6804-b4f4-9668-613d-7481d60b4abb@roeck-us.net>
Date: Mon, 28 Feb 2022 07:16:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
 <20220226133047.6226-2-zev@bewilderbeest.net>
 <b4a1d4e1-a7b9-00f9-75d2-56003138883f@roeck-us.net>
 <YhyGp0zu9OBOWt/M@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/5] hwmon: (nct6775) Rearrange attr-group initialization
In-Reply-To: <YhyGp0zu9OBOWt/M@hatter.bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/28/22 00:24, Zev Weiss wrote:
> On Sun, Feb 27, 2022 at 07:01:32AM PST, Guenter Roeck wrote:
>> On 2/26/22 05:30, Zev Weiss wrote:
>>> We now track the number of attribute groups in nct6775_data, as a
>>> measure to simplify handling differences in the set of enabled
>>> attribute groups between nct6775 drivers (platform & i2c).  As a side
>>> effect, we also reduce the amount of IS_ERR()/PTR_ERR() boilerplate a
>>> bit.
>>>
>>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>> ---
>>>  drivers/hwmon/nct6775.c | 84 ++++++++++++++++++++---------------------
>>>  1 file changed, 42 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
>>> index 2b91f7e05126..139b2fe5ca4d 100644
>>> --- a/drivers/hwmon/nct6775.c
>>> +++ b/drivers/hwmon/nct6775.c
>>> @@ -1198,6 +1198,7 @@ struct nct6775_data {
>>>      const char *name;
>>>      const struct attribute_group *groups[7];
>>> +    u8 num_groups;
>>>      u16 reg_temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
>>>                      * 3=temp_crit, 4=temp_lcrit
>>> @@ -1405,10 +1406,18 @@ struct sensor_template_group {
>>>      int base;
>>>  };
>>> -static struct attribute_group *
>>> -nct6775_create_attr_group(struct device *dev,
>>> -              const struct sensor_template_group *tg,
>>> -              int repeat)
>>> +static int nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
>>> +{
>>> +    /* Need to leave a NULL terminator at the end of data->groups */
>>> +    if (WARN_ON(data->num_groups == ARRAY_SIZE(data->groups) - 1))
>>> +        return -ENOSPC;
>>> +
>>
>> At work we are struggling with a whopping 500,000+ (!) WARN backtraces
>> _each day_. I would be happy if you send me patches removing some of
>> those, but I am not inclined to accept patches adding them. If people
>> don't notice that the driver doesn't load, they won't notice the warning
>> either, and it will just add to all the other warning backtrace noise.
>>
> 
> Okay, I can remove that -- I mostly just added it out of concern that "no space left on device" would be a fairly confusing error for someone to potentially end up with modprobe reporting, and some further indication of what went wrong could perhaps make it less mystifying (though yes, with any luck it can hopefully remain unreachable in practice as long as data->groups gets expanded when needed).
> 
> I'd certainly also be open to suggestions of a more appropriate errno value to return in that case, though I couldn't find one that seemed clearly better to me.  ENOMEM seemed vaguely more appropriate in some ways given that it's an in-memory array that's full rather than a storage device, but it's also definitely not the usual ENOMEM meaning of a dynamic allocation failure due to memory pressure, so...(shrug).  I think FreedBSD's got an EDOOFUS errno value, but as far as I can see Linux doesn't have one for indicating a purely internal error like this.
> 

If this is encountered, it would indicate a severe programming error.
What _user_ do you expect to see that error message ? If this makes it
into a release, it only means that the code was not tested well enough,
since any even casual testing should have exposed it.

I'd even argue that the check is unnecessary to start with because
the number of required groups is well known in advance.

Anyway, if you don't like ENOSPC, there is also ENOBUFS as possible
alternative.

Guenter
