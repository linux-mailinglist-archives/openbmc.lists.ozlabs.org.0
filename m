Return-Path: <openbmc+bounces-411-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D36B155F0
	for <lists+openbmc@lfdr.de>; Wed, 30 Jul 2025 01:26:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsBLJ1JSbz30WT;
	Wed, 30 Jul 2025 09:26:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753770118;
	cv=none; b=H+dX1Lb6/ZsnR5+mhqmPIQyOnXh4F7qOMO7xV/HYJ55RHcqSH58ytQO/CFp5Q82fddoqYsJ77KzZSHgdRMRankaMh+hDR1tYg/zoQZ8fQOxbRGG6982Wy62yeevJZzSlBZp5UD6jUAWo8Py6sk0I7hCAgTEDEmHZO8taoQ0ME6SU5ZzXpGe9el2cZHM0RpXHNUtSWUWavsGgn4m3JRFkAh2KI1L0vZ5kLE8YPWRdWXWIasA408PEPegHwsiR2iw7T85HT+Y0EFKLakOBuIOh3TBW8qFoj1H9Q53L/VHKVDiBQewSwTDGjPo8j80eogBVhCQiEvI8AscVEo3H/TzNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753770118; c=relaxed/relaxed;
	bh=h2hqXZgK8Gn0aRzZzaTCh7Opcg1Hze3iFdTdCpmIFKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVrkeALmOtE1yhEq71fuXhcycXG+sNdzBCUsC7bhIwQ0XmbXkY8oroUPrCUFcnDio6OeAKveYWWACSL+uvEJ3v4H1nAcX/ybb+1crDpUlRcEAvP1eup/mXw3oo9UIfbGAO7ZUp6yIN8Xbo57SDr553XZZQMCiNqdmqnNeYmf3BL4cMInb1xxS2CE7+6RZNr1uIhwMD5SPGN4X8xje9bKbstGBNhZZluNvmiEJ+dP8I8JTs/SfjbBnpp3B7qZ6sj19WVwXHgF/kb8eysu9JHHIy77ozWC/JnShZVNkmdLh396KoBkP1fFCLBJilNo54OIIIDS0oY6ciRpjsyO/DjS+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZ4fyTvW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZ4fyTvW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brlcP2pM1z2yrT
	for <openbmc@lists.ozlabs.org>; Tue, 29 Jul 2025 16:21:57 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-456133b8d47so2912805e9.2
        for <openbmc@lists.ozlabs.org>; Mon, 28 Jul 2025 23:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753770114; x=1754374914; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h2hqXZgK8Gn0aRzZzaTCh7Opcg1Hze3iFdTdCpmIFKw=;
        b=dZ4fyTvWHH5pAPxeSA1hs+Z1KP8hyH7TkJ79s9g1UitZqfz7CqW1S/7E8a4VVtlxhK
         ist1ykqwilWgnkec78pemOjYNt0uw4y8qIyCfpEQ19X6sIt5bI1/fNHGp1/CeGxicfJt
         5t57XXFE51AyAl6SnTBbAN2MK7sq0jSfnJ1nxHsBtqEULR4hNiDrZQvFJK97V+K8HoFM
         j0t2M4gjWE4J9HDqWVzIeCmvp2qPxj/k7RAJ982ytxGbKQ9G2EYEhAox/b089KSGlMEX
         UJvEnJTjhsDzbefNrKj2btzROIQUy5jXoUwPMQRUHd28rSMXuGCgsnL6c5Ia7aHVZ8RI
         Vslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753770114; x=1754374914;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2hqXZgK8Gn0aRzZzaTCh7Opcg1Hze3iFdTdCpmIFKw=;
        b=s/VwGK12dRAFWdR8sC1/5OgEv6dqHg8g1vcf+MYQ+RT5VVWF/7AYdWseJ3CzNTVfBE
         D21l1MIy2oLcSy3v7Xct3+WaRQr5p7ruXQCFp4z+eCybnM8xJntohciUbXeVzEwhGPs5
         TG56JTaeLArk5ZXvmF2r17gHMLXbuPFYeHRoS2ZLYM2kpHn2RTirRhF2ANimXHH8VMhh
         x9kmB1TUIzkKTtJ1kVn+DXSLoMvp3ddCtR4dRjCb6/lP343rIPtGhG+b3ldaS+yizksY
         5TkvmLN20qWBmOaseOetGKCWAsHd+2YY+a+jfuUn58+1rkGwJpQqLQ/PpUT4u+Cf6sfT
         Hkbw==
