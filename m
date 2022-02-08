Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2903F4AD51F
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 10:39:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtHzQ6m58z3bTt
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 20:39:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=TiP5KvuR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=TiP5KvuR; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtHz23fzcz2x9F
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 20:39:26 +1100 (AEDT)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 475A43F199
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644313164;
 bh=AD+JYq4vlLNE7/XM0yuo/Yy4HxbXjNKnvOPIiUzX7yQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=TiP5KvuRAEbNhDO7iceTX3QLQnKIFRTAVtVHN0paSFJTRZvjZR8/6x3Y3A/PJnz0R
 Ib/36ADpCD7HObJ3E7iqG6HvHoWEo1REU6VLQat2WVr0mm2ex3niLutBm5reDjRnJp
 wBpMghvuXnRz3qjxIzAinNh/nnhwXbM+UWDJBPfn2lLxkSn0dcbVPHTCxw94STsdc8
 JH1cWIm9MRrmttrRNb9spzmykr3eYrxqk+L7SnJjJ7rcypGtvzi7Tf19IeKtSeA2dq
 xOYS7j8Dz9oGFQNMpPi0m4R9FeiPV2qJeg2YIGWHC3vMTmoG3Zbgya6GTKUucKcPB1
 mh3ZwJG2JUWWQ==
Received: by mail-wr1-f71.google.com with SMTP id
 j8-20020adfc688000000b001e3322ced69so1053764wrg.13
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 01:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AD+JYq4vlLNE7/XM0yuo/Yy4HxbXjNKnvOPIiUzX7yQ=;
 b=Dq8RhZ+QjbBvQggHtV3PA8YbtDKj2+P8NCny7yEhTeHhkf4SpnqoHE7+poW42XxqG2
 2hUdyV66/AqptmoUUjYkUs94UDrLgB/KxZIKE9ClfVbVNBSP3IvwV3aeU0pr+QmZ0uZK
 NhykIihmRel/OneaL590VYOOqZhcGUtwl3gI4xzfUXfDFas07JPrz7X7sIcLRrCUHWK9
 THat7wbbC3J+CcaQILCT13axooTnt3AvSmpLLS8A50XvEuqVvlbmwhLSJ4/Bnz21b48Q
 d5/59pOg9LqVjRM27UM24zqiyaE/EV6nqStgH5FQuMNiH99UMTuXC67fc1giqBMkkccC
 wrOQ==
X-Gm-Message-State: AOAM531LjOJoqKyyIqkX6IY/ovGxjffjzbvezz7KFat0o/+4E3FqGLCF
 4nHjWMkwHcpr75zDpPWivwTZr3aWWhtPKSZm1wu7U5HUv1EqOjnxzU1CjOnAtGrZqYdaqGChXC2
 ZOI57xdgI6exothklSd/pwkWl+5CKbIPcg0QK
X-Received: by 2002:a17:907:3f09:: with SMTP id
 hq9mr1728566ejc.32.1644313153093; 
 Tue, 08 Feb 2022 01:39:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVNi8Hcf5UL2UM3LQyY6wyiCukRH7Wjy55MvtQN7Bt0lZ38AXPg0LCF1i3MjzhsdsJiSZ3Yg==
X-Received: by 2002:a17:907:3f09:: with SMTP id
 hq9mr1728543ejc.32.1644313152859; 
 Tue, 08 Feb 2022 01:39:12 -0800 (PST)
Received: from [192.168.0.93] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id p21sm719810edu.107.2022.02.08.01.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 01:39:12 -0800 (PST)
Message-ID: <ecb25821-3410-0f0e-5195-ee72c663556b@canonical.com>
Date: Tue, 8 Feb 2022 10:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Content-Language: en-US
To: Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
 <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
 <CAKKbWA6qZ1ytKS5V6tLxQgzQefhz7mTg3Vi_tPDM2p=N7O+8Vg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAKKbWA6qZ1ytKS5V6tLxQgzQefhz7mTg3Vi_tPDM2p=N7O+8Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com, bence98@sch.bme.hu,
 Arnd Bergmann <arnd@arndb.de>, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 semen.protsenko@linaro.org, jie.deng@intel.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 08/02/2022 10:31, Avi Fishman wrote:
