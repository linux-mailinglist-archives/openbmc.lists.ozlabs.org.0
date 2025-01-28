Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1FA20364
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 04:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhrWD1dg4z3bZ4
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 14:34:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738035269;
	cv=none; b=mvH2JM4X3ikq/dSaXC0oMNKuNsFNjKf1DIRsW9Bi4hCQjajfeO/0fDLxT/CyG4VwEO/gUiTaB+FTp3gE5oZ61vsdj21yoN+iZwlytxACvxidtyCO4ZuUXGBUUBFgxg8aRB4cJZOn9gQjLvWj4Q0/ht6dL4qTGBETNfRkhplBRa4MO7s0VJunZqu9pQusO0KN6VlhCH+bcEt7vP6QkXc69SSdPDbN7mXZa1GYZu+9k52DuNl85053fC7WCmv+SSNHE3lLS/MkUleKBNKEL2+N1KDbyQ3vQs5XxK7jYHdWvCVkHfpnlIGSogbYp4eG/CjotkfTN9Lk1sOvGdh1Nbsw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738035269; c=relaxed/relaxed;
	bh=doDS1Ex+NRiuf6+avUfXFW5qSGMVzArkbg9TLw/ICV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2F3aPG0lWDLfsCvoKxehcTpmfkP8DxzvtzE7tb+AQOFUQPW/Y7CP2Rx28bI66+KBSeVfOeCWvfZF8lQYFtSDcfnolxBLYBl6D1s7vD4bfondx7lsOTKkqC9Drj1amp8zSYP+qvGw2XjuY/hLfxN2ylItTJ1RaLHU1XKWoAqmRLB5pVqsmOYz0bE5MDP/K63bUzxp+byCP+oA9e1bGKNcFOpHDnMAXzetABmMJsiSsVrMZtWouKoUprLBAlCs4teNTo+ODVRUJ95Vf2jW7YOwGjLo11A6YFaqe6oCHgeSyR8EIRNbnzew+7rxlzUzcDNjIA9hgsSLihJxefk+CF4Sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGJr0AF+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aGJr0AF+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhrW66JbGz2xjL
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 14:34:26 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so7146841a91.2
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2025 19:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738035264; x=1738640064; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=doDS1Ex+NRiuf6+avUfXFW5qSGMVzArkbg9TLw/ICV8=;
        b=aGJr0AF+SOc5Ufp3tdyixXWnL9+YlongyYNqXt/1GwzixGJDuCJCqiJ5GxI1QqdyiC
         6GSFueWJjFMed5sNI1uNrvI5u7wrCvDGhUQHr80Z5UBTBvGTjLeGEskK9+A95tPQmdE/
         FMx19S2aVY8fJtd07EsyiKvZ0hmDmDQfZQ1Z7S1HksWGmPpIrDNCXvqTXrL58FWfjnGW
         OvxO+LHRpji7p+u68br0Ip9VbXh1q6ZaQ5PNq6bt96NO9j5CMyzGOkuz/VGCv6hKRsSX
         xj/jpXFguW9dhU+hoAt+60PUqhcdki29cIIvhNDCZOCP1AjtfWrH1JlY8idDou5lBBGz
         Jo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738035264; x=1738640064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doDS1Ex+NRiuf6+avUfXFW5qSGMVzArkbg9TLw/ICV8=;
        b=d1lqZvccPjCC+510cta9k+8dhwoozg2Iggt3UM02ywtBP5pQa/T98+a2KXjIfF9B2H
         os28alueyrwG49bcExNPiZr6z0ouowqSLuE9yqEhtJITs+DCKfMZUwTkY/vcXer1g7Bd
         HjYfvlXY2rtT5hoQtnP5yICTUaa5M/95sb5Ll7jPYNcCjL5LtPdPzAf5fc9DiaMy4GyO
         hWV0eIvPUhMM8pX9YBCd760B+q+joscnbM5TysLll2cZ+sBcXPTwW/3UlSSn5FO6iTmy
         o9qDkibHLVLHsc5b59cMpKhlCU65QFF0rz7/aFDT6d/91w0bQHKrTwCHPoqIHnrPrFWG
         26EA==
X-Forwarded-Encrypted: i=1; AJvYcCVW7X9h5Is4FnXhgtuUx5N1sqXe7cYNj7F2NT/yVwiMGiMJzz4kQBui1NSokTtYMwd2iZlTq6sB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzgY7HOKwqKX6cjaoeeUIas5XxEjY+P4wiU5VRynFvIg+dW9sT
	Aij0NxgZlPGR5EZ5/jd88CJT5g5HC+MWL/iFEZApjpSYOnC2kdgq
X-Gm-Gg: ASbGnctQN0DjUZ/OySdXaBpO+QVRHrgBEY5VsTPwv28MPrV9zTQ6XEOIYuSMsWvAOL4
	WwwNHbFfbF5wvIJ+iEMLHuUK+IBkCBBI+JPrdVGXna0+o9kfrBg6dHYrWdZQQGqEmcVus4torjy
	GlAS5zlT8toYG+55TCdkEF+gV51N+tk9QQTlFI4vTm4SWMyfLScsZpjawrv73DUHb3E9SEDJgBe
	jSP0IOl+f9BK5tBGwgJ58qtTaYM6D7Yy6rx1SLXLvwTuE3jrhoZrXFXyunxROdVDygDOhh3Sb0R
	mR7Yf20JcXhmY63P85aop8/aUV/robsswj3pOIuM4rT0PZFRrVmLN1htRgYL404F
