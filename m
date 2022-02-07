Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FCC4ACF54
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 03:59:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt7606p0Xz30MQ
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 13:59:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=tyxraPvf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=tyxraPvf; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsqk80MtHz3bP9
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 02:26:39 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AAAA43F328
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644247592;
 bh=jtBwxjA6IxdUXSiBKA9l5yKPNOzp1lDJ3zELoV7GVzI=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=tyxraPvfd6lWxeGVlnuGZskaQusMOgJF+KTiDy9I/TrsHX4Sc2oUTC0+KIsCpRHLR
 gomZdj5D/lWgQjtz1/fMYEq6WJxtqQ9Kvz3Q+rEajOr04YWEAwl9B2ldhrCUpfr5p4
 NjictvAj0vtWXifOrvgmVQXnHskaMpARKghlchKk2fVd9LhvZhNWcBW4hbpYbMcvg5
 cRU/3o/QhecY6NNayYezsZCH/xwgbHl6VlruvG0RTIoWm7IhBdc//+HQo4xrM6Bd8O
 98BMDZZRiICvIIyk6NkzM1S5p6PkvwFnW0rogva4d/43d7MKOjNyKlHNUg7RxbrY0l
 EleT8M/tDtCmQ==
Received: by mail-ed1-f69.google.com with SMTP id
 cr7-20020a056402222700b0040f59dae606so2841926edb.11
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 07:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jtBwxjA6IxdUXSiBKA9l5yKPNOzp1lDJ3zELoV7GVzI=;
 b=URLc7oPF4zFhxURgY5LqiPQkevXsYe0b/ri0dWk+tC4kZEkJnTRS7nD0pefKuuyjbP
 cPUAqimJ6cjuICxMzfoOpDKGDVLh4AJozbDiboK7qNe2dBng/LlOpayqrPmn2vTHl3o0
 QMzWzEBFS0k0mBTkNhttykcjUz908IRFfCP5WTS/+Q5NG5Tkjo3bNyDkkcIYRNPRdzNy
 kPv3GUpUtuePPcx1aj6hiGUsq3Wtk1ameNLH7QEJkWBW5HECJ5KdJu4RM1ILjLdl/3aT
 DOhiMbO//NgXuxBNtO/QAcCxsp6rHrj4K+vaI9pgxTz1nL15gqNm18Gvi1BXkvIrfnOC
 mF9Q==
X-Gm-Message-State: AOAM532RfMyr225CPO0478oZNyFkb5dlugBxivHFKl5i3WvJtv9Cgnkc
 51HcPHnbvdKdv329tfQHdow3A69hLE1jhlBbDN5GQ5fO8JJoTt6enI22rnVP1qqWytEaHJlPQLp
 X5na1tDj81qnbSm07c6S9edmfbR+XAmfvc7Bh
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr14308613edd.355.1644247592202; 
 Mon, 07 Feb 2022 07:26:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVJn4Nlc49XX5kswoAu+DV9XJFl3JgZB7TwRP+HT5uWO4LoDj7YPKGUhK5pvvh8K/hZa2i2A==
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr14308602edd.355.1644247592039; 
 Mon, 07 Feb 2022 07:26:32 -0800 (PST)
Received: from [192.168.0.89] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id ec52sm3945244edb.24.2022.02.07.07.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 07:26:31 -0800 (PST)
Message-ID: <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
Date: Mon, 7 Feb 2022 16:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Tyrone Ting <warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com> <YgEJ1M40AG9EuRPI@latitude>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YgEJ1M40AG9EuRPI@latitude>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Feb 2022 13:58:20 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, benjaminfair@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
> Hello,
> 
> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>> From: Tyrone Ting <kfting@nuvoton.com>
>>
>> NPCM8XX uses a similar i2c module as NPCM7XX.
>> The only difference is that the internal HW FIFO
>> is larger.
>>
>> Related Makefile and Kconfig files are modified
>> to support as well.
>>
>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> 
> It's not really a bug fix, but rather an additional feature.
> Therefore, I suggest removing the Fixes tag from this patch.
> 
>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>> ---
> [...]
>>  /* init register and default value required to enable module */
>>  #define NPCM_I2CSEGCTL			0xE4
>> +#ifdef CONFIG_ARCH_NPCM7XX
>>  #define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
>> +#else
>> +#define NPCM_I2CSEGCTL_INIT_VAL		0x9333F000
>> +#endif
> 
> This is going to cause problems when someone tries to compile a kernel
> that runs on both NPCM7xx and NPCM8xx (because the driver will then only
> work on NPCM7xx).

Yes, good catch.

The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this
looks like an invalid code. How such code is supposed to work on
multiplatform kernel?

> 
> And every time another platform is added, this approach will make the
> code less readable.
> 
> A more future-proof approach is probably to have a struct with chip-
> specific data (such as the I2CSECCTL initialization value), which is
> then selected via the .data field in of_device_id.


Best regards,
Krzysztof