X-Forwarded-Encrypted: i=1; AJvYcCUSa7TXeAbVevcUgYMP0yW8GzIdGphzZ73kH5Teelk73gNy+BxwAQ84UOaqowSq4tjNX3DD/LCG@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywry4xdc2JdYXaee6fzhHo7bhjBy/lgUSU880ef15ZyPfz76Kog
	cnDKMsi2/xUmAnPqsGba+m+rz+kEU0mUoMw+6ikAfBTfGsYeUVbTrmMGtAmvZKhs23g=
X-Gm-Gg: ASbGncvmCuZBFJfUca3WZApXD4e93VzFjLz0hXyv9KoCRYbWKMKEgryipTQvsQox/Bs
	MrXjGVRQ+9Rvk62vCnVGePzOaqujg7KWC4RYWE8ZhOMvZgAS/Fe9l+jcmvq0p2vDjz6YdEN8sJk
	tIRitPZqBeQVbIYKQj45vloIAWMbya52h/wW80CpfM8t9VbiOZqp88080UegIrkTKsRESQutH6/
	TjhlTDA4k93QR9kmibnA4GXh6idVLRw5pcj2b63mJcoOBeHs5/YFRY0aKl4DUii8Dk/Di2tOUiA
	wTSW4Nc38eDiAXJHZmgs12tFP4gPJWpj+5A/iiXcyY/U+62cPBJ2FD+hGSSXHJY6HGcG7yDNcTT
	4msGFl1yeM/NLaIdAE84VXWAfxtHQlb1RbrAu0bBoZIw=
X-Google-Smtp-Source: AGHT+IE5UIyoVNX9D7EyQrHXAExFd3ft6CMjGgFnL5zErWK4QL+JT/zmGZvgdD4HxEYlNnwqbozq1Q==
X-Received: by 2002:a05:600c:5253:b0:456:1823:f10 with SMTP id 5b1f17b1804b1-45876676a3dmr45305065e9.8.1753770114319;
        Mon, 28 Jul 2025 23:21:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bcb61sm178271825e9.20.2025.07.28.23.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 23:21:53 -0700 (PDT)
Message-ID: <61a0c875-89cd-4040-af15-79f57b53f377@linaro.org>
Date: Tue, 29 Jul 2025 08:21:52 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com,
 joel@jms.id.au, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250717135336.3974758-1-tmaimon77@gmail.com>
 <20250717135336.3974758-2-tmaimon77@gmail.com>
 <db07c25c-4064-4330-8bdb-8a619b0b2915@linaro.org>
 <CAP6Zq1jDCfhOWj4JwORy22TDZRBr0fnuy5-=G4WO9DFRv7pTdQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAP6Zq1jDCfhOWj4JwORy22TDZRBr0fnuy5-=G4WO9DFRv7pTdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 28/07/2025 13:30, Tomer Maimon wrote:
> Hi Krzysztof
> 
> Thanks for your comments
> 
> On Thu, 17 Jul 2025 at 17:05, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 17/07/2025 15:53, Tomer Maimon wrote:
>>> Enable peripheral support for the Nuvoton NPCM845 SoC by adding device
>>> nodes for Ethernet controllers, MMC controller, SPI controllers, USB
>>> device controllers, random number generator, ADC, PWM-FAN controller,
>>> and I2C controllers. Include pinmux configurations for relevant
>>> peripherals to support hardware operation. Add an OP-TEE firmware node
>>> for secure services.
>>> This patch enhances functionality for NPCM845-based platforms.
>>
>> Drop this sentence, redundant and not in style (see submitting patches).
>>>
>>> Depends-on: ARM: dts: nuvoton: npcm845: Add pinctrl groups
> Maybe it's an issue with our work mail server,
> https://patchwork.ozlabs.org/project/openbmc/patch/20250706153551.2180052-1-tmaimon77@gmail.com/
> I believe you didn't receive the patches below as well, since I didn't
> see any comments. Am I correct?

How is it related?

> https://patchwork.ozlabs.org/project/openbmc/patch/20250706134207.2168184-2-tmaimon77@gmail.com/
> https://patchwork.ozlabs.org/project/openbmc/patch/20250706134207.2168184-3-tmaimon77@gmail.com/
> 
>>
>> There is no such tag.

Do you understand this?

>>
>> Use changelog for this purpose or b4 dependencies.

Do you understand this?


Best regards,
Krzysztof

