Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93869155C
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 01:27:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCZLn6cSXz3cT4
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 11:27:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CgvAKwsQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CgvAKwsQ;
	dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCZL91sjKz3bZl
	for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2023 11:26:55 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id e12-20020a0568301e4c00b0068bc93e7e34so1111699otj.4
        for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2023 16:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=p1txkHnuKSOjGdyBZQoySFf/v2PBhhPlCu4BgK/ArcA=;
        b=CgvAKwsQNdMdaFssg/5cjr0hLPANQ/WEK0QUvE0lLAlS7ERNf8yXbBWRG13Nkr6g1r
         u+4cl9fcYEC+HBCLjy3zfgiDBEwBfTm+/eRzBgmXOmSif8I1tfYqv8UkgcBEBShMvDIm
         fuQl9ZhePWiW0Dc9ohZ2YCF/QGkf62WHveTaUs+DFsUItb2aNY6aJX1saEkQlPpc2xo6
         fQ390QLVzlzKRIiIJ8QRoAGE2yGOvVWBlXmv9VwfDbQMKobWmv0lSbevC8v06eA2dzcX
         crPOLiDqlTzOrCjsDa4Lt8p1W1a2m+3BTywiJg8TSNVAFabkkQqcPGG/DvWjvc8XjAlH
         lspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1txkHnuKSOjGdyBZQoySFf/v2PBhhPlCu4BgK/ArcA=;
        b=GnrYtX5pq01J2wRL8axQYzFmZutrAq9xa02sjV2seD1hVEHirwJZoB00Y9lFH3iPVZ
         r0dLeXPSA06S34oGDdOs7OOBRlH04PSI8tiK7E008nTGWFdlogIHFyIDILZFuvXEj3cs
         cJL1eEnad7j/h261Fjzq0P49xS+flzE4/9Wup8MAR83KjfNIH6RSo/C+79KjtmSCtPaA
         T8DGfvGsdVIRQ1BZvb6Zmrd59OR9W2mlZGaXpAvAl4u3W4atVBl9jKeAlK26SBtoki7E
         e/o3iVP+9FewdOksJMIQaw87eUA7Dd5VxEhLJTWCnOzHR3ad0BsKh6i7sIaEbtbfUIJo
         EG1w==
X-Gm-Message-State: AO0yUKXug50C/La1iS6tKyfbO83uW3GY+MqBJfZuKdwoh85d3R451Mdb
	GYHyTZkBgi5HbtNnwSoNChQ=
X-Google-Smtp-Source: AK7set+EgAiB19sIjHFTYzUu2g6jlAFcfuRW9phS478zxSN+hBINphxNp3evPBkaxllmpv/ADYZa1A==
X-Received: by 2002:a9d:4e5:0:b0:68b:dc52:10f9 with SMTP id 92-20020a9d04e5000000b0068bdc5210f9mr7664962otm.5.1675988810968;
        Thu, 09 Feb 2023 16:26:50 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d641a000000b0068bd9a6d644sm1420585otl.23.2023.02.09.16.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 16:26:50 -0800 (PST)
Message-ID: <97485a97-08c4-917b-1b8d-8102a8575a58@roeck-us.net>
Date: Thu, 9 Feb 2023 16:26:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] hwmon: (peci/cputemp) Number cores as seen by host
 system
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
References: <20230209011632.32668-1-zev@bewilderbeest.net>
 <20230209175001.GA667937@roeck-us.net>
 <Y+WMcCukyTvPcN2F@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y+WMcCukyTvPcN2F@hatter.bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jean Delvare <jdelvare@suse.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/9/23 16:14, Zev Weiss wrote:
> On Thu, Feb 09, 2023 at 09:50:01AM PST, Guenter Roeck wrote:
>> On Wed, Feb 08, 2023 at 05:16:32PM -0800, Zev Weiss wrote:
>>> While porting OpenBMC to a new platform with a Xeon Gold 6314U CPU
>>> (Ice Lake, 32 cores), I discovered that the core numbering used by the
>>> PECI interface appears to correspond to the cores that are present in
>>> the physical silicon, rather than those that are actually enabled and
>>> usable by the host OS (i.e. it includes cores that the chip was
>>> manufactured with but later had fused off).
>>>
>>> Thus far the cputemp driver has transparently exposed that numbering
>>> to userspace in its 'tempX_label' sysfs files, making the core numbers
>>> it reported not align with the core numbering used by the host system,
>>> which seems like an unfortunate source of confusion.
>>>
>>> We can instead use a separate counter to label the cores in a
>>> contiguous fashion (0 through numcores-1) so that the core numbering
>>> reported by the PECI cputemp driver matches the numbering seen by the
>>> host.
>>>
>>
>> I don't really have an opinion if this change is desirable or not.
>> I suspect one could argue either way. I'l definitely want to see
>> feedback from others. Any comments or thoughts, anyone ?
>>
> 
> Agreed, I'd definitely like to get some input from Intel folks on this.
> 
> Though since I realize my initial email didn't quite explain this explicitly, I should probably clarify with an example how weird the numbering can get with the existing code -- on the 32-core CPU I'm working with at the moment, the tempX_label files produce the following core numbers:
> 
>      Core 0
>      Core 1
>      Core 2
>      Core 3
>      Core 4
>      Core 5
>      Core 6
>      Core 7
>      Core 8
>      Core 9
>      Core 11
>      Core 12
>      Core 13
>      Core 14
>      Core 15
>      Core 18
>      Core 20
>      Core 22
>      Core 23
>      Core 24
>      Core 26
>      Core 27
>      Core 28
>      Core 29
>      Core 30
>      Core 31
>      Core 33
>      Core 34
>      Core 35
>      Core 36
>      Core 38
>      Core 39
> 
> i.e. it's not just a different permutation of the expected core numbers, we end up with gaps (e.g. the nonexistence of core 10), and core numbers well in excess of the number of cores the processor really "has" (e.g. number 39) -- all of which seems like a rather confusing thing to see in your BMC's sensor readings.
> 

Sure, but what do you see with /proc/cpuinfo and with coretemp
on the host ? It might be even more confusing if the core numbers
reported by the peci driver don't match the core numbers provided
by other tools.

Guenter

