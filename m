Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C64AD4DE
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 10:30:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtHmk5pRrz3bVf
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 20:30:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=ITtn5sfY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=ITtn5sfY; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtHmH09wwz30Pf
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 20:30:05 +1100 (AEDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B45293F308
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644312599;
 bh=Ui/6owStfQRYY+YD9HVYrRMZ2Sy2yY8RPY3JJ3hVfCQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ITtn5sfYJgp5N91qLhkchz+VmPw5Hz45mh4PT+EomLYX5JSC4ID6hxeCQBgRy2skT
 lqvf4Nedo9EckFBQfcU0BEM1jPuNpB3oTeXXYF6gpnCKwvaxUPMqd8AVta5WWpwkPJ
 S+e+LtiP13ZYK4BIYSbocn0aCrXvRtmxE3aAp+qbpu3sAJfNml44rHdmbdNcdSxlf2
 EqFRX0WJLjgBJb0LbyrJT7NawxCeNyVw1Xh4MEEpBJq6LH3WwZNXrtN4KB7wEdB8Eb
 M/9U6nRA0lyHbTS6ITD3UJPc1og3ozTKIiwW2/pBJR4kDgzCPabuUAfUoQ+ppHf3po
 bYKVeRlJEOEew==
Received: by mail-ed1-f70.google.com with SMTP id
 n7-20020a05640205c700b0040b7be76147so9382834edx.10
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 01:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ui/6owStfQRYY+YD9HVYrRMZ2Sy2yY8RPY3JJ3hVfCQ=;
 b=yBY2esK7JYtsWjiHb8DUATg6o36buvmqPMXkjrrSTd5aWIk59jnvSnhSJLTdECcL/b
 H+4YegqSxHsQstoH9pfQfENxwIBFzEsbmPVBdDdOyxIBDtv+GrehrRRSoRzYjrCuC60h
 y7MyQXlRPsDZ2SEScxUPhQ5AFS3aptQ3HfqyK1sEMoibvzKQFA/q+rKBaHb21OZU35Uz
 8VK25rigS7gzomNpqB8w5X/yf4IX6XazD72wXK17KSIRVZX8NDA7dQIJe+KXkH2CyviZ
 oqBGIwLHwUzhG3s9uWE8QNCl6Dqx//ciPPhMsDVnhoo56RVg4vDEztaJ/vxO33Wm1/Sp
 4Wpg==
X-Gm-Message-State: AOAM531e9IVkQIUqoOE4vJyYsDHTG8sbfY1bIqFKOHNkmO0rwGpruggx
 KiqBWPFe5kz2oW2VwBM84vC1LTDUZqdkCLylinq1VOT1ZQ/ec9hD0ULp1sXTmZIf0bM+B23jViI
 gFuDvrSsfb3ZxSFm2cipeXXBhYr9WQqBOBe3C
X-Received: by 2002:a17:907:7246:: with SMTP id
 ds6mr2993406ejc.762.1644312588571; 
 Tue, 08 Feb 2022 01:29:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIIcu9utR18wxFBpEWYCI6O+IiGR9UvBn6XHif4bRYF5ZPoy1sYBX8oCI5IIrFXAlpCxsc7w==
X-Received: by 2002:a17:907:7246:: with SMTP id
 ds6mr2993375ejc.762.1644312588328; 
 Tue, 08 Feb 2022 01:29:48 -0800 (PST)
Received: from [192.168.0.93] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t22sm6339403edv.105.2022.02.08.01.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 01:29:47 -0800 (PST)
Message-ID: <36cc734d-2120-5834-27a9-5bd37e14d862@canonical.com>
Date: Tue, 8 Feb 2022 10:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Content-Language: en-US
To: Tali Perry <tali.perry1@gmail.com>, Tyrone Ting <warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
 <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
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
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 08/02/2022 10:22, Tali Perry wrote:
>> On 08/02/2022 09:51, Tali Perry wrote:
>>>> On 08/02/2022 08:14, Tali Perry wrote:
>>>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>>>>
>>>>>> On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>>
>>>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>>>>
>>>>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>>>>
>>>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>>>>> driver")
>>>>>>>
>>>>>>> It's not really a bug fix, but rather an additional feature.
>>>>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>>>>
>>>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>>>>> ---
>>>>>>> [...]
>>>>>>>>  /* init register and default value required to enable module */
>>>>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>>>>> +#else
>>>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>>>>> +#endif
>>>>>>>
>>>>>>> This is going to cause problems when someone tries to compile a kernel
>>>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>>>>> only work on NPCM7xx).
>>>>>>
>>>>>> Yes, good catch.
>>>>>>
>>>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this looks like an invalid code. How such code is supposed to work on multiplatform kernel?
>>>>>>
>>>>>
>>>>> NPCM7xx and NPCM8xx are very different devices.
>>>>> They share same driver sources for some of the modules but it's not ABI.
>>>>> Users cannot compile a single kernel with two separate DTS.
>>>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>>>>> and the NPCM8xx has 32 bytes HW FIFO.
>>>>> This also means that registers fields are slightly different.
>>>>> For init data we can move it to the DTS, but register field sizes
>>>>> can't be handled with this approach.
>>>>>
>>>>
>>>> What do you mean they cannot compile a kernel with different DTS? Of
>>>> course they can - when we talk about multiplatform sub-architectures!
>>>> Maybe there is something specific in NPCMxxx which stops it but then it
>>>> should not be marked multiplatform.
>>>>
>>>
>>>
>>> NCPM7xx is ARM32 bit (dual core Cortex A9)
>>> NPCM8xx is ARM64 bit (quad core Cortex A35)
>>>
>>> They have completely different architecture so not ABI compliant.
>>> I2C module is similar, but the devices are quite different and have
>>> separate architectures.
>>
>> OK, in such case usually you indeed can't have both. :)
>>
>>> Sorry for the confusion.
>>> This is the first patch we try to upstream for NPCM8xx.
>>> In the coming weeks we will upstream the architecture of NPCM8xx as well.
>>
>> Still, ARCH_XXX should not be hard-coded in the drivers to change the
>> driver's behavior, even if driver won't be used simultaneously. It
>> breaks all design principles and prevents any further re-use if a new
>> use case appears.
>>
>> You can use "ifdef ARCH_XXX" to skip building of some parts of the
>> driver, but it's not the case here.
>>
> 
> Correct, the main change is in FIFO size:
> +#ifdef CONFIG_ARCH_NPCM7XX
> #define I2C_HW_FIFO_SIZE               16
> +#else
> +#define I2C_HW_FIFO_SIZE               32
> +#endif /* CONFIG_ARCH_NPCM7XX */
> 
> NPCM7XX will always have 16 bytes, all the next gens will have 32.
> 
> This impact some registers sizes, like this one:
> 
> +#ifdef CONFIG_ARCH_NPCM7XX
> #define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(4, 0)
> +#else
> +#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(5, 0)
> +#endif /*CONFIG_ARCH_NPCM7XX*/
> 
> For this, the FIFO size should be defined before compilation.

No, it does not have to. We solved it numerous time with quirks or
per-chip-drvdata. It's common.

> I also don't want to let users select FIFO size per architecture.
> NPCM7XX has 16, NPCM8XX has 32. This is not a user selection.
> It's part of the arch.

I understand it is part of the architecture but why Nuvoton is different
than other architectures and requires special treatment here? With most
of the drivers, regardless of possibility of running same build on
different hardware, we strive to make it ifdef-independent.

Please run:
  git grep ARCH -- drivers/i2c/busses/*c
and see how many of such ifdef patterns you see. You also won't find
them if you grep for CONFIG...

The driver should be designed in portable way. The driver should not
have architecture-dependent code.

Best regards,
Krzysztof
