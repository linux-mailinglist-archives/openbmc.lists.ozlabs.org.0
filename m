Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B7FA01C65
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:13:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRClT60nRz3cCh
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:12:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735033064;
	cv=none; b=InxhHOr6y4y7OOOlFEFKml7WkvHjQz/ohQXVN5jh7Q0d53pv18BeUlMSVVi+0dAGglXmz9to9qYoGYei8wKw79HKckMOWXHwWAtziRlxwdmd9BOtj9+1CJM2vAE41vR9q8kpgdHS1RpH8HIFBCTJNJWIKPakJZLkC1ZR2fMRG0yApOJCqfIyFjK6b9mBjnr4uDX9joo+VXo8QKB4284gj/M4+DBBLt5kM+1VN13ZZX94QKNgjmfbF+Qzz/vRVCNI2w8AurhhMC1Y9OoSBaFgluKYYXwGZWAogbkEpWWP2cO49acxyQmvIR15+lu/P/d97Gn090LLmq2AHPcjwmZyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735033064; c=relaxed/relaxed;
	bh=jLmFWbWd3SQkC6J4LYdTAks5WNvEgPSVXIlgEkT9qUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mogwa5zF9Rij1rsFcwvGk9mdf7QObRJZpJLkWE/LmXKlI9q+pmwXVLZthsNZVs9MOLhrPzSu/PxClxD7u6tQ5NEWbDrMUKLnLgB0enZKervpcJUnWd/R7DnH3LioWRtcTgXUTMd/4AYO2mjb8k0ws6Y7vxpP8t0/juADcXcXc1sMavzLWdR782fqZQrKuspe9RfI5V1aX7otHI4VLo3gnrjm0isitnsoyNlqpfQOfX8rG6jLgu1+oURvQpc/yG4ZRiwAQ5YjVP5kPL7IWfIf/9lCxsnIENmvXbqTK4bUUeQdK0fDD9boYORzAU+VswXFNpPKAQrtqtDtBPdqfvHhaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g/3UrGLo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g/3UrGLo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHVDQ46qHz2xVq
	for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2024 20:37:41 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-219f8263ae0so18477295ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2024 01:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735033057; x=1735637857; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLmFWbWd3SQkC6J4LYdTAks5WNvEgPSVXIlgEkT9qUk=;
        b=g/3UrGLolyHtRYwEnsLKiAZI9vqunpRi7slxVgOy9gwwlvtq/AacjMBAwwYl7cfbLr
         xhV2bfN997u4OM5EmZkNsQ+0DVAMrytWLBAqwkziGxVUCjdLFyfEG48Hls2HboT9Zmuw
         h4dVzI3LBwwbDQqlnCRMbkboJy4u3u5Y8+D9sgacTdKrisKt8z1WTvOk8COvGgLc6sBN
         e+ZL06tEznfoTtFt7k9esF2vDezhf5Tm8Q639TnlZbiBbXm/zFhKDkmXMTHFD4o4m7pH
         MoyM+QwFqGm2aJRPVzIusyamUn0xa08aYN5qT4z0C++e+jepeHpFxMb8NRJA8E0dOcGX
         WDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735033057; x=1735637857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLmFWbWd3SQkC6J4LYdTAks5WNvEgPSVXIlgEkT9qUk=;
        b=lTrpQquP4kmiX9ju5Ktq60OaQqi6FlG6XZ1OGHd4enQOXCngq5zwCmkhlzpVM0CaNF
         b3UFMOyrMFqvOeqkQL14HNKF+hFfXDIB5tFcId7LVO5x/PWo7AWwxEJDciQ3GU5Uh0wG
         1jGntVlKeL6bGiJqBFbqOsHWlgL5XZbCZy+/pwv9R4N6EDfNAsKdl1Sj/jJGNI3/X2l0
         oOORzaHGzzneXXhohxYY0ZX9BKlhs6WrBijd1I7pNbiCgBiRPti0Vlmy8g5H2nHTalbM
         Fyf6Kib/5XPI96WurOOsoAYCEhvr0SsrdXU6SsnkY8HBQgNgEXpMXxxqNu8miVsgLZSe
         ds6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1g1i0PllFYA/IbzOVvUcviG2Wrg3rJ2n14PCcJGrCESPXCaT3VVyXqkFI402QI2WuqfrTVv6d@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzrsQ/o6FMicDUGcPWDwdoO0ZIslTgHiNxIROzOdrxWovjjf11X
	g22tJ8zCYEpt7rTlSZKsUQ9H+pR0u3BLa5JhV1uiBF9hVaXonRk4