X-Google-Smtp-Source: AGHT+IHxlXFkKRZG5NVu3qkkHeZu3JQGoWYIXJQ8OKeJ0rg7uk8OSoIHBVXjTMC4TqOqFsCjkq5dEw==
X-Received: by 2002:aa7:9a83:0:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-72daf97a541mr61104610b3a.14.1738035264264;
        Mon, 27 Jan 2025 19:34:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761172sm7972233b3a.110.2025.01.27.19.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 19:34:23 -0800 (PST)
Message-ID: <e352bf36-188b-4d2b-8b17-4a86d4d4345e@roeck-us.net>
Date: Mon, 27 Jan 2025 19:34:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
To: Paul Fertser <fercerpav@gmail.com>
References: <20250123122003.6010-1-fercerpav@gmail.com>
 <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
 <7ee2f237-2c41-4857-838b-12152bc226a9@roeck-us.net>
 <Z5fQqxmlr09M8wr8@home.paul.comp>
 <1dc793cd-d11d-441a-a734-465eb4872b2a@roeck-us.net>
 <Z5faC6M2MUj8KYoB@home.paul.comp>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z5faC6M2MUj8KYoB@home.paul.comp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "Winiarska, Iwona" <iwona.winiarska@intel.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "Solanki, Naresh" <naresh.solanki@9elements.com>, "joel@jms.id.au" <joel@jms.id.au>, "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Rudolph, Patrick" <patrick.rudolph@9elements.com>, "fr0st61te@gmail.com" <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/27/25 11:10, Paul Fertser wrote:
> On Mon, Jan 27, 2025 at 10:39:44AM -0800, Guenter Roeck wrote:
>> On 1/27/25 10:30, Paul Fertser wrote:
>>> Hi Guenter,
>>>
>>> On Mon, Jan 27, 2025 at 09:29:39AM -0800, Guenter Roeck wrote:
>>>> On 1/27/25 08:40, Winiarska, Iwona wrote:
>>>>> On Thu, 2025-01-23 at 15:20 +0300, Paul Fertser wrote:
>>>>>> When an Icelake or Sapphire Rapids CPU isn't providing the maximum and
>>>>>> critical thresholds for particular DIMM the driver should return an
>>>>>> error to the userspace instead of giving it stale (best case) or wrong
>>>>>> (the structure contains all zeros after kzalloc() call) data.
>>>>>>
>>>>>> The issue can be reproduced by binding the peci driver while the host is
>>>>>> fully booted and idle, this makes PECI interaction unreliable enough.
>>>>>>
>>>>>> Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
>>>>>> Fixes: 621995b6d795 ("hwmon: (peci/dimmtemp) Add Sapphire Rapids support")
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Signed-off-by: Paul Fertser <fercerpav@gmail.com>
>>>>>
>>>>> Hi!
>>>>>
>>>>> Thank you for the patch.
>>>>> Did you have a chance to test it with OpenBMC dbus-sensors?
>>>>> In general, the change looks okay to me, but since it modifies the behavior
>>>>> (applications will need to handle this, and returning an error will happen more
>>>>> often) we need to confirm that it does not cause any regressions for userspace.
>>>>>
>>>>
>>>> I would also like to understand if the error is temporary or permanent.
>>>> If it is permanent, the attributes should not be created in the first
>>>> place. It does not make sense to have limit attributes which always report
>>>> -ENODATA.
>>>
>>> The error is temporary. The underlying reason is that when host CPUs
>>> go to deep enough idle sleep state (probably C6) they stop responding
>>> to PECI requests from BMC. Once something starts running the CPU
>>> leaves C6 and starts responding and all the temperature data
>>> (including the thresholds) becomes available again.
>>>
>>
>> Thanks.
>>
>> Next question: Is there evidence that the thresholds change while the CPU
>> is in a deep sleep state (or, in other words, that they are indeed stale) ?
>> Because if not it would be (much) better to only report -ENODATA if the
>> thresholds are uninitialized, and it would be even better than that if the
>> limits are read during initialization (and not updated at all) if they do
>> not change dynamically.
> 
>>From BMC point of view when getting a timeout there is little
> difference between the host not answering being in idle deep sleep
> state and between host being completely powered off. Now I can imagine
> a server system where BMC keeps running and the server has its DIMMs
> physically changed to a different model with different threshold.
> 
> Whether it's realistic scenario and whether it's worth caching the
> thresholds in the kernel I hope Iwona can clarify. In my current
> opinion the added complexity isn't worth it, the PECI operation needs
> to be reliable enough anyway for BMC to monitor at least the CPU
> temperatures once a second to feed this essential data to the cooling
> fans control loop. And if we can read CPU temperatures we can also
> read DIMM thresholds when we need them and worse case retry a few
> times while starting up the daemon.
> 

Makes sense.

Applied.

Thanks,
Guenter