> On Tue, Feb 8, 2022 at 11:22 AM Tali Perry <tali.perry1@gmail.com> wrote:
>>
>>> On 08/02/2022 09:51, Tali Perry wrote:
>>>>> On 08/02/2022 08:14, Tali Perry wrote:
>>>>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>>>>>
>>>>>>> On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>>>
>>>>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>>>>>
>>>>>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>>>>>
>>>>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>>>>>> driver")
>>>>>>>>
>>>>>>>> It's not really a bug fix, but rather an additional feature.
>>>>>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>>>>>
>>>>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>>>>>> ---
>>>>>>>> [...]
>>>>>>>>>  /* init register and default value required to enable module */
>>>>>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>>>>>> +#else
>>>>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>>>>>> +#endif
>>>>>>>>
>>>>>>>> This is going to cause problems when someone tries to compile a kernel
>>>>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>>>>>> only work on NPCM7xx).
>>>>>>>
>>>>>>> Yes, good catch.
>>>>>>>
>>>>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this looks like an invalid code. How such code is supposed to work on multiplatform kernel?
>>>>>>>
>>>>>>
>>>>>> NPCM7xx and NPCM8xx are very different devices.
>>>>>> They share same driver sources for some of the modules but it's not ABI.
>>>>>> Users cannot compile a single kernel with two separate DTS.
>>>>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>>>>>> and the NPCM8xx has 32 bytes HW FIFO.
>>>>>> This also means that registers fields are slightly different.
>>>>>> For init data we can move it to the DTS, but register field sizes
>>>>>> can't be handled with this approach.
>>>>>>
>>>>>
>>>>> What do you mean they cannot compile a kernel with different DTS? Of
>>>>> course they can - when we talk about multiplatform sub-architectures!
>>>>> Maybe there is something specific in NPCMxxx which stops it but then it
>>>>> should not be marked multiplatform.
>>>>>
>>>>
>>>>
>>>> NCPM7xx is ARM32 bit (dual core Cortex A9)
>>>> NPCM8xx is ARM64 bit (quad core Cortex A35)
>>>>
>>>> They have completely different architecture so not ABI compliant.
>>>> I2C module is similar, but the devices are quite different and have
>>>> separate architectures.
>>>
>>> OK, in such case usually you indeed can't have both. :)
>>>
>>>> Sorry for the confusion.
>>>> This is the first patch we try to upstream for NPCM8xx.
>>>> In the coming weeks we will upstream the architecture of NPCM8xx as well.
>>>
>>> Still, ARCH_XXX should not be hard-coded in the drivers to change the
>>> driver's behavior, even if driver won't be used simultaneously. It
>>> breaks all design principles and prevents any further re-use if a new
>>> use case appears.
>>>
>>> You can use "ifdef ARCH_XXX" to skip building of some parts of the
>>> driver, but it's not the case here.
>>>
>>
>> Correct, the main change is in FIFO size:
>> +#ifdef CONFIG_ARCH_NPCM7XX
>> #define I2C_HW_FIFO_SIZE               16
>> +#else
>> +#define I2C_HW_FIFO_SIZE               32
>> +#endif /* CONFIG_ARCH_NPCM7XX */
>>
>> NPCM7XX will always have 16 bytes, all the next gens will have 32.
>>
>> This impact some registers sizes, like this one:
>>
>> +#ifdef CONFIG_ARCH_NPCM7XX
>> #define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(4, 0)
>> +#else
>> +#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(5, 0)
>> +#endif /*CONFIG_ARCH_NPCM7XX*/
>>
>> For this, the FIFO size should be defined before compilation.
>> I also don't want to let users select FIFO size per architecture.
>> NPCM7XX has 16, NPCM8XX has 32. This is not a user selection.
>> It's part of the arch.
> 
> Will this be a better approach to add in the Kconfig file a legacy mode:
> config I2C_NPCM_VER_89
>       bool "support legacy i2c version 0x89 of npcm"
>       depends on ARCH_NPCM7XX
>       default y
>       help
>         This limits the support to legacy i2c version 0x89 of npcm
>         Will be only 16 bytes fifo and will not include other new features
> 
> config I2C_NPCM
>       tristate "Nuvoton I2C Controller"
>       depends on ARCH_NPCM || COMPILE_TEST
>       select I2C_NPCM_VER_89 if ARCH_NPCM7XX
>       help
>         If you say yes to this option, support will be included for the
>         Nuvoton I2C controller, which is available on the NPCM BMC
>         controllers.
>         Driver can also support slave mode (select I2C_SLAVE).
> 
> and in the code replace:
> #ifdef CONFIG_ARCH_NPCM7XX
> with
> #ifdef CONFIG_I2C_NPCM_VER_89

This looks better but it is still the same approach - embedding ifdefs
to control the code flow and logic. Only naming is different. Whenever
you come with new I2C block for old or new architecture, you will have
the same problem. We solved such problems this already - quirks or
per-chip-drvdata - so here should be the same.

Even if the code does not end up in the same binary, it should be
designed properly. Because in the future it might end-up in same binary.

Everyone thought there will be no multiplatform ARMv7 so entire
arch/arm/mach-* was written exactly like that. And what? It was a lot of
effort to all of us to fix that mistakes. ARMv8 can work in 32-bit, so
who knows... Just do it properly.

Best regards,
Krzysztof