X-Gm-Gg: ASbGnctvTMWG06RuX2Bbuexd94ZPllFziVeYAOI9N35vpSNg2buISM6TNQO+ZubEmNV
	tL2cZUDpfzkX5tRbZYH+C+oYI/a+GeChCTZ4w+pRvAHWDBG3B5b+V3VAVXOg4Y8cn6qQoz26Lja
	2kVouKsu26MWLQNTN6wLehVlzYf69df+nVdDMYm9N+ii6MWOLYQdCUaz8d/JwqilhaBIzyfTEX8
	PagfJs5rLmWg5IBX0R4NeKSLbu5dQJCxrtgvKYooVnS3D11Boe83/dVbsgnFIyQcoa5HcVjvzQe
	z/ozCMrInAWisa7Tjy5A0XL7NEnLTjhP0jc=
X-Google-Smtp-Source: AGHT+IHeB/WWKd6mmgZbT26UjUM4RGWZKImwzEuCo8jzyGFGDy66eiSE5XasK5+ZN6cxtxmkvDMOCA==
X-Received: by 2002:a05:6a00:8085:b0:725:ae5f:7f06 with SMTP id d2e1a72fcca58-72abe096383mr24761611b3a.23.1735033057380;
        Tue, 24 Dec 2024 01:37:37 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c1bcsm9590252b3a.187.2024.12.24.01.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 01:37:36 -0800 (PST)
Message-ID: <5ae923d7-3b4f-430c-bb43-edee7f549e56@gmail.com>
Date: Tue, 24 Dec 2024 17:37:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
 <20241218114442.137884-4-a0987203069@gmail.com>
 <7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com>
 <216e7c97-e0b1-4833-b344-a71834020b15@gmail.com>
 <c800e544-82af-43d3-b07a-e7b1a4028330@intel.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <c800e544-82af-43d3-b07a-e7b1a4028330@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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
Cc: alexandre.torgue@foss.st.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, ychuang3@nuvoton.com, richardcochran@gmail.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Przemek Kitszel 於 12/20/2024 6:59 PM 寫道:
> On 12/20/24 08:07, Joey Lu wrote:
>> Dear Przemek,
>>
>> Thank you for your reply.
>
> sure :)
> please also configure your email to write replies as plain-text, instead
> of HTML
Thank you for the reminder🙂
>
> I also forgot to say, that you should have target this series for the
> net-next (--subject-prefix for git-send-email)
>
May I confirm if you are referring to netdev/net-next?
>
> Please also note that your v2 should wait to be send in the new year,
> as we will begin the Winter Break for netdev ML in a moment.
>
Got it! Happy holidays! 🎉
>
>>>> +/* 2000ps is mapped to 0 ~ 0xF */
>>>> +#define PATH_DELAY_DEC      134
>>>
>>> would be great to previx your macros by NVT_
>> Got it.
>>>
>>> why 134 and not 125?
>>
>> The interval is confirmed to be 134. The mapping is as follows:
>>
>> |0000| = 0.00 ns
>> |0001| = 0.13 ns
>> |0010| = 0.27 ns
>> ...
>> |1111| = 2.00 ns
>
> thanks, that's correct, sorry for confusion
>
>
