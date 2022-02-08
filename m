Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA894AD29E
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 08:59:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtFm22HC5z3bVB
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 18:59:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=JhVERn6U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=JhVERn6U; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtFlc20hMz2x9J
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 18:59:22 +1100 (AEDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1C4B83F32B
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644307158;
 bh=KUmu+SyX79IqC4JJ7btjA8fb9z3hZtQRTMNCGj6+80w=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=JhVERn6UlmXuh4t+mE87sq1NXTex//nUxW+gNgxIK8A0aRnaxR+g6zzQeEdKUY0HL
 y9KooRFot8zA1yCvYhVubLpb9M/BD/StJQAoKPj7hd60N906FwwzQ4jdFDA+07OIT0
 PaB3px/oVaLFHK18nCIuc5tk6wfKXM46I5dTjdljLn3UFN+dd9hX7yvP5rac8RF0wN
 D6n8lm6Y/c3jcqFMo56IIw0X74KqdLHWJnKB81XiJdz3Ej+QnVAZN0o02BBNWIPar+
 wqzoPIdabtOObViCum6ZDMaf/0V+zdDiNT/zgi+2vJ2fq2MmG/gnz+5G82inpRO0SW
 3i2JEcYanF0DA==
Received: by mail-wm1-f70.google.com with SMTP id
 i8-20020a1c3b08000000b0037bb9f6feeeso707782wma.5
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 23:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KUmu+SyX79IqC4JJ7btjA8fb9z3hZtQRTMNCGj6+80w=;
 b=fDaGSe9ze9/7jDsMjIGffwl772XrIr8WvNzueVq/LGsERfYzm47g2BnKuESt866WuF
 Vh6KrsOB9X6UdJhe/15ZsWruOBsoT4zGRHBrwG/NxTS1tL5006s6QmHO1lTmo7VUlmkQ
 OqPBqoky8nOC1jY88jLqEBq3gmDyeY6IzbNJFtCS8/LhIDwN7a9kVVc+54zSmofiz6Bq
 1qmgiZdELNTIXVW6u9frYY4bKIf0T+ophBJiY24LPBgV9c34nDe5F+VHCAxuFjGha/l9
 NGTzBylSaGX8He+8A9/OqxKS5lxEbgVqv4ISCIJheVAPncpYrYcYQ3kKhFLx97G3WDQG
 pyrg==
X-Gm-Message-State: AOAM532dRZeBKsGA5IZmVK3np4wX9/IS+HsjX30J9C0/VHxzDhayFPJl
 6i2oJcQ9sac7bAfXszWDMXjdKWom7n7obeDnPUVWPG/DtpU7xzlNMYP/QxlNzkOGiNFNianDHCR
 iTl2+E+U4asqHBbI9I/zKKn8tXYp3AYAmmLSf
X-Received: by 2002:a17:907:3d9e:: with SMTP id
 he30mr2695764ejc.625.1644307147052; 
 Mon, 07 Feb 2022 23:59:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnMuJKGmrn//ENmSKnBlAudNuu0CWc31cjpAvZg8bgdPfnemJMwR4TMW3LN8I8kjOeWiw/ww==
X-Received: by 2002:a17:907:3d9e:: with SMTP id
 he30mr2695737ejc.625.1644307146862; 
 Mon, 07 Feb 2022 23:59:06 -0800 (PST)
Received: from [192.168.0.92] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id i24sm42682edt.86.2022.02.07.23.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 23:59:06 -0800 (PST)
Message-ID: <30ac5fe7-9d96-a756-24b0-384361b48a2d@canonical.com>
Date: Tue, 8 Feb 2022 08:59:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Content-Language: en-US
To: Tali Perry <tali.perry1@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com> <YgEJ1M40AG9EuRPI@latitude>
 <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
 <CAHb3i=vpFwez+ZzDhHkSxjkios3tyoM2urRpCxOn3vfwzvewog@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHb3i=vpFwez+ZzDhHkSxjkios3tyoM2urRpCxOn3vfwzvewog@mail.gmail.com>
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
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 08/02/2022 08:14, Tali Perry wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Sent: Monday, February 7, 2022 5:27 PM
>> To: Jonathan Neuschäfer <j.neuschaefer@gmx.net>; Tyrone Ting <warp5tw@gmail.com>
>> Cc: avifishman70@gmail.com; tmaimon77@gmail.com; tali.perry1@gmail.com; venture@google.com; yuenn@google.com; benjaminfair@google.com; robh+dt@kernel.org; semen.protsenko@linaro.org; yangyicong@hisilicon.com; wsa@kernel.org; jie.deng@intel.com; sven@svenpeter.dev; bence98@sch.bme.hu; lukas.bulwahn@gmail.com; arnd@arndb.de; olof@lixom.net; andriy.shevchenko@linux.intel.com; IS20 Tali Perry <tali.perry@nuvoton.com>; IS20 Avi Fishman <Avi.Fishman@nuvoton.com>; IS20 Tomer Maimon <tomer.maimon@nuvoton.com>; CS20 KWLiu <KWLIU@nuvoton.com>; CS20 JJLiu0 <JJLIU0@nuvoton.com>; CS20 KFTing <KFTING@nuvoton.com>; devicetree@vger.kernel.org; openbmc@lists.ozlabs.org; linux-i2c@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>
>> On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
>>> Hello,
>>>
>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>
>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>> The only difference is that the internal HW FIFO is larger.
>>>>
>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>
>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>> driver")
>>>
>>> It's not really a bug fix, but rather an additional feature.
>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>
>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>> ---
>>> [...]
>>>>  /* init register and default value required to enable module */
>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>> +#else
>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>> +#endif
>>>
>>> This is going to cause problems when someone tries to compile a kernel
>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>> only work on NPCM7xx).
>>
>> Yes, good catch.
>>
>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this looks like an invalid code. How such code is supposed to work on multiplatform kernel?
>>
> 
> NPCM7xx and NPCM8xx are very different devices.
> They share same driver sources for some of the modules but it's not ABI.
> Users cannot compile a single kernel with two separate DTS.
> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
> and the NPCM8xx has 32 bytes HW FIFO.
> This also means that registers fields are slightly different.
> For init data we can move it to the DTS, but register field sizes
> can't be handled with this approach.
> 

What do you mean they cannot compile a kernel with different DTS? Of
course they can - when we talk about multiplatform sub-architectures!
Maybe there is something specific in NPCMxxx which stops it but then it
should not be marked multiplatform.


Best regards,
Krzysztof
