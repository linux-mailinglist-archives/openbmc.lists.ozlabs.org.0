Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB844AD429
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 09:57:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtH2f554wz30hR
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 19:57:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=phtZ1/4N;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=phtZ1/4N; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtH293yqJz2yLv
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 19:57:04 +1100 (AEDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E33F64003D
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644310618;
 bh=jrCjP6cigoq2hUV57n4k5BTndMW5LQallJ585bA4v4U=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=phtZ1/4NQjsVTc1P5ABniDSJaPoTZxH/Xea23W5lLCArtsnY3enjnzmD3LfQ++YD1
 kmTlqLphDUV6Q1i95G649LJ+5CPswsvgAMO8L9oajoO4s4VXd1kgEbuHfLzHOwOVZ+
 6/401M1LzptdlgQXmXp1DDUIZUloR2HS/z3EkzDItxSEOnY7qL/pOxS4zmcWv4LC/+
 my5Z+19POejk3mG5eMXLNXAUU8C1kWiU7YLjOkuAxnI7YVjPkzMkghDQVvFikZtAdy
 5vzqmV2/WZM6w8H0j7bQvpbYpUo9Rnpbg0MPng5Ndt+7j4Jh94U4D43CKfAGLlulHM
 ZzgeF5FalkkpQ==
Received: by mail-ed1-f72.google.com with SMTP id
 o6-20020a50c906000000b0040f6ac3dbb5so3076454edh.17
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 00:56:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jrCjP6cigoq2hUV57n4k5BTndMW5LQallJ585bA4v4U=;
 b=ZxUyiBKZRKieshcgGPgx8MKqhyWNnLUd+JsMX2JE05WIhIlspnje9IJlQvu88r49bz
 W3/wDumd+J+TjRrqLkVibiPaYTW2yiJQmPvbKKh6SO/lsZps6EIuPIMLdlzUXeoO7In7
 rlajdTLe5DZYDub7ZAO++0ILZvbStbRCaN1V4IWuNbCGKIez4qDLL2yUid/gbFn3cLdc
 AQHFxtydT+fjaJ+URQB2moFxvA9SjzgK2Wh10CD8T5fu76Ew2m8LtxKWsbeXMqi64GST
 ow4aFpFKVLUnRRi/wg7ihdR1IIA4sdMkCNd5RrH/IzKYxt9rsvW/tf9Ca5mdbyjHuVMZ
 dVUQ==
X-Gm-Message-State: AOAM530lir/tlOJKM5tY0MtefXew9mD7Joep7/UGp9mvnfaj1dCoxSHE
 cZn7NodrQGT+/kS8zwPsRB7is2fG4YCybhLuQp5qokJIEAHMM3FY5rpQ53XEh35SOAclbtUgqIg
 cUlzZTW/Fx0LumljWnnfbtgqtZGxZ3AFrniB3
X-Received: by 2002:a17:907:948c:: with SMTP id
 dm12mr2940478ejc.770.1644310607479; 
 Tue, 08 Feb 2022 00:56:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWL7auPyMvH/eI9rxLnQiNw2PVY1Wgkiymv6mfS8QZo6OPnHvXX90ldKMwT7Z004YsVjstlQ==
X-Received: by 2002:a17:907:948c:: with SMTP id
 dm12mr2940447ejc.770.1644310607251; 
 Tue, 08 Feb 2022 00:56:47 -0800 (PST)
Received: from [192.168.0.92] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id a21sm4220537eds.5.2022.02.08.00.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:56:46 -0800 (PST)
Message-ID: <1a172e64-f662-2a36-71ef-4214cfe5bffc@canonical.com>
Date: Tue, 8 Feb 2022 09:56:45 +0100
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
 <30ac5fe7-9d96-a756-24b0-384361b48a2d@canonical.com>
 <CAHb3i=ukzVr4DDgcPQ2+DO+LXWWtgjCe03WbG-CqvsOP_qqvUw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHb3i=ukzVr4DDgcPQ2+DO+LXWWtgjCe03WbG-CqvsOP_qqvUw@mail.gmail.com>
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

On 08/02/2022 09:51, Tali Perry wrote:
>> On 08/02/2022 08:14, Tali Perry wrote:
>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>>
>>>> On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
>>>>> Hello,
>>>>>
>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>>
>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>>
>>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>>
>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>>> driver")
>>>>>
>>>>> It's not really a bug fix, but rather an additional feature.
>>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>>
>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>>> ---
>>>>> [...]
>>>>>>  /* init register and default value required to enable module */
>>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>>> +#else
>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>>> +#endif
>>>>>
>>>>> This is going to cause problems when someone tries to compile a kernel
>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>>> only work on NPCM7xx).
>>>>
>>>> Yes, good catch.
>>>>
>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this looks like an invalid code. How such code is supposed to work on multiplatform kernel?
>>>>
>>>
>>> NPCM7xx and NPCM8xx are very different devices.
>>> They share same driver sources for some of the modules but it's not ABI.
>>> Users cannot compile a single kernel with two separate DTS.
>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>>> and the NPCM8xx has 32 bytes HW FIFO.
>>> This also means that registers fields are slightly different.
>>> For init data we can move it to the DTS, but register field sizes
>>> can't be handled with this approach.
>>>
>>
>> What do you mean they cannot compile a kernel with different DTS? Of
>> course they can - when we talk about multiplatform sub-architectures!
>> Maybe there is something specific in NPCMxxx which stops it but then it
>> should not be marked multiplatform.
>>
> 
> 
> NCPM7xx is ARM32 bit (dual core Cortex A9)
> NPCM8xx is ARM64 bit (quad core Cortex A35)
> 
> They have completely different architecture so not ABI compliant.
> I2C module is similar, but the devices are quite different and have
> separate architectures.

OK, in such case usually you indeed can't have both. :)

> Sorry for the confusion.
> This is the first patch we try to upstream for NPCM8xx.
> In the coming weeks we will upstream the architecture of NPCM8xx as well.

Still, ARCH_XXX should not be hard-coded in the drivers to change the
driver's behavior, even if driver won't be used simultaneously. It
breaks all design principles and prevents any further re-use if a new
use case appears.

You can use "ifdef ARCH_XXX" to skip building of some parts of the
driver, but it's not the case here.


Best regards,
Krzysztof
