Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 359BC8711FE
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 01:50:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TJ5iWm9h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpcRH6xdZz3cQm
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 11:50:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TJ5iWm9h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpcQk6wQmz30fh
	for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2024 11:49:33 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so4468320a12.1
        for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2024 16:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709599770; x=1710204570; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=++8tOr68/fSpJcWWzBhYIXaEDMYMfDDTltrPw8fd4cE=;
        b=TJ5iWm9hs5vwlFsKxjgGS/4YxUMrZ8bGlCZaW9L4KWWIX9NAppJcLNiU/VGeUjuJky
         tK/bTFTJchvQJQL0hipRsxMVwZaTELrEqs1eLvZOltUZnBAAnYOSSlI4iVknQNZVjaHM
         3VXZDEZ0E6vamfOgaGdmUhVFel5+y7bo5UXV398t6TkiSrP6DZlVyd3aQ6ruWs44QjmG
         e8/OExMzFTU2iKwt5weUoTfDk20yU0OlstKP8u7fUep0m9XwYSnCEiVULjkXGnRYS7qm
         Pyd5B226Ww4QTrrYX5FiBFHuVofgh6klqJWjBjSTjvksAwW7eMzPA4tSV95kjgeDVlv2
         F2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709599770; x=1710204570;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++8tOr68/fSpJcWWzBhYIXaEDMYMfDDTltrPw8fd4cE=;
        b=DhnTbGtGhr+4gwBlaCYKz0+EPvEbdpnoyOLHwNZNdWUhFRfHt0ACVB8dJ67jWyKBqr
         kJeqT/bJfy7MGQxLknXr0kOZoKFlZyDtDnqNwdlgUBq809clYx+Hg3tk9fPdk8xiGGcX
         lfS10e/UPbKrt5zL9DQdcazr23ETgcEefcwj38KxUOTWslpEj+KYv6Ht2BwWFa2vvqbu
         exsaPO+ygoojy0zgZ3AcjffnAHKiM0lCeI6HYJj8Z5MTujLCLZ3uvvPhM31oqR5EzCz+
         PP3sVDWPyMKeoj9bsha93tV0dLoA1VRAIJxMUbkTomYd1BZVJjWBZrYYaWiGN6cbcN6q
         DCOw==
X-Forwarded-Encrypted: i=1; AJvYcCVqpbWgp1RC6UMKznVVhmhDFX5kJDSw1fSV7sntHD+eQM3yKIW2xfDh3YMfO0j1TBnV1PuDI+NS6dnjcOpv1OBcg82d4xB5f3k=
X-Gm-Message-State: AOJu0YzpClrspsdSr6gGMK2usl3mgKvBHaVsdn4EfgoP7YFgoedVM1Eo
	yxTzGed1BgB41+JpXw040BZa3vyyeR7nTCqV11guYWvDwUrQLHb4
X-Google-Smtp-Source: AGHT+IH5f7z8Q19BNOLE8e016EtE1ruOEMmi8zcLQWUpBERw4Pj2U1o93Uic/p8AsbOd/1jk2BeayQ==
X-Received: by 2002:a05:6a21:3988:b0:1a1:31a0:f07a with SMTP id ad8-20020a056a21398800b001a131a0f07amr373567pzc.60.1709599769932;
        Mon, 04 Mar 2024 16:49:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t9-20020a17090aae0900b0029b12d6b4a3sm7947605pjq.39.2024.03.04.16.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 16:49:29 -0800 (PST)
Message-ID: <03b6a094-b76d-4b4f-90d8-8b00219ec236@roeck-us.net>
Date: Mon, 4 Mar 2024 16:49:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>, baneric926@gmail.com
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-2-kcfeng0@nuvoton.com>
 <1cf69d3e-a8b4-49f6-ac4d-550b525e45e2@hatter.bewilderbeest.net>
 <e590e3ba-f446-4f20-9618-d4ff388586ad@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e590e3ba-f446-4f20-9618-d4ff388586ad@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, Rob Herring <robh@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/4/24 16:41, Guenter Roeck wrote:

>>> +
>>> +  min-rpm:
>>> +    description:
>>> +      Min RPM supported by fan.
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    maximum: 1000
>>
>> I can't say with certainty that it's not, but are we sure 1000 is low enough?  Looking at just what I've got on hand, an 80mm fan I have will run steadily at about 1500RPM, and I'd assume larger ones (e.g. 120mm) could potentially go significantly lower...
>>
> 
> I have seen fans which run stable at < 400rpm.
> One of my systems right now has:
> 
> fan1:              732 RPM  (min =    0 RPM)
> fan2:                0 RPM  (min =    0 RPM)
> fan3:              586 RPM  (min =    0 RPM)
> fan4:              472 RPM  (min =    0 RPM)
> fan5:              480 RPM  (min =    0 RPM)
> 
> Those are 80mm fans. A quick check shows that various Noctua fans have a
> minimum speed of 300 rpm. So 1000 is indeed a bit high for the minimum speed.
> 

No, wait, that is the _maximum_ minimum speed. Got me there.

So, there is Noctua's NF-A4x20 PWM with a minimum rotational speed of 1,200 RPM.

If I interpret
https://www.mouser.com/datasheet/2/471/SanyoDenki_San_Ace_40LG28_E-3198440.pdf
correctly, it lists some fans with a minimum speed of 7,500 RPM.

Guenter

